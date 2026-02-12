Return-Path: <linuxppc-dev+bounces-16848-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBGPII0cjmmG/gAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16848-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 19:31:41 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A3A130447
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 19:31:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBkQt71K6z2yQj;
	Fri, 13 Feb 2026 05:31:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770921094;
	cv=pass; b=iR4MC/Usatkv2WVTGUnVkQUtHiXpt0g0d+qJ+lszeS4C979dAirSLslXxcdUW6DYULabGR8IVptFx9Jo0puxJBCIDo9WanGlyuYlfQw0TZVfHYg410SJ7RLIcHk9DzfNURp/rt6gVC766+wX8jL2WRQGYY4l2lYCyifHOGiSMN4CATv91kJFH/8qkWzztbej+j9PCwVpH/s9bkZaxjhRm1Iy+/GhrtAp9/UycFGs3Zr3yIG3aMxxYLNq3gMu1VosM9RoMcCM6W37NJMTuRsM2mI9RDJW4Q4o/DXpkA2lMexAgnrPNMd0ob0kmFqTE74hhD4aR29xxwCGGrFFKgStBA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770921094; c=relaxed/relaxed;
	bh=ZBU8zuh1B6u2NrK0f0xUAkJQ/ncEkHu8Pynqg4xlBCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=If/T2miQa1rKBMPXnXaQsmBf3s//e5EU6qyRd6c9DbRSbpl0v83IRnWeBDb7HsSyTU9PzL8iZ/rAq3DAHHre4vIZIpm62T5ElCpQ+5qTrLd2zhxk1DcouAA14eKUDcUeuI58pZv4IcIL2vVi8HbYIlQwM6XzvwWHvgHp3n+Ofi4LlOGFqBqTrfXN/QUIICfvzlLC00jLiK7ZZ+v6k9tnxWjquuwcAOdVxR1jR81TdfShPlWwDe3f5F4ylo41H46YI5I6txMUGSlaf6RvYrii9/aVDrx7dlByyH3P40HlDl/gij3wfi3Pai3oAR/YQ5JF/ZUh6/AOXQS4FZI3dTxyCg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=JEoHJsLw; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=jm25xSsc; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=JEoHJsLw;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=jm25xSsc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBkQr6nZgz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Feb 2026 05:31:31 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CGNAWL2001106;
	Thu, 12 Feb 2026 18:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ZBU8zuh1B6u2NrK0f0
	xUAkJQ/ncEkHu8Pynqg4xlBCc=; b=JEoHJsLwRXSRnSw6wsrv5SPp3yKQRzK7XN
	iXPggXvtFnovZbtqB1BaQW+icL0sb9U+eIlWq15H/vLapoOidpxYUgEUcgB5YmNt
	b0A2wU1fjyVgFLQLUSzla/qmPTcy0Rs0SlLV6xtfx8A1+CmEZRqbGuvbhHd+mUb/
	FV0fXyaagSFMhYw8mVA2W1isD+j8qxQHjhtyrI713ESphfGuzJr2pTZ/CgNhUUK7
	UMYUoXbUNTJNTSD+ZJbxt+HJXX8P8mttvGnWHswu1kZYOpofgEAzN5ufPVSwJha1
	wRBusB46+VdYsON6r1DDHa5YY7WNxuibY3G6arxRiEgJiUt3+zgQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c88df412h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Feb 2026 18:30:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61CIKKi9029995;
	Thu, 12 Feb 2026 18:30:34 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010063.outbound.protection.outlook.com [52.101.56.63])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c822b9t2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Feb 2026 18:30:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPJ5acgubwe5j310VbaK1N6RUBvikbMtusSMiubCzump6H1wC0lgsPmzXZZc+7M7LcagmTz5+vI7Crj+LSnC9NtQIWwVmmKOg9Tin2aoRGoQ/UcTtxZVnmwg5LvzbuZnJ+Lt7+5Rg/3R9gHhdG36f6ePQbero9AXDdGFGFrTBuxob6KIFscqm4Nx0E9oDgc+wim/gclHCZB/Ake/W4uWe0/CckD4mgQ/FHsRcbjX6ZsuJ43ruOj95rIsirTZb1IIjVfFSr+zeEvlTXHzt1GR8EA/00whajcHLEk/xEGa4P4IoWsnWc0NfHiejTmvb3d7Adg9sITbkUsK03c1CbAfow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBU8zuh1B6u2NrK0f0xUAkJQ/ncEkHu8Pynqg4xlBCc=;
 b=Fnn3NUPCB6T+pSB2NqxgVH+KXoJWmp9aBnd5P5ykgyQX0DYNEhIBa/7yFtQUfA3O5QHOxpr6Pd6HwspsqfycFTPlzltIW4MzQ5DDPohRvCRYljv20TstWHBVbf1nZofOcs+fOaP09f4KQTaeqaWg/3e4yKgaNkq/DgcwUvfGAUlsXhM40WpCpPEGhfhFbvGkfshUXMvpkF5bN2Ymq2CB+hY9I3DbldLDBDB/u7S0cfo77+Vyf1vF255Du65j2ptxZjRqn4C5Z5jPoj5Po6O/bkdP1MdDeAFYE1LpH3ze0VFIUbxPkT/8viFkZuhqicTYtdKax031OBgoJ002HAQjow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBU8zuh1B6u2NrK0f0xUAkJQ/ncEkHu8Pynqg4xlBCc=;
 b=jm25xSsc2Oo2uGW/i1TtxOCtbFqYMcQ4yL+ilggC4lqVM9Q6k/0IKb8EJpBFSlf+5vuTrxxvoIIti2tKQZrVVXtv4g+i12AU0nobWwsjnEvVBo1KTnJmdxV4SusdxrXJOy6puYqqg7JFcRMNcVgzOIhSKFtY7HQPFlzyV4MA7ps=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:30:26 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 18:30:26 +0000
Date: Thu, 12 Feb 2026 13:30:20 -0500
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
Subject: Re: [PATCH v3 1/4] mm: don't special case !MMU for is_zero_pfn() and
 my_zero_pfn()
Message-ID: <74vseqlrkdx7fnkfovc36uyjc3vugi2gs5wwpp2nn4c64ryjnn@6t3obq6o44zu>
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
 <20260211103141.3215197-2-rppt@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211103141.3215197-2-rppt@kernel.org>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT4PR01CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::15) To PH0PR10MB5777.namprd10.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 9fc62780-d820-4aca-e163-08de6a64ca9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1yxbEGuRwbbuPkMZSpbiXh9Y37p+cD1UWvR5ajfo7rEWsjKpqK3EslIV4NDX?=
 =?us-ascii?Q?uWxBsB7i5DEB6LWbZS4JThVZWyHhkBPtq/Pxuss1H20zu/NY4juTXtwzI2iI?=
 =?us-ascii?Q?rgsc2aUkLfNUiP5CaHULe5uhfjSiB9nBIpDdB+KW5bpmHS3pU8S/sAZYYkdF?=
 =?us-ascii?Q?Lx0zr+Yu/EEFwecXyx1RL4AMJIsMitKw2glad2TtVA0vBNt8Xzhz13MfMMVM?=
 =?us-ascii?Q?cbzJkrekkGAYlGWVcEliNjmqhvCBRe0dkdohckKzrx0Lidlf7rAKBJ22hjzg?=
 =?us-ascii?Q?d91Lzmz8gMsWSeFwKy16cNmVB5PwmkXzxV32/QybjZBfB6FuW6nJCQiuZngu?=
 =?us-ascii?Q?XwRDzm73mpr3tW+2wzUl+vZxNI0FRxtVBpqAemSj7LkyU6bJbECVqNGcZv5E?=
 =?us-ascii?Q?BGW3DYqEd9Okg3gKJbhHHIoofU+5/sZBUbvhfTxkGaYnEVxKN3+mVLhcCXdt?=
 =?us-ascii?Q?V+pzCLj3HwGyolLlrX3S07/kFOuijBFwrn3tk0ogXFWKrQzWZMRgtLI+lD2E?=
 =?us-ascii?Q?UnRl5LByhul5kSxFGqhnRvTXmoR0FPHF1QaytPRqPYy3JidlqMT+ZJ01qlLz?=
 =?us-ascii?Q?jyauEWRd+RuuNq5oVzczIc3KEWaNN8gfESX5hRES6gFrMetx/jCS+3fTOG/U?=
 =?us-ascii?Q?xc2uXhSglvqf42kItIu8gAehTBJTqODGPeCiEmMrmv7TMlcAmat3m03w5QPh?=
 =?us-ascii?Q?VoD8m7DuRZcJ5WQ6WuH3ISj2zaQsRgQjTr4R3aS/kaYudtfU9N5OJNC4DaBz?=
 =?us-ascii?Q?jkPlszXr2xWfeFtwQKZjFOAAE+2aMREk1cU13lbfzXK2MVq7GPu2fiUSLDhp?=
 =?us-ascii?Q?61i/xA9lEQJLtslVm3pWYzFUvOl2hrXVe2msJTNxgT4Vc3nZSbXqKvqC5+bY?=
 =?us-ascii?Q?kK3KKep/+X7RlSDQE4C2d34+Fc/0/+9P+c5YfsqaDjAZ/OYFnlQGUZkKD4ZD?=
 =?us-ascii?Q?ZMJHCtizRz/tuDkGBXXmhNJz9Y6gzqc6PVsYZI8tsZj8R0s5sgKb82lkKB3y?=
 =?us-ascii?Q?bSL6LsEfp/YOqM4/gfECNXLhTRFW6RJhEkXX006KkbVGW8bWNGdCBa4iuNzP?=
 =?us-ascii?Q?f74wx7Yuahwul+8tI89uMmfoyavQBIljHgHeQThduCk415XOXSp5H5jNDnDo?=
 =?us-ascii?Q?fhwdAjoFik2lfLUH5hRl9QgJqR8tFlnk4BRGpcQUzPTWQOWJ+XvMtl69keH5?=
 =?us-ascii?Q?gO7Yi3vOXvHX85/IovIwgYK/eYFqVyxcUSRfl2HfCB6Fgkfnh0BTv9+8gWg7?=
 =?us-ascii?Q?Hn3d8J/So780C1YZ5H3wYRBW6atL8OA9fJp51J5RjvZ3i3f7klTWofaVfJ5g?=
 =?us-ascii?Q?Tat2QJO3PGHKcY0UGbB7RWF9qNaGO04SYB8Cev90hEBReWP8j5K5UIZxky6m?=
 =?us-ascii?Q?clUGyBxPoRCsfsHEq5zo7zZBnlntTqY9vkW/1Epd9ho/o0EYRThu3CF3tOXS?=
 =?us-ascii?Q?603jv5o6250Rdy3dnQjxExvB0dnDd738nyoiMBvpokUW1aOo5Ey41J+Ug18c?=
 =?us-ascii?Q?ynkKU2IHF81qUi1RCAm7q7Ib5vVrDxjG71xkGSsNxYDvhZz4lm3mDCLKK5AM?=
 =?us-ascii?Q?7lJwTCjoMN8pClBeQUs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o6CMKY+O3bjSiWHDLxx8FaOT6egEe4X5AUsikQxIN8CgywlR1uMrFclIRDoW?=
 =?us-ascii?Q?W4YB3uON26Est48Zu829hwBI5jjqfhlHhHUGOIwt/7c6PnEgm4eG+wt4z2py?=
 =?us-ascii?Q?ZgUju6vpJrdL8zfAajounm7nqSw7DoVW3DUNgi1S3o3txcxTODhrcEfuR0Ys?=
 =?us-ascii?Q?5d2CNJAgz1qJ2090Uco3jQimZAHHSNP+MILGWcECtUwp+HO48dMVarL8zZVE?=
 =?us-ascii?Q?a0Y3nM9yrLZ1TU06q0TnthJ1b7cRnQFXlodYUBvEXL9ZuQ419R3thcOFegA7?=
 =?us-ascii?Q?90eoxx+f69lNnCE3gqXtypOYyxfZKI9oGCboyAXi2IQdXtEuJb6FKc+eKObG?=
 =?us-ascii?Q?ID8ylTToS24G8j6s5GBTmBJ+EiajyIwSBQUTjwaHGn6UOzGeckCQcKX6WkQr?=
 =?us-ascii?Q?Be0+v2lT0gYblARD8HrEJrBzRM99wOWjCV/5gGDQMC19V/7qB9bnb7w62j3F?=
 =?us-ascii?Q?uw9hCWoehrr5IuC+pD6E8bTiKn12x6CJTsUTpFHUUyzOUdrQ6jkIg2LoRg1C?=
 =?us-ascii?Q?nl6B2emJc0ycMtxKChs+BHIHP7wd8RlertW2aUsTr98hEpyDc0FsQnm9aPRN?=
 =?us-ascii?Q?lnVt5G4FAwg5ByyBLlQ8R73G+rZ98TeYpf4enVsW9ze/m8BZMHJ7Rv6LGTSM?=
 =?us-ascii?Q?UCMAMSQLV0ShB0bzqb+rX820lR2cpzQAmN9f0i79xIhfC0F+t5lZurQud+5s?=
 =?us-ascii?Q?8XvyR61eY37cLgsVDR08uU4rPt3xy+de5uXyu876Hr5+XdhKkILsnhk5Eow3?=
 =?us-ascii?Q?31MXUxNjt/i6hqHLLeiqigZKA3Y6Dubd+QwmJitPO6FpTl5tWtGhUjs7M3/V?=
 =?us-ascii?Q?s2LkI4Zt/GRqchpOQOavS+7CB4NU64IAWf5RNMvMI9D1uTeB6h6uBv0t3lPX?=
 =?us-ascii?Q?nGI70UrKscvuKT/HBn31T/gpVIcst6KbQaL8rZxJlAV/8TKCBfTXDuEY3/mx?=
 =?us-ascii?Q?4WkFiX7gH8A9y+J9F5ZG83+RZpqYfF6dQT316SGIUPm/pDWHEtHG/SeTLjhN?=
 =?us-ascii?Q?zKx2mfXZ7Eu++lhT9gCNcHrMjPpa79EaEj6hQKTKWg+b/pXqTYttvGAKvNvy?=
 =?us-ascii?Q?JAaBCCI2W5eCaokXF0RZvjeTxtqjEV16DtgVYj4TIcLFBJ6UgNFm/aLBrW3c?=
 =?us-ascii?Q?YLcfHnzKw47842UluF8xM1AxObgtIxlDncd/hcbosTN3DdbbQNYcS2Aa4/zf?=
 =?us-ascii?Q?U0vcO0QaPrHbsrFbGKVvHCrrdCbe+rhq9Se3DQTIn2yZtLPFUspY1Yi6hv0j?=
 =?us-ascii?Q?6hFANWPRtA/iMwOHjXcePACmu55bd39Dnx8zsZpc7iw2OTb/mTierpw7GVZA?=
 =?us-ascii?Q?PPkhX/4ZoCqifxYGtBjukxq+NO2DEmaJxFDyPN806mx38d4KvF7Q3hTeRJNc?=
 =?us-ascii?Q?tJJh+kLMTeYQrXxtnHj0VL7Zgza+TBu+fflMMeWgJBWCKG98iaDCz6cojFpY?=
 =?us-ascii?Q?eRiYF8vihfuct5P9heZ3FgeIxpDdmLcWUrvcSmxk/fAwX4R2GI4xIuDXIw+x?=
 =?us-ascii?Q?K27+SwfXc8eN5a70FjQaAD0fWaIKDxVqbmJVQqLoIYATtmt0HT7HJJZyB04k?=
 =?us-ascii?Q?NY6bY88716qzVR+Ak01Ntv6FMADIF5M1TJ5TJ4/rG6SuBNMgQ1ljKzwmsgqk?=
 =?us-ascii?Q?ax99kB8Fpu4WTMZ5AGe0DV0tsAcb3s4fzAk/qmS2VgYQx8yXf5VRrHTv4wR4?=
 =?us-ascii?Q?kdY3C0AzzQ4Z+eIRvO9grUWoCdDm7yML5JPcEPe9Y+147QgTQqRQO1o3SHNU?=
 =?us-ascii?Q?n00++oouzA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	unJwT33p5njrPQGqhhRSXuL6ZzjvulF7nljHxBenG25y9uHdvfemwKx3LaLHwS0i8692VAfomtXxpJlptSTUccXkyUzzWdgfg1xltLiFfMxgJYeOJH5ocUUlBrcUteixTnJtLJkkub9Q2R9vsTytD81TuKGEbXIJSGkO/451nEeZHzQ2wD2cdIQizV9lz/oCgJ9I6vydZ0NV2+YWrqj6YrzkFYsFdCFUojI/Oj+eiDitnY0v5Ha0M0mO27htZhIuprsfYgAXDrMXp7+vGOI2hdNsuOJvk5FJKwbwdg32rJEnEdHhK2IGOjb8/zu0epfPavkMQxcsz8W+MOZgLsSGA2iwnov7GMJJedD0cMMJjEXQcFtJmf+DetU6HPQcXzvF0xhrc1eVgvK7kPUIoCXPxmifICALNleM4rBxmgww18hnTs+wFvu8bJ9n/aQ5hsgsqJidn7cFMx9qjoLWPDbZHvIRsYUihmaBOj9fAQkMKQXHtnQ/e10pvsC/CzCZgiPzFXjc+pyoHfJRgddhjOw16Nh7EwfnPWt6m/bBUNu4bYhYzsWdRvx291RfS2v78qkHRIk/A0MyTtn2zKmUBo562zuks/BNuVHm7bxv89otvWs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc62780-d820-4aca-e163-08de6a64ca9c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:30:26.3091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0N7Qt/UF6Jc6jR07PnLZBOwW2WX6gQJvloc203xzFkg6sB34ROMpb5iZWL2z6pCQS8MIb9ej/n3tpALgR8qtdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6337
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602120143
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0MyBTYWx0ZWRfX9i8YDvDs1e4J
 JC0g+svE0HkcQ2tA3henhHE4RdO0f77ASzSttboeQgfV+RqrZNexAeEzAPGb51jR+Vka5ffkDPV
 1u/ZHZlMAjZveu3Dw7GLngqbdcfGzwvXBCS55mvc6ScSWXb/+hl+SWNvit4LYt31YEr9wWjlvtl
 qiFg3a54fTxf1so+L38z8JkRXzU2iz9RZe7cHtHhHbu7bSXgrHPswb2ojvzPSm24/VvZntvdUfN
 ssItwjnZe/r7lyzHL5y4FAfZgpdXW72cbIJaJuoVvtHKcUPvhAbNj38JqzygAN45VBiZsrtfmDi
 JAjXiGPfV8Yx95bNGz55LMjf5J7sKm214KbC5pIIxjkkhaS3ETaAhVcmLU/h6IodB9vXiBtW7Ua
 thdkGH+qNs2iFHyM5ZdXVRxhYBp1K1fpWRlLImipcXWIlffiMyBVyMbDqpTonvyP+o679cozaNN
 rOzgNpZZQogc7vQ/Ryw==
X-Proofpoint-GUID: okW_qj-7OWhB1JoDgzI0Iz8v-k0JbCd-
X-Authority-Analysis: v=2.4 cv=AqbjHe9P c=1 sm=1 tr=0 ts=698e1c4b cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=yPCof4ZbAAAA:8 a=ugCoQTybQTWSj32fGnYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: okW_qj-7OWhB1JoDgzI0Iz8v-k0JbCd-
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16848-lists,linuxppc-dev=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,oracle.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:akpm@linux-foundation.org,m:andreas@gaisler.com,m:bp@alien8.de,m:bcain@kernel.org,m:catalin.marinas@arm.com,m:chleroy@kernel.org,m:davem@davemloft.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dinguyen@kernel.org,m:geert@linux-m68k.org,m:guoren@kernel.org,m:deller@gmx.de,m:chenhuacai@kernel.org,m:mingo@redhat.com,m:johannes@sipsolutions.net,m:glaubitz@physik.fu-berlin.de,m:lorenzo.stoakes@oracle.com,m:maddy@linux.ibm.com,m:linmag7@gmail.com,m:mattst88@gmail.com,m:jcmvbkbc@gmail.com,m:mpe@ellerman.id.au,m:mhocko@suse.com,m:monstr@monstr.eu,m:palmer@dabbelt.com,m:richard@nod.at,m:linux@armlinux.org.uk,m:shorne@gmail.com,m:surenb@google.com,m:tglx@kernel.org,m:vgupta@kernel.org,m:vbabka@suse.cz,m:will@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linux.dev
 ,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-mm@kvack.org,m:x86@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[Liam.Howlett@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,gaisler.com,alien8.de,kernel.org,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,oracle.com,linux.ibm.com,gmail.com,ellerman.id.au,suse.com,monstr.eu,dabbelt.com,nod.at,armlinux.org.uk,google.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,kvack.org];
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
X-Rspamd-Queue-Id: 94A3A130447
X-Rspamd-Action: no action

* Mike Rapoport <rppt@kernel.org> [260211 05:32]:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> nommu architectures have empty_zero_page and define ZERO_PAGE() and
> although they don't really use it to populate page tables, there is no
> reason to hardwire !MMU implementation of is_zero_pfn() and my_zero_pfn()
> to 0.
> 
> Drop #ifdef CONFIG_MMU around implementations of is_zero_pfn() and
> my_zero_pfn() and remove !MMU version.
> 
> While on it, make zero_pfn __ro_after_init.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  include/linux/pgtable.h | 14 +-------------
>  mm/memory.c             | 13 -------------
>  mm/mm_init.c            | 10 ++++++++++
>  3 files changed, 11 insertions(+), 26 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 827dca25c0bc..08a88b0d56e5 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1882,7 +1882,6 @@ static inline void pfnmap_setup_cachemode_pfn(unsigned long pfn, pgprot_t *prot)
>  	pfnmap_setup_cachemode(pfn, PAGE_SIZE, prot);
>  }
>  
> -#ifdef CONFIG_MMU
>  #ifdef __HAVE_COLOR_ZERO_PAGE
>  static inline int is_zero_pfn(unsigned long pfn)
>  {
> @@ -1905,18 +1904,7 @@ static inline unsigned long my_zero_pfn(unsigned long addr)
>  	extern unsigned long zero_pfn;
>  	return zero_pfn;
>  }
> -#endif
> -#else
> -static inline int is_zero_pfn(unsigned long pfn)
> -{
> -	return 0;
> -}
> -
> -static inline unsigned long my_zero_pfn(unsigned long addr)
> -{
> -	return 0;
> -}
> -#endif /* CONFIG_MMU */
> +#endif /* __HAVE_COLOR_ZERO_PAGE */
>  
>  #ifdef CONFIG_MMU
>  
> diff --git a/mm/memory.c b/mm/memory.c
> index 187f16b7e996..51d2018a387a 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -162,21 +162,8 @@ static int __init disable_randmaps(char *s)
>  }
>  __setup("norandmaps", disable_randmaps);
>  
> -unsigned long zero_pfn __read_mostly;
> -EXPORT_SYMBOL(zero_pfn);
> -
>  unsigned long highest_memmap_pfn __read_mostly;
>  
> -/*
> - * CONFIG_MMU architectures set up ZERO_PAGE in their paging_init()
> - */
> -static int __init init_zero_pfn(void)
> -{
> -	zero_pfn = page_to_pfn(ZERO_PAGE(0));
> -	return 0;
> -}
> -early_initcall(init_zero_pfn);
> -
>  void mm_trace_rss_stat(struct mm_struct *mm, int member)
>  {
>  	trace_rss_stat(mm, member);
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 1a29a719af58..dcf9eff34f83 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -53,6 +53,9 @@ EXPORT_SYMBOL(mem_map);
>  void *high_memory;
>  EXPORT_SYMBOL(high_memory);
>  
> +unsigned long zero_pfn __ro_after_init;
> +EXPORT_SYMBOL(zero_pfn);
> +
>  #ifdef CONFIG_DEBUG_MEMORY_INIT
>  int __meminitdata mminit_loglevel;
>  
> @@ -2667,6 +2670,13 @@ static void __init mem_init_print_info(void)
>  		);
>  }
>  
> +static int __init init_zero_pfn(void)
> +{
> +	zero_pfn = page_to_pfn(ZERO_PAGE(0));
> +	return 0;
> +}
> +early_initcall(init_zero_pfn);
> +
>  void __init __weak arch_mm_preinit(void)
>  {
>  }
> -- 
> 2.51.0
> 

