Return-Path: <linuxppc-dev+bounces-5474-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B40A18B2F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2025 06:05:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdBpP2Fgqz2xpf;
	Wed, 22 Jan 2025 16:05:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.15
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737522301;
	cv=fail; b=Hj8S1z3Kcw0p6nImps2zmlT0TSa3lMBNhP7HvFcovOa//QlB3d5BHTAML6vg61m5cSPLI1wTzAqUaXiMIXK0PF7XYNS93O1mj5bJD07WnKH7FM+p9qYiZQr5iBtHX40FaZf6ijCpKNom78aT/BvCAfvFUkyYEqe0fNfRcO0D2urW3BY9ds4CtNx7XMm46eV5dVqdxlhqbDguvrmO48CHSmotH66u9Wax7QqtiIwj0jizx37XbkQBngGlMcwcccO6ENNPcuSHHDAxkjn6vj4apYjuu4nQgs6m1qbZ40MHqAeXseUoGT1OXpi85crZ4eZXhrKj6EgapaNvm7fgI0wCeA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737522301; c=relaxed/relaxed;
	bh=UVi4W9TpxoY2HUKdPajkyB1GOZQOGvRoPRlfpkMFJn4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QHhUdDlgWyt7tbAJUDBK8L+wR8NloqvvplGkBzy5s3nm9JUXMuGBGJzIXmmaPM97x++iQmBM83piHbR16tUmYDVtVDuuihqL+ZKBqxbZd9yPmQLfZBjhGIgTJeYeRCL9YV/JYyix6tEeqNgPOFLp/AmB6OrYT0HxzrSga9HSr+mfJ5mipGn1Ir3uOh9O5OU5lDpa+O005ffvZq5aqhgi2kHH8PjG5aHyOfBAWg4srGdNwHiHwyEPxpAr3li+fFKvpABxxyP0TvQWsPKEv5X5BkiJ7rx9uH1JkcjBAov+5Zc9Vzo8tNCyFRgAUhj4+AMsRklCtQc0fbXwvnbgOIGw3g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i5dKhynO; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i5dKhynO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Wed, 22 Jan 2025 16:04:58 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdBpL1RZmz2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 16:04:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737522299; x=1769058299;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dSF+XvR+8lMyLsj3IQmxR/D/G1wcHeFgj1LclIvUjZc=;
  b=i5dKhynOZLWmlnpix5vZFGHK7nlmkapUKlcgr/3ZVAQgEHnXIzfguvnj
   /697wK6nqboMj1em20IQ0JLvFjEROsUbrX4FOt5317jhk4hUBKXTFEfro
   ayS61kVTQZHQpMAEAF3Q444c3julNUNMYQSmypj0PFJXTLifoblYwcmdc
   DT3nOuaeG4k2Ib4/GPeE9aE/+rTAXANZ4B6xSczGIxFR2iM2qjKD0FmFM
   d9A1xuzLArd/nznaXK45C0hOlccRUhmNbYJTsJHo/4NzYBBJwvKsjb5dg
   Jf4Lra2uceiKOkaOhJFlK3oJqH+Xcz/RUPEgOcog21nBhoyn3SXPJ7ho/
   w==;
X-CSE-ConnectionGUID: jX1nVdggRN6akhbnangj3A==
X-CSE-MsgGUID: F+QulKYCRSWtKvozzofG2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38137343"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="38137343"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 21:03:49 -0800
X-CSE-ConnectionGUID: TAVW3Da7SEe5dyoEQj9snQ==
X-CSE-MsgGUID: CNoSS6mnTDW526xdBvxixA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111042932"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Jan 2025 21:03:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 21:03:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 21:03:47 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 21:03:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ps7r+QkPHnq0HQaFJBmR6DFpRp9/qwik1od4tyNCTfCCzr6guxh34ViSyrmBcMKHRN8Gyrak/ZNsQhPiwjVnajbOTK4xcy4NMW8tTn0C3tvu8ccOEW+fI66hSXmd98hgAFBG48rXswdFhNeIcydPgeT5T7ub1laHdrM5D8AvpY/Lpot0eD57Th/j0EgY5EY2RcfJO4DljOXNtgjvKoBlOspq8oGVdgYqYbmYKDAl8zD2vHlpG8imKFlv8wQqxZKWDwSFPdSHGxFHlIyMrhX56JKat++X2Zox1DxO2/vQLHSaH32fVVEbomqO2ChxTQzMObKtOI8D1otytL1Bchif3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVi4W9TpxoY2HUKdPajkyB1GOZQOGvRoPRlfpkMFJn4=;
 b=KfMquZ3DT6krvxII6lkKKbe98+4yOkXO9OlqxakQzgic6SHBFmXvKkB0Ls+lSy29TAfOSvVA7uPSMiLum5P8ezcVxLh6tn272n2kYqbT18A2DVzm5eD32KkRytDgsJrOcWe3RfHbB0lqBw5sv6o8vLUBnQdP4LCGntmnYK7xPyV7Wwc+ZZJTe/u97CTSjUusQw2zTZFVmkN3guTaJZuFQp2HOh4Rf6oL21xIDgut3CLPy1kjqNB5QQU2r2JDNx0Q2PDb5+qncBVddIxvRJkjjz5GteCkp7b1Vf98t18PJeRx19mn3B64baQ1w8w0Yg70n1Oa8goW3Z5Ddg9JhlZ3iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 05:03:32 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 05:03:32 +0000
Date: Wed, 22 Jan 2025 13:03:19 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <mark.barnett@arm.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
	<acme@kernel.org>, <namhyung@kernel.org>, <irogers@google.com>,
	<ben.gainey@arm.com>, <deepak.surti@arm.com>, <ak@linux.intel.com>,
	<will@kernel.org>, <james.clark@arm.com>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<adrian.hunter@intel.com>, <linux-arm-kernel@lists.infradead.org>, "Mark
 Barnett" <mark.barnett@arm.com>, <oliver.sang@intel.com>
Subject: Re: [PATCH v2 5/5] perf: Record sample last_period before updating
Message-ID: <202501221114.c06f7c72-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250106120156.227273-6-mark.barnett@arm.com>
X-ClientProxiedBy: SG2PR06CA0196.apcprd06.prod.outlook.com (2603:1096:4:1::28)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SN7PR11MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 4880c05e-e8a0-481d-92a6-08dd3aa21e0b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2gS5y2bjrZJqdqHB8yFzjkDbOYXukDKB3EwhPIPZXEjxIX1MNWbaAaoOtW9p?=
 =?us-ascii?Q?dZlt7WZ/NT0LUM8mMuA82PLIcNhxs7FZeb0THfzh1diAFOhF93k23Z7s3SWp?=
 =?us-ascii?Q?clm8Tqf3PmMAN2Dqh1ck2BWd6gNxQebTTyrE+DeiPiPgeKd6viUWBpV6a4r4?=
 =?us-ascii?Q?CwcM8lLkLvj2uuoQiaXkxLlYb8zQFdL/Sjwep94LzAT3aPFReZMg7xg3LZWH?=
 =?us-ascii?Q?aWVL2SUgA452dSRts2AOyT2yX4g0Y2sOrXE0UnqkFXaYWb+OC5OsdfMRjajF?=
 =?us-ascii?Q?3w42Kcp/vQDOUc1zNShCXSy52vGob6YdU+BaPjhp1flQRg7bVRH2wpbf5aQ1?=
 =?us-ascii?Q?woY/iMTIpzFAmQYSe1rNjVPF6gvvWf5dQKMbo7OZKhSfBe71i8tMORuSNFNr?=
 =?us-ascii?Q?tCyeETcGSnQjd0N8+JgA6latgnxJTp7H22flmNo9h7g0Caoyq9t8gjBnQvMy?=
 =?us-ascii?Q?wYptRg3uxq7viM228orL0I9AflV7v3Rsif7wGrIrwe0zKogLirGYJhzh4GWL?=
 =?us-ascii?Q?QGgn256/5WRqwj7OOnWPQ23qpzu76d4dZdIJ//GkdSXkoiPv9E/DuOLZEx9q?=
 =?us-ascii?Q?dtpdnW5TmxhObbb/LuQbvwFXMty3VJ4JAaM3JN2tuqyRdUYIdo89xEgB2QHe?=
 =?us-ascii?Q?otm8//ykF9PNUQSYlBSsMLfQ08c0Nj7ZYn3gUMXpveMEPtFL6pBr/ylDHKeJ?=
 =?us-ascii?Q?gZT0kQTlB/r/jbCiIk0KlCEGeW7OdON1eNooc5ssbcLxyszejO41FzfZzvwh?=
 =?us-ascii?Q?1FBfaunM3CHnbnN3SfO3LnC+UCs2UOR+pG3zDfZrgKzYLhHHZzuAh2iNbpj+?=
 =?us-ascii?Q?DmQpphHgYpngjeu2xY7HE4GHoki+3/PfgVvrfNa8ELzbexkcHMzl1+9NIKWW?=
 =?us-ascii?Q?9rBUqc9nOy6R1YdOOt8ioXXjDOS3RZr6NPlgxV/7ktwYAEfj2K4NNgxkf/NY?=
 =?us-ascii?Q?dK89KNIpJclbKRrAhJ9Y1znwzGEQRSlOriHweFssuhxMlenogGw2HXyr6lBQ?=
 =?us-ascii?Q?llbdqbon52Qkx3KJr33E5CIF4iMYFVQws97VPWftbyqUExF9SlhJuRZ4lqEF?=
 =?us-ascii?Q?jwMWquPWyX7E5uAjThEqg30StSpBHlVDi83QZnmzpArvLbXdIpklRW1ajZhX?=
 =?us-ascii?Q?or4VJZmrtTBXtPnR8Kc5QU+ZOw/m0Mx4rLqel53r/PBLrOvVdcwqTwjdn+MJ?=
 =?us-ascii?Q?lMQ7eqiFKTEjIQflZVCCB0KgEkLmu12ajSGnUwx5LtNUqV+g+5L5iJBC9fXu?=
 =?us-ascii?Q?LNytSWlkpHQ7YSL+R8uumQi2/2PJWlMPOZHIVQ7ACoU5cR5fb0x8R3fIwBKs?=
 =?us-ascii?Q?RPEp980u761e7WS1bZrpBpcmliQbzPEmmmpkvfGAitStCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KPPDA6ePPB+O1VyQb7WoaGt8VZIIMEt+tmsdvD3qxEIOPO5LtsNuRjzXLnjd?=
 =?us-ascii?Q?qVeFpgPesBW4ih7OGNJh9VYk+ILMziIdFTzl2NdNqgPWS2jNXAsGGyBtq4a4?=
 =?us-ascii?Q?T584Ex7XIPyTfe3HparT81lGp2l0sS7x6z5fRlxvdwtVHxaFXD0ywEqtQOux?=
 =?us-ascii?Q?ocjWoiGd6XqDYvM+abNvEeXr3XEqICD+wHmww8BeqVwMRJaa0Gyg5HkFz38f?=
 =?us-ascii?Q?6nSnFiMqMWqtSbgGG/87XhNtYCiFcQmelMTFjBKFJGXWMQDBsRqtoS/t+NEv?=
 =?us-ascii?Q?MyNvRjxKmCWfnBTsd4OoUqb77UtZT1f48q4nJ1kfkUcmNAe+SHhxvQOZy+Wy?=
 =?us-ascii?Q?jLyn6AMtPZ+pANRL62pdYg9LmZAG6PNeV/XmiM27pUAadaERzuQUVDmW6HY5?=
 =?us-ascii?Q?+bYqZGD3z6BaoQrXliifQSfP7InUEOE/Z/4emHFvvWTMvdUQ4GmaEU72mx8N?=
 =?us-ascii?Q?127kzzlAQVN10c+sapbQew9lV59CzBTS3i9TQxO+s5XGbzAbXY8Euu7jsDiu?=
 =?us-ascii?Q?fO0Eh0JXzlIJH93O5cwAA5gjKvGOuq/h07e1GmA5rnMCiBLRd67vnp4syUSd?=
 =?us-ascii?Q?qLxr9kIdFph3z8izs405ul3HumcG4+MRoJhXrFj2REkTvzMfuC+hIgEk3Asj?=
 =?us-ascii?Q?Hg29n9Z1Im+Nv+hBDwUKaiCXA6s0ubofk/AxpwGC/Qb7IivnnB9LPpIZmUn2?=
 =?us-ascii?Q?sxZ+9ij3C1heVByJEbiGlgdVky5a49p/hW69zqhAdp7eAvpSCQ7dG+CDzCMn?=
 =?us-ascii?Q?z9yo8X5Y7qru769ACnFmU/2wFQFYZ6LhOAtkbs4VUDbU7LLG4lscIJr3bi0J?=
 =?us-ascii?Q?3+PWOnVIwdUKqqsr+Z/rswrApaRs31pwJuK+K4xB9MJeF57rLEWe+kuqW6z8?=
 =?us-ascii?Q?81+41XXPlW8tsFV1JN3D1NPhmeqPT1vWyvKXnjLWOecBevXFNspM2+J/tkHY?=
 =?us-ascii?Q?BJaDADqN3L9SD3iVleejThiShk3GCZdmgW/jQ/j9Atua3/HnojN3oRK6kXnE?=
 =?us-ascii?Q?SYUh9FKVOvuBGuCIgs127kNdWntfd/zYmV8aqGTqFf7c3Jx0beYW6/yU2ikT?=
 =?us-ascii?Q?iGmUV/hNpWPD+1lJcNndu9bE2YwftQQILL/s8WrhxYy2XUMNsheNNCpDG7CK?=
 =?us-ascii?Q?HmI8l5wjA9bFrWQqLqTsrFvYGMWpQO3Pq/hkm7oKotcP+7tdM9/kJ5KsmTzm?=
 =?us-ascii?Q?7CzhPPy9Fq0ji51cvb0Xr0Fx7x0f9Kew2qtzy8qbKUqyZsRLvTpzNGDua0WD?=
 =?us-ascii?Q?HlOTTU13lvP75/5vbXySzaIZ3zOAJ0/mOxnBv76gmydqgQKRNYWuVPjTBOOc?=
 =?us-ascii?Q?MRGl5BXxHRninoTKd9ynulF+miGUhxp2cI4g8nI1qDx1Y9WjdTFvmxCJRecs?=
 =?us-ascii?Q?FSMW3wdWGiTDXYV7AQpjmzFllRVIoC9FUoAjZw1ikDdz8KJNH5e0hw5Zo+a+?=
 =?us-ascii?Q?akDfseh07vcPJhIbpX36q4ZEIT9+u5wpPfRzMrS5p2u96uWiBM5sG7IAbnxJ?=
 =?us-ascii?Q?SE+3jZ5Zko21a5zJDjKS2GodSqhMQpFUJ/a5LnmeLlses64ekrrtjvgA/VeW?=
 =?us-ascii?Q?Z08r+mW3MNEgEBPuLqGfe1ICdD4MV4bbN/kvVl9mRblWUj2io5AzuRe7UdzG?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4880c05e-e8a0-481d-92a6-08dd3aa21e0b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 05:03:32.1048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EwO/oE53Njm560PmQaWWM/QuQSe2zRY7GjBC8vwa1Aei17Z9G8UbaSDkG+zt+uG+NF8lCSxJ5k3ua7aemc8eWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6774
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Hello,

kernel test robot noticed "BUG:KASAN:null-ptr-deref_in_handle_pmi_common" o=
n:

commit: b16c01fbc96460a72789c04e0e2a8f8437eab05b ("[PATCH v2 5/5] perf: Rec=
ord sample last_period before updating")
url: https://github.com/intel-lab-lkp/linux/commits/mark-barnett-arm-com/pe=
rf-Allow-periodic-events-to-alternate-between-two-sample-periods/20250106-2=
03820
base: https://git.kernel.org/cgit/linux/kernel/git/perf/perf-tools-next.git=
 perf-tools-next
patch link: https://lore.kernel.org/all/20250106120156.227273-6-mark.barnet=
t@arm.com/
patch subject: [PATCH v2 5/5] perf: Record sample last_period before updati=
ng

in testcase: kernel-selftests-bpf
version:=20
with following parameters:

	group: bpf



config: x86_64-rhel-9.4-bpf
compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz (=
Kaby Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202501221114.c06f7c72-lkp@intel.co=
m



[ 1693.204121][    C3] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[ 1693.204127][    C3] BUG: KASAN: null-ptr-deref in handle_pmi_common+0x21=
8/0x630
[ 1693.204138][    C3] Read of size 8 at addr 0000000000000200 by task (ude=
v-worker)/62767
[ 1693.204143][    C3]=20
[ 1693.204146][    C3] CPU: 3 UID: 0 PID: 62767 Comm: (udev-worker) Tainted=
: G S         OE      6.13.0-rc2-00267-gb16c01fbc964 #1
[ 1693.204156][    C3] Tainted: [S]=3DCPU_OUT_OF_SPEC, [O]=3DOOT_MODULE, [E=
]=3DUNSIGNED_MODULE
[ 1693.204159][    C3] Hardware name: Dell Inc. OptiPlex 7050/062KRH, BIOS =
1.2.0 12/22/2016
[ 1693.204163][    C3] Call Trace:
[ 1693.204166][    C3]  <NMI>
[ 1693.204169][    C3]  dump_stack_lvl+0x62/0x90
[ 1693.204178][    C3]  kasan_report+0xb9/0xf0
[ 1693.204189][    C3]  ? handle_pmi_common+0x218/0x630
[ 1693.204202][    C3]  handle_pmi_common+0x218/0x630
[ 1693.204216][    C3]  ? __pfx_handle_pmi_common+0x10/0x10
[ 1693.204239][    C3]  ? rcu_is_watching+0x1c/0x50
[ 1693.204245][    C3]  ? trace_lock_acquire+0x118/0x150
[ 1693.204255][    C3]  ? intel_bts_interrupt+0xcc/0x270
[ 1693.204264][    C3]  ? __pfx_intel_bts_interrupt+0x10/0x10
[ 1693.204279][    C3]  intel_pmu_handle_irq+0x152/0x320
[ 1693.204290][    C3]  perf_event_nmi_handler+0x37/0x60
[ 1693.204299][    C3]  nmi_handle+0xb2/0x240
[ 1693.204311][    C3]  default_do_nmi+0x45/0x110
[ 1693.204321][    C3]  exc_nmi+0x100/0x190
[ 1693.204329][    C3]  end_repeat_nmi+0xf/0x53
[ 1693.204335][    C3] RIP: 0010:kasan_check_range+0x38/0x1b0
[ 1693.204344][    C3] Code: 44 0f b6 c2 48 01 f0 55 53 0f 82 d7 00 00 00 e=
b 0f cc cc cc 48 b8 00 00 00 00 00 00 00 ff eb 0a 48 b8 00 00 00 00 00 80 f=
f ff <48> 39 c7 0f 82 b3 00 00 00 4c 8d 54 37 ff 48 89 fd 48 b8 00 00 00
[ 1693.204349][    C3] RSP: 0018:ffff8882c850f9b8 EFLAGS: 00000086
[ 1693.204355][    C3] RAX: ffff800000000000 RBX: 000000000000001b RCX: fff=
fffff812458aa
[ 1693.204359][    C3] RDX: 0000000000000000 RSI: 0000000000000008 RDI: fff=
fffff86ee1140
[ 1693.204363][    C3] RBP: 0000000000000009 R08: 0000000000000000 R09: fff=
ffbfff0ddc234
[ 1693.204367][    C3] R10: ffffffff86ee11a7 R11: 0000000000000000 R12: fff=
f888107450f08
[ 1693.204371][    C3] R13: 0000000000000200 R14: ffff888107450000 R15: fff=
f888107450f28
[ 1693.204381][    C3]  ? mark_lock+0x6a/0x530
[ 1693.204393][    C3]  ? kasan_check_range+0x38/0x1b0
[ 1693.204403][    C3]  ? kasan_check_range+0x38/0x1b0
[ 1693.204413][    C3]  </NMI>
[ 1693.204415][    C3]  <TASK>
[ 1693.204419][    C3]  mark_lock+0x6a/0x530
[ 1693.204430][    C3]  mark_usage+0xbb/0x1a0
[ 1693.204439][    C3]  __lock_acquire+0x50e/0xf90
[ 1693.204451][    C3]  ? rcu_is_watching+0x1c/0x50
[ 1693.204459][    C3]  lock_acquire+0x123/0x2e0
[ 1693.204468][    C3]  ? bpf_trace_run2+0x115/0x310
[ 1693.204479][    C3]  ? __pfx_lock_acquire+0x10/0x10
[ 1693.204491][    C3]  ? lock_acquire+0x123/0x2e0
[ 1693.204499][    C3]  ? __might_fault+0x74/0xc0
[ 1693.204509][    C3]  ? find_held_lock+0x83/0xa0
[ 1693.204519][    C3]  bpf_trace_run2+0x129/0x310
[ 1693.204526][    C3]  ? bpf_trace_run2+0x115/0x310
[ 1693.204534][    C3]  ? __pfx_bpf_trace_run2+0x10/0x10
[ 1693.204541][    C3]  ? lock_is_held_type+0x9a/0x110
[ 1693.204551][    C3]  ? __might_fault+0x74/0xc0
[ 1693.204562][    C3]  __bpf_trace_sys_enter+0x33/0x60
[ 1693.204570][    C3]  syscall_trace_enter+0x1b8/0x260
[ 1693.204579][    C3]  do_syscall_64+0x139/0x170
[ 1693.204585][    C3]  ? __pfx___lock_release+0x10/0x10
[ 1693.204600][    C3]  ? __might_fault+0x74/0xc0
[ 1693.204609][    C3]  ? rcu_is_watching+0x1c/0x50
[ 1693.204615][    C3]  ? trace_rseq_update+0xb9/0xf0
[ 1693.204624][    C3]  ? __rseq_handle_notify_resume+0x321/0x3a0
[ 1693.204632][    C3]  ? do_epoll_wait+0xd1/0xf0
[ 1693.204642][    C3]  ? __pfx___rseq_handle_notify_resume+0x10/0x10
[ 1693.204652][    C3]  ? __might_fault+0x74/0xc0
[ 1693.204661][    C3]  ? rcu_is_watching+0x1c/0x50
[ 1693.204667][    C3]  ? mark_held_locks+0x24/0x90
[ 1693.204677][    C3]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[ 1693.204687][    C3]  ? syscall_exit_to_user_mode+0xa2/0x2a0
[ 1693.204694][    C3]  ? do_syscall_64+0x98/0x170
[ 1693.204699][    C3]  ? mark_held_locks+0x24/0x90
[ 1693.204709][    C3]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[ 1693.204718][    C3]  ? syscall_exit_to_user_mode+0xa2/0x2a0
[ 1693.204723][    C3]  ? do_syscall_64+0x98/0x170
[ 1693.204726][    C3]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[ 1693.204731][    C3] RIP: 0033:0x7fcc237cb899
[ 1693.204734][    C3] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 0=
0 00 80 3d 51 fd 0c 00 00 41 89 ca 74 1c 45 31 c9 45 31 c0 b8 2d 00 00 00 0=
f 05 <48> 3d 00 f0 ff ff 77 67 c3 66 0f 1f 44 00 00 55 48 83 ec 20 48 89
[ 1693.204737][    C3] RSP: 002b:00007ffeb82d1788 EFLAGS: 00000246 ORIG_RAX=
: 000000000000002d
[ 1693.204741][    C3] RAX: ffffffffffffffda RBX: 000000000000001d RCX: 000=
07fcc237cb899
[ 1693.204743][    C3] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000=
000000000001d
[ 1693.204745][    C3] RBP: 00007ffeb82d1970 R08: 0000000000000000 R09: 000=
0000000000000
[ 1693.204747][    C3] R10: 0000000000000022 R11: 0000000000000246 R12: 000=
07ffeb82d1980
[ 1693.204749][    C3] R13: 00007ffeb82d19c8 R14: 000055d5d68d8a50 R15: 000=
0000000000000
[ 1693.204755][    C3]  </TASK>
[ 1693.204757][    C3] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[ 1693.204758][    C3] Disabling lock debugging due to kernel taint
[ 1693.204761][    C3] BUG: kernel NULL pointer dereference, address: 00000=
00000000200
[ 1693.204762][    C3] #PF: supervisor read access in kernel mode
[ 1693.204764][    C3] #PF: error_code(0x0000) - not-present page
[ 1693.204766][    C3] PGD 0 P4D 0=20
[ 1693.204769][    C3] Oops: Oops: 0000 [#1] PREEMPT SMP KASAN PTI
[ 1693.204772][    C3] CPU: 3 UID: 0 PID: 62767 Comm: (udev-worker) Tainted=
: G S  B      OE      6.13.0-rc2-00267-gb16c01fbc964 #1
[ 1693.204778][    C3] Tainted: [S]=3DCPU_OUT_OF_SPEC, [B]=3DBAD_PAGE, [O]=
=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
[ 1693.204779][    C3] Hardware name: Dell Inc. OptiPlex 7050/062KRH, BIOS =
1.2.0 12/22/2016
[ 1693.204781][    C3] RIP: 0010:handle_pmi_common+0x222/0x630
[ 1693.204785][    C3] Code: 74 24 48 41 83 c5 01 4b 8d 3c f4 e8 e8 02 6a 0=
0 4f 8b 3c f4 49 8d bf 00 02 00 00 e8 d8 02 6a 00 48 8b 54 24 40 be 08 00 0=
0 00 <49> 8b 87 00 02 00 00 48 89 44 24 38 4c 89 f0 48 c1 e8 06 48 8d 3c
[ 1693.204788][    C3] RSP: 0018:fffffe00000e6b80 EFLAGS: 00010086
[ 1693.204790][    C3] RAX: 0000000000000001 RBX: 1fffffc00001cd7c RCX: fff=
fffff81144e56
[ 1693.204792][    C3] RDX: ffff8887337a9e80 RSI: 0000000000000008 RDI: fff=
fffff867c2f80
[ 1693.204794][    C3] RBP: fffffe00000e6df0 R08: 0000000000000001 R09: fff=
ffbfff0cf85f0
[ 1693.204796][    C3] R10: ffffffff867c2f87 R11: 0000000000000001 R12: fff=
f8887337a9c80
[ 1693.204798][    C3] R13: 0000000000000001 R14: 0000000000000000 R15: 000=
0000000000000
[ 1693.204800][    C3] FS:  00007fcc230b18c0(0000) GS:ffff888733780000(0000=
) knlGS:0000000000000000
[ 1693.204803][    C3] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1693.204805][    C3] CR2: 0000000000000200 CR3: 000000034bbd6006 CR4: 000=
00000003726f0
[ 1693.204807][    C3] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[ 1693.204808][    C3] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[ 1693.204810][    C3] Call Trace:
[ 1693.204811][    C3]  <NMI>
[ 1693.204813][    C3]  ? __die+0x1f/0x60
[ 1693.204817][    C3]  ? page_fault_oops+0x8d/0xc0
[ 1693.204822][    C3]  ? exc_page_fault+0x57/0xe0
[ 1693.204827][    C3]  ? asm_exc_page_fault+0x22/0x30
[ 1693.204834][    C3]  ? add_taint+0x26/0x90
[ 1693.204842][    C3]  ? handle_pmi_common+0x222/0x630
[ 1693.204856][    C3]  ? __pfx_handle_pmi_common+0x10/0x10
[ 1693.204879][    C3]  ? rcu_is_watching+0x1c/0x50
[ 1693.204885][    C3]  ? trace_lock_acquire+0x118/0x150
[ 1693.204894][    C3]  ? intel_bts_interrupt+0xcc/0x270
[ 1693.204904][    C3]  ? __pfx_intel_bts_interrupt+0x10/0x10
[ 1693.204918][    C3]  intel_pmu_handle_irq+0x152/0x320
[ 1693.204928][    C3]  perf_event_nmi_handler+0x37/0x60
[ 1693.204936][    C3]  nmi_handle+0xb2/0x240
[ 1693.204947][    C3]  default_do_nmi+0x45/0x110
[ 1693.204955][    C3]  exc_nmi+0x100/0x190
[ 1693.204964][    C3]  end_repeat_nmi+0xf/0x53
[ 1693.204969][    C3] RIP: 0010:kasan_check_range+0x38/0x1b0
[ 1693.204977][    C3] Code: 44 0f b6 c2 48 01 f0 55 53 0f 82 d7 00 00 00 e=
b 0f cc cc cc 48 b8 00 00 00 00 00 00 00 ff eb 0a 48 b8 00 00 00 00 00 80 f=
f ff <48> 39 c7 0f 82 b3 00 00 00 4c 8d 54 37 ff 48 89 fd 48 b8 00 00 00
[ 1693.204982][    C3] RSP: 0018:ffff8882c850f9b8 EFLAGS: 00000086
[ 1693.204987][    C3] RAX: ffff800000000000 RBX: 000000000000001b RCX: fff=
fffff812458aa
[ 1693.204991][    C3] RDX: 0000000000000000 RSI: 0000000000000008 RDI: fff=
fffff86ee1140
[ 1693.204995][    C3] RBP: 0000000000000009 R08: 0000000000000000 R09: fff=
ffbfff0ddc234
[ 1693.204999][    C3] R10: ffffffff86ee11a7 R11: 0000000000000000 R12: fff=
f888107450f08
[ 1693.205003][    C3] R13: 0000000000000200 R14: ffff888107450000 R15: fff=
f888107450f28
[ 1693.205012][    C3]  ? mark_lock+0x6a/0x530
[ 1693.205023][    C3]  ? kasan_check_range+0x38/0x1b0
[ 1693.205034][    C3]  ? kasan_check_range+0x38/0x1b0
[ 1693.205044][    C3]  </NMI>
[ 1693.205046][    C3]  <TASK>
[ 1693.205049][    C3]  mark_lock+0x6a/0x530
[ 1693.205060][    C3]  mark_usage+0xbb/0x1a0
[ 1693.205069][    C3]  __lock_acquire+0x50e/0xf90
[ 1693.205081][    C3]  ? rcu_is_watching+0x1c/0x50
[ 1693.205090][    C3]  lock_acquire+0x123/0x2e0
[ 1693.205098][    C3]  ? bpf_trace_run2+0x115/0x310
[ 1693.205108][    C3]  ? __pfx_lock_acquire+0x10/0x10
[ 1693.205120][    C3]  ? lock_acquire+0x123/0x2e0
[ 1693.205128][    C3]  ? __might_fault+0x74/0xc0
[ 1693.205137][    C3]  ? find_held_lock+0x83/0xa0
[ 1693.205147][    C3]  bpf_trace_run2+0x129/0x310
[ 1693.205154][    C3]  ? bpf_trace_run2+0x115/0x310
[ 1693.205161][    C3]  ? __pfx_bpf_trace_run2+0x10/0x10
[ 1693.205168][    C3]  ? lock_is_held_type+0x9a/0x110
[ 1693.205177][    C3]  ? __might_fault+0x74/0xc0
[ 1693.205189][    C3]  __bpf_trace_sys_enter+0x33/0x60
[ 1693.205196][    C3]  syscall_trace_enter+0x1b8/0x260
[ 1693.205205][    C3]  do_syscall_64+0x139/0x170
[ 1693.205211][    C3]  ? __pfx___lock_release+0x10/0x10
[ 1693.205225][    C3]  ? __might_fault+0x74/0xc0
[ 1693.205234][    C3]  ? rcu_is_watching+0x1c/0x50
[ 1693.205240][    C3]  ? trace_rseq_update+0xb9/0xf0
[ 1693.205248][    C3]  ? __rseq_handle_notify_resume+0x321/0x3a0
[ 1693.205255][    C3]  ? do_epoll_wait+0xd1/0xf0
[ 1693.205264][    C3]  ? __pfx___rseq_handle_notify_resume+0x10/0x10
[ 1693.205273][    C3]  ? __might_fault+0x74/0xc0
[ 1693.205281][    C3]  ? rcu_is_watching+0x1c/0x50
[ 1693.205287][    C3]  ? mark_held_locks+0x24/0x90
[ 1693.205297][    C3]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[ 1693.205306][    C3]  ? syscall_exit_to_user_mode+0xa2/0x2a0
[ 1693.205313][    C3]  ? do_syscall_64+0x98/0x170
[ 1693.205318][    C3]  ? mark_held_locks+0x24/0x90
[ 1693.205328][    C3]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[ 1693.205336][    C3]  ? syscall_exit_to_user_mode+0xa2/0x2a0
[ 1693.205343][    C3]  ? do_syscall_64+0x98/0x170
[ 1693.205350][    C3]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[ 1693.205359][    C3] RIP: 0033:0x7fcc237cb899
[ 1693.205363][    C3] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 0=
0 00 80 3d 51 fd 0c 00 00 41 89 ca 74 1c 45 31 c9 45 31 c0 b8 2d 00 00 00 0=
f 05 <48> 3d 00 f0 ff ff 77 67 c3 66 0f 1f 44 00 00 55 48 83 ec 20 48 89
[ 1693.205369][    C3] RSP: 002b:00007ffeb82d1788 EFLAGS: 00000246 ORIG_RAX=
: 000000000000002d
[ 1693.205374][    C3] RAX: ffffffffffffffda RBX: 000000000000001d RCX: 000=
07fcc237cb899
[ 1693.205379][    C3] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000=
000000000001d
[ 1693.205382][    C3] RBP: 00007ffeb82d1970 R08: 0000000000000000 R09: 000=
0000000000000
[ 1693.205386][    C3] R10: 0000000000000022 R11: 0000000000000246 R12: 000=
07ffeb82d1980
[ 1693.205389][    C3] R13: 00007ffeb82d19c8 R14: 000055d5d68d8a50 R15: 000=
0000000000000
[ 1693.205402][    C3]  </TASK>
[ 1693.205404][    C3] Modules linked in: cls_matchall tls sch_fq 8021q gar=
p mrp stp llc dummy tun ipip tunnel4 ip_tunnel iptable_raw xt_connmark bpf_=
testmod(OE) veth cls_bpf sch_ingress rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_=
resolver openvswitch nf_conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_def=
rag_ipv4 psample snd_hda_codec_hdmi snd_ctl_led intel_rapl_msr intel_rapl_c=
ommon intel_uncore_frequency intel_uncore_frequency_common snd_hda_codec_re=
altek snd_hda_codec_generic snd_hda_scodec_component btrfs blake2b_generic =
x86_pkg_temp_thermal xor zstd_compress intel_powerclamp raid6_pq libcrc32c =
snd_soc_avs snd_soc_hda_codec snd_hda_ext_core coretemp i915 snd_soc_core s=
d_mod snd_compress cec kvm_intel sg snd_hda_intel drm_buddy snd_intel_dspcf=
g ttm snd_intel_sdw_acpi kvm snd_hda_codec crct10dif_pclmul drm_display_hel=
per crc32_pclmul crc32c_intel snd_hda_core ghash_clmulni_intel dell_pc dell=
_wmi drm_kms_helper snd_hwdep mei_wdt i2c_designware_platform rapl snd_pcm =
intel_gtt ipmi_devintf platform_profile i2c_designware_core
[ 1693.205551][    C3]  intel_cstate snd_timer dell_wmi_aio agpgart ahci de=
ll_smbios ipmi_msghandler wmi_bmof dell_wmi_descriptor sparse_keymap dcdbas=
 libahci mei_me snd video i2c_i801 pcspkr intel_uncore intel_lpss_pci libat=
a intel_lpss mei i2c_smbus soundcore idma64 intel_pmc_core intel_vsec pmt_t=
elemetry wmi pinctrl_sunrisepoint pmt_class acpi_pad binfmt_misc drm dm_mod=
 ip_tables x_tables sch_fq_codel [last unloaded: bpf_test_no_cfi(OE)]
[ 1693.205635][    C3] CR2: 0000000000000200
[ 1693.205638][    C3] ---[ end trace 0000000000000000 ]---
[ 1693.205641][    C3] RIP: 0010:handle_pmi_common+0x222/0x630
[ 1693.205648][    C3] Code: 74 24 48 41 83 c5 01 4b 8d 3c f4 e8 e8 02 6a 0=
0 4f 8b 3c f4 49 8d bf 00 02 00 00 e8 d8 02 6a 00 48 8b 54 24 40 be 08 00 0=
0 00 <49> 8b 87 00 02 00 00 48 89 44 24 38 4c 89 f0 48 c1 e8 06 48 8d 3c
[ 1693.205653][    C3] RSP: 0018:fffffe00000e6b80 EFLAGS: 00010086
[ 1693.205658][    C3] RAX: 0000000000000001 RBX: 1fffffc00001cd7c RCX: fff=
fffff81144e56
[ 1693.205662][    C3] RDX: ffff8887337a9e80 RSI: 0000000000000008 RDI: fff=
fffff867c2f80
[ 1693.205666][    C3] RBP: fffffe00000e6df0 R08: 0000000000000001 R09: fff=
ffbfff0cf85f0
[ 1693.205670][    C3] R10: ffffffff867c2f87 R11: 0000000000000001 R12: fff=
f8887337a9c80
[ 1693.205673][    C3] R13: 0000000000000001 R14: 0000000000000000 R15: 000=
0000000000000
[ 1693.205677][    C3] FS:  00007fcc230b18c0(0000) GS:ffff888733780000(0000=
) knlGS:0000000000000000
[ 1693.205681][    C3] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1693.205685][    C3] CR2: 0000000000000200 CR3: 000000034bbd6006 CR4: 000=
00000003726f0
[ 1693.205688][    C3] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[ 1693.205691][    C3] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[ 1693.205695][    C3] Kernel panic - not syncing: Fatal exception in inter=
rupt
[ 1693.205723][    C3] Kernel Offset: disabled



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250122/202501221114.c06f7c72-lkp@=
intel.com



--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


