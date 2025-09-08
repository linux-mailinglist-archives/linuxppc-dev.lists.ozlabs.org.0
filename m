Return-Path: <linuxppc-dev+bounces-11880-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FF0B48BBC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 13:16:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cL4CM255kz3054;
	Mon,  8 Sep 2025 21:16:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c202::7" arc.chain="microsoft.com:microsoft.com"
ARC-Seal: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757323895;
	cv=pass; b=cHtB+slv7bZrnW6f+rIZNOwS5z3535r8P1+Zahy4I7MpcPI4wuzCFfz9JacSM3m3eG/2LIJVvJXnutjQIIE5kTOF09S7KAaa1IP5jAB7y5lBwrSgpc66Olhit8nFNBbZO8xYtrXhmwFaMOOId7/MsqbHBRBSXXfaDIFUdF2qwUBPjO9dguNLYAv9u7HlM2etkyyQpOLsnl88NcBa1wA55itwgwhkEKGQz1SEibXGwk5gZQiVIxMoum5fcWqaTb/IyW5XMNDztEEKoFgXqzLEpZ/wMk01xQTxa/0g7gHL8CeOeITlRYsYvET8xhpRqkSruwGfxy+USlXGhAfEr1vypg==
ARC-Message-Signature: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757323895; c=relaxed/relaxed;
	bh=MKTinqRY9lAauBy2OZ6xKaVx1KArO4xGTgKQBxwBbBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a9iBPjRjbyRP9ac9ETumOgw8ep53T1msSRAXMliwK3Kxvp49bfUUReuF5yu/tmc43JS/SnEXuRD428tjwpHoqCAKnzkx9pGbCy8coESh9meU5VYdMPEwCQZfmk7uRcbFvFwuBxrFW2WR7iZCtY6UOMKuBIzrlWOYpvnZfpTyGZO8t7q2C8YSwcguLN/twmzLgmqUVdXE5B/QVSwfXBIEy+FQXst7J5Xz5bA7hkZmT/XDP8gHmir+w5VCRMNkRt1CN98ot9Uz/2EN3cZPl+Z3ZiNWQYGpqQk74+vOHleqoJBBpTwK5hpU98hEAg37GgMMTHUcvx3LixUjKFGqXxapUA==
ARC-Authentication-Results: i=3; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=UlEu1qeT; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=UlEu1qeT; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=yeoreum.yun@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=UlEu1qeT;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=UlEu1qeT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=yeoreum.yun@arm.com; receiver=lists.ozlabs.org)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c202::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cL1tG3Tspz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 19:31:34 +1000 (AEST)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PhoHYCGu+IVt8ylPivj9rNzrNKAGhdqmTANALmKCXAVAZXVGUgbubEQXajlethE5pwoC2QC3LNhqbVIud7rBskTWNQ8GCMuBgQMogo1PnO2o39bhp+3wRCfcpmmYi9MgYPEqOmQ6AIbyeE9DGkWZeTm7YYn/1IMHr0FTglczLvpgQTbYlqCV5Bs6jZMn4sE+6mss3YV7R+R86AMnoUXtx4tufCwvN1Jp/m06zrP3FIIf3BABT4GSiBCMk+5JSv1n+BxTIz5OgDsv4dY3ezqohxAdm5hRxMSXTHgj4mGZ0BifwCONBfi1sNRTr6/IjOrM1C1DyBHgHf9u2nxSBKV2Qw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKTinqRY9lAauBy2OZ6xKaVx1KArO4xGTgKQBxwBbBU=;
 b=n8Eme9DMXzXHq+v6jprIkWaToz4ew0hGv4IOG/L9Z66Zp++jakaqXCM78jVq1M41wS8Ff0jKB4Vm5tEMg9MAg4ao45ex16wmWWGPlCFPMlvcE1R3DIM2AUhXBuDVqeJBvqBSQFnPM2QOTzdkgA8Y+K4s464Ybx0vDrUKua5aLigSdgr4xcxdSfyZ6HEL7StX72e0SpyvPOD7bXuNY8YRLkm3LVHu6Oaao87IWXvRyou/gOfMPGbUfYwV19fPiLEYBRPxVLxiThb+1AHyvbakpB/DV5K9UvBurus/F3rZAOrBauMvmvl6c49M5p3T+Snuol1pK6PBRBvqJgb8eU37HQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kvack.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKTinqRY9lAauBy2OZ6xKaVx1KArO4xGTgKQBxwBbBU=;
 b=UlEu1qeTuLU99L0jDNP9Tj9KGou1+VjTpBZ14XV7wc0hQ7Hr9YwF0HHwVcUMfqIS6RqJagjaT1uQ38oVyGg0vn8ctXolBclT261k3QVEJO9QhlqL04PlfFV4BB/XWIaZMisk2GkyXBtn3fmN4zH/exk7RUJ3FovG0GWOzPXK2K0=
Received: from AM0PR10CA0019.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::29)
 by DB9PR08MB7771.eurprd08.prod.outlook.com (2603:10a6:10:397::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Mon, 8 Sep
 2025 09:31:08 +0000
Received: from AM4PEPF00027A5F.eurprd04.prod.outlook.com
 (2603:10a6:208:17c:cafe::cf) by AM0PR10CA0019.outlook.office365.com
 (2603:10a6:208:17c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 09:31:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5F.mail.protection.outlook.com (10.167.16.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Mon, 8 Sep 2025 09:31:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JD6aR2JTcCSzlmcmkxP0JuYyrJKOmFes4KgPYG9jU+TtHX+5KZLWOXvcYFCNYPAjprpslWYb17vHW0JHSgx6nbEl/Tg0ar3ccarocg5ScFpyGajStJifvlClUHYRdxod2aqsmdzVGhUpzk65y6OFpXwXwPM8OpGUJIaLPdWNxpgDQbn7YBWOTWv7wVFUCLM2XvAkV3DZ2Fpbze8srmJ1gGrBjec7opGhkDjij5oLDc4QxvvSSRECmz9GLiLjFBd7TdhZfr97NDnYBXmGcjB5V9UVtedqKAjbi6km/qSjpPH3tIZx2BwTAqIsQChZneYDIDumL4pJ4ahmHNQK6ariRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKTinqRY9lAauBy2OZ6xKaVx1KArO4xGTgKQBxwBbBU=;
 b=AV1nazIXpxD8dOmXWvBV9esB0nB9F8zbiw5TR1Fae0gD48znvAcKRq2qAJY00vCCR+hsRqn4vMip6Z+6QsNQy1IpAv2dNce9Gr+h4LPie1SMpzx8AHJ18eS6m+CuBiDg50ynT/TdVfGDYxVEO5D8h3IG+i4R5e2PPFaBztK7oaqTZuWkV9qA/q5o/l5MLJyg/NjQC72SWVy598pGSfW+EV1d8GoQt1dqtDjIo+o1GTw5RmS7QbGMBsLW4qhyunEu/67i8skJNQYpWpT/Ls2ANl0IxU8k/4AfWtlJTj2QYuop+trjV8GZUYeKZd2HvbsPEO4oKPCx6QFsnCpJW/l8Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKTinqRY9lAauBy2OZ6xKaVx1KArO4xGTgKQBxwBbBU=;
 b=UlEu1qeTuLU99L0jDNP9Tj9KGou1+VjTpBZ14XV7wc0hQ7Hr9YwF0HHwVcUMfqIS6RqJagjaT1uQ38oVyGg0vn8ctXolBclT261k3QVEJO9QhlqL04PlfFV4BB/XWIaZMisk2GkyXBtn3fmN4zH/exk7RUJ3FovG0GWOzPXK2K0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB5PR08MB10163.eurprd08.prod.outlook.com
 (2603:10a6:10:4a2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 09:30:33 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 09:30:33 +0000
Date: Mon, 8 Sep 2025 10:30:29 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/7] arm64: mm: fully support nested lazy_mmu sections
Message-ID: <aL6iNW8sOkSaT4KE@e129823.arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-4-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908073931.4159362-4-kevin.brodsky@arm.com>
X-ClientProxiedBy: LO2P123CA0080.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::13) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
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
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DB5PR08MB10163:EE_|AM4PEPF00027A5F:EE_|DB9PR08MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 06fcb68d-f2eb-4a24-3b41-08ddeeba6fe9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?it1tKmtR7Py1gVtoYXNfYSfDXfCTSoF5KePThOLsKwNhBb0t2nOdf3sjhwQC?=
 =?us-ascii?Q?x0IeafrD84/hO/FHY6uvnyRGJ+u8nLWRbhtkzuEWvEzlw6tZLRTUZu6O23rz?=
 =?us-ascii?Q?9XuBr32+fJBVIaq+zC3LGBgMBkEz87Xa2QrAl6sS1PCUx+SD3wigaZ/weWpo?=
 =?us-ascii?Q?05NvBYoqvOvMzQY4drqPDgNzJYWyWyUmCgKCLikbs3t3dfYlM8X3yR6W5O+N?=
 =?us-ascii?Q?zfV/MvIX5sg0O2HxuzQdtH2h7fehNfKYrMMwJoL4SkuTmlmjYlHFrwNaD0a0?=
 =?us-ascii?Q?svqLsgVZUtS0gLtdVVflXF+lBOx6QXl9RIi5EqDPus9rkqQmjcDSMv5XZldP?=
 =?us-ascii?Q?6IlEfzW697AQRMtu0NNTwMBtKHNFEZaByAuFVJrPvFjhtBSb/zoYvhdHZ8Xn?=
 =?us-ascii?Q?JvcVMPAHdn51QwRlg5opROsjwwt9qYI/k2wRE4FJpei/UFUvAn/AXdQv8QzU?=
 =?us-ascii?Q?xBxelWe3xMX9ugub8LTKkOBk5Uz9z5pUxtdBCMFIF3fT8SL1PR7oSbUUZVlC?=
 =?us-ascii?Q?HorqNDrmCMwCOZGNx5marwvRP1qx06PLgseXfmp7b18/EWwBh1JXy13tMk8I?=
 =?us-ascii?Q?uVZaY0YEwJXVB2NMyhyrKEGPbc1eo3xtEYaWHmuaAJTYwPslL+elm5a6Gb/Z?=
 =?us-ascii?Q?QI0IfiIWj8i/IbTryDZxXWkWLCzXjzT8Dggojgsl1p4mBd4vL1qqQp3/7rKA?=
 =?us-ascii?Q?rt7vpjP/kWfr5noW6PMhyLY2jLrfZdUTAvwbneA3NNXypxOmJHbBBiXCWQY3?=
 =?us-ascii?Q?sPnL1KaSePiIKNFs6kGPWoZlT8nX+HfTmcaCq1nbDuCrzIvJcZhQdJpHdMB5?=
 =?us-ascii?Q?aCi7mGoPoz2P+pUi47ZW1sSPA9U6wY/E62e7hB8jgIPEndZ4DgN9aHbxR149?=
 =?us-ascii?Q?SeXH2L/yaRVFQlyU70V2cTEndc5CRQVCfXeNKYzPC/5HhYzD1ujThValSA3z?=
 =?us-ascii?Q?yh0ZGV+TXk70DwfQj869Ayt6Tjpry/gbYtatQ8+Sh9L0xLFzJ7180MpmSvus?=
 =?us-ascii?Q?5M92Z7dD2D6FBL4M5P2fV14gvrJ1S/GLz/tr1l689FoN5Bd01YEwAmcQSGG7?=
 =?us-ascii?Q?eTU4Q5jLB6AHfpwl6p8VkFrUy3lUjBvNNuJJ/K1nCsTCLQNfuxXlCRVEPVz/?=
 =?us-ascii?Q?IR3deRi+O7REGxBP0IH0p0oqLZ1726RoSBws5jlG1OY3pynnCioPAKDEBJ1+?=
 =?us-ascii?Q?Psye2rkNkEFnyZq+IxUdwVdzzWkSJfu0PdYMwQ0FbBRYW4giDlPZL/yyKD4w?=
 =?us-ascii?Q?YfjgJ7hNj9myNYxDdvHQPYBXwEN5o3dpDkrvU+Fg8FbGU+qmAmZT9yQCo1Gi?=
 =?us-ascii?Q?Mvi28bzhKf56zK4T62er4pGw8bylvrNxuZnUinAhyD0o+IWpf3sh6kUfYwP3?=
 =?us-ascii?Q?0eP/EnYZsEl1LkIpl3JpPkPhX2w0aghis84KriRW9C6gHfUbD1VVi2Na0gg3?=
 =?us-ascii?Q?2YWaeamKrBM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10163
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	98fa7b09-e451-4cd2-b9d5-08ddeeba5bbb
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|14060799003|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XIlQ9ifH7ju2PwQbAQtwpuDhs1zvHSY5Q9c/JLA1fTVt7k7P7AhqalRBpogq?=
 =?us-ascii?Q?n23PzHld4mllrggqsqN87Xn4uyJhars3wHWdUXVsd08cyKtZMK1LBm3Elyma?=
 =?us-ascii?Q?yONCNqdymnlR8FEfkM5nPz83lVQB1Ya3vrLjFEK9TIFxeGdggJPzUhdu9eFW?=
 =?us-ascii?Q?qcqHyi8+kNDvfM6uHVsSyU6LNjN7XMX1duX3J5K6/SuiXE12sTVjZHRr4mbC?=
 =?us-ascii?Q?+3rZGppHYLfl10zIdvLBCpeGzq3RPxlsss4GfWYoK5XCXUimrn4oE5BrxzlM?=
 =?us-ascii?Q?n3n6lJ1LMK3UdwBaQL7MiDQFwzy7pc4dRXAqWMWlZxqa/V0288pDL9qaF30H?=
 =?us-ascii?Q?1yOXpz8bX1zA6A7cwXWwLbvo3+mX75x+BbiJMxKWJF9HjZIwCEuZNpr5sVzU?=
 =?us-ascii?Q?mVgWeAA57Q6gHyCA6c9KolLEpSsa/NVUlCfW8g1QIATlp770CaeUFsa7tPJ3?=
 =?us-ascii?Q?J1OzqKh9i+W14KTsN+wBMMcd/1EQwfD8xpKDi98XuWFppDHg+dFxoXkxt0TX?=
 =?us-ascii?Q?ywuwX32AGP2PZYz/xSeqzKpLzkiOO/xoZu0tnE4486q4tkOxMttjPIhYqST8?=
 =?us-ascii?Q?h8JMZiRqFqbTGiP5UqC45bYmJdNOHDwdPfTdTIborjqJ61C0hyaTgD+p0Nd7?=
 =?us-ascii?Q?7iHNHzZTrsh63Q2mAkJPGnD6wVl9uFXV7rQfJny51I4QcE5T1TU7CxLcox3Z?=
 =?us-ascii?Q?Vi2adVuDpO7eny5R0VYa5RYxi2ZrBdyOMGxl62aX7OpKG9c8+j1PinPNdjuK?=
 =?us-ascii?Q?MJrGp7bx7YBMB0En/WjG+son3KX4GZDnsINK1JF2Kq34/r78W81S2C1pF78r?=
 =?us-ascii?Q?1NLY480+m4j+IpizA9zOnLLLR01cUAFXIfD/5o8QQuR98TrFWA2iug/b6Qfa?=
 =?us-ascii?Q?SIJseVUuNKQnamYJrv/T+7unMhcbSeoEiIEDlObBaTIzRuguSghQGikI7nak?=
 =?us-ascii?Q?Px/ODwTlJRl5AucoWnkzLE+YjZsBHv0jweNW7VmnZDJ1P7yJ0PyKCXZdkfU7?=
 =?us-ascii?Q?BZy3Es18yAl2V4xxuGSVAQzNtngHI8TwqBJoAU4RC5ow1NqwI2CuxS/4C/1Y?=
 =?us-ascii?Q?JAGOdyhOTpzO27b6JAuiYpmjrJXe0XN+tzI7vP2oeFLaERfMlDNxWJDXRFGZ?=
 =?us-ascii?Q?cuDorEPRN+zGiKTcTRl8GEJcpTmNo1ZAPDrAvLbbKmGdDXl24feuo9tgrfcS?=
 =?us-ascii?Q?dyhWzl1k9/gv4n6SarBhJMVWQ57KCH9QsoObzOg/TTAmQETtX1FbgO1ZBekk?=
 =?us-ascii?Q?djJtKMEH8+pFbQ3FrckWJQdBs4P9u0mxI7QjfTp2mYZI7sr9yqe1l5G30Tdy?=
 =?us-ascii?Q?sv5JzjI26Wbq4RcV3ncvi42PbY2ghesUaqvs8oJPljQ8A+r8ddumX70M8CLd?=
 =?us-ascii?Q?pfONQU2zEO1QXJkH1KXjaEV7zWK2J/GnKQHAAmqIlYsYX/mla4XejN3SxmW/?=
 =?us-ascii?Q?QlW156kyFTWmV7in9HMPc0zJCd9zcxmXEGTuIpX8WPDsqNWbepd3+1mnBJAB?=
 =?us-ascii?Q?cHkfy/T/UXsyHS+PSLvvh5rbz9Y4sQwo02ki?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(14060799003)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 09:31:06.4414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06fcb68d-f2eb-4a24-3b41-08ddeeba6fe9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7771
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

On Mon, Sep 08, 2025 at 08:39:27AM +0100, Kevin Brodsky wrote:
> Despite recent efforts to prevent lazy_mmu sections from nesting, it
> remains difficult to ensure that it never occurs - and in fact it
> does occur on arm64 in certain situations (CONFIG_DEBUG_PAGEALLOC).
> Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
> made nesting tolerable on arm64, but without truly supporting it:
> the inner leave() call clears TIF_LAZY_MMU, disabling the batching
> optimisation before the outer section ends.
>
> Now that the lazy_mmu API allows enter() to pass through a state to
> the matching leave() call, we can actually support nesting. If
> enter() is called inside an active lazy_mmu section, TIF_LAZY_MMU
> will already be set, and we can then return LAZY_MMU_NESTED to
> instruct the matching leave() call not to clear TIF_LAZY_MMU.
>
> The only effect of this patch is to ensure that TIF_LAZY_MMU (and
> therefore the batching optimisation) remains set until the outermost
> lazy_mmu section ends. leave() still emits barriers if needed,
> regardless of the nesting level, as the caller may expect any
> page table changes to become visible when leave() returns.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 816197d08165..602feda97dc4 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -85,24 +85,14 @@ typedef int lazy_mmu_state_t;
>
>  static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>  {
> -	/*
> -	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
> -	 * does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation
> -	 * inside a lazy_mmu_mode section (such as zap_pte_range()) will change
> -	 * permissions on the linear map with apply_to_page_range(), which
> -	 * re-enters lazy_mmu_mode. So we tolerate nesting in our
> -	 * implementation. The first call to arch_leave_lazy_mmu_mode() will
> -	 * flush and clear the flag such that the remainder of the work in the
> -	 * outer nest behaves as if outside of lazy mmu mode. This is safe and
> -	 * keeps tracking simple.
> -	 */
> +	int lazy_mmu_nested;
>
>  	if (in_interrupt())
>  		return LAZY_MMU_DEFAULT;
>
> -	set_thread_flag(TIF_LAZY_MMU);
> +	lazy_mmu_nested = test_and_set_thread_flag(TIF_LAZY_MMU);
>
> -	return LAZY_MMU_DEFAULT;
> +	return lazy_mmu_nested ? LAZY_MMU_NESTED : LAZY_MMU_DEFAULT;
>  }
>
>  static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
> @@ -113,7 +103,8 @@ static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
>  	if (test_and_clear_thread_flag(TIF_LAZY_MMU_PENDING))
>  		emit_pte_barriers();
>
> -	clear_thread_flag(TIF_LAZY_MMU);
> +	if (state != LAZY_MMU_NESTED)
> +		clear_thread_flag(TIF_LAZY_MMU);
>  }
>
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> --
> 2.47.0
>

--
Sincerely,
Yeoreum Yun

