Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF56B9DED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 19:10:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbhQY6sxBz3cj9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 05:10:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xiQAq5E9;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xiQAq5E9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0d::316; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xiQAq5E9;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xiQAq5E9;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04hn0316.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::316])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbhPX5nHJz3cGr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 05:09:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52P1eILC/KGFOMHdkPRh1pKpMT4/zCXCduRccqPPUgQ=;
 b=xiQAq5E9XyEkLpfuKTQt9fwsH1e/VBvQS9/CifmkPhRGhuD8KLGzdDFHCrqIvBOiSDzLZ7K7KstuP1K1sfzmTxepBHw/mM+Ir74v/PIaO8UZmdsKvhz/Kuy4w8O/TCRHWpACH9QFa+Ykd/6h83a2BV+5NWAl1RQyY+N0YfUeQOibmBI9aUL1gWM6DHE+gGvM9MvwBUxa3/CtrL0hHBwMgM31OqDUk/DOCT0kyRnoO7dj3H/DWS88lBZ2Rk2dGgckoxeD+v4UTxj4ckvaV/O2chPH033ZNI+lwUIZaTCg/jn4GWuFh5J7dVq3mKLjOn/Q90kXLIKoRn98Jq5hJwQMdg==
Received: from DU2PR04CA0079.eurprd04.prod.outlook.com (2603:10a6:10:232::24)
 by PAWPR03MB9762.eurprd03.prod.outlook.com (2603:10a6:102:2f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 18:09:12 +0000
Received: from DB8EUR05FT038.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::59) by DU2PR04CA0079.outlook.office365.com
 (2603:10a6:10:232::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26 via Frontend
 Transport; Tue, 14 Mar 2023 18:09:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.85)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.85 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.85; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.85) by
 DB8EUR05FT038.mail.protection.outlook.com (10.233.238.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Tue, 14 Mar 2023 18:09:10 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 9F74F2008026E;
	Tue, 14 Mar 2023 18:09:10 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [104.47.17.107])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id C624F2008006F;
	Tue, 14 Mar 2023 18:08:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QppIQrDDfduebvwt7hYsXyqgpPLvcNONJysH3sBQnODgBFvgtMB2P/FYaMYQD3w2mNBmMd9sF6gxs1LkVhfBjtLB0vHNP784P2aM8Ury9QBKKcXOTFT7lLmuY0y2fkUe3tYXA4f1DAsXNVrYOpheJHie/9zB5FPncMLBbeT7YQ9QkwGXLOTj5ri1zyX3LVjBPlVUWgdG653F4bmuNwlPbBaj/VB4VoFev2YyC0jv2mtgoneC8GvZAHfnM8GGvEf+N+XaILE5qnG+WYERX0tw/GI5Fz9LvgzR4rdsV1UkTFayIoMloPhGpfB2lj5bKnXQ3QTBIT9ssH7jqT9vGqlBDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52P1eILC/KGFOMHdkPRh1pKpMT4/zCXCduRccqPPUgQ=;
 b=eaBOJxTW5CpKLhuPGffP87EVF0eda2DpRE4vjAVV5lGXPnqd/Hq1i5LfPrttu2/176LY7mPDv0dMHfM+4kuy7ZP5/pRi27G+AjBS3GLtitsIy6eIsZIH3U15GqiVN9//L/lcMeFyoVa5i60AaiQSK8aMuHEPGg1Twp/D+LqbYvFEskuBH1oc3wGGp0aWb8/bvWvZ9WhBIQ4p3AmM5n0Lu1jMrDOwyeRUR3LShxQuPwFGbPvW4XP8cpr6YaGHHnGiCEB43CEFDzRW70rPeZsAJt0e9sYMeks+ca7yhMe16IIN+bZwbj089PQC3lHnITrRXcvNyswlc61t31Fr4/aoxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52P1eILC/KGFOMHdkPRh1pKpMT4/zCXCduRccqPPUgQ=;
 b=xiQAq5E9XyEkLpfuKTQt9fwsH1e/VBvQS9/CifmkPhRGhuD8KLGzdDFHCrqIvBOiSDzLZ7K7KstuP1K1sfzmTxepBHw/mM+Ir74v/PIaO8UZmdsKvhz/Kuy4w8O/TCRHWpACH9QFa+Ykd/6h83a2BV+5NWAl1RQyY+N0YfUeQOibmBI9aUL1gWM6DHE+gGvM9MvwBUxa3/CtrL0hHBwMgM31OqDUk/DOCT0kyRnoO7dj3H/DWS88lBZ2Rk2dGgckoxeD+v4UTxj4ckvaV/O2chPH033ZNI+lwUIZaTCg/jn4GWuFh5J7dVq3mKLjOn/Q90kXLIKoRn98Jq5hJwQMdg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by GV2PR03MB9377.eurprd03.prod.outlook.com (2603:10a6:150:d2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 18:09:05 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 18:09:05 +0000
Message-ID: <3c19e6d2-4df2-6187-36d5-98ceef07235a@seco.com>
Date: Tue, 14 Mar 2023 14:09:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v11 03/13] dt-bindings: Convert gpio-mmio to yaml
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-phy@lists.infradead.org
References: <20230313161138.3598068-1-sean.anderson@seco.com>
 <20230313161138.3598068-4-sean.anderson@seco.com>
 <684eb04d-aeaa-07e1-34d6-783e85e379f0@linaro.org>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <684eb04d-aeaa-07e1-34d6-783e85e379f0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:208:2d::32) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|GV2PR03MB9377:EE_|DB8EUR05FT038:EE_|PAWPR03MB9762:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b4383dd-0742-4dc3-6d31-08db24b73636
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  x8orp9VYmzt2eTw/7J/mjdhA1HV+FNLMJOOXmcJaXgeQw8G+fUNpD6NgabFq9Fezk0CQGQKPphmNAfg6uBUzN0WfKSA1GjFNnYbksqa6CuODI2BcmuGNt5NvBjhBDJZnz9y+ZeOqePfySdFXsDi0dZTeRc+crmz+bBOC0KWYEAgamgfyntBN2X9EbQebZb3knR6wIjRGUIhmEBAaFmHJrHx8ubyrws7X2lyLLvR/jRi4fo+/q5GDgm5u1V/7bAeqUpgl0WNTAJ9sySq9S7Rr5apHVhn2t7efaCXgx8VFMkgiXqqHlHADB1HvZFexALPugEhhebC6bNMbE1AtCmvyqtqlfJ9m2jUQj2vxNM/fXKhIb4ccoirON+9i0Yu1bFrH3ICvcy+92WZcSuUvmaDCGmBQs55jczRhpAToGvcrebNPGzTouSUawnRswueAOIy2d0AqHKcdWQflYMRwauRDzrPOmQ8DHyFkx8BnZYti0eAF5zPdKKnCo+ny7ZC6It54fi+92U8S8uypnN4+6az/bJZZChjt/1qE91NKPdjgXeLKyeO3Qo3nXFWfOvTAW4pjRuI5y6EYT1mkHZi8s3b3VjOOqDiUCLPcSRTwVEmLfw1QwR50jGdwt8/JSiqZYR7CHw38FbW7Z5GPUKUK+OaHcNYx8Tb9St+0PB3+5eK4WjKma5TbAGBzB1Nj0dosLQxatq59I5hQzM1pCmEmT8xOeijM7nHFGs/2UhBzF2HKGf0wLeGIViuoeP9zeafMQNfA
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(39850400004)(136003)(366004)(376002)(451199018)(86362001)(36756003)(31696002)(316002)(7416002)(6512007)(41300700001)(6506007)(53546011)(8936002)(5660300002)(4326008)(2616005)(26005)(186003)(52116002)(54906003)(478600001)(6486002)(966005)(66556008)(110136005)(66476007)(8676002)(66946007)(38350700002)(38100700002)(6666004)(2906002)(83380400001)(44832011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9377
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT038.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	1b45d7de-9412-46f6-70a1-08db24b732b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	YJad0CfHFLo1fwOkCq9pszILtYihsh7R5yMG27dasHZa6WOZOrzPunLNah+fEQ+2pUe33qoBcqjBlhk5nQHI1wt0FID08VTRALDuVGjAjf4Hr5fVKo1bGh3s3/2O3ONuiH1hhXYHj/l0XswjKQYMPRf2Qk5gXV2JcTVrt8qJjQ7Hk13vkOKebLUxiKIory67HvsbG3yKFKjZ4Jm88E2jezuMGy1S9G2CtmfZGjiR4jSoXa+zY44+YeIYiZB2jd+3275KwzJ2zVCKbR0qoaWhilXvpYQC9CubWq+VQ8R1eLfu+gXmtVK38Roj563We5wR9/UZcm8tlOvtyf520hxm/DAJTA3EtIcHGUFIN7ip6//iFDTl+UUqLCXdy1d30WR4rkyPBAPVEBaR1OsGST6lj5mVXVkuN85nhZooShukPX9vHVZlVl9DkXzAmmr7RBGtoBZ0p3XSVI71bNUpYQqB/UzwE5VEXQ5Vzbi3xJELZ1br2swWWWJpeU+huP1veFQVde43HREjY4Rgmundi7a7Xuzr3fkboiugrDn6H/zXPnJeAyXFCY63R4kodGaYgRsliZYF/0UIfZe/fvyx3yXyDBNiimM8fgNjFqbEzig+SOQuoECOiHvrN57aSOnp2K4Bkm9NYiSbR2qHBG/pxVEWpX9+74By0jk79kTF2tmdHdojoNzqM72VirxWxPCD+kF8oC9V55DQDcfip9r3HTt/wF2Uv3SW8aQQzUCkO7IeEd07Rw/bt8NOP4uMkVWMTla3DqWiEfVlbygeziWLy8ovqPYEGwAUIcwwMGOepxbGqKE=
X-Forefront-Antispam-Report: 	CIP:20.160.56.85;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(346002)(396003)(39850400004)(376002)(136003)(451199018)(5400799012)(36840700001)(46966006)(40470700004)(5660300002)(40460700003)(7416002)(44832011)(36756003)(83380400001)(36860700001)(47076005)(336012)(82310400005)(478600001)(6506007)(6512007)(6486002)(6666004)(966005)(26005)(186003)(2616005)(53546011)(4326008)(110136005)(40480700001)(70586007)(70206006)(8676002)(356005)(41300700001)(8936002)(31696002)(54906003)(86362001)(316002)(34020700004)(7596003)(7636003)(31686004)(2906002)(82740400003)(43740500002)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 18:09:10.9271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4383dd-0742-4dc3-6d31-08db24b73636
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.85];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT038.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9762
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
Cc: devicetree@vger.kernel.org, =?UTF-8?Q?Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/14/23 13:56, Krzysztof Kozlowski wrote:
> On 13/03/2023 17:11, Sean Anderson wrote:
>> This is a generic binding for simple MMIO GPIO controllers. Although we
>> have a single driver for these controllers, they were previously spread
>> over several files. Consolidate them. The register descriptions are
>> adapted from the comments in the source. There is no set order for the
>> registers, so I have not specified one.
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
>> Changes in v11:
>> - Keep empty (or almost-empty) properties on a single line
>> - Don't use | unnecessarily
>> - Use gpio as the node name for examples
>> - Rename brcm,bcm6345-gpio.yaml to brcm,bcm63xx-gpio.yaml
>> 
>> Changes in v10:
>> - New
>> 
>>  ...m6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} |  16 +--
>>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 134 ++++++++++++++++++
>>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 -----
>>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 -----
>>  4 files changed, 135 insertions(+), 91 deletions(-)
>>  rename Documentation/devicetree/bindings/gpio/{brcm,bcm6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} (78%)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
>>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
>> 
>> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
>> similarity index 78%
>> rename from Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>> rename to Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
>> index 4d69f79df859..e11f4af49c52 100644
>> --- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
> 
> 
>> +
>> +description:
>> +  Some simple GPIO controllers may consist of a single data register or a pair
>> +  of set/clear-bit registers. Such controllers are common for glue logic in
>> +  FPGAs or ASICs. Commonly, these controllers are accessed over memory-mapped
>> +  NAND-style parallel busses.
>> +
>> +properties:
>> +  big-endian: true
>> +
>> +  compatible:
> 
> Keep compatible as first property.

I thought it was alphabetical.

>> +    enum:
>> +      - brcm,bcm6345-gpio # Broadcom BCM6345 GPIO controller
>> +      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
>> +      - ni,169445-nand-gpio # National Instruments 169445 GPIO NAND controller
> 
> I think you got comment that these comments are making things
> unreadable. I don't see here improvement.

That was not the comment I got.

| I think you can inline description: statements in the enum instead of
| the # hash comments, however IIRC you have to use oneOf and
| const: to do it, like I do in
| Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml
| but don't overinvest in this if it is cumbersome.

I investigated this and determined it was cumbersome.

> For example first comment is useless - you say the same as compatible.
> Same with last one. So only remaining WD comment should be made in new
> line so everything is nicely readable.

I don't understand what you mean by "made in new line". Anyway, I will
leave just the WD comment.

> BTW, order the enum by name.

OK

>> +
>> +  '#gpio-cells':
>> +    const: 2
>> +
>> +  gpio-controller:
>> +    true
> 
> I am sure I saw comments here...
> 
> https://lore.kernel.org/all/20230308231018.GA4039466-robh@kernel.org/

OK

>> +
>> +  reg:
>> +    minItems: 1
>> +    description:
>> +      A list of registers in the controller. The width of each register is
>> +      determined by its size.
> 
> I don't understand this comment. Aren't you describing now what 'reg' is
> in DT spec? If so, drop. If not, please share more.

Each register describes exactly one hardware register. In some other
device, when you see `regs = <0x8000000 0x100>`, then you may have 64
32-bit registers. But for this device, it would be one 2048-bit
register.

>>  All registers must have the same width. The number
>> +      of GPIOs is set by the width, with bit 0 corresponding to GPIO 0.
>> +    items:
>> +      - description:
>> +          Register to READ the value of the GPIO lines. If GPIO line is high,
>> +          the bit will be set. If the GPIO line is low, the bit will be cleared.
>> +          This register may also be used to drive GPIOs if the SET register is
>> +          omitted.
>> +      - description:
>> +          Register to SET the value of the GPIO lines. Setting a bit in this
>> +          register will drive the GPIO line high.
>> +      - description:
>> +          Register to CLEAR the value of the GPIO lines. Setting a bit in this
>> +          register will drive the GPIO line low. If this register is omitted,
>> +          the SET register will be used to clear the GPIO lines as well, by
>> +          actively writing the line with 0.
>> +      - description:
>> +          Register to set the line as OUTPUT. Setting a bit in this register
>> +          will turn that line into an output line. Conversely, clearing a bit
>> +          will turn that line into an input.
>> +      - description:
>> +          Register to set this line as INPUT. Setting a bit in this register
>> +          will turn that line into an input line. Conversely, clearing a bit
>> +          will turn that line into an output.
>> +
>> +  reg-names:
>> +    minItems: 1
>> +    maxItems: 5
>> +    items:
>> +      enum:
> 
> Why this is in any order? Other bindings were here specific, your 'reg'
> is also specific/fixed.

Some devicetrees have dirout first, and other have dat first. There is no
mandatory order, and some registers can be included or left out as is
convenient to the devicetree author.

reg is not specific/fixed either. It is just done that way for
convenience (and to match the names here).

>> +        - dat
>> +        - set
>> +        - clr
>> +        - dirout
>> +        - dirin
>> +
>> +  native-endian: true
>> +
>> +  no-output:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description:
>> +      If this property is present, the controller cannot drive the GPIO lines.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - '#gpio-cells'
>> +  - gpio-controller
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    gpio@1f300010 {
>> +      compatible = "ni,169445-nand-gpio";
>> +      reg = <0x1f300010 0x4>;
>> +      reg-names = "dat";
>> +      gpio-controller;
>> +      #gpio-cells = <2>;
>> +    };
>> +
>> +    gpio@1f300014 {
>> +      compatible = "ni,169445-nand-gpio";
>> +      reg = <0x1f300014 0x4>;
>> +      reg-names = "dat";
>> +      gpio-controller;
>> +      #gpio-cells = <2>;
>> +      no-output;
>> +    };
> 
> No need to duplicate examples. Keep only one.

OK

> Everything is the same.

Except no-output.

--Sean
