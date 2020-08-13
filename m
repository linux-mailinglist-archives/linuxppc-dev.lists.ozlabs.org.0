Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A27243CE6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 17:59:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSB8J64GLzDqf3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 01:59:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=549445532a=guro@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=bdqa/UEh; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Bsf9eoxO; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSB5y0N0WzDqcw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 01:57:06 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 07DFdrPI012996;
 Thu, 13 Aug 2020 08:56:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=facebook; bh=IwURd1p8THJt57DEP7ZAgjPp6V8uJGe4kfwpe8jaGfM=;
 b=bdqa/UEhRBsAd/9wtpgYGed8AyyjehB2sxbvtdjbVxNvfbOXBECwq07ggOeSSVMNbYEb
 q5O3Oea1OgExVP8wYAlN060fRu1arRbxys8ELJ16WBHBRikOcYAWkQt9od06u1CRuKry
 l343OEfYOuvxd5wYpI7PVx3k3P7OB9RhD1I= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net with ESMTP id 32v0khaec8-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 13 Aug 2020 08:56:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 13 Aug 2020 08:56:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdoEmfZ5zw1xe9CDneQKO/gTenaLHOsiaTy19NqP5mPC5FY+8rfGn4E5kNEVT03ALVRumB7rpXxweuGFd7TE8/whpaGUcHFVdURgKOO8mmh+AetYI/oG+Mpgd8tQ1yF2/r7svqPOlj6xLozUa59vKQjF10mDXtSVGDIrOMo/vtbiSr32MYZc/JiPdwTraIKDILBqdkMKK7Ol4e3yDnmSpRBEaLkFauR7oeCrcOvzb6iREbymFt1fvXf8Y6yVRU9C2qaqeeAmLaZMf8Hoy/IlJnbsvrYtmrp4OYVjsUN9/OJle4AOEsVgOwrO9jK0BBu9I2dF0E2+64+MMI93TBybBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwURd1p8THJt57DEP7ZAgjPp6V8uJGe4kfwpe8jaGfM=;
 b=d16vh4UIadQL3Hr9jG3eU91qy4wIsLgdxTZ39vFDL+1nTIXZnGRIs3iSZzefF0mB8ZUOcSB1HPWmm1PPH2Cz1H2GlG/TkTeUnm5+y7qj/hKoiwi3zILD7ZVA6+E04Uz/ti4hLskJzkkHqUhj5IZxd96MJf14ohCmWkCVH40F5JDtcR9XQjC9TAkSd8MLPKQNLANPmEr2K1bQKZpM2iXi1guPL9tDyR5AstXSotwLyYN1Bnk3CqUTsK3y9XZpFgthWS5W201cQrAjM8ScjWBsFYYykcgzdyp2AsWA6wpSejfvcBagr0b+8bhhFaHbvjjM065ffg1dvSaOrt80sPpAvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwURd1p8THJt57DEP7ZAgjPp6V8uJGe4kfwpe8jaGfM=;
 b=Bsf9eoxOqLfmmXH9V1c072NcJiIRcUYcYPbWXlJ9hUTMNKXxtxrAnXsh+5jOC1BIldJlu8wzY9wRYuHwlE5R7t4Q1k11twaWuA/QaFd6pMBhNhMf36WkM8ChQ67RBBsQ9vi1KXWWvakwStAyNk7D9lPmaNJs9/svneVzs9s/HZc=
Authentication-Results: cmpxchg.org; dkim=none (message not signed)
 header.d=none;cmpxchg.org; dmarc=none action=none header.from=fb.com;
Received: from BYAPR15MB4136.namprd15.prod.outlook.com (2603:10b6:a03:96::24)
 by BYAPR15MB2630.namprd15.prod.outlook.com (2603:10b6:a03:14c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Thu, 13 Aug
 2020 15:56:49 +0000
Received: from BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::354d:5296:6a28:f55e]) by BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::354d:5296:6a28:f55e%6]) with mapi id 15.20.3261.025; Thu, 13 Aug 2020
 15:56:49 +0000
Date: Thu, 13 Aug 2020 08:56:46 -0700
From: Roman Gushchin <guro@fb.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: linux-next: runtime warning in Linus' tree
Message-ID: <20200813153856.GA1641111@carbon.lan>
References: <20200813164654.061dbbd3@canb.auug.org.au>
 <20200813152033.GA701678@cmpxchg.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813152033.GA701678@cmpxchg.org>
X-ClientProxiedBy: BY5PR16CA0021.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::34) To BYAPR15MB4136.namprd15.prod.outlook.com
 (2603:10b6:a03:96::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from carbon.lan (2620:10d:c090:400::5:c40b) by
 BY5PR16CA0021.namprd16.prod.outlook.com (2603:10b6:a03:1a0::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Thu, 13 Aug 2020 15:56:48 +0000
X-Originating-IP: [2620:10d:c090:400::5:c40b]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1da9ab32-668f-4b18-1a97-08d83fa17cde
X-MS-TrafficTypeDiagnostic: BYAPR15MB2630:
X-Microsoft-Antispam-PRVS: <BYAPR15MB26301BCB38E276424318FA98BE430@BYAPR15MB2630.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YhPDGJwGv172HsB80kwiJ20iv7ardIN4G7G4Pt+kJi6lovUKfBSXlRskz7GXicPPJOPAvPxZud7pyKe2Z3DeQZDupwbe5K4E8MdcN9fdYawAjziNBBTEejSxL7moz8UZTFT0dacD0OSrUSrXOpTnEU9izkBmNko4XGTfxq24s4kfGniDtn5dIFUlpndBT8Fi35lmdwaLTOR8X9CcOa/Rlt+mP/aVzKmZblRCDVHBNK7ibZSZfbMpjsIC8XEq4GPdfjRA+8Wl/n2coK7LVwVY8UYUHuGvHxES2V06qjVE1pI9JV63djJmiS+RT/BIAc+YxAVueI7k3piSQN2onhVudA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB4136.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(366004)(396003)(39860400002)(346002)(8886007)(1076003)(66476007)(66556008)(478600001)(66946007)(2906002)(33656002)(4326008)(8676002)(55016002)(5660300002)(9686003)(54906003)(86362001)(53546011)(16526019)(6916009)(316002)(83380400001)(36756003)(6506007)(52116002)(8936002)(7696005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: V2oB/i/Z5OVgDMZfJbT/pqxZ1p0k98B1k51xiNujKjxg0vIjfzSs+t/O0gDG6NlsxXv8UmHxKKByKnckaVJ9oTqv3aoO3zsc9QsxuY6/bofQ6wM+Bc5jUVmzHQ3hf88EdvOWxLYc+jmpdhueOf3TeEEQ5xlh/gYLMFnNgNTTUTA3ZylHlcIykrirFALvPga4tRnchgzYc/ZMzc8ESVOKS3o4L6I3sO1KXsIm92Cwi5qMBT7PABQNUvEyZ3VFYVCbYIjJCesPW+bVSdgstZJbyY9jFZAkLzzBkBTQQCimwMyRk25L52crQ2rvQRhY87Ev1Pja7uWdhFYDcFUrbJzE+9H7woe17Oz91lU4dzFxck8AzresD0bkq3voHCwpPIVNrOVQaDr/UPyB80z/bh13wpijgt5tNStYe1pDFgquDxAy5MSUYWLRUKWoq6fKSv4k4quLKA1v1GY6lX0yK8JS5MNfi1AsD2Cj6GhYF7fsIW+CmQ3AMQibrybEcYdltT++cc6TSU8XgWrZZOuWgR9jH5Je4blkmn+6UXAY5Kr/0IRBSob5O6EaGfPgQoTIbot60dzhRy96cSWIKdSRzUoRRQzYFkKpL6rPd/cMuwM7C0tUic2nIx49DtuSpqyP2wkMhJQJ1DOPp7UiSPombGGcW1HAmC3FgTlxZzaukccX3kI=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da9ab32-668f-4b18-1a97-08d83fa17cde
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB4136.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:56:49.2908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFMHRVInJ/SjrLansjjd6ora1H2abGC7jVy3lvQPGAI8Flwns3aOKMlG8RQ0+9mU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2630
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_14:2020-08-13,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=1 mlxlogscore=999 priorityscore=1501
 adultscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008130117
X-FB-Internal: deliver
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 13, 2020 at 11:20:33AM -0400, Johannes Weiner wrote:
> On Thu, Aug 13, 2020 at 04:46:54PM +1000, Stephen Rothwell wrote:
> > [    0.055220][    T0] WARNING: CPU: 0 PID: 0 at mm/memcontrol.c:5220 mem_cgroup_css_alloc+0x350/0x904
> 
> > [The line numbers in the final linux next are 5226 and 5141 due to
> > later patches.]
> > 
> > Introduced (or exposed) by commit
> > 
> >   3e38e0aaca9e ("mm: memcg: charge memcg percpu memory to the parent cgroup")
> > 
> > This commit actually adds the WARN_ON, so it either adds the bug that
> > sets it off, or the bug already existed.
> > 
> > Unfotunately, the version of this patch in linux-next up tuntil today
> > is different.  :-(
> 
> Sorry, I made a last-minute request to include these checks in that
> patch to make the code a bit more robust, but they trigger a false
> positive here. Let's remove them.
> 
> ---
> 
> From de8ea7c96c056c3cbe7b93995029986a158fb9cd Mon Sep 17 00:00:00 2001
> From: Johannes Weiner <hannes@cmpxchg.org>
> Date: Thu, 13 Aug 2020 10:40:54 -0400
> Subject: [PATCH] mm: memcontrol: fix warning when allocating the root cgroup
> 
> Commit 3e38e0aaca9e ("mm: memcg: charge memcg percpu memory to the
> parent cgroup") adds memory tracking to the memcg kernel structures
> themselves to make cgroups liable for the memory they are consuming
> through the allocation of child groups (which can be significant).
> 
> This code is a bit awkward as it's spread out through several
> functions: The outermost function does memalloc_use_memcg(parent) to
> set up current->active_memcg, which designates which cgroup to charge,
> and the inner functions pass GFP_ACCOUNT to request charging for
> specific allocations. To make sure this dependency is satisfied at all
> times - to make sure we don't randomly charge whoever is calling the
> functions - the inner functions warn on !current->active_memcg.
> 
> However, this triggers a false warning when the root memcg itself is
> allocated. No parent exists in this case, and so current->active_memcg
> is rightfully NULL. It's a false positive, not indicative of a bug.
> 
> Delete the warnings for now, we can revisit this later.
> 
> Fixes: 3e38e0aaca9e ("mm: memcg: charge memcg percpu memory to the parent cgroup")
> Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>

Acked-by: Roman Gushchin <guro@fb.com>

Thanks!


> ---
>  mm/memcontrol.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index d59fd9af6e63..9d87082e64aa 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -5137,9 +5137,6 @@ static int alloc_mem_cgroup_per_node_info(struct mem_cgroup *memcg, int node)
>  	if (!pn)
>  		return 1;
>  
> -	/* We charge the parent cgroup, never the current task */
> -	WARN_ON_ONCE(!current->active_memcg);
> -
>  	pn->lruvec_stat_local = alloc_percpu_gfp(struct lruvec_stat,
>  						 GFP_KERNEL_ACCOUNT);
>  	if (!pn->lruvec_stat_local) {
> @@ -5222,9 +5219,6 @@ static struct mem_cgroup *mem_cgroup_alloc(void)
>  		goto fail;
>  	}
>  
> -	/* We charge the parent cgroup, never the current task */
> -	WARN_ON_ONCE(!current->active_memcg);
> -
>  	memcg->vmstats_local = alloc_percpu_gfp(struct memcg_vmstats_percpu,
>  						GFP_KERNEL_ACCOUNT);
>  	if (!memcg->vmstats_local)
> -- 
> 2.28.0
> 
