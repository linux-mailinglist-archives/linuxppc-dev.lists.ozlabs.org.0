Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0E7736018
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 01:22:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=WqM4nxFs;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=mULjRvrS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlQlJ2JV9z30gw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:22:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=WqM4nxFs;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=mULjRvrS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlCb73Bykz30XQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:59:15 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J9nXIf001245;
	Mon, 19 Jun 2023 14:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=ORPImzEqdr0GeZg1zAyETN5DQJcS/CdVekMvi8dXqQc=;
 b=WqM4nxFs8DV+F4dnzbxdIOyAUIQkEytd/pxTd+y9S6bgwLoxF5thOsyGiWVb76d6sX7K
 n+Qw87mU2wX7LMIfmRJ9NU54gntxOr196MQbE81eL23iJSZtDl4KTY/8FHtBty9aviM0
 bXrq8QKj4LvCfxh5fxdRB8w7CEEYcwXWw64xXc+qzULNzwC0b2f2fHnPhJmddKQAp5Xr
 a0MSTYmWOnke5gaLUiSBYr1CE4EpZrSn+PWD0xRCThaUE4lGJ4hiwEXdDpgVwHhu4ji2
 67FSqsgi/kEyXydXZPFItItobdWtyjyn6EHCEy3jCITegVoelXAKmTGKrjBH4EIJGn9V QQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r93e1axdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:59:00 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35JEwpwL008306;
	Mon, 19 Jun 2023 14:58:57 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r9393sphj-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6VCn6e/+kiO7KcpORb1+zFJftchM1UoOe+1ZX2ua85V8ZU+/Ls9xFmmKsNAH1P31txPq1tEjoUjQO2IMcahuPIKMx9Y2qEBjcuZa079Egde2K7VGDL/BZv3KHpftZ2J9yZfYBgRmOtBZdQyMsXCOGFvLRnpNuOUoeLKombYGSzshMvbHSNOQYsiP9hQsuhkUKgmIA2YNkM978NwBdnX3HAMU/lKN719oQ/47vQBgSmrkIxjweq2HrncbkpTMD9lxCARcAQJpdNyfv5gO1hSw+DIJRmnw0ozV2ESmEx9N9FvK9p0aPnMTRKsemyKt6Ue0OsUUL8aLmMTBN0OuWcn8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORPImzEqdr0GeZg1zAyETN5DQJcS/CdVekMvi8dXqQc=;
 b=TwK/phiXXD9bRQkFFfL/mpVrk6hK/MNFVA2+zt2TaJrAtqNNPAx/sGc+TMTQJeYE8KBlAQBNUgyXJvKseevUX3Xqc5hP2XUWQBNfUK5q1cBaAIv7u9RC1GH2hlKhI4FiXeRykBzP/T5g5klImfscwIvFmGJWlzRqUwrCQm1RRIfq6OQXNUEckksG2M9Jn8X44waNiO7YrhXCLEyK48SqS0OUaKS5EoWyjgvZJDkjJxphBDsLntbKk+G7rXnvyHVj1adyAkrBEu9eOH8R9zKFWvNV3lfUshlJ1RpPg8/FndkZQYy0VsSjxIZevzNZtowPQXkK8OdB4wzvipNJ54fbpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORPImzEqdr0GeZg1zAyETN5DQJcS/CdVekMvi8dXqQc=;
 b=mULjRvrSJ78PFMIcZuGc2uR4FzjcYIdYw9dtvmQwnJrLjr2R7NikQEyMG+2Fux2uMeAAjW7ggw+Z62WwCV8ODzMsDHHGuf2Vg6M5JGYAQ7j2PmQFZ3NTE03RsB7ZdRJp7jyMTrJk9aUs3bUv1B1Bzuy1iREl96DG4LHVy/h20Ss=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA1PR10MB6543.namprd10.prod.outlook.com (2603:10b6:806:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 14:58:48 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 14:58:45 +0000
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
Subject: [PATCH v2 13/13] sh/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 19 Jun 2023 10:58:01 -0400
Message-Id: <20230619145801.1064716-14-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230619145801.1064716-1-eric.devolder@oracle.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR06CA0054.namprd06.prod.outlook.com
 (2603:10b6:8:54::34) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA1PR10MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf47248-e15c-4202-7247-08db70d5adde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	x77CBwgAlXmply/GUxmfN8oqHG0djV3FOF1CEvZg7sos0EYVnPcSVA8zg7kD6awfgFyoIM44pfGjF7obClLolyP0Lo7uMIgZX+SW+wGsyTw5abvphi/dV5v2Qbmjio1+B0Hy7hky4/5dzjb6EaFNyxJ2e/lcy4r96mavZ7F3RuhJnH/5UYlUK4qC9lGv76nTgoWae9mqpoywQ7IdxS7Zod3eX3wHrOq8oBIs+YSk2RqGJXkjyAbVf3MzEuEpQR6QVXMmFhcyMFucUEqXhWZyrv0wIYMZ0VX4UsttslfwWzW7YBYCsyhDACShxTC0n6aAjIDoJUGpG05pAK7G4AY49ILy6DYMKyYSDAtb3s6Cdep5QSbQTftVvsa7f4qb4iyqa1TawBoVHPnz2YmFRztqn+VUPtog1kL8F5POg3sLkNw3bkPhX6iT43qh8HTaff5qOmjoet+PuELqjDXlgaNg8fhhni0wG3EMjZ7Egi7au/XIiMfcGbp4h2zYGfEgS+a3B8t1q+6ydsj2FjhS8QN/onDDj5bPDyuj0lSho54k9CjFyQWotD1nNR/ZZVN/YZP7wj1NdmHZz6GJxk1/Cv0r3Nx7KKlTxp0TI8kJfhwglxY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(7416002)(7366002)(66946007)(7406005)(8936002)(8676002)(66556008)(66476007)(107886003)(1076003)(26005)(186003)(6506007)(6512007)(36756003)(83380400001)(41300700001)(38100700002)(5660300002)(4326008)(316002)(2616005)(921005)(6666004)(6486002)(478600001)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?cneagd3kadn1c4MWTKL3NksIH80v+cg4VNNfAGE3RCK0r1n2SGJQii1V1ITH?=
 =?us-ascii?Q?L5ZVnRDe2mWtr7wdwgPkvtbus6ucme99ayh/3l3MBXoEqQv/G1FqWhBMEhON?=
 =?us-ascii?Q?CSOMG1jqmwkiZTZrPwhd1uPiNzBV2tbtIz7Bb0nT0Uhjxa5o6WKgjFH5WFJh?=
 =?us-ascii?Q?MFvDsyBLx6qs45ECsRN4FnaPPC+8iJvm3FhRZ+QxuELhdZZ93KKqP8yvkUsh?=
 =?us-ascii?Q?ss1PMwhQZ9+dj9W+uth6H/Ij/ff1K/NEW30/tVmlGnVO6l2XAenHCsmbOO06?=
 =?us-ascii?Q?PCm4d7i43R+y90eNCVyp1zsx47zjEbA/aJtpVi9DjNSddc2A4A2VgqgfGYLa?=
 =?us-ascii?Q?eslrTPlwTWh/DWIoTuZUhqE8nK/gCSqpHE3UfGgAgE2RJcHP+q6umBssvUO7?=
 =?us-ascii?Q?jnH2ga0+f5C3CP2oOi2/jrtkr/FHf/FcmzTDSn5b0ODfyLaKlCnqSZnA2Fuh?=
 =?us-ascii?Q?lBx64uy3T1MwOpqo9yHh/OioAg+f7IvlClmc5X6lA1kS+DlwynBEj7gn5nHl?=
 =?us-ascii?Q?w/ZSVrwLajcv+a4jcs78ImytQ3ztgXtQSifzxJMP1uq8VXuRkRlU4YB4CY7d?=
 =?us-ascii?Q?ca4N4jR2uFAjmiKeWnG5r0JswStJkJaHldzQrOu+hkofXwh/g6U/bY3ixLwu?=
 =?us-ascii?Q?6xtGW3F7uEW8+dxY7n8Juhy6urpctALzmvls6DPDUOWIlTFqzr8gFZpfUgSR?=
 =?us-ascii?Q?5U3xLENtCOAOlM53OIeLLABu1al11ttAExEjrajg/9Eb2jBShoCjOrfQVIKa?=
 =?us-ascii?Q?Or2iI/Xy6vkIe3nVRZXsaXncJosccrvwKkIAdG/05dSD60Z0H27fQ3Gr/rN3?=
 =?us-ascii?Q?qDvONeihJlo7AiSNsX5wOWcm04SeE05ZgEDik3sxDHlj+X+hRiJIz1DRaBQq?=
 =?us-ascii?Q?EUp2FYlI1/JooP6Slv9NOtAMBriil0fjaSCcVKIwsB8p68h5lTeM+MDA0vyf?=
 =?us-ascii?Q?VzDXTmExQphwnj/pjM66AInKJnpHBCWAR/Ervl8RwsPCi+15EZxAlWlEjRCo?=
 =?us-ascii?Q?iFLQAtosuXjCp5D7E7KwdghDm8PhY0uQJxU6q9282HLwIjLoeyMtnoD59atq?=
 =?us-ascii?Q?cyddVvXQaDglqNoPFcMbTc3lfWmFaGianoCcSDH4P3dueeAvYcQLrDSEhyj4?=
 =?us-ascii?Q?gtOwck29To2lZH2aAeS6IDCCfQ4AJbRSoZyMw/zPBjPwJl3ozVMUAbjpTMd7?=
 =?us-ascii?Q?nSmXJtyzgOEafrwBTp2SR7EOl6FQXd+gENr/04anZNR31UKyCxhHWOA1fhrB?=
 =?us-ascii?Q?FtEcvjDBYXNZ9tz+mkyal8EwL8y7DQejL+EK7NRRd2Qi9YYlcqBlE7ndqqKW?=
 =?us-ascii?Q?p9k0SaGhmIBm30jCHevymAtdg2DshnDxnpeWlam03XlrvyMOUHEfbK0/SN27?=
 =?us-ascii?Q?Ir4hF9XUEOgSBz5xvOtnoNOSPWGY+p3P5CXSZndddlS+W/xYgXKarFMXVVjh?=
 =?us-ascii?Q?WoDMRNDOW88Ow1LRy7IsTFaaECtF/J3zmiAIYm8mHbNbxs228opi16EntGtp?=
 =?us-ascii?Q?24ykK0J2aPVK0YB385YJFoCGeNsYsxpYERDjRA9VqalDviVCxBUlPufvMKcF?=
 =?us-ascii?Q?vWvnI5q0nmUDeUoLfaOObiFO93K3j8oajTfyrxDSxNpcnyfM+y9giEHLf+6A?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?tTtEDDVMzz2ExqQuaS2gRMdDLGnfc83ID7vax0eSSHq9pWrw9JhRQ0UPYiki?=
 =?us-ascii?Q?VBj1avgRPB5Y/uWqbObumTclDLKctWxq109UB1EO3rqQnc+ZQgeosKBPNt5N?=
 =?us-ascii?Q?P7uuAZsThfVHXNFrn81r7N3ze0WAGAh2BRvf7QHZ/DZYs612A37mkFlyo4kt?=
 =?us-ascii?Q?Xiy9R4ggctvsfTyTyb6XPOhc+c7Tpyr/xnZVOhOG2eCRAjkpF7QGDLWtFyv8?=
 =?us-ascii?Q?/b7+BKS/GWHLugGTXqYnPBbCSXZfK2tUnD9oLfohGnxs0t3eSl+OKuH84N0e?=
 =?us-ascii?Q?aYjvfyDrJmAM6HrneylSHagmE3e4jsZDdki4kn1kA1ixDljwC6yxHHGQZXpM?=
 =?us-ascii?Q?tQWnmX0ZSzkp0bkx0WWk+3tiIkCLFZL3wG04QEyVffyHMw2kKnwiYx44QReH?=
 =?us-ascii?Q?JsAX5yMJ9UuMdusTk7XkyKyClXBCKm0rQvaTFwQg91j7dxHmW7O0iLIzeMHo?=
 =?us-ascii?Q?4M6/H6cJcISOkNxgojLPQGzTpIrHmBriB1KDeInpCsykm/+hdhShuqkYSget?=
 =?us-ascii?Q?b39n17tq/aTAjFRJ/K/NinCKiN4tiUljprQkt3n9684MwTYTwCRtMDfdAw5W?=
 =?us-ascii?Q?SMMAWT4J1RwZZgvxNxHEBE7aHparI/DNhAsxR1H1sC8MxzQy6RoZ141pO/By?=
 =?us-ascii?Q?btqLyntiLI8l+9QjfhUSvPgj7xrSxqKvhGyn8vYLcaE4qBBorjHsormEjPUi?=
 =?us-ascii?Q?wPqNtJ0LH80upaUn3KPt8HJxPGpjOf/SQA3JczIGvQNn+8ETXm5sWYHJM+Mt?=
 =?us-ascii?Q?sT9HFKBBit182p1qea9T3/sQHthf11BqrScdWN6G1A4D3W6om3rTHxKV75GD?=
 =?us-ascii?Q?JvK6XafCLlO/G77GAwKBmeNAqDL3VOcBRN+HOCe4RkYI/sZudXHL9PX43E6g?=
 =?us-ascii?Q?PNzrDGlXn+R/p5ik2Eg46QGIQCBKz4lhS/LNMlwwUJs79I9tee3vx0sQcDEZ?=
 =?us-ascii?Q?MOV7aJWdLm7u71VvJxIRbGj6DvRTk30hBH3ECXM9xDyEOgwM6Rd72Kb5uqCN?=
 =?us-ascii?Q?oXboWuZpDxhFf/bNjRx1NSZ2S0gIT88Rtsr1McRvr0wqRyEDBKXiQG5tegN4?=
 =?us-ascii?Q?yq66iigR2SmyP1vL/Lc0Bo012jRBBiNMxfjTdBMIwzWec0EcclwkK+Ilewqb?=
 =?us-ascii?Q?tIYJraCrhNw7qD10Xm6sIhMPzmddJ7XOWl1uuDMeSlmQf2stWncl4tE4N+Ud?=
 =?us-ascii?Q?zmTTZijXH/geOtaekWXQw0rQaoJbK3mhLMU3eGCK7MbUJfeIRK1zX0XYLjnQ?=
 =?us-ascii?Q?8+n53EqZRetDRLvjm8kBs725g3b8nUd1a03BS00iVvpZ1m8VSrXNt3T4uUdb?=
 =?us-ascii?Q?5/vG9+QFO4GYoFEl2eO7Q/a6VKfXzPjGoFbxxUfDd0Du7ImUZfAVld5f/cBZ?=
 =?us-ascii?Q?FxKU1Gxj+gT8hbwMkKGAqmXf5nISyR3MJuSIYOElWHsLaCYo432UtIgrxOqK?=
 =?us-ascii?Q?KQKlO/NbeA/FLR4kTvofQNzqSP+QKr9O5Q/Ap3/ppYf1JjhIT/ii4UxNWHTR?=
 =?us-ascii?Q?lDb6SOFT0eFCnHjRjq/TfZyOfNC8ivy1T3hKWpxAFPlrgv51kRB7xa6uScJw?=
 =?us-ascii?Q?lkHwBqfU9bbWBea+6w2LbKM3vRRkU1CCTrq9OIbv9DykAKXes7gctvlKIpH6?=
 =?us-ascii?Q?C8/npZT+vs5PF5+xuVBtBTLqI4y9NKY72fiQt8OnMyNBxgdpheLFbYVwiqA6?=
 =?us-ascii?Q?4Ybk06zrFGNC6b7oppoGbDZsHhcnojtoWRfI8CaRJb0u9l+5l7COPui7XUDd?=
 =?us-ascii?Q?r2kSpacEn3C8xQ8rbGAXh/gaErH3cT5XljyGPbjijWY4xLfWNAxZlYqnRDzm?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	VzD1AaXs9G6Pm1vnE4A2aXBx1bB0L8yuiBPLC73rXEZkf/XjETCtJoKPHsPdCo8KrqlAlEIC6d6YIgOga+zFnR1CSd4WJYaRRDURHORyksjLI1+WZfnW4VNWzNO3EExKqbv8ThYMFttYfVpaeAaor1zGVrB/+g6XASIezUsQX0xeYDnaV3z7KIJMkCtNLIodDarK3Ui29RnBzsqCqhq7UcVrxzs2OuXkTpl40eXV/ZLp8756nhO0dloaynVuP/Na8N6ZYLmI+p2ytodX0hBbKGwVGlFI7CiMaZJklMR+wPfm3+JfPhq1Z7lxBQw0edzZRAsfSohqafurIiir5jw7CmQ58vyWddBbTlIIB+0W6Jdmw06c+R5hAaTp10NnOrkp+3fEH0txi0F1seqLEYnB9uJmEVMz9Lqlu3fKOAh2SZamIyfa36fzny7PPUNm2diIx/flWON6c6iWFw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf47248-e15c-4202-7247-08db70d5adde
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 14:58:45.2193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHlRHLCei5mHjoiM6FgISZVuqwT0BUy/vpdXtYIvPu0cQBgQCusrbj08pm8vtEupPvcED3HiWd4lBvPyhBLFNahc1UFdMFpZ6jR8qgFEDjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6543
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_11,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190137
X-Proofpoint-GUID: Yoa76NDN5UBFFqhIW0k0OB5kxGjv7QKO
X-Proofpoint-ORIG-GUID: Yoa76NDN5UBFFqhIW0k0OB5kxGjv7QKO
X-Mailman-Approved-At: Tue, 20 Jun 2023 09:11:26 +1000
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
 arch/sh/Kconfig | 46 ++++++++--------------------------------------
 1 file changed, 8 insertions(+), 38 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 9652d367fc37..d52e0beed7e9 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -546,44 +546,14 @@ menu "Kernel features"
 
 source "kernel/Kconfig.hz"
 
-config KEXEC
-	bool "kexec system call (EXPERIMENTAL)"
-	depends on MMU
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.  And like a reboot
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
-config CRASH_DUMP
-	bool "kernel crash dumps (EXPERIMENTAL)"
-	depends on BROKEN_ON_SMP
-	help
-	  Generate crash dump after being started by kexec.
-	  This should be normally only set in special crash dump kernels
-	  which are loaded in the main kernel with kexec-tools into
-	  a specially reserved region and then later executed after
-	  a crash by kdump/kexec. The crash dump kernel must be compiled
-	  to a memory address not used by the main kernel using
-	  PHYSICAL_START.
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
-
-config KEXEC_JUMP
-	bool "kexec jump (EXPERIMENTAL)"
-	depends on KEXEC && HIBERNATION
-	help
-	  Jump between original kernel and kexeced kernel and invoke
-	  code via KEXEC
+config ARCH_SUPPORTS_KEXEC
+	def_bool MMU
+
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool BROKEN_ON_SMP
+
+config ARCH_SUPPORTS_KEXEC_JUMP
+	def_bool y
 
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)
-- 
2.31.1

