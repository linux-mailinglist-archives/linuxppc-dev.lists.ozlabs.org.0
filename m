Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9687736019
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 01:22:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=VgsTAokj;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Sb7mq0nh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlQmK4nNJz30fy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:22:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=VgsTAokj;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Sb7mq0nh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlCbD3nWgz30XP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:59:20 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J9nT8x004744;
	Mon, 19 Jun 2023 14:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=YNDNDDgTUsyPXRQgSEG+d1UNHHXH2zOv0zQdKf3/Jyk=;
 b=VgsTAokjOVqccCtWaChEPgvQ0vI7Tw37BweJ3NhJaQvvE9RZJIB5wjHi73Sd6mUUrqZL
 la8tsylsWoTHKl+4iJn5324bB5Byi4PLBg6eW03mGttnmBndLVqTUV67a6VQ3iAwmx5M
 YtHoQqpG/4xmmOAdWJ7guJzN4wwVzc7hPWRgOrEXsIOK5mgevRFG5rixKdq1+zNFS3ug
 kQeycRB1tOQ4LICTQlY0t4V1gDlTSNxXh2LgUIhq5x60P3GCTT9sIa018zOPybwxnAsQ
 Lf5QDmGPMbjdfW4eg3xRoIa5D9J6a8uOdWv7XYcm5tSy4mIJtdPr5Rjx+V/QDy8HQyUn EA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r938djwbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:59:03 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35JEXvUP008354;
	Mon, 19 Jun 2023 14:58:51 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r9393spd8-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0ixDn62D7g5t7BzTTEi1J5PrgYydJF2ZuMSsy/LyqKRw1CObCt8nootEhr++Ux7lTAfoeb46AM/4JRHv8M2UYR/PUfVTvVYZcNLETm3RpZBHLmCOIcoeFeI29YBH7iK1wE1/2aJO8BzU9Et9Jscw305K1SDwsDb+Lv9KiuLGmItPgb+wgNRBCuzpbcsbqjAv4RPAbOlsXmhX54qinP/L2XXrlMO0rJwwYAG/PxrQ1jSu2GYOkD2N3K7MPOdRoQqlU7SqUHUnDk/qZVnV6OOYRR6pMhTL+zqMbYcOS60ARIzW3CQef4HsmO+Ur6GIm/ETEyjBC4Avjtp11sHJ52ERg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNDNDDgTUsyPXRQgSEG+d1UNHHXH2zOv0zQdKf3/Jyk=;
 b=mGsDiKM1PllCxpRO5iJag7iKg3UTSs5mNJ+3m0E9UUTM/03oZpYXxNhtanQ0pc5N59+NMoY6ZeILYz6wQbG+gjygwafjMgakrxPM9A1LBQgk0aMxPxgZO5GkJojqPsWZbzyUBtMDl6O55grwOmlN47AwX8lrdoUHg9sa0pZCxbeBakI09a4owirCLmhxTzYcCnpQw34Dc8tMs4vCyqjaEjmz8dt6Aj7kRTbKA5rnehPjXjEZkZGQCgxzDANQHOwqQDsRcd0H2pz+4QXDMqxcWknL4hupf/8BraKQhSGmZrMccuLmUnEu8v7bdNmeX71mWGzzr+y2wQF4aRYzgrFVwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNDNDDgTUsyPXRQgSEG+d1UNHHXH2zOv0zQdKf3/Jyk=;
 b=Sb7mq0nhBq3kUEpK3JvgecnVeuKhsEREyzjQHBPhqSnCo67KFysbS8IvBTVf9XaCV87sXzFNxnEtEj95zDysuwlr0SXH9ib+P4W66B9LJLLoDaIYuoohsSyM9EhYlKdOnqnGtRm5+HFlUgU05IYrlEA6RBrWonhGV/vTY7/S++0=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM4PR10MB7426.namprd10.prod.outlook.com (2603:10b6:8:183::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 14:58:30 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 14:58:27 +0000
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
Subject: [PATCH v2 06/13] loongarch/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 19 Jun 2023 10:57:54 -0400
Message-Id: <20230619145801.1064716-7-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230619145801.1064716-1-eric.devolder@oracle.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR08CA0040.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::14) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DM4PR10MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: 9471d57a-8d37-4c78-cb60-08db70d5a326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DjQ7eUuSF9JtSc9dqlqe4pfmEqGdthBoSulPS9UHbUj+kfcaKa+xBzhUqEDanD5y3buUuUFAbvTYZzYKDuDV3P6dgDzh5BK+SzayYbSQeK8FJbWiaOcu1W9tbP5CnDU16+kAostznu9yzqTeAtTBeps6/FejObt1Ywdebu1MO8K/gxUCq43BPQ7lDct499JHcJiuXQRuth/1q+jEgSF+/MtoNAXTw/8yu3M+/pVN9AvsizyR4vObp55ppukySGvhHgi2pCdOFqeuA8GC9S3DrEyVlt432SUCNABHt9OX0marcqGME4vAvtzzWQYk/1QznYQHKNamFl7Pv471DHDRr6lTFoEDdjvDbnnQUrDgagvI9y2b4cmDGfXaahdf874WkMOGDa/YN4RDXNyKRZG6gyxRulJg2g3gw60aioz+ww4CaRNFHJdQeLKZoaVEWZh842pHiC2BmbHoKhQbKKi5oiTJxNp2VMIkg0CYOyY0Hl6vEsUGP97XEPAGZFXYccMwgC/L/G235mDs7eJiar/1Xe8ZXWyx2AExQ99t7CBJ401HGxzax0tN6KPP1Ao68Dts27R9St4p1WJZJH/WQq44qa6iasMDsPKMC1asd/toqUM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(186003)(478600001)(6666004)(6486002)(86362001)(26005)(1076003)(6506007)(6512007)(107886003)(2616005)(38100700002)(316002)(83380400001)(66946007)(66556008)(66476007)(4326008)(921005)(8676002)(8936002)(7416002)(5660300002)(7366002)(7406005)(2906002)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?9kqoKckcHoKTDMNwD5dbmHuAeihPNFDZ8eYHZrLU+rgLtXb3X3QtyMhBGQDE?=
 =?us-ascii?Q?zi/ukinDbTCwu8Ych/4DTamTbL0LRzm/BmwxBiMsTewJt0SdTtsyyaUjwRJy?=
 =?us-ascii?Q?4epoBNBV8FUX6i6rUzgMl8GCz1mekZnMx1AeTXUyZmZyIkUbnVaeLwGlsmgJ?=
 =?us-ascii?Q?6dsplIHp1yG2Rdvn0N8a65ubFcUWxXDKojyjlH5e0uENguHd1VvDzIRgAolV?=
 =?us-ascii?Q?U1PBNhwd4SEeOBVeys1QgLzXWjeueh9rVrrGEPD/W7AqulCWP8nkiOwbe/Iy?=
 =?us-ascii?Q?yp7OnbYMbSEBYtDmu5SP/Ec2kM7Aax5pOWTJtDW8gVDP066B298z/QJ6EHl/?=
 =?us-ascii?Q?DoL3K7+MO1p7qY/4z/YOvg7Ovtl5khSCIpnAc3dW6a23mqEXkYoQepk/HYhI?=
 =?us-ascii?Q?RaWZfNWHzHlLxaYml6d8/o8tIVckI8Wg/bKrzfyQUlxSf1j3y4zhkvvEjsSa?=
 =?us-ascii?Q?g0ifM0h935pi4dzyjXV3dkxbKT6Cf3rZvF/eKBloDauxQCPBgfXbdPPUNKGz?=
 =?us-ascii?Q?q2UbhdPzu7r37unxTzHLu8L0ITsxLAgTST4fRbxfDcl4oMnW9mdtelK6S6A7?=
 =?us-ascii?Q?nmUd33U8QCIAEqHqigiOowusfCEYaasaqgWoUG0If06eiTXDNctIYTgKBXGv?=
 =?us-ascii?Q?lr9hwIaGwr/IM+Fjw01djZo/p+bghOcWgmfs/wMhfvvvUwyDaO72dAg+Mfm7?=
 =?us-ascii?Q?TbcXLfGBAHBVxngwsml5Vbnrclr9bmKjlA6R+u2qOEeV4i5zaYoIvHJhYkDj?=
 =?us-ascii?Q?B6SLYZKVInhJlrRDnV9MPV46rx8T/KYbtuNYOLJCADlZLdt5rXNZlleIRz1y?=
 =?us-ascii?Q?aW0/K7htnUCsculZM0gksIUfa1Lqc48V2Qy+M2sVk4eMYw/hzUxK9sQ79QoH?=
 =?us-ascii?Q?StZHc3EPH+4Lap+YxzddNzB4fWxkhVomlfugKFT2wIhUzC04A+BA2PXm+45U?=
 =?us-ascii?Q?HiYMkf/E28nFeQioPAGWD2Ffp6lT400ASjKfzXiWURQ04C0Za9BXNXzycapL?=
 =?us-ascii?Q?/O5dpti+wE2ECw+c8M2jLsdsh5G0HS96ztpnlT4WpaSpCcqXA9rwnKrO/3Ll?=
 =?us-ascii?Q?bBDgRNRquJzGEuMCwGWUtQTffHU+YTyS7n5XbvMYD3JTlTnFzfD0/k8xEo1q?=
 =?us-ascii?Q?SGXq0U/7ss4ycZ5vO8Yw+mbMk5CKG6OmKzzYoJYMoaccyzvI2S4crpLF3FMX?=
 =?us-ascii?Q?4fqgbiuHw+rJ00CV8rT4cJqrm7k1BsnYjDCPYZD1e7pWB2yYW+AT4Jmgy21E?=
 =?us-ascii?Q?+RBbOvVP8pTfb15uy8pmmfh3PsjdF+9WodzOyuIyk/JlzuqCbvB+iq5ONXIZ?=
 =?us-ascii?Q?iG9fUU7VjRoz9/wVOkyckoX1XK5EQz5PZLTNcxzldNcqkKJ666UlkxEAnzbp?=
 =?us-ascii?Q?uuOuRODgVrsnPdcbTY/9RV3nFjqkPIqDzD2NgEezO1Di/gB8lgi7IenNKjL6?=
 =?us-ascii?Q?qnt1IrWAThc6WMiRIdbKEfqD1+K4Ocf/v5GGFHTFA4d2nMxjcexP9SbdOd36?=
 =?us-ascii?Q?+eI6u6a6R0Cbai75pvPQAu0ILqG8JGxscyMocLQz8wZC4fcG4Tcq9xQI2De5?=
 =?us-ascii?Q?EuYVOlLsUIG0IQWN1eNRaEpIjXDgsLHoFKYrbqe+uqva//xd/Z53LXcKCGcx?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?72nWsBD+uk9t904r0x9iCXB3SHYUFJLqzsqSjpPtEloqCSIBLzM1CV/WoRQK?=
 =?us-ascii?Q?87gUlvOcxDNZHyHlnjB2LTy/B+KQgabcO86EVHzSkBMQ38u3cUx15Tf5KvRi?=
 =?us-ascii?Q?BshVwczclAEib0SDTowYGXuUA7CRpDB2enLh8kR2qrJPvc/hbnTCAkSxIX2f?=
 =?us-ascii?Q?lJnBaMFSLrPClgidFgSMxYdrD9nA8P5RxxttyPb1Ujr112ygOOQrkCuunbzq?=
 =?us-ascii?Q?UzoFKd1xyiGHUpWGMtyq7UXOVQwq45VkQZQVhVBiS4bmTCjilBZgXnWZb5oR?=
 =?us-ascii?Q?T04V1UC93+52Bbp95MAo/tULarNX2lsjhAL0X0xtbPKKG7VgCyg75TY2T+Hs?=
 =?us-ascii?Q?7xNsiBhL1/RGM5ZcCTkueyfG1QVnxK2mAONHBRI4/sQqET0gOqCcWb/mKxc0?=
 =?us-ascii?Q?HjaIoi79ErTjrloQL3Q9rm1xAYsBfDptjNGahVd60OkLDhaKVZFZ4VIeaWqe?=
 =?us-ascii?Q?/GvSmQUPtbub6x4OhvlJZHYM7QDsM/8mtusNb36THHUoxfWiC23llkIXHp08?=
 =?us-ascii?Q?eEJj2ImORIuMfjUwlCAqgGIwo9bz+PJ+XVjo0zJVvj+WFQX/JbJDVkuQFb5z?=
 =?us-ascii?Q?ekL7vS6sSVByoBIyqYYh5Tj+o4Y4ZbjFEhcBphDwQo9pbvVhDUSdTIkwXuUB?=
 =?us-ascii?Q?Is5wEVdMciFAhuP8yL3s5Nk5JeEefOPs+7AM5nGNGzI5OqU1AsCY0LqQuX6f?=
 =?us-ascii?Q?3dqiWpIcSBktfDWopSuCI82nskmvNuFW/LjQL5TbtJQ6yel1Zou9J52RJiXk?=
 =?us-ascii?Q?qeP5ZUaNMas/kH+fUwCPjE7Go+KgaGIvxByEvjOpLqOJeP9NnHQ08DLR02bM?=
 =?us-ascii?Q?iXXXx/nFPI81aNiZ3KHgzj60eW2bKyw8V2sB1EC8AUl0eB6iFCIzrHPI0exo?=
 =?us-ascii?Q?ONVGcfxjpfClk/BblBYQy9h2FJoM9QBYGgTMORpKAlIaV3Kl6XMhfvUdcqi6?=
 =?us-ascii?Q?UEFAv/fBTgvg5ANRcVBv9JbB+42ze3tsi/ZeSPk9tNob71oo7A0t8q4IGeIC?=
 =?us-ascii?Q?NgydrpiPDu95KhVknIY+HEZn0uXz9NrTf5fcjPAS8piPNMfUqzH0rFjBcKpy?=
 =?us-ascii?Q?XE08AWYlp+Eq/LcwIzJUCikshqMmQ5ds8wl0cm5BEa/qexcUlVq/jPnYFX++?=
 =?us-ascii?Q?X7NU2A06Jmk+HsoS8gOM2ygvcQDR9ahzKiPP+LpfAX6JIKuKSYOc3RoF6pwC?=
 =?us-ascii?Q?t+bOHuXls4G5SmRVl54uZ6E8fnP9kfIaZSNAP+o/L39ZnxOV3PMMsAkGiWXj?=
 =?us-ascii?Q?RYWzetGAxXTZ8ESiEliGp8b0Mjju11WxLJXhK7EyvY3jmd8QDPIW3tRisetI?=
 =?us-ascii?Q?wMcpCAEiNG4Q/Lo/rlYJGyxOVVm+Mh4HtzvBKsawY8xHTkC7uS3bumVrpzO+?=
 =?us-ascii?Q?zOj6Zut1iePvJkv9swe8xe9sHwmeIyfw+B7hPKCKNQ1gFlb7L0ToJOfDRN2d?=
 =?us-ascii?Q?0okpgD1P3gPnRmB7BAtkFLnFJK2mmDgV0Vy6NAIOxzd++jB4CMQR2esOwIs2?=
 =?us-ascii?Q?cJ8U6gP8IKZDltwWeG4nZhjmsiBwzCzAlS5hjpcJ/DSi+PiuL/hOW4Ku6NKY?=
 =?us-ascii?Q?nw6tmkNDej3TWciM2ht3rbFreWJ/5UKqDgGeGROW4VcuXCeknbaK+NbslAUt?=
 =?us-ascii?Q?JLYZrXT2TfeN0gJeMmVFQh1WbqSdFzmBhYApbPEvgkXJ5g2fV449qeu8Ex+P?=
 =?us-ascii?Q?I/+gtV+sz7JLz6554En2cvh0bEd8KUIUQPLeCKXjxfQUBIBpb6AQ8OXwmU4v?=
 =?us-ascii?Q?rtwX/7LMgI/uq5QiJpSXAocFpbq/pFSkOnD1ZZYO53VGdIJWTiU1vC4JiElg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	QsNpZVRVN4o6vztg5Kkigt+vzmos3iZuxUYDsr5c+v+7tt3C9F0K02ULvgRvPH1yKUWYi8KPlq/p83hCPd8xrs3YBWd6vjY8rkLaYlawJirTYc/ENcMwYyotc9Am8RxTlaDZEaf6hE4HxkE9v+ia3j4NktWGtFRTuPO31edN43yJuoS984CvemgSdpviJoQN9UAYmXXljAknCPnhdWF3MjggLikdfEw0lxZpZHKiql+suS+7YzgKuGtDFcXn+8KdGuorZk78q39NdA41UKOSuR5UPc8fIn6NEA8YqiyV8cNOZLpHzKAxYh7R39fHBw9v6ILNGAf+yH9loixggQJvdznzGmePr0V9qbGhO7PX+DP9XR2ErFtDPbuXYZvVvNS0VbcEe4ACUa61fg8vE9REHqdO4NwKTBUsJhiFmycHkGD75p9rbbQnjn6EWjXNfP+UtN34sX2LPRFQnQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9471d57a-8d37-4c78-cb60-08db70d5a326
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 14:58:27.2649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fPWzjlkY/taXKY3Qcsj89dX543rg7q1mGTyPZLPFgoTi/Sv9P0ZhrivuA/9cjgF6GuhxJNPifwW2S2UYp8pPWGMFqkUkAPHtU5UId3MCBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7426
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_11,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190137
X-Proofpoint-GUID: p8KQabtBqklKiAIeFekm7c2I3zxUvP-v
X-Proofpoint-ORIG-GUID: p8KQabtBqklKiAIeFekm7c2I3zxUvP-v
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
 arch/loongarch/Kconfig | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index d38b066fc931..3542bf669c78 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -481,28 +481,16 @@ config ARCH_STRICT_ALIGN
 	  to run kernel only on systems with h/w unaligned access support in
 	  order to optimise for performance.
 
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

