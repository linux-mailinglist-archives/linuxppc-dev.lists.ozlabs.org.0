Return-Path: <linuxppc-dev+bounces-16851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNw4LO0ejmnp/gAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 19:41:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BDF1305A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 19:41:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBkff3QTpz2yQj;
	Fri, 13 Feb 2026 05:41:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770921706;
	cv=pass; b=CL4HHB0JxYS8wXCTbAzwogmHkJFbkYJhRLkWuH1aWWwME1axXwr/wMgwfmmUxCsKj7mzQH/XTNm6i9FqJBL3jmeyE1x2LhlT7G3qcKTZ3fUQ5SrNM9Ol+98KcHmiTOB5FWuvr4tem13+2k6ZCdqNlrDnM4GcTtggeu9oAxI2w00QDCzpU40oeejn9i6KM2pSTawNeEPxQ5UxYi4CVW1ZKxIWjxJJC243gjcgbtX/zPylc5HGf1966jCY+WpHX1XN1JOlGzS4Z0DyGam8ArydQgWOepjXubyn0So7A6DMRMRDtWuDssApWE3nn5cyqQ8sradofKKGXRNGtoAM95uCPg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770921706; c=relaxed/relaxed;
	bh=4BVzRN5iDmCLcnIiLLHTCmDdynKYuoT202IyclrrqVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RaMsQGebcuaLX5x+Vy2J9OkFDDC6+05qWkmELmrkiwMMTT4nV4WJsbmNyzq+IPqFJAdG9DBo2uKhVnUMz5Gfmwd23nqC6+2uktgIBd0cvVB32LdOhp4e2TU627Wyvepa1pZPV1MKlBfG7kdamyiGp6DvCR5uapf6IVxKEo7smCQBfkog5WZTjq7kNWNRMER+n4TthunBHBfLj9EArIsC2YZtbeNhDujCKdWwkkFRlKIwOwvmo7BwVzRfgILJOYoP/vZ6tkF4Gb3DDnKr40DyAp9SWQDvV+a2XHabmPLQzZw5wG0nx0ZmNC3Viz9nuTej6HN+L7m4M3D0d36N+GbmNg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=pFGCQ+2v; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=KQdWqfJi; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=pFGCQ+2v;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=KQdWqfJi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBkfd4qgGz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Feb 2026 05:41:44 +1100 (AEDT)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CGNG8r948454;
	Thu, 12 Feb 2026 18:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=4BVzRN5iDmCLcnIiLL
	HTCmDdynKYuoT202IyclrrqVg=; b=pFGCQ+2vEbU3l1A5vmLw9bZbtRXrVpDp66
	Ro3Epg4gwddgjtc+Hycey4rE2Nl5WwWPaDMfz1P+dp29lJRumMWQ/xpC4FISKr+Z
	+mtLUujFJbDRc/EyN8Rz1eXko1Oyw8V3UNKuVQkQkpwqDheMzfd63NHl48GX1KoY
	OS1ZbNgTf0ysa4eyBJ5Lvu8b4h7WFfU1LowhcOIk5BKg3xxctXcE5AdznY7BejbV
	m+QHWsu8skxW3DRudzU1yvPFlh8W+8E8EL4jYI2q1jjm8NMrjxH7EQmWstU+HVS+
	NFB0MDBuEknSM8+pN3e0fgvwU7dsAGAyKViaOUhfW1R8OH9uhpUg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c88n7kynv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Feb 2026 18:40:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61CHKHT8022380;
	Thu, 12 Feb 2026 18:40:39 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010023.outbound.protection.outlook.com [52.101.85.23])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c828d9nqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Feb 2026 18:40:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHqvcMgqaCJvpHSb6UQ8WngkONdm6EphAHEDSP0eyvQ2OlFZc2jwQ96x1sj8tS48soIUTtam5xzyoihpco1hxf3NNzgoVF+IUxD8vBzJsr8rzJLMYCWo2FxyBKa5XGPc0O6E9z08eBGc18V0yp2ZJTjlFi8Aoi/L5AbmnEaU+6VuvHaYLyQeTYu1+2p57bW63mbCgLKf3KGXVPum3glVaTYIQb3Z4CCzmJqtqcqgsHoROd52TxrbMWv04BF2CZV3I8xDklcqAuck6lI571V0FxlnER8WoACRYq+qORPMDanLn00v0Dh826sC67jYpQNCq0O70TYCTwjwbpi8klNApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BVzRN5iDmCLcnIiLLHTCmDdynKYuoT202IyclrrqVg=;
 b=DU3N8Xy3IJbjP1R34zEP6CNY3bpi6ZeYIQ54km8ysoqg5gO4uvFsakqvqBYdp/ToYDNKuU9acFR3CWSHKXXlkNROC7poeE6ZtCPGNMJVk3ZbNiHMWag7Z4cwgkXA4Wumkr95leEhLKB/8yBUPRTd4dgiOwBQOR4itnoPRCZz3CKifD75772HaZcYxm6XZ+aMx/j5eRQcCpsQzqQNL43Smn+yvPp65lDh11i4346JXL5/TN4zrZuJ/jJJP2P85sIp43KsysKf/LamJMQU9JMclmdaXF6MwiTOsmbSxwdgYTZs0KkulnqW4WVdNuHK/WoGIPaT6qpP135IpcrlKyT5AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BVzRN5iDmCLcnIiLLHTCmDdynKYuoT202IyclrrqVg=;
 b=KQdWqfJid+2Ffv2KvF3qOszYhqQokKqmrgMii9otxwvDvqSJ0OvoDOa3AXcVoiyN7BUuX4nPoeydNfOfE56URFu4JSZp6JOC0cbZW3DpWx7zK49ZWR6E/dpW1ZeuwvQMuEAyDeeUMl6io1NTYZ3Nwmdu9TkfeFz2lcv9EcP/hOA=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DS0PR10MB6996.namprd10.prod.outlook.com (2603:10b6:8:152::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:40:31 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 18:40:31 +0000
Date: Thu, 12 Feb 2026 13:40:04 -0500
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
Subject: Re: [PATCH v3 4/4] mm: cache struct page for empty_zero_page and
 return it from ZERO_PAGE()
Message-ID: <chzhbnsmqsrj2sg7tua55cnwdpyuxn5pnkv3qtstimboo3r5gf@56i43rsfmmgr>
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
 <20260211103141.3215197-5-rppt@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211103141.3215197-5-rppt@kernel.org>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT4PR01CA0182.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::23) To PH0PR10MB5777.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DS0PR10MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b41c1f-251c-4c0f-8326-08de6a66331c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C1Emi0LgWC3OoadJNNk6ZoZLatRrMMlhjlTc3+72v84R1nlfTGngZ3gaaJDw?=
 =?us-ascii?Q?vHq3+98JDzy0nziV2BnCBPpHgBUZ7dAZiWKQDTcPtgNQ/gJ9f9AUFQKbYIBQ?=
 =?us-ascii?Q?dyN+DWpdUFLz90XmrMhkH0aywRNAv8E4eQ4cQso4sgTpO7fzPlHfcJG0Z4wT?=
 =?us-ascii?Q?swfCSV9DAD9jcDGvEnt4fFraR/bLo8dKY8St53oDyThl54iLE8yatN2ivuMc?=
 =?us-ascii?Q?QFVSAezOI3jWucDTpFFbC1VCm5I9JkSPDbBkdJnfG6qxSzN4/ZceCYInRkVG?=
 =?us-ascii?Q?U/+kiHo01ge5gyqYJjV01FVT/RdKwDORhsgTRx4G4R4Ax0jkwZAl6pR/ayUP?=
 =?us-ascii?Q?EqpIlZa80FR2OeFfEGN9Wl8R3d4AyVytUUIqljEV3c3fAX9xD7ZD9k3OjUOC?=
 =?us-ascii?Q?3htpIxE3xcoGqyclgtrYIMk4QQCdPENUuuDTolZYWakA3HX6N3amJ4Hc2dH7?=
 =?us-ascii?Q?xP5ySWbLppEqdZx5goy5+V8fI0JB6uTgNVUgpBG8pFa4kqexq9gkpjPJxPCL?=
 =?us-ascii?Q?ad/X2SwvaRZ8xsuEGBLPQfFubudGcAXlyS42vQZaiLSEVIw2aGNG4yf3HFlW?=
 =?us-ascii?Q?UCiPDNTqZuDwoezIbRtsPhL/Cc31KcVfTqIxe8HDy0vjqoZBEWbXmOwaPLUF?=
 =?us-ascii?Q?StIEhGbr2Yfu5fgMZFYoi8JkPxYi/flhEUG71xfgmgEMhNsVp8g7IGTbNdkW?=
 =?us-ascii?Q?2Wzv6anMeJNvHXl3u3ISUc9nl0BZX/2Y+R7pftGbgzvvATLBwR/mK7oW0pAV?=
 =?us-ascii?Q?joeo17Vuc1BrW8g/UpLrtyDsD7YSCn0PrrCwDf8LsaZe2EexBg3QfxVcVQr6?=
 =?us-ascii?Q?D6SuAd5vV5S+5H1Nxm22OUkU0UlWJd+QpHe22zIM8d2V5LEVcGRsVcFJAFT1?=
 =?us-ascii?Q?3OI3WIkDvuIEr9zFLSk9ZJcfgrG98apwTwAWtCKUwazRA9uGwdtIVaKWzRPP?=
 =?us-ascii?Q?5G5Tg7L2HtPL663FWtbNYgf6pEi7D1B/BsQL1E0WNwAM981iXKsSNFfhMbbe?=
 =?us-ascii?Q?6fwjk2W8lDyOZ6YZgK5i6lWgnsCsDmOHCw+9afFKqziaB8fQlnFC+kd8mu5n?=
 =?us-ascii?Q?a8YD9qidNEhll00s0BmDdfXTHqllSB4JKlp8AItlQv8M589Za/sUTLrTMGRx?=
 =?us-ascii?Q?LkkkPqAQlqSnKNkkailDYBASBhFfa1iXkSJb4pHkqBe4KEWIs5xXmUl+xCiT?=
 =?us-ascii?Q?IV/J+VHBiZfuOZDI4AY1L9ORzzIsZhnf/TX1p/+WsJA+bGsxdj/LyTHvaT7X?=
 =?us-ascii?Q?/f1pPlW7cq4mUTUrn81eOC1bx/ZfFs9kMXQsqOlsWI0BfJYnoke3iCQJI7rs?=
 =?us-ascii?Q?3KxhVqHhVbWCt2Rk+oy1zpYRvifNm1QcX6YbVZCuiHBNTkAanLaeswBYkqDY?=
 =?us-ascii?Q?B6FfUVQzzoPB6mHkACJncrph9dGew7bNxpFvWOGmMcOognfOK0nLnnIZhzgZ?=
 =?us-ascii?Q?WWcgQUOrk+YV5f9X5OTYztlfj6JrLcEud8VWes7f7d+gA0WzkuahurQe8PX9?=
 =?us-ascii?Q?y1qXLI/271u3LhdfUSQ9jeWFg2duXUrpq1HjNHv8EBE770xv63j4/PsQa5Yn?=
 =?us-ascii?Q?tBMMhe/WflTEXwix3nc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?md6snu4muffKx9PfsFjr7DKPCoa539CVngNSQEkis8dnRzEpnrn08xSArWiA?=
 =?us-ascii?Q?+yHpWVOAY0EvQHY0rOyQpbv5ulElEHMMJ5mKrYtz3UONeqJbZtKA19xNQNTN?=
 =?us-ascii?Q?6H8KiIR3PtZi4gmG2Emdly+VPHxHttX7EnStfI5kuAuExaFi6rCMaMZ+3BJX?=
 =?us-ascii?Q?r2tUaoCUAN8izB6bxeFQILCIqUn0FW0B7u2kv9tGUwLBxy/AlMHgAYsg8U5L?=
 =?us-ascii?Q?kLA966hvcFrVZ2zo16xQpJ5ze0MilGPWEBNChGa9eXbxWkNDUrTvIzNAHbQB?=
 =?us-ascii?Q?mVJSbnljuwer8MzFJve3DEdV8WV8zmSGBllItyli4xpng1ND2yCouac5Zij4?=
 =?us-ascii?Q?qETLQt3PWJ8eMy3XuTl9AwgfqD/BEtCHHvDQyJQUhPF5sOIrTApWdwfJf3CS?=
 =?us-ascii?Q?hMJRnLIG2ERvsMe99PJ06PSLZIl25bltmXJN31iIqvJrBM5Q/znvA7x3uK43?=
 =?us-ascii?Q?uI2lw9iRlIbvBXytbz+Ex70PmUKKGbhGnIuxxSrlRlF/zDbQXAzoljABOcgR?=
 =?us-ascii?Q?SQy8yoZoLhyycJQSgJx3QqCrhU+mOeAYQgKO7WgRFz0108Q1ddUGh+22Yw92?=
 =?us-ascii?Q?PQDpPo7ieDqPZjmNzsjLiqVNHFGYp39QgQ1H6hvnIxOGb1k1exfDbSLRRjXs?=
 =?us-ascii?Q?F2mMTmP/5YrIVU8DW1CJtjZ8UKe5qKIYg0LMmF2LNdIBX/a0YCDtQAlMnGe/?=
 =?us-ascii?Q?NKnWUqXJKARncwzoO8jvl43zqxJnxJNH+xKLodiL3L87CR3dcT21ZDAkxBNT?=
 =?us-ascii?Q?PEy11yc6FU1wjqjhMMuTbAs1o66EOhCS3Hag7lrrdpagTuiFOKS4aryvfjTe?=
 =?us-ascii?Q?uzXv4e7OEBTEexCs2X4OnuXRQyKxIRn5gTMNvCJDICja/KcRrhjE83Feoxtv?=
 =?us-ascii?Q?km5SBdfeVQ2MD6UYyaD6sgEbbnyyIvce79Igi+kt5RKGkkxszrgCaioyOkiW?=
 =?us-ascii?Q?HSd2VPoy4VqmlpXTuyQovhfiQQNPm1NMAoEzEJfrYF7bjFfNGi0Fj1EYE57G?=
 =?us-ascii?Q?KCWsCju2rUGdieeO0z3l3succ8irprQ1K/bwt8nI/wO16yiSVmF9jpab7KJM?=
 =?us-ascii?Q?DvCGmjrZO/Az+bt7IEz7sQvKuCjagSJzNzz0/k2Bq+iw+5gZ/Zle1Mtu/0+1?=
 =?us-ascii?Q?3AZCyV5xYPEHqiVbDisawhHCGXw7bQrRRPccJzkaXKPuANBlmExbP6Pc7LhI?=
 =?us-ascii?Q?lzet+XuUYo5NO+KPyu1C4DMYF172FS8VF0u4w1u1ICJgzFXCWE7PymIUbvaS?=
 =?us-ascii?Q?gm2SrWNWJjVa9JMx7PwdPesKRIjDiLClWsy9BzoqS9wnMi5tzfFS27V0W79J?=
 =?us-ascii?Q?KuqOjkN+hl15HHiuWWIXl7Sf8MUP76DGx6VIu7hOE86LjPH/Bclyl6moGtAQ?=
 =?us-ascii?Q?i4h/rF7fshBIThIy/v6eT8fmTIA7Nv8eosrtdj11KYvdKU4Bt78XH0L43h4g?=
 =?us-ascii?Q?2uvdaRcZq8z1/pFXJ+nq1o1dMpWv6lBklsKFb96e0l3kl8yDO8Fplmt79rg0?=
 =?us-ascii?Q?7ePS3PbWFNpx2gQbdAGHK/2BUN+gInXmFMljtTvZSDnEM1I57QbmH1zKatZh?=
 =?us-ascii?Q?lD0n0VYFhj6AWcnuLqZDkZEsU7dPajW/0Ozp+OxZArBPL2RsNNPVOkcu4ibQ?=
 =?us-ascii?Q?MPKRisWlWpFS2ohMCZileUJwSNkNqNq05d+ldj4gR9wfQRdgRyhwpXgdpZsl?=
 =?us-ascii?Q?lpN1nSXRYmktGgZugc4qqVLwJZPfHw5at3Rr7MIarIcSHfTFOuYK+uOEOdzR?=
 =?us-ascii?Q?KoMxQug34Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EcfeEskMjOJMVh/vrxaDOC7efaG1LhsK4RFlBsXH+pP26+Uzupo6vauySEr5FfeFzvGGHh8eQUqNKB0JxwLxKe7rgP60ZoWgHDFLhTlQ4lQwFz+XWQjLGyIvLXEPfjSqgn3cYwMbZ+qzayG9QZBFAePExqvDDcKYVrha5flAGmI/RcoGHtiOp2q3imQY4XENXC9crwpFEhHA9GZWIK3BGkWMBD3yRd7IT3ocpyCd01RTxZYoJ/8oOQs+KOLSWS5cbePlgXNV5RyRZPkdKeOXDrBsZb1gd89uV2bwHVikVw9UaKA9jaf3vBPf/JrADb9Du97PQQGmEN6ZqyJDLdOiEJ3sJtN9V8PtFDO17pgdI1OutVYh2RJrOtWpQCrtcAS9tRXcJLeAsiDDmVYsmMSb1gBWFXJKX06GcwAOog0EyTXo5BBR2MpiGWMo3qNMyOCyEWuBzvva6MXK8+PqA5+50aReNO5MhHPFTO7tQGL9nO1df4T0q2LyKlGVLAD3URarPAs2KhJHQzNzq6sXt1TBssi+mgKbPmpJ7+aeTzQXiBo8O+wqGeQtZb095Mm4Np8YRDsfp9l5zg6VbZDvLOhchXlKyfDfPta9l7G2YanFb/Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b41c1f-251c-4c0f-8326-08de6a66331c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:40:31.1966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iYbFKyeQC22pMIzm24e6s9N4dviB8lPfaa84REgJTvFzBAmTUghB7xzJ8+JTzemNBV4Iy6H/1M6VdjDXWInW7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6996
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602120144
X-Proofpoint-ORIG-GUID: 0mDId0a0QQJgYesi1mNQ9ZbrJZBI9avE
X-Proofpoint-GUID: 0mDId0a0QQJgYesi1mNQ9ZbrJZBI9avE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0NCBTYWx0ZWRfX2TdQN5k8hUda
 hSDhGH8wk0zOY7Z5jCLppGkqFJz+t2tbpRQRih0D4dhSt9RHYovaKze+8KkNX/wOe2HnbqV9T2a
 0sbuY4AdA8FzflHgH7Z3r9q+RCB8xEjQPBxW542IjEZvrv3NKND6lcAfn7TMYYLD5SsEyTMffSu
 pznCf3hdRE0HaGG6ru0tpfIUyg8jxbTpvdKJ3gckyqY9mCbY/o2tyIupmxOIzblDE9M4VJoVwkD
 +zVmQTMwb9lx0iMY5T3PEFjsrenZwpPdQ5Shg2zP+ikGqSJ7SxnxPDacJW5DAr6gMFLJWvRPzDR
 e8ieU6OGt86B91nA4Cq8JgHEzAEtHFw6S4OLPYRxCk3ZQE5zPlTzNlhc7P5MkqLpSsN2DOG0LWo
 pr9TNPKxOPTgn+Hqh9H5emBXY1Y9Xv3BiJUNGdaIYlA7ylP+TBzGcV49qd187q9b04uVdAXFAp0
 oez0Aj7/frcK7+EGEvh4GNsg2BEe8OwpPErLuJbA=
X-Authority-Analysis: v=2.4 cv=O5c0fR9W c=1 sm=1 tr=0 ts=698e1ea8 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=yPCof4ZbAAAA:8 a=zIzQp8f6N97s4e50T3oA:9 a=CjuIK1q_8ugA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:12149
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:akpm@linux-foundation.org,m:andreas@gaisler.com,m:bp@alien8.de,m:bcain@kernel.org,m:catalin.marinas@arm.com,m:chleroy@kernel.org,m:davem@davemloft.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dinguyen@kernel.org,m:geert@linux-m68k.org,m:guoren@kernel.org,m:deller@gmx.de,m:chenhuacai@kernel.org,m:mingo@redhat.com,m:johannes@sipsolutions.net,m:glaubitz@physik.fu-berlin.de,m:lorenzo.stoakes@oracle.com,m:maddy@linux.ibm.com,m:linmag7@gmail.com,m:mattst88@gmail.com,m:jcmvbkbc@gmail.com,m:mpe@ellerman.id.au,m:mhocko@suse.com,m:monstr@monstr.eu,m:palmer@dabbelt.com,m:richard@nod.at,m:linux@armlinux.org.uk,m:shorne@gmail.com,m:surenb@google.com,m:tglx@kernel.org,m:vgupta@kernel.org,m:vbabka@suse.cz,m:will@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linux.dev
 ,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-mm@kvack.org,m:x86@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-16851-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Liam.Howlett@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,gaisler.com,alien8.de,kernel.org,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,oracle.com,linux.ibm.com,gmail.com,ellerman.id.au,suse.com,monstr.eu,dabbelt.com,nod.at,armlinux.org.uk,google.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,kvack.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,oracle.onmicrosoft.com:dkim,oracle.com:email,oracle.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Liam.Howlett@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D6BDF1305A8
X-Rspamd-Action: no action

* Mike Rapoport <rppt@kernel.org> [260211 05:32]:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> For most architectures every invocation of ZERO_PAGE() does
> virt_to_page(empty_zero_page). But empty_zero_page is in BSS and it is
> enough to get its struct page once at initialization time and then use
> it whenever a zero page should be accessed.
> 
> Add yet another __zero_page variable that will be initialized as
> virt_to_page(empty_zero_page) for most architectures in a weak
> arch_setup_zero_pages() function.
> 
> For architectures that use colored zero pages (MIPS and s390) rename their
> setup_zero_pages() to arch_setup_zero_pages() and make it global rather
> than static.
> 
> For architectures that cannot use virt_to_page() for BSS (arm64 and
> sparc64) add override of arch_setup_zero_pages().
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  arch/arm64/include/asm/pgtable.h    |  6 ------
>  arch/arm64/mm/init.c                |  5 +++++
>  arch/mips/mm/init.c                 | 11 +----------
>  arch/s390/mm/init.c                 |  4 +---
>  arch/sparc/include/asm/pgtable_64.h |  3 ---
>  arch/sparc/mm/init_64.c             | 17 +++++++----------
>  include/linux/pgtable.h             | 11 ++++++++---
>  mm/mm_init.c                        | 21 +++++++++++++++++----
>  8 files changed, 39 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 63da07398a30..2c1ec7cc8612 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -106,12 +106,6 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  #define flush_tlb_fix_spurious_fault_pmd(vma, address, pmdp)	\
>  	local_flush_tlb_page_nonotify(vma, address)
>  
> -/*
> - * ZERO_PAGE is a global shared page that is always zero: used
> - * for zero-mapped memory areas etc..
> - */
> -#define ZERO_PAGE(vaddr)	phys_to_page(__pa_symbol(empty_zero_page))
> -
>  #define pte_ERROR(e)	\
>  	pr_err("%s:%d: bad pte %016llx.\n", __FILE__, __LINE__, pte_val(e))
>  
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 96711b8578fd..417ec7efe569 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -328,6 +328,11 @@ void __init bootmem_init(void)
>  	memblock_dump_all();
>  }
>  
> +void __init arch_setup_zero_pages(void)
> +{
> +	__zero_page = phys_to_page(__pa_symbol(empty_zero_page));
> +}
> +
>  void __init arch_mm_preinit(void)
>  {
>  	unsigned int flags = SWIOTLB_VERBOSE;
> diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
> index 4f6449ad02ca..55b25e85122a 100644
> --- a/arch/mips/mm/init.c
> +++ b/arch/mips/mm/init.c
> @@ -56,10 +56,7 @@ unsigned long empty_zero_page, zero_page_mask;
>  EXPORT_SYMBOL_GPL(empty_zero_page);
>  EXPORT_SYMBOL(zero_page_mask);
>  
> -/*
> - * Not static inline because used by IP27 special magic initialization code
> - */
> -static void __init setup_zero_pages(void)
> +void __init arch_setup_zero_pages(void)
>  {
>  	unsigned int order;
>  
> @@ -450,7 +447,6 @@ void __init arch_mm_preinit(void)
>  	BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT));
>  
>  	maar_init();
> -	setup_zero_pages();	/* Setup zeroed pages.  */
>  	highmem_init();
>  
>  #ifdef CONFIG_64BIT
> @@ -461,11 +457,6 @@ void __init arch_mm_preinit(void)
>  				0x80000000 - 4, KCORE_TEXT);
>  #endif
>  }
> -#else  /* CONFIG_NUMA */
> -void __init arch_mm_preinit(void)
> -{
> -	setup_zero_pages();	/* This comes from node 0 */
> -}
>  #endif /* !CONFIG_NUMA */
>  
>  void free_init_pages(const char *what, unsigned long begin, unsigned long end)
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index 3c20475cbee2..1f72efc2a579 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -69,7 +69,7 @@ unsigned long empty_zero_page, zero_page_mask;
>  EXPORT_SYMBOL(empty_zero_page);
>  EXPORT_SYMBOL(zero_page_mask);
>  
> -static void __init setup_zero_pages(void)
> +void __init arch_setup_zero_pages(void)
>  {
>  	unsigned long total_pages = memblock_estimated_nr_free_pages();
>  	unsigned int order;
> @@ -159,8 +159,6 @@ void __init arch_mm_preinit(void)
>  	cpumask_set_cpu(0, mm_cpumask(&init_mm));
>  
>  	pv_init();
> -
> -	setup_zero_pages();	/* Setup zeroed pages. */
>  }
>  
>  unsigned long memory_block_size_bytes(void)
> diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
> index 615f460c50af..74ede706fb32 100644
> --- a/arch/sparc/include/asm/pgtable_64.h
> +++ b/arch/sparc/include/asm/pgtable_64.h
> @@ -210,9 +210,6 @@ extern unsigned long _PAGE_CACHE;
>  extern unsigned long pg_iobits;
>  extern unsigned long _PAGE_ALL_SZ_BITS;
>  
> -extern struct page *mem_map_zero;
> -#define ZERO_PAGE(vaddr)	(mem_map_zero)
> -
>  /* PFNs are real physical page numbers.  However, mem_map only begins to record
>   * per-page information starting at pfn_base.  This is to handle systems where
>   * the first physical page in the machine is at some huge physical address,
> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index 0cc8de2fea90..707c1df67d79 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -177,9 +177,6 @@ extern unsigned long sparc_ramdisk_image64;
>  extern unsigned int sparc_ramdisk_image;
>  extern unsigned int sparc_ramdisk_size;
>  
> -struct page *mem_map_zero __read_mostly;
> -EXPORT_SYMBOL(mem_map_zero);
> -
>  unsigned int sparc64_highest_unlocked_tlb_ent __read_mostly;
>  
>  unsigned long sparc64_kern_pri_context __read_mostly;
> @@ -2496,11 +2493,17 @@ static void __init register_page_bootmem_info(void)
>  			register_page_bootmem_info_node(NODE_DATA(i));
>  #endif
>  }
> -void __init mem_init(void)
> +
> +void __init arch_setup_zero_pages(void)
>  {
>  	phys_addr_t zero_page_pa = kern_base +
>  		((unsigned long)&empty_zero_page[0] - KERNBASE);
>  
> +	__zero_page = phys_to_page(zero_page_pa);
> +}
> +
> +void __init mem_init(void)
> +{
>  	/*
>  	 * Must be done after boot memory is put on freelist, because here we
>  	 * might set fields in deferred struct pages that have not yet been
> @@ -2509,12 +2512,6 @@ void __init mem_init(void)
>  	 */
>  	register_page_bootmem_info();
>  
> -	/*
> -	 * Set up the zero page, mark it reserved, so that page count
> -	 * is not manipulated when freeing the page from user ptes.
> -	 */
> -	mem_map_zero = pfn_to_page(PHYS_PFN(zero_page_pa));
> -
>  	if (tlb_type == cheetah || tlb_type == cheetah_plus)
>  		cheetah_ecache_flush_init();
>  }
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 3d48eea57cd2..1da21ec62836 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1894,6 +1894,8 @@ static inline void pfnmap_setup_cachemode_pfn(unsigned long pfn, pgprot_t *prot)
>   * For architectures that don't __HAVE_COLOR_ZERO_PAGE the zero page lives in
>   * empty_zero_page in BSS.
>   */
> +void arch_setup_zero_pages(void);
> +
>  #ifdef __HAVE_COLOR_ZERO_PAGE
>  static inline int is_zero_pfn(unsigned long pfn)
>  {
> @@ -1921,10 +1923,13 @@ static inline unsigned long zero_pfn(unsigned long addr)
>  }
>  
>  extern uint8_t empty_zero_page[PAGE_SIZE];
> +extern struct page *__zero_page;
>  
> -#ifndef ZERO_PAGE
> -#define ZERO_PAGE(vaddr) ((void)(vaddr),virt_to_page(empty_zero_page))
> -#endif
> +static inline struct page *_zero_page(unsigned long addr)
> +{
> +	return __zero_page;
> +}
> +#define ZERO_PAGE(vaddr) _zero_page(vaddr)
>  
>  #endif /* __HAVE_COLOR_ZERO_PAGE */
>  
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 1eac634ece1a..b08608c1b71d 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -59,7 +59,10 @@ EXPORT_SYMBOL(zero_page_pfn);
>  #ifndef __HAVE_COLOR_ZERO_PAGE
>  uint8_t empty_zero_page[PAGE_SIZE] __page_aligned_bss;
>  EXPORT_SYMBOL(empty_zero_page);
> -#endif
> +
> +struct page *__zero_page __ro_after_init;
> +EXPORT_SYMBOL(__zero_page);
> +#endif /* __HAVE_COLOR_ZERO_PAGE */
>  
>  #ifdef CONFIG_DEBUG_MEMORY_INIT
>  int __meminitdata mminit_loglevel;
> @@ -2675,12 +2678,21 @@ static void __init mem_init_print_info(void)
>  		);
>  }
>  
> -static int __init init_zero_page_pfn(void)
> +#ifndef __HAVE_COLOR_ZERO_PAGE
> +/*
> + * architectures that __HAVE_COLOR_ZERO_PAGE must define this function
> + */
> +void __init __weak arch_setup_zero_pages(void)
> +{
> +	__zero_page = virt_to_page(empty_zero_page);
> +}
> +#endif
> +
> +static void __init init_zero_page_pfn(void)
>  {
> +	arch_setup_zero_pages();
>  	zero_page_pfn = page_to_pfn(ZERO_PAGE(0));
> -	return 0;
>  }
> -early_initcall(init_zero_page_pfn);
>  
>  void __init __weak arch_mm_preinit(void)
>  {
> @@ -2704,6 +2716,7 @@ void __init mm_core_init_early(void)
>  void __init mm_core_init(void)
>  {
>  	arch_mm_preinit();
> +	init_zero_page_pfn();
>  
>  	/* Initializations relying on SMP setup */
>  	BUILD_BUG_ON(MAX_ZONELISTS > 2);
> -- 
> 2.51.0
> 

