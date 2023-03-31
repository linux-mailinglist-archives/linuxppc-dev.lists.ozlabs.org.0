Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C81236D233C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 16:57:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp3Kn4ymHz3fVs
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 01:57:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=esXbcDb7;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=esXbcDb7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0d::61f; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=esXbcDb7;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=esXbcDb7;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp3Jr60fcz3cdX
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 01:56:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJyTqfcVIY4zesAWvRSBKaOtUsoiC4pGX9mrz0a0Elc=;
 b=esXbcDb71Oiqoc21dZOTNvVwpqB36PWCHRKDRi4gYNg1KA1DvITrRdCWuHhboj5/6Pgs4ENZeYbL91cKwvMw8bh3WJuPJk35NztD5oM/KkRgqO6E1fsIRaGCexQLx9oZRmYmikDSoP/UVon1YflVhQr+VGE1H7cLuw/vfFcaiXNAfsJeHn5jygsXTj8mUFTsPzzvH5PNomsuG95BZbFFezTPyFFU9n1oLu2SyiPd9HmzOe5mgZzXQ1l6rNoBvZJJXaiGKNTSPRRtnKvhUbY5v6FIBG4H4jyTnmnf8/UwaNsAKTZrqT2YR3jZMDDz/1mhz6zi8aK5PkI99UpCi7+k7Q==
Received: from AM6P192CA0031.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::44)
 by PAVPR03MB9068.eurprd03.prod.outlook.com (2603:10a6:102:328::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Fri, 31 Mar
 2023 14:56:05 +0000
Received: from AM6EUR05FT020.eop-eur05.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::2) by AM6P192CA0031.outlook.office365.com
 (2603:10a6:209:83::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.44 via Frontend
 Transport; Fri, 31 Mar 2023 14:56:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.81)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.81 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.81; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.81) by
 AM6EUR05FT020.mail.protection.outlook.com (10.233.241.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.39 via Frontend Transport; Fri, 31 Mar 2023 14:56:05 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 2DEA82008088D;
	Fri, 31 Mar 2023 14:56:05 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [104.47.17.168])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 07F462008006F;
	Fri, 31 Mar 2023 14:56:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhHLeULJ6nzZyUsE/FYVFNuFUWJubmrosP+/0q9oqO8gvqrZox7NA/AWXKTocssLMlXw9Imx2w+ngWQkzC8soFEkyseGQV0CNT5uL5PoT1OCE/NM7ygqsSC93rNqw9tLYP8VdrpF8/8PEcq2HLb+EyMh0Yb80r3HZDi8fhj4WSteWlB3v5r8jl34oNF4PwbYgg4EPT7xceA9jcN3sdqxQ0in5W1MyIVm1/ZgG/4xYE9AMRiwRkFJ8OOynhHn8vc7RyLMNwXEAoa/jwtehujthWLgO7BY5KJMS8C4sn9awXtdauIb+x2BVp3xodn1c45QPivmluxQPpbrEFiwvQlOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJyTqfcVIY4zesAWvRSBKaOtUsoiC4pGX9mrz0a0Elc=;
 b=kkbSh/0z49EOvluAcEVrfu4I9Jxiv/pk8pQmBUg2PmIIUPtUelZaKcPqEozaam+aZXTU6QnCWVakz0XZMk/vNqNxSQvyUb/5J2MY93aSz/AInfzrIRtAAIN8f5HVsCDHXvd/PX0Ey64LxZ0FC2tGWYV2CwDVl6pgJQMGEzv5Kd22ZCQVWbMNZkB4x1o8pqR7SNlTuK0VFheyADYlfhz71AigWJCKkwoKT+KLTOM76XJtaxECVsvWXy13zU0OvaZwxea47D92AJQOUyGArMqky0MmaL7XK+q+JG0jGkBZ/wOI9b4zM6n98FEnWld3nVQOTdeVMc8YeHlICstYjGXblg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJyTqfcVIY4zesAWvRSBKaOtUsoiC4pGX9mrz0a0Elc=;
 b=esXbcDb71Oiqoc21dZOTNvVwpqB36PWCHRKDRi4gYNg1KA1DvITrRdCWuHhboj5/6Pgs4ENZeYbL91cKwvMw8bh3WJuPJk35NztD5oM/KkRgqO6E1fsIRaGCexQLx9oZRmYmikDSoP/UVon1YflVhQr+VGE1H7cLuw/vfFcaiXNAfsJeHn5jygsXTj8mUFTsPzzvH5PNomsuG95BZbFFezTPyFFU9n1oLu2SyiPd9HmzOe5mgZzXQ1l6rNoBvZJJXaiGKNTSPRRtnKvhUbY5v6FIBG4H4jyTnmnf8/UwaNsAKTZrqT2YR3jZMDDz/1mhz6zi8aK5PkI99UpCi7+k7Q==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by VI1PR03MB6287.eurprd03.prod.outlook.com (2603:10a6:800:132::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Fri, 31 Mar
 2023 14:55:57 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6222.033; Fri, 31 Mar 2023
 14:55:57 +0000
Message-ID: <ed94f05d-929d-c4dd-3b00-0fde2a1b4595@seco.com>
Date: Fri, 31 Mar 2023 10:55:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/2] soc: fsl: qbman: Always disable interrupts when
 taking cgr_lock
Content-Language: en-US
To: Camelia Alexandra Groza <camelia.groza@nxp.com>,
 Leo Li <leoyang.li@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20230327192841.952688-1-sean.anderson@seco.com>
 <AM6PR04MB57997C946E6AE7F2D87B5C78F28F9@AM6PR04MB5799.eurprd04.prod.outlook.com>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <AM6PR04MB57997C946E6AE7F2D87B5C78F28F9@AM6PR04MB5799.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR17CA0024.namprd17.prod.outlook.com
 (2603:10b6:208:15e::37) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|VI1PR03MB6287:EE_|AM6EUR05FT020:EE_|PAVPR03MB9068:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a9cbeb-96ff-4e03-c7b5-08db31f80da3
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  JMIKbtW4UumUx7F9cjTauqSN8ckMEbwyGsinLV+htALourWbV3ZjlKwgzMc/h4Yxmcs0lfsQkmIEZd/lp5CUIhsivTI/rNlZwTPTbuAFN4RPiDT7HH8WB2ilSiWu9z32okqdRIlKJcB9CUmwsXazq8UnOFjRFpiz8AnU9wBGPZ7kIlKRfgDjGDHF2gBGYMyZGz+KmCs8vlBqRu++5ohVBJnBX7JO1Pehpw63q5hKUGARJJWcJPsPhw7a9yf3U0Fq3cqj02nAttiwmEc1H2fwUYUduj5RNXKdgAmqwypUzPLmsVQymxXxkdzRGdFKEmq0wjuhAy2edRTWBp/eb38R04rLWBGpcXIKQiM6YnMhwcIYlZ2lTqi3uO6EYjnnhuK10C2aJNG7a6AfJcziaIYmCPDoISsypYYWU/rozEXWlKl9ijJfK5kMm2m+GmUbgLlbM5e5nD/XQm0hCKGSxELzySOxOz509Ogi5xAGwvextkaI3BMfHOImd4T7ersEofczH02HBPn3/Sz6Xlu7eAsuBNR1XcNT/Y2ljAQ8txBvkx8ay2aQ9CDbTWxrscJ+L3JdMPWW1YUUpHspxbP4B61R7DF9MGBQc2rMe1O0B9UGGtiggp4c/c2qPTp6T8E+0VByGGAoGCaf9hDnl1ca5Sg8lU5wiLqSBEt7n0AO6HR6h7EILn4mYZWwxst9Tj5U2HKi
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(39850400004)(366004)(396003)(451199021)(83380400001)(2616005)(86362001)(52116002)(6486002)(26005)(110136005)(316002)(53546011)(6506007)(54906003)(2906002)(186003)(478600001)(6666004)(38350700002)(6512007)(36756003)(44832011)(5660300002)(4326008)(7416002)(31696002)(38100700002)(8936002)(8676002)(66476007)(66556008)(41300700001)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6287
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT020.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	33ca7e93-7dc9-4e03-7bff-08db31f808b8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	yxEYlXdMg+61MSMlP/YefKGMUhAAWdYbgPg+2z1mydFJ6T+hnET3kne8ITKdHWMDAhj5o+2rPSFS5WsHKFpKQjod3sgvrdb21xo97VH3G9XI1fsvOry+U2yvseCpSLAvWhRFWn80DDf5sOq0kRXQLCvL+9tlm7vwNBY5wz0RGSNGoDOnhf8yjha43UYkVU+joh5k4sDlqytukOztCu2cU078rbsjjuk/qpAP9xrqUe8Aezu6kzwjvsAEQDwb7amVaV4FWvnxZ/7t45ER7VS1bU51uSU4rkcl5zm+9Ie/Oa+fZMRr8TFJoBEZ2t6bsoy2+9WXuhnX0GE9CdttNOqyn1l8T2fcun3FiGcxWVjKQDfi3cY5gdOZ95CP7NMOPdHCcOIV+An1tsM4/xBI3tMwv50DbEnAvmNcCGjJJMkfzPjLf2E55S9695vS4Kmz4eCvK2KTEHA2FBIAnA6zxDS3vIr0naQD+JTr/UqjUeDh7dBZPFTLrNE7TxZ0hM0mdW4AdAQpXRHLdk4uZLKeMcosHtFlO1ZbaKe0sqTGZvJEBQ11rZsSDJ6fxvI4kwtYl1v6R4w55JyZbKtty7RVRDTia6RbN8+5dIAM1H9qhrBxBXYPQ/0TQKMu3XTbNuhWvYHfj97xqi9ZvYME8xyBIS/Y+gi7tE6uCkigEkNQgU4CFnmoV+lrUxaV29ruA2QNp+QQKenbelhKyyKKxTGJlxqcJVfA1e7x+movOun7FqYn+WqAgXdl6caKcNj9Q2sO2tQTPenMk14xKcD2AraQLa2YXQ==
X-Forefront-Antispam-Report: 	CIP:20.160.56.81;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(396003)(39850400004)(136003)(376002)(346002)(451199021)(46966006)(40470700004)(36840700001)(31686004)(6506007)(53546011)(26005)(2906002)(6512007)(44832011)(5660300002)(110136005)(7416002)(8936002)(8676002)(41300700001)(336012)(4326008)(316002)(70206006)(70586007)(6666004)(54906003)(6486002)(47076005)(36860700001)(83380400001)(186003)(478600001)(2616005)(82310400005)(356005)(40460700003)(7596003)(82740400003)(7636003)(36756003)(40480700001)(86362001)(31696002)(34070700002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 14:56:05.3076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a9cbeb-96ff-4e03-c7b5-08db31f80da3
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.81];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT020.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9068
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
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/31/23 06:58, Camelia Alexandra Groza wrote:
>> -----Original Message-----
>> From: Sean Anderson <sean.anderson@seco.com>
>> Sent: Monday, March 27, 2023 22:29
>> To: Leo Li <leoyang.li@nxp.com>; linuxppc-dev@lists.ozlabs.org; linux-arm-
>> kernel@lists.infradead.org
>> Cc: Scott Wood <oss@buserror.net>; linux-kernel@vger.kernel.org; David S .
>> Miller <davem@davemloft.net>; Claudiu Manoil <claudiu.manoil@nxp.com>;
>> Roy Pledge <roy.pledge@nxp.com>; Vladimir Oltean
>> <vladimir.oltean@nxp.com>; Camelia Alexandra Groza
>> <camelia.groza@nxp.com>; Sean Anderson <sean.anderson@seco.com>
>> Subject: [PATCH 1/2] soc: fsl: qbman: Always disable interrupts when taking
>> cgr_lock
>> 
>> smp_call_function_single disables IRQs when executing the callback. To
>> prevent deadlocks, we must disable IRQs when taking cgr_lock elsewhere.
>> This is already done by qman_update_cgr and qman_delete_cgr; fix the
>> other lockers.
>> 
>> Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> ---
>> 
>>  drivers/soc/fsl/qbman/qman.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
>> index 739e4eee6b75..ff870ca07596 100644
>> --- a/drivers/soc/fsl/qbman/qman.c
>> +++ b/drivers/soc/fsl/qbman/qman.c
>> @@ -1456,7 +1456,7 @@ static void qm_congestion_task(struct work_struct
>> *work)
>>  	union qm_mc_result *mcr;
>>  	struct qman_cgr *cgr;
>> 
>> -	spin_lock(&p->cgr_lock);
>> +	spin_lock_irq(&p->cgr_lock);
>>  	qm_mc_start(&p->p);
>>  	qm_mc_commit(&p->p, QM_MCC_VERB_QUERYCONGESTION);
>>  	if (!qm_mc_result_timeout(&p->p, &mcr)) {
>> @@ -1476,7 +1476,7 @@ static void qm_congestion_task(struct work_struct
>> *work)
>>  	list_for_each_entry(cgr, &p->cgr_cbs, node)
>>  		if (cgr->cb && qman_cgrs_get(&c, cgr->cgrid))
>>  			cgr->cb(p, cgr, qman_cgrs_get(&rr, cgr->cgrid));
>> -	spin_unlock(&p->cgr_lock);
>> +	spin_unlock_irq(&p->cgr_lock);
>>  	qman_p_irqsource_add(p, QM_PIRQ_CSCI);
>>  }
> 
> There is one more spin_unlock call in qm_congestion_task on the error path that needs updating:
> 
> if (!qm_mc_result_timeout(&p->p, &mcr)) {
> 	spin_unlock(&p->cgr_lock);

Will fix. Thanks.

--Sean

> 
>> @@ -2440,7 +2440,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32
>> flags,
>>  	preempt_enable();
>> 
>>  	cgr->chan = p->config->channel;
>> -	spin_lock(&p->cgr_lock);
>> +	spin_lock_irq(&p->cgr_lock);
>> 
>>  	if (opts) {
>>  		struct qm_mcc_initcgr local_opts = *opts;
>> @@ -2477,7 +2477,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32
>> flags,
>>  	    qman_cgrs_get(&p->cgrs[1], cgr->cgrid))
>>  		cgr->cb(p, cgr, 1);
>>  out:
>> -	spin_unlock(&p->cgr_lock);
>> +	spin_unlock_irq(&p->cgr_lock);
>>  	put_affine_portal();
>>  	return ret;
>>  }
>> --
>> 2.35.1.1320.gc452695387.dirty
> 

