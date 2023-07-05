Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDC67490D9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:12:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=jSWo7W15;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=SdJTqjZj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDRg5yn5z30hb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:12:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=jSWo7W15;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=SdJTqjZj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx1zk5sVgz2yL0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:21:06 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365EFjIH029988;
	Wed, 5 Jul 2023 14:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=PP/8WmoL1Ch0F9v4vcAvkFcEuG5JcGOdmP5VZig6xco=;
 b=jSWo7W15C3O6RKLzHAut593Uj9Pi+5DUxdP7L/p5+IqSpE+qJQRcN7cuKtXm7ngNAC2q
 dR13A10vNJ4TbgV0/Fs5yqFQbohg7qToIr9g2M4G1sqFBRp3/1Fmr5mrXPrpV7ohTosx
 p0CXFNPV/IDC72exGPJGZtiKlntgiwYmT7k1FQ4R5zX5XjRt50UY1HBcjZaCOwCG9PT/
 qJsM1s9X+g9JICN4559lxfEC56us3kyTRNJlZEuETDLc9u5ZI4y02+ddmGEOngdimzRZ
 Lm22ShI97Eofm2bydSPjg6pcIeb11i71gvKEhu1/EWFxfLmVM4qqsdFJOxnM876iI2t2 zQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rjcpueefw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:43 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365DMsGF033370;
	Wed, 5 Jul 2023 14:20:42 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak5wker-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vr10hfAYnYAhtVmB4+g4kt1VZpOao9WwHE5zyiw7qsTo2qcjnwIoCpu07H6Lis6vbDr6uoSnP4Z11ZFgPTq9Nb8gdONwQE9EGb5SZhvq7eeLPq+zD74cy0OqkxlNZleFJqrPLjW4D1lY1lX3lFLnNJQjVAhrI03F+T0JwC0B8Ncun5/0blOl/vS0x9ShduNhw6uf8EJ1bfXmcGzxTN/0+DcVzk7kGRNQrQPo404qhWGZ6pLZeo0reHuAkedDbRsYB8Q/YdZBaVAFLA8z5/SBwp0jSSbO2dWW2pCA45PHqQq8SVsjWhJU/zbtp5ZZbMYjlSkCvdjM/dWp2J1uArVT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PP/8WmoL1Ch0F9v4vcAvkFcEuG5JcGOdmP5VZig6xco=;
 b=mT1N8F3DmgCdCL8SI9qk1cfmuAwa+tTqAYBx9UwayBNsNaZhAPO5VTO8i1U777LtrMli4BHJs1WO427CTbJn1StBIbsRdN0S7qLvN+bH0yhSpTfxymOt0QhGZC85F0HmmkEh19XNRBGRHWfgKYDgaAKiy8Rcwu5UZb7CwU/E7NXrvXZD0Co/nPOoa9k0xCI1lPy5wbFOrLAHFMnr/kai9PePi1jIVDxRAm9ZmBaOgyx6YruvTere2iRXrq+TCOPO9jJXW8WO2IiHpJc0ffU7sWbO9Jmn6YPtnuTvHU3BL51aFKYSYF/wXhyMi2AfwQsTkyBkdr5hxiy+Oy4Wqh2VTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PP/8WmoL1Ch0F9v4vcAvkFcEuG5JcGOdmP5VZig6xco=;
 b=SdJTqjZj8+RZ9dgnjahDAXkkAyAihWFAz2QN7GJPLuFUFXYXOoel3z2f8U0tC7uFEzc4WaRaizsLebw5a2x/Y7cjLp7lP+a1/2raDFWS5Ech41DguAVcCyv9Ak+GHia0a2kheJRJG/9iEinsyxqMLvo3Yh1tqadd4ezF4fShl4w=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BL3PR10MB6258.namprd10.prod.outlook.com (2603:10b6:208:38d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:20:39 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:20:39 +0000
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
Subject: [PATCH v4 08/13] mips/kexec: refactor for kernel/Kconfig.kexec
Date: Wed,  5 Jul 2023 10:19:59 -0400
Message-Id: <20230705142004.3605799-9-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230705142004.3605799-1-eric.devolder@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::28) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|BL3PR10MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: c84bcc4d-5a5d-4534-9673-08db7d6301c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6eMp/nbv4wL7v6WR+k2nL+sXz1/7weGD5wPchD9RJFLwLnPRCbtfvRfUdg4KBEiT97MUzs+G2RO1QhypFm7lcJG0Ll1FdwPXAyFCs6d2OugJYZsXObWymYO2/7enAl+zaeHJlzPSf+kdq2TZG5NZPdKTRv34cdUdeua0WZt1ooEdtzYnLN5WjomNAq9N8uJwVw296ykoNtasgj1fo3JwEnyQXNhdOkiIh7rrfTaX4G3Y4muY0Http5ibpiemfhJJcJvxRMPKWYAIDuMnqk9HKHjQVWdFs5zJNr0Kk55q9uTg7WlPF65XoyTPtM2/A5iSTwOxczD+8CWxOhMgWoZ6SjUZ4xX8Uh2Nkhf+tK7evYT57+tOSwYPRZteC5Uqe6i/LwbMem3HRvQJrd0HBAfDTb10CxxXsXRF+bqaEyhAh8nolOUdbd2Fw4hDhf9Q6LMaL4T8SLoCNIwdbkzhoGUbdOjjXaXggGpFugJGMjXCBamQcSUfJKMCk5aDcaxFkbTF+h9TytDCeUamLMMxIeyH7DHBE50exbFweuilLew8xOLV1dyQ9swxiSQpOVj6PyNCYWjksCa4RRbBheAolCnXQK7oB4BQkyooTTqwmtlEJys=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(2616005)(2906002)(83380400001)(38100700002)(36756003)(86362001)(921005)(107886003)(7366002)(7406005)(5660300002)(1076003)(6506007)(7416002)(41300700001)(6486002)(8676002)(4326008)(8936002)(316002)(6666004)(66556008)(66476007)(6512007)(66946007)(478600001)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?oD+AcmD5X5XZ3D+a4km3Lt2qnwaMIA6EDlk0HYKZx5BxMztb0c/AycAnKfzC?=
 =?us-ascii?Q?INahayT0W/GF7sypG1dvmmy+bK60fveH9lSOJvAdmYD7PYUoN0+S3zufGqs3?=
 =?us-ascii?Q?k10DQhBkyKTwtDoZcUXs6VUUyPs/86yHYugpUzEnuODzMw6PqVXBwlAlQANz?=
 =?us-ascii?Q?NEzRuruwuEmxfzAn/fMgWeZ4XeXHBCqC+yDPR9yAUrrPv0xkQJf825gCjC46?=
 =?us-ascii?Q?cM4mcIWHOyQTJ1AmXNJxWIPVT6LyYwIPeHKWHsXIKqizNmFl7G31Vydaiyzu?=
 =?us-ascii?Q?GlnM6rbrjO0I+KEh63MdK3LlBhIql7FDxYyIpgi0uwuSZD+vXUTPidulYCCq?=
 =?us-ascii?Q?oqHWfzB8lQrkIKeWN88VQ+x2sRFLUMUlahnNJQkw25fBlY5UaXsBty9ERjTH?=
 =?us-ascii?Q?pm+qsO4g4HVRdL6+kT/SgPPg3LW3C10YpcvJvwZ2CVF2dR5mk+vHCjZ/QQwc?=
 =?us-ascii?Q?UbMek1s1kx81G+TqIqaJ6f0O9thPpn3y/F0Rz0qCdKhLbPfKVv0ZBAWMw79t?=
 =?us-ascii?Q?5BYp0To/k1+0EJ5v/xKxHDC/AFX1Lc3m4lFoYRZ9abcZSmLThQffir5ebuZj?=
 =?us-ascii?Q?8L7qMGLFM51pWW5RXbrD841rMjNyAQaxsI9Ko+qUpgZJNn0o8A1wnWFwjOM8?=
 =?us-ascii?Q?A01XzmjCj9kTQHt+9FKYG/1oXSDo9OPyC4YBMb2TnMlJZLJ1LnkdyCRAxSmX?=
 =?us-ascii?Q?TKxk30W18S9k/flfZp0B3C9nrcpWFkFZKquZ+6c0LG7WPGJuz4H3CPTiRBbx?=
 =?us-ascii?Q?ux80BmeCma4Tp+UVSefnrvD9oHyBc3STBIwJdRETx9lNXTDlJLFKYg2av7UF?=
 =?us-ascii?Q?fRJR4oMeQm1LxYRanCjrSNM4jFMv3nWSvsbK1MKiRTQWgDvw224AUCP5wY1O?=
 =?us-ascii?Q?lu/twkThfJac/9mv9eyXEx5YIgLYOQ8oMRAwbPoo3nCtN16kPftrSdMpJgf8?=
 =?us-ascii?Q?2ysW8Q2qH0AcoxVWdq72a/6pic1EHmxAwO9lNEyC0/mPW+pD2RqptdAeIkiL?=
 =?us-ascii?Q?mLJW3x86yDDYtfVCjdq+jFK6flNdGRsGVCkKNFlYYPXNN/LqztMwQaezhT8X?=
 =?us-ascii?Q?fx3SaLWCRF1O+I8rZ0NGXBP4Ng9Z5oDwDeEmk8+Hp0oJJOFeSdPinVN1HnYQ?=
 =?us-ascii?Q?SwIUsQkOzx2FPnhi1I4qiUmXA4JiG0gnbTaZpmCMXH3l4Yi7fbBs7QSCe7gn?=
 =?us-ascii?Q?Je/wdWQM8X0cZB7PxoO4EPAdo/vMHP1KZqVtwu/pXkc2a6DotrjfKATIKrXB?=
 =?us-ascii?Q?DscuwZK2Oav4cC1lYegOIbEkA6OfngN6Gj23GRvy6wlqNbM2C8Non8W9wU7s?=
 =?us-ascii?Q?msHwpPvUH38nts5WH0EekDFw7PzrXzqug/0DLpIF20HUPCHimXl2xUqyM4tt?=
 =?us-ascii?Q?A1PQ5wYjEonQz+djnlojBHj723Mu4yJjFIGJLtBxKfmjW0fe1ie6f6uBdwq2?=
 =?us-ascii?Q?rmX9L7yrFWvaaLcHquEUu3fSj5xb/ECm7JSWRVe/nomy5FHbayHzHhBUbFTJ?=
 =?us-ascii?Q?mvRUTpzX6Rl5UjFUoFrd6FFILp32XbVbcXRTbPuIhXv40m3+ldstuTMmgeEf?=
 =?us-ascii?Q?ws8obO3TqEPJUuMb/cljhdUxDSd7ce/6zchUyYV+pu4+gjme0KhCTUCKO3Vi?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?J4ngQPyB5LSKs4+7+l0rUF84z5/tXNCegxXpR2bx/nDaeNri1CuFZjnSCr8o?=
 =?us-ascii?Q?/3wM7GduZjQBaWItf2X/WDt1bE7QCNiRwDjy3sMsiQP3K5U/7Jog8n/ITT+q?=
 =?us-ascii?Q?rlDK4DBZU2klxi6KEtQTv7R+lIRkqpLvXjLIo+sGw+Zjp0vIjm89t7b05WOJ?=
 =?us-ascii?Q?npIRE90W8GO2FM1Tyb0ox9VERWkW5YGzi6waztAiMX0IOQwgwafZJQlqT+Kc?=
 =?us-ascii?Q?Kvi8qI15vQvUhyOR3ao7CPyb3uoJAJbzlcysNJKWz/2FJh76S7MBVSUX/dRE?=
 =?us-ascii?Q?SCdRnowep2eyK5XntnOX9j9svbGTBpj8GUqXyhRwFWo6jgbiLuB4M8MmjCo+?=
 =?us-ascii?Q?eFersb57OIgNjwIDmWBRbecvHXMBgPwZWm+x+1buOA8OECmAWLu2+67aaK9R?=
 =?us-ascii?Q?IqwpQE93D+swI9UkQmBfcWBfAko7h875/iGh6ag5509oyw4D9Gtis/JkrxPG?=
 =?us-ascii?Q?/yHb2ODJimmElL1UeE6g8dBNq5rG7spSYyu+f3M6Cq6cTHOrOKWUfjr0saIE?=
 =?us-ascii?Q?k5cOZ2t2hqV4ZcXvfFt3hnK1uu5lyrPmUDdDci9EK8D+xN8PHHqDvmDd8Re3?=
 =?us-ascii?Q?W0vAVGD4orpbIdjhFUkuGb/s10YIrZ3WPbJNOfqaE8DxAEIBKMzxaTa6lNXI?=
 =?us-ascii?Q?4HSJ9Tjzl53aUpWc0hK4e4ySqRs2qwN/T5lbzoqYzrFsfG29jaZHe5b2JsyB?=
 =?us-ascii?Q?rRwj/Yhf78O60zUssECbMjzI4/uuZzRzUSiAqTK+S2QvGJ3pcF6EGiLmnhMp?=
 =?us-ascii?Q?6cc9oY/KYTOYPrlK0z2gBeC03JdqCkMK3TS82vorODeU+cBK2MifTWqVDDqz?=
 =?us-ascii?Q?69yCQZ96aLOIEln1fx43qJFCw8EN7jzdc4Cuh2uLv5+CIjRQ2FRRCy8WpsJ2?=
 =?us-ascii?Q?Jz4bx7V7GpxBdHXtLn5TRW7BoJV0KltIg/oQrhX4EpkvJcKwDT0oJz3Yxp25?=
 =?us-ascii?Q?ETfFckBLryH609dbg4a8VmmbB63OiS2UGsVJKc2Al+sjQCAG1guBQlb5ayMn?=
 =?us-ascii?Q?lkPF1yqK6Cgy7OaItqkrnZcoUYdAta5mquBCMYX1VogYYULntFIc4SVeJVyU?=
 =?us-ascii?Q?jjNm4woIcr47nqBnNgChinJjWiqnCqhAuFg9TBhBjFUv5kKI+UNGvytVU4ZZ?=
 =?us-ascii?Q?VMFX0xlBLQOgY/XTRD96yfCSfD2RgW/y9f25ADlcuHTSVQqjM8cYWDG/7Oy2?=
 =?us-ascii?Q?IPZ47WoylEJyiglZjVRyOCV1qEpZhn0gzAbxXNsGvRmpuShwCVWdRe2FenNE?=
 =?us-ascii?Q?NpE3aPKGCzso2yudzWmTwWoNQKzfqnaMuG2dVWP/EEb/9LHuD+2ojejkhQJf?=
 =?us-ascii?Q?lNwykRq04v5xfXQlOuCZFJh39FJ3ZXdujGktFiuYzgfX+hmhMSjTxg2Z1/5M?=
 =?us-ascii?Q?xM7u7f65SThEC2AwwjDpUu2ZLznRWE6HH8ujmPynIUqG8pSE7+EzM9wx3FPe?=
 =?us-ascii?Q?s8QPze8obqwDGrt0ee9fp3hbGXRUfTJxuqbzCpNYn+1rj4yicSU3D+ROT7Za?=
 =?us-ascii?Q?x02WTiHd5/OIUkoDGO2L7R9WB2hDbrwW2FuTW6FLzBARQZNbxa7EAB49boPW?=
 =?us-ascii?Q?HqLezLzmKrOb9lwF9kkOaBbbRGc3x+EVv7KBeQKWAJsWWCJGODWcNU4pcKPc?=
 =?us-ascii?Q?YPSrfn1U2YdRldLCa/JuI39VMV1cbNOeoBvXJZ82rwxCrxChAgv2mkIYK9OL?=
 =?us-ascii?Q?x9MVjAJF8VsBnm5lyCrcmNWOWGwWaGVvKyXie7B1Prkpgqz2g4qJDgCQ+SCH?=
 =?us-ascii?Q?ZewtQEe4EZOnE6Y2uqf6jZC2oslAbUtybNn0ewAtyoi0H2QX5lq73l2nqrxD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	BkvvU9jnV1w848qsJE1ktm+cUu7m9J4FWIdSMLRffsV/3eIRRa915OGa2WWkUQF6xG+EtuMOsPTM0LKOw/fTksAWBvAEqjEHnALIrxd76csShdv0yjVZJ5vVWnUfXBRWjm6zkRktYrzWE2bKOxVlf1nmq/eAJy79ZOfV5MBGYmAM6JZ0SXfrRzwTty9s/ziocEWdngitTiija64PE1nT/4w31Ah+f4nU19GEnszdVlgp5LFzJhwxQaZzH0EaR8/UDm3PuCublIb9kqK+HO5ht4rQJFuY5CwLFTwliQawSIwwZtVxYhP0jEi0bXDUlKugEAiECLEUzwvNxHrFIuWYm+3XbbqvbHL7AT+FORl8N/W0O2ZlLTQH2yHCHERlU8BqxdB28GNPV5T81tvYIlRl0XoQAjsH1PjwitZedSFNUY5f2exoK5VWP1/F9k3zgqoo5/S4ck4aF2w1Iw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84bcc4d-5a5d-4534-9673-08db7d6301c7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:20:39.0409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwA5QGeCz3IljTx6xn4IOvSlwhkBrpEfpgiJ4JtDpkv808rdj4qLOTKJfH59gc+3MXT1A8FDDLbQyX7dO0+apR43DaaFZvc9qkuPacD7SNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6258
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307050129
X-Proofpoint-ORIG-GUID: MDi80Kq8jWE5wPtLt8Xt8soBfT4tihYk
X-Proofpoint-GUID: MDi80Kq8jWE5wPtLt8Xt8soBfT4tihYk
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
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/Kconfig | 32 +++++---------------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index fc6fba925aea..bc8421859006 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2878,33 +2878,11 @@ config HZ
 config SCHED_HRTICK
 	def_bool HIGH_RES_TIMERS
 
-config KEXEC
-	bool "Kexec system call"
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
-config CRASH_DUMP
-	bool "Kernel crash dumps"
-	help
-	  Generate crash dump after being started by kexec.
-	  This should be normally only set in special crash dump kernels
-	  which are loaded in the main kernel with kexec-tools into
-	  a specially reserved region and then later executed after
-	  a crash by kdump/kexec. The crash dump kernel must be compiled
-	  to a memory address not used by the main kernel or firmware using
-	  PHYSICAL_START.
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
+
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded"
-- 
2.31.1

