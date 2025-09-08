Return-Path: <linuxppc-dev+bounces-11878-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A40B48BB4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 13:16:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cL4C05hwMz2ym3;
	Mon,  8 Sep 2025 21:16:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::1" arc.chain="microsoft.com:microsoft.com"
ARC-Seal: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757323876;
	cv=pass; b=WGuQW6+LERbYVE81WLo2PR5zCKV4FJsqyjdu4a3hFOrKGqjOmt0XL3t3vHVrwp2X2A1rUwLxbKgzT6OqkEgzjCwT2sOnTTIpZA9FFQZOlochfiKJ1MYVLx4Pmv2MbO6DAJtWVl2B75n5+mPyEbZKjnrsQDk8VFiGLG49/vCiqNubxta1KjHWu2lyPPmifq9D054bIDRz5uS5lA6W4h0lXRLuI120sMsc08ZT/emcV9nxv9AZRvsXk1Pcs72OcP7AYjie21m1BDTOb5TO5ZhMF/wLmB7DgmwFC1E95Sc2tFCwd59KyloekMo7b7ixHarq3gqdrJwQ/DI+taLAKaaqqw==
ARC-Message-Signature: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757323876; c=relaxed/relaxed;
	bh=vOUWWA/OEL3p0X7QghuOVP3ekc85NorR1xQs8c+jbtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FPE+EbBtO0SJcOhwXkOSFlO6eOlMt3/SNHTGTfw2Ut7mzZC1GlslsQi7ulc9UMWGiZO89hP8U5X3QH5hC4B7lh5bz2O+moA/SkBQUWJmSo8yo5OFkF6X0M8tXk8ICqgm98jjrmcOFNbRhkcCKuUDWCVMLN2ZmlB29jzCtzOMm0nZlFajCnRKNfCast5Seh05qm8EnbD1TVvtjnbE8uvaZBMgE0ix59FZxQbhcRBWb/7CiS4INhxVHa/XLr5mcyWzRVnxOrD8a12KJKMXAweB8Itk5TEcl9lkiqOjvgwpMqOHK7rKAaxED84kkOnJc5IkofvpPx9VewzR/lXqs2bBIw==
ARC-Authentication-Results: i=3; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=QXEMMy0j; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=QXEMMy0j; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=yeoreum.yun@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=QXEMMy0j;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=QXEMMy0j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=yeoreum.yun@arm.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cL1sq1mQBz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 19:31:09 +1000 (AEST)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iGpmBvfufjmOJ3JFsg1iU8dH7VRNNQK5puR6tGHMSABfhyBYpT31H6j6gFscbC7woUa4R3VBOUdmB/oaW+sYBJsknYcLi/8Owefx3D0OdF/BB6zdwwfi8S9OHHrjE7mVQswC1UmYKfC3HYn+hhJoUyjK3J4QtSktf0ue0hCLeaGwtzeHX0HZYUBZYjlxA+xe2pYaWtNby0VtQ6bCoGlDDNdlYr47qpK1Ik70fb6fy27ZfzsHwzjR8Out/qVyz51ViOPXXZTQxMirbn7GQKE7KP5ZTOIfoMWUykGamwbK3+IzPBx9sxUZNyHSmYz7vrDOTym9eSktXO9n1mHdfOPh7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOUWWA/OEL3p0X7QghuOVP3ekc85NorR1xQs8c+jbtE=;
 b=QfXAAzycbnFV0ohmdZkanrjEfvt8XiiVf8p87d3+aMzSv4X2YBnHGrYeSxWDK71Tj7HsZ+TqiEnqswrU3qf+QUG/+ZXvl9dfQjmgPfE5jhACYVcKk+uzVPLNgOU90CpqqjznoiYf4w7P4+xoDrMXiEP33OFfbdimg3So8p0AB8DFX+U7Ml2IZ8bjCCmsfms+QFikwFvsRq+KmNUFM/ArRJYsAIfOU7IMiwOZtc7pOU7vekMMgylMucE+87CEnZ8GO+/gy9iJ83HWoku3kSGmF7ZtNasa0YiQBBp+kvHJYhYiQdxDLY+Tgth7wtb4CeDDSJaiQQ3BNTLbv0dp2EkPIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kvack.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOUWWA/OEL3p0X7QghuOVP3ekc85NorR1xQs8c+jbtE=;
 b=QXEMMy0jbf8+cJwrQCLoZ+L2M/et+OVOUFWxToDX+d8MDQ/2RVcJaV9llBTR5oV5mrxkrhrAP4e+VV8iMsQA8o1PzMKxHVfGm8rvISCmL/Hyl0SdhlI8H4fLCyUxLRQ+wnBA8mqGrFbJrAgJn7r6ILJ/LkX/TEVXxgx3YLSHEyU=
Received: from CWLP265CA0536.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18d::18)
 by DU0PR08MB8729.eurprd08.prod.outlook.com (2603:10a6:10:403::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 09:30:39 +0000
Received: from AM4PEPF00027A69.eurprd04.prod.outlook.com
 (2603:10a6:400:18d:cafe::ae) by CWLP265CA0536.outlook.office365.com
 (2603:10a6:400:18d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 09:30:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A69.mail.protection.outlook.com (10.167.16.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Mon, 8 Sep 2025 09:30:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoX2Dbq0kHw/BHmBV26uWb8hs95iiOCAj2a/rJpBuDMhN5dL/Ssziqb9zeIM9/waLCHYvGCrfKduV7Fmj8Tz4DJquXymLD38rlPneK9YfMBp/1kaE0zUdu4kRGwkCmxPA/EkjPWwPfYh0PWEmj8zRlptjuQlzcJ2rv8b6g+hstvfkEbDA0HFIHZGuo+fs9kxcwsSArm8PEdNBBaKcWTVT5VrI9RbCbRiEJmTwaqsTPk1ejUguWNbI0rRnK0dM8r4gTaNNLB22opFnIsDsycbYdhA2wYIFkXNWYLWaBm2OmJ1/qEx06s6KZpRxmN+opw7wYEGmaHZSh4WKiyV8Y8i7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOUWWA/OEL3p0X7QghuOVP3ekc85NorR1xQs8c+jbtE=;
 b=NUtcRawChS5qDt8PnMtuLkR7MJj30sNUZxcPsJ77C35mpsOPVYrUbOx6zpJ6udsxPA62SnMtndz8sfgJOynqlOEuO8hD/9O6ulLFt4kmaKvY3iNSNPprw+3qo8KlrDjKcf34TusnQsbhon6MjJPtrRYV5dPl8b1SfSB6yzSx/FWNAKSpOfoqv+Gdmh2NjSlsjFvBQtiPGhZJSqNSdf+6pptFc8PMZt//FdBDqKyAhIPGINFEyycGhKJ6v2sCwRVQ5p4i/2UBqKlE7CUhtIbT33DniBxcNQJVtmGmN+1Pvg4U2SXBa6TbEf73dYZCVzipw/f1jq2qM/vz4KKYEZ5poQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOUWWA/OEL3p0X7QghuOVP3ekc85NorR1xQs8c+jbtE=;
 b=QXEMMy0jbf8+cJwrQCLoZ+L2M/et+OVOUFWxToDX+d8MDQ/2RVcJaV9llBTR5oV5mrxkrhrAP4e+VV8iMsQA8o1PzMKxHVfGm8rvISCmL/Hyl0SdhlI8H4fLCyUxLRQ+wnBA8mqGrFbJrAgJn7r6ILJ/LkX/TEVXxgx3YLSHEyU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAWPR08MB10043.eurprd08.prod.outlook.com
 (2603:10a6:102:363::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 09:30:03 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 09:30:02 +0000
Date: Mon, 8 Sep 2025 10:29:58 +0100
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
Subject: Re: [PATCH v2 1/7] mm: remove arch_flush_lazy_mmu_mode()
Message-ID: <aL6iFhzHffBZiLoy@e129823.arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-2-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908073931.4159362-2-kevin.brodsky@arm.com>
X-ClientProxiedBy: LO4P123CA0123.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::20) To GV1PR08MB10521.eurprd08.prod.outlook.com
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
	GV1PR08MB10521:EE_|PAWPR08MB10043:EE_|AM4PEPF00027A69:EE_|DU0PR08MB8729:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b09db62-edf5-4d92-90d8-08ddeeba5f8d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?f1IJZJHljl45/WtULoZQyk3Ik1Ezhox9xuh0cfix+5mYbsmGZpqELCPQxXVT?=
 =?us-ascii?Q?JdaCBzxgHkEafJMNZ8etA8dIwVwCFwwP8UfEsDxrZmpftLfbq6SRkOw86d57?=
 =?us-ascii?Q?6/Lf0ssxB9ktwpwPOshc5DxX9XPge+drJyf3q6r+uuxddcAxALxRbbDJdJ8K?=
 =?us-ascii?Q?+stEODE02G/qo+qHMCQojV4N3Y9HFRJbWj+QtFnPd/l+2OIWpAewB9do9lH9?=
 =?us-ascii?Q?fI57egw1nc26OnvIgOfhUAlF7ZumcQ0c+yxsK4MLPNUjBi/y4W8JVsG0C4k3?=
 =?us-ascii?Q?KsI/2XKmjB7Ur58FnOFLaxg8vfMfbfJCuI0qSOHabLXgFDGGJw+xd/cuUbz6?=
 =?us-ascii?Q?vmdblVkx+Aul3uY6mqrZnhC7PjMHtLK/xqGF5DA+jMNXM1EipyfWL+hWO+UP?=
 =?us-ascii?Q?c3cUVITbvu+X3KJVcXx/D6yUivYOE/sZYmEAwa8rIlgi6xA3zgI6mgn2YEHY?=
 =?us-ascii?Q?bET/Q8yX++QM3dCrD5/ULKuj1SRvRpaCIZpHCHTcdNHsGp5RE03SCpvkoP0+?=
 =?us-ascii?Q?6yMAuGzaMcXqE+lEB7A62w7YBp/+8CRbk/LuxoksKGBJlOJOBwHRZtRerNO0?=
 =?us-ascii?Q?k6QLAhCXMeWgGIcPihTzcxya8fs/3jR/Chkg08zFXr1VBoakEATGQBTaqn8C?=
 =?us-ascii?Q?tejt36oa48uVWDqA2RgZsU5Hw6SJc9PLlBMf5TBM3xTlbheKZ5/K9xkils4p?=
 =?us-ascii?Q?4Qw3HkjxK6xfxKakeS984EqbORRHkGwNVZIYnFXK0y8nFjF9mSQj0Mmrjey2?=
 =?us-ascii?Q?qmGAvnYXA8MWBC918bfvrMJsud4MjxFvsK8JJ16uVZqs6QjJHKSeYxlHaTIg?=
 =?us-ascii?Q?BfNxIwmy6aALHpON+MS9FCZbnB0etI7+V4d+5yiFgWE2RTOdJj1sNcVTivtv?=
 =?us-ascii?Q?MzyDCdAQ/Nb1y7aQGpree22MS4RHtSBg2+n82Y/AO/+tDRRIa1VR9RdPAd/E?=
 =?us-ascii?Q?yRRVtLVUrCfacMTRrdBqWv0p/ihxsQ2a1hYToOyfxpYmwEb1UzuK+xa11+32?=
 =?us-ascii?Q?jlEAx2v5mTUlf9LkXNMH1fsDR5uanV1AhnCXUnDo2vIpxACtVPR1b6PCN0W2?=
 =?us-ascii?Q?LPXqdgE2qyec5NsVYnvwbk3Eo7V7T+nk9N/9E+qotNquxWmRRrF7Hd29OTo9?=
 =?us-ascii?Q?yOnZtOXOI5B51ssW6bnVzu9wmebVh7QaYPe9sp78Ggkf54Unk0RbrcuVKHrt?=
 =?us-ascii?Q?rUEnFPSMRQPScQQrq9TsBpvVSNx/iYq4Mr0NjOgLoX3nW/MzR4kfePAxtfVA?=
 =?us-ascii?Q?ewqNogWsqTMa1Kp/YR6ofF/8hiwV6q7SJW0+b96Ghy7dmi87XCoRNrLNoopL?=
 =?us-ascii?Q?MPKPjGVVuV3X5o9JG7dBM47BEPsGlMZPVURyA32eLLsXqII+qu9OOMbl5nIK?=
 =?us-ascii?Q?0Y9d152DKvfDq3qKPsegtLB8VMJ5kg4HPJDNSjF17E0pBzeYHNzpKKdpB5CU?=
 =?us-ascii?Q?FfZ887dUCtA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10043
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ee929ebe-d05a-4cf7-3e2b-08ddeeba499b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|376014|82310400026|14060799003|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XTb55XNyCTqw7LDqiWySGgdu8y8jTXVniS46YcPt9jbJRNZ4aUcoSxeP0MxR?=
 =?us-ascii?Q?sFxcDq45q8TvxsRfrrzGY4F/QvRTwySlH2c9xHkqN2NglQ+EjEHzdN9ebkQf?=
 =?us-ascii?Q?JR3GLhvuwpPlKTJg5LuWH0+N60leOmqBg5SHfloEdrc575UJCnEqcHQacroe?=
 =?us-ascii?Q?1C7ASUHtuLkO6V++csVTZMfU4+mFWLXNU0Kbi9Uaa/CU674Ti2fbbGzzfEW7?=
 =?us-ascii?Q?XwHPce863w2bpPuiWG1+lxGopvXGh8eGUHAGoNcHNiNC72tHQag+EvWeMn/4?=
 =?us-ascii?Q?thUrEHJaZVRcoOdxQFAJrMIAmwJaBesH5+MfH74xFDK8WSbvUzZlN69AKvso?=
 =?us-ascii?Q?oUfV+Q2zwwK7yNnQzJ1do5bJyKqC+R1off5ZHvFefhryM/cU0FwS2rwcNXyd?=
 =?us-ascii?Q?f80Ufep7/YH6QaSrvRaL8wr1doa2aB5ro7oZ1jMvYC7VUwZIDY7nZTZ7/4dp?=
 =?us-ascii?Q?o3twL6IiVcP6eHFu2JsN5mUuH2ES9ChHR7V6B+H7gUu8XVWuJhD3jS49RNg8?=
 =?us-ascii?Q?K+IrgwC0ZcQhZoTj0CQ5pMZdIncNmvr6cy27OpIxf8fknBYcST8+8v6PnBzc?=
 =?us-ascii?Q?F+qv9TV0EyDZI0q6QsHQrXwD6zEBhYY2zhfJxvPbatGzyaUHB7KPnqRs9FBn?=
 =?us-ascii?Q?M9dvOlfXArybqocu71KPEFxnkWWvMWaRTOZfPbjZmszfS4O9nad98tyQhSU6?=
 =?us-ascii?Q?bLsuUAGadUVeNz7TYU4AGZ6GvKh9ElYb9BtxEebNChNjwZv1IdNcxFVjgfIp?=
 =?us-ascii?Q?4ibZmq9WJdpjgsvtxVSEGnvjGyAL+/pR2bwvrDQq6fTgCHFSlf8oifiDbPTZ?=
 =?us-ascii?Q?P4y2mVUWLuKK1h04PU04TIew45CrLwROGRgR2+dO6xCsW1PpUlRa5x096IdO?=
 =?us-ascii?Q?wSII2fJUMaj3fR7wH6GJMHbTeK8K6lLl64ZDSeHi7aUXeob+f+Bvb/6BLseg?=
 =?us-ascii?Q?/LB/F0cWG5+UpArGtyslxwKuopiyP+doRlqhnHOZXO2nCbh/fBzxdeCsO5gp?=
 =?us-ascii?Q?w/mGh8TfhQM+BhVBwBkiXHdxrJNqFu3mq0kx28eUk//EGGkP0/WP+Y7Pq2ge?=
 =?us-ascii?Q?juWhhL8SGmo2BLUWdJZPHLh3NIxcrA84OYMeYxTgBX0hYTjTO5TQP0CbCTmW?=
 =?us-ascii?Q?bf4LoO0su2o5mvQ60j0AOEZvVgEDNcmSR9ywi6mJp2ZbJ7BtnNPOEznukGGG?=
 =?us-ascii?Q?kL8qye7rDTpbf+ZsCUHmEzyGoW0/A4VfbanRP9UWb70NSa+396GrOxVbztdI?=
 =?us-ascii?Q?Av7JuUtT4FMavr2pw6hdXiI6ry0Neu5RShlkfcf94tVuG1KcLstk8G4DZ6LL?=
 =?us-ascii?Q?JZekreDRt1Xu3e1joR+HuwRwTUNEvjYFPMeBHEyyEbO70mKOC34ALC6WbJFA?=
 =?us-ascii?Q?DfIVQ6+hI65vqP1xzeDB0/X3Sqp0MYw7tk0UNp3hgZ+EsUnzn+9MrWuFOnYu?=
 =?us-ascii?Q?XzFLf1ltXHYReEC+RZL6Rluruqv5zcsvsk2LPNZmBQWfXGqsnNYd9k1Wrl8J?=
 =?us-ascii?Q?l4I7qm3IuWZ2dfQk/AvHjn8N8HR6ppCClWS1?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(376014)(82310400026)(14060799003)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 09:30:38.9917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b09db62-edf5-4d92-90d8-08ddeeba5f8d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8729
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

On Mon, Sep 08, 2025 at 08:39:25AM +0100, Kevin Brodsky wrote:
> This function has only ever been used in arch/x86, so there is no
> need for other architectures to implement it. Remove it from
> linux/pgtable.h and all architectures besides x86.
>
> The arm64 implementation is not empty but it is only called from
> arch_leave_lazy_mmu_mode(), so we can simply fold it there.
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h                   | 9 +--------
>  arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 2 --
>  arch/sparc/include/asm/tlbflush_64.h               | 1 -
>  arch/x86/include/asm/pgtable.h                     | 3 ++-
>  include/linux/pgtable.h                            | 1 -
>  5 files changed, 3 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index abd2dee416b3..728d7b6ed20a 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -101,21 +101,14 @@ static inline void arch_enter_lazy_mmu_mode(void)
>  	set_thread_flag(TIF_LAZY_MMU);
>  }
>
> -static inline void arch_flush_lazy_mmu_mode(void)
> +static inline void arch_leave_lazy_mmu_mode(void)
>  {
>  	if (in_interrupt())
>  		return;
>
>  	if (test_and_clear_thread_flag(TIF_LAZY_MMU_PENDING))
>  		emit_pte_barriers();
> -}
> -
> -static inline void arch_leave_lazy_mmu_mode(void)
> -{
> -	if (in_interrupt())
> -		return;
>
> -	arch_flush_lazy_mmu_mode();
>  	clear_thread_flag(TIF_LAZY_MMU);
>  }
>
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> index 146287d9580f..176d7fd79eeb 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> @@ -55,8 +55,6 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  	preempt_enable();
>  }
>
> -#define arch_flush_lazy_mmu_mode()      do {} while (0)
> -
>  extern void hash__tlbiel_all(unsigned int action);
>
>  extern void flush_hash_page(unsigned long vpn, real_pte_t pte, int psize,
> diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
> index 8b8cdaa69272..cd144eb31bdd 100644
> --- a/arch/sparc/include/asm/tlbflush_64.h
> +++ b/arch/sparc/include/asm/tlbflush_64.h
> @@ -44,7 +44,6 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
>  void flush_tlb_pending(void);
>  void arch_enter_lazy_mmu_mode(void);
>  void arch_leave_lazy_mmu_mode(void);
> -#define arch_flush_lazy_mmu_mode()      do {} while (0)
>
>  /* Local cpu only.  */
>  void __flush_tlb_all(void);
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index e33df3da6980..14fd672bc9b2 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -117,7 +117,8 @@ extern pmdval_t early_pmd_flags;
>  #define pte_val(x)	native_pte_val(x)
>  #define __pte(x)	native_make_pte(x)
>
> -#define arch_end_context_switch(prev)	do {} while(0)
> +#define arch_end_context_switch(prev)	do {} while (0)
> +#define arch_flush_lazy_mmu_mode()	do {} while (0)
>  #endif	/* CONFIG_PARAVIRT_XXL */
>
>  static inline pmd_t pmd_set_flags(pmd_t pmd, pmdval_t set)
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 94249e671a7e..8d6007123cdf 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -234,7 +234,6 @@ static inline int pmd_dirty(pmd_t pmd)
>  #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>  #define arch_enter_lazy_mmu_mode()	do {} while (0)
>  #define arch_leave_lazy_mmu_mode()	do {} while (0)
> -#define arch_flush_lazy_mmu_mode()	do {} while (0)
>  #endif
>
>  #ifndef pte_batch_hint
> --
> 2.47.0
>

--
Sincerely,
Yeoreum Yun

