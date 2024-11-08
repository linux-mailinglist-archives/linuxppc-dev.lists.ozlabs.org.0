Return-Path: <linuxppc-dev+bounces-3066-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 580399C27CF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 23:59:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlZBt6cywz3bn1;
	Sat,  9 Nov 2024 09:59:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731098096;
	cv=pass; b=dOc32zm0i725yp5+ia+UdAl4nJNmlht81K8y2ovFVwkJ72+z10kuE6YZrDPxx42aMfEJaQWoNLCNOLQIz4fy05ZIW5BOvZXsXDO8B3EaZr53IFL55ccqP0osk9XrAkXxs930KOAyDObo2jfSF1aYrlthGoaRvNaUcR1PQ6NCcQK8uVUlhRsyMVOl6FKR47nvQ3eCdpwDm6O0SWQqGosbKfcF9W2n+XlGVZqQb0BEq4gAmf1xB93ZE69Ujnh0cV7ZBkz2S3ixkPQKUi8kBfb7f02UC+UOUkr3wR0W4oJiiomlH0g+nr6pugVN/IsjbbWz8GY2Fuu2venro0XhuzM+wQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731098096; c=relaxed/relaxed;
	bh=mc3n72F8friJYz61Zi+5OikLM8CQHFzn43gKU8gOsvk=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=ISgI/LNS4vs1hMs2uxmS42z8/GVy1N+VpjjUFt584I/SLZX5xRekPO2SIfyaBgO8fgATszvWoIDAGFbUgDUimfx9VZcK431nhlbHXuIAYA2yuvuxXprV1beSwH89lQE6EsZxHVlGXRoAGkBNDjKrBGuqCifqeAEFc3C1M9TQTA704UQmrDsgsGIdLWMhXQKah7fbgkg/IMjb98Ytw2D9pCTw/NljmRW4Y4bYjmlSh+Zt+UFjKkM+crZYFcgxFWI60cleOfZL+/4pfXpG2/SIw9uT40pQ7QZBHNTZjgubZT357oo17n2xHtyjJl2reK60UUi+FCxOwzibybEJV7lzZQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=YAxohqaN; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=kwprfi2O; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=ankur.a.arora@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=YAxohqaN;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=kwprfi2O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=ankur.a.arora@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 5262 seconds by postgrey-1.37 at boromir; Sat, 09 Nov 2024 07:34:53 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlVzx6xsJz3bdD
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2024 07:34:52 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8FtXH4030949;
	Fri, 8 Nov 2024 19:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=mc3n72F8friJYz61Zi
	+5OikLM8CQHFzn43gKU8gOsvk=; b=YAxohqaN2DCUtLNhX8q+ieWpdHLbOxnSHZ
	MI1l0zLmaWm5zTfwH7a4IN69EA4+2SSCFjI3eJOvFzjdM02pa7gzqKQ+8vPZKpvM
	mxgnJEs3WrQs4w6xX1NmSQDuIZZjvpbX3UQ3deHubyO534w38HDrTFQ50FYd3Ezf
	tXrf9NwPUOi86AvjlDPJEmfsyzcbSgI5oI5B3ptt+v/nM11hLyyPzK0dBaB+YZsS
	NQ0MI8fzUrifN2MRgedSGbVFMq8K3Oebupgcba/JqFhTfRWpohLwnAqG+VWvxeeh
	mysc3wPPyYZYjKuOGw/ZU/jH5z88RVCTBZSm7sx/1VA0pP836tWw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42s6jx28c3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 08 Nov 2024 19:06:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8IgncL026810;
	Fri, 8 Nov 2024 19:06:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nahbgwx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 08 Nov 2024 19:06:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jI0z1kLQd2h/52oPPo0uRi4XDkyURb3JHWVndeH78ADaYVyeDPg3toz7t6k4UDez9EycWQHvmuDkRF7I4B0EmgB9JAksPepuJJLXWK81to+JXfnVntjFosRrEBxMRaGru+7qbx3QJJMwvawpzezpuZ1O//oLIG/m+wlUat4OOooK/rUdn5uLqIv56jF+GkzicxATqnU7NiRoBCwkB03oYcLtC/vOQ7cYubrBDJAwy1euURl5GwbpNczv8f1MHyVQvQuXkx6vKghTFnyWGjUqC7jf/HJacdg3mO39aPfb9Up61G1l3gdOB39RAg4+POp1bK6cprGrVJU8o7gD21xTcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mc3n72F8friJYz61Zi+5OikLM8CQHFzn43gKU8gOsvk=;
 b=Q6YD62m25lQEG6bkfpXxLaUDcCHztKTSBCZggHCtkXPjsO/DT+pMSgnmk8Cbz1vQbIOCUo/nN7JNPr1ZcZaD2+MacPQjhCHhNorVkzKSwaXvCYQg42yUAjJFtl+f2oU/1WkliGMO/hvBMrlB2uotWxx2pdFH0094MrQSzFphws1BkCmrZlJoPsjOsbiPzghaF7pxaVCa/eRvPoZAJMttQQumvqcGdn2Cy05GhppKr7GLvsnOcrSP2WDTd0flvl0eF4Uc3Ep5Caou5y99K1jhdQk4MkKpsL/5fCYbA5utoIqtCvUGalWY0PXvbkZfyQPwofo/09yWI00X9uRzGt4HZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mc3n72F8friJYz61Zi+5OikLM8CQHFzn43gKU8gOsvk=;
 b=kwprfi2OhKX6OTMA0oScH0YAn4rtO08TWHrD5rBa1dwEdoDKS76Sm7RbJB5BXDvsHGjlct3Cf1pp87pceDSypQjARP1DXYVN2ss8rhTxvWHsAYwVaWlzzAC2RgaB/6jhvFa4WS8jrQ+pSfRMrTNyABn+D6XR1HgFjWmuc88DMCM=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SJ1PR10MB5980.namprd10.prod.outlook.com (2603:10b6:a03:45d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 19:06:20 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 19:06:20 +0000
References: <20241108101853.277808-1-sshegde@linux.ibm.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        maddy@linux.ibm.com, christophe.leroy@csgroup.eu, peterz@infradead.org,
        bigeasy@linutronix.de, ankur.a.arora@oracle.com
Subject: Re: [PATCH] powerpc: Add preempt lazy support
In-reply-to: <20241108101853.277808-1-sshegde@linux.ibm.com>
Date: Fri, 08 Nov 2024 11:06:18 -0800
Message-ID: <87fro135qt.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
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
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SJ1PR10MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d04833b-1f6f-447a-ecc7-08dd00286e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5QcF3q3IJeDib00vPlaRfn3SXxJsAuZQBzaOXbqPg41Dxch1vQ/lsjU45WMV?=
 =?us-ascii?Q?lJemtG+rRPA2MYydICmv/fqx7wZYODb1DH7e5Qwzyk8oc0kjXK1Tj+JrFUd6?=
 =?us-ascii?Q?Ih6Ik9FIQGp2DvkFS1ae3/HK1qy7TJ7hesniEk7iiewas0fhc6933Fq7+LWX?=
 =?us-ascii?Q?IMvksrsjDll41+moCIRr6A4FdjZWlNZhOVnccg4R+WrhojXbjxqSVcmjazls?=
 =?us-ascii?Q?5oDErprkbdKcjvoWk215kBJMK+BuW+jV8C8h2wwNsq3bK+ElVbeSliyBxQZw?=
 =?us-ascii?Q?PiLRPP6nwZuXRlKKn/pBSngDD7OKe5YJOie7yeKhMGk0FXBkCZ1cCFBynmLi?=
 =?us-ascii?Q?bA+ef8KMJ6BRmrtze4kgmVwJT0tppJNq+J6YuDE3oDMrylQaXj4wN6dqseXy?=
 =?us-ascii?Q?bDx++JiDrPoxHpCYK5LJ4XQIucBhZXZWls8TJoqr6gyCAG7W3SAUSnFsR1UI?=
 =?us-ascii?Q?mB+EgWLVdJwEvN1J1K7DeH9TLr4mEHpVzP/AKGsN0ZL4gGPJ5tC6tRyKWzzo?=
 =?us-ascii?Q?PSBFGFP08tLc8rAYSUw5r6UH1q3uc/TJWvT03jk3ArNGmOp9QA59aEcJAhwP?=
 =?us-ascii?Q?3jkLLTYwJsCBjAnaKMkc1ciVEgiKHoPjop2mI7YP3TpalYHXpdgKb0owB1Qz?=
 =?us-ascii?Q?P0DgKAoicJJXoGFHP4o3o+F3bT8AIIVb/iUpZCEKuTIRH0lNun9CI6+8I4wg?=
 =?us-ascii?Q?3WSMBVHHLIxwFTCvom3AFVx8dTEaqhH1qMzDgRSzLcqMcNUH0sh1I1oEdeJh?=
 =?us-ascii?Q?jMQUlsWe91MtJa98HvN0hiRbajOef22dJTrXXUXk3hLm31/dJq9Y0AMC5hOJ?=
 =?us-ascii?Q?O4RVfuiIDX2wc2PnIOm3sxvoFPThM3nXaZNbqBkO/jUd5/n99q8IzIpAGvAV?=
 =?us-ascii?Q?I9p65Z48/ELfNa2C4LQs4OAJiAA09N8wkgxkoVZXZW+GzMGPPkOE+JGkkdqI?=
 =?us-ascii?Q?ljSKQQNpMwbAwdnuAPO04mfCGCqRJxJun7hz1sQzSF0e9muB1SvgAs3KcM8a?=
 =?us-ascii?Q?4YgvnJ2aqnCsp/Yy/WnD1HpSVvc1Q1r8vjPGNwOA4IQVCiDcDVrHPgCR1cjh?=
 =?us-ascii?Q?fJ/x/6aQMKW1IkNJ3HaLVJuGBIf1HTU792IP/u05fymfNSX7DYUq2dtD+K+J?=
 =?us-ascii?Q?ttW4ZXIXNfkXhbGyRNenilNq7xAfqp5Tx8l4H3EQWE6EB4mdRvDK9N3Zawb9?=
 =?us-ascii?Q?d/uJvTkTQCARo/K7V15MJkqTGgrxTb4fdRk8hY6TPmZMOaR1mtXQeNFOk7d7?=
 =?us-ascii?Q?eJRp0dq01z2W2t8Fjyeg7+sLasdn3edHXvmtLyyVvGqvHOX+PfSE7ps7aJ8A?=
 =?us-ascii?Q?r5VQw7x6aWqO5ISettSAEkQD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e+sDBfpTZ5jA2/tMBSBRKCX8hSIURiqgU2+CC+4g8uVMCxeSQYUMPu+EwfLo?=
 =?us-ascii?Q?8pYgJQQlal0aWfrEUvVGhl0nIs+wDc2Qd8xLpDJkS80O8XTv9Lmg01havJRu?=
 =?us-ascii?Q?k4vRpUHP9Y7B/Gk34VYQyLQbohwjURREqmxgudsauLfD2OT8Af1nCE6n7peS?=
 =?us-ascii?Q?uFIb0RJyZXSCi5j51jky4OhoSaGsXw/vVADrizhfZ/BQe5Lrt5oRqeIESuHg?=
 =?us-ascii?Q?4l6B9foM4LB/UypnJpe+rE11R4H3HLRP/Cl8Pp0c+3zNvWxkW9KVdXNgrgJg?=
 =?us-ascii?Q?bHCL0ThBDa61fS6WRbLvadmLiPx2YlgI+RC2eSCtsB6pLw4DJwG7bcokNUFI?=
 =?us-ascii?Q?yeEnBy3mjLdDg7IhoDw6/UJmW38UqDJXSBVgbwTq51FgRaWgGe8MZZc6pqeW?=
 =?us-ascii?Q?yznBiUJvv78eI1YliJ6h0uN5XtbZJ8PadFcFK0KZ0uZ6n95sEyv/ETriu1tI?=
 =?us-ascii?Q?JZ5kbNCMOu/9DzoAm+2Liw5TIdmiBBFOmx30lR0wPrTDBrT6GubGvLK1P9+y?=
 =?us-ascii?Q?PeKrC/hRYeStsA+zi+1rdXTxzOm83D29pLDIjQBdgWAt+UROSBLM9Wj3GpOZ?=
 =?us-ascii?Q?crceSFfzCnwOb8wi5Gj5OVGHx91kJAvfqDxK+lyVivdoT0qlLYmXf3iXcEod?=
 =?us-ascii?Q?rW4czFu5TKp2enF30P6CR6S/dA5+uy9mKOPt2ww23GMXpDtw4pPfFAgDJtj8?=
 =?us-ascii?Q?yLmw5me7qEA9kWEaRBq5zuycDkzLJ7ysWBeZB52BgO1wY33m3C4ebNykaiy0?=
 =?us-ascii?Q?LUPlhWcm8oNCnEAYLJUm/nkUPzl1OFjNdXu76iIb+sO3ZqwRdFEltYBZBWW3?=
 =?us-ascii?Q?UFvIgfgEg+7xinajulkbaojZ7FybLmQiJ/wYS99PDX6tCtooEUV36x4mkkRL?=
 =?us-ascii?Q?Q8l/oZiSdUvqEVIMd73198nTcJT7QHVGHs8uDbC5Xu5kZ+h0eFrKtTodhBuf?=
 =?us-ascii?Q?0ZCIQl9MCt+RjmmLSRYEvoGwkhveaP5oON9An5xkGgTRxeHRC2Ecjcb1dal8?=
 =?us-ascii?Q?W5N4Vuh7ZpzU0EpY1olx+YsG7yrbPHXAOd2xAeHyEnVayDlvXNsFJszHoYR6?=
 =?us-ascii?Q?e3etvOYtExML9kBKpIqylVeCsQj/7Jc0RUN3I1FxYYUBukB9oFnrPmtlTqqz?=
 =?us-ascii?Q?MLAwVeokcKFWBm0b3mCiVvt4/wD9nzpINVHiNf1BVKs+e/nq9Acdyu/w29qM?=
 =?us-ascii?Q?qg/ZHb7PU+8DCsRw5gUwRUASliYSbwG1zzpn8X6Oddx+11Cw/oPY9+Et798V?=
 =?us-ascii?Q?0TkKpYasJT7VCnlygc1zXsJPnFNpuiUp2j9myvFqMeFNyY9YlW408Jd7PzX+?=
 =?us-ascii?Q?fJEe34gIhHAtgAW2GlRVH+Ywvn2n2pz4jnPp44H2wt7ZVmHv86TDuv2HP56S?=
 =?us-ascii?Q?pWTPauiWT4JgRx/s7xa0oXmL8bcpP/0pk5dCBkznZRZTFDkVcUM4T7HLMlJP?=
 =?us-ascii?Q?YKOwXiFuJyJt42k/D0f/sPU0DqMX2Z6810MIFM08ZGcx7u6EEOIpFjEu6Hcu?=
 =?us-ascii?Q?HnTQZkJwdOdDttPLriYkNYQcQ7vL0DllbgXT2uH7cqubiKJhNNjLV6t36LVF?=
 =?us-ascii?Q?/rqUhcwBQkNIZ9Tm6X1WR/SBOBXZh2vlyNYO9jor5AzvMF45KrSD1kj7EqJH?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	maArGYa1O6IpnKbDiGUKcmBjVw3d40zmKpOzrqgxhuSVCkF9kFlDQZcQSPMTLVtu1lUNe5uk1aiwDaE2In/lCtN9TOEhrH2Lvzz0Al/06pW0sWgMXAJU4kBhTCeCsCkq15hz5jzzUqUEfytc3par69hur1+RjSMKc3E1lMmBmR9tFyDWQloWgNREF1qkc+6U3xOmDZ9+n77ug9ctTf9SVjBO+ZFFRDNAoMyzoPHs9gwi0wQZIq3bkXXJteDrfTlOd7+lEDieHzW29fibXflY50rAQMUinAxwFsQKRv71NoO7KEnfTL8xoNmf+lcTvHvfAjV6DFuh2CwoJAjcoWEEksWPxH5pnx7lLTKOAOI4MOqZc71/UBaDVjjXsaGm3tKCEX5gq9KK1ni3ONPTsqExoPnhvbJHNLCu6gSEUB9HIU/1tILLfjIKRRoFLscrpTAonfDnYQiWga13Se7T7xGmyuKFDyXgk4NI3kv4Ei9V/xwrG+tYkjty9r5qcEIRH4y+nCp3YmFiTKalpjr+umpb2wVslZ3phxXU93u59HQdNPKKQesTHFJI0azO4JoX4EcPUGwzknJuM7B92/5uzbpR/zgqv6PnMKVhBxjoP/iQsbM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d04833b-1f6f-447a-ecc7-08dd00286e01
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 19:06:20.2629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/u+y4Ce5502WrMwbPaI1zIwa1f1finpJr5GrtgGZoC11T5x7WuHGPkjah5xChJkDB1/6bjTeGpxKnHqbDZbLn8Wyb7vvfh/617LXZFicCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5980
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_16,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=855 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411080157
X-Proofpoint-GUID: dj_8oTHo3FrTweq_N-8WxvyPYIWYiYbc
X-Proofpoint-ORIG-GUID: dj_8oTHo3FrTweq_N-8WxvyPYIWYiYbc
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


Shrikanth Hegde <sshegde@linux.ibm.com> writes:

> Define preempt lazy bit for Powerpc. Use bit 9 which is free and within
> 16 bit range of NEED_RESCHED, so compiler can issue single andi.
>
> Since Powerpc doesn't use the generic entry/exit, add lazy check at exit
> to user. CONFIG_PREEMPTION is defined for lazy/full/rt so use it for
> return to kernel.
>
> Ran a few benchmarks and db workload on Power10. Performance is close to
> preempt=none/voluntary. It is possible that some patterns would
> differ in lazy[2]. More details of preempt lazy is here [1]
>
> Since Powerpc system can have large core count and large memory,
> preempt lazy is going to be helpful in avoiding soft lockup issues.
>
> [1]: https://lore.kernel.org/lkml/20241007074609.447006177@infradead.org/
> [2]: https://lore.kernel.org/all/1a973dda-c79e-4d95-935b-e4b93eb077b8@linux.ibm.com/
>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>

Looks good. Reviewed-by: <ankur.a.arora@oracle.com>

However, I just checked and powerpc does not have
CONFIG_KVM_XFER_TO_GUEST_WORK. Do you need this additional patch
for handling the lazy bit at KVM guest entry?

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index f14329989e9a..7bdf7015bb65 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -84,7 +84,8 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
        hard_irq_disable();

        while (true) {
-               if (need_resched()) {
+               unsigned long tf = read_thread_flags();
+               if (tf & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
                        local_irq_enable();
                        cond_resched();
                        hard_irq_disable();


Ankur

