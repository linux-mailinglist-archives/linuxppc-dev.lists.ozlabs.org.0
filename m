Return-Path: <linuxppc-dev+bounces-5717-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32388A230D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 16:08:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkMqH5kRhz30Tq;
	Fri, 31 Jan 2025 02:08:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738249723;
	cv=pass; b=Et2DJxyvLivnQSNXxLebNFNVIWxEy1HypCbOSlf0xW/+1Hn1dZmhXjRl0iBP9cLUEOSyCCYdy+kJXYnq/PC9+Ba1g0l4C4BhY615bddEov35VVzVGaYyShDhTHFKBwku97ppr5xJ5TOAjR/T5Df5l6KsFwTi7Aj5iSnxuicB6BUbpMR5fHWtU1Yh+Cwa+bm9YkHZucvlNBf0k95Gvu1EkmV6LXyhWbyBb+g2oW1Fn7YC/rW8Xa7tEohzWJfFQuMBt6g010FAoUuFt5PPG2QIqEK/GCZ6gC1aw+aW7sH2fyWlFByJq1l66XddsuIcqz7eFSjWprT7qETaIF4RxbLmag==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738249723; c=relaxed/relaxed;
	bh=fRh1oi45ZjpNVV7nwZ3PkFdiHeGlZnaUVi31NxtRQYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HLAQ7I4UGefwmn+ABcZIdMatEUnaseUgIbMEhyDmt8ApKtpyOp1SZeCg0xwf0KSXjWSXKeuJ1uiYqL9B58FGtexsBkLqaDmg55hITqykfszYl0EFouOEUqGXJX/1rvTtbig52/F0ZFCV3EnKoei9VjdjiKmjmZ7D6Ewg5wnVKgTlB9WwrwNkDVWOEGzCz8q1vUJCtsnFQIxPieUOdEWKyBXvJoMggFLGzxi2ysDv8X1GozMhaiNmcwNx4JGNSsNRzF7O3TzgVgrM3gNWOs5st0+SdqekWqSxOIGO+aJLK5OSb9yMl5i6G/OD4InNwKrlOFMaSTEBs8ileMYB7OEvZg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=fkjRLp02; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=uwm8T7EL; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=fkjRLp02;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=uwm8T7EL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1098 seconds by postgrey-1.37 at boromir; Fri, 31 Jan 2025 02:08:42 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkMqG0qJVz2yLr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 02:08:41 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UC66iY003869;
	Thu, 30 Jan 2025 14:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=fRh1oi45ZjpNVV7nwZ
	3PkFdiHeGlZnaUVi31NxtRQYM=; b=fkjRLp02R4AlDWpSq/3EO29JKQm9+PgLOm
	yAIr3N8WskkdZqZE3fME+iUgv9DNRRSCoxq1s7USHspzfyad8JpQDfDI01KO2c93
	+IV86JgNQ1pSNPiG9KplE38iO2V78LHcycyjWlec95tz9FM8sleczuotsX/qh8lG
	90EZGmrowAlC3SsFF9aorQ8lPCKG/AqY7BNNwfxXJbAm3NltiSapJ3Ix9GvQy3E2
	GGkXYWkAPs/FcXni9E2NP3THVEexki2AUMQfA07WEkPE5VJfLIsFck+2TN1Rb1Be
	2FZYJ1sqvK9fcEKZto+aIMG9qVw5pPHXhEd+nvs9r+qbQKPIJG3g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44g94jgaec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 14:49:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50UDs5SF005356;
	Thu, 30 Jan 2025 14:49:53 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdbadvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 14:49:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dRpf20qB9qECU1iYWYPImJXmC+cMVZUTIxB4GW1zcmpzRKVsMBbxrMNh90gA2zX6RcaCYj6qRkYjVI9Bt6s+tv0FRnnR4Iv4BtpPkVqQJSUHRbTcjXGUiZjiXmQUDaGq5GkJqnmrLAC68u3XTsWn/0sf8I9qC5JMcqlbxp3w26o3z6Ut/MyDbgB2tcWpoQJMJXvn+EH+MvAJMQgN1LMbq0LkKcHoEQuut51awBFxyMyYHKhBT7Ddkxsjq1LSQIscPl+RoQyLD4bH1DMJMeHJJK9mCWWQDMhQ2N13CtfvhzxSY1ko0LXsImuUj3XnD+1TG7tvllprxfXA6PpwUFDDAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRh1oi45ZjpNVV7nwZ3PkFdiHeGlZnaUVi31NxtRQYM=;
 b=RbHivGozyriSHAo6cLHUg+obRi6otKq2P5j93aRRatJxh1pdiHsFhmzTLuZpdutIc1EiRdZTxmcny8a9G3OJH/Dh8c0bToCnbgl/2+NzIi7RuwOTC7WnlVGHystJLCzpTkB1CNjn1paL7kxAnJivRd+ruqSAjQOb8/DjhdMTpSG9axI07M3Lny9JhpXc/TyAuH9dHFaXYGofnRZH1oWv+A1QOCiO800bxIZriZ3eGlToJxONfw0/wrFvCYmE9UVf+WwPnJs4ozYo0PSBZFHq0lFH2KqyO1NQYQJTOAHMsd3KxSgIAnDPMWq/vEnDW9/PVzA45tqCtp1Ece/8J9GWIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRh1oi45ZjpNVV7nwZ3PkFdiHeGlZnaUVi31NxtRQYM=;
 b=uwm8T7ELidgQmvjEAprDdOYgJ1l4PT0/2GhBwEtJKGR9LEcKLBR57AULCEXjJ+PPkEnCpuU30KEML5xx92I7ICBRcNGgx2b5JLwPd2LXSkB4+BVsLdUgEXtlr+R3mB+pn4pXxDBvH2prYrqe5cPKFMPcsoFhkStFbO546BfqOJY=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by IA0PR10MB6843.namprd10.prod.outlook.com (2603:10b6:208:435::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 14:49:50 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 14:49:50 +0000
Date: Thu, 30 Jan 2025 14:49:47 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        akpm@linux-foundation.org, christophe.leroy@csgroup.eu,
        justinstitt@google.com, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
        llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com,
        mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org,
        ndesaulniers@google.com, npiggin@gmail.com,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Subject: Re: [PATCH] xarray: port tests to kunit
Message-ID: <cd0cd863-9201-44ea-98c8-334ef5eab97d@lucifer.local>
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
 <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
 <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
 <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com>
 <9636ed9d-3bfb-4dda-98dc-f945c9d53698@lucifer.local>
 <CAMuHMdUFbhzi8J3rmyvVn7HmrxbeyoOwu97w8cnuKJxksa8iaw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUFbhzi8J3rmyvVn7HmrxbeyoOwu97w8cnuKJxksa8iaw@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0593.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::8) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|IA0PR10MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: 0282bf40-f1b3-4328-1a83-08dd413d593b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4kH9qgtNlhtxh86jfHplmBlA0S8fdtpUlvngQsIG5xx2eRq8GxPWi4CYWqRn?=
 =?us-ascii?Q?au9uz3h3C0Zs2dkghQFpX+2I/9O6rAFhZgEm/UT2OIDFrGMaA5PbX7ozsS7T?=
 =?us-ascii?Q?h1jO9DpL3jGjMUBDFwXoHRrY8BIMEUAIzBFXViPct91y091JDZN8qnkAar7s?=
 =?us-ascii?Q?d3ymBrAY7+ID1cziiwyVAibiPAskSbmxkmUwaJazCyMgoUju7la/VYooS7wE?=
 =?us-ascii?Q?EVRUevqbrQC3oA5LmZ9ldSuPDkRSrRINKltLl/Nv96E34oTAUDMRcVQUbTZE?=
 =?us-ascii?Q?1d8EyY4DSsR3jAL1r/gmLkjvSWCJA3A8G2BJCIPGYvc+Oq/NxGokQ2hML/6y?=
 =?us-ascii?Q?xiXbOFJecUbQi3fqpS4PoF/DdCQ200Th+G1KiVFbvTz/9SwYNylCfE9Oc7Ic?=
 =?us-ascii?Q?yuPycdFPxsi+CGi8jiZV195o7LAsKbg9wRqITkKM4H9DhCaCVVwW6v0y+37A?=
 =?us-ascii?Q?TcTxXkw1E/kLa272ZYZwO2WUjkYFGA9ZBdf1r4bpOkNyz8Gcl8JCC62PGiTs?=
 =?us-ascii?Q?8Kj0vlSGFD3Le8rr6bQqU2jMxGmjnFXggNsUZgzsqcEDFDiroRQOc3RIkTXK?=
 =?us-ascii?Q?mpuyxOrzipNzVoCpUc3W4THVmMRBS/5YHfzu2BQbZPz8fqd6girpnbddJsFI?=
 =?us-ascii?Q?lVFTFTkMpd8iwqf32HLCaiUooZsKujEQdvvBpTiBlLLhMAMm+JIMRNAQHPTC?=
 =?us-ascii?Q?7qeL7/MrhESnO2xaQw2p/5DVnSXVC/PCQIUhffP/q5O0Pljs04onrTaK/7bT?=
 =?us-ascii?Q?KJHsz9/fVA0BznvfnIS7q87nezNyMzuUvPIacEjzXzESNMgt4twTtXaSLsdJ?=
 =?us-ascii?Q?Jfj9yhHHtXFyLOvslxriepnhNCemmwr+nLEPAZWZxFwxYI4W/YirOSod5Fqb?=
 =?us-ascii?Q?XpQqPAk7rkpBhUQvPNsrIXL6xmq48qc2y5o9EO8y4K7hkm75a18S9zcrxnoT?=
 =?us-ascii?Q?7c6QSprSwybKS5JdoNs2gPXl6pY205SOVjjHc6cOnpbkBWdWzJBs1QvsdORJ?=
 =?us-ascii?Q?3Z8Ox11i7XpHpG72lp2mjVz1ije1boE9SV/2S8UWPLkhiIwqLbC9HZlNruRB?=
 =?us-ascii?Q?xkSOHDIolaqAHnr9IQry9KebqeKHYYU8cdBw0dPwROxrumjZPugDWywGrA+u?=
 =?us-ascii?Q?1m28AGv9HqUKQmXX36dbXQL5WX/0xhvotPrVE0gbF9cK0UV25U71fBuw3V6b?=
 =?us-ascii?Q?IyZhFLeDLl+Q88veHDjq4p+2KAYEOaoV+se2fvgBFtnA55vDTxuM9J8CrBku?=
 =?us-ascii?Q?mOb+t18YJWqZCq1AGdvZUQQIVEnaNPGCWxEYDykGd8Ms4P7S8QKAUcaYVUue?=
 =?us-ascii?Q?70xFIy9Fd7TTrFYP9q4PE0qxvMhptkpkV8HcXC3if3fcoe4ZdLiPTwdX6LFR?=
 =?us-ascii?Q?7f97iu96X1xx131HsThZpnB07Yzm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Csfjd2NflO/QsjBfrvrLEhKvo8P4G3gKgtjSJM9Wecz7L0jA4+C98e73jeVC?=
 =?us-ascii?Q?pnQKh+Zn/F3wFt8/0S25edstaVUtnFdX2g1wDEqJS96C3qbTMRmHEZgAGe2u?=
 =?us-ascii?Q?AkeN5+Umd4w1ER21GyWYAAZhn0iYwnqpomVifSNxnvgtKJZCeUTffaJ8S2fm?=
 =?us-ascii?Q?aarH5kq4/KojzRlfixHwR7WEaZoJEi5FLVJf81/ZOkTKiZgpOKo79lsOrX7V?=
 =?us-ascii?Q?LlA85okF3seVlnlhUzgzV0zVnNoyZDr3vhnogw537wO5XMhThjp6hexDeu65?=
 =?us-ascii?Q?9lITvcjmN8JerfJE5t0tTzrom/R/QfX8uLSWOjr+zr9nUm349cgWOVHUwaB4?=
 =?us-ascii?Q?vxaoUtVqkFRdQgh3xJ4E50uQD+fVu0uTkSL5L4xE6upnV2bGf0go69QLSMlw?=
 =?us-ascii?Q?pYtKr1i+1CPBJ0ArLfg+dKEMdTRZfIJXg3HXLywAbGyJCffKPerZVbAolT/8?=
 =?us-ascii?Q?q8AvuqHhduKgWju0oSJP1BKoxDaybLuuqV8nDT1INBsf4khppgaTHUCNx2he?=
 =?us-ascii?Q?e7NOeB2ex6Rl9IkzOu+/NiK/mvfpDzFaid7WpS9zHJBCDreVY3zWW8/SV/Id?=
 =?us-ascii?Q?sASOl5BZqCX58rzgYejcXGxBIPE3/J/mFZted/daqYO4H1QQWsxe06877/57?=
 =?us-ascii?Q?iayi6i4znwqXWuNcH7wILiSUetLjt0r8EPB3/5IpZnmimGz0eg+xBmMo0mdi?=
 =?us-ascii?Q?d8A8egx0Xn3A6//neIZsE+gkFzd20wVB69W3hO+rEGmTQ3yVtlv3SxuLXggP?=
 =?us-ascii?Q?0KyYQa+G8EjxidihK0X9hJyQODqMgs/WIqIp9sLTwmD5yWPBfDtsx81puy8X?=
 =?us-ascii?Q?n5EXUN1MDkUtpPWLSBO2T85YwwOQdwwcnYoL6zNZ1t0JlnJF71lDyas0ECnt?=
 =?us-ascii?Q?yIxv8E+OB+6F6N83ZOFq++7rvit6yjeBGwndKiYNKyFPM4DpFxlbObTJIWeK?=
 =?us-ascii?Q?bn7IOY6AU6R9ZLeco70WOIINBc9tJ9ZBh7WKAwKMRhxgWzuBvbtfM+8UlOmo?=
 =?us-ascii?Q?LsXRhTjOOrOjKWcT8tSOA2PWNQBlpIjq0yLR63HzhcUcw1Je/3+JeeJv4tjf?=
 =?us-ascii?Q?5m7vmAGnbqdH6g8j9Nw448GRdVAwcuzYkCzXJZeC3NG31pMV9Il1zLEUrgup?=
 =?us-ascii?Q?oSCtIRpgqlt6pOy6CUYEmsZt0pdC4mWjoEZeeQ7c6Jz7Gb6wxXT/QSOa5ftY?=
 =?us-ascii?Q?0Z2J0Cw6Jz8f0p4TPaCqNNUK3cyMzan+VXMYZNYmIcwsWz5L9tLyU7yOrUPa?=
 =?us-ascii?Q?+uWU9vJQF8KcSRr4b7nIvqWT2pQ/A/4+cdL5mszEbNjZqbxit1dw9ZIwI0Tm?=
 =?us-ascii?Q?yEAQJtF8BlS/GC4J4NWM5LhXV5K6eBtVCmOHfqvY2xpupn6mYN6C2JZslfqK?=
 =?us-ascii?Q?B4uvjzuIAXkdEDvVH/a+W9to+E4yiODYytUOtHvl4tFNoEn+9QghBUoxO5mR?=
 =?us-ascii?Q?rOKa+Z1HhjV7o+OE7kbLFKY9nl+XuwKAqMs13OvUke3dHKBWk64iOVs/6Uar?=
 =?us-ascii?Q?04iFA23GadBS96+w1PoN73egDO5p/ZCyH75awA6S/4tQGz3i+cGf9660L7jB?=
 =?us-ascii?Q?wkHSbW4EqsarDNuI7fq1sVboSgYWvXD1VGUsn2x7Q8bFr1kIF/M4aORQEBdi?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vIDixoJLr3e6DJieglcPOfGjPBrZwJ8BiFuZkEw0Qr8TwZYTyYdJS0fWQZYBPwRSCsfdKl/s+jsgeGoQ5XH9JTq5+XKyhjTZgVCONTCGHP2dRL3EqApAGtG0ouOdFxGHCeBgEx+wx9Vc+77RSk1khIv5T/rJhGrDNSDEJM0/1F3Ppzant00I4Gh8joDhennvswxN01lEYlcjMK3QGVEeWFLT/KEWjBcYXMzfrKZNehiHqyalLLOl34wgzq0yuWycDK84tiR8vxJFBTjIixMtklb449mKPfyhigY6HGlPQRC9zIz44RGF5FiLaIR73+aW5R1hpKMmHWI6omZkM/NsHWj8MpQn8MHP6AUyC0yu4ybbVO/tb2dG/+25LKvi61aEM5T/Z8P4P2MU45N2FtR5yJEwYpzvI+PeZx7sqfsJ9GW2uTWcOcT33OxozwE+2944uPYBGNmOJ7vvT9MSMro69yQEgaBdFgbfbraYPoE71KHJOTLxmI5u67gIeJ97TCDEW//e3DBcbpHyJyrdaaJTK/hxW2ph9v87VC0d+rMWVm0xcrYLrf+OHCuq8AE3FYDs/vsp/rqQuj7kzhifqrSVez8jLTZLP96r+UWLCIy5Tog=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0282bf40-f1b3-4328-1a83-08dd413d593b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 14:49:50.3681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xFx/ak1QTCHVBKQzsMlrsXeMmKxPI4Z1anZYMoU6BBf3YanQHnGgCshca3e0YwVepIkt4xTtGTSlueWYQpdoummSJI/sZguoPywLJZ/B5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6843
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501300113
X-Proofpoint-GUID: YbWELAG0gndfcHAGNFShPNTT2j8LUmW7
X-Proofpoint-ORIG-GUID: YbWELAG0gndfcHAGNFShPNTT2j8LUmW7
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 30, 2025 at 03:38:36PM +0100, Geert Uytterhoeven wrote:
> Hi Lorenzo,
>
> On Thu, 30 Jan 2025 at 15:09, Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> > Having written a ton of test code, I've unfortunately encountered a lot of
> > this sort of push-back and it's HUGELY off-putting. Writing test code
> > should be ENCOURAGED not litigated against.
>
> I am not discouraging nor pushing back on any testing code (on the
> contrary, I test every single new kunit test that appears upstream).
> My apologies if I gave the impression.

My point is what comes across as pedantry often seems to arrive (in my
experience) in response to test code submissions.

A wag would say 'isn't that true of all kernel code?' :) but my experience
has been that there has been poor RoI on the kind of feedback you get
vs. meaningful benefits to the point that it feels like letting yourself in
for yak shaving.

We may be terribly misreading you in this thread, but it's in any case how
it comes across. Obviously this isn't helped by the context of this
discussion!

>
> > The truth is far too little kernel code is tested to any degree, and this
> > is part of why.
> >
> > On kunit collaboration, I attended an in-person talk at LPC on kunit
> > userland testing where it was broadly agreed that at this point in time,
> > the xarray/radix tree tests weren't really suited to the framework.
> >
> > Therefore I think the healthy means of pushing forward with integration is
> > in sensible discussion and if patches, RFC patches in collaboration with
> > authors.
>
> Good.
>
> > The unhealthy approach is to needle one of the biggest contributors to core
> > test code in the kernel on a thread because you don't seem to want to cd to
> > a directory and run make.
>
> My initial issue was that I could not find out where that is documented.
>
>     $ make help
>     ...
>     Userspace tools targets:
>       use "make tools/help"
>       or  "cd tools; make help"
>
>     $ make tools/help
>     Possible targets:
>     ...
>     You can do:
>       ...
>       $ make tools/all
>
>       builds all tools.
>
> But that command does not build tools/testing/radix-tree, so I was
> completely lost.

Right, I mean this should be easy enough to fix.

If what you're saying is - make this more discoverable, make this easily
buildable from the top of the tree - then sure, and I expect this shouldn't
be too challenging.

>
> > Why is this relevant to me? I am the author of the VMA test suite, on which
> > I spent countless hours + relied heavily on Liam's work to do so, and
> > equally there you have to cd to a directory and run make.
>
> Thanks for your work!  One suggestion for improvement: tools/testing/vma
> does not seem to be built by "make tools/all" either.

You're welcome, and right yeah, should be relatively simple to fix.

This kind of straightforward practical thing is fine. 'You must use the
space wombat with extra fireworks' type feedback is not so much...

>
> > But at the same time in both cases, testability of key internal components
> > is ENORMOUSLY improved and allows for REALLY exciting possibilities in test
> > coverage, really isolating functions for unit testing, enormously fast
> > iteration speed, etc. etc.
> >
> > I ask you to weigh up the desire to enumerate your misgivings about the
> > testing approach used here vs. all of the above.
>
> I repeat: I am not against these tests.

Good, but I would also emphasise what I'm trying to get across with the
wall of text here (sorry, that's very me) - let's not get bogged down in
the framework or whether it might be preferable to have it under kunit or
this that or the other thing vs. the enormous benefits this stuff brings.

Sometimes, esp. with new approaches to testing, it has to be at the very
least incremental.

If you're saying 'just get it documented in a make help and make it
buildable from the top of the tree' then fair enough and hopefully not too
difficult.

In other words - we are all after the same thing here, let's work towards
making everything better, and not unnecessarily throw unshaved yaks in the
way :)

>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

Cheers, Lorenzo

