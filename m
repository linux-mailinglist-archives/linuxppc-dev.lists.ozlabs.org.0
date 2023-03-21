Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4230B6C3BC5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 21:28:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph38d12rdz3fBd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 07:28:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=IOfPN89K;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=IOfPN89K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1a::31c; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=IOfPN89K;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=IOfPN89K;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05hn2031c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::31c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ph2yh06Glz3fSq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 07:19:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsBYeAYE/RMBziy6MZeIKWp8Mmx6UC7ATwbuZYSz0a8=;
 b=IOfPN89K0fc9vG6nLKn+rhTc4wsR7CzIREFWiU5iqwrb/8Ydz/2YHcHJHQZKEl8UvfMzHCjvNBEydvfo7piLNQ43VonNQIeHaybtF5Ry4RJ4NIex7Dp8mcdvGdSfLHNQEyjkyU0RtCNlMtXqbdxdS+JVFC87cNE59Ws4hRNUVIVgVxSgNJJed4sOKrIMt+J5jML3PG9mlecwmO0a9vTeRfcp5ACLUZH2QfUse4eedLKkGh+EsH7NuRKz9nCdXJhGtY9oEDKidtOKiWNYtmIyDenTWEp7siaC2JEEsiePb8utRY1nGD5YVd1b267iTUOduFQ/DJTO0lLaEZfg3rYVbQ==
Received: from DBBPR09CA0027.eurprd09.prod.outlook.com (2603:10a6:10:d4::15)
 by AS2PR03MB9930.eurprd03.prod.outlook.com (2603:10a6:20b:641::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:19:36 +0000
Received: from DB8EUR05FT006.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::c1) by DBBPR09CA0027.outlook.office365.com
 (2603:10a6:10:d4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 20:19:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.86)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.86 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.86; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.86) by
 DB8EUR05FT006.mail.protection.outlook.com (10.233.238.162) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.16 via Frontend Transport; Tue, 21 Mar 2023 20:19:36 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id B46272008088A;
	Tue, 21 Mar 2023 20:19:35 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [104.47.18.107])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 3CD5620080075;
	Tue, 21 Mar 2023 20:09:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FemfmyCNxoPdAgF5gYZnIXXUDQYpDC/9/rJuCLJJCkDhlkCVjj6KzTV7aaukagAOr3N7xpX+4ZQCEA8EbTFocqfYLDzD4eGXE2JPnQZlWZUvL3MgCuAN0cfPTIOyXJwFFWbsW8m1EtjOhUpseNfyaf+heZ0kLgWNOi+yOcETJQXe1CMreT0tkjUtDBf4AtOHBNqPtrIm6HVWdGjlWWByjDtXTVEwDm9LYFPuvktidSRNnEVXB+sICbZKE3d51uNnxS+9TZI2La0Oz4kMIgWM2UHN0dI2qoL+vyP2YDY6QPfl1cPRRtKldiIs6M8XDW9aO9bAxuMoC3seYAZA+wPprA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsBYeAYE/RMBziy6MZeIKWp8Mmx6UC7ATwbuZYSz0a8=;
 b=Gx1jLfC3PkjWHv6SgKDliCiK1xAsKN3K1Vv+k5FoCCzRouLJGua6CUE/0KUsn+wsjHPmS40HKbS4/2SK/WuMj5vNIoqY6PAWNGnXzyHkpbmKKhy6eKnGIr0wVygm1VHyLPcZvuHwZTedFvtAZCryDzgHa3GWXcl0xnLnUKxrTjqdNlwxg49ohvPrq0qJwuin+29ttzZc150o0p6Irrehf6i/OmB6UYOOzqnkway65zFbbxDTbHlkbSzHM+WtQJ4lleigLUK+bpKOKIeNAEk4E3ehlei+umk/wdiECA/3x6b+deyt2Ub8I8sCGm4xl++UMYuISCInILeyw/xYDXM2Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsBYeAYE/RMBziy6MZeIKWp8Mmx6UC7ATwbuZYSz0a8=;
 b=IOfPN89K0fc9vG6nLKn+rhTc4wsR7CzIREFWiU5iqwrb/8Ydz/2YHcHJHQZKEl8UvfMzHCjvNBEydvfo7piLNQ43VonNQIeHaybtF5Ry4RJ4NIex7Dp8mcdvGdSfLHNQEyjkyU0RtCNlMtXqbdxdS+JVFC87cNE59Ws4hRNUVIVgVxSgNJJed4sOKrIMt+J5jML3PG9mlecwmO0a9vTeRfcp5ACLUZH2QfUse4eedLKkGh+EsH7NuRKz9nCdXJhGtY9oEDKidtOKiWNYtmIyDenTWEp7siaC2JEEsiePb8utRY1nGD5YVd1b267iTUOduFQ/DJTO0lLaEZfg3rYVbQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by GV2PR03MB8728.eurprd03.prod.outlook.com (2603:10a6:150:7c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:19:22 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 20:19:22 +0000
Message-ID: <b0b5db38-cdbb-16eb-dfc0-cbc7e76d617c@seco.com>
Date: Tue, 21 Mar 2023 16:19:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v12 03/13] dt-bindings: Convert gpio-mmio to yaml
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, linux-phy@lists.infradead.org
References: <20230321201313.2507539-1-sean.anderson@seco.com>
 <20230321201313.2507539-4-sean.anderson@seco.com>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230321201313.2507539-4-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR16CA0001.namprd16.prod.outlook.com
 (2603:10b6:208:134::14) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|GV2PR03MB8728:EE_|DB8EUR05FT006:EE_|AS2PR03MB9930:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3f0b98-4e4e-4a3c-ac92-08db2a499765
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  HgHuAedFiAxwhdmMvMEJq4+Lskskuf8vbSfKqZszpCtpg6zB7u0NA2WWpI+I4pP6+ULcl+nJrDGFJSoPTEj9DUIPyKUpPRtMAaa+8imwoCgBcIDcgXVr8bzOHpN0Fy4LVRy18fxyXeoiuFOvZ4oFomiKmcV84s4rOBh03CRRWtvvICs7vSBZS+tBve/1Z7FqVFJdtvQ0S7LbZxBIlUIY57rqNgkCJY1K6TzFoTRaZzO2FCjqyneQYreVtah7rGFr5tH2IWpb5x9SNWo/Dzdhb4wmhRtUtJEqtoWO8etinwrKV6QfG7CJA4sP7/2N9rMCAdviaPZpaq2Unnjiaf4b67P9JUrplU/5VZFs0mmJAGOpKyFsaqxAHFHk9Sp/hjC2cFlI+GTOmOSBuKr7XJQjqvh1TRVTowNrHrO9dUecq6UYYE3MZn8M8itSb5v2QzeIrv/KIIWdBsA34KNYRVlJX6cWRz7wL6CL/j54CrU9V/imMHqg19BQRicxPb8Xmb/FvTkyyYenZlBjf2mgakZOhZwNxF1bIEi3KlnBUIIUDZTqsPCemJmiooXQi3dmCxlOFi06jQ94J/qiR9VtNT5T2xNTugoNpT+gQl9dCgQVMRSLj6SbFq0BWW0mZbyRXh5YqovKTYAwhK9K9oJIJmLXQy8zXp5+2qbX1Vdh5ufeEbAmSngzekSVH/dN4XEWeR2Or/nic5MxXEdrkDJ/NWGyLI2zP9o8NLjitaXtxipi8Fx2XnpigzdExCkrYKC7rlIp
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199018)(6506007)(54906003)(2616005)(186003)(26005)(6486002)(6512007)(966005)(6666004)(316002)(66574015)(31686004)(4326008)(66476007)(52116002)(66556008)(53546011)(110136005)(66946007)(478600001)(8676002)(83380400001)(5660300002)(44832011)(7416002)(30864003)(41300700001)(8936002)(2906002)(38350700002)(38100700002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8728
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT006.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	ed0936b6-70ce-4e6f-01b1-08db2a498ee9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mCatBZZSeZssREjYoeMzZYQuPBgq1cdLk8kh9D8EsvtzCFs5v5ccRmdLaOI8SHMUPtB2EZN8balnunDKAo5aXxwpiN38AABt5n+JyZ5nMXNqKk5+WopUpJAzI19D42yBw+Gc0/5PFPWeIXqIM+Tfd1O7SxjJeXrl9XWKypH6bRNa/G7KvE0Jora46HigFnTuc96FDRoCTgmFhbGG7vbfjs8AYKL4bzkyPrsbVID9hNpOus69HdRblXJcKZQ/dWu+Vh3UxNFagARLeN7bon/SL8I20WaBqC0yYFL1PXKhz4SPDGdOOZiojx0hd4beujzvf+xD8bsR8ZK5kZ7FS/fjlRl2y3O6iyWE9nOYh16Rv0rIFQLCtIOlWn+RC3jd65h9wJ1AbgTJ3fQ2GsN9ryyp+kT6CJ7nQBq4BLwojnzxRuey26I5Pr6tUxMx9Ucuf8mUVElz4u1wg+vmlbZV/n5C7LehNExsnAIoFvq7PA+psNiflyIH7Gw7uI+vRJ4fBiI31bi66ikp20n+TdRBeQw/iNs4eGoLXlNHYwj2g0J1+U52pq3kyrvvBW2Z4O6sXuQaoVpmnHvAVT406IqbB4cyQgYuMwGrl8ynE5ra6e3jwzQFUJek1a4oNWVhhxkvKma9lGRgS6h2URcvPOC/u5CcUoO6flqz84KIJF/1sXJY0BeRICmFmXDcELmX22ZbmiYo7LUT3gmFiwahpCjS9PH6RUMml7dEAmfB/x9ihE7nCRfBRQyFJvY5RZmLNXX9o78eofPenC2XVG4+w7BCWwRu0wSy3R6UGri0TIpmwtSZRn8=
X-Forefront-Antispam-Report: 	CIP:20.160.56.86;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(396003)(136003)(376002)(346002)(39860400002)(5400799012)(451199018)(46966006)(36840700001)(40470700004)(30864003)(5660300002)(7416002)(336012)(6666004)(6486002)(966005)(66574015)(40480700001)(41300700001)(31696002)(47076005)(478600001)(83380400001)(316002)(54906003)(4326008)(110136005)(8936002)(70206006)(36756003)(82310400005)(86362001)(36860700001)(8676002)(70586007)(40460700003)(34070700002)(7636003)(7596003)(2906002)(356005)(82740400003)(2616005)(186003)(31686004)(44832011)(26005)(6512007)(53546011)(6506007)(43740500002)(12100799024);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 20:19:36.3121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3f0b98-4e4e-4a3c-ac92-08db2a499765
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.86];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT006.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9930
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

On 3/21/23 16:13, Sean Anderson wrote:
> This is a generic binding for simple MMIO GPIO controllers. Although we
> have a single driver for these controllers, they were previously spread
> over several files. Consolidate them. The register descriptions are
> adapted from the comments in the source. There is no set order for the
> registers, and some registers may be omitted. Because of this, reg-names
> is mandatory, and no order is specified.
> 
> Rename brcm,bcm6345-gpio to brcm,bcm63xx-gpio to reflect that bcm6345
> has moved.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus or Bartosz, feel free to pick this up as the rest of this series
> may not be merged any time soon.
> 
> Changes in v12:
> - Put compatible first
> - Keep gpio-controller to one line
> - Add little-endian property
> - Alphabetize compatibles
> - Remove some comments
> - Remove some examples with insufficient novelty
> 
> Changes in v11:
> - Keep empty (or almost-empty) properties on a single line
> - Don't use | unnecessarily
> - Use gpio as the node name for examples
> - Rename brcm,bcm6345-gpio.yaml to brcm,bcm63xx-gpio.yaml
> 
> Changes in v10:
> - New
> 
>  ...m6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} |  16 +--
>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 117 ++++++++++++++++++
>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 ------
>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 ------
>  4 files changed, 118 insertions(+), 91 deletions(-)
>  rename Documentation/devicetree/bindings/gpio/{brcm,bcm6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} (78%)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
> similarity index 78%
> rename from Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> rename to Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml

I forgot to update references to this file. Will fix for v13.

--Sean


> index 4d69f79df859..e11f4af49c52 100644
> --- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/gpio/brcm,bcm6345-gpio.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Broadcom BCM6345 GPIO controller
> +title: Broadcom BCM63xx GPIO controller
>  
>  maintainers:
>    - Álvaro Fernández Rojas <noltari@gmail.com>
> @@ -18,8 +18,6 @@ description: |+
>  
>    BCM6338 have 8-bit data and dirout registers, where GPIO state can be read
>    and/or written, and the direction changed from input to output.
> -  BCM6345 have 16-bit data and dirout registers, where GPIO state can be read
> -  and/or written, and the direction changed from input to output.
>    BCM6318, BCM6328, BCM6358, BCM6362, BCM6368 and BCM63268 have 32-bit data
>    and dirout registers, where GPIO state can be read and/or written, and the
>    direction changed from input to output.
> @@ -29,7 +27,6 @@ properties:
>      enum:
>        - brcm,bcm6318-gpio
>        - brcm,bcm6328-gpio
> -      - brcm,bcm6345-gpio
>        - brcm,bcm6358-gpio
>        - brcm,bcm6362-gpio
>        - brcm,bcm6368-gpio
> @@ -63,17 +60,6 @@ required:
>  additionalProperties: false
>  
>  examples:
> -  - |
> -    gpio@fffe0406 {
> -      compatible = "brcm,bcm6345-gpio";
> -      reg-names = "dirout", "dat";
> -      reg = <0xfffe0406 2>, <0xfffe040a 2>;
> -      native-endian;
> -
> -      gpio-controller;
> -      #gpio-cells = <2>;
> -    };
> -
>    - |
>      gpio@0 {
>        compatible = "brcm,bcm63268-gpio";
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> new file mode 100644
> index 000000000000..b394e058256e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic MMIO GPIO
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +  - Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +description:
> +  Some simple GPIO controllers may consist of a single data register or a pair
> +  of set/clear-bit registers. Such controllers are common for glue logic in
> +  FPGAs or ASICs. Commonly, these controllers are accessed over memory-mapped
> +  NAND-style parallel busses.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,bcm6345-gpio
> +      - ni,169445-nand-gpio
> +      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
> +
> +  big-endian: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  little-endian: true
> +
> +  reg:
> +    minItems: 1
> +    description:
> +      A list of registers in the controller. The width of each register is
> +      determined by its size. All registers must have the same width. The number
> +      of GPIOs is set by the width, with bit 0 corresponding to GPIO 0.
> +    items:
> +      - description:
> +          Register to READ the value of the GPIO lines. If GPIO line is high,
> +          the bit will be set. If the GPIO line is low, the bit will be cleared.
> +          This register may also be used to drive GPIOs if the SET register is
> +          omitted.
> +      - description:
> +          Register to SET the value of the GPIO lines. Setting a bit in this
> +          register will drive the GPIO line high.
> +      - description:
> +          Register to CLEAR the value of the GPIO lines. Setting a bit in this
> +          register will drive the GPIO line low. If this register is omitted,
> +          the SET register will be used to clear the GPIO lines as well, by
> +          actively writing the line with 0.
> +      - description:
> +          Register to set the line as OUTPUT. Setting a bit in this register
> +          will turn that line into an output line. Conversely, clearing a bit
> +          will turn that line into an input.
> +      - description:
> +          Register to set this line as INPUT. Setting a bit in this register
> +          will turn that line into an input line. Conversely, clearing a bit
> +          will turn that line into an output.
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 5
> +    items:
> +      enum:
> +        - dat
> +        - set
> +        - clr
> +        - dirout
> +        - dirin
> +
> +  native-endian: true
> +
> +  no-output:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      If this property is present, the controller cannot drive the GPIO lines.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - '#gpio-cells'
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio@1f300010 {
> +      compatible = "ni,169445-nand-gpio";
> +      reg = <0x1f300010 0x4>;
> +      reg-names = "dat";
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +    };
> +
> +    gpio@e0100000 {
> +      compatible = "wd,mbl-gpio";
> +      reg-names = "dat";
> +      reg = <0xe0100000 0x1>;
> +      #gpio-cells = <2>;
> +      gpio-controller;
> +      no-output;
> +    };
> +
> +    gpio@fffe0406 {
> +      compatible = "brcm,bcm6345-gpio";
> +      reg-names = "dirout", "dat";
> +      reg = <0xfffe0406 2>, <0xfffe040a 2>;
> +      native-endian;
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +    };
> diff --git a/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt b/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
> deleted file mode 100644
> index ca2f8c745a27..000000000000
> --- a/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Bindings for the National Instruments 169445 GPIO NAND controller
> -
> -The 169445 GPIO NAND controller has two memory mapped GPIO registers, one
> -for input (the ready signal) and one for output (control signals).  It is
> -intended to be used with the GPIO NAND driver.
> -
> -Required properties:
> -	- compatible: should be "ni,169445-nand-gpio"
> -	- reg-names: must contain
> -		"dat" - data register
> -	- reg: address + size pairs describing the GPIO register sets;
> -		order must correspond with the order of entries in reg-names
> -	- #gpio-cells: must be set to 2. The first cell is the pin number and
> -			the second cell is used to specify the gpio polarity:
> -			0 = active high
> -			1 = active low
> -	- gpio-controller: Marks the device node as a gpio controller.
> -
> -Optional properties:
> -	- no-output: disables driving output on the pins
> -
> -Examples:
> -	gpio1: nand-gpio-out@1f300010 {
> -		compatible = "ni,169445-nand-gpio";
> -		reg = <0x1f300010 0x4>;
> -		reg-names = "dat";
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -	};
> -
> -	gpio2: nand-gpio-in@1f300014 {
> -		compatible = "ni,169445-nand-gpio";
> -		reg = <0x1f300014 0x4>;
> -		reg-names = "dat";
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		no-output;
> -	};
> diff --git a/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt b/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> deleted file mode 100644
> index 038c3a6a1f4d..000000000000
> --- a/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Bindings for the Western Digital's MyBook Live memory-mapped GPIO controllers.
> -
> -The Western Digital MyBook Live has two memory-mapped GPIO controllers.
> -Both GPIO controller only have a single 8-bit data register, where GPIO
> -state can be read and/or written.
> -
> -Required properties:
> -	- compatible: should be "wd,mbl-gpio"
> -	- reg-names: must contain
> -		"dat" - data register
> -	- reg: address + size pairs describing the GPIO register sets;
> -		order must correspond with the order of entries in reg-names
> -	- #gpio-cells: must be set to 2. The first cell is the pin number and
> -			the second cell is used to specify the gpio polarity:
> -			0 = active high
> -			1 = active low
> -	- gpio-controller: Marks the device node as a gpio controller.
> -
> -Optional properties:
> -	- no-output: GPIOs are read-only.
> -
> -Examples:
> -	gpio0: gpio0@e0000000 {
> -		compatible = "wd,mbl-gpio";
> -		reg-names = "dat";
> -		reg = <0xe0000000 0x1>;
> -		#gpio-cells = <2>;
> -		gpio-controller;
> -	};
> -
> -	gpio1: gpio1@e0100000 {
> -		compatible = "wd,mbl-gpio";
> -		reg-names = "dat";
> -		reg = <0xe0100000 0x1>;
> -		#gpio-cells = <2>;
> -		gpio-controller;
> -		no-output;
> -	};

