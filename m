Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DF090FEC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 10:25:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LjaWBhZc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4YTg2pjLz3cBx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 18:25:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LjaWBhZc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=yu.c.chen@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4XHD0f5bz30TW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 17:31:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718868697; x=1750404697;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ObMyqpfdH9oiXJmEmISO11yjx0/QHExLNbkw2XLDljE=;
  b=LjaWBhZcv6gTtutUOtSpPOJKit3bq3otzfpSQ1+PmjEmtfZ7Eo75zUbW
   djxwtOByEpuqLyH3vcGdG7cBfTjh8eOOWDg4eue4nYtmFXcN3zitg0kUt
   i/LgWWjj7MDh/IqghaoMQDS2+rK8M/qBdN+0U41UoQgfRUMXpmBBmYKYH
   PlWA+kwJ8h2jJotJJk6AddCTnl8FdZ4WCQlTOOnKx5FmpoCVmg1El7Lbj
   yKQPhnn0ZTRfkiDd+nVwFSAce8u0caO/KjWDSXQoIVpMB41FNTY5ebaKS
   n441N0TqpUpfrda2pb6koMobgxxjBctYNeANx0UMeayGBV7jYTltQTR8e
   w==;
X-CSE-ConnectionGUID: MzfOaXAKTG2Av18ttSHELg==
X-CSE-MsgGUID: GLvW8L4YToSV1obTx4n6OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15539360"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15539360"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 00:31:29 -0700
X-CSE-ConnectionGUID: DPvGtP0/SyeTYeZbTTE/JA==
X-CSE-MsgGUID: s6ygVqnNRAKhVDNhI6/1Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42812024"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Jun 2024 00:31:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 00:31:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 00:31:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 00:31:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 00:31:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uyw15Xnk882zvH/1BdOLC0cR/3zvCYq1h0Pws9sV46SYJO6s/XQrjzzzJm0zhUzLocoF5eRTSChmIknSW94ehrQhaXTPYOZWhwSUTP5lZGhRsuSsVLSfdUyC6CzUkVHCZcv4DKUNSoEK7/ag3IFP8sG73X8BwMQY3pYLHEuJ1DxRduaTYTtYNx0m6lSfm4ZAHchwydiKBLk2wJCi4qP9LAVbhpqmub4hdjArChaOYUw6LhLHqj9RX/eUAXhPu4XLSix6GlC49Zmuc1L6apZ3cUgcw/CtZZfFkR2eFGNcuzxVgCc7b8SWuThBM+PFJReZimuuHHTdQhTpE7DT8ym+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAXBiEak0UNXNAp5/SjuoqXlMk+EvUg1YvcnDFb3ekQ=;
 b=nIRfPAyWY52al8ZEnjEajUx2huwn2OoK6OwhBDbfM3F+ycbbUxu3dAdTRDFWIxNAbk11Jy64ctsu1TRIA38XuN14lOG9564QCEGL5f6TiFF1Av04Bnw309r9Qbx5I83LcFXAeYneO1zMrgas5kN4+ZXcgiDCQZHNPOh++laGGegzJHZthTPxIzz/eSux3gm3P9B7upI4hujY/U/eyYUrGoOrk41HaRuhXBSF9/jZdKxDSesxg7WEeo89IQkROdYG7b/lgWRjvXMucjlH3d5ZyncJOPqkE8vuvAnHfa6Z2GS11Ojpt2AoY4W9J3Pg72F/7d0/0/zXbPa2YiuvNsWW/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MW3PR11MB4731.namprd11.prod.outlook.com (2603:10b6:303:2f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.19; Thu, 20 Jun 2024 07:31:14 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%7]) with mapi id 15.20.7633.036; Thu, 20 Jun 2024
 07:31:14 +0000
Date: Thu, 20 Jun 2024 15:30:36 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [PATCH v2 00/14] Introducing TIF_NOTIFY_IPI flag
Message-ID: <ZnPam37GQleKSBsP@chenyu5-mobl2>
References: <20240613181613.4329-1-kprateek.nayak@amd.com>
 <20240614092801.GL8774@noisy.programming.kicks-ass.net>
 <CAKfTPtBTxhbmh=605TJ9sRw-nFu6w-KY7QpAxRUh5AjhQWa2ig@mail.gmail.com>
 <ZmxwWdW78hjNuxWU@chenyu5-mobl2>
 <4748fabf-c359-9199-16aa-469840201540@amd.com>
 <ZnE77ons3lb/JAxP@chenyu5-mobl2>
 <1035ec64-b3d3-c398-d6e7-99745a14c294@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1035ec64-b3d3-c398-d6e7-99745a14c294@amd.com>
X-ClientProxiedBy: SI2PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::20) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MW3PR11MB4731:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fceb8d7-4b67-4626-1c74-08dc90faf6df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|7416011|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cZqxyq9AkcZxv0mMnubYCg7roTk7PzCKK5VxPJbQXZp1G9Pjv9oaigDHJQkZ?=
 =?us-ascii?Q?CRPh3xiNLUgLtQMeJisylXUttlb/pLASvH2his7hlRSSeC+UiVcuYy2FoohB?=
 =?us-ascii?Q?nFwO6oWS/vIF6y8iGUw5zjIzIV5UnYuB/aAKZJrBeMua33V9k1Gjge+HMWMs?=
 =?us-ascii?Q?AjhU1brp1VGFW3j/HYKmWvstC9xrigEIrwHfXWZ33aUSl3n2vUGaFUSROTMJ?=
 =?us-ascii?Q?5qnuJGt/6EyXzzM7/6VQD8HIlnLfhDOUUwonfd3mWsroVgi2ea4WyY50YLPA?=
 =?us-ascii?Q?GpSKgJ3kPwo6Dvdlzqt3Nj+BPs8WPC9UQNteI1GxotGex8XhNcVRiUNHZRmX?=
 =?us-ascii?Q?7xoXnuAC/egURr3uJ6SqKuin0YqBCiSCXoIXiY9ZhnX9bq1JHXr3+B7+oD45?=
 =?us-ascii?Q?FvEEER99jsZFA0bPD83XkO5QRzR0C+GWy7dgZa8zzR9RdN1FAQ6ATXLGXCBx?=
 =?us-ascii?Q?lCC7Fl9UKzDVzFpfDbgev14cG18lRAhwpNOXTt9egw8zVAP9oSyN3wh8vbdl?=
 =?us-ascii?Q?W+Ho5Q5LgVQVEd7YNLIMvybp3y3RjviUkG/3b2e7vLkPEAo/Bzdz0vYT4mxK?=
 =?us-ascii?Q?AmRCFuTQAI2r3fXr8r6lfPpop7+Mo+HENoJPEQ/2yX3W5zjp6d6Tc595ay/b?=
 =?us-ascii?Q?geJ60kd9djD9IA4x5eML+Ne3lh9HYhnLdiaDkSZuZ7J2ee2Etd+hgP53LdgC?=
 =?us-ascii?Q?wW5PctgDavNosnyQ1H0JjkU4hkCByo5e3oNSd22Qr9sdKMfES60YZfnBDC2r?=
 =?us-ascii?Q?NVlWs2mko02kLVnZuNc6M359SgFZU7dwMQFf8GfdvdBT0D+PZjW0s2jQaPxk?=
 =?us-ascii?Q?50qemdTyPeW5NdemsjyVvY3LDdzECvzK3ZDJ2mFmj6BlIArMb7lj3U/mwHHw?=
 =?us-ascii?Q?/rlVSwe6RDfi1lx50NS6LXcCydkQOUim9XYzchPDNlsryU5wUH+gC50B6c80?=
 =?us-ascii?Q?6d2aD0TXKok5+N9g6OrHQpojiZypH3aRnLZnYYlPwuyFFeHfZDK+5EAut8Cu?=
 =?us-ascii?Q?WGrE68nNAqaop0JCfv/eZ4waDT4sy3WGBxA3uYjXdfC1EbzTjq0Ld2SxJxFp?=
 =?us-ascii?Q?tKnXM1mDWsTBHlZ+/iU0E41jaqWR9McXIaBci2Aqy21J6SLicx/F3ys/QYS+?=
 =?us-ascii?Q?hzPjbO3H/qxVlcYSEg+oSWz2tbgeL62FmzPi2FMjexzFthvv6Pxc1sLtIVDc?=
 =?us-ascii?Q?zvSryYHkuoqX4Yu6RS36ZHzXzXo6FgXHtby6evmNG8L2JgehvhoVG3vRFCET?=
 =?us-ascii?Q?hcqRnuCuJwIOB7E+WictwfhGnY+74vkfLpS+wQYmcJFG97qu+1zagGl6f3NR?=
 =?us-ascii?Q?C8tub8j/QcbtZXJrHhCG39TH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(7416011)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FxMskAbaVe+b8/ZjvRwmb0IJvXu8RtfyvNApl+0w6qKcRxx1m+6BY+JSg9Sf?=
 =?us-ascii?Q?e2rDTcnREOqEigyJozsOwM/x8FPoTIQlb6Qc775bSBJ8SXhlqcxh4Dl6Vto7?=
 =?us-ascii?Q?70taGFJEGI/v8jM824ZQ2TYsgwynJJSpBWsC7oL1b8WAlZqB1q1DkVJg+fzp?=
 =?us-ascii?Q?dW+iKcSNvQ6dgEQvdP/R5gaeJCDQGyBALTkEiJU/fZAYhxyDyb+MMVYlp/m4?=
 =?us-ascii?Q?alBuP8G36Qo/CS9hAkwMNDFwfjW3bZPDh8KWPkB6GBLqyr+ez8vRyS1Hpk8F?=
 =?us-ascii?Q?bcdmYyfZnDUieJgT+W2UukxnXTfawREGmhLovz3Lb7hwonMbArsIxQuMB9k7?=
 =?us-ascii?Q?gOXn/9akLLzluYZDYEQSv3hn6baqIZkbDwfV94/G6+ehGJGA6FzrrQQOkbrC?=
 =?us-ascii?Q?jGQHetwOMJzhx5zqkmmPBFuQffBJqgB2g7sPuBdDK7d0wU282XHFQk2jLyu4?=
 =?us-ascii?Q?UqPIz9wuZ8z6+3+stqgRvFkUu021eeQD2Kk33Dj0tvI02pwxmv5ytj2Gtf3M?=
 =?us-ascii?Q?uMU3Md6h4S9kxH+3+kZ/qbxVYOuAovW7kDGKbPky9uNbJAD+iQ/hAS3L0wTH?=
 =?us-ascii?Q?j2fk1MGoeSByaIeK+tJmCMVdeHWiLfaSY8vsQmMjyc8Ct4Ahk16YqC0Gy+7a?=
 =?us-ascii?Q?6TTRkyNg7y7aSTcaTujsV0r1JnBtw/aoVRyBXwRbuDfSJgz9CwqtHmpSN4PR?=
 =?us-ascii?Q?QgAepiXeBB+M268TIvAgH2X00MWCDyl2M8DdTerSveqkoPyIcDK0JTKHkzHX?=
 =?us-ascii?Q?aBPgMxzgBNXvltT2ImFvFKWIQuZcBmxVPl5ni4lU6jV0R6Ce4CKlZlhp4h+b?=
 =?us-ascii?Q?rR3U8lV3RHUKi2rlCqMkg1yKhPISzHMsEHTX6u5VVSup9emTxQkM0C9zYZ2P?=
 =?us-ascii?Q?OFsDkr22WKI22vK3or0ZK2XiKJnmdZRwQ2P/UY7GzQ1e3TRpXNsXZnVgUxJy?=
 =?us-ascii?Q?ZsIsnqXjjEo5Q4exhMwgu3HqTUZmfcNRDrq309u8/nz7zq2hJUb7sgAWdhTv?=
 =?us-ascii?Q?yPSHdovlBkCSGxnLntM6DdKWlsRWavbfj6eLG4fjQDj5ljPvZVygACRxpNaG?=
 =?us-ascii?Q?CdUzDDg3DruPmu8fO1qZCqZRGIKuaWcCtcLPdc6B5tDd1mEcmdRV5fh05kAr?=
 =?us-ascii?Q?7RCUiKmUW3bFsCRTQLWfUFvFiN4mDo6yodXAlI8JCY7Mn4wbR6j0E2kZOGDm?=
 =?us-ascii?Q?eoKMr3TLpd3/2JPS9ImB1mJm5bwyWpoWOpA5a/FKjIncI+PL9nYBJBLYdNYs?=
 =?us-ascii?Q?fUd5fDENWAvFGASLdeCHqLH4vUkiDduTMK/w6FpfU0UdtfSeux27uDgtyG4R?=
 =?us-ascii?Q?ZlG4DqIF1O4XMqUgcbFvnITdu6dx9qngKyEnCw8LxLOkldVpoozooIUOpS+8?=
 =?us-ascii?Q?SZ11mgD+4jqCpi3JsWXBF/q7uM02W6V2y/KKstaKT8pvcsyoP/pxUAnwVOpf?=
 =?us-ascii?Q?Ka0crjQFfDkV9GmavCvpWwRTIFZUQ13/jTVU3tEhqW0U1/ba+zz+WJZeB+FW?=
 =?us-ascii?Q?Gr4FN+Cte/WFlE+iX+EgAnLBU7AJLr8k43IVWaSqMVJfiNsxkyQU+dBc/YgV?=
 =?us-ascii?Q?HxSfbed+vPaNR7pdWE7KtWcKsdDkbQ3DpKJneJS5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fceb8d7-4b67-4626-1c74-08dc90faf6df
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 07:31:13.9963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dr+suYxs+ViDfYkwoCd2MLB+ofI6+lkjZE7hi+4REIbIc0yOHEEHbMPuYVdrPV/O6+o65DO9WjgW++EkB3LQ9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4731
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 20 Jun 2024 18:25:05 +1000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-openrisc@vger.kernel.org, Guo
 Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, David Vernet <void@manifault.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>, Jonas Bonn <jonas@southpole.se>, Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, "Rafael J. Wysocki" <rafael@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Tony Battersby <tonyb@cybernetics.com>, Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>, "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Rik van Riel <riel@surriel.com>, Brian Gerst <brgerst@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Xin Li <xin3.li@intel.com>, Richard Henderson <richard.henderson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Steven Rostedt <rostedt@goodmis.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Bjorn
 Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, Dietmar
 Eggemann <dietmar.eggemann@arm.com>, linux-arm-kernel@lists.infradead.org, Ben Segall <bsegall@google.com>, Michal Simek <monstr@monstr.eu>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-parisc@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Julia
 Lawall <julia.lawall@inria.fr>, Dinh Nguyen <dinguyen@kernel.org>, Leonardo Bras <leobras@redhat.com>, "Gautham R.
 Shenoy" <gautham.shenoy@amd.com>, linux-alpha@vger.kernel.org, Imran Khan <imran.f.khan@oracle.com>, Borislav Petkov <bp@alien8.de>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Daniel
 Bristot de Oliveira <bristot@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024-06-19 at 00:03:30 +0530, K Prateek Nayak wrote:
> Hello Chenyu,
> 
> On 6/18/2024 1:19 PM, Chen Yu wrote:
> > [..snip..]
> > > > > > 
> > > > > > > Vincent [5] pointed out a case where the idle load kick will fail to
> > > > > > > run on an idle CPU since the IPI handler launching the ILB will check
> > > > > > > for need_resched(). In such cases, the idle CPU relies on
> > > > > > > newidle_balance() to pull tasks towards itself.
> > > > > > 
> > > > > > Is this the need_resched() in _nohz_idle_balance() ? Should we change
> > > > > > this to 'need_resched() && (rq->nr_running || rq->ttwu_pending)' or
> > > > > > something long those lines?
> > > > > 
> > > > > It's not only this but also in do_idle() as well which exits the loop
> > > > > to look for tasks to schedule
> > > > > 
> > > > > > 
> > > > > > I mean, it's fairly trivial to figure out if there really is going to be
> > > > > > work there.
> > > > > > 
> > > > > > > Using an alternate flag instead of NEED_RESCHED to indicate a pending
> > > > > > > IPI was suggested as the correct approach to solve this problem on the
> > > > > > > same thread.
> > > > > > 
> > > > > > So adding per-arch changes for this seems like something we shouldn't
> > > > > > unless there really is no other sane options.
> > > > > > 
> > > > > > That is, I really think we should start with something like the below
> > > > > > and then fix any fallout from that.
> > > > > 
> > > > > The main problem is that need_resched becomes somewhat meaningless
> > > > > because it doesn't  only mean "I need to resched a task" and we have
> > > > > to add more tests around even for those not using polling
> > > > > 
> > > > > > 
> > > > > > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > > > > > index 0935f9d4bb7b..cfa45338ae97 100644
> > > > > > --- a/kernel/sched/core.c
> > > > > > +++ b/kernel/sched/core.c
> > > > > > @@ -5799,7 +5800,7 @@ static inline struct task_struct *
> > > > > >    __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
> > > > > >    {
> > > > > >           const struct sched_class *class;
> > > > > > -       struct task_struct *p;
> > > > > > +       struct task_struct *p = NULL;
> > > > > > 
> > > > > >           /*
> > > > > >            * Optimization: we know that if all tasks are in the fair class we can
> > > > > > @@ -5810,9 +5811,11 @@ __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
> > > > > >           if (likely(!sched_class_above(prev->sched_class, &fair_sched_class) &&
> > > > > >                      rq->nr_running == rq->cfs.h_nr_running)) {
> > > > > > 
> > > > > > -               p = pick_next_task_fair(rq, prev, rf);
> > > > > > -               if (unlikely(p == RETRY_TASK))
> > > > > > -                       goto restart;
> > > > > > +               if (rq->nr_running) {
> > > > > 
> > > > > How do you make the diff between a spurious need_resched() because of
> > > > > polling and a cpu becoming idle ? isn't rq->nr_running null in both
> > > > > cases ?
> > > > > In the later case, we need to call sched_balance_newidle() but not in the former
> > > > > 
> > > > 
> > > > Not sure if I understand correctly, if the goal of smp_call_function_single() is to
> > > > kick the idle CPU and do not force it to launch the schedule()->sched_balance_newidle(),
> > > > can we set the _TIF_POLLING_NRFLAG rather than _TIF_NEED_RESCHED in set_nr_if_polling()?
> > > > I think writing any value to the monitor address would wakeup the idle CPU. And _TIF_POLLING_NRFLAG
> > > > will be cleared once that idle CPU exit the idle loop, so we don't introduce arch-wide flag.
> > > Although this might work for MWAIT, there is no way for the generic idle
> > > path to know if there is a pending interrupt within a TIF_POLLING_NRFLAG
> > > section. do_idle() sets TIF_POLLING_NRFLAG and relies on a bunch of
> > > need_resched() checks along the way to bail early until finally doing a
> > > current_clr_polling_and_test() before handing off to the cpuidle driver
> > > in call_cpuidle(). I believe this section will necessarily need the sender
> > > to indicate a pending interrupt via TIF_NEED_RESCHED flag to enable the
> > > early bail out before going into the cpuidle driver since this case cannot
> > > be considered the same as a break from MWAIT.
> > > 
> > 
> > I see, this is a good point. So you mean with only TIF_POLLING_NRFLAG there is
> > possibility that the 'ipi kick CPU out of idle' is lost after the CPU enters
> > do_idle() and before finally entering the idle state. While setting _TIF_NEED_RESCHED
> > could help the do_idle() loop to detect pending request easier.
> 
> Yup, that is correct.
> 
> > BTW, before the
> > commit b2a02fc43a1f ("smp: Optimize send_call_function_single_ipi()"), the
> > lost of ipi after entering do_idle() and before entering driver idle state
> > is also possible, right(the local irq is disabled)?
> 
> From what I understand, the IPI remains pending until the interrupts
> are enabled again. Before the optimization, the interrupts would be
> disabled all the way until the instruction that is used to put the CPU
> to sleep which is what __sti_mwait() and native_safe_halt() does. The
> CPU would have received the IPI then and broke out of idle before
> Peter's optimization went in.

I see, once local irq is enabled, the pending ipi will be served.

> There is an elaborate comment on this in
> do_idle() function above the call to local_irq_disable(). In  commit
> edc8fc01f608 ("x86: Fix CPUIDLE_FLAG_IRQ_ENABLE leaking timer
> reprogram") Peter describes a case of actually missing the break from
> an interrupt as the driver enabled interrupts much earlier than
> executing the sleep instruction.
>

Yup, the commit edc8fc01f608 deals with delay of the timer handling. If
a timer queues the callback after local irq enabled and before mwait,
the long sleep time after mwait might delay the handling of the callback.

> Since the CPU was in TIF_POLLING_NRFLAG state, one could simply get away
> by setting TIF_NEED_RESCHED and not sending an actual IPI which the
> need_resched() checks in the idle path would catch and the
> flush_smp_call_function_queue() on the exit path would have serviced the
> call function.
> 
> MWAIT with Interrupt Break extension (CPUID 0x5 ECX[IBE]) can break out
> on pending interrupts even if interrupts are disabled  which is why
> "mwait_idle_with_hints()" now checks "ecx" to choose between "__mwait()"
> and "__mwait_sti()". The APM describes the extension to "allows
> interrupts to wake MWAIT, even when eFLAGS.IF = 0". (Vol. 3.
> "General-Purpose and System Instructions", Chapter 4. "System Instruction
> Reference", Section "MWAIT")
> 
> I do hope someone corrects me if I'm wrong :)
>

You are right, and thanks for the description.

thanks,
Chenyu
