Return-Path: <linuxppc-dev+bounces-16849-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEOeEz0djmmg/gAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16849-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 19:34:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EBB1304BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 19:34:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBkVL1WQ8z2yQj;
	Fri, 13 Feb 2026 05:34:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770921274;
	cv=pass; b=eIo/A1uJjJloDCwmpNeYIpzeZWwZ23bpi3a6mKdfeGgMUQbcigf5rw2GuRb8FXU7og8eSYwtHGNIbLkjd1IjH1RZY+eS19Y/xTMz1KQlFDYghS0+2mzcCUeQmeTA9It716BLFEd2QarLIMEdpHl9/guZc9L0h4gXsSwlsAD/UBiqpjbQZPj/5zftPMbr97U86Vg/a3HVs+T83TeATIoYesJZ4OIN78BtafWsfYs3a9xry8Wvuv0kJaCTpeh6P5Ht7z3y4HBYRpN6xBg1VGHQ/yosehx9M8Gryd8H/bem3NzDkTCbWargSpBeaK2hctPmZGYNLrL0oQxt2iItLUjEFg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770921274; c=relaxed/relaxed;
	bh=vQv8vFiDd3ICXKSDGU0UihXLgsJez8R9LwJKHCtEd9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z9sgs7+9ok4Y0OqxCN2ns+vSfmxfCDYrIY0a1K32uHB9JF3QleCK9GeM/sX8CElzPbv+15HekCDjnKM9c7XETaXzl7kAEZHLqoGoIQqAB5SpVpU7drhLaF+yw0j+4F7XF7gCQQWuRNawOxkeGr7OGzY9O9Q33xIUhtn8z8rP4LBxcL/vhSncAjjIViDqJUXoyWWw8Z/XnlzBwuHPcv7RjmCX1uxEMBD4EZvMWExm5Y/soZgpimIeHuX06yS6Je1A15O0733rrLpP4xMWujVxawcADrV6sEHD5+3lp5jh8IJjmOW84pxKrkvw94qbOoqVjC8BwY9aJlfCk82F4LzvzA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=HpGvt8js; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=yBRq/Ar6; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=HpGvt8js;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=yBRq/Ar6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBkVK2l44z2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Feb 2026 05:34:32 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CGNJ8X839288;
	Thu, 12 Feb 2026 18:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=vQv8vFiDd3ICXKSDGU
	0UihXLgsJez8R9LwJKHCtEd9w=; b=HpGvt8jsPPUG9r7/391mkCPH9G6UO8iWfZ
	BXYdTvx9tGYaz3sv+oCfV1bbNs3tKyFFlyOE+9BwS+/wOHev/iVR8WajVU8qzhQg
	Y+tGX/DXKfHnRzd/Sxc8pMqW09NK7A/gXnJqcZPfvpxS7SvhJBOBiKjrsjv5ZUTe
	cppg9yv5MtAW06BnNH0SbPbpNX6zIjZX47N7MBLVT+EA78BfKCQAo6+gNRzlMitq
	HKUZJ5ID6qANRLw8xbEn8leuUCs8ppz1qEjNVRmsRFdnu9SUBD6y6WTuIRJa9LGB
	O0cKhKVTLdKO6542f6nJPcXgXqhX+nnI+f4aL+SQXnZhTzI2bXdw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c7s7rwb51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Feb 2026 18:33:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61CIGa2r030120;
	Thu, 12 Feb 2026 18:33:42 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013021.outbound.protection.outlook.com [40.107.201.21])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c822b9whu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Feb 2026 18:33:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEvtv3l5KbE1NovKnFm1Xbl0jO34qeJaZ9u5oD+xqLgBLcM4z6Sz6anxEMtrkSJEndIDm73NWuKZsfEShqs0sCvpOpsnHeZTy3d7jTwtTaakgPIp2wVHovngEQUqAeV7xKl7QDDG9PrZeImvuujjw/FTG9eJJRcvdTI3u6AXCkC7HQRQgZm+fx4sW/vkN3q9YGQQ2DXPKfNkIfMvmdqOK1cUvs8/R3b5SGeZmydaGVp4PgYaUawe91maplCSUB0WjLk70Vt5aPyObeydSYJuCzODEkBk3YUpiNHd1jzWqzA2E+pilIxS+Qt//FZSf9JvjbEQrsCiNNZpuRUhicjCgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQv8vFiDd3ICXKSDGU0UihXLgsJez8R9LwJKHCtEd9w=;
 b=do/E/fs5UFpy7GSb6qHcR8HvOZbPiVKplyDjn8MDKHq24g7NR9gLpgeWYw3yNzaR5rvPx/If3X5vlE3hedwxzYlfJ8jMGGaro9FHKKAcHx6HClUq1xXXkuuGwI+YH7T+hnYKfHozeGMLMyewaCp5z6RJ+a7BHfWPw7rRqCW0QNk6MFBfcux3+1SA8stbuR7n2CjYjLejBpYfgY5q88rDhb5Dyp0GIsDfetBen35wIGPnGkLfHT5+UWk4al7YpbBumbbZCiZPHDszYqtHCH/unl66ZEXrnLdLcXVCY8AytQG5iY3yYq5kgFQDBjsUmSDA1Vh1pVlxfM8RJzwRLljf/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQv8vFiDd3ICXKSDGU0UihXLgsJez8R9LwJKHCtEd9w=;
 b=yBRq/Ar6IkkZt4RhbBkDw00tn0hoHhluYAS9KDX0QoIO5l4z3Z6RM47sbyIKpVWLPVy1xZYA1/vJzKxykkuogU1V+3T2rTo+MDsLRJ043kvtqlJWOY3F/vMciUKCWcJdhebPPAN09PbDrhhTbr6n69B26zqqa57jHRlLxBTDxV4=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:33:35 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 18:33:35 +0000
Date: Thu, 12 Feb 2026 13:33:28 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
        Brian Cain <bcain@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
        Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Michal Simek <monstr@monstr.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
        Richard Weinberger <richard@nod.at>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v3 2/4] mm: rename my_zero_pfn() to zero_pfn()
Message-ID: <zyvz4q6beuad4ltbbjhmocsej5ziayulvbwhlkyfvhyaigcxqe@kmsp4lgoh3ta>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
	Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-mm@kvack.org, x86@kernel.org
References: <20260211103141.3215197-1-rppt@kernel.org>
 <20260211103141.3215197-3-rppt@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211103141.3215197-3-rppt@kernel.org>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT4PR01CA0456.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::20) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
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
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|PH8PR10MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e5ac2f4-ce67-4862-c8c0-08de6a653b05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bW5RsQb/kIhg0piAqU32zZ+kWjzS8dZQJNEaISjhatEVA9rM2s041m0Gud8o?=
 =?us-ascii?Q?T3vcc9qaOvCDDH7iO8xB69H9C6QkUHe/RkP6Jf4EDWR9draHcwpd4jj4I3Dd?=
 =?us-ascii?Q?5VWFgyQ9zBqO0y8x11jSwZE1LUcsy3xQZU5yLSl7INFORw2k+au4Za/hmzMf?=
 =?us-ascii?Q?dWUpEFF4u2GTmhNeq635Iw/bj5EeIunBCFQvB/9c3fa8EDKUo+HRgdjNAYzu?=
 =?us-ascii?Q?SvliUlYqub6fWaUgFM9htSwf/OHLPGoXRg8nZy0683l5aCru6VMHg9GdxFKu?=
 =?us-ascii?Q?9HLrCNc4ANl4A0I1WTpPvHaZP7bAvb236aUQ5a3quTYeonZtEDSsOvYRA4Zr?=
 =?us-ascii?Q?X7wk1dgRtELOm1mjkE2mU5v6xUlb6Sae7y0XsHywL+CavdaxP4l7pILA+L0Q?=
 =?us-ascii?Q?SJkX88vwac78uq4B+/cJQdTWHJpZ+EAiZ4yw/BBmRXo/FQwk98JSgu6TFb7f?=
 =?us-ascii?Q?fgFZ36m/F2Trnqr4tTdmcZ7qQLuMAIMsCbgOkTb1IJlajt7SQgL7A0KipQMv?=
 =?us-ascii?Q?nrGel4SCYr0a+GDao9QpCtRe4hgIYZMFOqDghLrJcxsBWR0J0DbltOUa3iDJ?=
 =?us-ascii?Q?nPorqhRMIIAyUsF2FpNq8oCoUE4bQs3BVxj2IuLQ6RTqI38R+KU0452ayEt4?=
 =?us-ascii?Q?wzEZ4lOEIgjX+8lAFhucBaOKnhb+i+COkOIVovgg8f5SOcCm+OWQDIaGDVDQ?=
 =?us-ascii?Q?a2N7eyJ8tw3y+9GRJkYoDy5MueMIPl09AN4XAv11w77p+ZNc0nrJ7zETZHwa?=
 =?us-ascii?Q?ou1NTHhk3uGyEn4wnHh2vGUYTGKZkj5926R3g4Wc13hlVxDbzEL2U+vmgqvb?=
 =?us-ascii?Q?vYj8CmwAd5WWR7gOYJ5+tBMJje8FGP+4RoyNAb5gyZZQI0csbnJMsogMOwjv?=
 =?us-ascii?Q?2siCM4L5fIUwIvAgtjOFV3tXS3Dmhdyz9fqs1PoU8oAyqqhjqTNO5FButRke?=
 =?us-ascii?Q?uR29SAbxwPHSzvaTZwCrTjzikbL+y97vVnGUGN/vv04BWXAr4/QfV/eykSY1?=
 =?us-ascii?Q?litbKtJXe57YUHEWktg57Wdkn1Lr02Fau3sXbpe2CTbeWFb4T/86ZTfmUlsh?=
 =?us-ascii?Q?5+2fOgMEFfgOVk114khzqtJzRJlfGg6hKwT9MYUoNf+cDJCvFUER9NsmEPZn?=
 =?us-ascii?Q?LixTLy09kHWW2TY+c4ZNsmpc8Gtj1cnEyGNg+Rv5oAePUc9I+8Tn6VQvL4YP?=
 =?us-ascii?Q?9YkaSfTcPEedugdG5V785pPAq7elDpnyv69ifPncLSo0xZoUS8r0SCjz3IiL?=
 =?us-ascii?Q?NKkPT+MJ+wZygXtdoRA0WaZN3zIW07DyROR83mQefvXDImFW8y4PEhEvfxBt?=
 =?us-ascii?Q?MsjQ1yhwWPVn96nz4lNw8p28Cj12Komi0+TZIishPdV34Gn1TXb7847GE9h+?=
 =?us-ascii?Q?90FIR6anddrDhKM23C4L8JvGwu98Ei43e8Iq7tjDm6U4lVoMzzlGIfNHAz1H?=
 =?us-ascii?Q?eg1SvHD40kbXLV2Ixlzf5N+a+warcDOwsHn5aBHh2vJCQI0omwSCBRYcyBKZ?=
 =?us-ascii?Q?/itRm5SaBoMTqEr0fy23C1gqHaoTRENrWqm8fsvbIC9gfBH2uhGZF9fSFXA5?=
 =?us-ascii?Q?a/hbVtHt6TjfqueZk4Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S3qwu88A/3xznq0YvgCZyKVMvKYT6COl1qN79bBPiABEDEnu8fi9mkTNbie4?=
 =?us-ascii?Q?vebYsMLLK8MGiEaOJtYi4YzEbyFY9KXZkZRpXeSBvfPS3/BDdeW/WlZ3BQPh?=
 =?us-ascii?Q?cpo9W0sDWX1sQtUhFfohG3Kx+ttNRIof/+meKwXjJp+xDqe83/jDWu183r2z?=
 =?us-ascii?Q?8FWfcyOo5ME6RXBJ7eemILP4xuvcwasZXSWXCU18+g3+RE3hOBfzyGU8YhxD?=
 =?us-ascii?Q?eOYjUrupVGcaEZNBGZ6XASTsoMVQyg9rHo8chpGWkwWx3QzWdz0b5m6GiCpB?=
 =?us-ascii?Q?QCiDNPEd2v0Lf0ymBILuRlCJr3U7CVDQFpN+/i1M/f6KcLKp3vVDJr2wBd0G?=
 =?us-ascii?Q?DJBdf+pwaO5il+Qm4g8Gr7Tswawm5tvkEqnU/zALpXMmh3pmkKXKLMOoxIVU?=
 =?us-ascii?Q?HEQ7vIacDw1hgCjfBf29Zn9R/07PEZDLakeEVZRMyv/EjAl6AStPPwuqjPWC?=
 =?us-ascii?Q?nWfYseTp9axbz0hKeTaHrUYhFxoCfoDb5egW/LI/C6qurArpgBp80yO7oSNM?=
 =?us-ascii?Q?PIvVElXw7C8uz5HPWJboYGHsrN368GRfnQjuXKIy4bMvw05IjlheEXABNw7h?=
 =?us-ascii?Q?H+VqK/QxfGzm9Rlsmw+WlQKVx+W8BF8rd0BQSYYGiV1wrGHfx3u+rWqDxyEN?=
 =?us-ascii?Q?VnBCYWDQvFtupjYJfdeNdFSv7QDdiY9s4hcAiU8w6yM/oQ4lTKRoG6jleWcX?=
 =?us-ascii?Q?E3mvqn8fdyuQRG9d6lCmtgS5JlJW5rZ0icE9PVpSr+A8xtH52D7A842H84gv?=
 =?us-ascii?Q?izzBEHI5aEzc0JbmvuaoqtkHJ/gUFG+RTVDujEZQg2TOljnlMWUrKK1YLDCO?=
 =?us-ascii?Q?slWNbs8m3jFXlxL0J2w8dbH01tCWCT1ey/OY6qWV1RntlnrsAKelakcPRvBc?=
 =?us-ascii?Q?0NFnuE+LK9/OF4QOdTdmjx1uNPWrp0OlUXecm10kdgLj4uWfU9uX+0aFNjef?=
 =?us-ascii?Q?ueT6I0NcCkLn1SoQcBOKsMJ8FaZlITyU2HJ1ZC+8yam8mCi3yxe/k1j0pG8p?=
 =?us-ascii?Q?quq0PH8SW1yvQFfOftYrIF+BMc3Hl89PttniM6MALFKfZTm7xAEqYHYdxc4z?=
 =?us-ascii?Q?beCHN+f186brxmFv9wqhiEaEEKHvHXTpumbDHuRG4ULP5ilNPveY4RSIVEYB?=
 =?us-ascii?Q?G0tIBXXbUas3jZlNNCJsdfLjdvpnkk1yd7G3/ZT7fhQd7YEMtiWZiZrO52mG?=
 =?us-ascii?Q?b8E7XFEkUhrofpugMXJ2zwETkxet4KnRhu8/EJJ3T4MFEaPIenjk5iRMlXXL?=
 =?us-ascii?Q?IdjSuqwlge1TTnhZgKj+oJEh5smHslUZw+P7GwRJ3dN4npxThD216RJLL1bd?=
 =?us-ascii?Q?lggYhUdH/AO6OsjFMJRayMTbOyEl547kIakrmZDRIA57cYFq7U9Hle9fFkVR?=
 =?us-ascii?Q?UJFiZbDR798jLdLQ7Hvp4lJaV+quqstdUhmA44P4bzj3J1+9vSUcU+NFiRX2?=
 =?us-ascii?Q?f3mP41xAicu1KZRoc8tc+ykW/2HsoxNOYdSlnV7uo/olZa9PimgAd2cYz8DS?=
 =?us-ascii?Q?WYBGqRnuSmrPE97w6kIYlWk74bpKyKOyeib1bfV6KS5Lz195YTwVYXegujR3?=
 =?us-ascii?Q?1D7rp0vyidE2pnmZLPZpgXWGQZIxpGKSIoLUqXTVC9RaUOsw5i+3okUe6AkO?=
 =?us-ascii?Q?zQZ2ggHOz4J5YUViqisTMyQkVdKw782Qav1FJDyU63Wdp+EY9tHxNoxGvKej?=
 =?us-ascii?Q?0NW+sBTicQGF2UUVp67MOnfRJpYMMt0KaIi8n9X/RONtA/6y3ngVuwBqLvGC?=
 =?us-ascii?Q?4dF2A17W3A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YF1rMXln+8gL6QqyYe0YtuKHQrL0S4VbB/SH4YClki8jhMfuMhVjc1v4W6YDe83tmwJSeDcKEvxW2MEaQymkdo3/1z9PPHBYWWQ+K8h2U1j2oVG4tA7gCbpb9fBJbH6KtHZ6TE+EFYE3DZ43CCw7IPBz9l+ZoPZg09PYPNnLDT/zT8BlDV+mzndTJ/MIL2/G0/puH4yEcLQZWqKR4yHhEv17bsvqHT+yxz8wfri3uSEfVm4tuGrvqvstOxtalvcnc+gKg/t8OizMkb6lrnRSL6AqW0tCy4LCU1qaRyuEMQ21P859ockkDSWd/RWFiQEAJilNAOUGSV3woy9/HUyhG9NgrDmaZoCJ1FXMYtouhwhZgplRRT6J0PPUJ21SRoM2cXtqwqz5EcF1rWDugIG56A4+n00RbxZJaxVr469W2KGqDS284IOi4PtM3dQeNYFbucp64BQgwWJrG1RoGAsXnOlN5mfwtB/gcWlizq0Z2jngU2Z4IEjC6UyMFgEGy2ZTFg8wQcNW4XWe+OI3rFrEoNXHNd3sn5p/g2eL9qa3e30LddFKxoJPkqsmRLug5OrF+lj+S29PBzawdcxp4X+IbSB2zOR5B2/9JyRxZdDoanY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5ac2f4-ce67-4862-c8c0-08de6a653b05
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:33:34.9326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QiF1YvrpYQWBaYOhJYpMK3LZtMbtyAjBDZXYrcZNiulzrZQL+eM2DgRvC4K9xzdQOQgQr2uGjk/OFMPC2VsYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6337
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=909 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602120143
X-Authority-Analysis: v=2.4 cv=PZbyRyhd c=1 sm=1 tr=0 ts=698e1d07 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=yPCof4ZbAAAA:8 a=H6uFXMwvh0fExSW4sPAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0MyBTYWx0ZWRfXwK4TJoNgGZAH
 4bCOQyTFR36jsGFRxikcfm4QD5xyyUAx1EZLT4ZIx6cvowMKfUCyAtIpD/C8V6e6omhVkQ25NaE
 IiY10D/gyBzqL89v6eWUPAz/rbK+Ky37zD6a6egEYUGTSRuTcFN7Tk1pafsgHUT1nVqouSVbwX9
 QquwnUzl8sOz4xe5sw4/k8A0u5aPp/aLtMwSRPnVC9rVfsCUVRGJnz/+BE1zzSdRHP6uQYx4OSQ
 Kyrfux4A191iAqAugEkqLyU/Im8lIOGrCGaU1Zr5FhDGTJgJ50R5M7KxoEpjghJdgRsi+s7ipr3
 19MeLYSm1YjXH/OC8WPo5Wudp6i5F/Zzs/felEV9MpPQMJHiUmnIijhczcD0YhFJauQxKQjcWwy
 1aVOx6Ml4WMvnACbsAR1brdOuSo6YWCAgG0daX60YgA2AA9+5dpMLJtVCwpOCzA3odJr/mv4fN5
 y8Y7ViHRziUYSmswrpQ==
X-Proofpoint-ORIG-GUID: nSL8eFYsAFw7EHjAosV5W1e01r5pdSMh
X-Proofpoint-GUID: nSL8eFYsAFw7EHjAosV5W1e01r5pdSMh
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:akpm@linux-foundation.org,m:andreas@gaisler.com,m:bp@alien8.de,m:bcain@kernel.org,m:catalin.marinas@arm.com,m:chleroy@kernel.org,m:davem@davemloft.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dinguyen@kernel.org,m:geert@linux-m68k.org,m:guoren@kernel.org,m:deller@gmx.de,m:chenhuacai@kernel.org,m:mingo@redhat.com,m:johannes@sipsolutions.net,m:glaubitz@physik.fu-berlin.de,m:lorenzo.stoakes@oracle.com,m:maddy@linux.ibm.com,m:linmag7@gmail.com,m:mattst88@gmail.com,m:jcmvbkbc@gmail.com,m:mpe@ellerman.id.au,m:mhocko@suse.com,m:monstr@monstr.eu,m:palmer@dabbelt.com,m:richard@nod.at,m:linux@armlinux.org.uk,m:shorne@gmail.com,m:surenb@google.com,m:tglx@kernel.org,m:vgupta@kernel.org,m:vbabka@suse.cz,m:will@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linux.dev
 ,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-mm@kvack.org,m:x86@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-16849-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Liam.Howlett@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,gaisler.com,alien8.de,kernel.org,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,oracle.com,linux.ibm.com,gmail.com,ellerman.id.au,suse.com,monstr.eu,dabbelt.com,nod.at,armlinux.org.uk,google.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,kvack.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,oracle.com:email,oracle.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Liam.Howlett@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 67EBB1304BE
X-Rspamd-Action: no action

* Mike Rapoport <rppt@kernel.org> [260211 05:32]:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> my_zero_pfn() is a silly name.
> 
> Rename zero_pfn variable to zero_page_pfn and my_zero_pfn() function to
> zero_pfn().
> 
> While on it, move extern declarations of zero_page_pfn outside the
> functions that use it and add a comment about what ZERO_PAGE is.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  arch/x86/kvm/mmu/spte.h |  2 +-
>  fs/dax.c                |  2 +-
>  fs/proc/vmcore.c        |  2 +-
>  include/linux/pgtable.h | 28 ++++++++++++++++++++--------
>  mm/huge_memory.c        |  2 +-
>  mm/memory.c             |  2 +-
>  mm/migrate.c            |  2 +-
>  mm/mm_init.c            | 10 +++++-----
>  mm/userfaultfd.c        |  4 ++--
>  9 files changed, 33 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/spte.h b/arch/x86/kvm/mmu/spte.h
> index 91ce29fd6f1b..8c0ffa2cded6 100644
> --- a/arch/x86/kvm/mmu/spte.h
> +++ b/arch/x86/kvm/mmu/spte.h
> @@ -248,7 +248,7 @@ extern u64 __read_mostly shadow_nonpresent_or_rsvd_lower_gfn_mask;
>  
>  static inline hpa_t kvm_mmu_get_dummy_root(void)
>  {
> -	return my_zero_pfn(0) << PAGE_SHIFT;
> +	return zero_pfn(0) << PAGE_SHIFT;
>  }
>  
>  static inline bool kvm_mmu_is_dummy_root(hpa_t shadow_page)
> diff --git a/fs/dax.c b/fs/dax.c
> index 289e6254aa30..b78cff9c91b3 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -1360,7 +1360,7 @@ static vm_fault_t dax_load_hole(struct xa_state *xas, struct vm_fault *vmf,
>  {
>  	struct inode *inode = iter->inode;
>  	unsigned long vaddr = vmf->address;
> -	unsigned long pfn = my_zero_pfn(vaddr);
> +	unsigned long pfn = zero_pfn(vaddr);
>  	vm_fault_t ret;
>  
>  	*entry = dax_insert_entry(xas, vmf, iter, *entry, pfn, DAX_ZERO_PAGE);
> diff --git a/fs/proc/vmcore.c b/fs/proc/vmcore.c
> index f188bd900eb2..44d15436439f 100644
> --- a/fs/proc/vmcore.c
> +++ b/fs/proc/vmcore.c
> @@ -525,7 +525,7 @@ static int remap_oldmem_pfn_checked(struct vm_area_struct *vma,
>  {
>  	unsigned long map_size;
>  	unsigned long pos_start, pos_end, pos;
> -	unsigned long zeropage_pfn = my_zero_pfn(0);
> +	unsigned long zeropage_pfn = zero_pfn(0);
>  	size_t len = 0;
>  
>  	pos_start = pfn;
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 08a88b0d56e5..9bacf4df9769 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1882,27 +1882,39 @@ static inline void pfnmap_setup_cachemode_pfn(unsigned long pfn, pgprot_t *prot)
>  	pfnmap_setup_cachemode(pfn, PAGE_SIZE, prot);
>  }
>  
> +/*
> + * ZERO_PAGE() is global shared page(s) that is always zero. It is used for
> + * zero-mapped memory areas, CoW etc.
> + *
> + * On architectures that __HAVE_COLOR_ZERO_PAGE there are several such pages
> + * for different ranges in the virtual address space.
> + *
> + * zero_page_pfn identifies the first (or the only) pfn for these pages.
> + */
>  #ifdef __HAVE_COLOR_ZERO_PAGE
>  static inline int is_zero_pfn(unsigned long pfn)
>  {
> -	extern unsigned long zero_pfn;
> -	unsigned long offset_from_zero_pfn = pfn - zero_pfn;
> +	extern unsigned long zero_page_pfn;
> +	unsigned long offset_from_zero_pfn = pfn - zero_page_pfn;
> +
>  	return offset_from_zero_pfn <= (zero_page_mask >> PAGE_SHIFT);
>  }
>  
> -#define my_zero_pfn(addr)	page_to_pfn(ZERO_PAGE(addr))
> +#define zero_pfn(addr)	page_to_pfn(ZERO_PAGE(addr))
>  
>  #else
>  static inline int is_zero_pfn(unsigned long pfn)
>  {
> -	extern unsigned long zero_pfn;
> -	return pfn == zero_pfn;
> +	extern unsigned long zero_page_pfn;
> +
> +	return pfn == zero_page_pfn;
>  }
>  
> -static inline unsigned long my_zero_pfn(unsigned long addr)
> +static inline unsigned long zero_pfn(unsigned long addr)
>  {
> -	extern unsigned long zero_pfn;
> -	return zero_pfn;
> +	extern unsigned long zero_page_pfn;
> +
> +	return zero_page_pfn;
>  }
>  #endif /* __HAVE_COLOR_ZERO_PAGE */
>  
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 44ff8a648afd..bc15fd152526 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2968,7 +2968,7 @@ static void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
>  	for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
>  		pte_t entry;
>  
> -		entry = pfn_pte(my_zero_pfn(addr), vma->vm_page_prot);
> +		entry = pfn_pte(zero_pfn(addr), vma->vm_page_prot);
>  		entry = pte_mkspecial(entry);
>  		if (pmd_uffd_wp(old_pmd))
>  			entry = pte_mkuffd_wp(entry);
> diff --git a/mm/memory.c b/mm/memory.c
> index 51d2018a387a..ae610afa9cea 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5165,7 +5165,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>  	/* Use the zero-page for reads */
>  	if (!(vmf->flags & FAULT_FLAG_WRITE) &&
>  			!mm_forbids_zeropage(vma->vm_mm)) {
> -		entry = pte_mkspecial(pfn_pte(my_zero_pfn(vmf->address),
> +		entry = pte_mkspecial(pfn_pte(zero_pfn(vmf->address),
>  						vma->vm_page_prot));
>  		vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
>  				vmf->address, &vmf->ptl);
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 1bf2cf8c44dd..739c4e03769b 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -321,7 +321,7 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
>  	if (!pages_identical(page, ZERO_PAGE(0)))
>  		return false;
>  
> -	newpte = pte_mkspecial(pfn_pte(my_zero_pfn(pvmw->address),
> +	newpte = pte_mkspecial(pfn_pte(zero_pfn(pvmw->address),
>  					pvmw->vma->vm_page_prot));
>  
>  	if (pte_swp_soft_dirty(old_pte))
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index dcf9eff34f83..a0ca236eb4f5 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -53,8 +53,8 @@ EXPORT_SYMBOL(mem_map);
>  void *high_memory;
>  EXPORT_SYMBOL(high_memory);
>  
> -unsigned long zero_pfn __ro_after_init;
> -EXPORT_SYMBOL(zero_pfn);
> +unsigned long zero_page_pfn __ro_after_init;
> +EXPORT_SYMBOL(zero_page_pfn);
>  
>  #ifdef CONFIG_DEBUG_MEMORY_INIT
>  int __meminitdata mminit_loglevel;
> @@ -2670,12 +2670,12 @@ static void __init mem_init_print_info(void)
>  		);
>  }
>  
> -static int __init init_zero_pfn(void)
> +static int __init init_zero_page_pfn(void)
>  {
> -	zero_pfn = page_to_pfn(ZERO_PAGE(0));
> +	zero_page_pfn = page_to_pfn(ZERO_PAGE(0));
>  	return 0;
>  }
> -early_initcall(init_zero_pfn);
> +early_initcall(init_zero_page_pfn);
>  
>  void __init __weak arch_mm_preinit(void)
>  {
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index 927086bb4a3c..e19872e51878 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -357,7 +357,7 @@ static int mfill_atomic_pte_zeropage(pmd_t *dst_pmd,
>  	if (mm_forbids_zeropage(dst_vma->vm_mm))
>  		return mfill_atomic_pte_zeroed_folio(dst_pmd, dst_vma, dst_addr);
>  
> -	_dst_pte = pte_mkspecial(pfn_pte(my_zero_pfn(dst_addr),
> +	_dst_pte = pte_mkspecial(pfn_pte(zero_pfn(dst_addr),
>  					 dst_vma->vm_page_prot));
>  	ret = -EAGAIN;
>  	dst_pte = pte_offset_map_lock(dst_vma->vm_mm, dst_pmd, dst_addr, &ptl);
> @@ -1229,7 +1229,7 @@ static int move_zeropage_pte(struct mm_struct *mm,
>  		return -EAGAIN;
>  	}
>  
> -	zero_pte = pte_mkspecial(pfn_pte(my_zero_pfn(dst_addr),
> +	zero_pte = pte_mkspecial(pfn_pte(zero_pfn(dst_addr),
>  					 dst_vma->vm_page_prot));
>  	ptep_clear_flush(src_vma, src_addr, src_pte);
>  	set_pte_at(mm, dst_addr, dst_pte, zero_pte);
> -- 
> 2.51.0
> 

