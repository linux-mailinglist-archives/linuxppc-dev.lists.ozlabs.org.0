Return-Path: <linuxppc-dev+bounces-16456-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGyZIkaSfGkQNwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16456-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:13:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4A4B9EDA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:13:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2YHw2l64z2yr6;
	Fri, 30 Jan 2026 22:12:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c110::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769771532;
	cv=pass; b=O+IflmshcprdP+J4vYraru6RYbxYt1hcz4hRXJP+ZkvcKfCnoJytaV04C3COfanvc+ArDYoXb4CmQSOJUOAO1iYUpoP7TY+u67VD4ew32EPQmJpKZffpde5HYyGTIYjIG5GqfwHca07avwao4V3OZ+rR/B4xBouUAv2rYEFFh3AYx3FuoM+90o6J+i52wdMh4fwUMEFzSguN6i+Tlyskcrju2qzMfYEUoL2gBK8iMJZh7d6BZRVhiGPJvua1nySpWm68ahStTB8eIKGcqxsir8TP6pHZEt4hH35EakBcchHIsjxiuRbBTMgV60QNwHu2/Sm7ApF8jMhi6E1tJ06pxw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769771532; c=relaxed/relaxed;
	bh=ZaZfEon4PHNQ0JoMdhFXTEdF0OcQvG1hSkZ96yUJVkE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lX3ggUm5fnL6XKC9Tw43QDREzBg4vsG89lUQHvPzJtJ+xI7ab4TNTLc2MO3+hmyEAU4rfVfGi+9ZX+aG+MKaF37jCFAKSh4UR2mMg9zPFYLMGM5nszuzRRjjNEFlEOTVs/eQFP5JtusEL6KAvsh/m5FyZ5lrd2kJKvtdQddLLCCuNURekTAuaIlcsAdl7rtSpQTj0kwDXYsFQuYInp1atFH8vyuYd06Df0QIN7BVvnudmg7pp9vLgzTSO/YlmgZUhPpPqWOlcPnqr075VUeDFHh222nBTnl4+I3RsNnZa2xx2wCy/y0pKOSInRCjnUN/acc6/Vc+x+VCj8bIOfk77w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GnsDorPg; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c110::1; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GnsDorPg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c110::1; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c110::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2YHt4pTKz2ydq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 22:12:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njCPSLbxeofF6K+bzLiIfWNPZrXZRA/jf2HUcWAC7jP1uxFBPHCC1kMkcGBDL8SoZMTxrFjA+5VXVYHij1w6TKgZX1NS0DgZjqHVxL11C5Gz4V34fkVUAx51BlGRA5OPHfq4fqXadVeE1vlaMemMyhvvrjzGNFAKtpbfUMz/VkOeuzcncGjJ/EYmfNMa4QsYU+Qt2evd4fOCkBv76RF4q6swVEGRtfRbkrqc7OZhUCnnl7e6vXXbj88wBLhWRN1wW4JXGiyYhPoEov9ulbL5IIX06qDdZ1iZIC1wHiTPR9Jvt6psEbyHS7fY75Q87CofNQTYNE9AO1pjqsR8DbbytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaZfEon4PHNQ0JoMdhFXTEdF0OcQvG1hSkZ96yUJVkE=;
 b=GocDYx2YhIa7o9B7zywiGMrDx2tDSc13ZRD4KSPV+/fwZAoTJ8bLA9mnbfPbacOtEvQnuT34EegIz+tFTOwAqpSeLOBdalKMglgCegx/LXqvdoEK8m/M4w8DnECzRENFTNAqxGW3fyIX+w8b3kk7JrKxuKv/29XDOE71xPplGAzGcy15nC6WzOCIYRIFN1PcRGsD+IX4EaMolRmvFTy0bj8L9DZ2BR1Ls4pCIl5qr9QH7CuBeTCBPOpw62OfLPZ/bptk/DVc2ISFb222L4om0Y7NYr8C3ASfHIJKRhnsl+iheEQvZYx+E5NehYiuX2TwI931egc/xGw8UOzdI0RLyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaZfEon4PHNQ0JoMdhFXTEdF0OcQvG1hSkZ96yUJVkE=;
 b=GnsDorPgzgJMhuw333nfuSXkRvVLdMqb4v+JGn+P7PAE6igjKwLRldJeBICmFoVQLcegGb1omIHAEdWQBB934+ytYqTTf1/JdSNRQkfc4MzOfZByYokzZjwG70H2hWEWiw5qFUCuzyyLPnopg/VJ0lImGWkN8UMzAv8FGWaXTiDtWYKLpIs/WHLDfI8FPPmB3tFkpOLLyeOLrVZlzklw5jNAPyUEpuptzfOKyoe3ovyFk5KCwF2uJ0rduTnouHTE7439peDYoy+iYHq1hi+ZJz7GEBzK4aFNnHcxB7dwOs00B9t8OwIKvw1xgtraztM7OYw/BlhWBtcahjmI83xr/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 SN7PR12MB7836.namprd12.prod.outlook.com (2603:10b6:806:34e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.11; Fri, 30 Jan 2026 11:11:41 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 11:11:41 +0000
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
Subject: [PATCH v5 13/13] mm: Remove device private pages from the physical address space
Date: Fri, 30 Jan 2026 22:10:50 +1100
Message-Id: <20260130111050.53670-14-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130111050.53670-1-jniethe@nvidia.com>
References: <20260130111050.53670-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::12) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 71c9f190-5738-4cf4-2e98-08de5ff05830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eFDVt4y0Ao7q2JNc8DiKyaIfclCpNS+oIbFunHaDqShe4MtOA0oD0ukmkEm4?=
 =?us-ascii?Q?PJNna9z4JJAOYHEAOI2f+te92JNYqyYKjAuaSE0MDjCG+QpQhsu7xVUS8/BI?=
 =?us-ascii?Q?Bk/2EbDvsfkxLuoXFlyEPqbGYFeISqIHdNNd6YWutEguVeNhCRsdWjviipM/?=
 =?us-ascii?Q?esQKIfAz5dQxbJzkQNyUjZ0k+UCyr013ML/A4tjJ6Rc9/awPDzyDxwhVkGru?=
 =?us-ascii?Q?hGIf0y7CKifBZRBE3o6yFF7bZqtGBhdQe+wqKBNDAV33Xal4O2DmTgNVAu+K?=
 =?us-ascii?Q?BYHfi9mzcoV+ksEVmQ4bV2FIV/ichHogaGE17CCbHtAepSf5RwLGpTRjKMqa?=
 =?us-ascii?Q?RPk264Fr8YKOh1KSzf9SVOc7FMfD1ShZVVwyPwPCxzDWFjVrlevW6ZRa8kS+?=
 =?us-ascii?Q?Y+IBTH5tNzJe3XSskoiXMJH7cXSEB1j+yxn/q61jz19PBQfQfmxqbDPAREMb?=
 =?us-ascii?Q?u8xkHWnR3tDk6VGyAH8DHgt4KVfle3kRoWRprmqgX6l60FbbDzZU7WXHxiNa?=
 =?us-ascii?Q?i4g+ihIKkCxDicl+Xt7fLmyYyTsTvsNL0wjQECdNQkkxlqYwn0xCraTvX1UT?=
 =?us-ascii?Q?SJ8Y33kZaAOGYO0N1dzqc46epIa8lqcfPBqgn0mAjkxqdDnwB/xSrh/2TExg?=
 =?us-ascii?Q?GgTTLDhFgEbMYjCoqLRH/3ZjG8gsrc5DhdGIWxstl+D+ln5lYxPawZ2/HvqC?=
 =?us-ascii?Q?bBbB0SIkhk/NXTrrgA+z1Yrj+yw9TAqUc3F8Tk2sTDGoEtgD+sqyflYc/ASM?=
 =?us-ascii?Q?zmS63K0l28fMEZ52wPq+MDucI/fJt/jb1hO0XyuxCWJ0i4jGUHAtoR4le1zB?=
 =?us-ascii?Q?hnUV7kyWQgejAcIZBUXA6hjov4vE5F44oBtQe4/NXXVCBaJmpUB2DrCY0/K0?=
 =?us-ascii?Q?EkgdlBtKZnOiJZrVQpiEXfFvFhREPZuz7Tj57GJBJi4rQph9jit6B6bzBgsi?=
 =?us-ascii?Q?oRlgEdexRmOakVI+ss3tE+e+BvurXqnUZhqX5qMBWqtVqK9VDlWZVv/Hqzt+?=
 =?us-ascii?Q?kFIDEt3Ei6dIqlX4oXWTtbly6hX9D7Xk6fSjxDIkSJdrkIg7nST78zi08Iwo?=
 =?us-ascii?Q?nclJcpnUsmsnhiWT1YywMr20m6sSODZkmE4vAUW2Q1DoGRGEzfJFuJASOuLY?=
 =?us-ascii?Q?euJrQ8KwwARwJeKQGorXnVu0/jocXIouF1W6a3d5msU/jhjWeRuXgyosN98e?=
 =?us-ascii?Q?VTmbkzCGXSu+z4PJU4qMQv43fDSq0m6R+jfEvT1R1/tUcWadRexpQkChtQoT?=
 =?us-ascii?Q?RhlLon5tRD/KcVURTsenYp26XhfSdizNxSa3LI07m9/RFPH21aJxQjjMZPQM?=
 =?us-ascii?Q?Irs19KXiJG65MGzC8AK1ZEmctJ4PGReJqMWQ7imS8QXldP5OqFdVJes+XKUP?=
 =?us-ascii?Q?/eAi72XV/0OfttJEwH9Bh0AXzgSoAGcbuQiuGsxwsfdFanyh1L8rN9FvlDWL?=
 =?us-ascii?Q?RepKXG3gNKipNpilMc87eSolNwdzxXzMaRn1r62q62EibRP9txi74CsQAbH7?=
 =?us-ascii?Q?vwLZp3B/+VhEVsChitTc/6MQ5w/7AI/+/RLzcXE0JgfOC91acsKmquXNHTH7?=
 =?us-ascii?Q?FciHkLtJueRiP022Ja8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2/YbC29veA8d13aqimKSj5A7VZHqJMBkmLQ1kIEXeou0ienoFCMwqqcJsunT?=
 =?us-ascii?Q?ycGJaFPCRKr7aCyu8BMKiewoNWCZpdO6OcDA+dhtjCVovjGjK3+M7ZTFTV1L?=
 =?us-ascii?Q?RY1LVo5S5mW6mlzDQLoc3zTHlaIn3tVORujD2lLU5CQd1rSetG2UdWHvtxr0?=
 =?us-ascii?Q?sEXc6aLC8z/e09V7GPUQbFzNWZNFZM7rfDFjrlxyV4U/mPvbd1sjQGN97Y39?=
 =?us-ascii?Q?hD0vEfoictWCRlB53YnfH0uP7SmqsIJWoaVyC6Q3m9JD4ip4Z2MKxh/jQHdr?=
 =?us-ascii?Q?evdPB0Rn7BAv3c8B7Njq/fYd3koAIi1kevjGsUaJFeXBJHJhZZ8dsu8CxBxO?=
 =?us-ascii?Q?HceE6QtHBcyRthw65v4csT9K6K63CAsxWZ/X0y8RpiexllQqHoSVJCgE6KNq?=
 =?us-ascii?Q?UegodxctG4rr2OFYPnJksu0RNj6AOjGe9Sk6RNbQ5Mq7oBmPKveQEOKOb+q3?=
 =?us-ascii?Q?C31YBb69dg0VMSxjdeUTnR3OZuiCFlAb5ruOp224JFjIpBOTsthphbmDyml8?=
 =?us-ascii?Q?lqUu9DARQDFQwwucv6t9fJLiscIkym61pAYHFF96YpBNpzV/k0fADVgiu93i?=
 =?us-ascii?Q?6Knyr6ZLblnp2pa/14DXXrGLoSJ+cFAJdaAUvJJRenE4D8pcIRQvSMLOCPPc?=
 =?us-ascii?Q?EY7cQnSzIZcwcB+QgZUcbrb02b4i84FdjKyYFcnd6iJfMHeHz47S/3UyuaXG?=
 =?us-ascii?Q?e26vZgPeY6F/j0pvNIJ6DWwUnJ61ONTkOFZ+vtDtFAOKZsITgLB/h3Cnt33P?=
 =?us-ascii?Q?AKf+XQvlXK34ooWQfveEArLFWta56fWaZZB6xiwQdzzkdROJtqO1wV7PbRxm?=
 =?us-ascii?Q?SA7iyMA2vF1+melaFAa9tDLV2mjVU6VDYn0JjHcB9NP3YyBxijlvgMOsKcLr?=
 =?us-ascii?Q?a9ov5d6C98wUjshDX1Ahma2VV+QyzcHSQgncqAzOa9tt936XdpHy6HSjxqd4?=
 =?us-ascii?Q?WiKdKsGyiSM83Eguym8YSBd7lMEkibG4j6ky2blKaXzWMvKX4UftK4cJD+GG?=
 =?us-ascii?Q?IsV/W0mkWfwvYOyf/EZFHEOcNRUI5hnD/2N/hKG+lU3tkwl+OkzTR8G7duen?=
 =?us-ascii?Q?EpDqQOKPRthK7Ds56vr1BkrRAQZrgjn3ditatxgaDVYllapfYYS8hMNeljX/?=
 =?us-ascii?Q?EifrrgnIebodaNTpdSqTuBsOVxDRtYeNAtDBcLVYe//QRgfwiYgHtqWH0x3n?=
 =?us-ascii?Q?/2MuNjFICs6w6Q6ujhdXY+mnIDsrXOL1xClgtL8TpcX7gTBZC/D55+w4b6Fn?=
 =?us-ascii?Q?7musJ5yjoMFgUkopMGjBvDqM5Pvf6Wq+Aksp6SfvyaIDoj6N0jGw0d1FRW7o?=
 =?us-ascii?Q?EpKuxbQxLzEOgA3CScHFEnvyDB1ZON4Me/GQCFPw6L2HyFvHxOzb23e9nk01?=
 =?us-ascii?Q?wA7lS5d903FpIaZcMFOYPmlSe5bTZ63hkTtK8CTDusvhC7TXoYajw7Y4Gt+W?=
 =?us-ascii?Q?tIiPiUHAN8WSu1eMxQz4DmhGeo9r4y3pb0/zAjr/9zNJ732dJUNSV8EWKYqt?=
 =?us-ascii?Q?tsFwsO3myrBG7YVAuXVBy19iqGSVt5RIk/kTRFK6784OtQd07og4rc+yeIcs?=
 =?us-ascii?Q?fd/chzMJIgZKDrd9+W5WQB4AbWtyTWoB6N3i0xvdoF7nTys1O3hXCEK60LcG?=
 =?us-ascii?Q?p+HOJyzAFxgBLIs2m/xXRrrUvfnlIlojoWQw6F5ddRm0nUkdW6sHI/5WFgj7?=
 =?us-ascii?Q?WlkFS5t6p0IsqetNIltdVYmewMqED02r2JItOWI7eNYvpD+chtleOOH7LTcQ?=
 =?us-ascii?Q?AQvIsma2tA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c9f190-5738-4cf4-2e98-08de5ff05830
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 11:11:41.2634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLCD0PIsgp0jEpXbX4RH1RyxqpXimneXx246jmmIZ1kJM13vUvjXvQVRoHjuMlGCyK/Adw9Jf0pqgCraiKLkng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7836
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16456-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,amd.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 6C4A4B9EDA
X-Rspamd-Action: no action

The existing design of device private memory imposes limitations which
render it non functional for certain systems and configurations where
the physical address space is limited.

Device private memory is implemented by first reserving a region of the
physical address space. This is a problem. The physical address space is
not a resource that is directly under the kernel's control. Availability
of suitable physical address space is constrained by the underlying
hardware and firmware and may not always be available.

Device private memory assumes that it will be able to reserve a device
memory sized chunk of physical address space. However, there is nothing
guaranteeing that this will succeed, and there a number of factors that
increase the likelihood of failure. We need to consider what else may
exist in the physical address space. It is observed that certain VM
configurations place very large PCI windows immediately after RAM. Large
enough that there is no physical address space available at all for
device private memory. This is more likely to occur on 43 bit physical
width systems which have less physical address space.

Instead of using the physical address space, introduce a device private
address space and allocate devices regions from there to represent the
device private pages.

Introduce a new interface memremap_device_private_pagemap() that
allocates a requested amount of device private address space and creates
the necessary device private pages.

To support this new interface, struct dev_pagemap needs some changes:

  - Add a new dev_pagemap::nr_pages field as an input parameter.
  - Add a new dev_pagemap::pages array to store the device
    private pages.

When using memremap_device_private_pagemap(), rather then passing in
dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space to
be remapped, dev_pagemap::nr_ranges will always be 1, and the device
private range that is reserved is returned in dev_pagemap::range.

Forbid calling memremap_pages() with dev_pagemap::ranges::type =
MEMORY_DEVICE_PRIVATE.

Represent this device private address space using a new
device_private_pgmap_tree maple tree. This tree maps a given device
private address to a struct dev_pagemap, where a specific device private
page may then be looked up in that dev_pagemap::pages array.

Device private address space can be reclaimed and the assoicated device
private pages freed using the corresponding new
memunmap_device_private_pagemap() interface.

Because the device private pages now live outside the physical address
space, they no longer have a normal PFN. This means that page_to_pfn(),
et al. are no longer meaningful.

Introduce helpers:

  - device_private_page_to_offset()
  - device_private_folio_to_offset()

to take a given device private page / folio and return its offset within
the device private address space.

Update the places where we previously converted a device private page to
a PFN to use these new helpers. When we encounter a device private
offset, instead of looking up its page within the pagemap use
device_private_offset_to_page() instead.

Update the existing users:

 - lib/test_hmm.c
 - ppc ultravisor
 - drm/amd/amdkfd
 - gpu/drm/xe
 - gpu/drm/nouveau

to use the new memremap_device_private_pagemap() interface.

Acked-by: Felix Kuehling <felix.kuehling@amd.com>
Reviewed-by: Zi Yan <ziy@nvidia.com> # for MM changes
Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>

---
v1:
- Include NUMA node paramater for memremap_device_private_pagemap()
- Add devm_memremap_device_private_pagemap() and friends
- Update existing users of memremap_pages():
    - ppc ultravisor
    - drm/amd/amdkfd
    - gpu/drm/xe
    - gpu/drm/nouveau
- Update for HMM huge page support
- Guard device_private_offset_to_page and friends with CONFIG_ZONE_DEVICE

v2:
- Make sure last member of struct dev_pagemap remains DECLARE_FLEX_ARRAY(struct range, ranges);

v3:
- Use numa_mem_id() if memremap_device_private_pagemap is called with
  NUMA_NO_NODE. This fixes a null pointer deref in
  lruvec_stat_mod_folio().
- drm/xe: Remove call to devm_release_mem_region() in xe_pagemap_destroy_work()
- s/VM_BUG/VM_WARN/

v4:
- Use devm_memunmap_device_private_pagemap() in
  xe_pagemap_destroy_work()
- Replace ^ with != for PVMW_DEVICE_PRIVATE comparisions
- Minor style changes
- remove discussion of aarch64 from commit message - not relevant post
  eeb8fdfcf090 ("arm64: Expose the end of the linear map in PHYSMEM_END")
---
 Documentation/mm/hmm.rst                 |  11 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  41 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  23 +--
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  35 ++--
 drivers/gpu/drm/xe/xe_svm.c              |  30 +---
 include/linux/hmm.h                      |   3 +
 include/linux/leafops.h                  |  16 +-
 include/linux/memremap.h                 |  64 +++++++-
 include/linux/migrate.h                  |   6 +-
 include/linux/mm.h                       |   2 +
 include/linux/rmap.h                     |   5 +
 include/linux/swapops.h                  |  10 +-
 lib/test_hmm.c                           |  70 ++++----
 mm/debug.c                               |   9 +-
 mm/memremap.c                            | 196 ++++++++++++++++++-----
 mm/mm_init.c                             |   8 +-
 mm/page_vma_mapped.c                     |  22 ++-
 mm/rmap.c                                |  43 +++--
 mm/util.c                                |   5 +-
 19 files changed, 397 insertions(+), 202 deletions(-)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index 7d61b7a8b65b..27067a6a2408 100644
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@ -276,17 +276,12 @@ These can be allocated and freed with::
     struct resource *res;
     struct dev_pagemap pagemap;
 
-    res = request_free_mem_region(&iomem_resource, /* number of bytes */,
-                                  "name of driver resource");
     pagemap.type = MEMORY_DEVICE_PRIVATE;
-    pagemap.range.start = res->start;
-    pagemap.range.end = res->end;
-    pagemap.nr_range = 1;
+    pagemap.nr_pages = /* number of pages */;
     pagemap.ops = &device_devmem_ops;
-    memremap_pages(&pagemap, numa_node_id());
+    memremap_device_private_pagemap(&pagemap, numa_node_id());
 
-    memunmap_pages(&pagemap);
-    release_mem_region(pagemap.range.start, range_len(&pagemap.range));
+    memunmap_device_private_pagemap(&pagemap);
 
 There are also devm_request_free_mem_region(), devm_memremap_pages(),
 devm_memunmap_pages(), and devm_release_mem_region() when the resources can
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 67910900af7b..948747db8231 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -636,7 +636,7 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *slot,
 		mutex_lock(&kvm->arch.uvmem_lock);
 
 		if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
-			uvmem_page = pfn_to_page(uvmem_pfn);
+			uvmem_page = device_private_offset_to_page(uvmem_pfn);
 			pvt = uvmem_page->zone_device_data;
 			pvt->skip_page_out = skip_page_out;
 			pvt->remove_gfn = true;
@@ -721,7 +721,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
 	pvt->gpa = gpa;
 	pvt->kvm = kvm;
 
-	dpage = pfn_to_page(uvmem_pfn);
+	dpage = device_private_offset_to_page(uvmem_pfn);
 	dpage->zone_device_data = pvt;
 	zone_device_page_init(dpage, 0);
 	return dpage;
@@ -888,7 +888,7 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 	mutex_lock(&kvm->arch.uvmem_lock);
 	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
-		uvmem_page = pfn_to_page(uvmem_pfn);
+		uvmem_page = device_private_offset_to_page(uvmem_pfn);
 		pvt = uvmem_page->zone_device_data;
 		pvt->skip_page_out = true;
 		/*
@@ -906,7 +906,7 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 
 	mutex_lock(&kvm->arch.uvmem_lock);
 	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
-		uvmem_page = pfn_to_page(uvmem_pfn);
+		uvmem_page = device_private_offset_to_page(uvmem_pfn);
 		pvt = uvmem_page->zone_device_data;
 		pvt->skip_page_out = true;
 		pvt->remove_gfn = false; /* it continues to be a valid GFN */
@@ -1017,7 +1017,7 @@ static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
 static void kvmppc_uvmem_folio_free(struct folio *folio)
 {
 	struct page *page = &folio->page;
-	unsigned long pfn = page_to_pfn(page) -
+	unsigned long pfn = device_private_page_to_offset(page) -
 			(kvmppc_uvmem_pgmap.range.start >> PAGE_SHIFT);
 	struct kvmppc_uvmem_page_pvt *pvt;
 
@@ -1159,8 +1159,6 @@ int kvmppc_uvmem_init(void)
 {
 	int ret = 0;
 	unsigned long size;
-	struct resource *res;
-	void *addr;
 	unsigned long pfn_last, pfn_first;
 
 	size = kvmppc_get_secmem_size();
@@ -1174,27 +1172,18 @@ int kvmppc_uvmem_init(void)
 		goto out;
 	}
 
-	res = request_free_mem_region(&iomem_resource, size, "kvmppc_uvmem");
-	if (IS_ERR(res)) {
-		ret = PTR_ERR(res);
-		goto out;
-	}
-
 	kvmppc_uvmem_pgmap.type = MEMORY_DEVICE_PRIVATE;
-	kvmppc_uvmem_pgmap.range.start = res->start;
-	kvmppc_uvmem_pgmap.range.end = res->end;
 	kvmppc_uvmem_pgmap.nr_range = 1;
+	kvmppc_uvmem_pgmap.nr_pages = size / PAGE_SIZE;
 	kvmppc_uvmem_pgmap.ops = &kvmppc_uvmem_ops;
 	/* just one global instance: */
 	kvmppc_uvmem_pgmap.owner = &kvmppc_uvmem_pgmap;
-	addr = memremap_pages(&kvmppc_uvmem_pgmap, NUMA_NO_NODE);
-	if (IS_ERR(addr)) {
-		ret = PTR_ERR(addr);
-		goto out_free_region;
-	}
+	ret = memremap_device_private_pagemap(&kvmppc_uvmem_pgmap, NUMA_NO_NODE);
+	if (ret)
+		goto out;
 
-	pfn_first = res->start >> PAGE_SHIFT;
-	pfn_last = pfn_first + (resource_size(res) >> PAGE_SHIFT);
+	pfn_first = kvmppc_uvmem_pgmap.range.start >> PAGE_SHIFT;
+	pfn_last = pfn_first + (range_len(&kvmppc_uvmem_pgmap.range) >> PAGE_SHIFT);
 	kvmppc_uvmem_bitmap = bitmap_zalloc(pfn_last - pfn_first, GFP_KERNEL);
 	if (!kvmppc_uvmem_bitmap) {
 		ret = -ENOMEM;
@@ -1204,9 +1193,7 @@ int kvmppc_uvmem_init(void)
 	pr_info("KVMPPC-UVMEM: Secure Memory size 0x%lx\n", size);
 	return ret;
 out_unmap:
-	memunmap_pages(&kvmppc_uvmem_pgmap);
-out_free_region:
-	release_mem_region(res->start, size);
+	memunmap_device_private_pagemap(&kvmppc_uvmem_pgmap);
 out:
 	return ret;
 }
@@ -1216,8 +1203,6 @@ void kvmppc_uvmem_free(void)
 	if (!kvmppc_uvmem_bitmap)
 		return;
 
-	memunmap_pages(&kvmppc_uvmem_pgmap);
-	release_mem_region(kvmppc_uvmem_pgmap.range.start,
-			   range_len(&kvmppc_uvmem_pgmap.range));
+	memunmap_device_private_pagemap(&kvmppc_uvmem_pgmap);
 	bitmap_free(kvmppc_uvmem_bitmap);
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 5478e41877e5..7e1450e56531 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -1030,9 +1030,9 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
 {
 	struct amdgpu_kfd_dev *kfddev = &adev->kfd;
 	struct dev_pagemap *pgmap;
-	struct resource *res = NULL;
 	unsigned long size;
 	void *r;
+	int ret;
 
 	/* Page migration works on gfx9 or newer */
 	if (amdgpu_ip_version(adev, GC_HWIP, 0) < IP_VERSION(9, 0, 1))
@@ -1053,11 +1053,7 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
 		pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
 		pgmap->type = MEMORY_DEVICE_COHERENT;
 	} else {
-		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
-		if (IS_ERR(res))
-			return PTR_ERR(res);
-		pgmap->range.start = res->start;
-		pgmap->range.end = res->end;
+		pgmap->nr_pages = size / PAGE_SIZE;
 		pgmap->type = MEMORY_DEVICE_PRIVATE;
 	}
 
@@ -1068,14 +1064,19 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
 	/* Device manager releases device-specific resources, memory region and
 	 * pgmap when driver disconnects from device.
 	 */
-	r = devm_memremap_pages(adev->dev, pgmap);
-	if (IS_ERR(r)) {
+	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
+		ret = devm_memremap_device_private_pagemap(adev->dev, pgmap);
+	} else {
+		r = devm_memremap_pages(adev->dev, pgmap);
+		if (IS_ERR(r))
+			ret = PTR_ERR(r);
+	}
+
+	if (ret) {
 		pr_err("failed to register HMM device memory\n");
-		if (pgmap->type == MEMORY_DEVICE_PRIVATE)
-			devm_release_mem_region(adev->dev, res->start, resource_size(res));
 		/* Disable SVM support capability */
 		pgmap->type = 0;
-		return PTR_ERR(r);
+		return ret;
 	}
 
 	pr_debug("reserve %ldMB system memory for VRAM pages struct\n",
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index adfa3df5cbc5..37fe1cfba414 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -109,7 +109,7 @@ static struct nouveau_drm *page_to_drm(struct page *page)
 unsigned long nouveau_dmem_page_addr(struct page *page)
 {
 	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(page);
-	unsigned long off = (page_to_pfn(page) << PAGE_SHIFT) -
+	unsigned long off = (device_private_page_to_offset(page) << PAGE_SHIFT) -
 				chunk->pagemap.range.start;
 
 	return chunk->bo->offset + off;
@@ -297,9 +297,7 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
 			 bool is_large)
 {
 	struct nouveau_dmem_chunk *chunk;
-	struct resource *res;
 	struct page *page;
-	void *ptr;
 	unsigned long i, pfn_first, pfn;
 	int ret;
 
@@ -309,39 +307,28 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
 		goto out;
 	}
 
-	/* Allocate unused physical address space for device private pages. */
-	res = request_free_mem_region(&iomem_resource, DMEM_CHUNK_SIZE * NR_CHUNKS,
-				      "nouveau_dmem");
-	if (IS_ERR(res)) {
-		ret = PTR_ERR(res);
-		goto out_free;
-	}
-
 	chunk->drm = drm;
 	chunk->pagemap.type = MEMORY_DEVICE_PRIVATE;
-	chunk->pagemap.range.start = res->start;
-	chunk->pagemap.range.end = res->end;
 	chunk->pagemap.nr_range = 1;
+	chunk->pagemap.nr_pages = DMEM_CHUNK_SIZE * NR_CHUNKS / PAGE_SIZE;
 	chunk->pagemap.ops = &nouveau_dmem_pagemap_ops;
 	chunk->pagemap.owner = drm->dev;
 
 	ret = nouveau_bo_new_pin(&drm->client, NOUVEAU_GEM_DOMAIN_VRAM, DMEM_CHUNK_SIZE,
 				 &chunk->bo);
 	if (ret)
-		goto out_release;
+		goto out_free;
 
-	ptr = memremap_pages(&chunk->pagemap, numa_node_id());
-	if (IS_ERR(ptr)) {
-		ret = PTR_ERR(ptr);
+	ret = memremap_device_private_pagemap(&chunk->pagemap, numa_node_id());
+	if (ret)
 		goto out_bo_free;
-	}
 
 	mutex_lock(&drm->dmem->mutex);
 	list_add(&chunk->list, &drm->dmem->chunks);
 	mutex_unlock(&drm->dmem->mutex);
 
 	pfn_first = chunk->pagemap.range.start >> PAGE_SHIFT;
-	page = pfn_to_page(pfn_first);
+	page = device_private_offset_to_page(pfn_first);
 	spin_lock(&drm->dmem->lock);
 
 	pfn = pfn_first;
@@ -350,12 +337,12 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
 
 		if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) || !is_large) {
 			for (j = 0; j < DMEM_CHUNK_NPAGES - 1; j++, pfn++) {
-				page = pfn_to_page(pfn);
+				page = device_private_offset_to_page(pfn);
 				page->zone_device_data = drm->dmem->free_pages;
 				drm->dmem->free_pages = page;
 			}
 		} else {
-			page = pfn_to_page(pfn);
+			page = device_private_offset_to_page(pfn);
 			page->zone_device_data = drm->dmem->free_folios;
 			drm->dmem->free_folios = page_folio(page);
 			pfn += DMEM_CHUNK_NPAGES;
@@ -382,8 +369,6 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
 
 out_bo_free:
 	nouveau_bo_unpin_del(&chunk->bo);
-out_release:
-	release_mem_region(chunk->pagemap.range.start, range_len(&chunk->pagemap.range));
 out_free:
 	kfree(chunk);
 out:
@@ -543,9 +528,7 @@ nouveau_dmem_fini(struct nouveau_drm *drm)
 		nouveau_bo_unpin_del(&chunk->bo);
 		WARN_ON(chunk->callocated);
 		list_del(&chunk->list);
-		memunmap_pages(&chunk->pagemap);
-		release_mem_region(chunk->pagemap.range.start,
-				   range_len(&chunk->pagemap.range));
+		memunmap_device_private_pagemap(&chunk->pagemap);
 		kfree(chunk);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index a8aad9e0b1fb..aadc73b6f951 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -452,7 +452,7 @@ static u64 xe_page_to_dpa(struct page *page)
 	struct xe_pagemap *xpagemap = xe_page_to_pagemap(page);
 	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
 	u64 hpa_base = xpagemap->hpa_base;
-	u64 pfn = page_to_pfn(page);
+	u64 pfn = device_private_page_to_offset(page);
 	u64 offset;
 	u64 dpa;
 
@@ -1699,9 +1699,7 @@ static void xe_pagemap_destroy_work(struct work_struct *work)
 	 * will do shortly.
 	 */
 	if (drm_dev_enter(drm, &idx)) {
-		devm_memunmap_pages(drm->dev, pagemap);
-		devm_release_mem_region(drm->dev, pagemap->range.start,
-					pagemap->range.end - pagemap->range.start + 1);
+		devm_memunmap_device_private_pagemap(drm->dev, pagemap);
 		drm_dev_exit(idx);
 	}
 
@@ -1745,8 +1743,6 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
 	struct xe_pagemap *xpagemap;
 	struct dev_pagemap *pagemap;
 	struct drm_pagemap *dpagemap;
-	struct resource *res;
-	void *addr;
 	int err;
 
 	xpagemap = kzalloc(sizeof(*xpagemap), GFP_KERNEL);
@@ -1763,36 +1759,24 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
 	if (err)
 		goto out_no_dpagemap;
 
-	res = devm_request_free_mem_region(dev, &iomem_resource,
-					   vr->usable_size);
-	if (IS_ERR(res)) {
-		err = PTR_ERR(res);
-		goto out_err;
-	}
-
 	err = drm_pagemap_acquire_owner(&xpagemap->peer, &xe_owner_list,
 					xe_has_interconnect);
 	if (err)
-		goto out_no_owner;
+		goto out_err;
 
 	pagemap->type = MEMORY_DEVICE_PRIVATE;
-	pagemap->range.start = res->start;
-	pagemap->range.end = res->end;
 	pagemap->nr_range = 1;
+	pagemap->nr_pages = vr->usable_size / PAGE_SIZE;
 	pagemap->owner = xpagemap->peer.owner;
 	pagemap->ops = drm_pagemap_pagemap_ops_get();
-	addr = devm_memremap_pages(dev, pagemap);
-	if (IS_ERR(addr)) {
-		err = PTR_ERR(addr);
+	err = devm_memremap_device_private_pagemap(dev, pagemap);
+	if (err)
 		goto out_no_pages;
-	}
-	xpagemap->hpa_base = res->start;
+	xpagemap->hpa_base = pagemap->range.start;
 	return xpagemap;
 
 out_no_pages:
 	drm_pagemap_release_owner(&xpagemap->peer);
-out_no_owner:
-	devm_release_mem_region(dev, res->start, res->end - res->start + 1);
 out_err:
 	drm_pagemap_put(dpagemap);
 	return ERR_PTR(err);
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index d8756c341620..25bb4df298f7 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -68,6 +68,9 @@ enum hmm_pfn_flags {
  */
 static inline struct page *hmm_pfn_to_page(unsigned long hmm_pfn)
 {
+	if (hmm_pfn & HMM_PFN_DEVICE_PRIVATE)
+		return device_private_offset_to_page(hmm_pfn & ~HMM_PFN_FLAGS);
+
 	return pfn_to_page(hmm_pfn & ~HMM_PFN_FLAGS);
 }
 
diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index 60681ada7b8e..612c8e91b775 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -455,7 +455,13 @@ static inline unsigned long softleaf_to_flags(softleaf_t entry)
  */
 static inline struct page *softleaf_to_page(softleaf_t entry)
 {
-	struct page *page = pfn_to_page(softleaf_to_pfn(entry));
+	struct page *page;
+
+	if (softleaf_is_migration_device_private(entry) ||
+	    softleaf_is_device_private(entry))
+		page = device_private_entry_to_page(entry);
+	else
+		page = pfn_to_page(softleaf_to_pfn(entry));
 
 	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
 	/*
@@ -475,7 +481,13 @@ static inline struct page *softleaf_to_page(softleaf_t entry)
  */
 static inline struct folio *softleaf_to_folio(softleaf_t entry)
 {
-	struct folio *folio = pfn_folio(softleaf_to_pfn(entry));
+	struct folio *folio;
+
+	if (softleaf_is_migration_device_private(entry) ||
+	    softleaf_is_device_private(entry))
+		folio = page_folio(device_private_entry_to_page(entry));
+	else
+		folio = pfn_folio(softleaf_to_pfn(entry));
 
 	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
 	/*
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 713ec0435b48..d702eb52dab9 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -37,6 +37,7 @@ struct vmem_altmap {
  * backing the device memory. Doing so simplifies the implementation, but it is
  * important to remember that there are certain points at which the struct page
  * must be treated as an opaque object, rather than a "normal" struct page.
+ * Unlike "normal" struct pages, the page_to_pfn() is invalid.
  *
  * A more complete discussion of unaddressable memory may be found in
  * include/linux/hmm.h and Documentation/mm/hmm.rst.
@@ -126,8 +127,12 @@ struct dev_pagemap_ops {
  * @owner: an opaque pointer identifying the entity that manages this
  *	instance.  Used by various helpers to make sure that no
  *	foreign ZONE_DEVICE memory is accessed.
- * @nr_range: number of ranges to be mapped
- * @range: range to be mapped when nr_range == 1
+ * @nr_pages: number of pages requested to be mapped for MEMORY_DEVICE_PRIVATE.
+ * @pages: array of nr_pages initialized for MEMORY_DEVICE_PRIVATE.
+ * @nr_range: number of ranges to be mapped. Always == 1 for
+ *	MEMORY_DEVICE_PRIVATE.
+ * @range: range to be mapped when nr_range == 1. Used as an output param for
+ *	MEMORY_DEVICE_PRIVATE.
  * @ranges: array of ranges to be mapped when nr_range > 1
  */
 struct dev_pagemap {
@@ -139,6 +144,8 @@ struct dev_pagemap {
 	unsigned long vmemmap_shift;
 	const struct dev_pagemap_ops *ops;
 	void *owner;
+	unsigned long nr_pages;
+	struct page *pages;
 	int nr_range;
 	union {
 		struct range range;
@@ -224,7 +231,14 @@ static inline bool is_fsdax_page(const struct page *page)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
+void __init_zone_device_page(struct page *page, unsigned long pfn,
+			     unsigned long zone_idx, int nid,
+			     struct dev_pagemap *pgmap);
 void zone_device_page_init(struct page *page, unsigned int order);
+unsigned long memremap_device_private_pagemap(struct dev_pagemap *pgmap, int nid);
+void memunmap_device_private_pagemap(struct dev_pagemap *pgmap);
+int devm_memremap_device_private_pagemap(struct device *dev, struct dev_pagemap *pgmap);
+void devm_memunmap_device_private_pagemap(struct device *dev, struct dev_pagemap *pgmap);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
 void memunmap_pages(struct dev_pagemap *pgmap);
 void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
@@ -234,6 +248,15 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
 
 unsigned long memremap_compat_align(void);
 
+struct page *device_private_offset_to_page(unsigned long offset);
+struct page *device_private_entry_to_page(softleaf_t entry);
+pgoff_t device_private_page_to_offset(const struct page *page);
+
+static inline pgoff_t device_private_folio_to_offset(const struct folio *folio)
+{
+	return device_private_page_to_offset((const struct page *)&folio->page);
+}
+
 static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
 {
 	zone_device_page_init(&folio->page, order);
@@ -276,6 +299,23 @@ static inline void devm_memunmap_pages(struct device *dev,
 {
 }
 
+static inline int devm_memremap_device_private_pagemap(struct device *dev,
+		struct dev_pagemap *pgmap)
+{
+	/*
+	 * Fail attempts to call devm_memremap_device_private_pagemap() without
+	 * ZONE_DEVICE support enabled, this requires callers to fall
+	 * back to plain devm_memremap() based on config
+	 */
+	WARN_ON_ONCE(1);
+	return -ENXIO;
+}
+
+static inline void devm_memunmap_device_private_pagemap(struct device *dev,
+		struct dev_pagemap *pgmap)
+{
+}
+
 static inline struct dev_pagemap *get_dev_pagemap(unsigned long pfn)
 {
 	return NULL;
@@ -296,6 +336,26 @@ static inline void zone_device_private_split_cb(struct folio *original_folio,
 						struct folio *new_folio)
 {
 }
+
+static inline struct page *device_private_offset_to_page(unsigned long offset)
+{
+	return NULL;
+}
+
+static inline struct page *device_private_entry_to_page(softleaf_t entry)
+{
+	return NULL;
+}
+
+static inline pgoff_t device_private_page_to_offset(const struct page *page)
+{
+	return 0;
+}
+
+static inline pgoff_t device_private_folio_to_offset(const struct folio *folio)
+{
+	return 0;
+}
 #endif /* CONFIG_ZONE_DEVICE */
 
 static inline void put_dev_pagemap(struct dev_pagemap *pgmap)
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 5fd2ee080bc0..2921b3abddf3 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -133,6 +133,10 @@ static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
 {
 	if (!(mpfn & MIGRATE_PFN_VALID))
 		return NULL;
+
+	if (mpfn & MIGRATE_PFN_DEVICE_PRIVATE)
+		return device_private_offset_to_page(mpfn >> MIGRATE_PFN_SHIFT);
+
 	return pfn_to_page(mpfn >> MIGRATE_PFN_SHIFT);
 }
 
@@ -144,7 +148,7 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 static inline unsigned long migrate_pfn_from_page(struct page *page)
 {
 	if (is_device_private_page(page))
-		return migrate_pfn(page_to_pfn(page)) |
+		return migrate_pfn(device_private_page_to_offset(page)) |
 		       MIGRATE_PFN_DEVICE_PRIVATE;
 	return migrate_pfn(page_to_pfn(page));
 }
diff --git a/include/linux/mm.h b/include/linux/mm.h
index a52979536a5e..27089ca4b0c8 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2042,6 +2042,8 @@ static inline unsigned long memdesc_section(memdesc_flags_t mdf)
  */
 static inline unsigned long folio_pfn(const struct folio *folio)
 {
+	VM_WARN_ON(folio_is_device_private(folio));
+
 	return page_to_pfn(&folio->page);
 }
 
diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 1b03297f13dc..fffa5fadcbbf 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -951,11 +951,16 @@ static inline unsigned long page_vma_walk_flags(const struct folio *folio,
 
 static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
 {
+	if (folio_is_device_private(folio))
+		return device_private_folio_to_offset(folio);
+
 	return folio_pfn(folio);
 }
 
 static inline struct folio *page_vma_walk_pfn_to_folio(struct page_vma_mapped_walk *pvmw)
 {
+	if (pvmw->flags & PVMW_DEVICE_PRIVATE)
+		return page_folio(device_private_offset_to_page(pvmw->pfn));
 	return pfn_folio(pvmw->pfn);
 }
 
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 080e27da6b47..2f83e647d6c5 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -141,7 +141,7 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page,
 								       pgoff_t flags)
 {
-	return swp_entry(SWP_DEVICE_READ, page_to_pfn(page) | flags);
+	return swp_entry(SWP_DEVICE_READ, device_private_page_to_offset(page) | flags);
 }
 
 static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
@@ -152,7 +152,7 @@ static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page,
 								       pgoff_t flags)
 {
-	return swp_entry(SWP_DEVICE_WRITE, page_to_pfn(page) | flags);
+	return swp_entry(SWP_DEVICE_WRITE, device_private_page_to_offset(page) | flags);
 }
 
 static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
@@ -232,7 +232,7 @@ static inline swp_entry_t make_readable_migration_entry_from_page(struct page *p
 {
 	if (is_device_private_page(page))
 		return make_readable_migration_device_private_entry(
-				page_to_pfn(page) | flags);
+				device_private_page_to_offset(page) | flags);
 
 	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page) | flags);
 }
@@ -247,7 +247,7 @@ static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(stru
 {
 	if (is_device_private_page(page))
 		return make_readable_exclusive_migration_device_private_entry(
-				page_to_pfn(page) | flags);
+				device_private_page_to_offset(page) | flags);
 
 	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page) | flags);
 }
@@ -262,7 +262,7 @@ static inline swp_entry_t make_writable_migration_entry_from_page(struct page *p
 {
 	if (is_device_private_page(page))
 		return make_writable_migration_device_private_entry(
-				page_to_pfn(page) | flags);
+				device_private_page_to_offset(page) | flags);
 
 	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page) | flags);
 }
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 872d3846af7b..e1eddb4aaeb1 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -497,7 +497,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 				  struct page **ppage, bool is_large)
 {
 	struct dmirror_chunk *devmem;
-	struct resource *res = NULL;
+	bool device_private = false;
 	unsigned long pfn;
 	unsigned long pfn_first;
 	unsigned long pfn_last;
@@ -510,13 +510,9 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 	switch (mdevice->zone_device_type) {
 	case HMM_DMIRROR_MEMORY_DEVICE_PRIVATE:
-		res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
-					      "hmm_dmirror");
-		if (IS_ERR_OR_NULL(res))
-			goto err_devmem;
-		devmem->pagemap.range.start = res->start;
-		devmem->pagemap.range.end = res->end;
+		device_private = true;
 		devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
+		devmem->pagemap.nr_pages = DEVMEM_CHUNK_SIZE / PAGE_SIZE;
 		break;
 	case HMM_DMIRROR_MEMORY_DEVICE_COHERENT:
 		devmem->pagemap.range.start = (MINOR(mdevice->cdevice.dev) - 2) ?
@@ -525,13 +521,13 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 		devmem->pagemap.range.end = devmem->pagemap.range.start +
 					    DEVMEM_CHUNK_SIZE - 1;
 		devmem->pagemap.type = MEMORY_DEVICE_COHERENT;
+		devmem->pagemap.nr_range = 1;
 		break;
 	default:
 		ret = -EINVAL;
 		goto err_devmem;
 	}
 
-	devmem->pagemap.nr_range = 1;
 	devmem->pagemap.ops = &dmirror_devmem_ops;
 	devmem->pagemap.owner = mdevice;
 
@@ -551,13 +547,20 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 		mdevice->devmem_capacity = new_capacity;
 		mdevice->devmem_chunks = new_chunks;
 	}
-	ptr = memremap_pages(&devmem->pagemap, numa_node_id());
-	if (IS_ERR_OR_NULL(ptr)) {
-		if (ptr)
-			ret = PTR_ERR(ptr);
-		else
-			ret = -EFAULT;
-		goto err_release;
+
+	if (device_private) {
+		ret = memremap_device_private_pagemap(&devmem->pagemap, numa_node_id());
+		if (ret)
+			goto err_release;
+	} else {
+		ptr = memremap_pages(&devmem->pagemap, numa_node_id());
+		if (IS_ERR_OR_NULL(ptr)) {
+			if (ptr)
+				ret = PTR_ERR(ptr);
+			else
+				ret = -EFAULT;
+			goto err_release;
+		}
 	}
 
 	devmem->mdevice = mdevice;
@@ -567,15 +570,21 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 	mutex_unlock(&mdevice->devmem_lock);
 
-	pr_info("added new %u MB chunk (total %u chunks, %u MB) PFNs [0x%lx 0x%lx)\n",
+	pr_info("added new %u MB chunk (total %u chunks, %u MB) %sPFNs [0x%lx 0x%lx)\n",
 		DEVMEM_CHUNK_SIZE / (1024 * 1024),
 		mdevice->devmem_count,
 		mdevice->devmem_count * (DEVMEM_CHUNK_SIZE / (1024 * 1024)),
+		device_private ? "device " : "",
 		pfn_first, pfn_last);
 
 	spin_lock(&mdevice->lock);
 	for (pfn = pfn_first; pfn < pfn_last; ) {
-		struct page *page = pfn_to_page(pfn);
+		struct page *page;
+
+		if (device_private)
+			page = device_private_offset_to_page(pfn);
+		else
+			page = pfn_to_page(pfn);
 
 		if (is_large && IS_ALIGNED(pfn, HPAGE_PMD_NR)
 			&& (pfn + HPAGE_PMD_NR <= pfn_last)) {
@@ -616,9 +625,6 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
-	if (res && devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
-		release_mem_region(devmem->pagemap.range.start,
-				   range_len(&devmem->pagemap.range));
 err_devmem:
 	kfree(devmem);
 
@@ -696,8 +702,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 */
 		spage = migrate_pfn_to_page(*src);
 		if (WARN(spage && is_zone_device_page(spage),
-		     "page already in device spage pfn: 0x%lx\n",
-		     page_to_pfn(spage)))
+		     "page already in device spage mpfn: 0x%lx\n",
+		     migrate_pfn_from_page(spage)))
 			goto next;
 
 		if (dmirror->flags & HMM_DMIRROR_FLAG_FAIL_ALLOC) {
@@ -752,8 +758,9 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 */
 		rpage->zone_device_data = dmirror;
 
-		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
-			 page_to_pfn(spage), page_to_pfn(dpage));
+		pr_debug("migrating from sys to mpfn src: 0x%lx pfn dst: 0x%lx\n",
+			 page_to_pfn(spage),
+			 migrate_pfn_from_page(dpage));
 
 		*dst = migrate_pfn_from_page(dpage) | write;
 
@@ -1462,10 +1469,10 @@ static void dmirror_device_remove_chunks(struct dmirror_device *mdevice)
 			spin_unlock(&mdevice->lock);
 
 			dmirror_device_evict_chunk(devmem);
-			memunmap_pages(&devmem->pagemap);
 			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
-				release_mem_region(devmem->pagemap.range.start,
-						   range_len(&devmem->pagemap.range));
+				memunmap_device_private_pagemap(&devmem->pagemap);
+			else
+				memunmap_pages(&devmem->pagemap);
 			kfree(devmem);
 		}
 		mdevice->devmem_count = 0;
@@ -1710,7 +1717,13 @@ static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
 		return;
 	}
 
-	offset = folio_pfn(tail) - folio_pfn(head);
+	tail->pgmap = head->pgmap;
+
+	if (folio_is_device_private(head))
+		offset = device_private_folio_to_offset(tail) -
+			 device_private_folio_to_offset(head);
+	else
+		offset = folio_pfn(tail) - folio_pfn(head);
 
 	rpage_tail = folio_page(rfolio, offset);
 	tail->page.zone_device_data = rpage_tail;
@@ -1719,7 +1732,6 @@ static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
 	rpage_tail->mapping = NULL;
 
 	folio_page(tail, 0)->mapping = folio_page(head, 0)->mapping;
-	tail->pgmap = head->pgmap;
 	folio_set_count(page_folio(rpage_tail), 1);
 }
 
diff --git a/mm/debug.c b/mm/debug.c
index 77fa8fe1d641..04fcc62d440f 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -77,9 +77,11 @@ static void __dump_folio(const struct folio *folio, const struct page *page,
 	if (page_mapcount_is_type(mapcount))
 		mapcount = 0;
 
-	pr_warn("page: refcount:%d mapcount:%d mapping:%p index:%#lx pfn:%#lx\n",
+	pr_warn("page: refcount:%d mapcount:%d mapping:%p index:%#lx %spfn:%#lx\n",
 			folio_ref_count(folio), mapcount, mapping,
-			folio->index + idx, pfn);
+			folio->index + idx,
+			folio_is_device_private(folio) ? "device " : "",
+			pfn);
 	if (folio_test_large(folio)) {
 		int pincount = 0;
 
@@ -113,7 +115,8 @@ static void __dump_folio(const struct folio *folio, const struct page *page,
 	 * inaccuracy here due to racing.
 	 */
 	pr_warn("%sflags: %pGp%s\n", type, &folio->flags,
-		is_migrate_cma_folio(folio, pfn) ? " CMA" : "");
+		(!folio_is_device_private(folio) &&
+		 is_migrate_cma_folio(folio, pfn)) ? " CMA" : "");
 	if (page_has_type(&folio->page))
 		pr_warn("page_type: %x(%s)\n", folio->page.page_type >> 24,
 				page_type_name(folio->page.page_type));
diff --git a/mm/memremap.c b/mm/memremap.c
index 63c6ab4fdf08..2fe6246a351b 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -12,9 +12,12 @@
 #include <linux/types.h>
 #include <linux/wait_bit.h>
 #include <linux/xarray.h>
+#include <linux/maple_tree.h>
 #include "internal.h"
 
 static DEFINE_XARRAY(pgmap_array);
+static struct maple_tree device_private_pgmap_tree =
+	MTREE_INIT(device_private_pgmap_tree, MT_FLAGS_ALLOC_RANGE);
 
 /*
  * The memremap() and memremap_pages() interfaces are alternately used
@@ -113,9 +116,10 @@ void memunmap_pages(struct dev_pagemap *pgmap)
 {
 	int i;
 
+	WARN_ONCE(pgmap->type == MEMORY_DEVICE_PRIVATE, "Type should not be MEMORY_DEVICE_PRIVATE\n");
+
 	percpu_ref_kill(&pgmap->ref);
-	if (pgmap->type != MEMORY_DEVICE_PRIVATE &&
-	    pgmap->type != MEMORY_DEVICE_COHERENT)
+	if (pgmap->type != MEMORY_DEVICE_COHERENT)
 		for (i = 0; i < pgmap->nr_range; i++)
 			percpu_ref_put_many(&pgmap->ref, pfn_len(pgmap, i));
 
@@ -144,7 +148,6 @@ static void dev_pagemap_percpu_release(struct percpu_ref *ref)
 static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 		int range_id, int nid)
 {
-	const bool is_private = pgmap->type == MEMORY_DEVICE_PRIVATE;
 	struct range *range = &pgmap->ranges[range_id];
 	struct dev_pagemap *conflict_pgmap;
 	int error, is_ram;
@@ -190,7 +193,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	if (error)
 		goto err_pfn_remap;
 
-	if (!mhp_range_allowed(range->start, range_len(range), !is_private)) {
+	if (!mhp_range_allowed(range->start, range_len(range), true)) {
 		error = -EINVAL;
 		goto err_kasan;
 	}
@@ -198,30 +201,19 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	mem_hotplug_begin();
 
 	/*
-	 * For device private memory we call add_pages() as we only need to
-	 * allocate and initialize struct page for the device memory. More-
-	 * over the device memory is un-accessible thus we do not want to
-	 * create a linear mapping for the memory like arch_add_memory()
-	 * would do.
-	 *
-	 * For all other device memory types, which are accessible by
-	 * the CPU, we do want the linear mapping and thus use
+	 * All device memory types except device private memory are accessible
+	 * by the CPU, so we want the linear mapping and thus use
 	 * arch_add_memory().
 	 */
-	if (is_private) {
-		error = add_pages(nid, PHYS_PFN(range->start),
-				PHYS_PFN(range_len(range)), params);
-	} else {
-		error = kasan_add_zero_shadow(__va(range->start), range_len(range));
-		if (error) {
-			mem_hotplug_done();
-			goto err_kasan;
-		}
-
-		error = arch_add_memory(nid, range->start, range_len(range),
-					params);
+	error = kasan_add_zero_shadow(__va(range->start), range_len(range));
+	if (error) {
+		mem_hotplug_done();
+		goto err_kasan;
 	}
 
+	error = arch_add_memory(nid, range->start, range_len(range),
+				params);
+
 	if (!error) {
 		struct zone *zone;
 
@@ -248,8 +240,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	return 0;
 
 err_add_memory:
-	if (!is_private)
-		kasan_remove_zero_shadow(__va(range->start), range_len(range));
+	kasan_remove_zero_shadow(__va(range->start), range_len(range));
 err_kasan:
 	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
 err_pfn_remap:
@@ -281,22 +272,8 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
-		if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
-			WARN(1, "Device private memory not supported\n");
-			return ERR_PTR(-EINVAL);
-		}
-		if (!pgmap->ops || !pgmap->ops->migrate_to_ram) {
-			WARN(1, "Missing migrate_to_ram method\n");
-			return ERR_PTR(-EINVAL);
-		}
-		if (!pgmap->ops->folio_free) {
-			WARN(1, "Missing folio_free method\n");
-			return ERR_PTR(-EINVAL);
-		}
-		if (!pgmap->owner) {
-			WARN(1, "Missing owner\n");
-			return ERR_PTR(-EINVAL);
-		}
+		WARN(1, "Use memremap_device_private_pagemap()\n");
+		return ERR_PTR(-EINVAL);
 		break;
 	case MEMORY_DEVICE_COHERENT:
 		if (!pgmap->ops->folio_free) {
@@ -394,6 +371,31 @@ void devm_memunmap_pages(struct device *dev, struct dev_pagemap *pgmap)
 }
 EXPORT_SYMBOL_GPL(devm_memunmap_pages);
 
+static void devm_memremap_device_private_pagemap_release(void *data)
+{
+	memunmap_device_private_pagemap(data);
+}
+
+int devm_memremap_device_private_pagemap(struct device *dev, struct dev_pagemap *pgmap)
+{
+	int ret;
+
+	ret = memremap_device_private_pagemap(pgmap, dev_to_node(dev));
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, devm_memremap_device_private_pagemap_release,
+			pgmap);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_memremap_device_private_pagemap);
+
+void devm_memunmap_device_private_pagemap(struct device *dev, struct dev_pagemap *pgmap)
+{
+	devm_release_action(dev, devm_memremap_device_private_pagemap_release, pgmap);
+}
+EXPORT_SYMBOL_GPL(devm_memunmap_device_private_pagemap);
+
 /**
  * get_dev_pagemap() - take a new live reference on the dev_pagemap for @pfn
  * @pfn: page frame number to lookup page_map
@@ -493,3 +495,113 @@ void zone_device_page_init(struct page *page, unsigned int order)
 		prep_compound_page(page, order);
 }
 EXPORT_SYMBOL_GPL(zone_device_page_init);
+
+unsigned long memremap_device_private_pagemap(struct dev_pagemap *pgmap, int nid)
+{
+	unsigned long dpfn, dpfn_first, dpfn_last = 0;
+	unsigned long start;
+	int rc;
+
+	if (pgmap->type != MEMORY_DEVICE_PRIVATE) {
+		WARN(1, "Not device private memory\n");
+		return -EINVAL;
+	}
+	if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
+		WARN(1, "Device private memory not supported\n");
+		return -EINVAL;
+	}
+	if (!pgmap->ops || !pgmap->ops->migrate_to_ram) {
+		WARN(1, "Missing migrate_to_ram method\n");
+		return -EINVAL;
+	}
+	if (!pgmap->owner) {
+		WARN(1, "Missing owner\n");
+		return -EINVAL;
+	}
+
+	pgmap->pages = kvzalloc(sizeof(*pgmap->pages) * pgmap->nr_pages,
+				GFP_KERNEL);
+	if (!pgmap->pages)
+		return -ENOMEM;
+
+	rc = mtree_alloc_range(&device_private_pgmap_tree, &start, pgmap,
+			       pgmap->nr_pages * PAGE_SIZE, 0,
+			       1ull << MAX_PHYSMEM_BITS, GFP_KERNEL);
+	if (rc < 0)
+		goto err_mtree_alloc;
+
+	pgmap->range.start = start;
+	pgmap->range.end = pgmap->range.start + (pgmap->nr_pages * PAGE_SIZE) - 1;
+	pgmap->nr_range = 1;
+
+	init_completion(&pgmap->done);
+	rc = percpu_ref_init(&pgmap->ref, dev_pagemap_percpu_release, 0,
+			     GFP_KERNEL);
+	if (rc < 0)
+		goto err_ref_init;
+
+	if (nid < 0)
+		nid = numa_mem_id();
+
+	dpfn_first = pgmap->range.start >> PAGE_SHIFT;
+	dpfn_last = dpfn_first + (range_len(&pgmap->range) >> PAGE_SHIFT);
+	for (dpfn = dpfn_first; dpfn < dpfn_last; dpfn++) {
+		struct page *page = device_private_offset_to_page(dpfn);
+
+		__init_zone_device_page(page, dpfn, ZONE_DEVICE, nid, pgmap);
+		page_folio(page)->pgmap = (void *)pgmap;
+	}
+
+	return 0;
+
+err_ref_init:
+	mtree_erase(&device_private_pgmap_tree, pgmap->range.start);
+err_mtree_alloc:
+	kvfree(pgmap->pages);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(memremap_device_private_pagemap);
+
+void memunmap_device_private_pagemap(struct dev_pagemap *pgmap)
+{
+	percpu_ref_kill(&pgmap->ref);
+	wait_for_completion(&pgmap->done);
+	percpu_ref_exit(&pgmap->ref);
+	kvfree(pgmap->pages);
+	mtree_erase(&device_private_pgmap_tree, pgmap->range.start);
+}
+EXPORT_SYMBOL_GPL(memunmap_device_private_pagemap);
+
+struct page *device_private_offset_to_page(unsigned long offset)
+{
+	struct dev_pagemap *pgmap;
+
+	pgmap = mtree_load(&device_private_pgmap_tree, offset << PAGE_SHIFT);
+	if (WARN_ON_ONCE(!pgmap))
+		return NULL;
+
+	return &pgmap->pages[offset - (pgmap->range.start >> PAGE_SHIFT)];
+}
+EXPORT_SYMBOL_GPL(device_private_offset_to_page);
+
+struct page *device_private_entry_to_page(softleaf_t entry)
+{
+	unsigned long offset;
+
+	if (!((softleaf_is_device_private(entry) ||
+	       softleaf_is_migration_device_private(entry))))
+		return NULL;
+
+	offset = softleaf_to_pfn(entry);
+	return device_private_offset_to_page(offset);
+}
+
+pgoff_t device_private_page_to_offset(const struct page *page)
+{
+	struct dev_pagemap *pgmap = (struct dev_pagemap *)page_pgmap(page);
+
+	VM_WARN_ON(!is_device_private_page(page));
+
+	return (pgmap->range.start >> PAGE_SHIFT) + ((page - pgmap->pages));
+}
+EXPORT_SYMBOL_GPL(device_private_page_to_offset);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index fc2a6f1e518f..4a9420cb610c 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1004,9 +1004,9 @@ static void __init memmap_init(void)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
-static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
-					  unsigned long zone_idx, int nid,
-					  struct dev_pagemap *pgmap)
+void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
+				   unsigned long zone_idx, int nid,
+				   struct dev_pagemap *pgmap)
 {
 
 	__init_single_page(page, pfn, zone_idx, nid);
@@ -1038,7 +1038,7 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 	 * Please note that MEMINIT_HOTPLUG path doesn't clear memmap
 	 * because this is done early in section_activate()
 	 */
-	if (pageblock_aligned(pfn)) {
+	if (pgmap->type != MEMORY_DEVICE_PRIVATE && pageblock_aligned(pfn)) {
 		init_pageblock_migratetype(page, MIGRATE_MOVABLE, false);
 		cond_resched();
 	}
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 039a2d71e92f..d1c4fcce1e83 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
 static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 {
 	unsigned long pfn;
+	bool device_private = false;
 	pte_t ptent = ptep_get(pvmw->pte);
 
 	if (pvmw->flags & PVMW_MIGRATION) {
@@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 		if (!softleaf_is_migration(entry))
 			return false;
 
+		if (softleaf_is_migration_device_private(entry))
+			device_private = true;
+
 		pfn = softleaf_to_pfn(entry);
 	} else if (pte_present(ptent)) {
 		pfn = pte_pfn(ptent);
@@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 			return false;
 
 		pfn = softleaf_to_pfn(entry);
+
+		if (softleaf_is_device_private(entry))
+			device_private = true;
 	}
 
+	if (device_private != (bool)(pvmw->flags & PVMW_DEVICE_PRIVATE))
+		return false;
+
 	if ((pfn + pte_nr - 1) < pvmw->pfn)
 		return false;
 	if (pfn > (pvmw->pfn + pvmw->nr_pages - 1))
@@ -137,8 +147,11 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 }
 
 /* Returns true if the two ranges overlap.  Careful to not overflow. */
-static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
+static bool check_pmd(unsigned long pfn, bool device_private, struct page_vma_mapped_walk *pvmw)
 {
+	if (device_private != (bool)(pvmw->flags & PVMW_DEVICE_PRIVATE))
+		return false;
+
 	if ((pfn + HPAGE_PMD_NR - 1) < pvmw->pfn)
 		return false;
 	if (pfn > pvmw->pfn + pvmw->nr_pages - 1)
@@ -254,14 +267,17 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 				entry = softleaf_from_pmd(pmde);
 
 				if (!softleaf_is_migration(entry) ||
-				    !check_pmd(softleaf_to_pfn(entry), pvmw))
+				    !check_pmd(softleaf_to_pfn(entry),
+					       softleaf_is_device_private(entry) ||
+					       softleaf_is_migration_device_private(entry),
+					       pvmw))
 					return not_found(pvmw);
 				return true;
 			}
 			if (likely(pmd_trans_huge(pmde))) {
 				if (pvmw->flags & PVMW_MIGRATION)
 					return not_found(pvmw);
-				if (!check_pmd(pmd_pfn(pmde), pvmw))
+				if (!check_pmd(pmd_pfn(pmde), false, pvmw))
 					return not_found(pvmw);
 				return true;
 			}
diff --git a/mm/rmap.c b/mm/rmap.c
index 79cba3d441c3..a2725b3896d6 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1860,7 +1860,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
 	unsigned long nr_pages = 1, end_addr;
-	unsigned long pfn;
+	unsigned long nr;
 	unsigned long hsz = 0;
 	int ptes = 0;
 
@@ -1967,15 +1967,20 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		 */
 		pteval = ptep_get(pvmw.pte);
 		if (likely(pte_present(pteval))) {
-			pfn = pte_pfn(pteval);
+			nr = pte_pfn(pteval) - folio_pfn(folio);
 		} else {
 			const softleaf_t entry = softleaf_from_pte(pteval);
 
-			pfn = softleaf_to_pfn(entry);
+			if (softleaf_is_device_private(entry) ||
+			    softleaf_is_migration_device_private(entry))
+				nr = softleaf_to_pfn(entry) - device_private_folio_to_offset(folio);
+			else
+				nr = softleaf_to_pfn(entry) - folio_pfn(folio);
+
 			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
 		}
 
-		subpage = folio_page(folio, pfn - folio_pfn(folio));
+		subpage = folio_page(folio, nr);
 		address = pvmw.address;
 		anon_exclusive = folio_test_anon(folio) &&
 				 PageAnonExclusive(subpage);
@@ -2288,7 +2293,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	struct page *subpage;
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
-	unsigned long pfn;
+	unsigned long nr;
 	unsigned long hsz = 0;
 
 	/*
@@ -2327,7 +2332,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	while (page_vma_mapped_walk(&pvmw)) {
 		/* PMD-mapped THP migration entry */
 		if (!pvmw.pte) {
-			__maybe_unused unsigned long pfn;
+			__maybe_unused softleaf_t entry;
 			__maybe_unused pmd_t pmdval;
 
 			if (flags & TTU_SPLIT_HUGE_PMD) {
@@ -2339,12 +2344,17 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			}
 #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
 			pmdval = pmdp_get(pvmw.pmd);
+			entry = softleaf_from_pmd(pmdval);
 			if (likely(pmd_present(pmdval)))
-				pfn = pmd_pfn(pmdval);
-			else
-				pfn = softleaf_to_pfn(softleaf_from_pmd(pmdval));
+				nr = pmd_pfn(pmdval) - folio_pfn(folio);
+			else if (softleaf_is_device_private(entry) ||
+				 softleaf_is_migration_device_private(entry)) {
+				nr = softleaf_to_pfn(entry) - device_private_folio_to_offset(folio);
+			} else {
+				nr = softleaf_to_pfn(entry) - folio_pfn(folio);
+			}
 
-			subpage = folio_page(folio, pfn - folio_pfn(folio));
+			subpage = folio_page(folio, nr);
 
 			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
 					!folio_test_pmd_mappable(folio), folio);
@@ -2367,15 +2377,20 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		 */
 		pteval = ptep_get(pvmw.pte);
 		if (likely(pte_present(pteval))) {
-			pfn = pte_pfn(pteval);
+			nr = pte_pfn(pteval) - folio_pfn(folio);
 		} else {
 			const softleaf_t entry = softleaf_from_pte(pteval);
 
-			pfn = softleaf_to_pfn(entry);
+			if (softleaf_is_device_private(entry) ||
+			    softleaf_is_migration_device_private(entry))
+				nr = softleaf_to_pfn(entry) - device_private_folio_to_offset(folio);
+			else
+				nr = softleaf_to_pfn(entry) - folio_pfn(folio);
+
 			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
 		}
 
-		subpage = folio_page(folio, pfn - folio_pfn(folio));
+		subpage = folio_page(folio, nr);
 		address = pvmw.address;
 		anon_exclusive = folio_test_anon(folio) &&
 				 PageAnonExclusive(subpage);
@@ -2433,7 +2448,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				folio_mark_dirty(folio);
 			writable = pte_write(pteval);
 		} else if (likely(pte_present(pteval))) {
-			flush_cache_page(vma, address, pfn);
+			flush_cache_page(vma, address, pte_pfn(pteval));
 			/* Nuke the page table entry. */
 			if (should_defer_flush(mm, flags)) {
 				/*
diff --git a/mm/util.c b/mm/util.c
index 65e3f1a97d76..8482ebc5c394 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1244,7 +1244,10 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
 	struct folio *foliop;
 	int loops = 5;
 
-	ps->pfn = page_to_pfn(page);
+	if (is_device_private_page(page))
+		ps->pfn = device_private_page_to_offset(page);
+	else
+		ps->pfn = page_to_pfn(page);
 	ps->flags = PAGE_SNAPSHOT_FAITHFUL;
 
 again:
-- 
2.34.1


