Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CE473EF66
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 01:42:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=TRPDUG7b;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=sT9Pbwqz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqkt50xV4z3c24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 09:42:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=TRPDUG7b;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=sT9Pbwqz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqXwZ1GMQz30XX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 02:14:21 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QDJRZY015711;
	Mon, 26 Jun 2023 16:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=0Ti90zr9CHvYUn0YD7JQyOkSlOhRnclo/N+h+OOW/Z4=;
 b=TRPDUG7bsi6X3ynNMy2P1UL0FaLeuJ5VNMjbxWoaKeCEaNvGRjBUD1+UPu/wdiMX9a5i
 tgAGRuWUl649sOe729LEXsbjZolDly5Lb/LAZQ/b7ycMxcWJNYOSOSRrZA+KfhHSfLik
 lD7p6kuA2B+XTPP53FIHaCC+fi2tKkRD/a7dUOfO5jn0zLfumv/BU0mBFfNwcxMpljcL
 kcVr1q1AlrwU0OA7/cmY9wDRbHzZodfG47cX16U1ypx35RI1Ssd8seMIk9J2LQXKE5nz
 mFAsHAwwVTdb+6u+xJ5Y7ZiBBsWsdmrkvU0v604oxEWqvIyTwvpkITrrwgZfaFuH8LPN zg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdrca2xay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:01 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35QF538x011157;
	Mon, 26 Jun 2023 16:14:00 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx39vtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8ZD0jcIRE6M5SLQfjE+Kh6FfTokEpyJweU6W/w2Wpt0+njwUs3ILWSv2UjNlQ6jGNXe3o3gV4L/fRXeXRR3LEpn3H6/lFppl7/ItP3OGTfO7ZVsIAduCf2mHlmYKwYDOhLP3fw3nyeGDOWzsHbKWBo2EuT0fKEaFhd0i+hGIOJPGMSvS96HNBmO70D+SU0EeIhmTDW0TfuBqUzF89Nd/Xf86a92OcWpEw9vz2RlaSUPMr3W4vEm510eVt7AoSaRJD0GQ3RCKWonSYNtnjtbbgtwy+w9ekbfWohJe8FUN10AZlX2Lmg0ChVjMmOPgSAirkISvV6unf2cyisfj6q8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Ti90zr9CHvYUn0YD7JQyOkSlOhRnclo/N+h+OOW/Z4=;
 b=Xuga7lpniEMzCy/ULOTGn3VZu/5PsA2HJokMnoJ7o3gNQp0pTXAzlX41vUbkkg3zpJGbMnJ6QLaQS4LocAH+qVz9rEz55au7XdpdiYVKy1KHtEAom+CGyC8KZshpgMoTiptnJ0hF5nv57t9jsrXPaLsWkeXPrfIdKTiIesUr4tYnYFBXafxTh6/bJpW7fDmbIeYC2TJFw9ECh50QSnO1NznM+1iivchfft1syZR6sywWyvgFVBdcM8ZuxEJbN8o1gqEEuBnMXOOOMutg8Yk8MYrmLQWE+VXYbnnqY1eE8wfHbZahEnAF7qZTSt3P1YRCpnYR3Jpq8WOY2NZsm3+sfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ti90zr9CHvYUn0YD7JQyOkSlOhRnclo/N+h+OOW/Z4=;
 b=sT9PbwqzwThGd90GkmKFwsvQZSnaPQd4ou/Hzkam7stChvRsUJhNIiYLUwSciCNqDfb25i1mkOxM9pqq2J47JWTaNBxAjzSemYnWBVS16+IX/l3urPAacxceWfb8f/Q43njnOim2V9iHOhmxBjzBuicwI3o/xMzGAQLmPtm8mLY=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH0PR10MB7440.namprd10.prod.outlook.com (2603:10b6:610:18c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 16:13:56 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 16:13:56 +0000
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
Subject: [PATCH v3 05/13] arm64/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 26 Jun 2023 12:13:24 -0400
Message-Id: <20230626161332.183214-6-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230626161332.183214-1-eric.devolder@oracle.com>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::35) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH0PR10MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: c7eb960f-e5fa-450a-0f68-08db7660579f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	uS7a1Ol/+Nu3Y4IxhVFIdJHLMaSu94cpo2pg8V1gMrIi5MFO1YVYfR8zcE/QAO1TK6iAhSL1hnInozp0eamXX1bRJgZ/c98uR9m66k65XG7fy2epAnJWtNaLHQR2J/PLP8eNOS4cUZaxy7CgOtoyAjYHVjPLoV+lKu3hCsjuVNd84zEQvjHfrnjPQt1MWtQ+5FQcQ4Ph/O8YGHkJfbYRWpcqjmpNxkv8olwABrCUMpAoCwc0l1S66lYRr/wTR+Md7cF8QhJ5nxawW2wKdyE/ObiTBLy9wijGem07PY8JV9frRIqAcqb/dug8kBMEkdb7HrsmG9s9iXW4KWoV1JWF2JxBnapuGWfNQcSjsfOKTzKMHlOnFS4ucW3Jv4REXM+gY3Pko9f9QUD8dYH37EOymQt22qoFfj+unuEuBuI+bW6Y/Hmf5DXMX/6geX920lHC4uXBLm5Czfx4GADL/g6dgu278krbL0N2SVGn1/AElH3d2HFQhMRykTBTghlS+O8lfb0QTS8dUbpMFChkGA2qe2+267wky71iFC6ugzbzGTxdrGM+7XsPCAFmPcLLu81MAlpl0S97oCfEBBG5BJNUKq358JTUl977MJFRn3Lxv4Y=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199021)(6666004)(6486002)(478600001)(83380400001)(2616005)(86362001)(66476007)(107886003)(1076003)(6506007)(26005)(186003)(2906002)(6512007)(66556008)(921005)(36756003)(4326008)(7366002)(66946007)(7416002)(316002)(8936002)(7406005)(38100700002)(8676002)(41300700001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?XQLuxWZ+bERdnfXcSabDKIajCG6f9vbdmJaNcy+a3HPD8c60gWfLPhxhFII5?=
 =?us-ascii?Q?3iCfYmNOW68y6y6z7L79nFsHkpa7RwElAaIz72H3w04Ie2UBZ0OTyal9JF0W?=
 =?us-ascii?Q?F9VCpe7lUiyz8zi11H5252q2PkQ8ydoNAmrHrD6B4UMsRjX/Ejz8t89qFgAD?=
 =?us-ascii?Q?SW+H4cOfGk1PqLHoAblBLg6f/4e5CqWvhLzoBTP7FqmLaTSJgTjjBzkThWDn?=
 =?us-ascii?Q?yrZWSkbhANsWhK4IWbO4VJYkYLtXAW6hj/FLjX1+9oU2djTPn2VfKKlGsBZH?=
 =?us-ascii?Q?j1+HTDX/OYEBWv8wzUfYXJV82riOjGVht5biHEn+qqY1TnL9v3tT0k+BtoYr?=
 =?us-ascii?Q?iOOx8RmNJ42npynYM2eErggZD/2CROqnLojcob0B9u8QJO9cTKpomJbDdrGw?=
 =?us-ascii?Q?EXnZm26+GCKUrE3UlYaH3WrPKMMg8sEEJhGgXzGaDfHv0UWfPCpO1mOKpBn1?=
 =?us-ascii?Q?9tzqBn79dD7rSkV4O3EZXcIiJ6rTPDBC9MkZ4CT8ypK/Bp1WXEwS+aDPSrAJ?=
 =?us-ascii?Q?lO1a8j7D+Ye84DzIYRunOm/gmt7y9MtWVBS0tMoYKqfcb7OmT4cHOPjUlJb0?=
 =?us-ascii?Q?RpTtBBLNqk1I4zewcUX2X9nc6TiLAnxWSv8xJf/WDlI9MoU1KGJNOLdScvzH?=
 =?us-ascii?Q?mm60OPlbZrTxbZ7EmwmaShgt/yrxnyz3LsPzjsQoG4ip9dH4buIv6tuBYRk7?=
 =?us-ascii?Q?JXwmttu3qFtmi9bf59fUS8T8phV2IX0EPYtKqhGuCX5vfffL26Up1VR4TMsm?=
 =?us-ascii?Q?j89K4+kmNCzjaPA27sulYVEyLY7nIZ2kDml5bXBbbszDKM9HWSMVfiIqnNKR?=
 =?us-ascii?Q?Ew5SDCeCC3qEQPw/0FNm/wjEzt3PCJLqr8B0vRwDu4R8iIfhXJWCwrbQd5Ic?=
 =?us-ascii?Q?Xn0irn2gIyT8SJpnxcd5jGlzXNDPWjYDTZ97ugSXc4GmCFqgVtGupHRl3w1o?=
 =?us-ascii?Q?5FSeR8OvYwDk0hXgjmvtLzdeqX5UHdqx/W3QR8S6YQs5/5/UM0+OWuGrnP5L?=
 =?us-ascii?Q?M2nTs6VkcIJarcIepGsvcfi04X9JlCPzbHKkWVn1DYug+a6wwxM2fUo2Y5OI?=
 =?us-ascii?Q?phoufen0V/QaZXhTTaTwj30GmJ+0Ojbm1Sx72am3v317RxaiDapZpWMJVaxa?=
 =?us-ascii?Q?BqKaowrrOMwn5wQ+ZM2hVQ/ZaPNviAIqpmsiYhKQxE7z58rFw3uVOlVl1yjy?=
 =?us-ascii?Q?4AuHklilQEkRAjyq0FcnWzlIXRY4gaLP5nfZzTf5hXqGjYzuHPo/LpxPkUwf?=
 =?us-ascii?Q?PBQIj+HJzpyJ96gSyJ/yPZAk/9X+pILubeWU3KVQw0ghITZd8prfIzpQ2c3s?=
 =?us-ascii?Q?RED+vMDtBcHRNX4Sxl3cz+cbrT326ZIcbvaHf2qadqurzqGWzqtq4rYF+ISi?=
 =?us-ascii?Q?cx2ROEyTKG4j96xExkLezqTebbVJBK5D7xQ/xoVjc1t1ivpvigjaIkLddfcN?=
 =?us-ascii?Q?NSasZZUPeZKyo4UtTBZ7zY/nbmQS3InJu8IoTfTpOJQY9ScdhGTOuD281kGH?=
 =?us-ascii?Q?/mV6RT6mge6Uzxshi4nPHWMAongH0qmccnSnNYQ3vwW2zKZCHKkR7Evq+oxd?=
 =?us-ascii?Q?TV7B1KrhucZaDkv7CAcK6yff1A62xEoM56iG0H8jM1IT/FUXMQGjf7oWLjez?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?/xtNEkbbGqP4H+ckHFjMDDQ/PB28Y7I7WBwh0eB1+g1D5ZotzYRI9nf8U7Gy?=
 =?us-ascii?Q?SvwTWRv+yDe7XOVawi3QGPC0VhzJrh3nKZoD1i1IM7eH5/8g32HltY2spAOc?=
 =?us-ascii?Q?KkGj86Tr0TFfj6bxisCZ6OURkxhGrKt8i7a0irONd3nh5uJHGMpOht07YKEs?=
 =?us-ascii?Q?ufGjqz8tINNOov4RFEHgPBJ2BHF96LcOqMa9EOSGXOGLkSbttnlvWF70QNyS?=
 =?us-ascii?Q?/PoXUEHa+Yi1VaarFOWnzYTouWl66HZWmIpGYoxTF5Fw2TH8w1BpqBuPDPKP?=
 =?us-ascii?Q?uY4jj8Cs9i+5oPfJn5H/Eic5SU5oepLbpZaJzHfjkzaBMfRloSim2PSeDU5p?=
 =?us-ascii?Q?Y+XWaFoVlAqAjE4nqK6aMfB1B0OS/LmgVwrRBkcl4/E7UOr38PeaYojbvBwH?=
 =?us-ascii?Q?RGkskM5pknhIuAkSLMroTKW93vUsrT4+itRd4Frlm2daKo8+/Js6cy+zVao2?=
 =?us-ascii?Q?fZ3Epni6Di9obI8JIpzgwVPqfU/VVucpHaXqkZK1wOCn/fd766t9IdSWwBX4?=
 =?us-ascii?Q?ICzr1gIhbf/IypXs7O4BHrZ3u+vlEhoJ8O2fmogchUy4cGhGn50netIj9pSA?=
 =?us-ascii?Q?Ivth9Akim/oo1cf6x/AZozKtvdcBFHkV4JyEqOOMxHY1ZqlNNKU8evfDRlrG?=
 =?us-ascii?Q?duHSYgKpmntFgtq3FS+xUKNadtv9IdJjSvMwryv/yPEc4xB+ecEdWwRo75O7?=
 =?us-ascii?Q?8Siplf+B1Ss3DvV7Axbjj5HM4NAIJtzyFS+lMlkqYL7tHDEX7lxqg2E5aMik?=
 =?us-ascii?Q?noM9Ms7Oxk5OpXAcdALHbZEnnQ8T++juE6NaUbiuS+WUR1P0EAxA/n5egUvk?=
 =?us-ascii?Q?ZYSD91XDIMNKMoj6czuFvRc640dPVPmdIWExOOzooT1BkgPFI6FSWIhuqYqH?=
 =?us-ascii?Q?0QbrxQiv1UdeXJrOhf9HyAllqOD2GlaJlK1a4cMHKeeG1WoJv9bJcepK/a5g?=
 =?us-ascii?Q?FuJvD1XiiMvP0VSH7E76CxkCTLl8Ns7G/+EcOy5p3tPg+HAkOUsPMhWXDtJH?=
 =?us-ascii?Q?IjVTqWDbZUyOiePJK/NmSRwqaeWjpIq6utG54pJpu7htYDfj1fgWNTLG19Tl?=
 =?us-ascii?Q?/QK2XH8Ylh8+q/yuGMT0z1Q+wUI1TxAp0GepxgXNCikUGJo87XJ+UpDPTeuJ?=
 =?us-ascii?Q?RR1fb7X/zPJ89dOqgRJYZCKEQX5XUF1mOwnFT0PWVWpIHjCLH8UYgcnr/rsa?=
 =?us-ascii?Q?/w0/GRcfSXQRIs7JB2wYPgJcui+CZJjQFW1W/DBfyIJNeE1Fx3cw3FMHoRI6?=
 =?us-ascii?Q?afo13cjsmUC78xvNs9Mn7AtWL05o44EiGJUaFtUvA2s1vjegpWCNOC4gui1E?=
 =?us-ascii?Q?qZ+ygHpZ8coiCk4w6sz/On8GmX1Ai/YJZmf/Cl++yk/38zG5Q1CVoMo7OZYv?=
 =?us-ascii?Q?tBrHDx6KtcordetUxZMNRf2OH6NwlfykeQNtWtgBIvjipymxGvBzm6w24Tf+?=
 =?us-ascii?Q?1BGknj7NZUvYTSHbhhajsEmCPKO3HUxAYKn/UcMn+cuwYZ2USl4q7gGJUhIE?=
 =?us-ascii?Q?2CZv549dh8vml5fWXdOjIIwjD040U1uikCN00ZqeSz8qrakMGRKeG69lM338?=
 =?us-ascii?Q?gXvhr0GCcNI/7+//Sctuc7DCm7fS0RJL2ZAIoY18d/KKZgmqdpzcKgkLq1vu?=
 =?us-ascii?Q?CtwaU0usuRx0UxOgtABFDhRimUscRsxeh61pzwszUZH1mvN7+3eLxer89tOo?=
 =?us-ascii?Q?ZIlvI+M35c5aDD/Ra7S5vJp0bXHWmwinYBZQjkk0sq04YirTCdCYNBwnLGVk?=
 =?us-ascii?Q?lMSr/bl2RwRVYGHzqRuq7dLKE3SPHdvEDfYSV1Yv4Yr8NgSKq2YPUJRkESn+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	CEbKHQ5uXy7zifrtcF6mqyduaEYusgV2qVrjnYzFbBkP6D0lc0nyOfhi8c23CXbcVLY/CAu3BFq7uM+kwl4aQ5B7uy0Q2s9JDuKTtH48I+u2VBTHyGA9qb3AbOEn4Gh8AEQSgnNFsssnkh30VhANfcEyi/y1QXYNcgcg2vvJrlBHOSTbubAnYETkvuSbQM90Z7oTS4pMN1Wh+3UXE8PY7ei9XB3vUtVMcDxhfD9OQrhmoqWmFjfIZDbVjchqDBq9zwqHU6IXFA8Uctgj15vNqO12WE5KboTQMlv34VRimAFFRQE6xdtEJ+Y3P7VniEQO+qkDhL/aveqS1NU4PdVYSorC95eO6c5mvgdiXi7MJY72juoHkSjCROkjCAqVz7CZToTdwgoT/qLmn0zHz+VRPiz3S0DHGN1dYKnYmU4gXKAeDIZy8IwY57j6JSJbft0rI2D0MSjFgeWETg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7eb960f-e5fa-450a-0f68-08db7660579f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 16:13:56.3728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XUptXlqDlGUYuzOQ7R4Q6rdMMZ+laUkunjNkZnXDKzVdnf/ySNWWx1jN9RY+sRVLq6u6/xcYrn1++mZ7xC89YVzj4LoKQF3RTXrtw3I/6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7440
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_14,2023-06-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306260148
X-Proofpoint-ORIG-GUID: h2Ncc2fa3ji8dTDOlgUcZS5D1yZHmC-H
X-Proofpoint-GUID: h2Ncc2fa3ji8dTDOlgUcZS5D1yZHmC-H
X-Mailman-Approved-At: Tue, 27 Jun 2023 09:38:37 +1000
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
 arch/arm64/Kconfig | 62 +++++++++-------------------------------------
 1 file changed, 12 insertions(+), 50 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 343e1e1cae10..dfe47efa7cc1 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1433,60 +1433,22 @@ config PARAVIRT_TIME_ACCOUNTING
 
 	  If in doubt, say N here.
 
-config KEXEC
-	depends on PM_SLEEP_SMP
-	select KEXEC_CORE
-	bool "kexec system call"
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	select HAVE_IMA_KEXEC if IMA
-	help
-	  This is new version of kexec system call. This system call is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
-
-config KEXEC_SIG
-	bool "Verify kernel signature during kexec_file_load() syscall"
-	depends on KEXEC_FILE
-	help
-	  Select this option to verify a signature with loaded kernel
-	  image. If configured, any attempt of loading a image without
-	  valid signature will fail.
-
-	  In addition to that option, you need to enable signature
-	  verification for the corresponding kernel image type being
-	  loaded in order for this to work.
+config ARCH_SUPPORTS_KEXEC
+	def_bool PM_SLEEP_SMP
 
-config KEXEC_IMAGE_VERIFY_SIG
-	bool "Enable Image signature verification support"
-	default y
-	depends on KEXEC_SIG
-	depends on EFI && SIGNED_PE_FILE_VERIFICATION
-	help
-	  Enable Image signature verification support.
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool y
 
-comment "Support for PE file signature verification disabled"
-	depends on KEXEC_SIG
-	depends on !EFI || !SIGNED_PE_FILE_VERIFICATION
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
+	select HAVE_IMA_KEXEC if IMA
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel"
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec.
+config ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
+	def_bool y
 
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
 config TRANS_TABLE
 	def_bool y
-- 
2.31.1

