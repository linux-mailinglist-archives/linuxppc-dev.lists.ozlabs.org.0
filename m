Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8922474A75E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:02:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=fKQlbiX3;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=v6V6OcPE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxsWF34jYz3ckZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:02:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=fKQlbiX3;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=v6V6OcPE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxrbC1bbvz30dn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 08:21:10 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366LriBZ001317;
	Thu, 6 Jul 2023 22:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=6WVXu5nJIeV4BVRG02xJHoWyyZ0OCnAKt81uvDMieJw=;
 b=fKQlbiX3MISQyuNc0dDpkgO9Nk8BhK6qHdHsqiuomV26nFyx3RnMdnD8m0eLNBQdxEMO
 huQM7bMDeBZxg3nASFKxY15L7k7UKjW8yGKHLL4oMeijZk5ni71kNMjBpc5dvESDgMNs
 DdXOkrjGzcLKEZwO5nn4+a1n8wziTiq8IcZ+hOPDfGjcui+bB52VHBPZAGHlwAzxjPlm
 6fdkgjx5FxeQ9mmmKgV3DEckd2+re4CZPZOZ6MwKVn/qfDVtjqJ7ztYjv0Vwjq5Nl8kP
 01c+NlteQHckv+EiipIifh5rE9Yc2EP8OqY2deRqz/bqQI26p6nHQqjxDkHIGTok+RbZ /Q== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rp4md85rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:20:52 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366KYvIC013438;
	Thu, 6 Jul 2023 22:20:52 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak7ph6h-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:20:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dD6BqInXq2WLgJPUqAe/vZtBwNuLHBos0vQFiPNWvnujATYQKnsMYQ3JWQnjJ3B4i+M1V8VgZUhf72JQymtcwlDpE5S/ofTTGeBX+FihnPxjJNi7x5MpC33zK9BuNp2srz3+0iScbKw4GczEFUA8FcvVtA+twyaoUDf3SFmk7zKGqwD9SVUQiiNfRIdjV82jyA1UDA4xQ41/46ELHvV4wFEOYSzyHGyq9bBAI1EGB1SPgWO4J9ROi9heB28HPPMy+fUG49OfijWXjh7UroU6Fp60eMxNjHjDmsQR2hjGS5JoWTUkSbc/n+ZUgsm1ghX5gpzxrlShkppq7K4ingCzXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WVXu5nJIeV4BVRG02xJHoWyyZ0OCnAKt81uvDMieJw=;
 b=S+1njFqW4Wd/j5Utdp6LRxfKgyL9qLb7r8TpUhtroPRspGG5zSVIeG91pPquq9tdKF3Bfab2kjYfsOLMqu4+lCtTxvQlh8vBJX56DmpKBojrChwhSfWqJRyrNQ/TcWvDCr+NnxCJFTybL4D5qw877mNFKnIsLBa3mNVbVKHMmV6X4Gt0/IpLg29zW6pok2XvldMXSj/+2MJo7A6Hqb4nFl4GsuEJ5LAN1K70ENNq3pGDZVX54Xy5MICTVXqOXOjgxEEnRMZBVCmpNLe4hFsWpvMx1yAxCHZzZa393kEwfwIwttW35VGEFIz6Efzrq4I2cZSavwfMIR0qmc+IdnMgfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WVXu5nJIeV4BVRG02xJHoWyyZ0OCnAKt81uvDMieJw=;
 b=v6V6OcPEddSS8NjKcm0CXTdtOl5/yQdpI71K1lxje6ARxGr4n8itpd+9MexsVaA5r+95KWNXV8PKQbxUuFefJvN6fHHlpX3PJQAzAdtmWv9vEQFVce7b303DpjkjJM6DyQzPL+igZRpEKMlnone7BpJ0dB7jG1fAdX1LFmuTXA4=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4755.namprd10.prod.outlook.com (2603:10b6:303:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 22:20:49 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 22:20:49 +0000
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
Subject: [PATCH v5 03/13] arm/kexec: refactor for kernel/Kconfig.kexec
Date: Thu,  6 Jul 2023 18:20:17 -0400
Message-Id: <20230706222027.189117-4-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230706222027.189117-1-eric.devolder@oracle.com>
References: <20230706222027.189117-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR18CA0025.namprd18.prod.outlook.com
 (2603:10b6:610:4f::35) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO1PR10MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: 976e0b88-23e7-401f-27e8-08db7e6f40a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3+qMhYjYUMNEabH1u2JDSadURS7IaP6+rlQlmpS+A+E3Gz+D6poeNyKWHZoyEiUQi9MG0m+JBfib72ORr0F/jx++hsXC76m7Q3mD2Cpm7ejg42HB21/JqM1dUGROsLFPHMw3VlmauySJAo4sqPKjdKE4CoQ6/s4x5ccAtoB9BBFmCxGZpvhJw+qwzqSLplu9REIdUgpL0nBXcInuJdRm2ZwQeT9zQwttvyrKCCSSNatMDpJcYg6psosKy6M3ZskvZjBjLqQD+YDQdDDkI0XI7G9rSwUmYZ+RYfAP+nQY+oLxDDg6pgXh2Aoh9lOhQs1G53Cp2sEcqD4mh6ig3DvL8ZLP8QaGs6lnxd5VrcsKMWcTM2r1sS3rP/outn6NcNseOPFkEToMpQdF/EvyjIampfUJWNkVIzXAxr4dO6qFgnC1D5ZK/G9woJj3SEWuMdR9FG1IFPZ0mFmeIxpeUEpSMl2NRYnxaxPlNC2Wukj+A81hDbUo5mE4UIgC5EtxfOtKukwM7k6/q6oVOo4vg+zw8r8JvJHGYUUBpTOLoaeDwB/4TXnJySppKzFquyURlklFGCtj5LZUTsKOrII2CZmlAMZHfHwdqRcmmTHC1KcozZ8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(2906002)(2616005)(5660300002)(26005)(7416002)(6506007)(1076003)(7406005)(7366002)(186003)(107886003)(66556008)(41300700001)(921005)(66476007)(6486002)(4326008)(6666004)(316002)(66946007)(83380400001)(6512007)(478600001)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?LOMN/H0XNQ4Og+0ew8PbTBeXSkZl78Wit5oLC4LBITSVboCIc3LeUvQS7Zov?=
 =?us-ascii?Q?2c1q5GRcWbTvU6H7fxa9Fm0fBxBlNg7VhummZm9srJO9J9AHp+tqBNKxX+PP?=
 =?us-ascii?Q?9a7CJ0AUr9NLNnz/0slIULpnyTH39v4Y8hb9ejG3B56tZdN68B31Wa2milQD?=
 =?us-ascii?Q?S7F43XMLy0R8oqAL2jMaEBeaded2SxOyesZYLpYzYbR3A2EQhZjqw1E0cxRL?=
 =?us-ascii?Q?LX8MFWJCjNnRCUN02G1OBURE5WKJx+Q406/oDMAExNyHsyXihJlt0NEl0CJ/?=
 =?us-ascii?Q?0i5UugCa/Fbf6znl9Els479TawQXU7aiW8gI4nCWiabvQYuuFHAI2BIFkA8k?=
 =?us-ascii?Q?J7Zy7igxcuGlNCZZEQ5vJjBx4eNn+CPsWtm2WWeQcMA0c1LR9gR2qlrZgeww?=
 =?us-ascii?Q?g06K0/RV/49JWWDN+DQhhho8gl9gB/RjxYC2MEgre++Q5dZwer5mQXYS/eGy?=
 =?us-ascii?Q?7IdhwXuTHvhLLhkYIDDvZYgTsW8wpVJMGpDtEIuymgw6HR/fjXQ1T0pF+zp0?=
 =?us-ascii?Q?FCcu/bPf9nfPc6t97QBZZusowPkrKine7FMGU6piChbXk5VCgumpDMoDSFC4?=
 =?us-ascii?Q?bOUZIAwTj+2Cc1lqQdb/gE/YSOu0yT7nL0hmppkzDCjkXMHl1YwzSNOASFyg?=
 =?us-ascii?Q?5Dza7ElNQ+TgmaCvIQMu5FbJxYf2K18gHPmUpyK/b7E6Rdia6Jw9ox9g5nen?=
 =?us-ascii?Q?iEeTq0qL3nBXMJBY96WTxCQsuVLHd2IWhjKkR2Ytm3LEj2qDLYBBUw7iXQnq?=
 =?us-ascii?Q?XWbufh9QGEdCABOiuZqlmrbwQNX1Od0IVbNDrZf7FxPZKlcoDVf1cQcpJWNB?=
 =?us-ascii?Q?XeUVAHgECz/jtAezeinUryTMKYPfIsJ0VtL03PBUtecdCUnIwoF2PEn6iKbQ?=
 =?us-ascii?Q?ecPFNlEh7n12L7vLRYZwGFeWn30DUZCc/U7HnVH9zonE8H7zZDlNNSMW9fny?=
 =?us-ascii?Q?0EKfFQVxOdaXmxj0aESL/yPYz/HrOD7ul0GoFjLDqqrBfX0estLAj38xsZ7a?=
 =?us-ascii?Q?EGEu6mTGkms7jC9Z6Sp4q5XvyjzNJ/VAvQGmCnhOFjJNuysJIXX7FxKloM4m?=
 =?us-ascii?Q?Jxf42erl4l7oIOth0TXqWdPExj5/6+gawfzL/gaIFpfYFu9id9c9e8nQrK3Y?=
 =?us-ascii?Q?tGLsNEt28SU8EI3ms5gto/vO/aaSoq3FSdypXzCIvcrWYpbzGRLT0ICT9AOE?=
 =?us-ascii?Q?DoSGHStI+ivt3wploRhxKPAClavam48+23gIC3VgfAfeywg0c+89B3BHC/eG?=
 =?us-ascii?Q?dvHKJxOfFjQfmdBj5b2VFi0Kn3kSxkwoEXF3P3epZuQ8qcEO7iBuqPDrjXCb?=
 =?us-ascii?Q?ZEu/IWNlUm7+yuJyYeykE2v+A5yQZBg3Km3A0ZyMBf172oa647lthuJZJ1yd?=
 =?us-ascii?Q?6BMe8FZ4PqRlPJD+fmSTAam8//tBq9m+MFGJZRnYb19tzsy4nzL0hFjcS1pL?=
 =?us-ascii?Q?5t9UfcYcNiBRyQd1BRKymArFpP1ZysMxu+Z5tR8Kz7rZkfm8KUfPc39Jv9iN?=
 =?us-ascii?Q?wOx12luaNwq9Z1vK401Mx+UOh0fhtrXkIvcQd8suHuwa1AFUhfBGR3nZxxAq?=
 =?us-ascii?Q?FrNvP3HIPvroLdbglkrwcmu8miLyJX9c4QjyCzFSWS4meGPrLYQgLsJjfVx2?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?sYgNpapnRqdGApDgsQnMxlVwz64L9lsmU2HrkK24E+9Z4j0KcEGnkqpQH76d?=
 =?us-ascii?Q?C1ojchZTYjT6YqDVUFyYt7LfSgZEAsOALqK7jvJMygU4FPybuvqa4w+77FZ2?=
 =?us-ascii?Q?+Kn5/jOIhIYVdPZbDfZzSz3AjwwtG2GsUacx8fDm9q55Al1e07V7TlR8tBZs?=
 =?us-ascii?Q?QWgqFdsmk7WrWiKfCLmwqTDlLhja8yN1e6DOCvy/Baci24xStk/CcFTo9v9F?=
 =?us-ascii?Q?oNKaBoQ4D3wQnDgy92Co0eO3qqFU05NcahRDPxmYoW2N7V7g5OYlePs1PNTH?=
 =?us-ascii?Q?abX3oWShzuHTfDp8TxdxytsIVS7cB3a9+cX6zjgqP1FIIAugSuZISr+xFV5c?=
 =?us-ascii?Q?moTAH5n/zESBXAHXZQSNwXIZSLVOH23Oksav6HXwBvV7VXp7nlbaRyZvu3Hg?=
 =?us-ascii?Q?4Uqf/nZOX0I31gEBQ5/g+bUrxAZ8PKA5jYNLWlon1aIpoOGtTloyz2q0JVP4?=
 =?us-ascii?Q?Pw5dkx3n3ItUv+sxMsjKFpY5GqZblHBmshR/HU6RjPLHjyQ5HAXh7tDv/m4b?=
 =?us-ascii?Q?rn96OssUK3SLlybUchPrTrIWKJmccxj08WHU1yHkLxXLD7bLF1n0TmRN6wMt?=
 =?us-ascii?Q?j9w1Ro2FsGp09/YgaNWlw5nWalqiG0btOh6a+7flpnb0U5Z7jgtGD8wAlOPj?=
 =?us-ascii?Q?mmLfBpzu4UEWLKQIZE7DqrjE+unOtaq5EMUuaSdTSRzazh3Ky674O2QbR8Mz?=
 =?us-ascii?Q?/weZ8ZTLZFR3n/MWdMZ/Q6cnbvjDM9O5eSsKOW/8kkTtV4iAlFxwsjCpTGLl?=
 =?us-ascii?Q?PHSbIekmcezcpcWjE9DBcoOZGUwG/sT5kQhQDwOlwZRg7+Z7Rl9d50F2lIBR?=
 =?us-ascii?Q?AUjG1yxHcsQFQunH8vvx6391ccPO0HTVv4CP1rWfLxDuoGdMQKk8vdUsvZNp?=
 =?us-ascii?Q?KB3+upNDhKOWJvqEubhker82CuI2On5IEPoL2C8kwLZvxvLLU4CPo/YHBf/9?=
 =?us-ascii?Q?xVyrRGQZSy5z2dSX3GQnNgjQTUG64y9XSs8RMKcQQoV52gNlwOJ4gVeSE9Zy?=
 =?us-ascii?Q?LFuBU02JLfbRbHnKSXwGwWjyiwqRdkmoX3k6alzR+XE8coKgV3yzit994Esh?=
 =?us-ascii?Q?vdVLEY/BfjbKJ5CPMAxj/X1vChfrn9cZIqqhe+nRPMnTN7ua2DkBf9Wem1V+?=
 =?us-ascii?Q?k8DYOpPrlQpGGnxqD7T7KGOhDKHRhAELxY96nfFbFT6iUqYDscz82KYFtYXb?=
 =?us-ascii?Q?XQ049PMZJ+FKxBrH8SJ/1yPIfXIDOI5OZ4tlnJK2o4bax/SWji/qs2q0Awvh?=
 =?us-ascii?Q?o3Gd3Lc8NSWP0ioCJor5gfCdKTIZDuvvSPZBPVWhbkRg21J2O7Rhb6SOttVt?=
 =?us-ascii?Q?cgBxtRMGG8S2xPvsSZfsgttbvDVNYaz10qZS11Fj54fiLVlS1HbqJGV+fPAH?=
 =?us-ascii?Q?o8VctRQY5SrUUm0CyEK3NmsOGe1aVZqnV6A1nkky9ehfkvwfUQkIGOpZwPzN?=
 =?us-ascii?Q?DxJzq3TuxbJ+CW7nYKgZqHygmQP3yBrH/o7IHPugldRaEM9skHMkpWzorNQW?=
 =?us-ascii?Q?2mXMWiFpd6ZjKh9dq6ic9oXBH9LwDcf3Fx1+DsPAW6bL/h1Oysc0nlEAwePs?=
 =?us-ascii?Q?9+bhfbqua3yqNMTGxxPTOmC6SmebaJ+4CRsCArsKrIUdihs5uZPDpAUWy8qK?=
 =?us-ascii?Q?EQlYMkgPXqzP/3jGKOYLxE+Dc8+2N7u4QPQRTOym2JVDDfih2Lk8UncIWH3r?=
 =?us-ascii?Q?APKsJubhHGNgOLdkBbT9xU4B8A92LoacWXtaq6Zp6ob0PcQekYiiX1pooS5f?=
 =?us-ascii?Q?T21/ykZogvmT7aNCYNylXm49wPuZa3xEbfCmpquOaXavP1sIPzx3RUvzpTcg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	Jnhz2QqK1XVieQkaAqEMN9UNoYJriQY3Ax7H/uD9h3PRiKo1vVQ4jCr61Pe94/880lefd7ZpISSgn+34DzhKzmAGKALbI3VTGe4H5KLvrJBUeoj61QOArcTernySWxUz1QbdksdDLb4fqj0gocbKErIGMrz7K7QnOvBmIpZAnNmP51FZDIAAStxu5LpDP4FZIhTuN5eVHlvpqZ0vK7o0zqwinzg9OjmNI0wkfyZXfax559DbZKujIM8LzqlXf81yBCWCCieYMNIz2rEjWo8FOCh8zf2f8u+4IujRTJ0V2G13gHe/UWCJTOrFfejzGfOfq0g5Ajp9S61svaYR3ai1oi8NXZURCRTfUXDjo1K/bl+bETqpH5CPNP2k/a0uHMU6+CAYaiMaO1kQPLiaH6HzVDTyuvXx6N0WfX+rxu8ao0SpEkNoIh46t2VvipauSF6uo+j/yDpVQyF7Yg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 976e0b88-23e7-401f-27e8-08db7e6f40a1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 22:20:49.5032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lIW7vX4jia03JK3FjRure0pp1x8aj3CLEVmS9XVo08/JNwuH/lFeb4QGoDIthM07oVmrnrR2bS6vmCQSLQKx5PrSiehBbD3ktaF9rZ/89Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307060195
X-Proofpoint-GUID: MRNAJFvCSBlRTvDTIhXA2ombHc5qVMw-
X-Proofpoint-ORIG-GUID: MRNAJFvCSBlRTvDTIhXA2ombHc5qVMw-
X-Mailman-Approved-At: Fri, 07 Jul 2023 08:57:20 +1000
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
 arch/arm/Kconfig | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 7a27550ff3c1..1a6a6eb48a15 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1645,20 +1645,8 @@ config XIP_DEFLATED_DATA
 	  copied, saving some precious ROM space. A possible drawback is a
 	  slightly longer boot delay.
 
-config KEXEC
-	bool "Kexec system call (EXPERIMENTAL)"
-	depends on (!SMP || PM_SLEEP_SMP)
-	depends on MMU
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-	  It is an ongoing process to be certain the hardware in a machine
-	  is properly shutdown, so do not be surprised if this code does not
-	  initially work for you.
+config ARCH_SUPPORTS_KEXEC
+	def_bool (!SMP || PM_SLEEP_SMP) && MMU
 
 config ATAGS_PROC
 	bool "Export atags in procfs"
@@ -1668,17 +1656,8 @@ config ATAGS_PROC
 	  Should the atags used to boot the kernel be exported in an "atags"
 	  file in procfs. Useful with kexec.
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel (EXPERIMENTAL)"
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec. The crash dump kernel must be compiled to a
-	  memory address not used by the main kernel
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
 config AUTO_ZRELADDR
 	bool "Auto calculation of the decompressed kernel image address" if !ARCH_MULTIPLATFORM
-- 
2.31.1

