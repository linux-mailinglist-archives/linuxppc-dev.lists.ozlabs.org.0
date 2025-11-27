Return-Path: <linuxppc-dev+bounces-14512-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C551C8CA88
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 03:28:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dH0hQ26h0z30VL;
	Thu, 27 Nov 2025 13:27:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764210470;
	cv=pass; b=DGhSSi+X2E0ZHApZ52PjWZMhRvjLVFDTtK8ScGHKdRHWtStzKzF8pdxvMr25JlnFYoiYfwinw6SarYJ9Yl6P3/eREYPCtl1YuBAD8WK89/JZ9MLwPTNwrsD3H6c0ZCUDkpWSVKVAXOLCtYg9M8zMtw2r6YxDhaBzUxsZl+shw93qhBmandy7W8Dergy9Cl58R3W4C+u8IbA8GZ5YLCRljcuVQwD/2Ht4bCqGtdXwMXHpC7Dta+T/daUSbnDz14Yt4NkA0rmSp1HVLAayxjK664OhidsMW6BQMAHxDYvwPiGH/PArUf5rsFSytSk0/1nPzCMZtBHTmkkNJNeiLCFe5A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764210470; c=relaxed/relaxed;
	bh=A9Qtz5QpN8Jpc93McX+sabP6q4Yne0ZCipv53jf47ms=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f03yRmrvU9ggYGaxo9tI8h9xbMf0H3CpnU1meUCX5yomeBxFRzPXIm6sXUGybZ+dSNkiPK/dblnjC18uDHpqvWBQoFevx/avAqTUDOXxRKywD+nQqQGX/cmaJRTs539XX/Xcy8LKabB+MqonQDwjhqv2g01SVoMes6D7mHFv97mTtd/fHEtw6OGNh1NeOJQcqf7oTr/j2+mOk+Tk0PyqjKeQUdQZ+rLJeJ69CbUbGwGQVPOEkOCD08IKNPml2urGdWPWJE7bQ2wSAM+d7K1WvTjj8OdvmkemRWujHhTXauwz8USUi+bMtB6hEJMM2jMWekSLmAzJxdntnX7+5Vc01g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Glxzd/pa; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Glxzd/pa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dH0hP0hFqz30TY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 13:27:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obfqaDB3Kbcc9Kn6YXOxGT7Q4qQTzLAHo+FPkH8uAgLF9Huhk4FA8OhAz975Ry/7Hq/gW7O4AODmMAryvuzXdkJs1/JzNyuPWX+GaktUaqvC+uFDBOcgTJJvvrbgLqLj1XUcBIczDUmoT7U/EyiAeJ0wQsFnNnnWOIQuSKapGAfSrmULm9DGsf5ZxtvYaH5LeCgnsohXb+Zrh0SM1LjXkNWiYFebdoYvYEhAV2uaLfEXOuIR/ktvph+SYy4DPFlmhwhJVvPfSwFkhxomfXkDsEEiOkCawHe/KPwwySSYKtn1mfWsiYfPsC0Sorul7QuzXXWt3E4Bcz1EZX3eO83H8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9Qtz5QpN8Jpc93McX+sabP6q4Yne0ZCipv53jf47ms=;
 b=TVG+FF3WRjxnCwpv3QOaxXGFf/7opUS3rTRUI0Ano6iNjVPrLeXFRqs2TAtuY82cPM38qFsY30n4nUafwi3RTan7uxmNqHmoNR0jCpyd4MhgLkawHeuK/aToCZBgLSKHzBlM9CUNJsQvTMpGShE+7f8/IzpcLZ7Sr/F+0H3RemGLkg4IR3yYvUx0tuI/NSwiCKKLxud2STgerGNB8oIK4SPsH69sGinMIBOLSKJ0OtXvyQmlbDHFgldJuYdIIjYKs2UaIHxtR0Q2d0/oDXCcxOa4NF+u8FA17zMCGe/xJvFGEgyoi/cdUngCRsUf5jT8mwQrfPd17mAti24NtvY6UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9Qtz5QpN8Jpc93McX+sabP6q4Yne0ZCipv53jf47ms=;
 b=Glxzd/pa1hKtE0LtcN/3CHE6NqOgZGJom4FQAE9cLf9BoQR3ka0FWsZW+BawqLFbS0lU3CiQWSlBg8CBDYCnjCAAOB8RA2Vf+1WhFxeuGeIcFX2IWqGbr2RI33vAb+cNLrUfjqpVURDds13TnrjkwyCBkimgcoqWmT5/sdturhgGoYLrplGwtMZPEHouKYMvXVmbumERu1OkH731lsyhRzmtkw+rG28QF7WxDWpvKSo29liwDrfk+UeLaGi81Vsb1JIHHfue6caRZ2U3of+c+WKtKiCvZcgx5bpdx9obUWxjY2y16tDve9C/UJicUBQrAamVxKsSCzlp/Laahj+Dmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by DU2PR04MB8757.eurprd04.prod.outlook.com (2603:10a6:10:2e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 02:27:24 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 02:27:24 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: fsl_micfil: Set channel range control
Date: Thu, 27 Nov 2025 11:26:52 +0900
Message-ID: <20251127022652.674574-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251127022652.674574-1-chancel.liu@nxp.com>
References: <20251127022652.674574-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0050.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:115::13) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|DU2PR04MB8757:EE_
X-MS-Office365-Filtering-Correlation-Id: ea80958f-f281-4d49-14ae-08de2d5c8007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6VepNSp80JR6WXGWVd7UiGXpq2TWAvNBQ075KZKQQy3BecMTO0s8OYIGZtKO?=
 =?us-ascii?Q?gsN2TjBHL3GvbSUwj5uEB7JJqUrkRd3fWKZk3zFD9PqgbM+y06hMqb3ETCPx?=
 =?us-ascii?Q?NSXMq0cBrzI8+qKrtrmnII7FiEcyGVmRULGJiMbujQ9fasA72xC6ZuANbaep?=
 =?us-ascii?Q?0EmMsAp0AoFFKyWAlfKKlRfGhswDIwZD361tckJD9nCoNa9TDZaC0L4XVOdx?=
 =?us-ascii?Q?kTs3Pudz+d5RsLNetNz2JMVYrdwg0xYHyIhq6t4K+iWslSlGcfpeZ7qIKruJ?=
 =?us-ascii?Q?iZ7T7MrT5xF4OEE8bVhH4taPa7OR2fB3RCIx0SU5pNbBBnpcS2uI8U0Xu0UV?=
 =?us-ascii?Q?m7uBQPrPt/veW24zteCFFr/9HQSPzc7SUjviNXKrHp87YjMdq/Ocvt1qXNtV?=
 =?us-ascii?Q?mSpxOMOS2WesAqBjCsNStItlBDnqtspxFPRX3tvBx9fB4hsASUwJ+hAlN5u0?=
 =?us-ascii?Q?+74XZuEDzqy6z4EDMvhuboYYfZuFV50F6+FZJyNjQBQVpw5Crgqgb06M4DZ5?=
 =?us-ascii?Q?P2qPBpQxEv9nDMlVhvxYmeyFqNZ+caerEUwDMOc82+eP7kkMLU3/UdQcPTiO?=
 =?us-ascii?Q?MJR8qbf7lvASScWaHoUlTBaiiddC1GIbyCaXXPOOkvyweJhlONyi/DA9fBlS?=
 =?us-ascii?Q?Orut+faF8j/ngfGQixGhIXQxrTzatWHQkQvPh/ZhkNArFkJPkq6XicFPXnYN?=
 =?us-ascii?Q?8QdUigcQRwyKZJo1laq77CQrbrwnuK1KvNSjRr/6TzbFm9Ww4MpoXK67+Sxi?=
 =?us-ascii?Q?OhCPfHY0ZEu4o6LjpVcEALYT2jFytPAKErUTy4A3IPY4yhWkFpHm3KTe2K5z?=
 =?us-ascii?Q?UpdZ/KXMBYJ6JsveRGtrt0a9lYRzcMFf9Y6cn9zvWK9qT1JJCZdtCityLhpV?=
 =?us-ascii?Q?PA7syaEX3jqtLoIUJFS344SkyKzdu3iXpUFhFiD4W9FEyG8Wtrpq5QxPz7c3?=
 =?us-ascii?Q?PqFjaLmmEtFYJXqegAqIEsofTsmcAQKJeWF0lmKHyLFNNl8HrcSAoifETkBV?=
 =?us-ascii?Q?MFajkN7LIN2yHdSEh4SLblnf0sPnRtqfos9L0w+kCQ/9p1McHVApJa/v2UGz?=
 =?us-ascii?Q?eiohibpm/Hn8HdzI+q/YI6h9+rjjIbKuM6SOGzXLN91VPaU4+BSfp0oSFbDb?=
 =?us-ascii?Q?J4Z9UEbCuEAp8glczzjrOpEBo0qgsB5Z0R5Ibnsupn+9YcLaNVgpV937N+s0?=
 =?us-ascii?Q?HdkkLrH22e39Uz1s/Ep3lloS7vyOfcHQ3EUwN2bxjrIKuzA/KuHtTjb2fEW2?=
 =?us-ascii?Q?Be2//harg1P6EudIhGhxGN7Ujsjvo4y8hVMCt8y/2MW+IbmSIsf0VduWSpWJ?=
 =?us-ascii?Q?D4XS8jSedTQojoP0CatJYFhsYZXfJuMwvK3mLIqotxMg8Q3CEgneFRFCrPK/?=
 =?us-ascii?Q?X6IVhqwQEShBte8leexu3jbL2dFb7ie3jkkPATrJcV9lbKEwqD/IQZj0V43L?=
 =?us-ascii?Q?V9OF0ynJqM2Kwuk133onIFh6n+pBMGMpePDxJBRdImfC/CZu5A5VdHXuS6Oh?=
 =?us-ascii?Q?Q/yHUPGhGr5P91CeXdZvSBmhKEBfBtSuVMRqLfHr0qLT5gP9n85DtThP8A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K/lhur5qIeVlW5Rt4FZBawbexuZ+vbrBfnkZuf8vJMOf/+5EHmQ9QXD77ru4?=
 =?us-ascii?Q?esdLQl3Tsn2aZ1zH9k4tpxFIGN/fSqZJgpQLkQOBuTbgXTZVb38xUCt7CNjz?=
 =?us-ascii?Q?JWfavPblosOEbs169zJfEdT+wwU1a/kyORgyk+rNDqptN5PA+pvKYNsFIsvj?=
 =?us-ascii?Q?fKqpq6dOiFOhKLuBxWccjm7x8WLy+ZjoYsBWu61C41A6RfCCec4SG+BNEV7j?=
 =?us-ascii?Q?0pqSt8XLqss09F26a0En6PeqqpL+CwpMnvzaSxSgHrRUjrxuefPq09IqBE16?=
 =?us-ascii?Q?uyJ4omIPMCw9kytDMc4WhOTxfQPrvMd3udRSjTOmIb9aaJgilYoENeoODn+/?=
 =?us-ascii?Q?2sukhE16+w7qUgrRlP34WpOGWpNY2d9qXLCf+Xb/Wx7hpU71Or6PA2wYoBvL?=
 =?us-ascii?Q?gwGzLf/eQa5eZFV/c4NTubyuP1YIMcqLcNnn2PseI8q6BNt2igccRbFs7mhM?=
 =?us-ascii?Q?IBNojY1jTayEmun/8ZANh/0Ezi1TEALnJ25UFzQo4P6CSSkG2tMPVcqLna56?=
 =?us-ascii?Q?pOz+EXvK5xdZuRUTd5E1+LwAlr/C4/rmimmy4IszDh162qJq113iIdyM2og1?=
 =?us-ascii?Q?Gt5EpjLskVfTZzXLkJimjeJnXVgOG+xthxy7FYN+RkzRlEMsaKuLSccm3zl6?=
 =?us-ascii?Q?hanZoITIIxrv3xS/2wlxNEQ6U4ZuxzOo8uZ3ODdELSTnzXbvqF2z5/rHoABr?=
 =?us-ascii?Q?MMwvFz254UKOCCinm9zwCxu5hLtk7fAu7cVweU+qvwE4taOL7cYmDtOGWED5?=
 =?us-ascii?Q?FYID8AHPg0OvK58C1nxbdJla+LrT5CrmYh5BUeh8k1n2EweHXQvMQ1Orv+HO?=
 =?us-ascii?Q?6T25GXv6fWoAoTlTgttzY6Mhg2d+m7n/rJwFXX6TsiJfRaYHps1gV+lX8uXp?=
 =?us-ascii?Q?yzKPKcFeDMAHCPdH1SS4wi4kCINMHKuxThCRLqOAQlvYDL5c6Dmo7tvwejNo?=
 =?us-ascii?Q?u+eGJYni5txiL0kcGmwAtWswgWMNHPqfItLJnYMM4gl2k/OphV0sh5PseWZg?=
 =?us-ascii?Q?QivAKNdAtP7okFMpuoDdKpa0J9GrRv3QP+iA8dR95KuHnzjHhe54nK7YHFqR?=
 =?us-ascii?Q?WULj1hhTSjBUC9r+CA4+m5blNYsfVVSX4AVhYBGeur9Ym34SLAlHObYz/v1N?=
 =?us-ascii?Q?rYSQpHfytopfsl24LPXuCimq20GwJP6flGS3T5rkXmdSmO76vm4kSBqkVnNu?=
 =?us-ascii?Q?n0nJFprWDVySJETj7YEGmmex5ywZksIR8LLdb1zp2uycWZcFC4P00TpYZUOB?=
 =?us-ascii?Q?+e54zmCKRcv82WzjIMb/DpDxLIXAj5uKFrCQK3yVjH/H6H6U3fsHeVpTFplp?=
 =?us-ascii?Q?DSCcCtTVPJcR7IM+DxoLYgBw/u9khQlJXI3ibFJVWoRFCj8Fcg0/lTUD9vps?=
 =?us-ascii?Q?fYB4XxTOi2T5en9V24nou98sfNICkMxUdcBl6l4gVtEjylbiVxj48ryJOiIM?=
 =?us-ascii?Q?rhbnNAOfcLxxkG8+eW3+lEHZ6peNJmcjU9762aZSE4iH0BbA9vsr3SW28nzy?=
 =?us-ascii?Q?3JgbGzEJxsVjhWnlW19kDz+nsy0HNYOCX6ZvZpg4znXgJdxuzc0x24fPWszy?=
 =?us-ascii?Q?++pgUUaI6V1D5TOHaObLy8Ovqu3Mnj9gFes82hNK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea80958f-f281-4d49-14ae-08de2d5c8007
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 02:27:24.2794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsnGjdOUkAe3ztS6SuAJU3fVhnMiWQNpDepEOhrlWlD5Q/hUm0vKrX334fLuiPqs6NmvZUWsSpIeIYoTS+ZEZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8757
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The range control register can't directly adjust volume gain according
to specification. It's the dynamic range of the CIC filter. The range
value should meet some conditions otherwise the channel data is not
reliable. Add an array in soc data to store const value in formula
with which range with all quality on different platforms can be
calculated. If the value set to range control exceeds the max range
there'll be warning logs.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 125 ++++++++++++++++++++++++++++++-------
 1 file changed, 103 insertions(+), 22 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 86678fee7a57..d6cde2757c6d 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -17,6 +17,7 @@
 #include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/dma/imx-dma.h>
+#include <linux/log2.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -93,6 +94,8 @@ struct fsl_micfil_soc_data {
 	u64  formats;
 	int  fifo_offset;
 	enum quality default_quality;
+	/* stores const value in formula to calculate range */
+	int rangeadj_const[3][2];
 };
 
 static struct fsl_micfil_soc_data fsl_micfil_imx8mm = {
@@ -115,6 +118,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mp = {
 	.volume_sx = false,
 	.fifo_offset = 0,
 	.default_quality = QUALITY_MEDIUM,
+	.rangeadj_const = {{27, 7}, {27, 7}, {26, 7}},
 };
 
 static struct fsl_micfil_soc_data fsl_micfil_imx93 = {
@@ -128,6 +132,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx93 = {
 	.volume_sx = false,
 	.fifo_offset = 0,
 	.default_quality = QUALITY_MEDIUM,
+	.rangeadj_const = {{30, 6}, {30, 6}, {29, 6}},
 };
 
 static struct fsl_micfil_soc_data fsl_micfil_imx943 = {
@@ -141,6 +146,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx943 = {
 	.volume_sx = false,
 	.fifo_offset = -4,
 	.default_quality = QUALITY_MEDIUM,
+	.rangeadj_const = {{34, 6}, {34, 6}, {33, 6}},
 };
 
 static const struct of_device_id fsl_micfil_dt_ids[] = {
@@ -167,9 +173,69 @@ static const struct soc_enum fsl_micfil_quality_enum =
 
 static DECLARE_TLV_DB_SCALE(gain_tlv, 0, 100, 0);
 
+static int micfil_get_max_range(struct fsl_micfil *micfil)
+{
+	int max_range;
+
+	switch (micfil->quality) {
+	case QUALITY_HIGH:
+	case QUALITY_VLOW0:
+		max_range = micfil->soc->rangeadj_const[0][0] - micfil->soc->rangeadj_const[0][1] *
+			    ilog2(2 * MICFIL_OSR_DEFAULT);
+		break;
+	case QUALITY_MEDIUM:
+	case QUALITY_VLOW1:
+		max_range = micfil->soc->rangeadj_const[1][0] - micfil->soc->rangeadj_const[1][1] *
+			    ilog2(MICFIL_OSR_DEFAULT);
+		break;
+	case QUALITY_LOW:
+	case QUALITY_VLOW2:
+		max_range = micfil->soc->rangeadj_const[2][0] - micfil->soc->rangeadj_const[2][1] *
+			    ilog2(MICFIL_OSR_DEFAULT);
+		break;
+	default:
+		return 0;
+	}
+	max_range = max_range < 0 ? 0 : max_range;
+
+	return max_range;
+}
+
+static int micfil_range_set(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
+	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(cmpnt);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int shift = mc->shift;
+	int max_range, new_range;
+
+	new_range = ucontrol->value.integer.value[0];
+	max_range = micfil_get_max_range(micfil);
+	if (new_range > max_range)
+		dev_warn(&micfil->pdev->dev, "range makes channel %d data unreliable\n", shift / 4);
+
+	regmap_update_bits(micfil->regmap, REG_MICFIL_OUT_CTRL, 0xF << shift, new_range << shift);
+
+	return 0;
+}
+
 static int micfil_set_quality(struct fsl_micfil *micfil)
 {
-	u32 qsel;
+	int range, max_range;
+	u32 qsel, val;
+	int i;
+
+	if (!micfil->soc->volume_sx) {
+		regmap_read(micfil->regmap, REG_MICFIL_OUT_CTRL, &val);
+		max_range = micfil_get_max_range(micfil);
+		for (i = 0; i < micfil->soc->fifos; i++) {
+			range = (val >> MICFIL_OUTGAIN_CHX_SHIFT(i)) & 0xF;
+			if (range > max_range)
+				dev_warn(&micfil->pdev->dev, "please reset channel %d range\n", i);
+		}
+	}
 
 	switch (micfil->quality) {
 	case QUALITY_HIGH:
@@ -367,23 +433,31 @@ static int hwvad_detected(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static const struct snd_kcontrol_new fsl_micfil_volume_controls[] = {
-	SOC_SINGLE_TLV("CH0 Volume", REG_MICFIL_OUT_CTRL,
-		       MICFIL_OUTGAIN_CHX_SHIFT(0), 0xF, 0, gain_tlv),
-	SOC_SINGLE_TLV("CH1 Volume", REG_MICFIL_OUT_CTRL,
-		       MICFIL_OUTGAIN_CHX_SHIFT(1), 0xF, 0, gain_tlv),
-	SOC_SINGLE_TLV("CH2 Volume", REG_MICFIL_OUT_CTRL,
-		       MICFIL_OUTGAIN_CHX_SHIFT(2), 0xF, 0, gain_tlv),
-	SOC_SINGLE_TLV("CH3 Volume", REG_MICFIL_OUT_CTRL,
-		       MICFIL_OUTGAIN_CHX_SHIFT(3), 0xF, 0, gain_tlv),
-	SOC_SINGLE_TLV("CH4 Volume", REG_MICFIL_OUT_CTRL,
-		       MICFIL_OUTGAIN_CHX_SHIFT(4), 0xF, 0, gain_tlv),
-	SOC_SINGLE_TLV("CH5 Volume", REG_MICFIL_OUT_CTRL,
-		       MICFIL_OUTGAIN_CHX_SHIFT(5), 0xF, 0, gain_tlv),
-	SOC_SINGLE_TLV("CH6 Volume", REG_MICFIL_OUT_CTRL,
-		       MICFIL_OUTGAIN_CHX_SHIFT(6), 0xF, 0, gain_tlv),
-	SOC_SINGLE_TLV("CH7 Volume", REG_MICFIL_OUT_CTRL,
-		       MICFIL_OUTGAIN_CHX_SHIFT(7), 0xF, 0, gain_tlv),
+static const struct snd_kcontrol_new fsl_micfil_range_controls[] = {
+	SOC_SINGLE_EXT("CH0 Range", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(0), 0xF, 0,
+		       snd_soc_get_volsw, micfil_range_set),
+	SOC_SINGLE_EXT("CH1 Range", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(1), 0xF, 0,
+		       snd_soc_get_volsw, micfil_range_set),
+	SOC_SINGLE_EXT("CH2 Range", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(2), 0xF, 0,
+		       snd_soc_get_volsw, micfil_range_set),
+	SOC_SINGLE_EXT("CH3 Range", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(3), 0xF, 0,
+		       snd_soc_get_volsw, micfil_range_set),
+	SOC_SINGLE_EXT("CH4 Range", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(4), 0xF, 0,
+		       snd_soc_get_volsw, micfil_range_set),
+	SOC_SINGLE_EXT("CH5 Range", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(5), 0xF, 0,
+		       snd_soc_get_volsw, micfil_range_set),
+	SOC_SINGLE_EXT("CH6 Range", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(6), 0xF, 0,
+		       snd_soc_get_volsw, micfil_range_set),
+	SOC_SINGLE_EXT("CH7 Range", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(7), 0xF, 0,
+		       snd_soc_get_volsw, micfil_range_set),
 };
 
 static const struct snd_kcontrol_new fsl_micfil_volume_sx_controls[] = {
@@ -895,13 +969,20 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 	struct fsl_micfil *micfil = dev_get_drvdata(cpu_dai->dev);
 	struct device *dev = cpu_dai->dev;
 	unsigned int val = 0;
-	int ret, i;
+	int ret, i, max_range;
 
 	micfil->quality = micfil->soc->default_quality;
 	micfil->card = cpu_dai->component->card;
 
 	/* set default gain to 2 */
-	regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, 0x22222222);
+	if (micfil->soc->volume_sx) {
+		regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, 0x22222222);
+	} else {
+		max_range = micfil_get_max_range(micfil);
+		for (i = 1; i < micfil->soc->fifos; i++)
+			max_range |= max_range << 4;
+		regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, max_range);
+	}
 
 	/* set DC Remover in bypass mode*/
 	for (i = 0; i < MICFIL_OUTPUT_CHANNELS; i++)
@@ -935,8 +1016,8 @@ static int fsl_micfil_component_probe(struct snd_soc_component *component)
 		snd_soc_add_component_controls(component, fsl_micfil_volume_sx_controls,
 					       ARRAY_SIZE(fsl_micfil_volume_sx_controls));
 	else
-		snd_soc_add_component_controls(component, fsl_micfil_volume_controls,
-					       ARRAY_SIZE(fsl_micfil_volume_controls));
+		snd_soc_add_component_controls(component, fsl_micfil_range_controls,
+					       ARRAY_SIZE(fsl_micfil_range_controls));
 
 	return 0;
 }
-- 
2.50.1


