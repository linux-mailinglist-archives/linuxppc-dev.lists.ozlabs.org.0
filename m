Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 717D06BC32A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 02:13:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcTmZ26bCz3c8r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 12:13:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NIpYI9FQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NIpYI9FQ;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcTlc2LJ4z3bWj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 12:12:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678929180; x=1710465180;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=6bo9/JwmcW2EdDPV7dRokTU9JGUeSzCAAod8PfPo3qc=;
  b=NIpYI9FQJP19HmyWDWF+DVsJwDT+ucR/7tD4oNwLzPMCyGdiKugsO/aj
   cr9YEQangHn8kcAy9YeCa8Hl3tUXT7e0te1PPGxjsWi5/rPnf/6fEPrZl
   47DzAFCvmMu8wPu1Yi4Bsa5ccY6q7v44r3Pzx1WU8SVpF3xRrBHqwFAds
   e7b1mOx+fQm7/ZKAzv3/Xj7r7rWPzMCHw7MW5MoWhj1hwFrJ7hhOkSGiZ
   Hxmah/OrGE6zGnl+OGIDt05LI16B4G1CO6Uf8BI987ZGiQoFNP6oh0xuC
   K8I61gbjs1FCMWdAuvusmruwl3n5FhHoJ74jU73hSC9iaCJgIk5sNzNVN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="317510036"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="317510036"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 18:12:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="790061493"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="790061493"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2023 18:12:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 18:12:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 18:12:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 15 Mar 2023 18:12:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 15 Mar 2023 18:12:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDJ9fh9HrhyUk+UM5hpwRtOZiQ29MCUR+vrQSiX3Xv+wr4BYrfCHqpwKxQzG+7Ugf+Iq22fuU893DSESDJi2Q901ptFyAhawbg383Y/JCvDfAyzXzTp+1FmF9FGCyyLwYxQ93l+xhPr4ChPo2HHsBpeOFtfOgRoQWdIzz2aiqODJ5LpTFTKXOpAXi5AQdq1nWVl4IW6BLEhBSSIAlH7nE7IjIue9SLO253h7ctujORm0UM0O2Gqp0TnieRqrRQrcbz8PerrbnNbIlDz0ABAt3mZW567qFEzvoj8fJbeXOG50ukMNE7dRQNMFt1o5eX8BNwU/GjNaRxINEWmBnDdugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xh1luPrHjBWJsiC/JJzvwYYI2o1n4aIqqlsPVlTTt80=;
 b=OUfOp+hiP/kBBL5K7r98rW3cYl5pR0QmFXN5R6MntSM1Q3bXvD8Oa79K6Bvj02YHKIxEMPHhg4UXRF7TE3vXh6+kL6K/+wcUv+hvDAJknGiKA4VuYzgsm8YjaebXMm/X/w18xFE2VkmGSbdZXt8EAeIJqSYE61kD1wocb5UBhhmgb6nyCTteQ31GAWbHVeZN+XYbbVxaUPHcH4bBJlHZZxUQ1GU+/48fa05WmM0k4Kq9G5ZP7dUTz1ePx7cRpMdhnq7qP0hRV18+TyW8RO4yOVbMol4ym6SzYiAQuFJ4tJD6eTNqKYvnPkfIxggXOT0Lbouz/MRxtsyhdzSvCnjXLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by PH0PR11MB7165.namprd11.prod.outlook.com (2603:10b6:510:1e9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 01:12:54 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::84dd:d3f2:6d99:d7ff]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::84dd:d3f2:6d99:d7ff%7]) with mapi id 15.20.6178.024; Thu, 16 Mar 2023
 01:12:54 +0000
Date: Wed, 15 Mar 2023 18:12:49 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Dave Hansen <dave.hansen@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Catalin Marinas"
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, "H.
 Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 0/3] COVER: Remove memcpy_page_flushcache()
Message-ID: <64126d113d163_2595222942@iweiny-mobl.notmuch>
References: <20221230-kmap-x86-v1-0-15f1ecccab50@intel.com>
 <3523ddf9-03f5-3179-9f39-cec09f79aa97@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3523ddf9-03f5-3179-9f39-cec09f79aa97@intel.com>
X-ClientProxiedBy: BY5PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::22) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|PH0PR11MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f510235-82d0-45a1-85ac-08db25bb91bb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yy87wNO4VHZGnTeVYMbiVuh4MpFO6VUV4gBMMaYXV+Tz9gspTxCvRiJ3MQ6ZYK4XW9wRKsCl1gnV+36FusDJu/wfQ3EYHxxxTxCtcMdF/IRkxS8j099uuh+33YiBHbt6ezuxWPY20KknQwc7CXTUY2EqV8hwN7GYHZdfdEf2Jlj+YrVaJmuNAuJWslgG34emdgxQpEFheYjhcYovP5Gd55jbglh7/oiJpSRdo57Cd1CaqFiJz4iwAwsT07sM70iB0JNEPByULEx/JNZdJfaQP4OTnWZSu+8Ng8kyuP0p0YVuEddCxudSAAuBseyY4tow/QRXNx46g/kjUNar51iCr7dz6VYxc13eXPsfXDyVc/YsjSV3KFoaxjZ73am0P3rrBN5jcDyFsYUU92M9UE2gsNQ8yynUHS6YuR2KjUAAjo6FRmLbnQwLCYdGHsproXfNniHQws7H9YkXqNJHkYcFICZM0c2ctzUmj08SLOKBX/7zW/DGB92Bnna49oZdKR6GoHrdxbtN46OsThw25OReoUImRNfZN/cwpRXDuEim34ZvZ9mjIhRq8pLjz54Ew8LOW+yWNnPiDeD2HKkyshJN6hOfkxu1NuG975N8Q6mMuvqNGzTQOBdc6ktnrq/rGKA4M1+Uqag0PfZdZtek3wzm8q55pphY3q9yum/3J5Hv8+k73fBzkKd52bHgIefE3pjh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199018)(2906002)(53546011)(6486002)(8936002)(26005)(6512007)(6506007)(6666004)(44832011)(9686003)(4744005)(5660300002)(54906003)(316002)(186003)(86362001)(41300700001)(66556008)(66946007)(82960400001)(921005)(38100700002)(8676002)(7416002)(110136005)(66476007)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fwavKr2cHna/+qIPXz2NAFqBXVDcfkOl1nT6WQrgZCn/1GYmsK4rilLZhhXC?=
 =?us-ascii?Q?X6BMyd+1+TLXCERNODchmmBGKzyFF3L9rUKsriFTylM++XnybTWJqRqRKhvW?=
 =?us-ascii?Q?TRaoR1oEa94eg2haAQM82fHDQUKinT6u80lReRYGxzNZvlBzGxlInRpjnmRT?=
 =?us-ascii?Q?E17btHuSE0Cr9KA+OppsRK9GnmsG7SOmf6jGTi//jXNvNbXGM/dUnVJ6YBYr?=
 =?us-ascii?Q?JsdZ1xdnu1IMxoa8e4ql2AHCkDr5sr4lseo6BY1nLf8CJXg2qHYYkUoJ5lsP?=
 =?us-ascii?Q?d0eaxot33HkJXROY7tr4eKNQZhDulZttaa/2c7H3P/1kMaQNxq0PcgdBCGsl?=
 =?us-ascii?Q?N79sY6aiJLH9p1yivbONmJCWy0Pcu90VShdTycDTRm+5cZqE5YActA2szbfg?=
 =?us-ascii?Q?kZHtS+TgMJ1qEFtjPVHYtZcD6biN40Ht6w9yQ3mP/Ov0FbYFkgctwvCNU3gp?=
 =?us-ascii?Q?BJTMwZB5dXVJgke5CqadCGJGcjafdQowRDS32eoeOFFlG9dMVadz/VWbp1pf?=
 =?us-ascii?Q?+W3exSI9VmyHZuI4rugXav4SGkhHaHxIOwgkqzr9g5tXvYfVUGqrsriQgPnv?=
 =?us-ascii?Q?iPW/1WKnNzP1QoqrwzagtQ0PeapbGqOaHK+gdhZqsqvs3lmdu4R69edE5sQa?=
 =?us-ascii?Q?g06bpGZ2BFusKvvLddI9brYMm9MkMR0Yxf0NOAjI4WiBn22ZLJQWKxBpKSCQ?=
 =?us-ascii?Q?UFC7Q8Ddxf1w0+RZD+wFHzKqJvKu0mQubvgE5XTkLTCfeI9pTzWAeFDPdoMW?=
 =?us-ascii?Q?67lNQOdPTZG8Yv3Mz/N8xpe76V7Hs6dyA/sKmiI5+sfNah5VymjDqsE/2JEs?=
 =?us-ascii?Q?xIOPPSJAAcYy3TkGcElOUzgj6ihM115PfwIASpWxqhb+j36ZiGA8ISY8ysHg?=
 =?us-ascii?Q?YG3O4G3EtUTGhDbmJ8Ohro5CdVKgZXBYHZvuHXxykmXMlZiTHTuP1UTXzoQ/?=
 =?us-ascii?Q?RVV3CqWaxDX7JQ0KnqFMiQ56sQIJDLBN6GQf9s76xjSg31efdrnlm2gxBXIh?=
 =?us-ascii?Q?1wuf5NmDSy9dDHI0p89A3wqYfvorM1PtdJ3OmhYZo7wllFaFDIpMf/nss2/j?=
 =?us-ascii?Q?crL0yaFPXKsJ0Apncwb8EdRD1MgdX/n+vk2dX2FO4y3NVhKAUsThrnAQN5hg?=
 =?us-ascii?Q?41ICUUcDLbEu4vZ/NCM08oV9TsDjMdpxnoWlp3Og2L/J77Q107j+meCqvi/1?=
 =?us-ascii?Q?iDOOuki7kMNzJLTfLfco2RdEaPCHN1yc1mQX6vpQ4NgHDPLwgfAIkHaO32aJ?=
 =?us-ascii?Q?Ict7piVjhpmL20MjigpmMNAw5lf5Ey/QK0X2Dc5THcijYs3E8v/V2m+dpoJe?=
 =?us-ascii?Q?06BX+aojtZCWLytryG+av+uSYToSPAM1LcGxPfZTfFPzv6HsOnaCJtfYRB9j?=
 =?us-ascii?Q?kZGmNhTPhSu8/7DUK3n1Wm2HViEGjlrhKOoXCPuEw0xPSeqc3BL4umQc0DlK?=
 =?us-ascii?Q?to2346xBUfvGgRAFpAzMcjUcDDZlna6YErkcg9NGT9ng3BM0Y7P2IhS5Tcij?=
 =?us-ascii?Q?iju1QhTMek0xNoJ9OLIA8K02RFLw+A6j5vcdDus7UK5xO5k2l5h/AbajQXDi?=
 =?us-ascii?Q?+FbBTAKzIQDALTOikQUAL2gX9kW+jiSDhvGSwFtiti/xp/pBQAkUkZUTzorx?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f510235-82d0-45a1-85ac-08db25bb91bb
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 01:12:53.8873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAsFVUmb1GRwr1E0btoxQoLHxEaoHzOSswzLdAVR/ki8hJDs/927kmFaIZF8HhG33CsKwBkMo9S+BdgDB5LTXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7165
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
Cc: Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org, Al Viro <viro@zeniv.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dave Hansen wrote:
> On 3/15/23 16:20, Ira Weiny wrote:
> > Commit 21b56c847753 ("iov_iter: get rid of separate bvec and xarray 
> > callbacks") removed the calls to memcpy_page_flushcache().
> > 
> > kmap_atomic() is deprecated and used in the x86 version of
> > memcpy_page_flushcache().
> > 
> > Remove the unnecessary memcpy_page_flushcache() call from all arch's.
> 
> Hi Ira,
> 
> Since the common code user is already gone these three patches seem
> quite independent.  It seems like the right thing to do is have
> individual arch maintainers cherry pick their arch patch and carry it
> independently.

Yes.

> 
> Is there a compelling reason to have someone pick up and carry these all
> together that I'm missing?

No reason.  Would you like me to submit them individually?

Sorry, submitting them separately crossed my mind when I wrote them but I
kind of forgot as they were all on the same branch and I was waiting for
after the merge window to submit them.

Ira
