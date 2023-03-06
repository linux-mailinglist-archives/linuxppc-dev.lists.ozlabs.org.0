Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6594F6AD044
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 22:28:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVsC52Lqnz3cFx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 08:28:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=dM8O7Q37;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=dM8O7Q37;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe02::303; helo=eur01-db5-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=dM8O7Q37;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=dM8O7Q37;
	dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01hn0303.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe02::303])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVsB44PNhz3bjv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 08:27:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrOEDK4oPo5spcq0mzZBWUJc9nSXUxbMfKxjyVrEh8o=;
 b=dM8O7Q37mqWt2BusLiGThHAibNYilXJeOb624WOW8fZXyFw+ECosfkGNRD/F+FEE988ZPjDg36/mweebb13TXupLAHyI6bnIBXoEsViXcFXPuKTr2LuC8J+eMqH7+4+t1BgST6bDEnwqLgLuRr6mr+ljdLSxlU974II3Ndy27iHBKNtUcmImn12wqTu8Teti21BZFGwAxG9umDYXx0jpS222TS/UaYJ6PvdemYOuO6TLY+84JFwbebCzNiSK8U3NV5cmzoBIDHxR+vTs9qn4pzccnwT7XHsHClJVVx/83WgTVejDM575VLDDhSVeVu/C8f2bD2dZRaxeB95Sxc9XPQ==
Received: from FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::15)
 by DB4PR03MB9484.eurprd03.prod.outlook.com (2603:10a6:10:3f4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Mon, 6 Mar
 2023 21:27:33 +0000
Received: from VI1EUR05FT014.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:15:cafe::10) by FR0P281CA0010.outlook.office365.com
 (2603:10a6:d10:15::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.15 via Frontend
 Transport; Mon, 6 Mar 2023 21:27:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 20.160.56.84)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Fail (protection.outlook.com: domain of seco.com does not
 designate 20.160.56.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.84; helo=inpost-eu.tmcas.trendmicro.com;
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.84) by
 VI1EUR05FT014.mail.protection.outlook.com (10.233.242.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.16 via Frontend Transport; Mon, 6 Mar 2023 21:27:32 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 19B7A2008088D;
	Mon,  6 Mar 2023 21:27:32 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (unknown [104.47.11.105])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 1D2622008006F;
	Mon,  6 Mar 2023 21:26:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKpdmthIwZEiMZisgRAg82SgN4Yu7IaqYjd59PtfVZsdTuLa3U1G+Yp++FUhwPGq+5NHQNu6zTwXPBwjb3VgVpU2wM2b9KEZaY8pfOE9MPDH1qZd2cJgrKILIxTMHpZ5EDhY6xULZcm9VbW1/dV5xTJUCEmSjdHnJmTaLUMaQ3qbgrAvfAU8mxroIOxUiFvKZZEvcDyRfDhld08XlaN6CRYyNfdYo0gZ6/QUBgUgUIk8LRusWr9yhsiBV1rpPTDug/MaL+gMequNnYdkt5QQLUMiNLn3E1tsQ7er9KvYP0Qe5LOYzpX6wotcX2xmyvmT8HfUcrTqXaPOLcI67V2zNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrOEDK4oPo5spcq0mzZBWUJc9nSXUxbMfKxjyVrEh8o=;
 b=gOwVMYzXlfuEn24bNT4qfKCJpdGUMJT60a4vxLaQx3LvHBVsbgtz+EyW96gZrCYqclU4WC32jRT4WlK+P2+nRNSclRoWfNl2ie+gseimDevIdeg2XDe7HLKdNevy+9KzYXdIsFAbtYEPLDB5c/+wDYLOA3bkH3qruaSsbn6FYmD33y9T7lxEuJ1n1mw85I5zMsSVj2QLMGMUAJISE9ViOy+91yRUv+8guCtHB/I050aiqJFlBRUpcvevpM2EUjYsHfn1xE4mlUKIbAmYFL2L2LuOQ7hmeiiHyElyd2IZ89HanStRZIC38HBAdmLBvAdhoqscY35VaAM61CU3VF3iAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrOEDK4oPo5spcq0mzZBWUJc9nSXUxbMfKxjyVrEh8o=;
 b=dM8O7Q37mqWt2BusLiGThHAibNYilXJeOb624WOW8fZXyFw+ECosfkGNRD/F+FEE988ZPjDg36/mweebb13TXupLAHyI6bnIBXoEsViXcFXPuKTr2LuC8J+eMqH7+4+t1BgST6bDEnwqLgLuRr6mr+ljdLSxlU974II3Ndy27iHBKNtUcmImn12wqTu8Teti21BZFGwAxG9umDYXx0jpS222TS/UaYJ6PvdemYOuO6TLY+84JFwbebCzNiSK8U3NV5cmzoBIDHxR+vTs9qn4pzccnwT7XHsHClJVVx/83WgTVejDM575VLDDhSVeVu/C8f2bD2dZRaxeB95Sxc9XPQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM7PR03MB6214.eurprd03.prod.outlook.com (2603:10a6:20b:136::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 21:27:22 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 21:27:21 +0000
Message-ID: <49b24502-1b21-f05b-ef4a-18d5aa375f8d@seco.com>
Date: Mon, 6 Mar 2023 16:27:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
Content-Language: en-US
To: Jonas Gorski <jonas.gorski@gmail.com>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
 <20230306191535.1917656-4-sean.anderson@seco.com>
 <CAOiHx=mcANqHTk9=b0TGHa2rk9nppnKa2EB1v05uHb5jhzoawA@mail.gmail.com>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <CAOiHx=mcANqHTk9=b0TGHa2rk9nppnKa2EB1v05uHb5jhzoawA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:208:fc::36) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM7PR03MB6214:EE_|VI1EUR05FT014:EE_|DB4PR03MB9484:EE_
X-MS-Office365-Filtering-Correlation-Id: 885a2159-740f-4b82-7acc-08db1e8998c9
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  9oUmUkXCkQQ3CE26tI8o2K25a5YKtZ7hSKstvE0FBaNXG0kNqzujGQ2FFw1SOlbqaKVPPLMcZ2bEkjzgZ4XCgseRm5qbCs3I5sWnC21qkTzoMyUbiJcb+6D8aIYJj8IBpEuHietAqpVgFbeDvtdvcLvg3Ld24LC8fehJLLwpjR9KqqoCyhgnZXwX1viTql7Wp2RuA40HocxY+Eab1fpPRPcLZDOvMoCWwlF60SAbabYKdOBEQHVIqO/YIzZudpPuwHzwG4GnzXf5cYnpJDFk+CTcybLq2ZAcRv79xE09PIkdVAG8jBFoOHIut4xjKKGlgklCeOK5UC6t+IgW9ZmlcIzFOyGGfducJCa6vmg56dF2SZJ/vYZ1hd332vHcgVBwQyIpos6qnGJ93IQAZ3E7u8AT+XYNxHtIqrlBZ6jQ75rWn9GaepfwIi8FzIHTs8GY1s6NEoCQc1AOK7Nfsaj1XkQGRK38t6HtbbYMbENZ2OfTD5S7UGLIcEEWFrp216zfw0kq0+Y/RMu0vh5siQE6wRfNGpfrHwiVC9YofL0NbeRpgZIZbTm3aLXwsKuxU5phmvQbesrBIJ1WVtGu5+DqDm9JzH7SvdaxlGYwkrFPc1gFVkBpVQL8cKSdnqqWdUwTwO/FJ4iw6BJBOQAqhpN93C8LhSa71V/R9evPotYAZ2hiB2bLD4D/hwJYJlLJeAAxWMyvq9d9ahpQM956yBmMNkMn+3U09AWOxP1APHQGMStOwKQHLZ+DQMi6TIKt5wPYTve0ebkV1kCEJARB8vfEjw==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39850400004)(346002)(136003)(366004)(396003)(451199018)(86362001)(31696002)(38350700002)(38100700002)(66476007)(36756003)(44832011)(66946007)(5660300002)(2906002)(6916009)(4326008)(8936002)(8676002)(7416002)(41300700001)(66556008)(186003)(2616005)(26005)(53546011)(83380400001)(6512007)(6506007)(54906003)(316002)(478600001)(6666004)(52116002)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6214
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT014.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	88e7e9d4-accf-45a0-0f2f-08db1e899234
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vX0Iq6r8YR+mJQHIz2tXkzCOOgKWD6JzDIq/uf30o6zbIHvKXXRLnoIG/Mq2HI7AbVMWMw1vTLaYvlgKlPodg5b8AOt27z/adDEJ5Mo2Bx0xH5c7R5SWpkf0B4J3ExE3KWSJtiPlLQ793zHjcoRNrPE6lP93nCXslQ402VK3NzcbghqxRZDIPJX7Agd20Fvp6UidJVNntRUg1yuwIE5TJ+oGNX4bpV6JX14jeyF6nUniip6bVt8tgUANtn1pbW/9du9TiqJVtehigOWF7A0tbTQj04EpI4s3S5f/j7eVn4tVUG/2r4TmvDrYQhUinhj0xrKYv/r9bqqEaCBHOv6/3IHlgXJFZlk2yyQevuRrKjWKCI2e9Xmex8IBQ7fxO5BC625qVzHaI3yZoDvXkylO+0Z2kcssicrha2tFPSX0NLSz/umozmocIEWTeqmJX9wlqOlEoit5ZNyhunwyBNzyhfFCfvb0j0t3bJdHL5I0VFtBfULv2Cq0/zSWgvCn03qUKGkPpIOM74SmVFbti72nc1d4t2O9UlQewYQsFOIDPgucezgfS8DyUgO0UoEZumx3QrO5s72LIiKxGbP36u+hfc+p8IZ4HAZMoWFove1WSUa1AJBDqVP8ZdxnNI27StJviauIAACxH6gj2T6L5zVsLVsj+3uOJew6+jbzQfGcRHmVaope44FXfySPhLaMxXvmlFbX3tKbXeDggfFZA0MUa2Bm5JzB4pCKejcbnAQzqZMDfjwVhzTK5ZJMDjwoKmagMbGwNclRhxkW97D5TbqLUkPuizaJGSJQdJTk+vox5TU=
X-Forefront-Antispam-Report: 	CIP:20.160.56.84;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(39850400004)(396003)(346002)(136003)(376002)(451199018)(5400799012)(46966006)(36840700001)(186003)(7596003)(7636003)(356005)(36860700001)(6916009)(34020700004)(8936002)(41300700001)(70206006)(4326008)(8676002)(44832011)(5660300002)(70586007)(7416002)(26005)(53546011)(6666004)(478600001)(47076005)(2616005)(2906002)(6512007)(6506007)(82740400003)(336012)(6486002)(316002)(82310400005)(54906003)(36756003)(40480700001)(83380400001)(31696002)(86362001)(31686004)(43740500002)(45980500001)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 21:27:32.4969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 885a2159-740f-4b82-7acc-08db1e8998c9
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.84];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT014.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9484
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, =?UTF-8?Q?Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/6/23 15:51, Jonas Gorski wrote:
> Hi,
> 
> On Mon, 6 Mar 2023 at 20:16, Sean Anderson <sean.anderson@seco.com> wrote:
>>
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
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>> index 4d69f79df859..e11f4af49c52 100644
>> --- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> 
> You are (re-)moving the compatible this file is named after, you might
> want to rename the file as well then. Going by age bcm6358 would be
> the next oldest one (bcm6318 would be the newest, despite the lowest
> number).

I can do that. Would it be fine to rename to e.g. brcm,bcm63xx-gpio.yaml?

--Sean

