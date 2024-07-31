Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C389432B6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 17:08:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=SsGqaR05;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYwTc3yptz3cfx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 01:08:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=SsGqaR05;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYwSt6JSKz2y8r
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 01:07:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbG90CkGcJIw9oxqsnTvc+5QjhkDh+ZlGrQx6QvcpnWZbFsuZQGCpnQx6yuwESMF5uNAKn6BxsYfxUdapsdWfK/f3cFqRiBZrz1DTQQlHHG9+Fz77CIwLdizHD9YYNnhOUt3A34Auv8XveFGGmspCxme8fXP7KB/JKWtNdkkjka9fj9dUlIlRDzOomtln7HGdGKsfpZCy+B3P/chfmN/dHnnP7h0RynENDXH1235JGJqht6ki3u8D4GlTVIHcSjpIwYmlh7yMvpOeH44wf6M9m0mpHICC2rPchyJS4yWUYrb3kLTnmRuEV/I7/QEi3esICutXN9trkioug75N06ZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2g+/10huIqAsccUGGXH+HyIvJrJ3eTI0s+jklVM6xkg=;
 b=o+5Z9eqPwsr28C2Qt59NihDnlMakQCFk3S1zdKGbqMRfatlhHRcQYQbY7Y/fnn935sTbwHIvFyRzXej5dgSKvQ6l7TDyOznzlY+zAjUQ1IiQuecBtg+Dn7XSxh3uHEc3+tDrR0GlgDDJ9TpWCMoUpGYQdK8IsI1vNg4EHK2a7dtSacOLxJBkY/aNk5kU5va4Oj4o6pzPFX81pqwUu4iDb3Fw6Z2aprLts2shzcEpGWNZZkQlYgl29v/Du0tZrg/GkYFZPlfWAYTaLx0SgtAaMdM2GwP7/c1VOer1lRGXZJpRf5vwX53v5wdQ1mmjOYYo4uFBhuHHVh7XgfcprutJlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2g+/10huIqAsccUGGXH+HyIvJrJ3eTI0s+jklVM6xkg=;
 b=SsGqaR05gdoM7GpRZ+HsL7SLHwK0wdYPC2yc4AxsDHAhXLep1ASndEr/w9BYHDBg8M/BKppairDwSxLLDqhkDqPjkJjp+mCojuC6qbt8RkEvwk3MXUsP1UzjUMy7hIcMAvq4JgFdlegK322yuym76V3NqVu3CwzGjFozxh1aAuKZaa50Viw27RQohaSu+4YJwVmFo8ysEpXVIcKxr6B0kXMkaOOvbH+SMr3xPs5ONfTG0PB8vLj7BAMujhiatiuZFHi7X6KMRq6Cz30DcG4UIwm3ZU/96l2fTfDTUR1hGJu9hL79n+DSNuG/Qrm0x65Czm5KRlEcju4HrRspH2BxnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9092.eurprd04.prod.outlook.com (2603:10a6:102:22a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Wed, 31 Jul
 2024 15:07:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 15:07:36 +0000
Date: Wed, 31 Jul 2024 11:07:27 -0400
From: Frank Li <Frank.li@nxp.com>
To: robh@kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: soc: fsl: Convert rcpm to yaml format
Message-ID: <ZqpTL1JWJ6RfU+iL@lizhi-Precision-Tower-5810>
References: <20240731150420.2217925-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731150420.2217925-1-Frank.Li@nxp.com>
X-ClientProxiedBy: BYAPR02CA0051.namprd02.prod.outlook.com
 (2603:10b6:a03:54::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9092:EE_
X-MS-Office365-Filtering-Correlation-Id: abf668dd-6467-413f-77aa-08dcb1728307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?HJkZ5AorUsBqXvZfxxCUxcaUfHhKAsbzdiHoYUcsi0AhAubDDzL6v2Am+Ccr?=
 =?us-ascii?Q?73PEAGUXtwKtiPV/NORDubxCRHNTPmq50eSTptuqBNiPlMXq2fsdrGeb0Gsq?=
 =?us-ascii?Q?dEN9r6vJ8N7Rv1gaO39hApIQV8Fu9oEDnPrJ/R+TuI/DiBQvcrr/KlQzAdKC?=
 =?us-ascii?Q?sCYyUwuAozchTozcgjSy5WbVI58icoQV42MPNTvpsc/+0bxtDISsC8M2jV/S?=
 =?us-ascii?Q?UhOERXuwm7sf1PKeCm8fLgK04obKYc2yG6tOiY8zgxdLAI3dfNltdqvFw6aY?=
 =?us-ascii?Q?vdhlGG69gVcGa/OK3oTQit7GsfQqHt8UClFyGFUCDsMn0vn4/fMpnV0SALsx?=
 =?us-ascii?Q?QJBRsGyreWaVcSJUude8dC1+TApG4XlhQtf9fBPh7oMqJKwsMJoJ9c1s/nxI?=
 =?us-ascii?Q?YcJwyYL1RYQMmV6O3aWgUHIydiApDDEri2kNHgeOZloTKQY2HxfnJ4W5baWl?=
 =?us-ascii?Q?y9o9j2RSVEIXzeotxD1N/dy1A/AgvGrHWFBK6Jxa2oYIRPARvBBQQBvyF/4k?=
 =?us-ascii?Q?zOgt23u6r/h0gbYFiqM4QJqsPpNQpBjGQODPXV1GtONCEpunLS86q3jSWyRQ?=
 =?us-ascii?Q?sMerJTO+whihxvXUYufsLAwz/fIl7AcXS1CxSMNKZl2mG84+DGR1peqyvCx9?=
 =?us-ascii?Q?AT/4YaFPtX50dvX2XWUoxQX37tsxYguqKlMANOmEMmFWAyMpvW3Az5kcmJxi?=
 =?us-ascii?Q?t1Ku18+jUTgVkZFNtopmx0Wnw2bH9sR8mq/qtRamLTlCDdyqX+9208QMsLp2?=
 =?us-ascii?Q?YtwDy+6h44RyqUYmsG1lkH+uXzs6iIpgeQomS9DrG7JW36K8gVLiMeDgiYd6?=
 =?us-ascii?Q?lpJiK7vU37YKKme6n1CpsDRpNCavKW2rDlEtofS0TOjJiBrf8G7VaL1BHKjx?=
 =?us-ascii?Q?6cXOqv6uHZtdLIRfKLpmw+cbkGmH3RcCSqfBFhfepx9Adm2N1/jnylOrenCw?=
 =?us-ascii?Q?daDMGvDNuVvrSux9zZUf65d2GpSbXCndjxfdAfgROSSWj2oW/v2lQmM1U2zV?=
 =?us-ascii?Q?6FJNf9eDDVY+WiaLBKV+rgNYxgkl8ODGm8PTtZg4qkp3sMlPcgFMGrMcH5oC?=
 =?us-ascii?Q?zk2FBVB7Xhg9iFf9QI84J8yY2t9yQcwqmKAcLD5QMCM6U2tUWhDsbWLVgcVV?=
 =?us-ascii?Q?PugKj4aMLEqUN0bTQpAAKYhJNpWZo6g5y2zyqDxLdKhKaaJ7VipHgRFcI+cS?=
 =?us-ascii?Q?8JfTL5aNBW9Z03oDF5JhLkY+Mfp9UdTrBtkG3AG8NMmG/whCsyb3PFCZyGsu?=
 =?us-ascii?Q?J9YRFrzpLnH+TjK/vfZUePU1og25iVoHJxtqoaeZJUuurxK+Sb7yiAgGH7Cg?=
 =?us-ascii?Q?dhMZonxaO3ybbCWrgC9UB02g3mo9qUya7/kE6DfPucGS6zdTzWQYrMATZM8y?=
 =?us-ascii?Q?C5VycvE=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?rLnjFgvEN8UQs0DaQfKnhYcvf13Dy5Xv+VS7LhmtLOOCAN4E7Hesq6wB+SHd?=
 =?us-ascii?Q?p0eAcH1IwPn9ibkWIJdJYz3tPtFYdq/DOstx6i4t6NO3hNIiLqmz8eVc4/Oi?=
 =?us-ascii?Q?Y50VfaVGFYwqMF8t2c/5wJaU38pTn2Ts2+imlWxCDkXbuEVUdhrjJKis3Oly?=
 =?us-ascii?Q?gxCQvPeSxKPMzzypJ0leh4UNUNIWXzcZ2OUtLo9DqbP2vuVuuCwENPlDsefd?=
 =?us-ascii?Q?1kmye9IxlFU/1BQoZvZnZDX7O0XP8oj0TXFfTmpgPlhP4SL+jQke/DJnxmHA?=
 =?us-ascii?Q?3bJ9k5KmNPTPIn7wfw/rvAU8j50Us9Eul3YKi/ThlJY1YCMbEJ49ug/7wCfW?=
 =?us-ascii?Q?OTWN+dD43gyyX9nYuLJMmuzTmhigIqh6Xp88yoON2lWYBElZrBd131NBiVwc?=
 =?us-ascii?Q?g0cPEb5PXU18et2WeKirkHIjmdXlXuxo6nU4OdBrYBrt7HBqOJMc9okffQor?=
 =?us-ascii?Q?BqFPm8/nJwbbeK6aVuIK8G1PRNC/gkJOSXCHdlk4bFyLkS32OiDCA9OFtq96?=
 =?us-ascii?Q?ec0ffSuyBFzvyGHMSQOleJ+8MS7NmAYDPtlf7N5ZREkS9GzC0IKyhh/AJ/2L?=
 =?us-ascii?Q?UVFEN8vhGEmyYRucVYEGdnEoNObutoe2wPZSU3qo6xAX2Gp1podnTt09Tcw3?=
 =?us-ascii?Q?MIqhOqEAe7ys3WDVTiGry5pqX6zogRwSnEAH5YSdZrtpljvl2BY3PEzwcXmC?=
 =?us-ascii?Q?8r0N1rdAKcEj4J1RFfrlw2sbdN/Oemsxm25PiYuyKvrr0jm+bzHJmZBBj8n4?=
 =?us-ascii?Q?BEyVHaIqj/bXClyRdPRQszTsMUXF2wcrcaiva+N/+E2r2x+C7i83Q6xB4aCm?=
 =?us-ascii?Q?bhWNHmwlM2C8OMZZSwApT9OObdHVzZxEJWGK7m+VRwhopMhJutD8ktQr2OG8?=
 =?us-ascii?Q?KeqyzGV9l3QjRPdZn6Ks6HXi6M/UuIdYZWpc7mi14qn9/1A+3R1hP5/kLoMp?=
 =?us-ascii?Q?BBwF6Z1U1Sj9jMx8R/g9BZEfC5gd7PkSmt6zw04pnmZfFmny6emkrr2tIEKY?=
 =?us-ascii?Q?fyaj2T9J07WVbHIjErGkJwoXhW4m1hYABdHVL4UizkqHwcxa4MEboJGDu4bM?=
 =?us-ascii?Q?qT5zB34yjUCue2frvex/n2WMFTPlOO2yNZ9VQuF+tzb1ATHWmpXUVRQbhKpM?=
 =?us-ascii?Q?7WtZ6y2BJAwX/HI2WOZIilHJ3CnD0NG47rcVe1DJUYVe19OmmwkbiGJqFMGh?=
 =?us-ascii?Q?ZKQ0UxTJuML4W2UClDkjzIusgxUfOGb+dIbi0pSHdPEVZDgVSd397HKmbJI0?=
 =?us-ascii?Q?piCnr79KimME0rJ1+ZWIjqWyH5JScaG8xUB3BVS3dpM3OwFv8JHuIUe74cMc?=
 =?us-ascii?Q?YGBPRTozWGYlr0jURD8rfhDFyEwSo3O7b/oO1mvgonFDjPWx39Jg2JmUt8TH?=
 =?us-ascii?Q?/Emkh1KJIJxHAlkL5H+r77JbTFRqSIkOIPQiBZlNtwgdmhuDCnUmlRfuvyK1?=
 =?us-ascii?Q?X+NqTv+YHRqZAj4qV1Imi+PKAuGwg8GcCN6kKJlPW+45vhIqAkUl8osAozpg?=
 =?us-ascii?Q?qnxizpi3bWIPJT8Wl6246AjqvA8QEmOLrS/nk/maqFeovWXZWbGplxzl0S9I?=
 =?us-ascii?Q?I/jHxAJWa7Iu1r5AuqQpP9X1/M6GtnFYu8ma7vxd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abf668dd-6467-413f-77aa-08dcb1728307
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 15:07:36.3225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53762fLrTB6V+fS2MXqYfgNZSbhFJEBMW/tNNaE5MlsfiXFgbnUnvTpbK4WD+SPFkGW358n5u1hAmwA4tzmBBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9092
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, imx@lists.linux.dev, conor+dt@kernel.org, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, krzk+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 31, 2024 at 11:04:20AM -0400, Frank Li wrote:
> Convert dt-binding rcpm from txt to yaml format.
> Add fsl,ls1028a-rcpm compatible string.
> 
> Additional changes:
> - Add missed compatible string fsl,<chip>-rcpm.
> - Remove map fsl,<chip>-rcpm to fsl,qoriq-rcpm-<version>.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v1 to v2
> - add missed compatible string
> - Remove compatible string map table
> - use oneof Item to align compatible string map table
> - Fix typo 1045a
> ---
>  .../bindings/rtc/fsl,ls-ftm-alarm.yaml        |   2 +-
>  .../devicetree/bindings/soc/fsl/fsl,rcpm.yaml | 101 ++++++++++++++++++
>  .../devicetree/bindings/soc/fsl/rcpm.txt      |  69 ------------
>  3 files changed, 102 insertions(+), 70 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
>  delete mode 100644 Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml b/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
> index 388102ae30cd8..3ec111f2fdc40 100644
> --- a/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
> +++ b/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
> @@ -42,7 +42,7 @@ properties:
>          minItems: 1
>      description:
>        phandle to rcpm node, Please refer
> -      Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> +      Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
>  
>    big-endian:
>      $ref: /schemas/types.yaml#/definitions/flag
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> new file mode 100644
> index 0000000000000..762316ef4d150
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Run Control and Power Management
> +
> +description:
> +  The RCPM performs all device-level tasks associated with device run control
> +  and power management.
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,ls1012a-rcpm
> +              - fsl,ls1021a-rcpm
> +              - fsl,ls1028a-rcpm
> +              - fsl,ls1043a-rcpm
> +              - fsl,ls1045a-rcpm

Sorry, I missed commit last change. I will fix 1045a at next version.

Frank

> +          - enum:
> +              - fsl,qoriq-rcpm-2.1+
> +        minItems: 1
> +      - items:
> +          - enum:
> +              - fsl,p2041-rcpm
> +              - fsl,p3041-rcpm
> +              - fsl,p4080-rcpm
> +              - fsl,p5020-rcpm
> +              - fsl,p5040-rcpm
> +          - enum:
> +              - fsl,qoriq-rcpm-1.0
> +        minItems: 1
> +      - items:
> +          - enum:
> +              - fsl,b4420-rcpm
> +              - fsl,b4860-rcpm
> +              - fsl,t4240-rcpm
> +          - enum:
> +              - fsl,qoriq-rcpm-2.0
> +        minItems: 1
> +      - items:
> +          - enum:
> +              - fsl,t1040-rcpm
> +          - enum:
> +              - fsl,qoriq-rcpm-2.1
> +        minItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#fsl,rcpm-wakeup-cells":
> +    description: |
> +      The number of IPPDEXPCR register cells in the
> +      fsl,rcpm-wakeup property.
> +
> +      Freescale RCPM Wakeup Source Device Tree Bindings
> +
> +      Required fsl,rcpm-wakeup property should be added to a device node if
> +      the device can be used as a wakeup source.
> +
> +      fsl,rcpm-wakeup: Consists of a phandle to the rcpm node and the IPPDEXPCR
> +      register cells. The number of IPPDEXPCR register cells is defined in
> +      "#fsl,rcpm-wakeup-cells" in the rcpm node. The first register cell is
> +      the bit mask that should be set in IPPDEXPCR0, and the second register
> +      cell is for IPPDEXPCR1, and so on.
> +
> +      Note: IPPDEXPCR(IP Powerdown Exception Control Register) provides a
> +      mechanism for keeping certain blocks awake during STANDBY and MEM, in
> +      order to use them as wake-up sources.
> +
> +  little-endian:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      RCPM register block is Little Endian. Without it RCPM
> +      will be Big Endian (default case).
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    rcpm: global-utilities@e2000 {
> +          compatible = "fsl,t4240-rcpm", "fsl,qoriq-rcpm-2.0";
> +          reg = <0xe2000 0x1000>;
> +          #fsl,rcpm-wakeup-cells = <2>;
> +    };
> +
> +    serial@2950000 {
> +         compatible = "fsl,ls1021a-lpuart";
> +         reg = <0x2950000 0x1000>;
> +         interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +         clocks = <&sysclk>;
> +         clock-names = "ipg";
> +         fsl,rcpm-wakeup = <&rcpm 0x0 0x40000000>;
> +    };
> diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> deleted file mode 100644
> index 5a33619d881d0..0000000000000
> --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -* Run Control and Power Management
> --------------------------------------------
> -The RCPM performs all device-level tasks associated with device run control
> -and power management.
> -
> -Required properites:
> -  - reg : Offset and length of the register set of the RCPM block.
> -  - #fsl,rcpm-wakeup-cells : The number of IPPDEXPCR register cells in the
> -	fsl,rcpm-wakeup property.
> -  - compatible : Must contain a chip-specific RCPM block compatible string
> -	and (if applicable) may contain a chassis-version RCPM compatible
> -	string. Chip-specific strings are of the form "fsl,<chip>-rcpm",
> -	such as:
> -	* "fsl,p2041-rcpm"
> -	* "fsl,p5020-rcpm"
> -	* "fsl,t4240-rcpm"
> -
> -	Chassis-version strings are of the form "fsl,qoriq-rcpm-<version>",
> -	such as:
> -	* "fsl,qoriq-rcpm-1.0": for chassis 1.0 rcpm
> -	* "fsl,qoriq-rcpm-2.0": for chassis 2.0 rcpm
> -	* "fsl,qoriq-rcpm-2.1": for chassis 2.1 rcpm
> -	* "fsl,qoriq-rcpm-2.1+": for chassis 2.1+ rcpm
> -
> -All references to "1.0" and "2.0" refer to the QorIQ chassis version to
> -which the chip complies.
> -Chassis Version		Example Chips
> ----------------		-------------------------------
> -1.0				p4080, p5020, p5040, p2041, p3041
> -2.0				t4240, b4860, b4420
> -2.1				t1040,
> -2.1+				ls1021a, ls1012a, ls1043a, ls1046a
> -
> -Optional properties:
> - - little-endian : RCPM register block is Little Endian. Without it RCPM
> -   will be Big Endian (default case).
> -
> -Example:
> -The RCPM node for T4240:
> -	rcpm: global-utilities@e2000 {
> -		compatible = "fsl,t4240-rcpm", "fsl,qoriq-rcpm-2.0";
> -		reg = <0xe2000 0x1000>;
> -		#fsl,rcpm-wakeup-cells = <2>;
> -	};
> -
> -* Freescale RCPM Wakeup Source Device Tree Bindings
> --------------------------------------------
> -Required fsl,rcpm-wakeup property should be added to a device node if the device
> -can be used as a wakeup source.
> -
> -  - fsl,rcpm-wakeup: Consists of a phandle to the rcpm node and the IPPDEXPCR
> -	register cells. The number of IPPDEXPCR register cells is defined in
> -	"#fsl,rcpm-wakeup-cells" in the rcpm node. The first register cell is
> -	the bit mask that should be set in IPPDEXPCR0, and the second register
> -	cell is for IPPDEXPCR1, and so on.
> -
> -	Note: IPPDEXPCR(IP Powerdown Exception Control Register) provides a
> -	mechanism for keeping certain blocks awake during STANDBY and MEM, in
> -	order to use them as wake-up sources.
> -
> -Example:
> -	lpuart0: serial@2950000 {
> -		compatible = "fsl,ls1021a-lpuart";
> -		reg = <0x0 0x2950000 0x0 0x1000>;
> -		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&sysclk>;
> -		clock-names = "ipg";
> -		fsl,rcpm-wakeup = <&rcpm 0x0 0x40000000>;
> -	};
> -- 
> 2.34.1
> 
