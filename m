Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D6D7513AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:40:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=36HmbkWR;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=P+V1FifJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1XkH5s94z3dGV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 08:40:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=36HmbkWR;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=P+V1FifJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1NDF6Fmqz3c0X
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 02:17:01 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEjHTF010027;
	Wed, 12 Jul 2023 16:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=3kigNhnm74JXGxRnSJyT7nDFiqhK3cJdGcRD4UntLgA=;
 b=36HmbkWR/ER8PRLc377JEEcFSo56k4d43UQD8tHjSKWNRr/WPs3Yr/wdlG2GJDDYU7X+
 V7gunR4MyaiieT1hJqx9I4bkOQCpRmF1CISFiGlKFwrmop/PFKRCveao8k9wS7Utnsch
 Z8t9gh3/B+AXS2VHCNqnsJSnwU6j/qBLQeWK772pphHWJJvU6lWU6LXAk+N4EX2cyRnc
 FskrDbsT5bESGw/aArD6WKWbHcLUdMARE/Wy10Sn3qbn22O23HyRjigH3rIjtmsEmSn3
 9gibuMmJH9B3gVm3DR+gsy7dCnPh2wQpybXKA++WGMg6lWRtUPs3YZd9FSbniolH/Iq8 zQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rrjmhd7af-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:10 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36CF4Qxe007142;
	Wed, 12 Jul 2023 16:16:09 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rpx86u30e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJAjj4DHO4PbyErf85DBkfodx+nGiV/aLr16ocQtp81E6JF0yybldl963OxRVHdmx9RvXUkPG/DeyanXAzI9tEk7PmY67ZrBKWgzMSJexUMAqDOTx17ozSKePcGtLYcgtZwSJ3XpgwMNc94j0eBTeYogbf7Yx3PkOMmmi8uDzBFNFnTVnE0EExYmUhJlQxnto3KdkSAJ3PZXnBOiE89ehMQ/5qQ8kriGJBuJGhd+HWM3zPAhR6ERHZLU+uYnuzZzeLjVfNRy+EqSpUMLPs61G3DPKn3OnbF07i0JwXoHkT7Tg5ezdeRV0tatM8B9n073irzLz+lGHcXcJsJAdefRnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kigNhnm74JXGxRnSJyT7nDFiqhK3cJdGcRD4UntLgA=;
 b=Gv8WEgeyxNsTTRO+8BE4XjIX/NhprYEYAn4WzcS1hEaJi/DalmfvbSyAsDHQwKClA/mDm4gj5z/OcA2hqvzKLQLsv/Bsj7DA0XPl+YDja0Dj7OE7z1IuqG5bl1IRRG8Z108G2NEiZqwnDeuoaZQEzkWCl37z3mTKxFA08K1JGyCbwGCvgV3rhlQkJlJtH+/DqXkt76uzTlpIVHHy1WeD/d2Tar6lwL0fkX7nVM0OuHU+WtF40utJIb3u7AV7eMbY8wDDNw9DyEl87EznM1eRwsNKoYsUoj56J7q18KhT1ls4k1U25csKNQoMonTFgJpqyRjD+8ftBwHnUVFjVwCqug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kigNhnm74JXGxRnSJyT7nDFiqhK3cJdGcRD4UntLgA=;
 b=P+V1FifJQrQHhsu1vEpzJxG9jrflZLqZb2UxtkrD0HBYPVkmMGOFzZ3wJInEcFIAvhJk+HmuW+/buAgkW3RmxioCgnKfOSR+i7j7Aj6ufqi59FNmC4x+61T24QnewpPLKV3RkiKjlJw0qZYElr0uKlvSMSl39yXh1VUBDop8kCs=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH8PR10MB6501.namprd10.prod.outlook.com (2603:10b6:510:22b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 16:16:05 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:16:05 +0000
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
Subject: [PATCH v6 04/14] ia64/kexec: refactor for kernel/Kconfig.kexec
Date: Wed, 12 Jul 2023 12:15:35 -0400
Message-Id: <20230712161545.87870-5-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230712161545.87870-1-eric.devolder@oracle.com>
References: <20230712161545.87870-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR13CA0037.namprd13.prod.outlook.com
 (2603:10b6:5:134::14) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|PH8PR10MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 36bf2b6e-559d-45ef-f785-08db82f34b26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	KzSyd/OtMtGjKifWD9nkFih4rplX9ju2m6/odLXIu6KKWtOGAg+I8k9yPZj/jtSf0fiZZEausUPRBQQMivnqo8DIYBEXe1ns4VcNEdHHaCtIJP6c6nZFgkDhIdg2N7C10noE8CV7bzgN2jZaKqjlBglAI8oU9ppL5NoAx0DfVTZA3B5kEOrJuCQ1Qdh6BiDLVSPFqT7emoKftIqXUoC4BoAGPnc5UQ58BlsKEpGCo0EkDPkmfECqKj/diymYejy60TRerfMDbO4djZWdj47FVz6Vgp2oLB2DJiuGS0Z4jXH5kcItS8mba1sy1KVXqIifHxmVvpv9rRRcLbEfGpr4ZcTswY9W1AUeF5vRXVmWiQT1bOHgpK8e7ubQ30Wj91Y+Hr2nmPCNYyAYkdml59PFIf0BWzmH/kFefoRCOj38lou3JbtqDudv9m8ONYQz1xbTsRYKSxrHDQYErvvyxpm0wkZRZ86lxxhbqO2GtIg2jAtaZQ1j7UoogXTKVUFllFpENdm4lUDUn2t/mLwNtEoHDs9p1ls+1FuDeAVrgfpEh91mvyPKfxPzQ0kTxnkcOF/ssrAO1o5r7TTOmhxjgBQb+uqe0FIg50GS2E1VhPuUF3U=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(38100700002)(478600001)(921005)(4326008)(86362001)(6666004)(66476007)(66556008)(66946007)(6486002)(6512007)(316002)(41300700001)(186003)(83380400001)(2616005)(2906002)(36756003)(8936002)(107886003)(8676002)(7406005)(7366002)(7416002)(5660300002)(26005)(6506007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?uwYdVVA2AbQpeoy3KyGVdL9096wWlAPidsriHCNcFjS1kR448eiQoDUK1yAb?=
 =?us-ascii?Q?d/bsAkxUbU8PEkTMULsY380m037RoewHchZmVNbnycDYagG9kqNxatKEtJWs?=
 =?us-ascii?Q?6Ig3vTAGumJkeThwT0AhDytDxM+ua4LIMES4KkeugSY1XxhkBmZEdaAwhbfb?=
 =?us-ascii?Q?NMV+hJg4Lf6YMsKuUVYnrXyTwiTjuydPQEHMreBs/f7p8jVuBGZT75To7xiE?=
 =?us-ascii?Q?46mEmqk+BsHg4MvgqDeZJibXbj/J+K0Z4wioaF+zpuJD2wPRm18On9NzlD3W?=
 =?us-ascii?Q?WueNsV97LNFJc/BjcCyrBZoV1w469LYbYzmIakl5U43TZfrU7YXTyAId5QVx?=
 =?us-ascii?Q?bX5aOCXIgK8a7fKqIiHq3Vqx1E2s8o7XrMXcAzY9beTLBPw5+HWZpoqD9kEz?=
 =?us-ascii?Q?7eRTBBa6Nr7uipCcFcR5TssKbE8j8l9y8x8AV33rNCTRtHhdVdLtLj8h3LAG?=
 =?us-ascii?Q?lODnbKpbG0DJaOk3F4GMw+VPGorBCEd6YsZ6BKNnEQsLG4Lq1nTvEdHyGoKi?=
 =?us-ascii?Q?IqtCLgrEfLk9xMcEXW8fWGFVo6MwLvBZ0No+8H0sOHhnVyoKFj+E8s4iW6Bz?=
 =?us-ascii?Q?+mBy4gZccNrIxDZ/oUo7gxn4CI4LQAv/86KJ2hIRoqn4WEUFUMAzP9GB9zFS?=
 =?us-ascii?Q?FbbdDDL7FpJiSwbzP+WhqK28KDiVXHQEI/bobjA5EWo42UQdvGBltdLnwJDq?=
 =?us-ascii?Q?pqn1bizFLW7H49DZGyFGiw5CkQ99zFMjiLPjgytQbzLlRl3RJPEWx70vnicY?=
 =?us-ascii?Q?3gwlJ0ACC8Fn/MzlrDks/LxxHRQE9FsLRNGkZvxDamy3LfkGsidcxT8XXOok?=
 =?us-ascii?Q?4Hl2IlTe8S6H9h8V+atjoSY6J/fojDIA3601QFWbxpJL3NKcUHBH71KdTjyj?=
 =?us-ascii?Q?8xL6Xpr/vl9wNj57tL+Pjix6t8JjPgyZeHSM5s1lQQbJd6sWiGfQbCUWurYV?=
 =?us-ascii?Q?Lfb5kOVYxkC+xNgLpkJyV62r0LoRtMsIV/7G3R/+DXH6qXq/eCZp5n4EzJB8?=
 =?us-ascii?Q?EiyHz5eunvgkK08h2LyzejzgPjtsYe+VZ5SWGc9sRaKsCNN2/xQ+G/pDq8kF?=
 =?us-ascii?Q?4CC2b702TleYunP1SG5347LS01wmxKJdsmC7uSuw0P8wqkQMmHhi/fLre9nX?=
 =?us-ascii?Q?L/Y2/SEyKpqryrByBFnLq4gollddVn5bVD0Lsaz22rh2jNh3RroKSVfHLBYm?=
 =?us-ascii?Q?aNDvOPWrWldCPJGJ14ab10T92N5BuU8PSqF9REDszLRvS26IHGZB0s9AWYVG?=
 =?us-ascii?Q?ZVh/zHIRKJEL16jTD9NQZfpIgPT3KUWaIkFDrLQQsIFnl+n4WGJfYPsXVZ+6?=
 =?us-ascii?Q?AKtw46zpOKEpyT9hTK8dnfSVsXcZ49vzKTL+jIolZ+rN81z+amxE0dJX3jly?=
 =?us-ascii?Q?eDaEGE/c+GNscE+vukH5H8/vdyfpfLpUXGsw3mXrstxD122pofpu3C2ihJXr?=
 =?us-ascii?Q?TEz2o5aeVta/DEGrsdIJYbIanKmRK9QkUsbVVmOM18B67ywOLi5bAFZ72pvk?=
 =?us-ascii?Q?Oho/FzxwJkAXb/6HaG5aBJizVrhmgULRvFURZjRZnQw4Rz7PhaxIQI6Up+le?=
 =?us-ascii?Q?t04CeFkAyV8xpRu7rmtjMhIvezEumpSWY+hvZHCW8yHzTQCRn4y6giv9nsR3?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?iVlU5iwUZhzuwnXje2a4NdMvqvQeIhA4Dd84WBDh/6iZJTMGm2jOzuYudxrr?=
 =?us-ascii?Q?rSOw+lBGMr/SAf2+TVty2f/elw+/dEmShqEav6aqLcVg0RB/CjWHnqTPwzIt?=
 =?us-ascii?Q?NA/ALw8uuQ8LF75Q33ePZWi7Lr/LA3OwWrUQwdA/eYT8LbWgSjGxc241x8u8?=
 =?us-ascii?Q?/UwpAOhnYc5CGjmksFH2nEtpz6WP4ZiQ8ilmeL1rbM2eqZI0DU1b8XDzr1xe?=
 =?us-ascii?Q?GqBh1S5Aleb8oP+sa6uABm29H1AFJzpVT3368is3kXURux8tcpQK2Q9ITmQ2?=
 =?us-ascii?Q?QNUQl7VgEUv6U3ZCTDw+mEbdZWjYBVDhnBszvdK1s3iRcLDka9J/YkKY/lk7?=
 =?us-ascii?Q?aADdY7IOKQGQKmy6JtFvsy8WA599Id3pr5Sd3pRgDnljY60l0RBV7LsfaDNx?=
 =?us-ascii?Q?/0saB9ylpJJYXIDmI8AnZVCpwvdNkiFEdt3Kvw0JON4M34q4ZV/1vrcbeDk2?=
 =?us-ascii?Q?kQJnp4Ch8gIWIcc4+Sn2SZWD/i98HdvH3yfmuyl0ib2Hu+UnpgkSrpVwqLjK?=
 =?us-ascii?Q?92or7FvMYLnR8JoEt6g24MxB/818ed57T5EwxwW/JYkrkjR4nudYm0jnv2C4?=
 =?us-ascii?Q?tv9Gyw4IkYPUW3i8t3zCyDcz1bC+2iXCH4kmfkeFl79FNoINKatfuO7M6tpb?=
 =?us-ascii?Q?6GZrbcFv/LkOX35SAugGlwUAW9j4GdjYSDxQMFLFMhvZJoWIG2asPug8xoQv?=
 =?us-ascii?Q?CPj9phY/i7uDqAT94O0hUH9JiWQZ08R+oD0UwfKYC892GCp/xC09QEPSXWfM?=
 =?us-ascii?Q?7+ud5qMVNXS/mJsa44sG/1pk6Cw63If4xOhF8w0c+edofuyHcpgN/OtAVLS6?=
 =?us-ascii?Q?F8AI9i5rB5WMBgdVYyoAc/LvzqPMPhftw6Kp9Wo0axx7LhLb9IvrKhaCKsU+?=
 =?us-ascii?Q?sYkVigFDe0z8cl/P5PLfjDdZ1F2snRoZ2iK3h6Ru+2Nm0kGlZbpf7gbzGpZN?=
 =?us-ascii?Q?JKpWIxazdUQJmw5BnhnqpzFWAub1tu1cqcjGPXX69TDEOpiIssMDTFgTWqex?=
 =?us-ascii?Q?AflHZNd/ZuUOEQvLzgnOwDQuv1myimpT8wuHkVrvkgDD3C3yo9xyIKwh+tIj?=
 =?us-ascii?Q?0Q8BmkP5QrtxymyloJyGuNvn6mwzJ1u0EMXlGswTHVMuScogXmzQCI6XZMq0?=
 =?us-ascii?Q?IIxNoaXCDxElTxRyEyHaoJlsa5KaIbDPo5TeeTR7ljRD1N7rbef/twQRk5AD?=
 =?us-ascii?Q?zknkb5ORv2eHWmaKvvbbbozI9lgI4zX+fuzC0jIYQvmnHcONvlEz1FcK0w96?=
 =?us-ascii?Q?SRveXSadUdHtDHC7CSkmskvL70fxittgN3kz9GDvzZBTMWQFQjDWEUQB3Zp4?=
 =?us-ascii?Q?C1OTwukpnwiT0BG6Irrr24emcu9zMRS6PKjucJukSVvaVp5kNnqJ+JCcW4h0?=
 =?us-ascii?Q?mp7lTCa5C2bY1cgNNSZqwVjsi9zuHmsjFzUNNQDyQX8LNDuP8a2Y2aWknS6/?=
 =?us-ascii?Q?si18d0jeiPb+aXfY1qvn3I/d+j+uATvCslNHVJ5Z1lR7kQR5/aS96klBzpRA?=
 =?us-ascii?Q?O4V0Y8hJxwa4BzSFGw/JUv5amtBhuL3i8jXf2RRFe/wvSol1zGLolaP+5LHJ?=
 =?us-ascii?Q?MwXsW/rN5Osm8ES6+n/5899UuVm85I1wkQNDnFjSAVSoNdDFGdy0wJb1r7OH?=
 =?us-ascii?Q?Q6ZhVAN2rDqtiFVNmf8GFZhkP8E0JhwmVBFdLFBOpSwgh6CIC156y1cGqgmw?=
 =?us-ascii?Q?JBIbmgtF0ltMloLB4kPpfvwiG5patHOZMNs5rTizAn1/n0DS4vMcUlvrX2cI?=
 =?us-ascii?Q?HuuabftmbtI5Plbp2gp1yCKJF8VNfmo/Oo9dqzdfMk1Cb+f/AjWPZNT5mwdh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	/pcd+nv9vWtuXKYjj+IFNOlBCjHKePqHWzvXsw1uy78DDdMa5Z+g+Ic4AC8rl35GON6N0GJ6Sw/csAuJmf9ptsnY96YCmyKl67Rh60gqyjrmJeazntmKQhZn8AmV7UEsvvyL7JT0nOHeRv7Pt3UOP5/YIXbNXU5paBLLhh/K+KWqFqp1MQxvNV/O+yToAkKHBKcLEmlrdn7srk4xTeOO9AnbOG1hRN2NUCf6WYOiRW+ZvEeJv0xMAUXZFBpOWNQU6EfnaPbq2KI95Up3x60NJY55D8AIzKZa+ojQjtGCTnke9GjpPziPBTkwkAbmnRuldvP/vM7qdF7k7zWSDTGKMHkEIULgaFVj+Pl7ym398O+vKqEgfpE+SMGJHFgjCreM1KnRZRwfr/pY2su/sFec/WDwP+BjI6Z/aMcK9P5YULL5Yoc9AVO++UdYyRfYJiV/SbxCEmSV70P6Fg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36bf2b6e-559d-45ef-f785-08db82f34b26
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:16:05.4733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0m5bip9gGlaGtuaIp7KzRbgulYE8wAEiVbqpZJ2i6S3AnP79zOkRggL3MQsDENiMgyfizCnZVcVJXNA2+4QqYenVWZkFq3/35sa9scPfzLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6501
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_11,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307120146
X-Proofpoint-ORIG-GUID: XomlL7cDkmmpTv61Kcl0BVWRuN7Gyk07
X-Proofpoint-GUID: XomlL7cDkmmpTv61Kcl0BVWRuN7Gyk07
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

