Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC079342F2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2024 22:08:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=KfwXfwWK;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=IxHpVFHs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPRpb6Zdhz3cVG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 06:08:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=KfwXfwWK;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=IxHpVFHs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPRnt66R1z30VR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 06:08:15 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46HK52fc002035;
	Wed, 17 Jul 2024 20:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=o9g1Ew5lheBoqkL3ar2Yr4AYVb1OEZDZlsoHSIlKuKo=; b=
	KfwXfwWK+pHabxvJSmP1m446MA9Uv9zQ/fSAjXiei/yMHV3gCdBi4w+CRNsuSMFE
	3Nly+PtR4Yu66njyfdXmzrHU9+hoRWQqM4xMRApfhaW4erme4YIHU5yZuoELr1Xw
	9Z47gmpCChxnZogR5Q+wJr8rnvFdSE/n0ApWwM/hSMWX8KmxPo73bKl8IwRhYoev
	m66mv6Df9823Db59uPHxm6EUjmj4dDapfdZjB5sbk0CdmoDciJqxlT/nRFS1AZvo
	Te9lAW4BqKrb1bDOiF6ZE1Z/7MxZG+19nEcLgGoFYcjhpxi32Rcay9z3njMugqfY
	yX+DC+wo+l56IA67FDPpuw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40emp5r08e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Jul 2024 20:07:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46HJ4sqD003630;
	Wed, 17 Jul 2024 20:07:54 GMT
Received: from outbound.mail.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dweyhkte-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Jul 2024 20:07:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuQVEvJOocmNHgpCTBF+mr6TJtFT8m9DVPrDaXQn3Jl6/kLPizO6L9VXoqjP8UNCDHxUo75FmcQRs9ks5bagWZ3xTj9gKRsXtSff7nVAHAcrSH7SYW5UQqBKmq7rdcgRUTOEWyjYXe03uqZKCYUuSizOR9JZEluq87EXRreC+E3l0fEj5PQoMukXh7fIp0WSzew2LZSCy8dQ/fEL3cz+RRm8Mcvfip1FI1h8NKQX4QSHlbGFd6nyGM7wQmZutUjmDLm2p3bhlKhdBDJgcKNHCTzKWmncW+eTbSf9nX44/IU9fYbE5ggErqlOTIhE4DUtZZS/4BPvL2ZiCCW6GTe/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9g1Ew5lheBoqkL3ar2Yr4AYVb1OEZDZlsoHSIlKuKo=;
 b=YiFop29XNZQmS1WKdLJhHysivVL+jnzN95bGzIqe6cxKKYDRg9yeh/qs23cwqQjSfQeZ3+jtAn0WAMWyx21QJjVXbVO9UibmBT9bq8BxNa4u16ufbb36B83X0EcfW2jbFMMZHrv9LbQOlJ3MvYMCg9RtXwe2BmKry6TsCj0DkTT2PrD/YTRKLc+TciDTX2ebLZDoKiLaf3jTfPp0isY6HzNUbg5TCk8O9IND4p05jbbe6lhcWeZD2xkKy2eE06mICYhdQsARRV9Ps8tCJrATxqNuv6FCoy+FB5+JoFuWS9QXhAYd+Nvq5Sq6m0wPzLDvkJfboACfIhZO3/V7/mFsGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9g1Ew5lheBoqkL3ar2Yr4AYVb1OEZDZlsoHSIlKuKo=;
 b=IxHpVFHsjYUCzZMf/KEuS1kTiOgDD5cpPhUrla+5/fjzl2lAT/FKbUzlhpBly2stLUc1LXDy5k5Ox+QRdzQquL2/X4le0MuvkCBARCYAEqiU2qcdwlskTYWHmOMkV6RLkZxhKRJmd0Srsfbm+ml062SJIKyAl14+hCCka5Rye0M=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by PH7PR10MB7694.namprd10.prod.outlook.com (2603:10b6:510:2e5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.15; Wed, 17 Jul
 2024 20:07:50 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%3]) with mapi id 15.20.7784.016; Wed, 17 Jul 2024
 20:07:50 +0000
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 17/21] mm/mmap: Relocate arch_unmap() to vms_complete_munmap_vmas()
Date: Wed, 17 Jul 2024 16:07:05 -0400
Message-ID: <20240717200709.1552558-18-Liam.Howlett@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717200709.1552558-1-Liam.Howlett@oracle.com>
References: <20240717200709.1552558-1-Liam.Howlett@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1P288CA0019.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::32)
 To DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|PH7PR10MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: ac801e0b-9773-40a2-03ab-08dca69c224d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?ecPflbMCTYZKw2oRdZ3ftVm9mNoGwBIbEDu15UQPwGiygFvCdqa7gBhe7lFK?=
 =?us-ascii?Q?yRV8nwxROkAPcN7SHmepf4/5pAueLSyBG+tHn2Ph9BA8lKJWBNMy9OWXFTgy?=
 =?us-ascii?Q?yLqaQRTZFEbEaHRHakKj+lDoaQZg9u8BG3rKBb/1ZcgBligr0WyRvXZ5VROz?=
 =?us-ascii?Q?Hj8QpdVyNbEAREWwHS4ASrWXjlyC4JUnwSP1vzw0yDUKD+VQG8iLQetipaMz?=
 =?us-ascii?Q?dpd5ozTr8hLelgtM4oqRmcZ5VhQeT1+cfQEpOlOhi9pT3Zy61xTyHr2xD4jS?=
 =?us-ascii?Q?kHqx9ERFLmqEAuPW3iy+m8DPCVURlTYXnZtY0V4pnaBTTMmrwkQKxmkjKHi4?=
 =?us-ascii?Q?dmgRtr2ojZPwVdWEqaaMcfbFj5JIl97agN61EvoMge+pqL81q6E6WR6x+yqE?=
 =?us-ascii?Q?wkDwtm1cWgOVPO9+QPp/0Fd5/tLELGfA1enii4Tk/ESNTH0mILiCYf7xVEbT?=
 =?us-ascii?Q?4X4wNiVKZdIp2u7YffXvLYOaVAJtCOH5d4FGpv2CNbQQSu79SP0LOjGtUeuY?=
 =?us-ascii?Q?kEgPSJK6td99dtj2WkRgV/rxmx2yaL4WmVUraBtNrcwYfVZ1CrvN9CIvy/2w?=
 =?us-ascii?Q?WDL/WX/zmsvs1PEQKpktc/mY4CfHT/3+JVv8p8jyJyj6x2XsqfeR/bkur5EX?=
 =?us-ascii?Q?FeJoM9htwb/6dEVmId6yWE2HaWpjGD5vtNV8HFiPkbw9gYNVgV4SjcT595/P?=
 =?us-ascii?Q?R6uevxtGMsUM1OOJ9puU22aEJHkV1J7LC2lNA3TMABrg6SA62IpWVIv0lxT7?=
 =?us-ascii?Q?qdBfaQUd0dfu484pfgdseZKE8Wzk8hjrB3w/YwWqnMmTIBLGz89B6VEz+j0h?=
 =?us-ascii?Q?HxqhBv9m6yxZr1IVumeQWUS/6mjqOthyA+uzhTmhxJTVV/qPiTV8l2hjKymm?=
 =?us-ascii?Q?uZu3gcK5YQ6YU5bVzd66CCliHCTxusUEjpg/9bXMdnN9TEXttMh1VVoEmc5G?=
 =?us-ascii?Q?3FiwaMngxEe6HoYyKlNENGgCbLk1aLKNudRmyseXjVdKpQcC+I25/RvE5Qv0?=
 =?us-ascii?Q?9h8OIvLe0GHkn978+b+iOcfZrX8V1HOuypyvArixNC/fBHvoTPhKDzD+dc9F?=
 =?us-ascii?Q?93+KTbzAc8cbP6krKUAZFhPr9UdBzvc9LvoBsFNlxi0OqhYSLxJo4pTaD2Bx?=
 =?us-ascii?Q?wTtUbbb41XNcsN9vRoYzE0iZuL6+xBXLJUIDoqBo84Gb5RvgsR7ESJqr+qO6?=
 =?us-ascii?Q?27GJOvzcdfZ2LJ+NcrxEeb9qDpPqhgpyukr3fMjSjZ7zAAEIxmgXXbAD6FsG?=
 =?us-ascii?Q?AFw6LVaY71CgBmZh9uv/WMEOj3wkW04q1UQOcHMbi3a8InlcYzSWNgUg9ViQ?=
 =?us-ascii?Q?zGioXmzpPB+7UitCofjnuKl3SM6abE+m5dJME8doSaoaaA=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Vz81dko8udaUoR4OXplzF9zohaOWy3ObSdsINyJE2om/HCUPo1ZlIKC+hJcZ?=
 =?us-ascii?Q?x638J7GFqW/4rDH+18vmGTfzBrJWAVmffQPnbEvFmdvDfaBVNtitzE5PxyLS?=
 =?us-ascii?Q?ZD5uNSkr6APGn2/ucHDl+6PnrG5Zxw3UzxqcJ0rQTF+9lRX4sG73+ovGdkcx?=
 =?us-ascii?Q?NGHRZqb+U3qUBg+M8OP3Itgwrimxvu5xUEaJgj6ZlPrkjqWKBb43U2DneX+G?=
 =?us-ascii?Q?I9i3koYsQxLGMwosWY12AjSTMZO8sqU3wE3wELSFY5fe4WKZyvVGBgPO6MWJ?=
 =?us-ascii?Q?/OBmGglVE4PNuKTzQuNZ7iuY0GfGQc5puuHXA1aX9HvVBFJ3HuLfCeVo8i7z?=
 =?us-ascii?Q?29xQF8B+zK7vKyYmACeVCqnG1qWyznYBQx9Ol39rGaLuw2dJXhIwTLiEZxm0?=
 =?us-ascii?Q?1Gl8v8XGDzlfDF65rHmFQQXD8Z/0scUw6G4XpJsvoitSICPqzyo8KV3BYhIY?=
 =?us-ascii?Q?fnlHKwY/g0en7SCZ4ZI6/sIVbBOh3itRQSMX5dNK+o/iJBpzznR41kYubCFk?=
 =?us-ascii?Q?/c6e9QFLmHSk7TIBjQFgvR8ZHubQ/sFqNOK7FQ9YFtf6rLF91w6CJKZQcKtb?=
 =?us-ascii?Q?0/k8uJ6nZ8rOGjMYwehSs6mhCqqE7QUU76/cpMBzN72PTq84Ax8E9W9I4Xdp?=
 =?us-ascii?Q?1kIkPvk6Rx4Owi28pvSwHTo4tpY+X/7LY8sVyl/LQM5j180XlTaIQXTPDM1G?=
 =?us-ascii?Q?+c+5kB68Fj15dz9BDS5gKRfzl1zAspGmJkaU+0WgwUS8p7/lQFI//A0WuQtH?=
 =?us-ascii?Q?Xsv4VtWuZm0k2hO5+BKCE28nboS9gIAyoF9uone/GQnzud2aSj+qy2zhKDaP?=
 =?us-ascii?Q?grNcjqbUkchGj5eCzdJr0iMggYL0Kdw0/Min/2MHVnem0bWiebKII93sTwdD?=
 =?us-ascii?Q?OIfWEK9Mp9bPmY1pAZoGJHDR4RXCSMLrIPY6LHJPsROphIWeyQ+ulp/MwLHA?=
 =?us-ascii?Q?SpCEnFUnQCt3kibgTZEQIowR0KN8sVZTkJ7mr3llJQgPZweV+aHZJh7s7mbI?=
 =?us-ascii?Q?rL+1BXHZfvkiQnvzpGaMJh7rK5aUmqzbf1elXFsUkOgSkZ2uil4kF18/3UTn?=
 =?us-ascii?Q?jjg+c1CLhRJqShShz/J8EZvzixRQhDgyo/g4ElNOM9sZjap65pGM0aHVzXVU?=
 =?us-ascii?Q?G5fTcNdH5bAiCgZJdWchOSW3hYdyE6+yHSH9nW90pE3qa2aILn4soh76dQn8?=
 =?us-ascii?Q?JhzhG4kHNMiGc+l/MIOGjX0Q/xj5tyVEkqyDB0HHXk4A/Nn5RNDh/kxx/cOE?=
 =?us-ascii?Q?dXNX1neYMItY8rX7KvS6CxHrc37TIXAwlhme19thGZRZvra7rfyhyYr54+rz?=
 =?us-ascii?Q?ADv6ltd/0n2D7ffkAr5gASS0KOUGZqKxZ5sCDqhf7+NAeeiDXn2WP+g4OrL7?=
 =?us-ascii?Q?YQtxBQ5vvhN9h3bhKitgEYNYacPalKYZA7VBP5EnxVbH/4Xnj5RoQ0wxfa0k?=
 =?us-ascii?Q?Sy9pBy6flT/nnIi7VSdI83bF8n5b3NkHGp1kuUNNHSIkdMaPBfYA9zXCB/jB?=
 =?us-ascii?Q?xlNeUdGxKbT61VWfqv2YoDMFRRiFiQrzKaFWDcrHwtHxfw+cK9l1FCe9q7Vx?=
 =?us-ascii?Q?J9xp5vNE+EaO9Kc1ZM39+WZgWDS/kLEOk5JQN343XzAmcfeb383Ws+3cu4Qc?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	JINxM18Nx2rfJymBGPl4HW0gdRoQ//rXIWPzQMRJL5Syl20whj1NsH1puLGPKm0FUcmGsoZeBaH80FdGnncYKY7QxWW2Fhf2wvjf3LRBQWxUA+ErRWHD9QRC9gyH7hSGdmOwDnqMp/VuxAcb93rIWYF8dilOEqA/oH3S2x46vL/PhlAgHvuc+UTZ4l5g55lSQw0LXsb47sQK8wPOg4hGdLXdZDgyzTT1CAUNCffI5kYepAtBgoaq3Or5BFXdA5rfMkm69q0Cj/Sl+djCXcZeZJK43j4O/XKAdZPNvW8Y7hkiXYDAkopVmwN3g5mSXwoa2RNPc+c2QnYo2djPDWhxL85rj18rI+25CUIrbawsdXCRx5+Hfo2UkVW+wMfwXKgv8d/XdhFlNWYbN5h8aoVEoaBSYI63hXAJmLxUX7UMjiBEUebL0yPmwU5p2LmLcaglQkeUBpEq1edjfixT3PyFNr3QNbaDhIZNhtWp5WTeBSm53jSf81b1ytohKg8FyP/RMCoFElWe4b2hZKi7/c6NRnDpAfM8UIlbTgw9q5HD59FBGMJv5Z+vqjCaF3pI4vaSBz5KRRC56BRjT+BPRO7RtjqIL4dsD1UBcy4svr0Ekic=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac801e0b-9773-40a2-03ab-08dca69c224d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 20:07:50.1756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRCLXHTvzE+xdt41KmnG/n0IIk68yCxhXwU/NTIN16wTRo4Ths0YwTZZf9fBAxtM1cmRv3wzJDBLWf5ggXvAuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7694
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_15,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407170152
X-Proofpoint-GUID: FuZlo-JsEgFiXD7dNhTSTk0QHtpVuOdR
X-Proofpoint-ORIG-GUID: FuZlo-JsEgFiXD7dNhTSTk0QHtpVuOdR
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, Dave Hansen <dave.hansen@intel.com>, Kees Cook <kees@kernel.org>, Jiri Olsa <olsajiri@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Jeff Xu <jeffxu@chromium.org>, Bert Karwatzki <spasswolf@web.de>, "Liam R. Howlett" <Liam.Howlett@Oracle.com>, Suren Baghdasaryan <surenb@google.com>, sidhartha.kumar@oracle.com, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>

The arch_unmap call was previously moved above the rbtree modifications
in commit 5a28fc94c914 ("x86/mpx, mm/core: Fix recursive munmap()
corruption").  The move was motivated by an issue with calling
arch_unmap() after the rbtree was modified.

Since the above commit, mpx was dropped from the kernel in 45fc24e89b7c
("x86/mpx: remove MPX from arch/x86"), so the motivation for calling
arch_unmap() prior to modifying the vma tree no longer exists
(regardless of rbtree or maple tree implementations).

Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Cc: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Dave Hansen <dave.hansen@intel.com>
---
 mm/mmap.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index 9f870e715a47..117e8240f697 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2680,6 +2680,7 @@ static void vms_complete_munmap_vmas(struct vma_munmap_struct *vms,
 	mm = vms->mm;
 	mm->map_count -= vms->vma_count;
 	mm->locked_vm -= vms->locked_vm;
+	arch_unmap(mm, vms->start, vms->end); /* write lock needed */
 	if (vms->unlock)
 		mmap_write_downgrade(mm);
 
@@ -2907,7 +2908,7 @@ do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
  *
  * This function takes a @mas that is either pointing to the previous VMA or set
  * to MA_START and sets it up to remove the mapping(s).  The @len will be
- * aligned and any arch_unmap work will be preformed.
+ * aligned prior to munmap.
  *
  * Return: 0 on success and drops the lock if so directed, error and leaves the
  * lock held otherwise.
@@ -2927,16 +2928,12 @@ int do_vmi_munmap(struct vma_iterator *vmi, struct mm_struct *mm,
 		return -EINVAL;
 
 	/*
-	 * Check if memory is sealed before arch_unmap.
 	 * Prevent unmapping a sealed VMA.
 	 * can_modify_mm assumes we have acquired the lock on MM.
 	 */
 	if (unlikely(!can_modify_mm(mm, start, end)))
 		return -EPERM;
 
-	 /* arch_unmap() might do unmaps itself.  */
-	arch_unmap(mm, start, end);
-
 	/* Find the first overlapping VMA */
 	vma = vma_find(vmi, end);
 	if (!vma) {
@@ -2997,9 +2994,6 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 	if (unlikely(!can_modify_mm(mm, addr, end)))
 		return -EPERM;
 
-	 /* arch_unmap() might do unmaps itself.  */
-	arch_unmap(mm, addr, end);
-
 	/* Find the first overlapping VMA */
 	vma = vma_find(&vmi, end);
 	init_vma_munmap(&vms, &vmi, vma, addr, end, uf, /* unlock = */ false);
@@ -3377,14 +3371,12 @@ int do_vma_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	struct mm_struct *mm = vma->vm_mm;
 
 	/*
-	 * Check if memory is sealed before arch_unmap.
 	 * Prevent unmapping a sealed VMA.
 	 * can_modify_mm assumes we have acquired the lock on MM.
 	 */
 	if (unlikely(!can_modify_mm(mm, start, end)))
 		return -EPERM;
 
-	arch_unmap(mm, start, end);
 	return do_vmi_align_munmap(vmi, vma, mm, start, end, uf, unlock);
 }
 
-- 
2.43.0

