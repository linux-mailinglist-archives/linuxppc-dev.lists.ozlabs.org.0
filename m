Return-Path: <linuxppc-dev+bounces-1681-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECB698993E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2024 04:33:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XH4qp6wPXz2yFK;
	Mon, 30 Sep 2024 12:33:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::61a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727663588;
	cv=pass; b=bAzVweRYfoP5ncbqI9Z2sTCVDB8ic/xbX6p0BvY0Zry4CYNH9ihdDwY3ofqqB7llP2jJKgeKrR75f0RPyQJEj64Upsy3Dagv27CIfedy8VBzA60TW8E9sBSslVWMQKz1GC+iT/kr+jcDrISghJ4PB5t1u2P7VYDYx3q7cErpgnNYxuKj/HJE2vbZwrBDIXXEG0S+qLxeu8TtYV5BhQjmAGT8RBzQlwQAjibe2Xbh2guTAD/7f8yrhdE/B3pzs7e7vjYE/wOB+dHOs518ubXDZY/PriugvxZZOPo+Uod9qXx8XALyDU4uCTfbfq84f4TOaNAIT9wy3kgz37X6/WKqLA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727663588; c=relaxed/relaxed;
	bh=RrIyG8IKykmicR6gYtqDm/pSlrk3Q7oo7ERZ+2yqFQI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=XPIb4YN+8gxAcb/0t9bGUgblG5GZuj/gF+h0DIb83hlKSuZxBJx08U5cYRV3YpydexR5f1zT+rgYDxJl/5xJliVwm1N3pyzdwLca7uYVqhdCMKkdDJ/k21u/+EnCzR+E5gR2azfSt4lcPi2y46TbmaCWdItkJqZV8MVrDKkVDWOCXyTke3G2hXSLrK7HbVHtttfNhGrmN0JdHEJHSEqVcLiR/d60W45xsS5d4RFsomuRCutSaxj7md6yqW6PWUWoyrxzIQ+rExmJ4q/YHhjb51qZqRArbHuN2eOSUMb3X4l44W4WGjOVho9FjC47Snfgc/u3fN0qaxoAugyu0QC9iA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=cwz1FUay; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::61a; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=shenlichuan@vivo.com; receiver=lists.ozlabs.org) smtp.mailfrom=vivo.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=cwz1FUay;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vivo.com (client-ip=2a01:111:f403:2011::61a; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=shenlichuan@vivo.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XH4ql2dFbz2y8n
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 12:33:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=if2gjB2fMGeX0K8a5eli3VtxzuH8ACMs4rimc0Du3rU/s8BiuFn7FeOcFxp2gq7gtGrTnGgciKQvrU0rLRNlUpGaKATosDOWJuKiPWX4S8OQNJDEFgBI+rfjAss/pzhjW1NDwgpr04419QXOU+hC86eyivENsalQ61EOiVA1hQx8RwxFsSzoHIsZhkvGS07lwi8CnZSevujYod3B5i82DgFPTccoklLiYun/DnNapHW3CWFFAcDF21gdLZhWyzBzCz0ZxvCZPcFxbC90xSrsvByO32Nt6Dfu5UYxpeTIh0MPEGVwHW0rB5qx7A8ffG+gi6YucArJdqYSRmHcPghmBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrIyG8IKykmicR6gYtqDm/pSlrk3Q7oo7ERZ+2yqFQI=;
 b=SgkS8DRB9C5wuKTB1sTxJiuB8sMO6L+8e7gsZudsZKcMRg6wjrkL67j3DbR6CA49oJrjCESVjwUEQol1uq7ZcBmA53Ksw4bf0ZwXbZQNE4lwnghLrVIZl3LPkCnZSSWXFU82eao9AGaqs7PAeP27ibZ8Dw8iwvNeSwHNrwX6E1jIm2bp4Eml+r08xcGm9po5ALvfsSK2mYes1fSPRs6GHom9xfTo+mkrBxP7DaSlnGg755qErmdSi8WNinRXUmDjNBkOUcqrBOOjwi1eofqYyMrLYf5WFRkfnoMN1dZuaH5hW03HPIY9ZaIzFuxuqIjU+J31ymxiW7Xguquoao6x1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrIyG8IKykmicR6gYtqDm/pSlrk3Q7oo7ERZ+2yqFQI=;
 b=cwz1FUayTEW+aZSewdTQ+6WuxDWOlGzyhSVqXwMQpql4Q5PtYsb7ZYOu7uKQZZnuTQqpol+4lBMHuLYXkgiVwVqh561e6CoU8BoiwNGuV0LZ5JGPFabq0rL2vuatfrRcIbnUizEyCT0UJrYTY7NjukfyU7QpGeTlMYN37zwkZV+QbDPcZTL/Cfwidp/iiIz/ef09terd/uwuv73jJk7xw8uUXzviTn8XnpRQIJRwZzaGqrk9QdczHGAdWKJa80VRXTXE8WDTLxILyRqbFT3RGOmcBhHyaKdQ0O/JIYa0QYyklNLjzFxwupnWswab3aDwLIU3L+bT6JLGkHDjCK0BGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by SEZPR06MB5319.apcprd06.prod.outlook.com (2603:1096:101:7e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 02:32:44 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%6]) with mapi id 15.20.8005.020; Mon, 30 Sep 2024
 02:32:44 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: geoff@infradead.org,
	mpe@ellerman.id.au
Cc: npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen@kernel.org,
	maddy@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] ps3: Correct some typos in comments
Date: Mon, 30 Sep 2024 10:32:34 +0800
Message-Id: <20240930023234.7457-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|SEZPR06MB5319:EE_
X-MS-Office365-Filtering-Correlation-Id: 4456d309-b9d8-4b66-9267-08dce0f829ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UBoAbfxYLprNeYF+PZ54FfLfLFiCyoB8JMwSy+51kwmze+Y778tqHfEemQMe?=
 =?us-ascii?Q?lmyjRraUUB+NCKBGQYzogN9Y1Mgi5w2zJadgbEBRV+zJOFdT27QScu1vDPx6?=
 =?us-ascii?Q?Inw2pU0QhYwMPMimJmo5wiDqpXCMOvd8l7Cxjk0FAOnoBwLoIjAPo9wkYA76?=
 =?us-ascii?Q?nWnEfpaT9kAe612CzOGJSdYzwxBRLwAaTknq3HjfiRod5QNHkN4A6JTTqcZJ?=
 =?us-ascii?Q?4T+nOY5gi35BsjHIMOkjjPpB/V9iX+K9mgxx2mlc/+t1ULYNRmoQephPeJ+9?=
 =?us-ascii?Q?Z2vWYjFwEULabC1ouQcAkXsfUmBwx3SiNQ2GG1KS+qJZGGhF+BGAf2vD0Ev4?=
 =?us-ascii?Q?avibCZF22Hsjbw7YKzpdBsjIjegwPATOxHxobOOjELsPNjwzRjvK4iz8cVTh?=
 =?us-ascii?Q?gdlkFxb9emBiXZ8BAKecULDYVoF41O+9BLdar43/MyH4mYcXMHz4g0IDzsO4?=
 =?us-ascii?Q?eJanrORvlMPz82scH6TEKxxmXO3vNpVLf1LgyTbreIUkQIgYMrnLJZVFlf5K?=
 =?us-ascii?Q?2I1xlPZ9G2KEhzUYypNkl3NV8oxSk/aAyEDX9Yz/CzMcdYkoQ0c0+mZ9YhgA?=
 =?us-ascii?Q?tfAno23V1jgZX1SZXGiYq7JDehgd4LiFbu1QINmU5hyqDLA4Dlsncyp9wAnH?=
 =?us-ascii?Q?9kj3nQSLB0cjLsFY7GbpftTJek6T70y6965uFtrWJNJsVe60SoT7F0izws/k?=
 =?us-ascii?Q?rAZGL7LoY0A/EEexIksOOptduwdwhhb/277bJhXXe3B+QGMz4pI8YfIWvhbn?=
 =?us-ascii?Q?4LyimY2Ky/aQfkrY2jFPWYgAIFpMjfVr17ZTbfRtOVFlifGLZtGBoBz5nPDa?=
 =?us-ascii?Q?Jf9kuqtQlOPhf+wyMbacGBupG3oCqMF1DP73q8GogKd9IldA+b9MsrWbBU3k?=
 =?us-ascii?Q?idkPVyrJdOkhkeGGTBIoV2b+iKi/ACWXpZSIyOUZQWu7qYpbMLGaa9R6Jazu?=
 =?us-ascii?Q?l8JxFHbXF31K+G+mS/sqSlZHw2ijHFsV04kEyv9q6B2HuTYjFxbKIuLPiZ5V?=
 =?us-ascii?Q?tu7bG7tJb6ZbhzB1ZAHxIFN5TSi35EDXGgyaBJ0ucLJ+cnj2U9vHHZmnTOAi?=
 =?us-ascii?Q?1mpOpli2Q9MsoymFsDs/WThpfgc0ov/WbYy3AWibAIx+fn0pIPC3sp/brOab?=
 =?us-ascii?Q?312sqoSYeh3vo0maH/bdIGfR+U+SSb5hqPtp9KQmmNcYpuqjpnpRlZmOMGMt?=
 =?us-ascii?Q?ajN3cRPxKiPqVIhx05efo0hpex/U6oTN7GFSS5Wc5KAidHyaQNBDPXl0h/ek?=
 =?us-ascii?Q?xRXApzhVH8pATcg8ZYlQIgY8Y+cw+UVHuML9qZdK6p4l8a0+Ei6vJ5w73M2o?=
 =?us-ascii?Q?EGOk3cAzIR33wUX/CN7W1bhZ7adwPnYxtr4xxB45Cncusg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5EcT/T4dogJzXGr9zpZif8Z8+/BadNKAKX0f3kYmgeX3mJATCWRodtfDbVm9?=
 =?us-ascii?Q?ypUHfpq9ka9mWj1RWkYkcP/eRMj7QxirYFnbP+vU7S6KT84GXAbzTYPsnqpR?=
 =?us-ascii?Q?1HI9HTpBDRU4BWs5zBzjerdt689y39hroImUyQkT/X7xnUzG3LlKD1jYZ0l7?=
 =?us-ascii?Q?FH2MMaKZicu9E630FOBdsAhbUGMCB40WKu8TQHMUF8tPHjdo86wNbBFU9CTn?=
 =?us-ascii?Q?DRAKrcfZhhqHPiVwJkTq8koqJhAk2pLYSKbrrcLWpAXlWfRDOSJC7WINbD0X?=
 =?us-ascii?Q?lurZz9nRTAnjotOEjJemUVsnroHLiLgTmeOEjxuKa4XX2vGB2EVKQaftBEwr?=
 =?us-ascii?Q?kQLfo8sUAg9GhhMSWBPRA18jUcv6EVN9H+riaXfygj+D8/F412N1YwmzFr+n?=
 =?us-ascii?Q?EUIB3J1EdQp3HuYT48o6SI0goI+LJtcQF1HmFyqTNT9Jzn+3h2jICs/JoSqr?=
 =?us-ascii?Q?jWr3VVm+o9OaGQHIJ+xRjiCwySIwW7FokCe4gCRrSJoOkf6p9l13nFEt+0Cb?=
 =?us-ascii?Q?1HlYkXPn6TWv1ZWz8tfE/xQkd3p7a7ObZg4P1mbJtcZ0v3dDwFBxKI3WG6v/?=
 =?us-ascii?Q?MK80gZetu06uxYS7d/MkM7fqGE5y16wOW/3Sghxw7EW/IxZdhY9oV4VOTudT?=
 =?us-ascii?Q?qd3ny972rNBOvozCdAo02lWzDTak52huvxExD1Dw5NXbrAE+JO3AXYCySdEu?=
 =?us-ascii?Q?sSkkqne/kJJn+nI7LgVuxQ23qzCoz/fOURtbHrKib1/i0YIVrvdwJVmst+I4?=
 =?us-ascii?Q?INmL1cVDgs2bkePA2T3VcFOD4j01eiMOQSXHivHD7fqsup7Ch7x7hOvQEym5?=
 =?us-ascii?Q?wyHHIaQKiIwmvWZMlkrpi6HK6wNjjTZrWrikhPzvzKH9J21KsR8qalZJS+WM?=
 =?us-ascii?Q?ycp7IWJa22NFZHVvShnuL/9AIAF9ZODgAwnbonst++VtLIpYe/MGrBnxWb+F?=
 =?us-ascii?Q?GW05/ljfBKg6oN1Jskw3GHJc+fJWTvigd7EpP51Iwa+023/wO4MI5Oe9Atib?=
 =?us-ascii?Q?A8vh74Vviz+34fD9LPSHA+4HCe+84htVyWiBprYQbZ2bZFUQspFgUJ7a44CZ?=
 =?us-ascii?Q?r4k4qquj5Xa03tZQf9io0FB7aAPjM3D2JdgxyQqfmkMbu+mzdAXZfycdyQ5O?=
 =?us-ascii?Q?JxPetjZXDVYW2f2994OoQAbhJr4TkrXYu7vQXDQEp7qjNMSm6ThkjOasc1jZ?=
 =?us-ascii?Q?ofcS4t3uTqquc/kkKJ6K0oylCEUSng4ReNCGx5dTMjbuK0XYpqhQGzgyGsMh?=
 =?us-ascii?Q?9w6Dv9RGIwSBYbF9Y7fJIypyKwAz0v3BRy5U/Bmd4cwMXiG6cwLB0kFq1JX5?=
 =?us-ascii?Q?3MuO4HJoFI/++2nncponTWhvQMS6rKTrRqw7ii6scKdlov5s3Yhynm+t7IcT?=
 =?us-ascii?Q?XFvQL24pTDTeEtZ4lscSRrmyATEpadNc21JF0TkNMv+E6BBRhZGZO39kyVta?=
 =?us-ascii?Q?4swm+tmcxVJk2mzL8fA9hYn0FiGFT965vlw+s0ePMe2MWBsP1c34ozxv7P4V?=
 =?us-ascii?Q?UerBxb1RCNeaobTTolhhK7tl/I84YhjA3tdowGdlgBBAzBWvZTLWrOnzLVKA?=
 =?us-ascii?Q?SKTXNNE+bxm0zdjF+5IxH5WOpH+I3zRR39dbKEID?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4456d309-b9d8-4b66-9267-08dce0f829ea
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 02:32:44.0991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXS9R//SlpPf68JGWjDyVsd2INGFut0sNNg/gZLuVnMg2YGgkSsfay45BDGKlt32bVFV4OV2wIx322iugZTSxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5319
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Fixed some confusing typos that were currently identified with codespell,
the details are as follows:

-in the code comments:
drivers/ps3/ps3-lpm.c:94: rigths ==> rights
drivers/ps3/ps3-sys-manager.c:365: acnowledge ==> acknowledge
drivers/ps3/ps3-vuart.c:470: remaning ==> remaining
drivers/ps3/ps3-vuart.c:471: transmision ==> transmission
drivers/ps3/sys-manager-core.c:15: Staticly ==> Statically

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/ps3/ps3-lpm.c          | 2 +-
 drivers/ps3/ps3-sys-manager.c  | 2 +-
 drivers/ps3/ps3-vuart.c        | 4 ++--
 drivers/ps3/sys-manager-core.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/ps3/ps3-lpm.c b/drivers/ps3/ps3-lpm.c
index 200ad8751860..188ae2572674 100644
--- a/drivers/ps3/ps3-lpm.c
+++ b/drivers/ps3/ps3-lpm.c
@@ -91,7 +91,7 @@ struct ps3_lpm_shadow_regs {
  * struct ps3_lpm_priv - Private lpm device data.
  *
  * @open: An atomic variable indicating the lpm driver has been opened.
- * @rights: The lpm rigths granted by the system policy module.  A logical
+ * @rights: The lpm rights granted by the system policy module.  A logical
  *  OR of enum ps3_lpm_rights.
  * @node_id: The node id of a BE processor whose performance monitor this
  *  lpar has the right to use.
diff --git a/drivers/ps3/ps3-sys-manager.c b/drivers/ps3/ps3-sys-manager.c
index ad8ef59dea34..ab798b52910e 100644
--- a/drivers/ps3/ps3-sys-manager.c
+++ b/drivers/ps3/ps3-sys-manager.c
@@ -362,7 +362,7 @@ static int ps3_sys_manager_send_request_shutdown(
  * ps3_sys_manager_send_response - Send a 'response' to the system manager.
  * @status: zero = success, others fail.
  *
- * The guest sends this message to the system manager to acnowledge success or
+ * The guest sends this message to the system manager to acknowledge success or
  * failure of a command sent by the system manager.
  */
 
diff --git a/drivers/ps3/ps3-vuart.c b/drivers/ps3/ps3-vuart.c
index 6328abd51ffa..5cb92535a4a1 100644
--- a/drivers/ps3/ps3-vuart.c
+++ b/drivers/ps3/ps3-vuart.c
@@ -467,8 +467,8 @@ struct list_buffer {
  *
  * If the port is idle on entry as much of the incoming data is written to
  * the port as the port will accept.  Otherwise a list buffer is created
- * and any remaning incoming data is copied to that buffer.  The buffer is
- * then enqueued for transmision via the transmit interrupt.
+ * and any remaining incoming data is copied to that buffer.  The buffer is
+ * then enqueued for transmission via the transmit interrupt.
  */
 
 int ps3_vuart_write(struct ps3_system_bus_device *dev, const void *buf,
diff --git a/drivers/ps3/sys-manager-core.c b/drivers/ps3/sys-manager-core.c
index e061b7d0632b..f50032ad9702 100644
--- a/drivers/ps3/sys-manager-core.c
+++ b/drivers/ps3/sys-manager-core.c
@@ -12,7 +12,7 @@
 #include <asm/ps3.h>
 
 /**
- * Staticly linked routines that allow late binding of a loaded sys-manager
+ * Statically linked routines that allow late binding of a loaded sys-manager
  * module.
  */
 
-- 
2.17.1


