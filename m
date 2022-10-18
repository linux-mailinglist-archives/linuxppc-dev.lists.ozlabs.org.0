Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 814F8603684
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 01:12:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsV522FtBz3c69
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 10:12:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=RrTJ/LMi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.8.75; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=RrTJ/LMi;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsV422TkWz2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Oct 2022 10:11:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9p+LRSbGmOQ2q3RVlp+VLPvzsc7/6tgk/mRLQOKndyoxahpYl6TPS1nlmd4IddXpv9rMOqRD9ntOOZpFPnbS+P2zSbb5El53Emh1n6nbb0Sx/3WjzSHaOPBEigM4SbRvZlmuZ2m3PZub3vNTt+CH47NFNNmPW254kVH5Kvz9TX0jz6k3598FWDdfC2Q8V496IY4/0ylsHWzppBj5nj6M1p91L4XUuHnk6i5sEW7C2lsGOw9slLCLofSszKt7btbsOsL+8rhvAMqrFXvhi/wZyhjPpFIb+JxIrRDe2EgHw0uCCtBg9piP8cpsoLR6oHwZzidV27PMuVVU3XFYnooew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AV4YSLSWUEa6icuS3ElbSt+yZKjwyRoBMk3Gdh1j9EM=;
 b=Cqm1buUjXXpoPpHKK2gqMH1fL6YbpyTqvm2DhL7vQlv/sEgEG8RNzp6F+atCO1+XQYa/Q2ey/Ad78ajv/5ZylrriFB7xaiKCHxlXfQfNmrlXyMMAN/GBL0Jx+jpawwBRTTDpI4/3AJymAVZuqLLbTOMs2NTSz5X4Fr8O6yC9uxMoEKXeDbowAsWND9j/mor0tOox0OM6t9PSlPDLq5WFZv57Lgd3yd1b9uIx24+HGqD2yjMkmsFVYQLgaNrffEnm33wLwYH6tgMzIvuvEBr3MHPYBRvBqAaGRniNCQc61rPs+hzo6VVSRE/bm0Tb5gWnl4BXTq0GLksRHNxHubiplw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV4YSLSWUEa6icuS3ElbSt+yZKjwyRoBMk3Gdh1j9EM=;
 b=RrTJ/LMiIIXZ+IWLc9b9tkeENHVoTVIMMVvlwgLyAfLgWxiO3SQ2LeHxAj89WcZlj8iRZxtOXhGBn5tpRWfoFhFmLwdNTo4WSqRDcn05dw6EucxyjLUgEKGrACuxSt1WuwZCbITuqRIpjdgtGVQVTkB5LwtTwi8okV+nNL+o5Zc69O2F52qDV/LfnABvyLUXKJZe7dlcUp7DluYCogYSaYtg6LKY1BAx+DUbJPFYCy2baDGF0znN42LzZvL/VAXP6Ji0CN0C07KiIT+O7DJCdEOfZxq0808XZU25LxeDdzPID3Nyr3DFFk1VOojdP5PWR4LyvI72EKMXx8bT/K1/YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DBAPR03MB6421.eurprd03.prod.outlook.com (2603:10a6:10:198::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 18 Oct
 2022 23:11:25 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5723.034; Tue, 18 Oct 2022
 23:11:25 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 1/8] dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
Date: Tue, 18 Oct 2022 19:11:05 -0400
Message-Id: <20221018231112.2142074-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221018231112.2142074-1-sean.anderson@seco.com>
References: <20221018231112.2142074-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0007.namprd18.prod.outlook.com
 (2603:10b6:208:23c::12) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DBAPR03MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: d34e35a8-d667-401e-5d6b-08dab15e1430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	OjmlDQ6+w4DftxNRuD7V8q8n8b2Hi5TjLxubuC1777WlkXkxjEhwJ8Yosezzv9hXyHgOpeeCIM8PzBBzTlLJobZf/If/eIVT8YBldjoajWUxIfdZ+g+33SjETlylGBjNVMidd5rPcYQp9U1KWo5JRipS8kvE+kZR5CIA9NFfEDsYYZF4QIcvCspMuUZ9dcmzB3WG0kP+5X30vtJuCP2GSzstOpVHo/0kj2G0iseWpKAEbSP5/RUUzc01zDkDZVq0OK6lSt58W3qk7rUAMMNPRd9oKn9mJBjX6AD1VCrVGDM+7Wf2IdRZZszDHJEKT5RAnnfIrNPA7pxz6Y9f4V6rUVVJZ3QljAvSjtF6WKaYUmsQeGWfTCI3sgyldIjeVt7B8OupOclUS/LMVzMkFlYic17hhKmnbjivhQl4zCcIRP/mKyOE2D+MiBsbqP5ohZ5dQc+xvP2MfI2zJDuHEFVBKyL28skieLCoXJP4FxeyvQponR/5N5zTZUWRXpd2BTCO6S8fqrcoNGuJ0S8PGgOa9AF5Sj1O51a3sBFyjoWPUKMV3z3tZZHJKuvMHt00v5wvaZdAz8rTWvq313ptVZ2vZLePqD1w0mrJV+P11E1gA1QaQdadZWxyH8Qr9krqUUKhJYag7pixGhcAGebu41gCE8ejUVP3gdjZoNtEcr633SpAfB5vnfIZW1Et87D5cpubhFOOlyou0EkpjxgqlK4dhsNGdQyKtOZshaiSS4n1YZtZV/It2dSI9ECrSy9tT9fgYV6E3y+9sGV+KS1+JsJCcOVP7gvceROCoHniDCG1Pfc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(396003)(366004)(39840400004)(451199015)(6506007)(6512007)(110136005)(26005)(86362001)(66476007)(8676002)(38350700002)(7416002)(5660300002)(36756003)(44832011)(2906002)(8936002)(4326008)(66556008)(38100700002)(41300700001)(66946007)(83380400001)(316002)(1076003)(52116002)(6486002)(966005)(2616005)(186003)(478600001)(54906003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?TBW7yKmO7O8gOY3rF40dLM8MX9be05RMMX1tG7J0R9RkPo9NrwSyYrcHR1uo?=
 =?us-ascii?Q?AEVhbbBAMjLjLtXnkd4WI4ePghtLK/SOLX1PoLzIJ1TMtfj+uToOnRp+UEde?=
 =?us-ascii?Q?HdHqw6TGfyPVm2XceStisGAwezvMH2Zmntx2eXlIIx4MaksvUbeSDaVhHbUH?=
 =?us-ascii?Q?ipf5a213ePPXi0ApcyutaiAIMBlXIzpwBeRaunc+Jg1mgSEkvi7LjZxPhRcX?=
 =?us-ascii?Q?EPhx/QXI3cgogM2zmGQ8+W9Tqncs+D7wJmSBY4xk8ruF86gYP1UqacrK7YH9?=
 =?us-ascii?Q?pB5PZ/iIK6yMvnqjd2CKGSV0uNA5Pk0IiPae2TroV6mvnAHZQpF0FN5UK2dY?=
 =?us-ascii?Q?AzAc9jLKzvK4Dr2W187tpIWhH7xSeqpQeMCktK4V1W5FWHOKqfpEslcKhDwQ?=
 =?us-ascii?Q?lyPKXg/NpVnwtPN/hg8smR9o19NFgqsKsE9NowyqSsBP+t207+scqZAGp9mj?=
 =?us-ascii?Q?doQ4hw1oMHU3RowT4dU+ntSbm2fxr6syNHx+OiylefTkDG+KZ1bWjMSb7awG?=
 =?us-ascii?Q?CRj+hZ+kOxYPwBHQQRwZg+9J0ItJfZe5BYmYc4Z2cA4VSaqLUrDL8UBJ3oJz?=
 =?us-ascii?Q?m6v90DGo6W7Fzto4h1CZ/CkVRnTGw7ch2fS+CyUAfWAu7HepQwO4XYqkbXW4?=
 =?us-ascii?Q?vRvMr4KAMjc/liqCS2LPq4ShB0uU0SI5favnoUOf0AA93qwX3Fruo+AuIbQ3?=
 =?us-ascii?Q?RR1N6NYShKtZ1ZDtXVBsPxqBCk+pa+PAkgecZoICSDMiTBtTviAhpk8bxPWi?=
 =?us-ascii?Q?r0Al2EMFmdRjIuNwWqi6v6TNpjn7tw2KndwR5v3rgXS/CHvYjD1bnfoJuaGx?=
 =?us-ascii?Q?pB4dlMcG7p16JKJErzaT4jXn1RF5+VCR91nqAUJko/Im629hxsmIpHyPL2Yy?=
 =?us-ascii?Q?DBPaU6bsIiHHnkCHwPOtOJao673bAx8RBpSjbbNCFsiTLH9kNJlKLyS2l6Yh?=
 =?us-ascii?Q?/d24ZB465YtNbV+NSnaOqgTVddE7R+d+ykxUf6T76/P7ccJqcuBGvEn2+imm?=
 =?us-ascii?Q?FUASku3nRrbqxfznN62OpE3I7K20FokvT5KPZgypNR/k+GYqJ1cUnVf2IzzM?=
 =?us-ascii?Q?UFogrTXohSP8pGF2D38CU/WA7RTCiA7dWZKGt7BqN9q4Nbb1gr9uTfG/zr0E?=
 =?us-ascii?Q?p5coQ6vsrfyCQAdYBZG1ZsqJqldWMgG9Buxe4G9FfWEXW14EonxdbN9MOzyP?=
 =?us-ascii?Q?KTYr4/SM60un2z0Cb0MsgA0NaLIgXsKBTxGjMrBYyrkM+UHYXoD1VmC7Pb57?=
 =?us-ascii?Q?hZUv48GK0sDf7zigtP0++G6toJjvSguQNzw1mh4VU+9x3W0s9nRAL0k+gnpy?=
 =?us-ascii?Q?8nGQJNHs6wsyuRWOajT46CkJO034kyDX4ZjG5BJ4ENYYV7JjWhaa79h0LwO3?=
 =?us-ascii?Q?QQP+cwJlM+OvWi/ieIQweUt3hzsg8R+On24/3ZruyA4/IJfEopOSEk9GFEbM?=
 =?us-ascii?Q?Ja0a5PWcnmnA9CRRUgsYQ1J7fDvtbLuR8QI/yXHF1UoHkXZSZ+IulGpMEGS5?=
 =?us-ascii?Q?T8tvnBByWgUIYqm7Wr1BT0wHEXUX+0BPwEE61n6AjXXLJGCeZP15boF4IZxR?=
 =?us-ascii?Q?NRV6cYJVbuXpFS7uKzHPQrn6LtfUBQI2VXQbKzrXpVZG/Hsn4hEOa5JEEI66?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34e35a8-d667-401e-5d6b-08dab15e1430
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 23:11:25.1508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ry7bQ48rEApK4GIxEZpZ7CQIMq/mkvrzUxqlSTx6/dYboexEF5ApOhSZ0zOr0W/sm976moMTDAm5A9JwbC7Yvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6421
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds some modes necessary for Lynx 10G support. 2500BASE-X, also
known as 2.5G SGMII, is 1000BASE-X/SGMII overclocked to 3.125 GHz, with
autonegotiation disabled. 10GBASE-R, also known as XFI, is the protocol
spoken between the PMA and PMD ethernet layers for 10GBASE-T and
10GBASE-S/L/E. It is typically used to communicate directly with SFP+
modules, or with 10GBASE-T phys.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Acked-by: Rob Herring <robh@kernel.org>
---
PR increasing phy-type maximum [1].

If this commit could be applied sooner rather than later, I'd appreciate
it. This should help avoid another respin if someone else adds another
phy type.

[1] https://github.com/devicetree-org/dt-schema/pull/85

(no changes since v6)

Changes in v6:
- Bump PHY_TYPE_2500BASEX to 13, since PHY_TYPE_USXGMII was added in the
  meantime

Changes in v4:
- New

 include/dt-bindings/phy/phy.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 6b901b342348..5b2b674d8d25 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -23,5 +23,7 @@
 #define PHY_TYPE_DPHY		10
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
+#define PHY_TYPE_2500BASEX	13
+#define PHY_TYPE_10GBASER	14
 
 #endif /* _DT_BINDINGS_PHY */
-- 
2.35.1.1320.gc452695387.dirty

