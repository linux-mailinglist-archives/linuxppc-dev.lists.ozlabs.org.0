Return-Path: <linuxppc-dev+bounces-16448-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMNSAAOSfGk4NwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16448-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:12:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 485E3B9E7C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:12:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2YH955sfz3c9d;
	Fri, 30 Jan 2026 22:11:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c100::f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769771493;
	cv=pass; b=gtyzLyk6WSE6bAVH5KUXC/TcINFt44ZRyy63tI8UQ4UPtx0ZWDsQoyuIGyQaBZ/CODnjx7HsI6E8JiQDeDzPn5C/yQ72CqddQMkAXsNjUk/V88hzfU/hVwBIcE0DeXqIWORU8oq04GxdQ8UnPs00ULHLwBXFJoy3TBnTn2RfUq4rb/Q7fm60QPEu+H/6FqA5fHPiaIzXq/Df2o4JzUX1s6ptfSm9/ag8tEbCKNHIlI00iIRNlk6eqpm6TP4DjdSeT4wk0INWML4YPbu/xLWxzrCEyqrwXVvBhiYmmGJabk4crrjMgBO8uRGemqunaqq6CN0QeAC8dcz7Lm52Y5Ys+A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769771493; c=relaxed/relaxed;
	bh=KAZ/+mizc8kZ/p6LbUf+M8l+8hYCGW8mEK4HmxV2eZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WuUREK9pQF8QhrZ5BknxhBs1mfDipgxshck9vXlptqmwO2PBTSJ1JaR1NCB/DcH+nNpakmdbi5dV4msrLtAqqvWdOnNgE2uFUtUmK+zjSiamuyDaSIO1+sIXvS6B2bckyQNOsM2Xv1sVIrDmQe/3BeeG15pUmaqpExgcaYoJhle7ZJDKJqoK++2148AQMqXaeNmsZghDNMNKtxbtwzU0dnoLUw52j6w4lXT8oIZdEjRUu4dvust7qSgFBpf7soS2V1/FXgtycpe/z2xUc2hBLiq7AUkrcnbIMx9/HOfdNptW21qCNfYgNG4KM+Ev+Eqpd/krlV6khjvBuIQnux1JwQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JBPEgxA+; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JBPEgxA+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazlp17011000f.outbound.protection.outlook.com [IPv6:2a01:111:f403:c100::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2YH86d2kz3c5f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 22:11:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXA90MpA705yuyF3z/Qh/NyduJTWH2qFOFvQVLaRQNEt1JTRcFM/izH2mBqoKizEB3kS+LNJn/h/Xw1nMRPFuu4uaSipC7Z8q7HKdzRN5O/G+s9oTEQ/p56blzPfD6m5CGdnZUbL0m9v7dW6gFqOYrVCMSK4F+vY/QQdKSqhSBG3cP6pivhvhhWtck1WyXi1ZqKAF457S06SMSV33zfm9FREMbfuEyxxK1Wq1AbUkhtvwjCCbFZse3/Tt/2sPZWn61+zXmzZ07E62L8/abdlx/N1nOO3FiWkilGihLee8Mp0C/hlgrQ9tZtWJHVP8joO6nYx9UwNyCmdQFPVoSpSxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAZ/+mizc8kZ/p6LbUf+M8l+8hYCGW8mEK4HmxV2eZA=;
 b=ZS+0HLdOQ1FNzBPZ1fBcWbVsANmkHp5y7FPQog9ejHRoHGMv9kl4LfjkIAzyxy2WW/ctDljD5E0GyQviJAuoV9m54mGJ3zUhlBK3j6LvuF/hi/eNTzoJRveIlBxpZCGzPY7QcXyF9u9+T4Y23SxMH6O71MSBIupZYqses1mMNhr8tPZ8PIBoPR3+bjuTq4liDAPv1P1R0vLNV5+wGfwUD0Zg1wXvqL8wnMDQIG6qzKPatmbmXXGweBFNfzm+V9r5SqtyvxTbs/THrjgB6hG/QW9wq761071lbzXuNJz6alVrNUL983ORhQjBj0/eEzkZPie1Vkj+jAKdAnkRB1pH1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAZ/+mizc8kZ/p6LbUf+M8l+8hYCGW8mEK4HmxV2eZA=;
 b=JBPEgxA+rP08K/pqj7MV7fLWs7pYUBvMULMPeDr/qDew+b1qS1YesKTnGusJW3CC+SoH1XJbQGapr8Voot/uM97J4StcQ+yqcVbTaoKrWkYKxLsG7TzC5x0K5Yv0O1qIinjKqdCFUby+ifXHL2Ww1Ve7ANn3WVHJNrrO1Lm7kVYZ/xRa1AaWnH5CHx6dQ+Eo3mX5XGVBylcRFwgHj8BdK8AkG4C4YeAOc/pvca7rlvjaMVfPYNqBIGuk3iCEycvQ79n79yjrMcXl5R0Z5T0YMsWMgPp1KTB4U4tvDmvp87f6sef9SGAQzHAbY0Os2zbd0rO/Xwp7yaH619YckulP0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 SN7PR12MB7836.namprd12.prod.outlook.com (2603:10b6:806:34e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.11; Fri, 30 Jan 2026 11:11:16 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 11:11:16 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	david@redhat.com,
	ziy@nvidia.com,
	apopple@nvidia.com,
	lorenzo.stoakes@oracle.com,
	lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rcampbell@nvidia.com,
	mpenttil@redhat.com,
	jgg@nvidia.com,
	willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca,
	Felix.Kuehling@amd.com,
	jniethe@nvidia.com,
	jhubbard@nvidia.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au
Subject: [PATCH v5 06/13] mm: Add helpers to create migration entries from struct pages
Date: Fri, 30 Jan 2026 22:10:43 +1100
Message-Id: <20260130111050.53670-7-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130111050.53670-1-jniethe@nvidia.com>
References: <20260130111050.53670-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0331.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::6) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|SN7PR12MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: cb93b362-86b4-4963-1a38-08de5ff049b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dOAmZnCEnSu2yipzJV5Ax/lX93FRdJfw22TwvnWOi1h3d5y4zo4Re9Qnn3pf?=
 =?us-ascii?Q?hQMXdcWwv690oo6LT7KYxOhCTyLUJQCJhLIhsycRDo4s7HFQeTeo1g3g1uh3?=
 =?us-ascii?Q?V5x5UYdQ5uajYIR4kg0dXxW5R4M0spMPkZYMr0sxt9qbrWEML9b0tSt4Yeba?=
 =?us-ascii?Q?o28ixBnHDtzo2koInGFlkFQavbRWIfZFeEXgHjmpqwQsDFE2CjudVWjI4o39?=
 =?us-ascii?Q?tkN/L6vZ721Qd7zPwZNnb96q75SnYtzezZFxjSh3hChkY42EMWU2C46+vZi1?=
 =?us-ascii?Q?muNghuIPto1ss7ZIZgcpigGMwXm7n+ALDxQwZ/v+TvSxdv5Ij0R2IKB1bz91?=
 =?us-ascii?Q?uDWH8TNx1c3yGsRhNOn04ttXqiHAoc/UMWUaVyHd6rAs2stF8V0QigOLazNK?=
 =?us-ascii?Q?rA/b2R4xZnh8qvHbq4wDHG07UZ+l9VpWmSy/j5SJXWmZz00OxIbJA6/UGMAs?=
 =?us-ascii?Q?xKE1Fp8zl0QSCvuBDLPIxEyTT1cUUXyGmtgl0ilLVHdFe1iFOAFM+6IatBqt?=
 =?us-ascii?Q?uUiJFzAwXriuGWAYWS6oW4XEERo+RlIrZte7TeCio29VKdISIiEjqlLCxS6M?=
 =?us-ascii?Q?t/9jTO37nrsOgjDyWuSazqy9KDI/r1X2q+p9VrLr6E3zHFXoSIpk8IAaQB8E?=
 =?us-ascii?Q?wlN69kFmaCWOfkkx9jCqKa9+htUk5lXcnacHAs8uboPN21D26Bk0nFv89dro?=
 =?us-ascii?Q?YCnkBv1xBDBp6mHTzXh8t7ssID1eaat7YMODRan/L5BrlwZeB0RjWcaJ+njl?=
 =?us-ascii?Q?AFS+G4YzH2uGwt8OvZYj0JHM66GbhoG3c0P9bnJwo/u152curOQfz6BWztGk?=
 =?us-ascii?Q?WCgH8mJerB8i99kwEFH5YZ3NzPJjTrk8wMiP2aNDTcYuOBKPI5FizccABEvZ?=
 =?us-ascii?Q?c/CvMy4hSSBMQ3e8m2I7QtJ35qHmWodG6RpKb62MRHD6H0+T+0oDfeQA9zOE?=
 =?us-ascii?Q?lyLf51gbrPjSleQwM/2uFJl0nb7KmPwqTOLgoTjuNsb9bNnEn8J8flfChZnp?=
 =?us-ascii?Q?ydWkNrk3eHbs2aN7//nPJOy3xUGCWwU5/atgEj5QNT97Us7X0XGiLY3cm73h?=
 =?us-ascii?Q?AI8zVJkMSMhIO7Xfi8D3bR/mmdcAhaczgV+bS+dF9tqeTODbcH6QNrRshRDV?=
 =?us-ascii?Q?zxriXt1DUxjz/qyPfRjx5WvMbPEJDrOIBgW+prQRHss8Sj6f/sbHsT1GEr86?=
 =?us-ascii?Q?KA7X/ZYTP1UFXwZjm9BDo7aWQf2L9rAKzQeRBKF9r/cpAmAzv+bceqwPx8E8?=
 =?us-ascii?Q?ZqX5rMNw1E07diGmWGqlqTazhW2KhGHLiSnZZbcBKD2NlaT1mH9TUN4amlwn?=
 =?us-ascii?Q?5EgG4rru18lJ0vWjUVmTS8Z99bps8eXu2aCxpBtfO19OLkugKuB5G12gf071?=
 =?us-ascii?Q?jYAMOEAFGasYYUn0nd9bBXKKXQA7nbgcrPlChxUSc/L6W97sQbRVR8Chi+oG?=
 =?us-ascii?Q?5VQfxzJ+W87o2VVusBpn5wz+Zy9LFtp7BWQkQfNx8WqfxbVvlGbk7wvZZCpG?=
 =?us-ascii?Q?QnfFSSmd6VghzMAZvnneRl/hY9Vl6ZoJ/kUulVvOGL7EL8zgs+oRMYn4VjBu?=
 =?us-ascii?Q?47/mkTN0sh868GaZ1hY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hH0mt/YUI0Ika3LuI1lQToWdH+TrIFl1moZjlnyxOUMhV4SJB3TmP+5D9b3Z?=
 =?us-ascii?Q?nVxWmvv+JCkZTfDG6OLZGxx/MEAun1OezFBFpM2Jn7ygObStlw0nHgh0D7PW?=
 =?us-ascii?Q?zJ6OLphNO5dBktiypsykZQ+33DXzqq+EJ1SZdgn4za4YXoPdpfGB/TlJR3vj?=
 =?us-ascii?Q?lsXbNCe156zUhzwCDyC1R9ugpEURVTOSsYV4iPZv5vJ2/VB9JylpeDqEylZz?=
 =?us-ascii?Q?jaD8mKwqi6K/wkVHqkSPKGsXau5iNShC4wzzm4U6ZV5sX5zzqYUKJpagHBVv?=
 =?us-ascii?Q?9IW97EiBSJPTQb3HUVkuk71glEQpNo7RAl19W3axvHa98a8fEZMFuL6kei7e?=
 =?us-ascii?Q?nc8kwH0vUq6OhKZ8MkxKdR+M88Omurz0kSj36zr7p003QDS4c/OUiEqELszs?=
 =?us-ascii?Q?LysOR7fpecQ55Bv/W0Sm50WBViLSht0xuLCYj5WarjsVrSXVbpebcgIR3K2c?=
 =?us-ascii?Q?YuseTIDcvqhdDU0y5BNz7cVlOhFAgJBbcWo3RmdE3Y3KcXVuzBy/4Tbvt9ub?=
 =?us-ascii?Q?ZphXmwcx17QCWzCOAQ7nHCVfDwFWDKC3e/1f65OhtHKNF/yhyvN+c+d269kY?=
 =?us-ascii?Q?tk8d5BLN4nP7tAtmmsv1xsYqtuQganxs+bkJL55e3tLJGvZNByj6Km0w6l8f?=
 =?us-ascii?Q?Jqzh2r4QWp2lakHvwhTwYYchs4DycoeAfI1FU/gMGlK9kwSn3CBYOF8BxWll?=
 =?us-ascii?Q?sEdq8I+BjhCXxJeNXYsXb6E1GjQpDfviSI2DOyhgBrvLVucdf/1StmuJb1/R?=
 =?us-ascii?Q?kFGXxEEZUf0ajlf0S2zY6/l3yhpNLQ7Ea/qocx95GSjb8R37fmGybat4HMyj?=
 =?us-ascii?Q?DsLnp5viO/Kpn9b4xww6y25CwlzlYKGHZPIn9/eTMUQYb9JoUt8JFyXU0k8X?=
 =?us-ascii?Q?qox3Jlejjm5M0jCLhLyBnOjHCArwwmHUKcQE+7RBpJmltOxxtAvEV55QiK/6?=
 =?us-ascii?Q?YUOhYF/XHUEZqvPerJwAx16GSvR2vG3ZsPuXLvS9WcoiWA+vcFG2cOpIJNNo?=
 =?us-ascii?Q?mpbSZwfxx8ZLSvgARkqm2VqL+feOYeBwU3aOX5htT2LbNqs9G4ZRf72OeVRD?=
 =?us-ascii?Q?k2l75MnGFPr+Hv3ptkRvIE/yYjRS+FJ8GVs0C0yhaEtRnSqjxnzRYUcMvA5X?=
 =?us-ascii?Q?ZNxW9sAIVDR+w9nQbMgg2ySXRzHZqvwvBu8f/GJNyxb+Qd4/MqJGFMQxyORw?=
 =?us-ascii?Q?rkU+rV74JYhKZSj7Uf5eqk6ovnVIqXvaSDtDnao+SX41cSuDLe0BTKNIbyLV?=
 =?us-ascii?Q?FmhWDy7eruXv+/FvHAYKy6JP2YfDfbP9jzkiHjk5+vmqoGjSHcqIn2besxcA?=
 =?us-ascii?Q?/ckIJDymKnViQYEMWxFE0KHZ36Oh7g6pQoMpcq6irP7cHQ9U1fhliC0kEe+9?=
 =?us-ascii?Q?TEE49uiJ9rv0h+Iabb9Bjxwh8ODx3+B9XRyqVDnS2GpYC+t3J3BnmtWBqph5?=
 =?us-ascii?Q?9WEpVY/aCawSdp1SBabXVNQrKGAAka7BRW/W81FG8ARjdGszlLC5RCQggdmR?=
 =?us-ascii?Q?Eh6H+DjDDMof/HPyVZkWeyrWaBZua+fnJCY5+7g9kuHv57BF4etwnVJRNI5H?=
 =?us-ascii?Q?3O1Vifb0eMIeAQVFTQgAsRLrNxJb94iuxvqR3MZi7McuyeuIuOtU1nQ0T6Yg?=
 =?us-ascii?Q?hRfAjuJMpBHQTtLbYojx8Xmo2sEIUUN6vXWpIAzN/ed09xL4M/GDRmkLV8v6?=
 =?us-ascii?Q?X9drhzE6Fq2/jLBGJfLBpO3+iXlfO0cEuKv/xVJfQcMYgH8oulP73hTX1iRC?=
 =?us-ascii?Q?EF1aN5Z/bw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb93b362-86b4-4963-1a38-08de5ff049b6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 11:11:16.7785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSevnpdA19vFTZZAPywgM/YBF0nM4CKWwFOwikRS7g0RcvzJGuoOE2vwQlYvPJGbTZOpnylKzcDMmm38QPyobA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7836
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16448-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 485E3B9E7C
X-Rspamd-Action: no action

To create a new migration entry for a given struct page, that page is
first converted to its pfn, before passing the pfn to
make_readable_migration_entry() (and friends).

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn and must be handled separately.

Prepare for this with a new set of helpers:

  - make_readable_migration_entry_from_page()
  - make_readable_exclusive_migration_entry_from_page()
  - make_writable_migration_entry_from_page()

These helpers take a struct page as parameter instead of a pfn. This
will allow more flexibility for handling the swap offset field
differently for device private pages.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v1:
  - New to series
v2:
  - Add flags param
v3:
  - No change
v4:
  - s/make_writeable_migration_entry_from_page/make_writable_migration_entry_from_page/
    for the !CONFIG_MIGRATION case
---
 include/linux/leafops.h | 14 ++++++++++++++
 include/linux/swapops.h | 34 ++++++++++++++++++++++++++++++++++
 mm/huge_memory.c        | 29 +++++++++++++++++------------
 mm/hugetlb.c            | 15 +++++++++------
 mm/memory.c             |  5 +++--
 mm/migrate_device.c     | 12 ++++++------
 mm/mprotect.c           | 10 +++++++---
 mm/rmap.c               | 12 ++++++------
 8 files changed, 96 insertions(+), 35 deletions(-)

diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index a9ff94b744f2..52a1af3eb954 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -363,6 +363,20 @@ static inline unsigned long softleaf_to_pfn(softleaf_t entry)
 	return swp_offset(entry) & SWP_PFN_MASK;
 }
 
+/**
+ * softleaf_to_flags() - Obtain flags encoded within leaf entry.
+ * @entry: Leaf entry, softleaf_has_pfn(@entry) must return true.
+ *
+ * Returns: The flags associated with the leaf entry.
+ */
+static inline unsigned long softleaf_to_flags(softleaf_t entry)
+{
+	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
+
+	/* Temporary until swp_entry_t eliminated. */
+	return swp_offset(entry) & (SWP_MIG_YOUNG | SWP_MIG_DIRTY);
+}
+
 /**
  * softleaf_to_page() - Obtains struct page for PFN encoded within leaf entry.
  * @entry: Leaf entry, softleaf_has_pfn(@entry) must return true.
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 8cfc966eae48..c1d3c0e8981b 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -173,16 +173,34 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 	return swp_entry(SWP_MIGRATION_READ, offset);
 }
 
+static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page,
+								  pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, offset);
 }
 
+static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
+									    pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_MIGRATION_WRITE, offset);
 }
 
+static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page,
+								  pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page) | flags);
+}
+
 /*
  * Returns whether the host has large enough swap offset field to support
  * carrying over pgtable A/D bits for page migrations.  The result is
@@ -222,11 +240,27 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page, pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page, pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
+									    pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 40cf59301c21..e3a448cdb34d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1800,7 +1800,8 @@ static void copy_huge_non_present_pmd(
 
 	if (softleaf_is_migration_write(entry) ||
 	    softleaf_is_migration_read_exclusive(entry)) {
-		entry = make_readable_migration_entry(swp_offset(entry));
+		entry = make_readable_migration_entry_from_page(softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 		pmd = swp_entry_to_pmd(entry);
 		if (pmd_swp_soft_dirty(*src_pmd))
 			pmd = pmd_swp_mksoft_dirty(pmd);
@@ -2524,9 +2525,13 @@ static void change_non_present_huge_pmd(struct mm_struct *mm,
 		 * just be safe and disable write
 		 */
 		if (folio_test_anon(folio))
-			entry = make_readable_exclusive_migration_entry(swp_offset(entry));
+			entry = make_readable_exclusive_migration_entry_from_page(
+						softleaf_to_page(entry),
+						softleaf_to_flags(entry));
 		else
-			entry = make_readable_migration_entry(swp_offset(entry));
+			entry = make_readable_migration_entry_from_page(
+						softleaf_to_page(entry),
+						softleaf_to_flags(entry));
 		newpmd = swp_entry_to_pmd(entry);
 		if (pmd_swp_soft_dirty(*pmd))
 			newpmd = pmd_swp_mksoft_dirty(newpmd);
@@ -3183,14 +3188,14 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
 			if (write)
-				swp_entry = make_writable_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_writable_migration_entry_from_page(
+							page + i, 0);
 			else if (anon_exclusive)
-				swp_entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_exclusive_migration_entry_from_page(
+							page + i, 0);
 			else
-				swp_entry = make_readable_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_migration_entry_from_page(
+							page + i, 0);
 			if (young)
 				swp_entry = make_migration_entry_young(swp_entry);
 			if (dirty)
@@ -4890,11 +4895,11 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
 	if (pmd_dirty(pmdval))
 		folio_mark_dirty(folio);
 	if (pmd_write(pmdval))
-		entry = make_writable_migration_entry(page_to_pfn(page));
+		entry = make_writable_migration_entry_from_page(page, 0);
 	else if (anon_exclusive)
-		entry = make_readable_exclusive_migration_entry(page_to_pfn(page));
+		entry = make_readable_exclusive_migration_entry_from_page(page, 0);
 	else
-		entry = make_readable_migration_entry(page_to_pfn(page));
+		entry = make_readable_migration_entry_from_page(page, 0);
 	if (pmd_young(pmdval))
 		entry = make_migration_entry_young(entry);
 	if (pmd_dirty(pmdval))
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index a1832da0f623..a2f9ac8a3177 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4955,8 +4955,9 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 				 * COW mappings require pages in both
 				 * parent and child to be set to read.
 				 */
-				softleaf = make_readable_migration_entry(
-							swp_offset(softleaf));
+				softleaf = make_readable_migration_entry_from_page(
+							softleaf_to_page(softleaf),
+							softleaf_to_flags(softleaf));
 				entry = swp_entry_to_pte(softleaf);
 				if (userfaultfd_wp(src_vma) && uffd_wp)
 					entry = pte_swp_mkuffd_wp(entry);
@@ -6491,11 +6492,13 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
 
 			if (softleaf_is_migration_write(entry)) {
 				if (folio_test_anon(folio))
-					entry = make_readable_exclusive_migration_entry(
-								swp_offset(entry));
+					entry = make_readable_exclusive_migration_entry_from_page(
+								softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 				else
-					entry = make_readable_migration_entry(
-								swp_offset(entry));
+					entry = make_readable_migration_entry_from_page(
+								softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 				newpte = swp_entry_to_pte(entry);
 				pages++;
 			}
diff --git a/mm/memory.c b/mm/memory.c
index da360a6eb8a4..349f360d82b3 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -963,8 +963,9 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 			 * to be set to read. A previously exclusive entry is
 			 * now shared.
 			 */
-			entry = make_readable_migration_entry(
-							swp_offset(entry));
+			entry = make_readable_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
 			pte = softleaf_to_pte(entry);
 			if (pte_swp_soft_dirty(orig_pte))
 				pte = pte_swp_mksoft_dirty(pte);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index a2baaa2a81f9..c876526ac6a3 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -432,14 +432,14 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 
 			/* Setup special migration page table entry */
 			if (mpfn & MIGRATE_PFN_WRITE)
-				entry = make_writable_migration_entry(
-							page_to_pfn(page));
+				entry = make_writable_migration_entry_from_page(
+							page, 0);
 			else if (anon_exclusive)
-				entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page));
+				entry = make_readable_exclusive_migration_entry_from_page(
+							page, 0);
 			else
-				entry = make_readable_migration_entry(
-							page_to_pfn(page));
+				entry = make_readable_migration_entry_from_page(
+							page, 0);
 			if (pte_present(pte)) {
 				if (pte_young(pte))
 					entry = make_migration_entry_young(entry);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 283889e4f1ce..adfe1b7a4a19 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -328,10 +328,14 @@ static long change_pte_range(struct mmu_gather *tlb,
 				 * just be safe and disable write
 				 */
 				if (folio_test_anon(folio))
-					entry = make_readable_exclusive_migration_entry(
-							     swp_offset(entry));
+					entry = make_readable_exclusive_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
 				else
-					entry = make_readable_migration_entry(swp_offset(entry));
+					entry = make_readable_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
+
 				newpte = swp_entry_to_pte(entry);
 				if (pte_swp_soft_dirty(oldpte))
 					newpte = pte_swp_mksoft_dirty(newpte);
diff --git a/mm/rmap.c b/mm/rmap.c
index 7fa976b7fb5a..79cba3d441c3 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2536,14 +2536,14 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 * pte is removed and then restart fault handling.
 			 */
 			if (writable)
-				entry = make_writable_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_writable_migration_entry_from_page(
+							subpage, 0);
 			else if (anon_exclusive)
-				entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_readable_exclusive_migration_entry_from_page(
+							subpage, 0);
 			else
-				entry = make_readable_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_readable_migration_entry_from_page(
+							subpage, 0);
 			if (likely(pte_present(pteval))) {
 				if (pte_young(pteval))
 					entry = make_migration_entry_young(entry);
-- 
2.34.1


