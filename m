Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EF58B6077
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 19:49:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=RilswQLX;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=L13vMsmY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSrRl027fz3dBk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 03:49:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=RilswQLX;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=L13vMsmY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=stephen.s.brennan@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSrQw59hvz3cWf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 03:48:22 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TGwkOW004998;
	Mon, 29 Apr 2024 17:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-11-20; bh=y12rgvXV3sQB8e2sOodhJZ7wA7IP2AnMyHMpvXbMM5E=;
 b=RilswQLXveaUksSe8WOQ14uJy8jFYvzBRMsyd4O9bC1RQfkThYLsToW+/t73lK6ddrWt
 r2dRn6Eqo3UU2WD7Y9ef9hkclC/rT1JIVK0DqLObmb/tXNxnkENZcLX8sZHv932MKASa
 vEsdyAg6KCyO9QckRvDKoxQWM2sw6Kv5JHaWEChnfRJJZKB2U+d5No4RDV84RF3oOsRk
 oMrzR1nu8r1fYrxItgUiLQX7agGfWFu9b132LvJUjgVkt605xObyK74AZ+ZbxCploXv0
 1da4JCu78BR5uv1D1C/fwdv06v7Hzu0UQgX6m/8OuG/Hi0o8JyXMyFsa6LglzpKVBQle ig== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrsdek68m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 17:47:26 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43TGKquG005250;
	Mon, 29 Apr 2024 17:47:25 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqt67aj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 17:47:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWl7Z4GRMJwgZhz1JU5clC1WfioXwzEz3qlDG+11B2kZVO6vm+vUNmfNJ06zDn0qEEORZlNxYiSuvx6ytFwQ/WagxemvnKxVKSmykuMjiM665+HcjnBU6EblZ2asnS85ujpL5cBjulbYzQqqfLWzTYnNeQJUkvY8t5G0T/TteeUppYqxakrnTOFb3HynH5MNBYXurUtrRxdEw4a0M655ohmTtWrt3I0749nhp+AM9lE3ZXfLSo9Nw88c8gffrwG2ORBtZOezZZW5Tqs5ZlrQthjvhSfMpr04agTSoPNTDc3MF1gx6hnQvELEF/iqeOGCOEHMR4Ig9CaVUxfpZT6fVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y12rgvXV3sQB8e2sOodhJZ7wA7IP2AnMyHMpvXbMM5E=;
 b=fB20Umqi8x3SP75YmVCRDLmKvErZEZsCFiKzm+o3+VYQ203Ah2wOqFtNCRYk7Lw6KUnDjlC2OJU9TS7jWiHdj7um9cq3u0hrS6PFC+eWkzrkcVN4p8zWFMqEDAGV4ox4UZOWGKovnvzSpHLsscnqhdBRMGdRVhRefIZj/SjR/0Gylv4ebMIh002MI3Ope0WCelRE7N0FX+RmILE4bwrJelFzkr6TsGt4fzD2TmOxNrH0cDG1mt2tZu4qziv87Yw8XJz887LdcfcFT+qa4sKZRv8cUmRxHpxDePGcrvazkREGf2KzfkZbVbpJIyMp2v/Uxwknreg+W37Hxrezge6Q1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y12rgvXV3sQB8e2sOodhJZ7wA7IP2AnMyHMpvXbMM5E=;
 b=L13vMsmYf5vnLPfPfSy324HNMaOOFGS9YvKMNaIZcgXsePeX2Qj28Z5ohUd9QucHmx54AU03CFKx4QOHKdOzHiKU8gQJdinXeQhQH83o3pCMFy46K59J7iNfb8JhOrCrKH+qae6VcnXM9daHxHiiRm9s62UIMMor0tMUqXRDgi8=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SA1PR10MB6318.namprd10.prod.outlook.com (2603:10b6:806:251::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 17:47:21 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%3]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 17:47:21 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2] kprobe/ftrace: bail out if ftrace was killed
Date: Mon, 29 Apr 2024 10:47:18 -0700
Message-Id: <20240429174718.1347900-1-stephen.s.brennan@oracle.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240426225834.993353-1-stephen.s.brennan@oracle.com>
References: <20240426225834.993353-1-stephen.s.brennan@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0431.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::16) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SA1PR10MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: f8bc9224-7010-451d-e20d-08dc68746bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?tDvMsGvtLLsIA4uROdSVSXd7jyYjxkAWczwmIDi8cmCIoNQNU4aet7xTo2On?=
 =?us-ascii?Q?Q560/8iYB60/OuLF0f8TNCGF8MaE3uQIIVTHeQ++DR9b4nF3NytUUfdpKQRg?=
 =?us-ascii?Q?9HEprg5c78/6clGWQO849mLECCtwavjg/GLXAab0b7O/aV4U5ceX1KfO5GZ0?=
 =?us-ascii?Q?LHLK7DRm1S2vjcZPr8AUqZru3GhlnXjb1OisNN4Od0tcE1WIH4vcLjjP5Kgx?=
 =?us-ascii?Q?6k0Uut7qnOaUkxIYc7P2mHUNLUk5kVvoAgFBoEiwXidxtFE0QK+KTO/jyL2j?=
 =?us-ascii?Q?9zZ/MQn7LfqctqiuDHy7GqvaMmPn0W1rcBaaqj36LxgPC/U68l5nCUrwO5E4?=
 =?us-ascii?Q?cYQDXL/y2b95JRAgYmj+C+YH1ghlAxghyrqDMUKQ/Da9e9Bh5neL2OGWn2ui?=
 =?us-ascii?Q?DMk9OHxtwOQFKBADRJlHlF1tlah18Iaje/h+Ky7XM4QY7kYrwNdKb6SjgxBj?=
 =?us-ascii?Q?CjOXFapd4qioeEtg6CIOm/UUnWSzIQTzsPuYbRnIS9L6SrGqiuXzqwxdATFM?=
 =?us-ascii?Q?GpNXhlCIMxmBRcBhN6RPrGUjQkEd7qZ8JCpG78nJOPx+lMO4ysSsD3lVNfm+?=
 =?us-ascii?Q?sEpzYDk22Zq+bUREs+TUTY+S6K1x2GlJbaZ3Tb8XqIiHoI3y8K97e43TsaPx?=
 =?us-ascii?Q?gSjNggdCMbuMIo9t043MB04MxyHCIpL1T3rnLRdNUASNMXbI6kL880AdFvfP?=
 =?us-ascii?Q?gRoIRFWLYtago38q4ODB364yJ1+Giw79vgqShz91fKr8iXbD/jnj8odOL7rO?=
 =?us-ascii?Q?sfx3Vc27pjXUEjJuseTNjg71t8j2mfo0btFsEKSm9RFWaM1BCSU+AwOZU6/F?=
 =?us-ascii?Q?ZF86TDBgJ4C3tl7O+xN93Pn3te7F91v6dJx0FiD4ABqZbcNcdSgdFrEr9zPb?=
 =?us-ascii?Q?E1l0aO1HN1nR70TAylHsCLYK6wKVTjymu/kMgl0KHGqPDzOEXnw7RhZQLLNi?=
 =?us-ascii?Q?Jn/UEb6PuuydBbKWMxKCpnrXhYeoF36n1TbwDQtpgeg4O9Z5chqKtARPdg6D?=
 =?us-ascii?Q?vvIDJu8iJPLWJoFdQGylRMRpTStaiz36nyFWD5oVc58wY7UU9AnVl08Kl+8Y?=
 =?us-ascii?Q?fo1EAlseLdN8mlbge9Z5jPRLMmNE/TqktfOgVwtCPP/x2DmShab1zvrAgfVl?=
 =?us-ascii?Q?RAa7lv96o1yvqhnBPrf75nhZaAI1VGfA/1hKvI8V2GKcmMgrUqopL7CS68TU?=
 =?us-ascii?Q?2XyBoDajyC9t+DLFf0vH2putetMQ0jtiuqimwc1bhiX4Bqz9Tn39NYiOLk1y?=
 =?us-ascii?Q?DPc+0qSCiCS9Qzkv8fqgW45/pdWPaQRzgnosyWBqPg=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?XWR9rtOEwBKaFLtOsNbrZ4z1bJ0Snefj56B0AqA8b/BG+rKuPLKbKJn8D67c?=
 =?us-ascii?Q?B5W1APjrAuOGJsWjMz6T4Q/e/hRNA//4eTtN6RlP/0TIQdxXy+UKz2KGJVYW?=
 =?us-ascii?Q?n4cqZ9F2iLL6HtQGF+48T9Zi3TQA4uUYSXHoBFHLcI+i2YgSC6DIdS9EnSca?=
 =?us-ascii?Q?jsowm5Uu9y6vLYH9lKsGjFbPF2BiJjvVT3j7HwgJDcdcFJ/hSbR3T4B2M9ch?=
 =?us-ascii?Q?uca+kjTOEda1dFMQHalRQP4r4PrH/iEZVMPZpEY557inxW7ilUjpxjSI2CZz?=
 =?us-ascii?Q?hMk/dhCZIq75rUDRyAMdWkfQBBqqVciWpCVI4a6Bs8iOc5DLzQI2/oG4zIQn?=
 =?us-ascii?Q?T+YzYjXLarjLMVMYFrsnYgyXJPv26VdaEIrmsuTWOuIS6mZ+v9QYjdOzAhwf?=
 =?us-ascii?Q?X6hECCUrUjbczDme5PEArhA/K3lCKVoQV4qLummL9H3eySEKydlK4yvDZJpd?=
 =?us-ascii?Q?tOGz03j1ZWGIY48rYw+8axJGA6SgF/br+RX07ZlFI7WKs1u3OaCToZiRBUrH?=
 =?us-ascii?Q?t1IXOJVxpaKOoSdRLOokESkx5nuOYBOm6QdbWrXkmTiEKC/FHxTaixjKPYgk?=
 =?us-ascii?Q?Xv6G+PM++4pny/MkKusDGaigdM+5hVPzB4AoeFRVuC4XEMU+WFNog+QQNrAb?=
 =?us-ascii?Q?utBONAmOQLuEvG1XuTAgaoJf7YZSW4U2nCv+gwOHBPqAud4iXegvpJJ9MNO6?=
 =?us-ascii?Q?kWcaWLdbkj2UJQVgad82CeLlxDelUoUENne4bXLUzO2U6U5IUM+k8lnMriN+?=
 =?us-ascii?Q?sFNy2nSAnKgQdmj5lhX8idLscoluv5YxXURJ5vsRhzEO2uHZS04g0q7zoOkW?=
 =?us-ascii?Q?zJuwZ0dSxN+qx9uCa7TR54WTqpJSAUWoqWAcvPJVbfdWOaL2SLxi8Oj6dsso?=
 =?us-ascii?Q?KfHchYgQyf6u3SPg9I/X26JX3Vxj4f+xjoJHguHNBmMBeGLiCedn5JU8oYaK?=
 =?us-ascii?Q?SdAru/Nnhc2wAMOWq2/IOyTniaGDrklF4BLApjFvisF+iEHUha0d7Yyuo1Ww?=
 =?us-ascii?Q?9ZoE/VSq8HZCn0LpntpRpcYQEqt7idCaYvpeStYuPQITSz5GqS3g17jFIZ0S?=
 =?us-ascii?Q?U12p3UP2UsloCq4Sxe7FvNJwIgTP661RYFmoI97DbkZhcfmdIc5tV/OynnF2?=
 =?us-ascii?Q?2xEnRMchwB5Ys1LXo+mICWKI21RfMRl1tRRKpabFtmQoOHE/4G1y5wqGn55i?=
 =?us-ascii?Q?/9b7bjTags23dRbaLEWs7izJWYeyQ81G9ygIOrU5cyZDdTeDqYW/C8w6LGOI?=
 =?us-ascii?Q?NtakeOKv+gKb3P9yv7TTtKX9bzan8ssHL3A+9y6jgz5HuXSb2P0yIRE9Oo3L?=
 =?us-ascii?Q?dnGp+lhLZZo6Pq1EgaK1/F5qqyGczXoH10UGtcdAtvu4yU8yZohl106Mrvao?=
 =?us-ascii?Q?8nx7kb9EkL02KG9uYLsEwvylxlkiKcShJAOLaSkV8zfkIs9jqFvcq3ikwZ3L?=
 =?us-ascii?Q?EyWiIQ0h3cxIhdqVAbPtWRM16LgdzLKyOZrPnl2Vh1hBFeLNjZsPmSFa3m+r?=
 =?us-ascii?Q?Ngdo80qlBCK+z0ZArakoe9Kd0w9fYAJPz1shxCmbY64KLEWi79hojZ9Z9x13?=
 =?us-ascii?Q?EUXS2HFXE2RI+jcpuLYBmWzq5nGUvb0gAo9wjMGBh+TLzsz1mMBO+2xSQm5c?=
 =?us-ascii?Q?+Rwn1SxYgwDMEcBgkwOEz5WmVncJdMNxfhPfQ5LH56qh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	5saESPpw8clnbLAFZTM8fJbI0Gyxq72jkzKaTM51ZTTuZ5YOhiUry4Ws0jV0114KJVcQNIh/eY4Zy5/Ny0/xf9J/eazk3HsFCuSrRqog+FXcoYBYt+utLnj9eGA4z4BOJsc5BYhx3tGOIY5Ja+WjswWRkFM8LuthmGKV9FDLfrpOTBdDwtVzHp/cfqmb9OKMyRxOcmSaYEvHVmb00ym9AnJfKRE8ZK5R8DyfKxPeRwVbW9KTguCUzk4soqaaKtwTyn0hv+dr6ztPan+OU5Uqj4/TYleno56gSM59ealST7AGTOag7fQrxEBY8lJ2r0zxrkXgnLYNNshskhCbJaZfBfym6preOWWbHOsnrLxwhFwbUY+Y74VJI2V/8Wy2vi9R780oAc0aBl8G4WtUNSWdaxwdTmB8GOQ9AtSt2QB4x97TVW18lt1IE/a07JQnkXRIJk1qqFVgWufDqOkU06KbCcaFzIaNQbtgbq1TWbnGh7jW5zVg+h8QyvhOylJX1lsOT6mHy1R1C8MCYRKWkAWfVzcYdZhTwEln/EY8HHQGcyBS3hTTsd8e58KA1yVhls5g9GJR2qCzS/DjGufFTAZczyDlgaapKGU5fzBMV9S1p4U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8bc9224-7010-451d-e20d-08dc68746bac
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 17:47:21.3859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rLhAyd4NwUpWtUIKRi3YIq6armQMu7Ql3bzTvNy6uu8xjUa+LNWiQerI4acKfpDuOnIqigo1Cn7pMe5fW/1AmL2NOoPrF6WH9G/WY0Ew+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6318
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_15,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404290114
X-Proofpoint-GUID: NnhIAKVzDJkWjyOtunQv4fx_keVhDJ4X
X-Proofpoint-ORIG-GUID: NnhIAKVzDJkWjyOtunQv4fx_keVhDJ4X
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
Cc: x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-r
 iscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If an error happens in ftrace, ftrace_kill() will prevent disarming
kprobes. Eventually, the ftrace_ops associated with the kprobes will be
freed, yet the kprobes will still be active, and when triggered, they
will use the freed memory, likely resulting in a page fault and panic.

This behavior can be reproduced quite easily, by creating a kprobe and
then triggering a ftrace_kill(). For simplicity, we can simulate an
ftrace error with a kernel module like [1]:

[1]: https://github.com/brenns10/kernel_stuff/tree/master/ftrace_killer

  sudo perf probe --add commit_creds
  sudo perf trace -e probe:commit_creds
  # In another terminal
  make
  sudo insmod ftrace_killer.ko  # calls ftrace_kill(), simulating bug
  # Back to perf terminal
  # ctrl-c
  sudo perf probe --del commit_creds

After a short period, a page fault and panic would occur as the kprobe
continues to execute and uses the freed ftrace_ops. While ftrace_kill()
is supposed to be used only in extreme circumstances, it is invoked in
FTRACE_WARN_ON() and so there are many places where an unexpected bug
could be triggered, yet the system may continue operating, possibly
without the administrator noticing. If ftrace_kill() does not panic the
system, then we should do everything we can to continue operating,
rather than leave a ticking time bomb.

Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---
Difference from v1: removed both existing declarations of ftrace_is_dead()
from kernel/trace/trace.h.

 arch/csky/kernel/probes/ftrace.c     | 3 +++
 arch/loongarch/kernel/ftrace_dyn.c   | 3 +++
 arch/parisc/kernel/ftrace.c          | 3 +++
 arch/powerpc/kernel/kprobes-ftrace.c | 3 +++
 arch/riscv/kernel/probes/ftrace.c    | 3 +++
 arch/s390/kernel/ftrace.c            | 3 +++
 arch/x86/kernel/kprobes/ftrace.c     | 3 +++
 include/linux/ftrace.h               | 2 ++
 kernel/trace/trace.h                 | 2 --
 9 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/csky/kernel/probes/ftrace.c b/arch/csky/kernel/probes/ftrace.c
index 834cffcfbce3..3931bf9f707b 100644
--- a/arch/csky/kernel/probes/ftrace.c
+++ b/arch/csky/kernel/probes/ftrace.c
@@ -12,6 +12,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe_ctlblk *kcb;
 	struct pt_regs *regs;
 
+	if (unlikely(ftrace_is_dead()))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/ftrace_dyn.c
index 73858c9029cc..82c952cb5be0 100644
--- a/arch/loongarch/kernel/ftrace_dyn.c
+++ b/arch/loongarch/kernel/ftrace_dyn.c
@@ -287,6 +287,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe *p;
 	struct kprobe_ctlblk *kcb;
 
+	if (unlikely(ftrace_is_dead()))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 621a4b386ae4..3660834f54c3 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -206,6 +206,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe *p;
 	int bit;
 
+	if (unlikely(ftrace_is_dead()))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/kprobes-ftrace.c
index 072ebe7f290b..85eb55aa1457 100644
--- a/arch/powerpc/kernel/kprobes-ftrace.c
+++ b/arch/powerpc/kernel/kprobes-ftrace.c
@@ -21,6 +21,9 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
 	struct pt_regs *regs;
 	int bit;
 
+	if (unlikely(ftrace_is_dead()))
+		return;
+
 	bit = ftrace_test_recursion_trylock(nip, parent_nip);
 	if (bit < 0)
 		return;
diff --git a/arch/riscv/kernel/probes/ftrace.c b/arch/riscv/kernel/probes/ftrace.c
index 7142ec42e889..8814fbe4c888 100644
--- a/arch/riscv/kernel/probes/ftrace.c
+++ b/arch/riscv/kernel/probes/ftrace.c
@@ -11,6 +11,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe_ctlblk *kcb;
 	int bit;
 
+	if (unlikely(ftrace_is_dead()))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
index c46381ea04ec..ccbe8ccf945b 100644
--- a/arch/s390/kernel/ftrace.c
+++ b/arch/s390/kernel/ftrace.c
@@ -296,6 +296,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe *p;
 	int bit;
 
+	if (unlikely(ftrace_is_dead()))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/arch/x86/kernel/kprobes/ftrace.c b/arch/x86/kernel/kprobes/ftrace.c
index dd2ec14adb77..c73f9ab7ff50 100644
--- a/arch/x86/kernel/kprobes/ftrace.c
+++ b/arch/x86/kernel/kprobes/ftrace.c
@@ -21,6 +21,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe_ctlblk *kcb;
 	int bit;
 
+	if (unlikely(ftrace_is_dead()))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 54d53f345d14..ba83e99c1fbe 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -399,6 +399,7 @@ int ftrace_lookup_symbols(const char **sorted_syms, size_t cnt, unsigned long *a
 #define register_ftrace_function(ops) ({ 0; })
 #define unregister_ftrace_function(ops) ({ 0; })
 static inline void ftrace_kill(void) { }
+static inline int ftrace_is_dead(void) { return 0; }
 static inline void ftrace_free_init_mem(void) { }
 static inline void ftrace_free_mem(struct module *mod, void *start, void *end) { }
 static inline int ftrace_lookup_symbols(const char **sorted_syms, size_t cnt, unsigned long *addrs)
@@ -914,6 +915,7 @@ static inline bool is_ftrace_trampoline(unsigned long addr)
 
 /* totally disable ftrace - can not re-enable after this */
 void ftrace_kill(void);
+int ftrace_is_dead(void);
 
 static inline void tracer_disable(void)
 {
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 64450615ca0c..70a37ee41813 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -1026,7 +1026,6 @@ static inline int ftrace_trace_task(struct trace_array *tr)
 	return this_cpu_read(tr->array_buffer.data->ftrace_ignore_pid) !=
 		FTRACE_PID_IGNORE;
 }
-extern int ftrace_is_dead(void);
 int ftrace_create_function_files(struct trace_array *tr,
 				 struct dentry *parent);
 void ftrace_destroy_function_files(struct trace_array *tr);
@@ -1046,7 +1045,6 @@ static inline int ftrace_trace_task(struct trace_array *tr)
 {
 	return 1;
 }
-static inline int ftrace_is_dead(void) { return 0; }
 static inline int
 ftrace_create_function_files(struct trace_array *tr,
 			     struct dentry *parent)
-- 
2.39.3

