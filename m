Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F8B7490DE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:14:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=lLLr02cj;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=U7Bfjao6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDTf5KjMz3c2J
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:14:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=lLLr02cj;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=U7Bfjao6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx20J3K3hz30GX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:21:35 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365EDlor027894;
	Wed, 5 Jul 2023 14:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=b+PKwj0HONu7bLQpXmtLDG4GCIkHBRq4GGrkhD06IPk=;
 b=lLLr02cj5c8feELZdrJYwQK7c370tKHnYUPlQb3fw5DyVriQVL5D2Vv6EgX7DSu4MrlC
 IavA6/E9CUGmJkS/UpEWd52sL6I+EnLB89b2thromRwa9OKgSDf9m5td6UnHRO8PGy9S
 acztoOFQMjnWVfaN+wdWfXGf+VotAgNArxEV4Gcir5GLPI3gw/7CX0eHjhwmdxzcdM6/
 lxjCu37SwLtoOEAU4ewfhOGt3b64kq6WW8HuTyK/G/wxxR9fQgdvLbiid8MhCtB63kDi
 TQb0+CuaF8qbZbJWQljXNvq+ikv+4RkgdGRyd3/fo7Nsoc492tXF9F4G+582CWkzlj2S gg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rjbrtehtt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:21:06 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365DMsPB007181;
	Wed, 5 Jul 2023 14:21:06 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjakbnwpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:21:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXllrLj2p3TUJLfXuFfsYtPcIW6EXJ8IDJN4Gx+lh81ioII+b3qeXGVMtarJ+MK/LEwSuJwp3hGM9QMFONyWbQ/SHibYzssZtEZ7+AoHmOL61IgJ37QZM46oUY2+4CQ8JEBRka2H2BtUCG5FDqljbVgTcSYAD46OgvVp+7u+oT00t6Aq7M0lEYRGWImfLnxumjupJoxNbczKgTzCg6Z7f/g7y+AxyqCiL82lqCyJGtRLpbvOCj1M1Q4hUMnyA7GcTY8BXai/W1vjGfrufGx6stpn6Y34aP7Rq4MVWvuFCe9hrp+Yc46bN7lWrGFLlfVPG9YdaIQkaMEleDlhm+Iuaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+PKwj0HONu7bLQpXmtLDG4GCIkHBRq4GGrkhD06IPk=;
 b=CT3n7Oj6ToKkKOwie3pqv7WaVXzqn5hmF3JEWJrIeE9t50SvrVOK4CdVnS4TFJr9JHKd0ZqXlI6iLmRy8SROeXeiwILG3y8jOpqHs5GDjRszqB33pxWDdyXHgsXMkIt9hBhoPMg5vxSzxiEEWOF8OWYx1pDjHokP+l7dS5BVCveonCgD7aYdjrUWHZUzxlfSLzzXQvFEqTua2Cx6/UBqIn/8CnBj8J69MJxoUoJvxsNsCNZUF+u4rcjOt1zNMZr8+R9qkQkhPMUNqnt0M0AJmBFZvvGTaGnGxj3qgv+aV9KHvd9OisvK2qvdgcD+ZzvgNcqDMHQbH+av5HSMPA7TMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+PKwj0HONu7bLQpXmtLDG4GCIkHBRq4GGrkhD06IPk=;
 b=U7Bfjao6js41pzjvV/fdDtfo/4wPmOQYD6C+hwpMGDKdyn5ECEIgIRk+kOv/TDmq9XWtWFYSUZoh75PMDfWzPB+w/aRSQGxCG/FUmJs4o3/xD+SMEayHq/82BFgwOfhCRr3emSHk9qrFT9d7W37p2RnUGvSws6zYlylObDVcRKs=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA2PR10MB4732.namprd10.prod.outlook.com (2603:10b6:806:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:20:59 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:20:59 +0000
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
Subject: [PATCH v4 11/13] riscv/kexec: refactor for kernel/Kconfig.kexec
Date: Wed,  5 Jul 2023 10:20:02 -0400
Message-Id: <20230705142004.3605799-12-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230705142004.3605799-1-eric.devolder@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0103.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::6) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA2PR10MB4732:EE_
X-MS-Office365-Filtering-Correlation-Id: 8967f4de-09d0-4565-3cc3-08db7d630da9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	KXq9dO6KNF52tCeyv9H+900sxUL4WERVTSV5eUv9xb2e7kHv58w6VRHnqUeR6s8U5GA18niSQSIrmEYdf2qTex7lKGn98nMf0iwT9nepl9M7SeFm8/q6R6lGIYMMs9Y2PnM8Bg7skjmp9uFtzx5QCuPvecqvyoO0sNJtAq8hCXMFMe9O6px6V2VM3OQ+x4TbV5+koGMligSp76QCEtgUTCcETbjHXunYYL/kVx+FGHtfhdD8f9I/O/yWDKINnhKridb2t22Qa4MiRbsnjgfS5d48Yv0MJDExVmrfHtabn3TKz9ebOZH/7lJ6G5hOm5aHicROgKcQDGhmmkvQe/OMBht3WqBSILzT73NmHD7yUeMN88VmGl0X7knm5ciR/u8O0xpLWSA3FVmsLA0VIHlbozie4HNUE3f/HYhHvXuKo3f3HcS2wTJcq/DeBy4dnAmuwSfySWhSW3U55ccTy5aAgcdV/77w4sOBVydOA6Ee5iQosm4u+/mDMMPiYb1s1QNnVOSZ1lkD6ARfl+uxKABbzDDfgdqXMICYjpvEQgzVa6kHG0bE6rITLLVwVrvybGFmGhnUasGSjXzsJymrUFgc2V3ISfEypk9Kj2W/IE3XYtE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199021)(8936002)(8676002)(2906002)(2616005)(5660300002)(6506007)(7416002)(7406005)(26005)(1076003)(7366002)(186003)(66946007)(41300700001)(107886003)(921005)(6666004)(6486002)(4326008)(66556008)(66476007)(36756003)(316002)(83380400001)(478600001)(6512007)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?rafcaWuR/KmNsKarO4X1px/cLNPUYaSn6dJ7Z6fRvwHTs14dNrCAXgKkycQD?=
 =?us-ascii?Q?DUBDmxcFZbbf7Hacavf0wOLngQjfrbmiN5ISDLnRjQ9rvMIzakeFPW0q/1sV?=
 =?us-ascii?Q?YoMu173fS4VjKytVc5bdTD2saOaMGY2vInoE5Ut0N2R3B9qDfjYj3Aug3Nmx?=
 =?us-ascii?Q?+Ai45Gw1W97PtSkHBNHgEdn8p2ij0CUzlh7a2f+g1cl0jT5ZnOeFOLQUx2H7?=
 =?us-ascii?Q?mplXvcfJUkdoWbMarNQ+Cu/xTS0t1N6sL/UaGT/1RXf4L71662x8bPeYmyIy?=
 =?us-ascii?Q?L0oMI2B/CyIpAoMPC4WLb+jt1B7ax/zGCM3lmMkAEky5xwZDDfsDmnWueQ0H?=
 =?us-ascii?Q?148BC8AV2+useU029H39NqioYJP9Y1yfvoYQAS9ozofeAxaYtXy/Nm9c1ZUN?=
 =?us-ascii?Q?Ofym57hZbxkuzUAwnETuPzkTKXQF91pMsAv1sKzl4uawAR84olFsCb0norDB?=
 =?us-ascii?Q?VAyeBYfdzPNHDgPz516RkFr7rerYvY07vVfG1ybdTVFqgbQ4aTtU+VMQi1yr?=
 =?us-ascii?Q?ovtmbbDd8TaEx64rmlwdqD8HjckznocXzIp2K8mYwyTo2NdHxLE2hXioKHQn?=
 =?us-ascii?Q?kZfwBPSH/+WgzP0+JH8i9H/Y3S66XgdM0ZUK1R+qJ2OY3aZSl/oH03Sfz/ZP?=
 =?us-ascii?Q?pM51iGuEQyvX/4vQg1gxgy4c0p9KCcZ07VncXGrv5u+JZ35NT7Ju0h3bhwTm?=
 =?us-ascii?Q?N0FLjr97ZfBvu9inghHjDVO5fGSPzPYnVhAV4ar+qfVdeHJiPK+aq8PEzFCm?=
 =?us-ascii?Q?xD0Md1p0qtNMtBPgLgVy9kcXO9BNs8kfx0VTZ+7M04jQqYdVl+rDjnVyEUiR?=
 =?us-ascii?Q?IYC2I35M8bJ9HGrjzfGJFJG6DVCsKGFG3swsjJNm9LtNBphucIgF6S5Xg7jO?=
 =?us-ascii?Q?z2GMioH54e0puiL38U6UsDFHaxeiA5UAJD7ACKgqWBv67wSir8HL00+bKJFr?=
 =?us-ascii?Q?6GKWsvAecWhgWlYc3d7N4VpM+J1sCAoioUSv//0IrPJk6wWinBDLhFK59cYs?=
 =?us-ascii?Q?hgIkg2yPfdeKG4+hKqXiXYAVcRpIHR53q6KLVCaIsIa8rZtjIhWJB9ExmfXH?=
 =?us-ascii?Q?2+tBAvGw71fYrafXqwc2ODMOLdikU2muH2OjZEphX886aMamydm2bbYeKpiu?=
 =?us-ascii?Q?4s9+4pHfrXWjexaefVRgq1Z5UV90EFtWXO93l1xPwytMOHHsfn5V/RSziU3U?=
 =?us-ascii?Q?wRouWz2yKstnTuXNwUZskMwi6cGkNdet5kv5eiuw9tLTWOLMb9fLOCsc3SJk?=
 =?us-ascii?Q?ASRx8ARK4EinjAuiQUTsw8kxODbZw4wQkrtaG6rZNdxvEVeWn7Im6fOBmiXj?=
 =?us-ascii?Q?aM1fO2R7xnoGPNCzo/YY1cinvj4KknQ+5qcLFGqgyYUoAKU9nXc7wuCgcG/q?=
 =?us-ascii?Q?XxCyjkh7CQNi6JQxyk7kcUOZ4Puh4yDrj9yoxiLvlvFN2tMHRvWiK7gAJTJo?=
 =?us-ascii?Q?ZSWObXiLZXwIODo28ORhSYe+alvzznm4CNEnBtBJlwCgAEUMulqNtkS+EUyk?=
 =?us-ascii?Q?lDPC6Oud3jSVpEb16dE6CeWYyI0OT75iengq2TZacnF1q+EtRi/2zJWxQQLR?=
 =?us-ascii?Q?kxVaRbuh/vqvI+3Tb83oxuMdbJilGpfwPUwnsXiEx83M3VECX04VNZsLykYM?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?hFM8yQoLMhfvoHiva2bEDBpZ0aezJHveO5bzKtgcr5fNhiBLPOQ8r7IA4N11?=
 =?us-ascii?Q?hkd6EetsL7Xll8PonX18JstDNej88Ncp3S3ennBZM60aR96TTNL1gcu5/4Cv?=
 =?us-ascii?Q?02ki9vIsugZfq/rkQvDVGaSPgaSXT661TjEQG9upvTfkdeW5qMFyvLoEDX6G?=
 =?us-ascii?Q?bs14h09oFw6SDB9+MRNKG1FQZb1zkP2K9mQiWglucs7eEtXhtkGyRHk1iuh8?=
 =?us-ascii?Q?FxmxVUx+/zv8++aRRQUAT1MkDyzAi0diX2tSJpSpPuIDHvqPqg/BdBoqzmm0?=
 =?us-ascii?Q?h+cLCTCZcwxneG+HRXYHlFBbzi3kmJt7AKnsuJRulPxNYWC5l6Vog2EIkBqx?=
 =?us-ascii?Q?oVcW95IW171Q+R0L2t0B/9X4/7VyoNNPUubelqdgBbHFJPfHtC+M63dqXrrT?=
 =?us-ascii?Q?grf0WDnmQ63eQxEmZU3h5RsnFUqnR5mKr4EWU/VqHcCMXriHbn0hE4QOKm+Q?=
 =?us-ascii?Q?3zIDdXHyfDH/ELjJJFYQGZSw3B0h/8g04POQFYhXmIbYqTvKpbmj2323m16D?=
 =?us-ascii?Q?M8nArlBrJ+nkahXVQrsFEfL+Za/eVUt3WKUqKy1hHvTdQaUebMdH7JzTuL8S?=
 =?us-ascii?Q?Sp4ztHt+E1EtlaxNmOfAlv/X+wrDvdyO4RufYltM/5SNiFSYpXDaLt8H4pME?=
 =?us-ascii?Q?AGoF8l0g9/B6jjS6e/R/NzNKEUUqcQZLWziPfmsqFKuhnIoTW949gD8wx56B?=
 =?us-ascii?Q?BU+kO00KiEZ9zO63v9vYK8o41Tnw/WvTcRp410DoLV/8b2cELSxmVMs5bVtx?=
 =?us-ascii?Q?4T9l7L1CoznJQNDlaDrslbAljNFSAHJ79eaQDQuPzwmr+OvJeMAkcpzf6LHl?=
 =?us-ascii?Q?+aNHFw+d3sCb1dgvS3tXJXCwrWmtDwPa10hjdQH3Gni9ZVc5MjFr2mUdBXgT?=
 =?us-ascii?Q?NKC/K8Vn6noNwT/8xzi0v3BWOGDkhTaZ6swo2+MgfMt6990XuY03HygFz8/W?=
 =?us-ascii?Q?pCYIsaSuQZaQdTRfsVtvjISDMkuL9nzgvs2qUEltLUplHMpGhn7hCiEl/33q?=
 =?us-ascii?Q?g9o7iw65dVWD3rUG+21z7sYIjf1Y0pmYRWtI2yN7iXdpFiuMfYa276OmcbAL?=
 =?us-ascii?Q?TKGQ3F4CgxnZcety6Q8FZ1P+yOaOqdweMxVt7m5pSJ4UNUx/DMDtDBO7mgQZ?=
 =?us-ascii?Q?jzuifjbgHj5C8SBhMGuB12wSW97L3voKDydAXrYpk06JIEuQGLjQ2rQ6tLq2?=
 =?us-ascii?Q?SIZgqcmCAGdDmsNmAVZ6kj9E3qcMuAonSU8q1J7dwOP+YcRfv5n8cyrTGH1L?=
 =?us-ascii?Q?qjhLIObCk26NlCGTtOeH/AKrAYb08pkAbjsNzIXKZohY+hCyDqXQomP2BFBd?=
 =?us-ascii?Q?zm0iTnt84JbRRCpDo4myD8kOqM92wH5cznON8GVtC8ZV6Ngt6FHGdbDZqGM4?=
 =?us-ascii?Q?G1UKUGe/o6kWL40nRnkDDAyPVD/VS1sfU85MYc62ur8/DFmLLUpyqCnSd0uQ?=
 =?us-ascii?Q?HHs83oTQetzaNjL7cZ7lGQrc1tZUDF4NlvXjRTup9jJFGMeaVATzNlXDUl+3?=
 =?us-ascii?Q?mL/674/siQ/VbqFDWxe6maV7crTw8sR1AmkSwYpE8rgHSddtEs6qatXRVo2C?=
 =?us-ascii?Q?Acog49yUUS5YgzYfN+k0gJkXObq94gg7zD+/kbHeBcMk0+rZQY9UjNk1jc+o?=
 =?us-ascii?Q?cCPmnw3YVbxlZAO3QWlE764dS2oAqN48MFbXDdrlBybSCnLUPneOws7ippB6?=
 =?us-ascii?Q?FfV1Uyen0aDruaUvF64pEz2fnn3tfWm1LBJcq8tse9w0kExpoytbVIHBwq7m?=
 =?us-ascii?Q?BCbQsL1haqbqNoFPpVvxXkE4GPATyqdkX8qkhqX8W1hgjPHrfR1xfBIq34zE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	c0kizcCiHy/oxmCm30nYUJTkSrAAnFZq4CffnlHVzWYHhD10Xgya389fvPf6L0LxgsziowpkETkFTUUOztN85cZCYZ+cjMO2D/6vn3Ba+ARBLARNklraGfyvuWgX8uSp57rJQkKblktNJ6F7C4nr4mALU5efsA1nRW9jJMNasrtus+qHguI5VpmxJ3Q2Tti4swfDSDnMTrN9wX9E3JAwDP8H6H/7McTr4omOT2P0stE1BNWP2MWGzxq0Kzr7YciEL2tJUTrkizFUuhS6bmLJV8yAxQUL+K1Q6+bGwEID/kXo0L4U8hvcZXUQ2pp+V67lTbROuDHlKNrMUb8D0knf7AHn9lVim3Ys9uBnSt+FOOPqcjghCJN1e/NYeO7mtSEgwZHBX0nz0yIO5ES+cSyaPrr6VUyuttQzPJ+wY3euR+lV6rff+RC2teTnsSDUbY13Ks3jFUNulfaiKQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8967f4de-09d0-4565-3cc3-08db7d630da9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:20:58.9730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uh7dExaLGoAeaB4EdGGlYh0AUpcPhMy1pTZVdSpi01K/YVDsfuo3jiHKZPvOXISc5AMeNpdPvGI+jZe1jP5fiS8rAm458v/W3l1evN5z4+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4732
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307050129
X-Proofpoint-GUID: N9TcgseTwKHoJrT6QnMKAynJnMLWR974
X-Proofpoint-ORIG-GUID: N9TcgseTwKHoJrT6QnMKAynJnMLWR974
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
 arch/riscv/Kconfig | 44 +++++++++++++-------------------------------
 1 file changed, 13 insertions(+), 31 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b49793cf34eb..8a3af850597a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -647,48 +647,30 @@ config RISCV_BOOT_SPINWAIT
 
 	  If unsure what to do here, say N.
 
-config KEXEC
-	bool "Kexec system call"
-	depends on MMU
+config ARCH_SUPPORTS_KEXEC
+	def_bool MMU
+
+config ARCH_SELECTS_KEXEC
+	def_bool y
+	depends on KEXEC
 	select HOTPLUG_CPU if SMP
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel. It is like a reboot
-	  but it is independent of the system firmware. And like a reboot
-	  you can start any kernel with it, not just Linux.
 
-	  The name comes from the similarity to the exec system call.
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool 64BIT && MMU
 
-config KEXEC_FILE
-	bool "kexec file based systmem call"
-	depends on 64BIT && MMU
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
 	select HAVE_IMA_KEXEC if IMA
-	select KEXEC_CORE
 	select KEXEC_ELF
-	help
-	  This is new version of kexec system call. This system call is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
-
-	  If you don't know what to do here, say Y.
 
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 	depends on CRYPTO=y
 	depends on CRYPTO_SHA256=y
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel"
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec.
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
 config COMPAT
 	bool "Kernel support for 32-bit U-mode"
-- 
2.31.1

