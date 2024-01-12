Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE3B82BAFF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 06:45:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=eBjFZUm1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TB9V94DGFz3dW8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 16:45:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=eBjFZUm1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1a::62b; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TB9TJ2vRkz3cTb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jan 2024 16:44:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nO4Epl8XTcVi7zMMw9LwCeMxNbuF+aa+HPwX95bDmulSQnshMBnTX6tH7bQtMNq5cG3ep2FiSrw3/9sYD0zqhJV+aVO7p5vLHqnjbZntz8jsY1XJqt8U/dqTyN3zGq+y4Y2NZkGu6b3SW5ZGESvxDuSnM/cpbOx2h7LZCTDjp3TsisSMivvjNNVOnwGtDM8X1z7m8KZ409YqpP7XR5YhP/2ZEsoSBYTX7eRWH5Y0mhfqYT9jrytolBodGJX9+8dt1n0TnEOXHDJwmycnQ6P+jPnETxjXWEv0FmudqFs2E40i2555aW85aQ1K1ixUvTyUyAatdryiRlz9atUE+/2N1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7Npn6ZqWcPdNBtpdTJgCBd+0IKtZVth+kf2+I+MpUo=;
 b=T5n0Q+GlgOtnj1Lgt+/A076SsDoh8nh/799UR9gvbrBU0RKQkKdSU8pgixxk9f5D60JDV1e4slti6EdtFRE23AOhqFipTyYwdFwv+taK/HC37M/5m7B61gWCga3PyR3S+o5mbf+f/y8jgNmpBU0f/Py+7uWhutKrTOh95Ci5eNjldt/cmXTHkpIZuIYvTTrs/wdNDIqIyJEAR0K0YVYLT1kEKbHr54AU+hOwaSAflVH3dZfhn1J58Cu8pCccGwPOUtqEymTCgVU/83bp3pFxRJGjPbrG69W9+GrmWe48NzOADk4i3vzicVZ75nmrpl9PXnRbtvLOz0AJc29ksuo6tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7Npn6ZqWcPdNBtpdTJgCBd+0IKtZVth+kf2+I+MpUo=;
 b=eBjFZUm1HKZPZ2D6JMsUKHm9X8xqtWT5iB2h17qVT4M0iC7Phs0GgLqCZKcwxQIqslNWZsafGHXSbmRa0piRIdh0vDltDpt6XSaUiMa0hipMp8J4kXZukB/n4USwznFR/wVFU2MbHjxqjzQ8LwrMl5ToBSIh1msvHEQxxnO5xwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by VI1PR04MB9833.eurprd04.prod.outlook.com (2603:10a6:800:1da::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Fri, 12 Jan
 2024 05:43:54 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c%3]) with mapi id 15.20.7181.020; Fri, 12 Jan 2024
 05:43:53 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/3] ASoC: Support SAI and MICFIL on i.MX95 platform
Date: Fri, 12 Jan 2024 14:43:28 +0900
Message-ID: <20240112054331.3244104-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|VI1PR04MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: 5835d68d-1124-48e3-5284-08dc13317627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3WI+yLtUIydle0fl0uMgqnzSiZmFj3PmSP6qpe88nac/1YcXupVfkugm8XEcpGyCMyI/z++qOGKabnuoHs8RQVkAT+Bl/D4KtBD2fOpBI4YwcxC363yh1LxeyF21W42AKOTXOO4Vt3bru7Y5DsZqmDBQiSVzNBF7laozFAOiVf48lsFy0UPrZCpDda19/F1ar9FmZt2qjWQ4t+aJEF7898bmW/M/5r7uO8GIU0MFgKEVHLJxykWosFG0H55SzJtkkYhd93SrQnKYK+9PSF8INAQD05VcEmKgPEdBc0FM3npVV6rOFEcx6bgVif4iBwULfVqK6JvBWR/6eFznCpBZCISist+LJQEgYgcscnVqKug0eKBkITbHLd3wQmyw2cEVIa8QFNxyPbTJBlLJn4mFmsNmcqsswEadRG8bbmpykWeMUrrusnVC74rjhjmChzKQ+/VNBCobK/SdZLb5Wz7JUKLxSg5223u31TArO6S2MtOwUJmFGWE0XH+/eXR3t8EqMRGHY7bubAeWjWJz+WYyslDx5z5749/V6fnKbQXDcPX0EJlwtFsaBFCAJvvjzjY+0YPQFRvAUaCoy8rMC2ncXxGZWhNlSp1BOZp127jb2UqG76IvBnQPx1Jr/FT3/5fbUEP02olJnq8sjgXS8A+FWw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(366004)(136003)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(316002)(38100700002)(41300700001)(36756003)(2906002)(86362001)(83380400001)(6486002)(6506007)(66476007)(66946007)(52116002)(66556008)(6666004)(478600001)(7416002)(4744005)(6512007)(5660300002)(4326008)(2616005)(26005)(8936002)(44832011)(1076003)(8676002)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?8G5ZRHzVuV0EzXUy/lpaugJkw9NXmSzOKSavZY5VsZIVcp4YZZ4MLelxGSZx?=
 =?us-ascii?Q?4j4vfX6LQ6sI8baRBPFQCaioCYVDI96yDhrK5tnFAlbTPvx085PK+E9j2By+?=
 =?us-ascii?Q?Ue+3QVgIU72xwkzjBcl3qr6TltuFfa92+esSx/553mb6StdoiNsuMCPezdhC?=
 =?us-ascii?Q?hBWN0/hnlm4oHHJUPxHo/gNn29bjKApZhU+rMui6+tU85PTq2Davp93NOjhj?=
 =?us-ascii?Q?zUzWaF7omDckUbG44G9qJDhZVRbh4gQT/4hQey/Mz5mgAx385AqBB17FoV3o?=
 =?us-ascii?Q?g44AUvTpdmTTsWpZHyAaGBFk+7ndO2Tdzh8+lKdPTyfUqW2r8Khw/fIVUHFS?=
 =?us-ascii?Q?X+zIcLDocA4G+QfqVmwMsIdBSlrkW1XR6FlRvw7dij+WiW5jrwJrtmFZrIFh?=
 =?us-ascii?Q?0GS6ApAJBhyaSv7KoHVxxnIgKpIfNlJAKHPT6OmL0uzCnwTopAX6H62+ptSg?=
 =?us-ascii?Q?do7me87bI6IUir2hX9vL830LH3WO54MKrZlNrONtK0ce8QmuK9CSemy+8Jzr?=
 =?us-ascii?Q?IUOz+HAgvXiOVcJDAH9XadQETbW0PegIPMZb412R7vIkUo1gmVaU03Poel5r?=
 =?us-ascii?Q?iMFSereQQGGBUz4t5RK8eZGBNsFElB5ZoCJnc1SRhYx58vc5Qq82bU6UBrpf?=
 =?us-ascii?Q?hbDXmv98hr9raezWTzTqjLZDoa3Igb54VUn6OpD6RkxCmS+OD/eGNRpPD3uc?=
 =?us-ascii?Q?Yq6VaHO+fNd4cxn8YjBTunprpR+16Lhv2qZpqAxxu+qqacVu0PwQ4MmXzn/+?=
 =?us-ascii?Q?aPA9cICg3LEMz59yj3OyMJpI5Pa4V76Ao61OpNnQCUmMQ5+K4X0NpvQixNHy?=
 =?us-ascii?Q?NvaZNtgjz+eKZKegAK9K0fOlqvM3i8mCsaEigOmxGkCXzULxMlr8vjypUX0o?=
 =?us-ascii?Q?iRRP3mVCfTfV2Yg9M4ImIrwyw4AzvpOuOvhz+pN5QnXsA7HQfCx+8WdWeCCx?=
 =?us-ascii?Q?uLDyvNKOHepuhlx0meqhvELgKelctEon8yRobO8ZxGkx0vP/ekyaTirNGBsC?=
 =?us-ascii?Q?8rO+i4jSCqM+AiWJdWW1eQF2D1GuH/xpEiq/w1FUE4Aw1F/Hol7G4SEIzxsp?=
 =?us-ascii?Q?TEFwiPU1dCjVP1wYPNY1ZEXjh8k4rlrtPYG+oIydzie+fMyyUXmjUum9wV81?=
 =?us-ascii?Q?7DXoBB2POXSQPlhn+TiJWR+tjpvvXpwK7vVF91vwA2OvaHNbWahra39zaTRn?=
 =?us-ascii?Q?KpCTCCTdFgO6YpYttsRlbw/+Zkb07oylOAq2KSsRw0pNjuVk6b1pKJlrXwYI?=
 =?us-ascii?Q?8yOtJ9TysLmNinzMdMCB3A+Ggx5YbEecJ4leHObLjBfpQrYf4viMr+bLaUqL?=
 =?us-ascii?Q?hOaqNaH6Kj5BNR/7ik/SjSgpDqalRRDzd4qhiXkXv17EvAutv1S5yeqLLGil?=
 =?us-ascii?Q?0ViIXP2sffPZKy6tCcaxINKmiNyl1hWtwaiIpA7gM4hRsfDpCEJU/EfJkvMu?=
 =?us-ascii?Q?IuV15NYuxotsvfFPXCsQNm/sT9EGuOX8auH4F5z29hi7tfEK6MO+0Et+euKO?=
 =?us-ascii?Q?7VXp3Aj7MwaUr6u7F6Cx8JfhlBrEDmSaQn7nk9JOzc1NDDkS5OEOYpifpnZE?=
 =?us-ascii?Q?fPUW0Yhbu+c9aLuOj9+EFB6MBj1YuI5tFKfFD92p?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5835d68d-1124-48e3-5284-08dc13317627
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 05:43:53.9234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwcwdjP+JygfZAtEqxVirqGDAdOumrH95Cp9p5zEn+z7KgD3Zw+dQujs76Sf/ZJi7hfMaQktegQ8vkc2e3OO1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9833
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
Cc: Chancel Liu <chancel.liu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Support SAI and MICFIL on i.MX95 platform

changes in v2
- Remove unnecessary "item" in fsl,micfil.yaml
- Don't change alphabetical order in fsl,sai.yaml

Chancel Liu (3):
  ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX95 platform
  ASoC: fsl_sai: Add support for i.MX95 platform
  ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX95
    platform

 .../devicetree/bindings/sound/fsl,micfil.yaml      | 14 ++++++++++----
 .../devicetree/bindings/sound/fsl,sai.yaml         |  1 +
 sound/soc/fsl/fsl_sai.c                            | 13 +++++++++++++
 3 files changed, 24 insertions(+), 4 deletions(-)

--
2.42.0

