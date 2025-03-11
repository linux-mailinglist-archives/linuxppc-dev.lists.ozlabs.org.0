Return-Path: <linuxppc-dev+bounces-6892-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84656A5C087
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 13:18:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBt885dQ5z3bqq;
	Tue, 11 Mar 2025 23:18:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.15
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741695496;
	cv=fail; b=RdkPgwuYWG+aFs4raIiYM6Ocm1SPclhgYWSY/AkYby7D0VXAUkd5umctjsd/fEyxCpOi8oNk0Lh0wQt0U8pak5QxzK+Ip2G93ja54x7YFQ971gQFJl9qc26xnTlrCNj+StEbNQRGeoWa5fbUkAko2E9E96JdFBX6mSYrNQN+f/naeAVhsNU9Pn9rs7zE3NDajH5EsSAfUw+cribzk1YVexVY3Eopfd0tIW2/j40ZBWN6nnEZU2o23gZXhkgzMOU7gt5p9f9s1QNb8Kxx30vN4Df/sk2O6hIWyzNHyMKKoIaF72SjKZ3vdgNmDtttSybuL260ROX/TFAQgzz+/PQOTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741695496; c=relaxed/relaxed;
	bh=0Dae2bY4oaA3zgqs2N1P+eZwRHZx2wPAajp8aBUiicI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kxHpJi69hfAhbO5ivkmbUHLS+EO/KU31Gb8OGVUprUOzsnYl0OK53+YJxguPmhiWaLftf4bV9CXN6p0L8975bj1o7JxvOJpvYBV9N5pwklr/MEmZaWoEXNYE4fZoZMr2rvwOJcy7Z3v3WuQ1Xy4wKQht7759waqdRRwpRt7BFLqBaYsuAtURbfcdJSXJ7Dimb3fjfVxX2stiuSYMz2mqyMny7hx1SEiZSdf4CZqAZf2eKPOfBPVEKi+k0djSQLxRpASYCf7AYhX2L1hdhiyZOBBSLNb+a7KGWaKfvyoY4L95QafGU9NGk2fOY7MR3+Wd+qfcg6ny60IdaDsjxJJr0Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NyxYzjQ/; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=michal.kubiak@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NyxYzjQ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=michal.kubiak@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBt8566dHz3bpx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 23:18:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741695494; x=1773231494;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FEgglBWoKdlK04Hbg28MP1EVOG3Qt0zLS1r4HqCwnjo=;
  b=NyxYzjQ//9zEjLS8qulD1jJH6E5SUQk+X+dAwQYMn5r2+xCtQMRfDoUm
   BcfcwKHYHQ2Ri+ArvSbNhI5Ubmp0Yxhci2smMZ8AU0cTAAa0zxMarVmfZ
   DnhOdYTB3nA0w7Pxy/Oo1tNxBIdAiyMlEHPtfdCFPIdBVWj4A4xomtHbx
   a462/igMMG8LOdDvp5hIkEqT7BiIzbZ6cJ80zXTkOw7QRpWqYCNpJ/Hl1
   ufXeHL11/qXIRIzWlfAwd+Ff7lKuHjOlOZoSAppApaURYPXUnirsucyIK
   rjROOO4EXGIcDsIEYJ4a2fU/2qWUcyUB80ziaIe6wURp/Zrsc/4i2bnH3
   g==;
X-CSE-ConnectionGUID: /LHSIu0NTkam6heM93A8sA==
X-CSE-MsgGUID: H8xcIsgGQziQijUIQ8CYWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46378078"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="46378078"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 05:18:08 -0700
X-CSE-ConnectionGUID: eY0twgGwRcGVQmaXQEms7w==
X-CSE-MsgGUID: Vpug6CQxROmWVcxs1aTVFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="151253494"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 05:18:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 05:18:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 05:18:07 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 05:18:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbEUKe0B2QY3AWkDXCdrqAzrdpljxAK6D/E4Ukz0avrhfAyYrN7LAgQArMd9E/+0R02zK7PTx3dpVczE7r0TSzApX7Qbf+/27fXJdxDm9g8CW84faex3LAdmwCdJC1IwQSHgBauWQvPhNSbiHD2on1O9W8oB9bDof0pAQqXk9lnnugINtoMpKS5jugFAO5gfiqUO8kCIm2K4q+Osg2WZgOWOHMkBIvfPxyIjqTF5buQLzrb3iQrt7Dl/xJ2F1JS/5AIKTHZBVQgkYYYN+8tPM2dsShHwWods5aO6B7zBVvNHJmzaPOFmFrjWUMGYam7/zApLVzwXLS2yvMe7b9mLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Dae2bY4oaA3zgqs2N1P+eZwRHZx2wPAajp8aBUiicI=;
 b=kkLhR6UkFjVxiPGVg28faUKcPgmFPNAyteu+kA72BZ8GXCYGBHoe3R4BAY6WtUCEmdKMURv/9zd/h4xienSuoDwJjtr9dTmGoWOt5NPkEPniAELwWxmOw+Tj5swjf5onwfWJaYESn6uV//H6ThtOZvu7q9qxGckWiI6NKRxxUtCVnD0r9vGQeJWyRCoiPakb+367EtLMbXIbHQlB6ao7aoAgudLF0P9MqGvxGIiypB/CBpxzd7K89Ej/ZaWdW+syVnlihm44u5orkdAX+VTRQPooe7BzEKgLTd1zuAetXxyXDjCXi1JuF0gJXSGUNnRzYM4Q9s+Vpq8RdCgPRlTLog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8665.namprd11.prod.outlook.com (2603:10b6:8:1b8::6) by
 LV8PR11MB8558.namprd11.prod.outlook.com (2603:10b6:408:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 12:17:59 +0000
Received: from DS0PR11MB8665.namprd11.prod.outlook.com
 ([fe80::8e7e:4f8:f7e4:3955]) by DS0PR11MB8665.namprd11.prod.outlook.com
 ([fe80::8e7e:4f8:f7e4:3955%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 12:17:58 +0000
Date: Tue, 11 Mar 2025 13:17:52 +0100
From: Michal Kubiak <michal.kubiak@intel.com>
To: Wei Fang <wei.fang@nxp.com>
CC: <claudiu.manoil@nxp.com>, <vladimir.oltean@nxp.com>,
	<xiaoning.wang@nxp.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<christophe.leroy@csgroup.eu>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 net-next 01/14] net: enetc: add initial netc-lib
 driver to support NTMP
Message-ID: <Z9Ap8BT2LZFTlm0p@localhost.localdomain>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-2-wei.fang@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250311053830.1516523-2-wei.fang@nxp.com>
X-ClientProxiedBy: ZR0P278CA0199.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::21) To DS0PR11MB8665.namprd11.prod.outlook.com
 (2603:10b6:8:1b8::6)
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB8665:EE_|LV8PR11MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f2f52f9-c166-468f-5a1f-08dd6096c2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IutmKl0wVVMF+LJVKM5m5cIS73F30CB8kbK0FXqGtsJ+WwVfNykMK2LkhTVX?=
 =?us-ascii?Q?khNSWY5rW8I/dS3x7J9Msk+ey//DSg9bPv6SiZSAOfF3qrk56mbfsegX2VKd?=
 =?us-ascii?Q?tPpY8EZiJ54xib5xdrJZEcAXl9G2QHKx4WRPftXlPvWVbmdKKjzf9WQGeag6?=
 =?us-ascii?Q?VcKuPYNo9tUKm5a9PEYD9mODgCzgsIGwiBSTWmCyvsdEeggJtw9BJsxJRgff?=
 =?us-ascii?Q?D8THs1RmtZUIVdbeuamGjjdnintyeAbpVJG8YoN+kIMqpziVJdvodZkkUsUI?=
 =?us-ascii?Q?oDtLqebooZGOAk0xh00WAkj14r6DDTXpLmSUCk81shPUTg7/HW9SC0CGJxv3?=
 =?us-ascii?Q?tafoPe5vcNcaoKJqsdKFdbqLHozO6aGJdIdj4ql4+eUo8YFk/1uXWb4gMlAn?=
 =?us-ascii?Q?eGgeIYto3/3onlG2MJKFWNyiERR7Mb3yE2N0MX9CjNpL5fllHtO07RlQBLOH?=
 =?us-ascii?Q?LzMLn8PxPN56zPPnLDRujvSTmngP4Okbv1Ami5H+Yi9Y3Hb22OHCzkKcJQgy?=
 =?us-ascii?Q?zjm6klf3J8TFUYWDucArjh+6BdZ8Rke3tzTpRCz86Bqdw9S31+KqFx7wiPGU?=
 =?us-ascii?Q?SAI3R9jqt8mP7sfZ4XCc2o2GtGrP9dKXAlnxL4Xb93JXalCwU3KYNDWWunMZ?=
 =?us-ascii?Q?W9prHwbu7Mrq7+MUaGp/AJrg5grjB800+J9Zk7Fz1juvC1r+tC8xw8uSNDBt?=
 =?us-ascii?Q?kaarw/+fHZDsZBhZ2rsHBMKxs78OBWiRjGUuoEJDxG1QkSMTodUE9dS1ABPz?=
 =?us-ascii?Q?WknyFHq7YgLVwRFsYfnI4BnPA3oqLZtNExyr4wijjMq+t1Pl6PnzFTb2mt1o?=
 =?us-ascii?Q?1k+4MjDDb8vhSUoiEXOB7DjtXS5QJJ6+YRgN+tR/D6stVSXOC/kER6dEiFG9?=
 =?us-ascii?Q?4ERvvoCfXuz473mT+HTfyXUf6axzbe0+lriTLhW9zT956uaHdJlarrA9Bb16?=
 =?us-ascii?Q?ZK0yfV0gYBbXmS7EwGBwoREcENPJ59dE2f+OebL16fd6ZUADnNkB0HuPsAeI?=
 =?us-ascii?Q?CJWXomi9DsM15lbRo2gWZinYAV/+WG2XmkDQQ/81AvgyMAq2Bm+vKrWKMPBd?=
 =?us-ascii?Q?8HKeyfRCdKNM9YVg02icYkh9c9Kv1LRPPKURUuV5UVPoy+1kSQLN8M1MIjC1?=
 =?us-ascii?Q?Aw4GiKZ7n5Lvcc7wtHauynX6eM2EF+VlSLUlz8XqUwFsifZfWZdA6yo2DOoi?=
 =?us-ascii?Q?1KFJ46iuxHoIhiLKHOlE1c1gk5cP55hIpYQ+9Uq84Si+q7upvCmQwXb5dyHe?=
 =?us-ascii?Q?a8BI/LWgOozABHIlSWvxmONLg1AxP+QIwnvrCx8naYcG9qzfG1NgwJjehcUA?=
 =?us-ascii?Q?c3myDX4rkGPp4Ph/H+y9X2d0OKPbbCAGRahGZwHckQpluWQ02rqkPb2PVo2L?=
 =?us-ascii?Q?qHE1i4cv5KVnn1TEhS9Nkw70LkZu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8665.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zWS9yr1fizBgNVldeX3fDhnySm1TPX8+Dtg4w/INsgoWQDUPWcyTCYYFDSch?=
 =?us-ascii?Q?yoldsRk37JMxVBbxvjPzl6uBrHaVA1Ni/F6TLLspD4ye88elro+1ldqqECdD?=
 =?us-ascii?Q?BOIPcKmMCIm+kZi5OlpyCLxhEx71VDm61j/VOQBtIHG+9QeX6RjTbRK7V6f5?=
 =?us-ascii?Q?w2uQETcbyEWkujK380awMWgnDOEtkQ/D8YV9W29bb9NPcPm6Ijf0kLfmmj6Q?=
 =?us-ascii?Q?77g6lvdw/PYc9uc5C9Yse7e9+QdgJQoSX+UZiBvMODu0IuCTEar98fEu63gN?=
 =?us-ascii?Q?hiKfquODo+zWWv0TSVoN+of5ZMoXk7wIeWnX/yxkqUlAamp6kHSEjPqhhmGK?=
 =?us-ascii?Q?LpY/yEsiU4S4iPjJ51Lvn5FoNheXPr+Nn+BZt0TZZQvJM2tM7OyaHoYeMY6Z?=
 =?us-ascii?Q?5WQgD3zlUR3iy6b3OEKtboCVny+ND/EutxneyBX+62vKqvtAwqwtwUCTBXQv?=
 =?us-ascii?Q?osoen6pL0+Zc+jBqJ5VVXsFg8h/ygKPLCVOszqhnoyTL0LeXqRHJrOLwKcRU?=
 =?us-ascii?Q?xAXbrGyFgDJ4BEtgOkrzIZvze4VHqqUMEBlVI4c59tYALWFi+tyi275IT5fN?=
 =?us-ascii?Q?UFEqpOVMIcrtDEDac0rfD64V9BxaG3sgJfYAKv+gNvuLab4+6w2QSX6EbauB?=
 =?us-ascii?Q?MSjg+Y2SPKTZtR1PocaEyDjFYXLk/4FdW9EtPkoE4ZfDu9lNuSF6kGzYAy/1?=
 =?us-ascii?Q?9IaBmEQTtM01FeGd7eyyXfZ7DBC+sDcVJwVGgfYV/Nso6ZsIsGqRnRrgTpWM?=
 =?us-ascii?Q?j13I8x/cDMryegBmAjNg7GjE0Dvw1ueRcHCjISRC0XBkkjMD6ddQBRLK54LG?=
 =?us-ascii?Q?8LnbGLk2M+hw7rK90QsTTfL++hkjQjmYh6PzlmmI+T2bKkiNLZJ3M0chUEoy?=
 =?us-ascii?Q?5tTaDLCw4vzHYf5hrpS447QbJLtULOewegiVqlrnSf3CSwHT9zJEIbz3H9qk?=
 =?us-ascii?Q?oTG6KSXn0Wom4QhEhmeNcMbmnfN+kGop21Tnb0KbfFDvqUsFASIQT7xcxUdU?=
 =?us-ascii?Q?It/JYVDFolDRdQ8l3jjbdXLXibPL3VFnjTSkBoQh3JrY2YYwCpaOkCuilZ4s?=
 =?us-ascii?Q?Ih7q6x+3ohZ0rXOF1W1KC99izuU+I8Yl2DJ/CC5yUHbcX6kRmJJbeblCzdyG?=
 =?us-ascii?Q?jki4gg6Hyq/unXzX0hBeQN2IfoEmRFxzvkJKQpp1TtIfxAXmOiR1LnpKwXO+?=
 =?us-ascii?Q?iryDxYO3V4Sz4F3nZmHBrowM7zqx0EBmVXW9Iv0/8aVxR1WpmlaTNPbOe4Al?=
 =?us-ascii?Q?02V+29/7rJ9qQb5RJdHhEqphEdwkaVWiMfc+da+896I35RNlEt1DhWFgEnW8?=
 =?us-ascii?Q?yfiUppKt3JlEG6NSR43ars9+V6NP8jEHgH/IoJqGJKMmOomLoFWgJq/HiKHL?=
 =?us-ascii?Q?dSKd9wFGGy0lMBr7eg412yL67IGg9dxk4JRDEArRU8VgX3AMbBIl/PyShELL?=
 =?us-ascii?Q?XaecVWEnyb7F9ROzG19yznRkNXxokGCrhJI8awFFwDV1GO/tBvfyNnAh+tfW?=
 =?us-ascii?Q?E+B5GdG9GnBL9sWKtEzndw3CD9MJFAh0GnGc5cyiX49HGlWMwoeUyEx4OqhW?=
 =?us-ascii?Q?tEa3FjkfDqIqVks1LDgZ7F0f5AXUYW9NJN7O1NvXsv9QZDTmXgs4+5wkBmX8?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2f52f9-c166-468f-5a1f-08dd6096c2e5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8665.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 12:17:58.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HiZOqcxyyxyD2JC8WeoeU1V7LBQ5zeV3MDDcRHD/IOWExyizdfQ4q/vipB1ggqIYl6c6ODhWR7XCeLczbKGCOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8558
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.7 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 01:38:17PM +0800, Wei Fang wrote:
> Some NETC functionality is controlled using control messages sent to the
> hardware using BD ring interface with 32B descriptor similar to transmit
> BD ring used on ENETC. This BD ring interface is referred to as command
> BD ring. It is used to configure functionality where the underlying
> resources may be shared between different entities or being too large to
> configure using direct registers. Therefore, a messaging protocol called
> NETC Table Management Protocol (NTMP) is provided for exchanging
> configuration and management information between the software and the
> hardware using the command BD ring interface.
> 
> For i.MX95, NTMP has been upgraded to version 2.0, which is incompatible
> with LS1028A, because the message formats have been changed. Therefore,
> add the netc-lib driver to support NTMP 2.0 to operate various tables.
> Note that, only MAC address filter table and RSS table are supported at
> the moment. More tables will be supported in subsequent patches.
> 
> It is worth mentioning that the purpose of the netc-lib driver is to
> provide some NTMP-based generic interfaces for ENETC and NETC Switch
> drivers. Currently, it only supports the configurations of some tables.
> Interfaces such as tc flower and debugfs will be added in the future.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

The patch looks OK to me.

Thanks,
Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>

