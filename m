Return-Path: <linuxppc-dev+bounces-5256-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6EDA10D86
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 18:22:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXbY14V1Lz3bdS;
	Wed, 15 Jan 2025 04:22:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736875349;
	cv=fail; b=ej4EOIX/ADVQMlxbWASsxOYvoRaOYMvyYhwvVBelMhEQ06Laq2CZaFV+jWLjlWwae43BGfbSep6/r/s0H1DgUIvQTN0jRSsquxMzNQctywlU9MZC3AQyREUC1pn37Ekd39wt7XSFPB1q3rQdfk1rA6hSYrc1eHwSvIPdaSaFUij+fXK6nywgYMn+bwQXGe9RilNtOex95TnVK9mk9d+2MU1cLySjBQCPjC4ytyWUJ9rL12ofp4U3dc/rlehX7eoPxFUEyTEDIxD1HsOcfHP7z7Hbtqj/wlsI7w8OkXTxZa9/2Px9QIwtYFgEaCIsofwrxbqU/PRnwsKv3omMuCoxqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736875349; c=relaxed/relaxed;
	bh=+MDNtgjNBZVepTC3H9C7JeaFP4iRlgmSBT03oo+pp1c=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cXJrEPImyUJK4oaMudhvCBPKLxyYgrKhcCLh1f+iMdPYf5TaCO7q4QQia8w2fRv0eU/kSLd8NLmHGI5GzCmCVsJUorLPuqxA4om0gMgVjQ9Q0C/TXsqGe/pQp9qn9jv+3Rmul7vGpzBmLy5BXMPI3lnTBGqnGkcPs+YCX0eEHpzVaWCifbjm40OrmJ9uOPNTGZpuJ7tlf379srCAB7JRxurvYUNFfnHTH+gkl3Uc1EXuSMTS24EGP6A0JWpfm5GW8rJZbGotBsg4579NrB4i/hrtb2tp4XTUKEwJKOKk0Va6jdBse6xr5zkwhMHWrPCqtECvxyLz42nhaai6cs5qNQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FnBTSvCh; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FnBTSvCh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXbY019b8z3bdK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 04:22:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736875349; x=1768411349;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=55Tmtt7WV0v75h5Q4ImId8+D+r7M42EB0y1c5a4Cp7E=;
  b=FnBTSvChpA5DMmWo38bYfidCf3DY+iJXW+gIqnw3sngEI4i/9TSVOTWB
   0JG6jx3N6Aq9nV35c9dYZgOLK7OHTP+YcDn0262Iyt8OUZE2e4PXRbLlO
   4wRnWx5ZrgZDOE5x0I7f4x6q0hR7PEVDl3tW0rYehRb9USxb7xO7AE1pZ
   vNswYdWLLVG6nQny9uHAUW7/iG8w0KVR2mX+n+kwgI4XzBcbhqO1CykLF
   34kELElnMQnrq4c+TYubtkn/GGyaW0DoqUQAuTyEIYl4sShqoKu0sIs7f
   3UaDrFxEi4jGBzajAxZpaKVw7dFXQHl5cUy9G9MFtMPuTaNBPx4NDUugt
   Q==;
X-CSE-ConnectionGUID: EJJGcvE9RBCaI91fd7c2nw==
X-CSE-MsgGUID: 3wIwIxiUT5mGtKJLVAk40g==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="24786140"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="24786140"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 09:22:24 -0800
X-CSE-ConnectionGUID: ulDrRzrLTkSrE6olRx3c3A==
X-CSE-MsgGUID: 3+huWwa7QoS7SADjX0Q+9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="109836181"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Jan 2025 09:22:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 09:22:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 09:22:22 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 09:22:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q20tXiRkm+A9bhYqer+nwsEec2fsXhrBz+4TWdPDTdcA98yvvfJGJgKmjndxgC2YOObxDFUWwrkbZgmaLGb+TmZWnTJu1hK62u9ZOgiz2VpaKV1DNumLmho3WOyLorpO9LfMgjebHk6Faj7lJmIRGwfr365+AcNm29r6U479RrUtd5EGj9WmBuElM/juLwgT44ay43JvGdBVdNYOmSyz4aUxrhBMgLVk5giX+cv8O4NfzBtKc93fRx/FgFyYgh3VHwg8+vOAp7xw6DpV4XosWjZXmG/A3TPE+pTQlIoEMzlc3DhIiOV4gZ69N7iGWEy6OOybrVBR6U5fAA2vZvmWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MDNtgjNBZVepTC3H9C7JeaFP4iRlgmSBT03oo+pp1c=;
 b=pbTEDNjVqOUR1ydOPHP09U5QmbLImwGUuCkOSYI7j8QSBjmv7JHp+eZguPkrSkqD9OccTo+zh9LaOuqya/SdrotbS9uRGNtNX8e1YbIE26DNlNey/lo6YwfqKqWmMsoumE32cgWUuyc377KQro/TI9K32SpUp4GMvYMo/cU1lEGGKqQTB39ItkWV7CUd9SIeuWg2GBwdaHw3Kh+MNHLTxjbKrr7i8isoVgM6YnGd58bQQG4tEOjBTtd5WWd8EiY4l+Ub2RbCZVpbO3vs8UkPZU5XfK1y7Vw8uPdsfKZt1QreyUubXyanjEDNS1+LqN3pAZoofGMzdhemKgarS58Blg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 17:22:05 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8356.010; Tue, 14 Jan 2025
 17:22:05 +0000
Date: Tue, 14 Jan 2025 09:22:00 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: David Hildenbrand <david@redhat.com>, Alistair Popple
	<apopple@nvidia.com>, <akpm@linux-foundation.org>,
	<dan.j.williams@intel.com>, <linux-mm@kvack.org>
CC: <alison.schofield@intel.com>, <lina@asahilina.net>,
	<zhang.lyra@gmail.com>, <gerald.schaefer@linux.ibm.com>,
	<vishal.l.verma@intel.com>, <dave.jiang@intel.com>, <logang@deltatee.com>,
	<bhelgaas@google.com>, <jack@suse.cz>, <jgg@ziepe.ca>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>, <dave.hansen@linux.intel.com>, <ira.weiny@intel.com>,
	<willy@infradead.org>, <djwong@kernel.org>, <tytso@mit.edu>,
	<linmiaohe@huawei.com>, <peterx@redhat.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <nvdimm@lists.linux.dev>,
	<linux-cxl@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-ext4@vger.kernel.org>, <linux-xfs@vger.kernel.org>,
	<jhubbard@nvidia.com>, <hch@lst.de>, <david@fromorbit.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <loongarch@lists.linux.dev>
Subject: Re: [PATCH v6 16/26] huge_memory: Add vmf_insert_folio_pmd()
Message-ID: <67869d3878ee0_20fa294ae@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <02216c30a733ecc84951f9aeb1130cef7497125d.1736488799.git-series.apopple@nvidia.com>
 <31919e6c-0cec-4e3a-a0c6-a80be53d6ccc@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <31919e6c-0cec-4e3a-a0c6-a80be53d6ccc@redhat.com>
X-ClientProxiedBy: MW2PR16CA0024.namprd16.prod.outlook.com (2603:10b6:907::37)
 To PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA1PR11MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e5d487e-ff93-45b8-ce77-08dd34bff744
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WbGgDYXPANWGSmONmqU1arjDKtlFEtfdQiRjGtZAx6WshijJ6AHm7CFFT9it?=
 =?us-ascii?Q?7LupFap4U4K7EG0gViDa+zZ3pR/eWSG+mdZZarq1c+xA2qGoJypklZ5iNwt6?=
 =?us-ascii?Q?0zgrRjj5CuQwxfkzZEU4lMYfI4EIgojGPovspIdzlGVXQ368T4TRLgNN2hJB?=
 =?us-ascii?Q?doioSv8P6FrYJnSgonPtR+bIuhoxbp9blOq9UcA0Tnb71CjIC52ynaNeFUao?=
 =?us-ascii?Q?Pgs6IM5qCgS3qjgMTKRfilgWVqSdxm7XTlQx1od0LIsAQ4fbwx1iJ0n5eHsH?=
 =?us-ascii?Q?7etU1mWrPsLSnq5procZrUwXhO0cCifg6PuFSIwSFQdHGUycmNLf9lQePcRN?=
 =?us-ascii?Q?KZytPDseuGJ/ADauihKAoF/+oGJDBmFVTpIAdcF6ngc8sIAu+ETdF/Og7LNv?=
 =?us-ascii?Q?axJo9NfkIoFuI9DhEAPi6+Z69BZMuPjZobOcqZ91Sh5fO254TuXq8awc5Oej?=
 =?us-ascii?Q?inek0VNmtHERb53a70IDDibeXOMRpzYbsB+9rVMZvAe+uvHLTa0BfxjVFqui?=
 =?us-ascii?Q?J5H66NNi6JX0FwX0Pf2G9yUDmVyBDhyW3/HPjyiv+l3pbynX8LSHLLpsz4r9?=
 =?us-ascii?Q?lW2NYRvMHo50Ydbfekei+CXFILVkbVJv+hGtakVbGwezdu89T+V+X4+Turd0?=
 =?us-ascii?Q?XJrvaAIgEXBR0+wv6I192Pxwn1LEb/tvaFB23LZnz4OEZWPR1t6SWB9wHsS2?=
 =?us-ascii?Q?I+hJYwNxULZsmEgVyExXVu8Mg2yW2agQUSMluyJmiFGAi9ddKwuRaIAGOplG?=
 =?us-ascii?Q?HEjiDO+vJMjbihkZybG0kUcxEqKf9lWpBocuFvj+E0vmS/snz74MkKSw5lVM?=
 =?us-ascii?Q?SUCkm37qK/ityIZ8bD//CXcl5X5Wh/SgdnZ0/ZiJPV9QnO7+ojGyQ1SWBpU3?=
 =?us-ascii?Q?fOu4rDNEbIgezPFcvsutEkinjBeB98y6sV5Xi69R3vuU2uN6q9f0hDHwS8Pz?=
 =?us-ascii?Q?N9Bro+5OoB+XYCW2clz2/Qpc2wAFpF8N60kR2h3aHLAEmsgklxYIg2iVvRNd?=
 =?us-ascii?Q?z9ZioEqhq9XFSDd1br2RJoZ5t/bGnSNybAcJZnHTOCSawNBC0zNOp9Wsdph3?=
 =?us-ascii?Q?7WAKrdqJbdLDzEzB7U2uVlItR33l/uCd/UdF252RfXenw6s7ZU9Szt3KpiwG?=
 =?us-ascii?Q?QGfdSsLNMRu6Egnf+RpzF/IxwScybOmHodEk3T6kqZSakuH5EIF3GL4SeqBd?=
 =?us-ascii?Q?ZXOEsPIt5f6WQWz60dx6cby3WnBzmRVMUayJTdqF/+Jkrba+tsnMgkrWOoE8?=
 =?us-ascii?Q?xfR25QmJ7wnVEsUwvrIYXSHBWsrUKp6g6BLswcnpN0nBd3H2LNKa1rZJL8N6?=
 =?us-ascii?Q?37DTWlPipJZATwnFokUfk+GNj2oN8UXmKWtMdPvXB+4jh7LEmDoun0MkfXC/?=
 =?us-ascii?Q?EWLwEtIlTP68/sVPdVW+ln0L+0H3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SZjLKMWKlgUKXvcgaC9tMG8p5kfXmkyLVYFvna800zBrIofDYi5q+gJ0+ugf?=
 =?us-ascii?Q?HZr7O6FqENnE33Qi1t6r2o0GAB2YtZeDiRXYog8sF9U1soMIib1m+yRB41Wq?=
 =?us-ascii?Q?XFcwZcB5usBE7jCDHESzBDLypjBDXnhG60yWDOrBoMZSe/a7YtWar6Mjc4uh?=
 =?us-ascii?Q?vVMX9bzE7WrU1Yi1gBQztWpX7x/0ZBZPrTWEbytOronG8i5VUeABk1zIPGoK?=
 =?us-ascii?Q?49oLcPXf+93rj04qMjbp+LjdkWchNR50ucMn4l2BwiplQo6H/MYUC43g6Zr5?=
 =?us-ascii?Q?NzxYjxrpVwkJQGMOWdMQrAFvoXQfFOba4VDyvaLWxsnU7S9yAYA3y4niBuIa?=
 =?us-ascii?Q?ykbz3U8IdStPs24kjYyBh6l154y9Vd+cT1zA4LrRbRhdG7mZU/LPJJHAJpSS?=
 =?us-ascii?Q?FCk1rWYw/fEY/DcYmSVaWNzFWvSxnwxWFuERDqQ9b11AwnqELHtxhi+MEa7V?=
 =?us-ascii?Q?DV7TsG5dD87dWJhwbUwbo8GpXuMKhoiM8YhgUDJJOdTtknlIls9hq9JRkBuf?=
 =?us-ascii?Q?J7FYtBW9YOc0uB36BF8HfVm/G6F6713MxkLu8NpoIU3jwPS3s840fRC8V3+F?=
 =?us-ascii?Q?wdEiSZqlcx2/x8pQtIrIYF/cXfAJLPSx+16uDHKO4TPI+zkgC+nLXQxN9GN8?=
 =?us-ascii?Q?pUvkT5WWMAxUy8d9+cymkWPMsECjg/1Kai9SdKT3v/F4wqvj9TXZjb/qOtkl?=
 =?us-ascii?Q?hZScnyFCuqt1WltJnJGFK9tq5qGTH1KvRE6IRrjiVBUgQ2Q3rPsIitqew7Hd?=
 =?us-ascii?Q?U2MoAFbTyTd4UR9c2o1meuPMnQsVEVPuM/YkUiW+f4YCooEqKxKQmKG0TLMZ?=
 =?us-ascii?Q?m+RVEPfxX5eqaWYER5gjSC4PuVQJyQoPAAYHLx6JtMml/qcZOddJ/IbF/fqI?=
 =?us-ascii?Q?qbVx+WXx6P+Li5LBC62vxuKEZBWgsEbjhGpWgWn//xSk7eMM8ZgzsPbLrWeF?=
 =?us-ascii?Q?CSaSpq2W8MhjXSTL+oGzJW/l6OTQAL84qZuiZOJe5vXnwgwU8McQ5av1BL+V?=
 =?us-ascii?Q?d4jLL0i1EjIz8pYmPNaOVeIgRR6YzYtZedc5Sv8S2CYzLppMRDXvyeYdnznN?=
 =?us-ascii?Q?QbLTyhq2Me//GbsYbTzDP1mVG3+OyBdxB4yg5/iPdVgbfGODI5qvcJd6Kpgc?=
 =?us-ascii?Q?Y29QkDKcWTStkaTrJduvsTuqHwAHqq0aOyZWhkXH6I6ZpnKtkJyp5QlAWmse?=
 =?us-ascii?Q?lYz1KRpwmv23Vr+WXszFoNWvum4PuBSGAgmXYBIX10QBpiF8O8tnzhNoHDa5?=
 =?us-ascii?Q?5SXhhPT4bH1m2kY7COLff/FrQf88LzKjusocNXUFuUR7odMtZwLLOoRL0gb4?=
 =?us-ascii?Q?QPU4FCtfrH/8GsYtvDhwb2CgSHXADmieOJuiaRBNkYRGT7vWm1xvLRlVTjdq?=
 =?us-ascii?Q?wwAQTi3u63RStQI3JkGXnFuTEltiV3mfACKPmR6yUrd4ehsMAOUzubUcgFBn?=
 =?us-ascii?Q?zTTEvYwpWXT8WD0SFRENObTwUY1lVQW3AyP6stJMZxx7lhhia3QHLGQQeVbo?=
 =?us-ascii?Q?baYdd9TbewrXrqFE49ZDaOLr6nGdDHks91zYzubNU4mBXYKMB/GASUHXGTfh?=
 =?us-ascii?Q?yZAlaDC0VFaij3X96vtt7qS4b4wfBYvfxEj/toRFKqy3L1Luu9E3ZGaUQWt/?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5d487e-ff93-45b8-ce77-08dd34bff744
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 17:22:05.0163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JX3YB0KV4p5Lb8ftCWmM12cKh1hS1y4TJCn6dunwT8m8z4ET8MyT8tgeoJXt3bEKRfpfUlzbX43AH/ChuNwWL1bIEf/iCloIApmGOENIV7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

David Hildenbrand wrote:
> > +vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio, bool write)
> > +{
> > +	struct vm_area_struct *vma = vmf->vma;
> > +	unsigned long addr = vmf->address & PMD_MASK;
> > +	struct mm_struct *mm = vma->vm_mm;
> > +	spinlock_t *ptl;
> > +	pgtable_t pgtable = NULL;
> > +
> > +	if (addr < vma->vm_start || addr >= vma->vm_end)
> > +		return VM_FAULT_SIGBUS;
> > +
> > +	if (WARN_ON_ONCE(folio_order(folio) != PMD_ORDER))
> > +		return VM_FAULT_SIGBUS;
> > +
> > +	if (arch_needs_pgtable_deposit()) {
> > +		pgtable = pte_alloc_one(vma->vm_mm);
> > +		if (!pgtable)
> > +			return VM_FAULT_OOM;
> > +	}
> 
> This is interesting and nasty at the same time (only to make ppc64 boo3s 
> with has tables happy). But it seems to be the right thing to do.
> 
> > +
> > +	ptl = pmd_lock(mm, vmf->pmd);
> > +	if (pmd_none(*vmf->pmd)) {
> > +		folio_get(folio);
> > +		folio_add_file_rmap_pmd(folio, &folio->page, vma);
> > +		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PMD_NR);
> > +	}
> > +	insert_pfn_pmd(vma, addr, vmf->pmd, pfn_to_pfn_t(folio_pfn(folio)),
> > +		       vma->vm_page_prot, write, pgtable);
> > +	spin_unlock(ptl);
> > +	if (pgtable)
> > +		pte_free(mm, pgtable);
> 
> Ehm, are you unconditionally freeing the pgtable, even if consumed by 
> insert_pfn_pmd() ?
> 
> Note that setting pgtable to NULL in insert_pfn_pmd() when consumed will 
> not be visible here.
> 
> You'd have to pass a pointer to the ... pointer (&pgtable).
> 
> ... unless I am missing something, staring at the diff.

In fact I glazed over the fact that this has been commented on before
and assumed it was fixed:

http://lore.kernel.org/66f61ce4da80_964f2294fb@dwillia2-xfh.jf.intel.com.notmuch

So, yes, insert_pfn_pmd needs to take &pgtable to report back if the
allocation got consumed.

Good catch.

