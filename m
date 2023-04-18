Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB1F6E6803
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 17:24:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q174f6PhQz3fSp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 01:24:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=QAzdf8lr;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=QAzdf8lr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0d::62b; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=QAzdf8lr;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=QAzdf8lr;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q173j0V88z3cdn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 01:23:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOUkxBIC2Cz5Gx0Qbx4hYV9qydLXls7EOVVO/fKWM24=;
 b=QAzdf8lryAW5tqcwk802BOf2VjtQt0IYCwM8qLmBKvqoKZIbwtgYGd9L4zhJa2CrnY88SOiDchFjxT7sJMvHIzPzYbdwR0meTw57F8f6qJZ88gvHcsLEs1u/QwOIhPw701X2ewoMdj210nO8PVF/lJr/fcI7J6S4AahSlOjJX4E+tlUG3nCMKCYs10RC9sIgcmaDJIM7ThddJa/H1dx3UZ39FGCYbWLj5H2jJ0HEWO2JE5s7aw/xOg9qdLT1Y664e/UUQKO6lu2UU1eJEW4yu56u6hOUit3qgiKCdBb/pgFe5Q174WMrVpfc0FzyBbGuauC8VifHazTfD6colm6uNw==
Received: from AM5PR1001CA0036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::49)
 by DU0PR03MB9566.eurprd03.prod.outlook.com (2603:10a6:10:41e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 15:23:04 +0000
Received: from AM6EUR05FT036.eop-eur05.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::50) by AM5PR1001CA0036.outlook.office365.com
 (2603:10a6:206:2::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Tue, 18 Apr 2023 15:23:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.86)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.86 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.86; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.86) by
 AM6EUR05FT036.mail.protection.outlook.com (10.233.241.222) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 15:23:03 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id C28EE20080266;
	Tue, 18 Apr 2023 15:23:03 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [104.47.18.104])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 1595920080073;
	Tue, 18 Apr 2023 15:24:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIx57jjBsUKOEsnjMmrjsQ+WfGJ63fpzkIziRSDe+MwFROyjGyaSndiW/idmo1VJbHpTppltfUDFT8vsZNf5JQIPhSmiX9y+B8rt4ASl4ySeg0AMkfSPf+RIu8FVExycdyI4o7vrPRY7lBu7x0HuL942JsBRqdA+qoBnMezoFNJx5PbWp0i5nH13EcVWV0mUWpqeBSzxyUJ47IkZm4x/3yqgwyHKBCbplAbSOeTI6oFuTaTNwEMjQeIkUINh56AE+SqA9+LbeRk1w1lZDmbom2mevToIg2Ry1dWNgLFUeFs5bhhaL5Mpbf2Qo/eBVQKfSD/eGPukMz+ZMyPKHDIcbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOUkxBIC2Cz5Gx0Qbx4hYV9qydLXls7EOVVO/fKWM24=;
 b=VqluJ23ydD/R4qtjxG0s7UFZ9WpGK7Gy8cfbJ9kd8vuTa4LjXJzYeMkjK0WJmVLfcOiOqXwwEhrCQqBAcy2ULSyXMN8Z+Ad1eZWrT2RVz8Rpf0A2yLbv2dYTxwzAWHi7l7IQZE5MEoRVv4f34WMSiRc9cGSgiCDXD0hx7dsP2AXlOAE6VM8o0XAiDnVtaQkZYD+yOGQ0u3QcrMl/Hf/D7l/c2EbqEPAVpl//Ftu4/U0z8lOiuESA/3S2yYeNlqXr9pGCpzeW9bbFXEjd+c/0n+wlWQstHuf6nXO4vlcIpBVYKMhsxT7Oq5gqyM4iO+X3ZVSYRCp9hh1OvQopA7bgcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOUkxBIC2Cz5Gx0Qbx4hYV9qydLXls7EOVVO/fKWM24=;
 b=QAzdf8lryAW5tqcwk802BOf2VjtQt0IYCwM8qLmBKvqoKZIbwtgYGd9L4zhJa2CrnY88SOiDchFjxT7sJMvHIzPzYbdwR0meTw57F8f6qJZ88gvHcsLEs1u/QwOIhPw701X2ewoMdj210nO8PVF/lJr/fcI7J6S4AahSlOjJX4E+tlUG3nCMKCYs10RC9sIgcmaDJIM7ThddJa/H1dx3UZ39FGCYbWLj5H2jJ0HEWO2JE5s7aw/xOg9qdLT1Y664e/UUQKO6lu2UU1eJEW4yu56u6hOUit3qgiKCdBb/pgFe5Q174WMrVpfc0FzyBbGuauC8VifHazTfD6colm6uNw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAWPR03MB9788.eurprd03.prod.outlook.com (2603:10a6:102:2ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 15:22:58 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 15:22:58 +0000
Message-ID: <e9c2b2df-72e5-f0ab-728a-255e8b2e565d@seco.com>
Date: Tue, 18 Apr 2023 11:22:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 2/2] soc: fsl: qbman: Use raw spinlock for cgr_lock
Content-Language: en-US
To: Crystal Wood <oss@buserror.net>, Li Yang <leoyang.li@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20230404145557.2356894-1-sean.anderson@seco.com>
 <20230404145557.2356894-2-sean.anderson@seco.com>
 <48dacc58c7c04ba8a005d8edd56744c8455f007e.camel@buserror.net>
 <d4737c45-2bbf-d364-9768-20baa46f6af4@seco.com>
 <3b707d1c-1120-274f-6cd6-b3283a334563@seco.com>
 <497c92b50103a4ba3469cd41edbd967ee9bfb291.camel@buserror.net>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <497c92b50103a4ba3469cd41edbd967ee9bfb291.camel@buserror.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P221CA0029.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::25) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|PAWPR03MB9788:EE_|AM6EUR05FT036:EE_|DU0PR03MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: 268a86b5-78a6-4f95-9595-08db4020cdd0
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  1Wr6hZqCtiCN2v95JDDW/2jvIccgo4m90ocBk4xxyiXXwYinT88Gov7cCTQUaLEwlWg2ur+2mMnwnPgpCoCa6+wE2oBu3KJQtnCXscTv2m3iK6S3N9DllPI9Hig6YscZEjWWS7Gz4OfW36sZ2UhoHK1SQ8a4ndPcPbJQiQXhvdpxEpkY4FCjEdG14G59CMEU8O2kaYnk7tHkPo+si97+pJJtv8v/nT8UjyatfR3BhaL6QmVbzVfDq3r8+4ChsAtw7ccoZRjgqbeeMdbQJNv2LqunTwhONYkPpBwbYvYoC5bf0bTXEQ0+IaKd5NsKXRjY4QRALXyGmKSI6+HFIPlbQvjIWY5fabCY2wOTRF52I2QfxtBXtVEE5Hh3Y3N7OSzDiYxIm+6WCQu1cSWSyqv+ilswtxH2hr4KLTb5GfUyBxWldXBXQh5EwB1s71X9r0D9W+lCSStwsxdqoYxdweWshRpMepc0wMkMsN4epUWcK1lNQp8TxmJyKq2DXJDtZGKBfoVg8E/cM2jIclTpDHquuWW8cxwFMkpvpKMwI9n2Ao5KW7l/xCFUe0jR0/G57eiq+9ZD9KtBSk8CMPgg4CxvDMonGAgRvaAeAmDaW+7LwSl9A3bYUZfxIjVQrjX4MoBRea9sWjDF9SwCKGGANv16cuTmzd2+jyCbVBWNgRQVCZAm4EM1mDHYAg2wXd93r1a8
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(39850400004)(376002)(396003)(451199021)(6506007)(86362001)(31696002)(26005)(83380400001)(6512007)(53546011)(36756003)(186003)(2906002)(44832011)(7416002)(31686004)(2616005)(6486002)(52116002)(5660300002)(38350700002)(38100700002)(6666004)(8676002)(8936002)(66476007)(478600001)(110136005)(54906003)(41300700001)(316002)(66556008)(66946007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9788
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT036.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	6eadbde8-6ea6-460a-16ec-08db4020c8d7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	pfjckRU0hiSSlcw0wDNgOxyOT57yO27Ry4PepPYhDnQCM84aerifCG+Ztk7LwTIqnD16wR5xMchpP7p6Hs0Jk/Cf5b/kMIGC2SB9uOrA/NoFq/fQzKx1Zdj3k8Ym1Nn/atHMCf/GllVx7+M8J1MKaNz5E+p3IFFGT5rxATIeyEYB6Wxky9cdyc7k04z/cGpzcdKPoIUcnR0Cd8XISk1eBETysiFPAYYU9kMQgw+pEPlyUHDfulNoj7DbgVq4qEqBUgzCoP2VdWziEUsvxuCT7tVUzGR45pNdMK3KGZVdMGVv9soLU17In7+d4zyMOftgUpMUsko7MwPjqUUG/HIgp6ZXWpMIpJVEK/vByLvshLch8jwRq25M9PJwN0i4yjhFgL74G4KZrsGYXPC6JsmxKGn3I67uVhF0fyOVgHiEozFFtElkyBXKH2hEjvfyvyctrPwnM9eYcJdyW5YqAd+ELP8ZkzTU/EqgT1teiKD1V4CSC2Hv4XDmKc0rnQ85wK7gqldxUvTsnXCUD88O8v5x+5GAcXmbVldsrpte6PQLkgyhE23QI+akGjx3AyL5CLXe3xGpsPnqlq2Bah1G7cJY8MXped0Am3oZWAjXl5pFISiJF+jYmfQFt+tJTlGLtEp30qKdVhCuIklhjhLw1vOoDdQu46AW1EW0AG8uUzdxs3bg5/zvp8fmijVOtlMaO25Pp9oLfHKvs48+FcszQmJtD8lHuHArksLZIssW16RXgN1I3I2BtdnxJIzorHq+OheDqokeUiyhU2V0/7kN09hEYA==
X-Forefront-Antispam-Report: 	CIP:20.160.56.86;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(39850400004)(376002)(451199021)(46966006)(40470700004)(36840700001)(36860700001)(2616005)(110136005)(6512007)(6506007)(26005)(6666004)(40480700001)(86362001)(54906003)(34070700002)(478600001)(31686004)(316002)(4326008)(83380400001)(336012)(186003)(6486002)(53546011)(47076005)(70206006)(70586007)(7596003)(356005)(7636003)(82740400003)(5660300002)(44832011)(7416002)(41300700001)(2906002)(40460700003)(8936002)(8676002)(31696002)(36756003)(82310400005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 15:23:03.8874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 268a86b5-78a6-4f95-9595-08db4020cdd0
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.86];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT036.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9566
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
Cc: Madalin Bucur <madalin.bucur@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, linux-kernel@vger.kernel.org, Claudiu Manoil <claudiu.manoil@nxp.com>, Camelia Groza <camelia.groza@nxp.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/18/23 02:29, Crystal Wood wrote:
> On Tue, 2023-04-11 at 11:09 -0400, Sean Anderson wrote:
>> Hi Crystal,
>> 
>> On 4/4/23 12:04, Sean Anderson wrote:
>> > On 4/4/23 11:33, Crystal Wood wrote:
>> > > On Tue, 2023-04-04 at 10:55 -0400, Sean Anderson wrote:
>> > > 
>> > > > @@ -1456,11 +1456,11 @@ static void tqm_congestion_task(struct
>> > > > work_struct
>> > > > *work)
>> > > >         union qm_mc_result *mcr;
>> > > >         struct qman_cgr *cgr;
>> > > >  
>> > > > -       spin_lock_irq(&p->cgr_lock);
>> > > > +       raw_spin_lock_irq(&p->cgr_lock);
>> > > >         qm_mc_start(&p->p);
>> > > >         qm_mc_commit(&p->p, QM_MCC_VERB_QUERYCONGESTION);
>> > > >         if (!qm_mc_result_timeout(&p->p, &mcr)) {
>> > > > -               spin_unlock_irq(&p->cgr_lock);
>> > > > +               raw_spin_unlock_irq(&p->cgr_lock);
>> > > 
>> > > qm_mc_result_timeout() spins with a timeout of 10 ms which is very
>> > > inappropriate for a raw lock.  What is the actual expected upper bound?
>> > 
>> > Hm, maybe we can move this qm_mc stuff outside cgr_lock? In most other
>> > places they're called without cgr_lock, which implies that its usage
>> > here is meant to synchronize against some other function.
>> 
>> Do you have any suggestions here? I think this should really be handled
>> in a follow-up patch. If you think this code is waiting too long in a raw
>> spinlock, the existing code can wait just as long with IRQs disabled.
>> This patch doesn't change existing system responsiveness.
> 
> Well, AFAICT it expands the situations in which it happens from configuration
> codepaths to stuff like congestion handling.  The proper fix would probably be
> to use some mechanism other than smp_call_function_single() to run code on the
> target cpu so that it can run with irqs enabled (or get confirmation that the
> actual worst case is short enough),

Well, we used to use a kthread/wait_for_completion before 96f413f47677
("soc/fsl/qbman: fix issue in qman_delete_cgr_safe()"). The commit
description there isn't very enlightening as to the actual bug, which is
why I CC's Madalin earlier. To be honest, I'm not really familiar with
the other options in the kernel.

> but barring that I guess at least acknowledge the situation in a
> comment?

Fine by me.

--Sean
