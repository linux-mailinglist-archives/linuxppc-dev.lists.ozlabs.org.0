Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C2773EF68
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 01:43:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=aNhIQzN8;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=OkDviKNj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqkv42dbyz3cGJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 09:43:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=aNhIQzN8;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=OkDviKNj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqXwZ4cYDz30fF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 02:14:22 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QBZUmP018106;
	Mon, 26 Jun 2023 16:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=OiB5s3stXpg5sNJ7GH1oar2b9BAnXvOVsmLMSoajXcM=;
 b=aNhIQzN80Fu3aGwKMg35mipiZfQ5mDVUYkhedcfBH+YQax6newEJbYdB6rRlNmIJHH4/
 KxFiSNCBr9OrsLhOwHLhS1wXZp7XM2xgWtDGPo3C4IaLk2dR5GUtB38Db6TIZ6ePySfW
 SAxdablAn/SIC3+wBJHOhIUfI4iQTDdCjv+JSx+WfXGLh8schiGrlNYI/Pbak813uN4V
 giPvG0zmV+sGn96GEjd0vFruqHwHqD14mLizjKJiK/iagdU845W/sj052bhpiaNgULn6
 6andP5dDKiY5ZpRi2fIBpG7PrbN+mxMbs9zti/3G2okhisyr2BwWA0XCexJgXszRL0y3 yg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdrhck419-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:00 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35QFBAY6005113;
	Mon, 26 Jun 2023 16:13:57 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx9a8yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:13:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCYifwDy8tQEp/iYP50/6Zi4eOmJOWM5+8EdoWGU61DQzReOxaPJaCVuenNWMNwUwTIA41urub6cO8i2z+kqIhiCnFXEAbo9DOCoIM85L7FfC3/SmJ8Sjk2T6Z05T6Uli2E31b/MfryAp+0vj8Sky1X7juMY631QZax4u5S0UFdpKh1JtO8/fDLx5KcAetfLfEoNZJOA97o2LjvdKumH6d5BlupAoNMYtJ/UlE53TqjvohcndRkcj9Qz3396hHO5rwOo65wrooD1b2iYlIf1YVsoyfBDSbCP0On5h3W+xNgA8gTb+g15i+wCTDcLFUyZX3sdEA2lJkXrLsxeawFm7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiB5s3stXpg5sNJ7GH1oar2b9BAnXvOVsmLMSoajXcM=;
 b=Fu4hnvD2cwMwmDovDgYHiE6JZyfBxNLzBnGAUdDyax5siXtzaLwSm/im5s66f+Eo/Re3T9/UYawPc3T6qMkgvclrf0af/fQx0PhzOBWBhy1vneMWJJAm73v7N3CxDsOcQx4XxbHCNAdI2sdgrSI7oryqVzGyxx4GTN7GMXwB3FCVZiDDrY+5DVmQJXgT2sy/eomO52iEqKvGhtEPHtWV17KOsaz+oPzPU0Isk/MoU+/iLWtA/zNmVEORoxT10GG+kNHeypffvTg/lpqZpITf5LScFxQs0GLtjPanvqzaS2NrvbseSdX/EumNkr6pENgFssQc5ajP/JdRteG/XygaRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiB5s3stXpg5sNJ7GH1oar2b9BAnXvOVsmLMSoajXcM=;
 b=OkDviKNjVdADLdAmaJY1p7MFXViu70w18wYo13vrZ6IqyRCVFKnbeKUaSdNWsaef008sbYBuVtTnk2uS8tmRWH284Jjz4wo5JTm9lyiEjt8PK4Ocb7a8n70AlyAy2M+VEZrBQUH7sxZChutYN3Q7jXM3aYVE0g9mW1dJo6vWsCM=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH0PR10MB7440.namprd10.prod.outlook.com (2603:10b6:610:18c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 16:13:53 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 16:13:53 +0000
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
Subject: [PATCH v3 04/13] ia64/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 26 Jun 2023 12:13:23 -0400
Message-Id: <20230626161332.183214-5-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230626161332.183214-1-eric.devolder@oracle.com>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::21) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH0PR10MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b5833b-04d9-4993-a0d2-08db766055b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jvVHyRjV4BdsbwjaZ9F4rVnIDOgH5wKbrmljnry3DMeN4kemNKF7RsQKLdaHUOFz+aYDyOuKqePGkRl/8GBuGtjEVzh1H5ew3L/RgfeDtKKkWGrby/s6/1h/ukaW9C5EA3tSUY1VHtR4FAiXyXpm23Lqo+K/sWJp3vcmqlVPqsDLERFEgNBCisgYab8te0zI8MDsfYBjAFHo/7d+HxzTbQFqbu3eTmjBMQ4vMafGmAl8MRTtj0ht+0uV4owIKRMHg6azxQjgdkkOo/7D9p35Qy9m/CKHvuVpOTANxg5OOlQckU4cV3OAfXQLsHGI+yKn8ETQ14+f1k53msBKEA05DFs7M6oUmspirHT1TpECIZXtLnYYS5+FYRXYXXeypnI8Wx2onq3iPOnbYGHqiAd50v0YhPy5AK66S4ccwXeM8Nqf82A+CNmKrBjV+2p4FqxqWpYOg0raPvNdhxPRbSDoWfs+OZAOGORxqmUmyizJiDRAyNCC/kb/biNv1AWGF1n1mqSacSQ/yetDfP4BnWajfxyQwOJgXa+NgP6joGCVzn80LWBbxEwaXPmEag+ALteCfekoX566E76BakVDOeSEgD2Yf9HiHU6IL/o7xKkcKno=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199021)(6666004)(6486002)(478600001)(83380400001)(2616005)(86362001)(66476007)(107886003)(1076003)(6506007)(26005)(186003)(2906002)(6512007)(66556008)(921005)(36756003)(4326008)(7366002)(66946007)(7416002)(316002)(8936002)(7406005)(38100700002)(8676002)(41300700001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?d3SHYjFWuOB6TI0doy6Rh67oVYNybQ8Pgm4DaVi5lL4ZcYtNR4DCqwoJkcqS?=
 =?us-ascii?Q?9DNf31H0cXA6dTh002PoXhecaBfQ0F3uuna3/mmg+twx/w1ersS1LKBv8io6?=
 =?us-ascii?Q?pymSmXcueaEl5Dg5+Jp4pEZHEdS4SI0PyhKFUhAOQKvRtD73GKl9rxeO793g?=
 =?us-ascii?Q?bK0aB+CR+RSs3vVp6kE2y1XnLGMdXhxmM2ARz2nUGb5c18qytWVZN79zArBI?=
 =?us-ascii?Q?UXdXcVs/o/YYXm5zyMpfo5bIm6I/IMCPCul2W6P2PzYMxYrgmZ4PTRQfVSpx?=
 =?us-ascii?Q?PHPrLkdsWMWwsfb74TRmV00zFINLEDW7hCR2DFUyOhykB+frdoe29FXLM1cz?=
 =?us-ascii?Q?WqkRElm+LX060La1MbcQkNv172Du8YKAYsADlRG7joh51ajDxhxr7LmzaZg4?=
 =?us-ascii?Q?usdpe1kuuvPWXXyn/mYSMhhQLJxz5xt7UndW07RhDEQE2AWOClR1lMeK/TNh?=
 =?us-ascii?Q?GaQfURIilXSBEilxdGpCnLvAbUecI+AoshbDrKGm9iglPxFQRRr/btgljwMf?=
 =?us-ascii?Q?oKxKorq9OyavhlWuDT8duJcUrPBftdAAYRJ9qUZKU5P3i1ZZ936IH+Hk7uRA?=
 =?us-ascii?Q?gA9ih1B++zjIgGTEdFcnl8hDM5pLSrHjOxdhjz5B9A7h2B9n6nPJWzgXPCmJ?=
 =?us-ascii?Q?Zcw4AthN49S+3+haYHfQN2USoT14SbglDPkbfflWi4kPF9H3lKHZKaNml8Rk?=
 =?us-ascii?Q?S7E7DZNL9d/UBmBP/hfv3qFtUhD/q4sW8FHqXl6MYrJj/H61n2MKzVW3A5SE?=
 =?us-ascii?Q?Vqc8QZZgF2DeggVQexGvbcpQmAEJcMi3DHZ7RE7BJPBAwrkBcgDBBks+sU4o?=
 =?us-ascii?Q?h+ebk4jfAyTe3matPCrhLRnkWA4YAOg3t/B2mn/Z6wfPHC7cbPfLxRNQLKQJ?=
 =?us-ascii?Q?7tGxhUMneG4YskASAUInLLI89t34Xl62hfUc8uRRCHSp8A/L2i2WinIy1zML?=
 =?us-ascii?Q?R71ivfvcSww34jVhs5VhScuf/m80hQRcvUw0rUNK5aoOUH4AhO68vssVYrxh?=
 =?us-ascii?Q?CqURs/lI0KvnTmvfvQZ0FNcaUZp6m9cMlZ88PnaSC5D8O6xtNz+E/SfQ4MKs?=
 =?us-ascii?Q?U/x1hTOPlqK4GzeB9/ChoLPX5hIslqAUrVQGH2Ta2UhrqXpkc1/MUQuTZ63M?=
 =?us-ascii?Q?ioPW6ne/RrBywEqXFwGvZuTms7EBgkko4fHX+nukihHGeJlL54sX5z80Ryem?=
 =?us-ascii?Q?lzLtE25mIUIInAPaQyo92XHfSduVZNfovricuqIBZaju7ltxi5ZPptgY5ORt?=
 =?us-ascii?Q?QmlINO7WorVFNdMZFuM8mHIJC3KXabhysRztFyon5u1afP3/MBZF+amxJqL+?=
 =?us-ascii?Q?kKhFP1hy4gU0hvf6JQ3gQfbjJRMRVIN2DWX9ZKCiATBDlZX4lVQbwlYWLgU5?=
 =?us-ascii?Q?4oRrN1jc3rwZ8NDYkyIdao3+2CfGawlGhsKzb0Ol1jHZSz3lfIR6W0G3gigq?=
 =?us-ascii?Q?bF24HvcZdsZ4nSvm73lnACiuVHXiC2W07O79UJFbo9dP2fXX0uIqXURGVliL?=
 =?us-ascii?Q?izi6NPj3zc60UdEfSHrKkhl/cCzHOUQv9wEtL7vF8D3AntnARN+zxpNa7Hew?=
 =?us-ascii?Q?H8gI8puszuH+j3KdfnSEtWYKaQXGEzJHc9DW7xd7yX7uVnskQRW/uHZ4I0/o?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?PBmP0+ap+XafEBra8ToWqkLmijIFmzgbH8s2QGqeJH2H49MQi8qu1ZSSPL6q?=
 =?us-ascii?Q?8hUci7c/eDh0Dhv+BvfIE5ISGZhnwbrnayfi/WRAlEpj1FU3qiIJrVqa/05Y?=
 =?us-ascii?Q?pYkQNwUXSJoGRUT67bxKITfAjAwmoelE5ivYw2PVD56pt7otn3bXmh6LDvP/?=
 =?us-ascii?Q?PePlsvu/tmWJgDJYxA8fUaot31MSNpgJYxRJB3V0n7QJVrDSptCfRvJjYFnt?=
 =?us-ascii?Q?XWLAA76bTm8jUKUbLnZa8YncqHWtOV6jT5CWEiK7kI7kPyCEC+7wHUbwiQav?=
 =?us-ascii?Q?FCvI1lgCAJsh/wOh6QhbyJ/1hw2N2l99bNzW9nvdfKNQpNw3CmBqLYSI143V?=
 =?us-ascii?Q?92+gbEZyKT1M3BXohpsdn9XqyjpbNVR39rG4qEGqYbvz1ysKZ6gNZr0rLuFM?=
 =?us-ascii?Q?6UWUF7okoPUlt3etfQ6W5pH8eV1o3JoJ7XHVAG8r7eWTeKheENVXL0ztn06l?=
 =?us-ascii?Q?mGcqp+ijCfdDdT1wseDsn/hcBqkyAKyx/QB1qAWi18Wh4WR48j99+AjrPzWi?=
 =?us-ascii?Q?wBEA0O+X6vKIhPVfkDutNm99AmJkCIwkB39zGRNDkScX8qLrFXnlGNMXq/cZ?=
 =?us-ascii?Q?HSGEMt0MuxDZq2ySD+s56zhAltnv3gsLyIIMLVWPXBicB3cPpt78ua0iOs0W?=
 =?us-ascii?Q?6JzN3zPFkfr0PmLawajqYMTOptF3y6tO84WNJanIG9npUweF6F6jrpLv68ye?=
 =?us-ascii?Q?Q6z4i4T77z/sFLzsKfSgn8/nd936rewbZNZWu0f10eA+nh2wERDKge8ElbXK?=
 =?us-ascii?Q?PgTGdHUfJF9P549OpyZotnVVszWQUEMOkyLlvqjXalWY6CtkT0AGQeTkCkiE?=
 =?us-ascii?Q?1NVKeF+vBAP9FjIHfd4ZrhC2THxRTPDVKO/pAPYIMBvukY41xoH7yhBBzUBc?=
 =?us-ascii?Q?AE5q8lKbn7y5S5Msx8me+G3RfL0YRmWPr0+McJ5x3YgUJ0fJfQeOtypJgcJS?=
 =?us-ascii?Q?B+cGM1N4S0jjRwfAsvDDyphtDNf42QQkVo2GlCPUSJEA3qg6k/Gyx2BpJ5wC?=
 =?us-ascii?Q?ckkI7mdQf4zpTLK8eNjbWSRZrLgu0h55qcevICHPzmPeytmNPY/cA2yBvhha?=
 =?us-ascii?Q?1HWVAD3pXyeRW+u4Pe4ei8bcvPOIMf5Ftu4Z7oOM5VnxowMK8Ikd6iQ0cg43?=
 =?us-ascii?Q?/fR0RQ86MjTwiWLKgoWqkwJd2I9ZB9ZDYA+1NK3RBZ7pAvZWOhwcOMxzGi4x?=
 =?us-ascii?Q?wFzHVHv0GUqhUVreFrfrwkPImt3ZxGZMOY5DfsaN3D3aDMwIED5IJbsTkybC?=
 =?us-ascii?Q?P/Ql0N1HXCc2HR+x7cuSmZ1lOkW6KNv/JvZ0OckZyt15au2jSW9OK8PYYWl6?=
 =?us-ascii?Q?oszhymEzYMhKFugNiLy3T7ss8bSTDEmDFj08f+jv6AoxOPBb4pOxOl6eD6Yw?=
 =?us-ascii?Q?+WYoc74CNIjKu9F6RNypP6Cx6lYEjRY3xPsBxWMKHNVYa3upW77WXS56dSKM?=
 =?us-ascii?Q?6TGz/0Xxyv57yLuPWjl4TeEhKbFq90mZN8gTRJxQpYpBsF7O3Z7jCb/9LgtX?=
 =?us-ascii?Q?F5nfWyAegl3IsF6v7q9GwJ9IIoZKx2JEn1GZ2pL5z5w4mcqSybcrQputtrAn?=
 =?us-ascii?Q?MA3g9Pn8Er0GHTmE/xxHQEOTXOS0kfqnLpFbgnulT13M7y4Wo9z1e3PBNi9j?=
 =?us-ascii?Q?jK6CQ0gM+LFDfDa8A9zOROTt2CZ+xsj+o5tgfu9BPc8QkhjAld2euCUjAQMj?=
 =?us-ascii?Q?NffasRQDVS4Bm0123yz5yWUUIl0nq8cRfdsRfhj8wIx/bsstzeu26IVUvuQI?=
 =?us-ascii?Q?p0BZIt42+uEa6Bg1Q/nxLpPqm5hpw6NQbzpRYjsAeMsIXWg3bptCuyfpp3ft?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	K+o+AvJ06t/N5YWw1T7PLJoRUafzF8lvRDDb3qx88ZjPPrdH55egN9VNqTdTuVHFw572wVdZbi8MEWY6Z5ksNISW1+qufJXdfS46TKj6b6lta710ho+iS7TZRjBpz/+WTZWAl0+x7WA+5vQXBioduEw5KPuOPUEy4vTB1NZKVtWFDfX24dSnUY2EBuq8iBUCRNfrkOm70ooldvmizTl+rksHx7onTCpWQ/I/H6rId0SGspHHsLfgnDYPBMbgsLdR9XYAFUPJI/8sg0Qp5BKg60GxsM/lOCtNkAlE9lRnPQHgwJ36CI/C21ClKKNpwQKkfJq9uNV7SQFGiPMIqusN0Tt9waomd4Ww9o5vm0Frn5D6UlEnDdg/qQxkM4LNaPKeVW8afuKtH/bjnoLuB3S4lwrhg8IeJyni36hPgh7Hd4lJvGszpKk5+c1H0JAmTKAprXkEp4S3eJTX9A==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b5833b-04d9-4993-a0d2-08db766055b1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 16:13:53.1007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhNI66SGQEghdJVMRBpdAKRqDY1q1wwofkET5QQowJBNwQSshQ5EaprNf7Ec8OZLXxs7LuNng2VCdY7xbecj1L0l0vYoPlacrU7SHcsN9mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7440
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_14,2023-06-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306260148
X-Proofpoint-GUID: S4V0BR597Zu5INy4_iH1-ezJygRTNEIX
X-Proofpoint-ORIG-GUID: S4V0BR597Zu5INy4_iH1-ezJygRTNEIX
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
 arch/ia64/Kconfig | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 21fa63ce5ffc..df54a038e6da 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -360,31 +360,13 @@ config IA64_HP_AML_NFW
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

