Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6807736009
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 01:15:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=ySY3mBJv;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=LQwy7JsG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlQc44P1gz3btj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:15:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=ySY3mBJv;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=LQwy7JsG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlCZx719Hz301b
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:59:05 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J9n4oX004098;
	Mon, 19 Jun 2023 14:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=0Ti90zr9CHvYUn0YD7JQyOkSlOhRnclo/N+h+OOW/Z4=;
 b=ySY3mBJvO2IUxm6p8Ixy25LDvb4YERXiujAlUnbiml3G0HRjEuGzmdN6AJ3SqpyG87sL
 ockNXn8KhRBG1JnzvoQPpKtpXJ9NOIkl5HyC7UE0Z1e6xy6xAEw1fb2OjngF/h7HjXgB
 zj+7iao5zOTl2t1epDq0WKFwlfrwiZD4kz67+dzfg4tW2bhBw6UGQWtp8uQZ6WfbGaqX
 Oo/GgYBQdpPveLAuOTlLppS96Vb/A5MrRAyvYWf7URMvqPfelkK5+FFQUylNTv+cm/PY
 r7TpTiYgyEo6LPTFsEAD+JgPRFRPsqLR+WbxzepTcqRJbK2z/cZdu+L6whu0He1iZejm 1Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r94vcjwcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:50 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35JEXvUM008354;
	Mon, 19 Jun 2023 14:58:49 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r9393spd8-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FP43QEGfiWJ7vElI1nUahqfYw5ztQa235n5aoQjGICkm8gzzVV8/dWmMlhGNUX+PoRUc/tBcsV8NgkWb/8qho6RW9lYc4sVPCmNLPf14kRiXMsWchbqKa1BhaiJtYmeeeoH2UfQGVvd6RH514ycPde/RpKXVpZYIhzc+i/5TYkMvLD2AmtiPEvC8kzUHOXkfdXQqVgzfkbvR2goPZBuqD7n1YKxGxBPquE6cYFvIVvPwQootFl3Hb6zcgVxEsVltwqbOySwbzCBWlanceWMEepDrZk2XuZD70pXht+JakKqIxx5ShHMJ7t+3KVgCMTa/S9HXfvxmhHsYN20u0ssIhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Ti90zr9CHvYUn0YD7JQyOkSlOhRnclo/N+h+OOW/Z4=;
 b=PXZU+VdWMMa94GFGhJyD3r/kW4J5ZLjXA1HLOhP4Evm/y2AubD8wG3XblvhHsOuUDblgqOPSbELTCmriaKIdz84LPDaCTOXewhYg4uihNuznz8yJFR5a6tFrWHVxTQZ4a0oZP7DJMM8mi5uJURPUs0ut6gIUrIHoYcNm/FCx+qTpAtIiml2rU3lw/PpKL0vvMrvy/lP5zsLYHj5jkY9uSkghcG2efuWeGfNawjpsiEbgAJ18dRg682bk0ukBjZlkWUiHP+j59yrqWcKXfJG+JDgT8Qb0s2EOP2qILt5gAmh0FKQPzONao4robppDKiifCZJyikAhAgZHnPswvi1hSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ti90zr9CHvYUn0YD7JQyOkSlOhRnclo/N+h+OOW/Z4=;
 b=LQwy7JsGCkofegtwCdewWUPgh9r3iR6ZiMrSeFzwPoi+rmMCvglGmFFLgXnE3WurhjDKeR4AZ6RlFg106rvfmGfXa0KOC91wQNfTD2mKGDdBHEvlB2AR7qSCmO3esY1Ultss4bT2XS1KYVDmgFiQS5bPfYf7wIs6NvW5kq51vK4=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM4PR10MB7426.namprd10.prod.outlook.com (2603:10b6:8:183::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 14:58:28 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 14:58:24 +0000
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
Subject: [PATCH v2 05/13] arm64/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 19 Jun 2023 10:57:53 -0400
Message-Id: <20230619145801.1064716-6-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230619145801.1064716-1-eric.devolder@oracle.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR05CA0077.namprd05.prod.outlook.com
 (2603:10b6:8:57::17) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DM4PR10MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aa3a814-f97c-4b0a-0445-08db70d5a1a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Lmzagkl3YWnfe/WpUtaBKsNrdzdbvG/lZwrteGsIJ3UplrqKtC9ljsk+thOiEeZy2qIIDmh781P0oysPMMJmhpOQjUe6+/6D698mjLWjCwslBPLFP3Z9z0qR8oxWjO4yVsyPUFYQfaWHjpKjrP0+zSK3Wi85j7lp8YTfZivFh9186SVavuV8CiON3UYtAo/un6Enxlcd8pgfx3Rlu2WDflyJBsdMTHqxEpU7UbFMOLeUnjvxzMtbaBPq8ZNm1u8fVd6Y/uWXpdnMYCPN7+BWGNtpYT+4pCSWQYMYapZuFfv2P5RcAPuz4o9l0b2X+9OiDwLUaBxIqzKbXUeuskGNvSk7mCXMB0sS605wZLYZT7XFZSitQU1fx15caIW0Pl0gqaNfcdfDurI93VCUHlNUG8me6FIfqcvgZ9zG872zo1jDyXHCq62vlW/2bdSt9C+UXc7tP+vy13u3LiQPmPtWFhBhjlHl/4p7bWCB3OfTSKjxK2kjo7KwqzDWR6QGKP9ohnK9NuKkcdfyn2gBXgEHXd3yuQoqetkjX1gmwI5AZdaz+2g/IEnpfQctsZ2Mrdk8PIAcQp/JN0VBI2mZKcU2oJt+0PfibS76vhN/48tIA5E=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(186003)(478600001)(6666004)(6486002)(86362001)(26005)(1076003)(6506007)(6512007)(107886003)(2616005)(38100700002)(316002)(83380400001)(66946007)(66556008)(66476007)(4326008)(921005)(8676002)(8936002)(7416002)(5660300002)(7366002)(7406005)(2906002)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?TZDh6RhVwOkfCHx5T5nr1eufnGUX5hu9M3DLm3KK0GkK0DphfGzYTNNNXGcQ?=
 =?us-ascii?Q?WfbWhMwhsp8T2wCKePNj8XLByVMtBApYbkkzmqEAnyM76EN6D3KCYjKk7kDI?=
 =?us-ascii?Q?Iqj8wRaDQUoZa4lDok1/u4s6rdZ7HSAIaq3RcOWkOxm+VMP4hc/NhJU4iL2n?=
 =?us-ascii?Q?xFiWw6/KvZHh2Wnlfv7pymwMA3eC0sDekHSllzC5g0H1F6N2CX+6n+W8ffe1?=
 =?us-ascii?Q?ZsXcE1t949InWwigNinnGlFgF85BI9zTF2PjdN51qk9Q9/nVx0AEOT5yrZTi?=
 =?us-ascii?Q?QPWMSoMw+EIjSC97Ki/4e5SIbalfsWJXGNuMpr/wNPXXm14R8uSr9yu0bGBq?=
 =?us-ascii?Q?wTqjsqnFn1qNEbs7JkDPhqjrwHcEQ9DO7g4CMK/kCDcgFzKO56kdGyZZSuPs?=
 =?us-ascii?Q?dnTmlk4aZwH3V86wj8QJla5KS61y3kSa3Mc6ET5vPDsEwbzEDzdFOke9MXHC?=
 =?us-ascii?Q?vEvVZMkTRIkHfBVyWuk4qnhSLoQPE+U3+SwFHAcHras/sIxTNI/kLkBYO0+a?=
 =?us-ascii?Q?xeJOX5bXLKF0MSMKdX9x1LQfkn34+qR9DmlFGK5pOcX+4g8rkk6qcpqZqFfL?=
 =?us-ascii?Q?ObkJc/5fj17bH5Fqa70n77xcLvH6tO+H8c/rvom4Pj3FwKm6qPJBvChhxN5F?=
 =?us-ascii?Q?n+A0UtKBa8hb8Y3iczLmujnvPKAwLUkdhfOefzji9L3dtCbg9EUDP3dTTxQd?=
 =?us-ascii?Q?7tX0eLbMcY1tZxkiXl2aFLQIMg22PZ1NTq2XWFZo51cjzqKoLL8P3a9ksFlV?=
 =?us-ascii?Q?7n45Kkwm7dz62h1DdD1nFtrDJquLqkyo7ffLdnXGon7Q023OQ7ulJZpCvPGT?=
 =?us-ascii?Q?03Sa3aSA0cfcCcvfusxWYgA1eJ8XuHZVknQGm7Zvy8CxFeGgjA39GVlRvZHz?=
 =?us-ascii?Q?PZQDqHVtDCcfwW+qQ/BALIdM4fjMz9zucRg1Psu4Z7RlannqK/fA5YT5N4ZY?=
 =?us-ascii?Q?hOSR2NOMWEZvjvyS2svexqpRDs0/caYigiVsIZiEHhZhJcPpegaD8Jp3PsY3?=
 =?us-ascii?Q?AgV1IxaN9wBUfNHZ6uTl7phco06eWuRoJvDEWV/hnCnin6+M5QH+9I2NFh26?=
 =?us-ascii?Q?IrbzrDXfpoRuhSWPwZdQ8TuGDmBQaRZ9FqYKq27RNaxCQi2YaQFEgvMoLR0s?=
 =?us-ascii?Q?T4FQJcZtTdbuHpT3eu6aQAGuQIfHPZaaXivX6KMkfHRIJsjDAkHgvAIhPESX?=
 =?us-ascii?Q?x5p3+UFnXAai0duAcL8Jja3iCNGuFyjr2LL4DbZzi2kXSmwDKG6RS19Oawn3?=
 =?us-ascii?Q?yb2OrRt+ozaoxm9IwE0VMKSoeDSdj5Vy6MAvr6c2d8/+ynfL1kVRPR/M6zIg?=
 =?us-ascii?Q?H8vinnYa1sutuuKXr3pIxLamsgiiBqyKBzUcOSlsJsXaDePKlc4flAuOnmSB?=
 =?us-ascii?Q?D1OU/rt/Inkwgigc/Yiu8hl3GlFG74W7krQ5dzNEO0CkyhCWA/FToof7792P?=
 =?us-ascii?Q?jcLzvXCn6c6+wllvjcFalOyRcNMDo7jw9daxQETrC27yGxRoUNg/HXLBl1nn?=
 =?us-ascii?Q?v4wAe4J+R0sECyB7u94NVIXAZuCuYJ3BxvkBhgsPOzn/AE3dABgZ6ZGMxAj9?=
 =?us-ascii?Q?IPjaMbCV0Pzig2u8m8gCohfhCb6pCKwKLpu4A77jpkJtcv8KW4KPI4M4O1rz?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?0ciez/sDbtEuqSoP4A7vHIv/p1B2eFP88mMaX/exePJxp8mMW52iNGfpvb+s?=
 =?us-ascii?Q?nd/VYIs1/woa7mFpL56Qdt/2bgjOLY6yGNsQEMNw2ghCnhqK+PE/MBrecTwB?=
 =?us-ascii?Q?Fm9X45UXo3/DH45yjig6Xdpxhr0H2Xyymv0iwl/XkK0kCVclGoJGYwY5eDuf?=
 =?us-ascii?Q?Jz/p55xRJMcNILkZXXQq75sNjnzeCukPMBfsnhJN0zeWpWFbiy0VZShOshjv?=
 =?us-ascii?Q?ZbAGId0dZ8G2HTium6N86Yff/DqmeYOETteWN4/YbroVLdPHV3QY180hPgbs?=
 =?us-ascii?Q?88vRMmerYq0BUK+UB6ZEFCkNCGjjztl8KLTO458ESBX2bztExkrIXe0im2P4?=
 =?us-ascii?Q?vD9c3Q6YsqHAtXdO49cwflnMgZzO9Yt1uWjaXy9K9sEFn8Vyd+7T+HDa7fBb?=
 =?us-ascii?Q?kNUZ2HaK3bP1UeTOakd2IpR70fYONYCPLGA0+/4rY9W1mMJXC20njwXVydQ1?=
 =?us-ascii?Q?nYyle6umuLDMHw+Hm1ftzormQbbLMq7XKfGXrXcIAyesm00i71iKp92lM91E?=
 =?us-ascii?Q?UA1J2xNb6zM4MP7psW7moGNHN7y3iw1IuZyL4WG73kUhq/Uw5MeY6MnRyE/H?=
 =?us-ascii?Q?aJngrKa17ytRgQzhq7SOOvJnXDCQlmCw87gpA0Mq8szHcRnKWgAx2PZZZclS?=
 =?us-ascii?Q?KOXWLF8yWaaTIVQv+PpNWfM94zYLx8nkklvnJjxTHJWn7nAI6GycJi99zl49?=
 =?us-ascii?Q?xMuqz1XaVyiIqP3uOLhFFcBiF5EatWbtLDOj66vevB+PTgmMf9aFWnF/dY8q?=
 =?us-ascii?Q?SJOcc3jvc1CiTsEWDUxZkFxO3ZRbFrtvQZw9opfrDgjmDKBcIF9zVGaivRr6?=
 =?us-ascii?Q?ly35uNmzxvYRRNk8Lfg4VrTv2StshtjOmUSd5Lnh97TPIbH6s9kn88JlzXGX?=
 =?us-ascii?Q?hsQst33up/e2Jal20kJf4vn9SPRfouJvjM2iMP2b5AvpMxPGrJ1crvITgyvD?=
 =?us-ascii?Q?f2M8bIjrRS7ePPMDc8q2B+BWT0BjfMaNNvNAZan3oSqEdONGQ5/NWfvra3PZ?=
 =?us-ascii?Q?ApvuUVLiP7Q4hsCs3JiaAiMVB3IyL1yKbO0IppCcNh8oTEvyQCd2r3UcjoRl?=
 =?us-ascii?Q?TY5cfiybh1GFphAjvHdcsl7X6dhkZK532DggiiNKg8Ime0LPHsMM3uDtHhQY?=
 =?us-ascii?Q?QPnOMpCZw87B5IqGWStnbHT+75EYwIIV6C/O5SWvpWffaiafyviD2eC5p8SD?=
 =?us-ascii?Q?NPwYM5C+o0AZYcjm5xVpJ7Urw0+cEOgcm+V0TcIu0GhJnnWcXKhhOe1TKmqX?=
 =?us-ascii?Q?k0+nKT3cg11RC4wdzokAnLV8IXoQ0KZ7WRcxMUfYhSeKLEU0YutcAWtGriQU?=
 =?us-ascii?Q?FTkUsN/2wvZc0CTbQTfY0KYRR60CYLG6PJjCGhqqIWUES+ClIzc9my+5tkc9?=
 =?us-ascii?Q?tGGe6U9bdSHEwBqV3j+ZCqM8vnd6CLsoL06N+7FAHq/nKHvZ7SFXXWX7GYeB?=
 =?us-ascii?Q?Mwlfk8e8tMj68UZujc3zgGftIAI3hIjExAMlrfmOij+F01p3MxLCeQY6u0u3?=
 =?us-ascii?Q?pEj/RT4UorJcbcO4sA84iVjBb7QGpkcFTAJZRhvnToqv+zWAcRgYby/x2UZu?=
 =?us-ascii?Q?C2CaVTm9TXyt2Oh7gY3IXZBdy1/Eck4ZrMQqikKU6C0LjFDRTRImVqKqis7S?=
 =?us-ascii?Q?qopCgMWPMyx2/gFiLjAXm8G+y/LYPCBBCbXw+2LMA9HYnbQSscsAvbMnt8T6?=
 =?us-ascii?Q?1ER0f0FdMw/QCXYIAGuCC7TUJ5jdA0Xl7jWAorv/AXWOIcAJOfFT05aqosns?=
 =?us-ascii?Q?TIDYaB+TjuEp0m4SF6C5JlhHN4C7JWqL5aZdKdakOj8ZKA7sdtGYiSvIr8J+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	NXrAklDJHZT6S7ZOQJCOoECy0D8dZQbViiHuwsvTbrokuTfu0BJVRsDFmlsfVkkOAk84h/+x2Nz8hfLkFrDlsqqJrd5eQG+p62OTKYW1r2A2oxQ3tLjl+KuJia1+7Fb4XxuApb2Zr1D2v2qL62dDynEpgeZOmVNgccSFHCDAxLSuiV1ZIJJP+yN5OUnEbw3XVmPIyFGRWf09r8A6jw+dKxKYfOZW0Zwynbt5bRhNwf0ghqMPpHW66GrQuH04MT0Gc/jNJ3c35UrmRh82v1V7M6cwC7Zh/nLSsJoVQTmxnEaARKyRxDYcBg/P8mXuLSKPZch5jWM8A9+SzthLID53fs773Ea3GLpZO6TmeZa+p3GasHBuwb9jbwMc6qD3A8UJBz+FbAyLaE1jx0eg6cc93T219JQ4z7/0sy77GkO+GJF08PkYkEJlkcgCd16WYZyRKkbK4CftNnIh9w==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa3a814-f97c-4b0a-0445-08db70d5a1a7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 14:58:24.7156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwMCjhbYtXp5/erGF70BdNkW0qYqBWIxNG8isu2I6vG08QQZBuUbRrUm3rXW0ugGpWy3et6rTi0x1gntJzF7PDZWCrjECNWS3OOyATifA3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7426
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_11,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190137
X-Proofpoint-GUID: pJW3ctfyOJXXOUCx6up2WmyYIHbyRW_O
X-Proofpoint-ORIG-GUID: pJW3ctfyOJXXOUCx6up2WmyYIHbyRW_O
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

