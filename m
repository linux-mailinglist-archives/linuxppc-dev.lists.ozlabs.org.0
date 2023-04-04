Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB46D6855
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 18:06:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrXgj1wwkz3f4C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 02:06:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=UlYBPOV6;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=UlYBPOV6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1f::625; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=UlYBPOV6;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=UlYBPOV6;
	dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on0625.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrXfm5RgXz3cLf
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 02:05:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0luv6NY+urHZbC0u5FpKow5nvbBafEgBjiNglwO0znU=;
 b=UlYBPOV6REq8xkmGjQoPcOTlbPLdc0k8VjZUF9AEaG6LGQU5comuXP9MCWJ/JzgkzXKrWjBy2eK+CQUl0BcCRnieW13jSYeJGxxy55fWXxyAEQlvZwXec5GBla0qnUCPwcQ+TBiR0FJuU/yiC8ESzUJn425429fTKUnhUMY9twKNvfL6X/KL3FLYAaTPqPfwMAAYFTiOxiPalksW/YX0ytwFW3vGH7dYCnMMIbHoMLOBIFtOzf/bFZ0aT6yIk2kly7FGn7WFGmzxkNSmVjqLNjEUEDZsSdNsZn3h/1nHdB8BXBkxDHh9cFQAr7ZencTpeTn60WHJbTMM9RZJ2RSyzA==
Received: from FR2P281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::11) by
 DB9PR03MB8325.eurprd03.prod.outlook.com (2603:10a6:10:37d::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.35; Tue, 4 Apr 2023 16:05:13 +0000
Received: from VI1EUR05FT060.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:a:cafe::c5) by FR2P281CA0001.outlook.office365.com
 (2603:10a6:d10:a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.28 via Frontend
 Transport; Tue, 4 Apr 2023 16:05:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.80)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.80 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.80; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.80) by
 VI1EUR05FT060.mail.protection.outlook.com (10.233.242.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.45 via Frontend Transport; Tue, 4 Apr 2023 16:05:12 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 703EC2008026F;
	Tue,  4 Apr 2023 16:05:12 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown [104.47.2.57])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 31A3320080074;
	Tue,  4 Apr 2023 16:05:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=da2GOKx8hz3AEKnImPgkBu2qx/qp6ANuD9EPFnP7PcGWkkitaN3+Rv0tzeu5m106/ztZK+Bn3rKC3RbFyIVbUT3NL41Az7PRvlKu2svBQ7qt/bqNflHunOrZ+aa7PkSxpjEASK/3KPcc0J0m3wgwn00Pk5lvYZLh5JQGB088DNnAOZmyyOAcH2SavH8NTZM8lrZs46agBzAOtUF556Ne39kiv8TPva6bW7bjjwqm/7HXkNQzd9BLE4iN55OA3xLWwDmZkxxjBUku37X8wVmnyavsBlVwTsYN/BAoPlC/8rKR6tc0BRieEDsNAGYbb5cZwoHrrmVuy6mKr56CwYfgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0luv6NY+urHZbC0u5FpKow5nvbBafEgBjiNglwO0znU=;
 b=VgjF+jmkcEnv/OpTQpIvtFOw56tSHnovEVuu4DzFwjXH89Fs3HlixQpNxRzjrCBrjp270Judta8b/XhxNVGSsSn3yO4KjsLj6if7gbSOXGtrfKThiilWHVN/KZlZE9RE9Iiim/JFUfQLt/aufBir+L2lhFM+6jMT0bUNo4VxhGsmF6Kah7zIsxawcvfqY5nSc8vsDKJfBSJvloRS8/yWSa7y+I5PmEAoeElbHl5OnlKdgZmQkuevsrTJIGx+HIOkoPa4r8OJkSW7A9qyH4xBN4KWb9zEZaElr1afUUcLhklVe1vj0SUxBrJNjJ6bfjKFOnjDFlYAqjNGW0aDG8QuuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0luv6NY+urHZbC0u5FpKow5nvbBafEgBjiNglwO0znU=;
 b=UlYBPOV6REq8xkmGjQoPcOTlbPLdc0k8VjZUF9AEaG6LGQU5comuXP9MCWJ/JzgkzXKrWjBy2eK+CQUl0BcCRnieW13jSYeJGxxy55fWXxyAEQlvZwXec5GBla0qnUCPwcQ+TBiR0FJuU/yiC8ESzUJn425429fTKUnhUMY9twKNvfL6X/KL3FLYAaTPqPfwMAAYFTiOxiPalksW/YX0ytwFW3vGH7dYCnMMIbHoMLOBIFtOzf/bFZ0aT6yIk2kly7FGn7WFGmzxkNSmVjqLNjEUEDZsSdNsZn3h/1nHdB8BXBkxDHh9cFQAr7ZencTpeTn60WHJbTMM9RZJ2RSyzA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS2PR03MB10139.eurprd03.prod.outlook.com (2603:10a6:20b:5fe::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 16:05:02 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 16:05:02 +0000
Message-ID: <d4737c45-2bbf-d364-9768-20baa46f6af4@seco.com>
Date: Tue, 4 Apr 2023 12:04:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 2/2] soc: fsl: qbman: Use raw spinlock for cgr_lock
Content-Language: en-US
To: Crystal Wood <oss@buserror.net>, Li Yang <leoyang.li@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20230404145557.2356894-1-sean.anderson@seco.com>
 <20230404145557.2356894-2-sean.anderson@seco.com>
 <48dacc58c7c04ba8a005d8edd56744c8455f007e.camel@buserror.net>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <48dacc58c7c04ba8a005d8edd56744c8455f007e.camel@buserror.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0222.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::17) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS2PR03MB10139:EE_|VI1EUR05FT060:EE_|DB9PR03MB8325:EE_
X-MS-Office365-Filtering-Correlation-Id: b582d2db-5fe5-40fc-2ccf-08db35265f6c
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  HNehBWq39FDrO2xoctyLlO/Km4NI+2+e1ghOE4fAbSZMU+pkC9svdxoj8pkDyT7rSdk8skBE5kJtd/a7MMie+P9hVmGymqvVyO9rafyBk0zLTfo8NirjX9teKfX8sdcOALjbBxjR/2y8cP4n+qYiO6q8CQKNMriNEZ1YMW7zKwTTXcmn3crMiTuLvq04jX3fRrNM1keEOriZkx1zbP9xAeggnpmA+5fjxj4txbOD8rbQI1SIdIjZTD1tnvfUarS99eeCtLPz6Fd0Rt/fX7e4bqyE+mqgEl/+aFxZy+J8ZnZNws98ojaLUqpzVdx+nYNTIit39k4Mtz2d2Mz3Y9gtl0S144wwqSDkuMHr/zv2tMexTINrHVat+e7qo6AJ2G3mfdPGyNaBicWmd1y5E4z+vkdtVIkZLNIWsNbXb0Epg/AFZRPAGKuZsX4LaVojIuPaF7D/y5lTXY5nIrd9J/87L8uLl/W6xWCh0KlT/PpTEcSOuph1Fs/SikgoNynNbaabRwC5V6w9AqkBRRanGcBtPOggwfCfJqJR11V1qhJrwT9QBpkGGSVh+ljcGny99EUwpir+PNZty2VZAMK1i+2yvBCVs23XAq67giY+xSIJw/RtpkJ5ZJur69PGr2JQG5nhiG9QgjcAJRmcvJDKvKU67xgoURvl0KN/YH9dTy+Yfzw0VPKPea65dhiMw6XrsNre
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(396003)(376002)(366004)(136003)(346002)(451199021)(7416002)(5660300002)(44832011)(86362001)(83380400001)(6666004)(186003)(6486002)(31696002)(53546011)(6512007)(26005)(6506007)(38350700002)(38100700002)(2616005)(8936002)(66946007)(66476007)(8676002)(478600001)(66556008)(54906003)(4326008)(52116002)(110136005)(36756003)(41300700001)(316002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10139
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT060.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	52e6f84f-c9a6-4ed5-1223-08db35265915
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SLBMLKXckImL4KhmbYMrbpgCukIusYz/khktkqS3hPihXySFxYof13YrM6COCl1k7neVPfgh4E2SAMuZAvuTjwfQJFOquNTLR4XZdXyeXdtyTW8M3cdGlXpkrHd/O0J/+uqOUpAHqY1VH88ggkkSZa41Ji+hZ1vv0lZ9yJ7ZzwZSzjEkNG1pXuFKoLjnjPlGqEpXCFEdbfREVCQ8WhEVgqmZnUkcZ7Cn/s0FLj6qv2ZwemBswVoYSAKjiQugaSFBvQL68Z0EUoDY7oaeS5aHthAutNCBX0+Jwy+w+cHTzv/SnntWQeiIy6EXrSMnyUAGharABJMGav+EOSIgUw1jdAvQklj0GJJVpNJOOTnnXTkUuRpkibjnxOelHs59N0SNGujvW0XZC/kMyp7onl8jdLEKBr7VJY4LJVardRl1MbQmkhphOcpMT4TMDDGjU/pu7htsTvwdx3rk461hx+pkxWuY7BlyhptunhNyCyRH/ZBhn8DrqRlbEQYDk0p4DfqHne6YPL/7m8QJmUVIPHkwXez+mZsDQiVYl4V45+hWXVQUIiDHVpyqSeeXCfBmJAAP5H6gfx5JsU2c3xKA8hShkxmEybH9H1/xIF/YsMHpaASmVNxYnIwoPiFhEwja4GO7F8egr1eekmWGfhB86sy5zy6nJOZ+E/ORTN2ztOD0hllL93DyWmQih9s6hRaw+Xqepdg0gxkYz8dAjAWDM9Hbg9TF12mUM8P8LfyGDjtBFtOzxXaDlYMcNK09PBSot4yAJcLB35H02F41nk6tyHCZwA==
X-Forefront-Antispam-Report: 	CIP:20.160.56.80;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(136003)(376002)(39850400004)(346002)(396003)(451199021)(36840700001)(46966006)(40470700004)(2616005)(336012)(36860700001)(83380400001)(47076005)(6666004)(34070700002)(6486002)(6512007)(478600001)(316002)(26005)(186003)(54906003)(6506007)(53546011)(2906002)(110136005)(5660300002)(7416002)(44832011)(40460700003)(36756003)(7636003)(41300700001)(4326008)(31696002)(8676002)(356005)(70586007)(70206006)(82310400005)(82740400003)(8936002)(86362001)(7596003)(40480700001)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 16:05:12.7605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b582d2db-5fe5-40fc-2ccf-08db35265f6c
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.80];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT060.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8325
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

On 4/4/23 11:33, Crystal Wood wrote:
> On Tue, 2023-04-04 at 10:55 -0400, Sean Anderson wrote:
> 
>> @@ -1456,11 +1456,11 @@ static void tqm_congestion_task(struct work_struct
>> *work)
>>         union qm_mc_result *mcr;
>>         struct qman_cgr *cgr;
>>  
>> -       spin_lock_irq(&p->cgr_lock);
>> +       raw_spin_lock_irq(&p->cgr_lock);
>>         qm_mc_start(&p->p);
>>         qm_mc_commit(&p->p, QM_MCC_VERB_QUERYCONGESTION);
>>         if (!qm_mc_result_timeout(&p->p, &mcr)) {
>> -               spin_unlock_irq(&p->cgr_lock);
>> +               raw_spin_unlock_irq(&p->cgr_lock);
> 
> qm_mc_result_timeout() spins with a timeout of 10 ms which is very
> inappropriate for a raw lock.  What is the actual expected upper bound?

Hm, maybe we can move this qm_mc stuff outside cgr_lock? In most other
places they're called without cgr_lock, which implies that its usage
here is meant to synchronize against some other function.

>>                 dev_crit(p->config->dev, "QUERYCONGESTION timeout\n");
>>                 qman_p_irqsource_add(p, QM_PIRQ_CSCI);
>>                 return;
>> @@ -1476,7 +1476,7 @@ static void qm_congestion_task(struct work_struct
>> *work)
>>         list_for_each_entry(cgr, &p->cgr_cbs, node)
>>                 if (cgr->cb && qman_cgrs_get(&c, cgr->cgrid))
>>                         cgr->cb(p, cgr, qman_cgrs_get(&rr, cgr->cgrid));
>> -       spin_unlock_irq(&p->cgr_lock);
>> +       raw_spin_unlock_irq(&p->cgr_lock);
>>         qman_p_irqsource_add(p, QM_PIRQ_CSCI);
>>  }
> 
> The callback loop is also a bit concerning...

The callbacks (in .../dpaa/dpaa_eth.c and .../caam/qi.c) look OK. The
only thing which might take a bit is dpaa_eth_refill_bpools, which
allocates memory (from the atomic pool).

--Sean
