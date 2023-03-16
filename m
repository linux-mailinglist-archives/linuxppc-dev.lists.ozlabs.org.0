Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 757FB6BD55C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 17:18:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcsrH07hmz3f4b
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 03:18:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MIIKkNkB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MIIKkNkB;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcsqJ1bKKz3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 03:17:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678983452; x=1710519452;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Zr8BFx3Swr5jP1vSD3fOCuNHxC4nbBi5eKIDchVgMF8=;
  b=MIIKkNkBNoLv9RX2GtAlz2oBTIVWVEDcHulUuulBXSOdyCVUw9kMDTAU
   xsyamypqTEf5BL+K+X2Qm3POa26HBl/MNa44d0QIjna8JCXNL/scoVbVi
   0M8pnh3o/yX6rMbAXNePucDp8EcodsBk2xpev5X0TUmDb3w+Ue2WUx0mv
   k/F0m3TZLoJj5h0wsB1iCdyXsi+7H2MRtSNN9Zizp059CTejyabZh6Aah
   A1yMwLfPxagrmHNls09YY9fherZlyFylxqvvP4I2mp2oS9LwHOXYdLjkI
   lvnW+s/0asuRAFji9/saobmVlgkqZaw47M5Yn1V/OWrbT+xSnhVV+YWLh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="317693980"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="317693980"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 09:16:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="629944058"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="629944058"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga003.jf.intel.com with ESMTP; 16 Mar 2023 09:16:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 09:16:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 09:16:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 09:16:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 09:16:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwrzfmQ2OFe8DvALi9Fv7PCaGjofHMo4cnZZTirVHkYHYUJi18WlwZ7QYluy2y1afG/LPiObojP1nWjLler2BOlxymc/VdTnWOdA91FkF4Wl9DaEsWA5Z5kILuaqyQctW13OGg+UnCoNE9Vd19rlqgGzprCpDQTIa+csAR1VbTFOCaxTgtX1hl+QuaaiWASa94tORDgljAGxXNsOZgAtwiBckh8Pcc52bfvhiemnCyDnC/dTaRBr/hW22CxDBlFsknBj+7C/3yCK2kB+gICzRWniiKT+wsV5vq0pkoyLJSxckx/0D4S+kv6FoxjU8gNDaTSHQUyTWw0fI+f8aENExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/M0+N1fKQ6yBoJVnhWxWMu12a2iXXsGA4q0oczOxHM=;
 b=Ti7/XF6jPPDmk6ikjLIjRgui9rFsOXGVsC3Rajit+5a0/u7nmx+nHwfKOKKd32c1u6C+pxrKY1Nr4g5x2ZsoV88Az/QF8uLePJ1jGcV5It2NzxTadVLrm7YgxK7SutYFPRFb7Ab6Uk3pXIJTWXIm9FIF+TVSnEo/JIfg3Q4x9X3MnC7UqaDAGKRT+VpmE3ZwXpJzU91f6DGzrpwTDvt6/Gs3BhStYe4uBMSm6BAoA+Ahe17Ar+yZrX7cF5KKc/Iw9zJZpFL/Fe0YAhxTtIHNrtLuR41+0CDyWkQzxJjEoP3jSegCHgldbo0sBvDvGrP1XAAkkOUJlOtJOJ970rXrfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by DS0PR11MB7532.namprd11.prod.outlook.com (2603:10b6:8:147::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.30; Thu, 16 Mar
 2023 16:16:39 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::84dd:d3f2:6d99:d7ff]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::84dd:d3f2:6d99:d7ff%7]) with mapi id 15.20.6178.024; Thu, 16 Mar 2023
 16:16:39 +0000
Date: Thu, 16 Mar 2023 09:16:34 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Ira Weiny <ira.weiny@intel.com>,
	Dave Hansen <dave.hansen@intel.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 0/3] COVER: Remove memcpy_page_flushcache()
Message-ID: <641340e2998b4_2695182944f@iweiny-mobl.notmuch>
References: <20221230-kmap-x86-v1-0-15f1ecccab50@intel.com>
 <3523ddf9-03f5-3179-9f39-cec09f79aa97@intel.com>
 <64126d113d163_2595222942@iweiny-mobl.notmuch>
 <87lejxmax8.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87lejxmax8.fsf@mpe.ellerman.id.au>
X-ClientProxiedBy: BYAPR07CA0087.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::28) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|DS0PR11MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d322cf-15cb-45bb-88ed-08db2639d27e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mI4bOz0elX02zm12puuDc278GLnXGvBA7UwRAR3O6NFD9Bq0RNQy/MgUd1GhLaXhhnUysuITu4yKlDhSZ2k4oOUcjR1ZUTo423fINGeBZHm6kY9H2KPRWhr9wwB2Tk9u/WnJ8wWVe3t5ZLP8BpbVpE1icrC6pT4SEw3/0hNQ3u/vt6tP6NW8m93ZsLbrxak8DPvjnrMY7jwwcdnXO2D1JgU0C/v8geEuef8nqPI3DYswp9PU1QBsHf8V9LDLoZriD1FNdD2EA3ijTcxhvvM9i1eSxr1RoODGgtbvEURePz0UEoEU9IXGA2KPl6G99R+n1ppuuqZCHuc5oE/pE7gDHM/xG3DE9lrMerBzlA6l8dA9ulIqU0KYVIo1Mbj6NE6Lz1oT9UXdJyu2SRsEBwZm6v0shWif0JHJs0yzgjzW7rJlxEmRiKhY80qJ7ycS923rO10WazqxAW4/W4PpReYYMKJ935yg2HDpMtcwipNwIVkDBidCiNM2qjDDqyxMwh0MjRqaaXhHsZNiS73MOjpvdjiDqyp5lQjhBQBhsni0X0GHMYMflPf9jH38JJroPkPcZbxI7Yq9kV+X2yVCfMTQt/+RDFBUQaWNRBAn+DYfFqm+nxtFAjwJRoP8e/I4iG+78pOSDhL+wTFPhMLrsd0x3tMmzivfCgK+CSaZoKtNB2FkySNRQFtEGkGOSENznntk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199018)(5660300002)(7416002)(44832011)(186003)(2906002)(478600001)(53546011)(54906003)(6512007)(26005)(9686003)(6506007)(6666004)(6486002)(8936002)(921005)(66556008)(66946007)(316002)(86362001)(110136005)(66476007)(41300700001)(8676002)(4326008)(82960400001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aV7NwIzpRQN2a3aUiZhR2O3HiK/i93JjbHlhPCbAiaIux7nmXErxNn1GwYIz?=
 =?us-ascii?Q?fPuF3iCHZzeTD7GrD0/jrYU/XO+dhK14Ujy6nd4HI3WD/gO3anwueUGwcjQl?=
 =?us-ascii?Q?mbkxquvoY3gmrrJK9tINg3eySwgjzaTVX2AiKmP6fH39Mk2Sx9FkFBx6UpO4?=
 =?us-ascii?Q?EKuMDLrfYQeu1y7X6x4eb62yTDLg/lVRoTHRaKAd9BvGsA7M+rYCmFZ3UGDK?=
 =?us-ascii?Q?kZRRmyyyQwHTHrdS1WgrOgkamQBdKdEQd2M2+TFfT0qHzxkHcNeaQHPg4Qag?=
 =?us-ascii?Q?8gO0G1YgjUTfcRlQzJB+/uaUWhBcGYcoVztH2eiLhymw8M+4nag2fB17i+4t?=
 =?us-ascii?Q?P4X4lsk0UQpPafku/G5s28HBQ+GaHCw24kBRtJFPFBlWeRUm1mLwP+3s8jZ3?=
 =?us-ascii?Q?E5CUajirkroBsabGRuPvacO8Ucp1Ff69weA/5ZLU6D+gJXZYdKEivZ8CPcyx?=
 =?us-ascii?Q?aY00egU35/b1nHKDxnW5LXSMIhR3gdtVWDsCRYj0W5W8zT+W5kUheq0FoUxi?=
 =?us-ascii?Q?FQyu1vVLuCj3sAeThxTsujDPnH+kdzM1a76DrUOa+HwsiTvs7jla5+F+hfIx?=
 =?us-ascii?Q?g0iopQPh84AQlC6tBA08B90oa3o0ADWPfvJvr+FU8glb/4ETG9a1HrTySfwC?=
 =?us-ascii?Q?npN6/s9aUsKOE7YcUcPad8GJ1I6ZQE/4/dEaZf03um8BksX/b7Lvif+xE8wl?=
 =?us-ascii?Q?/LFBbJqvLeTIfODzpqU3Liy/nsqccBoZc0FQPZKaby+XJycmGJ4KATkSGDOQ?=
 =?us-ascii?Q?7kc2kXzNPDUwRfP5EAtdkJRUiQrFX+Zw+bf+BqponCN6v8/IdEt6CSq+uXyr?=
 =?us-ascii?Q?klDG2Iib55p96f4od7DkpRvC/pSCbP/7hFlDMOwTaX4wc8hGWdMJNZeL51Jb?=
 =?us-ascii?Q?bVcvZCCdG+5iNv5dHwkP0phbzcdHGV04UtAk+1Q/Vk2a3GYoZQQyOA1W+xJ1?=
 =?us-ascii?Q?NHGVQrm9RZSSx2K/RPpo3OjgLZb07DXynEBH0DB8FBsxiqjwFKDEv8qX8l/+?=
 =?us-ascii?Q?/ZBFr7TI/9fgOczKZxGItXII9yjTUaHE4hDV226GtZ9BYbe38Mg0yj2v2m4x?=
 =?us-ascii?Q?VOOoTFdAs+lZ248lPl9gcY+BWT5CO1+6wv4bUw/igqHYTpJHor6UjwoC2cOa?=
 =?us-ascii?Q?Lmr1sXNwJ7EZ3HtB6S4Pc/Q5bPVjGH1SKQZSFmxbQBIDYV/t9tOdZEgFc9kQ?=
 =?us-ascii?Q?XksSOMo/Ujqjh4gz13riN5ZilJFUI+QtRohoHycvFe3zQd+USvLu1eh3Hrmr?=
 =?us-ascii?Q?WuXN9GCl85qPybmcZ2CkTJDkG3SF5AJMG0aAItmDsNPFioGy07KATMVXWcl5?=
 =?us-ascii?Q?mDUXjxOiVoeq8heB70aFSCOxgCgjCRecH5oO29OxL4c63jVZZGmXgk6yxR/6?=
 =?us-ascii?Q?oVgp7YY+H9eIRtBhaRaDBdjzEwbWxWkHYDuKRDSdwPfupeFq0bqhDCxrVMTp?=
 =?us-ascii?Q?L0OZHcYK0X70n/iUT/gJ84gs8GDEF9WlaUjOdfzUh1k/5SoRD4mUvnpr8SLW?=
 =?us-ascii?Q?I/uzQqJNCEd+wZUtaqlsUI07py25Hu8KdvYAltzZWSXCA4YqvChQShhUr3St?=
 =?us-ascii?Q?/vHXwO16FMzBv8fyObe28KSJ2T1+5mdYML2AxQf6edJZ93ny7UJtX80GQ7ng?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d322cf-15cb-45bb-88ed-08db2639d27e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 16:16:39.1587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NccUQ7rVBktIjcahhsasBZjwq/fEBYbWljjl4Z7/7Sp/QfTxsW4qufYorlLKnXm75ucz9gY2UC4NRyQlec0cLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7532
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
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+ Konstantin

Michael Ellerman wrote:
> Ira Weiny <ira.weiny@intel.com> writes:
> > Dave Hansen wrote:
> >> On 3/15/23 16:20, Ira Weiny wrote:
> >> > Commit 21b56c847753 ("iov_iter: get rid of separate bvec and xarray 
> >> > callbacks") removed the calls to memcpy_page_flushcache().
> >> > 
> >> > kmap_atomic() is deprecated and used in the x86 version of
> >> > memcpy_page_flushcache().
> >> > 
> >> > Remove the unnecessary memcpy_page_flushcache() call from all arch's.
> >> 
> >> Hi Ira,
> >> 
> >> Since the common code user is already gone these three patches seem
> >> quite independent.  It seems like the right thing to do is have
> >> individual arch maintainers cherry pick their arch patch and carry it
> >> independently.
> >
> > Yes.
> >
> >> 
> >> Is there a compelling reason to have someone pick up and carry these all
> >> together that I'm missing?
> >
> > No reason.  Would you like me to submit them individually?
> 
> I'll just grab the powerpc one from the thread, no need to resend.

Thanks.

> 
> > Sorry, submitting them separately crossed my mind when I wrote them but I
> > kind of forgot as they were all on the same branch and I was waiting for
> > after the merge window to submit them.
> 
> It's also much easier to run git-send-email HEAD^^^, rather than running
> it three separate times, let alone if it's a 20 patch series.

Exactly.  And I'm using b4 which would have forced me to create a separate
branch for each of the patches to track.  So I was keeping them around in
a single branch to let 0day run after the merge window.  Then I forgot
about the idea of splitting them because b4 had it all packaged up nice!

> 
> I wonder if we could come up with some convention to indicate that a
> series is made up of independent patches, and maintainers are free to
> pick them individually - but still sent as a single series.

Maybe.  But perhaps b4 could have a send option which would split them
out?  I'll see about adding an option to b4 but I've Cc'ed Konstantin as
well for the idea.

Thanks for picking this up!
Ira

> 
> cheers
