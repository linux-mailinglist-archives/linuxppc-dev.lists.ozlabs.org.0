Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF746AE4F9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 16:37:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWKLs5kpvz3f5K
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 02:37:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=nKuB2MFv;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=nKuB2MFv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1b::329; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=nKuB2MFv;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=nKuB2MFv;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05hn20329.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::329])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWKKs2Hytz3cM3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 02:36:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXteK4Vft4N/Ad2bwozkXL58dzp+8D6gowBR79z/vMU=;
 b=nKuB2MFvJ3peWQdXXyu4fCCGSlmysOreLyHlAmB6jYUKWLb6N+gQM43i151r2eFf0Kqy0BIaCOj2m6a1XypZ29Z+ynt97uvL5/Ekhb6U3QhBgrUkRtJcqPsymhPgZOUIsv0UEUdukoymcIjf4jIKuIFq8Q68ULxyKJHX3Ad+R5STCoYc0qbcveBwAGw3hiRshB2dLtQ79IIEMEshK7vY/Gl8LLTNfZQUJHw+DGxwK+VpKVyJwdl2tkUz+9RYYkfaUAnTdSqVDnelmCSGBW0g3a7deysFkCeI7SPrRwnAxWti0VsOl8Yy7skaJbWU5FOdtwm4MEDXABJBEMmSkVlItA==
Received: from AS9PR05CA0349.eurprd05.prod.outlook.com (2603:10a6:20b:490::33)
 by AS8PR03MB7637.eurprd03.prod.outlook.com (2603:10a6:20b:345::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Tue, 7 Mar
 2023 15:35:53 +0000
Received: from AM6EUR05FT058.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:490:cafe::9b) by AS9PR05CA0349.outlook.office365.com
 (2603:10a6:20b:490::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Tue, 7 Mar 2023 15:35:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 20.160.56.86)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Fail (protection.outlook.com: domain of seco.com does not
 designate 20.160.56.86 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.86; helo=inpost-eu.tmcas.trendmicro.com;
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.86) by
 AM6EUR05FT058.mail.protection.outlook.com (10.233.240.72) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.16 via Frontend Transport; Tue, 7 Mar 2023 15:35:53 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 327CB2008026E;
	Tue,  7 Mar 2023 15:35:53 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [104.47.17.105])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 6ADA220080075;
	Tue,  7 Mar 2023 15:27:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egHi37QIgarby3IrBj0uiJLYnNPlUzHLiiDptIr2PNztExC/FAbF/GMF8UHisQA3lw5hN1IjdFybAhjdO02jW3TW3U+VA53PaPN044MtFwm7s0DWCNV3/+Ur+H4l2jInJTKyjIyPBfAacMnVbOGmLQOVZbUHPjWIdv+AyYCCBrWE7xm6P7/07vDiIFQosqeOIbpob0XTWB/5mPwOa1O9hdX8t8OvC8hk5fnC3/FWJtRuJC+pYP6ObrihOJK2NZtmVtpsdJ5hRfelLtFrYsjkeAwj2HVLEiV5AUboGewoQ/B0w2RrvQ9Q8pCI5ux9qZjJPe6cQvZjhyuMdAIuoDsbkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXteK4Vft4N/Ad2bwozkXL58dzp+8D6gowBR79z/vMU=;
 b=PrYLloRYT+yrXrwMgrMSo0dabA89vx3BsVY5TN4ibjKiincikCDM5ovynHR8c67YxXZZriXfvOESG5b7C+2jTkGKtkjwQEgWTBazh0LCBvMhFCsSO1SPcWsCbkvx+zruqbV1g+hHIJT3CLEWmHAY3JAwA3YTZNePmtFWuggut3MOCiyWqpw9Rw+JlsDfJEB8h6lOLQUimLFm9415re6P6UO8xqVLBO6aTGaNeeBTCVMSZrSvhKSeNZbCZNvLmsWd+TKCT6XKvZ8k/8WZxIT8qaz5F/0SEh75UTGitBciIGwXzDKgizLEsNwfPxkDpX05OwB091RvOn1EryQkSnIkGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXteK4Vft4N/Ad2bwozkXL58dzp+8D6gowBR79z/vMU=;
 b=nKuB2MFvJ3peWQdXXyu4fCCGSlmysOreLyHlAmB6jYUKWLb6N+gQM43i151r2eFf0Kqy0BIaCOj2m6a1XypZ29Z+ynt97uvL5/Ekhb6U3QhBgrUkRtJcqPsymhPgZOUIsv0UEUdukoymcIjf4jIKuIFq8Q68ULxyKJHX3Ad+R5STCoYc0qbcveBwAGw3hiRshB2dLtQ79IIEMEshK7vY/Gl8LLTNfZQUJHw+DGxwK+VpKVyJwdl2tkUz+9RYYkfaUAnTdSqVDnelmCSGBW0g3a7deysFkCeI7SPrRwnAxWti0VsOl8Yy7skaJbWU5FOdtwm4MEDXABJBEMmSkVlItA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by GV1PR03MB8687.eurprd03.prod.outlook.com (2603:10a6:150:91::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 15:35:48 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6156.027; Tue, 7 Mar 2023
 15:35:47 +0000
Message-ID: <42ccbac0-53e2-f599-fb3d-064b896bde4a@seco.com>
Date: Tue, 7 Mar 2023 10:35:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-phy@lists.infradead.org, Niall Leonard <nl250060@ncr.com>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
 <20230306191535.1917656-4-sean.anderson@seco.com>
 <4c039e53-e3ca-29d7-e5ea-f24e385d28b0@linaro.org>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <4c039e53-e3ca-29d7-e5ea-f24e385d28b0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0048.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::25) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|GV1PR03MB8687:EE_|AM6EUR05FT058:EE_|AS8PR03MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: c5bb7284-4a89-4fe0-6289-08db1f21a330
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  Y9RQ0g87oM8U0C0kPWjZyH9WEtdyYRiTMhqL6BYnIKH0lAFCsig19reFEhY6sPrzlXOv7aHWnLR/8SwSBYD2hfdKNYy8bcYnCAkfB9tjcsrRc1bR/aEtktinWBowALWITUlpiMZExjJu4D8KWOunUlvucM0dPIB8mWNdjvWZzvv0bsEvSHb/55GzPWewYZ4zhqhJ10Lz/Fuq1uJHe4qqSSc4p74AP6NgkU56au4oYNxWIV8X6JxqrjxVkFwfwCdLrI2ZEQeK0QjVfqk8C+n8bOlPYaRZCB7k5xyCn5BEfA6hEdhnK+LC9Xu8kr5VutdHF35rtR9Uus27UIaaOLvBt/0ebrU68xvF6x3NOQSlDV2ZlSa0rsCzOap49+iSvJGBpXbD9mj87CPkeTzSfc+VYscXlzixRZqQ4I/97NRjxMFufPYDURnHZmfR27PUCpqVZ6GU6IVD3sgekFpJvN2yUWjjmGSeg42aUM8FCbknJv90JR/bkyne5X9T6A1INZdJMqQsvI1EiWtxSVsDwGN1E1E/LnpbclxYOW33MJdVYgnSFYc0iN/Kfk+Jts9aoU/A/x7FENWAdpHmcztPPzNziGtWJFoTvpX/3gB9cQ0bruzYM6cmBlO2sex2umNufpwI+oJdDFrYVcy+34rrmZ6sOI2yVAHYJqe2xyMif7v9L7vCOWodVyeLc+4xT59b17t5WmrqZi3lkANiffn/+kDcjYNthbJE2sD7+Mcpw4vzh8Z1/ceZaLZm02mia/Fd+V04
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(39850400004)(366004)(376002)(136003)(396003)(451199018)(5660300002)(186003)(6512007)(26005)(7416002)(8676002)(66946007)(4326008)(66476007)(66556008)(6486002)(478600001)(966005)(52116002)(54906003)(31696002)(86362001)(316002)(110136005)(6506007)(8936002)(41300700001)(38350700002)(53546011)(38100700002)(36756003)(6666004)(83380400001)(2906002)(2616005)(31686004)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8687
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT058.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	f9434d9a-0072-4cf2-1d5d-08db1f219fb2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	iCgRf3re9nGfyJApyzUV5ysBQT9Mi1gzkWAc/yf6MHtqfIdrM+fhNw3fvBILFlt8MJbsV4fLfaeze6jscrxm22IzPrMU9zjjyhFqNq4Wk0Btf0SYn4XJrV+wDlMZ7YNZHagHW7guUXbkDHzVJqgkDEqeVyVKP+bp71Wb/NXrtYvC+ACl9qfJSv4CXu4P/dEkW04o86rp9BNKp/Pj8T0nuErMG7cKb1wVwOO5/S7UzU+hcQcDlW5hoX0whPwURctIfu8S6RcDNnbBtiSLqi4JcFjcZuIvaXe+tmht7JqE2xwfxndwrqqp3eserJrDXd4VAMJ8MXfRt5wJaVS3b8U0blOGqcaoCY6xTdvReH8kKxXGOXs0CImGlUsu/8MZQVBZgDN640ynkSaby59/tkka+3KiKNxsR/X+EZ7Bry2sGzgRVUSUJ9vOdZh/PclyAh1Nt9FwCO/+bFjXhbjKqBL/VhklEL8VV67e/rfRAUELJ8cs28iCBiYLQlb9dAcQexBAIk/bsF2ADERvAtSZzgMy0eNSaMpm5kETYoiETKjM2UAyDYLGP7AH0hbfoA6WsWGK5nZTezoM1n/B8AnN+bTFIPQq6YnXkHdaDRxdBzdZGsNv0LdhTy1cR/kruRJov3LWZrlwmWnync1qW5r/ghHa7Zk6Ck4+LMVrIOz+uWQyDpRnnP5gTCX1hfaneqMUig1nNSVgRzeKf0LTNbDb9XP36zZGVCv+JUkgDMIuX3uVxNoy33p8mKVR094FngX9SgqX/ot84fLkt9kd62RlCnNur7EaBkNc4bnlLFrQuYHBERbKSAjSaqpf1v2DbpXskluBpdTc4cNon0eWqTYU6cmHnRnPKVwMOEaDg06Pl8+G2dE=
X-Forefront-Antispam-Report: 	CIP:20.160.56.86;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(39850400004)(376002)(396003)(136003)(346002)(451199018)(5400799012)(46966006)(36840700001)(40470700004)(356005)(82310400005)(8676002)(4326008)(70586007)(70206006)(6512007)(6666004)(6506007)(53546011)(26005)(186003)(7416002)(36756003)(2616005)(8936002)(47076005)(336012)(40480700001)(41300700001)(7636003)(7596003)(44832011)(5660300002)(34070700002)(34020700004)(2906002)(83380400001)(36860700001)(82740400003)(478600001)(40460700003)(86362001)(31696002)(31686004)(6486002)(316002)(966005)(110136005)(54906003)(45980500001)(43740500002)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:35:53.4827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5bb7284-4a89-4fe0-6289-08db1f21a330
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.86];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT058.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7637
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
Cc: devicetree@vger.kernel.org, =?UTF-8?Q?Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

On 3/7/23 03:42, Krzysztof Kozlowski wrote:
> On 06/03/2023 20:15, Sean Anderson wrote:
>> This is a generic binding for simple MMIO GPIO controllers. Although we
>> have a single driver for these controllers, they were previously spread
>> over several files. Consolidate them. The register descriptions are
>> adapted from the comments in the source. There is no set order for the
>> registers, so I have not specified one.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> ---
>> 
>> Changes in v10:
>> - New
>> 
>>  .../bindings/gpio/brcm,bcm6345-gpio.yaml      |  16 +--
>>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 136 ++++++++++++++++++
>>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 -----
>>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 -----
>>  4 files changed, 137 insertions(+), 91 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
>>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> 
> https://lore.kernel.org/all/20230126-gpio-mmio-fix-v2-1-38397aace340@ncr.com/

Thanks for linking to that.

I believe this patch should be applied instead of that one because

- It documents all the registers, which were previously only documented
  in the driver
- It handles the endianness properties.
- It consolidates the various descriptions of this binding into one
  schema.

--Sean
