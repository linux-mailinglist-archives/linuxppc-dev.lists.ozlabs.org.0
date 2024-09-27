Return-Path: <linuxppc-dev+bounces-1630-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F69987D21
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 04:48:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFFJk2sYhz2yYK;
	Fri, 27 Sep 2024 12:48:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727405302;
	cv=fail; b=nvaN/tHnoiblezt9DHEhNyFWRSQClYDPb4furmhDS0AncLjU7gpzSKanuWflbt3o5j2j9svO9N9gAxv8gCKixW1tfICQCQnVvS3DsDjJKr0SfABG9JXvzm4A/gm5QL3eTSDJz8p4sxKVA/u1TSe9EhAQgfz1nMmj10aGNdGew6wn8j0/BhaPIF+8RYC1f70t2nhOuCFTc9a50z7d+2fb0KcteCJRkNXwLU1f0tUEaIqSJunVeOi4XEg/+/V5gjedc/puf2MYpdcaen1I66cAR2c/QlHRD7BSmoCTL2W0vH0X7qnuzreb/hqA4Kpo9SV0jfwYurSFku3dpjCtfr8ZOw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727405302; c=relaxed/relaxed;
	bh=4Xqx2ve2MuiimKagANTTyc7vFLBsDBaCWB/Gjjr2LpQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MOScImWRmtLWiAMa+AbfC1ZfoxOtiSxPIpg3gGp84/zhmG9Y9OGQILUSgCxYJpL/ZdE0k5YDZUyPTIEG9FxlLMBfCZ2RmZPp1CJhb7Ah6iPcHdJB6u9FFHGB2sUN5bZWp8I0v6yB81DrWL7Q3vr6/OfL2jthCPPIBjMOg0SlKu+tGQ495hUw68CWfDyYxXfSuOPTgQEn4oKbXOtC2OiRh/VwncFxQaChE2ZoZRmLdDMycfjhGoxvEDhPZd6/Ya+dOVsIDCeGKbVerJh/Aepq/4LPttI6NxG5Fw47dk/W7P7TPLUc28aSqTgVtVwG7LwNWOLGXPeibqcLkeYRdkJ7bw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a09JvAd7; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a09JvAd7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFFJh2kG3z2yYJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 12:48:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727405301; x=1758941301;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=P7uSKunTz0gvA/gFp/hxEb3he626IQZO0xvHwFgrl1w=;
  b=a09JvAd7dwZ5l6ADkeTKxLW5WDONFxp0uyRNoyxDc47EzdFHPgjap5Wn
   ZG0QMi+97T8LmEZjviXM6YyBOzIBRJrx0JopzJE+0gquJsDd0tkOeYyVp
   rb9FDEP/Dej4RZmsHCEgS5RFmBhk09rhzvqIco4P2cBLIzVfFYfRzBr3D
   ivU4gSemTPZVBPa3a5f4jh/dYl73QYd7zMDYHezreHnfzj8QLRp7EVTE4
   pYNT2+Onyjbz4zVYRwIl2fexsvwd3mv/TaHtvZ+q2u0h2tjRUQOBlEfMX
   GnkKf+3kzTnglGZ2YbawGB3VeyS1eyFuEE88viFITSkhSMeaCT0ItrslU
   Q==;
X-CSE-ConnectionGUID: IyhVQOxqTcKIDdVYCrjF9g==
X-CSE-MsgGUID: ZtEpHl51SkK7Nw9wfeR4uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26485481"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="26485481"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 19:48:13 -0700
X-CSE-ConnectionGUID: chOiHM1QRt2iIKqNNIxpEw==
X-CSE-MsgGUID: lbRjEyChQvmau+ejQAa9Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="73174220"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Sep 2024 19:48:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 19:48:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 19:48:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 19:48:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 19:48:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yK6CMK4OoHg7eWImF1ri19H9owDTeHVLtZ7jCigDk0i18Y/93a7OzdHkFAaGBCNaOqvC4dChmvj1hyErTi6jSlNU9qq2nxSIWDaXolLy0sjYBKwACIPaiWr90NfNaGsJTwyXJjKA3OmkPFJI+2Legdz2KniAVhkB3VbFOUPltdgIlPS49IQhP/nUeFZW+7EMET0GivlbsCTfD5HyFk9Glz3MFyeAj9dx4RIQxV1Ro3dbDf8ZrDceA8d18Vyc+kNB8hi4nkBaF/tZrundVDiIYqjzx+wOBGyRYOFzM5mz5TYXpwdX0jlKACIPLHX/ZH8k4mJ3J4gP0SaW3OZZbu+o3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Xqx2ve2MuiimKagANTTyc7vFLBsDBaCWB/Gjjr2LpQ=;
 b=hdSiZny0Ra4WTXOhF1u3QkBLXnACu8B2oVEQ4hD/6R7HXebvgv0PIaHY8KwIgs0oNzrIPNBcbegPCl26pWHfpgjWvd++vlWMfq/gefx3FPxohTwqc/eLsptMlkgdcCYEL8qQJRSrzL1HLMzZ2uqfzQCLvqAqUgulEAXrLP3p5lHCdnvQCMYfxe5j/RlhShpzKZ5OASfMEr9CfKollSidly9lmJkgKgOiZvSMPuDhZiiAU3M6SCVopt9BQ2b/hQ7v3NJOCnj/vt2SjgqLfx91NJWESJ7pn8bSJ9pRWBO0jiNgg8zQRmae4ET39aYvKqKdxc83r7FKji/6yy5UbNGsPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CYXPR11MB8755.namprd11.prod.outlook.com (2603:10b6:930:e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Fri, 27 Sep
 2024 02:48:08 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%7]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 02:48:08 +0000
Date: Thu, 26 Sep 2024 19:48:04 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, <dan.j.williams@intel.com>,
	<linux-mm@kvack.org>
CC: Alistair Popple <apopple@nvidia.com>, <vishal.l.verma@intel.com>,
	<dave.jiang@intel.com>, <logang@deltatee.com>, <bhelgaas@google.com>,
	<jack@suse.cz>, <jgg@ziepe.ca>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <dave.hansen@linux.intel.com>,
	<ira.weiny@intel.com>, <willy@infradead.org>, <djwong@kernel.org>,
	<tytso@mit.edu>, <linmiaohe@huawei.com>, <david@redhat.com>,
	<peterx@redhat.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <nvdimm@lists.linux.dev>,
	<linux-cxl@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-ext4@vger.kernel.org>, <linux-xfs@vger.kernel.org>,
	<jhubbard@nvidia.com>, <hch@lst.de>, <david@fromorbit.com>
Subject: Re: [PATCH 07/12] huge_memory: Allow mappings of PMD sized pages
Message-ID: <66f61ce4da80_964f2294fb@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.9f0e45d52f5cff58807831b6b867084d0b14b61c.1725941415.git-series.apopple@nvidia.com>
 <b63e8b07ceed8cf7b9cd07332132d6713853c777.1725941415.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b63e8b07ceed8cf7b9cd07332132d6713853c777.1725941415.git-series.apopple@nvidia.com>
X-ClientProxiedBy: MW4PR03CA0324.namprd03.prod.outlook.com
 (2603:10b6:303:dd::29) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CYXPR11MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: e81ef09d-7bb8-4f0f-8efd-08dcde9ed166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kH6cof3yPhSHyLUEP5xZwVna4777PUGOxiA4+yGJW0XjnGIuPJRaQpL9Q4hL?=
 =?us-ascii?Q?PTzdIQLRcQEyrFdKPBAej2/H7/kfjbM0zLZsaujYFNzyclAO7TZ2VvzsTeTx?=
 =?us-ascii?Q?I1IqPQFcaVILc4ExfNruZyFMSMqFsbGItk0yEbI4sZPr9Cm44sW6zDWiF6UX?=
 =?us-ascii?Q?9pYUpDAeBoR8LEDXmZA7QRG9noPb0tGUw/IXse9IajqV8UtDUEDm8n2UtqAN?=
 =?us-ascii?Q?ixfBwtm6pwmuqcVRHZ0L4biE3TqS+bLNTLB3MhHHjgg05YS4DyFtLmjwEOhp?=
 =?us-ascii?Q?11iUEVQ3nledqMUdl3fl16gqxQ3evs/cRvVi/d2KtJXALXDlZvi4xXP8VPjm?=
 =?us-ascii?Q?rLum8Q42P5TOs0ioH0gog7TwCveAsSBUC8yJyLBL5PjzOn42Z5TkKOW6Nsjs?=
 =?us-ascii?Q?QCv6Diyi0Ar/7PctVoGL+/Xhfnv+OQKTer4ebFb35ZB83L07qwPByqoZnlaj?=
 =?us-ascii?Q?LOORMokIyBiwF5L1ZDuNLDfgDQGWEPzA3FhuxOKf8TRqaurl0f3UR7I0s9tB?=
 =?us-ascii?Q?n4B1N7k7il40PpA76fSARxKRcaqvaCdILrpsuNhDjZSvY3qdOtaYFI1yUK/D?=
 =?us-ascii?Q?2l6DnvqyUMxcOC8WvT5mjB6lD5kBu9O5s/6bWgZ7j2lZDsGy0dCpc86u1xb6?=
 =?us-ascii?Q?rkGGRjgWwOZH3IE1H1M2v/7DkEDgcDm8HnhHvcBQetKgQqlCqbSxhatzGaC4?=
 =?us-ascii?Q?UHy+GiP/PIU3gvontc78WOp62LwMaWqokFDhw6LspD4PIVvcT0AmCFvWetqf?=
 =?us-ascii?Q?62T5FOkibUUWAPng/jhevgVlFnQ/S1K07UU/0ULsN0xwDR5MQFZxpfQTpVBW?=
 =?us-ascii?Q?htc1CYeNEp5N3ZKleIdzR4P5c7UDkAyExvN7kXJlMvEwxcAtiLAkv6miUVeR?=
 =?us-ascii?Q?XWVxDQTW0WyLzSgdtOj5/6yl01qF6C76YoqATgSE9EwwfTeNPC1Dxd1NsjWj?=
 =?us-ascii?Q?jtf/UGjCkbm3UFxdt5+qWdgmCJZmU8hozMB0D4pFrwFc56RHLl+ovtaH/dmf?=
 =?us-ascii?Q?Gu56gNBM3wAWectLlups7rU/t9dRMPZgQlAKVAnPTHHPjYid4dw7Zy8lRfwy?=
 =?us-ascii?Q?XqcT94KUNUKngRsQrhEGag/BTdCxLpW1QJizliNw9YrXPbGn8op6U/mnnlw1?=
 =?us-ascii?Q?GymCMSV0U1oMd9ME+9IglO1rVv/jIl49Xf8FboBneziN1VcR/SEch8hD5bWb?=
 =?us-ascii?Q?Mb9NukjahuM9XPA/i2CkJwQOoNl1xJ7IIVOHM2Ar0hn3zJ20itccEO1sX9+p?=
 =?us-ascii?Q?cdfW1TQOCKnTPgGArjigfkSCULaEqVdcrqO85yBNan69L+cZrWUdwC3A4jVd?=
 =?us-ascii?Q?2haPslZnntNGbelckK88XOSdpGvw4+iy9YkwLTKT24eciQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c6oA/bz7PblOQXPbxuqSw2IcxmE6OAcMymnMEpd1ScKeic0DpDOPBRva+BvD?=
 =?us-ascii?Q?SW4V+GaJZYbDjHIxrqKHaGmvm1dmG1YrJLU/W9O0kGv3W5QksIU83rbwmknE?=
 =?us-ascii?Q?vAqzxDYJ59k4uZjjXGvzcsRyP75EQQAWING+DgOm1fISDNMprDXbHrcVWDJ2?=
 =?us-ascii?Q?KvAUsiWKdQOewUO8mX5zqX0sMcw3vQf3MsSVhfbixB+IOTECSMm5enANmy+p?=
 =?us-ascii?Q?toRylbmj7BjlwLW+MNEZVQlHhhGbPaffkifiIotlQSpiKohYfRuXfKtuiTrp?=
 =?us-ascii?Q?ckZDjxtbMyEmhxdFPdtwAq5ioEUPtE/vCPiAK4C8wX3uRZOg3jbIsO8HBUXc?=
 =?us-ascii?Q?q7AsKzNS4z0n4JiIA5Eudy+hF0giu9LOgC7VKw5EhERyTkJjcbUJyKmhN7Ea?=
 =?us-ascii?Q?oEAimGv30jN8Gdg4bwZV78lSaqPJgc4hPPUqxXb6WlLdLaKX2syoBoHHzPD4?=
 =?us-ascii?Q?wh6qKV+w3VSUhOZpt4f2txEmc9qy4PtiwG5co6D8L2ziFZDrYJssw2Yz8qw5?=
 =?us-ascii?Q?akSUpSFQx6hHQKfhrjMD6KjbkPeeCMfoCvnAR3uN7AJi2R7z+9bsM6WK8nJc?=
 =?us-ascii?Q?cT7wNWh1gy8gWyO35VhFQgx7C+L0L7fUtdaKplBh5cJmj03/Jgp927Kde2tT?=
 =?us-ascii?Q?y36zwtUakBhInyDhbQeNZUNp+PSPg3Ep+Fg3xmwihT/K8fiW8wMK3YDb+6CH?=
 =?us-ascii?Q?t4u1bK2KkJlDJkO1lfA0Cp1OAsBUjIbifUsG1y1SOoR7XmJIOIKiAlU1Kntl?=
 =?us-ascii?Q?haQqGl0DGorRy5h01tt+JSgIHx4S79hQX3Q+n5T3yAFwxWN33wdvP48tWTtH?=
 =?us-ascii?Q?q0c3eSGHEmnl82fZ/dtHVqV4srPdCxUDA5B94ml0vweP2SU5u3YQoMpqkVOe?=
 =?us-ascii?Q?DxYnpeFfakdkW8ZAFLQ1fUM2eHBUADz36IP5vCDhi5E/VEeFtZkceJGemXAq?=
 =?us-ascii?Q?7ZhAajG/3CoawaAnb1BetZLFW0+bIXEdjA1ZGA67frqyQrDH3dx1TU+Es3MX?=
 =?us-ascii?Q?5vjzrSuYYK7NcSbatB62RDWY7e2sKvgycHmlc9zJUDg5EX8dxYu+6Zpgf2BA?=
 =?us-ascii?Q?8KeOsnwMUFLp9+32nRjoZGsGY+1AT7WGt3PahZ7PpRSsLRN6SiUDq3D51jrS?=
 =?us-ascii?Q?wWoyPEvJr/u37dM9TJ3sGNmx2h6CFkzH4iXgjTmiBsrQUjYGzVE7Uqubn7eX?=
 =?us-ascii?Q?eLQ9Iv1s6NwF3DDnzv6NSY4mHCK1M4939jeu/OmFrBH2xzTxT6uUq4rGeY6g?=
 =?us-ascii?Q?us73f0Lm3DEeISbyylPuTQFJF4x/AaSWzUeqxP3v8QS70sOr+ftPxo44e4bA?=
 =?us-ascii?Q?Z2vzl5MlDbu1sUx/d+Qfn5xOxMPnFGdZdyzlYqO9LSLSB87DSe34SWXIkfxD?=
 =?us-ascii?Q?4NfnKcHEZbuW5HURocu2GhbymGI6YpJERu4vIeVTaV3qIyOFWzIISCNMv0be?=
 =?us-ascii?Q?mccPxpLJIWWaK54Bdh0BljrMgF4tQBP9BD+OaLX/tjsHLOPtd295ND6IiRZP?=
 =?us-ascii?Q?VChUrRJ8W8Y/pV16WVK1zc9mJBDVL78JFgJ6CEDzTjBm4m/9O2dZZeGO55z7?=
 =?us-ascii?Q?BRsg5Ey6eO4lnoeGDKPH9Cj//KFMCz4/2RYFACfKEQvCj15ID+2XkX9T3Q5c?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e81ef09d-7bb8-4f0f-8efd-08dcde9ed166
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 02:48:08.0432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrsdWkKYOjyq+BR9rRyY1MYkDILaqGST1ZBCC0yHbrO8GZejnUPFVicYIYjTHkdmqwH/HTf3fYnStX7KoJXXyNOCc1wH2TaOHmgeqCY2gYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8755
X-OriginatorOrg: intel.com

Alistair Popple wrote:
> Currently DAX folio/page reference counts are managed differently to
> normal pages. To allow these to be managed the same as normal pages
> introduce dax_insert_pfn_pmd. This will map the entire PMD-sized folio
> and take references as it would for a normally mapped page.
> 
> This is distinct from the current mechanism, vmf_insert_pfn_pmd, which
> simply inserts a special devmap PMD entry into the page table without
> holding a reference to the page for the mapping.

It would be useful to mention the rationale for the locking changes and
your understanding of the new "pgtable deposit" handling, because those
things make this not a trivial conversion.


> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/huge_mm.h |  1 +-
>  mm/huge_memory.c        | 57 ++++++++++++++++++++++++++++++++++--------
>  2 files changed, 48 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index d3a1872..eaf3f78 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -40,6 +40,7 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  
>  vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write);
>  vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write);
> +vm_fault_t dax_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write);
>  vm_fault_t dax_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write);
>  
>  enum transparent_hugepage_flag {
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index e8985a4..790041e 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1237,14 +1237,12 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
>  {
>  	struct mm_struct *mm = vma->vm_mm;
>  	pmd_t entry;
> -	spinlock_t *ptl;
>  
> -	ptl = pmd_lock(mm, pmd);
>  	if (!pmd_none(*pmd)) {
>  		if (write) {
>  			if (pmd_pfn(*pmd) != pfn_t_to_pfn(pfn)) {
>  				WARN_ON_ONCE(!is_huge_zero_pmd(*pmd));
> -				goto out_unlock;
> +				return;
>  			}
>  			entry = pmd_mkyoung(*pmd);
>  			entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
> @@ -1252,7 +1250,7 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
>  				update_mmu_cache_pmd(vma, addr, pmd);
>  		}
>  
> -		goto out_unlock;
> +		return;
>  	}
>  
>  	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
> @@ -1271,11 +1269,6 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
>  
>  	set_pmd_at(mm, addr, pmd, entry);
>  	update_mmu_cache_pmd(vma, addr, pmd);
> -
> -out_unlock:
> -	spin_unlock(ptl);
> -	if (pgtable)
> -		pte_free(mm, pgtable);
>  }
>  
>  /**
> @@ -1294,6 +1287,7 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
>  	struct vm_area_struct *vma = vmf->vma;
>  	pgprot_t pgprot = vma->vm_page_prot;
>  	pgtable_t pgtable = NULL;
> +	spinlock_t *ptl;
>  
>  	/*
>  	 * If we had pmd_special, we could avoid all these restrictions,
> @@ -1316,12 +1310,55 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
>  	}
>  
>  	track_pfn_insert(vma, &pgprot, pfn);
> -
> +	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
>  	insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write, pgtable);
> +	spin_unlock(ptl);
> +	if (pgtable)
> +		pte_free(vma->vm_mm, pgtable);
> +
>  	return VM_FAULT_NOPAGE;
>  }
>  EXPORT_SYMBOL_GPL(vmf_insert_pfn_pmd);
>  
> +vm_fault_t dax_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
> +{
> +	struct vm_area_struct *vma = vmf->vma;
> +	unsigned long addr = vmf->address & PMD_MASK;
> +	struct mm_struct *mm = vma->vm_mm;
> +	spinlock_t *ptl;
> +	pgtable_t pgtable = NULL;
> +	struct folio *folio;
> +	struct page *page;
> +
> +	if (addr < vma->vm_start || addr >= vma->vm_end)
> +		return VM_FAULT_SIGBUS;
> +
> +	if (arch_needs_pgtable_deposit()) {
> +		pgtable = pte_alloc_one(vma->vm_mm);
> +		if (!pgtable)
> +			return VM_FAULT_OOM;
> +	}
> +
> +	track_pfn_insert(vma, &vma->vm_page_prot, pfn);
> +
> +	ptl = pmd_lock(mm, vmf->pmd);
> +	if (pmd_none(*vmf->pmd)) {
> +		page = pfn_t_to_page(pfn);
> +		folio = page_folio(page);
> +		folio_get(folio);
> +		folio_add_file_rmap_pmd(folio, page, vma);
> +		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PMD_NR);
> +	}
> +	insert_pfn_pmd(vma, addr, vmf->pmd, pfn, vma->vm_page_prot,
> +		write, pgtable);
> +	spin_unlock(ptl);
> +	if (pgtable)
> +		pte_free(mm, pgtable);

Are not the deposit rules that the extra page table stick around for the
lifetime of the inserted pte? So would that not require this incremental
change?

---
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index ea65c2db2bb1..5ef1e5d21a96 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1232,7 +1232,7 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 
 static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 			   pmd_t *pmd, unsigned long pfn, pgprot_t prot,
-			   bool write, pgtable_t pgtable)
+			   bool write, pgtable_t *pgtable)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t entry;
@@ -1258,10 +1258,10 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 		entry = maybe_pmd_mkwrite(entry, vma);
 	}
 
-	if (pgtable) {
-		pgtable_trans_huge_deposit(mm, pmd, pgtable);
+	if (*pgtable) {
+		pgtable_trans_huge_deposit(mm, pmd, *pgtable);
 		mm_inc_nr_ptes(mm);
-		pgtable = NULL;
+		*pgtable = NULL;
 	}
 
 	set_pmd_at(mm, addr, pmd, entry);
@@ -1306,7 +1306,7 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, unsigned long pfn, bool writ
 
 	track_pfn_insert(vma, &pgprot, pfn);
 	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
-	insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write, pgtable);
+	insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write, &pgtable);
 	spin_unlock(ptl);
 	if (pgtable)
 		pte_free(vma->vm_mm, pgtable);
@@ -1344,8 +1344,8 @@ vm_fault_t dax_insert_pfn_pmd(struct vm_fault *vmf, unsigned long pfn, bool writ
 		folio_add_file_rmap_pmd(folio, page, vma);
 		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PMD_NR);
 	}
-	insert_pfn_pmd(vma, addr, vmf->pmd, pfn, vma->vm_page_prot,
-		write, pgtable);
+	insert_pfn_pmd(vma, addr, vmf->pmd, pfn, vma->vm_page_prot, write,
+		       &pgtable);
 	spin_unlock(ptl);
 	if (pgtable)
 		pte_free(mm, pgtable);
---

Along these lines it would be lovely if someone from the PowerPC side
could test these changes, or if someone has a canned qemu command line
to test radix vs hash with pmem+dax that they can share?

> +
> +	return VM_FAULT_NOPAGE;
> +}
> +EXPORT_SYMBOL_GPL(dax_insert_pfn_pmd);

Like I mentioned before, lets make the exported function
vmf_insert_folio() and move the pte, pmd, pud internal private / static
details of the implementation. The "dax_" specific aspect of this was
removed at the conversion of a dax_pfn to a folio.

