Return-Path: <linuxppc-dev+bounces-925-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D44AB96A5DA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 19:50:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WytT241gRz2yMF;
	Wed,  4 Sep 2024 03:50:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725385846;
	cv=pass; b=bEfLl1mJkVpFZx9MHM6PAjz7dtMky/RsnNizs9RzUlAra12jdYCfyCd5Ob/AEExDDoh9li5bl7yyq8/i0sN+e5GPXZ7sFewosH+xmNwVsGT2+uV0c+IfSPsEQr0Hu4DkItdK5BG2bs62TEB5Ic9fmGs/DFiDyH0RqMehTq+hvcMNv2U6gH8FTb9w3+Re6q5U7DGX+USbUQAha34/+kxVqTTU+QJP2NH5vjw08J39agsPlYs8Bk+a5LvczsbWp4F/ThZ8Rax2tSfY164u3SaEqyjTuYxZCAVAUl7RMzSXxG6KTislI31Oom80oqoKkbCs0fg1saue1maW+DjYcWZBoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725385846; c=relaxed/relaxed;
	bh=/G3qQo89XURoA6dZzTsMoxlVWTxEEWmX8esaCB/VTaM=;
	h=DKIM-Signature:ARC-Authentication-Results:DKIM-Signature:Date:
	 From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IVgJQ+fYSHSm9JrASvmEwMaZu10bRdx2dper9D46sYbYaNYqBnX1PAFS1yAmFGPjikC/bYJGUbb3Gx2bKy/bCY4N1b6rjW6WqzeFv0LG6o0Wtotx22eab4KQXtSwQFPANyT/23A0qZKgMs6+JHNako4S9rFbByMBZ0QVLoNInJrdJBkIFzx4/T0/Cyz+tlTbbus/5JT9CyGfN4lOr6QQlh65FwocI8JEAtCsxJkJKYqpU0J5FDzjbso3L7ksEasbLCspwfdWwQC7pIYAmhE/rbWXGahvHvg8XvbJ0gqq40+U5dJVsbTP0IF5b5wDamOr+hav4NZ7xtkUREn//Viu3A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=Ww5JG4qV; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=whkeGU93; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=Ww5JG4qV;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=whkeGU93;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WytT16QMfz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 03:50:44 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483GtSjC011144;
	Tue, 3 Sep 2024 17:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=/G3qQo89XURoA6d
	ZzTsMoxlVWTxEEWmX8esaCB/VTaM=; b=Ww5JG4qVPennB8ZhrPlxoRYYl65A3cj
	/4zka27HQonTfYowN5V07Fw4QqdwBO7t7dPmcfPBfQhqQJDXYKmlULXt3Uo2xQ9N
	QbtUSKqQeEtt0nh/0NQ0NeopV9+cKc8YWwsHO9QKTbSYPSoKKTOMbb4Do2Qw6QIs
	o/RozX9fDwXU5fBMIWdoE9g2Zg50udSvroXmv0QGehnS/oIsju1Xm9Hx6k0qGzYO
	Moxphwc01xiNg3TkdQinRnGMfXBoMhTjeqv4vFzBBV921xSsFkuDc/LbmFAGRrji
	+ipv/+Zm0FAFDaaV0nU3xHfwkd9RKigkYEYtND4YVobWM5SOeXkJ3kw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41dk84j8c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 17:49:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 483HbaSO023553;
	Tue, 3 Sep 2024 17:49:52 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41bsm8hm95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 17:49:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tg57jgB7DyVDvR3h9VAkIms+EF/q59zJhQuOAu/k4shSqXdk8n9IZzbnqVa1cbp0VaCV8s6vo9/yUOAcdSarV5oy5NOuCltUWQ1SrZQl6xjH8UNpz5H+F0uNlTUExKaBty7+ASVCh7Kl+i50BcwvnQBvQElyuXSTrtdaEP99tdOSjbIJD7PP3WE/P6vRHGYHI5DNqWFiUNyuwtOZ7pWwQWm5K/NcxNJO/62eM1x63vrj4SK9Wct4QGtoknyBe7dtxQgT4Hkf0v3/06PtimnAHvx/FURVTc2Wjk9LcxOy2cjN1GkwcSvvlVjXJkqm7z4xfxBMcaRNVyaTP9yCvkxi5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/G3qQo89XURoA6dZzTsMoxlVWTxEEWmX8esaCB/VTaM=;
 b=VR4OE4OpooPz8WmLg+lznWacqbg29uMwD4436X+t34wom99c4crvNyRW6TeDVu7M1oBTCL3irejDFcMrV5wgowVzTNIYqZh8148z4l7m5hEgmuepttRg0I/Ht5Q7caoaVPTOlugLGDHTFlZdMnodWNxsMTmGRshHmLHnBanCks9Psg1+aUfNL0bSdkw1x+7eX/T6hJ64iT4T7FhDqpW2t4AIzSBAfJyj3yIqW1um4VlQhAi8eSysWZW6IZakgX9Ajrm1ycSCretNPgB4KrMjmGssCnCjCCcxQEyrrpOVR0WuTX6+xThZ8SKlT/1OthhurE11cqxZ90v0GBij4gXY5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/G3qQo89XURoA6dZzTsMoxlVWTxEEWmX8esaCB/VTaM=;
 b=whkeGU93GFodhe+TW9CnU21TPQogjRIRkjjcNWvrIzNd/lBoFCwlZo3QrwPNSVLjCgH51mFoP3LyoSoNEXoyRLUgogHEsDNFdfVqptgRuHNmQOH390Qb6DtZjBelFI29m63S4ZtPDLr9dzFqVEJQRCnWlHc48c2I/O1Xki7w8fM=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by SJ0PR10MB6304.namprd10.prod.outlook.com (2603:10b6:a03:478::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.10; Tue, 3 Sep
 2024 17:49:49 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 17:49:48 +0000
Date: Tue, 3 Sep 2024 18:49:46 +0100
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
        sparclinux@vger.kernel.org, linux-mm@kvack.org,
        Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 3/3] mm: Care about shadow stack guard gap when getting
 an unmapped area
Message-ID: <6d91ca85-def3-422c-8fb2-76337136257d@lucifer.local>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-3-9acda38b3dd3@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-mm-generic-shadow-stack-guard-v1-3-9acda38b3dd3@kernel.org>
X-ClientProxiedBy: LO4P123CA0495.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::14) To SJ0PR10MB5613.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|SJ0PR10MB6304:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c3b982-33f8-417a-9f6a-08dccc40ce0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3E33SG4yR0FI0JVi0Yd7g+hQiK0shaNSIFUfLFjpqrQSyDbfNuefmZLu+5sj?=
 =?us-ascii?Q?Ki4U/ktygPZTswMnUASx31U6heMSsxDSsfg983qX1/1UvcIN8uh0G9ueKxf+?=
 =?us-ascii?Q?cf8ZUevSFJk46qu6mxJR+Kxn07wEi4UkAp8+7oQALr14OcVZIxHR3rcIv0AU?=
 =?us-ascii?Q?koyYEerqLK531Xg1+rVuqhneBXV80k9K3MbAItsp3RLNEkBfahNux4JDpmpE?=
 =?us-ascii?Q?SI55EkKBE/G7axHmnW6hDRzgXxLzrRVg8NeMgnztOOxoo1Fvae4fOx0h3bLK?=
 =?us-ascii?Q?DiHjnu0bXw2UE79qtOYrUy5KJj5Nsm05JRJB5bhvYzyDBuLKl74fwtzGUFJd?=
 =?us-ascii?Q?iMWdyKUUPrWLD6daDCYFp17B4s2/fIHqWIpFALTavuhZbzI47N/2rBhhC1Mz?=
 =?us-ascii?Q?Fped3KrOY1ofsMZ2asnMNzUMgR0qVWtJl4vrsCW29D5ZNy0gljZcJnwdJXyc?=
 =?us-ascii?Q?J/XopkBLvwzcwqIpwgazaEYJWwgHXhA3QbycEefoZv9dXZLQAe2zVOHxJTcs?=
 =?us-ascii?Q?u9yexRfDvb2xGKM6cXaO5KaSaFgTaEcqXG2qRhRwn2TnQpQ3yCABUdzDv4HW?=
 =?us-ascii?Q?OU+YYsSAA9i9BclH9Uh0sBuEZv3aNKTUVlZFSktxBP+4mkshxbsMhlMP2YkJ?=
 =?us-ascii?Q?vtFRy/+z+aEZ7bsRq5KUUrk/QXP1ngfdq8aG5BGtZgO5KG+3oCTkMYfHvxhr?=
 =?us-ascii?Q?1LS2/rR5xi+fSs6j0dK7pZ2LtbpTsXEquB7Rvq9uAX23SesjGy16jNdE7kP2?=
 =?us-ascii?Q?EEz5Q6z0VFSIolfTJXbzMIi94GUEIAsou60sAzobFDtml64bwp9wRok8cz60?=
 =?us-ascii?Q?C4iO2GrXjJbaVK9r2yiQpmowVhK000SJxng//Gfv/SLoItnJYPXjdfks9i/c?=
 =?us-ascii?Q?boUP0rnYywpIyYUHuNiq6M8Q+bNJPtlgD6ZOIykjB01vbCE1ITAE6Zs5UVdN?=
 =?us-ascii?Q?TKXBv9cDvPuePksNgkm99Il5VI58ljoJWI6wfloCY2vFmNYM7ccrr3K7GTQ1?=
 =?us-ascii?Q?I4/kfF+ks2KOl6wGJagcpYTxNpSaAqAk9vIqzHDaRf1P9FafZep8BD42gaNt?=
 =?us-ascii?Q?emCSAKCRCpKScLJbTgvq69HdY3bAUNsXDN/Hv0e77yN3h4ONYf9gffpjHtg2?=
 =?us-ascii?Q?PSn6YLqIT7MWCnpflrKmCpra151aLEAfNs4JC7p43nZj47KTGB+nHmS8d+2s?=
 =?us-ascii?Q?ynRzgOUVBEeNYiUylPshzDOk9TBkwIkQoFFgyzVYeWa1RLWHog2PhhtyAuy+?=
 =?us-ascii?Q?BeU6Irwh7vnQuznDoPoPJ3xqdDLap0q/ZdzRA08hjAanP/NcIasTFS558Z0o?=
 =?us-ascii?Q?gobsQW8uFgILDmYG/2p4cK4Vh876Y+OJE7N4rL+yHHwRow=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1CXhup+QKFcYk54iHkqYklXMfUoLg0HLjD2sTcJB/Ki6PDTBHDeaNFGViOst?=
 =?us-ascii?Q?SfbUvs6EGqmKexFrZcEMX+FZP9kgZ1fJEvA773aqYvhMsMb1OwWpgc7ZdDwW?=
 =?us-ascii?Q?R6izBBtAMrNwJTLT4IgsUXZ04lv/f149x0/Jvxb5ThUkSlTaLzTWG1tsJJAM?=
 =?us-ascii?Q?nL4dxCf/YJ/+CuawRPTiP0XQyAdshUfyCtDeez67zBbpLKKUN0dTR8Y8Lg5k?=
 =?us-ascii?Q?z6OA6jXLOSI1m1r4Wwib37D0HJ+fpZkRLsCilUReEtwibYO1a2nbk9mIjV4Z?=
 =?us-ascii?Q?mCtWHk0n2tT99aRwF26jSKIUbqbuVyCEOW/jAXcsaZT8YgqtBXH00KezH3nb?=
 =?us-ascii?Q?N6n72KVOxwEJwFnAqV1hk2qkbPOI4xmKY2sP/JNBExZdq3Aq+s444u5XPDJf?=
 =?us-ascii?Q?8p3U6wKkKehkMkIDPmD2UbZclUeKjydlysekIVLjtJtcfnmpHc9TqzOxGEok?=
 =?us-ascii?Q?DlLNe6PqFF7+LzYSEo/GJTlQ0/rjlrVpdoY3k11VFSlIyRqINlObm0j0aGaR?=
 =?us-ascii?Q?5yCkTmWjltionpUbGbZE5/bds+kO5z/b3o3HMEWxolTF1L+bWGU5MxzBCHwm?=
 =?us-ascii?Q?WrCbjekXprNy+ODNkr83O0MA6PQzW1OqAagdbqJNQx9NAlZxviSNsVfD1jDL?=
 =?us-ascii?Q?zH7tXbnmj792pg5CIHdYsWu3Qy/sAgEUTXE5BQkO/h20W7wlAZs90cp9nkHV?=
 =?us-ascii?Q?2ulVGjlXmZwJxMpmZ9cMmcSG39m18Tq5BY2xPV0p9c9/quzZQAVVGZU/RL+k?=
 =?us-ascii?Q?E2pXdaLwBycaByLAqldUh0tg/hJ1nKgaUwi2EuL3/o1sGRzMndyvViw/YDvn?=
 =?us-ascii?Q?Uij+6MN0CR6ttrIEgf9RD38m9nm32zABKU85i1SfU5K95RYu+JfxaapXK+uf?=
 =?us-ascii?Q?SsvfnWRJzJxkedWTjwxtdxSfVfN9fij3LGBUaeC0mGf/OAP5k1A2CNvXT78i?=
 =?us-ascii?Q?/AB8wDmskwUnIb20+BGa4WEE+1u3xezRV5+JSN27Y1TIRAsp9NYykf6M1C1z?=
 =?us-ascii?Q?wH8EIBsG5vQRindovKupskQ6czAMBExLkBvQwoH9+3ta1eOPMKv+tyOnvqBx?=
 =?us-ascii?Q?YEbRHBqbg257PA/QXCNIIswEKRdjuUmKO9gnIXO+i9G6G73Me75uy1YvmKru?=
 =?us-ascii?Q?X5CGxdOUSbkKY0Uv65WAbOpfLYYqHo0YaNdA2fxm5qTQHYKNgMvfZoRUOP/5?=
 =?us-ascii?Q?Ax4VlnGq4ADuDccAxUc8k+Hr+AaUJXSkzG18TQkP6+cH2DgYya4n0mHLry6P?=
 =?us-ascii?Q?TUMDrwokaprY6LlfIxaBO82dQqMPjMEA4u3/CJlU5AwVfBz1lxJqAZEr1B/f?=
 =?us-ascii?Q?fhfzq016bGYQPnVdCrCNsqYYURVn8o00fmsy2jTrHp8nPt5wNgcty7Le5uk9?=
 =?us-ascii?Q?fHXhCZLhXHpj7PwIHkzBmxx3xmF9ib4wZMNJbJNo+6JUacdW/TAAvWf5kMO7?=
 =?us-ascii?Q?owqV1Wh9gd+qqNsJSWgWN2EDAesowdJu+kaQTiDAodm7w0PrX0LTWYiosWW3?=
 =?us-ascii?Q?6xRn4fxgh7D1tEr8sNOw2fIPFHbRxsjDo2GRfkZ4VIaKinsdRIUs0VCtrYGE?=
 =?us-ascii?Q?toYt0b/z6BqsW1oMAoWrus2mERA0emAzK/0O3z2VhrCH+d438uB7Kg0UKTVW?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HjhI6I4wq7G4r6eLK19YodwOHKcEE4I1KRdjQIrVvW5mNdjfc2EjhWriJ1cUVaUaGsINXLiHjG4KC6WvDrr2faROrg3rn2NhMmsvIt1mxlAbCYeq5ZZvdHAa4fTYpMBuldJwGtb4h2dO3y+LrJR/cR7Q0yryhozc6WcGHNWbYn8fbAMtuBy3GFvjluVnuI+zHZ/gbThgLXry7AFzTWVnstpFWy80DgqUPhdzWa4hhdLSMuDynDDRHc23wN5tuGnMFu2DG6Acw4MeFOajStDjTSBAyDKsIy2nZHen1mHHZlO840GYB2XMaR6HFWdilfSd5xNJGnAzexxwXCeWyCeW3r//nHcWb5t2Ayq9pJ/E9jGqjcdzxvx7xuSgf893HRlxZuQanD7WNNqL/75AQshfHzeKxvTGnqVsbOdHz6X42n/gtdDVYY+vh1Vc5G319RjWAZqQdZgdL59wX58X6UJvtVo25GdXsKX9PfuX/akGe6nN3MQ1Vj7finDrKTMEAyNL2Nr7v6w0LHC9th9ouAUsZSzj4HO5kJlrCTn3aHAkLPnC2jDYLS27+6vrhhAVH2zoGxySNAghZ2lw/QIIeiDxki1DrwVylZHsefgv512oJAk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c3b982-33f8-417a-9f6a-08dccc40ce0a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 17:49:48.7681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcwN08swVQ3LbG3Od1M07atU6JmJQT/bYFbl0A6cFEzoI5l+WwCmPbg+OFKbk8dZI2BiKO/ddUuakz351zDCJbAWaN6CP+hY3JZjDXDFpSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6304
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_05,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2409030143
X-Proofpoint-GUID: Y2k-nyM35W8kp0SF_PuAUyVg_msongDz
X-Proofpoint-ORIG-GUID: Y2k-nyM35W8kp0SF_PuAUyVg_msongDz

On Mon, Sep 02, 2024 at 08:08:15PM GMT, Mark Brown wrote:
> As covered in the commit log for c44357c2e76b ("x86/mm: care about shadow
> stack guard gap during placement") our current mmap() implementation does
> not take care to ensure that a new mapping isn't placed with existing
> mappings inside it's own guard gaps. This is particularly important for
> shadow stacks since if two shadow stacks end up getting placed adjacent to
> each other then they can overflow into each other which weakens the
> protection offered by the feature.
>
> On x86 there is a custom arch_get_unmapped_area() which was updated by the
> above commit to cover this case by specifying a start_gap for allocations
> with VM_SHADOW_STACK. Both arm64 and RISC-V have equivalent features and
> use the generic implementation of arch_get_unmapped_area() so let's make
> the equivalent change there so they also don't get shadow stack pages
> placed without guard pages.

Don't you need to unwind that change in x86 now you're doing it in generic code?

>
> Architectures which do not have this feature will define VM_SHADOW_STACK
> to VM_NONE and hence be unaffected.

Nice.

>
> Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  mm/mmap.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/mm/mmap.c b/mm/mmap.c
> index b06ba847c96e..902c482b6084 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1753,6 +1753,14 @@ static unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
>  	return gap;
>  }
>

Would be nice to take some of the context in commit message as a short comment
describing the function. I mean it's kinda trivially self-documenting obviously,
but it's useful context for somebody wanting to understand _why_ we are doing
this at a glance.

> +static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
> +{
> +	if (vm_flags & VM_SHADOW_STACK)
> +		return PAGE_SIZE;
> +
> +	return 0;
> +}
> +
>  /*
>   * Search for an unmapped address range.
>   *
> @@ -1814,6 +1822,7 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
>  	info.length = len;
>  	info.low_limit = mm->mmap_base;
>  	info.high_limit = mmap_end;
> +	info.start_gap = stack_guard_placement(vm_flags);
>  	return vm_unmapped_area(&info);
>  }
>
> @@ -1863,6 +1872,7 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
>  	info.length = len;
>  	info.low_limit = PAGE_SIZE;
>  	info.high_limit = arch_get_mmap_base(addr, mm->mmap_base);
> +	info.start_gap = stack_guard_placement(vm_flags);
>  	addr = vm_unmapped_area(&info);
>
>  	/*
>
> --
> 2.39.2
>

