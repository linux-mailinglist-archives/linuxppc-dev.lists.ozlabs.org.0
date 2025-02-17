Return-Path: <linuxppc-dev+bounces-6232-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2916AA379A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 03:19:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yx5tf6Mz3z2xYg;
	Mon, 17 Feb 2025 13:18:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::4" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739758730;
	cv=pass; b=Myud4fE3A0CmH00PoFa4U6S/eo+YQvJrkY38oOQkFwEked6Mm629Z/l/qWQI4VT9v9+7txmJM+qim0mdieHYO6D8o4NIjbv3MRQ071NO7uWC2cAhMscHKWFRmIBtEHqk4LEdhbXDnTrd9mdhrR93vde1d+4G6y/pUz0ln0l4jdziItzoXDBW10QqoLH9gaaqY1kCc9XNKncNe7oWIIi5fqPG/XNCt6ZtWcpIf4Duyt5aIHGW/OFpVPAZRFvk9kNkzJd4QP8fuj53Rmwx9X5MGIDapK4aNGnLdSUewRsOEyYUlGOOzQAhfXq4ba5jPgJkA22wbKExRFOhKpMD1J9I6g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739758730; c=relaxed/relaxed;
	bh=QAY6//4xjugbZ1VPEba24hvh8NKGry+OVTr4byDVhaw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QyUzO0nb6uSO985uImpHJlqF7Uyxbn1u3ku6SOYikuoNMSlH9TaRZrnvl0yh+axA2DeJ3kwhB0mQ9muwaQJyMNU0xiWF0uGrq2HjdTU/oytxPSrPNv2qdR2C3TrqyTDDO/kayzYRIN0QLTFFfio4yPN5NgtfPTReB5b/lzG81jh2D/8nQWHR9gYAm5J0YVvgXiUXze+z0CQglAtBL6Xn1DlQq91EVHdIjKHgsRgidgqoMxPbfqdPVCbm4LtZbttKoD5XOwfjAVnhkDdpjQtC6DORLiJAz4TnpsDz8kzExytBo5dnuIwozep/+SqCq2b0kFI35jmEB1kqzfu0RgdX7Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=CRXsuQrU; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=CRXsuQrU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170130004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yx5tf2Tq4z2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 13:18:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZD7MEznQprrqEvHf1q4mx63Rutd0gnwjPhtnymEB3E7KJ83glw3Oz7dGolbTdWXnjjaxHL+ZIpH/iks3SU5vH/UwCqQ+2ov5+InDuXVdJJr83Ic8R0ECRdnNbN7dDf44SiXRDkZgBdw3i8NvHqK6mvgwNCZQ4/wtRw2iwjCNGYbaSWENpmbL86pWY6bK8zcxXrZCyYF3x/HdaqbqtKh18mPQBE0LSwlHdAH3obBPxi2EMFiufaH/4Zg1UWqNtEzHo00zocXBuHdueqgFA2Z+LxzCUYM3jGlLc2fHmntoCgOlrsDi3AYjJJccJBanqJ9w9DdGADI1bmSsw14FxSTKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAY6//4xjugbZ1VPEba24hvh8NKGry+OVTr4byDVhaw=;
 b=xQCnql+XpBVAhgTZAgTMalKQCGKhtx/U7FP6HZ6Dn7giK5FlW8KwIOVtoh3/+/5oGE+PNOoqyZFjyMkl6a9FGx8Smk0N773IUnCqQ1bG2JXWvk1/YETCiKgEkB++YUIrknl+bHXyYHPdpizsvkRrSn0ZofGCT9aTFl/kPo2VGbfSFimYE7v7nKLFisPZK1I+QUwHcmOGQHZ1YTHggeMiWr1U2sUA98COT4/HJ3fZhdXhrzA8g6vUZczzpRt/LUROpk5ljhvS5WwLzapP+ecRrjOCWfGKl7h3fYDNIPXWOnrKt5Jc2HsX4nHNVWZh0trEC3XaxSi8Rx02puQdB6IAnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAY6//4xjugbZ1VPEba24hvh8NKGry+OVTr4byDVhaw=;
 b=CRXsuQrUmF1OkjUl4xubpafVs93cBkrwbWW9Uo6z/a2TSRhxjNdBHpOuBVms0ftdWYVtGnJdoQ1voWUB5TAlGPvsAbgz6T0x6FaEeVsJp+h/SXLqI6ygyrLJui0WVLIwgs5aFal6vgha+SJt5qgjnCsnxJjMt+UmmuWa62pDLEejOP8KTAOunHRdD0P32s0cV41MDPk3ZeV/PLhY+U6N4i+7Lc2P8wEwl6cTLr17Zqr4Y6jKFuceSSPirO/aCq8Y71yQK0pTM9z8yiQnvvt+gkZnydaF06JtGtt9d5HuBIzUuGYHhPqhPGp/jANdkBxtb6RYLsSBG3ffWpxSxBj3EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DBBPR04MB7865.eurprd04.prod.outlook.com (2603:10a6:10:1e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 02:18:31 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 02:18:31 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] ASoC: dt-bindings: imx-card: Add playback-only and capture-only property
Date: Mon, 17 Feb 2025 10:17:14 +0800
Message-Id: <20250217021715.284951-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250217021715.284951-1-shengjiu.wang@nxp.com>
References: <20250217021715.284951-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0103.apcprd02.prod.outlook.com
 (2603:1096:4:92::19) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DBBPR04MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: 6df9d21c-a2c1-4b9a-4942-08dd4ef95f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wL9Wg2ysoLU26m5L2F3r1vbsqAiVo9s8dnY63vGYGZQJBZFYUYgb0cZQoA2G?=
 =?us-ascii?Q?/+bHoFq8xqnJuGQndpLEQ3YmjgB5wJmcmaAE+vAwOmL3LROiHlKFDncKbM9b?=
 =?us-ascii?Q?Ifz0jTjhe7JNU0QTSmkijzLNUTv7y8Npfl9tV+ZJtdbgYofPYt6/zD4zvluf?=
 =?us-ascii?Q?yKuXEnNNhBFwdFVNNccBKQv1hpRABecKIc1O7gv006+NxnUhe8yHxCU+ulkV?=
 =?us-ascii?Q?wWqy3Cp4zYd/uHn/7FvHYFT/jliSUEB5qFWxwY7VVkLg/yqKua5+V/EusdBt?=
 =?us-ascii?Q?zsrL8feAbpX0+5FdizIEAJsWQpr6E6uvey6r77swL/KeP0gNZDG1/8WOuxej?=
 =?us-ascii?Q?oPoM5RZdhYN6ZA+ZoFU02B5RSQnBMn1fBPgFFBz4ZeQUZlaOEInmdK9ZonIZ?=
 =?us-ascii?Q?hRe8T7rUUsqPzNjW/bAKMWO24sIQ1HXGMwv4k6XlUyzL+sqxKxQGtuQwD60X?=
 =?us-ascii?Q?DBN0QvviyeTxlRKuPqHtqrILFUi1wh5Mb35ebIDmIy9nB8qoR8t3//oTON5f?=
 =?us-ascii?Q?YKCYi7PxsSWQs7bwrzoY4kVLvyG+kNftaQQ0ifSMfWVQNeJFrhWuJ4GkKn7/?=
 =?us-ascii?Q?RFAqu83/gH64BMr8W7dotazi8Rh6s3NqRRibOisvD8MTi+twXGxlqPKGSnFm?=
 =?us-ascii?Q?k70JDXpipfFCUIoV16ZnJCjN9SSDBK5ZfUkLpsvxwCKO9iVPA/h1tSodxm0N?=
 =?us-ascii?Q?qlwBuGs9GS3bASsvS8WTqJfw/l1gZarfD4IEvqUxfc3Rw5hRuFMuP2Kkgs/M?=
 =?us-ascii?Q?jdbmxHK1Dczo93U87zQ1I7ax+eLmGupHMfezbGdme7idi36bF4L/vjOU//k4?=
 =?us-ascii?Q?/PDFS59mEWo0Hh8izqtjLpn/SRCdW9XWr7MPKBJKTW6Bnp2S25TNvWAPvDi7?=
 =?us-ascii?Q?q0/GQZL/pEKhMlJggdNBo3hLljnwvkV8i5O4cAwdJe3/5VnZ+GEb8hdGyRxD?=
 =?us-ascii?Q?tpa5kdE0ncrygWb5U06qyt80aPi1UXaFqvufeUdW19FbNTMW6Tss8a+3rnoK?=
 =?us-ascii?Q?GEb5Do4zQ4CuYWZmZEKrgvpkp1ppFCmr9fJPUYZl+jwB/5mGNMpf2KGbAPqg?=
 =?us-ascii?Q?/MbUppT5KFTWWAgyiB05w3k2GqNdaFSlmxfsf1yoTeIxCEctiaXOKdZvzSYb?=
 =?us-ascii?Q?p3D8cgqhzOQJVP5dBR4U72ZQEstJtejLckzWBp7w9mnAIEKCb1drma2eLbV5?=
 =?us-ascii?Q?8LElP6iL/KGwfrtFeGrhhWWlSlk3zN/4HmKPpy7H66TiVgxrecrqWTSXHxuk?=
 =?us-ascii?Q?yI7sNgqRrY6o7JRXYlEhfrToyJQ5lWyVFjdIkHZo408S/MzXmpfuaqj1R04Q?=
 =?us-ascii?Q?bXeQTG1VL0ISPtmmFOrJdDu2H5bwCg2G9bsg+FlpQbdLFgm54gwte0Fvk4wH?=
 =?us-ascii?Q?B8o0W2qq1k8mcxOqTPU5nCOBbQ5TU/Gav3OsFBsbNuNNHK5z8MWb70FMBgo6?=
 =?us-ascii?Q?Tn53GNI6g7YNxpMot7u4gokqwzO+l0OU2JOmr8JR7Pyk9uBolkxoJw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?op8XFR2oR0LWxw88Gk4wrcVaDDnly8EdmrPKDLY/lW0gvJ1sh6VAV/qYHRGp?=
 =?us-ascii?Q?3jq90WmTT8vNcE5ar+JQw0PTaB3rAgghwcIOTYMc5NvmOeF/hXsA9sYwAdlv?=
 =?us-ascii?Q?/G8b1S6Fw5u1ajnUMZQUOCeTgJXpNUPBz/33Jf9ev1UX7YJhrkXCB/9OzuX4?=
 =?us-ascii?Q?jBGID7WQzq3wHsz+2XFW1dkttdO/EIdacyYCWGZ+S7/LUAKVjPYkZx/zd8/D?=
 =?us-ascii?Q?eBuSC2WxxBgcJWI53SdV/5NNDnPANMuJV8vI8RvMlR2bG+lvm/Gd8dPwIWcz?=
 =?us-ascii?Q?36CjpGRabg/DR4G6iALFazv7dumQimaapAkfzuu9uR+Q34mA/mUwTP5tfBcA?=
 =?us-ascii?Q?KjGZ80wkLStAckyTXzg4lj7wLZMDM14jVqGvqKhvbsgCAMfr/9xe58FbIaWY?=
 =?us-ascii?Q?ESnTvJwQkCTU6MErorZ+dzUl5iVUdYoEiZUJD/3IXKcCY67DwkEtHND9XwzU?=
 =?us-ascii?Q?T9XicVTeKMN/95D/8ywKW3yVQ0/zFfkignSn3mXf9qOQDK7ESHocXsDuso6I?=
 =?us-ascii?Q?flaER+xGv3hJIkW+ZTDlVKFQaWe7ubQjxKIKz3P3+f0irsSn9M1xqi2K8jar?=
 =?us-ascii?Q?kx1WuVcO7AK5LRk5tNUluxYLVVDWFN7BS0J7C4L5+b08TL827b8QSIL97j2c?=
 =?us-ascii?Q?xzXpTxKknOWb8p3883kQ9M73Jra1JiW3kyDLVmS/RClIhN5p7jFCPEAVcI9O?=
 =?us-ascii?Q?F+SVO4TJcrwtrUNalyaRyRnx2O/WLmLMF5LB9ldhLbjb4Ekm9yhz19DXvdd8?=
 =?us-ascii?Q?zcGxdrEcUTd6VmeVfVhnGe0A9bWqrQRms4ANiETLRwdHfNnbJOJh/RF3A1NP?=
 =?us-ascii?Q?2KCWECmE0CwSv1jkRtjWIZfrqa6l5vmsrGcRjHiNvzgIl6qk0psOW6IUA0bu?=
 =?us-ascii?Q?ToAYE1XwittUJcScSNMonUEiLJe+JVUW8P9qh4ck+bI5LPv+fxkXDUD2EmwN?=
 =?us-ascii?Q?ZQKfWFso1FaHriNwXRpba4NriadD5pBUiVcGMnM/e2VybYJdWHuJmynjICmT?=
 =?us-ascii?Q?2oNwn/Lt+rUNC/lMmRL5rCTxhPJoUqksKYvzCHDYsg4WqNJDPqW3/Pzpv2AK?=
 =?us-ascii?Q?fYacbvM99VDoM738aV0hpPq/CYaMTKMvHVXpEGm0LGLR0WUkixHFWnOe3Ns+?=
 =?us-ascii?Q?o1LinvPHp34sehWhR8BAOtzcVKnYjnG6mCu4Ulz0mpuOtVZLjyd+yXKm+bxM?=
 =?us-ascii?Q?huwwpa77TOZ2Pq6nZ10wvAX5fBBqN5Leoct+j98evbQenM6GwGkCJRPMOCkV?=
 =?us-ascii?Q?f+KmbwlMNYynTRMfkYd1ZaAWBnman3/KPGy/AsOn2DMocdTgaQbW5CwjL3yG?=
 =?us-ascii?Q?y6o0gv0bo6X9d5owzIHb8s08WhmLXlTRaNjne4Xjz8TA8+SqPv6isd5s3Hqo?=
 =?us-ascii?Q?9R8weXWRkFh+YdRIFQa2tSbU6hhMcrihap1S/omRmcd4biubqhEG5FJwDAnU?=
 =?us-ascii?Q?Z6xW8gEfrTUEUEmVt8i91hkJ3po407Vq8H/n9PvfxWKuJKckrDC6Mn3Fq/hC?=
 =?us-ascii?Q?q90Psh0mW29DyZl/AMBi02sEsevDAeORCaVSL618SdT49PaSaUICr663F1S2?=
 =?us-ascii?Q?a2Qbdt5nfvGCoNJLa1TxPVd0AEu5RJx2ta43jZ19?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df9d21c-a2c1-4b9a-4942-08dd4ef95f1a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 02:18:31.1306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+evo+PvQZa69aJxliOfbtmkrBTcYFr1Le04pqBO86pu7c0QFzvYm8/VjqfymxbtWnps0XJjeDPMG3lp3EiyaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7865
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Refer to audio graph card, add playback-only and capture-only property
for imx-audio-card.yaml for the case that only playback or capture is
supported.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 .../devicetree/bindings/sound/imx-audio-card.yaml  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index f7ad5ea2491e..3c75c8c78987 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -46,6 +46,14 @@ patternProperties:
         description: see tdm-slot.txt.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      playback-only:
+        description: link is used only for playback
+        $ref: /schemas/types.yaml#/definitions/flag
+
+      capture-only:
+        description: link is used only for capture
+        $ref: /schemas/types.yaml#/definitions/flag
+
       cpu:
         description: Holds subnode which indicates cpu dai.
         type: object
@@ -71,6 +79,12 @@ patternProperties:
       - link-name
       - cpu
 
+    allOf:
+      - not:
+          required:
+            - playback-only
+            - capture-only
+
     additionalProperties: false
 
 required:
-- 
2.34.1


