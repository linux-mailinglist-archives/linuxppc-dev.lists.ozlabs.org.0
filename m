Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC45736007
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 01:14:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=iIo4fzB8;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nw/ua+z/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlQZ02HR1z30fw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:14:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=iIo4fzB8;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nw/ua+z/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlCZn26Rkz30Ps
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:58:57 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J9nEhT006316;
	Mon, 19 Jun 2023 14:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-03-30;
 bh=wHxDjYJ0YIk1e+WjwWC+P/LImvG+7dnzjJj2cPTvSeg=;
 b=iIo4fzB8XfVHYsLA4aa73Ub3tAXZwaqf/Sf3cTRuwH9uXBxXxyVSYJpCn1ixHSWUP0Pk
 MeKtgCcdrg94OX78NOKRRyFTufFcIFI0VJC7zb9LZWNE/HN+XFp+o8R49dHACQLV+GlW
 BhZ7F5O0hPjEWurYxqlY741sr4RqNwkGQI2dG5AB9OuAdHmrZV94htiga/5A2o3+dumX
 fibRiMJnAUYlW5EruAgEvd7D/5VALzHAGyNofkZ4LBlBUyvtqMGWJth04CmLxrhZVx+e
 H6S0fBNnHNUTD7hpjrpalDSZ5nGEn/i8KTK4Ra4WViq8u7bG+tBiYNhgFStClIbch4p/ Qw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r93m3jx5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:28 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35JD9md7005929;
	Mon, 19 Jun 2023 14:58:28 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r93939jdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/09OjjA+EdqLiHZuX2tTYRokD8rK93f+Shg4/wp+dC99FyzBRRIHVERVoaIBiOjyy9nm3Y4AehmZ5F/bDvZ38bO4e2ryjSqYFp2Bxjo5blRM2mgWfLkJsR5LqLAqPu5ky2UNZB/B/7T9xN0fmnpJAxRRZ8Tdf7+H2hGUDHpM39a7vHe8QpSdiMXD0ZThsZrfCxgDjCNI1MubnDVQkX+LAETlQ2bcilWF+rJsziiViAB4JKozWm+2qGnHq4vbZz/GmMFKXwDmK6C//DMyiAUm4odTJovWIEU3aRvpGeUWA476QVscrj38hdl195AVcf02LUUseq02xGUECtftEQqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHxDjYJ0YIk1e+WjwWC+P/LImvG+7dnzjJj2cPTvSeg=;
 b=I9xlpgMdbF/aeg/2b8NMwvp4mVB/0Hq75BFEoZzNbDsJC1AYNxrlaKsBBxJMLrK4M5NboWgBSpWt3FJ80FnD9IX+cDy2R+HYtUzgDww58C+2RAJAOxtvpjlEHkwwaN2N+GtlWRt0C2Q/kIYoUQNPZeDNrVB9z0lwcwx05owgOjFshvt8JISBH28jIL98+F8fvJTbgDI1TOnjAmLoXbVRtzvILNvF3sKqKmcSLEb5TySP0x8WntF2fAF7WRKex8C+0NCDix5NWXX8iN4Qvq6++ZZnatRge3Jd+nqHOrDY45NfZPXT7KDdq83/i2WlxEGuH+TrN5Wpmd3jOhr5rI9BCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHxDjYJ0YIk1e+WjwWC+P/LImvG+7dnzjJj2cPTvSeg=;
 b=nw/ua+z/Lar6vHiCYi2sHtZhHfOKqFCeW/CL/Ut/xL/cp355AA6ACxlYFZymCp7wkzDkBtePfbuKAxJ5OclHhR0fe6ZEYs/tWuo85Vv21Nrqrmp67Id8mEktKbBp1fkMzLWc+wYyZCI9/T8i333m8SrnSsK3LDZsifo+0fyXu9g=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA1PR10MB6543.namprd10.prod.outlook.com (2603:10b6:806:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 14:58:14 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 14:58:10 +0000
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
Subject: [PATCH v2 00/13] refactor Kconfig to consolidate KEXEC and CRASH options
Date: Mon, 19 Jun 2023 10:57:48 -0400
Message-Id: <20230619145801.1064716-1-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:5:80::28) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA1PR10MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d1f57d-a570-41bc-2137-08db70d5995b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	oigHzi/J5LorE08mB25mnQnblLIUP1IoIhMzLu3xpmPPWZH8kDyF5Ik/sdSBJlO3GC0R6kZ/zP6kE3vLxiiu5C5PNzRTD+c0qDLXfbmd3bMzXILV+S9tjtD8unwTABg5AuHiWI4EUWqZGxqJt96VHI5lkkkGc8O3bbSg1cyecmrQmRkxts8hM4Xq2xyOftR9DGOm/54aLa4n+pelPVsMBteqqHHuq+RboXXW5HW/WxtX0Zs8iwtlIqqQ3qoKS3PTt0tHNgtVoc7M2P1OpBdsjTXba6BZOa+QMHxRhw3PyD6VCXBZrfD8eIA0HZ4MvoWPq+wc3Rdfd7NFX9/0R98CArVqOL1hdA/7BfZwtfHxlPhacQZ5vxJ1mHEIZ3lX15HYk6Zgng3GLeA8dEcDM/BFt0p0kG8krhhjDoDre+trHxK/XpSQrDnG8O5IO5CetYXziOHyUpRBY/3CyVYNca/jUa1f4oG0OOqZ5KVeotUQOSjciZbJd/yzBnMdvPNhrtsTvTJDANJqgAft8G5cAsV6WpytGu5Ab+upsvvUjKs1lj6P/ik8ndvvYifIfKmRQz0gFZruJG3E5wU8lc0mYnWYguOZgjTp0Boq9j6rd76LdSrDzpdIQR79wsdBhBMxMPN+
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(7416002)(7366002)(66946007)(7406005)(8936002)(8676002)(66556008)(66476007)(107886003)(1076003)(26005)(186003)(6506007)(6512007)(36756003)(83380400001)(41300700001)(38100700002)(5660300002)(4326008)(316002)(966005)(30864003)(2616005)(921005)(6666004)(6486002)(478600001)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Xs7vg8F9LidqIrXYvGxwqZ8AbV3ZOsPnxpZWp0rS/xhelfUCXl5+ROzpSf4i?=
 =?us-ascii?Q?m4KL39PkXSW+XokrbQLlY6Dc+7ckJ8+2rziosD+ukkWR6a4/KZjbkWw/QQsO?=
 =?us-ascii?Q?U9M3d2WQiBohR9L1AIz2eLpKKO88KvDCDrGHjsuGRp5C0H7TB69Y9pmv/uIS?=
 =?us-ascii?Q?K6HyTmDrFEO3w6Uaq7pdkYOOgIxZUYN0IR+IjFfwuM/BPtkD1GLBy9ddeaLo?=
 =?us-ascii?Q?3s1ihqX1ax8xCgZw6hXtzf/xbPsWEOosw8yVzQBGZ77vkbfcaBo3nXEZY/HX?=
 =?us-ascii?Q?QnnXPeygw+cNInFx5frDHO2579/7SYwu/61UO7+l702C/g8h8fA6Qw2ynoTJ?=
 =?us-ascii?Q?GsSCkYz3cUMOexoRMO3AAFMYcA2KewoToCenlpZxXRUTeSfTL0UxNnaDUhjI?=
 =?us-ascii?Q?64s9zzJcp27SQjOl5pAHvdKqWMx3z8hykOXv00m4SCWeJa7CdESaHyz9Sk3e?=
 =?us-ascii?Q?y4vM7bmDMFUiB5wj+jhtnqztmxIj7McFSGaJDvBY/afV+WTfhpVV2WU8omnP?=
 =?us-ascii?Q?Se7ky73WSw5m+yuzbJM0jxynqCl7lpPtVTbdC5Y7Q1wo5d2aJhExx58UZV79?=
 =?us-ascii?Q?XC1xNxOED7zbtqIcwxZ7uc7TXlhYZgJ1dJl5CmEDaE+ldVjKjLWca4GlJMk8?=
 =?us-ascii?Q?RTrvhSHmmNY/8wmLC6IrUQMIZgzAUJ0Mfg/WV0WZzMyDU0El2WDWArUR3PzC?=
 =?us-ascii?Q?jSKhzUbCFQq1Fa89xBC21zJpANcHXiDq5POGttO3gvdRQVyRb4EDMrhmtiEK?=
 =?us-ascii?Q?vHxh2P+vlPp6ECLPTmpvm4TY7/RXgSqq4LPXyt+PCca5kA+hDTW/7iAV2uwT?=
 =?us-ascii?Q?sLVcKuf473MxSikrYEISJ0CvzPjxAgkkzRBwGkd74LQCYVdjAUCffjNGBxd3?=
 =?us-ascii?Q?lGiNmLQumLu64fbSJI2b9hAYghZBnkDq4Rzmi6h6s0ZB2n6Wm0w6Jvz7bk63?=
 =?us-ascii?Q?3K0AJeX/yxUTWAo67ZcyijU4dYr/DbL70mYd9ZSGAHaXCcR1dpx0IwKkzOT6?=
 =?us-ascii?Q?ZvCAlPbcjKbhITe+QkOhaSo49acTCE2u1HYfuHOuLzlZIgHEBaQwSou5us7R?=
 =?us-ascii?Q?s78qYgsUtnFgRcMFaMZF9pQnMkOaP5hBc0umpo0TYSH+N2IL3koI2uQ5aJgU?=
 =?us-ascii?Q?rDh2+44mmRxrrlW1LhCBaH+s1S1lDHTY3BnAtwgAn2YrjxI9srFfO8jkVZ8x?=
 =?us-ascii?Q?S++UEf2ISjVtHdKMSOIq+pS+fpYuOC5sRGqLC77EttG3M1r93IaPNzimxIkp?=
 =?us-ascii?Q?rV8HVEZrRSxHn7zT6ClnneWRPtRLUf8rJUrBJhxX+4P+QDdjYNQsi9Iudpx6?=
 =?us-ascii?Q?cFdqyEm7p5pQCyBoNoi/6WazkbaNkXjKHOa1p4mSsQSAGfRrwBzPUcwz/q2/?=
 =?us-ascii?Q?a2Lv2peBE4WRyxfmfdldxzet5Xq/3uBh+fJoqjDwZ+FK/iYboHtS725zn2S4?=
 =?us-ascii?Q?ae22hvnZcNrveBXvRLmIvuul+veHCpsiwLrrcEwF7BJe3ENmhkXob4giRywX?=
 =?us-ascii?Q?S6EPdNUvjn/bnYtOBZZ0XeZrWX+PpqRmILbIKj5h/ttBpfHWpVxNE/gil8ax?=
 =?us-ascii?Q?5p/tzI4Y3zb5szSEPYHH5cwKCJATkLfSvRORQgbymNllebeZG7AxDT1gi3Vg?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?P62Yws1a1xEj+rss4EMzPbvRoV39VhRBV4gn/br24s1blhF4blp0GZjLwsPU?=
 =?us-ascii?Q?QELHJmxNEU7XRwyMjEM9cbuwlWM57LAUfdpY/65riJZ3o7omnG1IL28+W/2U?=
 =?us-ascii?Q?nnYtOTPb+4ltV7u5M9B8BRfP9EFv7Hb1eVG9WOfY1V8KDg8s2OnBljNExpDe?=
 =?us-ascii?Q?FFnXmVk8HB3jIDJm90sj42vd2QRLk7/8pWfD3hHWHlGmLEUF7Vg2PE3Pynud?=
 =?us-ascii?Q?4KjxfnEVXc1uGTmXOspO9OMXS7EsQDFhjJuNqEp8+4CwWPxxPqk1UTbH+bCR?=
 =?us-ascii?Q?ZT8FAuwuMyEVHKSHboZ5UnRP7GOR6ZwHWOGiEbe3g9LBl1MD/UdAfffuloNG?=
 =?us-ascii?Q?zwXxUzxqqNZCexn38Tggx3kOzFADe7s9hTKhE9Sfo/unTzxz/FeSg7YKjC+H?=
 =?us-ascii?Q?5h0Vao0lzGXFpJgF7tFIIACAwKH6VUu1UIsRChGTE1j9dHb4w2kgUKo9nEve?=
 =?us-ascii?Q?FrGRgBri3cQyL0fNzIXGnQwFjTaGQ7cuUfR6B+ZPcLzlx+1HaXhZvIn6WNMd?=
 =?us-ascii?Q?s4laKzJXMvId2rDFzrwzqfupGeJ7+0uvtv/FTA9AuKYRtvQuD1HhirlFtciJ?=
 =?us-ascii?Q?L8P/x7kmU/UY3MFl7iVbwuKCIvKNn7Pxd5D0XvOgn5uSfVRtliBZ2y0asc4l?=
 =?us-ascii?Q?On3heB1aF2IeGupmrrTz2o8ZRaAn3jAQXmo7Gvf+JuA5prS8oTOmhPnbVmm6?=
 =?us-ascii?Q?NGLr941Xu40nXyaaEJVqep3xz/LHbSbZp675X351ZwQyCKgClp/ojqFRPUxB?=
 =?us-ascii?Q?g7XTXfOM/WSXpDv0xb+o1fCJ0FPXq0utmQWTnwqvIRNCuXEmqdSO++u0CoB3?=
 =?us-ascii?Q?ymT94NB6IyjZjJun0ArOteDX4sWx5V7ei2TSNV6XbyjDg7Ln+Gg85iiF0L/p?=
 =?us-ascii?Q?exCCUTGX9pgIOkeCjiGWJqukeu9wzx5YgkVFEoz1W10oXJ1vpqLDk39HIAN6?=
 =?us-ascii?Q?tST2CqcjpFfoF+YWslGGr5XvMSr1Oi0DeZPXAkBs1dLscf0iv/nK6aJ6NHgF?=
 =?us-ascii?Q?3XJhod539y02Lc3Y4FDOvvvjIufUs8kJo2k+PzNyuqI4/mH8s7RC0rzJO8u9?=
 =?us-ascii?Q?20ykQRl0QO2QqdDLn3dkcu++cqTmvV1QRdfabF9GcTDWkOZJlhzaH21AWS+q?=
 =?us-ascii?Q?GXl/YDqC76nb8U5U1J51UNXH/RE+53KrhSC8MwEfQJqd0cK4Z6pWatYqpH7U?=
 =?us-ascii?Q?EedauUaMphn/aCor+TBD7NhNMCE2gYpuKQKCP61zyLljrAVGk3Q/czsEknXg?=
 =?us-ascii?Q?qLk7KIrPRKsOXwTM3a7OwBS3X42s2Xz4w7r3f0X5IS5ugZSsUMvNu+vOtj2+?=
 =?us-ascii?Q?eq8eWk4pErb7eSXRkVpp+ym9JEOQpD6xTdBTsDIsz39VXfgg9iibSsHs1ILK?=
 =?us-ascii?Q?FDWRkifAI5wb+xrSu9vGnW+JV36cU0iBqWBHfOAsacBc0rFLhqf6zVdkGJOh?=
 =?us-ascii?Q?Xs+yeR6WSURyGjIjt8YsP8OeGTLqsbFEGB6Ct2KH1QZCqwYbeg26QvJ7IxwW?=
 =?us-ascii?Q?swbowpdKjGGu+fGafIcM0rM8Xw/b5svLuJj4sAWLb2Qr22hyjvlgqUp/ISYt?=
 =?us-ascii?Q?MTtHDg5HJezMDdgvwbwpGMbWzeHHeVcI1pVFfIPADQ53hX2S9r0EClN4Nh0T?=
 =?us-ascii?Q?HMvVtsXFkor+7Ynnp143wZQ5Ng1NOFtekRbseG8L5pes8y1s+csDf/4zy0To?=
 =?us-ascii?Q?caAM3o79/bmttMdkl7+58WLs+tCwtW+E4wMa6LztObP6XueTubhNRagJkAY7?=
 =?us-ascii?Q?FAch64BZY9RVopwbOC+QPFLiT3TiM8YBY92eQXqwSxnPF5D6vchu/KhaVS8J?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	yTI+nBDz5YBlTH1qMnCvBwYOgcgjTaZlxArXvqi+M/BdO5xodR3gXafaJBkM4DUw6YIQgFgmVT9zjnGQfRtgVF+HqWenlzMp/JVmDJXupTW72sS1Qt/CzPCnJ+mLJq6aJ3P0lqZcK+8/1Xu4wi08E+AcAXJQJjhclQtexwP5qvZIXjTQJHpoIKyt1uk6ei5u4BJW9w2cvxOJ5UUOfvPdFUCGftMjc6o+Pk4CpiTrse7nhJHq7QLOzpVywqWXD41tN7UlfXlbVQeGHLDxaCmE4QleyigRIacbwIEGN4QBJBzqoAmwPrXmncwLDIBj1r6UmE6FQbeyWsZoJWEvdqj9DUz+Y6q6bjVtsYZQMbuOK5jaEHVK5sKo0d+YDtv1A7qpVOA1iVLx9JxRLkeEnWgDNzdJBnkNejFLjpWHyDVbPj6o1u8MuVAOJfT0zSYk65Y6sB7VR0FIdFl4SQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d1f57d-a570-41bc-2137-08db70d5995b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 14:58:10.8277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTSvmu/zETGtLc6nogPO+k444pOEXim7R22X4fxuVGwgO25MA50/+91+2adSZOJMLWLBVA5Z9SkI4RoLnYY3XdEM/4XRkYQ1XybE9j/muCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6543
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_11,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=930 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190137
X-Proofpoint-GUID: roUeQd1fx0g_f4aAXYyQgqfxXdveWt4K
X-Proofpoint-ORIG-GUID: roUeQd1fx0g_f4aAXYyQgqfxXdveWt4K
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

The Kconfig is refactored to consolidate KEXEC and CRASH options from
various arch/<arch>/Kconfig files into new file kernel/Kconfig.kexec.

The Kconfig.kexec is now a submenu titled "Kexec and crash features"
located under "General Setup".

The following options are impacted:

 - KEXEC
 - KEXEC_FILE
 - KEXEC_SIG
 - KEXEC_SIG_FORCE
 - KEXEC_BZIMAGE_VERIFY_SIG
 - KEXEC_JUMP
 - CRASH_DUMP

Over time, these options have been copied between Kconfig files and
are very similar to one another, but with slight differences.

The following architectures are impacted by the refactor (because of
use of one or more KEXEC/CRASH options):

 - arm
 - arm64
 - ia64
 - loongarch
 - m68k
 - mips
 - parisc
 - powerpc
 - riscv
 - s390
 - sh
 - x86 

More information:

In the patch series "crash: Kernel handling of CPU and memory hot
un/plug"

 https://lore.kernel.org/lkml/20230503224145.7405-1-eric.devolder@oracle.com/

the new kernel feature introduces the config option CRASH_HOTPLUG.

In reviewing, Thomas Gleixner requested that the new config option
not be placed in x86 Kconfig. Rather the option needs a generic/common
home. To Thomas' point, the KEXEC and CRASH options have largely been
duplicated in the various arch/<arch>/Kconfig files, with minor
differences. This kind of proliferation is to be avoid/stopped.

 https://lore.kernel.org/lkml/875y91yv63.ffs@tglx/

To that end, I have refactored the arch Kconfigs so as to consolidate
the various KEXEC and CRASH options. Generally speaking, this work has
the following themes:

- KEXEC and CRASH options are moved into new file kernel/Kconfig.kexec
  - These items from arch/Kconfig:
      CRASH_CORE KEXEC_CORE KEXEC_ELF HAVE_IMA_KEXEC
  - These items from arch/x86/Kconfig form the common options:
      KEXEC KEXEC_FILE KEXEC_SIG KEXEC_SIG_FORCE
      KEXEC_BZIMAGE_VERIFY_SIG KEXEC_JUMP CRASH_DUMP
  - The crash hotplug series appends CRASH_HOTPLUG to Kconfig.kexec
  NOTE: PHYSICAL_START could be argued to be included in this series.
- The Kconfig.kexec is now a submenu titled "Kexec and crash features"
- The Kconfig.kexec is now listed in "General Setup" submenu from
  init/Kconfig
- To control the main common options, new options ARCH_SUPPORTS_KEXEC,
  ARCH_SUPPORTS_KEXEC_FILE and ARCH_SUPPORTS_CRASH_DUMP are introduced.
  NOTE: The existing ARCH_HAS_KEXEC_PURGATORY remains unchanged.
- To account for the slight differences, new options ARCH_SELECTS_KEXEC,
  ARCH_SELECTS_KEXEC_FILE and ARCH_SELECTS_CRASH_DUMP are used to
  elicit the same side effects as the original arch/<arch>/Kconfig
  files for KEXEC and CRASH options.

An example, 'make menuconfig' illustrating the submenu:

  > General setup > Kexec and crash features
  [*] Enable kexec system call
  [*] Enable kexec file based system call
  [*]   Verify kernel signature during kexec_file_load() syscall
  [ ]     Require a valid signature in kexec_file_load() syscall
  [ ]     Enable bzImage signature verification support
  [*] kexec jump
  [*] kernel crash dumps
  [*]   Update the crash elfcorehdr on system configuration changes

The three main options are KEXEC, KEXEC_FILE and CRASH_DUMP. In the
process of consolidating these options, I encountered slight differences
in the coding of these options in several of the architectures. As a
result, I settled on the following solution:

- Each of three main options has a 'depends on ARCH_SUPPORTS_<option>'
  statement: ARCH_SUPPORTS_KEXEC, ARCH_SUPPORTS_KEXEC_FILE,
  ARCH_SUPPORTS_CRASH_DUMP.

  For example, the KEXEC_FILE option has a 'depends on
  ARCH_SUPPORTS_KEXEC_FILE' statement.

- The boolean ARCH_SUPPORTS_<option> in effect allows the arch to
  determine when the feature is allowed.  Archs which don't have the
  feature simply do not provide the corresponding ARCH_SUPPORTS_<option>.
  For each arch, where there previously were KEXEC and/or CRASH
  options, these have been replaced with the corresponding boolean
  ARCH_SUPPORTS_<option>, and an appropriate def_bool statement.

  For example, if the arch supports KEXEC_FILE, then the
  ARCH_SUPPORTS_KEXEC_FILE simply has a 'def_bool y'. This permits the
  KEXEC_FILE option to be available.

  If the arch has a 'depends on' statement in its original coding
  of the option, then that expression becomes part of the def_bool
  expression. For example, arm64 had:

  config KEXEC
    depends on PM_SLEEP_SMP

  and in this solution, this converts to:

  config ARCH_SUPPORTS_KEXEC
    def_bool PM_SLEEP_SMP


- In order to account for the differences in the config coding for
  the three common options, the ARCH_SELECTS_<option> is used.
  This options has a 'depends on <option>' statement to couple it
  to the main option, and from there can insert the differences
  from the common option and the arch original coding of that option.

  For example, a few archs enable CRYPTO and CRYTPO_SHA256 for
  KEXEC_FILE. These require a ARCH_SELECTS_KEXEC_FILE and
  'select CRYPTO' and 'select CRYPTO_SHA256' statements.

Illustrating the option relationships:

For KEXEC:
 ARCH_SUPPORTS_KEXEC <- KEXEC <- ARCH_SELECTS_KEXEC

 KEXEC                      # in Kconfig.kexec
 ARCH_SUPPORTS_KEXEC        # in arch/<arch>/Kconfig, as needed
 ARCH_SELECTS_KEXEC         # in arch/<arch>/Kconfig, as needed


For KEXEC_FILE:
 ARCH_SUPPORTS_KEXEC_FILE <- KEXEC_FILE <- ARCH_SELECTS_KEXEC_FILE

 KEXEC_FILE                 # in Kconfig.kexec
 ARCH_SUPPORTS_KEXEC_FILE   # in arch/<arch>/Kconfig, as needed
 ARCH_SELECTS_KEXEC_FILE    # in arch/<arch>/Kconfig, as needed


For CRASH:
 ARCH_SUPPORTS_CRASH_DUMP <- CRASH_DUMP <- ARCH_SELECTS_CRASH_DUMP

 CRASH_DUMP                 # in Kconfig.kexec
 ARCH_SUPPORTS_CRASH_DUMP   # in arch/<arch>/Kconfig, as needed
 ARCH_SELECTS_CRASH_DUMP    # in arch/<arch>/Kconfig, as needed

To summarize, the ARCH_SUPPORTS_<option> permits the <option> to be
enabled, and the ARCH_SELECTS_<option> handles side effects (ie.
select statements).

Examples:
A few examples to show the new strategy in action:

===== x86 (minus the help section) =====
Original:
 config KEXEC
    bool "kexec system call"
    select KEXEC_CORE

 config KEXEC_FILE
    bool "kexec file based system call"
    select KEXEC_CORE
    select HAVE_IMA_KEXEC if IMA
    depends on X86_64
    depends on CRYPTO=y
    depends on CRYPTO_SHA256=y

 config ARCH_HAS_KEXEC_PURGATORY
    def_bool KEXEC_FILE

 config KEXEC_SIG
    bool "Verify kernel signature during kexec_file_load() syscall"
    depends on KEXEC_FILE

 config KEXEC_SIG_FORCE
    bool "Require a valid signature in kexec_file_load() syscall"
    depends on KEXEC_SIG

 config KEXEC_BZIMAGE_VERIFY_SIG
    bool "Enable bzImage signature verification support"
    depends on KEXEC_SIG
    depends on SIGNED_PE_FILE_VERIFICATION
    select SYSTEM_TRUSTED_KEYRING

 config CRASH_DUMP
    bool "kernel crash dumps"
    depends on X86_64 || (X86_32 && HIGHMEM)

 config KEXEC_JUMP
    bool "kexec jump"
    depends on KEXEC && HIBERNATION
    help

becomes...
New:
 config ARCH_SUPPORTS_KEXEC
    def_bool y

 config ARCH_SUPPORTS_KEXEC_FILE
    def_bool X86_64 && CRYPTO && CRYPTO_SHA256

 config ARCH_SELECTS_KEXEC_FILE
    def_bool y
    depends on KEXEC_FILE
    select HAVE_IMA_KEXEC if IMA

 config ARCH_HAS_KEXEC_PURGATORY
    def_bool KEXEC_FILE

 config ARCH_SUPPORTS_KEXEC_JUMP
    def_bool y

 config ARCH_SUPPORTS_CRASH_DUMP
    def_bool X86_64 || (X86_32 && HIGHMEM)


===== powerpc (minus the help section) =====
Original:
 config KEXEC
    bool "kexec system call"
    depends on PPC_BOOK3S || PPC_E500 || (44x && !SMP)
    select KEXEC_CORE

 config KEXEC_FILE
    bool "kexec file based system call"
    select KEXEC_CORE
    select HAVE_IMA_KEXEC if IMA
    select KEXEC_ELF
    depends on PPC64
    depends on CRYPTO=y
    depends on CRYPTO_SHA256=y

 config ARCH_HAS_KEXEC_PURGATORY
    def_bool KEXEC_FILE

 config CRASH_DUMP
    bool "Build a dump capture kernel"
    depends on PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
    select RELOCATABLE if PPC64 || 44x || PPC_85xx

becomes...
New:
config ARCH_SUPPORTS_KEXEC
    def_bool PPC_BOOK3S || PPC_E500 || (44x && !SMP)

config ARCH_SUPPORTS_KEXEC_FILE
    def_bool PPC64 && CRYPTO=y && CRYPTO_SHA256=y

config ARCH_HAS_KEXEC_PURGATORY
    def_bool KEXEC_FILE

config ARCH_SELECTS_KEXEC_FILE
    def_bool y
    depends on KEXEC_FILE
    select KEXEC_ELF
    select HAVE_IMA_KEXEC if IMA

config ARCH_SUPPORTS_CRASH_DUMP
    def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)

config ARCH_SELECTS_CRASH_DUMP
    def_bool y
    depends on CRASH_DUMP
    select RELOCATABLE if PPC64 || 44x || PPC_85xx


Testing Approach and Results

There are 388 config files in the arch/<arch>/configs directories.
For each of these config files, a .config is generated both before and
after this Kconfig series, and checked for equivalence. This approach
allows for a rather rapid check of all architectures and a wide
variety of configs wrt/ KEXEC and CRASH, and avoids requiring
compiling for all architectures and running kernels and run-time
testing.

As such, I developed the following script to compare the before and
after of 'make olddefconfig'. The new symbols introduced by this
series are filtered out, but otherwise the config files are PASS
only if they were equivalent, and FAIL otherwise.

The script performs the test by doing the following:

 # Obtain the "golden" .config output for given config file
 # Reset test sandbox
 git checkout master
 git branch -D test_Kconfig
 git checkout -B test_Kconfig master
 make distclean
 # Write out updated config
 cp -f <config file> .config
 make ARCH=<arch> olddefconfig
 # Track each item in .config, LHSB is "golden"
 scoreboard .config 

 # Obtain the "changed" .config output for given config file
 # Reset test sandbox
 make distclean
 # Apply this Kconfig series
 git am <this Kconfig series>
 # Write out updated config
 cp -f <config file> .config
 make ARCH=<arch> olddefconfig
 # Track each item in .config, RHSB is "changed"
 scoreboard .config 

 # Determine test result
 # Filter-out new symbols introduced by this series
 # Filter-out symbol=n which not in either scoreboard
 # Compare LHSB "golden" and RHSB "changed" scoreboards and issue PASS/FAIL

The script was instrumental during the refactoring of Kconfig as it
continually revealed problems. The end result being that the solution
presented in this series passes all configs as checked by the script.

Regards,
eric

---
v2: 19jun2023
 - The ARCH_HAS_ and ARCH_SUPPORTS_ combination was found to be
   too similar. Renamed these two new options as such:
   ARCH_HAS_<option> ---> ARCH_SUPPORTS_<option>
   ARCH_SUPPORTS_<option> ---> ARCH_SELECTS_<option>
   Per Kees Cook, Michael Ellerman
   NOTE: ARCH_HAS_KEXEC_PURGATORY was left as-is, as that is what
   it is prior to this series.
   Updated this cover letter to reflect the same.
 - Some minor cleaning up of the help sections, per Zhen Lei and
   Alexander Gordeev.
 - Removed the MODULE_SIG_FORMAT dependency from KEXEC_SIG in
   kernel/Kconfig.kexec. Only s390 had it prior to this series.
   See also commit message in
   "s390/kexec: refactor for kernel/Kconfig.kexec"
 - Added to Kconfig.kexec the KEXEC_IMAGE_VERIFY_SIG from arm64,
   per Zhen Lei.
 - Fixed the powerpc ARCH_SUPPORTS_KEXEC_FILE conversion, per
   Michael Ellerman.
   
v1: 12jun2023
  https://lore.kernel.org/lkml/20230612172805.681179-1-eric.devolder@oracle.com/
 - Initial
 - Based on 6.4.0-rc6

---

Eric DeVolder (13):
  kexec: consolidate kexec and crash options into kernel/Kconfig.kexec
  x86/kexec: refactor for kernel/Kconfig.kexec
  arm/kexec: refactor for kernel/Kconfig.kexec
  ia64/kexec: refactor for kernel/Kconfig.kexec
  arm64/kexec: refactor for kernel/Kconfig.kexec
  loongarch/kexec: refactor for kernel/Kconfig.kexec
  m68k/kexec: refactor for kernel/Kconfig.kexec
  mips/kexec: refactor for kernel/Kconfig.kexec
  parisc/kexec: refactor for kernel/Kconfig.kexec
  powerpc/kexec: refactor for kernel/Kconfig.kexec
  riscv/kexec: refactor for kernel/Kconfig.kexec
  s390/kexec: refactor for kernel/Kconfig.kexec
  sh/kexec: refactor for kernel/Kconfig.kexec

 arch/Kconfig           |  13 -----
 arch/arm/Kconfig       |  29 ++---------
 arch/arm64/Kconfig     |  62 +++++------------------
 arch/ia64/Kconfig      |  28 ++---------
 arch/loongarch/Kconfig |  26 +++-------
 arch/m68k/Kconfig      |  19 +------
 arch/mips/Kconfig      |  32 ++----------
 arch/parisc/Kconfig    |  34 +++++--------
 arch/powerpc/Kconfig   |  55 +++++++--------------
 arch/riscv/Kconfig     |  48 ++++++------------
 arch/s390/Kconfig      |  65 +++++++-----------------
 arch/sh/Kconfig        |  46 +++--------------
 arch/x86/Kconfig       |  89 +++++----------------------------
 init/Kconfig           |   2 +
 kernel/Kconfig.kexec   | 110 +++++++++++++++++++++++++++++++++++++++++
 15 files changed, 229 insertions(+), 429 deletions(-)
 create mode 100644 kernel/Kconfig.kexec

-- 
2.31.1

