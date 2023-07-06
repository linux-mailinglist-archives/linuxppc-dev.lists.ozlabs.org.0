Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 517ED74A768
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:07:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=MgR6R6K4;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=okTOjfdm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxscC1QMNz3c5R
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:07:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=MgR6R6K4;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=okTOjfdm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxrbG5Dgpz30XV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 08:21:14 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366LMXEL032031;
	Thu, 6 Jul 2023 22:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=S06NXtTpAaXkvDL4nDN9EuueIQWuuanLf+AK04JLc4w=;
 b=MgR6R6K45tkVdx6ypO0rbZvIPgMAUF8FS2mIHfpsweBufYzl5NZQdlGTVgm25gDjHbRS
 EuAG5pWqBGSV8nBPFYjc4iGJ1nklloz2FP5CJ9NPwx0acKfC4vw2eIcfISzysQb7rAms
 qJonItFuMXzFF3ExTgiti2P6nihBaj09PrP/JZWZlT0EMbKawoFFD5z2VxRFISgqF+Kc
 Ui7sT/0ICW55LFZVZR8XaexROfWd6izYrmnOgFoeh9GR8jY/UudczXLCmtXPDy0gY8ib
 cvjSJ1dWpLFXgUegbF3MzhHT6k4ZLIu/Mljpg7Obc14BzzR1MkldmdaUaKDgK5Ja8byh Ng== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rp3vy88xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:21:00 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366KXVNX001674;
	Thu, 6 Jul 2023 22:20:58 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjakdnham-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:20:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMyA1C6hYPfP/1g2xOYBHjn0vAs6dK9Zzi2/zRkdXYtUfdYy9PtYFR1gd2/Wdcz/RIJoGeY2K5JjvST7HHuILeBQafepwhtQcDIKsivQCqdhi1vx4Ej31UwZePtmfMdr0ec/VUlpxXtOMqbBCHkaMUTnWJ4zm98BRMsRIjEw1F2hpsHPLCjj0Q4j29+016/8EkHxwkLlix0wDiBggHuEaDfEwfXEFJ5HA3HB1oIh84YQZHsp5DgLWAlD2EFE6DMs8VYGpbFuhYcdYQ6ylq6sWDWzqIk+eTcj7aInr3MYJvZiKns/nCToeo0WkNyOD1dVLUTfnmkHKf6nHjPR4M1pnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S06NXtTpAaXkvDL4nDN9EuueIQWuuanLf+AK04JLc4w=;
 b=cKFaySmTg2rS8niVEiHeIsRHuxzYrGKbq2j3qwQRPLXBeEe92yRjvM6XxfwqtDDHqGWjS3ZScz/J+2TTeOQZBYinnryIoPNUiMwg5Cqcw7+x3lYSMBiUXhnfxIhDda/b3cGJJenz4UeT/iU8bvpbWM3ZZqKmfZNLm+rfE7HkrkT9GH/k+uMvZHUsGxIOX2lAhxErygn2rZkM7pV0eREtZQCe4TB7xZzKTo7OnCEWEInyHVdbolc1kS1S3/v0P4HH1iNBGqS2mDgx5FKW5gb0s7q1+BEy/ihtOXnd7CyuKNt+EnzIjXUIFVeFM+XbQ+xP1joqPvx8COOjYSsyh+7rfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S06NXtTpAaXkvDL4nDN9EuueIQWuuanLf+AK04JLc4w=;
 b=okTOjfdmPeVyLExMAn3UsvXXkXVy5A1HfE6BULgAHI9bWwK5MV7Xage6YPbxhI85JwYmFtXPrt/maJEKh4CCAMUMHLBWp26xs2mHWikhNwQeq98ew97Lxg9OXBQL1GGEZzCKvShbinWAX2gj6sq1rmdA9Xgd/mWlsXjXFrksXrM=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4755.namprd10.prod.outlook.com (2603:10b6:303:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 22:20:55 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 22:20:55 +0000
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
Subject: [PATCH v5 05/13] arm64/kexec: refactor for kernel/Kconfig.kexec
Date: Thu,  6 Jul 2023 18:20:19 -0400
Message-Id: <20230706222027.189117-6-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230706222027.189117-1-eric.devolder@oracle.com>
References: <20230706222027.189117-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0029.namprd05.prod.outlook.com
 (2603:10b6:803:40::42) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO1PR10MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: 72223176-698d-474a-d63a-08db7e6f4404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	l4ei2ZD0i5guUvM9Wwrd76qavVpKGwOSt8Q2YZZXpiPX9hzmPw9+bJiccul3XcF0T262D0Ke/LNqdmlYGSn3N8tFNiPf/xp06Ph9j9J9Bs+6ct+OYf7nym6/L7684F3JxZMVAedFWCqlV561d/xrYS4HXT8BLWuOArFEUBKpLsdij9CRpYcaSoaNlGsgJeWbcRNAjXZVA5n+CeYVMKBHJEAESUKye5Y/mGEyKMT3r8rJcX/TZjdk9Z8clKdVE86Tfh9m4C2gE4Ac15ZyYxdVZFuWvyAUhcu6DAKxAvtpdAfoZqHQI0uKdQbhI6h9e/bhG8/USS/kY+eQCba7+BtT8kj4G6W9qJ17hb5ml9oMfsTGaWW8hHjQ9X3qbYWs1oHJ2VrJdpf5BB2ZZQIr+zbMs5wXAo6FsqmmugCAwzMTqbW+m4sxff8mKaQGhg8afm3XcKFcp6bIfqC5Yn7euG3TL3qSkps3/yXnqsqhwMP6+cw8Hq9M6ojfKrPdEIUwUqUWAqJvasUYd2HMi8ZKzfZtBTd49U0aiNJkdeHqQIPWQdcfOj4rGJ/Stu7iAFjEvS5F9AHQLPNQQnAcvbw97m5ff+MKIOPParCKJa6kLOs7D4s=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(2906002)(2616005)(5660300002)(26005)(7416002)(6506007)(1076003)(7406005)(7366002)(186003)(107886003)(66556008)(41300700001)(921005)(66476007)(6486002)(4326008)(6666004)(316002)(66946007)(83380400001)(6512007)(478600001)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Sh7rNWtP1zyJ0A6RhVUEbxBmZ7r22G7PtMWqgXDKyFOpzrrS0sKKuPUKst2g?=
 =?us-ascii?Q?qp8n6QhSLBv9ZEXC8rDvEg5biKqIPJ7V/TWkE6H81+OBJTV1StIzYWz+DpcC?=
 =?us-ascii?Q?Q+SPxkXxCDJauG2HXSHVEKIk2rnbArMa1EJhBNFRuUAcTyDa9OgD/o+0u194?=
 =?us-ascii?Q?jZptXBIvJy9NeJ/2b1aWjoY02lq8sA1IXZ34GnZEaBoQ1a1PzGsc/pOSNsrE?=
 =?us-ascii?Q?jdqt7QWLhhIignu0XuqZU+45NQOKCZOPZJayu2v0rjygIzq5Tzfd9pM563z+?=
 =?us-ascii?Q?GII3oHBlCJlsMFgS9lZ8UTfjI7i6BVAk9LootXBmtd0rVaKAdBUS5BkdwOw9?=
 =?us-ascii?Q?Fw/xpQzDNvyd9uJ+BH7r2aXYItTTYrwmta9Hk8pdx9g3zjLdCBo/MM6zrp9R?=
 =?us-ascii?Q?kBSH78ANZY94LOSyWEr5V7ReQzoQm5RCpLEa2gEvo6k2jGZZ4cCU2OvJUxW3?=
 =?us-ascii?Q?Mt/ss5Xse8DSczV8ebJ6QpgGAYX+vB0hfNXLHLVnG9FivyLODhdDZgYI7TzC?=
 =?us-ascii?Q?AmWoWlcK2Xv5CN/99GuAeCwvGMqI+7llCy72JTkwbulu5Kj74H/6AHu7dO4y?=
 =?us-ascii?Q?Hl3LOn5wUb++x9QW5cKQa4OWPrSxhzj7Ij0EoRl400ulxNG2XeAHhiggmShr?=
 =?us-ascii?Q?hdi6LmiB/fiOZC5qi8wmKUXO4xwOT6a9DNWSPsmwJDUtXe6YkMuV0sSsjjRO?=
 =?us-ascii?Q?BW7lBY5fb3d5Js8UttUU6LZkFm4lUZxHnDZyIMptyXi6ymNQ5h5UKpxKtoIC?=
 =?us-ascii?Q?+j7bBd7zSaxWbgLQPlUWNes2dlCwhbNDukdcyvTiHQvoFArr96oDQEXu3LPh?=
 =?us-ascii?Q?E8QKuzwDW6dMed55P/4pp7We0qJpd1Am/Y0VT2uNQGF699iEiPt+89fL/Q57?=
 =?us-ascii?Q?JBJKm4MyGdmPeYI972BFVZX/bf5XxmIOfhMnTyUik9i5rZq3kEjrgaE8OV8F?=
 =?us-ascii?Q?OALJhNLaetOHwWimcWKTgknB66lbZr2r45MYcoEu/tR/0NN++sgr0VvfM5gD?=
 =?us-ascii?Q?V0A5lSsQ0DuVcwG8xEzkKfVKFGY0Vbrpt6GaLfrxz1dFhmA7I48tniOipuj8?=
 =?us-ascii?Q?4uwPxiA/gTaTig03oJioa0yvpKs4N6rfM7sufgBbce4asuFnRbxzx6BdZ85g?=
 =?us-ascii?Q?bNE8GZRJt8OHxYTUKIWsihLT1+sVhM8nYlJwqiCA5hBouRoVDREEn/JimPa/?=
 =?us-ascii?Q?/emfOFH1ZsZF0DWQzFMoC+7pZmQolf2t3EobUMf/RYy4jAWNl6/MlUtDT2QG?=
 =?us-ascii?Q?9fSwwMqhbLdw0DUkEFmrto7BfBaJMS8iTvwl6/S8UISP0FOXamZJ8+cRFp9r?=
 =?us-ascii?Q?feMN4PLaP7nkRPXEpDmpBGYHDwoOE/oSvSpc19bbjCt1xoh7FvyeuXMgVwIf?=
 =?us-ascii?Q?MDd08yK6mP4OcCxUvWe4PPt4RLonVkCZ/82B8bMHa8RusUIfmvPLSLgOslSV?=
 =?us-ascii?Q?6X3W/XadmpeKfT+L2JXVxYcABkeyMlBZsFqUQLsmyc3CGprJEGiUlAmkrV5k?=
 =?us-ascii?Q?IM0Rs6rOuszpkLrjgs5NTfNKtrBfubsS3wLMvmsa0GM7jGavxnCyhAmBE7B5?=
 =?us-ascii?Q?0V5o5kKYkQqyKQZqblfjE9PLmEyIkvqW2IHcOFF5l0qG5h4qDPMnergZfnLK?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?GmL4id9bdYI4MYckoXXbkjikz+1Mr6Tb80LgjltrJZpbVd+2DrwLBRaim8dA?=
 =?us-ascii?Q?7zudlJtOmqYQgMoeg+AkBVgMhhanTm86p69ReFHjLnBHHAPDRxtO+hG++g7t?=
 =?us-ascii?Q?u6SNBiVPFHVKQQIS9qxdnhX4nqN1yputnm6fXifWHCxRxZ34cPE4eLaX10n8?=
 =?us-ascii?Q?LT1sLMEul1wptLYQsvNhZcYA+4AJyCC6H1A5zKeVER2OYcSOFB6m9sIk1Z0T?=
 =?us-ascii?Q?Gt5VK5osM8fQvUCmiQroDgjfJi5CUZbHxFZdkEH6Lnmm4Q0eTRAm9ifKMeoi?=
 =?us-ascii?Q?0LTYRZY44XjHOpS3w8bEvrblKswW3oHBnMDz2+qh7GaKQTKdTQcJFknFuZUa?=
 =?us-ascii?Q?9HznQPVfjXfdbyE9zWYkH+SYDY9Sij7elOgC8O6A3o/ZXShMvi1gs3NPs9uV?=
 =?us-ascii?Q?nwe8C+rREkRQW4Iq2Zc4+WXjhcg3pLthjJEf3T8Wm9+1H1dQiQ0k+m2/o4xn?=
 =?us-ascii?Q?UEmYXMgWj494zC7YRiQfp/6ppvi1sSA0JP3iPX9jC2TuAr+NJMjp3qLi/2Vc?=
 =?us-ascii?Q?uaCHQJHULSwoc7DVqQAFbtH+R1OSfFVc3JKe9xgPX/Eev85lL8e39q2zcEto?=
 =?us-ascii?Q?KsGhohGAcEGQDovesqbAWoD6o+tULOPiOCb/NGf/QVLIdSJtRFegkUwqKVPH?=
 =?us-ascii?Q?cWBJnWPVjq2NQWcWS727kEtP9//VZ8on6LUnaQxjbygBbuN99/cP6ahK9lSg?=
 =?us-ascii?Q?QXBteFndQjZRtrJd3/hGLbjjr0pxcXMyTd0aZJUW/Jc5pCgGa6xBfklDQMAt?=
 =?us-ascii?Q?SZP75HZULiMHObnOsb35dsdaHT/XFEsx/JkWWExUTaYHyX151ECUj2K2HofD?=
 =?us-ascii?Q?aKTEHI1Ubr9HRAU6b/hWFfKF+mAMsKx9GG/yJG2l81ryZQC3ZoCAaA1XNe93?=
 =?us-ascii?Q?b54OCOYhsBuJ2ox267KpDUxBJKPbkrI0spYJFGmVrVElmvvZXgcF/6TkVDeN?=
 =?us-ascii?Q?e1hXKGsO3F/L1gmunrr/5d4CEAVujMypEnDSsdXa6Iik2lV3ITFiylNnv/V1?=
 =?us-ascii?Q?sb01S9lEbQqhorvD8IZ+vK3K2b9bcSCDV206Ir63OVNy4BBVzmjTpyHF4lsx?=
 =?us-ascii?Q?JRJZPmWGLLCCUpz1n8Ts7NWUJqkN0ijvhIo7KNOd4FqJb7BslV44ktjLeIHB?=
 =?us-ascii?Q?ZIf48xFcinJTYJEAcjbRtdhvDgjwtntvAPyP3D9o7FH2/i8w6cJxhcqBDb7G?=
 =?us-ascii?Q?u2Lp1RWjG2YD6H2irPMQ/uRNdEYDaEFfjnklds4zO5OmYNmGOlIuWziclA2B?=
 =?us-ascii?Q?ah3x26hfWq14p9Wz598NVqUVpZMYfq0L2VJOYHdJcLWcDBS93Ln7nJDqJNnr?=
 =?us-ascii?Q?NRMX8zyw8/D+TdY6TFwq5ybxhUBJTjxUju6/TZ31fq54WcwFVNK4WrDo3Vsu?=
 =?us-ascii?Q?uPOibvG1HFSi+TwQuo66+ays51gfZD7HUXtV7lFsTdmkJsryey4h/xpL2wSI?=
 =?us-ascii?Q?XWB6+ISnXoGYij1mm8GBsLkWNp3E0nS9ruuUZZO1sfSDExfSOOoc+nSHh0C7?=
 =?us-ascii?Q?BX+QG0y4nQJlCXI4ZKgkYBeycYgWSlyjx8Ny1woBpxjJnbWzUjsGd4XeJMHw?=
 =?us-ascii?Q?ORQIGYyCR8RGtDOXHTQhEOJtHwvR0YxZhES3vldAsY/iLiTv/XzBV7JpMFRS?=
 =?us-ascii?Q?BReGq7cWcK+8Pq/1IUZN2mH4kSNEQ7FNjkmphT7eICCSL9M+q8yijOqxnvNQ?=
 =?us-ascii?Q?JZQtqLQJfcoi/PCnIBORHBvIyTVr/xhe/EYHj4tELfCBqc+j35HMa75grQMm?=
 =?us-ascii?Q?Vlb3U/1j3y3p7zbaDUynJtYCKU8n+Cf5VIx/4HtA89atGB6HfURj72+M1DNN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	88ts5W8NvpT4DxhhfSfvD56yRvnz5qWgisyfZaIS8dwRGtcWHWyfTiu3cNhAw608FL87HNegphoJ5fv8kjYkzTpH8lrbrnJP+oeD04wUcxCm7sIYplP+WdOXHVsWDCIUNl3N1CP8AFbB9sB+fCKQ7HCUMEJa60EEOvfZtQRyG3vxUdZsk46OROi9Z8HKAOLxUMohMRoIncbKsd3rBnhGErObLDA+ycLB+5jtShWq5R6BDOMl3oxMj2JwK/OIXcHN0RgISUlX61Glz21gwYLRXJmbz/5q5RYSBECeFrROPfxMBSM3kjGpHC6Et8aXx1PECk7S8sRGhK+iE6hbUA0cUtvAx3to3YLuGgUAkX92D+WwdCSoUnZuAD8YwM06GprwMdAbcQ+t+4Fp2NR33sAj0L3SnxwB3t1Sh9EIOUuDsyRkxm6GLNtSKn6d61eIS4Sdy+XBXgYYSHFMvQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72223176-698d-474a-d63a-08db7e6f4404
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 22:20:55.3253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBSSjHsBTGBIVMMM2yNKZ53M6S/4DBne7UeJpEvoTP17k87tTuz8dXyQuwyR+u+3L+C3Ue/AnIWPumjMd6DnGWjACUu4owc0TRgMdk0OjQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060195
X-Proofpoint-ORIG-GUID: J6xxJmTVUimbGlGgPSXxJlykrXxp1lub
X-Proofpoint-GUID: J6xxJmTVUimbGlGgPSXxJlykrXxp1lub
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

