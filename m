Return-Path: <linuxppc-dev+bounces-9160-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2773DACE82E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jun 2025 04:05:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCSSw3MVrz306l;
	Thu,  5 Jun 2025 12:05:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.18
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749089104;
	cv=fail; b=MZbYO/QF8h0faBxsY9tkcltuiUF8SClP69MXYWdmXhaANtlVvhTFONcHpyzN+uX+3VW8sMyUL9H7EaeY1QCJiQYQpH+YtAmoiuSwN2w3bNfNzgeQ0SUVsxRcflI24O2WIVx4sza/DR51WuXmuXukwK+YZvY3CrPrinNYDIE6Q8exDmcKKAPvYRjp+6TYQQ7ppREwEhjcCyiJ49/uLaUFy7T7WnJrIM2yArwyDb3+HXgYa16xbgUY4ehfIKTOPjaP6qDIv/eYDpxS6LTX2C2kav2gz4Vez32wmRyN9aKfo+3dX+8sgOv/gCfvFc/tL9XOS8sW160pOzwN2hZJcIagVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749089104; c=relaxed/relaxed;
	bh=FGHe9/g0QEHc4X9Qs5Y8VHUcW8qj8G//YEpspPjEJPo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gPNna4RG/DlghEpWtZqaTeU5CUGTKJ/jHCXNXbLMc49JwrXJDumscMfVeYIxw42xspWKGViQeora7Rk/bpMj1ZDqqaOVjV/qxxcls1LBQTVE7r6M+osHaqWCFdWI/eytXOfWInBzhPHazOesY8hC1Gc1+Ye5svWIgfWNqttvJ68+ZJ/SFwKqDjM9zREYzSlYQh90TGL8Oq6ya2m4EFwSKvJ+6/AZgTU1oqOV84fD5hxe8OA3yZg7M91LVQGnzHK2lIzk6zJ9gAhUh/dyN/OG9p+Shp4Rg/H2TRjAicHhS8bnGmOlgnx9QJdbr9CS0zbQrVirXS6h0itqIZaVvm9Pew==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xl3+CSRC; dkim-atps=neutral; spf=pass (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xl3+CSRC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCSSv3JCRz2yqn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jun 2025 12:05:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749089104; x=1780625104;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=r+5gWDOhtKzefmv+qnlVavJ3+KyWl4HcHI3khC354qM=;
  b=Xl3+CSRCm+SAgJzQhGEH57Oh+21PvSAzh8OtCyLjwrbpvW7lqHb+M0KW
   2U5HkbEbXG2xmK4rP7BQB1LKuCkptTbY2HxZLUABPza4ke3i8OFu0yo9f
   30rsVspgTXc3H/Nt4ay8Vv2Zc4ZenVbxo9d+JEtaeF+D6H9B289b4gI0A
   4DySsUEWHyTeMHd8bT+2z6t38J4a48vLNTB5g4hd1Trq/55tLF2aD8xpO
   LolIz96pOq2wBK9rFEcNw1beRbCBqD4WFuqtCXZd+O19rDUkDMWZl/vaH
   IYJdtvUXpYKF2euuwyKRDRv539HIKOliWn9k0UMnI5aO9n0mAls5bmQYM
   g==;
X-CSE-ConnectionGUID: S/Qyx4vlTHOzeMdBLxslqQ==
X-CSE-MsgGUID: oF48khFvTHeQVXeFUs4zJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51338706"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="51338706"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 19:05:01 -0700
X-CSE-ConnectionGUID: 5ygUBDzRRL+Pg4/E1YHKxg==
X-CSE-MsgGUID: j6MZxh2ERGiYfyO8f0dPOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="150513994"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 19:03:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 19:03:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 19:03:05 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.47)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 19:03:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1f9iiQFHxfPCNiFUY/LrTo4wCzJNtUlwRHv3PCBLp6Y8Sf/MQJXz6WjBUOA0siaivKmyPXfi01lr/FbmZ1HdGdJ0E8Z/tBK/BBadkdudqB7Kb0/CaS0r57uKw9KjXej209vig7BPaETpah5epV9R94czpvcRIs0XiTLNIvHNu09w9QThP3hZqMVH8ry6G+7nvQguR5dn7UNkeamVoi/L6GflsQWHgRVFGViuS7I+0ia8eeoybAA92Xp7tY+ibD8Cq63tCevIe5TKGB1y1/qmna3041NmVsAAmZECELvbeOzQ5soYFqx3iHSQXPmCT5aUQxWLlfNzTxs7+eBJfiVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGHe9/g0QEHc4X9Qs5Y8VHUcW8qj8G//YEpspPjEJPo=;
 b=d2eRADlMCZl9Blc8Ke5a9WZx2yjwilmAaUojst39CM6W6HbRyom16wDmWz6UnULeGMXWSIKPcj+QHHuxVg5scpLcP8FCCKsoMuHXY9htkzFsm/HDpsNSv5c6reVyoQff8WA+/zt/aRUbdKvjPeWGRiinnqX617+Tbsc3HV/DaSAz2H9B8bHfSwj52IzpgcDcZjgxVIb/x4Cj+qnmiIcEshapDCxmURdKzSls1NCR2otpyEbacDbEuhA6yfto/4KtaVgryJxfFXrY7QHZSoHjhV/K1SffqWvlXuE4bVvhP8TWobrwPpDz4w3/efaBLezd8wkvEvipZ2X7cVMHHFx2SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MW3PR11MB4604.namprd11.prod.outlook.com (2603:10b6:303:2f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 02:02:55 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8769.031; Thu, 5 Jun 2025
 02:02:55 +0000
Date: Wed, 4 Jun 2025 19:02:52 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, <linux-mm@kvack.org>
CC: Alistair Popple <apopple@nvidia.com>, <gerald.schaefer@linux.ibm.com>,
	<dan.j.williams@intel.com>, <jgg@ziepe.ca>, <willy@infradead.org>,
	<david@redhat.com>, <linux-kernel@vger.kernel.org>, <nvdimm@lists.linux.dev>,
	<linux-fsdevel@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
	<linux-xfs@vger.kernel.org>, <jhubbard@nvidia.com>, <hch@lst.de>,
	<zhang.lyra@gmail.com>, <debug@rivosinc.com>, <bjorn@kernel.org>,
	<balbirs@nvidia.com>, <lorenzo.stoakes@oracle.com>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-cxl@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<John@groves.net>
Subject: Re: [PATCH 05/12] mm: Remove remaining uses of PFN_DEV
Message-ID: <6840facc407be_2491100d6@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <ee89c9f307c6a508fe8495038d6c3aa7ce65553b.1748500293.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ee89c9f307c6a508fe8495038d6c3aa7ce65553b.1748500293.git-series.apopple@nvidia.com>
X-ClientProxiedBy: SJ0PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::29) To PH8PR11MB8107.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MW3PR11MB4604:EE_
X-MS-Office365-Filtering-Correlation-Id: c4752bdc-9533-48dd-c37f-08dda3d51645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0yg2MQ/DqyAsnlz4ibExKr207mzchHSIBu4qLBKL/afHfX37myd6aqBjQ9lT?=
 =?us-ascii?Q?WsVhXlNlHKhz60T1gQz3s1QJApMmt5UqjwDvsHLtanQCBtIXbQtXdI0kKFUc?=
 =?us-ascii?Q?4VAmEVj47MnmwNwEQ/gJYXU95IdreE/9Bteg11IH8E+3HgNw333v49tE4yoq?=
 =?us-ascii?Q?EvJMj/+8wfWujaG6OBYPSEJgizyetCB5IEmOGHYgyNa4xShu1L11i/FiaH7L?=
 =?us-ascii?Q?DSUJkbMClOKoSjvvLsp/EJgkl4ysh3/rnwpCCUd9hQj5m2rudwK4AGmxLAch?=
 =?us-ascii?Q?JXNNxKg7sZ6cAApQoEx3hG3PwOfKqdg1druDSZk6+cUX3twUW6q2cEyliEih?=
 =?us-ascii?Q?7rKHb9ouNqWfLBnbDUcb+RLBSGvJ9p1AK0Pg+TxfbZJpi6DnOzD4MGjVB7Wt?=
 =?us-ascii?Q?U3zP73i4hl+Qy3TMMwnRYn9QhyFkOKRzE2beEoQxPm9q2tyYX/2EA8OeYE9Y?=
 =?us-ascii?Q?VMzbFUjU8UfYGuRmju3gnXpIYfm0vuofvMMs/iKkR2PfyXXegfjcXUUlreAF?=
 =?us-ascii?Q?HISYCyYmV35VdZjWqCmQeFuWW56CiIUa6wS4ekt76poTkASozaviMVlEwddQ?=
 =?us-ascii?Q?71e1QkAdLt7glstWn8AUhOLCJtloGwO4Igy+FTXJ+WMpmReYrtV7lSU43KOH?=
 =?us-ascii?Q?593PSq6qDoEJ5kg7LEblvdIl9rcB0kO0yLy9pmFutuEtQVjfZ/HdARqdZBMV?=
 =?us-ascii?Q?TJtBcYEUmsKGvyDRwA5CNjPFyzsavbXlNJ3siJwnUzIiqDwAFgKnOOf/3hTk?=
 =?us-ascii?Q?cl3zJDAghmq2QMA47B+ibrA9D50zbj9+wfIOFb53o1JWLGRnALI1tor5VRUk?=
 =?us-ascii?Q?Z/emJVszrgKlieVM8AwuZSEp4xIDu3kEqAncmMdbQRIlwWUNak4EuKMvnFks?=
 =?us-ascii?Q?UmV3lTI6NNkd0ihBDGtymPtGhCC3ktFPDxYHbX8Mb//zIEgZtxjngQou7ahf?=
 =?us-ascii?Q?YHeddaKinhg2IrpKNPQtmxWc6i2zi/W496+AWVFRuYB69V28J443/zfJ61gY?=
 =?us-ascii?Q?fn3fGNCw6+ATjehSeXIAaq5MKKAXkA22e7ronPLvIc+vxo3amc4Sj8ruAy5V?=
 =?us-ascii?Q?O0JcGh83uxBQZdIzQ9vk1bfeqDE/UiBXzsDdTGYhJ/XwAf5yQQuz4pbcnBzo?=
 =?us-ascii?Q?AV5A+tQQj4sjIsTgMmLBXHaddmOQCYZUZiF7ZMtHlEddS/sXcsXmLlJ1xXiu?=
 =?us-ascii?Q?PIYmLW9R/yHmBj+SomBwhly2VvEKpmTZ0hixj20tkFUMFAwqT5P8EyF3Xon2?=
 =?us-ascii?Q?Si+80zVCiwaNLKX8V5QpDQiyaqhZ0yL8wp5d/3hn/43BM28vh2rBHPBtZdhq?=
 =?us-ascii?Q?GhfBsHv4gP0af5qjuYJg1lwGO7qBOxqQcQcN9mZse4bMQphjmmlVUZr9JLvy?=
 =?us-ascii?Q?aL7z+U6NSwqxE6oinzMW7c2sSYfXOefxJppu3BgacEicdPvv4nyUKuZVyZBp?=
 =?us-ascii?Q?gzCxsfgoIpw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HUvAxZnnA1C7vZGvrzLDnI3Yu+C0T5x1kHChdIKDVtJahLKgzPVarbaYBpZh?=
 =?us-ascii?Q?2qgCpdxw3LNrrmEGqCpNFVYmbWnUDT0nxEV9NeGdzuYUyunvgDNksWleZsYH?=
 =?us-ascii?Q?l8kztRYjNzhIBZkbSnrCTF7pBybp/7F2CMY0a+xC/csGbDtv0jPdW7+MCU6W?=
 =?us-ascii?Q?54FJrRLTf5Su3FIn2CFedbpDViCaXzR+MrxAZwyFTsnaGfV1rIsA86KcHC4q?=
 =?us-ascii?Q?XPBjJ++zZ3Hk8Tk06cSuxiqkIeWuQQfO+Bogq4ohKcZP/KYC7N6+/R0Fhb9k?=
 =?us-ascii?Q?8lZ+NFhqZaEpjXbPbeVfRbOf+4QJZnLp9N96hfU79Lnm6m9gDuz7N5wBOWY4?=
 =?us-ascii?Q?LEgdkCB1F2cehzR/9AUH8LXvr5JZXGPwescwM/FY/DHyWKcdYKK7w4p/Zhhj?=
 =?us-ascii?Q?YkI4mtfH9ltfaYJ4pArzS2l7FIAWA8+q24fdhMXviq89KhIpETaizjMpjyWI?=
 =?us-ascii?Q?N4E1QaVt+ZhK4wYn0siMGpyjUCT6Tc4fV51M7mgAN7qw4cNlFZz9COwAn9EV?=
 =?us-ascii?Q?owBcNCcnjWB0RFz6SE0ROIIHbXhzXyLkX75yMx+7+ug6V1XRnuiVC4KmT2Hb?=
 =?us-ascii?Q?YIHfXy1ee1qa+9kjd6rBU9g6fehy36KPbAXEBCEJCc7bfhT6D8LyDbwoVROv?=
 =?us-ascii?Q?9NIctfoKtgxCcqNsIKVsoLTXTsHxRaLAfT1vWYgt7AbB6721XhAQvF2voWWy?=
 =?us-ascii?Q?zVki3Rrry9h3XVrTfq59M3lvetiIDz2Kx16QYy/iqVzoaiKoP/2dXFcRXF3l?=
 =?us-ascii?Q?T2Ks0cABsl2Ed2GJgfHM5rVHo1/Lc21TS04DuyosQFuOUKZKJ8cFSAvSkaQA?=
 =?us-ascii?Q?IrwwkIW3Qg4PfIfcV3+ma/TgOXKCH44KM7/cIy0BdPFVYoZPgcBCd63Udizc?=
 =?us-ascii?Q?z/ZSGLH56UdFizX7cWGmo2Jms3lut2HSAThzTDcC70PNSj97V3C0QBUcsNTB?=
 =?us-ascii?Q?O/TMp2kkLqPQDqkjJ1X+krWUyZAZfgGDs7zGOCvBmad1vt5Z7jXWISpuNNjV?=
 =?us-ascii?Q?7E7+dgMNsJ37BjlLRT0wv9b2/rg1DwBjPIcq70pohfxcpWc6SijoOaUqa/FK?=
 =?us-ascii?Q?aOUiWS/UkZhELCfsTu7kCDt6AxIiHM6aQIjWEnjy1132FuqDTW2uBsLu9r/9?=
 =?us-ascii?Q?kcfaZzrZIB7dYzBSPR/HFowmJrihYa6+ubYdAeXeRlhE/nIWL8bgQzzasCTD?=
 =?us-ascii?Q?e39LfiU4igvnJz2ocpI5NKcInMg5dXE/ocg11LRQEFk6y9sCuN+oG3eiTXsP?=
 =?us-ascii?Q?qKZ2aTlSTZ05JnhvcbPGkCYuMOHyOYiAa+YsCu7js3nSEKuU9OFEmPN1Cphu?=
 =?us-ascii?Q?V4wFZRD0Rs6HW7Yb8oeEk3uQjridCeeKbvSlJq0mrvVvob3H97vKWhzDtruH?=
 =?us-ascii?Q?EgzdttgvJzm1ajs8xMJaPXGpiUPFwzrJWlYS5tmwBXSOJx+Pt2kZiVDn05cX?=
 =?us-ascii?Q?KoLPYPXQmRiQkG9pGU6Njz1dJcveDSlx7Rkkj97dDdPdWDaxlKhom4QUQLkO?=
 =?us-ascii?Q?B9I1wj7mdd5gCOo6kgeyJMNhON0iDc+gnfe1TOYWBsdpw1XzZeFcvUiT52rp?=
 =?us-ascii?Q?Wjdi2FZR83K/TZ+xPUFEw5zxRme4WwzA1Gdz+GgYw+jcgxGh8f1IdnFJpd5S?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4752bdc-9533-48dd-c37f-08dda3d51645
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 02:02:55.4938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fdZHv1tIFKHFjEqxmCBJIAZeoJ1TWDFMRGdVznEoxH66XaLY4xP73qLUpj/rmF6YvGTJUqYaK0SBUHzn5Mdmol2lkJRc7K3xTWX/O1PIzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4604
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.4 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Alistair Popple wrote:
> PFN_DEV was used by callers of dax_direct_access() to figure out if the
> returned PFN is associated with a page using pfn_t_has_page() or
> not. However all DAX PFNs now require an assoicated ZONE_DEVICE page so can
> assume a page exists.
> 
> Other users of PFN_DEV were setting it before calling
> vmf_insert_mixed(). This is unnecessary as it is no longer checked, instead
> relying on pfn_valid() to determine if there is an associated page or not.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Looks good,

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

