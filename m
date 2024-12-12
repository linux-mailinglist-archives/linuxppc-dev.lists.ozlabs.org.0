Return-Path: <linuxppc-dev+bounces-4030-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6318D9EE07C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 08:46:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y84KQ5WBCz30Tw;
	Thu, 12 Dec 2024 18:46:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::603" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733989578;
	cv=pass; b=At31Vi1qGCDCkFnZWDlslZhOu/v4NTFJsMrurHvFyfnb6sJkWfxlO/lTpnLb9IcleNixD9vxHuxcVOfmekVtRq74oX8cRhIIY5z0SYwm03UvR81i0hdO9sCctryQo0fjc20GrjdaBJyHWFt/R7XEB070ww6ZerPgapt65PmnKEZ0zVCK7vpDyh17P6yxfkegGMmW6LphabEbdAoei21YXYDlm8Ve4LKwmOS2ZqtC2kG2dE6zTxZrmEddk233yDQ61/oYTstpUQ9IMEPI70AFa8/t61gcgQcnX0p9X/SfE/qddg/c5doBUiHe4zB2mqavb7Q9+XU5r4Tx64SH+6rMug==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733989578; c=relaxed/relaxed;
	bh=Y8WklpCyPzkisRefnf7uXkQvNqdT5cPLUt75hxgw9Do=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DIdRgAWjWGNtduenGb+jRhKpx7DLvqQQqbSRcKh8WeHvkiZxM/biCjhJ2G0ucBXWB/rqfGMzg+T4ycoG1gcq5MuiDqPeONn/BslYpJPFt/Q4vZZMaUY5VjCS2e/dqoTIPM+Zvl4/06g6QLCFRduFuu9PcQydeiL20jLaUVhvmQfkJeFar5w/ZMg8Wc5f9qUJl8fGOhwcnBc47mtUpON+13v2q6TaQEwdGz2pdgx8cAB4l4o35dZsZfLSscvSCZt2/v3xecDiUaPrK6i8e7kopAj9VSoZxyzYMqvCq4Lns2tFKLb6/fxl4PDmB5tmgm72hoehZPaGRA2sM6MVxKjK5Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ubuaup24; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::603; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ubuaup24;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::603; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20603.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::603])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y84KP6CgYz30VV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 18:46:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MiSudVjCptqLROzRhhYGHxzLIuUOTDn8gndX2UTag5bVPHiFcHaWuzf+UCDOOWuXcqUeP2trJ1IhiGoGeYOZDb2oAOlVTO0BWmvxnFlew4BDpdNawC2h54z9MOIHS5XOpo0Ewv/zleqhM2AJWA7vGpbD3scrRsYAU22ghPeqYzwHXFSS0FftrU6ZuWq5GxuSY5+4AII8HvbwMFg7nq9PGcZhfkwhrJK1pTt3Qy10/Ih20/Tv+6tjcnPYDGFGaag/yWjLNzZa6lKBatznHYlE1wU6gKajVcoTD+vHh3SHzmloek1q6GsqosnhzupHR3tKTAg00hRDLySs7gqbAy4F6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8WklpCyPzkisRefnf7uXkQvNqdT5cPLUt75hxgw9Do=;
 b=FPn3LRueCvqaw8lafXMnY2PBq/p6AFtR6mQ/oEVhLG0p9Lz8/ugt2z48WRV9Xo4D/+ItiwH53pNncCKlJB2m1kzLA9yba1LDQXZhRPhjG/rvlmtgIWonPkxgYU6lO0dncXaJ+wmvEZL3JkeWmX9jcqb0oJLQNCr7Z0Km9Z8rvBgcXxe/mOZPJLjnB/1ZSN7cl7XvFgGaVcXqkIpfHzewnqlee7QhNEG50Aj76iNKDVf77CGcK8d0tZoy8ci7uy0ElQohhh8DPXn0Sv+Q+cCFkyFq057/xSvE4z4L8m5YrRej9QhUXFQvKCr5iu539n0F7+ssHpZqrrenZEOiNOHyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8WklpCyPzkisRefnf7uXkQvNqdT5cPLUt75hxgw9Do=;
 b=Ubuaup24/FKepsWVwLF8UPBnyDgVmjO4V3UEunDAl6aK4SoYD8Goe4/enjM11+lETw0jnPsmj3gb8Bi9kmh8gbp6CV/FLcJlXgu6LLrKlOHWBLZnCBhxljK5yc2zL+/JiiovIzXD8/OqAVl3vidMKI839Ex6jTXAnMDxHhMl4CToOgUOzrausiIXeKGl/ofyG6/cjA9ulQBdmv4oEP6GLR8SFr2x6bLTVoM2c+4hTv1rhRfPgdtHJ70RNVhFRqAgYjnEBWlJhkobAVbIcxMPMR6uMpcpKj0GvUWuJEoWwOViq4hpZR37YFJdAGZ61iZtEdo8unE+T5oIXki7COwBmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by DBAPR04MB7256.eurprd04.prod.outlook.com (2603:10a6:10:1a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 07:46:06 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 07:46:06 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 4/6] ASoC: fsl_asrc_m2m: Add memory to memory function
Date: Thu, 12 Dec 2024 15:45:07 +0800
Message-Id: <20241212074509.3445859-5-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
References: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|DBAPR04MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a03fcdf-423f-4f15-d2c9-08dd1a8108d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RALI9qqlyfhFv3zOw5WaPllj+6RzzbshX2LwicaVB6lmLZVKzFD6wT6TcdMU?=
 =?us-ascii?Q?cr4qiw66YxqFGg0iSpLuUp8e+YdrhNp3DsakGTXKRdBDXsj38GJCEMxX4DB5?=
 =?us-ascii?Q?CQfpdxHldfTD8JxsOFw9nO67ED9rBzSzD+vBSHf5fwmviCE85t0Pst421/Ua?=
 =?us-ascii?Q?RwT/NHChjPwgHD5XTrJajm5uBCL/AOujsmP6iNKxZTBNfPFKGIFIX0zmlaew?=
 =?us-ascii?Q?8XT32ZGh8x9ytYxtXuBEllwPX9AlHOAg/yCYUs98lyHOC2UVHwlLAKpQWxAu?=
 =?us-ascii?Q?BQHyS7aHgH0tYir1i+SPyAdDUmuh0H5WLt6Q7D64jtau+A2viFNNf7/GHwpt?=
 =?us-ascii?Q?te8kNX/1i8I5Cq8GeUTIhuIZ6YePzse+7aszKlGahSzrmVOxqcrf9YAS8/ZT?=
 =?us-ascii?Q?sl6fz4N6uwm/LFHaiJes4nZJ9zDVUg03SC8EY/TP0GBMhbI4NRcvkVdmJGTs?=
 =?us-ascii?Q?0ONX3bkpFiU0d5lGVEp+8F/aYRJcl+CgZG4batTd5SHKjNJ4sMkglVCM5Iwk?=
 =?us-ascii?Q?h+GaI7WxpWL2ZajBmPUhr8vyEyLdSGAW919y8kOvql+weH7kLacfgDHDHkr3?=
 =?us-ascii?Q?mTmVaCvT2WzrlgxF1MD0LDMpd0KkW9boDimXbslpgqXj/hyHPxCDSyXY08li?=
 =?us-ascii?Q?EzyAuzjzezU5qTDpHN6a6neJyw0f8WcNMevPrMG3HJ084Jjh8N2sanfx/Heh?=
 =?us-ascii?Q?odbECpp+VF5femt/WQlIgovQPCvTTl5ES4Of4gysElAhFnoCco/0Xu8K7PvT?=
 =?us-ascii?Q?L6jSDnqf7sZCmVkku5FuVj8MKBqSOixo277O9O4cvwh1sdb7YRaR1WNRT99u?=
 =?us-ascii?Q?pfL60DAPWp9zfRrvPX3LX0/BYZFPjY5wSoIRnDR+VPDiQ/NzUY6WkWhiCcdo?=
 =?us-ascii?Q?9UpdZ4mW1qGN5XL+0UsWdOxQ4hBJIzxMAYnTOYqA7azqfT4WhIJcyuePYXMQ?=
 =?us-ascii?Q?0U+kcdIkvLFfJTNqtaPvOKoErrPqB0QsTCpd5xdurwUiYNRPnmKhV1N4OsWp?=
 =?us-ascii?Q?Bct+2Ekv+c6NK5ca6Fyo/J/r60bKn2z6aYbUG8gW+ITAji506Lz9unTaUAAG?=
 =?us-ascii?Q?id1A9tlTKmp1YFop97cV8G61yOcILGI3z6DMUrt+1yQtr5p2xoYYaAAvHhue?=
 =?us-ascii?Q?m/EM9aYCvs1+uZchYKfagyebDGr3AikgbKoeaji02fbom/N99CeB216o2BVn?=
 =?us-ascii?Q?8wSH7bleRGtMzVkAjhzxk+kZFvakPamwEN6YgRzzgpeU3tMvU0wpMttcvhAv?=
 =?us-ascii?Q?OyaqOKRjCoi2Y1PK7gfhKe/f7giaB/yliPrghKjZz7Y0PAFw97iMbY5NY0TS?=
 =?us-ascii?Q?dV4ZIAvCN+EMYxRHgbFxGk3hLreSlYeg6aM5ZwWv+raXZlDnDWOrE/p56OT3?=
 =?us-ascii?Q?l6mykS9vlrSgiNZvOxds6TOnuHZ4Z3YRJgekeG62kT6UEgJ1HfkrWGotRhcF?=
 =?us-ascii?Q?lKR16yV69w8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d53s79c0J5aDQJDA1w1el+uRotAy5Yxg6M2GTnhToFQWHADV0iyLfsW7o4T0?=
 =?us-ascii?Q?UWruA3HzKW9q2wWSdF9KLlNZbYoZCsnOe6m20JK0EO86rKKENZX7rL2Nd9aQ?=
 =?us-ascii?Q?frzxsOr+rLSzCUANsllLJ9lWndxbwOwlRGFf8TeugRlGQxWALh6G3Z70/yYH?=
 =?us-ascii?Q?FUm2u8hLeBvvKc9y3ut+DnIeuQRTqUxaskvov5+DlQvcJQ4fmaygHy82OAKz?=
 =?us-ascii?Q?r2Uhqb2lrNdqQnPhLQg8K81AL9IJ52oaYfpcqtPnbHlLgKBxx4n1WNGjX3q7?=
 =?us-ascii?Q?C225l8N6a5+6HgUnmPC3wvb8vJe7lLLLkTN4r8mBNXBuaCic4hIhOMT3OmuJ?=
 =?us-ascii?Q?a3F89G/4dQTdGO25V4Fp04VWI/SLjJgMjxTgi282mAXvB2HCrlFRKyzkcdms?=
 =?us-ascii?Q?A+eAdskowlmTxqS0m8GLAWJGCcQ2Eg2k+5HmCOuDSxXpGcdPlQ1nb4gpsvzw?=
 =?us-ascii?Q?86neB8YUJftfQALk4gsm5yGbXp3EasdMqjZya1v0DntVnN+3sLmrVexQNg0U?=
 =?us-ascii?Q?y8naOf7Bhv/PRoX0P0JIaKToIaypJUtKzt7H1tvpl4qeu7b0rFKbpm9KBqvx?=
 =?us-ascii?Q?qd4U2L3j+wilYGrrEcFcs5D9QvI1OWEDuJ3FvBtELcY0u34EzQaciGXtUKf3?=
 =?us-ascii?Q?KDD2eurW1mZNkzyDhzRvUW8A0T2jLxqgSsQTGfue2ukFRGY+gh9pjwdCc3XS?=
 =?us-ascii?Q?1w1f8enmZ0NRH3rR5Z8poivDN53fqLeGvpAMUOJ3M3Hv7BPF8d/C9Z2/rAoH?=
 =?us-ascii?Q?p1aXKa2PUpokK7XRb/nnXSWrLB/GW2SSh/g8MKYf3PqXTS88oxDCxCUUGGco?=
 =?us-ascii?Q?DqvYfXhmliTGIlhCU7dKqODUGt2Msf9dV6ixNgEbMuAAMF7urOHxU+aLhKE9?=
 =?us-ascii?Q?egEHN8IY+XN2Cet348du3MZE1iSsUIH7vWjMmfKJYrwgwDkbZ1qn441MCT4H?=
 =?us-ascii?Q?SUZZ/a0JFk5sItUcgFwiHjF5BH8KgB+snT6vgMPA9dlhKRpfToez/UGhplHs?=
 =?us-ascii?Q?TrOT2jJ8DfANmAVO+ilwdHefE0Ev/cnhGeINSOLdNrhWdHRJH4LLppjmKtsj?=
 =?us-ascii?Q?KVm0YFVPZk6CUykbvvI4jyHxiSHPPltkqnrcZq9Tn6eP7dgPAgCGVxasjfIk?=
 =?us-ascii?Q?bZ3rP8IhRgsEYZ94lFi5GvL55exBm6JjM0QezLFynGZuqLtazEZgealxgqIO?=
 =?us-ascii?Q?+rbumdN1mHjcXTmquqDS0ibw5dpF6xsXvoYQutwYX03PscgbPkWNzlSMzkqX?=
 =?us-ascii?Q?8zybBCdS1TFzn4g3QTcFzJv3NWgsn6hyh/q50Pzxb4/+RAzbgZOBuXE4xtbf?=
 =?us-ascii?Q?rwNQWuav8Mno5SsWWB3Gq0Wtloxc0AgvjAG624ioXPP4GeDHd/57W8nOlyHy?=
 =?us-ascii?Q?eZiMNzIBFnavS+WCooU6YaGKWuYce55mo/7muV0n2E6BSe4Vddgo5QAVlHPX?=
 =?us-ascii?Q?cxSy7buE+diV4fkElTn3Q25vbbiEBiQEKhSimDSSJEqjhPqKuKJxPXqQX8R8?=
 =?us-ascii?Q?YG7848xPj40hWUatNI+cvnibmE2Al/rQuNNOlr9jSuJDLctFpUgDIlznQupX?=
 =?us-ascii?Q?u2gZ+gcTp/7UDluVDoZGijU/M2NcM0tbU7rOzzMj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a03fcdf-423f-4f15-d2c9-08dd1a8108d6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 07:46:06.2282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: veuVXliHH4CK6+U21ncRDdsJkuTAM+Yy2chXzVZd0iQBwjanHDB1Yjfa92K5i5RR/t7lVAzsqae7yVIfZDDAyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7256
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Implement the ASRC memory to memory function using
the compress framework, user can use this function with
compress ioctl interface.

This feature can be shared by ASRC and EASRC drivers

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/Kconfig           |   2 +
 sound/soc/fsl/Makefile          |   2 +-
 sound/soc/fsl/fsl_asrc_common.h |   9 +
 sound/soc/fsl/fsl_asrc_m2m.c    | 727 ++++++++++++++++++++++++++++++++
 4 files changed, 739 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 8e88830e8e57..6a9f5421eb83 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -8,6 +8,8 @@ config SND_SOC_FSL_ASRC
 	depends on HAS_DMA
 	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
+	select SND_COMPRESS_ACCEL
+	select SND_COMPRESS_OFFLOAD
 	help
 	  Say Y if you want to add Asynchronous Sample Rate Converter (ASRC)
 	  support for the Freescale CPUs.
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index ad97244b5cc3..d656a9ab54e3 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -10,7 +10,7 @@ obj-$(CONFIG_SND_SOC_P1022_RDK) += snd-soc-p1022-rdk.o
 # Freescale SSI/DMA/SAI/SPDIF Support
 snd-soc-fsl-audmix-y := fsl_audmix.o
 snd-soc-fsl-asoc-card-y := fsl-asoc-card.o
-snd-soc-fsl-asrc-y := fsl_asrc.o fsl_asrc_dma.o
+snd-soc-fsl-asrc-y := fsl_asrc.o fsl_asrc_dma.o fsl_asrc_m2m.o
 snd-soc-fsl-lpc3xxx-y := lpc3xxx-pcm.o lpc3xxx-i2s.o
 snd-soc-fsl-sai-y := fsl_sai.o
 snd-soc-fsl-ssi-y := fsl_ssi.o
diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 3bdd6ea07c09..0cd595b0f629 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -60,6 +60,7 @@ struct fsl_asrc_m2m_cap {
  * @buf_len: buffer length of m2m
  * @dma_buffer: buffer pointers
  * @first_convert: start of conversion
+ * @ratio_mod_flag: flag for new ratio modifier
  * @ratio_mod: ratio modification
  */
 struct fsl_asrc_pair {
@@ -84,6 +85,7 @@ struct fsl_asrc_pair {
 	unsigned int buf_len[2];
 	struct snd_dma_buffer dma_buffer[2];
 	unsigned int first_convert;
+	bool ratio_mod_flag;
 	unsigned int ratio_mod;
 };
 
@@ -98,6 +100,7 @@ struct fsl_asrc_pair {
  * @mem_clk: clock source to access register
  * @ipg_clk: clock source to drive peripheral
  * @spba_clk: SPBA clock (optional, depending on SoC design)
+ * @card: compress sound card
  * @lock: spin lock for resource protection
  * @pair: pair pointers
  * @channel_avail: non-occupied channel numbers
@@ -131,6 +134,7 @@ struct fsl_asrc {
 	struct clk *mem_clk;
 	struct clk *ipg_clk;
 	struct clk *spba_clk;
+	struct snd_card *card;
 	spinlock_t lock;      /* spin lock for resource protection */
 
 	struct fsl_asrc_pair *pair[PAIR_CTX_NUM];
@@ -166,4 +170,9 @@ struct fsl_asrc {
 #define DRV_NAME "fsl-asrc-dai"
 extern struct snd_soc_component_driver fsl_asrc_component;
 
+int fsl_asrc_m2m_init(struct fsl_asrc *asrc);
+void fsl_asrc_m2m_exit(struct fsl_asrc *asrc);
+int fsl_asrc_m2m_resume(struct fsl_asrc *asrc);
+int fsl_asrc_m2m_suspend(struct fsl_asrc *asrc);
+
 #endif /* _FSL_ASRC_COMMON_H */
diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
new file mode 100644
index 000000000000..f266a3f5fd48
--- /dev/null
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -0,0 +1,727 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2014-2016 Freescale Semiconductor, Inc.
+// Copyright (C) 2019-2024 NXP
+//
+// Freescale ASRC Memory to Memory (M2M) driver
+
+#include <linux/dma/imx-dma.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-mapping.h>
+#include <linux/pm_runtime.h>
+#include <sound/asound.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/initval.h>
+
+#include "fsl_asrc_common.h"
+
+#define DIR_STR(dir) (dir) == IN ? "in" : "out"
+
+#define ASRC_xPUT_DMA_CALLBACK(dir) \
+	(((dir) == IN) ? asrc_input_dma_callback \
+	: asrc_output_dma_callback)
+
+/* Maximum output and capture buffer size */
+#define ASRC_M2M_BUFFER_SIZE (512 * 1024)
+
+/* Maximum output and capture period size */
+#define ASRC_M2M_PERIOD_SIZE (48 * 1024)
+
+/* dma complete callback */
+static void asrc_input_dma_callback(void *data)
+{
+	struct fsl_asrc_pair *pair = (struct fsl_asrc_pair *)data;
+
+	complete(&pair->complete[IN]);
+}
+
+/* dma complete callback */
+static void asrc_output_dma_callback(void *data)
+{
+	struct fsl_asrc_pair *pair = (struct fsl_asrc_pair *)data;
+
+	complete(&pair->complete[OUT]);
+}
+
+/**
+ *asrc_read_last_fifo: read all the remaining data from FIFO
+ *@pair: Structure pointer of fsl_asrc_pair
+ *@dma_vaddr: virtual address of capture buffer
+ *@length: payload length of capture buffer
+ */
+static void asrc_read_last_fifo(struct fsl_asrc_pair *pair, void *dma_vaddr, u32 *length)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	u32 i, reg, size, t_size = 0, width;
+	u32 *reg32 = NULL;
+	u16 *reg16 = NULL;
+	u8  *reg24 = NULL;
+
+	width = snd_pcm_format_physical_width(pair->sample_format[OUT]);
+	if (width == 32)
+		reg32 = dma_vaddr + *length;
+	else if (width == 16)
+		reg16 = dma_vaddr + *length;
+	else
+		reg24 = dma_vaddr + *length;
+retry:
+	size = asrc->get_output_fifo_size(pair);
+	if (size + *length > ASRC_M2M_BUFFER_SIZE)
+		goto end;
+
+	for (i = 0; i < size * pair->channels; i++) {
+		regmap_read(asrc->regmap, asrc->get_fifo_addr(OUT, index), &reg);
+		if (reg32) {
+			*reg32++ = reg;
+		} else if (reg16) {
+			*reg16++ = (u16)reg;
+		} else {
+			*reg24++ = (u8)reg;
+			*reg24++ = (u8)(reg >> 8);
+			*reg24++ = (u8)(reg >> 16);
+		}
+	}
+	t_size += size;
+
+	/* In case there is data left in FIFO */
+	if (size)
+		goto retry;
+end:
+	/* Update payload length */
+	if (reg32)
+		*length += t_size * pair->channels * 4;
+	else if (reg16)
+		*length += t_size * pair->channels * 2;
+	else
+		*length += t_size * pair->channels * 3;
+}
+
+/* config dma channel */
+static int asrc_dmaconfig(struct fsl_asrc_pair *pair,
+			  struct dma_chan *chan,
+			  u32 dma_addr, dma_addr_t buf_addr, u32 buf_len,
+			  int dir, int width)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
+	struct dma_slave_config slave_config;
+	enum dma_slave_buswidth buswidth;
+	unsigned int sg_len, max_period_size;
+	struct scatterlist *sg;
+	int ret, i;
+
+	switch (width) {
+	case 8:
+		buswidth = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		break;
+	case 16:
+		buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
+		break;
+	case 24:
+		buswidth = DMA_SLAVE_BUSWIDTH_3_BYTES;
+		break;
+	case 32:
+		buswidth = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
+	default:
+		dev_err(dev, "invalid word width\n");
+		return -EINVAL;
+	}
+
+	memset(&slave_config, 0, sizeof(slave_config));
+	if (dir == IN) {
+		slave_config.direction = DMA_MEM_TO_DEV;
+		slave_config.dst_addr = dma_addr;
+		slave_config.dst_addr_width = buswidth;
+		slave_config.dst_maxburst = asrc->m2m_get_maxburst(IN, pair);
+	} else {
+		slave_config.direction = DMA_DEV_TO_MEM;
+		slave_config.src_addr = dma_addr;
+		slave_config.src_addr_width = buswidth;
+		slave_config.src_maxburst = asrc->m2m_get_maxburst(OUT, pair);
+	}
+
+	ret = dmaengine_slave_config(chan, &slave_config);
+	if (ret) {
+		dev_err(dev, "failed to config dmaengine for %s task: %d\n",
+			DIR_STR(dir), ret);
+		return -EINVAL;
+	}
+
+	max_period_size = rounddown(ASRC_M2M_PERIOD_SIZE, width * pair->channels / 8);
+	/* scatter gather mode */
+	sg_len = buf_len / max_period_size;
+	if (buf_len % max_period_size)
+		sg_len += 1;
+
+	sg = kmalloc_array(sg_len, sizeof(*sg), GFP_KERNEL);
+	if (!sg)
+		return -ENOMEM;
+
+	sg_init_table(sg, sg_len);
+	for (i = 0; i < (sg_len - 1); i++) {
+		sg_dma_address(&sg[i]) = buf_addr + i * max_period_size;
+		sg_dma_len(&sg[i]) = max_period_size;
+	}
+	sg_dma_address(&sg[i]) = buf_addr + i * max_period_size;
+	sg_dma_len(&sg[i]) = buf_len - i * max_period_size;
+
+	pair->desc[dir] = dmaengine_prep_slave_sg(chan, sg, sg_len,
+						  slave_config.direction,
+						  DMA_PREP_INTERRUPT);
+	kfree(sg);
+	if (!pair->desc[dir]) {
+		dev_err(dev, "failed to prepare dmaengine for %s task\n", DIR_STR(dir));
+		return -EINVAL;
+	}
+
+	pair->desc[dir]->callback = ASRC_xPUT_DMA_CALLBACK(dir);
+	pair->desc[dir]->callback_param = pair;
+
+	return 0;
+}
+
+/* main function of converter */
+static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_task_runtime *task)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
+	enum asrc_pair_index index = pair->index;
+	struct snd_dma_buffer *src_buf, *dst_buf;
+	unsigned int in_buf_len;
+	unsigned int out_dma_len;
+	unsigned int width;
+	u32 fifo_addr;
+	int ret;
+
+	/* set ratio mod */
+	if (asrc->m2m_set_ratio_mod) {
+		if (pair->ratio_mod_flag) {
+			asrc->m2m_set_ratio_mod(pair, pair->ratio_mod);
+			pair->ratio_mod_flag = false;
+		}
+	}
+
+	src_buf = &pair->dma_buffer[IN];
+	dst_buf = &pair->dma_buffer[OUT];
+
+	width = snd_pcm_format_physical_width(pair->sample_format[IN]);
+	fifo_addr = asrc->paddr + asrc->get_fifo_addr(IN, index);
+
+	in_buf_len = task->input_size;
+
+	if (in_buf_len < width * pair->channels / 8 ||
+	    in_buf_len > ASRC_M2M_BUFFER_SIZE ||
+	    in_buf_len % (width * pair->channels / 8)) {
+		dev_err(dev, "out buffer size is error: [%d]\n", in_buf_len);
+		goto end;
+	}
+
+	/* dma config for output dma channel */
+	ret = asrc_dmaconfig(pair,
+			     pair->dma_chan[IN],
+			     fifo_addr,
+			     src_buf->addr,
+			     in_buf_len, IN, width);
+	if (ret) {
+		dev_err(dev, "out dma config error\n");
+		goto end;
+	}
+
+	width = snd_pcm_format_physical_width(pair->sample_format[OUT]);
+	fifo_addr = asrc->paddr + asrc->get_fifo_addr(OUT, index);
+	out_dma_len = asrc->m2m_calc_out_len(pair, in_buf_len);
+	if (out_dma_len > 0 && out_dma_len <= ASRC_M2M_BUFFER_SIZE) {
+		/* dma config for capture dma channel */
+		ret = asrc_dmaconfig(pair,
+				     pair->dma_chan[OUT],
+				     fifo_addr,
+				     dst_buf->addr,
+				     out_dma_len, OUT, width);
+		if (ret) {
+			dev_err(dev, "cap dma config error\n");
+			goto end;
+		}
+	} else if (out_dma_len > ASRC_M2M_BUFFER_SIZE) {
+		dev_err(dev, "cap buffer size error\n");
+		goto end;
+	}
+
+	reinit_completion(&pair->complete[IN]);
+	reinit_completion(&pair->complete[OUT]);
+
+	/* Submit DMA request */
+	dmaengine_submit(pair->desc[IN]);
+	dma_async_issue_pending(pair->desc[IN]->chan);
+	if (out_dma_len > 0) {
+		dmaengine_submit(pair->desc[OUT]);
+		dma_async_issue_pending(pair->desc[OUT]->chan);
+	}
+
+	asrc->m2m_start(pair);
+
+	if (!wait_for_completion_interruptible_timeout(&pair->complete[IN], 10 * HZ)) {
+		dev_err(dev, "out DMA task timeout\n");
+		goto end;
+	}
+
+	if (out_dma_len > 0) {
+		if (!wait_for_completion_interruptible_timeout(&pair->complete[OUT], 10 * HZ)) {
+			dev_err(dev, "cap DMA task timeout\n");
+			goto end;
+		}
+	}
+
+	/* read the last words from FIFO */
+	asrc_read_last_fifo(pair, dst_buf->area, &out_dma_len);
+	/* update payload length for capture */
+	task->output_size = out_dma_len;
+end:
+	return;
+}
+
+static int fsl_asrc_m2m_comp_open(struct snd_compr_stream *stream)
+{
+	struct fsl_asrc *asrc = stream->private_data;
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct device *dev = &asrc->pdev->dev;
+	struct fsl_asrc_pair *pair;
+	int size, ret;
+
+	pair = kzalloc(sizeof(*pair) + asrc->pair_priv_size, GFP_KERNEL);
+	if (!pair)
+		return -ENOMEM;
+
+	pair->private = (void *)pair + sizeof(struct fsl_asrc_pair);
+	pair->asrc = asrc;
+
+	init_completion(&pair->complete[IN]);
+	init_completion(&pair->complete[OUT]);
+
+	runtime->private_data = pair;
+
+	size = ASRC_M2M_BUFFER_SIZE;
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, dev, size, &pair->dma_buffer[IN]);
+	if (ret)
+		goto error_alloc_in_buf;
+
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, dev, size, &pair->dma_buffer[OUT]);
+	if (ret)
+		goto error_alloc_out_buf;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to power up asrc\n");
+		goto err_pm_runtime;
+	}
+
+	return 0;
+
+err_pm_runtime:
+	snd_dma_free_pages(&pair->dma_buffer[OUT]);
+error_alloc_out_buf:
+	snd_dma_free_pages(&pair->dma_buffer[IN]);
+error_alloc_in_buf:
+	kfree(pair);
+	return ret;
+}
+
+static int fsl_asrc_m2m_comp_release(struct snd_compr_stream *stream)
+{
+	struct fsl_asrc *asrc = stream->private_data;
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct fsl_asrc_pair *pair = runtime->private_data;
+	struct device *dev = &asrc->pdev->dev;
+
+	pm_runtime_put_sync(dev);
+
+	snd_dma_free_pages(&pair->dma_buffer[IN]);
+	snd_dma_free_pages(&pair->dma_buffer[OUT]);
+
+	kfree(runtime->private_data);
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_comp_set_params(struct snd_compr_stream *stream,
+					struct snd_compr_params *params)
+{
+	struct fsl_asrc *asrc = stream->private_data;
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct fsl_asrc_pair *pair = runtime->private_data;
+	struct fsl_asrc_m2m_cap cap;
+	int ret, i;
+
+	ret = asrc->m2m_get_cap(&cap);
+	if (ret)
+		return -EINVAL;
+
+	if (pcm_format_to_bits(params->codec.format) & cap.fmt_in)
+		pair->sample_format[IN] = params->codec.format;
+	else
+		return -EINVAL;
+
+	if (pcm_format_to_bits(params->codec.pcm_format) & cap.fmt_out)
+		pair->sample_format[OUT] = params->codec.pcm_format;
+	else
+		return -EINVAL;
+
+	/* check input rate is in scope */
+	for (i = 0; i < cap.rate_in_count; i++)
+		if (params->codec.sample_rate == cap.rate_in[i]) {
+			pair->rate[IN] = params->codec.sample_rate;
+			break;
+		}
+	if (i == cap.rate_in_count)
+		return -EINVAL;
+
+	/* check output rate is in scope */
+	for (i = 0; i < cap.rate_out_count; i++)
+		if (params->codec.options.src_d.out_sample_rate == cap.rate_out[i]) {
+			pair->rate[OUT] = params->codec.options.src_d.out_sample_rate;
+			break;
+		}
+	if (i == cap.rate_out_count)
+		return -EINVAL;
+
+	if (params->codec.ch_in != params->codec.ch_out ||
+	    params->codec.ch_in < cap.chan_min ||
+	    params->codec.ch_in > cap.chan_max)
+		return -EINVAL;
+
+	pair->channels = params->codec.ch_in;
+	pair->buf_len[IN] = params->buffer.fragment_size;
+	pair->buf_len[OUT] = params->buffer.fragment_size;
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct snd_dma_buffer *dmab = dmabuf->priv;
+
+	return snd_dma_buffer_mmap(dmab, vma);
+}
+
+static struct sg_table *fsl_asrc_m2m_map_dma_buf(struct dma_buf_attachment *attachment,
+						 enum dma_data_direction direction)
+{
+	struct snd_dma_buffer *dmab = attachment->dmabuf->priv;
+	struct sg_table *sgt;
+
+	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return NULL;
+
+	if (dma_get_sgtable(attachment->dev, sgt, dmab->area, dmab->addr, dmab->bytes) < 0)
+		goto free;
+
+	if (dma_map_sgtable(attachment->dev, sgt, direction, 0))
+		goto free;
+
+	return sgt;
+
+free:
+	sg_free_table(sgt);
+	kfree(sgt);
+	return NULL;
+}
+
+static void fsl_asrc_m2m_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				       struct sg_table *table,
+				       enum dma_data_direction direction)
+{
+	dma_unmap_sgtable(attachment->dev, table, direction, 0);
+}
+
+static void fsl_asrc_m2m_release(struct dma_buf *dmabuf)
+{
+	/* buffer is released by fsl_asrc_m2m_comp_release() */
+}
+
+static const struct dma_buf_ops fsl_asrc_m2m_dma_buf_ops = {
+	.mmap = fsl_asrc_m2m_mmap,
+	.map_dma_buf = fsl_asrc_m2m_map_dma_buf,
+	.unmap_dma_buf = fsl_asrc_m2m_unmap_dma_buf,
+	.release = fsl_asrc_m2m_release,
+};
+
+static int fsl_asrc_m2m_comp_task_create(struct snd_compr_stream *stream,
+					 struct snd_compr_task_runtime *task)
+{
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info_in);
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info_out);
+	struct fsl_asrc *asrc = stream->private_data;
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct fsl_asrc_pair *pair = runtime->private_data;
+	struct device *dev = &asrc->pdev->dev;
+	int ret;
+
+	exp_info_in.ops = &fsl_asrc_m2m_dma_buf_ops;
+	exp_info_in.size = ASRC_M2M_BUFFER_SIZE;
+	exp_info_in.flags = O_RDWR;
+	exp_info_in.priv = &pair->dma_buffer[IN];
+	task->input = dma_buf_export(&exp_info_in);
+	if (IS_ERR(task->input)) {
+		ret = PTR_ERR(task->input);
+		return ret;
+	}
+
+	exp_info_out.ops = &fsl_asrc_m2m_dma_buf_ops;
+	exp_info_out.size = ASRC_M2M_BUFFER_SIZE;
+	exp_info_out.flags = O_RDWR;
+	exp_info_out.priv = &pair->dma_buffer[OUT];
+	task->output = dma_buf_export(&exp_info_out);
+	if (IS_ERR(task->output)) {
+		ret = PTR_ERR(task->output);
+		return ret;
+	}
+
+	/* Request asrc pair/context */
+	ret = asrc->request_pair(pair->channels, pair);
+	if (ret) {
+		dev_err(dev, "failed to request pair: %d\n", ret);
+		goto err_request_pair;
+	}
+
+	ret = asrc->m2m_prepare(pair);
+	if (ret) {
+		dev_err(dev, "failed to start pair part one: %d\n", ret);
+		goto err_start_part_one;
+	}
+
+	/* Request dma channels */
+	pair->dma_chan[IN] = asrc->get_dma_channel(pair, IN);
+	if (!pair->dma_chan[IN]) {
+		dev_err(dev, "[ctx%d] failed to get input DMA channel\n", pair->index);
+		ret = -EBUSY;
+		goto err_dma_channel_in;
+	}
+
+	pair->dma_chan[OUT] = asrc->get_dma_channel(pair, OUT);
+	if (!pair->dma_chan[OUT]) {
+		dev_err(dev, "[ctx%d] failed to get output DMA channel\n", pair->index);
+		ret = -EBUSY;
+		goto err_dma_channel_out;
+	}
+
+	return 0;
+
+err_dma_channel_out:
+	dma_release_channel(pair->dma_chan[IN]);
+err_dma_channel_in:
+	if (asrc->m2m_unprepare)
+		asrc->m2m_unprepare(pair);
+err_start_part_one:
+	asrc->release_pair(pair);
+err_request_pair:
+	return ret;
+}
+
+static int fsl_asrc_m2m_comp_task_start(struct snd_compr_stream *stream,
+					struct snd_compr_task_runtime *task)
+{
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct fsl_asrc_pair *pair = runtime->private_data;
+
+	asrc_m2m_device_run(pair, task);
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_comp_task_stop(struct snd_compr_stream *stream,
+				       struct snd_compr_task_runtime *task)
+{
+	return 0;
+}
+
+static int fsl_asrc_m2m_comp_task_free(struct snd_compr_stream *stream,
+				       struct snd_compr_task_runtime *task)
+{
+	struct fsl_asrc *asrc = stream->private_data;
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct fsl_asrc_pair *pair = runtime->private_data;
+
+	/* Stop & release pair/context */
+	if (asrc->m2m_stop)
+		asrc->m2m_stop(pair);
+
+	if (asrc->m2m_unprepare)
+		asrc->m2m_unprepare(pair);
+	asrc->release_pair(pair);
+
+	/* Release dma channel */
+	if (pair->dma_chan[IN])
+		dma_release_channel(pair->dma_chan[IN]);
+	if (pair->dma_chan[OUT])
+		dma_release_channel(pair->dma_chan[OUT]);
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_get_caps(struct snd_compr_stream *cstream,
+				 struct snd_compr_caps *caps)
+{
+	caps->num_codecs = 1;
+	caps->min_fragment_size = 4096;
+	caps->max_fragment_size = 4096;
+	caps->min_fragments = 1;
+	caps->max_fragments = 1;
+	caps->codecs[0] = SND_AUDIOCODEC_PCM;
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_fill_codec_caps(struct fsl_asrc *asrc,
+					struct snd_compr_codec_caps *codec)
+{
+	struct fsl_asrc_m2m_cap cap;
+	snd_pcm_format_t k;
+	int j = 0;
+	int ret;
+
+	ret = asrc->m2m_get_cap(&cap);
+	if (ret)
+		return -EINVAL;
+
+	pcm_for_each_format(k) {
+		if (pcm_format_to_bits(k) & cap.fmt_in) {
+			codec->descriptor[j].max_ch = cap.chan_max;
+			memcpy(codec->descriptor[j].sample_rates,
+			       cap.rate_in,
+			       cap.rate_in_count * sizeof(__u32));
+			codec->descriptor[j].num_sample_rates = cap.rate_in_count;
+			codec->descriptor[j].formats = k;
+			codec->descriptor[j].pcm_formats = cap.fmt_out;
+			codec->descriptor[j].src.out_sample_rate_min = cap.rate_out[0];
+			codec->descriptor[j].src.out_sample_rate_max =
+				cap.rate_out[cap.rate_out_count - 1];
+			j++;
+		}
+	}
+
+	codec->codec = SND_AUDIOCODEC_PCM;
+	codec->num_descriptors = j;
+	return 0;
+}
+
+static int fsl_asrc_m2m_get_codec_caps(struct snd_compr_stream *stream,
+				       struct snd_compr_codec_caps *codec)
+{
+	struct fsl_asrc *asrc = stream->private_data;
+
+	return fsl_asrc_m2m_fill_codec_caps(asrc, codec);
+}
+
+static struct snd_compr_ops fsl_asrc_m2m_compr_ops = {
+	.open = fsl_asrc_m2m_comp_open,
+	.free = fsl_asrc_m2m_comp_release,
+	.set_params = fsl_asrc_m2m_comp_set_params,
+	.get_caps = fsl_asrc_m2m_get_caps,
+	.get_codec_caps = fsl_asrc_m2m_get_codec_caps,
+	.task_create = fsl_asrc_m2m_comp_task_create,
+	.task_start = fsl_asrc_m2m_comp_task_start,
+	.task_stop = fsl_asrc_m2m_comp_task_stop,
+	.task_free = fsl_asrc_m2m_comp_task_free,
+};
+
+int fsl_asrc_m2m_suspend(struct fsl_asrc *asrc)
+{
+	struct fsl_asrc_pair *pair;
+	int i;
+
+	for (i = 0; i < PAIR_CTX_NUM; i++) {
+		pair = asrc->pair[i];
+		if (!pair)
+			continue;
+		if (!completion_done(&pair->complete[IN])) {
+			if (pair->dma_chan[IN])
+				dmaengine_terminate_all(pair->dma_chan[IN]);
+			asrc_input_dma_callback((void *)pair);
+		}
+		if (!completion_done(&pair->complete[OUT])) {
+			if (pair->dma_chan[OUT])
+				dmaengine_terminate_all(pair->dma_chan[OUT]);
+			asrc_output_dma_callback((void *)pair);
+		}
+
+		if (asrc->m2m_pair_suspend)
+			asrc->m2m_pair_suspend(pair);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fsl_asrc_m2m_suspend);
+
+int fsl_asrc_m2m_resume(struct fsl_asrc *asrc)
+{
+	struct fsl_asrc_pair *pair;
+	int i;
+
+	for (i = 0; i < PAIR_CTX_NUM; i++) {
+		pair = asrc->pair[i];
+		if (!pair)
+			continue;
+		if (asrc->m2m_pair_resume)
+			asrc->m2m_pair_resume(pair);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fsl_asrc_m2m_resume);
+
+int fsl_asrc_m2m_init(struct fsl_asrc *asrc)
+{
+	struct device *dev = &asrc->pdev->dev;
+	struct snd_card *card;
+	struct snd_compr *compr;
+	int ret;
+
+	ret = snd_card_new(dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
+			   THIS_MODULE, 0, &card);
+	if (ret < 0)
+		return ret;
+
+	strscpy(card->driver, "fsl-asrc-m2m", sizeof(card->driver));
+	strscpy(card->shortname, "ASRC-M2M", sizeof(card->shortname));
+	strscpy(card->longname, "ASRC-M2M", sizeof(card->shortname));
+
+	asrc->card = card;
+
+	compr = devm_kzalloc(dev, sizeof(*compr), GFP_KERNEL);
+	if (!compr) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	compr->ops = &fsl_asrc_m2m_compr_ops;
+	compr->private_data = asrc;
+
+	ret = snd_compress_new(card, 0, SND_COMPRESS_ACCEL, "ASRC M2M", compr);
+	if (ret < 0)
+		goto err;
+
+	ret = snd_card_register(card);
+	if (ret < 0)
+		goto err;
+
+	return 0;
+err:
+	snd_card_free(card);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(fsl_asrc_m2m_init);
+
+void fsl_asrc_m2m_exit(struct fsl_asrc *asrc)
+{
+	struct snd_card *card = asrc->card;
+
+	snd_card_free(card);
+}
+EXPORT_SYMBOL_GPL(fsl_asrc_m2m_exit);
+
+MODULE_IMPORT_NS("DMA_BUF");
+MODULE_AUTHOR("Shengjiu Wang <Shengjiu.Wang@nxp.com>");
+MODULE_DESCRIPTION("Freescale ASRC M2M driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


