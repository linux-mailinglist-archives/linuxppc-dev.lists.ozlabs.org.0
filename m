Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D3574A761
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:04:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=w+XMxjQ7;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=KlTQoaaU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxsYD44xrz3cK4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:04:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=w+XMxjQ7;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=KlTQoaaU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxrbD4c18z30XV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 08:21:12 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366KnwWI031502;
	Thu, 6 Jul 2023 22:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=3kigNhnm74JXGxRnSJyT7nDFiqhK3cJdGcRD4UntLgA=;
 b=w+XMxjQ735gxMe/6iqCigWhZr9fG4aBYAH+06Ow1Eg0SpDv38ZE+vWGuPy/JZ2JyPR7w
 wsH9NAoOgXiqwWlCT1ZO0SVgeYjZkFAYmfVaQUTLh8fNxvfyNoyNAdz7qPwOL/qXVhsi
 xEVc7PYDNOYBEo1a7ZfBrt7GXsB/1s+qOcM0nEUQeXsx+LvOsVMORFwk6GZLlFtilkCS
 ZmJqIOvnEa/1TzoXLEHv18CWVVmyfmSsTlUX4Nsdhvr1uHxw5o1he4BILfOR8GW8Wos0
 coOagXSWFGfb70IRMalrPWurmvUpI4H9te6Gppxxn1yvTM565ptoWmlF27/q988LaDna uA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rp507r3pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:20:56 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366KNLjR024636;
	Thu, 6 Jul 2023 22:20:55 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak85bdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:20:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cx/XjpuZ57PoSZJG2QLBYcVs2MqzPBP+elHu3PrtnuKTCo48uXmKPR3Y3TvkewcWmdbEf9ykN57TEEb2XpwcV3yZHc+pX97lIlzvqu/w3WrVMo169cTw2sCog/9Gcx3dgzbqsNSaC/IOyMViTjxHSA6FRSEmunXDsQqRgLPEmloPeU8oTenyFfm0/RzcglvSi2p7RjdG4balneKmglt7hft0/e0n1kC56Ro0jNMO3nGQaKaHF9WqmEHEpy0yzj8yoHsW57SUQh0Cj9so11bRBXCeBE54L1OUh0a0Xuy6JuFa7sbTHlgNz0YuFYoe8k73E/33AaZvL7IqcwwRlzTg1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kigNhnm74JXGxRnSJyT7nDFiqhK3cJdGcRD4UntLgA=;
 b=Uf6px4PbAzg0BW1VVv7sipjBav8hG3inFBFoMA5a2mZNwm2KAqlTOA1iPwExHTtHwLhMNfIamppSbQ5OsDwZJ2i1ePCb13zAkdDBeUbixkEYsFOHRe9PNKdqyYwAWxRLB5gmaHvsA45ZKJFPyynsVMZMp9dl1md/JtuwcemHNejGXI6XW4SCTl7toFD9WGKOJjDi6buYtoO4YimFwYEQd1gFZ72S5Wpq/C/6lElYF0eqtSkPFUKhqJGXND6VClHB8Yg6cCa77qYGB5tL713U3oaOdnLEjlZm8YGSbHxYlEh4HFMqELkg8worYta7lVURtOBddXpo0PgSUkRQEUJGiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kigNhnm74JXGxRnSJyT7nDFiqhK3cJdGcRD4UntLgA=;
 b=KlTQoaaUYiR79jcGuX4FC0kl2h/mK/SQrj90LbTmwU+U8b/kvXspKVkTFB3DqtYvFwkAiaw2Kmz85y9gUeWxAPdNWN417x7x5HF39nFAePGPVE4Z0roMO6dnSfmNHH+4JunKGm9TSmd8umbyKAGDvYKAQzZG1QXvilU+IwVhMRI=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4755.namprd10.prod.outlook.com (2603:10b6:303:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 22:20:52 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 22:20:52 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v5 04/13] ia64/kexec: refactor for kernel/Kconfig.kexec
Date: Thu,  6 Jul 2023 18:20:18 -0400
Message-Id: <20230706222027.189117-5-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230706222027.189117-1-eric.devolder@oracle.com>
References: <20230706222027.189117-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:610:b0::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO1PR10MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: a583d3c1-fd6e-44ae-b1ae-08db7e6f4244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	H1ytHpy61vT/7HlBCSWkWd11XUQAy/ht+8PWaEiwQ1M1s5qQh3YNdj+jFRRalTyUjojpkKbP3c2X7ntNPLHAWwot7HBJ/PIYlK+x+Ucpzd4I9bny1ph7Q1+OMr+QjQjwrhpAYWfZeaCzqMfhZLDCYcoR7Mi9jEWyde+DGca2AsXwpgmulOkOWqTChcJsJew7Fho9x1XlrdUfvy5CvhHh/fqQ9a34D2uo9Lrf5Qrke2/mdN2iezP5MuwJe4XcmnLaCBjj9HLx7gMGyp/E5OsWuLsoJiHIv6HZAYtwjDJOpNTxkN7b/58Rj0RI72mbXM21h8j7QyyQZ6SMR4mNtiIkikImRdFcKZyK3R9d2TZAf/0SGK13NYZem3b9DghM7I4SfQ1Jp+wE1mzBTlyHhJReHJ6djSB3s6tHuYeV9cWoiI1KWKlUxMlbDtbiGmyPWHC23VGwVEjJKE8SlkhW1xrt8YNFXh4H9QobTyqIPozzIVSUqPHG+vzS31VXqH0LdLQT7Obrv9LnTryZZ385OAqQq+IZ0fc6RU1uQhkSuuDRVf6yqgJnkKIs4fsiQudBrwDRCDbERVPGDKiWHuiTy/cNFVpN3kUzaZAcFzLv8XezZiY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(2906002)(2616005)(5660300002)(26005)(7416002)(6506007)(1076003)(7406005)(7366002)(186003)(107886003)(66556008)(41300700001)(921005)(66476007)(6486002)(4326008)(6666004)(316002)(66946007)(83380400001)(6512007)(478600001)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ZPWeixihFxbR8Lf2rOw4R/uRILNH/ar4fxCNuB0qTN7v+rXQiYlY1c49q0YL?=
 =?us-ascii?Q?lVZS3bKwI1mnIUdaPjon3nXIoax1us6EshjQ1mMKRFMzUXWHex3UaaCWTVwV?=
 =?us-ascii?Q?WLGnfvFA8bOeQJ0PXzjCkXrkSaqB5k3z+l1rBbN6abWiO9f/spcbZrt6BvR7?=
 =?us-ascii?Q?Au0p3HVCkNFnPdSGYUGRSmAiTFuDT7ogzEX9P3waFHTk0gwwVBkm7QP3u5Gw?=
 =?us-ascii?Q?ytqBqqT5Npqk8QL/yYKOvzsFbMbdth/RTDGDmIFVhT7kHrhdgZUH/yUKCI/K?=
 =?us-ascii?Q?zTrOs0NF+xxTO1Wm5mHvLf2WfhwtxPe317eVNpncSLiQdCtcL5zgGS+j+NgU?=
 =?us-ascii?Q?zdXL7NxZF2J0m0FasgxdTK3OY5XMtbmGOpKBiGmCOjTUYuWPrvNv4QiwFck9?=
 =?us-ascii?Q?2tC/qw8Vj67UVnpszqcS28B/0/Kigx45VXXUl2alxhkzQZ96056oFpYt/qY3?=
 =?us-ascii?Q?9il3BNDFaCokgSnFl3CO5vlGFRHbUdVDaz8K7JvVguPM0k0Oq01Sney6Gr/B?=
 =?us-ascii?Q?bSI36spMjT0UhVd9/tiY2tfd3yg67+u++U+TYVHoIqhBQawHsnarG3yC8CCh?=
 =?us-ascii?Q?kjmRTy5HDb+6pSX94GgArPehTgjkT+d+POzYMIf6BSNNCN3FRbjOLsomxYc9?=
 =?us-ascii?Q?ifmfQMZkDQa+doZyu5xWMzG8C8nh0kX8CxEafUtKegzH/ReeggbsxnYQ0wIj?=
 =?us-ascii?Q?/GFQS7XCSBTGR6V8pNAZVHI3e2sd5l+ivMvDIOaeXvv2yaMGLZQRHCQFL0DR?=
 =?us-ascii?Q?j1JIYdJAY2iO2+2HuHp4bjAQCrfg/EyJFFQkJb1Be2mxfGLpgFBBTdr7u2e1?=
 =?us-ascii?Q?vAY8TrmDXwnuvaOclA+Zqa8nwqBm9lYfzALNMKy4PeBSFTMNxZoM++l7keit?=
 =?us-ascii?Q?PEd0mvJJwkQMNDLYuD2GERqFTWMpLkH19wdgjRcjHqn3kCsaElRAbAlu2fHy?=
 =?us-ascii?Q?mFUXQreIqICHeYiiNdMqNvmBV8Okq3DZRhycSBAJFigP3RF1qpMk0XbKZINY?=
 =?us-ascii?Q?PKrySUWFM6hNvKo0n7qZ3qw3blVQnfD9RtePQv0ULvRO9kJupF40NYHO8RWd?=
 =?us-ascii?Q?pMwOqDKuFlt0ShBdnv/g91CzzIfumna+51Hj5LchR9vOZdpY6UfB1jLlhpVg?=
 =?us-ascii?Q?Nz6W62tgYyIFWUDJup+omvVUyNTzDtkZtnIRiydgmVCB46WfSIxPFVEi5yNW?=
 =?us-ascii?Q?Lcq1DuvIhR93xv/l0N3bWsqGD/+BWP5CJFNGgxni/n9uATOq5CyllTsnIRYl?=
 =?us-ascii?Q?rsQFzeuySGm264p+CRTTlOEtW7P8kTX+XRw8n4eAMRoRAdwra2S0m6eNofKO?=
 =?us-ascii?Q?8qij++g/ia7qp/w41wllV81xpjFumAGk2AQyU6d9pVEnf5SssBfv7wgsaW7w?=
 =?us-ascii?Q?9f3nL93TGYQNhKcpT6U2hAs8LalnijyUj11DyeIj108D5v0Vhj5tEHAZ5pfe?=
 =?us-ascii?Q?K9SX+2legt6+U27Vn3xItyFxUFi7znyEJhEMtPeHXUkuFchGnKKduay3avSK?=
 =?us-ascii?Q?ya/ZJ7UJAcxOlvCNcc+rbgJIJ6Yql35DP5ueecIbKWsqSZL7hhDppokdtOgr?=
 =?us-ascii?Q?BH2yIxGkI9jxi7jM4Zv6hBKsvv9ar/e+zPbAlGY2ivDzpapoBwQbCMu73TYr?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?4pJRCz5LppuTk/2Epqky2z4u5cmzSLZH1tPyVshxYd0GSlP/TGkAWOdmUl1e?=
 =?us-ascii?Q?GeyKqlwcEd7pgY5RW+DHUZqKZjXABHf2i5kvcKD9dXtW05Gok7W/Vu3EIC97?=
 =?us-ascii?Q?E81qj9UI5JYUWdCey8QUxeiexA1QtQF07p5Fd3lobCmkn17d9ajqCYoC3S9o?=
 =?us-ascii?Q?YPiU97h2M/2tABM2mJrQdsQEvfwSiZ9Kr/+ii5NLKjKHz/1br++DNjch9b8C?=
 =?us-ascii?Q?H0Xd1/S3brAE2g5PZ6zHTH436dEfv3e8YbB3Sg8X/O7w09fd0aMoy3m4tl20?=
 =?us-ascii?Q?bjYyzON8bzuc/RzWZRJBDRS7GZa7F+s+Hnbgne0VleVivV6tdHDIrkDB4Zht?=
 =?us-ascii?Q?aMgPqrbJ41qS+UrFFFvF0897E1blIyHHibndeSl48SsaomGiu339BVBcrLdN?=
 =?us-ascii?Q?UkCBat0xUCUMTml3ZY4z2NYXTe9KsXGz2qdq9+5y4aFthOQ8gSkPdAkjWygt?=
 =?us-ascii?Q?sjabQZyjzHADDMEeNjb0oGfSR2T4dyANj26Y4vmYqS3ui6AIghcw/DTAq8qi?=
 =?us-ascii?Q?mMtsyQ3hoE545bOgFYSejzjewgIA0iCM/1UZSyLFR6iZIUkc/Zb7Mq4H8Zmx?=
 =?us-ascii?Q?Gg0s/7l+41DMpfdWamraYJbzvL+3EoG41BXSPLrXzQrGc1BE2YGl8Tfj6SDQ?=
 =?us-ascii?Q?aKaaHT82Dw4IWGGVp3TmiNwfJBQAntgf5v+t5QtiM7nsvKk1Ow859k70Ho8X?=
 =?us-ascii?Q?rgdIeum3Ylsmh7Fe2GcdtIojY/FDxIvyJzKCVNghIghZTIIG0f2xdfAfctJq?=
 =?us-ascii?Q?yxyP+CyHjBgonW5oxG3tRLyQN+oaj3ht1xGVJp1/H+VyF0uv8vHHy8c3vDNa?=
 =?us-ascii?Q?kPmDytxaKR4as+4vZs+bTWaYPV5qHpnXZPUZtPEqdjnaNS/Y3+jdh+Z5z7Yl?=
 =?us-ascii?Q?KXhAp+A87JLR6FlIi31XPwo8+5gDg6lyk9yuLg3vH7jENc5AFz60FUpB/cY+?=
 =?us-ascii?Q?u8mTzztUS4ijJWdkIGLdTMp7pgy/1Te6e2fnx7k4B5Sfyo1nOe/F90gGf+D2?=
 =?us-ascii?Q?NmGw8kzyGMqyOWmtj3qYxOFkTSuhxEUNN7mW9qp7/tgm+oUGrJYIDvZev25Z?=
 =?us-ascii?Q?DzTj2NTh4wud5vSCFEAZFZjBfur2gcOvc1FxWKSUnqLU7gbC1RwPdOecFUvu?=
 =?us-ascii?Q?0sKXo/nB/agOqMk5veXBgqv5zKY4SE6dorY9QeGYMuRzQ7JjwGyynxh+mJH4?=
 =?us-ascii?Q?jafYX2y7GMJO9Q3CoECPbKlX0Lo/Y9dp+p9CPXOg+pgbfaxU8cLLbu8ZZgUB?=
 =?us-ascii?Q?1y82VL/LKEvUtxgNK+vA+wVF8Icr/lSkumSvWhdoraX24dO7Z873GUBHgZem?=
 =?us-ascii?Q?eHOxDGg/xLBzaY0rY1gp9J8+C/f3gGaH/QRqBfJkRXtQpnlvghZMb0wULhxv?=
 =?us-ascii?Q?BOqhNuds3uuJj7+RPfy2qiJPbaNYs91X/R/NeobFhCFmc2PbC5eH62yITzCC?=
 =?us-ascii?Q?E65RxVft7MvCpEusPQpOh+bEcTRq0vWdnriip1zKPbR9jh+yqp3ww5+MjH29?=
 =?us-ascii?Q?0srxtKpEywy73GeG1LUrEC2tHHKTvFMKKIxN9FqE63jpLdr4QSZSraElHPHy?=
 =?us-ascii?Q?IKOzFhzbqJQ9G7EwejHTEdpqjVOi/qtqLbuEOoCwsDYnOtlDSmEtK0G9k/1s?=
 =?us-ascii?Q?4erQJGO13q6tNzYI5Upgquhy/C8qqEQHagkVSY2HebjZHK/1cgCS6HTgp/qu?=
 =?us-ascii?Q?lGxykQWBY4Nazm7Tk9fZGmsGAldhd6JqEfg8dHOLPf6//huN2NAwjEBGhRTe?=
 =?us-ascii?Q?5fxHy9YrGCc/CqaT0GdIOHKWLUCwG7MisqCNhOvRKkxViwGa5gaVTYmYa++b?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	RLKrbMkt8YJVcrFNGGPWtueF/Pa+GqqFUENlAqz6eT79VD+MwtSRwCqEdwO5nNwNfodwY4T50dPG64vihYTlHJ/nntteb07NdIsdO3ph2uWn42KsDAY6y/0anIvPzQRKViiO3WsiMhFmJp6EK/261bbqdvt7KDONaISq/LjeygWf3xa5D40qr5H7/GeK4Rq7mI4c/vLG/1bGTq8Ibs16t176YLKa0EPGaqsL6vwAowp6Y2Yek2QxpXsMA+ScYDNFL2jFAwxo+KH2CO7hgPlqVEvy0dQkgLPyNQg7PUJDoVsTmxOmk2jw/EQHGbH5FZyaP4rrWi9ZzC4pBGutqFB6FzXjWwWACN4KOhMCjSHPW/nI7IhvgTIqc6FQdUiVaC7A04fwCwwgGANZH2A/poyVH/ex/05Ms/qof7GQH19BoYtFiNymGO5i+eZIUtXAUWKr+PpyQN/hArIneg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a583d3c1-fd6e-44ae-b1ae-08db7e6f4244
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 22:20:52.2534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEvKuM43SEtmZTnnqBRGMKjZkbgSPkJa8G/CYMOwStkhYG9HqhXQ+di52G6P4dXbfuRHx50nJAslYocmQrVzWlM6s7gA/73RV/FyGHUO5/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307060195
X-Proofpoint-ORIG-GUID: _WfR8R45NKE3oxJdP69z2ykjMR967BM_
X-Proofpoint-GUID: _WfR8R45NKE3oxJdP69z2ykjMR967BM_
X-Mailman-Approved-At: Fri, 07 Jul 2023 08:57:20 +1000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: peterz@infradead.org, linus.walleij@linaro.org, thunder.leizhen@huawei.com, hpa@zytor.com, kernel@xen0n.name, eric.devolder@oracle.com, ardb@kernel.org, tsi@tuyoix.net, agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com, masahiroy@kernel.org, konrad.wilk@oracle.com, sebastian.reichel@collabora.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com, hbathini@linux.ibm.com, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kexec and crash kernel options are provided in the common
kernel/Kconfig.kexec. Utilize the common options and provide
the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/ia64/Kconfig | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 2cd93e6bf0fe..88382f105301 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -361,31 +361,13 @@ config IA64_HP_AML_NFW
 	  the "force" module parameter, e.g., with the "aml_nfw.force"
 	  kernel command line option.
 
-config KEXEC
-	bool "kexec system call"
-	depends on !SMP || HOTPLUG_CPU
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-	  The name comes from the similarity to the exec system call.
-
-	  It is an ongoing process to be certain the hardware in a machine
-	  is properly shutdown, so do not be surprised if this code does not
-	  initially work for you.  As of this writing the exact hardware
-	  interface is strongly in flux, so no good recommendation can be
-	  made.
+endmenu
 
-config CRASH_DUMP
-	  bool "kernel crash dumps"
-	  depends on IA64_MCA_RECOVERY && (!SMP || HOTPLUG_CPU)
-	  help
-	    Generate crash dump after being started by kexec.
+config ARCH_SUPPORTS_KEXEC
+	def_bool !SMP || HOTPLUG_CPU
 
-endmenu
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool IA64_MCA_RECOVERY && (!SMP || HOTPLUG_CPU)
 
 menu "Power management and ACPI options"
 
-- 
2.31.1

