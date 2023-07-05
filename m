Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7EF7490D1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:09:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=iUuSKbCn;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=r1VjKNgk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDMj3RHvz3c4r
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:09:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=iUuSKbCn;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=r1VjKNgk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx1zT5tM0z30fm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:20:53 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365EDkHO027778;
	Wed, 5 Jul 2023 14:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=/bG9LRz5xZPxVT+ts8yoyGN4FP/5afbOMvV2iqrx55s=;
 b=iUuSKbCnEqDZldJmuFnd9zX3sKMIKDkjFlePUEV5DJAwVLswUB8Rvc+MgnM5RBxjRjsG
 NU9vua98/YITvS813FtchOVdyI+IC/k3IVXjyysGOSG5ajRyXpAVoLCghJdFxjX9vmbW
 rH+QVpRkXTrfcYWsySM6VqtGGu8KxMio2DEawTvM8nFAkagYDysOpC3+A2H0QFSnMub/
 hzx4Xhf7u2KyrIiVR2z/K/HKg9CWAwrunUOl2EvmGDy/eSiykdMd6ry0guDIwvXAPzhv
 mkLPfTTWYMZWKQR71stzoXe5ZigT44k4+YdWxclM2CxuCaRGKMEQtGMxGZWxN/6qJIhd Cg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rjbrtehsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:40 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365DMsGB033370;
	Wed, 5 Jul 2023 14:20:39 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak5wker-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzBW0PJ0zriGU0K9djeuq1VZcZfhcMu8eY/WtlCXITSx4k3aaKXB24fdjnN9BHsWV4jxlyzpFasUpMxgh5KB58M3uQKDsAo0QwV8Cwno7+k0+zunfdnb8DxQ1Zd4TcJbc7vMUkbsrlxN+lLc1A2f1QX/pkFYyQrMW8QnGt9tppNqMoVK1SFUaU6iQzURpFRcg/721eTDB4VOq6SrKTVEHoILUrurfK98O1Gws3nENB74d+rqUVmcLLlarE1Ze8PwlHZLyyYn1unQvnsPf+r7tiY+Ob5YKXFKqyWsiweZL7BU77a6BadqynstBTI/w0p5Wp6JmWcnErcD5kXUs7feMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bG9LRz5xZPxVT+ts8yoyGN4FP/5afbOMvV2iqrx55s=;
 b=kEEda+dqSWxfA9CVxpA22wBGONEcuYy1QvIsGPfyVaZ0poO3jCoaokuxOo/H5+w4U5YdRiceTys10o61fYEYbyHZ0xs8ZHGaLX605S30gvNU8+qsOnRUhc6l2i+wV1Gilu4C4AaW/nNunRouAKWYGBj0z3T3R1FFrBpKmTMuwTu59oR52mTR9n84f2W+aWJpExJtdbyrKIbSbXtEa+4sAcy1iuCpLwE5lUs7gjBvvXfobArLw3rAqi6vbK5Bw1a/IbyAKjsxhlSnDWJSu9PNDMTpFvw0DNPs2HcMAsJIOuHwOSUm6dwGvdRD5JEWhpM8lBK9qlimjUsuPEuHILSlbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bG9LRz5xZPxVT+ts8yoyGN4FP/5afbOMvV2iqrx55s=;
 b=r1VjKNgkrtV45rMY2HWGbgYTlxpuUaa1NjOUGFOw+FNrQDIvQ+2AQu1z4DIe8E4KJLTnPwIJ4BjCWe8jXAGI+tVT1235Cn+p+yaTC6ZR4kLwaamvEkW8g1S5djXeW2FBgjtU3LYQ5HHcnT0TQEN/fH+2qcIiQBWtBOEW3cwQScE=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BL3PR10MB6258.namprd10.prod.outlook.com (2603:10b6:208:38d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:20:33 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:20:33 +0000
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
Subject: [PATCH v4 06/13] loongarch/kexec: refactor for kernel/Kconfig.kexec
Date: Wed,  5 Jul 2023 10:19:57 -0400
Message-Id: <20230705142004.3605799-7-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230705142004.3605799-1-eric.devolder@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|BL3PR10MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: 417212c1-a380-46d9-32b4-08db7d62fe91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bLTSR8buQvQbtxFGRj5eavcwEAW4Lc+gGX+v0skHTaE+4mtcFwo6Za+10/Mls5I+cNjtKPO+pRMFmMHTegEzWhVTL9aXjc3oOhru2gKZSaJxvigzcjELANSICoe4vsiI3pgsN6SgLjgNlO+U4hZYPL8Ikwea9/cWXwLk5fg5FoR9ByA+RwZ07EyHrnWw2Jei0yLP1utHroBOi69DuClrw4TqcRKHG7gBdgxCDv2jF73Kw11mL+T3dhyL77jinbPokU1BmIP705E9f8N0HpMqKqRG5VKy/2ks/OSsXYvNmlOUpOhLWDxC4B/Suw9p+KTdGA5FjJ+PIN23srfxBo+dDm72CBGirBktkbPZocA1Tm5oRYcaQInAOSG7wfnAsp/ExjevFgJE9qytHj9blY33Q/XeDkKunNC2i45U8wU2eCHsXCkUWGCCEIL1vczNdqz8ot6y2oMe15Zghz7n0pKj/DaD4qSy4dUw0C1wml4Q1DQC8ZAfrnUF7Kyr3ndFGpDOK/U8wx+97jwW32AFhL9lDm8lHjXVCDhtwk4Cdwh/040EpNZ13iWzmvuNRypcaiaMk+366GLKlKm+0IwVMkPo9SopLdQ4DTTPOKoq7UkPQ2s=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(2616005)(2906002)(83380400001)(38100700002)(36756003)(86362001)(921005)(107886003)(7366002)(7406005)(5660300002)(1076003)(6506007)(7416002)(41300700001)(6486002)(8676002)(4326008)(8936002)(316002)(6666004)(66556008)(66476007)(6512007)(66946007)(478600001)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?5sI9GHCJIb6Dt56qRrOL6cgmWdsX6auZ28NgD8dS4z63Ozdg0Cggy6qpe5SH?=
 =?us-ascii?Q?5q61v0xW/GZVjjquetPcGOoXtlvECQx+mGNUriKCQjnkclat2jaeq6ohYCCa?=
 =?us-ascii?Q?JjeT/c5UHwB2umwNriA0aR4ghybYxnAP0M/JLZa2IXgfFsfAYIlqWpek4CAk?=
 =?us-ascii?Q?J15IzvsgaKGdIdskBHNryCdsDmbkOVBlCAVq+re/N2ZHrgPupOJ0oRBa51xH?=
 =?us-ascii?Q?saNyfycQiqpscYDv4jH8KHlCunR5fBZ+35s0jpQ/hW7aw6nrEY8KowYFpuUv?=
 =?us-ascii?Q?6c9mwEjNXufcL0LzHTKGYpETmeXNOoiel96F52kRaXpga6B4mxSbCn/dbodI?=
 =?us-ascii?Q?l3a7b8fPqjCAVXy15F8Q3d7tlQ8ryryB67itqqlDakFtUOc5jzfVhyEqF6PD?=
 =?us-ascii?Q?ZHji0EFvkNoMnfqyLKxIzX7SJ1mB/tWce71mMY3t4GqkRSJ7GwKItAi4fiUC?=
 =?us-ascii?Q?TySA5kXDQhqHsLUjrm2aBfHjuwK87cGqy4prvt9rv9dOghdUdzFPfAYLaJg6?=
 =?us-ascii?Q?HSHjPIafkrlWKY9M3+WV35eeY/BY3KagJ4QthUYgz6DMtvom0kVPxbhzaXnB?=
 =?us-ascii?Q?MuvwcDF2Us4OOqsh5NSheaMSCBUuR5+lvBbl+Slaubh3VayUGZqLzFBpPWU4?=
 =?us-ascii?Q?Y3hV0bGOvBq+rAJgrmRf5sQEQdSSfcV82Isk8rDNJZ6sllpP4+c+yoMWwQCV?=
 =?us-ascii?Q?nvvF1lV+9QAppWGc7nlH9iQhngfOeyM+ywO51l0nien3MZ79diK+5Ks0XL3h?=
 =?us-ascii?Q?sD8KT2xjSMX2Ppd06x9UeaRBXA6mqH4g7lVNYAb8l+eFuZqcUAS1rkgM+kOe?=
 =?us-ascii?Q?72vcN9bbhsCoTf6drO8m7jUSLaWRmIIkSSakfM2c5CRXh2RBlYd5cXsSmGwz?=
 =?us-ascii?Q?X6eCOZleT/3JiaLCy9JbRzqtGl7TJeFRh1EJSaNgnHxSdszu48tb5hKDKZtC?=
 =?us-ascii?Q?NWI94DahQMlxsRs/aI+2PO7IPwCrIxbF3BGHRaAxR7J2xF9j8SsLdpJFy9L3?=
 =?us-ascii?Q?duqBjmtVqIQXftpgmVXiBRRsk0S/8Ernir1quMRh/wNcOHexRQTL2NCKH3Lo?=
 =?us-ascii?Q?S8fbCd0GQZ6wd1eJBvflERN3z9m7ruzQnhlGBY7a8WaxjOdHvMT1409GqOyy?=
 =?us-ascii?Q?SYUhPImAiDYLA6n/ZcXZOhhTIVhvIeXrE/Sz89hov/G3JfNqHlxRrYkd+yiv?=
 =?us-ascii?Q?7v4KP2uAnt8xOFzCJstA9CzPp9OKII31bUPs2OxSj9o9S0Ei4W22rPCeYxKr?=
 =?us-ascii?Q?EhH6aQqewjsD/93TSkSIs7cMWJ8hVV8eHpEzxZZjZytHQlran5dc+XoyjbmO?=
 =?us-ascii?Q?V40+fbWkXhuSo9Oz+JHR7XmRfFSRHSLq3xjaqLVnwAzHtROPKNpEuwPDPAFU?=
 =?us-ascii?Q?9nL7rvsQKhVA+S1TWRBFhOWFdnDxXantAwtLGO/mXc9ahWXXPSzrJZWFB97t?=
 =?us-ascii?Q?M5yzkN7MaN58M/W1nel409RBXkmYQW9VwEZZeru+3PVjyRfaG7/3bPnsMo0H?=
 =?us-ascii?Q?KEJn36jjA7aZFu81/meZsuBhdSfv0dgSHdqBCSX8r8tKBaxuOWXcjcWxn5iL?=
 =?us-ascii?Q?50jDPCljhG9yLIWpMFa/wdcN2TgidvLDJ3oSOeEc/lDSmrpMc7kU3NzHZHoU?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?iJawWossMHWb1pqslTnj5AcEc5O27a1I/7hBpPcHtbrU8EWwHT/pqrQPtpL+?=
 =?us-ascii?Q?Uh1mvnVDEvhNwYuDztpB9OuxpgjV/og8IZKXRUaeJx8o4wkN76B7B/y3VpNL?=
 =?us-ascii?Q?Pjjba6M4AXc4ofnV0OEMc2jlHV1xK3k9yCEsHXPk2ZrP9E4voB6ofk0vybUy?=
 =?us-ascii?Q?W1t273NR8fiJDsin6tESbHltGrG+72+qqqq/KtRR0xrDwL25Hzdn6DqKnBE/?=
 =?us-ascii?Q?l/TdUl5kRGs5gT3+8KAM6NvSY3cpRMgOOZ71j5NeQ92gUN4klFkK9/zeFGIg?=
 =?us-ascii?Q?xsu0JaNX8Qa9d1sOO919Z63iLwlCbBtryt63oSnt8BSow73w7WqNh0a9U+cJ?=
 =?us-ascii?Q?js/By4LguopoW3LBoLpNJxX6GTafePbsZ6jBp9GosZf9IRa6Zrqj1oqJBM12?=
 =?us-ascii?Q?RjgBtX65rXmXzxoMHvOc9IN8o3Ld/ttUQG3hCNN5fxxjByOO2Uvh7bKJyIgn?=
 =?us-ascii?Q?AZPMy0yqtGHxCrl8xxxPkAFoDhMreMENwMRmOgkYFd9L4PmfnsEm5YZScORy?=
 =?us-ascii?Q?O60LFUsEJdPw9fqLrXkzaNx/fodrUEJmJTG+GHzflXbCkEA8jkhUzKNAe5CD?=
 =?us-ascii?Q?rH606oGvsqwb/iXUSXMsDmPuvpYxq/oSm0BaW+pY6DIqZTXnF8mGgdf+ioM+?=
 =?us-ascii?Q?sr6lBodJrxAeTXTASxsmWu3TYyCoAli+RTuejaPzRZzOHBgnhdpMX16AgsGR?=
 =?us-ascii?Q?hTrphCMgYIOEMM+1qkoxyWGeOs38FzRXYRiuRO17pKY1ff1NZglQTYOwQkEl?=
 =?us-ascii?Q?QaC0988WO9g97JrdntmJAyqjjJ9EtKXOgpmFEoD2CLdjO2HNb+siX8Of4lup?=
 =?us-ascii?Q?oNtuW7jET77ArrZLMoI2XxFwn3S5+lJpBH+CLPAKQoyBHCPDRy7E+cIzI/ha?=
 =?us-ascii?Q?Kprrti+IjKrPPxgsfY6Blu/vSOjsrKMEuTkIlYsS1xL6L7YoM+TBKr2eZKQ9?=
 =?us-ascii?Q?CHHIqnApPcD3VKl0fSxqUcuct2bXul7ImuzFkrjcdYJk9Ozq2KlSHu8WRrjF?=
 =?us-ascii?Q?MnNQejRxT1CGcXvImZlNcAjrvJW4lfVEfng0ffacdTENHz4KEEHnwBuJUIaV?=
 =?us-ascii?Q?BlZy6jSVffiaOq0MmEc3jzA+thxOtJogDNZNVH8AWtHx+uln1++1sjJ9r+ek?=
 =?us-ascii?Q?+I4HjYpQxetORdGXMbewD9Hbz0scEhDSVVrfxsEOekdp2/6MeClENyAAVebf?=
 =?us-ascii?Q?fqSWBRc/h+a1avjh0Y66es4oUftmVX+paVfNg9WxjHADOc9eOIKZ+VWVFXtN?=
 =?us-ascii?Q?lr0BpErbPYvncPfzF4T1DfUPbAkPInVFdx1mu4JgWOlykmdbhTpVLr9XOSKe?=
 =?us-ascii?Q?+kwKBk/LKrSxROnW3hdkTuCRlD99nYPwKgTxnAuPfcPefROzP5sHPXFmJjZ1?=
 =?us-ascii?Q?j8+b4mw6nvljCkE8wLnVPVTBNbLmIv3OYfJ07OY1/fe1XQVWr5mYla862OQC?=
 =?us-ascii?Q?WztiNa1oVrTP+TT9wbJCvxgForFYjfZWpFFLm0JLPafZpM9bGVOkTXJrqCp/?=
 =?us-ascii?Q?Y5c74pg7rqfsEIkUvbhmH7ILGVEqR0j5jvZdMiqiIN0tR7jRZOKxwSi7/LHy?=
 =?us-ascii?Q?dKOFeC/f7QZOvvD5fDDPHJps5E0TXz430Uf+a9uMLZogJSbi5pLm+Gwe6O9K?=
 =?us-ascii?Q?BHZ8QFSAibnPr/NgZ/O/OxfYTW8XT3NJIOUVeV9rRuY8LOjKPhEduIpIUHOI?=
 =?us-ascii?Q?PgwHBHIBK9GsiFZ8UAExoRhmZXAJaomTcZrItp+yBP2sK0pgPjSoBNQ5j3vK?=
 =?us-ascii?Q?tfWip5SWOit3awD1HmEJ27K3+DkCn3NEaBMTtOkhMlxaXBqyPqTED6DFsNjB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	86edt0uI1GfpNWNKKBQIf15/OpyuqStyYzUiGtTk/E/uePQhEHckcNB/LLiVpPrXUm96I/10+8OP/IW1zJ0VKc2P1Ly4mWuvDXt6elm6tB5+7c5EeWwPCX4TjlRdg4AUY/NxDpduPov8wiEixBP6xy6k/rflWohEE4cbBF077LlsSef6t3xLfvkTS3T71PfyqNJvpJ+lWb1XIDOIVYbGtS7troV4kcA2/j2mHPnkZVW1iC/FS7zX8iftvH5W60umNj07gPLfZdJFF1ylOjHh4IfY/VZcfUh2xH/kYGs0u7aLdXYkcoaJTOhVFD9dsSwd4mfLHddHH50tePHYuUJrs0jBdqXbpMDd+ki0+kgSKyGNjhHkf2LNVC5ojAxeWXuwrMicEuDqbgrwMd6qHTMR4w6M/W7FBbUECRjmew4VtaDmCyYs1M/qvOShBOTppDd9TlG0StZkRb4PpQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 417212c1-a380-46d9-32b4-08db7d62fe91
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:20:33.6495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpNUxhppnihpr7dxj2fcD/5I8P3hkmofB3AsWaY8CUHx2+ZqztJZX8KUaFydPFpvYvJ3U9kzP8TOCfveTzKyZDvWWD5aB+Cgm6Ko5GKUwk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6258
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307050129
X-Proofpoint-GUID: tUwX7-408poYigQJN3nrruNbhEVCbu2d
X-Proofpoint-ORIG-GUID: tUwX7-408poYigQJN3nrruNbhEVCbu2d
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
 arch/loongarch/Kconfig | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index e55511af4c77..397203e18800 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -537,28 +537,16 @@ config CPU_HAS_PREFETCH
 	bool
 	default y
 
-config KEXEC
-	bool "Kexec system call"
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
 
-	  The name comes from the similarity to the exec system call.
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel"
+config ARCH_SELECTS_CRASH_DUMP
+	def_bool y
+	depends on CRASH_DUMP
 	select RELOCATABLE
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec.
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
 config RELOCATABLE
 	bool "Relocatable kernel"
-- 
2.31.1

