Return-Path: <linuxppc-dev+bounces-15088-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0584CCE6467
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Dec 2025 10:01:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfqvl2d1zz2xpg;
	Mon, 29 Dec 2025 20:01:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.130.21 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766998883;
	cv=pass; b=Wtjukte2znOyECTHaaLdyFEEHGZx5miRr9WNXjUprnxiQdkn+nERh2EcKcGtCHl9ddrKtO8dwqNSYZF3OZl5hdSoO+5DBSe0aEmkJZrCatqUbWKbL9IgUtsV3unJ6AeiuiMOo4YOHKFeDA9U6mpw0mO10ZWg+MpAue5LeaPEBd3q1b7UJjFw1M77BuPCGRBpmCmW516hqGLrtjex0NkqoudlmPYqGibzoJilg4VYLUFxKDAYeMllUJH0Jm4VyMroLbDkHOjrXJSu2q+Yx+x8OcTs2bRDL73BLj3Sq/BpYyY3Orc4kwjegpGROhEWYAzKWIJUBu3IKFBiFdoFmxzGCg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766998883; c=relaxed/relaxed;
	bh=LjAHruMCX4Pr0sK+SyUXmoycalDXDWRMIsKbhqSOIgc=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JDSWzETggcy43SNM6wDCwxTGBdueTn01bCR68ntfGZ11A7t/Trr1D7S2Ofh4rD5v8vhg9boW1wN70LdDteowM9XXx3haE7+JRXE3GTWnvzuDnWovpwkiiwDt0GJd8pEo+hasIhoWlqIIB9ezWibwmnu2CYEkpZQSu89ARu1mWUJG3hlgwby4Q6kYptV4Hm+8fzdeX4REv4z1/9XUIddBzScah7fkBuEK7nLP+u/fIXGOBeK8a57bn+YmaPsz2R9qGYFJuB950F0HWsXZC4yhS8FsHJCJRwcyg8Pzg20QbpaYtUZOtdV/0jPcu/+RvjTNKutk41PJtdvzBv67bCyeIA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ce0WLqbn; dkim-atps=neutral; spf=pass (client-ip=40.107.130.21; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ce0WLqbn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.130.21; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011021.outbound.protection.outlook.com [40.107.130.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfqvj2mQVz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Dec 2025 20:01:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9l6znVuBcluoT3WZZbfxhJBPl+Cp90gcDrGJ8H48SPpcJJR414dOBj2zyEbd5vAkxO0HjQ2MC80l++hafkyMiReSZrWeEJUmNSxX0oeXhK7v1u+5Gz70FJA4RwUOKcToN582XlFqzkgvLq9Czp9Rlv1/AplYxSyxFXzvTr8IZkYaUtKQtGFAQM2m3E61G3FjgmNdahW3QXfp+LcOwwa3YF4ETDYrLl3J0/1mFGMnP4aM9ZVBLk/Wi3Z0MpbSk7AIVud56hfKxorJxXObQc4TGYBu9RLch2SiRhT5tPY9elH8/uq8bsmZwC2a1NQ0LQOFsNpiFPTWSNKpWRd2w8TFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjAHruMCX4Pr0sK+SyUXmoycalDXDWRMIsKbhqSOIgc=;
 b=QfMuImpVgzNUtRdmVwSrJXCW/8f1dVKwt7xdMrn4ZMrEMVHvEMDoMIs6Q0tB5MfLpEi8GRG35atNp7hxffL2cbkfmqmg8SntEzWlNfn0jpVXKskNt/EPmLCu3+1HKN/Yn1gkoBcWzzzeSbcW9pJHrBcteshI2YAG6uSLPIeLjSkHBcKSfbo+N4wxK6zJR76if7JGVFNSgIf0d2u3/iEELISoeX618IP0LnhuoWRIdHKC8mQ+mVcl70J19CJr0a3xDAbFwf9L0LNpL4mqIAT4UAO2mzxKFgVgaIWO7FN8N9uaiZbFtJsWXYwUn0GXUIF/2ryrmngh8RXzcMKqG1NyOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjAHruMCX4Pr0sK+SyUXmoycalDXDWRMIsKbhqSOIgc=;
 b=ce0WLqbn5MytZKzaD7AmY7BtFHHTXl6IQPXlrRAAPWZKifP45ga/Ojx/GgVLh+DI79ZZ8n5OihrOLMRTfhWna9yWUsQYnvHpOB5lOwpTaJ2QhuuSbwYzrXO85FcHkaOOoUSbHKPIlD1W7jeDMlDUAMnD06KCK59LD2CNBCrzzECLyRHXYkVmUCXpGZhvpPf6k4JVQwzn/H/Z2sfvZWmjkg2hhtqUYPt5ZIKRAyaFh/Bkf80fL81oLkAP7D+T/j4kulLh1Slh9+UyBW3/hdxoPu+uCC+WEobHq0o8nKTwHzIflLJ3dYMua/44B4VtACN4ZL7ugZqCjpqDzXeagTKKrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8270.eurprd04.prod.outlook.com (2603:10a6:102:1c7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 09:00:39 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 09:00:39 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_easrc: force cast 'val1' to u32 for do_div()
Date: Mon, 29 Dec 2025 16:59:19 +0800
Message-Id: <20251229085919.3952347-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: addc720c-c894-47e4-c253-08de46b8bcd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|52116014|366016|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GeFcP1nLKUN88Lju3oxX5TiQVhOV2RkKUpt3kYZaAg+8DoAOjdDwJMVi9WeQ?=
 =?us-ascii?Q?M9a4gFL5WhT30wP+vAniaaSyw3W3N8FEposyUSHLZNZB7Z1uAqfRfjrXl0En?=
 =?us-ascii?Q?w5vC41ZwStAE3cUV098oBe7SAphhdZdBX41EqHeIGQupVozdoPRaE6GBoGQg?=
 =?us-ascii?Q?osy9bUhR+qjabMvytXKr4Ojt+lIXOqXQrqeWSEehbOh/U3IPTYl10R/JFCng?=
 =?us-ascii?Q?hN0BJGU8Rhcx3kWPI5R9hgQSUYc3PMnNn2SWuJilobPqy7Jm6dyj0cuFmMpr?=
 =?us-ascii?Q?if3LwPVSalOTdDJ3P+hBczDp9bDSNeQ6sWO58OqDgEs1X9eLH3Wwov/B0dL0?=
 =?us-ascii?Q?GEvWGMd9XjegwXvx+HsV+c91wJxvfncbtPpFLABKYbYMRRjGNjDiKvf6TWNQ?=
 =?us-ascii?Q?zyQd6C882pemlmgYX3RDZ78gtE6Rs+mYipaQyzcmz2e/VVAd0G9agUUBQ763?=
 =?us-ascii?Q?msBnQiQawcPaG+AHQL7DNDQU1UFOMtEU3BTtnrof6CIMU3b/XcK54a6W7+9I?=
 =?us-ascii?Q?9+UmaAZ69grQ/Q4PeFwZKPUYW4/dUvm3I1eoW/MLvncG/RqxzDOl5uHSDT1x?=
 =?us-ascii?Q?PSXxZq/UHtReF2A30/T2KqanuDKQ4UaPSiEa326hApDkDmbqQtw86IdNVWGn?=
 =?us-ascii?Q?1nWG1ad9RpHsDmj0MIHb9nB+YOQ50k9zuD6eTVdizNVxjukRxoeuJWcKTk3f?=
 =?us-ascii?Q?JwOVEgnzsmufpPXumJn1ECsyuxXvFfHiLM+PMJbJJllrPs/MqBAeyUC/Etbn?=
 =?us-ascii?Q?wQAIDY9FGxwDihrY1AMw4ZPu3pp0Se/cIAvbBkPbeiqDmoJuRPZ6hS64EEWV?=
 =?us-ascii?Q?1Z8o5i1h9yqK6OetCWv/lKICQA91VCWCISYF2AEFZIItX6TLy2RuQlIWkpKT?=
 =?us-ascii?Q?6kTaiNsxSk5T3XoE3zemXaSNih6cXjuneGpZDrzv7s0NmtHGaDkuJ4RDC8P/?=
 =?us-ascii?Q?hchHR5ZdpY95qLSqWfTfj7gMNsQB/Z3yt+tRvL1Yu9v4ZHSPkt/jglERkbqQ?=
 =?us-ascii?Q?B1enFOhA88/i7PLMobkuLHYqO8zz7kLnlnVL+J07gYCzUitzSygT4f3uARSl?=
 =?us-ascii?Q?UGPSU9TWXROtu7BU2qw1QMYaebowkPfwKWpiF+JnbMPs9C/3UbWc+Nk93lU4?=
 =?us-ascii?Q?cEJhBhFvwYMOgiIgEPeXyx79wOe1Ozsp0f5gt1WJ9YeXReS/m4mFmk0Mx77p?=
 =?us-ascii?Q?iSVDf5THerk13US6spb1Z09d+7EVK3cW4vubmsbsQVBegwZYlkas01HsD5hc?=
 =?us-ascii?Q?fuoY7rN3H4IGEtN30D0VYaLI5I4YR7T0Z+LJ5NLHeaIT8ToGOIO0B6rJ1Xpe?=
 =?us-ascii?Q?haKgAPuUr79856MHKsaZivL3ZAFis3EtGXMaq9Cl6Ex3iWE3413KSDWKgb8i?=
 =?us-ascii?Q?0meb/vwXRBEyEExyDN8b0BHVaPsbXOIPUKlu8mesYER09iUAaUgp+q/SW4zX?=
 =?us-ascii?Q?PrhID3Aec1A5RyIJ2xbVSHLfVR6sbTwNgrwVVMN46cHVn+VAOXSUSKE10BVu?=
 =?us-ascii?Q?FyHeIRwb0cJoOOOdW1kqe2COIPs+YD/IPqTlPCzBIZ67vKD9uLX8nuOkQQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(366016)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wf9Kd8cSS9jAsOjPQcqOeVetRQ0WTKOUd0wokzo16+7vTsXgjo5iqSFshkDk?=
 =?us-ascii?Q?CL7oSpeNyrfCOgIBKPHReP9GkUbTz3Y1C6RuwF/7R530m5C7kWfjRbP1TXtl?=
 =?us-ascii?Q?rqN9IShjl8wESDzFeKAnO5oijVf5UBmqGgHdJtCcLzN/c8ZG0ycA69Dg6MQr?=
 =?us-ascii?Q?b7gEHH5XzGghSZ51Qh2/P7EHc7iAZR5ynWgbgWOcuzK6LzLV4oKW0oqVpULe?=
 =?us-ascii?Q?/ERcmlae1o2EeXrh340APn0oUc9TMRByfeGLlisFBNOMdgEx5STZ9Yq4Km3/?=
 =?us-ascii?Q?ixekCuEn2vfmTYsxKKzzDAGTOs5a1pAejKTk0MZqZ8jXALaUcXXc0xSAXg31?=
 =?us-ascii?Q?QxNW7hEZmxM0J5a7gZhqJ9ejK6h29WQEb+0nMfERM+EnqR4uGnUcTXEatnoL?=
 =?us-ascii?Q?eegjvS0DKtr01q0JV/xqjVZvTzdWnZoglR08dcr2YfIGDtqHChwXy6y53olr?=
 =?us-ascii?Q?4bfBuFa5QPuAe4Ffzsk8alkO/ewRqzo3x+yS2EuY+Ri/JgqGlM9ppsNfmVfo?=
 =?us-ascii?Q?3bpG9gNnkFaN9UfMJbZzNGPrjIZS9XyNvVpYJ/zPrJZ3y26upxoSpaaqCFW3?=
 =?us-ascii?Q?qyofucPg2bK+GjvYwmmT56i7Y6G0DpMEbIyvfBP1Flyp8Vy0OM7HHIvN73J2?=
 =?us-ascii?Q?Y6VcPZXp4Nv53D3SD29En60tb4w8v0d3injqatZQ2CHgCu6pI0cXIwIzaYox?=
 =?us-ascii?Q?BmZYAD6BX3/tu8WrUiZRsoA6V2C3VzAT6pNWfKAEu1EnvBUxyD7HaU3qlz1f?=
 =?us-ascii?Q?sgq4IJ9aKAFGsprslBgV86lYs1u+ctpeZWxE7lYxXe7GFXCwKcl3vbK6VIF3?=
 =?us-ascii?Q?452BoTOsYlB0mRtEc9+bTx0HGdS3X21H5etaRogipBzRcPooHgnrFwjQUaKc?=
 =?us-ascii?Q?5rV/cu0kt+jfrQV4Oqh6IRR4BXw95VVrvnKDpjFINGOeldPJoIoy0JK0I2LX?=
 =?us-ascii?Q?VGJU+787ih4pIobZVde0gqP+Dr12WT6I/LWVmDiMmtuwRHAC0plAGuGA2gf6?=
 =?us-ascii?Q?lPmwqln3QwvlEXyqarXSpJdB7hljiicOrTRz2ENzCv3lC3lY2dJteHV6sEn1?=
 =?us-ascii?Q?2gL8fucjuONmmKJFmEepxnqXn0id8ad+x09AMEVcol6Y9YAgjYyQMgYLZb/i?=
 =?us-ascii?Q?NxZkubQuVPW0QGo06dg51P4puOsg+Jn3Tcrxn9dfsScHXTcMvjK3q0XXG6hN?=
 =?us-ascii?Q?cfscifikIoqqJZnLL58KEaRO8cZmA/BZjYLY3W7Km98mngdFzuw3VI/qLDM8?=
 =?us-ascii?Q?+PF9I9/bhcAr/PI93yqPX6xX5rj5ASDc0VHuSH9rXPC2O1AxjIM52hQW7WUk?=
 =?us-ascii?Q?a1RSrT+P6o61VL0XU3fCrL0NC/lcQJwCCn4mLCg/R21YaCh7GvtJKE7bPBNE?=
 =?us-ascii?Q?INhDa73VdK167dgEbHqCVazwK2D8+JNCipmk0GHWAVv96rJDohPH2k++mkyB?=
 =?us-ascii?Q?pm/d3vXHBmzcOpg7XbhVFlUOTd4b1vsLjKMclc/vO6jUgdepaXNiNnG4NW7V?=
 =?us-ascii?Q?pLMNe/3OatFCGUYIp+K/xwc1YuultZO3QdGk1ZNWQvvUKb4ialEF6cW30f+r?=
 =?us-ascii?Q?WB0uPQVkl6/HgCrQ0K79W4USClA+i1GfbOzZb4EMHFwpJ3TjAZYaN/DE5Rsz?=
 =?us-ascii?Q?lbxtaJnCVa2ixEfqSYjcFzpvg9ueovs3WQr7iPcdLuucU9YG2Oejipn/GWX8?=
 =?us-ascii?Q?J9gaNw4QC26EL5MKj9mUThs8EmRi2uG6aSzATkHuwHQnOD5+/UeQk90u3wLj?=
 =?us-ascii?Q?6OipXD1SKA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: addc720c-c894-47e4-c253-08de46b8bcd2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 09:00:39.2145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQVj1zlB8YTggyukkbWsEMx3SGyVzJ24oTO5zXu6SD7BA0o4TUYyByxde81dlKLlQs64RqL4eyEg0RK3NBHXTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8270
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix below cocci warnings, the real width of val1 is 32bit, so use force
cast to avoid warning.

cocci warnings: (new ones prefixed by >>)
>> sound/soc/fsl/fsl_easrc.c:1999:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Fixes: 27147695aaf7 ("ASoC: fsl_easrc: define functions for memory to memory usage")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512281902.bPsKjjkC-lkp@intel.com/
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_easrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index f404a39009e1..16a45a7146e8 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1996,7 +1996,7 @@ static int fsl_easrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buff
 		/* right shift 12 bit to make ratio in 32bit space */
 		val2 = (u64)in_samples << (frac_bits - 12);
 		val1 = val1 >> 12;
-		do_div(val2, val1);
+		do_div(val2, (u32)val1);
 		out_samples = val2;
 
 		out_length = out_samples * out_width * channels;
-- 
2.34.1


