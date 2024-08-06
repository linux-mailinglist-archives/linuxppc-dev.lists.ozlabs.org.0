Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F9B949827
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 21:22:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AggrUPXi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wdjr657yZz2yhZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 05:22:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AggrUPXi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdjqP1wkGz3cR3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 05:22:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722972129; x=1754508129;
  h=date:from:to:subject:message-id:references:in-reply-to:
   mime-version;
  bh=AUMs3IX5x4G0WUUmJkQK5+pCE5e0C8e+M1MyqlXq11U=;
  b=AggrUPXi7eYgV33pnStKvLNXdD/tQSxRDOLRmLHcedsLQRuso2CdKno6
   qiTwVebvgq2wlccwjmsYSSGOU/CGTkhNYj6cmRmh1kGpXkvW0OROR02OQ
   WKCiXezkuZFAfRtLb41Ap5Em3msl1stvjUp/wAz+5Jtd5EyzCfAK5I2tO
   09bWubqmhA6cPyV2JfkRQ7RqgxhPImZJbsM5TV066lpjhBlHEwO2FMGjV
   pFCFn0cKaF1yHvBSFT0Z0fpBn+YMhNsKSJ2dlD2KSglwLIL8C/zVGRbVX
   2CR57af2qtqvzx+A05ci1VwwSWEWtN+PUJGhsyUGWwdTCJCMHRKihJb4R
   w==;
X-CSE-ConnectionGUID: exyhXO8sQDKj7wGKWcmbag==
X-CSE-MsgGUID: Q1OWC+fnThCGAKPYQSCi0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="24779223"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="24779223"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 12:22:02 -0700
X-CSE-ConnectionGUID: 3SwlQ9ZXQYS2urGVJleTSg==
X-CSE-MsgGUID: VAqaaWHlQrKUetCzT6BmuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="79864109"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Aug 2024 12:22:03 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 12:22:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 12:22:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 12:22:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gt/dH4jIGIpxyaLM3Xp1uL78dl1l3yA/YiWB/fv1A45CkSQrz+ehc9CD3sWbxLxYN/ng/tGORFVeFMwwhO9Pey25qTwWpGnBZNr/GMLUKMrfxDEgFe4V+7p8p5CDbH2C4yu0GrwxKx6cRrIMs++Qo6jXorJZe13HBBLQk10afxmAH8hJ1axIxS8A/l9VE6gBNyAk5u9ykYnnMSunqDj0C22ffwt6w9ynheSVKabe/AN7MaQIJK2D08Nmj/pQwc5FPtpMq0f+ExK4v15Ugh/ScUv1jhqQ/6IGlv5lPRI75eSQREXx5aNtfPxqvq5zaGseq7lM1W8AXeevNPQILEPTWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hq7S1d28daJr+c06oBR5PZZBP0zl9lGti3eVKRqWqco=;
 b=H5UVaZGDIzcE5CuVlSG8LRmoY8v04L1TNUZWDnZPszKuL9LebEPbPtv1RmYNeK+JIuRYOoi1TfXuJK8zSJ7Y/E2ODm2MPyu6pmyF5akoSl2DNUxf4Wm2GZelBtyYEpi65OknPbe94IYDHbimBZdZVGoF/SLBHPi6xs50yAfo5oSzejblbSc1kiHXdwBUVtj8BfH3xx/KTFUA2z+dHO8PijItj5DIGqruUn3twaiwJxdHxDCDlE9tpIr5oUsZV2WIJTBo3pvinBOXYV81iWcjYTykprzwEzbM49sSWJQZeGyaU3yWGaVQwyZ2YKIhtGm5ptkWHqZmeCm7xv1L+SlqXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA1PR11MB6616.namprd11.prod.outlook.com (2603:10b6:806:257::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Tue, 6 Aug
 2024 19:21:59 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.7828.021; Tue, 6 Aug 2024
 19:21:58 +0000
Date: Tue, 6 Aug 2024 12:21:56 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, "Mahesh J
 Salgaonkar" <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 1/2] ACPI: extlog: Trace CPER Non-standard Section Body
Message-ID: <66b277d4ed6f_c144829421@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240527144356.246220-1-fabio.m.de.francesco@linux.intel.com>
 <20240527144356.246220-2-fabio.m.de.francesco@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240527144356.246220-2-fabio.m.de.francesco@linux.intel.com>
X-ClientProxiedBy: MW2PR16CA0054.namprd16.prod.outlook.com
 (2603:10b6:907:1::31) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA1PR11MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: edc02064-6e78-4fc7-df92-08dcb64d0aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q3KKaD+JTuJ6a2tRvzX8tY7lzIfqn0jCbwuirK6XKe410B2S1p++OmPhO+V9?=
 =?us-ascii?Q?JdKPxGzQZe+f5D2rsLsxeedlKj51s3nudiOuxselvaYqbYPj/fTNjCM9nQvd?=
 =?us-ascii?Q?rDC4ANmD1gWAbsFvE0pzk9/oO7IGcJkJfkkUYCkX5V9b3T4UV/XHXSpU93nn?=
 =?us-ascii?Q?ZJojD/MkWB8K0PJwhvf3WvnKgY1ZE0z46exIhQv2Pz/c1e535/U8UWnutEpb?=
 =?us-ascii?Q?3cOUWJgsiFJ849W/1J8rAqQvAdffc6WO+B2KNaVxKzq2ViHyqpUyRmPEUQoc?=
 =?us-ascii?Q?ajiXAbpgt3T/2Hwy1Lm9v5A4ot1WPMgzAr/XYUcxZe2qtAi8yRWGPwo5GhuP?=
 =?us-ascii?Q?K3OtDep2o9OFooF3KoKIErEF36agbXjg2zDv+3CROQo4R3eMJSks+0JSecFG?=
 =?us-ascii?Q?eHnKdEmYnLGxr4oO2nB+IPeR7xg0HHuyEAdCOQjGWIuHdVhJGTWQ1isY74X4?=
 =?us-ascii?Q?RMoRYq922TaL3rcyczCazgciajadZ+NL1pM8DgFQX9vmWTjfOHv6S2TThslu?=
 =?us-ascii?Q?JdiR4mQvYnKRkViwqZrcvJOaUbz/0khnrYF1GF47gw2LBeGm45J2SHwQvTky?=
 =?us-ascii?Q?cbcFBSLvST6N42fymFu5s4ZufL8nwe9LZ7iayq0eHTiWGQzBKeExnrdnGQoG?=
 =?us-ascii?Q?ne6ftNiYnSijfS5uRZCy4/WeULZvBndX73wASx8s0voKrFcsf37Jajhy9YcF?=
 =?us-ascii?Q?6OJtdxTLczjnRLNnw/AVEHijk54dFoEnGpazdLxyuh3++aEDD1R//DMivddk?=
 =?us-ascii?Q?24cAebiFGrDWtlhSfMcJcrd7lCHN41aPEiEpBMr7whQW0MS8SlGhkWAi5S8+?=
 =?us-ascii?Q?ZS1QgRfhpU94melRbr3Ne7I8sGVbFtN5OR7Hi9s2Bz/mqJa9dgPIWFsiFMSf?=
 =?us-ascii?Q?wB65td5mJgIGm7wGH1GLNrxcKI1tXETA/Jyfq3Ub6O4d2LxQiojECvc+clX5?=
 =?us-ascii?Q?jLNiItdKCZhpHwpURD1RgfiQSOElu25svFGixoCCR9WNJFEZFtKvuhw3MHst?=
 =?us-ascii?Q?4XjDbu2drFx8xLP9qmhPWYwm7EMDArUD4aRB7t1JdnRwJ7oeM4w19vV1BgUk?=
 =?us-ascii?Q?JCtYhG+S8YJ2e5VeABwO03tFHvnn7SKvrytG9eAwPfsoa6drY1NuOQ3UCYUH?=
 =?us-ascii?Q?W7eWRFWXAiX8Jx5aJJgbko+8cadBSJA+oxodYyQMb9ghb2+bljgN3XhBUTeE?=
 =?us-ascii?Q?Vgk9q4rTbT2SM9fn7AhSZuyTHfifiSYm8yFUbedHJ/eOYzVJdKveDIGX9YzV?=
 =?us-ascii?Q?Z60Aav3aq23qhGqSzPcXb53RcrvdxU5W4MMwm/QpaItxdI/6YKxAmPpVKTw4?=
 =?us-ascii?Q?MjIbeHd+ZLKJQrOGXD5DyTqeSg1kgRIDKcB5lT9xE0toRzO1xrZU538Rl4I2?=
 =?us-ascii?Q?y3CJWNjt1JwzVo/XeqUaLPmIj2i5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rESFE4ljys8qOy1XFixg0VH1rvwkDRtSvVaccoSbG9fvGbTBI9mT6Yfqg8/H?=
 =?us-ascii?Q?ZSMva5XQLJhctzpUDkrNRyJy89NxeYqWDo271UxN/UK0KlY5kAg+wOWCaZ8o?=
 =?us-ascii?Q?abjxyqR8Og0l7A0/lBDurZdkvFmguSI/YbSmgJElhM2gaObxLOG9Wf654N5W?=
 =?us-ascii?Q?DG5LedQhb9anOXLRVwWJHCDz4/H2wyCn0C6AA46Te3OGAJU4xFBPVwphBT20?=
 =?us-ascii?Q?dvhQC3/LhCXk7bHrCx318ICPXo/mRiX9sCBvC6KCudthLqF9Y8ICB7aZygNc?=
 =?us-ascii?Q?AD24cIU6NKEvLaPHt4X02UwtDJBdMmYngJdVCf2JKbpBCyvyKbcfwTcPTxQd?=
 =?us-ascii?Q?Tw+L5v2iflqwZeGkQOuNUGUoCFqSkCz4My5nJszwRmEff35yGyZlCmviWnDR?=
 =?us-ascii?Q?3wq0W9aOUCTGfd1Up1Q6J0gF1LzqfVwdqO8CRIpNmQwC/vI5vM1qFA4vez9c?=
 =?us-ascii?Q?acMeLDGTxDIW7i7GPYHjahYP9/Qz86WfaT2fnBSdqX7m9ebkXMy5cTgW8QcP?=
 =?us-ascii?Q?4d/muqkh2jxljqMzvW6+mXXW5r/J2KoH9kqUahfp0YmDMdOqun/YLQPPsFGl?=
 =?us-ascii?Q?Eg6MPLu7Y9yNKoV3YVhgvDpVIuiQ4XibDgHWYYaxVJmYaXgW66FZ3KWsgDIE?=
 =?us-ascii?Q?sijD3WdFP80H9B+IytfiNtRP+b3XxZ+OPuuSUnH1K6/1Z5xuSgMha/Ow65tm?=
 =?us-ascii?Q?h1yb7t4tD9tXd4CzxaibwmE/iNijYbPbhgmqU16QKLm/3ouMEqNM47cbEv4V?=
 =?us-ascii?Q?/1On/eevAqZAbRTTObAmo7iVC3ghUdMKPQqGAxqpK2aNiMVXir3QaNW/G29h?=
 =?us-ascii?Q?LiebJhGY31/DIGlXB189ipVYxzkmbiB5VKqoQ37+mHC798qiBohXDiXKfdWy?=
 =?us-ascii?Q?u2EAEGz5QXhUEumfaxHcMyCgQKgq7wXH2yjZIStNtT0xe2acpVAVpFP3j/0S?=
 =?us-ascii?Q?J0M4XmI/8LnIFrGVaTDmMgtLBfxDsJew1jJUU0CzykLnVwm9v8Ml8A29khtg?=
 =?us-ascii?Q?wUNvfw8oM7PEaNi1C18z7W4HeQ4T9yg8TDZ7miQLeo/St7JMqkZmvi9z5yAn?=
 =?us-ascii?Q?+v49o7fHfxRwmjbSxNhn36lwmaKgh36m0ocBup70725Bvr8XDuDD3WsAZo7i?=
 =?us-ascii?Q?/YnF5m26JISwgThzd3JoZfdtwRAshJ0IhCyXOMxYCWXOhCtfGiLIHCzX93Y4?=
 =?us-ascii?Q?zXQfTc/UqpaA3u5sLoYjo2FNgKCN421Tkgfz+DKVZN35nWfH45yr2NB7rN1x?=
 =?us-ascii?Q?dV0Mxle0FMIWngr55IvUyYtAFw5KB+w7rNrSPds4OR9OUSjol7z8HdwbjbuP?=
 =?us-ascii?Q?J8HeJmkEjJUwx1Zk+YxksSJotAau1InrV+pLOJNK+yyYuaDDXokyJsqtItO9?=
 =?us-ascii?Q?K4O5e0EFRWjJhF2wPEX12WaZIggtizk8mIABX6U/AakJaWWGmIt4kYZKG/1J?=
 =?us-ascii?Q?AjQkClVUEKCrLq22zYEPGvdg9rsP9u97Ki3cqCgx3VREdt45o/Cs+NXLEWXD?=
 =?us-ascii?Q?/fiH3EzNVlYgZmNUMGbpkHlk4ANPG8Xn9J2XCdsGnuNOqn1Fzb82e01nNPgL?=
 =?us-ascii?Q?s27bDYMNg59ix2OgYFquqob7Mk1kp2qz1UxRF/QmgTvjBN5dfEL0rTuc9ZDS?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edc02064-6e78-4fc7-df92-08dcb64d0aa7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 19:21:58.8900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFONW5VZk9SlJ9sO3ubsaAIUtnR93HSNpaVrZ0Rab8P0B8RgcUww2GdDMtu8GNy1qo5HwnSobNuT5azxEnOJ3z2/uUXP7mOwfKB+/IiiHQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6616
X-OriginatorOrg: intel.com
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fabio M. De Francesco wrote:
> In extlog_print(), trace "Non-standard Section Body" reported by firmware
> to the OS via Common Platform Error Record (CPER) (UEFI v2.10 Appendix N
> 2.3) to add further debug information and so to make ELOG log
> consistently with ghes_do_proc() (GHES).

I think this description could be clearer, how about:

---

ghes_do_proc() has a catch-all for unknown or unhandled CPER formats
(UEFI v2.10 Appendix N 2.3), extlog_print() does not. This gap was
noticed by a RAS test that injected CXL protocol errors which were
notified to extlog_print() via the IOMCA (I/O Machine Check
Architecture) mechanism. Bring parity to the extlog_print() path by
including a similar trace_non_standard_event().

---

> 
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> ---
>  drivers/acpi/acpi_extlog.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> index f055609d4b64..e025ae390737 100644
> --- a/drivers/acpi/acpi_extlog.c
> +++ b/drivers/acpi/acpi_extlog.c
> @@ -179,6 +179,12 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
>  			if (gdata->error_data_length >= sizeof(*mem))
>  				trace_extlog_mem_event(mem, err_seq, fru_id, fru_text,
>  						       (u8)gdata->error_severity);
> +		} else {
> +			void *err = acpi_hest_get_payload(gdata);
> +
> +			trace_non_standard_event(sec_type, fru_id, fru_text,
> +						 gdata->error_severity, err,
> +						 gdata->error_data_length);
>  		}

...with the above changelog update the code change looks good to me, you
can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
