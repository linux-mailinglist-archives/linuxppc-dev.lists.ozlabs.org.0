Return-Path: <linuxppc-dev+bounces-5191-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E60A0C272
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 21:12:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX3M871Xmz3d8M;
	Tue, 14 Jan 2025 07:12:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.10
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736799124;
	cv=fail; b=aBGETXh2cN4ANNMaXlA5ji+B2Dn9YxUtagJ8+lA9Lg6O9uooPeb/ifSmzwCOsoUudlfK46HfVFZATMl3rUxtO4GVi/fQSEB1BJCBrx/oCrWixXep+nOWelSGarLgan2sVC+WsOVq7nIUbh1NtZfPsy8bS9x0ME4a2sVnyvzB5OK6lMQASY1KRKWciSNUNoHhYEoAlnKqFJSbHkvE9CdaUNIqmFVG1Hv+wUie6e8iZuNQArZ1C+XCEaPXV7CWTHX8or1sIgdTlFE1bnCleoqPmwlN0PULc7ZUBi/7KpX2m4Jf9so03MTRr69pJe9l71mrrkvzLsdh8+6PMSqH0ArNlA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736799124; c=relaxed/relaxed;
	bh=Ntc3VuB4yopJudRLRP92b6Y/NI/6+0uL23FHsM6vBhY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Gf9gMN9RLn1j7tGcukJ+v7DyZB+AcVefBYYxpi21P6ik3MDaQTpf1SxVZsjmk0mPjAFEVC74KwuyCQO8to/vgASyFRQAyk0TBXm4huiEZs/bKRd0jE46/WSAy/1yx3oGnLK8UQKXBbhGWeX9olx7u64lZD2kz0yrHwvCeRhHPJAebd+xRHdp9hjJVIICvyNmFaOD2y0cMEZdrP53c325sa3E8bKY39gp3xnwV938voN1HCsvO0uHj6VpI3Fxrzfi4oudkEJTSJ1aHJv4HNShhXnKlnVLhg+Fs1smUw2E7s9Dno/XN/S2OJisgSNdG0zNDwMSJuJE00iRKuqQpuIpSg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZR6olCjP; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZR6olCjP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YX3M62dy3z3d2d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 07:12:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736799122; x=1768335122;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=nWfU8K/4W3Wif25WpGrx5JP4t9bYaCHHxOJPuhfCQ6g=;
  b=ZR6olCjPSWMX+56gFoYbBXp+dMMnoB3zwYapald/Hg7VWV6of6nF8+B9
   DGLuSRDw2tlUTCMIQ5QkokBcUXAeExHq45UocB8nrVrTn6gSa5rbylnoW
   XtJxXy7jgH79gOPADMRQzTDRLlyP9AqDvWXRNztIspmVnPSGbnKomU6WE
   sAmU2GsCo5IBgdy9Ou2D2NodkTw+0lT2NhZCoOUoz1A3yJXOR1FO2x4nx
   3EQg8BNdorn31bf8AOxEPc+24yLbaAkBG/8Uh2Jmu/Zt8DLIjWsGITe1r
   2W5JCXU11rsUoAIKsJs61Q4UwjfeZ8Ika5tIVYdFsSvsMnl8lignfVuex
   Q==;
X-CSE-ConnectionGUID: ZYEWoKmgSEOYdv7K3jE1fw==
X-CSE-MsgGUID: O+sJGKjFTQSzt3BH6OhQeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48492167"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48492167"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 12:11:55 -0800
X-CSE-ConnectionGUID: YzEQ8DXqS8edGB6rOyRweg==
X-CSE-MsgGUID: 6k5OPw/XTvya1+vXQ1iHSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127837819"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jan 2025 12:11:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 12:11:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 12:11:54 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 12:11:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQU8geI7zmGvss4Ca3QWeAlah/0Dbx97jhxR7hoL6WuFJ+jPR/8f5RlXXWgTKN77IIlbtN7NTuXZhD0RJlA9VuK+5NQWZClQRoqpRUGTKf75OSt6KOtl14hnBXuSXvT813VVWBpY6oXcLRugFUd6k6QCwtEN7QhBZuOIvuOoHgEfGZArL78uE2NqzTQjOEmXS1+84QU5KMpgTWRxL/1boZ52rlRJAlC+I6pbpQdylJqr1jiXPj9w7mgn5dJ6NFgrWG1rB5s6qIj0bc03hcWpDMfNPP4DNPku4/4pJSKlGyn/GN28FIZRzjHkUbZVKGORWv/mVbC/LN9dHxrruX9n2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ntc3VuB4yopJudRLRP92b6Y/NI/6+0uL23FHsM6vBhY=;
 b=MC5NG+OORkVPbTTBspQXA7R0PkDbPaVYMvyAbyJkoaJLE8tsQ/SH1Rr4Y0crjx5Skahk3uC2KI7MBKqvza3PmW8WO4+WLfLYYVfG0PsYOvxKdjsE17LK0oGcRS92kudt0on8K0psiCnBephY064OTIDf+j1g7xI3lpxLheiHp4G1jGKiqtSOE/okJKzNwpQpK/MNmkb/b1zYfyCCUz9/LKWhxsafG5ZPg3V1duoJ7m8qU9SoyvhZh0qY79yrFijqLlpr4eDxSxXcO5IwQaYFQSJNXU0uT7emINbWrJ9YlODgjGv/19n6G7lojfgtXgGzsGJjpNNa2TujHwhkH6V4Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA1PR11MB6243.namprd11.prod.outlook.com (2603:10b6:208:3e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 20:11:50 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8335.011; Mon, 13 Jan 2025
 20:11:50 +0000
Date: Mon, 13 Jan 2025 12:11:45 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, <akpm@linux-foundation.org>,
	<dan.j.williams@intel.com>, <linux-mm@kvack.org>
CC: <alison.schofield@intel.com>, Alistair Popple <apopple@nvidia.com>,
	<lina@asahilina.net>, <zhang.lyra@gmail.com>,
	<gerald.schaefer@linux.ibm.com>, <vishal.l.verma@intel.com>,
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
	<jhubbard@nvidia.com>, <hch@lst.de>, <david@fromorbit.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <loongarch@lists.linux.dev>
Subject: Re: [PATCH v6 05/26] fs/dax: Create a common implementation to break
 DAX layouts
Message-ID: <6785738165184_9b92294a2@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <79936ac15c917f4004397027f648d4fc9c092424.1736488799.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <79936ac15c917f4004397027f648d4fc9c092424.1736488799.git-series.apopple@nvidia.com>
X-ClientProxiedBy: MW4P221CA0019.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::24) To PH8PR11MB8107.namprd11.prod.outlook.com
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA1PR11MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b495570-10e8-424f-57d7-08dd340e83c5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?epVfl7AGhJ+n9aIEgOP8vB9Ygc1pWDb/Af45m+Vi3cVi5cYBdgxVYrS3TzEt?=
 =?us-ascii?Q?pdrH2UulZeC7wBn6JsgUTQ+Z+316c5ZI6NHnU2hkQ6dPrT9MdZjzr9dXMpm9?=
 =?us-ascii?Q?VY3nrfhYM3RUfR7URXNvSBxkCu7G1Htmr6qumQOJomJLeZluHRPTysC/kg8h?=
 =?us-ascii?Q?6o/Wkn0Mx0DPwRHvMUWjd2NwafuJRVgu268LbtWQJlHyzfHUG84/ao8Zsd7W?=
 =?us-ascii?Q?4cccC+YJEkWFUoHvz9SkEmym8Mf+s6cNWJxHa9zMe5FH7ZLA+9ToMfmGzYnl?=
 =?us-ascii?Q?x7bF/Godm7aALv1LyxyJkmgdCW08eQUl7tdwG5z3pwpWLlWBK1Fo6CoJN8Ey?=
 =?us-ascii?Q?QhTzzA2c/+zbyGXnFJGXB8LsSvqrH4HdVJLFnyP5nCs2DBhaJpbCsU8pWpCa?=
 =?us-ascii?Q?4jd0HhPpI59MKNA+3JfjJt6SvVcnctC6ayDHQzIa3AfXYzGGVxwI6tL0ZIXq?=
 =?us-ascii?Q?y0h7qR251h+dzE/JulHjqHz1ri7MF2dQ4TDsA8NPAm3rDhP6oggiV4vDA4Pv?=
 =?us-ascii?Q?rGTmJCUdO/VuULmJ3WKcvXFvygkgA2CJtxt9tJHh6H4Szng0b5Ympmt/EwK8?=
 =?us-ascii?Q?GJqZOX1rsWNJg8FPhf5Hwc/OLMGofxpr9senx19pqlECx6d3e6jEOxdoCFJG?=
 =?us-ascii?Q?yvSnSFUpBWIWqjB47eXg6RleD9fkBeoeLRN24qtekC5qUIxA3zk5yx52lCuL?=
 =?us-ascii?Q?5ugXcP7q5r9JL5r2BxzgaimTIcdxGgs87HnpJwoRYz8kcEaE1h/Va5XXyb0m?=
 =?us-ascii?Q?HnWCxwRQof5GAEn0VOnyfOhS8nUCz9hGyJKtlAGfYzxN4IZFuEIiGqm3zHTg?=
 =?us-ascii?Q?fJWv3dMCBzKAFTFhcO/p0or7To6WrETYfGH1bBqQMjPTos93kkq1ON3kALXD?=
 =?us-ascii?Q?nN1pfDir58viwL82AdygnR6qOVX9MFiNh3tr2g6kDepgIFm1XEBe5TOmCrC9?=
 =?us-ascii?Q?PVZTWTE99gXnjfCetRkrrcuU2U10Rzk5I28nELKezu7ZOoYdAwXCpXMCMUrG?=
 =?us-ascii?Q?l6ppLyuU6ih7Mvn49NTrpidX8ic4bpLpFd8Waeli9/bkoZhK9WUv7hz6pEIL?=
 =?us-ascii?Q?kgU2xGjjTxjFGfzdd6ftvvad9H1f5S5a73DVDnAf1hc0LsdqrOJEnytchmFk?=
 =?us-ascii?Q?k8Z6Z1oqS4ngk4aTdlgxDMAMu9oszMCvCDXimvPXBJkUkjvzlqHq7zZXG9Iv?=
 =?us-ascii?Q?EMuPXH36JBXMDb4IcDwMfHiBYJxJKFFlWrcnU7qwdxcmqtRaz4j0xPEMSpFi?=
 =?us-ascii?Q?3qpa2ZOh75IZkcHpUHu6u2dPXzkTLq64/6ciNJNKGU+IuCOJjpX/In+OsR26?=
 =?us-ascii?Q?heF1sntAsGZuxVaTtGHb1qfP5ycn6JO86r47Y0TZfsowC7+0wkKRpc6XIiqc?=
 =?us-ascii?Q?zYZf1vvLEC4DHmqdHGcCO61M4P3l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vrnARxpIyufPkt9NGDdqbvQixAJFCZG5+YDUqPstmFsehcU9qTqywsSTX36Z?=
 =?us-ascii?Q?rE/W/TQHUIOJA4a6Pr+xL8R04S/JcJk/tP8KWxEkxv42p4AebodjsE3fa6jm?=
 =?us-ascii?Q?QGPOBC4EPL3hbJbkYNbba8DzZwc3Qshe6I8pQQhN13QaScwr26AWCyEojFlX?=
 =?us-ascii?Q?m/aH2U/q+X97P16r4+8g3Yp3Jpl7w5hZ5d2eKp4HXaaLo/Tb62/SUqevZqaC?=
 =?us-ascii?Q?sd2QzZu2qJWMQq31kpLZIpM10XlGgsrHMhMD9K6etMKtfsYdi4PwjQD8XNEB?=
 =?us-ascii?Q?i2Xrh5oruvhDqaJaxbGtKzMCgmrek1gdLfrs9YqMHL710OIraiWr+2fjQafe?=
 =?us-ascii?Q?FI85jSupHtmJ9Cs3gXCkYTtub+dZDJnsek1QByY360w3CiGpwKtkmNEXic8n?=
 =?us-ascii?Q?zwlW9MlmSV5igBT2hs0UUDDuvYMwxxn1JGDfJap0zNoAfaJnInTRlYR9ipOq?=
 =?us-ascii?Q?92Qe3nOMPNtBRwdoWAUOj3UMxGYrxW9CsGwVDepEF0/Q1YgXRF42WbU2FxG4?=
 =?us-ascii?Q?PCbwbiTEeimGVwop40qagP9KioeXf0/49q8ITnh2EOlW8K5erM8FpAlhw4XA?=
 =?us-ascii?Q?ECYKinCDyMHyiO0DiX8MH/1bwQqLjXxmM9eONw8TO9++J2Wum7ohiGewHTqC?=
 =?us-ascii?Q?KImOqOgg7erUHTYcluO7J8YOrRQeWHW044VBogAddzDoCRWF6jOp7euUrcmh?=
 =?us-ascii?Q?JmnYacjLzNFJ8vjWvtA0IpL1kV3vNeGS9tmjw2H7AoBEM3QvPvi/sBkLT36f?=
 =?us-ascii?Q?R7ZnnL0aiBkB/UyvHKIN0If8Ct+DNDUlWqTpQzYP28cK5gXEkCDtfciAS6wU?=
 =?us-ascii?Q?vPaO0V83MZYSH0fha6ZE/DkI7/Imts6Mz0PdBbQSDUw44b13CjpJKkaXYxrG?=
 =?us-ascii?Q?r8B99J7Xsavu7zst4veysurnhK6cm0jgifPwwveaWPaFguKmncqT5U3d6+M7?=
 =?us-ascii?Q?cCk+OVp/Rl5Zq24U6Qs9a75zjGuDvsTCruFacLZMo4D0SmzD5gRdR8WZULVE?=
 =?us-ascii?Q?lFYxtUE/r3AXt/11xor2gVmE1s8vl5z6gkh4TPyszsTh1GmO1tdcbisDVZkk?=
 =?us-ascii?Q?mHNP6YhjN8JsWxJz86HEu4e2/OBEqfR8YgfnrlIdJq6G2NDw+WiWSS5F5PVb?=
 =?us-ascii?Q?q0eHUHmNv4j49VAq5iDs2t00Oah/Rq4HEt6bvtVk/VWPh/UrcDSIqzyXpRjT?=
 =?us-ascii?Q?4fnufFByRtf0qIp2P9/ZqNpbjlFv/5P1q2PyZ6D/dcC5Pydr9t7WZ7QFOcnU?=
 =?us-ascii?Q?HRRTzFdc7qH+vRQe6Zkg91yGvC4w2qFS5YLSRVNNBabzlEC1S7UyAdGUhazh?=
 =?us-ascii?Q?tnh3j/+7cCQHzhyQvCtQ709nEpA7m9N1zwPOnuzCar5j3SfMNsmbe376S2Oz?=
 =?us-ascii?Q?6eDH0JjDmzJJzbJ5U6uhYP+Lgp4e3avmBLoSPnWRBOqnLFhsfpykIRh2aSHh?=
 =?us-ascii?Q?I3QpT8tBjApa3esY5XkZnlwpX0r0yLsor+AL38OJEGEpPoXxLUh/i7P/BtF3?=
 =?us-ascii?Q?w62HgHFcrDopk5i9FgR6GUG86Z99mMOHH9/6yVFty3TOpsdTAVCdS/eA7aKe?=
 =?us-ascii?Q?bwsh3vGjURM2QyJztITA7oXnt60BoU4wYeyCK4c2IBmE+CeMEQY9qvIWdmhv?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b495570-10e8-424f-57d7-08dd340e83c5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 20:11:50.2860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOfSEha/75mSKA44lmWSjb1s2sqXuNkRZGogVT+rEY+50MZT5/aNzJI/1RYm9Z7es+sLFT3M1SK5f++E4Yl1M2Csv04VV2+dzIHOZtDDQls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6243
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Alistair Popple wrote:
> Prior to freeing a block file systems supporting FS DAX must check
> that the associated pages are both unmapped from user-space and not
> undergoing DMA or other access from eg. get_user_pages(). This is
> achieved by unmapping the file range and scanning the FS DAX
> page-cache to see if any pages within the mapping have an elevated
> refcount.
> 
> This is done using two functions - dax_layout_busy_page_range() which
> returns a page to wait for the refcount to become idle on. Rather than
> open-code this introduce a common implementation to both unmap and
> wait for the page to become idle.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

After resolving my confusion about retries, you can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

...although some bikeshedding below that can take or leave as you wish.

> 
> ---
> 
> Changes for v5:
> 
>  - Don't wait for idle pages on non-DAX mappings
> 
> Changes for v4:
> 
>  - Fixed some build breakage due to missing symbol exports reported by
>    John Hubbard (thanks!).
> ---
>  fs/dax.c            | 33 +++++++++++++++++++++++++++++++++
>  fs/ext4/inode.c     | 10 +---------
>  fs/fuse/dax.c       | 27 +++------------------------
>  fs/xfs/xfs_inode.c  | 23 +++++------------------
>  fs/xfs/xfs_inode.h  |  2 +-
>  include/linux/dax.h | 21 +++++++++++++++++++++
>  mm/madvise.c        |  8 ++++----
>  7 files changed, 68 insertions(+), 56 deletions(-)
> 
> diff --git a/fs/dax.c b/fs/dax.c
> index d010c10..9c3bd07 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -845,6 +845,39 @@ int dax_delete_mapping_entry(struct address_space *mapping, pgoff_t index)
>  	return ret;
>  }
>  
> +static int wait_page_idle(struct page *page,
> +			void (cb)(struct inode *),
> +			struct inode *inode)
> +{
> +	return ___wait_var_event(page, page_ref_count(page) == 1,
> +				TASK_INTERRUPTIBLE, 0, 0, cb(inode));
> +}
> +
> +/*
> + * Unmaps the inode and waits for any DMA to complete prior to deleting the
> + * DAX mapping entries for the range.
> + */
> +int dax_break_mapping(struct inode *inode, loff_t start, loff_t end,
> +		void (cb)(struct inode *))
> +{
> +	struct page *page;
> +	int error;
> +
> +	if (!dax_mapping(inode->i_mapping))
> +		return 0;
> +
> +	do {
> +		page = dax_layout_busy_page_range(inode->i_mapping, start, end);
> +		if (!page)
> +			break;
> +
> +		error = wait_page_idle(page, cb, inode);
> +	} while (error == 0);
> +
> +	return error;
> +}
> +EXPORT_SYMBOL_GPL(dax_break_mapping);

It is not clear why this is called "mapping" vs "layout". The detail
about the file that is being "broken" is whether there are any live
subscriptions to the "layout" of the file, the pfn storage layout, not
the memory mapping.

For example the bulk of dax_break_layout() is performed after
invalidate_inode_pages() has torn down the memory mapping.

