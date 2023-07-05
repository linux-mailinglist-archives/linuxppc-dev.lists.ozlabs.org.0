Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 921AC7490CF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:08:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=nwmwqcBB;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=UCtkzR3u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDLk3R6rz3cRN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:08:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=nwmwqcBB;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=UCtkzR3u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx1zQ3MZtz30fn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:20:48 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365EDkUm027806;
	Wed, 5 Jul 2023 14:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=BSuxvvV8PAzlUbXGdgxAEoU8HZ5pUIoHayxIpUzDV8U=;
 b=nwmwqcBBxRSj+nzHs4SSMsj4k8aZBjx3T46Ei2LytfrRE/16kgcIqu+eLO8Lhy+pP/Tv
 HIVpp3xaA9ug7lwyOQAC5YyBZD45JotnLeF09X8pECZV8d0egXhTb0bYdY5PejNA/2VE
 H5QnVZS2rczhQAgOLBU7hhwSi9A/cTIElioP2hDezYmGGEVsRaLquCbhxTJNt7E5zM95
 52cu2BJsUmCViYgjpP5KqSzP3obITtOd1aaj51VQF08a5kwkxaMA4SC5/0e6JG+7lbiK
 od47uTND6HJZyNK11eOajSZ8R+lbZf8OIxb9QR8UUnMAS/oHKE+uF38pEKz3GQqYBSxB uA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rjbrtehs6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:27 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365DMsjU013468;
	Wed, 5 Jul 2023 14:20:26 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak5pmh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgkeoJVw6hkjPzWO8Y9L0WPM4ivq4Jc5pwex+/2aump2vKLxotyq9c592eWMepevJIEYQP8mXeliGBp9ljKb+SL+TkVlQwx64BtWtmAcdSKSpNnyIbt2U+UIGaEd0fCldjPXeIfTsfXUXJo6KRgS9SG2mA0V+h1194Z0xzclUus5CNcKu2xLDd/VnF13fdAz4JT1m60X7Mt5h1Xo4ExWsk9eTlvkxqLUlywjdoH7YvH4xXueCtbKl0VWHwMkcEa3mf2ez8LLBNfzrzByyu4CPHTaeIxQV24iUdt4Efxb57i9T0/rxp8LlmqavWU8kh7xMZnOjt+NAaZaWOalqLLcJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSuxvvV8PAzlUbXGdgxAEoU8HZ5pUIoHayxIpUzDV8U=;
 b=Th5f/5wnbsHEVdTZZVJIH5CsXLwiWpQxpXa/XJ27Coo1WrbBlWU3co2xqKZp1yd1t8rRLctqWiRUu98ALuR3Rrxn5tKaSyA9qpljUtKg04YWDiFzF9wKP9b8ve6pr7lO7yMhcK0DP2qNLvzur77HYscBx5o0vG8vcwniVDwEcfWdcOoHpjQM0gajHBlHxV8zLGK61zgLyjwwZV9llotNnWBw5Jl5BkSsbe8ePyxypY6bRgLR6hl63vJ/ESyZQfruxfoDFpCgaTF8oWfiFL1fDudYQMUuzh80GsxCga+owJKad5dVhAuks9mjroZb8h8X5Cevad2bHZrOOPlXDL3y1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSuxvvV8PAzlUbXGdgxAEoU8HZ5pUIoHayxIpUzDV8U=;
 b=UCtkzR3uFBSn9MHR05COl6ss0C7nUgevmES/etn6e6OIYm1Zs0OJVPSG4rkkuxFqYQRy1LmpPxz+b9Whxq9qg8Bn0Ko4yIf3k9l5E9n/AqQuTQTW2mf0BCEaGk3QOvLMqkM7BIhn1z6QklKeB2tpPGNPstpwJmhEK/AHovjAqAE=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BL3PR10MB6258.namprd10.prod.outlook.com (2603:10b6:208:38d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:20:22 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:20:21 +0000
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
Subject: [PATCH v4 02/13] x86/kexec: refactor for kernel/Kconfig.kexec
Date: Wed,  5 Jul 2023 10:19:53 -0400
Message-Id: <20230705142004.3605799-3-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230705142004.3605799-1-eric.devolder@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::17) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|BL3PR10MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: 779d498b-0591-4433-05b7-08db7d62f774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	o+OJdA+i4ZBKfD/zbNDg5Qiqic2rmWyiYo/78n3I8hjs36o92hGml5YMFvABxjs5+W6zwvoVfvP83l2tzO5ShEWD4q1JhXZlD2vgrKf6NJiXL/elWilwdn4fR0I4q/q9DhfIMVrL6pH36Z8Cv5mnAV4cTH4UkWBqKr3F5wdFBHSjNz+8N07YGGGZwTzKo+gwVS4hbflbMmlYq1QeehyWfJ1BjYAymYS0bLtrcsMfMfAHdfjq356ZHxJbDvmdhlcDIxKswdH2iQsa5HdyMVHHqlwwIwHTwAoGPleXyygWbwQ9hfl6l8jyNT8sjUG4r4vqUaLT4d0PVfJaULcfG/KbrUliyi5BO/Pkp7fnKBy9E4bqVYiozPk/vbqdnXH3cv/A0CoMRHL1TzgDKxC5/z1mZw/TcIwbJ+teIGKHSGxFv71xaUi9dQ14PcdbEh6Pk+ZWH+2dBDw/cGwZl8TDT+1ghzuj4BNkDncUZGiEqFuW/gVP9+LI4YHjpd4jqM6/WsyZWIbMw+/UY0pLnREZx5X01rlYBr6j1gxTqPl2eqpdSfDaXR1pLOrVEFrf+hiT32/IhdiySY3sywSFZ8czoqD8ra4J2EkKsXpJgcJ6XixTaCY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(2616005)(2906002)(83380400001)(38100700002)(36756003)(86362001)(921005)(107886003)(7366002)(7406005)(5660300002)(1076003)(6506007)(7416002)(41300700001)(6486002)(8676002)(4326008)(8936002)(316002)(6666004)(66556008)(66476007)(6512007)(66946007)(478600001)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?yQZwMqDLKWNzx91mSg0MF1mQ+EF33CFcAIfNLPyXpnvJLnTpfReofQDBPjFt?=
 =?us-ascii?Q?mwXGJ0cK1YAeI41s2aQn4ht0Zwv35BDzWqfIGmLW1CXGPqRjtf95NTuqfTmp?=
 =?us-ascii?Q?CIF5ZCiW65/TnL/u3ewv/xsoqpEfR2yRdDffHCkHe1/tTSd3o2D2vMeYqbcf?=
 =?us-ascii?Q?26NnfeW+T46S3EqqT0krUNF8Oc8XCrsn0Z1igKtmiHKWI0DJkH40Nqiq0vgw?=
 =?us-ascii?Q?Oy6f7Pr/S7nL38YgR2G1FUH0TUiAStSRc2vp9XbvncUSI7C7tpcW4kUZWm5n?=
 =?us-ascii?Q?DPLDgkw3lxrQ9Q8p7I2aDPWQMFWJI4oIB1HjQdDMg8emRnwV4JkMfwObkONX?=
 =?us-ascii?Q?2csUjHDIzvPXunHQg2FWMZfs53QzzwpieUNeSvx1B6C0SvFgMv8boJ9SXzGz?=
 =?us-ascii?Q?x8ZFtrqpiwUXa78sO2u3YiHN7ncFOxdBJEIpc27689ZHhgRLoyFqrkFcnp4U?=
 =?us-ascii?Q?s945XGslM7P38AL7aIULL4fe6aY2Mc5PpeFXyYwH0C7iyY6LoPUe/NR1lKiC?=
 =?us-ascii?Q?uvQR6xqxP+9gtaRKazoKAn4jKCZ8NHTgRZL9TlIgoPNH/HEgAEGwZhGrkU3F?=
 =?us-ascii?Q?OdzKbX4x1wbZmK6PEYJ4H4kVbm+iu/c4db6ggwGAQdYFzJKfYXIdUfOnX/og?=
 =?us-ascii?Q?MNIPRLp5InAP5+fnWlSTcG9JewLzg/yknB3W50Y9wQAgT3TlDHXApoy0BPtq?=
 =?us-ascii?Q?uEZ5lnfpOUAPcMNK54CCjQ7Zak1p7sbiW9bz55Sivc+eem4gGJgu7YeL4HFM?=
 =?us-ascii?Q?0sWG7Vnms0j5niqH9PLVcekXuKts+4po/4hr0bgMCL6I5H7MHapggbDW2wKP?=
 =?us-ascii?Q?fGevTnpgizBLJfXyrvflNrZ/Vhawl2OKe0deUQt/71DVKgFSwjPPSYnz9Myi?=
 =?us-ascii?Q?aRG4CQ8f4mCv8xSmz7gfivO7Sef8YvLRQgCbDspmf2kaljAp0spPdDwd8CiB?=
 =?us-ascii?Q?qJcUQmYX9yRg/BbE6/NHdzq6R5I38G4NSTraQUCsu06Krn2cFAKxqcOPOHIL?=
 =?us-ascii?Q?ze4W2eduBHM2RhLkqmynZpuVQ68+bJUWs9bwbbePrClVLTJQ5os3buisgIF2?=
 =?us-ascii?Q?79RBKfBdhacByc2GVwfPN9btGe2FT9J3ytLLegIfhU60dyk6SdT6GDSJMK9T?=
 =?us-ascii?Q?qICLyTN16oKV8Q8ucb5Yyy/yobYdvnvBBaJvllUK6xq9lB00tQ53qX3YX70M?=
 =?us-ascii?Q?iiAbJNMuLaUfsPpzkPLISNzSUIDy0Ux9MfUUnYR+czRUAKA0DwDzLA57uRAr?=
 =?us-ascii?Q?NU6Vy6nGmdKFhSdekuyctTbSh82GmxYn2a7bSjrLv8AOL5KqpYfIV2xNA53S?=
 =?us-ascii?Q?oEy+mU726DjixIOV6LZHT0bCq2tcs8Cioh1dX0kOdLINdEKCJcs21BqSCbLS?=
 =?us-ascii?Q?E3EukJf6b+00Jym0ZvzOEbgiFoYeHXQPYq/VdRnKdJfFnZ+q2Z3r11gXYRwV?=
 =?us-ascii?Q?MFuQZt0kl4Gkve3OnGTo1JIJRDKJD4nM9tuKdbO3BrkqZ8frXsdrg2ZL20dm?=
 =?us-ascii?Q?6kBfXaQghvZL/A0PhJbi6NxrBx2RtoJh37dI/e7jttGu2rTayJt9qHR2bJk1?=
 =?us-ascii?Q?5U/RI+oF0Bh8onkzZtUL1TkgnawifWP6qugLQKnZwljKbBCu5YCp/A4BcDM/?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?Xwh6LeufJ8J5o4jFw125ye9jL+BjzAgn4x00i9TRwjAisXb4+uujRLhsVLKr?=
 =?us-ascii?Q?eAbP5kWkNakH5tG+mTDbFN29+SWTIBMh+oifVtVyeOmZ/2fsYgAF+0nhzcWb?=
 =?us-ascii?Q?gnNB6b/FsCU5t1Km4rLicDZzPvxNtRRR8QKYMNWT39otxE+4wI282AEBNNFX?=
 =?us-ascii?Q?8UhAR7By/N0ri1sa2KvfwGrHXosx+Jkff1lDZJlkJxMsYu4ouykOdjah7RGg?=
 =?us-ascii?Q?2uU4z0cYGJh4pqJ8XUKRoy/Rjohpt9cjL/2KrsatW0YYeAmzQOEiJs56ZMet?=
 =?us-ascii?Q?gHeP2CMsJ7mU8yAO18ndQwfyfnGC/zzJGYDHpaC91PlOS1yKWIOqZO6PBBou?=
 =?us-ascii?Q?K9wqE34bqZwc3gZG6xzwjsdOFxNHftogKvLtfWH4YdwXDScd6E/TXS0FZy2L?=
 =?us-ascii?Q?hqKsBfgdV+2ymp2teigViJvzVTqYTciATMTfYdF7YabWMeX99kZzk4Nx4Nsu?=
 =?us-ascii?Q?IzEsRa2TO3vepmQZF+tRn+4d8v4nJOvPZnlsYwtebpCzoUx8632bWjGlVEKi?=
 =?us-ascii?Q?k4bLtTOzTLhl5RY78Y5eMRH9lnL3s8gfMCU+YNQr61HmvUkpVd6pyxHFjR6z?=
 =?us-ascii?Q?4Au9bZ8cxsJLSFtSuDCex3B9eC6eoKUVx3hlT9rn1YnPY3104Ovi+9F0br2/?=
 =?us-ascii?Q?7Bf++g/FVcw8mQJMG8Kim8ILW13iR5FeD7vj8YfhCz1tjbe4nz3C1g5PgUkG?=
 =?us-ascii?Q?oL2V7nR/mxC4OPA0ujkYqgpVJ6bo/1jlDB9mqMi3Lx9fh3nXE2XGLiG+Hx4P?=
 =?us-ascii?Q?zkczK31ZXJh8sDhhdX5rMcpHrQ/P1PI+nYFlZDDbQrZB5KAkR61n2S4RIXu5?=
 =?us-ascii?Q?h/GFGUK2un16B/RDemjnvgPDobOMzS1VMlijh0xoNV+CzIC58CvZwbEZ/VfX?=
 =?us-ascii?Q?ZXtrAUK4LP8y2px8qrNyuK1U/7x3RsvXfNSEgKyc5AIxvwY2H4bB7BXLMemx?=
 =?us-ascii?Q?7igegUzQfSqguoYtKnJ+kY8qpm1PfzFk3ws6SlsI5MjDA9JqOc+NUXBftxnh?=
 =?us-ascii?Q?lbU5URKFBvxa+cPIvdmOdfXkhaVYGRmZMRZFD/xGqvaATgbeub963EgYHFn9?=
 =?us-ascii?Q?BnBNm0BcuW73+l+dfzFmS1uRoyFqq6K1uB7SXuVAsVbR3lDfvVbwTWoBvUi0?=
 =?us-ascii?Q?9QqZce+491F5tSCXok+5JbIhVN9fg0NeUVo7TrLwETzbDv8LE+dtRtU7BfCB?=
 =?us-ascii?Q?q3Vjb0tkvbwFF5FllUXTUS1H6mOQ/fUVqg1TUNMOXnUYmAdjF9xMbAgx8OZc?=
 =?us-ascii?Q?WxPFEHmPFiQEVs6EVuK+O/AMUEtLXETAxypm7Wz6mJod9Ovg0GBsuCeMfxf8?=
 =?us-ascii?Q?TSgsrpDF70qfTAp4uVNQenssK+xy57iS349XnU0mAPyWtm2RizoaIpurrsTr?=
 =?us-ascii?Q?Sh6kEAv7RAz6lLNmcFbjnZtTLRrm3QbwPFT6kf6zMKlb1cP2xwbWEwHlJm25?=
 =?us-ascii?Q?+0C93td+UtQMpVIxT4Q2hLcYmcaIKIH2GSWVJAgOvthDjtVIKqdup4qoXF/P?=
 =?us-ascii?Q?q+oJbBa7kRwtPv+aEVbA8se0YfyaiqR/91lkW42hPV1dGtoqGeTH9U9b/eAz?=
 =?us-ascii?Q?+I21lPdwGaYkv4sG0JkVlszYD+py9oOSMVe8pQiAIjff8X0BI1PZzRuqmEv8?=
 =?us-ascii?Q?zl7p1lVIXv5N2763t8n2DC7WgMGZ/zq+TZJ/exEw6BNuM574gKYRAliDn/fn?=
 =?us-ascii?Q?ByW9/MT4Qe4ka//JImQsneO+vnzGiwMWZRl6u8EyoPtl03VCiO6ZDjglH2hi?=
 =?us-ascii?Q?84A3xzSXkgNaduQ/BQlPI4ZIa5o+iRT8nlz1msBZGMpQsFz7w99vMNb8CPAF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	s9tiR8E5BBxT5qTApXwVtidXuFmtDL7m1xxfWBwUj/V3I4LAoB7veWrxOG+m0+kSpUHxCv4nCQIuwLK6xGCaV22O2l0SwvcPVcmrDBxQX4Q1PTBZpICbzUyuD2l4wblB9c4Tq622K7MNbZI4P3VuOBq8+s6TbYGWtGsgnf7hxEIlmJzM+GlX94r+z4WkFgkAjRPQPc9LQPGKmydSA34Q0KBIuJKbe+yhVgKA6fyhyMAwpIwlbNhbVY74JkxfCFNQpE51ZMskgLhBYmsggRkC1f6z8vz99dLoXyBmX+8yzuqMNuz7ZtMJYF1lXZmSFpk4vsquTWi7iqLgAhGfqInJJAgUWzmwCF6T2v+uMd7aCca7t82ds4PuFGMdx0CnAoPm5bBz/nQ8iEu87Ho6A+lBY9/tZ2ns2yyRytxvls/6T4dFbHgagyTiHot+JH5qwnkoYJHQKEo82R9KsQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 779d498b-0591-4433-05b7-08db7d62f774
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:20:21.6529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDU4+Ihfua6LNnOUfezYpML5DV4/pMZ+PAIkvhRjelYFGJsCv2CisZ6WD05b9xARXvBRpbngIM1+lUxHzgA/7xV9IR5P54iAy8W8VPElx3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6258
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307050129
X-Proofpoint-GUID: EDMKqNwP7iKXUJZ1swF8wu4Qv1awCQop
X-Proofpoint-ORIG-GUID: EDMKqNwP7iKXUJZ1swF8wu4Qv1awCQop
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
---
 arch/x86/Kconfig | 89 +++++++-----------------------------------------
 1 file changed, 13 insertions(+), 76 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7422db409770..6d2212c38046 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2040,88 +2040,25 @@ config EFI_RUNTIME_MAP
 
 source "kernel/Kconfig.hz"
 
-config KEXEC
-	bool "kexec system call"
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
-	depends on X86_64
-	depends on CRYPTO=y
-	depends on CRYPTO_SHA256=y
-	help
-	  This is new version of kexec system call. This system call is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
 
-config ARCH_HAS_KEXEC_PURGATORY
-	def_bool KEXEC_FILE
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool X86_64 && CRYPTO && CRYPTO_SHA256
 
-config KEXEC_SIG
-	bool "Verify kernel signature during kexec_file_load() syscall"
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
 	depends on KEXEC_FILE
-	help
-
-	  This option makes the kexec_file_load() syscall check for a valid
-	  signature of the kernel image.  The image can still be loaded without
-	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
-	  there's a signature that we can check, then it must be valid.
-
-	  In addition to this option, you need to enable signature
-	  verification for the corresponding kernel image type being
-	  loaded in order for this to work.
-
-config KEXEC_SIG_FORCE
-	bool "Require a valid signature in kexec_file_load() syscall"
-	depends on KEXEC_SIG
-	help
-	  This option makes kernel signature verification mandatory for
-	  the kexec_file_load() syscall.
+	select HAVE_IMA_KEXEC if IMA
 
-config KEXEC_BZIMAGE_VERIFY_SIG
-	bool "Enable bzImage signature verification support"
-	depends on KEXEC_SIG
-	depends on SIGNED_PE_FILE_VERIFICATION
-	select SYSTEM_TRUSTED_KEYRING
-	help
-	  Enable bzImage signature verification support.
+config ARCH_HAS_KEXEC_PURGATORY
+	def_bool KEXEC_FILE
 
-config CRASH_DUMP
-	bool "kernel crash dumps"
-	depends on X86_64 || (X86_32 && HIGHMEM)
-	help
-	  Generate crash dump after being started by kexec.
-	  This should be normally only set in special crash dump kernels
-	  which are loaded in the main kernel with kexec-tools into
-	  a specially reserved region and then later executed after
-	  a crash by kdump/kexec. The crash dump kernel must be compiled
-	  to a memory address not used by the main kernel or BIOS using
-	  PHYSICAL_START, or it must be built as a relocatable image
-	  (CONFIG_RELOCATABLE=y).
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_SUPPORTS_KEXEC_JUMP
+	def_bool y
 
-config KEXEC_JUMP
-	bool "kexec jump"
-	depends on KEXEC && HIBERNATION
-	help
-	  Jump between original kernel and kexeced kernel and invoke
-	  code in physical address mode via KEXEC
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool X86_64 || (X86_32 && HIGHMEM)
 
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)
-- 
2.31.1

