Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 274E394E267
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Aug 2024 19:11:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ezM5l/IW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Whkgr3ZxPz2y8p
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 03:11:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ezM5l/IW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Whkfr2jr6z2xjN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 03:10:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4W7bpn/ULmldFa8Gy0G1wx4GgV6HFxgF+rAnsuMal7i1MtK3T1uO05I4xIHhFniSR5DrHjo1LGjBrgL2G1BX+NauvVY4ehubGK7p6U/BqF3gDiKhH1ugyJz9kUV7cyjoesbKlmcek11Ohqtf5FnaiVJK53wfIIsV7CQHFBdRguhNzh2WDN+b9TmYPKFMyHvgQCJLz24VWUUkqsepC/bnUvZftnaN1zadESzhNo+o7ru9uYq0jWByAkI6Opwjb52gRz5ijh58NjfNuPjWUHB7tLlxKhWp6vQhAesdXZij9hByUZufZvOx4IM06aT1JsMo6Q+SsygwLm0Xx/ge0ZmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGexX0xg5kUi2JWfP3C7ydgV8jquyRDq9RpgYiz/KLw=;
 b=Yv+H4qgFYeYE5UXZJESFynShYo/CmkQ/NMeMWkrzt/YVm4yomx+Uh/dfoV6nuHUWiblCZe7gGcHjcHKdHCW8FgTG5ZotI9wWzzFY00C4uBIRVcBXgW3UZUSEpd8GOc4NW4CcsIxwx6xPMJ7ipc212uX6eljOkCzvDC+niHZ9DsCObQABPjtOzl1Wo+Bj8nXquG8uBPWblRPluGoCOd1sscyMf1ElMLlWx77pUg33iSxjgFaDSDOmJ0BfM+pXxZR2BznA/AwVwfl2Xh2TpKTUYV4J4979SwU7kt3kIPxdFnA6fcs0xp33iICZ446UnSAobLBg+e0paLIUMca6ouVzJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGexX0xg5kUi2JWfP3C7ydgV8jquyRDq9RpgYiz/KLw=;
 b=ezM5l/IWuBJ+K7jLuaqm9/x5DgacQeyRfmPFjEuIi09RmtkZXsQ4rulbOXFkFOz2VzNBTScQNUP+J2Osr6BSpzDLg0VzSCUBgO4TLbpShmfPen+m6rrg+5GsFcxiAdS9dmpZUSorZQNsmsiAUp75j+grQcL5m+EPXWZ4+xQXQDK/56xHHf+V1l7u7izFFZaTxzMmXqyc7t1TcZ2jMcasEDp264rcSesr4qUQSIXn+mD39OeDRDIEVzQhay9vVlITccQYV4i62M7+Y0ilheiZaegVtEsWDHr+m36gmi3WEiRMcyjTdGJKjdd2AxFYN8VOES1s9Gc4xC3S2zBt1vT71A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10671.eurprd04.prod.outlook.com (2603:10a6:10:582::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Sun, 11 Aug
 2024 17:09:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7849.018; Sun, 11 Aug 2024
 17:09:42 +0000
Date: Sun, 11 Aug 2024 13:09:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: fsl: fsl,rcpm: fix unevaluated
 fsl,rcpm-wakeup property
Message-ID: <ZrjwTWk9O3MY/D6f@lizhi-Precision-Tower-5810>
References: <20240811153507.126512-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240811153507.126512-1-krzysztof.kozlowski@linaro.org>
X-ClientProxiedBy: SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10671:EE_
X-MS-Office365-Filtering-Correlation-Id: b04075e7-8826-411d-959d-08dcba286429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?RNUxF5Qcg1gXW0AOJ4A49lUTNjCw9/LGH1hwmgdyJMyWb8fk68TfSbU1Bad7?=
 =?us-ascii?Q?SgDWn+4ysNszABPFdCaud6eTBoxbCcicMqm99ppoZZP3NnitOlyagqjSYiZP?=
 =?us-ascii?Q?jaX69p5QVU/ZF4dDxM+xW3Lkp4AWhxbpAceJJgDsKvL7kGX1/5U735efehuh?=
 =?us-ascii?Q?+jBGXeyjGClt/oay5xf/T2/aIkWR4QoMZEwA1mPoKpalRtrtsYEgp2Tvf0V7?=
 =?us-ascii?Q?I2cH85Cp8d5hlyf8gbFxyXca9UMakzKguqCGvRxhVQDU21scO+CVRDQZWRM/?=
 =?us-ascii?Q?KEncdZhNCZmn3Nv8SSAl8JYBQpUvZP2hkcxwfMUx7TBIf2Ys0/mrqFPlduPh?=
 =?us-ascii?Q?d6360483R7hn8kbNhc7H+WkaW3pIT2t28lV3pR6lQtnb8DIWj6nLxJQf6NJC?=
 =?us-ascii?Q?/JnB+5OsVAM9W3Fni5se1Nkb0A0bjSigeCohGEy6ehbk2FAwDR669fd91Bvq?=
 =?us-ascii?Q?ewozPpfrAmw0Mai2FXSQhKSJIkRZ3hKL6v4+KBUkrVQylqXp6uhNqNotqBgl?=
 =?us-ascii?Q?JTUHUpHJLE32TNCEhmsSwnf7QV+kWz13nRMrE1UbwfFc1hw1R01q+KaNnoDc?=
 =?us-ascii?Q?akt8LYEpOJNPPVtuFjSGzbnWHbSl86EIeAV3zsT1XT4zMem7/2jqj/2+5bvJ?=
 =?us-ascii?Q?eMNQFBhqwSF8gDoHQofNy/S2MxmHf2BJlemsZH/A9SxM4x2dXXEWodLDhdLD?=
 =?us-ascii?Q?jwqypA5Nq0gaHJXG/zmJ2O8hy+5O4awJNiLW863P2iktAxXhSxIxwqeW1h2Y?=
 =?us-ascii?Q?Eh0A1Abw3SvzFgWnY9xoVA7PdeyelC47ev8qCyW+Z80qnSmec52doeXeLSxJ?=
 =?us-ascii?Q?0VYWA83xr0AGnAAvi3b2fRypZ1hvst7G7kjc+qgC5Ni+Rhcn+nUweLFNGk+D?=
 =?us-ascii?Q?1HCI3/Nw/c/4UQQEfYxRSZQXblCh22Cp/NjUPZXZfXrr4Ovt70QvXJGD9ylR?=
 =?us-ascii?Q?9zbDcRsMZeE6oBQ/A+CxtEJhkXmaEC+/noQK2ZG24Xh/8xaEhZWOplyciMSO?=
 =?us-ascii?Q?FX1dY6zOunJlD0zhhR/N+M8Qiu/GARyqvWwn884Vb9YBzEZt9ZLy6gmdKG/J?=
 =?us-ascii?Q?WaneJt6eeQ7ciuXhgLubIDJJCdO3rw6/cOmIksFAyoDuJ7P0kXwNu9KT5Lpw?=
 =?us-ascii?Q?tLhApOi3UQbeIeQjkuTlLE0rlzQTAu7/koj0AgFxKoGO2y9tkkkF5/ktKZkH?=
 =?us-ascii?Q?Pm3ZrxOlHhuABYxACFD+pgNZMCuo82kF+ge61laSxSQIpVcgcrmFWgspieds?=
 =?us-ascii?Q?BHigOWTfNe/SZx7vQ7H8sxeAOsFCjOizen7bKIPiUdccNrPTYjyj6cs4OD86?=
 =?us-ascii?Q?YH9TZ6MXg3NNKh41rXkU7AuNU+bFZseOIp5ImVIExjI1Wj2c7WEbDACJb2QZ?=
 =?us-ascii?Q?2iNMgdQ=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?5Z0koF71chZx4ikG/hfwxqx2mgASnX5H9w06L1VIro0m4wIwQxSegXorJZUk?=
 =?us-ascii?Q?lIJwzA/1yigCPo4wzGryJ/IEeM/eP4e/eZNwYgkOgY/D+Hxim4wKw3QIhaRl?=
 =?us-ascii?Q?GQvaes06FrJSpfA2dhXvXc42UF6vG008LGsU7GBrbbDxBjHfiJHjCsu7zysN?=
 =?us-ascii?Q?QRmCdRXQMo7iU8jqImfl77FjnBIlD/xW6TI+4Csn1qekw6OrwngsOAz/cJio?=
 =?us-ascii?Q?i85pA1wyojXvl/fVY5PrmEYTe125eSDd96pr5cyaF2/tqg3cJf/pXQKr1HtP?=
 =?us-ascii?Q?/iV/Df0otoIcqdtzvZ9iHmB6tEnMDnq4RXpxrLefi2mqoMNsvG3OH9h0fRv5?=
 =?us-ascii?Q?Mjpa+Wv78FVBCYXEit6gEsS7PdFK0Ndku3P4Wlrbjhp2+FcK73LzdMaMUyl/?=
 =?us-ascii?Q?u3/iqxW15EvlxnfrB5sCVplEPkN119e2gkTAIiAlzl7LbGS1WIqZ/RPJeIVl?=
 =?us-ascii?Q?ltbaVoc+chu2XZUFnTYHn+BQkfxqdlzHL7ZJ65kUuedFfwlVqG3XgIuNKyqD?=
 =?us-ascii?Q?lA8cXsD5Fu4DFnHZNcalbVGJCjFgJHvkX5/eyUki9Ts+Qp6ImlhveRPZ21ei?=
 =?us-ascii?Q?JW3OCciVcBboUICPppsD7U98Qap8ixxneFUEuBm2nPCFCCboxdDDO6Ws+Vlm?=
 =?us-ascii?Q?YOl/HIFIXI2YuaC7dXBVNLQWxax+fukIslwFwDUoeSqFJeQtiX5CYSwAB7k0?=
 =?us-ascii?Q?nwrr6mFGJv4Js4WpjgKNtoOhA5BaTLuNghiPojqZpqIsbFmlFUtmxQ4Wm+hA?=
 =?us-ascii?Q?Nk2nyHNsetriOK6CbmLt+YyemS1Ii+bwdK0uyRZns/DYgwbV+Kxgq7tZSwCU?=
 =?us-ascii?Q?CeJn1P0VaDZaJ0STZMb3vXMcC0PaT6driV0slGWQj8AtyHnNq1RY7uqpozGw?=
 =?us-ascii?Q?hM+oN5rmMDod5D3DeoF8bohXgQdcRfbIydgXoFs3qJ0b5uc/QVeBqf8cM18f?=
 =?us-ascii?Q?J/jekiFZ6F9UI59CEBDKP+Q0AQbmMDWko5NHbGzJH/1HQz2zOPZRS807qdLF?=
 =?us-ascii?Q?9dfcol1wgcYm42RXsblpyQ5QJ8PwMignyfFMy5Y3SwQBH5puXBDSXnMXchBG?=
 =?us-ascii?Q?pYMLAY1j4y1jfmKGb+c+OOV+fe0ETROat0hB0gvv7kTwneNMRDazVjw+bkHs?=
 =?us-ascii?Q?XFdcI/JBFXgdbsbMwvjpFoP2rNtn88PfFrSEPnqMHMlJjmspt6ulrbMSp8JR?=
 =?us-ascii?Q?E99qIyKlm1E0cLU5otde5aVjtNdNMgY1TdYooitLA/en/V88Lvf2WTc4LpOK?=
 =?us-ascii?Q?qzyDS3H+PgowHLDDBIsW+mhbEptzGsS0UN4cesLhSFrefVw3gxyZD+bAVMVS?=
 =?us-ascii?Q?HNzubpDQiwVTCu4CStQAgTASKFSmjKQ2b7m1OwreqR9G9dKfl+wYupvRPRVw?=
 =?us-ascii?Q?6ypzjBicmIkIb7gnthmlKypJxi3AE3N8tQNj8RMxu0jdxEks1slXpkrRluwJ?=
 =?us-ascii?Q?kXKGNiZHBe58lZE4ZSJZV7G+gvoHiHZg82IBTwzv8o6FxztwsXbSQ/gDbdwG?=
 =?us-ascii?Q?1NZFqzes8px4D+cF5aWrsNE7grOXpH1ID/iKls704Wf8MgJmOlvc9OPWdcdd?=
 =?us-ascii?Q?F1EUe+WwZHPmAkQAFnkmmZY591SKibRMV5JoRkjq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b04075e7-8826-411d-959d-08dcba286429
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2024 17:09:42.2941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJwFL6tpeiUcysO86kPoTixL8BR4bv0wFPFkBJWdEFYL2xlhykUOJe3XmErvwDvu3H36TCoIC540eUz/QWxusg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10671
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 11, 2024 at 05:35:07PM +0200, Krzysztof Kozlowski wrote:
> Drop the RCPM consumer example from the binding (LPUART device node),
> because:
> 1. Using phandles is typical syntax, thus explaining it is not needed in
>    the provider binding,
> 2. It has 'fsl,rcpm-wakeup' property which is not allowed by LPUART
>    binding so it causes dt_binding_check warning:
>
>    fsl,rcpm.example.dtb: serial@2950000: Unevaluated properties are not allowed ('fsl,rcpm-wakeup' was unexpected)
>      from schema $id: http://devicetree.org/schemas/serial/fsl-lpuart.yaml#
>
> Alternatively, this property could be added to LPUART binding
> (fsl-lpuart.yaml), but it looks like none of in-tree DTS use it.
>
> Fixes: ad21e3840a88 ("dt-bindings: soc: fsl: Convert rcpm to yaml format")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  .../devicetree/bindings/soc/fsl/fsl,rcpm.yaml         | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> index a7db0aad2b25..03d71ab930d7 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> @@ -80,17 +80,8 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> -    rcpm: global-utilities@e2000 {
> +    global-utilities@e2000 {
>            compatible = "fsl,t4240-rcpm", "fsl,qoriq-rcpm-2.0";
>            reg = <0xe2000 0x1000>;
>            #fsl,rcpm-wakeup-cells = <2>;
>      };
> -
> -    serial@2950000 {
> -         compatible = "fsl,ls1021a-lpuart";
> -         reg = <0x2950000 0x1000>;
> -         interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> -         clocks = <&sysclk>;
> -         clock-names = "ipg";
> -         fsl,rcpm-wakeup = <&rcpm 0x0 0x40000000>;
> -    };
> --
> 2.43.0
>
