Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A91D85697B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 17:24:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=VblIBaZH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qS6chMEN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbL4l10VKz3dWh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 03:24:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=VblIBaZH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qS6chMEN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f403:2606::700; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2606::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbL3x14PLz3cQr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 03:24:11 +1100 (AEDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RtKFi39By33vVyoV7/O843mJpiAIMNxpVRxJc9HaeLjVp8SzFFwcv8d2Uqf91pYc05BdQvoICUwaIgLkFJrixtlrGmZe3v8ZIKQNPUEjdLlbVgEmJYWBKwskNd9CsmCh2DFgE1YdJo7X6dOltMgrejKU+Qh8PuZccobuOCTLYaIywjYd8LXtl3We/nNVaJ5JdAsTfkTbzB7iLxTD09xc5o4LDo4KTraeIDqrZ2nkYHmk/0HQBGrnCh7bdBn5SiYfQg0KKCSJyJm1yQqeNa0kp8Ufqy5jztwXdp/vAH90pcJDbFTtPysPXsRSKuvvoVi9btjZfrRyS1bLUDGf0/xJBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlx03JhCTno9jUWLQgpIAIW8zynONyGFe9wsiSOTRDw=;
 b=bZlU92R7sXurEjRsLGPpGN+QPtAcMiczee2TLjXxqtdmIX1lfg3gVSiMgBSLTlJFH0cx9KUjN1xMNgnVgvSc+v2YiC/3TEHB+hzQcZIDrOdRtXItvmU+MjQccC2FNYSE9W+PPrqqaxm5H9g/07RZVgoN509ad0MMXo3Mk0uCx5o4emaQyRauSvL7aL4bS0uJ1oypV1ZGsIB5YQrGXF3ET07toMF9u1qOyVnpK/OTieQscHlpouBybeLOlNE47vWWhkGi3Zrml8U3lK/OUVImdMUJfEBZlQUW9vlnXSuVM4eS6l16d/vg6DSlguc1atGo04wdn/8g24dMl1kchLoHUw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.81) smtp.rcpttodomain=buserror.net smtp.mailfrom=seco.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=seco.com;
 dkim=pass (signature was verified) header.d=seco.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlx03JhCTno9jUWLQgpIAIW8zynONyGFe9wsiSOTRDw=;
 b=VblIBaZH1t3ChZFMjrFa/TK9W2A9cQ2gB9Py/rVJBp/skSPP5Qw3VMTMF86Pcmq/DdrD6Ts1NInmMMFRNHPoM9H1pF97l7xqKddf/s6whOVbotiEQ6qfZ4z9Fv+87FZ/HrT1fc22+grI6ycU5bqKSC1v3VB3vxPn5IbPiDHHWzKVZTAPGFzayczm7BTPGgHeZE5mdOvfXIERZBz9GzZfg8cxPRa/+cvHQOOD5FaLB0vKvP3LopZc1DdQJ+nnix3pvfmCdP/3CC/linFssSBAeb4dG1V/WBXbr3duWz5eGWXBiA0HQqR+Gr2dy0jS818RawVOkIqHlAQMh3vFYHpIGQ==
Received: from DUZPR01CA0174.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::23) by AS8PR03MB6760.eurprd03.prod.outlook.com
 (2603:10a6:20b:294::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Thu, 15 Feb
 2024 16:23:51 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::ab) by DUZPR01CA0174.outlook.office365.com
 (2603:10a6:10:4b3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Thu, 15 Feb 2024 16:23:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.81)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.81 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.81; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.81) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Thu, 15 Feb 2024 16:23:50 +0000
Received: from outmta (unknown [192.168.82.135])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id E7B812009538B;
	Thu, 15 Feb 2024 16:23:49 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown [104.47.13.50])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id A66162008006F;
	Thu, 15 Feb 2024 16:23:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zf1ZniC9dqbvfoq/N1XHift8LMZeY6evuJfzokInEUkJ48GO5WwmivHh0uStqkM6swIzYJCs1TM2/BPrr/Yrd1zrrtdYFjqtHiNBKdei7Y+tTCyVhhUo21wOCVFLvEW1QLuKVhXnn0jJoFieyWWAtGbOPlUwDEbRzSTpC6A2iKGtWXf4ItJsO+OeQ6NzJ+mPS3++kS+40YBVKyo9hq0gxiXqkpDlxDInGMSRxXbz8hVBFeOkXnCdCpwmSMb0PqHg0YAVZyS2vK9Hbr75gyCZr2L+MWoNIuH66w5Tcf7iLwjmGMRhdBgxDOfh8kWr4yKoTAXu917Xu5fOEyr0AAgFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DytUrVWR95h3Q4eeZYQUgaBhB4FvzKGExtvrD5P5TU=;
 b=n/4xySXcZy0PdwQFn5dSJMoisf3NiKCq39DyulI11TA3SlHaI8GAkroSsCoSEwqIbUv3zp6dsUJ50bjQj95O826Wwrsv4Zik4kQgDT5FhdaxbowcHfyBZwHlWoIlvqaCS7yhz1JqRse7W66F9FZzDHOCJsrsdbiqz7DCBqSaE0Svi4fvBVUbwj9vjsbAXcqbOocvGTE+7HovmrvozhJjSzkQO399kqQNh/LTCSRV/+LFex+S9dZt2oA5hO5zNU/Nc0pQxRKGifAQGX2FTz/EWsoGzXnMR/ryw/R/yXLFhm9cZfqDTtNy8g3qnlclFX9z0UCRyZge8ub5ptGBQljWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DytUrVWR95h3Q4eeZYQUgaBhB4FvzKGExtvrD5P5TU=;
 b=qS6chMEN9wBXfgxqs51bG1bSqS0SJKsyXgNGnVwxrS9q2DsmchuW1YtBt9YQQM8TyPdQJkTk+2ZlNQ7PvW7qAbB4XgZ75aNoBFUcxmwXxFoF879oZCK/p+66iq8WYQoEPvzy148oILYr4HDEL3V1BO8Op/PtxxgTb+PE6gVe/LG8aPfIZ3T0eL/dyOx11wWrK+wQOxeCmsqT3SAc0NriXBaoUC1PxRDklQBWQ3W4I2R4eRr7djIAvq2Pz0t+DN0LRZjFDhN5/7WLllcFTTBOSKB13BatYEtMtctriMTYJgox6b3464OC28qFcLmtLj8TNvnPUv9hVPgrkv4HqoJMNQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DBBPR03MB7449.eurprd03.prod.outlook.com (2603:10a6:10:20b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Thu, 15 Feb
 2024 16:23:47 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::18b0:3c00:30cb:711c]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::18b0:3c00:30cb:711c%6]) with mapi id 15.20.7292.029; Thu, 15 Feb 2024
 16:23:47 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Subject: [RESEND PATCH net v4 2/2] soc: fsl: qbman: Use raw spinlock for cgr_lock
Date: Thu, 15 Feb 2024 11:23:27 -0500
Message-Id: <20240215162327.3663092-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20240215162327.3663092-1-sean.anderson@seco.com>
References: <20240215162327.3663092-1-sean.anderson@seco.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:a03:338::24) To AS8PR03MB8832.eurprd03.prod.outlook.com
 (2603:10a6:20b:56e::11)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DBBPR03MB7449:EE_|DB5PEPF00014B99:EE_|AS8PR03MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: d331267b-a90a-4761-37fa-08dc2e427e65
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  e/DvRgaRvJE/Pv0ZeXy/3ra+8QP1edtcpHsDzIzkTaCf5updcFw6dXcYhpWxrKyAAy5N/8hxnTwrXctBFDstqo9QUg7qP/v8uVB/fbJVQRhbeWj0S5Zw+nNlDRIs9VvRW6YHvy3O0ILJiTXjZDxk3ImA02aRZ2l3CIJgoKV3saF2EssjxS5yp5raw6xXebw21KabM2B0wMTLKPcOKfYEj4JJEt+Dleu1hDh1aaa/smFRSylOlrnL46RErQ79hcvB+46Iz6d7MNb6ok+IZs+LHu4Op+mpCuhjBVOz/VdnmnAb4jDlIMhcpCB4rSE0UoQ6MYGprFFR/EI2kQdYkPC6WA/kXKSMxgkaX2be/Wufyew1Rm1L3scLOHVbwHksNcrZkxuLcz/41jJ6QGVczSYyeLAAqi42TTpTUzR+2nGRFbc+PopMZ9zwYMP/JtTo4crfKW6JGEnMrHb63AZGK1FGYPrYJtJz/nmehCGxq5GIU7ynNK2RSe1Gxjt5VMVobm2lgafOF2tht/LaoXt5NnkxnqsowsZ3gGg1imQF5y5uOPeSQwCp1Z8pd7z2VRLAoXwmq+uZHdLVnGNKU99vQEBNHxbqsrr4hcUoHdMs+1c0Hqc=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(346002)(39850400004)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2616005)(41300700001)(1076003)(26005)(2906002)(8676002)(4326008)(7416002)(44832011)(66556008)(66946007)(5660300002)(66476007)(110136005)(478600001)(966005)(6486002)(38350700005)(316002)(6506007)(6512007)(6666004)(52116002)(54906003)(8936002)(86362001)(36756003)(83380400001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7449
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	a2237568-6ae9-4845-aed8-08dc2e427c81
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	87/M1JFW78Q8IOackz2bhS/dBZNGZYFaUhSaL8DBo01IoKBcOxYaWEZOyRcEEdOkWvI8Rpv0T40W20sf37l0x2NB5k7dnl8UY7tjMUK8oSXa7EM/q/SmnBtfG7GuLNEFNNh9tVjQWXulZU9wNsgSlS4WAJmn41aWaS2b+K9AHSXDUE43jH7EyLVN5wCoUGHUoN7mI5IbDw+YEtUNTCDbZT8v0k9KkcmTdxExr3kN/FBqIR/cnPAwgEi8npAcJE0ZtF0vQrXaaSen1DwNKQuXSHSrnVF3D8Nk1suKxRHLZLHtbPnHwIQ/d9rdpx90cv4mpVRg4j0El1Cnnmld59/E3d/bFYYMg1L+cNnfgzKeGTbO6UvaZumpaWO1TT04h5kA3pHvM5iZ35l5QMeDg15xMrPfKQabiQHcoDaC3VFHOGaTRJ+0DySz02VOTurqXtUa5d7MSthE5h8O6BCm6u/e+AZb6MllMHjb8HMzdL1nlfxH3MHawZEeGZyQB6YjDfYjmU52Skstk9EXDxIfyi1c2o2FG+m/CWOBUZn/lANT2ju9h3eVDJ00onLN2d0jM9nQBgaiir3qvG3uGPv4bKoastNqsE5H0dXHpM73WY7YFX2m0GsHIBqRUsGnV0fKl8Ac0ZE+P+DDXHzSbUwGVK/gSg==
X-Forefront-Antispam-Report: 	CIP:20.160.56.81;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(39850400004)(230922051799003)(1800799012)(186009)(36860700004)(64100799003)(82310400011)(451199024)(46966006)(40470700004)(82740400003)(7636003)(356005)(7596003)(966005)(44832011)(2906002)(86362001)(5660300002)(8676002)(70206006)(8936002)(4326008)(70586007)(83380400001)(6666004)(336012)(2616005)(6512007)(6506007)(110136005)(54906003)(316002)(6486002)(478600001)(7416002)(41300700001)(36756003)(26005)(1076003);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 16:23:50.2424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d331267b-a90a-4761-37fa-08dc2e427e65
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.81];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6760
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
Cc: Sean Anderson <sean.anderson@seco.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Camelia Groza <camelia.groza@nxp.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cgr_lock may be locked with interrupts already disabled by
smp_call_function_single. As such, we must use a raw spinlock to avoid
problems on PREEMPT_RT kernels. Although this bug has existed for a
while, it was not apparent until commit ef2a8d5478b9 ("net: dpaa: Adjust
queue depth on rate change") which invokes smp_call_function_single via
qman_update_cgr_safe every time a link goes up or down.

Fixes: 96f413f47677 ("soc/fsl/qbman: fix issue in qman_delete_cgr_safe()")
CC: stable@vger.kernel.org
Reported-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Closes: https://lore.kernel.org/all/20230323153935.nofnjucqjqnz34ej@skbuf/
Reported-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Closes: https://lore.kernel.org/linux-arm-kernel/87wmsyvclu.fsf@pengutronix=
.de/
Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Reviewed-by: Camelia Groza <camelia.groza@nxp.com>
Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>

---

Changes in v4:
- Add a note about how raw spinlocks aren't quite right

Changes in v3:
- Change blamed commit to something more appropriate

 drivers/soc/fsl/qbman/qman.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 1bf1f1ea67f0..7e9074519ad2 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -991,7 +991,7 @@ struct qman_portal {
        /* linked-list of CSCN handlers. */
        struct list_head cgr_cbs;
        /* list lock */
-       spinlock_t cgr_lock;
+       raw_spinlock_t cgr_lock;
        struct work_struct congestion_work;
        struct work_struct mr_work;
        char irqname[MAX_IRQNAME];
@@ -1281,7 +1281,7 @@ static int qman_create_portal(struct qman_portal *por=
tal,
                /* if the given mask is NULL, assume all CGRs can be seen *=
/
                qman_cgrs_fill(&portal->cgrs[0]);
        INIT_LIST_HEAD(&portal->cgr_cbs);
-       spin_lock_init(&portal->cgr_lock);
+       raw_spin_lock_init(&portal->cgr_lock);
        INIT_WORK(&portal->congestion_work, qm_congestion_task);
        INIT_WORK(&portal->mr_work, qm_mr_process_task);
        portal->bits =3D 0;
@@ -1456,11 +1456,14 @@ static void qm_congestion_task(struct work_struct *=
work)
        union qm_mc_result *mcr;
        struct qman_cgr *cgr;

-       spin_lock_irq(&p->cgr_lock);
+       /*
+        * FIXME: QM_MCR_TIMEOUT is 10ms, which is too long for a raw spinl=
ock!
+        */
+       raw_spin_lock_irq(&p->cgr_lock);
        qm_mc_start(&p->p);
        qm_mc_commit(&p->p, QM_MCC_VERB_QUERYCONGESTION);
        if (!qm_mc_result_timeout(&p->p, &mcr)) {
-               spin_unlock_irq(&p->cgr_lock);
+               raw_spin_unlock_irq(&p->cgr_lock);
                dev_crit(p->config->dev, "QUERYCONGESTION timeout\n");
                qman_p_irqsource_add(p, QM_PIRQ_CSCI);
                return;
@@ -1476,7 +1479,7 @@ static void qm_congestion_task(struct work_struct *wo=
rk)
        list_for_each_entry(cgr, &p->cgr_cbs, node)
                if (cgr->cb && qman_cgrs_get(&c, cgr->cgrid))
                        cgr->cb(p, cgr, qman_cgrs_get(&rr, cgr->cgrid));
-       spin_unlock_irq(&p->cgr_lock);
+       raw_spin_unlock_irq(&p->cgr_lock);
        qman_p_irqsource_add(p, QM_PIRQ_CSCI);
 }

@@ -2440,7 +2443,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32 flags,
        preempt_enable();

        cgr->chan =3D p->config->channel;
-       spin_lock_irq(&p->cgr_lock);
+       raw_spin_lock_irq(&p->cgr_lock);

        if (opts) {
                struct qm_mcc_initcgr local_opts =3D *opts;
@@ -2477,7 +2480,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32 flags,
            qman_cgrs_get(&p->cgrs[1], cgr->cgrid))
                cgr->cb(p, cgr, 1);
 out:
-       spin_unlock_irq(&p->cgr_lock);
+       raw_spin_unlock_irq(&p->cgr_lock);
        put_affine_portal();
        return ret;
 }
@@ -2512,7 +2515,7 @@ int qman_delete_cgr(struct qman_cgr *cgr)
                return -EINVAL;

        memset(&local_opts, 0, sizeof(struct qm_mcc_initcgr));
-       spin_lock_irqsave(&p->cgr_lock, irqflags);
+       raw_spin_lock_irqsave(&p->cgr_lock, irqflags);
        list_del(&cgr->node);
        /*
         * If there are no other CGR objects for this CGRID in the list,
@@ -2537,7 +2540,7 @@ int qman_delete_cgr(struct qman_cgr *cgr)
                /* add back to the list */
                list_add(&cgr->node, &p->cgr_cbs);
 release_lock:
-       spin_unlock_irqrestore(&p->cgr_lock, irqflags);
+       raw_spin_unlock_irqrestore(&p->cgr_lock, irqflags);
        put_affine_portal();
        return ret;
 }
@@ -2577,9 +2580,9 @@ static int qman_update_cgr(struct qman_cgr *cgr, stru=
ct qm_mcc_initcgr *opts)
        if (!p)
                return -EINVAL;

-       spin_lock_irqsave(&p->cgr_lock, irqflags);
+       raw_spin_lock_irqsave(&p->cgr_lock, irqflags);
        ret =3D qm_modify_cgr(cgr, 0, opts);
-       spin_unlock_irqrestore(&p->cgr_lock, irqflags);
+       raw_spin_unlock_irqrestore(&p->cgr_lock, irqflags);
        put_affine_portal();
        return ret;
 }
--
2.35.1.1320.gc452695387.dirty


[Embedded World 2024, SECO SpA]<https://www.messe-ticket.de/Nuernberg/embed=
dedworld2024/Register/ew24517689>
