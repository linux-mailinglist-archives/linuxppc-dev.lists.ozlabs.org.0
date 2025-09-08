Return-Path: <linuxppc-dev+bounces-11879-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7023B48BB7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 13:16:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cL4C75lnHz30QJ;
	Mon,  8 Sep 2025 21:16:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c207::3" arc.chain="microsoft.com:microsoft.com"
ARC-Seal: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757323880;
	cv=pass; b=ZsT8PmpO5JfQqochdrnZLg9E3Zb0s089tdsNGbwCk8ksbZffG1S/WNRgaNvOMm1Q2sEAta6UG6jwqOAEhEnoOoPpYniPc+X1tanTzmoqRb++m+xCvlIyU/rsnxXN40IWRYYWEyn+cXJYOX57xuB3PAZdIN+T+NMHoIM3CwPowVAHQiglmGmtt8yHWZDoHtamF8WJdoHeSsSlI3yuKFEOSoC72iUQOMaJz/PWUHPIqUzc40EzMQyyAuC4HjWng+jmwowGdw+Q++SIi7mmIid3GT1SH37W2rTVfWgmqfLv4Mi1uXsVswjk9rqYqqTzWnW47/JMz1PZbAxtmIXBjRogRw==
ARC-Message-Signature: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757323880; c=relaxed/relaxed;
	bh=DaYvtMCUc7HaNytTiGoaGdb5sm3gkswZa1sIoxK/VHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YYgjJlR+T2/MS03Eb2vWGNlueDxP6EzyKVFJDV65TRYo7CRi3zDIhSppF5xwGxD4ZL5SQExkQrdCl4uKaZKq+fwFaNzKICX3Le/vZEpajBdnAA1KgVSUTbgbR5CR81uE/VFWvQpNJVc4+JaKlGsJqz0PEOGZfeI5a2+dtPSVLlJIAew3/YLdspIMpF9zuh8rlFrqGys3Uus7PGIvOzMKdhh1oqgmw1Gm/2D2c46U+SO4/WahmI8hAXuxCuDgWkvN/ok/WXJ7htOHowC1MkILoHzi9yMcjrMk4Qn+vvIHnq9ET/Q2wsn2gu43r9+AvW0SzBGMSpINTb0gMjtevvvAVg==
ARC-Authentication-Results: i=3; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Wh23FTZV; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Wh23FTZV; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=yeoreum.yun@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Wh23FTZV;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Wh23FTZV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=yeoreum.yun@arm.com; receiver=lists.ozlabs.org)
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cL1sy2mcBz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 19:31:18 +1000 (AEST)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=V4+y9aWBQR/UgO4zrl9iPaUVywcw0ABT9A4SrUh53QITKBCODBaQm1peW3whXuuNc3Kp+rHUu0QEkx58tPWjFRP29TnQI3snyH0oKNbNyReoeKTRLoSCP/OPEd8UpuyT5vk6jBzJoOqCLz2DttvuHfTTkj9zaJCcoNxxZy76jDJVARKJHwnx4xvb9TvvvIaYYhqhslAmlJ06WMMVZU28lImf/WgAjXB0XUnIaR+bW1DWcHuJZYsKWJDY0vbisZVdn7UkLpZqGGleEGKXHG5jKJn9q76vm4AzeHFYBKotEFQ7YvsBxJsKtnXh9r4aopZ6w6K865IXcFqacprvirKfRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaYvtMCUc7HaNytTiGoaGdb5sm3gkswZa1sIoxK/VHs=;
 b=BDK4Qz0YNURXoeBFf2bQt3US3Vam/PVYZ1ztwhYr+A1MQ76z2wswcVBbcb8/udumFvX9OnW4tjCBIwIWfhzIqMXnO+SGv8lwLuHxE03+K9zX6AoW5KmK7h0nX5Ys0wk7RGS7tBo/wHAacEdRkrSqAop4adLaUpQGi61PxmeFReqsUBACLXEPQn9Xm9DIqOOjHN8Pq5JJkEQbKsl//1tiIDVRUVvU3f32fBObkRpXh2pw+ddw21yti/Q4qAUbyoqJDoemQ8rXH06bnWUZBKR4VuFeYoSZhQ2Bk2PCdMVy+WHMBwp1ve0QIh/XZt7KIEqMTGdZ+lBTUjzb5st3ELvqJw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kvack.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaYvtMCUc7HaNytTiGoaGdb5sm3gkswZa1sIoxK/VHs=;
 b=Wh23FTZVJTJ4PiEO4ZD8Jt1IpjCT20c5CCxFkFqV8CpQ/nQLoYh3wS4keuWcQvL6FigrK5lcNrmRcM5uK1iHtDWhSnW0XTy0y/SCNFGR/4F6sQ8SA6oLBuF6zdffQA6CFRaIiD+Zm+fnqrN38+LqmDP9hz78k3eBIYiF53lWyW8=
Received: from DUZPR01CA0147.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::29) by DU0PR08MB9028.eurprd08.prod.outlook.com
 (2603:10a6:10:474::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Mon, 8 Sep
 2025 09:30:53 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::60) by DUZPR01CA0147.outlook.office365.com
 (2603:10a6:10:4bd::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 09:31:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Mon, 8 Sep 2025 09:30:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRE4Yj+dIkZcWT9RHtrqQC56LFsJ+wa5D7SA0NFXB6Z2MDQIWbwxM3YNZexbN6GvBrGt8Cx/HBQP6MJDDrNZNpF9+ISE2OGIPalvh5qu78OZTx0phjFNFn+EQ34ARcA+om3M5Yz40BmiVvRbN//ty3Kw1Onvt88iog0sLOQ9zpy3/0kOK3RvP6bYVDjfkV87iCgoITftVyxTZjvl7AiSXRtf9L+1Z9/xD+a0N1pNvwOtVr+A0UyU+N/lvsxqz4uxTbzHdLtqdJsmleIh882oyuM2JwiyOysMMaiV0Eg8kTmvjvTV2Iq+a2fCmqkBH5H6SWmtjURSRqQTdvfojN9Nww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaYvtMCUc7HaNytTiGoaGdb5sm3gkswZa1sIoxK/VHs=;
 b=w4g8PNMh29awP19Bf1kek5RX1p1y0joC4WASy+K0AS6SrQ48CbnzUtShUdrkjTi197q7pi8ieEOapGmYBQG9O49WCMRGOEEEzeCmtwyaTcWif6uL542lMAi7SfcHpoCD0k637eQC6hRtoZlWVvk+aRdSgRvWB1HoOhOiHYMdKfCdRvwbeEJDGSCX2BNA8KY4Tz/woG3OdzvHiMZGY4sMHiSIryhvg7rpCrCHt1PtkaZrW5TbONNH1D6oJAeuXlxFXH9DkleaZvJw6Cbk6aYK9nH8Cm+XeG6spr5MOgnS4l263cyeqN+zqOs5pHOXiQtRA77jxhTQaF15D0/wqT9JQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaYvtMCUc7HaNytTiGoaGdb5sm3gkswZa1sIoxK/VHs=;
 b=Wh23FTZVJTJ4PiEO4ZD8Jt1IpjCT20c5CCxFkFqV8CpQ/nQLoYh3wS4keuWcQvL6FigrK5lcNrmRcM5uK1iHtDWhSnW0XTy0y/SCNFGR/4F6sQ8SA6oLBuF6zdffQA6CFRaIiD+Zm+fnqrN38+LqmDP9hz78k3eBIYiF53lWyW8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAWPR08MB10043.eurprd08.prod.outlook.com
 (2603:10a6:102:363::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 09:30:17 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 09:30:17 +0000
Date: Mon, 8 Sep 2025 10:30:13 +0100
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
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
Message-ID: <aL6iJfD9mS5JQeGZ@e129823.arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908073931.4159362-3-kevin.brodsky@arm.com>
X-ClientProxiedBy: LO4P123CA0290.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::7) To GV1PR08MB10521.eurprd08.prod.outlook.com
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
	GV1PR08MB10521:EE_|PAWPR08MB10043:EE_|DB5PEPF00014B9D:EE_|DU0PR08MB9028:EE_
X-MS-Office365-Filtering-Correlation-Id: f1176267-698c-40c2-a70a-08ddeeba6787
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?m12OBJz4DgyCQa2k6ZLmk+HJ2jLRYl61cXrmMEJu+WwUgZyevuVPBCh2gTtI?=
 =?us-ascii?Q?Ew1TZp+enB65S00uzuB2gHtKfVCcN04CDi3V+Swg/awrB+tIo9b0qOeXVcL3?=
 =?us-ascii?Q?pshYKcu52n/OQN3YPBplfwmVkGN/i66amgYGX1Q/ryLK3IApyphBoOsnSuWE?=
 =?us-ascii?Q?WBL9MfVyB8H6VErm8hSyQMdqbKE80XLbKgv083ZbNC3WGVAWxJGR8PZQnKws?=
 =?us-ascii?Q?IVCNd2HcEQ4hk1hlyY3+COc9gV9d471OH2GGNBGh0BwNSF5PQ40t5JJomhq3?=
 =?us-ascii?Q?L6wVVGGpwlUblnv4hS4e2Se2HfoKdhwDMCzfHnIPUZSjTg01E/n2APgsIDJ5?=
 =?us-ascii?Q?/5vKUdq+FzH/TcXUVbF1ySP+NWlMYn9fzDuzSLDROR/1b6SBSfm9dl3QBbYK?=
 =?us-ascii?Q?UWdgFcX5f4+SO0RDbNUxkxE+Oy+YmykpPxpk+FsOSMX6gk1hYiRCnieveKrW?=
 =?us-ascii?Q?9L8LL+OMJHjTyx8N7dAeX+7444V+l7/bh+yDe99Ai3Rz78uZ+DLsf5+P9Taa?=
 =?us-ascii?Q?KCfS6p8OrrHQpTkASFpa4C2J6LjYIp2WYrY85+GOse+VOt5xh5K9p250TSXH?=
 =?us-ascii?Q?3vAtWtLbsyq5BNmz7MqZPyNqND+eChI7K1ukx5viRpFT4w/jy7eMpeUek/9F?=
 =?us-ascii?Q?sHOp+tjyZfe8jXf49GQ1cj7q2VOgUuxAfopwYscjp0RPk5gs35p/gbkH4t1P?=
 =?us-ascii?Q?3CcUEuYJwpCU1FPwdF4jb/mCSV+OnP8q2S69PErr+Z2xEcoHE09PQyto49Lz?=
 =?us-ascii?Q?hNn2+ZpvmA96XfqflhDb8JWwQquEtHiLF+z08P/CLemSdbZMD1Sf5CNqy3G0?=
 =?us-ascii?Q?NKputRXvSvNvurwZs/8xEe4HfWmPM8/Vaw1fxZwDSYqR8YqL/qPE4RaFzf0R?=
 =?us-ascii?Q?eoEIx7XPAur+e5LRZAqk88YRWITZ2s6df5CYEmnWIh07lboW1ZvW/HvABGal?=
 =?us-ascii?Q?9Sos5aDyQ94aNjDC3/VfCOkGyHvx28VZzzXJLqTZCJPUkTjlBAmLat+HW6L5?=
 =?us-ascii?Q?+G/0ZkVlXQBYIBfk5P2o7m8tpQGXS23c6F0w6yDd42ETs03qGJBo0m27iaFQ?=
 =?us-ascii?Q?sjnam8KN/PC1Vd88jTiJR62PWN0MiRau9tfUXHmP34nDNU0Yh2+I4f25Xoq1?=
 =?us-ascii?Q?zlC1dM6707600CjkrB0tUmZhG80zqlzqB/1ij/4XcsgHNhMC1jwKsAYW7jpE?=
 =?us-ascii?Q?vTSwyqL0UXbk+/CwLQ64mN73cYxUOh/BzlE45KRD4i5KL0OQ7ILjPg6kR0Yc?=
 =?us-ascii?Q?8fy83rqlnV/O13JM0XmZd72/W/v9vI7gAVg45WeMXvoxFHFVsFBCfMUVPquE?=
 =?us-ascii?Q?tqnuRmsyeYKFRE+5r8JX2/jx6QtaCVqUxqGiw6ovJaPJxe+agpi8RNpcIRAW?=
 =?us-ascii?Q?KfmA3OIgi8ctpmeMXDbKx0MMzZR4rqL9sWsZKfpwcGW02kX37FVmRPGex8Bm?=
 =?us-ascii?Q?J2LEJqgx12U=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10043
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d15ea810-a166-446a-3d72-08ddeeba5284
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|14060799003|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7GhoUjxOZ1KvT67RUa7dMl4fEObc4B6Xj5OyXxXvbToeauikOOG3DZEPN1Ls?=
 =?us-ascii?Q?si6vE635w5I97yHyAhgBBKdLVrj2fAMFZmFjpIoiVJPki5opEc00kvDJBblZ?=
 =?us-ascii?Q?ORDr8m7YP9zaaDrkX4nWlH26MX9IuJR69X/JmdmghwxbxiBSx9f+JdBzRf5y?=
 =?us-ascii?Q?W6XFcQRkIirPijIvCY8Y6dBsRlKGNbarQe/eBREc+BEX4aUCOnbJH6xZufH9?=
 =?us-ascii?Q?OZKXXtuN9BlhKspULvD/N7AfRZpIuH189eycWxamnAaS/2Cr7YG3aRo4h+ws?=
 =?us-ascii?Q?DVNxFo1qRjSOe7opOgP3BSazZocDCcUJuzHQP4Kp1sBaGDaeeuzs4hD+VNNw?=
 =?us-ascii?Q?weo2R5BfrcxxMFuxs+mqCsjyjSMzSN4fQAIyNPJHiujpKh1Yz4UX762m7j1N?=
 =?us-ascii?Q?5Q1gxofYIQcBKkdaQ0ZcngJezsb95FThh2xbRmVWqiU9yIXdn/8fAdFmxDRO?=
 =?us-ascii?Q?t15J/eSQCbDAX6xPxKfKrI8ofKaYD5MBnjVI/ijhnRGaAJoQ+qSEJzdACF2r?=
 =?us-ascii?Q?BOlPLwvOsLOShROGxvtsxNFLK6qaUZwGb770xMxSeasSVicvC6GrANiFiasX?=
 =?us-ascii?Q?KlxNf8r9fm3QRf10RdK0lalKi6k8nW37SySsdfNInwYRCLU3QqD7RmnDohYm?=
 =?us-ascii?Q?gDwJmisGPleh8qU5mhGN8w22aeTaalJ6+TFZAc22YUeJx20br5VS1MVU6/je?=
 =?us-ascii?Q?YrG23FJKf87rhSq0D0gqD3SC+qrdkLZi3DWa++sRczmY0OkfUWjM6lJfXVez?=
 =?us-ascii?Q?GrFxycqACOkJhUYorCn5OpsWM0aXgULjj7e7IgnWRMtChK61X4zN7x15UznW?=
 =?us-ascii?Q?zSc32nxUGCkUBGxcVmeI40BRrf807d0VbL4Z5RfBo7gmaznz/hjrVb8bypJS?=
 =?us-ascii?Q?tJRJARgvNnZKn8TkGq3p8yrDP86kzbojP02OcDN/VlQV3Wy2Ou3+vaPJ023I?=
 =?us-ascii?Q?HqiNQH3PsP2KS7OwVC/Je3JNs8+pfffPe3sTX0uscZfMsm6lHNeqNYT+MLw9?=
 =?us-ascii?Q?YVabD/oTpUvJuvmrwKLjgW9A69TFSyTbjfW/hNSkyQZZ/wN+Xm5NVBKTIhBu?=
 =?us-ascii?Q?o/uH/x21ZP/ew+dkR6q3Gt/sCi+xAmdMBOt0YMwijx0h8pD+euTyV0PGj1gW?=
 =?us-ascii?Q?2BmKtkgHeMNQYFPQJJv8Ol2gCyCFjkZcLFLkB6FACz4xTA7l2DBiqhvCb9Pd?=
 =?us-ascii?Q?Kr5d9ZZV5Y2w+7KO8x/oLaNncUZV29+HmZXwZJRSIXTfYrDPa4mkintDVR0s?=
 =?us-ascii?Q?ATyNapr8HYnvP1S3+40GbxuCiq7NnaVAzUV21KPEmA44oQ9isVDWkLJvt/gh?=
 =?us-ascii?Q?OATi4g46rdVIaPTSOby4c4GiWKA1KZBO4mP21IWge8c2sPICDUeKz/uTQ23H?=
 =?us-ascii?Q?VAc8XJN+raf1yYL1Hocp33zY4p4WezF55C2F/rNJhjaZvufY5m2V7fwgXhPz?=
 =?us-ascii?Q?2Q5PGh9c4VUsO88lHiYkPvTMQnh32DsMYSuNMdShEHDPCEUgBOMHZw5YddW0?=
 =?us-ascii?Q?8QzLEHcbxf/U/Ws4ZYeuzXF+rUsobf1HoZxX?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(14060799003)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 09:30:52.3665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1176267-698c-40c2-a70a-08ddeeba6787
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9028
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

On Mon, Sep 08, 2025 at 08:39:26AM +0100, Kevin Brodsky wrote:
> arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
> (taking and returning no value). This is proving problematic in
> situations where leave() needs to restore some context back to its
> original state (before enter() was called). In particular, this
> makes it difficult to support the nesting of lazy_mmu sections -
> leave() does not know whether the matching enter() call occurred
> while lazy_mmu was already enabled, and whether to disable it or
> not.
>
> This patch gives all architectures the chance to store local state
> while inside a lazy_mmu section by making enter() return some value,
> storing it in a local variable, and having leave() take that value.
> That value is typed lazy_mmu_state_t - each architecture defining
> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
> For now we define it as int everywhere, which is sufficient to
> support nesting.
>
> The diff is unfortunately rather large as all the API changes need
> to be done atomically. Main parts:
>
> * Changing the prototypes of arch_{enter,leave}_lazy_mmu_mode()
>   in generic and arch code, and introducing lazy_mmu_state_t.
>
> * Introducing LAZY_MMU_{DEFAULT,NESTED} for future support of
>   nesting. enter() always returns LAZY_MMU_DEFAULT for now.
>   (linux/mm_types.h is not the most natural location for defining
>   those constants, but there is no other obvious header that is
>   accessible where arch's implement the helpers.)
>
> * Changing all lazy_mmu sections to introduce a lazy_mmu_state
>   local variable, having enter() set it and leave() take it. Most of
>   these changes were generated using the following Coccinelle script:
>
> @@
> @@
> {
> + lazy_mmu_state_t lazy_mmu_state;
> ...
> - arch_enter_lazy_mmu_mode();
> + lazy_mmu_state = arch_enter_lazy_mmu_mode();
> ...
> - arch_leave_lazy_mmu_mode();
> + arch_leave_lazy_mmu_mode(lazy_mmu_state);
> ...
> }
>
> * In a few cases (e.g. xen_flush_lazy_mmu()), a function knows that
>   lazy_mmu is already enabled, and it temporarily disables it by
>   calling leave() and then enter() again. Here we want to ensure
>   that any operation between the leave() and enter() calls is
>   completed immediately; for that reason we pass LAZY_MMU_DEFAULT to
>   leave() to fully disable lazy_mmu. enter() will then re-enable it
>   - this achieves the expected behaviour, whether nesting occurred
>   before that function was called or not.
>
> Note: it is difficult to provide a default definition of
> lazy_mmu_state_t for architectures implementing lazy_mmu, because
> that definition would need to be available in
> arch/x86/include/asm/paravirt_types.h and adding a new generic
>  #include there is very tricky due to the existing header soup.
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h              | 10 +++++++---
>  .../include/asm/book3s/64/tlbflush-hash.h     |  9 ++++++---
>  arch/powerpc/mm/book3s64/hash_tlb.c           | 10 ++++++----
>  arch/powerpc/mm/book3s64/subpage_prot.c       |  5 +++--
>  arch/sparc/include/asm/tlbflush_64.h          |  5 +++--
>  arch/sparc/mm/tlb.c                           |  6 ++++--
>  arch/x86/include/asm/paravirt.h               |  6 ++++--
>  arch/x86/include/asm/paravirt_types.h         |  2 ++
>  arch/x86/xen/enlighten_pv.c                   |  2 +-
>  arch/x86/xen/mmu_pv.c                         |  2 +-
>  fs/proc/task_mmu.c                            |  5 +++--
>  include/linux/mm_types.h                      |  3 +++
>  include/linux/pgtable.h                       |  6 ++++--
>  mm/kasan/shadow.c                             |  4 ++--
>  mm/madvise.c                                  | 20 ++++++++++---------
>  mm/memory.c                                   | 20 +++++++++++--------
>  mm/migrate_device.c                           |  5 +++--
>  mm/mprotect.c                                 |  5 +++--
>  mm/mremap.c                                   |  5 +++--
>  mm/userfaultfd.c                              |  5 +++--
>  mm/vmalloc.c                                  | 15 ++++++++------
>  mm/vmscan.c                                   | 15 ++++++++------
>  22 files changed, 102 insertions(+), 63 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 728d7b6ed20a..816197d08165 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -81,7 +81,9 @@ static inline void queue_pte_barriers(void)
>  }
>
>  #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> -static inline void arch_enter_lazy_mmu_mode(void)
> +typedef int lazy_mmu_state_t;
> +
> +static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>  {
>  	/*
>  	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
> @@ -96,12 +98,14 @@ static inline void arch_enter_lazy_mmu_mode(void)
>  	 */
>
>  	if (in_interrupt())
> -		return;
> +		return LAZY_MMU_DEFAULT;
>
>  	set_thread_flag(TIF_LAZY_MMU);
> +
> +	return LAZY_MMU_DEFAULT;
>  }
>
> -static inline void arch_leave_lazy_mmu_mode(void)
> +static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
>  {
>  	if (in_interrupt())
>  		return;
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> index 176d7fd79eeb..c9f1e819e567 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> @@ -25,13 +25,14 @@ DECLARE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
>  extern void __flush_tlb_pending(struct ppc64_tlb_batch *batch);
>
>  #define __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> +typedef int lazy_mmu_state_t;
>
> -static inline void arch_enter_lazy_mmu_mode(void)
> +static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>  {
>  	struct ppc64_tlb_batch *batch;
>
>  	if (radix_enabled())
> -		return;
> +		return LAZY_MMU_DEFAULT;
>  	/*
>  	 * apply_to_page_range can call us this preempt enabled when
>  	 * operating on kernel page tables.
> @@ -39,9 +40,11 @@ static inline void arch_enter_lazy_mmu_mode(void)
>  	preempt_disable();
>  	batch = this_cpu_ptr(&ppc64_tlb_batch);
>  	batch->active = 1;
> +
> +	return LAZY_MMU_DEFAULT;
>  }
>
> -static inline void arch_leave_lazy_mmu_mode(void)
> +static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
>  {
>  	struct ppc64_tlb_batch *batch;
>
> diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
> index 21fcad97ae80..ee664f88e679 100644
> --- a/arch/powerpc/mm/book3s64/hash_tlb.c
> +++ b/arch/powerpc/mm/book3s64/hash_tlb.c
> @@ -189,6 +189,7 @@ void hash__tlb_flush(struct mmu_gather *tlb)
>   */
>  void __flush_hash_table_range(unsigned long start, unsigned long end)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	int hugepage_shift;
>  	unsigned long flags;
>
> @@ -205,7 +206,7 @@ void __flush_hash_table_range(unsigned long start, unsigned long end)
>  	 * way to do things but is fine for our needs here.
>  	 */
>  	local_irq_save(flags);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  	for (; start < end; start += PAGE_SIZE) {
>  		pte_t *ptep = find_init_mm_pte(start, &hugepage_shift);
>  		unsigned long pte;
> @@ -217,12 +218,13 @@ void __flush_hash_table_range(unsigned long start, unsigned long end)
>  			continue;
>  		hpte_need_flush(&init_mm, start, ptep, pte, hugepage_shift);
>  	}
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	local_irq_restore(flags);
>  }
>
>  void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long addr)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	pte_t *pte;
>  	pte_t *start_pte;
>  	unsigned long flags;
> @@ -237,7 +239,7 @@ void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long
>  	 * way to do things but is fine for our needs here.
>  	 */
>  	local_irq_save(flags);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  	start_pte = pte_offset_map(pmd, addr);
>  	if (!start_pte)
>  		goto out;
> @@ -249,6 +251,6 @@ void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long
>  	}
>  	pte_unmap(start_pte);
>  out:
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	local_irq_restore(flags);
>  }
> diff --git a/arch/powerpc/mm/book3s64/subpage_prot.c b/arch/powerpc/mm/book3s64/subpage_prot.c
> index ec98e526167e..4720f9f321af 100644
> --- a/arch/powerpc/mm/book3s64/subpage_prot.c
> +++ b/arch/powerpc/mm/book3s64/subpage_prot.c
> @@ -53,6 +53,7 @@ void subpage_prot_free(struct mm_struct *mm)
>  static void hpte_flush_range(struct mm_struct *mm, unsigned long addr,
>  			     int npages)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	pgd_t *pgd;
>  	p4d_t *p4d;
>  	pud_t *pud;
> @@ -73,13 +74,13 @@ static void hpte_flush_range(struct mm_struct *mm, unsigned long addr,
>  	pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
>  	if (!pte)
>  		return;
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  	for (; npages > 0; --npages) {
>  		pte_update(mm, addr, pte, 0, 0, 0);
>  		addr += PAGE_SIZE;
>  		++pte;
>  	}
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	pte_unmap_unlock(pte - 1, ptl);
>  }
>
> diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
> index cd144eb31bdd..02c93a4e6af5 100644
> --- a/arch/sparc/include/asm/tlbflush_64.h
> +++ b/arch/sparc/include/asm/tlbflush_64.h
> @@ -40,10 +40,11 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
>  void flush_tlb_kernel_range(unsigned long start, unsigned long end);
>
>  #define __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> +typedef int lazy_mmu_state_t;
>
>  void flush_tlb_pending(void);
> -void arch_enter_lazy_mmu_mode(void);
> -void arch_leave_lazy_mmu_mode(void);
> +lazy_mmu_state_t arch_enter_lazy_mmu_mode(void);
> +void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state);
>
>  /* Local cpu only.  */
>  void __flush_tlb_all(void);
> diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
> index a35ddcca5e76..bf5094b770af 100644
> --- a/arch/sparc/mm/tlb.c
> +++ b/arch/sparc/mm/tlb.c
> @@ -50,16 +50,18 @@ void flush_tlb_pending(void)
>  	put_cpu_var(tlb_batch);
>  }
>
> -void arch_enter_lazy_mmu_mode(void)
> +lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>  {
>  	struct tlb_batch *tb;
>
>  	preempt_disable();
>  	tb = this_cpu_ptr(&tlb_batch);
>  	tb->active = 1;
> +
> +	return LAZY_MMU_DEFAULT;
>  }
>
> -void arch_leave_lazy_mmu_mode(void)
> +void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
>  {
>  	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
>
> diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
> index b5e59a7ba0d0..65a0d394fba1 100644
> --- a/arch/x86/include/asm/paravirt.h
> +++ b/arch/x86/include/asm/paravirt.h
> @@ -527,12 +527,14 @@ static inline void arch_end_context_switch(struct task_struct *next)
>  }
>
>  #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> -static inline void arch_enter_lazy_mmu_mode(void)
> +static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>  {
>  	PVOP_VCALL0(mmu.lazy_mode.enter);
> +
> +	return LAZY_MMU_DEFAULT;
>  }
>
> -static inline void arch_leave_lazy_mmu_mode(void)
> +static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
>  {
>  	PVOP_VCALL0(mmu.lazy_mode.leave);
>  }
> diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
> index 37a8627d8277..bc1af86868a3 100644
> --- a/arch/x86/include/asm/paravirt_types.h
> +++ b/arch/x86/include/asm/paravirt_types.h
> @@ -41,6 +41,8 @@ struct pv_info {
>  };
>
>  #ifdef CONFIG_PARAVIRT_XXL
> +typedef int lazy_mmu_state_t;
> +
>  struct pv_lazy_ops {
>  	/* Set deferred update mode, used for batching operations. */
>  	void (*enter)(void);
> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> index 26bbaf4b7330..a245ba47a631 100644
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -426,7 +426,7 @@ static void xen_start_context_switch(struct task_struct *prev)
>  	BUG_ON(preemptible());
>
>  	if (this_cpu_read(xen_lazy_mode) == XEN_LAZY_MMU) {
> -		arch_leave_lazy_mmu_mode();
> +		arch_leave_lazy_mmu_mode(LAZY_MMU_DEFAULT);
>  		set_ti_thread_flag(task_thread_info(prev), TIF_LAZY_MMU_UPDATES);
>  	}
>  	enter_lazy(XEN_LAZY_CPU);
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index 2a4a8deaf612..2039d5132ca3 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -2140,7 +2140,7 @@ static void xen_flush_lazy_mmu(void)
>  	preempt_disable();
>
>  	if (xen_get_lazy_mode() == XEN_LAZY_MMU) {
> -		arch_leave_lazy_mmu_mode();
> +		arch_leave_lazy_mmu_mode(LAZY_MMU_DEFAULT);
>  		arch_enter_lazy_mmu_mode();
>  	}
>
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index ced01cf3c5ab..02aa55f83bae 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -2682,6 +2682,7 @@ static int pagemap_scan_thp_entry(pmd_t *pmd, unsigned long start,
>  static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
>  				  unsigned long end, struct mm_walk *walk)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	struct pagemap_scan_private *p = walk->private;
>  	struct vm_area_struct *vma = walk->vma;
>  	unsigned long addr, flush_end = 0;
> @@ -2700,7 +2701,7 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
>  		return 0;
>  	}
>
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	if ((p->arg.flags & PM_SCAN_WP_MATCHING) && !p->vec_out) {
>  		/* Fast path for performing exclusive WP */
> @@ -2770,7 +2771,7 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
>  	if (flush_end)
>  		flush_tlb_range(vma, start, addr);
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	pte_unmap_unlock(start_pte, ptl);
>
>  	cond_resched();
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 275e8060d918..143d819c1386 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1489,6 +1489,9 @@ extern void tlb_gather_mmu(struct mmu_gather *tlb, struct mm_struct *mm);
>  extern void tlb_gather_mmu_fullmm(struct mmu_gather *tlb, struct mm_struct *mm);
>  extern void tlb_finish_mmu(struct mmu_gather *tlb);
>
> +#define LAZY_MMU_DEFAULT	0
> +#define LAZY_MMU_NESTED		1
> +
>  struct vm_fault;
>
>  /**
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 8d6007123cdf..df0eb898b3fc 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -232,8 +232,10 @@ static inline int pmd_dirty(pmd_t pmd)
>   * and the mode cannot be used in interrupt context.
>   */
>  #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> -#define arch_enter_lazy_mmu_mode()	do {} while (0)
> -#define arch_leave_lazy_mmu_mode()	do {} while (0)
> +typedef int lazy_mmu_state_t;
> +
> +#define arch_enter_lazy_mmu_mode()	(LAZY_MMU_DEFAULT)
> +#define arch_leave_lazy_mmu_mode(state)	((void)(state))
>  #endif
>
>  #ifndef pte_batch_hint
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index 5d2a876035d6..60b1b72f5ce1 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -305,7 +305,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>  	pte_t pte;
>  	int index;
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(LAZY_MMU_DEFAULT);
>
>  	index = PFN_DOWN(addr - data->start);
>  	page = data->pages[index];
> @@ -482,7 +482,7 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>  	pte_t pte;
>  	int none;
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(LAZY_MMU_DEFAULT);
>
>  	spin_lock(&init_mm.page_table_lock);
>  	pte = ptep_get(ptep);
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 35ed4ab0d7c5..72c032f2cf56 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -357,6 +357,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  				unsigned long addr, unsigned long end,
>  				struct mm_walk *walk)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	struct madvise_walk_private *private = walk->private;
>  	struct mmu_gather *tlb = private->tlb;
>  	bool pageout = private->pageout;
> @@ -455,7 +456,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  	if (!start_pte)
>  		return 0;
>  	flush_tlb_batched_pending(mm);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  	for (; addr < end; pte += nr, addr += nr * PAGE_SIZE) {
>  		nr = 1;
>  		ptent = ptep_get(pte);
> @@ -463,7 +464,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  		if (++batch_count == SWAP_CLUSTER_MAX) {
>  			batch_count = 0;
>  			if (need_resched()) {
> -				arch_leave_lazy_mmu_mode();
> +				arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  				pte_unmap_unlock(start_pte, ptl);
>  				cond_resched();
>  				goto restart;
> @@ -499,7 +500,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  				if (!folio_trylock(folio))
>  					continue;
>  				folio_get(folio);
> -				arch_leave_lazy_mmu_mode();
> +				arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  				pte_unmap_unlock(start_pte, ptl);
>  				start_pte = NULL;
>  				err = split_folio(folio);
> @@ -510,7 +511,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  				if (!start_pte)
>  					break;
>  				flush_tlb_batched_pending(mm);
> -				arch_enter_lazy_mmu_mode();
> +				lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  				if (!err)
>  					nr = 0;
>  				continue;
> @@ -558,7 +559,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  	}
>
>  	if (start_pte) {
> -		arch_leave_lazy_mmu_mode();
> +		arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  		pte_unmap_unlock(start_pte, ptl);
>  	}
>  	if (pageout)
> @@ -657,6 +658,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>
>  {
>  	const cydp_t cydp_flags = CYDP_CLEAR_YOUNG | CYDP_CLEAR_DIRTY;
> +	lazy_mmu_state_t lazy_mmu_state;
>  	struct mmu_gather *tlb = walk->private;
>  	struct mm_struct *mm = tlb->mm;
>  	struct vm_area_struct *vma = walk->vma;
> @@ -677,7 +679,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>  	if (!start_pte)
>  		return 0;
>  	flush_tlb_batched_pending(mm);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  	for (; addr != end; pte += nr, addr += PAGE_SIZE * nr) {
>  		nr = 1;
>  		ptent = ptep_get(pte);
> @@ -727,7 +729,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>  				if (!folio_trylock(folio))
>  					continue;
>  				folio_get(folio);
> -				arch_leave_lazy_mmu_mode();
> +				arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  				pte_unmap_unlock(start_pte, ptl);
>  				start_pte = NULL;
>  				err = split_folio(folio);
> @@ -738,7 +740,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>  				if (!start_pte)
>  					break;
>  				flush_tlb_batched_pending(mm);
> -				arch_enter_lazy_mmu_mode();
> +				lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  				if (!err)
>  					nr = 0;
>  				continue;
> @@ -778,7 +780,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>  	if (nr_swap)
>  		add_mm_counter(mm, MM_SWAPENTS, nr_swap);
>  	if (start_pte) {
> -		arch_leave_lazy_mmu_mode();
> +		arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  		pte_unmap_unlock(start_pte, ptl);
>  	}
>  	cond_resched();
> diff --git a/mm/memory.c b/mm/memory.c
> index d9de6c056179..a60aae069f1e 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1207,6 +1207,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  	       pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
>  	       unsigned long end)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	struct mm_struct *dst_mm = dst_vma->vm_mm;
>  	struct mm_struct *src_mm = src_vma->vm_mm;
>  	pte_t *orig_src_pte, *orig_dst_pte;
> @@ -1254,7 +1255,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  	spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
>  	orig_src_pte = src_pte;
>  	orig_dst_pte = dst_pte;
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	do {
>  		nr = 1;
> @@ -1323,7 +1324,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  	} while (dst_pte += nr, src_pte += nr, addr += PAGE_SIZE * nr,
>  		 addr != end);
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	pte_unmap_unlock(orig_src_pte, src_ptl);
>  	add_mm_rss_vec(dst_mm, rss);
>  	pte_unmap_unlock(orig_dst_pte, dst_ptl);
> @@ -1822,6 +1823,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  				unsigned long addr, unsigned long end,
>  				struct zap_details *details)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	bool force_flush = false, force_break = false;
>  	struct mm_struct *mm = tlb->mm;
>  	int rss[NR_MM_COUNTERS];
> @@ -1842,7 +1844,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  		return addr;
>
>  	flush_tlb_batched_pending(mm);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  	do {
>  		bool any_skipped = false;
>
> @@ -1874,7 +1876,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  		direct_reclaim = try_get_and_clear_pmd(mm, pmd, &pmdval);
>
>  	add_mm_rss_vec(mm, rss);
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>
>  	/* Do the actual TLB flush before dropping ptl */
>  	if (force_flush) {
> @@ -2811,6 +2813,7 @@ static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  			unsigned long addr, unsigned long end,
>  			unsigned long pfn, pgprot_t prot)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	pte_t *pte, *mapped_pte;
>  	spinlock_t *ptl;
>  	int err = 0;
> @@ -2818,7 +2821,7 @@ static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  	mapped_pte = pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
>  	if (!pte)
>  		return -ENOMEM;
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  	do {
>  		BUG_ON(!pte_none(ptep_get(pte)));
>  		if (!pfn_modify_allowed(pfn, prot)) {
> @@ -2828,7 +2831,7 @@ static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  		set_pte_at(mm, addr, pte, pte_mkspecial(pfn_pte(pfn, prot)));
>  		pfn++;
>  	} while (pte++, addr += PAGE_SIZE, addr != end);
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	pte_unmap_unlock(mapped_pte, ptl);
>  	return err;
>  }
> @@ -3117,6 +3120,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  				     pte_fn_t fn, void *data, bool create,
>  				     pgtbl_mod_mask *mask)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	pte_t *pte, *mapped_pte;
>  	int err = 0;
>  	spinlock_t *ptl;
> @@ -3135,7 +3139,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  			return -EINVAL;
>  	}
>
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	if (fn) {
>  		do {
> @@ -3148,7 +3152,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  	}
>  	*mask |= PGTBL_PTE_MODIFIED;
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>
>  	if (mm != &init_mm)
>  		pte_unmap_unlock(mapped_pte, ptl);
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index abd9f6850db6..833ce5eafa40 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -59,6 +59,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  				   unsigned long end,
>  				   struct mm_walk *walk)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	struct migrate_vma *migrate = walk->private;
>  	struct folio *fault_folio = migrate->fault_page ?
>  		page_folio(migrate->fault_page) : NULL;
> @@ -110,7 +111,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
>  	if (!ptep)
>  		goto again;
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	for (; addr < end; addr += PAGE_SIZE, ptep++) {
>  		struct dev_pagemap *pgmap;
> @@ -287,7 +288,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  	if (unmapped)
>  		flush_tlb_range(walk->vma, start, end);
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	pte_unmap_unlock(ptep - 1, ptl);
>
>  	return 0;
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 113b48985834..7bba651e5aa3 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -273,6 +273,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>  		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	pte_t *pte, oldpte;
>  	spinlock_t *ptl;
>  	long pages = 0;
> @@ -293,7 +294,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  		target_node = numa_node_id();
>
>  	flush_tlb_batched_pending(vma->vm_mm);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  	do {
>  		nr_ptes = 1;
>  		oldpte = ptep_get(pte);
> @@ -439,7 +440,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  			}
>  		}
>  	} while (pte += nr_ptes, addr += nr_ptes * PAGE_SIZE, addr != end);
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	pte_unmap_unlock(pte - 1, ptl);
>
>  	return pages;
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 35de0a7b910e..a562d8cf1eee 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -193,6 +193,7 @@ static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr
>  static int move_ptes(struct pagetable_move_control *pmc,
>  		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	struct vm_area_struct *vma = pmc->old;
>  	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>  	struct mm_struct *mm = vma->vm_mm;
> @@ -256,7 +257,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	if (new_ptl != old_ptl)
>  		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
>  	flush_tlb_batched_pending(vma->vm_mm);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	for (; old_addr < old_end; old_ptep += nr_ptes, old_addr += nr_ptes * PAGE_SIZE,
>  		new_ptep += nr_ptes, new_addr += nr_ptes * PAGE_SIZE) {
> @@ -301,7 +302,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  		}
>  	}
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	if (force_flush)
>  		flush_tlb_range(vma, old_end - len, old_end);
>  	if (new_ptl != old_ptl)
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index 50aaa8dcd24c..6ee71ba68b12 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -1076,6 +1076,7 @@ static long move_present_ptes(struct mm_struct *mm,
>  			      struct folio **first_src_folio, unsigned long len,
>  			      struct anon_vma *src_anon_vma)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	int err = 0;
>  	struct folio *src_folio = *first_src_folio;
>  	unsigned long src_start = src_addr;
> @@ -1100,7 +1101,7 @@ static long move_present_ptes(struct mm_struct *mm,
>  	/* It's safe to drop the reference now as the page-table is holding one. */
>  	folio_put(*first_src_folio);
>  	*first_src_folio = NULL;
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	while (true) {
>  		orig_src_pte = ptep_get_and_clear(mm, src_addr, src_pte);
> @@ -1138,7 +1139,7 @@ static long move_present_ptes(struct mm_struct *mm,
>  			break;
>  	}
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	if (src_addr > src_start)
>  		flush_tlb_range(src_vma, src_start, src_addr);
>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 4249e1e01947..9fc86ddf1711 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -95,6 +95,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			phys_addr_t phys_addr, pgprot_t prot,
>  			unsigned int max_page_shift, pgtbl_mod_mask *mask)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	pte_t *pte;
>  	u64 pfn;
>  	struct page *page;
> @@ -105,7 +106,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	if (!pte)
>  		return -ENOMEM;
>
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	do {
>  		if (unlikely(!pte_none(ptep_get(pte)))) {
> @@ -131,7 +132,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  		pfn++;
>  	} while (pte += PFN_DOWN(size), addr += size, addr != end);
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	*mask |= PGTBL_PTE_MODIFIED;
>  	return 0;
>  }
> @@ -354,12 +355,13 @@ int ioremap_page_range(unsigned long addr, unsigned long end,
>  static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			     pgtbl_mod_mask *mask)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	pte_t *pte;
>  	pte_t ptent;
>  	unsigned long size = PAGE_SIZE;
>
>  	pte = pte_offset_kernel(pmd, addr);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	do {
>  #ifdef CONFIG_HUGETLB_PAGE
> @@ -378,7 +380,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
>  	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	*mask |= PGTBL_PTE_MODIFIED;
>  }
>
> @@ -514,6 +516,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
>  		pgtbl_mod_mask *mask)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	int err = 0;
>  	pte_t *pte;
>
> @@ -526,7 +529,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  	if (!pte)
>  		return -ENOMEM;
>
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	do {
>  		struct page *page = pages[*nr];
> @@ -548,7 +551,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  		(*nr)++;
>  	} while (pte++, addr += PAGE_SIZE, addr != end);
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	*mask |= PGTBL_PTE_MODIFIED;
>
>  	return err;
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index ca9e1cd3cd68..2872497a0453 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3514,6 +3514,7 @@ static void walk_update_folio(struct lru_gen_mm_walk *walk, struct folio *folio,
>  static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>  			   struct mm_walk *args)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	int i;
>  	bool dirty;
>  	pte_t *pte;
> @@ -3543,7 +3544,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>  		return false;
>  	}
>
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  restart:
>  	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
>  		unsigned long pfn;
> @@ -3584,7 +3585,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>  	if (i < PTRS_PER_PTE && get_next_vma(PMD_MASK, PAGE_SIZE, args, &start, &end))
>  		goto restart;
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	pte_unmap_unlock(pte, ptl);
>
>  	return suitable_to_scan(total, young);
> @@ -3593,6 +3594,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>  static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area_struct *vma,
>  				  struct mm_walk *args, unsigned long *bitmap, unsigned long *first)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	int i;
>  	bool dirty;
>  	pmd_t *pmd;
> @@ -3625,7 +3627,7 @@ static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area
>  	if (!spin_trylock(ptl))
>  		goto done;
>
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	do {
>  		unsigned long pfn;
> @@ -3672,7 +3674,7 @@ static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area
>
>  	walk_update_folio(walk, last, gen, dirty);
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	spin_unlock(ptl);
>  done:
>  	*first = -1;
> @@ -4220,6 +4222,7 @@ static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_control *sc)
>   */
>  bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	int i;
>  	bool dirty;
>  	unsigned long start;
> @@ -4271,7 +4274,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>  		}
>  	}
>
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	pte -= (addr - start) / PAGE_SIZE;
>
> @@ -4305,7 +4308,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>
>  	walk_update_folio(walk, last, gen, dirty);
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>
>  	/* feedback from rmap walkers to page table walkers */
>  	if (mm_state && suitable_to_scan(i, young))
> --
> 2.47.0
>

--
Sincerely,
Yeoreum Yun

