Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E8C751394
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:32:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Q/4oUqAA;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=O7SIkKGC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1XYK0fMnz3c4T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 08:32:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Q/4oUqAA;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=O7SIkKGC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1NCj6bCKz3brg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 02:16:33 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEiEGP015855;
	Wed, 12 Jul 2023 16:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=/xWNnvvjj/YpAAMILqrnZ04bBw4w3zxg616EDnQCP+c=;
 b=Q/4oUqAAOinwvWtqWBZRDkTK/MB+d7k4KwYT5tJx0Q/E4mLumdY4B3ZD/vbLksky4/SB
 oeput/6sClP+vqEpDVVTHxxYk6hLqU8N2af/RD7LKI1tApgHMt6nkLFi7PQHiApBO5OT
 X8fT3yiKdrMeioU2d3GdaPyHmRAElLr0TdJjrOeFuD6iPouyxXA9NZhVr3dSG3FuC2L9
 WJJrK6JX+8P4dpVOv0D76Ei1KHJel56kk0v7cBv+XFxQYOv5e8j1vP2u1G3asQ+4LaYM
 dXYuAN63z+yFM8UIBw5rfQcViU1kzHsEdEfFIUz44KnfyX5foFMAkmxp5ELiis6+IelU ww== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rpyud7sx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:18 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEuuQq026909;
	Wed, 12 Jul 2023 16:16:17 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rpx86ubjp-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iO7EKSPc36hXGPB4eGPjMDHaYexlJArkp6kdO+7IbTsjk/LGoxd6o63a89/XJoWaPeSKbsDMB5RgwcV6WnJ/KlIdpBwzt9F6QMsSpxGuU9PEEfPaJPs2KJz9H0juTrhPLKN4iKKrGiVnWqvnZqSi3ngfUUmQfVIqmKttPMDL5H+Qzkh080Qg0uzm/9DRVtAS3e36vWnhogBBBHD3F3iUKjGZv3ev6/GEhuc0qDf5n2VLSKyxpK1wJToWJ1SytgC2rTu4dwQDgNqaW8lgEJHEmON+CG+pA9ZZR7UCRU26baZ18Xg74KcKelH4Q8EX3SyHypauFhQBMB8tk+QlKYAIvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xWNnvvjj/YpAAMILqrnZ04bBw4w3zxg616EDnQCP+c=;
 b=aAlp1u0R3mRo/jc0JHXSn8lqxm9kWzYdkWMLWit+97nD1TOtsVb6wkezcY40Wl38bx6GSh6BiZI17kUYsFILCm4q4DvkqEyG3jibkwSkdeKQUmv+vm3J30c+8tE2ljnmN0iHMoLxRk3PunxTnGcibOAblARiUsRdwU0qep3lLJiV0O4LN8juau3pryP55teugeo7UrTiyT1GVriqzh019DdW6Cz9h6ilLF+lJ9DWJ8FGQ17ZY+4+qGgzc6HIghPo4QESudj4iOKMwpFbunHzVEcTf6kQNPE8WEFnN1Ye4+CzJrxjq7p4DkbRGTcyGoS+6Clq2r/Lg9QT8tqTNongVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xWNnvvjj/YpAAMILqrnZ04bBw4w3zxg616EDnQCP+c=;
 b=O7SIkKGCowQi6WsvLYljpWlpmhvjfz33XG2DaLAIJa4oJ3SBdUAsDoVXwoyhFxYO/R3fb6qC2M+E9d0Yp+1FE0HreI+Md23KY3eFv1VLl4XVaO7BsmMzDVK+phoOy8TLliW9zyAvPHpMAredTN5e96u8+0dicoIfwX+ibNmf6NQ=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH8PR10MB6501.namprd10.prod.outlook.com (2603:10b6:510:22b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 16:16:14 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:16:14 +0000
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
Subject: [PATCH v6 07/14] m68k/kexec: refactor for kernel/Kconfig.kexec
Date: Wed, 12 Jul 2023 12:15:38 -0400
Message-Id: <20230712161545.87870-8-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230712161545.87870-1-eric.devolder@oracle.com>
References: <20230712161545.87870-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:5:190::23) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|PH8PR10MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: fcbe0a79-819e-462c-06b4-08db82f35027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	9KtTZqo3D6AYK5CiUHIsf3hhK1upumC/W3rcnHAX58nUqdVfhUKrV480w+u14/35TSLThDA8kNA6qnkCpNJV9hiu6nsNVAkcTeRfESHD6GdK9xqp/R0OOHr7ETOyLwg5AfvhhrfclRRQvo/fhjE7jphJ4+HLOsVNbfmVrupGSQsO/qBYEQRkp13jkoqIFMD2uNJJnqDoy5nv4tW9m+phth3ZwF3T+B3J3atsTmoQnX3gHtcfUNd5+oiSKgcTuTIUbGAeoiCB2KHKVxRncdTW54eDsh/ptEZMOx677JAtCouarUdQzYgF7H/wnzVkjiE6fLGiLtBad6PR7EvJKOCC8xniwMstQVv8SY0bjZ4T6xxz/euZtufRNIjnlbQkQDYfPOo8TERgABiZ+SwmGaDf08qal/MsA1YDGuQBsKAITd8293RGfEKxZF/+d6N+kLi+d6VbMe4+/GAgnGtr+GuWNv3ZpIpppWTTgJyInV1HSI//v1MJ4A0OY7AKJVfl7ciOH5GxbRMBKslkkVnK6GmhTYeI3/RsPLMY3mjYcCnMKxR9GUzPyxbhXzrR9YzaSsTP6eYVbe3c6cNdcvIQAWJYbFqxy7RM5kLQy8IXPvixii0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(38100700002)(478600001)(921005)(4326008)(86362001)(6666004)(66476007)(66556008)(66946007)(6486002)(6512007)(316002)(41300700001)(186003)(83380400001)(2616005)(2906002)(36756003)(8936002)(107886003)(8676002)(7406005)(7366002)(7416002)(5660300002)(26005)(6506007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?DyDjhcUvV5dDWUgHi9E2iQV7PYOQ6U2S6JCHiTkJUYs7qE6x6AOG94YJ4YLZ?=
 =?us-ascii?Q?9yb9Zqzw9mLTQaemj9FmSAswlw6soT2o9KrYqj0i1N4s1pRe2T5kjFiAMNoY?=
 =?us-ascii?Q?RuLxS5OiJAl4ATtK98kvI6oujA5WReb6mn3Nt6lsCEsGjhN52L2qVN/q8mKP?=
 =?us-ascii?Q?ggLBvYrqbykV6m+SN9LMK6W46viILVp/lRqWBbAbpTLKsepPhFjaKdnEcYcZ?=
 =?us-ascii?Q?WO6YUXo8tfBYtv2gx4T0N+SDDwS0TvLITdZ/GEUw8qB1nRnEctRuq5ze0Hn+?=
 =?us-ascii?Q?VTQUjYe5u4MghF6I9DjTHVfJCg2++VFgXbc2a7TKEkxDv6bninLCUNuELueM?=
 =?us-ascii?Q?4M0lDyatanQ0FhYwD8ZPzpd9uOIsg5U3+S+ItgLKQjybMHABuUkQHFJQmmtQ?=
 =?us-ascii?Q?vRMO3B5cTGD3ZoodxY6KRqvBBKS7lk0sCsmI4805aHmWrwH1xIKojnC3APZB?=
 =?us-ascii?Q?0KrWYqifhnfUda6gqO7lalRd69p0BxQrlRlJUE7OWgNRufI7LZIJorM4QrEA?=
 =?us-ascii?Q?wP6rw5Ultf0/AHJZZ9z/9TVDiUGwhk2wgHv2pGPnjo+fT3IS7GYy1muqNbZr?=
 =?us-ascii?Q?AURPDxBc/zbwacRkjSXl75SlKBMXAGBa6C5rFu+pWavmBzziPG3NjUqrMEIm?=
 =?us-ascii?Q?i8gagtc+OF3nK0kTsTI1lGvYZ+JRlXv1WmshCLP4zKOj73TVOUz10hgFnuoT?=
 =?us-ascii?Q?0dB1POxrcLIZf73iwmNPWPLcg2u0I1HexmnfN4/Ko0HJhlGO65MTrnkBJwEE?=
 =?us-ascii?Q?nm2/tU3FGH981mb9l/VPT9ZGZtRE+P/aHRCh9oO3eUBH6XUxF3zpeSXJJcwj?=
 =?us-ascii?Q?fAch83nb12ctWRH7vLO45aFW2xwlfh4U2YWkBx96jgXq3Sn00bNqItlAry/d?=
 =?us-ascii?Q?myITiY36muEkxmjC0eYzMb1IxrGcXONHVvihw8WxZ06xaY7/+aEv0ekgI3uz?=
 =?us-ascii?Q?MQplb1AGZyfVOzeHMskuk2pNpbxW4W3yj3TN8CUiSN7aKivVzjLGiGOTHrdQ?=
 =?us-ascii?Q?MHtSAqPbuXUppMhtUbJkqK59yfDQKgx3rYhSLyLAFg0z8b0QO447wLP+t7pA?=
 =?us-ascii?Q?QefNfpnzLvjpyXcAz0h5mmhjtlGgto9bu3SmnLd2S/Ncp1s34wBGKgUqcJFK?=
 =?us-ascii?Q?TKpL/tbzvIBECHgjtqt4usTN8RH5kDbu9dhoofBDzJHY2/ndvopDEjRQf/TR?=
 =?us-ascii?Q?Z94d0vUWxHvTBhRo7RlY0hLODa3i/NHJPVWlYNXaHmFhMj3cmn/+1rhxxJR8?=
 =?us-ascii?Q?EiJPMTS4IzjFECt0GLlnWnXvVlNHHEGYdPLj0F6zJAjPJKQ9txc+puhVdt80?=
 =?us-ascii?Q?7BdQMimWSmUTboz7BJtA9QEIWJJqmOUp4dzH43BeQ/2OHHDwyHnTQESE+Rvp?=
 =?us-ascii?Q?+xHpw3RMEh26Sf4YqB/Rv27icp49WRtvLrBYMQ134NJ41Pwym2XvlVypTzTs?=
 =?us-ascii?Q?UieNPo+my2jamiisZwPLseRdbk+ZUTJ0UyckRJ0QByGzAcZtvjOb9bxfqN15?=
 =?us-ascii?Q?UxfUZD0ExDh8syCBezH5+WB/qVWYyHZmcPbTrKg/goD2fLbkHUKH530fmCBW?=
 =?us-ascii?Q?rKU1WKD60lP0VT+jhPgpsD1G5GyIHtf5H4xlZVk7/Qq3xNimBMPkhugjbeZb?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?9PTJgLFKIHIeiFxel4fl0fXLz6laMr7jyICxWocu2w/gkzRazU8KyfzEE+T3?=
 =?us-ascii?Q?yygWBaeY8hwSv4g6HlVqZxozuBsHKOnB/6hKVQJU7KawbmJ/KT3sYBh4rBk9?=
 =?us-ascii?Q?69Kt35ShgyYncPqQFOiSMO+MflZ9jHdGbqga1ovmHAV20/pjijBSmKgxnLaI?=
 =?us-ascii?Q?pUrS+YB/05gf+R6UBPRsxsNfd0s+GXLprM2aJ2AxEbwkEgIrDqmLwAN++R86?=
 =?us-ascii?Q?H5GVrcd0WkSRsyULDC7NAXhFqwVpZLAr5qUSSeUHIcNTIQtKpmU73j08Y2RG?=
 =?us-ascii?Q?oulcPjmhjgJGiYA8jVZ2JlktL8iR/FUe84B4OTKjlyu7p5y1SsFL1HAz2NTN?=
 =?us-ascii?Q?gV4YsSihnarLSNGiKUtfQHWV40mo4bnKTA1eX9UwWagt60oq2b54H0n3npHF?=
 =?us-ascii?Q?Jcym2quq6O4PJa7ikpT21hNOHQDj0J+9EYaEev0QqV3UcGdYOaqZtBPx1x6D?=
 =?us-ascii?Q?4qy/RFPDPv0JNhpkNnN1mK/Pg89cEWUsRXUySxbhHD0mO20+rrSSfCzrlXhP?=
 =?us-ascii?Q?e9u/51+U4RG8+SVdSiV58Fx5oVL3oreP0LZtsWSdRqN2LTe7gK4e9/d9m4Aa?=
 =?us-ascii?Q?h912hIJ1/yfKNIOrM2wSRmdyH4M6KX53UplSKf9oahyM1F8K24Av52DRh4sE?=
 =?us-ascii?Q?z3+ihBqGg5+AZa8sdaRtSvPRvPh16qJahbnX1VKZ77+4GMnDBdyE98z9FxPG?=
 =?us-ascii?Q?fbB2dSJ8W6Z3CUOMvJojEpGNZuPHtn7jNoOcdzObfl34q3jtczPGwYD/w4EL?=
 =?us-ascii?Q?tBkDuh0/ABYaq900E0Ke9rwW7CGpGl1+ZDsp4pXWuVIuvAlFF2ViU5KiO3TW?=
 =?us-ascii?Q?N7jv97Cg4c0FJfhdjNGVTrx6/rde5etMzvSuIzowHWThYvxehTiTLAEa1ouA?=
 =?us-ascii?Q?CmMHlqF5Aen8kRLn8AFGXawdsjzDm7Fqd3GzdgSCIRelqOywoYdSWSJvKPDX?=
 =?us-ascii?Q?pQlLhmzMRLffST6WE8SYBK/Is1pXqdiJJ4PWHnaMWBs5wOpjujMC5+GJx+hk?=
 =?us-ascii?Q?0xjNBqbEGDLoXBjXaiMwtweJTfFIcMVOJoRnqOjNKdqQEJIKqWFkNxjX0QAe?=
 =?us-ascii?Q?6kHVG1cxKnObnevdcUA9xKCOBGrfQm7U1WYj84Y8QyAgXFZyii+MvSJ9+uro?=
 =?us-ascii?Q?cDvA3XSATItKV4P3KlqaR9ZnylvNZL8GiUGItKwUuLw770byjDHn4bcl/3YR?=
 =?us-ascii?Q?kiujsuU2f4WjxovEzQBeOGxdv0B4bfM0fw47f0OPXpakAk65kk2mSVCxJ1nB?=
 =?us-ascii?Q?fp8NuHBwjVI+0qlS4T2mmJitJcJ1Zkt3MN5mdkZzjB+Q5FGCieIxJUllj8Dt?=
 =?us-ascii?Q?Q41wM4QAmolA9okN4REWFtEk1dZL49QosU424T4PmThnzEhRa7RzzYjCv1u5?=
 =?us-ascii?Q?mSr9HDb1CkzxNFLzN7wVkl3jUAM0OM0YkUKBa/0DmkQVG9fenVSqMe+sGRmj?=
 =?us-ascii?Q?zuoY8Z0/NGWfiAm3FkwV/k+GLc1lZN65peh0a9KtK7aVOQfHAE0l/ts2SlGj?=
 =?us-ascii?Q?CAyfB+J0nz0IfgHRs++06l1r3lz0rkhnrhcywF3LXrzWkyttf0GlUbpQLmlG?=
 =?us-ascii?Q?N4a3IJFyBK820NMUbBEg6KKcrIjR57gbq82uMRZGdLBE+tgAr0Gu+Ln1gikU?=
 =?us-ascii?Q?BoSuX4YRMtY3uuGpA0NvPurQOMABorilvbqmXXpYhSjXXScLLw6uTV0sjsLI?=
 =?us-ascii?Q?4OoLNF2tVVvkz30rNtCHUa8c4JrubX/rpG0zKKSpVm8vB4uu80ltwuG9nNR0?=
 =?us-ascii?Q?gWb8QmizLGj2lC3/LJwqLqSQIIvjXs0JEBxmIFU1KzKHu85kNdj9kb3Ct9lm?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	KYw5h/PAh47nInHcwXP0ndnb5Dq5mxY6bx42EI7WMQMGncBCLi2cIjGrEHJuoiXYAiWbpFNW2qEwXSsclEfxJquRtYEBAcnvl8lUNRtQyIRjmTodgkRNooqzoIjv6LbRhr2eAQtbpGE9IzTo8gVsurWbEni9dSP6Zx67E8fnQaXh7wJlwaRprzld5UitpF7VAelUffg3R6lVTmzNLCImYBEW/6MeHqu1vD+I0aag9Hbd3kUvjZ4uh1VbnFZ65ay67a/zhXKlSU6F7Sb85sZj8Knhvl65Ce0Z5TuuLitdFU071w+9VVFAfL6E+NN1khAH1oZQGiqRrHSxAuUMv++vWDFVlBo1PljZXJxHg7FFlu7zckuTtdRUc9YvzzfNbHsdV8/tejMtU5kgSdlVLFY61INOuCq9DgUkXUsqF02goJyBwWcxM/a9lOyjtcNcbEwZnNi/c5m1aPXgxg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbe0a79-819e-462c-06b4-08db82f35027
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:16:13.8716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTj73jSimWa21c17NHZBC0ApQTpPz8fx1+YJx3OQDrY5zp/GIWVSuf8LmdrKI4W0fefrhhpitmyZxP4Ngkgf3GMM/+386u4kRgn3zB7njKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6501
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_11,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307120146
X-Proofpoint-ORIG-GUID: 8aXUl2GRW8nyLsZf3o8vxF-_WA9L6ZC5
X-Proofpoint-GUID: 8aXUl2GRW8nyLsZf3o8vxF-_WA9L6ZC5
X-Mailman-Approved-At: Thu, 13 Jul 2023 08:26:22 +1000
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
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Kconfig | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index dc792b321f1e..3e318bf9504c 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -89,23 +89,8 @@ config MMU_SUN3
 	bool
 	depends on MMU && !MMU_MOTOROLA && !MMU_COLDFIRE
 
-config KEXEC
-	bool "kexec system call"
-	depends on M68KCLASSIC && MMU
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
+config ARCH_SUPPORTS_KEXEC
+	def_bool M68KCLASSIC && MMU
 
 config BOOTINFO_PROC
 	bool "Export bootinfo in procfs"
-- 
2.31.1

