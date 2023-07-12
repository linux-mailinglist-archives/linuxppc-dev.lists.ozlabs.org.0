Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6C9751390
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:31:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=M0OvhxlQ;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=H4UZ/2uO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1XXL2GZwz3cWv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 08:31:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=M0OvhxlQ;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=H4UZ/2uO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1NCd2nS6z3bxr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 02:16:29 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEjG2Q010016;
	Wed, 12 Jul 2023 16:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=S06NXtTpAaXkvDL4nDN9EuueIQWuuanLf+AK04JLc4w=;
 b=M0OvhxlQ3OlVxFW3IjK89usSf/uE5IqDoqZPS7R8/GqS8J2jTMZxNh8EPJUd2hFS7HPz
 WnopiZD/Lqh90Wf3c+P78rPLslLNPN3ectZFpflxLtI9mm1NlLoYFaFjL7nCWKUWiD79
 I7mHgogSRkcQ7utLE8vHBykexkHm+mKmZhZdwovETsRrC5kRK3ICK65uU7B6Ex86/TBO
 E0veek3vNPNhWdUVp9dubSA6a6lSchF2A24T40AxIjmw4GotaOKgJ8qBf/VJbuslku7l
 mt4YAPMNbr/XsvsD/zo9mDmkpdIbcdXC/RaFOOWOCcHjqix5H5X3Cfz/1LDJ5NEMWy1M xA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rrjmhd7aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:13 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEuuQl026909;
	Wed, 12 Jul 2023 16:16:13 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rpx86ubjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRrYyM1Fa3eIth70tNwiPXBhevfu0XjYH5/XJItKc6xGncKE0150YK0rOYAt25v0FWorVEUEjiD+0RbME3Xt3W6qvq3nxvdEnBaNTwdZm0A/RTK+Y8sMiJir+ctrbXXiZWJ+8+aURND/kOApJIUmZGbwtwNQXm1/DRLoGB1Bw3Au9xg7PERZvWx0Y12qLMPR259GnBhakP2v2FhmnRgFg7GgunkMWLHU2Pn9MtdspelfVYcQTeiPbEXDwCDBxOWRrCZTLJ/9cb/TuiWRxlkAla0iOv7WZYoYnbL7834DiAQGLXZbO6sePIlqTWyycAu8RnhcpuO6AEx9bm1vAgAmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S06NXtTpAaXkvDL4nDN9EuueIQWuuanLf+AK04JLc4w=;
 b=Xq3Q74LLApqlNOq5f8w70waqXH0/2X8lYFCAWa9jPQmgnlieXPwjtmJbLHY2IO5drdT0zH2ypkqaqcFoEFgPIDNf1uH+YU0xN8uxqYuyXVBkn0/elu0H5VpIcXK6fguAuMMVZ2DWXh2TZOiclYC4Nx/IgH9J9TJMU72LF9Axw0yNalwpxmD90KiXKLUtMtjWZHisocHPji/RCq0zLcz2CZrvytXjhqmU1q0ZE6KGv8bXu+oNF9298YIPgGndmhFwZ9OITPJSTR11scNQbe97/wHacdEKlnKGfHRHbdf5uX8dMtfXSJK2/8D+G0XcjBT3Hicjja5ypkCr8JeJjrodQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S06NXtTpAaXkvDL4nDN9EuueIQWuuanLf+AK04JLc4w=;
 b=H4UZ/2uOvaLiMtVL55z3Ecv8jpVXsAiNZwga7d7nNHOIZjfl26HlJGSZKY/w1vLm9chcjYF1gSQl1ULWjKH9kCSHwcQCUa6FN7Soe4exj8FOyMZ17m2if2n33HDlXMBIwmb7qOPywSptwW0WpEEbuMpZ4FBL7cLzyLVfjL6Wv5s=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH8PR10MB6501.namprd10.prod.outlook.com (2603:10b6:510:22b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 16:16:08 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:16:08 +0000
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
Subject: [PATCH v6 05/14] arm64/kexec: refactor for kernel/Kconfig.kexec
Date: Wed, 12 Jul 2023 12:15:36 -0400
Message-Id: <20230712161545.87870-6-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230712161545.87870-1-eric.devolder@oracle.com>
References: <20230712161545.87870-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:5:335::11) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|PH8PR10MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 989acfd5-25dc-489d-dce9-08db82f34d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	tYFq5U3qc68XFnTSUdMILpEghcoJpxJpHXu9XwlBMQJIMl5t17TROQM4vPlsYoWPUYvXt1NReNB1avJHSVzwIsEX/soEPabrkBc8OPT6fydYR03vUqbz3mDwmyVuzbPrgmR1TKymepmxZGLLBhth7IKSQO2mFdXikcsztx/EUGxE0ER4ObtJyNQjU8Eb4oID/m7bJEYOnq/Fw+0KMAuOrJZ3w2gWwDi1KpEbGMCdG61PQnkQWoa2+qFBJaAXvqbXjhMTf8yuNbnZ4R8dsIw/Y4P3Jv4Frq56J4xe3gmsoYogZeFjyDeWZwOGidE/iRhvEFVgPmMa+9oEsQSG+/lT54FIT4t73OwyXQHzUttvZUqZeAost7DmqVkX0T6ThJFJDqe0EDEJw7fKL41iJkLScYKKQZdbIQAnWJ5Z6SjciHVA7l8YAMltRO9swj5FgWm0PtHAgu3qLKHChdSrdUEU/VDDBHsIRJBC94J7E38o3i1O+sluRVBFz6opcilCMxRCi8G04rVXPsHhVf9OLGkt620uynHG2a+Z+Sqb4Z/t7kDUGwH91f6jUzFd+ELeXQGCnCVbLNOVAkiZsOMx36n1b5h1vtxlWQECh7YntoyUIfc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(38100700002)(478600001)(921005)(4326008)(86362001)(6666004)(66476007)(66556008)(66946007)(6486002)(6512007)(316002)(41300700001)(186003)(83380400001)(2616005)(2906002)(36756003)(8936002)(107886003)(8676002)(7406005)(7366002)(7416002)(5660300002)(26005)(6506007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Gu5k3A8vxY3tdSJ4xRfMnsRWv4+QcQbAz6AUP1CZNuHGnI3mNNtW8H8m40lU?=
 =?us-ascii?Q?OomdO3OcSVFwk7TTD3wXuOQNE2QGshK9umeTUamGQw5kZJn65fqb1vaISApk?=
 =?us-ascii?Q?AEFiPV4r7+43wdi9+6Fyfs7cJLofsE2lAEN6zVO4dBq63i+CGgkLloYlQDDs?=
 =?us-ascii?Q?pcXt0Bke1L/RomP2srCfWpgUvOCs6Uc84ea6t28VAAw1rc0YRNHDjwVQnnTa?=
 =?us-ascii?Q?gdirfAhh261YP5xGwhNFx3iOBUT9uPsCjWJnUzgo2EeObLzHAmvbnBbFqiwQ?=
 =?us-ascii?Q?f3qwPofyu/uRhN389hridx/oRF4bPYAR38plEBnc/WrWYsBD0jvhiojuLqXp?=
 =?us-ascii?Q?GyPkIix1femsN3Ke7suElzwPsCLclD5IU8WxKlGPMDpWSc5JoTx6qgcheasR?=
 =?us-ascii?Q?Yh5pptapHgn/fyQA2U23S7V+BaQD+LUI31Y35VDNtpocHyLZYcasYcs2C6Nb?=
 =?us-ascii?Q?VPe8tuEMkOww3fap6XL0eYytPZSNXN1/QuGUTA8Zu9nZFblD1SI6z+0vY6vI?=
 =?us-ascii?Q?GcAZZgnm0t8XBG8ZLOWXgdtjKq7SSz8xEQ1IDLeNIqFk/MGSuQH5iJ5pnKiD?=
 =?us-ascii?Q?l6qHUMj1fR4NFfp4Lo7AbdzVVWrQn41kjEUhkAasxST+vug8X6Lv8E8bIsvO?=
 =?us-ascii?Q?EeeGB65lfC+zfs5WtaqgA4hcMAdbKZVjW1DtvZmEI7j+m15YDK/lvNeVAELd?=
 =?us-ascii?Q?ZSfObRSUZVKp47vqlw4BLDQSdI5v9tp43B9pOTXN76rM6EHzRmb0RhC6LFoK?=
 =?us-ascii?Q?cAJKR86QgdBCiXBbHd2iI1E/47P8gdV1KQuyS8/kUk/73ZhL3ep7sPxLHjxt?=
 =?us-ascii?Q?JJXcQvJJemK0rHaa6rqdHmigKzKlWis7KN7XOWZolvW4tPZxs3VAbZ1st7aB?=
 =?us-ascii?Q?MiPMoxGgKvfo2l0br9vS9iLALCPv5mf4j1ytp5KaheGHx0+BCvJis+O/RXcU?=
 =?us-ascii?Q?G/ycR3XMYQTA/aop4ba59l2jyRL4uYjgSjab6L/6d0bTrhM9+Amb01LMD2uI?=
 =?us-ascii?Q?sevlP86erA6abcnVuAImHzfve0hr/GnDJd5UyhWdaGpWoDDPcuGeU1jKowd7?=
 =?us-ascii?Q?rkT0xf27KtWKQEVXvgyGtRkY1/fhQXDKqZt+Z3mCMy8b9u4cgm15LNsLv9Xw?=
 =?us-ascii?Q?d3Hfs0BMDXo6FCd0ReprusG/fd07xddRjmktFyVnRRAKiciz5dS6PfcMgKLs?=
 =?us-ascii?Q?3iK/55DQDkczWxzgB7v9QULmQLpomJAg0byN4+9hlEPpQ+9C+XDlf+j/1uSW?=
 =?us-ascii?Q?Duj7DWjKuNHQ9VqhuqzYfrZ5BLKphSGXco1xxXxwUW8ftDLc0ELGJYZEx00L?=
 =?us-ascii?Q?vCS4RLijJBX8ji4RFujWgsv5eCoQiDiRbuUFQoWpBYLCXaVuIBHNTGzcksMj?=
 =?us-ascii?Q?RXcu91TBqkQmiZ3CuFFl4jWcz50Miy7QAegtTFeDyo325n7GIVhGGNC1AtBe?=
 =?us-ascii?Q?bNgMkNOsfgdGl+PZaoNuOZDEgWW7lztk02IXBNOQp3iYK4iXR/xGsdu6YBM5?=
 =?us-ascii?Q?ViVlhWIz8W0lRXDD+VPiGSjrOKNn7fnA6QXOMmNsJJRzecwdtqv2mby2Ms/2?=
 =?us-ascii?Q?b/4KJivdGAAqmkyCOzYwXVnzQNCici5ZCc6Y01lBqRZ+EN6nLA+PnnO6TMBu?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?0/PiFjAbcoJuG4U0xojQv9Ak0lo+1iTdnZE1pJlEur/Ub0DdvvwlkMOrUoyv?=
 =?us-ascii?Q?zqLQZw4u9GmTguTaPECU5e4XDZMXhAZmUBjEzMVN0eSPXDk8MeaNBhSIsRO0?=
 =?us-ascii?Q?5KA/BShVL7eWN8JnTvze12KJZncu+N0HXcjx0vityIZOz+28rnY1mh1LlePa?=
 =?us-ascii?Q?w0425uEFvNK9Fozoa5R0zra5ZRYGy5YqFH/w4HeyO3OEFyH7v8qDKBN6pDhp?=
 =?us-ascii?Q?x1BwPih+H0E8/WyrCoDIt2Li93E81tcDrdfYj9Me14uRwjWXtciYuTk0SDlP?=
 =?us-ascii?Q?22Cu9pV0xYxU9faLzU64/XyD+8KahnN5mTEV4pcCcB6RCNcPDaX+qmTThLas?=
 =?us-ascii?Q?tP7tS87j4+4ERvFt3IO1r3GOrF8/+GNGlfUPdTgYuwzKSpcs0x/sHm1nF3/O?=
 =?us-ascii?Q?BQ1U2yzSSKE1yTPbzq7EKwjONqNE7hyLd3OnNo/hVvPrVA1VPKkHggSOnlXu?=
 =?us-ascii?Q?EHnSeCQYjv7REfqUa/posM/Xo20BbhkMRDV43M64CxlKgi31NIfApNP1tMWs?=
 =?us-ascii?Q?Jta06mKDq7BjZ/fGjs6C5u3cx+MBxU3y0h+unL1wwQ+D53B0s6V2ZqE2K0c2?=
 =?us-ascii?Q?aRlU1THXSVvQoMp5enXzco2bFz6Edb7xKC8hy+ntg5aDFOdb5WImHNBxjalw?=
 =?us-ascii?Q?iuEzw64ozqxcfWAvToZfYcvJcsV9hPwKv5aY4EQTY3m95CE+DkwCsq+Q1RIB?=
 =?us-ascii?Q?If7M08Xz5dSuB2yNMZYbb0WsztnCnhQYxbJOaPH2MJGvBw8GFjJo3Z6sEi7a?=
 =?us-ascii?Q?Efn63h3QxO5TD1h7qIfoTGZ9sSmd5z0jdQt/LP4EmDRnvPja6Xcet3aNRPhA?=
 =?us-ascii?Q?NJpnL7NyaTn4ZchlTpW6Zbl/hQhW+7ai7jErzQyJjEuYMwDTmmqUgW/ywjbk?=
 =?us-ascii?Q?1hnYK0ZDhAZqsOy5UA2QZikQV8xjyJnccS20x4DWpXnwPPBToZiryS3uUhZp?=
 =?us-ascii?Q?RgzuDxLacmwkKDNgjqZ7hEpBeHyA15fUdblyFKAck81x+2PqDDrRdCPZvsP9?=
 =?us-ascii?Q?83n//lSb733aHT4ZjgSUOUE5QMmDiLN1RgMtU+aI1c1ZDiMF37lH2dmOn+Mv?=
 =?us-ascii?Q?VuDQ6DQgJqwm39I1H4XAZTtbxS9Cft15eEly9QgkyFTYcTlLJ9Ci/nfnyeHc?=
 =?us-ascii?Q?tVTglcVFH/cEs42kbejZHUAn9moWWo8cHntcHWMo9bChF9ZFgt8gTluRcWDy?=
 =?us-ascii?Q?Lk4OtdkOe6u/xdRLIHCP4uOVUC7hG3nkRDqYK9VBkvxSxqOyzttQtonEkYyI?=
 =?us-ascii?Q?iMVqHy3fPsx2dU9I4k3eLbpPMSDUo0QLnDtlex9UbyTeHLD8n1gPBwJB5sv7?=
 =?us-ascii?Q?IyTjrJW/e6J2BJSbIckTLDSjswQ+jtVs67JuXe3S/DhYlAZZHlV31JpP/iCP?=
 =?us-ascii?Q?Ro4vWG8erpQErzlsBaH0h8mdVp3ryoM6rACESieI+3zf1xrGxMdyDMmMF7hj?=
 =?us-ascii?Q?2pQpOyHevHQBu9LZTlCU9DFqZojkx7IYgu4UrAlw+eqJ6OGlU2d4Bajz8JOn?=
 =?us-ascii?Q?xWafLHzTOCpOY/JDFHrRRnv6JvjnWvZTzGnOh3z/alhTE3IndxItC0FmJAbG?=
 =?us-ascii?Q?DigI9OKX3Z+HHRrucfDEwL8Grs6X0FO5IjMlFCGyURvLsEQQDgWtxmF60vW3?=
 =?us-ascii?Q?3RZyBf+OvY4hnB7f2hvN52JIJ759Bar7el7AW43feGXwBnxv2BmVFq9a2oXO?=
 =?us-ascii?Q?slSTLSqfge+EzyGPyodjgzwLZIuuMJsNq1CoeoolV2QONN2rqfmnLLxzNrV+?=
 =?us-ascii?Q?eZxg2k33xAPyoLf6g5GUfd8/djHLpklysq4s5C5nzJ0hg0+UUi3xTi8qUJCw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	HrEniiCK7ZNxpIUIV2FydlWhxyG+LBvMTpzDZLTK+cwC8jb7dwFUB3vBb854RUZBx/bJ2Mmuvuz8Vp8zexDp4YwX3gUx0zPhkxl7nnS8tEIZRmMPxeRsvmUN6GiAiMv2yU2RBdANGU43u+3HQogUmKs3A2nsXBjxC43tOLtyzhMkOOHqks1SS1kGXeBcESMEqQYI2DbLnUjSbwE7ow/nVGw6dUOdG5ubkh7ML5nY9pUFoEX58sFWtS92/rPB3BZJHuS52N9oPsGseNW3eU3tGCEMzeNOgvC9Acf7gNUOyJYqyWuaRndhLaXmdQRQc9LzBkEuImmUEP7ltZggYJrbNb5iqOeFH45zrXBcviMnKHCsFYc4TWBy58AXdHzHc3bVg1VsHI+tEEhQE5s+P2XkCVLegc7X/GhMkBhSkvgTmC7/apwUN7gJKESsGBdnAZ606/phqqlfQlVn5g==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989acfd5-25dc-489d-dce9-08db82f34d0a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:16:08.6617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oh6udtyvSk0XXQtg5wis/GdocsagsE5bT9srO25cwFDfJ2sQxxUAA8PeJGV+d1MNV6rh4wDD4CeHMJ9+l4+/C/MJCVCiVeawhVCNFvkbWRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6501
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_11,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307120146
X-Proofpoint-ORIG-GUID: xx-9JcLr-n2xBKVK9HmXprQe1ENSpoJ7
X-Proofpoint-GUID: xx-9JcLr-n2xBKVK9HmXprQe1ENSpoJ7
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
 arch/arm64/Kconfig | 64 ++++++++++++----------------------------------
 1 file changed, 16 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7856c3a3e35a..3a9b06a693a9 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1459,60 +1459,28 @@ config PARAVIRT_TIME_ACCOUNTING
 
 	  If in doubt, say N here.
 
-config KEXEC
-	depends on PM_SLEEP_SMP
-	select KEXEC_CORE
-	bool "kexec system call"
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	select HAVE_IMA_KEXEC if IMA
-	help
-	  This is new version of kexec system call. This system call is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
+config ARCH_SUPPORTS_KEXEC
+	def_bool PM_SLEEP_SMP
 
-config KEXEC_SIG
-	bool "Verify kernel signature during kexec_file_load() syscall"
-	depends on KEXEC_FILE
-	help
-	  Select this option to verify a signature with loaded kernel
-	  image. If configured, any attempt of loading a image without
-	  valid signature will fail.
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool y
 
-	  In addition to that option, you need to enable signature
-	  verification for the corresponding kernel image type being
-	  loaded in order for this to work.
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
+	select HAVE_IMA_KEXEC if IMA
 
-config KEXEC_IMAGE_VERIFY_SIG
-	bool "Enable Image signature verification support"
-	default y
-	depends on KEXEC_SIG
-	depends on EFI && SIGNED_PE_FILE_VERIFICATION
-	help
-	  Enable Image signature verification support.
+config ARCH_SUPPORTS_KEXEC_SIG
+	def_bool y
 
-comment "Support for PE file signature verification disabled"
-	depends on KEXEC_SIG
-	depends on !EFI || !SIGNED_PE_FILE_VERIFICATION
+config ARCH_SUPPORTS_KEXEC_IMAGE_VERIFY_SIG
+	def_bool y
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel"
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec.
+config ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
+	def_bool y
 
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
 config TRANS_TABLE
 	def_bool y
-- 
2.31.1

