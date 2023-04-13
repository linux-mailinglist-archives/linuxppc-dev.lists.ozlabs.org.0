Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFF66E119C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 18:01:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py48M58s6z3fV1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 02:01:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=JOgnrEGG;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=JOgnrEGG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7eaf::316; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=JOgnrEGG;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=JOgnrEGG;
	dkim-atps=neutral
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03hn20316.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaf::316])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py47R2VfZz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 02:01:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1o6eO9AyHpg8fLI7uLH1x0GDM3hiqBLmkTNaR9raDnY=;
 b=JOgnrEGGKhVDIccDedewCr/k/hKI28UjeJR/g0PPcLgrMLaQMrOiLrD/ahxdt80s6NVJT8SGnYtY8eoNuK9621VfVgfSHsthTQuiooyChZUpm0uY9SG2d7ONio13GKxWLrUNv9D4fMx9hHV/JM+cZULUZ5dZBmjH8/7RxoB3rGPZreWuHSJwdoE4gwwfhvT+QxFWGKejykmxf0XK6i8T9UPhRA/eGfjW+aH83o+RRqLihQX9HlLlbBV5/WJqmLR7FCYsQlrPPXo3GevwgyS8GnWSRgJqyfx58Pqfgd7G1DtlzBnxffBbE5ly2EG4PlyIDis5pctTwYCnKPDW3jRtZA==
Received: from DB8PR09CA0001.eurprd09.prod.outlook.com (2603:10a6:10:a0::14)
 by DB9PR03MB7690.eurprd03.prod.outlook.com (2603:10a6:10:2c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:00:42 +0000
Received: from DB8EUR05FT067.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::8d) by DB8PR09CA0001.outlook.office365.com
 (2603:10a6:10:a0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 16:00:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.80)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.80 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.80; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.80) by
 DB8EUR05FT067.mail.protection.outlook.com (10.233.238.176) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 16:00:41 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id AA0B02008026F;
	Thu, 13 Apr 2023 16:00:41 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [104.47.17.176])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 594EC2008006F;
	Thu, 13 Apr 2023 16:01:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIHNbHpovov/YUWy/0nNmWupseieanfZDRA4pvQVckhfE1YrXgMWTysRwGG627EREYgGJLgNiOq55jK2zl2e0ENA30AD6VkNI54EDqkbySxPo1wAV74HjLP32t9RdifdqoctHLa51CzIlxoGpk1gMvU+izQszsXA0VuW0Z3uYrh3Axy7wQsFXxeO8pyt3QPrpI+VtZaWKDK1H+EaCYe2KretxtCMvwNo9Zam+b48OwNoHEEBRrroYYIydnW73ZxcqojhP5pHcJE3IWJP2vFrWcWquRx16+QiHcce61jliBcmTaSnGOivlXwnuSLqfHESubsVR0pe3iXNHGUiPUba1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1o6eO9AyHpg8fLI7uLH1x0GDM3hiqBLmkTNaR9raDnY=;
 b=crbWJOH4R8VfO1KWrcEGsgB+869ZKgvQBc5XPgMlvyCBME6Q/KECn+jbkgm++e3xtraOtxdG5wYDlxETwysaQ89tGGrEa3Oy9HHzOPeFrComvZOUDSPHl8AAs6RVizDTmvUF5KbGtnV6Y+cWX/dFA2BopUyUM67rf8sAo7PFpvhFYseC6C2i8HFpEg8OTO2WAP3Un/21vLWOct70vUZHADwQbxZ7sXCVnNLeo7PaR469amSH2aRtcEHYRdr01Yl+GIx31wE6ZwepwGCj1jekpQbOM1KuFVZ/i27mVgrAWp86qD/x0rmRNzhUTr+k17O9RmnYAjhhNhSJGZPZFpT0hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1o6eO9AyHpg8fLI7uLH1x0GDM3hiqBLmkTNaR9raDnY=;
 b=JOgnrEGGKhVDIccDedewCr/k/hKI28UjeJR/g0PPcLgrMLaQMrOiLrD/ahxdt80s6NVJT8SGnYtY8eoNuK9621VfVgfSHsthTQuiooyChZUpm0uY9SG2d7ONio13GKxWLrUNv9D4fMx9hHV/JM+cZULUZ5dZBmjH8/7RxoB3rGPZreWuHSJwdoE4gwwfhvT+QxFWGKejykmxf0XK6i8T9UPhRA/eGfjW+aH83o+RRqLihQX9HlLlbBV5/WJqmLR7FCYsQlrPPXo3GevwgyS8GnWSRgJqyfx58Pqfgd7G1DtlzBnxffBbE5ly2EG4PlyIDis5pctTwYCnKPDW3jRtZA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB9557.eurprd03.prod.outlook.com (2603:10a6:20b:5a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Thu, 13 Apr
 2023 16:00:34 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:00:34 +0000
Message-ID: <ca621582-a0c8-ac43-3260-9ebd5178019e@seco.com>
Date: Thu, 13 Apr 2023 12:00:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v13 03/15] dt-bindings: Convert gpio-mmio to yaml
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-phy@lists.infradead.org
References: <20230411184313.3679145-1-sean.anderson@seco.com>
 <20230411184313.3679145-4-sean.anderson@seco.com>
 <848f5e3e-44ca-3648-2d6b-7e06ce7b5cda@linaro.org>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <848f5e3e-44ca-3648-2d6b-7e06ce7b5cda@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR0102CA0057.prod.exchangelabs.com
 (2603:10b6:208:25::34) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB9557:EE_|DB8EUR05FT067:EE_|DB9PR03MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 941c2db7-dc38-41b1-c9cc-08db3c383baf
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  Wn2mHHyAZjf4pQ3FgrzibXODc61lYLNPWDB8IuAUGMc1PyMccYAal2/xdhnZVsXLk4GjnMsPlDqfJfx6xJ8ozlhU2vvnK985ahHjcNuulqAMQEdKxq9I+0n3yyezjHXk3wmgR2kkuzfPibyflFbdEVJQywbr5Q9a3WbQcoHhrbkSFMlW7B/gJ1G4zHZUXUzsNbI6Iz96foCcRumbJTielQ0nU68Tah7JEMGL8vWgFiM+zkPaUpgF0zqno6L8LlKe9cjDhVK/kwqHnwJbJ71tIlAGAcU+MQKXDvrMhTbE67KvKgc3l/R7zEcf3qgyNgHtpMagW4bITkLlr/t7j/ZcBTh/ojuTLONpZDNeF+c8li/EMm/5fMcG4yt0u5d0Hcxc0Yu3PG6Pg3dj5Nj+16cAilk5bFxITr0I9ewi64UumJc88w+H36/Cd/PVGYzyWBmD3/5U4Ld6CccRVHtM8ToymcthQalcrIKGubyKb+Bh2i1ZrkucSO1Ff468VPewzL7+nyxLX82jnrsGJVMHFJrV0Nlyx2Jt148EbIZ3GO4CEfmiwVKH4wUrZ0HUaYBWad4t9uJrKWIse6zcHfJ8/NonyHOQgxrdpBzA0uElZd+65ZLxO38as0nmXVi6gvDfg2h6A77Im4/VM/e33O1tUrpd04RjD0FvdNszy7UQ/6GCf9yhCHfh95WAnlzF5bt980B7
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39850400004)(376002)(346002)(366004)(451199021)(54906003)(110136005)(316002)(6512007)(6666004)(6506007)(26005)(53546011)(478600001)(31686004)(41300700001)(83380400001)(2616005)(6486002)(186003)(66946007)(52116002)(66476007)(66556008)(4326008)(5660300002)(44832011)(7416002)(8936002)(38350700002)(8676002)(38100700002)(2906002)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9557
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT067.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	1a7325ab-637e-4191-8030-08db3c3836ca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0OF+U3ETzGITsUJgQG1Htw2ktz/GMPCK7OzqJejkOTUsSxbPOpZmxCZc04Xs0s1+n9JtXXIltZT660hubn1kp4E9wh5cBtsGSTFtP0QP0RPGIIeGk9IMysPQ+5CDG3LH14IDfOt3A2Tg0fIrBPiTnRYBWKsvLvkSWLONg9C//k/32WwbRo8XUdwr89v1UtkfoRYFzpbS8B9Ar7Cm2vGdM0Cr6fp01hxCHjRSwSugDtDgilHLmWSLIKyXUWk4NEDq2p1afaXIhddL1tqES3jn8ufS32PA91jpMi1LzhYwZ/CcWzB+YTrxEjw02ZhCj0x5MhFzE8b7kbxI/Gx1fVk+xygoZmN0su+JcxQl9QrzeVl1KTYQf3+6cmbvmeWUCJJ2Ie2hohDSs2vgnoODloTaK6TPEkXzuVb/C1qDvI0sHfd4Pwu9jevLK2ln8rCTDrWMn3veJH+1MAzD5dmsEQ+mxHNSzRTBUI8VGQRnSIJTgJmomZGW36inlOyGjHDpsGuRxxg/sOowJqWaADQtI07RqI3W2AlZWUr6zXSRkp3chronsP8QGC3Tqj8MQE4aM1e9ULEvAY9MmUNHSSdc9x1D/dJ/noowFP+Y33lrfiRRCxVxNHHkuQZRRVxeoWvxlOriccRntuQNNUM3T+Vy8hBejPeBr33qAn+ZImVk82rQ4yKTTonMLuYAI9bLOkXj0yC1fU8JOQDCjAwmsihUiLhCqpW5JhMVEhjUwRSdvbNJzmNxd+o/Ky333LVnvLV7jLevo+hcIIpVc+Py0PbDACxxV7wj812LWBau2EemocjB3t4=
X-Forefront-Antispam-Report: 	CIP:20.160.56.80;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(376002)(136003)(39850400004)(346002)(396003)(5400799015)(451199021)(46966006)(36840700001)(40470700004)(86362001)(54906003)(44832011)(110136005)(7416002)(40460700003)(34070700002)(7596003)(478600001)(7636003)(356005)(316002)(41300700001)(82740400003)(8676002)(8936002)(5660300002)(70206006)(40480700001)(70586007)(31696002)(53546011)(6512007)(6506007)(36756003)(26005)(336012)(31686004)(186003)(36860700001)(4326008)(6666004)(83380400001)(2906002)(2616005)(6486002)(82310400005)(47076005)(43740500002)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:00:41.9331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 941c2db7-dc38-41b1-c9cc-08db3c383baf
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.80];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT067.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7690
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
Cc: devicetree@vger.kernel.org, =?UTF-8?Q?Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/12/23 04:04, Krzysztof Kozlowski wrote:
> On 11/04/2023 20:43, Sean Anderson wrote:
>> This is a generic binding for simple MMIO GPIO controllers. Although we
>> have a single driver for these controllers, they were previously spread
>> over several files. Consolidate them. The register descriptions are
>> adapted from the comments in the source. There is no set order for the
>> registers, and some registers may be omitted. Because of this, reg-names
>> is mandatory, and no order is specified.
>> 
>> Rename brcm,bcm6345-gpio to brcm,bcm63xx-gpio to reflect that bcm6345
>> has moved.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> Linus or Bartosz, feel free to pick this up as the rest of this series
>> may not be merged any time soon.
>> 
>> Changes in v13:
>> - Fix references to brcm,bcm63xx-gpio.yaml (neé brcm,bcm6345-gpio)
> 
> You got some of the same errors as last time.

These are different errors.

> Test your patches before sending.

I typically run dt_bindings_check with DT_SCHEMA_FILES=... because
running the whole thing takes longer than compiling a kernel from
scratch. It seems I neglected to run it on the affected schemas.

--Sean
