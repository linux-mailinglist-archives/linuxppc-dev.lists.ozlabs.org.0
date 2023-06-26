Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC1473EF62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 01:41:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=YH23y4su;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VBBqGThN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqkr53nXNz3c50
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 09:41:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=YH23y4su;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VBBqGThN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqXwZ193Zz305g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 02:14:20 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QBO28l012807;
	Mon, 26 Jun 2023 16:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=INO9jwnm7sy85thqLZ7evmCj4T//oZgOVoVhGsr8Lhw=;
 b=YH23y4suGGdD/Bjm43UxQwUAT4SLzdwAT/7izuWgHLG7LH+/v3Kn6H6TdOSfwuICt/S4
 +BCO/SAaiZz2lnePbwrwtpkc7FPi2I3H8RLJC9RMBFwztna3doqy7sn56yCK/VKByVoj
 blpNrsppFvnQpct4se72ds4L/SZ2NYAfbuC5iQ2XnvZoap2h8fNEIrBYPw0CMcRQ1E6o
 VX8w14p2Q9JREPhBvVGdvca/PzecRGaK7esnY2f+T+Vyv6ulDsB8SnN7OJR5rQP86aF0
 nkyH4Wjeq1UDxJj072Vod3/iYfOTYufh9En1cgerrLgIxcaREnU5PrOxWCQIdX9pkg2n 0g== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdpwdb2wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:13:51 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35QEtYCV005110;
	Mon, 26 Jun 2023 16:13:51 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx9a8w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:13:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nswf83g/vXPZdxDn+PeTpOHXUk5LilcEq3cj/RbbkWu8PiIKZ4E7hzsL+nxO4mgDAh+pXakdBuqVkIqkp8AkNBafiXkil8WAnYaRFvISPa3HsVF/9gwoRaXdH3h4zq4prtDzf3aZGqNvlwdjiQPTq6yr7joYPZ/Trh8H+kvI9ts0QfSUuM3m5SkNPtVsvfz1Djwftk1z814LEXX/Zm3j7a7ZiNUFM0CMwxWgN2RQURjfXe+nPTLCew8uMhrhiz0I146jH/wtGyVzAHs7fAOuakACM+3yLitUzcdmcy2KgQIpiqnP8YUs0pNJryeXmMaOxbZ9Biv5ni7ZbHGP9X4Jcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INO9jwnm7sy85thqLZ7evmCj4T//oZgOVoVhGsr8Lhw=;
 b=XJa4BBPm97+45ydmcKuE2kW0TLl8FIkJ3WUo+6Rt2j/o17IGRVjVj/dwkDw0lepMYSZqscQ4u+QeCDsdpZ8JZZj+I5RVRFwJBpc4Q6uaXY+2tjd5dLymE8ft2+2pfhAU8LvSmJjbrAytSXlkdAZoVgHJqEbOgj88rsB+p4vYQkJcfOwU+gnfL16RCf40zfNowwvlK6dEO2HtybD+7L7cO75cCBLDeUoMNEFOo2kMQnkSRyi8qFWLO8fyvUO0grw2O7l1sd1twkkkkJrZpTxzLAocppbyiOjlUBU6+VFBb5btTCgZdo4ES4pfB3Pah2vfs/EC4eoufoOc8Aqmcx46Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INO9jwnm7sy85thqLZ7evmCj4T//oZgOVoVhGsr8Lhw=;
 b=VBBqGThNvOLrNNkz0dDBT/9YCsMpsE3BPEJ7BDp6EsAvmEsjmJJUKdtC3yPuL1FsDn6UYNM/YsMiIilq9SSqdenImpwNCUdfxVtr1iz9zAjwHLuo8xz1vASsUdj87PKhZSOPnk8R2YpKAj4AVjmlm7oGa9rwElNkCQZwLrXq45w=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DS7PR10MB7178.namprd10.prod.outlook.com (2603:10b6:8:e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 16:13:47 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 16:13:47 +0000
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
Subject: [PATCH v3 02/13] x86/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 26 Jun 2023 12:13:21 -0400
Message-Id: <20230626161332.183214-3-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230626161332.183214-1-eric.devolder@oracle.com>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0135.namprd13.prod.outlook.com
 (2603:10b6:806:27::20) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DS7PR10MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a944b0-6bc3-47de-ef2e-08db7660526c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	GyPTOYp3//gMJhUVoFQJR8YABuKgkoI9obtJPKQDSrj75kZHd4zyuWz2BYJ6ijRnJmk8cAxkLGd8V8gVjhXIeoTb5ihCtDRww+3X60Q83uDYaqFx1P93eL2HeZVbL4sBPrgROLbKTH1ZQkoSc7vypyrtIm46bQ1QSzeIOgSTBTAQcNYv31tMkycVmLvKwWdXpkMeGNg8gwDBdOSvlTim9e8mPd5ArsnIGuoqJYBAq9O7usBTRSHmXM599qbO3i4FqqWEz09Oxz3rf3gcY9u6yONCu1EVu+8VetgU5QiMFrnhMTjv/o7NROM9qaAkxOHqtvi5o1krfy9MdtbvUccmGjzpFr+po5/JavxZgHBFHCD1Sn2pk879Ox0dVTDbgjHCCEJDMLbpipQ3u87pdADBlUTA56kBPVoLdNIPcrUxBUpk/ZJD+MLkecXufEjT70iJyiTo3X+460YBFUX/lCf3SVWLG1eRlnlrORnBhYHXfGwmcmcFIxZQUjkTvGKYSPuh63A9Cex+5ZhqHRB0Cyw6YRtlEO3nCJxfc2CBolSkppnSG15iTwV9+pti/goVbqBkB6AEYLHBHPaj6u21iUDqSBxwX5dEh4nMXJvZXNmoHZY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(39860400002)(396003)(376002)(366004)(451199021)(107886003)(6486002)(478600001)(2616005)(83380400001)(6666004)(26005)(6512007)(1076003)(6506007)(186003)(2906002)(5660300002)(7406005)(7366002)(7416002)(36756003)(921005)(38100700002)(4326008)(66946007)(316002)(8936002)(8676002)(41300700001)(86362001)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?YJ4q3Rng0/MQaBWpo/OfDyXJqHB5yxH1G9elpWwGV4ZI4O6n2kXP0xufN689?=
 =?us-ascii?Q?/R3uazQ4K2QeteLc2xg0DFnw9pci3U2XSArMPrwtEgcHEvtkeoo9MMyb30hM?=
 =?us-ascii?Q?ggm3ON4IzVTLkIceGsEva04p/pzSOgUd7u6oMCUC2ymlAaYIP+M6MzR9+CNR?=
 =?us-ascii?Q?FMjTXcL2vWYMv5D1GahCaa/KJyF+QJl2y68ZctRbjIqeTY1kQMF5BPmkY6wP?=
 =?us-ascii?Q?s9acH5yhttmF9KT13LnffZoM/szHPcPL8RqB3N+fvf4Ns/tukjrjgtDnstkI?=
 =?us-ascii?Q?bzfHGfF+vRb6RkBTA6vXWsyrTE2UcfHs6UuesDs6c23+AtT9fqWyEi3Dt1cQ?=
 =?us-ascii?Q?u8FYXy0uPs0ATNGmUSs0KnUuXI3izBohFRPkCAWuzyd00sYWYXrtVqTw0x7Q?=
 =?us-ascii?Q?9NqftLcUoGfz+BAdAQIUutrd0KI1m0SjNHIZplQERGzJEVhgRXxld9y4usj0?=
 =?us-ascii?Q?lUAYfjE58g7ex9Tp5y2gaTJalWyIslTMj+0MPuFwDfYrmHnow62ffcQvJZ2N?=
 =?us-ascii?Q?gGIycgXMsQ7YMI8gIT0kZX7lvFuqoMSah9AnSSnecIrZ6JUwVXrJ0LqTzYIn?=
 =?us-ascii?Q?wOw2n+l+5HOraA1dlDkCRmy6MpZFFn0decqQkVDsaNoxnp7KBSKtwpLO+31n?=
 =?us-ascii?Q?0FuoudPBYaVrjkN6YdaeQ0mvecCm9ALTqpeY8ohTgNtif4hWOUpT+DILErDp?=
 =?us-ascii?Q?jP5OcQ7IHaMylSpjBGHQ9SN+8Mkfoqg2j1YJeMY1X6CwkPz1vAf1uamnzUHM?=
 =?us-ascii?Q?s7f8BJWYU1yqxqCvsmxeX6ZXTmKpdYr+5gUxVHX+6zjpG+Esbx91+mMVnnN1?=
 =?us-ascii?Q?uzQkrFgpP5dEe5RpliMnZHfl5nGnreWy5PHgk6Ur7EP76kaCnf6LXV7PtJSY?=
 =?us-ascii?Q?J0A8VCZrxkPWcHy18yM4zsWokZXWjy3Fe1yCkw/68u1tTvdAoCy3obAJAO29?=
 =?us-ascii?Q?oB1aFu4UiOocVyecMlSmBeuTWpHGnG434IMwIVOC2rW1pd4MU6IXvaPNOkuN?=
 =?us-ascii?Q?E9ubhd7RdF2WzcsSfixqSl/l2xZ/vOcWvQW/1bM7hA6SD2PEfYZinbwFSJKz?=
 =?us-ascii?Q?7US3ejIfCO8pqgUB3yt6zBggmLBTViHJ54DijhawfSz2dCMHCYEXe7r9Q3F6?=
 =?us-ascii?Q?WUWvyz+lcB5rKcovDPY7udpT0WYGPfpbVUYx8BzZ69xXXfUCzVnFkBGpL2l0?=
 =?us-ascii?Q?MmTqJ4lsvALLBkYWRPgVklG1Msm43QMwx3gAwo0Xb2e45lDssKgWJtbvrcq5?=
 =?us-ascii?Q?yP1jDg7gpzFQnJEuMpjkKiWtPfNsF+ZVf8vu1lOIsTgYaYlzSF1bJ4KNhubB?=
 =?us-ascii?Q?ukxVGx3JXfREstYwpQMcwUsnZWwOqvSmkVlkseoy+31bPa8abXsydEjKq7Iv?=
 =?us-ascii?Q?w9HCTR/0amfvaSF3bZ/yEGjOUF7MKTFW0amhybQKTUhMyRjWUB+ae+Mn1r0d?=
 =?us-ascii?Q?9LE6BrJW5AWHFKNr8Gc6i/C3j5hh60yksPo6HlmN8dEOiRaf6d/ivupGORpH?=
 =?us-ascii?Q?vSO502PeYyKVnDCt9f2W7ogSYcqa90YTU2/2pgj1R1s4fCtT1KmrJymCqj0U?=
 =?us-ascii?Q?Rmy8taBkuaBwxs2rnoGeneuLsAnUF1rfq/mvVtIIE7Eu1jWYWyq/lUaoSaKr?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?YzgCiIhnwKHOU2rx067ItZ+cp6Axjw3COK3ixsSDu6sbWVO1sdKtlfhgSEIj?=
 =?us-ascii?Q?q//PHAflw6Mq9ThUCXBJWl3P9F0KtzZ3ui0zxqU68KeFrIXbw8lxfu2Fr9Qq?=
 =?us-ascii?Q?yUmckpMg2n9usdlbNYTxGEzbLi4wTtoS09Myl0VlpFyFYh/38E7uRg0OUCyo?=
 =?us-ascii?Q?WK3i3snDsphYWQA0G7agh3bvAR4LEjk2yPBV6g/pYSeVmjG5IaUHT5T++5Yd?=
 =?us-ascii?Q?RZMryTR4DxMEvhTlctPR4PsdMHYEY8Tunn273bgiHhIoO1vqyeGxr+IaU/Ux?=
 =?us-ascii?Q?EHFuN635UiKJOTOpO0cRhWnaDiZfvq9T3q7zhnGoj/TDuj94c8FXLp//BtDp?=
 =?us-ascii?Q?kjwu7pMCkTcyK55EY+zk8vmYtVYy25/Ul6m5n0EA4hkLjeuZHOWMnSqgcWCs?=
 =?us-ascii?Q?WxwLGCfhTLmhMng/cDYUcNijeZTH3dFZ5C8t+uHnjEoE2o0jHd9Jd/EzxGrb?=
 =?us-ascii?Q?49LlijHo9STYaur3SnyozfE33nfejQ/5Zd12fQSryhBQ1grpJ6oMx2I4iQYo?=
 =?us-ascii?Q?+Qn/ZhUkIxfCp2R8XgZU8axZSXBkD28US+yBtdE0+mr47DA/ULm7gYb0iYCp?=
 =?us-ascii?Q?uF9aEWHgIVgxgsANCnt38TjLYwmmKJ3jVofD7VrjDJnPLzF/QMxC1WfGEvNJ?=
 =?us-ascii?Q?FdmhL2Z1FSnl6E2nk8HOoEUBXaqDkEF9+CkL6CsZ/iZbCqYsaeVleTjemrrd?=
 =?us-ascii?Q?9R0UZKelwSy8FW6wSAI5XSJT6w+r8z9KuFWFatN+w4feqLNR4DeELVGyLEKX?=
 =?us-ascii?Q?GleA+5xjIM048uw2QjtwBg5aYyxz+2G5Uyzhkc8DHVv1ZzPPovBXeXAkLMs6?=
 =?us-ascii?Q?sS8AVxk7WSVxyZe24Mjmfv+BRIes/A3OLkEBKUL3AxNPrtKIBu086YkVSelh?=
 =?us-ascii?Q?27XRmTW1JhXZBPgFDCoVPDF5EEqSgQZk34tHJ27JpwrARri3SsB9V9FiEP7T?=
 =?us-ascii?Q?WrtyPq0u/8Tsz61dBsYpukv4cEhMV4QxLfsLt6+Hb6nhheeeDKQHc4B235d/?=
 =?us-ascii?Q?k93G8EEeoEWX20b+PI/JQRXapOEr4Ykr39q6/EH+1ebttSbdl0H+nNs01qYe?=
 =?us-ascii?Q?gstvDOEmdHjhCWzhgFrMQu2bKtuil/wt2NxpDJHVk1ilQcw1VeaWSnC2boZ1?=
 =?us-ascii?Q?gcmkd4XZAtoPPUZ5wXBwsnDgX7Wtqth/Y8c/vXADcAvY24GkOV4iVGwcgR7i?=
 =?us-ascii?Q?MZp8e9EZmhIi9UJDxw9YXU9+mSXG4JzcPTLaVGTVa+WTGN5jTd6L8j8xcyr1?=
 =?us-ascii?Q?Wjx5xmTvlyXMQg2n9dW1x+PZtYjNYNUVoxay+GiccUJ+w/f6u6mcQOHLfqoM?=
 =?us-ascii?Q?02JmnS8WQ3SxETHIyjBDU2qGTrqfDWUNzUFZmgqzCSoW8f5Dx3SawLnilBCw?=
 =?us-ascii?Q?kRic/97w6O3XFsmf81c2lwDEw0/rH/f3f7q/OEGvfaN9PIhl6/hGq77IWzmW?=
 =?us-ascii?Q?B1NjGblur6I6hjHY6bIUz0iuxnn1eDjLXA8x1DtzrOq8priDLce9gEpQ0qyd?=
 =?us-ascii?Q?uM+qXGp2mGYCVxh1lVZ473J4ocN3LXgvZl8IIGxm/U2WOctrQA+PzD/5yfmP?=
 =?us-ascii?Q?kJOb0w/GLtvLUP3q8kuvIRINyzsaXOCMU0iVgDJNsakVWixNTTsfZPBOeZqx?=
 =?us-ascii?Q?f6rChvsEUR7p0efL9h1aUJSAzdUhsigJrEUUeDo6GsQNgadl1RuR46iYbmsx?=
 =?us-ascii?Q?7m7qXL0nI+gr/1xlaq/eLZvlt4dIh0BGEw9SIpew8xAdGe9iD0PnBsvZhlXw?=
 =?us-ascii?Q?GdNzLfsoqwdfnVeSodkVUhK+EQxS1T7EO/mWQC1UHrPrRVGuTIGNt8erIVkW?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	iGVZ9wfaLFqt12h87Bh5GTzLZ5/HjkqKeWLwv0vkuYU/59F5ZCrNLYlyXVihSf89OM/hb2dqLxyB9nomglYWb8oOscCitNLaxOC5HFY2aJAawodwFOZEanv1xpyWueatYhcsyJpd0Y7EL7KLow9PE1gQy1xw8iZ7v5PGBlpLntwry6tT6Go5HAfZJZpgtKg6o+ZLnR2pCHYwxxB3ItRHQqpvPGF46+EXmtJyHNwm1VURL6XMSVh/rcXYpGxXV7DBetj+JVNp6kpLxTX34aGWFouriY+UYrSs2zB3qHrxwhpCv/O9s6MoY95H5V0X4lnXJc3dKGOU71ENh+r556BTrYlVCmIbr5OzA1H8HrQ3kKfJDfSGAmecd4AfuEMJevRzMbtC7D3sR5epHIvAlCSItt5LNFuFgDGemukZCAjzYS3AFYETGvSk3dr4P3ygmVVxmhUMXHj6b6doNQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a944b0-6bc3-47de-ef2e-08db7660526c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 16:13:47.6790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrx7ySdpGYw7f+W4DECQLYwCTmud5zb1/sEAovmT173s5sVC9qhGZ4+um56ZE7sPRutU+TORbKRdGPTmpl2TeWEJKpmdIgOj9tRRa2RA3eA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7178
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_14,2023-06-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306260148
X-Proofpoint-GUID: XtoJZrUjqKS-ucsD_wTBzagWKMjD3Bl0
X-Proofpoint-ORIG-GUID: XtoJZrUjqKS-ucsD_wTBzagWKMjD3Bl0
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
 arch/x86/Kconfig | 89 +++++++-----------------------------------------
 1 file changed, 13 insertions(+), 76 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 53bab123a8ee..1afc6ca2986b 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2043,88 +2043,25 @@ config EFI_RUNTIME_MAP
 
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

