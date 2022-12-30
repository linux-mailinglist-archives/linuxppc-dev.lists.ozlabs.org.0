Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DECD6659393
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 01:08:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NjlwH5dMCz3cfH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 11:08:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Tmon79ro;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.77; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Tmon79ro;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Njln80n9Hz3bgK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 11:02:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9GIvoH24egmxzD4cbxXSI1eqAXBdpyqWhFIUKmKxlx/wFA70nCM78yasig2uKb3JP9cR+X6vUITyeiIKqE6mqp+mSaHsT3DpBvid5IuEC6ss3CDzegPIh7vNNXJ5Ryj0+uMmnJ134q3uQ9MaNaSqz27MglmQCCTq1gUFWx2MhiRUKNoq1jV77/g255qryKUL3cxMGIKqVAcyPAaHRgdYmDim2IcEBSkbWMvSUyRJ+kgzWrcuWcMLberw8OSYuvAiEGuWK/HXfxThaDk1+6OuXFB30PA/4C7GB25013wVDw+eV51LhC+dP9bRFSuku/E4f0J7FMpAUvGw+60WrOqqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AV4YSLSWUEa6icuS3ElbSt+yZKjwyRoBMk3Gdh1j9EM=;
 b=KgHO1Yk6I//AvLo5h709iE52WzljZxjr/ZpcAfUr6DAYz3U6VvGHGQvMMOq1S6ClA+8fr0gjElf53xtKp2ZRoWaE5auw6+ELDs6iMizkVTNz/LHSEAC9+PFn1MxdBn3GD7iHIs/cxaYPPtLYSK47+3vgW7QAi12Ch4omexb8eA7/sdzlzDVir2LaVxkqhmrGW3RmVJCP6HAJEBaPsrqRtbQDz/pSmV5DY0SPWZSPDIT7/aZPh7uhIr+kKV49t0vSCyb87bruTkCUk5nhMKrIw+nruEtpsdP9E5OYa/5QCPH/3g5Arw079R4eyJL+biGpMJElWneQqS9FSup+TCfwTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV4YSLSWUEa6icuS3ElbSt+yZKjwyRoBMk3Gdh1j9EM=;
 b=Tmon79roM8m/XR23Nz/IyHuYTOayp6dRjPNLYpx0YClMWSTkTLMma+Iba7Vd6MywcD62u93JNA08dwo/4NNsq4yIUGpANfGIgMiMm1OIP07/Wk0Myf7wwcCR3R7GmJSqhL8aOP1Issc67c/O8nZjGkdZVFXMs7gNVDb25V8AXeIAvhHTIJYCzGovmvPld2tJVJLRI9OzyoixA4joX8WvrmbW0PM2GqvredQT4HiC7Yb75VlprzQEaXa6EnPtdYTP9DRkXKtOxDtQ7JMh2aruxQz7g6ty4m/3y5v2tOtzy79NM0aZITlfYI5zBMAr4SvjdR78MERrAwZNFlBZJyLa6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAWPR03MB9788.eurprd03.prod.outlook.com (2603:10a6:102:2ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 00:01:51 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%8]) with mapi id 15.20.5944.016; Fri, 30 Dec 2022
 00:01:51 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v9 01/10] dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
Date: Thu, 29 Dec 2022 19:01:30 -0500
Message-Id: <20221230000139.2846763-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221230000139.2846763-1-sean.anderson@seco.com>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::29) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|PAWPR03MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: 61c90757-ecd3-4007-88f7-08dae9f90dc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	RfcpFfcWsgmJbMS2//kFvPBesLdYM2albxdX+K8WS/F7pup/uWr4xM0SmCqR/10NvPE8eosDHYayr6djH72eRHKXBaMtHAe798/k66++c3VdZhtyJkkLgAMkxFnefdLdp01535ElIMKt3sv+Xm0/qYIiVAY6nB2EhUwWaQR3TFrJP+QmGR8mlGXlk7m5WPMjStKA3pfD7dJkZzV1d78vZe99APTkrfEdA7bwreW+l8WruXubJ7rL5bKvaEzAwH3bMH9twDEzhqIURrW/Lqgm9L+7hoZWPri9497Q6N/lRisiSn8GDAJBJw3784tui+4vVAnCbYkfIUVRlUud27u86bAeHhSucLj+pHlBeAcBKGScetTxCE0lOmm0b2u/fdbW/QwHoBlcCvabn6lU4E9SAuDJLmmPEJf+yzQbZaO4tzOj2f4PkpOmULJrLg9qxJq4Dc7/kO7Jwd8dPZ9+MlrRjCqRzHhxVWC85P+o9Ht0IRnHvNWUI85r62LgGNEjIJgGCVbixRHlEf0KBZ12Vgr8Q3DxqEA2DaBWnM1giXarKj443PL3UdWuE405cVJQhrE6+n7H0rTpaND0YvCin8Mvw4fcpOL9pbrH1RAgp/SiYKD15wtSnCJYVESEr58eMFR8WA7N4CwPrcxoB6Ro7ipR7Kx8nZXkYzVO18DTXzI1PPpaRdWuMxOUFYlvAVFdbMOLTBSgh76gC1sVvbvhkKPHusiSgF675rLTcJ7TPQ7hXYc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(376002)(136003)(39850400004)(451199015)(8936002)(83380400001)(4326008)(8676002)(66556008)(66946007)(7416002)(5660300002)(1076003)(66476007)(44832011)(38100700002)(6506007)(186003)(26005)(6512007)(2616005)(38350700002)(6666004)(316002)(86362001)(2906002)(110136005)(36756003)(54906003)(41300700001)(478600001)(966005)(6486002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?K37vBu/G3j0oaTuaFY1e6dJrlUAoOSGWzw+diawIWw6vGHjgyebyIx1WOXxc?=
 =?us-ascii?Q?YHOlJ+yrpwY4mDWpDuOUvtSvtfAk8Ks5l3Jj866PfGDFZ1Tx4yc+z9OQNp+X?=
 =?us-ascii?Q?PRktEk61fELcJ0+am4ixRdpF9b2R8/mi1dYwZzNSU6k7COMQWXAlab5+ctwb?=
 =?us-ascii?Q?8SWrREjPg6MfYjmP6K5sB618f5zpThOy/nzQYEgp3moN4sCNtOJ9vRDhAuWC?=
 =?us-ascii?Q?qqcp0lV/eXU4WG8N6GJ8D/YGwsq2IsuZXXtthGafk3nypFEVkRYaVCQOtPkv?=
 =?us-ascii?Q?zGypQ+o+HRXVN4win9gbloD12kIMfO1cUZ/ERge2JuMVLcCOzVMQrz5AS5p9?=
 =?us-ascii?Q?GgOv15mOxjzOP1T9ojSbwKIceVNLUfolVCkpRJ7Xjv7amuftaEx4gjCW79Bc?=
 =?us-ascii?Q?1GJNtKSW8BoWUK7RsJWj4lnuF6pNBDtRS2aY8s0Vui1Tlxoi1hOPVxiMuCgM?=
 =?us-ascii?Q?lzb0aJCYuZKf3k+bJw6urk5Hpz5sqk4tTbAhnOT0OtqgGCR7pDthDdpaQab9?=
 =?us-ascii?Q?YLM3sYRKwnjw3tWp1eFjZiBpxoli54W6AbzfaUJoUFr1NtPk1EzAfWJMqD0D?=
 =?us-ascii?Q?n90VBl0mtcHQML8ERuAIMZaW0jK+YhdE6HJxGdELumuCw0wK2O7GQvVVderO?=
 =?us-ascii?Q?Mw8LQG09vzL9w2rtKVZxPnZ9MbF7KB1A4MZw9qQzWImmivC22byFkaaKFK2W?=
 =?us-ascii?Q?mS6dE6yggzbxyR7N/iatgXkYKRKRbkT2y5f4891hgKqAOOnYc5zPLyrTZJnM?=
 =?us-ascii?Q?U8VwnjPx3TRnttXo55L2OXy+eqkgJF+wKk/SWRwXTEURM4kIklf8VSev4Yhg?=
 =?us-ascii?Q?FwMwrTw6marY4jRQ7U6v1Yo/tn42vmtl4yFvN0ngGLdRTdi7h+mn4pVWN2Ce?=
 =?us-ascii?Q?UGQYpFWKe9eSp4w6CLTsV8bYttdAYSyGFuzoaQn4yYAWDGTqleLZw4AsBIvZ?=
 =?us-ascii?Q?pDV1ciWfmoNg3G3gJ0Mnh8eP8837LEXhzyT6yancVKjeFez4CwdJlVw/01uv?=
 =?us-ascii?Q?mz0vWIw1lhw/tTeVAuXPi5Yre1hS0DsP6mzTK9OJAf4i7iB373/8+XqW24A3?=
 =?us-ascii?Q?fl8zWRT5+RWaqA4FH+yC5bBPSU3zcbnqtrJk/9t87n368PacoC+vMy5Xdy2J?=
 =?us-ascii?Q?mi4jSdcZYj+IRbfoJvjUNogjtAhaskUJdtd2qPDXCw0fOh7cZRe/vNaNzMze?=
 =?us-ascii?Q?5jeruVzJjIEfrOSE2uG1DkFSwKoTnhhcqKkWFW8uCgYzSPAlZHhTU63YFs7u?=
 =?us-ascii?Q?DWUKM4D7neuiTJ/trCbeVGQ4GDPeft5Prk/EKozOP6Dlf4iuvhKiGxQeCl09?=
 =?us-ascii?Q?qZliPQYfWCkSyBpRIf2cTamqKxG5ynsTJjDnnIHHMylpOSjIEGj7+k6ThdxK?=
 =?us-ascii?Q?6B6wmDh3mENOuhRspXi//P4BEFRvaJ0nWexiyp1sE6jStCQcjlhagoNCNXvI?=
 =?us-ascii?Q?hwAzHafYyaVvDG2rtjENWOAZDYzhmo0aLH2dDolyvhhiiZ1fMkRwC5Yr8br6?=
 =?us-ascii?Q?NCRGuDoY7gWSFw8D15aFZGIDIqaN+qIKSojIKARjXeIHAMdv6PlU+CkwtFwB?=
 =?us-ascii?Q?glamh6MfDLZmxuN1/gMqDj38uWESdrebZonpLupVJmFD8GiwcA8qRKTya0Zb?=
 =?us-ascii?Q?Mw=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c90757-ecd3-4007-88f7-08dae9f90dc7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 00:01:51.4749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhcadDxGOYRMCyLcRoF1cyS4OrUuQLlQ+Xb8AqpVrG4rtSdaq502NYi3j20NTykchxFqECVr/4H4iwx6DjsdCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9788
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
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

