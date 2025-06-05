Return-Path: <linuxppc-dev+bounces-9162-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AE8ACE858
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jun 2025 04:36:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCT8n1vfxz2yRn;
	Thu,  5 Jun 2025 12:36:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.9
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749090969;
	cv=fail; b=jEmHbRD9vNu4xVfDvrH+k91Lo5pbGM5Cyalgos4+wwo1/loi1CAu1cvqHelGxXxr+0aHmn35zKRWugt5WAXITUsq3vDiXj43Ac7vg+DRm77AWDZllytvBDsUPSaYfyCvla+taCUkp3w/mGhbQyu5/rxCKHn+rj6Zy263Xt9N1UCUXGFA8eaRaYZr1iCVosY8UDLh4x71FIc7N3lCzk4pr3ppy/CJOcV9VRmnKIW+eatSnp47oBEc6rnQebSVbFuq889Fts+TgTqWZsEoJoYKekUxx4y/IjlguUkdRq5fAcKMKgDcnbH/iQZQJE5syEwrosdVafWRqcfYnV45SMgNWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749090969; c=relaxed/relaxed;
	bh=W/8LeyHIJip3c9QfjyQbnsMzQ8FGEO0vwFFsYf+VeqE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iWwTpeNZdM32KrSKWnPO54BtVGV0SG2VKCQCF3vB+w11ykcPlkZgCKqSfhU8ho+/r9fIu7oYG5D0r/QN2IVDcqCfBbN/6YscFkZMyTRS+AM7WzQbSix9OXG3XOQPSXmquzFB0TBx4E+j0LXBWLYXAMLT+YDjmy8zwsRikoZeI/H4sLaVzXOsoqSDDXlsuSuBg6jBzf6ZYBbekEMsY/xokBVSiIf8nw8Sm9LEwMQ6XmL9YU7r1bpaYbnYEoUaBJVkk3qcHmb75VbjslXeySjtbsT7SmitgstwS22oin+LCLZbbqoZ4f4tGmuTKXITMxhHZgL30lbLr/8/yXH4O/oR5A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D5yuLK3l; dkim-atps=neutral; spf=pass (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D5yuLK3l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCT8j24ZWz2yRD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jun 2025 12:36:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749090965; x=1780626965;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=y4pfXhnoi8acfJt7k3+rZbLuRW7I87OEtcDJIK/FMHc=;
  b=D5yuLK3lAqwlhjhzZ7Lh0QOe8xGCWEg7N3EfuyIwtpI9XotYy6Dgf3ob
   TILgXae7EKIrvs1Rs4PzxT9AVdoHc6vfDg8oQGI08IanD4GP8JrJClJG/
   9/7ca0hb85H96NcWM2mAjRA2rmndFLj6KG1kLG0uD7rG4nuBWsBsDpREp
   gWDmELdNpf+RnqMZ3uyoMAfB5JNutVBZLcuUonRx7aHmZLgtVzOSfxDKv
   P1bJBzqci/42NrNTWnlf7vgViYcEWJfDDlTdh+KgBfzY1ZDqy0nDAXI0M
   Vq/MQgfVhfDWV78i54LzoFlxn4ovnDIXsEZAd+Lxuc8dqB8anOqBz2lZy
   g==;
X-CSE-ConnectionGUID: K/kyir5gSNuDWchPPAC79g==
X-CSE-MsgGUID: hY1k60+4SP6BOk5+ZBC1JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61862831"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="61862831"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 19:36:00 -0700
X-CSE-ConnectionGUID: P1bJvfaASVuQ02EodJTOjQ==
X-CSE-MsgGUID: MaamXwkSRT6ywKNC7aVmlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="176244409"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 19:35:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 19:35:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 19:35:58 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.56) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 19:35:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nebm8mkotqwegNi7GZmwy/mxyDRfZzDAWRf7Ez+9f4fnQw6q11zSFhBpc677BmTBowI7VfbVAQFHci8BHtuSFXjH8ajFHZH61MNpqohPlZhHQpXf1s0X7HInun5RZr7ywMypBWfu6PxJeOJAzHpHWsaIGD8M03foCs+LZ8PxlT/MhHOX9O/cK2p0KbUbWUh2hwfoBqN4jOXIw+D8nE8/VGRSubVHD2gsAWLeWq5n8Ej/QENisG/WAiYpd9TPLYzLc39ufF9sUwDTjJPsjMVrqSXcxEKER+cblYBFBlujkhaoSaiQEgYSehBWVtj1zN72UH4/E5eTiToV7I68bqkNRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/8LeyHIJip3c9QfjyQbnsMzQ8FGEO0vwFFsYf+VeqE=;
 b=FsC+CRFypFJV1HPGao/EH0a+5GFS4JG42ArHV5TxBHLL7LrbJUD9XNGVUxR5oDVqumHJ1xrlvqLB8Nf9sjt1ruq9PNf+R7wDiVR8ykXN+uiRnzY08hZ3eAuWl+WD6qVfrdstAvBPSDuT52rO75O7pNyP2Oi+NPYyPegyl5Lb7knkO8CRb0z76LvHhu7Xycif6cxMWD7qpsFTx4IE56exg54QQErewQGiXD8KkOzx3GC2lxLuz5ossKV80vtd/hTVbCJGw2IKL8gzsbFJu7lY4pRh5nKMwjJTfeZ2V2DOyB7bpkiEickbFfyEAsiOHFbdElkt2UHKI1bLVCTA2DKGNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA1PR11MB8812.namprd11.prod.outlook.com (2603:10b6:806:469::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 02:35:28 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8769.031; Thu, 5 Jun 2025
 02:35:28 +0000
Date: Wed, 4 Jun 2025 19:35:24 -0700
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
Subject: Re: [PATCH 07/12] mm: Remove redundant pXd_devmap calls
Message-ID: <6841026c50e57_249110022@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
X-ClientProxiedBy: SJ0PR05CA0207.namprd05.prod.outlook.com
 (2603:10b6:a03:330::32) To PH8PR11MB8107.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA1PR11MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0ec57e-a88b-4831-6d0b-08dda3d9a223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?faEOSIXfQH321nW40DBxNHYOBW8qe3jmgCrN0V4JVCwN8QybwnCD/AyNxyYi?=
 =?us-ascii?Q?6+rKPyRCdcDJrSwjg/NTFfq3D4v3mU6jalolQvP+VfmDufPs+Nyi9xnm2q3A?=
 =?us-ascii?Q?HwZcZzWG05GjbkLLhmX1NOH1jvxFkavSW+M9JOjRdER9CmHXgEyTFjn6FBYK?=
 =?us-ascii?Q?RP43TxqlouEWFmvPb+XuugvLOtUC5YzEfHGAbUFJLR+RpA/diV7NG/LdxVHm?=
 =?us-ascii?Q?Mx7R/Pk771bz7/h1xdTRJZODkhpDi6KzjoaqnjUecv73DAsp/eGISzxYN5mG?=
 =?us-ascii?Q?ZNXMf2pMZ7ex1XOG8fXcB/VHsTtfHb9hgV7eDPsG12841HYL8zqiNsqihc2g?=
 =?us-ascii?Q?OEapfwwNh6iW86Z9YbRwYwtOblA+Nb8TtYQ4jK5C4V6BL9cJDXCtTaD5h9NB?=
 =?us-ascii?Q?lLIwxOuNjs+/oLNnSMpfNNZ08zIzlJuTHgJX3JyAi/ePnfZWc1VrXK5hmrXP?=
 =?us-ascii?Q?0uCecIVo4K7Ue+X4lVbVlAC/rGJ+UylIR4u6sjS98T7qqQk2D9K+XhOUaq7s?=
 =?us-ascii?Q?AdGSb+I9si874tHNcWDeCjQ0lMGivLal4dkh6RPMCafGtO/UWr4xyEjfsF8j?=
 =?us-ascii?Q?RdfVmEHnkEPr0iHNZ24OI4NdOTD67ZeBOtlLxRAhbwtj+cKOpWBsSTXJ9xNH?=
 =?us-ascii?Q?UXlz7yse50ku9OdMiXG58hZ1bAVWkqXgtvv7t3DtD1HAIl0LWy0ul08/ziva?=
 =?us-ascii?Q?wDdYonsz+xStnoXC0K/4ZSaE9VOtsONPEZHiJxP/jGXxvE2kf02FCX0xatcZ?=
 =?us-ascii?Q?bKc4kyVj2BWCF/EuHKJa8dEgLgck1H7B8pUufWqntDdmdWtLyoSezIBwuE5P?=
 =?us-ascii?Q?OOqWt3DrluFgLX06Ry+XUeSWFLlnWbREzshV4xAWjsFn4eoQaOXD0lcKw4jT?=
 =?us-ascii?Q?vmqT/eCIHUQH92cFJR6ElJwTEThLxuX60z8JhtizkITiwJ/yF0gnG0/qqAWP?=
 =?us-ascii?Q?dmlSNu0nDA8MneSZInAQYwQf+QEDB1/jz9SFkpsysidqoRQnwTOdkJPl9k7f?=
 =?us-ascii?Q?lWPg6WYUoIHAVOf88yt1vTLG5QZKVz8Y1h5g+dym8n6DdexGrVO0U26CJQrX?=
 =?us-ascii?Q?rOcoQGPOwQNxiZZXnmj94LqDrnA+TISRa/5BEqdtS6184pe7OywG1ETQGxSS?=
 =?us-ascii?Q?VzI79khKOS0sC/sakt30Y0BKMHOSpb2LSPOEnWQCLRo3FbIZvz1BIhvbmPSL?=
 =?us-ascii?Q?riCOt2c6UpjufgVAk45X4rykxSI1z3xa2YoliuHw/dxq5SR78v5t8HNCILZt?=
 =?us-ascii?Q?EyQf6uAa81m9v7jJynOLA9I5xXUMtIm54nQvny47sbvLci7BDeFSNoE8MCA6?=
 =?us-ascii?Q?CjIwQgBiOfN/aXse4fmQZDkjFrS8EQALpdUWwF49MPgZu+WQ/QQBIkWDWOch?=
 =?us-ascii?Q?fCJpHnHkDXaTsIS4pgkdrZOR6VyT60ONkmGIm0FUZ2PNTem5Wn9Xq8N6iWdR?=
 =?us-ascii?Q?RJcn7YFlggU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CFvbqubFgwXNp1uGzL54VcE4oBy6ivb9d1DaYtL5WS65eXGfJEGPOsccxVI1?=
 =?us-ascii?Q?Vd763DoK1FhBxu5Jlb0C/R90tVh14JVNWesgr+AY4gig6PnX05lA5PvRyrnv?=
 =?us-ascii?Q?F7qVZgGd9jMadX1+vTl6GO2X8u4DYoTMlPdPRuJ+d0Kv1SKAvmHPiGUjdrzn?=
 =?us-ascii?Q?zkpv2ixi5SL4i85OALDo1ISUZtOsFpVVvDfCIucxJJ4Wcj+JPy0EcT0/emgh?=
 =?us-ascii?Q?QEIcR3SVMtPvuLbldPXUcLq6ItjySg935AiOoBwGqdBShtkLQ/R1a/E/cAR4?=
 =?us-ascii?Q?3ReV63buguyo2frv6M/crQVjXLSaOmNYLeNj1i3T9KL2ayp5SLrFZ22DcYPN?=
 =?us-ascii?Q?KPER4+UdnzJFhN2p/aFwDgPIl09TW3eUSYSC/niWdKmGo/SdFIC15UpynQ6A?=
 =?us-ascii?Q?yATVujzZTz0AT61iWbtFLrd2IiWYT5q4rRbXKGcV0HbI8jRP3WMx4S+Y0VqF?=
 =?us-ascii?Q?0TAuWPlobMQHX8wiJsOd46jd4ZnCl3TEz0uQ8+5MMfZrzUILz2BxvAZReW3C?=
 =?us-ascii?Q?sE4uECq5VaguwX6UUW+fg5s9rhR32+BihZj6BMXNydjFCR7vNXP/twflC9ko?=
 =?us-ascii?Q?TtNXs6cFxMo7qY2MJgiWZnxALeJAvVizPGiL+DL0pelG2mNy6851tmdYFjVH?=
 =?us-ascii?Q?/FnYqm4oWfHWABZISOrgD2a9iCpiH7GnoGyZJf7USJombVnd2yyoGK+L1PXT?=
 =?us-ascii?Q?dYfarCuvsK0WB0o8tfld1y0gjX+xvk9Y0H02Wx9eD3bqLJuBbqOD+1WLN9oD?=
 =?us-ascii?Q?ips1MFJEYqsHMczptpi4kq6Kn89XyX04ar1ruHBCduBdlE5+ZhSigS+m3bKD?=
 =?us-ascii?Q?8HfOCeJkru68haQLNBfUTUJuDRKL728ZUs1uPb7DeIKzmmVEF0qEpfup5VRu?=
 =?us-ascii?Q?vKxviqF2o+bmNWi+wfFEgnVkICkqxphfMZ+hmOgMnT/yXM2MqNJx/7fG8NnS?=
 =?us-ascii?Q?SLW/QZ/JVQU/7s0tuzqzeMsf9qCd+iRClqH7uvcotbtsxG4XbFoYm9DxBw8M?=
 =?us-ascii?Q?g3nzUHfNUGSf49FHaDUowZgleXvHUTj+yKw3uwOnCzdNBuJeQ8tnWsa9ZxEQ?=
 =?us-ascii?Q?x1tLNHVy3g30GsYwQobXwwNcW6LQUFzOqwSsbfsQXSGZ1yetl7h3In4vRwSS?=
 =?us-ascii?Q?fZvdAJzf9OfO95W1N0FIOJjFtgXQw0nW+ajqZRBmvacJJMgjfMYimluRlE9Z?=
 =?us-ascii?Q?nut3+ndwIspH5/NtK1BUb6/XcDOaqWFDYdZmSib3Wc5yB9ec048QMwb1XTiL?=
 =?us-ascii?Q?og7nGtSQvg80HTHCZyLvT+tBmpM6zFgUQuSAUoPx3Y7fyC0TnIxuGAeHjQS3?=
 =?us-ascii?Q?SVx+Ytp/2g1FzTuFk+CRdi5ko4kg28GisPgfMnbpNPk+qVCObMaT5pX9tBqm?=
 =?us-ascii?Q?atDcqGpWZGUDnI96bLRYvVjBoPY3D98lwpN5umqyXEj0xCc1tiGrxxJtLjGd?=
 =?us-ascii?Q?utbBwmN4Su78TSG1IPwsE1q2Wt+buSg6YGrKcqS9J2kkFQn1BbmHk6nZKtbQ?=
 =?us-ascii?Q?/HrGBd024vM5WyKqA2EHuoLirsKJjF5x1isZKy5N41DjTdyCeRZ2HZyw/5VI?=
 =?us-ascii?Q?0BCbBtJajRB3cXPAKrfz2WV4kNckt3gdvvsWzZWGVL2BuE5ZoSx7MUA2huoi?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0ec57e-a88b-4831-6d0b-08dda3d9a223
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 02:35:28.2607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ep7ee8mgjyDxRw7/Yu5zDKd7wXDhXY8c0zfm60xdeyLJcZsngnM+XithUikoR2GZx0pHrTNjFGTSzbnSbtfH169rqpEBirwE3MRpZ9gu9v4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8812
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.4 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Alistair Popple wrote:
> DAX was the only thing that created pmd_devmap and pud_devmap entries
> however it no longer does as DAX pages are now refcounted normally and
> pXd_trans_huge() returns true for those. Therefore checking both pXd_devmap
> and pXd_trans_huge() is redundant and the former can be removed without
> changing behaviour as it will always be false.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
[..]
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 8d9d706..31b4110 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1398,10 +1398,7 @@ static int insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
>  	}
>  
>  	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
> -	if (pfn_t_devmap(pfn))
> -		entry = pmd_mkdevmap(entry);
> -	else
> -		entry = pmd_mkspecial(entry);
> +	entry = pmd_mkspecial(entry);
>  	if (write) {
>  		entry = pmd_mkyoung(pmd_mkdirty(entry));
>  		entry = maybe_pmd_mkwrite(entry, vma);
> @@ -1535,10 +1530,7 @@ static void insert_pfn_pud(struct vm_area_struct *vma, unsigned long addr,
>  	}
>  
>  	entry = pud_mkhuge(pfn_t_pud(pfn, prot));
> -	if (pfn_t_devmap(pfn))
> -		entry = pud_mkdevmap(entry);
> -	else
> -		entry = pud_mkspecial(entry);
> +	entry = pud_mkspecial(entry);

Wait, why are my gup tests passing?

If all dax pages are special, then vm_normal_page() should never find
them and gup should fail.

...oh, but vm_normal_page_p[mu]d() is not used in the gup path, and
'special' is not set in the pte path.

Yuck, that feels subtle.

I think for any p[mu]d where p[mu]d_page() is ok to use should never set
'special', right?

