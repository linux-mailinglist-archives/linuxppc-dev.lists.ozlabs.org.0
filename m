Return-Path: <linuxppc-dev+bounces-9172-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7B5ACF40F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jun 2025 18:21:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCqTc4LxRz2xgp;
	Fri,  6 Jun 2025 02:21:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749140516;
	cv=fail; b=CZdRsVpaWYs6WhDbOAUBFWRPtIyXe1iENmlbz8eTApj57qSRbD5OMpup2U0YHTOex/id9HUV4BUJ8OgGW/4Fq1E59+QDxfmCgiQ1e7foetuJJ56Qm8Hbv0fjoCQCG2d7fiJ1ul/bNdjRU4wkYBCzd62z81UhyH2pHd/HCMIUU5MPUsJX2v3GmMTy9nR78Y71dQPp/VojVMTBq3VJy1Ch+rs/EprthpnL/y40bZhpZGnL3rZMk9IXPbwF6KEbm9YZZA+mXUEyGVJvyjqxcvvcNIDJHNzapAyeOM099ufX+z2ucET7+JHYYGyLjmfGC4SkmLvHerOsCkL223YOUoF+ZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749140516; c=relaxed/relaxed;
	bh=GoRz3nK3OOG9aBH5vRi8TVAoZbM9WvCRmedPJp4ROxA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gPGmwDQ/W2GZ8sCQSyw7p2BoeVxwttVU4uMer8bpYjlJY6AlNopfpYQ3Q7KmyJO0Knk7aJnivLVK87Gy/9o7jGFzG1O1TrBzQ4qr272V0apQMCkxDAzswf638sZAfHmwSd4c9x47xDobQUL6yFXeZPVdVuq9W2rtqmPRTV4/OZ5yVKV0bsMFqTfPe7OW8pgZAiVSugCq+ftTJ5bIB0b1HyrdydcEr4hOLl8E5obNHouP8zdXV3bah8zuKuruUljlm/muw3uEsbDPa2taYDovq2f+ZDlrqwRKhvc1TS1TS7vFvhfSAQAzfjz4BvGbzKvi0HfH3A55YcAtau/kroF7ZA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M2w1qBZK; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M2w1qBZK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCqTZ2QMDz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Jun 2025 02:21:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749140515; x=1780676515;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Mo6gYCsg6PbFbaJzqsp02+Il/XmKTHyHLfWMKyussZI=;
  b=M2w1qBZKSA8do70qglwH40bA72+Hs2GusCfszrzDe+QmCwpj0vz7VNgK
   OIMNorpAr13w6iCwBy0c2j4h9Xvv8IG/vr+5w2UjDIvW1oPXeevNtKFrB
   2iXpozH1i8BmTmuOO9wEgeUrQfWut4CxS28Yy8NSIW5ghVLSZZH76hJOW
   +mzk0JqLTRK1md3bUtXUJYQ71D/Sh/JPhb73HKs2Ps7GcBjpQ2fMDnp1L
   FipXXaKgFzKnziMcoyhSgzRVb/T9idhSHmS9CSsZ8licLcVeuWXL1i4oJ
   5VLKpZ+/VhFnX/6d/BE8+y2To0kX48cnp9ujDPHl6TAWtyK1uI+YoVXi9
   A==;
X-CSE-ConnectionGUID: xO9tneAxQLC9icna5G9XbA==
X-CSE-MsgGUID: gOuNVuyZQnyV7avBNuGa1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51365493"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="51365493"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 09:21:50 -0700
X-CSE-ConnectionGUID: w7MUDIoNS7+m7TGMIP45yA==
X-CSE-MsgGUID: EGehxEZ5TXCtMScxR8cC0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="146054511"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 09:21:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 09:21:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 09:21:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.87) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 09:21:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkI130YhGFsN8OXCfFSKQ79+t5EfcWWgUs4MzL+SGIvqkLxsn8grW//o4CpnCyiNcTfe1Tn372ULMQ5x8XvPse15ogZG1z3cRLWhyyVsByrV5Bz4Shs39HbdLrjYWu0THZQZh6hkeQAxndcC0+QZfB0mJ4nbZPZovmBCcKaHoGNzJgqVvSi/zKQdogLPFXewSBfNsoCB9gkGhUA53zbvANZ5oSjFd92OPhU4oP+ZP9/Z1v+luEd6fXA1dNCZzZeGC3P95GLBZrN46oXE8Kv2EIp5dJdnTqR2na0hnP3yKSubVSbgnznYFudOflhwA9IQ9fpMaDQ0xkTle3BzQNN+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoRz3nK3OOG9aBH5vRi8TVAoZbM9WvCRmedPJp4ROxA=;
 b=ddE+yxBqBvyKQK1GTXb0JAROgKfwSwne9RsOADswPqC0FYfk9K/lrri2uvMDAPFyKI5kXz/KVZMpowOwkb3undWX+1SPLO3nVJ5EJh2vZNAIeY+3MS1LeljQpCyu3LzT76G3u7pRjzm9ARjiv6rwu4/Cbz1afmTBt/CvwcyuddpkVHCGVxW4te4WemuizZVdCx/wfgOw2JrZX+RNFFZ6+d88t5lfkPSairXG1NvP+/rrQu8JxYEVwKXbtD54sy3T5/3yUA6TwoX3huDYtpuFvVL3d3W2lQRDFsNQlaUuI1aqU1jnP1rPQG2B56pOXaBCdPDuT07VJE6F3+jOT5VeXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SJ1PR11MB6130.namprd11.prod.outlook.com (2603:10b6:a03:45f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 16:21:33 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%6]) with mapi id 15.20.8813.021; Thu, 5 Jun 2025
 16:21:33 +0000
Date: Thu, 5 Jun 2025 09:21:28 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: David Hildenbrand <david@redhat.com>, Christoph Hellwig <hch@lst.de>, "Dan
 Williams" <dan.j.williams@intel.com>
CC: Alistair Popple <apopple@nvidia.com>, <linux-mm@kvack.org>,
	<gerald.schaefer@linux.ibm.com>, <jgg@ziepe.ca>, <willy@infradead.org>,
	<linux-kernel@vger.kernel.org>, <nvdimm@lists.linux.dev>,
	<linux-fsdevel@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
	<linux-xfs@vger.kernel.org>, <jhubbard@nvidia.com>, <zhang.lyra@gmail.com>,
	<debug@rivosinc.com>, <bjorn@kernel.org>, <balbirs@nvidia.com>,
	<lorenzo.stoakes@oracle.com>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-cxl@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <John@groves.net>
Subject: Re: [PATCH 03/12] mm/pagewalk: Skip dax pages in pagewalk
Message-ID: <6841c408e85d3_249110075@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
 <6840f9ed3785a_249110084@dwillia2-xfh.jf.intel.com.notmuch>
 <20250605074637.GA7727@lst.de>
 <b064c820-1735-47db-96e3-6f2b00300c67@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b064c820-1735-47db-96e3-6f2b00300c67@redhat.com>
X-ClientProxiedBy: BY3PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:254::21) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SJ1PR11MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: baf00b6c-75e6-4203-3a06-08dda44d0913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?krIsw8gi15b9919h06oFrgf/3R24lRZejDwlFZNnuyFrg3hznVVlhR/yp3+b?=
 =?us-ascii?Q?ktTRV1pveONrzAea/6Gvz4FFkQnbuLJLE/Q/gtw4f8/TUPA/jpKusmMwIdf9?=
 =?us-ascii?Q?CMpWq7EUJ7aD5ZVCr6v0Y1h8sRMzoS5KUn1jcLjR5ipkqD5yk1amWiCxdk4t?=
 =?us-ascii?Q?mU1H4Bo/PJCrepCePi1Mj71vje3kYzW4oTtvn4Nwrf3O72l7nsK+zkUKTGly?=
 =?us-ascii?Q?RutkAiron6GIbKyj4lCemHttMRsy9Xo9yg1AuibOsXY9dOPl/SnEI7OlwIBu?=
 =?us-ascii?Q?DiWVtUO92yNAopg8oLFn7qlYOJ0wA+YMv5Oy4lyvPzIoaODnHZ0yEKx0KPxG?=
 =?us-ascii?Q?Z0wlP+9XqO8lyZkJ58SdzMCCT0hd+mK5Tj/leNdFK51PL0qzHoNAomDVs20v?=
 =?us-ascii?Q?eHUq3Ucg1vsbjDW3WHN21pBXdlW32P52KnO0EhfXDaCrx6CfuM7rhCs+g8jq?=
 =?us-ascii?Q?6gbyTHk7BXoEpUqZ+GoIS+89vcJuUdecm5la8QENE7JIRPkMDIp/OLQ9/0so?=
 =?us-ascii?Q?MEkhsr/nMYgju07lWTFmNWKFARPOvOkYCDAwg1+EHtCyR6gZ5WhtIR2h0pQ8?=
 =?us-ascii?Q?21UddYE/7JWyqQV3QptUSBS7jrheNPUPYGp6phSMhP995ussQslc+/tOYyrB?=
 =?us-ascii?Q?6e3MrjOF3X9OchBz0SKuJ7whxy/5eMvVd3hQQ3PI3yqWRdCUtGXUIkGUpcT8?=
 =?us-ascii?Q?EmV1w1OsYyZ0fxM7c76MIOzoXKiahAuOmFmL6viaVz0eVypCtXJGObVFjfx5?=
 =?us-ascii?Q?gHDedPvZCG1W8jWB+vec+++G3It2Gy1UhlLd0jx9AK8qAJ7wFA1HscFAVgqW?=
 =?us-ascii?Q?Xlp8CdSEswY9guSpYiv/F1WSrzLbdFNdaXlO7TTp34EWURyRE8VLlz+DfnUa?=
 =?us-ascii?Q?ogN9allB3FWPGk7OULPPctBBRKjBjjoDSxByAxi3ilg0Z2dJk/Rbyl1heRQ0?=
 =?us-ascii?Q?nsU7VhY6/RPgC/st5e5S0GlefnXKTJxXdH+p2y/mxlsjUY2gcQQbgUBlyX/Y?=
 =?us-ascii?Q?yqBidCeTT+IYPd6vbyD70B6ZdUJuq354AEnIXMdxVh4xFItMfWnNGOr6y3s0?=
 =?us-ascii?Q?AARGETKUovchGG7BCXLIHK91Uefkzr8YsAsuisT7jhEFXU0jHmZxKTIDmXKB?=
 =?us-ascii?Q?3L376jtSbAibLo8YcXQ4SlSV7BBj7Up+tbJBPEHc8B8ksZ1OayuvwzLPqfwF?=
 =?us-ascii?Q?98taxmDv4uoq9BY2QQmvLfGC5bnku73RhYYWb5i6R4R+vDS8wewB8pOZ4chT?=
 =?us-ascii?Q?4Lsb8GtfMDqMLfalfiaQve2MruEHMlTq7hBhFwz18HrWkSP3HIKhn753MU6R?=
 =?us-ascii?Q?8BkCqVWmPAwsE0Upmn92qLI3qXEXyUJ5yRxg5Cxy8yRKLpr6ksSD/edcfUKm?=
 =?us-ascii?Q?PbTNJqrzxepzb7HyBSeMFynX84XVq0OgriIDGVPqjz15hn89PEitGue8+vg5?=
 =?us-ascii?Q?Pn29BcEECrg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T4RThw2fA4HYus9JfB7RA7aJcQ7qJaiWByOycySuFptsoqhkFAWx5jyYVAhh?=
 =?us-ascii?Q?29pBOiio+gzcTOB+PfphbgzFvTZoYVwxUK6IStSWfDcWUEbpdjsSCgvInKp+?=
 =?us-ascii?Q?gNiW7eWfEAEH0ZHpBTa52RPkQGWJqiZkTjok8I4Cy6RTk5+jozwuvj/AmTjb?=
 =?us-ascii?Q?OuTneKS0gsaboYf0DB4m0LbLUiC2EYE+XZe3jjBvQt7yZ5G/gFPuEEfYrDaa?=
 =?us-ascii?Q?6UNJzWnghZg+1+d2qXoJEKX3i93EkKf5CCUnGwbfyC0LCzvatSRL5loHHT3n?=
 =?us-ascii?Q?EoVFYUudsDdE3l8eNg8s9I30jTXe5DUXIgQr5kpuSUOYy1jCSwf/F6BwlI+A?=
 =?us-ascii?Q?UBwIhu6Zao/7OVPXS9/1RQl8MqVhclOpbEKH6jST86sdGMypJLtav/7yj/7p?=
 =?us-ascii?Q?g07fbdNhiKLP3cXJ0V1JI0K7S7f+F10KzOBgNa6Mno3N3LsjO5kmNN15HokD?=
 =?us-ascii?Q?UPVXd8gTemJTLiGXZUjLQFoIY6fQKTMma4P9haSJF3AeAeHaHscJ9TH0dx6A?=
 =?us-ascii?Q?FVQvmP9YxA/LDhuZSWNHhRcafJb2POEuVnl7/i6ptbT4lKDgu5H9M7Pvgml5?=
 =?us-ascii?Q?1q0AOAXu9aUtrh9/vfsCf6uyIhFH7dzDlGu7ISs9+4HUu2v8aftRpmT+jMR+?=
 =?us-ascii?Q?6UEu4ZDYDFlSOE82ra2s4zq1E6yV8eYi5B28z1kxgSzyVK6gPUpYnYfpT71d?=
 =?us-ascii?Q?kMNlu4l7a6PPbw2FAeHSTKVo1mD64nmZPPs4nWLYqj7YdtjoASid4F6L5eNs?=
 =?us-ascii?Q?EjeihHmfVKBp4FqZRVRNh2eGMCkz+1d5tRhMmCxBicc3gIImugbLM5vApT6w?=
 =?us-ascii?Q?SPkwBdxcUL59ofafO555x/CQkqpunwmVHRbgucPeMuF7t//tQh7gWrIA9xCe?=
 =?us-ascii?Q?k/IhzPcSR74Ug4QHhOOD8Q2DhvkFGCWxI9cco0u5xmlMbqGanPU8NOpMVTvn?=
 =?us-ascii?Q?6rpm3Ca5g55eYUOvtXw8onq9e0sMa0o9MZN+WZeaJ+qn7OzzLX629SS/goSC?=
 =?us-ascii?Q?ROEuP53MpZJubfeNTSvonFB+FIt7GKUNPGHRmL0NI6rcESgvez70q/kt38Iq?=
 =?us-ascii?Q?Q8/5sBhCSEl9Zkuhb0sWlql71BFnHz+pKHL5W4oNezwLA9qi6vxg/6Fu/f4V?=
 =?us-ascii?Q?6BBN6cBzWW9NLFieEHGjG0Ftiu6vFCi9RYffdwe/V4SdZM4vZVjvgJ8FqUza?=
 =?us-ascii?Q?Ew8B//S07FDQ7RsD1I9ULMxfJmQbafjnOraqs+CToLaIh7EUCN3ejc2PI5xv?=
 =?us-ascii?Q?xGds0l3Divu5y+kkofrdZSriSles+8HDUxFkLnttt/hWPDn1BMQMC63cbU+j?=
 =?us-ascii?Q?Rz/hsRj6y8FwDQVNUG3CiHFC2T+Yx8yhraX6cMIvyctkpi15C0GU7iGInWpZ?=
 =?us-ascii?Q?wZ2NaP9w1IwPvkSuuj17QVNO7qpgrJ1BEF9Np6uubNpY0bSnLsXcg8cF9onM?=
 =?us-ascii?Q?ddEh4UpaUzeK8h8Uu9aJ/g2ZP2fqJg4vAquLjLd9whGDn1DzHGq0t7NuXgk7?=
 =?us-ascii?Q?WuVS5KUK+ubsAAXnZRxHWyTtxRAhj24v0IkiBr2jvLx9ZRkE7gxp/UmTb40T?=
 =?us-ascii?Q?yJI+/IsAspWVxvNI2gYHp+u++BiIg20c/gi/3DoyEggn5KSnhM3CLeQR4VaN?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: baf00b6c-75e6-4203-3a06-08dda44d0913
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 16:21:32.9680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EqeLNGTcArPNKsa5xcMv17a3Aw27H8NRJr9PtHbcPp0QnRiOHezw7uBEKZuprGpj16ekyHPOin8hfLGPQlYh0FcVLx+/jvt2g/pPF2Z37Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6130
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.4 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

David Hildenbrand wrote:
> On 05.06.25 09:46, Christoph Hellwig wrote:
> > On Wed, Jun 04, 2025 at 06:59:09PM -0700, Dan Williams wrote:
> >> +/* return normal pages backed by the page allocator */
> >> +static inline struct page *vm_normal_gfp_pmd(struct vm_area_struct *vma,
> >> +					     unsigned long addr, pmd_t pmd)
> >> +{
> >> +	struct page *page = vm_normal_page_pmd(vma, addr, pmd);
> >> +
> >> +	if (!is_devdax_page(page) && !is_fsdax_page(page))
> >> +		return page;
> >> +	return NULL;
> > 
> > If you go for this make it more straight forward by having the
> > normal path in the main flow:
> > 
> > 	if (is_devdax_page(page) || is_fsdax_page(page))
> > 		return NULL;
> > 	return page;
> 
> +1
> 
> But I'd defer introducing that for now if avoidable. I find the naming 
> rather ... suboptimal :)

Agree, that was a "for lack of a better term" suggestion, but the
suggestion is indeed lacking.

