Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF62972D00C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 22:02:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=w4VdAhrT;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nOmmZEdh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg2ds68rRz30h7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:02:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=w4VdAhrT;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nOmmZEdh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg06L6PPbz2yKy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 04:08:10 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CHNoti004950;
	Mon, 12 Jun 2023 17:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=9qqaquY260E0K0tiV0mRC1lnR5SUtRUOBVJ8GYlpPpw=;
 b=w4VdAhrTbLVyGBuC8FE3WIVZsUd+W/N0fEo5Lk3+hLEQUJc/KLmy8v9dXGyoTFMgKZb+
 X7chlHUlywKdv8XZFNjXgPuiux9vKggOdZslG/ICWfG0epNZfCpiAw7KXo2beGqvjg2p
 LIVbgwbs08RZT7IzHTZaurqozuUHsm6XbBqPvGOvQtDhSyK370k9NLtqw8OujJQQLruj
 ErBhpUXp0E2i7t7wxEV5CxaXf3vBQJKbD3gniAnUBfgeLaZ/sJ/x4Dt6LSUtOzJWkDaz
 jJGz17+llLcqAjxlZLfRaIDsLfFavKx91CuFnVcNLNDuEZy7MqBy8+Uz9pqXgF5QFDTI NQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4fy3bfuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:38 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35CGJxdb016254;
	Mon, 12 Jun 2023 17:28:38 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm32y8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7sRJ2l0ARrvjUz6wnzWvJabbg/GBFSldNi4rsHcAKAdJ9Bg5YhtiGDVrqZ+EP/kyBv2nZaeynPAG9xMtON6wAKD5xDpNxBhcLx4HeY6uMQOSSXZdyL550fpXVJGTsC4XArnp6VsCCMaTGsf0MyRtevi2w2Qdv0mWDiClaeTk7tEY/zLzKWAnXGJZrc/8BwNnLLQeH6P8YnyjmQ08Uzm+1PUQaHpzfpHGf6Nw05XfEEbu4d48X6wkx8WYnzvdB6Hgp6Swgv259YTDjH+H6F7ppY09T8DnQKAufdbikG2IayjItzHeHxDUxzwteyS5zUA5hrpfcnyklEleqxNWqArmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qqaquY260E0K0tiV0mRC1lnR5SUtRUOBVJ8GYlpPpw=;
 b=N/OX0GGu8+Sl2V/jVhPSE8EGIkJZOEGjdEFL5ZaScg1HEDKSVzfIf9gUZfR8WXPXfjELeZW8yqW2LrfpeIpH+4QzW4+DazBot/QP/hraPFQVlmzxSYdFTlEKXmHxCMIRmI4JC6QA2YLnYcGiAkvvRd7rZgSc7wewYzzAc15HdPIjHVPFZVdEop/6bSDT9SHJ4Ks/hQoLDfIpRNIMWIRUumPXW3gLW3/89ZI7WTgM9pX5m+oxOi+cP2n61egFYFyB8wbWiyvJ+7ANRlL6CU0OZcGQLSsXaof41REAVLVstT5mQZ0J/Y8oJTzeevJpg8G+BQOBMY2AKv4XakIs5RRtiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qqaquY260E0K0tiV0mRC1lnR5SUtRUOBVJ8GYlpPpw=;
 b=nOmmZEdh+SWdbL1JNEk+vNi3ZstIlDj3Tlg0KWKIAqe5IfJxQn2jkeBF1MnBFtmSYqfzr64OEb5FkjnJs8qbG6u6ostsSb5XaJZOffLBt7hAgR1l4mGrp6VFPXQkkq0CZMMgyL/QmgTmNJ2XyVL40qZUFmhiKdAVLWWN66mg298=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DS0PR10MB6975.namprd10.prod.outlook.com (2603:10b6:8:146::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 17:28:20 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 17:28:20 +0000
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
Subject: [PATCH v1 02/21] x86/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 12 Jun 2023 13:27:54 -0400
Message-Id: <20230612172805.681179-3-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230612172805.681179-1-eric.devolder@oracle.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7P222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::22) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DS0PR10MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: 983c0b86-5594-4d9a-0aa2-08db6b6a6ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5D7tGerNEOHco0ER1rjjN5jXFMVs6GqnI6oCy5nvsfZd2kl4z4E9F55h2JV3HnNcWtiXCAAAaw37y4vpcTVhnhVTJerZ+INxywmYKC4X6d0FBA2GyWOAOvkeyaJnkopMvOG3E4VaUB1X6Z5w7q2YB6BV2Dn+XJ4NPW1NqN6sS0/hKXFNI7qAc9P4U/yEuv2RO0LoonSSnMcQpLmYfvChWe8k0aDPGQeNDPGt6C6VavgHfdY3UdpaH5qIaOhCA7I8zt6ukMyb+p+gvne6awQxXgsY9lUBj28lQFlKiy0Ro6CxTQmauodPp16QVWp5bTuvrglsqt37YwvS5lchsJZgz65JiZfUPpTseiFCFbzlClxelIRggNh2U43Nw4LZPyNvBBxNxc9rWYBcShNqWWHvI89/yTgBDiwOxDYn6EJ31rf6ub82spZaW2uYWNk5SiUvi67V1u9Bq3ZmHi/axpZkbiC7vvuOLUiHewxsfdwqWtVJfmnVcWqtovXG0LFnI2A3zkzW8F4ulKbKLpmpHputbRzazrqD6ea00lA+4uU4do4O11XVkER929V4w59PRRVhCcjFscCWnDf5YK9NH8lkCWVQ5fiHYTgAqpGctpvvZMQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199021)(6486002)(316002)(41300700001)(2616005)(83380400001)(86362001)(186003)(6512007)(6506007)(1076003)(7366002)(7406005)(7416002)(26005)(2906002)(107886003)(921005)(38100700002)(36756003)(5660300002)(8936002)(8676002)(66476007)(66556008)(66946007)(478600001)(4326008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?V0h5SXGxYC5ro1LOYqKHyblHUwrHis2FqaOLVAda5mirUsG07dgO3px5/wC9?=
 =?us-ascii?Q?y94JMJIQ+GYYk6z2iYUfmV9fH2vRQLLASCO3qUxyj/RwDQWR6JEItbdRS6nT?=
 =?us-ascii?Q?IuZ+BZJLl/tSKjcQJK1pdnZkw3AtIvAaL+nVvWG2k/IqmXI6SV+9JAg8zJRD?=
 =?us-ascii?Q?Pha6OEDt1aaj/TvALS5jjU3J211iE9RP42EIUu6byxBy79MrMiLsGbw7BTVN?=
 =?us-ascii?Q?veg8BDc359UM00csazkVIB4/9v400FsQx/k0by0W3pAAMhjr2ZSJKX6pj2+z?=
 =?us-ascii?Q?d4YLhTJ17nSaPL2Y8iT13+YqdirOvEP9ivo6XpmeiieYtyX/KwO76BqeHXGp?=
 =?us-ascii?Q?Tb1SUeVZpnDXT4iG09iqB5RIWSKkbesNTSgtWunACJFZ+n0MOx2tLGBVIYkI?=
 =?us-ascii?Q?UNUVe/sRcn9+LIj0p1Rios6dl/1XZinEVev0RyEwM7/Z/vhmsRo0TGtlhL9V?=
 =?us-ascii?Q?hlt85LaYRgKuibNyf6VqEz88dK6b3lEMSFbv19bMA/eQ+/b3nH9hl7CdwzCg?=
 =?us-ascii?Q?AOoynk5zWwEBtQCb/spSDHp/Dn/IucRfoPNY9y6yBjQ5Mm65IxJJ9OBoSIqI?=
 =?us-ascii?Q?lHVmliJ+3ihtd2jxm81Oul+lCqmLbaYESuWIEW5LmqJCaL2U2sy3JITrsS3j?=
 =?us-ascii?Q?OlxWa1QelZgybnn61UtYkPDm6RaklpeqFRxSqGATCqevpZTWdMN7IhUsPjFB?=
 =?us-ascii?Q?F3PDKpiVelR09LxXtSYLBFuUQMT2SA8zT7FZMwXqq0GC9x2hCEJTT9NoRsB/?=
 =?us-ascii?Q?h5/noFzN0fMoIilV+nZmuQNPRFtxw+RZ8YTNh6GVMkDCm759OrQLtVElJkc2?=
 =?us-ascii?Q?r7pb4jOePJRf/6XUf4zQee2WV7kfwX1PCmYqvZNvzTBpR4Yfu8rGmBMekuLO?=
 =?us-ascii?Q?U/6l3+NU3GWWaJBiMOEWE4yOQL2d+XhiERjmifN2o/0SEnKseqMwf6PFeUT+?=
 =?us-ascii?Q?gcbcgCb7/Ahpj1gSUXoo78QN+tkzOkpBU2MZWPT1AqvxCEtdgU1hdkweO+Hy?=
 =?us-ascii?Q?1muwsCGygXm99gNSWFH8eNoTSolNHKoGOPnrWkG/IqLQBflMm/A3xsiUF5ct?=
 =?us-ascii?Q?S3AFe2fgsfsjnURcVI+WpD1Nky/6xMwC9+N3S16dQ9D/xnF9ggra5BR9CVw9?=
 =?us-ascii?Q?/F2uLHOzIwOx0XDTA8P+qPpcK6y/UXi9PNwmyJgmUUMXnjOiRSBe/sV80iFC?=
 =?us-ascii?Q?X3sLduxrQZumidNDpzSfJXt6u9KvhNkzxfEl7hk+TZPkTUWRuZOBy454asn8?=
 =?us-ascii?Q?/26+y+N951TKnDIYm6iSoTlFonHWbDjZcQNfG8cE2fpMWzfOcY8BN11/FEVm?=
 =?us-ascii?Q?omVRTNBTpLRKi7O0g3uZ4B5mLZ2DBkkxoScbLgTsQjKGHyOaRwMzaXCoKNCp?=
 =?us-ascii?Q?8QFdNIkQV9m/ojpLkRP5tHwa58+7RDW1hEvnEC72zQCWJOvUmoGTMjKg36hX?=
 =?us-ascii?Q?Ik10BtyZz9/0UOL5NyOoiF5w/54Rzf+wX5o1jlAjvJzVv3xJmZU/Mya84hLm?=
 =?us-ascii?Q?pO4mDLlLDT7MM/bTx3KM2Le/86MMQKNcH1HxbZcPuEXLjA6tku+n0HbLJw84?=
 =?us-ascii?Q?xTnn6egpmcEj/jUBlS21LymVx1URIt/GEJgtjOuNWNDdwE+Pt+8nFSd4LV9t?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?vkQ8DeHjoTKaKVZYCFnSEcBzBPutTAhL3ZiVIKwKaCmsIBxS+e2+xY2llU93?=
 =?us-ascii?Q?LlXyPST5MA6E0CrwICFYg3KZPa1vHX0mutlPSUiiXrDSNRtfziWItCDuunFo?=
 =?us-ascii?Q?INmfw0xGfdGCwkkFgy2OdezpVITIAW7lmdg7pxANscl4nBNKCrYWMsUtFhZj?=
 =?us-ascii?Q?LxQpIdiLVZdyy5w6VCSbZU8p5rEhdv8U9Jbsr4hiV9YzF2lcEs+cvj+lUnaY?=
 =?us-ascii?Q?Jl58Qr+1dT3X0XxN87g6QqQik6+wzMdj6VyW/xUHjQT2bqkAqWLPpvRwhclp?=
 =?us-ascii?Q?3U9GqOvczyViHwZm06up9xW/zlxEblLP/BF4zODKh26ABXQEu3rDvkBkCH1N?=
 =?us-ascii?Q?WbiEdkvxYnSov5d8RrCVhbR3qEnFUdYmZ0eUfjr0oAI2jZKSaZZEqXfGwhb4?=
 =?us-ascii?Q?vHjNW58rZ0q1p/IrOaeW4jyEmP8hzvrK5X8vICtbZJjI/qdtd4UOunfzudZU?=
 =?us-ascii?Q?rHpPQIjumo+UfHapvdTCT74n4V+tf8muXmsVUyVwUNi8GyKqS3Wk/A5wgpHu?=
 =?us-ascii?Q?8mSPz0KIHTBXSd1GnrGMGgL0HL7YqaC2UuB7tAnnR6OMLqXNEBubktc20ikg?=
 =?us-ascii?Q?3jHVhRcLoBQGIJb+ZIR2sZg3g+c3Jqf2kIJE+sSRHUt8C+izzXmhYI8GP5il?=
 =?us-ascii?Q?axy4x3t74clN20qSKhC64JlNfqRUSnZ3umxA5WGMN/oNUhcTdKRvC8w9Gust?=
 =?us-ascii?Q?tEB9ulwjMOScV20GeFOWdcWdfFjQzdixDyptTa/p5VVmjybjyd4ZH0QRSG0z?=
 =?us-ascii?Q?eC9BKKP/Bon4WCgpSi2DsLSN3iixbvFmd8HrauqHOKraKhmdqBigo99vQqRl?=
 =?us-ascii?Q?0k96cLhH8/Lw31noLtySrdvJgTF3iPPNk//E96Y8TVL+ks+Fpozr/umHoY2/?=
 =?us-ascii?Q?BdPRlIgYm6+eYRzgSXX4wFjGLx6V9l3mqQNO8HmvlgoBtxjyGHjbktAdbIE9?=
 =?us-ascii?Q?8JJ/rzJgEiQn+4xpiT/V1Sy5y8aOw/g/0FYoTN0Ew7uXp/4kBM5I+iy2+wIH?=
 =?us-ascii?Q?upU4OjkaAML8HY0iF9KLY+vbPzK+UUoXWbNRMOlYNJHCEMurUUkFpmw6qo7X?=
 =?us-ascii?Q?WZtP5e6/B8uGBWoWPrO5FTwOm7cBR+Mvt2mpSTK6y1lfxEVaoJgCeE/MWH1O?=
 =?us-ascii?Q?FTVS3zJfGzMwuNB21Qhtvs/bISBWihlmSN7pkEYuO83WmgxNhl34ipdFZazU?=
 =?us-ascii?Q?sBtpJNd1Af5f6OfzKX0LMHbE3YBUTCDTtaT3BAlT42mjMBy2vDldBrZ8i1R/?=
 =?us-ascii?Q?ivrGmicuhveHwG8xow/BMNuIxxkAc1Il+9I1bWBJtsG4Ar/e836leBEOu6OM?=
 =?us-ascii?Q?zlfoAMUxt70Wy3/fPSyBJalT837Gh8Ne5TVrDEzEc9pxjr6bALFNa5rc/cTK?=
 =?us-ascii?Q?ZBM68WVVrn16qyJX+foqNBz9kxEqs4eWT5ge2EIrrE2Rv2dxGWnaIJ8vWgG8?=
 =?us-ascii?Q?H8Fe+mjoDyu1F2Z2lQjlI7d27L2G8JVTKiXYeqd/i4WLzJfGQBmORsXStuZP?=
 =?us-ascii?Q?+E9ym3tYGDtsu3CXityhXukRt+zWSSxCexTPC2E5+5y/HKwCVnkH+TaYJ47/?=
 =?us-ascii?Q?gQwGbuP4aoqhFEdfVOpyRgJ/Bn0QP3YDwri0iPli6fgKr6+8wDk3MzJBJLyj?=
 =?us-ascii?Q?77WCzcjnmAhLOy/ncZbx6zCJymRvX+3dNcrYvZzV6XopiEUohj7xEsINJ+4/?=
 =?us-ascii?Q?0YR80gBt7fvSko8/H5NdtgeWQsxDXYrBQjUHqxcnxbNoV6ijlFwAemXu/LHH?=
 =?us-ascii?Q?Zst/bXl+Mz5Jjpb+wifttkrtRCq4F21UkuL4YIKoTgvyCQJTCiIIXzMccOj4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	8TK9+FsOQyDhaMyxjkO7+1QLRAANlDG2usEJ9M02PQY9QVuvMOXWxIj3oJp9DC1lp+Obk75B+tPxV+HSn0tn50Zx0E9r2fLyE1Pc+K3XyZpISEDJY4IGdgwpY6OkMM7tTLyUFJqksfe1jWMPdNXKVV0OQ5mXw178jUBGRGZ0OXATxmskfWUmTi8dqGj0ICpT0L9jwBHyj4R9/dWj4jLVMtirIyuDH83H9mA0gcffCMbw6pTK5Gx/H8FYxbmhFSbgCdqJWipB1e3V311f2u8O7Mlg+XYmS1N9lMGwV0xis4inMwaeOCb1eMO+R2r4Ywor8Jo2GTfY2hAx+o0WdCjeLWdaa+ZcAHnJGnG7yrLSWO73QaKg8TAiOHHKSwvJCm0VdFZuqsEA73hj5NWopaMQAlRVzAxPEymS7yUHPbRMXWYozfPZGJnzOVHWh30BLOwyiTrv82RxEd38Vw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983c0b86-5594-4d9a-0aa2-08db6b6a6ab8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 17:28:20.6112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MuUqv3MhS1OaFx24kQ9ijPxQ+GzqndfcziqjxkkGWw0QYQj52zKPlZq77Mh2YLqVxq2kKpzt0p8IKw79eJVWfPTwu45DMppRhlud1QJclcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6975
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_12,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306120152
X-Proofpoint-GUID: HkwJZFrbue3spb0EED2kVck0rtx5_vMy
X-Proofpoint-ORIG-GUID: HkwJZFrbue3spb0EED2kVck0rtx5_vMy
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
 arch/x86/Kconfig | 89 +++++++-----------------------------------------
 1 file changed, 13 insertions(+), 76 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 53bab123a8ee..7dff2481abe0 100644
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
+config ARCH_HAS_KEXEC
+	def_bool y
 
-config ARCH_HAS_KEXEC_PURGATORY
-	def_bool KEXEC_FILE
+config ARCH_HAS_KEXEC_FILE
+	def_bool X86_64 && CRYPTO && CRYPTO_SHA256
 
-config KEXEC_SIG
-	bool "Verify kernel signature during kexec_file_load() syscall"
+config ARCH_SUPPORTS_KEXEC_FILE
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
+config ARCH_HAS_KEXEC_JUMP
+	def_bool y
 
-config KEXEC_JUMP
-	bool "kexec jump"
-	depends on KEXEC && HIBERNATION
-	help
-	  Jump between original kernel and kexeced kernel and invoke
-	  code in physical address mode via KEXEC
+config ARCH_HAS_CRASH_DUMP
+	def_bool X86_64 || (X86_32 && HIGHMEM)
 
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)
-- 
2.31.1

