Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7616473600B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 01:16:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=XA9SmlPT;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=j7i6Rbt9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlQd62hx3z3by6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:16:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=XA9SmlPT;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=j7i6Rbt9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlCb273GFz30PW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:59:10 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J9nEha006316;
	Mon, 19 Jun 2023 14:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=Dn3R/grqsaPCcCYwf07M9S5Z/0/TTWMljQwkxW1UH2I=;
 b=XA9SmlPTzNsp+YG2QILrVX3D/dARndoS+kIW3YMyrDR30SqpSpjHOi0rkwUyI5vJB/pZ
 rGQvP959Dkja2aRO+y/lF9myRnePovDL9GWyFsxsqq01udnK4xkA2Wod2/t86Q+kE+uz
 pTZtx1X1lXstknHNSbwEa1+sqjaFGvYE6OeuFKUqQpxjW/f6T0IDORUyA/XZUvh5Aaf+
 WLAdEf1e3cVK/sZqIqtwjm0Bfzqbk/jQtsdhCmYYsns9kRB83G3D16QCfB6+UGWSGbbm
 BS8iKK5XqHHtDUxIPnLQMY5F1h80DhzHG4iGx0pNVnES3d2/3MHAMmxv5yLPS9Ci4A9d tQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r93m3jx6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:56 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35JClHwD008306;
	Mon, 19 Jun 2023 14:58:49 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r9393sphj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E256NWTVC+Dz7Z5dQFcTfR3CqN8cSuYJC4Lu6bf4ujofG+Adm4TcKB5osoXoaKYwk43I2TvgcBxNgszAIAbdCYGJ0kaWhgJYiybx2WL/5f/j6dzyfyskwgXLdhr1Pg1W7gZqb55MA/pvnnqROCnfNMZ1dqPw1Wrf0f1g501e5MSRI1J4Ei/glhjUefPP8bUAz7qkMjOrf1pRaX1fHQrk9QwFH0D5n20l0G2kUcvkse3it8akK9HYAYUA+7L00YdLlk32KCiU+y1jtILQrJM9914dK08YiQzDdea2Y0573j3absrzk6v7VMjDERlxNUfihUYtqhGS6r9xYavFPhPiiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dn3R/grqsaPCcCYwf07M9S5Z/0/TTWMljQwkxW1UH2I=;
 b=j88qHVavC4jh/3cxnOsCYrtrCA+1Ph5oENORjrzNKbjm9f9qDh8yYT7xgQ7p3krWlLfLcSbddjZ0VAegJpiT1gPJlRW13hTA1uIsYWjf+UihuvptDDJp66AUv1+8T94Cv8KIf9BjM5nTwYZxjrFZhCF8BBLwgPMu2/UZD34OLrk6Vh0dy1fBKv+i+y16xycro2HrxPv6w+VJWyEJAkxB8g+yejw/smRHXd8gtkklu4sbfdn2eQ9ybJHoeEvtDDTe1MFS4y2ynKcL99YzkC1xQj1bIVwabDcxEiNI77Zz+olbadrcWh8jcVpmU1FcjE/FA9iU6DCuLs8RxpzLul8zZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dn3R/grqsaPCcCYwf07M9S5Z/0/TTWMljQwkxW1UH2I=;
 b=j7i6Rbt9s7cjcUxn6g7MD2njfAtqTX19GcaMNfmU+4AbElr+jRkN9zo9npwK/Ix6BN2MHN6D2780RZqPYV0EVj/tAahGb8q3PM6MGTQsP602n9Jj6XEYVXPYWmOYdiCR7HJuirEl03E5U1ZwWKDGMV1pKJrVktPIsKwmxJM5gl0=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA1PR10MB6543.namprd10.prod.outlook.com (2603:10b6:806:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 14:58:38 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 14:58:34 +0000
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
Subject: [PATCH v2 09/13] parisc/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 19 Jun 2023 10:57:57 -0400
Message-Id: <20230619145801.1064716-10-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230619145801.1064716-1-eric.devolder@oracle.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR06CA0084.namprd06.prod.outlook.com
 (2603:10b6:5:336::17) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA1PR10MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: 2619c5c6-7e53-4f4f-590f-08db70d5a7c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	e/739ix3/fJxdtKCv8dtJ1smMnNNxPwP8xIc/T1AfGvcb/MidmxqP5fanHxeJVOoZ4DhUrrIpF4fMxUtv7dLUQfb8jheaHYUqqKNuYJUtsvDxsW2FcLvpHlBs46vsd7mWbnrqAfvM5G2YNqs9FoB0jIGBzOG9P5DLlEPyzZsEQOomWRU1TwoLffSV4IVYXPEU71bbojMghojXj4/lV3MZGRPjJRfyUgkqWIbOc7GgEtJX11Z41fdisCT5f985rmuXIUAnywOm6wLOAWVUgwHgpFQ5QhMUc6/y0VqwNJRdStqizmsKZD56+UsQaod84BqfsnspyP0shr5vlnWqmC8np73UWo8XhdUzIRD0EX4S3/okQJxywYmoH2/R7QLlt168YM3tUXJhtxtegxwYCEA8XGHi3TnoEL5JmXlDdBqx+ZqJci1TwHCPBlssKnCxi7hBCXcbwScEvYEjLoiBohPojh+ZixDVlMP3kuaDOXvUFcRlaWZH7rur25BNvYlXERuY/1RBsgKktQxLZs5q3LI7zvdgBlTUpGL62NPczLKdTplsHgwgnLML9YVdEXS9DNdDithJCQCESKV/u4GpinEuo5rbSl4VYkub4ovtc0a2io=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(7416002)(7366002)(66946007)(7406005)(8936002)(8676002)(66556008)(66476007)(107886003)(1076003)(26005)(186003)(6506007)(6512007)(36756003)(83380400001)(41300700001)(38100700002)(5660300002)(4326008)(316002)(2616005)(921005)(6666004)(6486002)(478600001)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?JD2/ihlwBMq/GbYbd5LkoL2GVKKt5afW0O1lWiQKRcODePJ5vE9MmvYqilTH?=
 =?us-ascii?Q?jRxHmwsddT4PQ9gBOIeaBIfncjH782d3rkJBdxeMnplvQGbtbfhj2R6OX8Qq?=
 =?us-ascii?Q?94lJVw3jR/sSTSQUSwX7nWNpjnzgBrrcBnDpT50RIgVgP46Y8pjUYE9BPnT6?=
 =?us-ascii?Q?eOqktO5GJ2DVdI5elT05a3hFz82rXmCwYCrVemNn+PGI744D2ADLuWG/dpWj?=
 =?us-ascii?Q?DS7QKSsAD8udcW0RFe9bxYLyraxF7aPyYMfo2NySLcrSOTUTQ0RsLhCNAVwZ?=
 =?us-ascii?Q?g7ws4NAr225KKkZUQgBCKQUsIWGr/5mYhVkeqiYtyDOW5oY9nz4TvMXPPE2S?=
 =?us-ascii?Q?N+U3dfIY/kTn4XtpG7W8NFOPxmWRuBmJSu2e7W9azj5Ata4WTYDKi0DqL6lG?=
 =?us-ascii?Q?VwbDmY3DLisGGaypTvJ0PwfeA4H/9VUGhvBNz0NS0T5dZj1KpCbgo2raCWn1?=
 =?us-ascii?Q?WD6dAU4SqW2A0U4ZLWLysbiGg9ECuGHijIsy8Dt+WkyPgcGhyuwaGFV5G06V?=
 =?us-ascii?Q?Z4QBh2cy+AUBKpXBIWWLYekwPhKtxm3Ub5PMHvwxzj/xQQW6KSTCu6nNk4l0?=
 =?us-ascii?Q?FP4ruWzPr5ShdMOOA3HyaXvmM0586AsX3qMD3zvYilG8fw/YfXfVlAfzXxVp?=
 =?us-ascii?Q?8yR/A5YAx3rBrXTQRAtx2Un0Ix+Lavv3b8kx4HYBuG2GWOk+Z13rPDTDzwV7?=
 =?us-ascii?Q?/4HEQn+UkKVZ2QXCrwEBxfITIbm7r14pd2N9cTcxsNy5vN9P3c8OgY6LDOAQ?=
 =?us-ascii?Q?DutPynpT5eLS6vYWEN4sIH0hRfm7p2soz6Ysvw9EyUAGasRRhFMoS4mkuVxo?=
 =?us-ascii?Q?rFf3Bmo49rO7LAN5ycpvyBOROJbFlcAAV+HSkobfwC3FpWivJ34K0AGydckd?=
 =?us-ascii?Q?W+I2z93fExVNNal9oMMCTXE+KMBqxaVNl/spMfTAkJK/KqM3dQwob/1ZA6Hr?=
 =?us-ascii?Q?SCwzT5qLR5HpobVovVtIDG/KJvC3yWw9mMQTgmtgo5nPFr4HvjifVLWmSTMz?=
 =?us-ascii?Q?dJ5w1vwEKLqvdTK2x/p+9S8sVhEiJPfvmQ25Rg9kEJImIN/NiLd4l/diP5rE?=
 =?us-ascii?Q?7DAn7yJUlke1Tsu9vhnzd7rHhl1Qh49JmycKYoRRIiz/u8XWKN4bqJ/YsQ8z?=
 =?us-ascii?Q?oO6d9umsp3NDk324WGTDz+5G9cIA6a3eG6NVgNbJqywryiUPQ9ihGoyN9BbW?=
 =?us-ascii?Q?4e723N3pNKXOmyb7MhaY0klznbowV6zaNekUTeJc0z7R/Bx3m38zN3J5GAgv?=
 =?us-ascii?Q?wbj1wP2mZGDCD3RphdsASHdnUIXYYgjxbwN1VOMNfLvc9sN02+fNepU5ovN1?=
 =?us-ascii?Q?TXoWar5M4/JJOT2hmzEX9i9imOd/RVmQPY7Kazr5gvW8obvl9Y+kr5SvhbHz?=
 =?us-ascii?Q?uybKHdEkVks3jF3H4urnwQcr6ZliV0ERYak0tCMxSz59KzxiBhVWH6t0fJtz?=
 =?us-ascii?Q?KsYTAG4RDOTwhXv1k06NQ/m4jyuDK4O63PhV15pWAXM35eheEgl4ZwVJCuMT?=
 =?us-ascii?Q?HTYSL5t6+a75sjtDg/66eDpddogHHduSnDjc+JkYpz6f4nWH3ecd5tINzI7V?=
 =?us-ascii?Q?wk3b3N86crCTxzIQjAwQi/0UJPS+edSpUf3V6SS6L46iYgTWjb4qaD1Z3bu9?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?y0aTScOJNEcAXRNyijum+PCA2hCFaqg0SEswwhMjKnt8Wo2Q0/8oi6ua7TxW?=
 =?us-ascii?Q?r4OJG43Pn3oV+sYcXHHEdXvGkDFXbuz6IQE2Rgk6svNdGnJHRgb+T5V0KdGB?=
 =?us-ascii?Q?appWtUiuHP3m5OygshEc+16yteXcr7AO8h5n92HWdqGM+lV1hOhoTZPNQ2VA?=
 =?us-ascii?Q?wEqRYcY1SoME9rtqKW+S8/Bro9DERTyXnF6QfqOIVezr5+gKG6uVGH4h0zxD?=
 =?us-ascii?Q?i3CdmPfg+6W+e9OLHNCxUl309WA+rWjX863yqIE3shsDNLgVEECwyTSanyDX?=
 =?us-ascii?Q?NQKlLN68JTTZxUxNdurGzr3LrP4Ox9Vlu8vLb7BkUHC6dRVF/EN1MrkPFrH8?=
 =?us-ascii?Q?s92CNaUMM3PZl8hoprOGeOrAMp3+g6VYfVc/CVD85EfE1OaTAkZAt2u4DtXD?=
 =?us-ascii?Q?uD1MDI7utQ2Hm8Y/RR3YNmqf9GcF9rmI5nXHL555Azg1LS/yjKjGo0y2gf8h?=
 =?us-ascii?Q?SJebA8oq//o6Md5xRg8uFM8D+CChePBx8cd90j479SuwPBeIASUtGKDvEwUQ?=
 =?us-ascii?Q?V6+Cn54TtdZbr6rZFiJeMxJ/VVMj6Puy+tOPVbK+Fzy6u6nVKC4lgC6riob9?=
 =?us-ascii?Q?BvzW9vnhaBOGnusPWQ0ISDNL6OchvFVLJ731LxpbchQxVOF5B1tHRhyV863V?=
 =?us-ascii?Q?JwvOmSvyX5B7D4cfC7YcYG93mRGgFeYE/nGC5IsGx0fVqunz3HmG3DDxUrTU?=
 =?us-ascii?Q?kWP9is5VigkNWCPxSehOfrgSHId1UaD6UFkiqVp63vgYTHdjXEh7hS6qdWgx?=
 =?us-ascii?Q?PegbvA6M/R7GiG1yowJwNCuFtXu+qZdyIg1dI/EP7wYi7fB01VOtR4VruvTg?=
 =?us-ascii?Q?AvryaBgcXDQpTYK93DHzr5VvACi6Syc6Q5IWVc3ZaIeQC1siECIvlch6XcIG?=
 =?us-ascii?Q?QKkhUngCz7Bk906k00jGTA/AeKlBHEpffC2Nt9omidjkKP8PV+3Tp7B1aEvs?=
 =?us-ascii?Q?ad1+7d18VKZ2qOsw5LmaTO22AHH6uqhBykXpA3iWiE72cMqVBUUJiZNnolEz?=
 =?us-ascii?Q?+SIgrx4LJ/tcqgmDJ7DWe4FLM6cA5x0KNsW0V5uKUyDW1MvVaD44XsaqtaKg?=
 =?us-ascii?Q?xwuqBN/OWh/Q/n/+inujtketCJVdll3F0ZkQpyJoBPMV+GD5HKG+RhWBQk1M?=
 =?us-ascii?Q?ly+C9BNvb12MGtCHcfPbCHn1G7kjbVd9YumcNDhs9dZWp4elj0vjUw8UORMR?=
 =?us-ascii?Q?a9d79iwVxoMaeN6VgsZZOIO/+/DzRvNX9QJc1ZHVZDZ3G9om2hXETVL61Z1u?=
 =?us-ascii?Q?xZG1NmLUNOO3lYASC2W5JD/l4oa0ArOcpAzM2tfSck6PAb+iwI/dsIUbrO+S?=
 =?us-ascii?Q?dUx8f3WBcMP0OpbewIGsWs18hOEIYWf4omjtBLBzdNR83EDUmnaZyWbsHQTw?=
 =?us-ascii?Q?VHDvnK6Nh0Iwaq73lWCAYyO6kgZaoPkByOuHxT4mEzGk1wJOy84sCT6Zte2k?=
 =?us-ascii?Q?MizRARjnW/cih5u6g51f3X0AmSfe0whotu0dfebIsTailSh8QBLnMlPEtNyU?=
 =?us-ascii?Q?qDysmx8wr9HGal25hBzMn0/rncyL0D0fRph8szM0/jUVuVNIKMakNfi82x1X?=
 =?us-ascii?Q?8HQ1Xl6xUNAba/Lrim3iV3hraSHFICokcD2EhphE7PrkIEAXfjkOKVB37OV4?=
 =?us-ascii?Q?ZAQWycB+cSlHqbXtxnArBmW0McbAwrUK809al/SR7a9OVzQJbCtFItokcaaz?=
 =?us-ascii?Q?BT4kInGG32iDpjtPQO/cQizUj5BgxoQ2As2L7A6o+cGNmM6RqsGF+3LE0f+o?=
 =?us-ascii?Q?P6Gq9IqAo0omfhjs0m8Z/l6dKP+UQMJ2c2AjJnftds+lfmRkllqzVDKzUbMs?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	EvXN+++PVB9a+xEY9sHAaMO3SNCOWcAGN4tJxz/qLmKBdCIjTKC/U13n72ScUL+uFugGZCLFOhu2YpahOMfrkMfSuYJm19fopuL0hQYPg9b7/BxuPeTujyW2dIrrSeuMJN3IRvSoeihnVKEbHxLiJeZkS8ezkvD8Vv3GSmIgyUxpB9N64EDKmyPzn4h09euT3YFLBRCzmtO0Hn647gB0SZBluqpqZwGkDzKh8EseNfafFnSqteryilhzPHZajpVrNAPcFvZPq36pNdWjCQeuRLoP0s4hiTdkJ6c+xSBxi3kTeqQuPLQqpzrIIrl40QxU1NqysHdrzGtRicrpBqiIzwjGsta71lJef3+snQluUPEfrVi+TDCwz7KrDv9EAklXRjy0TMDbWWJ9uz40uX1D3L6UvcnS+PhssChsURhbSeb90WucMBU7Az5ZfO2Bm0zIZd+Jt4TA8iDDtw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2619c5c6-7e53-4f4f-590f-08db70d5a7c0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 14:58:34.9460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcfSKUzOZHrtZiDV+bOyF7dYcTJlYLpvaDQ2grVBUIcYWUxJQWCUI0lwAoKO2nbTHvdmXkFL2ckya/xkpibflsI/U/KCqx1dRV6UGkL1iLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6543
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_11,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190137
X-Proofpoint-GUID: W5EIXFNJ1zqjTdDghyiqF121bkeLpGR-
X-Proofpoint-ORIG-GUID: W5EIXFNJ1zqjTdDghyiqF121bkeLpGR-
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

The kexec and crash kernel options are provided in the common
kernel/Kconfig.kexec. Utilize the common options and provide
the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/parisc/Kconfig | 34 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 967bde65dd0e..8de24bc503aa 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -348,29 +348,17 @@ config NR_CPUS
 	default "4" if 64BIT
 	default "16"
 
-config KEXEC
-	bool "Kexec system call"
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-	  It is an ongoing process to be certain the hardware in a machine
-	  shutdown, so do not be surprised if this code does not
-	  initially work for you.
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	select KEXEC_ELF
-	help
-	  This enables the kexec_file_load() System call. This is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
-
 endmenu
 
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool y
+
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
+	select KEXEC_ELF
+
 source "drivers/parisc/Kconfig"
-- 
2.31.1

