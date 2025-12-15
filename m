Return-Path: <linuxppc-dev+bounces-14780-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B4ACBF0C8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Dec 2025 17:54:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVR4H4bJdz2xJT;
	Tue, 16 Dec 2025 03:54:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.162.64 arc.chain="microsoft.com:microsoft.com"
ARC-Seal: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765817679;
	cv=pass; b=bipCC+l6sxHiiGZWKefQAMRbTYWiLMnNWJRWKK2RikdKK8QqNFgzLtKMq3ivArQ3l0C7sWXuXmg1RvvIUod9CDGaizOCUg9sZNbzzX7Zpjf/dM5DnFW+pOqnFGXqGvKFqC+9dWpbslQBYIBPmf3zTNIJz5tj5zrT4oEM1qHgSvWwERCdEakWp9PjWMIZdknCgfxosY2raNxvPNEF9DORUZ/m1wSOjwzNydJxMqybwo3oY7DqREAZIW2SqtH0ufyaPUiOOqS6WFEJt/rhcIhADnYG+YaknfNtet3lIwYp9R5imI3rfLyas8T0qcPkDlZEKm5ht3+Y5KBrCutFpvy3MA==
ARC-Message-Signature: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765817679; c=relaxed/relaxed;
	bh=8/W6l29RwKRvQiKjOmlgFycm7Qo8+6A28MW3ffQAxVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Zj6r5zG7BCkcBanD4lUWlnEKjtYILcMF5xxYG2Ls9xy2HugCeqlRLD9FAs4JRF78m04AR5Ax4Nbyp3LcJUJqek/VZlTuxyVNL9KocpJ9G3uJ+y+gVNwx4yeT3NW/ZBurRCttukl7jLrzSWsdOL+GZ4OqAGwxLkjVunwN821+umzXEWGdmbd5adQ3ThBeQVbHKqg+h2en3srVHnyxWpM3r15NZgJNuPUtaxX/tH5z6K+2j7gFXGxXHslVbI+3UqiZVk18ZAJnFtC7KPVKeQIMygqpEzoyyh3dwWhiXgHRSaFDL7zJ0qvQGfvIDYijPFA3MpJovw50eU/4XsbTpUK/6A==
ARC-Authentication-Results: i=3; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=NpuIhWv2; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=NpuIhWv2; dkim-atps=neutral; spf=pass (client-ip=40.107.162.64; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=yeoreum.yun@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=NpuIhWv2;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=NpuIhWv2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=40.107.162.64; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=yeoreum.yun@arm.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013064.outbound.protection.outlook.com [40.107.162.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVR4C4t47z2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 03:54:34 +1100 (AEDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Uqgjc6EJPcuU47SZIzC8zdoCw+Surzn0qG4wAuNOPzg5fMbTPMt4Oe4W5kB07UbSsRRqGD2xjl7DsK8VTtljMety8Wq8Ay8mA73ifPTXY8sE/nwHkLM4Q50tqkfYzLPFMFuFDB6pYwvLVsWuRcCNoO+vPv6szVhK9r6kC2AuNHq+LvTIy1j6Q5bFWdnY72VoQJpE+7kjAl9lC8BCnQ5iguiHGw87zZCv4xyEcOe7Dq2DjDCL3VPXNo2qil2ZKl+0Dw6SsOF6KePMvnThEhP8YHdzuJLA68XtojvJy9A36e8Pd1w/F6qYBlq5MJR6QSZ47gykH06RP6NDgxulRWhEkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/W6l29RwKRvQiKjOmlgFycm7Qo8+6A28MW3ffQAxVM=;
 b=AJXsYXpvlpwfCvh8d6jYBF00xh6SYRiRI43JwODw3HPcA8ZspLglhyBIkhH/rnQZ7bI9VX/CMI3+Mqv8uumdAmD8lBsyGEcer0UksZvZ8o6BafqQ0jZ+xYejQ2KcDPz5cWp4OFFmJHiaCc9akXquv+aw4EJxrSo+KnI3FA+lhq2qCPphv8w1ng07zC+6Vm2j0zIE8aSDm+d4KiOBeYItnGKmcyYVRgiiYKmA0IhfKHdJRAd7y4irtg3RC1hpNGrE+smbUZO0va3WGQS+1VU37mdbg/nEswz+9L2ll/sbeQX0B1tiemch83XxUa7/WErZE/43tNWXkpgu0jhNADkXKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kvack.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/W6l29RwKRvQiKjOmlgFycm7Qo8+6A28MW3ffQAxVM=;
 b=NpuIhWv2/SYwyoTwxqJEp+LUttli+ls7ALljKOwrYVUwynwm7TJf6lumJIiBTKkQ64YLOB57iiENePt8zXny5gLV1Vmm9zAUEqb9FEtkGAkucnUNgEbpdx+2wdq7nJMQY8D9EbCarF6hai4J88xVxCJxHCpAwiuIF/txKOjyYbI=
Received: from DUZPR01CA0069.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::12) by VI1PR08MB10173.eurprd08.prod.outlook.com
 (2603:10a6:800:1cb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 16:53:46 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::ba) by DUZPR01CA0069.outlook.office365.com
 (2603:10a6:10:3c2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 16:53:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Mon, 15 Dec 2025 16:53:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgddzwHmxbJSjKxG0hhVuK+odF1FC/zGMr5Rfr3WOvKhRVqG1YtcjvjwIn/2aUQ9f/k6fjZao+EqMjdRylwcLu/aensvxftZaEIdFGQ6Nt6A9Fm2q043hWOUaKBRPREEpZ4rZoZAtDJn1QcqMIkv/hOUoh2IHrDOI0vFd7wof6F4hMuka2GIissipp6NjAN87vWjJFCtFdlRZ3y6a1jUx7wtCpRhFJjtRXy1n5eJ65l/bxWNV8jc9qiZsVgoNSaINWYrywU9o7XDDp9XdcxPeoeBsVsf0jhwDY4KxJtgEBqF7QOa9CFsIdMZMyAydegHcUcTyrE5AoDI+iH2MS/s9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/W6l29RwKRvQiKjOmlgFycm7Qo8+6A28MW3ffQAxVM=;
 b=uYSUo8FEDj+a84PWVNUzr+egX2mNotnRPqbY8QbuV7gvrefO7noRRMijbo1S6m62kBzPaWkZ+qUjWTTGAiOA3mAd0QUYaOKePolGXgmd0viAZmr09/cTQxaCUrdEA+PZ7GaaYy4D1KQO8S93CdIRmERw6XRCc+5DluOfG3fqvDf59fI5BPqX4N+Dx/42bc27wviqUnGTXMwP36iiW2JP7A3jOz6kaUG2+VdZy4VFh73g7JjDQ4RADvVsOtzreQM0kseTsc2nU+N3WWLHetLpLinmoizMBy6suEXsrEB0zB0QhigjbjJJP5tBKbBqnFDf9QNWG3LYUNF+OWqJIX+zoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/W6l29RwKRvQiKjOmlgFycm7Qo8+6A28MW3ffQAxVM=;
 b=NpuIhWv2/SYwyoTwxqJEp+LUttli+ls7ALljKOwrYVUwynwm7TJf6lumJIiBTKkQ64YLOB57iiENePt8zXny5gLV1Vmm9zAUEqb9FEtkGAkucnUNgEbpdx+2wdq7nJMQY8D9EbCarF6hai4J88xVxCJxHCpAwiuIF/txKOjyYbI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DU0PR08MB9050.eurprd08.prod.outlook.com
 (2603:10a6:10:47a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 16:52:42 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%3]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 16:52:41 +0000
Date: Mon, 15 Dec 2025 16:52:38 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
	x86@kernel.org
Subject: Re: [PATCH v6 00/14] Nesting support for lazy MMU mode
Message-ID: <aUA81joXQL0ZyIgm@e129823.arm.com>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215150323.2218608-1-kevin.brodsky@arm.com>
X-ClientProxiedBy: LO4P123CA0323.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::22) To GV1PR08MB10521.eurprd08.prod.outlook.com
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
	GV1PR08MB10521:EE_|DU0PR08MB9050:EE_|DU6PEPF0000B61F:EE_|VI1PR08MB10173:EE_
X-MS-Office365-Filtering-Correlation-Id: 3616d0f9-d03f-4f6b-ac15-08de3bfa82c0
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?pzhAZZwGWJzd2xgVNmW9IljA9Y8eJspiViZIWh6wHso8M5V9/hP7Xp48c6Ra?=
 =?us-ascii?Q?murX1T0Nm5N6sBhlON20saGNVE0yQ+0f/J+Lcxt5eri1wjvvuKwkcA4oiusq?=
 =?us-ascii?Q?2ez1Oac5wCVJyffTzfVq4TdrsfTDPWHW4zw2MiN1jb9ETKs8t/nbI0Uaj39B?=
 =?us-ascii?Q?dlPXBismRRnq2mE9U8l/EDCxNF2WjNbG8CgQGtr2lh00hZ30d21r/8kdoq2e?=
 =?us-ascii?Q?CwJZlp0VrX+ZTikjw4ERtV6JYLGisV0+GWJhBIpU8Q5NoQVWOUdgcDKkNHYX?=
 =?us-ascii?Q?HIVj+9F981bg5UBbLvSGkPFayNb5O40vkUwzFnL1Nf9kXfiaFKpz3rXrlA/p?=
 =?us-ascii?Q?jDA4zYQ82Jwim4mJZV2Q5HsbAUW0o/hN160zyj1z/VfjF8E+qIz+d6Mp2mYb?=
 =?us-ascii?Q?3zr1qFp1XkB0HF0rKyfJ1NTyHh42cmXEiIcq003tQnD0zMHjWLOyMcXANGj0?=
 =?us-ascii?Q?0NBK3ojJWHyhw2pmfLSR2QeI+qccGWQO0zbEE5DUTTwHffx0Z0vM94ac6TSZ?=
 =?us-ascii?Q?2eBoMq83Ph9aP0MMvnmzVeENVhBl3tFTgeR5p2/gFKTu0LkU7hsM1eWkbNmc?=
 =?us-ascii?Q?F2id7OZvf7zFKs1O/y7nVAIJmzVV3N65FT3n9A9YrzymzniP08mIp97wWGOm?=
 =?us-ascii?Q?EZnxGXeLFH682OCh3gSADulUaQLL8UI8PLYmDoW5iTBggZVm4pV/zqr4yntD?=
 =?us-ascii?Q?TB80oSc4RgD+HomIFBGWaolGPFL8TcTIKpVrBAUpVCKDLJ1H0odbJcq57jY9?=
 =?us-ascii?Q?c7l0SofUCSXzngkfyLeDSjgnDqltndsRpOU3zgTz/vRJaQdZ0EbnwX8WYw1O?=
 =?us-ascii?Q?JP1/fEhKzf5YduAEFKWnUFBypkzrK10v8AgOI1rMogxC556pGVR0GyBT0Zl8?=
 =?us-ascii?Q?BhRiMi+GbHkUvF/pGJ/xWhjxJrnxo2wirvryxRf9hbmTocovqYzpifI1rIi+?=
 =?us-ascii?Q?Lk/PrRzzzFrcw+o//Ase3h2KsPspnPC2lKQM8C4BLKzXiLIw509uFs5a/m1D?=
 =?us-ascii?Q?WqeUFnDMtWAg6Xv/4jw86H7C5dDwOw5hmUiMCalw66ZsCsrKXn9pKfQPvoKe?=
 =?us-ascii?Q?6Z35SCVmCCoe1LyodWNCtA0e7vpAwocZiOQy09qNA4wP0VntCqCQ0/mLxKAx?=
 =?us-ascii?Q?nR7gkjYXj+JryIT62NAECTn0xX1XRmJ75XR6VqFngmLbTt+V6DeLGGHX90k5?=
 =?us-ascii?Q?M7ZafmVH2s9oHVJ/b8UH7B+DFRw8KL6CHwBp2iz+gbmowpWZxrzp9vk1FMcq?=
 =?us-ascii?Q?5IzCNCJRiYJVIDJ7UmAeFaPspDSiolfGm+xtJnx4+eFpMhTSPu3aLfbcl+Ff?=
 =?us-ascii?Q?GsOjb9kYEvH3pa0NbRUz9TMVAp9R0OML2c4W30fw0qbipdW/zqUw0G2f34G1?=
 =?us-ascii?Q?rlYW8EogCxnxi9U3JdpgOZ4HIVNgi5D38Z8K1SQIGNb4t/TZ0rLDCwD2U71B?=
 =?us-ascii?Q?u8vnrfFpxrmwbR2ySerVrklJPeZZS6ci7U3xsxkvb8teDnhabwpnsA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9050
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5e434924-911d-4672-46f7-08de3bfa5caf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|7416014|376014|1800799024|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zuqIIqd/l6AydQr35yD1higpmzfOYfxMiv0s0sjNB0C69/59KEUtQcn6Y4tk?=
 =?us-ascii?Q?kpq+VTZCvX1H6Sm907dbj9V6quSESqUZjE7tJC6Q+2m2r7NYDp9kJnIEAAAX?=
 =?us-ascii?Q?Au/+FYYkkQuwFxHYvEe7nl5T28DdBkunZr5Ozu0gu1WI5597losXFe/FfL3h?=
 =?us-ascii?Q?SQU2hLrugc/J90/pyGL77BQVta35FER4E8OdBKxYOc/lWGCq5IsJDA+LrQmw?=
 =?us-ascii?Q?vZs/9i9r7R5DULAh7PjN+MD/s6CkRYEiNzUsy1o9lyhSoK2xCyMGIlMDR/Jo?=
 =?us-ascii?Q?JfUTpLi2Ef6Zr/Y6/4edzjBSXBYJOHZxLAlIUG3r59LRE4CQl9Q/l5Jxu9gA?=
 =?us-ascii?Q?43o+Myp2Uur9GS+LMBnuB4cJkF98AHGFjWtNnRMJbOD78rwiJhtatFBKlzVV?=
 =?us-ascii?Q?+RgRge0bj+f7gIUBzJjGHcuw1NbeI0UMiohF88IGb3RhulDOU4Xpn9AeQgxl?=
 =?us-ascii?Q?TFKLiTXg0aUi54PB7FEowDoN3vUCnQFdBtlDOhmXcn0772K4Jgha7yzH6Zbe?=
 =?us-ascii?Q?VlLDIEaBGJqvxzQ5cnyYkvo+Kcp0/s5jHe2qd2h9kUKd28xSQrmPzB72MuLP?=
 =?us-ascii?Q?BuBPOxiOKfdCczAiwd7YUiwoXLT3P7xtiwVIPsvcyhoLR6KwciiT3LbDRzlF?=
 =?us-ascii?Q?Q6Hx1OtbZSU45PhANkTvRTF/X/s+coGONUEvnCG1pQ2FqQMpTB89neNLxsrp?=
 =?us-ascii?Q?Bw2JZ6eVUVZItYDJzEVoYa+ECDg/UE685eL9KYCK8uiszLHH+9yx/Y0X/90D?=
 =?us-ascii?Q?2qwbpVUDBndTbjfdRWeJqcXg3r8BdhKgjvXUHF3vN1LKA2u4SFLVEJ2S3iq1?=
 =?us-ascii?Q?X9sibqtpfT6yGV8UJ8gb8vd9d8oyr/rblzdLv0t4+KXisTusdPG0SqwdP7Yw?=
 =?us-ascii?Q?0k1zK7nasZGL+aCznnwIAwv5mT5SGRTMv2e+U2CkeUPyQIvbmJBF95PfQtiv?=
 =?us-ascii?Q?bp12wiF+ooP57r293Fl4KEs4whV3msj79dLqc0KEBdJvL8a1p0+TSddM86U5?=
 =?us-ascii?Q?Dx3R14HLdneaU2UmKiXlo5O7AyKS6sERQoD8RU4KNQSZVR/VJ8IpOD23NlTA?=
 =?us-ascii?Q?SA70gv1XYFAiVPpm8jUPCcYy7dyUgzPlM6TEYp0LQeM0BKlj40Dn/YOI46aT?=
 =?us-ascii?Q?Fv+QDdfum4ocCI79mRSwRJN4Qhu+wH7yTffOc5PcPFMesGYRd7AtmW6iDoFV?=
 =?us-ascii?Q?XgoJC0HQyPpaan/86/mLqbwcxv6qrGB0ccm5gUb9YRK1697OgN8MVK5fpANr?=
 =?us-ascii?Q?OhCmXyjy1av7ICNDLvaHuvhzcNbT8UYXjMklkgeTYMS2huHqZFYXQFGtPhBR?=
 =?us-ascii?Q?+xPHxrJv5oB6Qu2ZNLRHhpP9lRJxdU0SsW05hWEqSyhLGqkwaFeYw47ZU375?=
 =?us-ascii?Q?e+vuJLXDQobAvxzb200y3amBjOAfFa54DJbY1/ZfUVIKRH0DUujc6QCQiPQ8?=
 =?us-ascii?Q?pHA/NDTgwFmdBdgHmnticDCye9KiQlUikslfu0iyOwMtc5NfQHwYGcB2L4dT?=
 =?us-ascii?Q?P9Zc7MkwYT9kNo3PyDkq/nUhj5rYrjnX5Ma0Y7P4qgTe3FTAqh9oNuXYivLv?=
 =?us-ascii?Q?zhldyvx8Xjc48g6TL+M=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(7416014)(376014)(1800799024)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 16:53:45.3928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3616d0f9-d03f-4f6b-ac15-08de3bfa82c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10173
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> When the lazy MMU mode was introduced eons ago, it wasn't made clear
> whether such a sequence was legal:
>
> 	arch_enter_lazy_mmu_mode()
> 	...
> 		arch_enter_lazy_mmu_mode()
> 		...
> 		arch_leave_lazy_mmu_mode()
> 	...
> 	arch_leave_lazy_mmu_mode()
>
> It seems fair to say that nested calls to
> arch_{enter,leave}_lazy_mmu_mode() were not expected, and most
> architectures never explicitly supported it.
>
> Nesting does in fact occur in certain configurations, and avoiding it
> has proved difficult. This series therefore enables lazy_mmu sections to
> nest, on all architectures.
>
> Nesting is handled using a counter in task_struct (patch 8), like other
> stateless APIs such as pagefault_{disable,enable}(). This is fully
> handled in a new generic layer in <linux/pgtable.h>; the arch_* API
> remains unchanged. A new pair of calls, lazy_mmu_mode_{pause,resume}(),
> is also introduced to allow functions that are called with the lazy MMU
> mode enabled to temporarily pause it, regardless of nesting.
>
> An arch now opts in to using the lazy MMU mode by selecting
> CONFIG_ARCH_LAZY_MMU; this is more appropriate now that we have a
> generic API, especially with state conditionally added to task_struct.
>
> ---
>
> Background: Ryan Roberts' series from March [1] attempted to prevent
> nesting from ever occurring, and mostly succeeded. Unfortunately, a
> corner case (DEBUG_PAGEALLOC) may still cause nesting to occur on arm64.
> Ryan proposed [2] to address that corner case at the generic level but
> this approach received pushback; [3] then attempted to solve the issue
> on arm64 only, but it was deemed too fragile.
>
> It feels generally difficult to guarantee that lazy_mmu sections don't
> nest, because callers of various standard mm functions do not know if
> the function uses lazy_mmu itself.
>
> The overall approach in v3/v4 is very close to what David Hildenbrand
> proposed on v2 [4].
>
> Unlike in v1/v2, no special provision is made for architectures to
> save/restore extra state when entering/leaving the mode. Based on the
> discussions so far, this does not seem to be required - an arch can
> store any relevant state in thread_struct during arch_enter() and
> restore it in arch_leave(). Nesting is not a concern as these functions
> are only called at the top level, not in nested sections.
>
> The introduction of a generic layer, and tracking of the lazy MMU state
> in task_struct, also allows to streamline the arch callbacks - this
> series removes 67 lines from arch/.
>
> Patch overview:
>
> * Patch 1: cleanup - avoids having to deal with the powerpc
>   context-switching code
>
> * Patch 2-4: prepare arch_flush_lazy_mmu_mode() to be called from the
>   generic layer (patch 9)
>
> * Patch 5: documentation clarification (not directly related to the
>   changes in this series)
>
> * Patch 6-7: new API + CONFIG_ARCH_LAZY_MMU
>
> * Patch 8: ensure correctness in interrupt context
>
> * Patch 9: nesting support
>
> * Patch 10-13: replace arch-specific tracking of lazy MMU mode with
>   generic API
>
> * Patch 14: basic tests to ensure that the state added in patch 9 is
>   tracked correctly
>
> This series has been tested by running the mm kselftests on arm64 with
> DEBUG_VM, DEBUG_PAGEALLOC, KFENCE and KASAN. Extensive testing on
> powerpc was also kindly provided by Venkat Rao Bagalkote [5]. It was
> build-tested on other architectures (with and without XEN_PV on x86).
>
> - Kevin
>
> [1] https://lore.kernel.org/all/20250303141542.3371656-1-ryan.roberts@arm.com/
> [2] https://lore.kernel.org/all/20250530140446.2387131-1-ryan.roberts@arm.com/
> [3] https://lore.kernel.org/all/20250606135654.178300-1-ryan.roberts@arm.com/
> [4] https://lore.kernel.org/all/ef343405-c394-4763-a79f-21381f217b6c@redhat.com/
> [5] https://lore.kernel.org/all/94889730-1AEF-458F-B623-04092C0D6819@linux.ibm.com/
> ---
> Changelog
>
> v5..v6:
>
> - Rebased on v6.19-rc1
> - Overall: no functional change
> - Patch 5: new patch clarifying that generic code may not sleep while in lazy
>   MMU mode [Alexander Gordeev]
> - Patch 6: added description for the ARCH_HAS_LAZY_MMU_MODE option
>   [Anshuman Khandual]
> - Patch 9: rename in_lazy_mmu_mode() to is_lazy_mmu_mode_active() [Alexander]
> - Patch 14: new patch with basic KUnit tests [Anshuman]
> - Collected R-b/A-b/T-b tags
>
> v5: https://lore.kernel.org/all/20251124132228.622678-1-kevin.brodsky@arm.com/
>
> v4..v5:
>
> - Rebased on mm-unstable
> - Patch 3: added missing radix_enabled() check in arch_flush()
>   [Ritesh Harjani]
> - Patch 6: declare arch_flush_lazy_mmu_mode() as static inline on x86
>   [Ryan Roberts]
> - Patch 7 (formerly 12): moved before patch 8 to ensure correctness in
>   interrupt context [Ryan]. The diffs in in_lazy_mmu_mode() and
>   queue_pte_barriers() are moved to patch 8 and 9 resp.
> - Patch 8:
>   * Removed all restrictions regarding lazy_mmu_mode_{pause,resume}().
>     They may now be called even when lazy MMU isn't enabled, and
>     any call to lazy_mmu_mode_* may be made while paused (such calls
>     will be ignored). [David, Ryan]
>   * lazy_mmu_state.{nesting_level,active} are replaced with
>     {enable_count,pause_count} to track arbitrary nesting of both
>     enable/disable and pause/resume [Ryan]
>   * Added __task_lazy_mmu_mode_active() for use in patch 12 [David]
>   * Added documentation for all the functions [Ryan]
> - Patch 9: keep existing test + set TIF_LAZY_MMU_PENDING instead of
>   atomic RMW [David, Ryan]
> - Patch 12: use __task_lazy_mmu_mode_active() instead of accessing
>   lazy_mmu_state directly [David]
> - Collected R-b/A-b tags
>
> v4: https://lore.kernel.org/all/20251029100909.3381140-1-kevin.brodsky@arm.com/
>
> v3..v4:
>
> - Patch 2: restored ordering of preempt_{disable,enable}() [Dave Hansen]
> - Patch 5 onwards: s/ARCH_LAZY_MMU/ARCH_HAS_LAZY_MMU_MODE/ [Mike Rapoport]
> - Patch 7: renamed lazy_mmu_state members, removed VM_BUG_ON(),
>   reordered writes to lazy_mmu_state members [David Hildenbrand]
> - Dropped patch 13 as it doesn't seem justified [David H]
> - Various improvements to commit messages [David H]
>
> v3: https://lore.kernel.org/all/20251015082727.2395128-1-kevin.brodsky@arm.com/
>
> v2..v3:
>
> - Full rewrite; dropped all Acked-by/Reviewed-by.
> - Rebased on v6.18-rc1.
>
> v2: https://lore.kernel.org/all/20250908073931.4159362-1-kevin.brodsky@arm.com/
>
> v1..v2:
> - Rebased on mm-unstable.
> - Patch 2: handled new calls to enter()/leave(), clarified how the "flush"
>   pattern (leave() followed by enter()) is handled.
> - Patch 5,6: removed unnecessary local variable [Alexander Gordeev's
>   suggestion].
> - Added Mike Rapoport's Acked-by.
>
> v1: https://lore.kernel.org/all/20250904125736.3918646-1-kevin.brodsky@arm.com/
> ---
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Jann Horn <jannh@google.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yeoreum Yun <yeoreum.yun@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: sparclinux@vger.kernel.org
> Cc: xen-devel@lists.xenproject.org
> Cc: x86@kernel.org
> ---
> Alexander Gordeev (1):
>   powerpc/64s: Do not re-activate batched TLB flush
>
> Kevin Brodsky (13):
>   x86/xen: simplify flush_lazy_mmu()
>   powerpc/mm: implement arch_flush_lazy_mmu_mode()
>   sparc/mm: implement arch_flush_lazy_mmu_mode()
>   mm: clarify lazy_mmu sleeping constraints
>   mm: introduce CONFIG_ARCH_HAS_LAZY_MMU_MODE
>   mm: introduce generic lazy_mmu helpers
>   mm: bail out of lazy_mmu_mode_* in interrupt context
>   mm: enable lazy_mmu sections to nest
>   arm64: mm: replace TIF_LAZY_MMU with is_lazy_mmu_mode_active()
>   powerpc/mm: replace batch->active with is_lazy_mmu_mode_active()
>   sparc/mm: replace batch->active with is_lazy_mmu_mode_active()
>   x86/xen: use lazy_mmu_state when context-switching
>   mm: Add basic tests for lazy_mmu
>
>  arch/arm64/Kconfig                            |   1 +
>  arch/arm64/include/asm/pgtable.h              |  41 +----
>  arch/arm64/include/asm/thread_info.h          |   3 +-
>  arch/arm64/mm/mmu.c                           |   8 +-
>  arch/arm64/mm/pageattr.c                      |   4 +-
>  .../include/asm/book3s/64/tlbflush-hash.h     |  20 +--
>  arch/powerpc/include/asm/thread_info.h        |   2 -
>  arch/powerpc/kernel/process.c                 |  25 ---
>  arch/powerpc/mm/book3s64/hash_tlb.c           |  10 +-
>  arch/powerpc/mm/book3s64/subpage_prot.c       |   4 +-
>  arch/powerpc/platforms/Kconfig.cputype        |   1 +
>  arch/sparc/Kconfig                            |   1 +
>  arch/sparc/include/asm/tlbflush_64.h          |   5 +-
>  arch/sparc/mm/tlb.c                           |  14 +-
>  arch/x86/Kconfig                              |   1 +
>  arch/x86/boot/compressed/misc.h               |   1 +
>  arch/x86/boot/startup/sme.c                   |   1 +
>  arch/x86/include/asm/paravirt.h               |   1 -
>  arch/x86/include/asm/pgtable.h                |   1 +
>  arch/x86/include/asm/thread_info.h            |   4 +-
>  arch/x86/xen/enlighten_pv.c                   |   3 +-
>  arch/x86/xen/mmu_pv.c                         |   6 +-
>  fs/proc/task_mmu.c                            |   4 +-
>  include/linux/mm_types_task.h                 |   5 +
>  include/linux/pgtable.h                       | 158 +++++++++++++++++-
>  include/linux/sched.h                         |  45 +++++
>  mm/Kconfig                                    |  19 +++
>  mm/Makefile                                   |   1 +
>  mm/kasan/shadow.c                             |   8 +-
>  mm/madvise.c                                  |  18 +-
>  mm/memory.c                                   |  16 +-
>  mm/migrate_device.c                           |   8 +-
>  mm/mprotect.c                                 |   4 +-
>  mm/mremap.c                                   |   4 +-
>  mm/tests/lazy_mmu_mode_kunit.c                |  71 ++++++++
>  mm/userfaultfd.c                              |   4 +-
>  mm/vmalloc.c                                  |  12 +-
>  mm/vmscan.c                                   |  12 +-
>  38 files changed, 380 insertions(+), 166 deletions(-)
>  create mode 100644 mm/tests/lazy_mmu_mode_kunit.c
>
>
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> --
> 2.51.2

All of these look good to me.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

--
Sincerely,
Yeoreum Yun

