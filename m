Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCCE6DDF1B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 17:11:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pwq6t2vyZz3cf2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 01:11:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qdxZZCtn;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qdxZZCtn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7eaf::615; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qdxZZCtn;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qdxZZCtn;
	dkim-atps=neutral
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaf::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwq5x3j63z2x9L
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 01:10:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leNIrRxjY8AsxVsKr1qlD3qC8pXD5zDwgwY/xiy22Ig=;
 b=qdxZZCtnfKeiY3cercJZf4f6baqUqypUOAOCF91k7UWCTp0hMvBCfkuKHX9Ltq/9w24WaabAtacStjNKdABDyUxck94I4FjjTVpR/MncDr4wPeirtuqaD0fwGMcQeJonyHy9wtgwzLoLTJJT29S6p7bpcFh0HtP2RoWDq7SoEaMcn+bDHA/Z+6aN3NSQM0AGfV0tv+R1RpQg4dsZmouGPZHEjj60Bn6i4M2MN5mxaTVK/ui5hT5OngS5K+NmXaj98+vo2korQHmPuhlSUTuBBtmZ/JpH/BiICzSbYj/aRXXTvQdMziMSgqNCnlPnzRgvHhf6cbXaoT/dgPTtvpgWOw==
Received: from ZR0P278CA0007.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::17)
 by AS8PR03MB8004.eurprd03.prod.outlook.com (2603:10a6:20b:42b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 15:10:06 +0000
Received: from VI1EUR05FT037.eop-eur05.prod.protection.outlook.com
 (2603:10a6:910:16:cafe::20) by ZR0P278CA0007.outlook.office365.com
 (2603:10a6:910:16::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Tue, 11 Apr 2023 15:10:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.80)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.80 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.80; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.80) by
 VI1EUR05FT037.mail.protection.outlook.com (10.233.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 15:10:05 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 66F562008026E;
	Tue, 11 Apr 2023 15:10:05 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [104.47.17.171])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id B81B12008006F;
	Tue, 11 Apr 2023 15:10:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwVoS54jmAoEPi1Cxp24Qec5yhDpnoaHzTgPzlRQhxALH1RkYAeQRXEGC0tsxvBYf5IrTn7UrpUqaMcF+lpkVqbuSN5Qhi+5apWfiDQb1CL4GmKKgckGjqpukf2fVMTdZMwRwOP8RGICDOVV+Crdv3fXsYprpz2Oy2sfcsE/85ogQ/0YrT/08WaduR/wNpTiDF255SMmhM9KjYqZvkfPgFlzEwoEK/cz9FhCXDv7jIZ2GCw+ERTnyq5DXLTs61hLi+ILDiq7dQBelTo14bEoG8dCeiW7MR0T56wu/zzF+mHaviqBWDWtnS/FtNaXcQuX8tNcFY6lAFDmksriV0tCDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leNIrRxjY8AsxVsKr1qlD3qC8pXD5zDwgwY/xiy22Ig=;
 b=CK4UL6/FRfk5FODYCqgaAkIh5X/q4BxqHXdMVn5jGLcOTYK1JeLM5GNed1ykOHB2c7fb8FaOZe5p16+oeAhnocJXzTYQGf8x8539Av3gGJqy12kss67MtFI1YUHKQ3hCua+xwFmK9GqyitbYp4QsxyxkDNUB+Mz03V5YkgkuHhib9JRReiIA8mUL8DsGMtXXbpOZmtplNYjg+643bWzoZqaqvjopJ1yk1Ki0oUuILYJwMO1ARU1ZiUvcRFPv3hlilfVLdfau3OnBDr3WS5H7r5aZku36pOEHmcveI2WUG3R8tOp6XTbZlayuc/NEeVY1GC/UyR/wy/qkxDJ7Q6KlIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leNIrRxjY8AsxVsKr1qlD3qC8pXD5zDwgwY/xiy22Ig=;
 b=qdxZZCtnfKeiY3cercJZf4f6baqUqypUOAOCF91k7UWCTp0hMvBCfkuKHX9Ltq/9w24WaabAtacStjNKdABDyUxck94I4FjjTVpR/MncDr4wPeirtuqaD0fwGMcQeJonyHy9wtgwzLoLTJJT29S6p7bpcFh0HtP2RoWDq7SoEaMcn+bDHA/Z+6aN3NSQM0AGfV0tv+R1RpQg4dsZmouGPZHEjj60Bn6i4M2MN5mxaTVK/ui5hT5OngS5K+NmXaj98+vo2korQHmPuhlSUTuBBtmZ/JpH/BiICzSbYj/aRXXTvQdMziMSgqNCnlPnzRgvHhf6cbXaoT/dgPTtvpgWOw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB6871.eurprd03.prod.outlook.com (2603:10a6:20b:29e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 15:09:54 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6277.035; Tue, 11 Apr 2023
 15:09:54 +0000
Message-ID: <3b707d1c-1120-274f-6cd6-b3283a334563@seco.com>
Date: Tue, 11 Apr 2023 11:09:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 2/2] soc: fsl: qbman: Use raw spinlock for cgr_lock
Content-Language: en-US
From: Sean Anderson <sean.anderson@seco.com>
To: Crystal Wood <oss@buserror.net>, Li Yang <leoyang.li@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20230404145557.2356894-1-sean.anderson@seco.com>
 <20230404145557.2356894-2-sean.anderson@seco.com>
 <48dacc58c7c04ba8a005d8edd56744c8455f007e.camel@buserror.net>
 <d4737c45-2bbf-d364-9768-20baa46f6af4@seco.com>
In-Reply-To: <d4737c45-2bbf-d364-9768-20baa46f6af4@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:208:120::29) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB6871:EE_|VI1EUR05FT037:EE_|AS8PR03MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: 51e4f0af-2b71-4287-6f58-08db3a9ed516
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  Tb0jPIiwDRV+osQVFmAe3gKUHQlKvTPrIQ5mSJdKW7cfNMps22C4VS148UAJrobrjNk+DsBK4+6qgf0PxMB3ytwoQtF4SwiPbCW+QVHKvz0Ej2j5pLVxKfIvhnX5sdKl2+7ovr5AZPmmVNWjY2GF41SDaL9u0Bl5oVybp+BD04+8/owozcjJ5dVOyT/15cyUI3jHniJpCzo1ofZ0qmKa7/n7Gy5M4R9iAkqbdc2N36Z0J4OBgq2yKy9QLgRzy6py0p0rRwwJ/M7PIBJZYwMiLvCW6VioguEv59KmBXS0x3nlBtO5B+PSrt+URhq3fiN+w25H9sEg7xdnTIh5XdR7Ee7qkUFkva2Xi2theJVbgkSnvB0/dczSZHfYtNkW/Ia4rcoUb0wGlM6DETwTirEByig/bL+qYpKoPGbxML1P+rqoTeDgDJONCvd+tJTayctGcznbJ/j5fLxH8/QMNLLLbthK1wx9YaPuZDk0JPCZ22rxoskfs+HEd1Y2NIRYgOR90nleMZro3M3Y165qXWdVc8nIan0OdfXLAy1Pjo2kUZze7L6LuoTqAcnVPaoGL8PR7YVL38uxh6III1/s2pv3Z8o3PiRWDPeLWG/M9mtLssvFwrVetdmI8xcolaLikvRr7A26ZdfoNVFrKL8RoN3a6KyNSclEk9AB0E2VFuGfMC4gQJDAVG/EI4UMTxDHbj0n
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(39850400004)(396003)(366004)(451199021)(8936002)(52116002)(83380400001)(6666004)(66476007)(66556008)(86362001)(66946007)(110136005)(36756003)(478600001)(54906003)(186003)(316002)(8676002)(4326008)(6506007)(6512007)(53546011)(41300700001)(26005)(2616005)(31696002)(6486002)(31686004)(38350700002)(7416002)(2906002)(44832011)(38100700002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6871
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT037.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	3b52a49f-6cd7-49b4-67c8-08db3a9ece40
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	XhgQNpSmuiD85jmfBsxm/9NvLgdQAhGDHTfMHwfHvOeghsuj74yw834u7DR3Xe9g6eR0RpKawqnP7zzv2IZ4fUa4MyqVs+awrGzMotj1Bzhxgrhk5dww0srUHVcNGw750YpBaBgrbZaA0m1Vg5t/1KIfkXK9nBIura+WSscqL16yaBbLk3tFgXS0nBoJ6JapX8SFA2AVfA/15Iw4qkf4DiHgoZ2ca7CWvyb3WUuc5LT2kFhO4cT/8Kz2Tnr2PeRHta+3dszPvf/tpRjxXJw+PxTdvQu137aQLWK0MB+fMkH9PoeteKEMmTwQruONHPRrvL4ruMQ+DYtCXqFER/0L92UKVYVAZnfQMkygb0dV9xfw0o+ePI54gMrSgbQ+CetXJ6RtULH+rzX2Hg3Nkc1trMf8A5MTARfr9ZDQot1o+gH996yba5BGqJUa8/ll9jcqekB8peY6EZnvmeXTtXc4WN1vO3i9xEtmhjyEGZHDenkfUTEILNH+SEtcfHdFqBEMI1dsurcj68WHAJLV3ZnQdu4SPlLF0o7CxOVeifiasBO8kC9SEjsV+9di+3We3Pqoj93b61n+d219r/801e2PYGCuCa9zrPY6u5y0MHJg0BvzNkPDRS2NQIt7bmk2kh3mjz/eAG2nF1txV6/vLWTI+k8wpb+aNrY0Ou5GyEDTvCqHofcgwk8OQU9xKirRi3Mofnn3U7zyr+MIEQEmWdheypMB3VZMYUeye3oyOfJl/Srwpf+sJzRpPZMrS8xR6c2muBHQc8gvZrMFWy46dfXgEg==
X-Forefront-Antispam-Report: 	CIP:20.160.56.80;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(39850400004)(396003)(451199021)(46966006)(40470700004)(36840700001)(8936002)(40460700003)(336012)(47076005)(83380400001)(6666004)(70206006)(86362001)(70586007)(110136005)(36756003)(478600001)(54906003)(186003)(316002)(8676002)(82310400005)(4326008)(6506007)(6512007)(53546011)(41300700001)(26005)(2616005)(40480700001)(31696002)(6486002)(31686004)(7416002)(36860700001)(2906002)(82740400003)(44832011)(34070700002)(7636003)(356005)(7596003)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 15:10:05.6537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e4f0af-2b71-4287-6f58-08db3a9ed516
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.80];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT037.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8004
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

Hi Crystal,

On 4/4/23 12:04, Sean Anderson wrote:
> On 4/4/23 11:33, Crystal Wood wrote:
>> On Tue, 2023-04-04 at 10:55 -0400, Sean Anderson wrote:
>> 
>>> @@ -1456,11 +1456,11 @@ static void tqm_congestion_task(struct work_struct
>>> *work)
>>>         union qm_mc_result *mcr;
>>>         struct qman_cgr *cgr;
>>>  
>>> -       spin_lock_irq(&p->cgr_lock);
>>> +       raw_spin_lock_irq(&p->cgr_lock);
>>>         qm_mc_start(&p->p);
>>>         qm_mc_commit(&p->p, QM_MCC_VERB_QUERYCONGESTION);
>>>         if (!qm_mc_result_timeout(&p->p, &mcr)) {
>>> -               spin_unlock_irq(&p->cgr_lock);
>>> +               raw_spin_unlock_irq(&p->cgr_lock);
>> 
>> qm_mc_result_timeout() spins with a timeout of 10 ms which is very
>> inappropriate for a raw lock.  What is the actual expected upper bound?
> 
> Hm, maybe we can move this qm_mc stuff outside cgr_lock? In most other
> places they're called without cgr_lock, which implies that its usage
> here is meant to synchronize against some other function.

Do you have any suggestions here? I think this should really be handled
in a follow-up patch. If you think this code is waiting too long in a raw
spinlock, the existing code can wait just as long with IRQs disabled.
This patch doesn't change existing system responsiveness.

--Sean

>>>                 dev_crit(p->config->dev, "QUERYCONGESTION timeout\n");
>>>                 qman_p_irqsource_add(p, QM_PIRQ_CSCI);
>>>                 return;
>>> @@ -1476,7 +1476,7 @@ static void qm_congestion_task(struct work_struct
>>> *work)
>>>         list_for_each_entry(cgr, &p->cgr_cbs, node)
>>>                 if (cgr->cb && qman_cgrs_get(&c, cgr->cgrid))
>>>                         cgr->cb(p, cgr, qman_cgrs_get(&rr, cgr->cgrid));
>>> -       spin_unlock_irq(&p->cgr_lock);
>>> +       raw_spin_unlock_irq(&p->cgr_lock);
>>>         qman_p_irqsource_add(p, QM_PIRQ_CSCI);
>>>  }
>> 
>> The callback loop is also a bit concerning...
> 
> The callbacks (in .../dpaa/dpaa_eth.c and .../caam/qi.c) look OK. The
> only thing which might take a bit is dpaa_eth_refill_bpools, which
> allocates memory (from the atomic pool).
> 
> --Sean
