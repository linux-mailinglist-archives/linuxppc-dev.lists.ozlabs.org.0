Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC626A9DA9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 18:27:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSvzW62n1z3f4X
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 04:27:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=iB6EyCn8;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=iB6EyCn8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7d00::30f; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=iB6EyCn8;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=iB6EyCn8;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05hn2030f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::30f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSvyW36W1z3cdr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Mar 2023 04:26:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/kEATn0Ar9CSfTVtmPcx8yrAUVQgXGEKMY3ZFxRv3I=;
 b=iB6EyCn8udL1ECLZdsvtLBnTYme3y8f7pAiDXrux5CBpm7gvZaijXVug4QFucU7+UjUSL7lUripLwRvTZtKCZwVO4bRFqMWp2qeNVbimZHu9bloU3EhFF6j3ypj42I+M2ZM5Q7R2oWiyDIJm2c1DJqS6UIt9FbL8RJ6jdpJPggkMMFB6p4RoW/xKPWf5iW8I2ow74EHnjVxbmLdJJrT1e/cm6EYeDtOwxIH/KHwOWc7YTW34UjUV5upmkLkj8bl7UwtBgb+BD1YPMtlqQyVcdcufjH4EdL2N1pQZeiwQIDcXLyKQwdW+mwresNdxSnDAsEwpcQ9AO0bEcyZXoNnkwQ==
Received: from DB6P195CA0022.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::32) by
 AS1PR03MB8285.eurprd03.prod.outlook.com (2603:10a6:20b:474::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.19; Fri, 3 Mar 2023 17:25:48 +0000
Received: from DB8EUR05FT043.eop-eur05.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::c) by DB6P195CA0022.outlook.office365.com
 (2603:10a6:4:cb::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22 via Frontend
 Transport; Fri, 3 Mar 2023 17:25:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 20.160.56.85)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Fail (protection.outlook.com: domain of seco.com does not
 designate 20.160.56.85 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.85; helo=inpost-eu.tmcas.trendmicro.com;
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.85) by
 DB8EUR05FT043.mail.protection.outlook.com (10.233.239.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.22 via Frontend Transport; Fri, 3 Mar 2023 17:25:47 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 5B87B2008088D;
	Fri,  3 Mar 2023 17:25:47 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (unknown [104.47.30.107])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id E169520080075;
	Fri,  3 Mar 2023 17:17:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSmNupRd6KugV8cVEFlPx8d2Ls/MPcQUPfyXyUXba5kqXZoKIOj1e6jU8ll1jEnbkgNGh5Ug85f8coFFGW2a+iCta4miBeHQGx48Y1KOmM5jl3D56zY85taM/bT+zsuQMSPGHRwqVoVqLTbgaYhZSwIaoY95CmjCARgUXZ+nD38PdNTzIEqNVfh/sn7OVsWN7ojae7oWHg88e4q5H+GwvmVGaedijIJMPB9zx9hWhNG0fb9gsyu0SxeCsf2i3NAYqrVAMeKi91t8dYPfhwa1vbVrPg6ltWraRbp3+JXv61m8v/CaKDCiMOLQLkW2fI0kjaus8LOtsDJoItYcaalp/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/kEATn0Ar9CSfTVtmPcx8yrAUVQgXGEKMY3ZFxRv3I=;
 b=Le5GIBZH9PF3x+Jz/BeyTG401ToJeuC7e4/fKDua0FOlcohHdx5IkLIKBoxLPLlGXAlLoUfCcUPTCitVzW9vgBq0D5d6o3V0AwjC+GxZeaoxJfpThZLLw8y05zpZGXnZFJSY7VN+1TGnsWgsrHxXg3mpHPIpcfqd6wPLX66R4fIOZN0CE0B1kyTOqmX+iHwPv6zKe8GRtul6CEw2UbH+3F5NoN3o+snpmaLyqChY6glHnyCVslX4KehryKz1peiyFVzZXF1VOXsFl24cQpAy+ZZnr6qswxPpSgbsLWc4kA0Ym9eHpJXdfcjyJ62od9jd0XPRwCCVO/0zcKnJjBGIWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/kEATn0Ar9CSfTVtmPcx8yrAUVQgXGEKMY3ZFxRv3I=;
 b=iB6EyCn8udL1ECLZdsvtLBnTYme3y8f7pAiDXrux5CBpm7gvZaijXVug4QFucU7+UjUSL7lUripLwRvTZtKCZwVO4bRFqMWp2qeNVbimZHu9bloU3EhFF6j3ypj42I+M2ZM5Q7R2oWiyDIJm2c1DJqS6UIt9FbL8RJ6jdpJPggkMMFB6p4RoW/xKPWf5iW8I2ow74EHnjVxbmLdJJrT1e/cm6EYeDtOwxIH/KHwOWc7YTW34UjUV5upmkLkj8bl7UwtBgb+BD1YPMtlqQyVcdcufjH4EdL2N1pQZeiwQIDcXLyKQwdW+mwresNdxSnDAsEwpcQ9AO0bEcyZXoNnkwQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB7842.eurprd03.prod.outlook.com (2603:10a6:20b:341::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 17:25:39 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 17:25:38 +0000
Message-ID: <60415225-df2a-ad94-224d-f5cab9d2e8c9@seco.com>
Date: Fri, 3 Mar 2023 12:25:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v9 04/10] clk: Add Lynx 10G SerDes PLL driver
Content-Language: en-US
From: Sean Anderson <sean.anderson@seco.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-phy@lists.infradead.org
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <20221230000139.2846763-5-sean.anderson@seco.com>
 <1abf9cb3e1fb1f01976c903cd8723b0f.sboyd@kernel.org>
 <363e3221-721b-6547-0955-f964e2ef17b1@seco.com>
In-Reply-To: <363e3221-721b-6547-0955-f964e2ef17b1@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0313.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::18) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB7842:EE_|DB8EUR05FT043:EE_|AS1PR03MB8285:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ae2c251-d683-43d9-d453-08db1c0c53f6
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  mJ0lS+UBrElB8I+3Z2HnmXmfVMHJsJd9x5uVQ2LGIoztVvkUTmIWK2o65NAuWabEQImJ3VZNpIrjP4vdWnzN8kCn8a9YM0t9US7SkDIBkfxM2VzmA9HzY7DyoAr91JOgyKJ9/bQDqOj+hJqiTgqRNs6W3Pib5/qc2Fi5kNAQAWqXIZIVCzqCVqO2Jqgj8IwHbf9WNPYQkAbT//YG2Y/wLPBz8DKDIazCy7zCfU/lvEtZ7QXtmQpCaNMZBUcIfB/VQ56FLZ3wTFl3EMNG5fej4hH0APIm5SgOLdDAwUkUjtY8C1BWX8K8qebq+FKMHwH8YEb/XMNITisGKr9uM9NfcuxVxVp/8NWMaxNN+ZdjJar2wCd2FoD6mFIKyCsASQ8w7hiAiI8H//9Jdlg0flFj+lguHtVouWOGWlvC6AKcW55ND8aV5jcosseDcKTrnLyKhxPCBAKbvMGEXkEI984s3krwU+2n9DziZ43mA1ubY47tn8uQC//mnI6z3ROnMwNvCK1uv7Qhn1oK6QJsGogjyiBuigNuOZ5X8SDtZRx7dWzyB7llx1cPx5M0DTR6dhmWGRo/XG9WYQ66feKuW1htA6AoRD7zj60Nv7xMIT4WV4Pn/IJWFIiyMrwe8RJUwejrFfynJvgL7c9stvMhBHzlC+AQ58IW1pfdFCejkmz4GDZp/sQQ9yLabG3xVvlwjc/fRZcp5AJb3o8WuolZTyfDKuuZWUzLXozaMASDZQ32CePXavGu39W9683EpOiWKFoky1KWOPSwh+ZNsLMx7MjACnuwSzoMAVl6avcN5rwQjpw=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39850400004)(136003)(366004)(396003)(346002)(451199018)(36756003)(6666004)(6512007)(53546011)(26005)(6486002)(6506007)(2616005)(186003)(8676002)(4326008)(110136005)(41300700001)(66556008)(66476007)(54906003)(52116002)(44832011)(316002)(2906002)(4001150100001)(38100700002)(8936002)(5660300002)(7416002)(478600001)(38350700002)(31696002)(86362001)(66946007)(83380400001)(66899018)(31686004)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7842
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT043.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	619bc9cc-2d8c-419b-e5c4-08db1c0c4e78
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	zeF/LTz5R/bmAsHxwlIMCcXKZuAJzatHwANkwo+XE3w4zoTW2m0FkfzowjJMwoiwAJxEI0m1Vy2HnVdzhMQxUo9XWQ5DL2AmvdzWbmSqNBn6R8Ssnd/TnxjfHzyhT9AD/E3nlZJ786lwuAFDMdeJ3BVpNkfoKeuArzz0TiU90SOcNEtNEqnCiOsViAyJnaVyt1v+JtjU0qgFXDMcnqfeElv07yCvp8fBBPl+PJ2d01KNATufEhUduu9Rv/4wcOpFt+rJrjyOTn4esuOnrDJ0icveiTZuAAZh5REjFxJQsTPhsD/G3FyuPIt5GYw3lZWt8V7IL/IcWr3kZmBhkfKLjwfZVsFZmqai3kOH2yUeZdeYnOwp4F//HrYXrLtjLftUH0bu9BoWpppZLBIR59VbC/R4I4GajW4zcoze04AnHejjsnRSPvarpZDUbrzJor7wOBfAh7+E8/dCOwP6dNTpRnZE3bSPUqN4Zk3i1L8Idgf+FxhizrHFoNG53aCCZoisNDaryp/k1G9wIZ5zXSuQIfFZNL3zXPsy+eCYDag/YOSuNqD8vaOCEKthpugEYPPIKXmWjckg8HmLPXi8+kenI7x7pXbCrOXL8SF9H2it8yOavhpXSSXZ1XAPsQV9dRw3wq07UwOB1L1aR4bNhGov9/VGMEqZGlP/ybh9LQbIwBXZPQl8Bdkiz1ycCSzwIqUVAJPKVuwj65Ahqo7cNhUB62zqRpFe0tQ9Ar1EM1a55G053I3Llu78oSu0YfRkFbH5qdh/s/8Nj4lauwtM6hvKXD+k/F68Qc07VTozoZtbaz5l3VeahafIByc/MZlnlDIE
X-Forefront-Antispam-Report: 	CIP:20.160.56.85;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(39850400004)(396003)(346002)(136003)(376002)(451199018)(5400799012)(46966006)(36840700001)(31696002)(86362001)(36756003)(82310400005)(2616005)(54906003)(336012)(53546011)(40480700001)(186003)(70206006)(70586007)(8936002)(8676002)(6512007)(41300700001)(110136005)(316002)(478600001)(6486002)(5660300002)(6666004)(6506007)(82740400003)(26005)(7596003)(4001150100001)(7636003)(2906002)(47076005)(7416002)(34070700002)(4326008)(44832011)(36860700001)(356005)(83380400001)(66899018)(31686004)(21314003)(45980500001)(43740500002)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 17:25:47.5990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae2c251-d683-43d9-d453-08db1c0c53f6
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.85];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT043.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR03MB8285
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Stephen,

On 1/27/23 16:51, Sean Anderson wrote:
> On 1/27/23 15:59, Stephen Boyd wrote:
>> Quoting Sean Anderson (2022-12-29 16:01:33)
>>> This adds support for the PLLs found in Lynx 10G "SerDes" devices found on
>>> various NXP QorIQ SoCs. There are two PLLs in each SerDes. This driver has
>>> been split from the main PHY driver to allow for better review, even though
>>> these PLLs are not present anywhere else besides the SerDes. An auxiliary
>>> device is not used as it offers no benefits over a function call (and there
>>> is no need to have a separate device).
>>> 
>>> The PLLs are modeled as clocks proper to let us take advantage of the
>>> existing clock infrastructure.
>> 
>> What advantage do we gain?
> 
> The handling of rate changes, locking, etc is all done by the clock
> subsystem. We can use the existing debugfs stuff as well. And everything
> is organized by existing API boundaries.
> 
>>> I have not given the same treatment to the
>>> per-lane clocks because they need to be programmed in-concert with the rest
>>> of the lane settings. One tricky thing is that the VCO (PLL) rate exceeds
>>> 2^32 (maxing out at around 5GHz). This will be a problem on 32-bit
>>> platforms, since clock rates are stored as unsigned longs. To work around
>>> this, the pll clock rate is generally treated in units of kHz.
>> 
>> This looks like a disadvantage. Are we reporting the frequency in kHz to
>> the clk framework?
> 
> It is, and yes.
> 
>>> 
>>> The PLLs are configured rather interestingly. Instead of the usual direct
>>> programming of the appropriate divisors, the input and output clock rates
>>> are selected directly. Generally, the only restriction is that the input
>>> and output must be integer multiples of each other. This suggests some kind
>>> of internal look-up table. The datasheets generally list out the supported
>>> combinations explicitly, and not all input/output combinations are
>>> documented. I'm not sure if this is due to lack of support, or due to an
>>> oversight. If this becomes an issue, then some combinations can be
>>> blacklisted (or whitelisted). This may also be necessary for other SoCs
>>> which have more stringent clock requirements.
>> 
>> I'm wondering if a clk provider should be created at all here. Who is
>> the consumer of the clk? The phy driver itself? Does the clk provided
>> need to interact with other clks in the system? Or is the clk tree
>> wholly self-contained?
> 
> It's wholly self-contained, aside from an undocumented mode where you
> can output a fixed frequency (for testing). The provider exists so you
> can use assigned-clocks to ensure a particular PLL is used for a
> particular frequency. This prevents a problem where e.g. you have
> reference clocks for 100 Hz and 156.25 Hz, one lane requests 5 GHz and
> the PLL with the 156.25 Hz clock gets used. Then, later another lane
> requests 5.15625 GHz and the remaining 100 Hz PLL can't provide it. To
> prevent this, you can assign the PLLs their rates up front and the lanes
> will use the existing rates. Most of the time this should be done by the
> RCW, but there are cases where the RCW can't set up the clocks properly.
> 
>> Can the phy consumer configure the output frequency directly via
>> phy_configure() or when the phy is enabled? I'm thinking the phy driver
>> can call clk_set_rate() on the parent 'rfclk' before or after setting
>> the bits to control the output rate,
> 
> This is what currently happens. See lynx_set_mode in the next patch.
> 
>> and use clk_round_rate() to figure
>> out what input frequencies are supported for the output frequency
>> desired. This would avoid kHz overflowing 32-bits, and the big clk lock
>> getting blocked on some other clk in the system changing rates.
> 
> Can you describe this in a bit more detail? Are you suggesting to skip
> the clock framework?
> 
>> BTW, what sort of phy is this? Some networking device?
> 
> From the Kconfig in the next commit:
> 
> This adds support for the Lynx "SerDes" devices found on various QorIQ
> SoCs. There may be up to four SerDes devices on each SoC, and each
> device supports up to eight lanes. The SerDes is configured by
> default by the RCW, but this module is necessary in order to support
> some modes (such as 2.5G SGMII or 1000BASE-KX), or clock setups (as
> only as subset of clock configurations are supported by the RCW).
> The hardware supports a variety of protocols, including Ethernet,
> SATA, PCIe, and more exotic links such as Interlaken and Aurora. This
> driver only supports Ethernet, but it will try not to touch lanes
> configured for other protocols.
> 
>>> 
>>> diff --git a/drivers/clk/clk-fsl-lynx-10g.c b/drivers/clk/clk-fsl-lynx-10g.c
>>> new file mode 100644
>>> index 000000000000..61f68b5ae675
>>> --- /dev/null
>>> +++ b/drivers/clk/clk-fsl-lynx-10g.c
>>> @@ -0,0 +1,509 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
>>> + *
>>> + * This file contains the implementation for the PLLs found on Lynx 10G phys.
>>> + *
>>> + * XXX: The VCO rate of the PLLs can exceed ~4GHz, which is the maximum rate
>>> + * expressable in an unsigned long. To work around this, rates are specified in
>>> + * kHz. This is as if there was a division by 1000 in the PLL.
>>> + */
>>> +
>>> +#include <linux/clk.h>
>> 
>> Is this include used? If not, please remove.
> 
> OK
> 
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/device.h>
>>> +#include <linux/bitfield.h>
>>> +#include <linux/math64.h>
>>> +#include <linux/phy/lynx-10g.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/units.h>
>>> +#include <dt-bindings/clock/fsl,lynx-10g.h>
>>> +
>>> +#define PLL_STRIDE     0x20
>>> +#define PLLa(a, off)   ((a) * PLL_STRIDE + (off))
>>> +#define PLLaRSTCTL(a)  PLLa(a, 0x00)
>>> +#define PLLaCR0(a)     PLLa(a, 0x04)
>>> +
>>> +#define PLLaRSTCTL_RSTREQ      BIT(31)
>>> +#define PLLaRSTCTL_RST_DONE    BIT(30)
>>> +#define PLLaRSTCTL_RST_ERR     BIT(29)
>> [...]
>>> +
>>> +static int lynx_clk_init(struct clk_hw_onecell_data *hw_data,
>>> +                        struct device *dev, struct regmap *regmap,
>>> +                        unsigned int index)
>>> +{
>>> +       const struct clk_hw *ex_dly_parents;
>>> +       struct clk_parent_data pll_parents[1] = { };
>>> +       struct clk_init_data pll_init = {
>>> +               .ops = &lynx_pll_clk_ops,
>>> +               .parent_data = pll_parents,
>>> +               .num_parents = 1,
>>> +               .flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT |
>> 
>> Why is the nocache flag used?
> 
> PCIe rate selection can automatically modify the frequency of the
> PLL. From the reference manual:
> 
> | For PCIe 8 Gbaud, the auto-negotiation also involves a combination of
> | switching PLL selects, and/or reconfiguring a PLL. There are two
> | scenarios for PLL reconfiguration:
> |
> | * PCIe starts on any PLL which runs at 5GHz, and the other PLL is off.
> | PHY wrapper will switch to the other PLL as part of Gen 3 speed
> | switch. In this case, both PLLs must be supplied with valid reference
> | clocks.
> | * PCIe starts on any PLL which runs at 5GHz, and the other PLL is
> | being used for other protocols. PHY wrapper will reconfigure the
> | current 5GHz PLL as part of Gen 3 speed switch. PCIe stays on the same
> | PLL in this case. This also applies to the scenario where one PCIe
> | port runs on all lanes.
> 
> As far as I know there's no way to configure or disable this. PCIe isn't
> implemented yet, but it would likely need some way to mark PLLs for
> exclusive use (not just exclusive rate). I figured it would be better
> not to cache the rate so that things like the above would get detected
> properly.
> 
> --Sean
> 
>>> +                        CLK_OPS_PARENT_ENABLE,
>>> +       };
>>> +       struct clk_init_data ex_dly_init = {
>>> +               .ops = &lynx_ex_dly_clk_ops,
>>> +               .parent_hws = &ex_dly_parents,
>>> +               .num_parents = 1,
>>> +       };
>>> +       struct lynx_clk *clk;
>>> +       int ret;

I am going to try and send out v10 soon. Do you have any comments on my
reply here? At the moment the only change I am planning to make is to
remove the clk.h include.

--Sean
