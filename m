Return-Path: <linuxppc-dev+bounces-923-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC2396A59E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 19:45:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WytLN2VLFz2yLV;
	Wed,  4 Sep 2024 03:45:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725385500;
	cv=pass; b=G/aNWKaW5+MCTMVUE0ovui80YndZSl022KJszu5KFz64Ogc2IlpK8sWcA7RtUw69iYcWGK3kg0P1UWNYNTUeayddNoQHDxgmmHUAJ9qou/WxJaxM5/hr/cPyrhWgH0jn2199ziuFLTOhjkx7aMJIF9P558MKhgYV9tjhTehdRLdquVTmbGzXyo3x39XfQfDzoWprIdRPu4wKMrOjSrPMKvsGSqZOoZAbtj1Q34utHzVWdLfHJofAMSMA8p5voAYS3diAvSnvQvrMZN/A1h10wg9vFeA+Y//OvDXC6UQuBOHANl0oTvAWsY+iF/XCeb6/zYq+5EhKBTZ1ItsyntvM9A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725385500; c=relaxed/relaxed;
	bh=K5veCM4YxN91PcWNhXu2tpkFBIMgtOV992TnjZYTbMc=;
	h=DKIM-Signature:ARC-Authentication-Results:DKIM-Signature:Date:
	 From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H5akwdQthPyu64OL6HRk1skGukLR3cOIvOUHJ36ohNLIU53zh7Kg/zGuvwN/KFcW0uXBT7ri/wyXAiED9EsyHcJtdB2B9vEB6oDszzv1h/3ToAP2mr5cMgsGCd0rPSQkknMRMm2xJ/OzkCGx0iF61hTY7/vqYtSSl8IGBTQsfdmIoT/89QUuqwe/WqPPM4vCWlkHrhW9cF2qsNSomX8q7ey9LogI1DhY1GI16FMrWMfx7vE58g4xlhDLBbIe2CAqOYVOzJTWrXC1RXyh91TCB61jL8L1ijp/wMgUNBMxOVUl8v4SYp7yVv6BZDbf98Cs1hfekjGFNrOSHhYzoBpUPg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=nmfQir28; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=jaXMkKv0; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=nmfQir28;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=jaXMkKv0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WytLM3H1hz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 03:44:55 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483GtVgn013672;
	Tue, 3 Sep 2024 17:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=K5veCM4YxN91PcW
	NhXu2tpkFBIMgtOV992TnjZYTbMc=; b=nmfQir2890lLabk1KSvyxBdzOHQIDtN
	BleiqsNBaCRpnFQ6HFRBanTioNDvrU3AUPoVG+zHxKBWqhd4mJyNFkrF/b4ESKH9
	UbQW/bQQq5QQqppsyW19R0bE7Inr2o0cnXRMcSDJlJKvOfNayV44nIfJE/YXQ6I4
	TK4LVg868MenYe/gJDtGtLYfuhZUO0V+at6poYVoG6VaE0gCgDXtJMGTfwJmAxBv
	TE1f68yaItIFV+DP1PFdnFLYA/5NJuFUbxxssL8GT21GtqZZ3C7nlJF5EP+2eziG
	sx+xaXaERFfdQiuMrTlg/x1jA7ajwFjVqQApdHPnIhJennvtdGbTpNA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41dw51sgqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 17:43:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 483HIACQ036684;
	Tue, 3 Sep 2024 17:43:41 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41bsm91crk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 17:43:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsNZJ+O50uzt+60xbq5ahMhpkuFHYPu5veN3REaJUQEyAJGXHoQ+/a8AMNfJVMnjod4LAe8pj+peWvI35FjfEcrkVmMdtI11DX7s9gqbv3pV2M7Rv6xvqmvNvb89ncykWXw+a9+BryECF/3Q0K5aBOXCNn1c8PjFzeHCA0oWUExN+cz2Bv8RrroeDUrFze9TNG741Tg5MfntK3moeKLhbzgxtBiup0NW77FiCf4KJZiPCwvnA9IueXF65++8OhHhBFsXCMqD5wXzBrr1//1cP2BjTaenl6r1F7fF/7FmxsRXbR/x4wHhgU54Q+aYXKoek2V0Fvq7b5FpdVtPUE+YRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5veCM4YxN91PcWNhXu2tpkFBIMgtOV992TnjZYTbMc=;
 b=X19kcMn6qxz+fVv7TE1VfIx1ttX5hbRkKv8kW0Moced4EICD8ghAb5WidBQa0GlbBHSr21i+LKu7/v+kEaaB+UqyCOimhAsgkPF7Ci8PJyB7DmktlC0v4qO8HPXcE8ezvDOK26UZxyhX5DItEztifRimO6bYWm7/nCP3i5WZ5HKzHtQ55Wmxsj97Qdk83LqxY8UuxLRAgfd5Svu+up8yS9dUiK7wlhOKuJRUzS1YfS78Bnu35Pz9eKCa2FxIe3raQDa5/eU6NJigWNeboQn9qjSeZO7WUNZ7q7Jd2JS7WghDGahDF8OehaPStRatpsUlXtNqKBW4KQ5jaatHYQh1DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5veCM4YxN91PcWNhXu2tpkFBIMgtOV992TnjZYTbMc=;
 b=jaXMkKv05KSc1ZrVwl27lOrhmzchxML1Cg+2+uTJllPrz0MzkCShDwqTjzz/3gqD/2kViLUiOp7ZNgui+EX2rquyq5LDXPSqCwK4uyKXFl21crNbulAy7GNVUh2nRLrbn2do+cYLa0gHrA1OT5WMllriFD7ryXtyqP+lXKj/g0Y=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by SA3PR10MB6997.namprd10.prod.outlook.com (2603:10b6:806:31a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Tue, 3 Sep
 2024 17:43:32 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 17:43:31 +0000
Date: Tue, 3 Sep 2024 18:43:28 +0100
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
Subject: Re: [PATCH 1/3] mm: Make arch_get_unmapped_area() take vm_flags by
 default
Message-ID: <028d8b30-beec-4971-b9d6-924b97c3dc6c@lucifer.local>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-1-9acda38b3dd3@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-mm-generic-shadow-stack-guard-v1-1-9acda38b3dd3@kernel.org>
X-ClientProxiedBy: LO4P265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::12) To SJ0PR10MB5613.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|SA3PR10MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: c664152a-525e-4ba5-97b8-08dccc3fed35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f0hUFVnsgDPMaaB/MnTyE8xCL2aJdJwEUKYRz086DA7etVMavhDBy3o9TjMU?=
 =?us-ascii?Q?PswN55vCmTfWbqT2DRrRSB/tbskuV9JFFk4+rcyJcoy9b6ki6+bnJQoOWTSh?=
 =?us-ascii?Q?upEeXvUB2O/pyYr7wD0MXt1ClkCw/7sV5+CvJsppmAVLJUjsOur8kxEfP/TG?=
 =?us-ascii?Q?VNEh9lKZ45eNLveCGFncmgyRTCLqox1zdNy6KQKblL7oG8DnSHKPDpaCdaTi?=
 =?us-ascii?Q?mu1lIUB6oRnv0bGU1LKKdRRT9435Lh1rV5ezKJBaJ0kHX6ZHzM7Zxz3XbCum?=
 =?us-ascii?Q?ql1g3ob7upGqtVEdTvGYggZg6KKW0RB/sybg2kkNiwOnENyYbnC49EJdSLN/?=
 =?us-ascii?Q?sEV8Htt7A9mc3NIc9ki284qA0+UAQ38r5khBf8okPC1HJvSfOK2OBzFz5D66?=
 =?us-ascii?Q?Fht6fMBlR7g+LdDjQ+JQTDmJ98rJmkC0X+F7gp5wBU04+806kbG5mYZ+0hOQ?=
 =?us-ascii?Q?0f6vcGMZynUblNIwGgUs6jzOQGmy2sTnYKFmWb/pQuFIbxHzBxq9Btqo+YH1?=
 =?us-ascii?Q?f69bNurHbaQBiQSIEQdQVr85t94Oa824zgV4GzNIVn4xzgEyzup8VPCxWhVI?=
 =?us-ascii?Q?iQPJhs3Xp8r2xjSYQRUaGVlqF2iPa9610GYUzS6cusn9tCIgRb+04HAgoumM?=
 =?us-ascii?Q?P+5LdFj2MacjfSgOAPaxQAmHhTwelVhNJIUkd2vZmMq12ei4DVOxZMArTnJI?=
 =?us-ascii?Q?NFg0cZdrMZxrDjaTdiAeP2jTnO1K8KiC3krNMJFZwUDuOViTWq/EHpDsZ9xc?=
 =?us-ascii?Q?KHpDPVel9P+fyY6pNol0uKgeawiNnBQL5iLFTwlHcFvrBmq3osLvymKCW1xX?=
 =?us-ascii?Q?QiGElRGMDxj+CuW3MFKRfxeujYIuYoa2TSIJ/ipNCVeFwBebELKm9LGcNCZb?=
 =?us-ascii?Q?hYYA9Sgsffajrc/GlxKx8b63NPaQY3AkwiINf4UXfjbFj48tguVMRFAMy/Sc?=
 =?us-ascii?Q?6FwOnl0MhFZKlBz2mQ3wwOowKMbTc/n6XNpJ3l0Io+Cr7c+zegErKZxdmZy4?=
 =?us-ascii?Q?HjY3DiOHy1RP4sTqvLoSkVczp+ExvVlDBVp8zRat+XsVBudNQ/Fuv2qxmToM?=
 =?us-ascii?Q?RJKPTG89v3fjmgCtukOFGoatYMJlGplwB42r5VOUF5LoQCyU5xYCpbsX2dmI?=
 =?us-ascii?Q?u8Vdq3jbbFk8uS3Ahy2b3IrIbFVVhyzx/LtxsZxiWsB8X4XmDTaMSrmP3KXn?=
 =?us-ascii?Q?N14saSH90Gw63yH8OVGf1HU9Xxi5g5dRH9ysHSi/QmnO2eDUY4XnByBGO2rs?=
 =?us-ascii?Q?8bJfsrYTS44mcWijIwph7mSssqLpMsNxuNNXP0xHHD72pOyiIzGrJs1TJTEi?=
 =?us-ascii?Q?dxaiU/aBmwB28VbbxW1aC8rRsFGBWTvVkmpG5efAbYeL+w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j4n0DRBRG6mNTJRi3ci/0vJqMn+QsGkmZy6yheApaiBYdI3snm5COUAfeLrU?=
 =?us-ascii?Q?ABVeh8enoHW7Dx2lR8GwlzJRzuIC19bRpIqWdBgp0/kGQqW8yAzUMtf2FMzf?=
 =?us-ascii?Q?yFoGZRX/72yqWxCgAjMa4dlsS3NJVoz3ncinNm/kDMpy61egRDBaksZJnePV?=
 =?us-ascii?Q?Ap+FJJ9wdsu9mIs+SjUxM76Peq3vQ53RKckpvuVx5N9gIcWeGzq6onEsfAat?=
 =?us-ascii?Q?2MEBmCMoRNDZAURE/oiihMkTi06pFQHp9zpa45yzV2v630vgy+z3pabDUgWW?=
 =?us-ascii?Q?PU7KkCL3sFz9mF3zFKX8NzDTJJo2E9UcvAzjw4NyeDm73rYWjaXOh48mSPfw?=
 =?us-ascii?Q?3DwOviWi5DE1l3CwZ1gOciay6BiATNGWxlahEfUc7Jn6nF3geKFLByZ8bDjV?=
 =?us-ascii?Q?X4qVdmm3JoawRBof9CNKDJtNSwJn+L7xojZwnELjI4GJw6fJHFlDJ/Uk0eun?=
 =?us-ascii?Q?2kDGX48nLTHDWB0Nr0yVt50rPEj62sDvn4BRYGINEMG6pyxBP9vIk4thklJI?=
 =?us-ascii?Q?4YunvLpGFXgquv5SBlJ9RPYQL+Oret8drYxx1/iNPlLJHRPihevPR7Ez1AdX?=
 =?us-ascii?Q?Msmq35RRLRm3Ki1+EY1FDRAPHMCZT5qVk5/51dgKh1kjPz39XBaI8/cEbtdP?=
 =?us-ascii?Q?MElyoUW6aVJ0vzAye6ENcM8Smm1UFS7AtkYYT5xFHWs/s1Y52QWTXAgslNjE?=
 =?us-ascii?Q?a431sSWRcmGlrnP018qiaiaFrtoWhmWDu60KS7O7jTe0oi/VkX8QrCl6NPep?=
 =?us-ascii?Q?y2EguIPKKvrDj3iNEqAc78zWPc6Q+hyIsnOlD+e+JHa7wZS3R3HwCCMPO/1P?=
 =?us-ascii?Q?bkP0CLdjfs8s1EQaBoNSLYJsZ/7dkvx1uwOoJw8qGLXTxKH1wSFDOOYGBuM6?=
 =?us-ascii?Q?yVuCtgG0MSW9iwVqMiQGb5jFFrjZssOiV23f2HYFcWImQjHVkQZMNt3xJz9n?=
 =?us-ascii?Q?4Zg4L1/IlLO3dTMw+gD+18I85g7qMjbA0ZJz5nlbLEF2sxQklNVEqdTUsI0g?=
 =?us-ascii?Q?5gZlMZ7/y5fgzEMmAscHi/mpVr+YdurnOD20UpfEK1LStpYdk13GoqSOWhhz?=
 =?us-ascii?Q?y1c3dv0b/4yZhnm1PzCuPmkj8yuS7sf15NDOlZCZYvx5w8SFmk1sIvOHm8BV?=
 =?us-ascii?Q?OgfddXUnOuXzs2vhSZscTdu/nBCBMNc5IqML6RbO8gVTbC6yA4Cy1TavQoXC?=
 =?us-ascii?Q?w2Y69tP8ap72yeJsgkayMlFDe29DUP4URGZ7veUCJMu6cBYYFn9mk/HHU3DK?=
 =?us-ascii?Q?xopsaGAHjzhxRK8vAN2BGSrOCiRAOwa6+rtrCeGfPPOBc5CDE3Cb39C1bn07?=
 =?us-ascii?Q?W37KxD/9953WXA9ZaKSk2BriL3sH5aKnxk7jGPcAxtvAWt0xJakFNk9Y6oXe?=
 =?us-ascii?Q?ZpQh0WmFfNCeOkcRvfmgryOIvbWMcpUTFKtTSBTxgQSdK/CO7TO1Af6XIxZT?=
 =?us-ascii?Q?SipKGOFlE/l8iX2eSswK1GW0kMcXB+OCjtWhkNS82q5Zl+CfzDB3P3h+Kj54?=
 =?us-ascii?Q?YXqSP/2tdWpzGF0L++Mp1ukOHRwf3Aw3ZztZGpCiCFQp2UWvy7ButgHH0T9w?=
 =?us-ascii?Q?b+555XaMzBSDyRVVL9YdFxsmx/ScMXEDPGmLpFr7SsZss1rLAcolMkB/IUnb?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lsYbRVX8NRdhyrh/li/vXagK66pR5GtGUF3gMpZjBpQ0rdLIV98vLb8Ot8qnyesHrN9JRGf5F3cRirHWB9Gsm8PfwAkSliK3tnm2qwxhzGNv7/zoqqSH138jnMZLWRGwqKJlOHCTGYrGkBIQHvmAFT0J2MoOmDcfHkrexg2vTHzsTV22FdgzSnbKRdpXstyyysHqj/637xr3qHJMuwDNw/HdfHn9I3TNtTGNHXXVauibkd4QUbo1IF412Fz3G7Lk5fb/FloLayYeP+qbktxIiKyhNOKFe3h0/1lNF/0/yh0fuM+483e9RSpgtxPEZ3UdomnyuvmqCDj/UqnbMbK0f1NF8DAn3GqYYS5Tx34euM+AX0ACfmcFshel+ioYOlM7TmFmZ7ZA600Aq3YYbiD0VMBFY9voQa53FmqYB7+3O+Ii756mvZ1JCTp3XZ3Ef71hKAbPoctfYl5KkhgMYjXN1sFbS8R8pg5PEi0u5IaAtHVukTobTgteFeLg0MYc1AHXzlJvJ3FH4JMqRyYijFldRF3M5s3OT3JdXuqQv/NjbXroW2e9qtAKsEGr3IhxLc78drxcLNx+/+tq3j+bgRuC39XpadeJuDwnR5yHOguGxqo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c664152a-525e-4ba5-97b8-08dccc3fed35
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 17:43:31.7639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sX7MEq+De5IaMBrkAeAN626MHYg9fL1MOuUOhGE1QeyDErWwecNq23mTZ3QrfsDhCsUC3rB2fkvrVbuuXK4UxSThqtMT0nlmRNfTS2fFtKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6997
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_05,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2409030143
X-Proofpoint-ORIG-GUID: JWsRUVrdGs8IJjpjz4jFX-qrdZp399vn
X-Proofpoint-GUID: JWsRUVrdGs8IJjpjz4jFX-qrdZp399vn

On Mon, Sep 02, 2024 at 08:08:13PM GMT, Mark Brown wrote:
> When we introduced arch_get_unmapped_area_vmflags() in 961148704acd
> ("mm: introduce arch_get_unmapped_area_vmflags()") we did so as part of
> properly supporting guard pages for shadow stacks on x86_64, which uses
> a custom arch_get_unmapped_area(). Equivalent features are also present
> on both arm64 and RISC-V, both of which use the generic implementation
> of arch_get_unmapped_area() and will require equivalent modification
> there. Rather than continue to deal with having two versions of the
> functions let's bite the bullet and have all implementations of
> arch_get_unmapped_area() take vm_flags as a parameter.
>
> The new parameter is currently ignored by all implementations other than
> x86. The only caller that doesn't have a vm_flags available is
> mm_get_unmapped_area(), as for the x86 implementation and the wrapper used
> on other architectures this is modified to supply no flags.
>
> No functional changes.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

mm/mmap.c bit looks reasonable to me! Nice cleanup! :)

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm/mmap.c part)

> ---
>  arch/alpha/kernel/osf_sys.c       |  2 +-
>  arch/arc/mm/mmap.c                |  3 ++-
>  arch/arm/mm/mmap.c                |  7 ++++---
>  arch/csky/abiv1/mmap.c            |  3 ++-
>  arch/loongarch/mm/mmap.c          |  5 +++--
>  arch/mips/mm/mmap.c               |  2 +-
>  arch/parisc/kernel/sys_parisc.c   |  5 +++--
>  arch/parisc/mm/hugetlbpage.c      |  2 +-
>  arch/powerpc/mm/book3s64/slice.c  |  6 ++++--
>  arch/s390/mm/mmap.c               |  4 ++--
>  arch/sh/mm/mmap.c                 |  5 +++--
>  arch/sparc/kernel/sys_sparc_32.c  |  2 +-
>  arch/sparc/kernel/sys_sparc_64.c  |  4 ++--
>  arch/x86/include/asm/pgtable_64.h |  1 -
>  arch/x86/kernel/sys_x86_64.c      | 21 +++------------------
>  arch/xtensa/kernel/syscall.c      |  3 ++-
>  include/linux/sched/mm.h          | 23 ++++++++---------------
>  mm/mmap.c                         | 31 +++++++------------------------
>  18 files changed, 49 insertions(+), 80 deletions(-)
>
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> index e5f881bc8288..8886ab539273 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -1229,7 +1229,7 @@ arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
>  unsigned long
>  arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  		       unsigned long len, unsigned long pgoff,
> -		       unsigned long flags)
> +		       unsigned long flags, vm_flags_t vm_flags)
>  {
>  	unsigned long limit;
>
> diff --git a/arch/arc/mm/mmap.c b/arch/arc/mm/mmap.c
> index 69a915297155..2185afe8d59f 100644
> --- a/arch/arc/mm/mmap.c
> +++ b/arch/arc/mm/mmap.c
> @@ -23,7 +23,8 @@
>   */
>  unsigned long
>  arch_get_unmapped_area(struct file *filp, unsigned long addr,
> -		unsigned long len, unsigned long pgoff, unsigned long flags)
> +		unsigned long len, unsigned long pgoff,
> +		unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
>  	struct vm_area_struct *vma;
> diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
> index d65d0e6ed10a..3dbb383c26d5 100644
> --- a/arch/arm/mm/mmap.c
> +++ b/arch/arm/mm/mmap.c
> @@ -28,7 +28,8 @@
>   */
>  unsigned long
>  arch_get_unmapped_area(struct file *filp, unsigned long addr,
> -		unsigned long len, unsigned long pgoff, unsigned long flags)
> +		unsigned long len, unsigned long pgoff,
> +		unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
>  	struct vm_area_struct *vma;
> @@ -78,8 +79,8 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
>
>  unsigned long
>  arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
> -			const unsigned long len, const unsigned long pgoff,
> -			const unsigned long flags)
> +		        const unsigned long len, const unsigned long pgoff,
> +		        const unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct vm_area_struct *vma;
>  	struct mm_struct *mm = current->mm;
> diff --git a/arch/csky/abiv1/mmap.c b/arch/csky/abiv1/mmap.c
> index 7f826331d409..1047865e82a9 100644
> --- a/arch/csky/abiv1/mmap.c
> +++ b/arch/csky/abiv1/mmap.c
> @@ -23,7 +23,8 @@
>   */
>  unsigned long
>  arch_get_unmapped_area(struct file *filp, unsigned long addr,
> -		unsigned long len, unsigned long pgoff, unsigned long flags)
> +		unsigned long len, unsigned long pgoff,
> +		unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
>  	struct vm_area_struct *vma;
> diff --git a/arch/loongarch/mm/mmap.c b/arch/loongarch/mm/mmap.c
> index 889030985135..914e82ff3f65 100644
> --- a/arch/loongarch/mm/mmap.c
> +++ b/arch/loongarch/mm/mmap.c
> @@ -89,7 +89,8 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
>  }
>
>  unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr0,
> -	unsigned long len, unsigned long pgoff, unsigned long flags)
> +	unsigned long len, unsigned long pgoff, unsigned long flags,
> +	vm_flags_t vm_flags)
>  {
>  	return arch_get_unmapped_area_common(filp,
>  			addr0, len, pgoff, flags, UP);
> @@ -101,7 +102,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr0,
>   */
>  unsigned long arch_get_unmapped_area_topdown(struct file *filp,
>  	unsigned long addr0, unsigned long len, unsigned long pgoff,
> -	unsigned long flags)
> +	unsigned long flags, vm_flags_t vm_flags)
>  {
>  	return arch_get_unmapped_area_common(filp,
>  			addr0, len, pgoff, flags, DOWN);
> diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
> index 7e11d7b58761..02bf5353efbd 100644
> --- a/arch/mips/mm/mmap.c
> +++ b/arch/mips/mm/mmap.c
> @@ -110,7 +110,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr0,
>   */
>  unsigned long arch_get_unmapped_area_topdown(struct file *filp,
>  	unsigned long addr0, unsigned long len, unsigned long pgoff,
> -	unsigned long flags)
> +	unsigned long flags, vm_flags_t vm_flags)
>  {
>  	return arch_get_unmapped_area_common(filp,
>  			addr0, len, pgoff, flags, DOWN);
> diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
> index f7722451276e..f852fe274abe 100644
> --- a/arch/parisc/kernel/sys_parisc.c
> +++ b/arch/parisc/kernel/sys_parisc.c
> @@ -167,7 +167,8 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
>  }
>
>  unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
> -	unsigned long len, unsigned long pgoff, unsigned long flags)
> +	unsigned long len, unsigned long pgoff, unsigned long flags,
> +	vm_flags_t vm_flags)
>  {
>  	return arch_get_unmapped_area_common(filp,
>  			addr, len, pgoff, flags, UP);
> @@ -175,7 +176,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
>
>  unsigned long arch_get_unmapped_area_topdown(struct file *filp,
>  	unsigned long addr, unsigned long len, unsigned long pgoff,
> -	unsigned long flags)
> +	unsigned long flags, vm_flags_t vm_flags)
>  {
>  	return arch_get_unmapped_area_common(filp,
>  			addr, len, pgoff, flags, DOWN);
> diff --git a/arch/parisc/mm/hugetlbpage.c b/arch/parisc/mm/hugetlbpage.c
> index 0356199bd9e7..aa664f7ddb63 100644
> --- a/arch/parisc/mm/hugetlbpage.c
> +++ b/arch/parisc/mm/hugetlbpage.c
> @@ -40,7 +40,7 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
>  		addr = ALIGN(addr, huge_page_size(h));
>
>  	/* we need to make sure the colouring is OK */
> -	return arch_get_unmapped_area(file, addr, len, pgoff, flags);
> +	return arch_get_unmapped_area(file, addr, len, pgoff, flags, 0);
>  }
>
>
> diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
> index ef3ce37f1bb3..ada6bf896ef8 100644
> --- a/arch/powerpc/mm/book3s64/slice.c
> +++ b/arch/powerpc/mm/book3s64/slice.c
> @@ -637,7 +637,8 @@ unsigned long arch_get_unmapped_area(struct file *filp,
>  				     unsigned long addr,
>  				     unsigned long len,
>  				     unsigned long pgoff,
> -				     unsigned long flags)
> +				     unsigned long flags,
> +				     vm_flags_t vm_flags)
>  {
>  	if (radix_enabled())
>  		return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
> @@ -650,7 +651,8 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp,
>  					     const unsigned long addr0,
>  					     const unsigned long len,
>  					     const unsigned long pgoff,
> -					     const unsigned long flags)
> +					     const unsigned long flags,
> +					     vm_flags_t vm_flags)
>  {
>  	if (radix_enabled())
>  		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags);
> diff --git a/arch/s390/mm/mmap.c b/arch/s390/mm/mmap.c
> index 206756946589..96efa061ce01 100644
> --- a/arch/s390/mm/mmap.c
> +++ b/arch/s390/mm/mmap.c
> @@ -82,7 +82,7 @@ static int get_align_mask(struct file *filp, unsigned long flags)
>
>  unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  				     unsigned long len, unsigned long pgoff,
> -				     unsigned long flags)
> +				     unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
>  	struct vm_area_struct *vma;
> @@ -117,7 +117,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
>
>  unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
>  					     unsigned long len, unsigned long pgoff,
> -					     unsigned long flags)
> +					     unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct vm_area_struct *vma;
>  	struct mm_struct *mm = current->mm;
> diff --git a/arch/sh/mm/mmap.c b/arch/sh/mm/mmap.c
> index bee329d4149a..c442734d9b0c 100644
> --- a/arch/sh/mm/mmap.c
> +++ b/arch/sh/mm/mmap.c
> @@ -52,7 +52,8 @@ static inline unsigned long COLOUR_ALIGN(unsigned long addr,
>  }
>
>  unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
> -	unsigned long len, unsigned long pgoff, unsigned long flags)
> +	unsigned long len, unsigned long pgoff, unsigned long flags,
> +	vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
>  	struct vm_area_struct *vma;
> @@ -99,7 +100,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  unsigned long
>  arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
>  			  const unsigned long len, const unsigned long pgoff,
> -			  const unsigned long flags)
> +			  const unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct vm_area_struct *vma;
>  	struct mm_struct *mm = current->mm;
> diff --git a/arch/sparc/kernel/sys_sparc_32.c b/arch/sparc/kernel/sys_sparc_32.c
> index 08a19727795c..80822f922e76 100644
> --- a/arch/sparc/kernel/sys_sparc_32.c
> +++ b/arch/sparc/kernel/sys_sparc_32.c
> @@ -39,7 +39,7 @@ SYSCALL_DEFINE0(getpagesize)
>  	return PAGE_SIZE; /* Possibly older binaries want 8192 on sun4's? */
>  }
>
> -unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags)
> +unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct vm_unmapped_area_info info = {};
>
> diff --git a/arch/sparc/kernel/sys_sparc_64.c b/arch/sparc/kernel/sys_sparc_64.c
> index d9c3b34ca744..acade309dc2f 100644
> --- a/arch/sparc/kernel/sys_sparc_64.c
> +++ b/arch/sparc/kernel/sys_sparc_64.c
> @@ -87,7 +87,7 @@ static inline unsigned long COLOR_ALIGN(unsigned long addr,
>  	return base + off;
>  }
>
> -unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags)
> +unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
>  	struct vm_area_struct * vma;
> @@ -146,7 +146,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
>  unsigned long
>  arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
>  			  const unsigned long len, const unsigned long pgoff,
> -			  const unsigned long flags)
> +			  const unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct vm_area_struct *vma;
>  	struct mm_struct *mm = current->mm;
> diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
> index 3c4407271d08..7e9db77231ac 100644
> --- a/arch/x86/include/asm/pgtable_64.h
> +++ b/arch/x86/include/asm/pgtable_64.h
> @@ -245,7 +245,6 @@ extern void cleanup_highmap(void);
>
>  #define HAVE_ARCH_UNMAPPED_AREA
>  #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
> -#define HAVE_ARCH_UNMAPPED_AREA_VMFLAGS
>
>  #define PAGE_AGP    PAGE_KERNEL_NOCACHE
>  #define HAVE_PAGE_AGP 1
> diff --git a/arch/x86/kernel/sys_x86_64.c b/arch/x86/kernel/sys_x86_64.c
> index 01d7cd85ef97..87f8c9a71c49 100644
> --- a/arch/x86/kernel/sys_x86_64.c
> +++ b/arch/x86/kernel/sys_x86_64.c
> @@ -121,7 +121,7 @@ static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
>  }
>
>  unsigned long
> -arch_get_unmapped_area_vmflags(struct file *filp, unsigned long addr, unsigned long len,
> +arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len,
>  		       unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
> @@ -158,7 +158,7 @@ arch_get_unmapped_area_vmflags(struct file *filp, unsigned long addr, unsigned l
>  }
>
>  unsigned long
> -arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr0,
> +arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr0,
>  			  unsigned long len, unsigned long pgoff,
>  			  unsigned long flags, vm_flags_t vm_flags)
>  {
> @@ -228,20 +228,5 @@ arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr0,
>  	 * can happen with large stack limits and large mmap()
>  	 * allocations.
>  	 */
> -	return arch_get_unmapped_area(filp, addr0, len, pgoff, flags);
> -}
> -
> -unsigned long
> -arch_get_unmapped_area(struct file *filp, unsigned long addr,
> -		unsigned long len, unsigned long pgoff, unsigned long flags)
> -{
> -	return arch_get_unmapped_area_vmflags(filp, addr, len, pgoff, flags, 0);
> -}
> -
> -unsigned long
> -arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr,
> -			  const unsigned long len, const unsigned long pgoff,
> -			  const unsigned long flags)
> -{
> -	return arch_get_unmapped_area_topdown_vmflags(filp, addr, len, pgoff, flags, 0);
> +	return arch_get_unmapped_area(filp, addr0, len, pgoff, flags, 0);
>  }
> diff --git a/arch/xtensa/kernel/syscall.c b/arch/xtensa/kernel/syscall.c
> index b3c2450d6f23..7f048d368dba 100644
> --- a/arch/xtensa/kernel/syscall.c
> +++ b/arch/xtensa/kernel/syscall.c
> @@ -55,7 +55,8 @@ asmlinkage long xtensa_fadvise64_64(int fd, int advice,
>
>  #ifdef CONFIG_MMU
>  unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
> -		unsigned long len, unsigned long pgoff, unsigned long flags)
> +		unsigned long len, unsigned long pgoff, unsigned long flags,
> +		vm_flgs_t vm_flags)
>  {
>  	struct vm_area_struct *vmm;
>  	struct vma_iterator vmi;
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index 91546493c43d..c4d34abc45d4 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -179,27 +179,20 @@ static inline void mm_update_next_owner(struct mm_struct *mm)
>
>  extern void arch_pick_mmap_layout(struct mm_struct *mm,
>  				  struct rlimit *rlim_stack);
> -extern unsigned long
> -arch_get_unmapped_area(struct file *, unsigned long, unsigned long,
> -		       unsigned long, unsigned long);
> -extern unsigned long
> +
> +unsigned long
> +arch_get_unmapped_area(struct file *filp, unsigned long addr,
> +		       unsigned long len, unsigned long pgoff,
> +		       unsigned long flags, vm_flags_t vm_flags);
> +unsigned long
>  arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
> -			  unsigned long len, unsigned long pgoff,
> -			  unsigned long flags);
> +			       unsigned long len, unsigned long pgoff,
> +			       unsigned long flags, vm_flags_t);
>
>  unsigned long mm_get_unmapped_area(struct mm_struct *mm, struct file *filp,
>  				   unsigned long addr, unsigned long len,
>  				   unsigned long pgoff, unsigned long flags);
>
> -unsigned long
> -arch_get_unmapped_area_vmflags(struct file *filp, unsigned long addr,
> -			       unsigned long len, unsigned long pgoff,
> -			       unsigned long flags, vm_flags_t vm_flags);
> -unsigned long
> -arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr,
> -				       unsigned long len, unsigned long pgoff,
> -				       unsigned long flags, vm_flags_t);
> -
>  unsigned long mm_get_unmapped_area_vmflags(struct mm_struct *mm,
>  					   struct file *filp,
>  					   unsigned long addr,
> diff --git a/mm/mmap.c b/mm/mmap.c
> index d0dfc85b209b..7528146f886f 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1821,7 +1821,7 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
>  unsigned long
>  arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  		       unsigned long len, unsigned long pgoff,
> -		       unsigned long flags)
> +		       unsigned long flags, vm_flags_t vm_flags)
>  {
>  	return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
>  }
> @@ -1885,38 +1885,21 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
>  unsigned long
>  arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
>  			       unsigned long len, unsigned long pgoff,
> -			       unsigned long flags)
> +			       unsigned long flags, vm_flags_t vm_flags)
>  {
>  	return generic_get_unmapped_area_topdown(filp, addr, len, pgoff, flags);
>  }
>  #endif
>
> -#ifndef HAVE_ARCH_UNMAPPED_AREA_VMFLAGS
> -unsigned long
> -arch_get_unmapped_area_vmflags(struct file *filp, unsigned long addr, unsigned long len,
> -			       unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
> -{
> -	return arch_get_unmapped_area(filp, addr, len, pgoff, flags);
> -}
> -
> -unsigned long
> -arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr,
> -				       unsigned long len, unsigned long pgoff,
> -				       unsigned long flags, vm_flags_t vm_flags)
> -{
> -	return arch_get_unmapped_area_topdown(filp, addr, len, pgoff, flags);
> -}
> -#endif
> -
>  unsigned long mm_get_unmapped_area_vmflags(struct mm_struct *mm, struct file *filp,
>  					   unsigned long addr, unsigned long len,
>  					   unsigned long pgoff, unsigned long flags,
>  					   vm_flags_t vm_flags)
>  {
>  	if (test_bit(MMF_TOPDOWN, &mm->flags))
> -		return arch_get_unmapped_area_topdown_vmflags(filp, addr, len, pgoff,
> -							      flags, vm_flags);
> -	return arch_get_unmapped_area_vmflags(filp, addr, len, pgoff, flags, vm_flags);
> +		return arch_get_unmapped_area_topdown(filp, addr, len, pgoff,
> +						      flags, vm_flags);
> +	return arch_get_unmapped_area(filp, addr, len, pgoff, flags, vm_flags);
>  }

Kind of a pity to keep the _vmflags() variants when in similarly-named
arch_get_unmapped...() functions we drop it, but I guess it would get churny to
try to change mm_get_unmapped_area() as I see that being called in various places.

>
>  unsigned long
> @@ -1978,8 +1961,8 @@ mm_get_unmapped_area(struct mm_struct *mm, struct file *file,
>  		     unsigned long pgoff, unsigned long flags)
>  {
>  	if (test_bit(MMF_TOPDOWN, &mm->flags))
> -		return arch_get_unmapped_area_topdown(file, addr, len, pgoff, flags);
> -	return arch_get_unmapped_area(file, addr, len, pgoff, flags);
> +		return arch_get_unmapped_area_topdown(file, addr, len, pgoff, flags, 0);
> +	return arch_get_unmapped_area(file, addr, len, pgoff, flags, 0);
>  }
>  EXPORT_SYMBOL(mm_get_unmapped_area);


>
>
> --
> 2.39.2
>

