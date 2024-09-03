Return-Path: <linuxppc-dev+bounces-924-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9D196A5A8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 19:45:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WytMF6z6xz2yMv;
	Wed,  4 Sep 2024 03:45:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725385545;
	cv=pass; b=Sw/cfK+Q72GPvnk1OIzo45t1TC/5s2UAC4HWcR+qsqcCSJQ/kIc2heLyddm6dic6YueGuiWM4ySF8rphvLu+6Xa/7I40zP7vscgR3bGxIZSjQAzrY0fpc6WJVu0pnD5C95Qiac7Mc2q9fwYahNc+BTJTPv4Fb70MUuYJXh2eERYgP+O04cs+HwTMsxsDgIUYD+CiPVB1RXOgiRsHNNgu2xzEjfRMJjzftGO2RVQjdULF3iKvb45+Mcv9bvX+z5cSfjWjCNAEzVEE+bExF1bWngmpUVzD1YyLXIJtHpfIl2NQgZHrJYgvZAcp11romYg554/gf9T4WCCSUYwPVFx1pQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725385545; c=relaxed/relaxed;
	bh=KyGxTCX0XFsLDIgNLPfd9w1S8KOSim9cyw+d476F8do=;
	h=DKIM-Signature:ARC-Authentication-Results:DKIM-Signature:Date:
	 From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eXy6bDlTwpIm3YSqxOuht2ZCpRIxTyFH72K3dPDGKd1S4m/wDMIj26Bk9UkpEeDDN23CZAkmpcT8pXKjMZhuA9FrT1ywTM2LIYdaUp1FYakGoJivqzMIsQpDorhRHJ6ELoZhB7WSoQr5djf/2nY47NauPzk6jeCZFzU2mUBuaGnLN9WmGNGIu3SwOiHlDWv4fQxoT6GAcwyhKoiKN0EU+hxudpie7sPc/dc0oKHq7ysTSTo3LPo3z6caOehwxB4UL71O1iUb9ddXn7FAq9iF6jOYs9bU+ooW//BlWFJjZ3Fzn1f53GLeNVXPJgPeLgAbguikbUWB2zgKyJefPuwQgQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=frbVYPNK; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=JQnXYDu5; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=frbVYPNK;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=JQnXYDu5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WytMF4T0sz2yMF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 03:45:45 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483GtcKi014447;
	Tue, 3 Sep 2024 17:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=KyGxTCX0XFsLDIg
	NLPfd9w1S8KOSim9cyw+d476F8do=; b=frbVYPNK8PQtumuiJDWGPD2ROU5KX0s
	xsO1Uh7+IGOgDJAmHd0hxZbeeeaHa0buoit9ashvZ9taYMMH6ZDXpTjOngueGyMy
	+oJRVLVVPV26xRV/K6rPdL9Kriq6MXabt85T8bDL0xKOjmW+rcLiOPi0iz85lcuY
	dCDPRKoGHElR4UdHvJH6hL8hZvU2bWpm2R4vEA95fX3xneb94stmR5oAjRmXE7+/
	mSFK5w00XE1hgF9GXmp1ixHRlpYlsBfQ1RzOzaDfbXXZZiXEnKeKBTKRM009iCP4
	vTCHVxCshae4JDkvLiotavGpg8viRe8sgRyjC+ovLfDPvWossUMxbgw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41duw7skqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 17:44:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 483HJhTF018333;
	Tue, 3 Sep 2024 17:44:58 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41bsmf1v7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 17:44:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUNeyT9/alhQ+vGeWSxld3Sok0EevjTUPoGov/YBFirWhCWTq3WP/PjPLiHQPDwAJOIhf1t6z/jNXV7xneVrXkGCH6z27rE3b3tCkTJ/rNwaNc1Am0wBYxiNmwZCPdBR7ICu2W1LcN7oM2xZwmpCuW7hwuoQMc9PTu49T7vBjbwcn/ItJr6BItu3htPGD12ifz55ljMyRx53PMP2zku8BMmP879z18i4Tw+7qXAmJiJxGNRBygC40WZMetFA/szI7Nt6Y2Txwj5bZjRopRTQG85agOldXd8pggtzpw8+GgjfIQxHVI2+RBMMOoFQUhMApHzv9Q8xc5zG22uHjmAZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyGxTCX0XFsLDIgNLPfd9w1S8KOSim9cyw+d476F8do=;
 b=bV5FwnUxgOIl1LRobDLUf/kQpakq2xBIfY9h7E/fJgWvR1VH7aS1CwC47HIfhHJSkOIsY+0oGSMPN6n0EwCPLZ73Zf9DqCrkPeigmiQOBGNIr+YQ4lcJnfmVyia+uUnHGC9bLU77eNX5Pgw0nXyKxh3kOwIL7VAs3HRefLlJwNrEOJXP2DVXeshRDbwiDe+2OUneghwIvjM3MMXg1E6iZTbI6VDdXUjLXc75JGNuPVuKVAsU/sKtKvWK8n7fwxi2nsDW5rvCb0WYiXvtinngP9sRhsSOtQx/QPcjq9BxHT0CxhefKJWCNHECerw6c6tQ5pm1O03mdSGeGGwzV1o0lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyGxTCX0XFsLDIgNLPfd9w1S8KOSim9cyw+d476F8do=;
 b=JQnXYDu51yEh0F9J1Z4j2CnXv+/KGzXSm6CC3sW8Ch7PjnzaLK/RsDYfvmODs01MFsNxluvnYDY8r3xZPRGN7UEaivprcez1NnZGMyJNbfCdgZaarcobU92QA6pqRiw8Nvam10G4/2d2bw2NDrjFd+0tn/l+OnxZPikBNuBg3t0=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by CY8PR10MB6801.namprd10.prod.outlook.com (2603:10b6:930:98::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14; Tue, 3 Sep
 2024 17:44:54 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 17:44:54 +0000
Date: Tue, 3 Sep 2024 18:44:50 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Deepak Gupta <debug@rivosinc.com>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/3] mm: Pass vm_flags to generic_get_unmapped_area()
Message-ID: <ecb9925d-67dd-4cbf-9f22-6279cb14743e@lucifer.local>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-2-9acda38b3dd3@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-mm-generic-shadow-stack-guard-v1-2-9acda38b3dd3@kernel.org>
X-ClientProxiedBy: LO6P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::15) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|CY8PR10MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: a343aefb-c8ff-4967-e114-08dccc401e7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i7+96e0II2pylXSHramRWhDhN+jhVNIUUoSvbn+kU7FZMF/bmWlZNw9rUpKs?=
 =?us-ascii?Q?y/A3vKyg9Aor0a3A/WHlinph0q/aTgaC2OoTxhhD94gkv3uow9AX3sIC1vPu?=
 =?us-ascii?Q?zSabbH9IuswseTi8JF7XmYGzH7rHgmyG85qHDznZHfMN2ei2MQuR6oc+vcHN?=
 =?us-ascii?Q?GVrVlFG5Hy83oCS4KfVKw4l26yTOSLHSRfTngjyZQ4ghK7d3hyAZRTML6ijs?=
 =?us-ascii?Q?9rJ1j4ukpvS8yY4yAXReIkTRD/z8pTCzvfF0pTFuP51GgWmhZZ5tUAsD7F/4?=
 =?us-ascii?Q?T5hsPp+kWtgjHh0wWRmoIJw3TeSA405Z3lfviLrdW/Rr+FqqH1ekQRwmyOuL?=
 =?us-ascii?Q?iNXuvTIyFlm65iBZzrOPKu/JbylH/Y7oxTSMMBzYLDvwiD9midJnkGbcqsJs?=
 =?us-ascii?Q?wZuQ87k4mIwD35NytSa3Vj+BwbGMYaINWmIYGKICxXoS+Y6+LFOTHHGT0g8E?=
 =?us-ascii?Q?5jJO7AnnSUfaSbYwhxCkpFiUtHLeo7Rbwt3O49+j1mJp01e4ahwp3naiDxTQ?=
 =?us-ascii?Q?n1nQ3Pkv41b/ksd7rth317qxa1uPOS4efwbie61awRCNKaSv2JBm9MoWPGvy?=
 =?us-ascii?Q?lNQZFngMktLvkXO4/gHsJsFUOUrsRwjLlhj8LcASIrXabCQnevdh5JqV7HYv?=
 =?us-ascii?Q?f2swNzD/dD/G6aaOcVwgb+Y4QWkjf01GlJnIuslrgFWI3LpO8H6uMuYS/XlO?=
 =?us-ascii?Q?ji+8+I74wplPmdlYu07PvDWWFmoB5j0ey5aDyUpkuTWSjwHFxTIMIchBrP2S?=
 =?us-ascii?Q?MgN2gJLLpNHmnQjsu0V30gg8BzQkU6oMR4qQmBKg/kXAx095T1F5lQc/O627?=
 =?us-ascii?Q?aIvbfYSOrfgMA4ojbzLc3hfxWkqpow03K/4ET57ei2odmJTU1oUY2dpu/hvT?=
 =?us-ascii?Q?kXMu7ws0aITEt0Bb91Fn0kkv27UiYzUvbdqd/boFMDrGVdzmJnoZpFw0AEQL?=
 =?us-ascii?Q?iLdLGMkGnJub11JybhqHBhj+n85bIoh7F9K3j5H6HL7riR/xBcakrIXDYCzk?=
 =?us-ascii?Q?IplloaI4vEZ3KCU1Q/9KEOMiBR58BTUdmU+46aZeDb1cFGcJ/4u/pmRKJZ+o?=
 =?us-ascii?Q?DQRJb/jsgfUTbq5a8+sp57F5T5SyB8IOJRZFti9wMLzj0qVPu4R6VPPgRIOq?=
 =?us-ascii?Q?tBupJkaOy8qkTJDDL9EXnOeBj2xDY0lBu9oz2dyGxkCSaI14wOECyrZPT+aS?=
 =?us-ascii?Q?O2rgjfoyCWRjOTSRSm3Js1ZY2LKewZlL5qKQUJaryoIyhWD2Yz2OumPqGZu3?=
 =?us-ascii?Q?bu3cWW5iQJgly0z2JgSmS/3QQyCTeUwng8jFPV8GmLlW8XN0ix99Zjaf/QB+?=
 =?us-ascii?Q?5NydxcEfLa1PZA4BJ/XjVEM2TbIYDHoTHx6GSfSYJw/r7A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zbanf29Vh2HQFCbQOCH2duWFhE/DZ8QfGImHpKz83ONj/ce4sjE9+QuGc4/i?=
 =?us-ascii?Q?IkZs5NG+JEAfiUmRL0ZozIbPhUR67FmtJkyIcWDyElqHhZ06I4S3J+1K8V8B?=
 =?us-ascii?Q?78BCQi68B07c9zFL+hmkfThenghmYQMd7KuaVYYtbgk6QbBpNcowLOxiNLxF?=
 =?us-ascii?Q?kUL+IdNeW8bJnUPFgxtz44ZL1hsUwApY4WFHHM1Ibr6B2VBeCcdFFAy/9rn6?=
 =?us-ascii?Q?Mtfow/mFEC5FNa2OlvYYfYQUmRfzNELW3A/d5am+yUMJmXdJFMPej2TcgibK?=
 =?us-ascii?Q?gEz6UzBQO+vGG0SspudUnkQIOmaLhWlGGI8UuJUYXF1qSYWyxO2hcKTeizRN?=
 =?us-ascii?Q?wH3HmPwqs5Imi2u3Dzs3VhNuaJ6OCCTIo+dm7wNmwRknMyWGWmzuWna7Mqop?=
 =?us-ascii?Q?7TnrVgUrf6xGcth1VI4H++e2UaDi0T8oJmdW4Y2ekHvieVRdsYIp2UnQZxy0?=
 =?us-ascii?Q?VWQ6/HxaxjOl4KxMb1QoDgyFXMfrzXtZ6JAS0dWOA7QTzlp1wFwwMr8dN28t?=
 =?us-ascii?Q?QOf7EHDzQkEfoXeNhsZ+fJjqj4444PvfK06b+VpRmk+wZA9SXJScrFsuTgl1?=
 =?us-ascii?Q?Tf/23JjuSDv4YtXlkbOJ4fN/fO7JlmMu4d6aQQwD2ePSJ+yp8nv5VHHpyq9Q?=
 =?us-ascii?Q?qnGo5oIBRWA8APNbG4pp4IWAl58SVT6zayipz2M2NrhWcOcuhFm8uwoLx/Yu?=
 =?us-ascii?Q?OavylxT1B5s1079t/8EZXSUthstNz4+OZ8O+sGkZ6uyWTnOIA9OTs1mjpKfh?=
 =?us-ascii?Q?PXF4WvO1bFaE1IgylNfYW/fwmX55d01i7A3Ykirtggosp+OJIw0XP3OSwh/y?=
 =?us-ascii?Q?9F0dmYgD12BVb8fGdwTt9f5+9qV66itFY1oSZoSEvfZ4FrlfCO+KRp/2SpnZ?=
 =?us-ascii?Q?ImQDQa1lOLwYWndh/+67ozB1SGQHzoxh17NUKApaNl/uxiTx4U1gDR9vZHst?=
 =?us-ascii?Q?0A6c9DF1/x5khtPPnMticAAEEKV/BglZfbCD7s3g5RGiXo6ufWD3NdYMxPZw?=
 =?us-ascii?Q?cgWPzMBEGgjaKqZk5MU2rRzbFj2L4AuhdZ5u7+qZrIWmGeQti9/LDdBfPPdq?=
 =?us-ascii?Q?qLAzxdThKZZprpMPQx89IsWOUXbi9ujI7fPBAUeyQ/n8jJVcPSJH8vGCzqd0?=
 =?us-ascii?Q?ShDKfjYlEpkgU0cwzmWOmcH6Dnn/xRUdE2h+cd0uaqzmUAwoNpnxk94E+6TF?=
 =?us-ascii?Q?EfkHornBlMcYtbjxnsle916OjzVBWzoFC36UtU/UMEdWYoqqHD+XbPlObKmt?=
 =?us-ascii?Q?Sq8z78tqfs67um3MhHroQn9xkfNWdmtLxokGZiMGc24n18S6PppmKNrLG5Mm?=
 =?us-ascii?Q?MId+O0lrfLQsyh0qyPinr8Fz0/Kc4NU+USX9Z7EDNuws8WsSXVB+ttWY1Y/O?=
 =?us-ascii?Q?NWt/P8L46HptghOlHygc2zAf8kpZVcflteZ3t3WTXfaXDS8PfZ6na1KeoQC2?=
 =?us-ascii?Q?hltV5Mb8MQInkJ/9zz9VVyF9Ha/W9nTHLgflUpjF63mkqADNJuSloe1Y3OAo?=
 =?us-ascii?Q?PvH8h1oRDQJDTkS4T0mdbZ39pslJqaHOEWH1l1b281aTQD/+wJ5slyMyrCHi?=
 =?us-ascii?Q?Krx5syjfIAN05aH0EX/QpaAQwFEI7gwTLGAKpwnEuzGCC7YtgvsfHkFqV9yz?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sKGFIyUScBAraI4iIwXckUU2Y3qpTvOUi0jARibVO5kMyx6vYDVqdM4+4sRGCDRePPj1tZWvXHB3NuIU1M5huaza+CyUSnOw00RPPlz6f4XQ3E13ZPiLlMT86XZIEYlpFAqGAhI6mrGZ0UYiwXlTLsXyZlAAZV1+O7vlv4dyI+34yKMNHQnVb4gLpLFxq/ZcuAvYSqmtqP6GbNCryMaRyiqAPuZTMTlMbXm45jH1EtjPvDz29hBunBDNWpTMwi1km84wSy/OuYC/+Kfujp+4kWTKfSWoVJ6Re14LC5WWmtmNSJOaQ/+CALZyt7WhdxExLKfc1RDMB7j2JPkMiIo15Wkc9AIT75rqZ/TZNy+DihPveiklAUro47r5lrR2IvrmZbeyJOfUCP0R9NdKVHQYTUfbXG/79lOQ0v4hbQZQSe8GZI06UDRSMCUt7TmRyHOMKHZsFNO8FBQhkEYnTfnDIhalr1OhB/gi50u3aHW+S4v27AGkI2JtScP1li2CbHLSUnCxbopp7JM83qMVTJSPm3tQjUe8RmL0IkmnNt6iQwWV5T/FE1Q1KocbBhU6m9tqhvnXRXMXqIjWuw4IHw94sI2wXLIvvzTa2siYlvlEgOg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a343aefb-c8ff-4967-e114-08dccc401e7e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 17:44:54.2505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmxW3F7mT45QmM5wGxFEGy3J4+n3H9QExbAMhJh3F8rkRPdd4YX1WH1pNfJIMhPXlmHHvJPVefJq/5OSZgVVO4LgJu1hoWURlp252Ib1RFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6801
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_05,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=960 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2409030143
X-Proofpoint-GUID: e1-59FB8l4LLintqajdorAL6RFIVJ_MX
X-Proofpoint-ORIG-GUID: e1-59FB8l4LLintqajdorAL6RFIVJ_MX

On Mon, Sep 02, 2024 at 08:08:14PM GMT, Mark Brown wrote:
> In preparation for using vm_flags to ensure guard pages for shadow stacks
> supply them as an argument to generic_get_unmapped_area(). The only user
> outside of the core code is the PowerPC book3s64 implementation which is
> trivially wrapping the generic implementation in the radix_enabled() case.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm/mmap.c part)

> ---
>  arch/powerpc/mm/book3s64/slice.c |  4 ++--
>  include/linux/sched/mm.h         |  4 ++--
>  mm/mmap.c                        | 10 ++++++----
>  3 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
> index ada6bf896ef8..87307d0fc3b8 100644
> --- a/arch/powerpc/mm/book3s64/slice.c
> +++ b/arch/powerpc/mm/book3s64/slice.c
> @@ -641,7 +641,7 @@ unsigned long arch_get_unmapped_area(struct file *filp,
>  				     vm_flags_t vm_flags)
>  {
>  	if (radix_enabled())
> -		return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
> +		return generic_get_unmapped_area(filp, addr, len, pgoff, flags, vm_flags);
>
>  	return slice_get_unmapped_area(addr, len, flags,
>  				       mm_ctx_user_psize(&current->mm->context), 0);
> @@ -655,7 +655,7 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp,
>  					     vm_flags_t vm_flags)
>  {
>  	if (radix_enabled())
> -		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags);
> +		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags, vm_flags);
>
>  	return slice_get_unmapped_area(addr0, len, flags,
>  				       mm_ctx_user_psize(&current->mm->context), 1);
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index c4d34abc45d4..07bb8d4181d7 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -204,11 +204,11 @@ unsigned long mm_get_unmapped_area_vmflags(struct mm_struct *mm,
>  unsigned long
>  generic_get_unmapped_area(struct file *filp, unsigned long addr,
>  			  unsigned long len, unsigned long pgoff,
> -			  unsigned long flags);
> +			  unsigned long flags, vm_flags_t vm_flags);
>  unsigned long
>  generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
>  				  unsigned long len, unsigned long pgoff,
> -				  unsigned long flags);
> +				  unsigned long flags, vm_flags_t vm_flags);
>  #else
>  static inline void arch_pick_mmap_layout(struct mm_struct *mm,
>  					 struct rlimit *rlim_stack) {}
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 7528146f886f..b06ba847c96e 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1789,7 +1789,7 @@ unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
>  unsigned long
>  generic_get_unmapped_area(struct file *filp, unsigned long addr,
>  			  unsigned long len, unsigned long pgoff,
> -			  unsigned long flags)
> +			  unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
>  	struct vm_area_struct *vma, *prev;
> @@ -1823,7 +1823,8 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  		       unsigned long len, unsigned long pgoff,
>  		       unsigned long flags, vm_flags_t vm_flags)
>  {
> -	return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
> +	return generic_get_unmapped_area(filp, addr, len, pgoff, flags,
> +					 vm_flags);
>  }
>  #endif
>
> @@ -1834,7 +1835,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  unsigned long
>  generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
>  				  unsigned long len, unsigned long pgoff,
> -				  unsigned long flags)
> +				  unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct vm_area_struct *vma, *prev;
>  	struct mm_struct *mm = current->mm;
> @@ -1887,7 +1888,8 @@ arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
>  			       unsigned long len, unsigned long pgoff,
>  			       unsigned long flags, vm_flags_t vm_flags)
>  {
> -	return generic_get_unmapped_area_topdown(filp, addr, len, pgoff, flags);
> +	return generic_get_unmapped_area_topdown(filp, addr, len, pgoff, flags,
> +						 vm_flags);
>  }
>  #endif
>
>
> --
> 2.39.2
>

