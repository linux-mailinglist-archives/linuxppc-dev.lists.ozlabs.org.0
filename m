Return-Path: <linuxppc-dev+bounces-16441-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D5zHZeNfGkBNwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16441-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:53:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB165B99BF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:53:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2Xrn6KKpz3020;
	Fri, 30 Jan 2026 21:52:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769770329;
	cv=pass; b=SDp5p5u1EBeHnbVTLiPYThk8RHFri+gPTjoTRlkziY/TzOaXenCwbMaKNKd79fGEsIiPmbCTQ9lxCQ3NpbrHo8JXa5DNjR5Gjn5m8WjDDP5xkA3fv6liLX4JYMRPjUW27EDFT5PF6Tcgp1IntcelVvpPW2Uy9Wfu0YHQbrqfwPych9VPvFmEKPl/YXSX5ntZYc8364DuDc3A3fPgzLmnUgT28/M2PnNaEvdssYVCW+QCMHiGqy+b8lJgECwnmTSGoxFhBKzYSksrnSzdm+ZbvnlVQyXBJc9UnNk7daYceYiljg5ncrssSEQimrHbOUON+1CsNWGaVpsmRLEUs1dhwA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769770329; c=relaxed/relaxed;
	bh=2DxFpVJv/av0DPVhGRwmcwo+RxumKgoR9M34Q2wLSfA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CbBmIiOKkRZJjSLyjn6z0th3NUOll1awTC5FSCQRn4LvC2/XBVgZh5UR3Rncqha2jY8AiX1R02A52yUQTLxOWfd5h+u5xzdIK9aqYUO9f3GgNxAiXZomb+cdm5GP7XrtDktj2Kpvmhg/FCxA6XN6POkRpmBAu7JVcSsF3iuvK75fXHf3zdPHX8NkCmnHgeo/NgHP4Slk38Qdfjfkl/iW2p3Wm5FDaTIuAk85y6T65TvL2j3eNKX3rkhT6PLpHqvVfvkshqkA4m/YX7d9G2jZjVPtKjK+xch4tWfEImPEfQ+/GamnTMbIU2DjuYuI+b/8rq9whXkhl8+04mrBwJxMPw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=B1sDK/Z2; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=B1sDK/Z2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2Xrm717nz309H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 21:52:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IU0izkLuKElPRlyoYSH6ooJW8qOUy2xyRJDKotYrbFJc0CdxXZwoWMRhgRcbBLotgJsDp+R7CP9QtCXJFn3hJXskFKqVh9jH9ZoGqHh/JWnE9ag2GsFIyAVy3as+BC0wOLTZc5/mwkNtS5ltjs9IHMPpQDmUnQNsbtJj9u/kkWr5YlIVFbdrbef8fJsVtvsCQzJx0elphhjtwMA2AXYdzQlVzQNb9l2AGZqtBLnJfbCjvsnabez61dLP+F6bTydvHOmRukWE5RxWEBN3g6CxlOtd9Fw6BYy+9x/U4mPbD1sNd1OUqm4QshMFagLqQdaW/HgJyGNXqvfvZic8VLTFvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DxFpVJv/av0DPVhGRwmcwo+RxumKgoR9M34Q2wLSfA=;
 b=Rthw02TGua6OCe1lU7hebED1W5oBh8rkiO/b/7Sk07aMLGONexKPwH+3Hmlavc832XwqnECEr0mMfLeusKg2abz6LSgAseDDAw7Cxm+w0lq41Y3U+7sdAee9v5Hh45zn/CiAq8LucUBYolVdQz3LltfXsMyBbp3DDd8+jK50sBY8t9MoMy3mF7vDt9jbDFVNP7Ps5YrAGrw3FNsHhlSVTO2AZRfDhmRKX692HryTQ04d/cwfdTRCE52tZqWIr1jlGB/nNd9aRyZDSJ+qHxR38EA1tp4070IrlFM/v8OJKw/0jNyX6SXNZO7hLUVPIFlSLonlW7lf61dXQxTDe6EQNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DxFpVJv/av0DPVhGRwmcwo+RxumKgoR9M34Q2wLSfA=;
 b=B1sDK/Z22KuWiMncGS2WdM7KdmH5kGgdoxRHYFBvMIijF2JlVTzd/T80uEri7JT5yXxznoaSq+QbWOQ4xlUiYm7/ZaAjbDtkkYeIi1ZubOmCJ3X5NKOPs4g0lMuPDYtNYHtKGRKR4aZSgcT+xiDdiSaDkxYbRier91UaryqkJDQFQl42LX7NoSunFryqLN9d5RgJcGuakM05kd024EcXOZQyUl3c51y80u2IIfA10nu/HKGQtTHWRBiLDeGkQNcegzwjUK5/OvV5LsDVjz6jcN4HvI/h/dJm+U8yaGcElkeoLBwSHKqFFqZv7i+nmoXzYp6ObM6El5nEy4VvpLLVmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV9PR12MB9760.namprd12.prod.outlook.com (2603:10b6:408:2f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 10:51:30 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 10:51:30 +0000
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
Subject: [PATCH v4 08/13] mm: Add softleaf support for device private migration entries
Date: Fri, 30 Jan 2026 21:50:54 +1100
Message-Id: <20260130105059.51841-9-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130105059.51841-1-jniethe@nvidia.com>
References: <20260130105059.51841-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::9) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV9PR12MB9760:EE_
X-MS-Office365-Filtering-Correlation-Id: 002456f2-291c-4a1f-90e6-08de5fed8670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5CAYNNSdYJGzJfueegY9pc9Xen/WlVDQ2dMjBiBuv855vDm/fnEs5y0wUFzt?=
 =?us-ascii?Q?RJn+1EJgKUPMfsSlp+RDUcEV5PUdAyRX8FLnYeKHjj52l8qrJEeDzk+nUIxS?=
 =?us-ascii?Q?3JBGMzdBCn1tkfo6lD/JBY5GAAJPLFt0ILW8pc5LKt8JggZUbiBmFvgTuKxj?=
 =?us-ascii?Q?qlzHc3FAwAwBN6vxMt7D9EtHRz3iTs705YD1GhvproD+aLeuX9CINoQVMs3e?=
 =?us-ascii?Q?6jLEXCQTO4CSeX4D7YWVg6fAeRn/GoRaY9AkeuucH9k91fk0CvSVxdUZ/PMv?=
 =?us-ascii?Q?5tCMw1QC3kwSji+4+QS75T3Cj9VfHZUpGE2OrfAnHl4y1meUIKlFvtHSurmL?=
 =?us-ascii?Q?YPh5GdDYRjB1/2GkZn6LOfmLoPvoVCTmfTpiYzbZXyRlO2lTJQve3j+R0HRn?=
 =?us-ascii?Q?O41NHVhlkmpdI1Oq8TFsI9c92F7ojoIumKe3EHzPsqIEa1QCc+3Vydst7Drn?=
 =?us-ascii?Q?LJCItF1qvi01FCZqCm6Jk2KPKQJdgAlta4bGRk2Hxum1YbkuDyIsOY9COVIw?=
 =?us-ascii?Q?5MNr09qC4Z+K25VOKQLmSxD1Et3CEA5t7oy0/2jK/LqN0/QkdxXoz2WOH5Fo?=
 =?us-ascii?Q?PoMJO1CZD7SgTWGWZ9wh9Z44pho65bE9UTXeQlGMy/btX0j8twbxHUz/4krc?=
 =?us-ascii?Q?Sl7vuvTT10ElzVlaRHnXoYxScjGfDZfkFflMd57v4guiRIgjo/TR6v3BxVuu?=
 =?us-ascii?Q?kIwjJemkN2+SA8g1skbw3gkKBhfNcdJv6jghiYaxb3yr5I4hSCtfh7ki5auB?=
 =?us-ascii?Q?vjCvfsELqj4gx2AV7zK7J/j8MFED3B1UTuiB+k2DIDCT+6FaN2thHHBmZibD?=
 =?us-ascii?Q?mdCkXvi3mW8sK+rXI5hg4LJrrVGo1+y37/7EO0kYauc0KFtWpZGVpw8bTLVP?=
 =?us-ascii?Q?EtS8oNaeGtZchrfC7qgkYcTSU/M05TE3Qt+il14pSOiQr7nlKS+zuSZNy0sD?=
 =?us-ascii?Q?M7lM7Ot7vXlkezRqxB4PGGb4rRpCckx12KnThz4hQ2cPpT/8zUl8uXCK7Zht?=
 =?us-ascii?Q?U1T9f0ofxWEGE6KgQ7aZzLNAKWp38uRuIiGu3Mq8Eo75l4XMDC1uHUlDsKI/?=
 =?us-ascii?Q?bu/CcGZpoBlxvY3eFM8AHB5jEtEtpKXHWnsXk2ZEXVMTyPHEOm7MskJYJpEa?=
 =?us-ascii?Q?qyDOaqX6cLJi1tDrlIj9rNApe6snKE39N4ygJNDSPPlQFYK5zjKjyR/Vrvb9?=
 =?us-ascii?Q?XiALJVjiyYyXsFAe9ggUZ2USbi1aHFPM0hWk3pYScp+Tc2cq8aOvlM1wWnA7?=
 =?us-ascii?Q?O2VwPdpjXtL7sL4Li8PoKsXp2VHcH0MKei7Gkd5pMag6vH5YpNcEMCv1riXk?=
 =?us-ascii?Q?3Kx3EI1Oqs88/V5snLKYfYpjfL3Ayxl6j6HcFm44Nl+seVfgmsVFQeCLDo4i?=
 =?us-ascii?Q?9n7PiFNKjTw/fPUsFhH6mcLsOsdVVQawlugZmowiIzeyV91fPlKEJPDT4Pba?=
 =?us-ascii?Q?zvhWzXCAnUR07N45yJ/800Dc+e36KnPHbW/xFgZJaGtVH2VJAp9djfnHye2/?=
 =?us-ascii?Q?E2GwNU5A8EEqJm6OiSJM96UhqK7hSKYIR3q8WaAJDtVWfwlcCK3gIneRnyYo?=
 =?us-ascii?Q?UjGIuVCgVgBstpRUykA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lQ1ASFimfnTBspeDntd8tWk9x0nrvEO5FUPCzxKtbdXmtz56P4aaEdI0Se3g?=
 =?us-ascii?Q?mUP8W+PIfIZkU71gI3v6CCi8ma4DDHkkpul7Plf7oUKCk7OhNy6/L4Txgm4q?=
 =?us-ascii?Q?z55baKiDslxCQKYg9sXU1qgY9JU49qRcyaRLH6KJO8SR/TkgWANVFAezI1rm?=
 =?us-ascii?Q?IfWypRjgDveoC/UYyxY6PM/1gM6CWnau+OJ/9kwjSzvBtSmMYhwYPCViyjUA?=
 =?us-ascii?Q?ynmdfCJm+wKQObwZB1yHSb053/dS/uNpi0RKby+za+TbbUM9np2PqdtngejE?=
 =?us-ascii?Q?ZT5f4MPfwSKz1JVoK4PFRcj1mN2J7vGrbCc7kdGkjx3ZYrmvRbL9Zwf1bRo+?=
 =?us-ascii?Q?/bUxtB9XQK2P/ICnsWIz/lFGeceKvbuI9pnYlWtQceJ10eRcIdbS+bhoPdI+?=
 =?us-ascii?Q?V9tyQpn3cqBUwfHd5+mHAdH21vfvTX/SkwFjuD3dIub34W9M40x8Bz2TW0To?=
 =?us-ascii?Q?NnZmrLy5qO5B6VMPvpa/B7ntLfVuZ7jQd+5w1R4MM5Lo9h7cZQc5k6H8He1s?=
 =?us-ascii?Q?qDdgYph3Q2jH/NffFzJK7qxCl7xjQYTec9lF2WAbyvD49jB70hdF+MUsUjLS?=
 =?us-ascii?Q?0zgDPQUki7VgAhBgeRC6t9FeS1vt2USihMrnxYqmnHsWtZSo/QDO9qFZRl5g?=
 =?us-ascii?Q?OXRXZjsPFlXpf81XyxiwNZSJhlEdktCl6oep0f9pvQEQSg8VbsKMllQg0MPA?=
 =?us-ascii?Q?pTi5H28NBIEzeINiJFiFs0ffL7RyGuqK1H0R84mYb07h1lcUD5HZ/dFZlDb8?=
 =?us-ascii?Q?XoWM4sLFXPEbhrZc9bKH1FMXAbdBgj7YtXKrsj/Je9EJyupJ1AQQkuTqY+/Z?=
 =?us-ascii?Q?RSv4PkZstfeqy7HMfbXA7OJav0l2Tw+eVUmLGXYMF4n0k9XFxvaziZNAtGRa?=
 =?us-ascii?Q?N0VUggyERCeAnS7fzoqBhihujMk+JRXyy01wIIPpgNzzU62w6NeDTMzS3xxG?=
 =?us-ascii?Q?QzXLoj0zhOvanYm5qGJuWykCdW9AXDB8yvqBdvDT3ww8bo5kEm/3WOlm7l7H?=
 =?us-ascii?Q?bYBy2F7FHRL9X1mCRmERYRLkBnKEmlN7i1N+JCkqOW0QogbTyGh430Qlr1aE?=
 =?us-ascii?Q?cwzOAzIuD6LpHKNrX2IqVvc34u+e1n11a3IdTeC8fQ6+iLAoDNs6EpDpZCMy?=
 =?us-ascii?Q?ehSvROB/RilhDfUETOheQlLknLqp4GBzmjXHg5sCd+ubYCXGmusK2gQXX+T+?=
 =?us-ascii?Q?c777KboSWiePGctFXr+X4SFhKfiDqCUXeNK3rHdIvDkV75TzjnkiqqB33nFg?=
 =?us-ascii?Q?gX5sFWbABLM9hhyJN3odttyiXGZftpMuonR/JQbPHaEyW1eQ3lES/vbwZKKL?=
 =?us-ascii?Q?2Fi7WGWF437vK6h6Z+/k+AVCSXM4WRXgkzOY+kbHeb35bno4SM8ZrFaGY0ZH?=
 =?us-ascii?Q?fh3MD0A1lxV0oaPLD3/0eEsUSEjUHd245aTmJYJTabKv/kSTcoshp6DGpRNh?=
 =?us-ascii?Q?LWBY1I4i6kLcEBZ1790TdZSk8MBhPZT0o4ejAanBDjff4ILF4ihElFISUZax?=
 =?us-ascii?Q?ewHuODreTmw/+nsy6oFn8JpWXFe0lHVIFRqXqBkqnYI3IqOAsinBW5BAcJpz?=
 =?us-ascii?Q?jzTQkEy7WlEj1tSGQLwj3xtFW6YEFoxN47Gje2vcfpL8VtRUZAc8R98z+Zik?=
 =?us-ascii?Q?DlKLT0c9+NtuNwslZfCtspdy2cq9M6UYntJYD+MGnEtPhJuG3132ZN6LwqU0?=
 =?us-ascii?Q?sm2rahRWUTThf2NkApD2M2xXRx1jiF69uje17UTo1WvlJSYe0JbnwYN3LUxm?=
 =?us-ascii?Q?rmdKU3ATqQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002456f2-291c-4a1f-90e6-08de5fed8670
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 10:51:30.1847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewKPQdlzQckXrCAtLJIdYLmiNBZb6z5Cr9hiJry3SVRuKm3fy/KeIZqNb17RWWrh3Q10alTSlwEpaAQB75Dn/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9760
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16441-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: BB165B99BF
X-Rspamd-Action: no action

Add equivalent softleaf entries for the device private migration
swap entries:

  - SWP_MIGRATION_DEVICE_READ -> SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ
  - SWP_MIGRATION_DEVICE_WRITE -> SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE
  - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE -> SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE

As with their SWP_MIGRATION_DEVICE_xxx kin, the
SOFTLEAF_MIGRATION_DEVICE_PRIVATE_xxx types are used as specializations
of the SWP_MIGRATION_DEVICE_xxx types.

The new entry types have the following relationships:

  - SOFTLEAF_MIGRATION_DEVICE_READ is-a SOFTLEAF_MIGRATION_READ
  - SOFTLEAF_MIGRATION_READ !is-a SOFTLEAF_MIGRATION_DEVICE_READ

Update the existing softleaf_is_migration_xxx() predicates to reflect
this relationship.

It is possible to distinguish the between a
SOFTLEAF_MIGRATION_DEVICE__xxx and a SOFTLEAF_MIGRATION_xxx type using
the softleaf_is_migration_device_private_xxx() predicates.

In practice, the only reason for introducing this new type is so we know
when to not call pfn_to_page() on the swap entry offset once the device
private pages are removed from the physical address space. That is the
only time that the difference matters.

Creating these new entries will occur in a subsequent patch.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v3:
- Separated from previous patch
- s/SOFTLEAF_MIGRATION_DEVICE_/SOFTLEAF_MIGRATION_DEVICE_PRIVATE_/
- Update comment for softleaf_is_migration_read()
---
 include/linux/leafops.h | 90 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 80 insertions(+), 10 deletions(-)

diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index 52a1af3eb954..60681ada7b8e 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -28,6 +28,9 @@ enum softleaf_type {
 	SOFTLEAF_DEVICE_PRIVATE_READ,
 	SOFTLEAF_DEVICE_PRIVATE_WRITE,
 	SOFTLEAF_DEVICE_EXCLUSIVE,
+	SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ,
+	SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE,
+	SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE,
 	/* H/W posion types. */
 	SOFTLEAF_HWPOISON,
 	/* Marker types. */
@@ -165,6 +168,12 @@ static inline enum softleaf_type softleaf_type(softleaf_t entry)
 		return SOFTLEAF_DEVICE_PRIVATE_READ;
 	case SWP_DEVICE_EXCLUSIVE:
 		return SOFTLEAF_DEVICE_EXCLUSIVE;
+	case SWP_MIGRATION_DEVICE_READ:
+		return SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ;
+	case SWP_MIGRATION_DEVICE_WRITE:
+		return SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE;
+	case SWP_MIGRATION_DEVICE_READ_EXCLUSIVE:
+		return SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE;
 #endif
 #ifdef CONFIG_MEMORY_FAILURE
 	case SWP_HWPOISON:
@@ -190,28 +199,88 @@ static inline bool softleaf_is_swap(softleaf_t entry)
 	return softleaf_type(entry) == SOFTLEAF_SWAP;
 }
 
+/**
+ * softleaf_is_migration_device_private() - Is this leaf entry a migration
+ * device private entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is a device private entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private(softleaf_t entry)
+{
+	switch (softleaf_type(entry)) {
+	case SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ:
+	case SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE:
+	case SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/**
+ * softleaf_is_migration_device_private_write() - Is this leaf entry a writable
+ * device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is a writable device private migration entry,
+ * otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_write(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE;
+}
+
+/**
+ * softleaf_is_migration_device_private_read() - Is this leaf entry a readable
+ * device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is an readable device private migration
+ * entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_read(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ;
+}
+
+/**
+ * softleaf_is_migration_read_exclusive() - Is this leaf entry an exclusive
+ * readable device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is an exclusive readable device private
+ * migration entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_read_exclusive(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE;
+}
+
 /**
  * softleaf_is_migration_write() - Is this leaf entry a writable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is a writable migration entry, otherwise
- * false.
+ * Returns: true if the leaf entry is a writable migration entry or a writable
+ * device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_write(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE ||
+	       softleaf_is_migration_device_private_write(entry);
 }
 
 /**
  * softleaf_is_migration_read() - Is this leaf entry a readable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is a readable migration entry, otherwise
- * false.
+ * Returns: true if the leaf entry is a readable migration entry or a readable
+ * device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_read(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ ||
+	       softleaf_is_migration_device_private_read(entry);
 }
 
 /**
@@ -219,12 +288,13 @@ static inline bool softleaf_is_migration_read(softleaf_t entry)
  * readable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is an exclusive readable migration entry,
- * otherwise false.
+ * Returns: true if the leaf entry is an exclusive readable migration entry or
+ * exclusive readable device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_read_exclusive(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE ||
+	       softleaf_is_migration_device_private_read_exclusive(entry);
 }
 
 /**
@@ -241,7 +311,7 @@ static inline bool softleaf_is_migration(softleaf_t entry)
 	case SOFTLEAF_MIGRATION_WRITE:
 		return true;
 	default:
-		return false;
+		return softleaf_is_migration_device_private(entry);
 	}
 }
 
-- 
2.34.1


