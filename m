Return-Path: <linuxppc-dev+bounces-11750-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1533B4481F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 23:11:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHsbp11nDz2yrZ;
	Fri,  5 Sep 2025 07:11:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c202::7" arc.chain="microsoft.com:microsoft.com"
ARC-Seal: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756998466;
	cv=pass; b=VxCEI/fbNbCP+Vn9hIL3eV0cwPOpkkua6oc5YcCR2+66suS/hfHN/WyaPv/kpq+l0NBuitIW+xJNVwl5bLmzSz1bxfNpXAWfA0pO0ieYdSl405W2c+iIrrNg8VqHW7H4nx5Yeyx71xH8F4rlaErsTW2nvkup7rZVNklbuipdCndu6wgl+RVLlJep0KUypQyVIV9KrNtTYmQUMzG1lkiTc1BRXdDfKaKREc1WWmd7qYcLjZDke5XofBKdm1rN4vuZIvXJZmzAndlSPTgB2qR/uT7KjKniCZXipA7fJyNu0WcqChS4qdEkxOujIK94ecKFBdWYaScntcYlWqiqKI+ZtQ==
ARC-Message-Signature: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756998466; c=relaxed/relaxed;
	bh=ugMn6oKEOjYHvg+0JhztaCK4sS5GJrjKq1+zAszikv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Af59ei/40N4Z5mGLlvExicGiw/0cmlxMWm2XgsXOq/1N4rmFNiqVjtsOwZUQ3aUc0qJD/nnDCbaN7Qai44diKAzNxKw5bzpLF9zLiTgAX8zvdxABFA9Zjc1AofpcTDoL3/uV7CQRi9gHCQVfS22lAASGXedWEriTTcR3/6OjZgpmAdvufedslCZtkd82xq0wbuP8idDoVGDGB5rsqoQvhw0S/MqzCKpqFxV0pGna2Nsd2vOzs0ZzCYaP1tfbwMePZoWmVSfaiFwiIAh2bc520rCYIAJWLfVLRCd3ScH6ChLH3j8g9Yqx9Q7uzDlVXmM4+XptdomMKvwrvjngfQ6B6A==
ARC-Authentication-Results: i=3; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=LRWnoAS4; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=LRWnoAS4; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=yeoreum.yun@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=LRWnoAS4;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=LRWnoAS4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=yeoreum.yun@arm.com; receiver=lists.ozlabs.org)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c202::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHjX01tFtz2yb9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 01:07:42 +1000 (AEST)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RRlmswNYw0YOipr//mRpYd/reSU/5NRxw30PBJGTon9anEyMIOSZQjaNpXkjOjjRbGTtEQy1LMOiDTp6/ClLKV0LZsl1BkkQvOV5Adw7Uohh/2z1ELl860X+Os4YazCcwgQHfkJ6ykDVRYt03rJwothBz8FoSNxNIGZ1dCtaxIVJVJZ6Rv9gIPexT6tKZcqwcOFeWPdWI7DwUW7IcMAHnmLabutt6t5D6DwjmrqmEdzyOkC3WuMLPTP1m+OBOhjlOpec1ThVtULkgi2s/aU1Df+rPr/5Rs0tq0b/rP/dRV6Mgn/JNGio2ywhBGg0Ta9SUBbxZxu3+cxB0c8X8k7ZSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugMn6oKEOjYHvg+0JhztaCK4sS5GJrjKq1+zAszikv8=;
 b=dAqiET0B80bzPJqY8/daLtl2aRt/Hmx68fTJqzIzPmna5LA468SqpjByVHon+C8nTLRzReJwP337LDWr35iq6Pc+H48d+y4qBrJJfrziCFKp5ohAP9hBySjKqCncCmeu0aDbRIcqYNn+aNOzLU/oytPFvgG6ZWiqhxX1nixrmBF6o24H9wy+bOgAf/XbDGyugnWPKGOUEVBJeNxJ3Y2n5R7Qe/U/8uvFgDghr1F4IIHCd4ke0YulxsjKoRoMeObcRkzHLKqnOVEJitkEA1sV+J4JhjdOIsbuRc7FZNNG/uVRkGSzvbrSSghridN/x8sk5c6PHLqr9RIpSSyltc3cgQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kvack.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugMn6oKEOjYHvg+0JhztaCK4sS5GJrjKq1+zAszikv8=;
 b=LRWnoAS4upeeqL+XK9H58yDq9mFd29Y2NQngw/n+OEZPL+N1SnAEkE/sen2AJjWkWc9ruuBwGNFxZrS3MDQ8znmb2CO6uFZE5xnspfAuzDHYyWB70dLkGtn08MZG8ga6JLfGTeArH4pnEbzSV7qpDd/bLJUdEo7nV1r6jroJL7c=
Received: from AS4PR10CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::6)
 by AS8PR08MB8707.eurprd08.prod.outlook.com (2603:10a6:20b:563::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 15:07:13 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::5d) by AS4PR10CA0022.outlook.office365.com
 (2603:10a6:20b:5d8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 15:07:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Thu, 4 Sep 2025 15:07:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNcXir66EFUivE5clc5Kj8Y9Rz+0DWm/A373kSs+iebfIc9rr25ByZJhBpdgff8TZ4DtCeMF/P02kCpoGKMcQf28fAIruQOKw0LV5Wf8GRJ7ViAJBmWh/NnqxsjVhk+N9cobDfTdB+VuMGeuobntNZqEYh6Lm4hCndJh2EHLDseZzwf2XI77Y4cKjzCTdwJosS0BSHP77cm5fR6dG1eGOXSatEYOarp8g+I1IzLo1Ce9vVmDREyP/9HJCiliAt/5O0rtGpbMtw3nY+eh4SVyGMyYSLxBY57mZ3l7QWJlgJLeVqiMsvZ5o94eQqDYJRDiUQw8WwUeTTKHmoIi9WgkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugMn6oKEOjYHvg+0JhztaCK4sS5GJrjKq1+zAszikv8=;
 b=s74UxJYBgmpT9hChaomY4S8CEYa+GSCxLK0kH7cYwU9MFQO2o9y+yVNp2IUhMO+rS/Q/LsbkZG/3AYeef8v7IAG1o+j0mUOHwX4MWJnJ2u/QfJKpe8bjS3Ev/CW+f3ISZZWVCSSnrZFKGXDUTN2yR8FEb9LbIgfHsSjOOviYnwmukiRSxXgxVUx6q/Mm45xd0QAX3bcP7PisrIt1EUVCouZjM8kFvKmwmnLuWbJINHZbkSJIlNmGAVt7z7ZN2GhfK6VKx6fvpvG0zfn2LEY/py/KXP5M4ZohDN2u1j0Wl+nD9HADmvp47zzKrs/agXfJ/qWldIC74iDL0rUnr1GW+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugMn6oKEOjYHvg+0JhztaCK4sS5GJrjKq1+zAszikv8=;
 b=LRWnoAS4upeeqL+XK9H58yDq9mFd29Y2NQngw/n+OEZPL+N1SnAEkE/sen2AJjWkWc9ruuBwGNFxZrS3MDQ8znmb2CO6uFZE5xnspfAuzDHYyWB70dLkGtn08MZG8ga6JLfGTeArH4pnEbzSV7qpDd/bLJUdEo7nV1r6jroJL7c=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV2PR08MB7931.eurprd08.prod.outlook.com
 (2603:10a6:150:a8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Thu, 4 Sep
 2025 15:06:37 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 15:06:37 +0000
Date: Thu, 4 Sep 2025 16:06:33 +0100
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
Subject: Re: [PATCH 2/7] mm: introduce local state for lazy_mmu sections
Message-ID: <aLmq+dwZV9dyTYuq@e129823.arm.com>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-3-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904125736.3918646-3-kevin.brodsky@arm.com>
X-ClientProxiedBy: LO4P123CA0125.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::22) To GV1PR08MB10521.eurprd08.prod.outlook.com
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
	GV1PR08MB10521:EE_|GV2PR08MB7931:EE_|AMS1EPF00000049:EE_|AS8PR08MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 733721fb-8f1d-4d71-3e22-08ddebc4b9f6
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?HI9BmywBGI+n6E5v4HCTATtyI6GatboYoOMoqPuBaCSmw2JJ27VT9Hohu+iA?=
 =?us-ascii?Q?Q8/p6GDZTO/IepPkUFwqphXLyK5aoufFTG1QN++6L+WOMSaJ7cEepXvA5MW6?=
 =?us-ascii?Q?/ybcrsoZ/FXa8rotI3lJ7/f8Q5HHrg3T6Mh825cNgtV1aOk0WfddyBo9rRXz?=
 =?us-ascii?Q?dWTt7TzuqAFrMkoUvGVt96fmn6k1S4G/x7TC66zzXYWBVqDj7wJfBTP3y8bb?=
 =?us-ascii?Q?Y6zOIuJVdakxZD9HxQO2SUUXIUlsYL2tBM5HJ47yJhPMfauz3tthSy3fWEvA?=
 =?us-ascii?Q?5q61/g4tIaLZT9F0hWOJ+WCsTl7z4BFAyNIzWKInkXiDTrDgCqbneiUcGQ2O?=
 =?us-ascii?Q?jZq3B3b9Zo/qaJ+GFtYVJ2YUrTB4wgiVC09Zasg5AfHMmO57CV3QS89aFlcz?=
 =?us-ascii?Q?ESKIImLmQN6uf8ykJOVpsy1lP6jBLuI3GDlskuFCXWWbvUWWViTwGmJ8aPbg?=
 =?us-ascii?Q?L2wHIokcPh/qrZPgJncOdMSIHL0Rf08j4d0EDCVV9Auv7h0ZeOIULc//6RhD?=
 =?us-ascii?Q?p8dLnv9AY4+/ua3MzHbwKhDgVNf5ccJSnVg7+nr88JdMclEQZxgINb9ele2I?=
 =?us-ascii?Q?nMUf1URSoGbLZyZ4+20qKlCYmEjIvEwOm6NFG6ezyYWTLNy38+qvXvokCIh9?=
 =?us-ascii?Q?o00oQKPE3YOSK1rDGv5ru+gKPqpMHkPWPAR/fPTxpw1fGnHivtlojfS00aG9?=
 =?us-ascii?Q?Afee/XrPFJ37loCXrXtRtvv9NL4cEKGOFgc3vS8phYsBYzWgst2MTAm7lfpg?=
 =?us-ascii?Q?dlG+F0i5DZ2JyK0wxSkheteJh13Pc1dG6IW4UjwfDAZbFsiyMM33YzS0hDka?=
 =?us-ascii?Q?IgXziV6gP1kw4twNXhbSbPo98i5xX/06VIRE1nkFF/bDRrL9b2H+5ERKwoQM?=
 =?us-ascii?Q?5e7m19ADpEckviOHaiWsOJJ24tpPL6iYchnCOqlBlcamC5X8kro7jn0OTgHE?=
 =?us-ascii?Q?HBNv2xdUpanMy/kT3LocGK8uvpJIQ00xnLulN70MQ/ZLVIRIBP2PrQkF54Fg?=
 =?us-ascii?Q?Yy+f47p1p7FmyS24iCckAGmzDzcBEH1uCfJOvGxbNGmFdzwrB8YhVIHUaxsr?=
 =?us-ascii?Q?Pc03p+WP9rW2pDwNRlkCr7BW8pfVH/HhxVU1yC7yBPzLqX00t8NxZ4YEVmEg?=
 =?us-ascii?Q?ylYKqX8mreruUT0hGzdRofWu5pbQGDckTglgEa2LEyhiPGHwTfV55/sfxhOZ?=
 =?us-ascii?Q?+Bfx+s46Dg87A/cRUUaz/5TnAktt/g1bwIGzG1t+qShv6eRl6JsgZJC63Y/H?=
 =?us-ascii?Q?l+1kbTCvw1YUfkZe7FH4k5cJcd/ShHLKK1W8rZFGtxPjeih14Il6DlQjH2Vv?=
 =?us-ascii?Q?lE9U+DOikJP7YrEcpm6NCXdSN+e4LscaVxlA6KkkaSS5GCs/tSbBXJKJHkGM?=
 =?us-ascii?Q?bEn5qkoQWv31I8ElhVy9g9ljYipcT/X8nmKr3kKEQQte9LK0lUF68yv3ubp5?=
 =?us-ascii?Q?RUIl/DLS/+Y=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7931
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	94765155-63eb-44c6-8cee-08ddebc4a4dd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|14060799003|82310400026|35042699022|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+jyVZRQaCFISNpIDYoLrLGIy5S3t01y85fxSI5EcZRsEUSaB8AUX2gNcb4Fv?=
 =?us-ascii?Q?g4ObXTrD+QP9TolZX8IdLjx4mBrVcdrwpjA7yqhBKrx4XepJdPVYGj4XZ/gg?=
 =?us-ascii?Q?bvCRMTFjvyKhuV7Qu5eWD6yEZkhcee2QvLazYptS03wIdFCKwPhCnGWE/igx?=
 =?us-ascii?Q?X+L1xdGg037FFc+TzlHm72TJcayIqeP7g2wC1KO8Q0FmlNDd+Msj4biuX1Hz?=
 =?us-ascii?Q?9MEyO0B3n7VFL+r4FK0toKX+pmqO9lzCoWNeV3DqRkkkMcLfWk3apJfWTu11?=
 =?us-ascii?Q?maq37/Gdf+Mgd9E4E3vI57aVv3E3Z1uVcdeHxZ0LJU9aBTC1n/mx77ug6MxS?=
 =?us-ascii?Q?YhHZ1k6+UXUfB81UzBKiRV6y0UjgOq/ZzeZBmX5vr9YzMNW/ih3JYM65Nsrh?=
 =?us-ascii?Q?gAnQi8DR12m6NXvOdM6HSreta6lK8JHLgCTeCGvyd4inq4yx33I8HnuvIKNO?=
 =?us-ascii?Q?h1PJyg83pW5Xxq6XonyAQyGaPCVwBc7xA3Jriu4LhVO2LQlOoI6HLmR0ilzF?=
 =?us-ascii?Q?wNOEceme3dmS9xj3S1k4sCgjHOrRcj/rWPdkD5hNfE6dTNIHEHSuklktNVM8?=
 =?us-ascii?Q?NMrJKmWBGj9URUktULMMziOZAJqVuVdGNPyNfhZBnhGR3cjIkipHco22kDR7?=
 =?us-ascii?Q?IVErC0uxwMCxhUy7jVytiyH4OP2A2qZ8b4SXR/+Nj0vWpcP4dEgNILXILkEB?=
 =?us-ascii?Q?U/91TFpS/WmopxItWEqRXgPGZMw9EK7YsCK+dCxzZQBouOIj0qOlb56aYAMN?=
 =?us-ascii?Q?VfOnMzOf2CRoXBhUmSJ21Ye22xr4xPhJOJsDnjC4AlPgl/fwCPZ+PWprIalG?=
 =?us-ascii?Q?IXmbs3saq+0iZ/Xg9qFFq6hN/r8uUdUQOTblzEzx0Qnil20KihMD9ccMyv4e?=
 =?us-ascii?Q?7UyIiohAvTb593pW/tMFUlDNOh+wzaTMvz5GDzfoCxIzqQ+XSOkD3h51T+NT?=
 =?us-ascii?Q?CKRMjzOab1ipT+aRR/qydM01qiEbR8n/thAG4uq+LeSCZMQeSWZaQ1Ivb8JB?=
 =?us-ascii?Q?dJfKqJEV9K0C7sXf/BK7brj4Nt6DwzBQKYq/Bg/ylHPLo7jCdFiOSFS7hKBr?=
 =?us-ascii?Q?N54+wbBg3TL2yuY4VxOgOJnIHke4kjHBXE9lSC3QFULU+gjPaZ4SREsbsVjg?=
 =?us-ascii?Q?7BFoICmBihDX8fSRX/fF2h2YL6oyKB+DxYQI8wGRKwMoJr7Wv3wPFzQKRFR0?=
 =?us-ascii?Q?CC1PCcLBoSNdU5kvRqeS5k8jN78CDTEjLX+Uyy+NEn2Ze1lSkYF/XT1QVeYH?=
 =?us-ascii?Q?lHB0de9zuckX1aY+WJIbfDZ1TYhWTAVuahbu12N+F+AudRK15iUUBdFNGkub?=
 =?us-ascii?Q?bxHzoVHtKvL2ERJqP+T424MJ9GLEeFkGZ21f77rZGsI9xm4Brq4wnqKVnUEL?=
 =?us-ascii?Q?mvt3i5mmUG1OOlL3Wl4WawjuKoYo6rKr/Z2Y0oXiZMZDXGmrIjJQeWzhiIat?=
 =?us-ascii?Q?NlS+0364npsWTqv/ZUJzq0oQbb7LmUWI8aOYmvUODXcWnlPL5UqxwmIhb0iv?=
 =?us-ascii?Q?9T0pp8IbuR0Q4DL9DMWgfrvtSOV4bWSOHlen?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(14060799003)(82310400026)(35042699022)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 15:07:12.1297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 733721fb-8f1d-4d71-3e22-08ddebc4b9f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8707
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Kevin,

[...]
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
>  mm/madvise.c                                  | 20 ++++++++++---------
>  mm/memory.c                                   | 20 +++++++++++--------
>  mm/migrate_device.c                           |  5 +++--
>  mm/mprotect.c                                 |  5 +++--
>  mm/mremap.c                                   |  5 +++--
>  mm/vmalloc.c                                  | 15 ++++++++------
>  mm/vmscan.c                                   | 15 ++++++++------
>  20 files changed, 97 insertions(+), 59 deletions(-)

I think you miss the mm/kasan/shadow.c

But here, the usage is like:

static int kasan_populate_vmalloc_pte()
{
	...
	arch_leave_lazy_mmu_mode();
	...
	arch_enter_lazy_mmu_mode();
	...
}

Might be you can call the arch_leave_lazy_mmu_mode() with LAZY_MMU_DEFAULT
in here since I think kasan_populate_vmalloc_pte() wouldn't be called
nestly.

[...]

Thanks.

--
Sincerely,
Yeoreum Yun

