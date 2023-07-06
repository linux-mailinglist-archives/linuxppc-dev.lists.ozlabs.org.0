Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEF474A775
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:13:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=sW4VDlID;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=RR5qWv1M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qxsl93NKqz3c3D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:13:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=sW4VDlID;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=RR5qWv1M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qxrbf3Gp2z3bkM
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 08:21:34 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366MJQvf005946;
	Thu, 6 Jul 2023 22:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=FEa4T2LxFEBeCSbzgjOzt025hlWGi4/xE9MdbR31G64=;
 b=sW4VDlIDWgHfuvEjBHrfoiz31UzJSVUrzpMjV78ZvcIgpJ6RyL5xqHO21AfW0nx+qtSu
 0Ody16UDoMyKQWkqR9tcPD6zDSL/jrwCmBWw7TNbyxdmnG/uOwA6831YAgDYcZMmBaV4
 2LPBkPRl/N5QvkodKvfvOFZqIoyWnwP+kJG7wcgxlAPTVpWKgBVd7JzjRVDQdTe5D/ga
 87fMoBx/Y6kgVqemcfklLcKpmvoQmr0uJAwxjrTAbZ6RNxcS6fvF2PwtZKGbua6FWlMz
 h1NGKeUdgaAKKezSERi58M4SNT1aLaekOFjN73gG2GRyi1FDzuEIaHQRHs4XUg0QpS0a mA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rp4md85s5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:21:17 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366KOxXS007182;
	Thu, 6 Jul 2023 22:21:17 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjakdmtu9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:21:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6dLsZREXrMdZiZMRXd+tWbvm/ynueIrQc29zTimCVLGwZRDx1DdJVJBdk/wQ4rec2UNFAa6xp8ri2UX7iCmCv240BUhQJelpvs2b7ci/VyBrx1zNIU7DMJKCZ+vgl3YGGffREACVL1CV+uCopPbn0xA0l83jefIQxIwUSe/KqGAQcB/lVLoomQ326gkmZLPdSgJddGLkARflVFxKYD9d+DC8rw3XXRLRAGlW5DzB/aje59G8CQVIEBhi5zxZ1Pwz3GUzudgxOvrxM2YriX8ZsfDJot7xRyr8ULPe8gQXjxXJQNEVS1yyZFz7tJOHDFw0msr1l0rWYen9Ji+Lhvydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEa4T2LxFEBeCSbzgjOzt025hlWGi4/xE9MdbR31G64=;
 b=SnQfTcjE0peN5gL8w1frsmT5KVLYm5eVtj4JDMwMVBVUJKPr5mJDf5qhJKEl+X53hZ3Qicf4i9QoTXzIKUxaAC3oA3CAb9SrqeyrC+a+id+zsA+bld1cMJ6xudNx6KaKOt5aDSUMEqFbqDAXbkt+ZVbZ/Bv0n++dUNnNbq3izz8tQ0kBdqPy2C9y7md78smh3KjKY92nYZC6GDrGnFm1UNRq1vqK1Nplnj86DU834pjZviHCm6hniGEK/h8be/cr2HgzYaxO7ce9sHz6hYpiEedDwF71nbyxR8uwOq2fVbG/NsGI79fFbgFupWfqfnqtaEnGdomef/4beLX1tZOElw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEa4T2LxFEBeCSbzgjOzt025hlWGi4/xE9MdbR31G64=;
 b=RR5qWv1MGMAcvZLGj/N/62CmTa7uSHvZHcoGVO5RLPHbXKyNB9DF5S2JBzIcU4sBhu2tfhcd5CqQmvN9gKip2W3cjfGNMd+LyIE9ewWSsjeROxGmyiHmDOf/YIFyBWjdNYXvx8uABr4B+uFv9m93Au4yEVFdE433dosNBDbuakw=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4755.namprd10.prod.outlook.com (2603:10b6:303:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 22:21:14 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 22:21:14 +0000
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
Subject: [PATCH v5 12/13] s390/kexec: refactor for kernel/Kconfig.kexec
Date: Thu,  6 Jul 2023 18:20:26 -0400
Message-Id: <20230706222027.189117-13-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230706222027.189117-1-eric.devolder@oracle.com>
References: <20230706222027.189117-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR12CA0012.namprd12.prod.outlook.com
 (2603:10b6:806:6f::17) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO1PR10MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: dffcfb82-6430-43ed-c3d1-08db7e6f4f65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3IlqLZNl9cdIvdcnQ2Lw0cT1pILxIHnxx8Db/aZmjUEuEpi2bmC6XvoAItqSxJqn4QS5uQ/IIDvbjovz9KGdCSDSosTD4jjvfz5rGynI/y62sJCirqRNz9RM4U43hH9A0wivqGkkC6t4dBPSHw70hfoTWG0Kvj4dzYcyfIzRZrVeBVuNWtzGRL6+yHXCLpxXekWgucKoD5oi9H2/vuFGoX4JU3xg4F2OXEla7n9/eFFCgv/ft9rWzaccy9E/mncKYxmEO39RB3CSmLB6rJWVFAqFRPyePq21b1b7DjQfHAlttM4zb/nvwSU+b9YiPDrXXgc1oxl5kZvWsvku+WjYxysoTDXeMkkKjuvCK9sHPIiZWJvozc0CZmjQukJLxZZ4BdXuhQ4/4s03L1ZW3NZ0MKwn0GHvTkU4OcEdE5u7TBaR8tzc3x7Pyty9QeFiNUmZ1ZBxs9Yt0wyAck9kRTzKxe8vpPjWWbcfY7zpexvRScv2EybEnp06aNxrUcWx9ezfirKAIJpqGq3prWYx5H1ljDXa1Tzfntt4mvJTjf2SZ8YqAPyIduo/4983k4Ah31bNQe/CXdsrLZvbyb08eDVnxfkLMaeotbw+TCEyo15TVgw=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(2906002)(2616005)(5660300002)(26005)(7416002)(6506007)(1076003)(7406005)(7366002)(186003)(107886003)(66556008)(41300700001)(921005)(66476007)(6486002)(4326008)(6666004)(316002)(66946007)(83380400001)(6512007)(478600001)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?0II6XJQjfaQTZlv+3hNh3rd7v8MIDo0ivWmNFfTwuWAKRrs/LvRn6XPE9Tzc?=
 =?us-ascii?Q?4vJPAHRL4s1zARWJTK2QknGjFft4aMM2hTentCZjtLYsTOz6wgtL8y8+PIGX?=
 =?us-ascii?Q?dsaCE9L1R5/gt+6xoF4CwMTEQSWiimhKm/0mosRiO6MOqr52QnY6tK8y+eTk?=
 =?us-ascii?Q?mCAJg2iG1oM1JtJCCrIdUGjy98KGw6oHXtbOClr3U+Sr3u79sTp/Iz5lE2rB?=
 =?us-ascii?Q?q4yg7X9b7t+Udm1cioC8lBrGyX9YJ7LaYVbasDdilsGVDzsOJkIp1oK0eZtH?=
 =?us-ascii?Q?a8OAmmzPI7Jygtm1pkMNbiXG08zZfEuWa/pnefXqTJarpH3EAkMPysQx02R+?=
 =?us-ascii?Q?m+5CZGoncvxaPy+rPa4+HxWSj44gyOFvzxwh/7Sq+Vonb0FLzBHOHLXWD4Ll?=
 =?us-ascii?Q?3/+fSd/04PoHxGn9+DNSJrehMGsimDkp4vgxYmF3PSjqsjV5cZm/BQ2XWKx5?=
 =?us-ascii?Q?MebaYGcj8jhbv3/1+e0VVceMA+jFhhug6qAZnenJZswz+C9g7ZgXxMJjUiKf?=
 =?us-ascii?Q?Etix0AwhcVQxjUVZ0OylPEOGPa0pqrfrJIrXxv59Cf1u6Whn3Jp2dFeg1xXN?=
 =?us-ascii?Q?POJP4OELl+F5GRX51jpCacluiCVIoxjW1Ct8/lqTKctbK05SJEnrHTNt9pv1?=
 =?us-ascii?Q?yrJjeoMrNSabSV/CN9fSWp4yN4VSt2OS+CeDDbQnzRf4maVWrsmxaKwlRpvh?=
 =?us-ascii?Q?/EhC+OD/jrrzfzEKdv+4PONdgdl5+mYEW3pBgk4ouf6nK4SoOvgJA9SX3iK3?=
 =?us-ascii?Q?cRUgFSGBZPlUmGPo+38wZL9ipC68NEvyTU+aZ0PI7mNPFSQhztvFOkyXcUZ8?=
 =?us-ascii?Q?wqLOziop0k7Wytke/M1Mdgj2y+P3cvdhwc26OTlJhWEUvuXMJI3oeFKZn1Ri?=
 =?us-ascii?Q?CQ9sz2tb3HBRwuoHrCXN6A0cpM56r0FVw71HZNOyDYhLWWVJDIWx3SPYVX+i?=
 =?us-ascii?Q?qFQ1uzdipOAP3c48UT2PKRiR5YAtfi+69Ta9CqMQf4GZrvTMSKJY8+yfmKHt?=
 =?us-ascii?Q?SrY9cvcdX+wpsH3sPRDmaxGpmwugPzv4lYjyZ7GkIMm4Wo1MZE6YFyJC6HiS?=
 =?us-ascii?Q?HPW5yIK7LBWKXcTxlb5rhIkr83BqU3EyQI5VlNAzUkDUWK26l7ylnrci35Ik?=
 =?us-ascii?Q?GgzOLcHUJ1Eh+AQlqtzxZTO+z4fd89nU0VeqrUvU+LP78QX31o9EaOW5A8Mi?=
 =?us-ascii?Q?SQbgHygTkwPDfOJVtj3RjurWbOgI68HY2qR/pSadIgNgfGoqcBjMh3+Lw8P3?=
 =?us-ascii?Q?JdRnoitir/EvRgoXhRBUQzURJz6Hsy9+QbfEruvMN6CZGhrjY6kX0UIXtUyI?=
 =?us-ascii?Q?/rLMEZ+rvUSIboJdfQ+GHGyOKCPBVfsV0JN5BLfURtRG3KsPKnhukl+Tk308?=
 =?us-ascii?Q?7ARbhqbHIh6U5/9VRnuxGkVYXMGsFzWWCRVgmWtT7Xfb1zmWa5pcJnrj2bqK?=
 =?us-ascii?Q?VtYPpZOwIkmGxm/O37IqxgtF9C0gSIuGfzu86AziAkqV2BsO8g+fOm5dT0yT?=
 =?us-ascii?Q?Fjr/sUAT3JCN1LW8IVIYlMX/mwbSPA4Yr0xBIct2NkdBQqB/LZzSvWs5Ydp0?=
 =?us-ascii?Q?nfvwD8e5l+ilQsKSOyFx7x29CSoT4HYXy0Kxpus5Oo6YYAzwJZTWsJacypGF?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?10sYcEHM87Ng9TsSU1gVt5JZ5e6H0G//zPj6fFtLYVdVn19vi7y6l0RE6a1q?=
 =?us-ascii?Q?OggfwuSgaWZslJvImmU06sUlgaqv0pmxBCC93RmvcW9hralCHSwSGmTSUGlI?=
 =?us-ascii?Q?2xWHA9/SUz5BeFWY1u4wwwn/nfpYCBX/gB2xDJKfk9SvKRKdTrLUJDdY4JRd?=
 =?us-ascii?Q?6zXu8hBXHVeMOrN0Fj4eZSjzraZNYbSbWBx/VuMzqlFVmab5PVP6zYUbouhq?=
 =?us-ascii?Q?wFOk6m3pk9zJaU+5+1NyFMgFvEEehHgsWKd7lUb5PAtHeEKy/6h39Cemj6MT?=
 =?us-ascii?Q?6RqylyVjF/8FcTxT+0wwmLuPIeGgc/43ZACH38qhw6d47nip83RIfiAI0EPr?=
 =?us-ascii?Q?7KiESuphqTOm8cU7jGnDRF9zjDzO5816Kgos49o2kud4HifJnluZH0VnGREq?=
 =?us-ascii?Q?GtJLcOKuHLpSolbklmUf1GvNCjDm47RTPSnIlVBAWwEHTrO5Z12m68E++B3n?=
 =?us-ascii?Q?18OznwaBKtIezc5ZGf/ehN135jTyyx660FWIIe+mpLRmj6kZCEjoWKHp3YiE?=
 =?us-ascii?Q?4dNg/FlEb/Jtls3OwGPwbkn/xNxdP912wLh7NvCgWWgPmlGN/uax8XEoXw0q?=
 =?us-ascii?Q?rjy3H8u5whn3aVXUuXPCZ2IjzfJ1e/rmOGftudjGWdQt+15IdZHMkdGCF9MJ?=
 =?us-ascii?Q?wSkZ2JK36tC/R5jUYWsIaaYS5XzkwwMZL18AD+AHVJ5wJre06sN6jSmb/7LQ?=
 =?us-ascii?Q?iW9pi2sbrUvb1RBRlWTN0rRJJgW8yOd+5aXLHkHz1682jOP+oTAwkh9dQBHJ?=
 =?us-ascii?Q?RGwx3QIDD5p48Ig0PUP8Ilz01q7LU/rNA/TX6zZq1lrk2ZsWA63E94i1f0VH?=
 =?us-ascii?Q?+MmciwyhNx0vwyxL0Gk8NSx1dkKDX82v6Db1aSp42O2itumwV0oae3b/xLsk?=
 =?us-ascii?Q?5KOPcs13A1Xpzl3NtI9nygShh6vkX+otQXQzzIczvvcrwX473Z+a7sU3GsU1?=
 =?us-ascii?Q?0zfh2Zd9JIPSeCZuvLajSbC2GvWyYlCBd86Az+vQwm15Z1+nOIgackWC5hPd?=
 =?us-ascii?Q?dAUiqqtm74azBXZzsEchwBFijZARuN+j2H9C0/N0GgAB/U7dSb0yc8TWwU5K?=
 =?us-ascii?Q?zRjEamZ8AKbCKDdj6s/ZQaeZTclPnRVQYdaAuu6pRbAzf87X3NfK2qlqNa6H?=
 =?us-ascii?Q?+hxy7CMh/3gyLgX6IwtoOEx10y3oJDTD6Tv2WkHrzL8JATXvP9f35rse+ayq?=
 =?us-ascii?Q?4DO/t5QQsgoKgmvug9C1nSNvLN53edlj/KVVyqcwjwWy1f4Bqnz01kR0+HAu?=
 =?us-ascii?Q?GWKpcHrMpp1B11yXg86cYh4nTYJuzBW1j1fZVZuq3I3WASUkGX0A3wyYgdWJ?=
 =?us-ascii?Q?DrTpyM4HPWp8QkQFKl9CztbleDX38mzCFjwVbU7wBtyJ5wKG0nztSlfZe9Sz?=
 =?us-ascii?Q?sp0nOHqYppfrkiyFL2XsrYgvtyw1DUn5YGt2qMWerbEhZLlWSFZo2e6XW1g9?=
 =?us-ascii?Q?0rGAgz5p7b56b8kw0M1zBfamjfbw5QrDmSNEWrIPSgLKNIRUoGIWmjsXzn+o?=
 =?us-ascii?Q?olCOCiM53/4wRBJLrM2nvoYkaqCNe6rCk4wkNtySa5O0FTaWl+siz/7aaac/?=
 =?us-ascii?Q?T8vYdBpsNiKzVrD4YOWry7jdNSk38yu0gjFQ0D67+KRMMVOfJGXtH80YuT4Z?=
 =?us-ascii?Q?4SMZCV4ouQ9TrC1mJRp3Wj8Sn4e0oCGk+vNEqBfg25w0wc5EuLwxrLYHFbWv?=
 =?us-ascii?Q?LkKHue95YtvnRhOnyBp3rNmBV6Cfcf65Jm16Rrx3ZZ+EBj5OK9eeTkL+vS3s?=
 =?us-ascii?Q?XRA1WJn8paRwXjYgaTIstsNkXuW9vk4jvMOvGWVOwkRxEJKPFNPdbwdZh/Pd?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	qJMnL5FUyE1svmKVBc9A0rmnG8PkjHe9e4Anqqca/VYTLVv9GmFKUCIrt4Nn3DeUAFb53Rbq68n46oNpieifDU8drY7/CHmrmqmDu4dYVkZhqSFg9t0LT3jIFof1aOvtGbTiHZM4TD+2LdSfqthOQNPhHowWCHGJ1MDz9VCylfXydQ9zptOx/ibNe1K0FipQnj+RPThXcMnTaVkPV6G8FiL3WapkPUugQqQ0uiJASZxVuUgrvP4nIb1ckDuhKzLO45otOe1A4Z92PEgXQqVQ/6zLHvC+MunkS+ZfbEWKPVoE4ZIdEyto4GhVD+m01WlDAAnMedwDHRUNVnkRlwcUXhqm24MWG/TMCm0yNcZ4mp9YFimHLWs5/srNNmAAytK9VwcBn9aFWZkUJNyHnrdzZUXCzapQCGyP+aV/ts40yDIFJgRCO6GbzV7NLuWYrmsSutGqsb9TntHHRw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dffcfb82-6430-43ed-c3d1-08db7e6f4f65
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 22:21:14.3283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUAGY4tCSyLr4nuYUNVJxTwuTzHNd8Vk6BxAcUEo2WC8J7dm/CgLqOCv3cWE86dnOR2FaV/1BNnv11bUuL5wdxW5kgCp5gnWpsgnFV3vOKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060195
X-Proofpoint-GUID: QTwjip3rQhf-D-UIohyL3nXZWocXs_Nw
X-Proofpoint-ORIG-GUID: QTwjip3rQhf-D-UIohyL3nXZWocXs_Nw
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

NOTE: The original Kconfig has a KEXEC_SIG which depends on
MODULE_SIG_FORMAT. However, attempts to keep the MODULE_SIG_FORMAT
dependency (using the strategy outlined in this series, and other
techniques) results in 'error: recursive dependency detected'
on CRYPTO.

Per Alexander Gordeev <agordeev@linux.ibm.com>: "the MODULE_SIG_FORMAT
dependency was introduced with [git commit below] and in fact was not
necessary, since s390 did/does not use mod_check_sig() anyway.

 commit c8424e776b09 ("MODSIGN: Export module signature definitions")

MODULE_SIG_FORMAT is needed to select SYSTEM_DATA_VERIFICATION. But
SYSTEM_DATA_VERIFICATION is also selected by FS_VERITY*, so dropping
MODULE_SIG_FORMAT does not hurt."

Therefore, the solution is to drop the MODULE_SIG_FORMAT dependency
from KEXEC_SIG. Still results in equivalent .config files for s390.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 arch/s390/Kconfig | 69 ++++++++++++++++-------------------------------
 1 file changed, 23 insertions(+), 46 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 5b39918b7042..44154246e4b7 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -213,6 +213,7 @@ config S390
 	select HAVE_VIRT_CPU_ACCOUNTING_IDLE
 	select IOMMU_HELPER		if PCI
 	select IOMMU_SUPPORT		if PCI
+	select KEXEC
 	select MMU_GATHER_MERGE_VMAS
 	select MMU_GATHER_NO_GATHER
 	select MMU_GATHER_RCU_TABLE_FREE
@@ -244,6 +245,28 @@ config PGTABLE_LEVELS
 
 source "kernel/livepatch/Kconfig"
 
+config ARCH_DEFAULT_KEXEC
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool CRYPTO && CRYPTO_SHA256 && CRYPTO_SHA256_S390
+
+config ARCH_SUPPORTS_KEXEC_SIG
+	def_bool y
+
+config ARCH_HAS_KEXEC_PURGATORY
+	def_bool KEXEC_FILE
+
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
+	help
+	  Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
+	  This option also enables s390 zfcpdump.
+	  See also <file:Documentation/s390/zfcpdump.rst>
+
 menu "Processor type and features"
 
 config HAVE_MARCH_Z10_FEATURES
@@ -482,36 +505,6 @@ config SCHED_TOPOLOGY
 
 source "kernel/Kconfig.hz"
 
-config KEXEC
-	def_bool y
-	select KEXEC_CORE
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	depends on CRYPTO
-	depends on CRYPTO_SHA256
-	depends on CRYPTO_SHA256_S390
-	help
-	  Enable the kexec file based system call. In contrast to the normal
-	  kexec system call this system call takes file descriptors for the
-	  kernel and initramfs as arguments.
-
-config ARCH_HAS_KEXEC_PURGATORY
-	def_bool y
-	depends on KEXEC_FILE
-
-config KEXEC_SIG
-	bool "Verify kernel signature during kexec_file_load() syscall"
-	depends on KEXEC_FILE && MODULE_SIG_FORMAT
-	help
-	  This option makes kernel signature verification mandatory for
-	  the kexec_file_load() syscall.
-
-	  In addition to that option, you need to enable signature
-	  verification for the corresponding kernel image type being
-	  loaded in order for this to work.
-
 config KERNEL_NOBP
 	def_bool n
 	prompt "Enable modified branch prediction for the kernel by default"
@@ -733,22 +726,6 @@ config VFIO_AP
 
 endmenu
 
-menu "Dump support"
-
-config CRASH_DUMP
-	bool "kernel crash dumps"
-	select KEXEC
-	help
-	  Generate crash dump after being started by kexec.
-	  Crash dump kernels are loaded in the main kernel with kexec-tools
-	  into a specially reserved region and then later executed after
-	  a crash by kdump/kexec.
-	  Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
-	  This option also enables s390 zfcpdump.
-	  See also <file:Documentation/s390/zfcpdump.rst>
-
-endmenu
-
 config CCW
 	def_bool y
 
-- 
2.31.1

