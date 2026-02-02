Return-Path: <linuxppc-dev+bounces-16518-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGwaObeMgGkl+wIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16518-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:38:31 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E17CBCCB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:38:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4Pjl2X7pz3cM8;
	Mon, 02 Feb 2026 22:37:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770032251;
	cv=pass; b=auqZ67HMqT0MoLNNvn24pCeiPZJ5Zm2mwAKmqsWZ1LQ9psHSIJBWr7bbtLYk6QD5rHsGoIi0dE/7OXlhYqqaWwgqQV58jN9P2ypxUHqXDDfxLeV/5nsYPz/aPhqORZmz82J9xr5IbAWcof3MBEKJKj08A3En/pF5tThYkFqx+pzqL8YVSYH/TOC9DyRwhN2vQNqM3Quf01/X9Ps7b147KETygonCQqnrnOJ0Fom9fTXrasBiD0Am6b8xEgqapmqGInnLnIkasRm5HnreYYxX+1xypX3UDp1w5BDdWyHN1OE03VXw/OcQe9QV3UN1wvolkTbOz/n+c9/10/j5K9448g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770032251; c=relaxed/relaxed;
	bh=O+rviONyzMsmjlkCVvAHR9/2R2g42k4emVzDC6C8uz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oxpQ9VILZ6UEU87DoM1tnPVGstcPNjs5xJ2p5JGzpohR5PDGuxRBOSV70taRuDlC3yCogtq2kO/8bDSBMI4tiZx4HTcrhMQzjb74PLRyhqKGmQ5yoIf8fRrNorUVF7z2cWPOv0zjeUqz2AZ9gBuGXCF8qOt4YwwNlN8wuxUtdI0V6ORmrG7R0mTbGq3ZPhlSPY6KOE6GNLOXTvzilJyxLL/bLnvmUcm1SIGtPQnhwfjzqz1cQ3Bv/dGr8wTbwB5wVJXKbfoHsFhpoDdVtscPMW5ayXRpTbRawyfZkXUHO74x3dCdQRXR24w5QmyPpIZpNgc6otJofGQ2x/R5dLKUYw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UvMOvGx5; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UvMOvGx5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4Pjk4vr2z3cLV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 22:37:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3uNZhzg1sjxzdG9Ht3OziDKfQqFRADRy+hNLst3GHeqsNu29JzU8PCqXml/d0IUFSXeXP8vSQpBwKoWObuDletd4WDIngk6wwRHhht4VKW9bWMVl2eCJ7ANJbMR/Im7EFpP52CFKW+5WpAuUEpdmxf/Ela1HwQuW22H/liPYgDrMloLOpig4wgIrE7ePnEELVggK2AWihpLGOl3T4rBGe7KkgcwtVA6rPuGTliL0eMNY8bCuTPwOHzo0W11K/O0Al4GQ6HTvAvJYC5wjcoCgCJIzq9Ndla1o6H2w8KqnsOVfk92fi1MZrX2dgGxJDpRhwEtNwBPQBZwqKMoQlOB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+rviONyzMsmjlkCVvAHR9/2R2g42k4emVzDC6C8uz4=;
 b=xl6YJTvsUUxHQh95I9bRxqTFt8lv5P9ajAiccXB7f1JNJc0RK9KNROv72rIvh44JC2xKGX6sOKvfL1jSakvzpja0j23nG2ttUxYSazVYA4daUg9E5L4XemqiIqtNpnlkBf21cOc3CQ1ob4ECNO+wIC5XrG0RIBCsZpwNqPmhgi+lavv4usbyJNTfOogKHkuxB2TBKNMIpuVHIhtNfgPnxnzhErVeWOgCill4mVwGvLR37XfSgpjRQlYINxlKoUE7E3r6cFYcVfRreDcsYKasGHsBNlkvH4pub4Sp3Pka6HwzCwgRGglsRJxtYiPEeMhoyDVtiip+0O85ffvqvx5Anw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+rviONyzMsmjlkCVvAHR9/2R2g42k4emVzDC6C8uz4=;
 b=UvMOvGx5J0+BAvDrWXWJ5RCMkVzZ0TODeDUoGVo9dNDRe7LqYgw60CSxBLdauqwBYpjkJ9OQmMTTWfA3WIDN8Jf2CMTK/TtevaCRGYPCO4QvO3mTqPi0hq2FEjvdEZ9WM+XB0pJrHu05HDRL9YdAXoDlVDg3+BHAamnV2v52N3tVBUjkPyEcchwKETJ1Yol16w0OFZnfVoReH3v/fPWU2h3empzATfYeX7gn+FpxA2QYpvvr3TpGbBX7FyStB6BuUPeHj47i2iXpDZ5JrouH88gj9GEhckQBZJBO0HRQyY4Z0xBff4lYNlAW+QOLeRBgmmRc/E66ck0K76F42gj2Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 11:37:21 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:37:21 +0000
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
	mpe@ellerman.id.au,
	ying.huang@linux.alibaba.com
Subject: [PATCH v6 10/13] mm: Add helpers to create device private entries from struct pages
Date: Mon,  2 Feb 2026 22:36:39 +1100
Message-Id: <20260202113642.59295-11-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202113642.59295-1-jniethe@nvidia.com>
References: <20260202113642.59295-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0101.namprd05.prod.outlook.com
 (2603:10b6:a03:334::16) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: df7cc873-8730-4988-073d-08de624f6d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fhCIDwCY2nQuVlaqSMYadgJ2zOP3zAtTc7dIkh/NYspRW6MjJnL2Datjb4gY?=
 =?us-ascii?Q?uLBeVDHH3mTy4P86DdvqlNQlHlGJ0WWWF0B28PTcH8YjArduKKBzKHfSUL0A?=
 =?us-ascii?Q?24eNB/dx0TzprmFPAXgbooG/0aYV6MC5i8FL9/LvynkOTE2Lva3UvMV+zmsn?=
 =?us-ascii?Q?TlE032EVtqXUHd+R4cavZvF7in+jcDXu7IWItc6Npvzb/JPunR7X/Hm01Pq9?=
 =?us-ascii?Q?1jesxrmtHfJYOSC5vu37cDTCOX+Zyg7aNPwvKLRL3Qi03R9HCc7z5DKR4sXd?=
 =?us-ascii?Q?wV+3bNh1URw9aVSZ2r7mte9vCGFC9d3dnaH1a4pgSSVNepprjCnsoEL45vly?=
 =?us-ascii?Q?asexHmwrEOrhFbQNlNiHovJwquYR2HQOpH9URtaspmkSzxn7zmQatVFcWDNY?=
 =?us-ascii?Q?BAEkalCcCcQg2tsT2jzLla+qpNjIDEb9GWUr712PoYgOrVUPtcUUzDgJfo8N?=
 =?us-ascii?Q?1bu8317ZFE5B0RTD6lHs+uThjux6JiqpB5nrUa1hhWHC/ZXk8aeffIpu18X9?=
 =?us-ascii?Q?DzlqmkNZrH8TREMnGb9tqxpNynAowcspWrQvIvvRlyU7+XfYdSDbkUDceDUi?=
 =?us-ascii?Q?TMrdTbKhvjyxnWqDE6XPNObxy9Q999rZEuLD85nPaOhFdYED/Gx5E2YoijiZ?=
 =?us-ascii?Q?F+WcE8q7ZYBevMi3oSLqnfQYjPYLmrFeW9501K2FchnTffTzyOY+P/M+tQap?=
 =?us-ascii?Q?G/rBoHEpKVASZf1Pid5SItxSdlYm+tUZJ8K331uZH34gFFuIQjKy1RhfRcJf?=
 =?us-ascii?Q?1njr09EJiaVtG7JwKTH468EHFW616yLPI6stymBBvBup8qVyOXnMgO14Qx5j?=
 =?us-ascii?Q?7R9WsnJiesoLs2MWW8o4FTOlRosBABd11z77MbTGi+5+DSY4SGwo65nXH3w0?=
 =?us-ascii?Q?zmkjAlnISjtRnoSar0eE4Az8uWtxqGUayBeU0Puc0TI8lJGPgT5XB35w10ak?=
 =?us-ascii?Q?PoxKdR5LwudBRRqIGtvHQYPn2ZOuTQCM8mqa8K5bLmuKOmXbySaopk9Q9don?=
 =?us-ascii?Q?BvvjorYlszD7Ngb7yS1rwLxr9y9K3TkF3u+sye/rkKum0rcs0kjyWYeQVCjN?=
 =?us-ascii?Q?ZmH9JuKRTRZhxDQEJ0+gSkMR48xSHnk3vM5yYoIIZ7csA9sf0lxUuh5+5o2i?=
 =?us-ascii?Q?kSJjdpZzQtjo8c2gplYALMxg6z4uN3dgKRwUN901vWfPSZFrKjGHYCOwzLi2?=
 =?us-ascii?Q?H90mFGYgHuCC+mlv7Vk60AGlS/DAP08zV/5b1skuHXM3I3T2YWDyzlHI+deS?=
 =?us-ascii?Q?QSpLdVjJ6PKdgUy2RyNfxSVZCokaGjgGumcWII2LEEbT6SjFL4gmrflrQNrG?=
 =?us-ascii?Q?vti2/2/jQnQ3xYTksH1MVb2LSDd2LlcGqplMLYKXCafphcm14lSAmyh9hO1y?=
 =?us-ascii?Q?lBzynbvjbJ3jpBhKnD0L1OVuhCXo1TL/1tDadQh26TZ6fMbjZYOHZG0K3Nyc?=
 =?us-ascii?Q?oHU2ehkx2BmlQaWxpCdTYYCvMPM1jLeIohwsu2wd5pI/IfMRe4uH15udRgFe?=
 =?us-ascii?Q?uvUK6zC9U1iuX+zcgLWwDnMzpOtjTa6GzhZfnHLxCBuGT9iuhR3GjxooUiB/?=
 =?us-ascii?Q?JKlwc5vXrUtCk4lC/I8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QXY6ZX7AeXi5RbeTb/Me3IxNo3qzJxijSjOl7TiR6B3po4vLm2voNIrI2EuK?=
 =?us-ascii?Q?+uAq0CX8hhrzFqI0u5F7wJyNqqbp595JVKWzSQSjBeea7JnuPQr2c6Fg+E9X?=
 =?us-ascii?Q?EF7vv6gLju8kgVSNBKeVyQIYY4otW9chgwzSvmEMW3KGQaspkMs3+x3zedEi?=
 =?us-ascii?Q?J425j2jP/bw/++uXYcWyIiWiRIFiSkT//NLd2nV5t6S6U2e6EFdHfkeMRflz?=
 =?us-ascii?Q?E4R+cdyrn7doRoZxakcqkWcc2GCGl2PleHdc4kINyYc9FVHMNWe0JEyH36oO?=
 =?us-ascii?Q?USJPJTjHXtqVxIAbtdGPcO5//dM61QxTOKtPO6LoqZLH/uobviwwl0fHYVot?=
 =?us-ascii?Q?N6A5tcg6/vTkJj2CpEzNSYG93rK5YlXSuJUIOzbGek3MFeMxBVioOqmPsBpk?=
 =?us-ascii?Q?GmHL3uhAQAZhUGT3KQfLewUecErtTKIVrCjgQegMDv/c3B7gEa67EB2DAHyW?=
 =?us-ascii?Q?kfDrNQC0SgjDsZFZzt9+YRkB/h9aNEplBBI8pBbPMgjNPjwHd46y3TPS+jiY?=
 =?us-ascii?Q?CDgoaCyYhtjY/S13KFEiUaSkLCKrg8PcnXaS8bqvlX2+fMDsN8ybJiIcH+Hq?=
 =?us-ascii?Q?tNx40KTwYZJaFHuDHMu5t6eMKT4xb9UB3t8nVE7PqdVfxbcOtQJ3UOu8bL6+?=
 =?us-ascii?Q?6vCbZslaa9YSOP6eGPBCSfXlk7ah3ULn4+FsGuxRxOTBHZtqa3+D/7GKd5tc?=
 =?us-ascii?Q?DcBxkodyxhEVXe3N65L+K43FuwRCc9hBd6ofS93rwjGQ5x5uHQSBhfmyR7ZJ?=
 =?us-ascii?Q?DErHgbBEvbJbwqm55kzmIsXpa09Qmxnw23PSh+mf4tllfiZ6oP3DDvsYsgp2?=
 =?us-ascii?Q?/T6M4TOMnL2aI4dYE+zpILchfemnU8nDDASLVASc0GGtb9DMHK1s4vHqKD3S?=
 =?us-ascii?Q?ySmnFWchy05+CajIrXFF9CeaW4d2eirwEHXIBogDhHukQ+CIZYP0SlJW4lsz?=
 =?us-ascii?Q?tNCN/LpxMOCi5RjobUt4wzvB8jnSdE1fyfYEVVh/klYQnFSoGUIuaFXudTLT?=
 =?us-ascii?Q?sZCbVvc3bAb2O4gvV+PlldUf4T+O9Sx8b+Cw4/cssYY5cgCP/kN9zafKiFEy?=
 =?us-ascii?Q?LRcqmkGaKDOykLlxArfSwKl/DGmh0D+rN7WhFE00MaHV3AfniTp7ME4FdpRk?=
 =?us-ascii?Q?K9euIyQcEwCQkysw/Cs9XW7OJ9vFZaFolFhP/BSHk/75RqdzfeOFVgNLD/VG?=
 =?us-ascii?Q?vsamIpOo8SLVO2ZmK1tqlQd0vp9TDChkqnshYZCccNlu+yTOvP2387b2tdHI?=
 =?us-ascii?Q?gsPQE1L1F+crDTtfW7mHiy5NnfOqfLN9NZVT6X+CxlFD5m6Nxhm/nLnaTLab?=
 =?us-ascii?Q?BfPS04srYqvzHre0e+Valxer2J/KajYVKIQlUckQ8hLMxsXeOF2ygmiF9dfb?=
 =?us-ascii?Q?MP0iFXT/1dBIt0UXB+zzDP7fzWloPaEstxgIAEyx0a844jNpT95CkQAEaWLG?=
 =?us-ascii?Q?Br23JQQ7+7YPq27VcxPT45hw2V49CWhyD/XPQrsKG6oVxZjvNndR1J0ZVkL8?=
 =?us-ascii?Q?VZj6DnSlnsY5g0kPOpHCiAAS90QCsAs9OY+xbK3PvBTjN2RxlEMUDT4rmHyc?=
 =?us-ascii?Q?MDSP/aO3gy4fV/cGVSbjEDCQE2+vPQQg940QMKQrstiKPLf2putcMo0QW5Cz?=
 =?us-ascii?Q?w9nY+hvupp8kitOGJZrB3Ol9fh0Skj3hzF1AuwefeIUVnFva/N1DvVGuaWwg?=
 =?us-ascii?Q?4MQGRhnzmsFzd1ToXGDZ4yaRfIaL9s5IQPY8i8rkzy2Y01Ko//F1B963Ya3I?=
 =?us-ascii?Q?2X46uHYzCQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df7cc873-8730-4988-073d-08de624f6d4c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:37:20.9917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nky1ps7rImkiK+pVFAqRsOsauW+fhefJ0W9DI/X2YjR0waa2MpGFenZb7w2mSlWZFbsbNzNQBKKXabCDxqMNAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16518-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au,linux.alibaba.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:ying.huang@linux.alibaba.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 20E17CBCCB
X-Rspamd-Action: no action

To create a new device private entry for a given struct page, that page
is first converted to its pfn, before passing the pfn to
make_writable_device_private_entry() (and friends).

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn and must be handled separately.

Prepare for this with a new set of helpers:

- make_readable_device_private_entry_from_page()
- make_writable_device_private_entry_from_page()

These helpers take a struct page as parameter instead of a pfn. This
will allow more flexibility for handling the swap offset field
differently for device private pages.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v1:
  - New to series
v2:
  - Add flag param
v3:
  - No change
---
 include/linux/swapops.h | 24 ++++++++++++++++++++++++
 mm/huge_memory.c        | 14 ++++++--------
 mm/migrate.c            |  6 ++----
 mm/migrate_device.c     | 12 ++++--------
 4 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 8b39983792ea..080e27da6b47 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -138,11 +138,23 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 	return swp_entry(SWP_DEVICE_READ, offset);
 }
 
+static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(SWP_DEVICE_READ, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_DEVICE_WRITE, offset);
 }
 
+static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(SWP_DEVICE_WRITE, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
@@ -169,11 +181,23 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e3a448cdb34d..03f1f13bb24c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3219,11 +3219,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 			 * is false.
 			 */
 			if (write)
-				swp_entry = make_writable_device_private_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_writable_device_private_entry_from_page(
+							page + i, 0);
 			else
-				swp_entry = make_readable_device_private_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_device_private_entry_from_page(
+							page + i, 0);
 			/*
 			 * Young and dirty bits are not progated via swp_entry
 			 */
@@ -4950,11 +4950,9 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 		swp_entry_t entry;
 
 		if (pmd_write(pmde))
-			entry = make_writable_device_private_entry(
-							page_to_pfn(new));
+			entry = make_writable_device_private_entry_from_page(new, 0);
 		else
-			entry = make_readable_device_private_entry(
-							page_to_pfn(new));
+			entry = make_readable_device_private_entry_from_page(new, 0);
 		pmde = swp_entry_to_pmd(entry);
 
 		if (pmd_swp_soft_dirty(*pvmw->pmd))
diff --git a/mm/migrate.c b/mm/migrate.c
index 4688b9e38cd2..24e3ebbab1e1 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -399,11 +399,9 @@ static bool remove_migration_pte(struct folio *folio,
 
 		if (unlikely(is_device_private_page(new))) {
 			if (pte_write(pte))
-				entry = make_writable_device_private_entry(
-							page_to_pfn(new));
+				entry = make_writable_device_private_entry_from_page(new, 0);
 			else
-				entry = make_readable_device_private_entry(
-							page_to_pfn(new));
+				entry = make_readable_device_private_entry_from_page(new, 0);
 			pte = softleaf_to_pte(entry);
 			if (pte_swp_soft_dirty(old_pte))
 				pte = pte_swp_mksoft_dirty(pte);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index c876526ac6a3..0ca6f78df0e2 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -836,11 +836,9 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 		swp_entry_t swp_entry;
 
 		if (vma->vm_flags & VM_WRITE)
-			swp_entry = make_writable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_writable_device_private_entry_from_page(page, 0);
 		else
-			swp_entry = make_readable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_readable_device_private_entry_from_page(page, 0);
 		entry = swp_entry_to_pmd(swp_entry);
 	} else {
 		if (folio_is_zone_device(folio) &&
@@ -1033,11 +1031,9 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 		swp_entry_t swp_entry;
 
 		if (vma->vm_flags & VM_WRITE)
-			swp_entry = make_writable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_writable_device_private_entry_from_page(page, 0);
 		else
-			swp_entry = make_readable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_readable_device_private_entry_from_page(page, 0);
 		entry = swp_entry_to_pte(swp_entry);
 	} else {
 		if (folio_is_zone_device(folio) &&
-- 
2.34.1


