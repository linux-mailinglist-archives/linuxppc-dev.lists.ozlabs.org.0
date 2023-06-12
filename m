Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC4E72D008
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 22:00:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=LrodmIhq;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=aiqAfyQB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg2bs6crSz3bYg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:00:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=LrodmIhq;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=aiqAfyQB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg01c2Mwnz2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 04:04:03 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CHNxPm005005;
	Mon, 12 Jun 2023 17:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=gxGDUy5Y7c7Qkb9Ll4VRR30MYJ180zygvKx8Q2i2Myo=;
 b=LrodmIhqafxvM0j/+kI4+34+2f3D74GfwxRkf9m5nHvZvcQ3dH0z6OJUQC1LfC7f93I4
 DMe14gvxE9EvD8/aE8IhbdALJ48wyF3fWfIaGgmBCJs323xDOdtmQS9zEng8sQJgjWPL
 YtGZW2bo/B/RIs5iueEpWgdPlICc41hBsfD9RAt90UEFphgkQDjyj+An9gMOG/E4SBfn
 r3Ufgob/dvTrgjY3un4q9xFYfSm4DjmK6hmJyXZ4K0EuwYg2BlF0TK4tKwA5n3qegcjO
 re/zDJc2+va5dJkgL1qMBpx/z/V44HZtSMjGf64r1d8wve3ijQX607zpsug/TwW58PQi kg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4fy3bfvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:54 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35CGk0Jb008328;
	Mon, 12 Jun 2023 17:28:53 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm9b36f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYaRLDEAifsIrZ7mClCAnUXb9Xw4/4lzYvO3BIHZ8YymmU9CZmi2tldiAVlfSjXy9kb0jG3rDyK0Z0kHZy2jkzFxmHF7Ej2uk8tmZuesMxgmEQNTwhh2aSdXXoarVzgpeUfmqyHKCBgg9FG6ReHG35yiaTCx6fF4r4e1Iun78KhevYK4I0L5XQdG8+yLnnbB+li6TzZd+6MMTD/Ma8bjdWb15pwl9CBF5/B7CMPDN5gS5X3TTXnB7tuKdhycyXSqDsyvhrJ98QRVioRCPcSzoE/k9qjpZue3zSOCPshjATcgkiv7fBqPcqYSYDtRdujU1dJ0xOHAXNarBw1yVCuQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxGDUy5Y7c7Qkb9Ll4VRR30MYJ180zygvKx8Q2i2Myo=;
 b=IfDvu2D1XMroLUk8fFbcfNatuNdgSmDDziq7Hav5EbI5w5uadzMbfFp5dw2qp6Gkdj1t23w4KQcH9RwNk9pXt9ZoHeZcvB5aqxdG/SIP8Y0WezpPMry9glYvwObVrzBLOc4nDl/WNUqp5BqNGXD4UPVWC/Ni/pIA7Ic4/Jr4uUQKWmj1wf6jcyHU2iHW6xDkgLBz7HPm7GaQiaquEfyGN/k5lEZ9AdtPZp4NLexLq1Wjfwps88uC2tI7n9EyjUmSwPGnp7kNIOCKHsVo0zoPWdM97BGfXVRLmde3vr4FM7IvKAykAC+nnHgEry3h/df39zVHONpmuaXSr9sIyj4DCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxGDUy5Y7c7Qkb9Ll4VRR30MYJ180zygvKx8Q2i2Myo=;
 b=aiqAfyQBO+Yc68XG1vTjodpObWFwYFr5S8nW3wwZECNB+0ObleRrdyuEqJ6Htqcl06irUoW8285o00vIaccq9KqXiqhBnsTkkvj9DH8I3UbJT2Clg8y0P14EkQ0jOEP5pTAXsM8L1KobaNuPtF//zdgyxqBUrUkhdBSZ6/m9DEw=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW4PR10MB6509.namprd10.prod.outlook.com (2603:10b6:303:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 17:28:50 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 17:28:50 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, 86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v1 13/21] sh/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 12 Jun 2023 13:28:05 -0400
Message-Id: <20230612172805.681179-14-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230612172805.681179-1-eric.devolder@oracle.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|MW4PR10MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: 979144c2-0b36-4ec8-6041-08db6b6a7c83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	V32H4j2u7c/7kYIP1oGEpW8ylMgLkavrNE+wk9StPhvi7CybmCfGSzV+kRMNDIONcXpiRe9w13L1c/CC56QNp43V5A4MrwbpGdTv+GfWRGTe7SgpQ6D3nUM95Iz4aX2BbTo0lCQBIaK4KtNRvd8YSBCJXSNv/nh6DSfcEB1KRLUBuG/1gTw9i43CCQAPm3lsJJ5UC+Anun6fl63iAqFHHxjPgNB3wrSgpnnp3IKtFCrYx30vw8Sa4LypgE7b0xRiA2CDmgQoZ3lfinVWn+AAuD2UJC6fmRtY/zGCf7UKxTU1Zxr5E1lYWlBZv6qMveo/L8QFru1ANlUR0V9JzCQYQuPhia4QtB0lBwQq2NDZM8Qg1/C6ijGw13ZhdlJl+PZEy6fIwqduQZgQB310kZX3detjHZ/TrtzKAuQUkzBSdSRoUSFDVmwQcJJIdJRzmbpfO0aFSoMoGkgw+TnngrIhACuHx2bXMrdVL1Ba9dfWVcxtrssMMJikpJySinAGv+mOo6uL00NzXuVGIiUShX5lW3dtueHL/ao5fsuh2/9k28Ml5JgZ0llEuW2ceXPhZGOiPxmWsOKY4Nxy4f+vACyjGRS1eBahaqska0JCo1/S+mg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(66556008)(66476007)(66946007)(6666004)(107886003)(316002)(4326008)(478600001)(86362001)(36756003)(6512007)(6506007)(1076003)(26005)(83380400001)(186003)(5660300002)(8936002)(7366002)(7416002)(8676002)(2906002)(6486002)(7406005)(921005)(41300700001)(2616005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?JCQSlKDFxJ2D2QL5wWjX4k2DBONk07YRPLYs+DTk0vfzQcrVgeCNDreO5hFp?=
 =?us-ascii?Q?vK1XIuTKYtPOhhYMNh6XE7TykODBcD0BP4sWfqM1pe7UzCIgVX3pYHP2Yicf?=
 =?us-ascii?Q?wXZ9Orq0nyjIhgZk17CHP8l0eAfeDTR7ACgXOMBhld2nla5ImAI/iwKvdTBL?=
 =?us-ascii?Q?biJ+96GW+Gcf2keIcTXxecOTQALP+VADhEAOxhsUzwrP+HMUGOY2Yu93diIH?=
 =?us-ascii?Q?orNrGvBAucl0g3SqGE9KVbLxnOt5Tf2Mk4c5N7ig8LbvyHvWZVy5Efyo2p5h?=
 =?us-ascii?Q?gEDLHDMvN6lGs5XBICH7nXeBBcTqJNbnxwuYNQw1YUIlOgt5JFP8baOuS0as?=
 =?us-ascii?Q?e177+/2XrWOPS3kOenYt9JgWXNI0Wg4CVqqjwhsQN2sSiejyZ+5MceTEyR6l?=
 =?us-ascii?Q?9BsGWy3EbUxWDHgN+knQlJL3bg6QVrz5DZxhbXiCPXyxijEqPq+nVuM9kUxl?=
 =?us-ascii?Q?3+EmzHct4BQoSIAaZC4A2bvMlXaFcV80YQWOhnbJ5k+vxGYScMwRDSNEWslq?=
 =?us-ascii?Q?+4FYCpTNYk0OgzbJ1Yp98QUZXw8ByCC1LzbxmXgSeysmwpe3Ufp138FD/5OU?=
 =?us-ascii?Q?+6XDvnFo+N5XixAs36Yq2WgAcGdDk54uuO9E0d7E1UbMDCSYD1qSWqazDj3j?=
 =?us-ascii?Q?FgHGeYD/Vsa/fX3kvm5qdYrGflwg8+kYNJ17uq/PkX19b8itjBv0oQQKbyw+?=
 =?us-ascii?Q?02Aqy342+kZNMvlOayVpWHvY43IFBMb9sxNiBHMdApnNvVqnjSWpS7fCZ4S7?=
 =?us-ascii?Q?448mi92oM4H7mbXb8VCyW5yz5gJosRE6zaV/FzSZOPEYargAySEdkYCA0btd?=
 =?us-ascii?Q?o2ORvmtzZqUt0qFY19KAatauB3A/O575/qxepVc7EPSHPVf10ovJFSQt9TL2?=
 =?us-ascii?Q?1BSRGQCYRJ/ZZa1mYjZ7doy3iWXX3Xdn/PQc1VVajmpXs1Hz9pnw7uIT3JTq?=
 =?us-ascii?Q?JCU63LFavRaVcNiF/v3no75uYq71ZsuQGIh0xTkJSV9jG6shE7Z4h6xmDz1H?=
 =?us-ascii?Q?uXi4dN1XF07p96JK3ZL3eJp9tPVWuQoc4wXywLV1j+cLACMFNFVpGONPJwwQ?=
 =?us-ascii?Q?HYdA2IUV+jSrdIbKX2RDBh18/JTMwRsUDAe+bzrNooRw1rWgQvzGzZL4gQ1T?=
 =?us-ascii?Q?mbr7wklbWyt1jkQe9zgvTB4KuBF065sL+jU/iKH/A07l3qOhjp9bV0HMDY7p?=
 =?us-ascii?Q?ItuvPMNa55CmQ7AEQ2JGr2gmnuC+EzaIr2Cvbp6zlDRkiJl8IVR5vSR4LVMm?=
 =?us-ascii?Q?YCxe8Jj+NDgAQH4bXJjWdsJqQ1bGURJ9zVu2rQ09MnrJcs/3k2E+dAz9ZRus?=
 =?us-ascii?Q?Mve5X3grAnf/HGKyEqgoaNqA/6fPCHP/jaYR+8OcFk7DtPiqXbNsqEudkTZn?=
 =?us-ascii?Q?NV2hPwkjDLXGyYy4pTkAT+yWNvCYmG/sx8wEexM/0te+Vkx7vWkfoj8pCEz4?=
 =?us-ascii?Q?qHi3H8e2l7P/RBAMXJYcZXFYr9vLWkhDI5V3UeGnllcCUuIo+7udG1Prm3ed?=
 =?us-ascii?Q?mXXJMlQC6HB6TRPysBLFQNbepkf7awmHLuVetcmmZ4KwMFsnCofbR2nsYhqx?=
 =?us-ascii?Q?n2G6v/HIjgOkIDPumyYJyuW0dUOf125Zwxf2CDM1UsjvpMObf2luFMNj8Wdw?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?wgGruzTQemNRb9JoZ8Y6JzOWypREJ/+iY5Gib+isird8sOgmNSY0zwDUsPTG?=
 =?us-ascii?Q?Zhs+PRt1nPoXUcwrW20SqZ4ZNT2oIXNqwAf/fnfwaGluqIRzueumoEIUGQxI?=
 =?us-ascii?Q?lEF9fZTBQMyX16Yw3k/JO8v9BCSmYxeLW3ISdIj+2aLKq5IhZaZasaJetoRy?=
 =?us-ascii?Q?VqUZcBfA5Y6GSQ05VUAIKmOXx2EPL4/w57T02Cdkj8htzu9DR3tenIcZWd0B?=
 =?us-ascii?Q?3Ic1rIDojaEUcvDpnZQyuRhocm1t3oej2KIewuzmxOwhXeQkyCCw+bmX0EEc?=
 =?us-ascii?Q?hfT5klzo5Q+n1ckwPQO2o1n2jucLmrQcRMrgje0tA9RakHcs/y5jLGH0xTmm?=
 =?us-ascii?Q?jX8pS4rRDAvVSuERYMsKEuQDh/BKV86kTIXPOfUtd79Wm061zr+oAdbQyq6f?=
 =?us-ascii?Q?8uew6EreiMMnsq8CTCtEb1f6DyTKKWZ55/xl/+BrsCKNNkyaGOb7ckN7jZRr?=
 =?us-ascii?Q?Wd2kSR3Fdv2FYAhsvyDIx3ied0I3Q8P7mBqJNLqTZp+fblXNlpZTj2s51C4B?=
 =?us-ascii?Q?rCvXVWB5ZC/51nmAxooONgNEmkwdbLFYd0qElXU5XLbu+O9zgytYS5XpPSEr?=
 =?us-ascii?Q?WeQoNKQHbuLAh1q34mbBVkgIyCvkrbl0ZEcv6UY3806gztcyjojsI+SLc0up?=
 =?us-ascii?Q?RaX/JNX3GKkXPnHxt5AX88rga32ozzGW7Jk6uh9A1AX9j9J7NGfghnEl0VMs?=
 =?us-ascii?Q?aZKQf3J4G5suXX3+yN9UNt/5mI14mSze5Wu1CT9U3gQRv3FHEJyZaKLmQ9rp?=
 =?us-ascii?Q?AEihlo9blofnYxR9k5ct7p8fgrpz4BjUTgr9QrbJ3p6GRL36HC4swdkwZ9uc?=
 =?us-ascii?Q?76V2ibzn2QXA3GOEsgUR8fMr8+0azEC0WVH6YI9lXDBqjdcP06yEixtkrj5J?=
 =?us-ascii?Q?gnVrtRq7gLsVULlANSLhDkAIzYRxxgZZzCZEsNPwtpz7z4nJti76mWPOBoFg?=
 =?us-ascii?Q?6lznGj2wq7mhgV5hGdGQQAgNprj8xa+MyKvJm7EL75P9AXenDy0/lMa+Nu12?=
 =?us-ascii?Q?QmaOSY9lKa7OHX+2RgygBXjPrpuD8SyW/7Os7mYuYZ70mNQEURhMLm0Pr/jS?=
 =?us-ascii?Q?4Kwkh9JNdxtKdKw3jZPyC80awbcE7IrqUfUf5qTI+xQ3l2g3qWjZoeFDuj8y?=
 =?us-ascii?Q?NVsKJA9RGzUlu4woWeVZ9IMjbNk3bw9WzrovqB2RCprk/QqozvHo/wFqongK?=
 =?us-ascii?Q?ooKaUUOLsSyvTEmnm+2xba+ELPRLgx53EE143sRx1oJqwVJe38YToS+priyL?=
 =?us-ascii?Q?HkoQjMUF69hLH8brNhhjG3lopX+msThJYCUAcLbYajiHGbp9flGeOiaGFedq?=
 =?us-ascii?Q?b2/jd6TtdOwkUWW9bCU0pAETHaTVTJGwF91XIm4fKvh//ujEhn09aPW1TLyk?=
 =?us-ascii?Q?4WshpWXktK/djo24e9zcNtuOtBVcQwO0SbQR1q+KjcBsc0qn+PbivBqRJF4n?=
 =?us-ascii?Q?c7jkc5wUdJTxpkcVO+M/8xSuPttRoCPybS/SJtBC1Hsrxn8vGsgndcD/qm10?=
 =?us-ascii?Q?tvUFuFiPomLuUduy41yIVz0dOyjz86hf7OIHf6eLtBIjutrKrvRLvK8N8sLM?=
 =?us-ascii?Q?o3eysXgYkG0Y8bl/bjfkjRTzo3bo6gMZ75s9askvkgXs6syaUWRO4twPBB3C?=
 =?us-ascii?Q?8Kc4E4H5Q1hh12TVGKwXgvenBuTDb+l+MQT6G33w/A64+TDQMQM16DZsdiFT?=
 =?us-ascii?Q?F6CB6uJbhEIeEiDdxQFgRHK8JYQ10ohOolycsrwecI/3OCyPDjd522hv7gyC?=
 =?us-ascii?Q?xJm+mD54uYlEWQKB2K7tB1VDEiKhQzkFENEjwcAeiikIbvBOr4Elg5VxLQeI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	YyRuWUIHSAcM3GODIF5fqmK1pq0UXwbrBdYA0KckhDupIhK+YSWIDOuRVdD5ypI3j7q5QKBEv9Uke6iwe4n5+/e7XkjFzVkfOSq/RkQGLMzMRlhbLpQwlzYvEP+O4/J5PQjiXYuNO0KPPajHwO0NVNXfO/T6v96hr8f0H/3fGAFDsf26GaXeUx1JCtYpVZMusncz80+/VqoZ3pw450VQ/pNLsZtVaR6pdjbAhcjfDoMXV5/39nvRbaBN15kY5mfy5bGMwYy91lHb1+uDeEdhjMvoPopTaMY6JRhPN/8quq9BePECra2J17CGIhbwm00g8LztReIXpaEEgg9HBVHER6y5LqCafaA8MON3bN+MsvjSHSf/tBAIQvjuygaMHVH4rCpOFUX0NJae69NzR2lJdrOAh7VZooDNAq2nzX9bdpww4kuuFSCq8F2ibzM6jhtK74fGPXw8XiXlBg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 979144c2-0b36-4ec8-6041-08db6b6a7c83
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 17:28:50.4479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snrVkkf3Zlg2h3pZF4NzvMXnmavzIAdP/INXE0FDhjpWwoVjC+oZA6vfPwoyOKzopPfCsKbjw+6GOQ20Pa1UU3K5urGx1OLyGjnSBRZvQ0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6509
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_12,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306120152
X-Proofpoint-GUID: uK9-cQ26e-IDv1YYLuZM7HLUIvpvZgJI
X-Proofpoint-ORIG-GUID: uK9-cQ26e-IDv1YYLuZM7HLUIvpvZgJI
X-Mailman-Approved-At: Tue, 13 Jun 2023 05:57:01 +1000
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
the ARCH_HAS_ and ARCH_SUPPORTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/sh/Kconfig | 46 ++++++++--------------------------------------
 1 file changed, 8 insertions(+), 38 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 9652d367fc37..b9bfe5c3139c 100644
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
+config ARCH_HAS_KEXEC
+	def_bool MMU
+
+config ARCH_HAS_CRASH_DUMP
+	def_bool BROKEN_ON_SMP
+
+config ARCH_HAS_KEXEC_JUMP
+	def_bool y
 
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)
-- 
2.31.1

