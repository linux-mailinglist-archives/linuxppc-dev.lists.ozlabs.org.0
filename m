Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4AE7490C9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:04:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=2qG+flp/;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ravpKL6d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDGm3fd8z3bvB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:04:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=2qG+flp/;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ravpKL6d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx1zQ2f5Hz30fM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:20:48 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365EDfNl022565;
	Wed, 5 Jul 2023 14:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=wDmH+eAqpvKv+Vbzr4jA23gCEj1hqVSRKdgrtk1NpbE=;
 b=2qG+flp/VMP9giJkqKgaOkgEtPGtdjRC5XpoesddY1Jqv8Yu8R+NnL3RgpJ1mCjIaO24
 xzdzBcva+w16kOf50oxqUW4UEt8GhamvaOE2Zo/mEXdFbGaxIME7Xfydq+8ZIqZKZXyV
 UykXFP1H4AzJGaQj9cYm7FCsC/2jxrruwk9TBJZXCxCnKV7L17G58d/zRt3VWWGUR/c4
 T1Peh4Xg/N3JoALi9Hule6V2q4BzyjQlOR4f/zTfbIKS3eQWo3uDt77TOaKF3ZgSE+O8
 xZYouyxpTBybgq06WSDRQ78TeXE3aKLee466SokoW+93ZiiVgxPjSsh//zlu3e4l4PR0 xQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rn9ybr19y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:23 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365DN1LL010157;
	Wed, 5 Jul 2023 14:20:22 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak5nmph-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsDePfZYrEgDpvxGD+4bniurfjRGCP9CEBApqA2xU3NTS/kHJXFxZy/c+hCVm+bilIKTbptr7jnhxTyXzQc3Tm7q8WTsbzLrDf5fuPhHGGnc1XQELbNsDUt0wkX9m72uFarMPDjsnSHMlqA9SeT+w6q07y96XGYo/HfMF6/xN3+lBYCGXsbcGBgS+k3/WBiMc+bcQsyvPtnuA6GaQH+5ohTUdAeZf/RrgnQtfXHT3h97MHc1l21HYpxT9QCO6hnd5b6+ztVpGg6q1mYY3JQeBWezvOf0se0Kagb9njHOXvnVMt8Jfz+UWgihD6/MhD/QAKYsB1Ui3G6DsA+9tQ8jCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDmH+eAqpvKv+Vbzr4jA23gCEj1hqVSRKdgrtk1NpbE=;
 b=Ij/UFTTu02oRvgLl75EkcX3WuCcpoLnGgg0FSYJqpY6Yxj3goUlywLFkARthmMTmeyhRroDej7ciP+TbK1S9G1ea0zwyO53QqsYd7EIgBv8Cl0veUGeiph+OBkzBD8Ormr52E21TVnMway/es/fSsenMftmTOW1W9F5sx8K21Gm1Dy5TguIoeaCz2/UyBZYSu5nhYn/bEYi9ghM+QVUZOLM6VtcUaTFYNU+WVbm+GayAxYr4tMMJ+sIYemoy14gZZqeIOuEEpcwUzR/D49K8yDW3DCY1IiNgIN8MASqLs6Qqalqd//xXSEjZdTkFyBU12smYnpaVxpJX2nYwo5SbRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDmH+eAqpvKv+Vbzr4jA23gCEj1hqVSRKdgrtk1NpbE=;
 b=ravpKL6d65cVTuKGgOhpgkXdCylNE5L13oKm1wHSN87XZy5Pf9jCs37LQcnNqAxRO9dI3m3q+XY75sD9q2LLOLxickaYfyjRwZFZSOnrvFPeGASD7R2qUcEHx8lQCnLGmrYgAPLHIWFKe7Z3yNVw3dJ9Eb7Thtr4W6AxBjRe9s4=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA2PR10MB4732.namprd10.prod.outlook.com (2603:10b6:806:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:20:18 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:20:18 +0000
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
Subject: [PATCH v4 01/13] kexec: consolidate kexec and crash options into kernel/Kconfig.kexec
Date: Wed,  5 Jul 2023 10:19:52 -0400
Message-Id: <20230705142004.3605799-2-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230705142004.3605799-1-eric.devolder@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA2PR10MB4732:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ad0bc5d-4ba1-4314-d527-08db7d62f581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5ydZuc6Ol7c7tZt3Yf+dOFbnzyGrJGMfX4jWh7PhNg1cnMXhfuc20eW4p7JQ+y4A/kb1ZcS6BVfByzTkNCwTtva4ZMDpx/onCS+5Tples5w0JQ+Ne94AtaN8p55tQqPJ7QyNfYiyz55AT0TjsRGvuadVrXKU/98CLOMqEX7Evpa6qlLLJFJseYwF4s5OuynuzsFHJNgO6eqFmTJVdhYqtXNXJqf5bIfRqlgVWmACdOQYm4AUX3dl4rUKBe9ejSnBkfwDeUigmttIbx6tgePUQkvMgqBKh4FTiAqCLZbxmrSi72IBDoAd4HwWYLZzn4VHrLfDfaxesrj7EN+v/IAlm97TSzCRkOFnUS0UdKYn7a8yjNpThRxQUhDgiivpMEY/J48LO/Q8bqJ+VuYG5i0BAOe1/1+HWgIkTpTaSnDIHEyKMI8Jjh88ljyZ9O+N2IHD6jJaA7A1Hn3/WJyIw+cvxDXZHHmgnIOBNnRJrneB9aT0HVGoAUqyF8gcM0WdTcFpEquh5VivnKlobWDVOK0G+5dlTjcVARuStOIqUUf5eKALIsPBQgb4VrGtq4Htp9pcq29uuQOZj/3+M8aaMGgtD8uUOdEcTX1aKoHcCDIaRrg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199021)(8936002)(8676002)(2906002)(2616005)(5660300002)(6506007)(7416002)(7406005)(26005)(1076003)(7366002)(186003)(66946007)(41300700001)(107886003)(921005)(6666004)(6486002)(4326008)(66556008)(66476007)(36756003)(316002)(83380400001)(478600001)(6512007)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?T564Ls9sUelW8Gshcz/2k4GV8yjGS6p6XUFCGASOHZfqJYYHMhfn+i3yPoZs?=
 =?us-ascii?Q?CLfJhVbxKhdBi8ybC05+8l5V5E7GfLqkKur4X8C8stGK27R60FaH1R7o4mGu?=
 =?us-ascii?Q?yk/pqlgEUxW/Cmt5DFqSEZwzzNr4+Y2rMdZUFZuxC4cNSffGRMljTnAFWA/y?=
 =?us-ascii?Q?KOZMtunw2p82fIpa29raXhTIsShYZdpD2TGWjGl0NLOTFHk5yrG9adBY/Kmr?=
 =?us-ascii?Q?mZHeQoGpUj9HgPL3BcgvLPIFSb+rYG2kacF39ija+akdLqEibbzM3eIc339J?=
 =?us-ascii?Q?6P8HzuiU63MZCsGZundNPGuRZnl3fRCLO34Neno+R2tRa1+WMazkB6m5KGHu?=
 =?us-ascii?Q?jiO6DkelqsZycLokrAw0A2B0JMmAIt/zapHStXtqUdQ1N1D/Djw3NLm4pkXH?=
 =?us-ascii?Q?quKdlNxO5njVApeZFxBWc85At94YSB6wR+kJsRE3KpHzTX3i2v0zFPwWp2Ke?=
 =?us-ascii?Q?4ZpNMtUpLekgXN2eYU33b3z7D/3sqNNObTPdJ6OkW0MSGxQJWZObv42l4eA0?=
 =?us-ascii?Q?tEslEhJB4Bzb0czr3g75cpFxdqwe1UMUuaBjQT0I0kWm9giyMRPRB612WBTI?=
 =?us-ascii?Q?VvxfpOHtKIFQvDxv5bsKwMs4JNKoonPPjskoeHI+MBn+5U5GvrH/DVlXJzUo?=
 =?us-ascii?Q?V2lym0ZsAP8TVpi8MAnEjDhDG3FMEXcO9dHuenXbEVcAtav8BSITiJ+HjILG?=
 =?us-ascii?Q?tNAOCHXKhG7T414ri5hs3mvWVTEHA0VJWbd8BobtExdSaTYJe3sQiYFgQcO5?=
 =?us-ascii?Q?azshl8IRgl+pyD1Vwn1MkHH7CeOG+vbGOxjfCVtHeejWo4YzSGMqRZolGAoK?=
 =?us-ascii?Q?alybh4qF7nVGGAf3B6HQ8RYj3+MKhYE5EIS4/hdc0noFoniOS9SQMvhlj8rM?=
 =?us-ascii?Q?NYfu3k/B0CnHDgP7ISqVIVxgmFPTKDsCl0OAz/Gb4lq+bx5iErmdrwNSKoUH?=
 =?us-ascii?Q?tokMe1p1+uLIL+yscJcLAX6wKdr4pUOxU6Cpqx4IvjatdA5Pq5xj+hX/se2t?=
 =?us-ascii?Q?pIva7YO2/50jgIuHyod/3MONgJ4Agu15Ix0NVAEt8ORUXcs+PhkUsxJu3PGk?=
 =?us-ascii?Q?eld5Vi8weISqfuMlVLsNWM+zsgXyRTChXaRL0M7znPyiFdhxhqiZzEyY5jza?=
 =?us-ascii?Q?/5/ndmT7/2mkhzgQQC82r0FQJBLlS3tsCX18sS0rSLRWhjYks/hlJcoSDIu1?=
 =?us-ascii?Q?NgoKST++l/Hue56cAkZXCNq/V5j4MpL8WNT92XUsDrvJ/m8HDiSMbS0R0/2x?=
 =?us-ascii?Q?IplA2wiIcG+KqPseED5kgw+stjWX3p9TvPmjmzvEaaJB5mXpjGKxyCt/xARy?=
 =?us-ascii?Q?ZJJ52I+L6n2u8bc+2VsphvxRRbn9SYJZOWq4f9RamowTOk7jP+kK7W9IwlwA?=
 =?us-ascii?Q?CWKVQ82pnZya68hZCYvTxC+MfT96XEjkw7lDZ+opG8Dr41LXG79JE+5zV/5f?=
 =?us-ascii?Q?kSo/AdObhmtWoQR215xsu+SJfd/SyU6xziqq2zQ3wLPLSD4p0gAEZ0QDftdJ?=
 =?us-ascii?Q?GfNhZqkaWt1OvEqoJiMIZkmLh97MNzEhi+qjum1PfXTfbAzg/P/VkcsbsLKs?=
 =?us-ascii?Q?P59VzkOCqVtS7XjN/BJ0C94b48dc0VE+hItYzRIrxY5siA8m4IDd24yqm/T2?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?hp2ncxf41aezRH7frqetn6NXxXDLEI3CEtkc3KXIUltIfOht0imL8mdOxR5N?=
 =?us-ascii?Q?Funio5k8wl9rHCXZtm85LV8sjMn2fnrpRy1xqDOTBA/k3f/em7jJ+x+ZvL2X?=
 =?us-ascii?Q?Nc8JL9TurxbXK50M7fS+nnpef9tj1wps6v7w5GsIgxtO96ped6TObiW0135e?=
 =?us-ascii?Q?dzJyN0t6teH/poooX6nepE8mIHbtC20NgvokCfikL8r1HXaqa7j/EwRUIP1Q?=
 =?us-ascii?Q?WRqksdMUm5eTCQ5UfVq9QvP7geKPpnQGE+h0+np4IKmIJl+lfyqQRskHJvTr?=
 =?us-ascii?Q?0MWIS4L95tUMUHXR0jLXlK7YUugP9WlzCTzVo+8Mkd6JqhoLHqbsvtMe+ZZG?=
 =?us-ascii?Q?X50tFuJzUdOU+f2hHxX70MrG5gy9brm9rHUkdDM1dRH3WCWF1ix7OgKzXmA9?=
 =?us-ascii?Q?enhSabTDeF4jLkMpH8DzqCcz22MUGxqvu6XtYR4hw/E1Ii8JnT8lkU6SIVWa?=
 =?us-ascii?Q?5xSGWezMIevIYk7sEBvHaAdSRlsMbL6Hvg0Imo9ym2mkBdEnyjCEXQBAtuxm?=
 =?us-ascii?Q?2ripi7oip9aB19SQnibrFR28Lhj0RwdU7A2ZdXJe84RM3p0qUcCAemgoSSIR?=
 =?us-ascii?Q?jyFyqAxDdHPEWg1GODgGipNNXvTxCH1ioDJk9/CXZ5qeIgf7WaQo2pJswp+9?=
 =?us-ascii?Q?DhrzYsmaelchRWIic5ClY6rGJUUCdzRrw0nLRL9Bbak8R4xfXbxIdDKYw+xA?=
 =?us-ascii?Q?BB8Nfaq5l0O55o3MRU5paQ69TE1eSeSX5qe6hPstv1ydBNSCWJwJSAcTcOWa?=
 =?us-ascii?Q?HheZ8GOqTcB1wf6tBb0QJ0xxsZK/Q7Sy14GIe8WysdP1yH4k4woXZjBc/AvO?=
 =?us-ascii?Q?ogTgmiNmBrlddLOdqhipQ6vK+uVHUYY9CbFU0dYsgpEUKs/ygm1IUxajh4HG?=
 =?us-ascii?Q?3OMkxck0Cd6veweoA5p9yGQx0SVoz+J/ySSY1H8NMO8X3Rrw8wRmjvNKuYn/?=
 =?us-ascii?Q?M24HcKEOx450AmyTqh8yQc6kq/wOU7e5U+O02Psbv34oGtsiE0q8HwjD2QBf?=
 =?us-ascii?Q?AJeqnqTVuLOdaApn9mhagGLsilnXbH8ajZJ85nbSwUmBgYk1vKNfv7JBAw7S?=
 =?us-ascii?Q?py5Qy9H7h/DDzYpMpfgi9flSjpJzSECjXwF/8bF+C1q7vhWMmzSyOsaW+T90?=
 =?us-ascii?Q?gyAXPeMp7IRNAEH2k7yVBq9BI3ZpC8rV7DS/Txrt3xlRVvT183Gvgma0Rcje?=
 =?us-ascii?Q?cpDL63sImNFwsKdgEj/YZ2UGAQWs49I2wNsbKwbR8m2ZIyxIodwXPpXQCtzS?=
 =?us-ascii?Q?ttg4WV/zP2O60thuIfdAJdQbc2rYoR4hnraz8NV/Vo0/zZt7iXWq2ShrW+Lp?=
 =?us-ascii?Q?jo5r+jZRNIC88SuHBlYuEY95iycxMj85LXnf/CsIyNx1RliXeJDo5LJtWlGF?=
 =?us-ascii?Q?ZJ43gPaAAUpSMVmY2mmBatpnj05ckqDM5SVCZEEihQWeDOGiNgIrIauonA7L?=
 =?us-ascii?Q?esCE7/cUDSryYWPGFZjWO8SNSWtILrDe4721KbsmyAZfY4R87Sf1MjrIA/hL?=
 =?us-ascii?Q?lDd1xBAp20OVsOyYGY68XO3aXy1NODUvfpBlJSoT/K8a2nRyJBLNT8XX5Vhf?=
 =?us-ascii?Q?ACRr5fkbPjM+CHhTDJpLEkUse9F3rMBiXrWO8x3TSQ+T7yiNsr2YrWkOm8Yh?=
 =?us-ascii?Q?v25QJ95f8WNuoZanrb8lEFbRqcA/Hm+8eQAiR/s6XGHcfY43slsAKBpZ44LL?=
 =?us-ascii?Q?escWilGi02254PYO9quKw6GUix7cwZCbdd2KVIusxAB/1TFqaM7eUDMgmL1g?=
 =?us-ascii?Q?ho3+wUtJOcLGKeyN1RAGjHKubWQYxeGJQYF732b4AMFSHkgKDk+2lHg8HktY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	j+DDkDaw/qPSvqPaSWdreUSF61TZrVcIZMZCC1156RIKa8LVBafAflRB5pbWw85HLTlXaaMGBGftVFmlXSIJePtQ5kX0wvC10pspJ9MQX/3Sv5O53ABvf3RDtER1OSFOeQ4RxFQt/QZVRrn0GRfHU8Zt3TDCfZbGANE6+KyfMxlGYzsnao2BEeote5yKseC3jeL0/YKRPICtSqwQAbWXwv8kV+rvrPlshn2X45Zn64MadUUB+V9NFk26dnF1WX/ULWFMxhmfZT3R3dmF3nqZAFc0ecXSVCKZPIl4I2tS8wJm1NUZmgS9wctMXRaVpPHyDeUrb3qe4W9vOf47nhA7Tx7qOYc8yY50jiAN2VN0CMSjBHpSZ6b3RgOwdgGV5OxHxsN4zhXb2imzGqOxCMinYx6/qYRgN4sW2xRniswM0AIYKdqqaFjZx+WZWJhzNMY8s4M0shhsFHrzcQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad0bc5d-4ba1-4314-d527-08db7d62f581
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:20:18.4836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pntOERwqDcSu1hqOo8HOFgXiJmpDQTu/Goi/jJB3KH0Sf4hlYHDZqzLiODvnGzTO/UVoY3pAg9WPUDza9HSj9kRIy1PiO6iJUC0COe729g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4732
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307050129
X-Proofpoint-GUID: 5Nt3lfn-uG2RBv5uswqSP6o0FDTMMJL4
X-Proofpoint-ORIG-GUID: 5Nt3lfn-uG2RBv5uswqSP6o0FDTMMJL4
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

The config options for kexec and crash features are consolidated
into new file kernel/Kconfig.kexec. Under the "General Setup" submenu
is a new submenu "Kexec and crash handling". All the kexec and
crash options that were once in the arch-dependent submenu "Processor
type and features" are now consolidated in the new submenu.

The following options are impacted:

 - KEXEC
 - KEXEC_FILE
 - KEXEC_SIG
 - KEXEC_SIG_FORCE
 - KEXEC_BZIMAGE_VERIFY_SIG
 - KEXEC_JUMP
 - CRASH_DUMP

The three main options are KEXEC, KEXEC_FILE and CRASH_DUMP.

Architectures specify support of certain KEXEC and CRASH features with
similarly named new ARCH_SUPPORTS_<option> config options.

Architectures can utilize the new ARCH_SELECTS_<option> config
options to specify additional components when <option> is enabled.

To summarize, the ARCH_SUPPORTS_<option> permits the <option> to be
enabled, and the ARCH_SELECTS_<option> handles side effects (ie.
select statements).

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/Kconfig         |  13 -----
 init/Kconfig         |   2 +
 kernel/Kconfig.kexec | 110 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+), 13 deletions(-)
 create mode 100644 kernel/Kconfig.kexec

diff --git a/arch/Kconfig b/arch/Kconfig
index aff2746c8af2..b2872e9d3760 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -11,19 +11,6 @@ source "arch/$(SRCARCH)/Kconfig"
 
 menu "General architecture-dependent options"
 
-config CRASH_CORE
-	bool
-
-config KEXEC_CORE
-	select CRASH_CORE
-	bool
-
-config KEXEC_ELF
-	bool
-
-config HAVE_IMA_KEXEC
-	bool
-
 config ARCH_HAS_SUBPAGE_FAULTS
 	bool
 	help
diff --git a/init/Kconfig b/init/Kconfig
index f7f65af4ee12..639e8a3363c3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1927,6 +1927,8 @@ config BINDGEN_VERSION_TEXT
 config TRACEPOINTS
 	bool
 
+source "kernel/Kconfig.kexec"
+
 endmenu		# General setup
 
 source "arch/Kconfig"
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
new file mode 100644
index 000000000000..d82a7ce59c05
--- /dev/null
+++ b/kernel/Kconfig.kexec
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menu "Kexec and crash features"
+
+config CRASH_CORE
+	bool
+
+config KEXEC_CORE
+	select CRASH_CORE
+	bool
+
+config KEXEC_ELF
+	bool
+
+config HAVE_IMA_KEXEC
+	bool
+
+config KEXEC
+	bool "Enable kexec system call"
+	default ARCH_DEFAULT_KEXEC
+	depends on ARCH_SUPPORTS_KEXEC
+	select KEXEC_CORE
+	help
+	  kexec is a system call that implements the ability to shutdown your
+	  current kernel, and to start another kernel. It is like a reboot
+	  but it is independent of the system firmware. And like a reboot
+	  you can start any kernel with it, not just Linux.
+
+	  The name comes from the similarity to the exec system call.
+
+	  It is an ongoing process to be certain the hardware in a machine
+	  is properly shutdown, so do not be surprised if this code does not
+	  initially work for you. As of this writing the exact hardware
+	  interface is strongly in flux, so no good recommendation can be
+	  made.
+
+config KEXEC_FILE
+	bool "Enable kexec file based system call"
+	depends on ARCH_SUPPORTS_KEXEC_FILE
+	select KEXEC_CORE
+	help
+	  This is new version of kexec system call. This system call is
+	  file based and takes file descriptors as system call argument
+	  for kernel and initramfs as opposed to list of segments as
+	  accepted by kexec system call.
+
+config KEXEC_SIG
+	bool "Verify kernel signature during kexec_file_load() syscall"
+	depends on KEXEC_FILE
+	help
+	  This option makes the kexec_file_load() syscall check for a valid
+	  signature of the kernel image. The image can still be loaded without
+	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
+	  there's a signature that we can check, then it must be valid.
+
+	  In addition to this option, you need to enable signature
+	  verification for the corresponding kernel image type being
+	  loaded in order for this to work.
+
+config KEXEC_SIG_FORCE
+	bool "Require a valid signature in kexec_file_load() syscall"
+	depends on KEXEC_SIG
+	help
+	  This option makes kernel signature verification mandatory for
+	  the kexec_file_load() syscall.
+
+config KEXEC_IMAGE_VERIFY_SIG
+	bool "Enable Image signature verification support (ARM)"
+	default ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
+	depends on KEXEC_SIG
+	depends on EFI && SIGNED_PE_FILE_VERIFICATION
+	help
+	  Enable Image signature verification support.
+
+config KEXEC_BZIMAGE_VERIFY_SIG
+	bool "Enable bzImage signature verification support"
+	depends on KEXEC_SIG
+	depends on SIGNED_PE_FILE_VERIFICATION
+	select SYSTEM_TRUSTED_KEYRING
+	help
+	  Enable bzImage signature verification support.
+
+config KEXEC_JUMP
+	bool "kexec jump"
+	depends on KEXEC && HIBERNATION
+	depends on ARCH_SUPPORTS_KEXEC_JUMP
+	help
+	  Jump between original kernel and kexeced kernel and invoke
+	  code in physical address mode via KEXEC
+
+config CRASH_DUMP
+	bool "kernel crash dumps"
+	depends on ARCH_SUPPORTS_CRASH_DUMP
+	select CRASH_CORE
+	select KEXEC
+	help
+	  Generate crash dump after being started by kexec.
+	  This should be normally only set in special crash dump kernels
+	  which are loaded in the main kernel with kexec-tools into
+	  a specially reserved region and then later executed after
+	  a crash by kdump/kexec. The crash dump kernel must be compiled
+	  to a memory address not used by the main kernel or BIOS using
+	  PHYSICAL_START, or it must be built as a relocatable image
+	  (CONFIG_RELOCATABLE=y).
+	  For more details see Documentation/admin-guide/kdump/kdump.rst
+
+	  For s390, this option also enables zfcpdump.
+	  See also <file:Documentation/s390/zfcpdump.rst>
+
+endmenu
-- 
2.31.1

