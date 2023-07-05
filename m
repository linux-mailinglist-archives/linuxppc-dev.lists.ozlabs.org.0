Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 839F77490DA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:13:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=rddnSNbi;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=iOZ01s4w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDSg31PTz3cby
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:13:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=rddnSNbi;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=iOZ01s4w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx1zs3qhpz2xG9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:21:13 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365EDkhH027786;
	Wed, 5 Jul 2023 14:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=HEjxbCekDzod+atU2kn1FYexmGAjLI57PU3T0wASxHE=;
 b=rddnSNbikAjI4t9Eh3h1hNHcyOuMIXheNVEkbuju6o3F+F3rG4bsJdjo3Q8OQbq/eRQw
 tKGy7vGJ0L4qJ+e/kYQC9tTTbxBkiDepD3QDocQRG7lg07NJCvy8FOtFlTOMsV9lNdnA
 uQ9O+AU5HLWKAVbNCqQmNWKC57vuGQ4Jmrn/RQ5Lgj2tVB5kGt8BnL3Xtz2+kIZ5FtUC
 pj5nbKBPmqmIaaFaCky5FEaiThn/n1ul/x+y9SwcqF2kU2PF7woNkpU5bIQgkuNV9a+n
 LIEzpk0VZXEbk3fP4Jj8XZXWlKn1SoXCp5V98ljiSM1oRIPSQSq5dQv0YaSViSXgzaU1 +w== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rjbrtehta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:56 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365DMtKk007264;
	Wed, 5 Jul 2023 14:20:56 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjakbnwk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAyJ6us/r9HLOx6Kpth5QrNhD60R1xAQjNzdvixdBAEb3fsZ8zQdrgHICnhk+p0uHhZJsO8EduABq7xCkcK1z//H2xxZL2g2xsZVLZmgT/UueIBeKH7oIuK3ZyDxiLc55Vz/bhSVK/a9bg291scvH6v7CPIwEhaWQ5wnyRwNm4yUm0PIBq7BEhRDGZPQIyXrqxJVBp8tMRm7J0laNUIK5q63Jfh8F5eTdityhxh7SrFPTpX3LOojBeWtLjt+OWYnP7YU5B4nKAey3ZUAmRbINEpcLC3Bg4vx2OHjL2fmfT3GgGHUy6fNzQdVpWTOKpzoBu9k/x1IrhUKNfkotOoMJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEjxbCekDzod+atU2kn1FYexmGAjLI57PU3T0wASxHE=;
 b=A1fc+gOtnRldUuep2FJtN/0QI8zD5qvZmPnErS7NvUU80k4io55GzxdUbtNg9I7u0eHqko7CETFuz8/1ffZHk/3vZWF3v81g5DviUJ60bSyTicu2bXhceRkSg8bpYJf05TtcXXdF7cKYCt6H9DTQK4x96Le+wZf8fJvDwScqz1HPr2t74SmDp0avht23dcf6hGNDjb64R30y/XgD32KEaAJVwSAUeSexWeFb/9He+jQZxLD610uY6Davg6ugX9VrQXunaxk1IzWQbrvWOsXwIeUYzqnwM0AmXRTT+3A5JtIX/GfyUHjArD8YqgmsHC7ZaPUyS7z5FajO6Wq7G7fgCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEjxbCekDzod+atU2kn1FYexmGAjLI57PU3T0wASxHE=;
 b=iOZ01s4w/Jsg6wgNlNsqW/8HldjlqlCCDoqcxlf/dGhYEIZkqnXid7sGbHDRLGbaPAhzHlsh163vr4o2qxNCxHUDsdJiW+AN19fITIN3LZ7O5p2TSJ4QsGZrZ2yGr7NKEhcM5JXptD6vYXccXolIF9FE/pRZmlVzLsvwsmTz0Qk=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA2PR10MB4732.namprd10.prod.outlook.com (2603:10b6:806:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:20:52 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:20:52 +0000
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
Subject: [PATCH v4 10/13] powerpc/kexec: refactor for kernel/Kconfig.kexec
Date: Wed,  5 Jul 2023 10:20:01 -0400
Message-Id: <20230705142004.3605799-11-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230705142004.3605799-1-eric.devolder@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0303.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::20) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA2PR10MB4732:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ed7b373-e8bc-4eb3-c0f8-08db7d6309d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	cLgRFC+4kK+EkBAO1g18Rtyis+9eFQWhJXAYU69lMchaSDd6Yo5B0+V2yMFZFfomwa2DYeXqFAzHR2HUGnvu7dvUe9TX0SbMDcphkkSx8V16BjwMHs/gPXW3cU0iPyQw+NClDT/rlSD/OelZ+7H8+2xdnpFlpygMXrGwVXLW/+fjDXeHVGBCj4l0+iRm7TTxs0OmgrSW418AIZbpeY72Yv3uQOrfqMgSswJzy5Na1eJ208PoxQCmKdYU7j3xe2kGS7QYZGKEIA2YLsfxncu2+Qav5NM1I/31o1cIVvDLm6JJ9/S8baxg7l92cPXZix6bUbfs1hxEOsEJcVlfpr/ZWdJBVQQBoiW4+6Q8ToOhKsEaPylFOGH94P3QBrV2fzkiA5f7roVfV0VKakSgVNjAMr+kPw/kOt+U5OV/9EkGFyEdmdi61JJoCg8egeBngr6ahfsCaxIDEE4897cVTyBGa1nU+Azj8SrBFhX4pRHTTfZI2BciD5OpUhcD+WMH2yRMb8WzAxW75TSnwAMlMmQORjaRSLq2vXo4fjPJDOf5ssbtOt/5Jt1uNEYJbj+aHhbDQ+Dqzum3AgCP57WNkokZgKvHpWlF2Dtl/sK+TAfi1S8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199021)(8936002)(8676002)(2906002)(2616005)(5660300002)(6506007)(7416002)(7406005)(26005)(1076003)(7366002)(186003)(66946007)(41300700001)(107886003)(921005)(6666004)(6486002)(4326008)(66556008)(66476007)(36756003)(316002)(83380400001)(478600001)(6512007)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?alQZShCErjba8x0NgAe2V0Tdpj/uVpkVyQ2iP3+QQPz6PYVoJsk697oHUNdc?=
 =?us-ascii?Q?BSyi68b4nk6cAvDjsfKWY1A8T2Xpv3dlmlX4YeeujnVRcktDGwzYuX/jX4Ux?=
 =?us-ascii?Q?SJrFvbN8/fUv0cq8UgejADE48/xlV0jSUDKaLZVMDJWDWQX3YFOYZLjFVllO?=
 =?us-ascii?Q?C4XNQodjiPkTobtjzFDV5piaUrbwc5OlDBmnKF7n74I9CIC5jhm5NK7sycGO?=
 =?us-ascii?Q?nPibdshu8IJJFhjpMSWx/TbL50VouJzLYCvNQfXc9klXaRiEgtqxwxPbA2/o?=
 =?us-ascii?Q?R+ihZfauftYPHE7v4iNpO99PyBPQjcPsCDtMTOsrmX2kXfKVDTna3vpylApx?=
 =?us-ascii?Q?DwZ2cofy1b0B5Q6t/Kc3/CoDbXd32A/KT7X6P8njuB3DNN30bbcHVBgc70ew?=
 =?us-ascii?Q?tAjwoueOUsxutQCBejV78pkYWZtbDEAGXSlGpO9b6Z0PiUYK1vvPDdF4Z/eK?=
 =?us-ascii?Q?MPLbnXOvf2XrDJEAB6rXHdXKC19b4wJl35Ls4BPxZFgZD9vGoU86INuaOWW5?=
 =?us-ascii?Q?ArQekY3jovTVy5eNTl522/po1jxbbeJKFwFOIBuTxOIzuar+s+oC/Sm1erl0?=
 =?us-ascii?Q?iaYV68oDIOtDF3QUHNRJAn5DaT4AfdTeIE262ffCMo920pXqOFStfx0Od5Sz?=
 =?us-ascii?Q?SMbSbGWAJZDPAWYEeJgGiNXM5pJGdkTcnIqlI1E/DwPByCnlV9lvahwBRS8w?=
 =?us-ascii?Q?i9VYESf+Ea+jXF2XClcJKJPRYz7QlBDxR7Ge+sqs/1KEr7o08K9IcjrjYIlY?=
 =?us-ascii?Q?h3Llm84x01KMVkGDJFjcfn9LTLm8acy0Zod5q7D2dR0jAoGIq1VlWYuNnv92?=
 =?us-ascii?Q?66qnxvF92Jnqi6usIoU5sp06jfQr0tdn/YNqU4oTeJ8FtAtyM4yJQgSvXghM?=
 =?us-ascii?Q?caW+MTIo7w3Y2XRu9FLA9+tfxfJMhZPFDzkLxvNwbBN0+LzydVLPx24PT/BW?=
 =?us-ascii?Q?lH8M6p3z/FlHHOymGbc5rY5kWrccj807C2n1xjG8mPDg4NtXtavZNb3u1V/8?=
 =?us-ascii?Q?w3ub4qJcNgAhV+QNrI8/uEcabtMM23XtlOokhyCUQt52VyLvD/j+VhEFUMfq?=
 =?us-ascii?Q?pcU47zQaBZ6C/distAOpKH4DWoaQNTe6klFCln69UlvtU2US5tSusa0C/b90?=
 =?us-ascii?Q?VajAN6vOBkB7IwUioBok/G779pxiTUG1pvWUWyNcg2U5PG4GvyKpeocaPmPm?=
 =?us-ascii?Q?PxdPTwB2MEziVBZM2x40KGtz7JJ5FN2IuYlxQ6d7ZhzrHJ+UI4a0UHr9Kb15?=
 =?us-ascii?Q?rb0ihopjhXZiuizc5drrMZEj2cyiJCaXMZKY5+hUd6CFv0LXORQPpDhFwCH/?=
 =?us-ascii?Q?9XUvkHXv1oi5m2KqhgXxYnuJwFoo2nOfrAjK+3Il/rGX3NsCK4lnmSt5HN0Z?=
 =?us-ascii?Q?363LNLuF+pWbjS7ikqJxd1YungXM28QjiXC/7R+BFVk94nsuMtsZ2eZlFz4Z?=
 =?us-ascii?Q?gvRseSScEnyXtQu+uGxn9lF4CE0pRtfRDs9wljJF3CIhLLO6xWsgy9bcXbNH?=
 =?us-ascii?Q?jqgIgNYhoOJD43kEG7DnQ1zmcaUeO565TLkKy+jXBwaiJ6bJRR//EHWAcjEa?=
 =?us-ascii?Q?A3TPLDXuwypFG3SOdkQlOuP8dATU575ux2A4XInRzpKG9aU2UMtZ8ck+OFZE?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?uKWqXLjJmyaxYA2gbF43Y0yY4mcDtDFKz7kGEUdgaOS+q5ZEti8o9oIHcFkc?=
 =?us-ascii?Q?hHr6Dk7XAdbyNJPlqsjf5OWt8n/YRve/xn1YjArhzTpDyEyASjh2vFeXlYLJ?=
 =?us-ascii?Q?ufzaIbd6lZqg0Tq5L0pr3qzLoF+HM/Yht8KQ8imdkAnrUYB/GBoBrMnEjjjI?=
 =?us-ascii?Q?NtbEokek5VlP6bHynm3nycFA5YgWKQSXrlQQR8NHGx+brpls/99JyKl4RDrb?=
 =?us-ascii?Q?VL+JNK53Q5sMXRoYkcsHvtoqtDqmkofJjbXsgcH0XaM8lVrrDWgOFf38K+wu?=
 =?us-ascii?Q?xW2oevuafraNz8H1Rv/wIW0SfAAs3Ot7qUahptqwThVqKzh08FjIWuJEu4Dg?=
 =?us-ascii?Q?jZLijJGpjtyYcWo1jhBGUsjp8viU0mf/cmkKdy9Cn9W9wGCb1jvn2KUatHZb?=
 =?us-ascii?Q?LjaoGzN9gtZPUDilqXVY2slSO2L9a6T+UTjJ0zVqPlpe8ubz5xG+UNULc0Rm?=
 =?us-ascii?Q?ks2FPHXDkCJwY/Ki0d7ZiU/ybxhD0D5LR/euLwNxoNahkQMmgi/FpDD+Kdzu?=
 =?us-ascii?Q?iSsLTJTJRNBfsi3vYX55gxwCvXrMDkEcYA7hdxk3FcSrIg+Ro3EDWiABEc72?=
 =?us-ascii?Q?dEJrR5BrzvZW/UWoFWSKNTumgPZIt6Uada3Q0SlNn6zh/DmLtJSnD6+ZwVa6?=
 =?us-ascii?Q?5t0UyKrNllpK/+PSQ/l4MquuWNf9Rr98gcCi06NzCx/EiNsVpxmcG6+OzLtY?=
 =?us-ascii?Q?0qLsDNXyBa5NFB8GPOgzaci5V/8SDQvMOzRBBBPcZr5sbPxPRul48LaWI8tw?=
 =?us-ascii?Q?vg96L7jKo1dkDVvZJvmQfz28hL03OjWmDaa+FyCWnF9cff7xhmxekQIxtRVM?=
 =?us-ascii?Q?9KsZZqkIvuMOSxG71w33pETY2TxN6U7U5/v9azHnAzzkTHA6f4HIvBBXr1Cj?=
 =?us-ascii?Q?fhHl/MDtnSYMWGR+nMcci438jgJDfGOvWF4p0EOO+b9P73Nh872LUfNDCE6t?=
 =?us-ascii?Q?2wDnhMHlOUGZFnfSkq6ovQh+09FKdSfdQ7Dgi5FXRZMfKTDrRh3kTefTKBDc?=
 =?us-ascii?Q?+WNS7IUgIKTmGGchbnvtVsRhP93OwYsGGx1OHRub1sCMLNI3pr70na6j9/8m?=
 =?us-ascii?Q?7HY/A1ZHoUjinIZ449zumKlDYfrkzsFFCo17xfdEa/ClY/rSaXlhkxlrjiX/?=
 =?us-ascii?Q?LaUjgoyd4QBBZpAWw18bGcZSGRaVpFA2vTeMNIO5PDhJcNzWHSEbMJaNkrq0?=
 =?us-ascii?Q?vyYrzQ36Jtp5kpjDOWyBXDWVXzjv3oVCG235ODDZy+6YK0301Srgsmep/26r?=
 =?us-ascii?Q?rLbTMSA/kz7AEgkkWVnbnwQbNdTEaiirpRfv3OUSO4mhJpsfPRGT9WN4tge1?=
 =?us-ascii?Q?tC7seauPO7o9Aig56f7pUvlRNtGAqU62YuaA75B1W6/rzghK6iqj2BjU7zO5?=
 =?us-ascii?Q?IIYUpcDkvyR2r2LyhTIMRl8NsKSJAL0wiNq6El8NERFQYIdeUPOXL/RujT7M?=
 =?us-ascii?Q?ic8RpER5dN5GHlWAoyOzhrVrTJ/vXREeKBiLNUlF9dZ0H1sphNdhD3+nPg75?=
 =?us-ascii?Q?PkRnuwAufVAZ9m+WQ7iGfSKMDE58OWtPQPcZALSxnHu5k2ZaUt8UI7KwFs1X?=
 =?us-ascii?Q?DlZv01Zpi/AJ2lWdiTZCFqM3s7Hqnwk2UGNMN1tAtWWdZ+gY0JaMZ+SPROjb?=
 =?us-ascii?Q?16mTraSay63gvrXzQrnb/WaphZYzCUkoE++1GiaePn0Y20zsyN6rHVivjkMo?=
 =?us-ascii?Q?QBZu/Fd8o3VddFErJ8Nxt0GSIVrgDWhBZSqbeTBJW6xN5cyc8DbDgjdxG/kq?=
 =?us-ascii?Q?Z+yszNQbfSHWm1Jc4ccnH5GWH2488Y4mA9efhjukwG3CIPl3KzzlXYuzDANj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	uAM4WL20sa1BAMBleTrqRiAYD/zk9htkQ0RC/51qIR8r4bAShH0YB+Zm6EHvolxiMUIGxZbi+BZoWSzFrtXTjjK2N0/DNTL87w4mTSwxUUEqqfaf1PLbWnyhBStud/6RDOnHjDxqU8Xso5qn4VbYssnSwkB1nIks9g7fmcHmc6HM7HoKZelHyMbq7vQtvcTdo41T8u1m2hY3kkgaO6qHjXN9L5CH5lRLIi9meXuvsPm9qY1cNZfa4jND263Fjbxbgwe2Ap3O8/h7vU+FfLF+hVvLMqCpOTNx5pJ6tgqcmeJXF8rYnijNoZ/8wSQJ+kaVyM+A1F4DVZQsDhNnbHetvNVfZxZfXTf/NWLtilud4Umj4+AOXkeQLdOHaywIztdS3nbtR2nk6GJW6byl1RO0OBjyjb8rVSVf+ap4z5pjcnbtr6ZNp1pdIcUq0u+HuwwY3Af1wDAYBr7NNw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed7b373-e8bc-4eb3-c0f8-08db7d6309d0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:20:52.4500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTyPIQfqeKTUMVeyxiEwH/KluFfYd7RqdPvZgYbEs6hpsydxfJo08THU6L/q6oPjHsbuT12UoL1jCYpkHAIpxBFr+gQqNcATmRx4H1JqqfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4732
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307050129
X-Proofpoint-GUID: q87khbQVAcsjnGuuQLhSKApEW6HLr4mb
X-Proofpoint-ORIG-GUID: q87khbQVAcsjnGuuQLhSKApEW6HLr4mb
X-Mailman-Approved-At: Thu, 06 Jul 2023 08:04:02 +1000
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
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/Kconfig | 55 ++++++++++++++------------------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 0b1172cbeccb..1695a71777f0 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -589,41 +589,21 @@ config PPC64_SUPPORTS_MEMORY_FAILURE
 	default "y" if PPC_POWERNV
 	select ARCH_SUPPORTS_MEMORY_FAILURE
 
-config KEXEC
-	bool "kexec system call"
-	depends on PPC_BOOK3S || PPC_E500 || (44x && !SMP)
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
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	select HAVE_IMA_KEXEC if IMA
-	select KEXEC_ELF
-	depends on PPC64
-	depends on CRYPTO=y
-	depends on CRYPTO_SHA256=y
-	help
-	  This is a new version of the kexec system call. This call is
-	  file based and takes in file descriptors as system call arguments
-	  for kernel and initramfs as opposed to a list of segments as is the
-	  case for the older kexec call.
+config ARCH_SUPPORTS_KEXEC
+	def_bool PPC_BOOK3S || PPC_E500 || (44x && !SMP)
+
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool PPC64 && CRYPTO=y && CRYPTO_SHA256=y
 
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
+	select KEXEC_ELF
+	select HAVE_IMA_KEXEC if IMA
+
 config PPC64_BIG_ENDIAN_ELF_ABI_V2
 	# Option is available to BFD, but LLD does not support ELFv1 so this is
 	# always true there.
@@ -683,14 +663,13 @@ config RELOCATABLE_TEST
 	  loaded at, which tends to be non-zero and therefore test the
 	  relocation code.
 
-config CRASH_DUMP
-	bool "Build a dump capture kernel"
-	depends on PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
+
+config ARCH_SELECTS_CRASH_DUMP
+	def_bool y
+	depends on CRASH_DUMP
 	select RELOCATABLE if PPC64 || 44x || PPC_85xx
-	help
-	  Build a kernel suitable for use as a dump capture kernel.
-	  The same kernel binary can be used as production kernel and dump
-	  capture kernel.
 
 config FA_DUMP
 	bool "Firmware-assisted dump"
-- 
2.31.1

