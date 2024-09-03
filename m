Return-Path: <linuxppc-dev+bounces-930-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBA996A779
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 21:39:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WywtH0P21z2yNs;
	Wed,  4 Sep 2024 05:39:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725392359;
	cv=pass; b=Ch6pxEWmAT37JGEZGvvFa1OMe9c4tqRqvPVazx2PxudbPkap3BR103537VDvCarl7MW3AjzsDJr9J5j9V06ylkcgDqX2zoWYEKI86ch+f52SRe/sNe+4Rr+iBgueEwxFmXGp4wz679sqfn0xvZgShnDgx7EvEYlvlSOMp93tj4Q8+R0YEiWwPYoCXLZzMQUjLiHZj8OLF4ItIJyijIDwnNaNR3U7o202+RJ21fFRTH8v7JSv9m9ylbPeuafI+PTfYZR/cuycvJytP2zZJzI5LmdXW/Rtr1LLZyUFKvEKvGeQ1cX+qxf1eAKmQHmsG+VTRR3wSSUi5Du8qelLmpSACg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725392359; c=relaxed/relaxed;
	bh=wt9ZQCmknOoKlv4iGnfqxj+/B+Mo5cwpnSezO7GQWMM=;
	h=DKIM-Signature:ARC-Authentication-Results:DKIM-Signature:Date:
	 From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Aj/jxUExpkqHgUAw9QpY073kdXIPwT2o8Y1+ptfiKXFOO0A93Bs8bWlz7eIzk/8GoJ+8IJrX+I8+CKfd+cK990yHpxveMlqQqZ05QHxQU2B17BUDTKPBFTeqvaOJzgpNVZ4rdPVqrgI75yiFbz71Zvi9Yma0fzMP3f9OT3kUUZssAq48nnp4WDhSVJHk9SWcamLPhMu8BwBa/mCq5opo97RwiY10ri9TVfnGBC7ppXeJTuLXFfIusgpMxpq9a8G1SUFw4trs99GGngblj+LcmM7OEQyXJ9zgW3bYREMP8abxIEPsk1KEkqvlpGhkhk+fDv/8qO+KHPj9yhW2bKpCzQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=C7KK2gzP; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=WaYMdS52; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=C7KK2gzP;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=WaYMdS52;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WywtG4BLQz2yNn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 05:39:17 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483JXTUC004492;
	Tue, 3 Sep 2024 19:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=wt9ZQCmknOoKlv4
	iGnfqxj+/B+Mo5cwpnSezO7GQWMM=; b=C7KK2gzPIUjHNEMVOd8vU3XVwWNYZ6W
	9v/XTDrv2m1BqhpFrvDhjjsrVYkOWSUFSWKvrBlD39u7WtNNMn1i+kEg0/9/44VY
	pYuq/h4HJ+7F/VH28ZNHRbGc9yjKABlnFsLZKwj8Zx3Oi/cwKnuC+klDkUCPMOeb
	T7rtBTt8RpNCE4+hhC1aMBmPDrSrX3/J+zqDKOpURIayEVhXsr0MlkVZz23QrQwf
	xo1/5aD1FxUZ/oNTMe+BNccB3GWE6C9fBq4jhzZZ6DWOFg3QRYYUYVpgPZ37nxG6
	JrZr538y19uMpuc9KBZ14g2Dq4WAvm7esXITfBbL4ty2ptu9T0l2uJQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41dwndhnye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 19:38:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 483JFrKj032655;
	Tue, 3 Sep 2024 19:38:30 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41bsm9bu73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 19:38:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNBMSCPxgalaKbaCMpeX7zeeVfRyg6Se/UGFuFHp1vpkkgMAY62fW9RZqZa+lg5zUmVnhlBhHNxNpSSkCGwOMtETR1ID8gB3rQttRpXSaT42w6+h1dlzNsxlrCHX3vC0t5uelRqDOPbUvMUs15TjJ7hFAmv2e5Ilnd/TAwCL9GEXtvCszo1IZSzXX9Z5NW0Ir8qovhTyNWM4jmamPbVUjvfND/C37XHOU7bxUmB1WFzWElPqIIIBrIeFCgWKPOV2Yu7ioAJddyS/MSnzWttrKBjX3us/a1x9/XYD2jNUwSchZY0kNqi8l2mR/7eAa7CjTPfQTGABeDENUNJ92nXcow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wt9ZQCmknOoKlv4iGnfqxj+/B+Mo5cwpnSezO7GQWMM=;
 b=RKXRpjcA020vNd8JLcBJ+MzWqMZF81H1TNKUfEHaciwx2v5+M2irhSa3rB2lrt/jkDwOwtk34e3z2pAVPkztknzwtovKMqljIhPPSBGwxfQtDj4PX5vSF9SSP2DqXUmXnGgGLQ07YQR4RPGAEH+DUU8zp/kXRrj9ciXPSnyZScqmUJmcAhnVDNGifM+U6/05IMUmQmXtrWc0OA/s2jmE6joFjK9bWIL16F8DaSYTF+NmmG6NKN0atcFLzar0jiqNO+wnaU0EESvi3BL44sg4bu39Ks0+ZdoVQupykbpb9B62HtcSoADBcNUEaf1X5rgjc4En6VC3ZE4jp+d5UFbvcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wt9ZQCmknOoKlv4iGnfqxj+/B+Mo5cwpnSezO7GQWMM=;
 b=WaYMdS52D4SXmZs4/aoTTUaJObbSLALksTR2oulxZiuOopdZySA4Xhp96KOTBcaBxMPKF8xLAjB7kJ+Qfeh62MAeoF8YoBXaUI7nZi42fAjk5GYNhYktC8nik4Jv4CFuaKIXVRzB666nR8RNi3g388wLxVkalimxNtEx0rWfhB0=
Received: from LV8PR10MB7943.namprd10.prod.outlook.com (2603:10b6:408:1f9::22)
 by IA1PR10MB7199.namprd10.prod.outlook.com (2603:10b6:208:3f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Tue, 3 Sep
 2024 19:37:56 +0000
Received: from LV8PR10MB7943.namprd10.prod.outlook.com
 ([fe80::a8ec:6b6b:e1a:782d]) by LV8PR10MB7943.namprd10.prod.outlook.com
 ([fe80::a8ec:6b6b:e1a:782d%7]) with mapi id 15.20.7918.020; Tue, 3 Sep 2024
 19:37:56 +0000
Date: Tue, 3 Sep 2024 15:37:52 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
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
        Vlastimil Babka <vbabka@suse.cz>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Deepak Gupta <debug@rivosinc.com>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/3] mm: Pass vm_flags to generic_get_unmapped_area()
Message-ID: <c72vxvgbnfnph2rtcntkckqr23yd6y4nzk6fow6x644r7noaob@43c6mbe7r4v4>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mark Brown <broonie@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-2-9acda38b3dd3@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-mm-generic-shadow-stack-guard-v1-2-9acda38b3dd3@kernel.org>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT3PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::32) To LV8PR10MB7943.namprd10.prod.outlook.com
 (2603:10b6:408:1f9::22)
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
X-MS-TrafficTypeDiagnostic: LV8PR10MB7943:EE_|IA1PR10MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 55408ea6-0e59-4c94-e0c0-08dccc4fe8e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ljk0gatIXDFOgCq8lj3UWubx9v+++iqHhiG9cSDnTT/KLdnxnxE9BFJUfvX4?=
 =?us-ascii?Q?1dNO7z//7rxLZOn6EpkT04dBg+thdloykPqufLBvD7YoqhuHGOGhYH+k5Fkv?=
 =?us-ascii?Q?oOUyBaBhzM6mrEyzHa9aIa5BSv/oSyu7dG7PMSPpLixeKihG1vUQc22MN1uD?=
 =?us-ascii?Q?IqBXiULr63kF10b8h7FMex7I9a7ue/d7NwZkOlgn/O1XCSyKGoXm0bvV1K/E?=
 =?us-ascii?Q?BPEz/u0DuEIJrsVer/xnxUqZTR/XB4I1gznlOoFrQVf/RP79NVNOaJxt/nku?=
 =?us-ascii?Q?5lkKlid2BvgBWauOKN2chPf197yn8SvkfBVQwZvGXVACx2ywp/yvGA3s+NRX?=
 =?us-ascii?Q?Td/zY6RxXnUXCSM1NBGGGxwFR3S3Ju6wMrckaVwq7SLxjBtILWBhqEKJQRhT?=
 =?us-ascii?Q?EvW3oS0QjpmA2q+mryl/EO0o/HH1NXt5Pl1/UZ5lNPK1JvCTkaMdsbxC2QVs?=
 =?us-ascii?Q?d7E1k/5N7ZMi7tOIBApMC0zsmCfMETHoJvamCG1bLFc9RE6FpmYoNg5OMBZo?=
 =?us-ascii?Q?K/IkQTN32Z3q4jFEGs2fQiG6GxpeBKCu5HNZv6sPht3ypQVB54TEMawoQ5bT?=
 =?us-ascii?Q?L15fKy+WZXBEsPoxnvIjVpZhMfpPj+Rm4Pu7c6x28RfdY/QWtZkPlXv8VqvL?=
 =?us-ascii?Q?ooOotTtx4zRMEEud9V7U6giQD8l7Xocyzcnamdu7hsx0sNUv3nCL2IAPFPZI?=
 =?us-ascii?Q?NgH4egoozd7bgsOofHayBxAwOVpCa+XovOu2TFcZgmrplgRX9WDGUI4Q4WL7?=
 =?us-ascii?Q?O0TNDJD/I3xHNsgoovYNU/M7uoqIYyyEyoKruJnm7/4DQLF/u5nd7Jlkj3Wu?=
 =?us-ascii?Q?iW99NKCDbfCPnVR6RtcbJcmpKeQfkI+eOPXwwa1h+1lI/Z2pR2poaBsuaiy2?=
 =?us-ascii?Q?PKIs7xuIE2vfPl+B4TRRXeUKf1Oa9gFUertXQ0IteNcu4Y/JW5Z9JDda71DE?=
 =?us-ascii?Q?v0mb34krGEg91QGsCiVpnllqaMgfXHylc6SOpLjS2yo5ukrUxLQH4ztN+Uv7?=
 =?us-ascii?Q?k34PQes0JXeYn2h4yR26u88T2dxOYRrrm76pFUxXsDAGkzC8nNzToouDTbpY?=
 =?us-ascii?Q?fNbqB6v1pAGETaAMy42NNc56iSl9zhY6JDAlxz94RrlNTppcYqtavnVGhMNA?=
 =?us-ascii?Q?SYyU1+5nFLYdAx4bge2U343CAb1xbDnUM4+Zjsoy/3P/VwTLWDPQNu3DD9d0?=
 =?us-ascii?Q?Sw9P/2PQfObPy+tztChNZreG5ORdGy01SkUQTqUMSptbDbvh+SZcLG1kSmTU?=
 =?us-ascii?Q?w1i/PIQnJaTr0p3jdkbiqAIVB0upx11USeaM2WzeyZpJNu0YwSnvll/2GZ83?=
 =?us-ascii?Q?jbSCJpmHPegsSprhl5qGdJ6JbNVKcc6fzdkIRMgcStWM5Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR10MB7943.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dibtE6Q6MzSoM8kVH9blZ3aSAflur0cKqGRwuBfpGX5wF5aMV0UJCMBTB1sD?=
 =?us-ascii?Q?56hUnFQ4o9kbkui3FauoDxPgjF4HR+ddMZlCn7BIis+P6M/p6USWn3oFEZyg?=
 =?us-ascii?Q?pJA9CT7ke8a5eu53wgQuHV4GPGFGsPFMudnyqPS8NLUpQJQ+wxoT/JrOSNle?=
 =?us-ascii?Q?ofxXnViHv3SwnbZ9Ukn9vjcu71kzZMPv8uIIjXwubdx9DpLUO/fQokkN0Sls?=
 =?us-ascii?Q?3tRIVoZIwYpOvhQ97IiiHeu3qDYpIIcRDF0sCZeWzgXpxyx/gBYXKoSA/MxL?=
 =?us-ascii?Q?k78aswR76I2XT5IIVMCidUDHWoOPFvnQPzVzUHoKJYm4LschD15Z0UlC9qMc?=
 =?us-ascii?Q?tdb+jVuwsYPq6Sit9se0MwBYOno4IGUfmU4FmC2TlvEWiAP2sNXHIIDf7znj?=
 =?us-ascii?Q?sOHkko8usNHFpb5tt8SFZlf3x6VJCH5phR6u3rRGucttDxarrGnFIWwGlX92?=
 =?us-ascii?Q?7vI7k9UtUjdHAN8W1mBkPJJjleTbAwgWBWEkK6YHKrioqOBkAOb/SzHQQEQ9?=
 =?us-ascii?Q?XqVB22fikijB1Z2xOhkcnzFf34fTLEKQfwLWv1ke3voU5Fx9rYgIb8nkeVps?=
 =?us-ascii?Q?x6NK1kYdPEEDILNpgl8viZtid1x5f4bLVTNHpbarsAZMNqkbIknauEEBIqkj?=
 =?us-ascii?Q?ziyoe1fRbzr631ThLBWMHU/qF2j+hlG+mXu6M2W4OPwi2/YOWFClfl0kG6V1?=
 =?us-ascii?Q?2mwEkOQP259rI9rXl1kY//y4vwmfKvLvJfjg1tH8jvsLNNzA2wbih+gWgZFZ?=
 =?us-ascii?Q?lM8cvZndRIGkGvaOvVKSOjvCbNULxhOf7q6sEOldtw+LejpnhZkUqPj7G9/R?=
 =?us-ascii?Q?ETO9aJWbIsUSVwAqzuTrO9dwVcOX32MGdc/qa+HQPaL3DlUNULttv7znDDtc?=
 =?us-ascii?Q?rPlAbRhRBz4gA2sEk9k5akFQDodHROo4SaKvwC+Ur6VvMr28OsKE3ijiFDv7?=
 =?us-ascii?Q?vWgwpWSJQ2G7c/Xna5QP8nZptrz9SRt79T+XtVPdO3e5zVI6/N6M13L4TbSv?=
 =?us-ascii?Q?uuCPpTasYzWhyiYrw+D4USlszKofp5EKbJYa58ibezQUM85q72Jwp1etC6Ej?=
 =?us-ascii?Q?ZKdSg8fgIfLka7jwz0J2rTAAW49/dztWeNJO4NTiMysCYYMAokkg//6/II+u?=
 =?us-ascii?Q?302Rk9xwh67Qzus+Zqg5fxR3D4OLspTB8mo2uHGDTEyykp1RsHP/ywEbV6VR?=
 =?us-ascii?Q?O6nM5FeZg5GVock/KC0l+OksPaEam5JHtxRXuUL4LEEj860wX2H1p6KEfRoS?=
 =?us-ascii?Q?43Gr8bBiNsmRLqpRC5+Af//3qiKP78TRecetHUPXxQGnOQaMboiI7LUy1UrC?=
 =?us-ascii?Q?YixSmovbblL7pdO+EF8s4aWxboBz9ITCkAP1+b+6zMSZgxVQ4CB+4LBl8/d7?=
 =?us-ascii?Q?Ap8hNhVqk+90b7EPYVoSwa9uzfllo58GAOakhFEopf9WKicyogxSvj3Tber2?=
 =?us-ascii?Q?+N6P8u/jVThV9I86HIQBjk9OyuUKYfEDtvNtlk/u3WqqsyS3yPN+h/QhoDQD?=
 =?us-ascii?Q?k7UOQ/lI2vC01MLocGYiuiBD6aQoL8sNUbT8x8KBYlP8Q8YjKzi8loCOdtAs?=
 =?us-ascii?Q?syj+mMkY4tb4mzyjfjUELPCGMWsC7bp0blAdNQv6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4oW3cMtwkzPq1ORHBX/Cd82RSPeDXQbsj2pqaSIc2GQAsTzj5okRLB/PpCfWtbNBhXH5g3/FZ1FNCoJbTBPfuBx06Yo2Cbx/auBnFmWGzkzVHCCONLFvWaA7ktf3Bwkl9IwN5mu/q/af/nOWdx9byDtZrkXhyycfwBicGLKybZJTVu9EglcWkeOncbtt/b/TfQv2/pKxREtW+LCADxDljCVIpW9zFh8op8qIwCh7fV0cy87d4nMzI9zcLhzc9UOS03VSdDoJQU8Y0cOwy+OtY9xs1UwysaHiZz2EGuftZ2ycBG3b1Atj4QFhCfT2Pq4gT6WWHM4sXIScYYt7vXU99PaZLCOBuGW6Rcw8leD77kjjgodjq+ITLTE95QzODjfLMOS9fX6A3GO7hwbH/USoTxQ6l9QV8/Ktax2PA9FIWtIoaFA+F8Nz1jIG0eFu/Uqzn7okqqyIy6XT5qRa0rOzed1UA+7fVLnF8639J9GfpLULlmkcgX3bGrrBEI408d+SYsmI6Lk098mJagZvX1ysWqzUUSvJbnNovrmZIusop7AOzQWQZ4UHfdlbunzTU+ugjZS1bdtClxoMDd7nI3D7qiVr5/YQQLdcbf/DoiaOYvc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55408ea6-0e59-4c94-e0c0-08dccc4fe8e4
X-MS-Exchange-CrossTenant-AuthSource: LV8PR10MB7943.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 19:37:56.3086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HgzALcugHCDefdQxenLAzhGfK5YCBy5ObNO3RVHU18gXyz/FWyxPPg/qg/qkd5WnA0/ihG1OBlqYi9pgyy75Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7199
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_07,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=859
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2409030158
X-Proofpoint-GUID: ufDMhQupoIYRL5DWhIQxmsUY2JyoEryv
X-Proofpoint-ORIG-GUID: ufDMhQupoIYRL5DWhIQxmsUY2JyoEryv

* Mark Brown <broonie@kernel.org> [240902 15:09]:
> In preparation for using vm_flags to ensure guard pages for shadow stacks
> supply them as an argument to generic_get_unmapped_area(). The only user
> outside of the core code is the PowerPC book3s64 implementation which is
> trivially wrapping the generic implementation in the radix_enabled() case.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>


It is interesting that book3s64 ppc is special in this regard.

Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

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

