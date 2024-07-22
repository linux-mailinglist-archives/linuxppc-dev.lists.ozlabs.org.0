Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D37093909D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 16:26:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=A4AQtAx1;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=V4X/gIDH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSMzR4Fccz3cVy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 00:26:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=A4AQtAx1;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=V4X/gIDH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSMyg6HxYz30Vg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 00:25:58 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MCCMAa017880;
	Mon, 22 Jul 2024 14:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=SIiPYWebJi/Tiya
	vezm5e0QFz7E+eyLJfxWC7DTFglM=; b=A4AQtAx1JpAVzFmg6glKIyvZABraR9k
	RvuTTI+bPRTgLyeoXCAEHjF/6M2PZgWzuQq8uVJJ0iUZwwYXc21aIRQFZ0B0ddQo
	MvMigXR8tT/Nw8cZjn2sUFxZhYORbYiq1aCGUAKhscxwkYD/IR1xNLR3WDX6u+Iu
	obNL2bJO0XTggVuirViZCiHid2Bki140AKpt0MTrLdYelmEJYHRNcJIdNOyGQ67x
	5lx7GmcnC46F2uvofoI82LsvN9HzAODxDsP630PKzugNZjG16TiQrkXOPWW8cn1Y
	rBzLSVSUBR83FhKbH5e4JgF3UmtmHDUdd7Zp5Cw43MbQ3561iBUIEDw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hfe7a4tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jul 2024 14:25:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46MCkbFH010962;
	Mon, 22 Jul 2024 14:25:35 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h29ps57w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jul 2024 14:25:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNZfDOa5Zv29klzbZ1O/UoWRynsOG8OVUUNDOUGs9PvWvuy9us+uT4y5dYri2Re8v4XkglNLik8OyJXjlJjYi0FM1cw7oarMsx3W1s6lbmcp2xylTSH8DT75vO6I+zkyJnCefd2XXEC0OrqSxgCtRAFtPPeYAJL3qheVch+xCV4yBF/JG5U0cUDiR3AXXnvIep0Bj6GVyvWrgXgUMCYChkdS9gSc1Lw6nUJLRbXbhyDWaBk/gEGAFkF4LanSxuClr2ukxfcOXjrMdpDuSGqzE222jknEjfHYtKOmoJI3QqdB89EhMiO8VdvJYbYAp1YYFinI3KpsfHLWTClv+zxr4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIiPYWebJi/Tiyavezm5e0QFz7E+eyLJfxWC7DTFglM=;
 b=tFjwBznMlpiScnO8oh6MDTHWmaYc2/bVjlMydxAuOEn2iOtfTAK9JkMcaysda98mmFyXOtelA4YzeGa/CKhJ6dJTr44N77AGAJvoHi+izJGUwJwq0dEtF13JTfrcrbdn35fCTou+zVHkyyIqaij+gpzU0kezELdn4rbHqs8Y3fn7dgyz0pG+ylnPqAzkcTXGSt1MCefJp8xncyqxSDRFIKuSXY1GviX5Mat3+cdeQL9KhMa33qRxflHIskhjPFzgxAjPNYKu43BnpcmFdtHprC+A+42hso3HdvccTAioAemFOhrMhVseCmhyy/JjH57VLW0eXZ+6BgJkqtU+VJRZIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIiPYWebJi/Tiyavezm5e0QFz7E+eyLJfxWC7DTFglM=;
 b=V4X/gIDHuSzY2YHqL5ubMKYdg4Ekk8AVnNjNj3LvPKpdA+5VxY7yp3w/wK+qGJ/wBP4HUpC5A3E3N2uLw5bsoG/LQAgvvXosFtHes6EtSXhLPd628J2AzleJFXETCWP+nQMHyM7KxfWZnikbqjbj/NBXpiQ2gyO5x/zI6nG2u34=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by DM4PR10MB6134.namprd10.prod.outlook.com (2603:10b6:8:b5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Mon, 22 Jul
 2024 14:25:29 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%6]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 14:25:29 +0000
Date: Mon, 22 Jul 2024 15:25:25 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: Re: [PATCH v5 17/21] mm/mmap: Relocate arch_unmap() to
 vms_complete_munmap_vmas()
Message-ID: <1c3d5079-8568-4bb7-b2ad-05c5ec03fac3@lucifer.local>
References: <20240717200709.1552558-1-Liam.Howlett@oracle.com>
 <20240717200709.1552558-18-Liam.Howlett@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717200709.1552558-18-Liam.Howlett@oracle.com>
X-ClientProxiedBy: LO4P123CA0115.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::12) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|DM4PR10MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d6057f0-b07b-491b-6f50-08dcaa5a2338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?ygGbQVCHGAU3QEJ71veKx/s9nGKEZF+oWZKseAqzWsCsld134nPrpFglxYoY?=
 =?us-ascii?Q?qZOc4wVMBGtokzftrE0UqtaeBHcEqj1aKMC4M9MjVJ4rvplKnrZfX4nCjTsk?=
 =?us-ascii?Q?sRSPQ8DB3mxjpKFza5QNg/YdUHPioD7LNVLp1nWM+8qSKjoocZK8RCW6kbK6?=
 =?us-ascii?Q?rnHRYhwP1iTDWQjuC8aKRXTmEEebBbO+pHEUXaQZCXJxqVobz4Ug/zBXlY/H?=
 =?us-ascii?Q?B91FnliCfrK66tQDai3EDIjU002adMq/1034MIzz97JFRNQF4ofU8wklRTwR?=
 =?us-ascii?Q?nlsiewQo9GVBUXLg3eKrif9NzHH2Y3dqNSTUiWhNxIR+7MA8ujZFnaQyH8jW?=
 =?us-ascii?Q?i0lvo9aodm114NtNbDsq+xOE1RarPo7YRKPsuDitJyvPd0As8oz0nl5e9z+C?=
 =?us-ascii?Q?i6S/YfkmFm3s3NwFeNnqlT7V9DmdF5jE5f+A6YaH6TbgtMJyC6eLHYYRFMEY?=
 =?us-ascii?Q?Fs2BnhbGybYrePl3KCAMYPkc2Ve5ppwQ+j2SPV9Z99ySqEvAWBh+l/kwnoY5?=
 =?us-ascii?Q?cy0zDlFF6997SoqhewoFhZuA/oSCwlcHSY21dSkztFu/guviVVsqzG2fAtbg?=
 =?us-ascii?Q?nB/bMmBwLk0VeW+gqMso66XeAl8abFwdP9cj1ZrsmKTIuum+Q2BT5O36w/cD?=
 =?us-ascii?Q?RH0Vsl+iuWimWVdMk59jbkNKeMICMom40An/XGLXjJyIPCZyGdQxa7Xr5R1M?=
 =?us-ascii?Q?eTnygXqcIIm7tIvekncuiouSumL1dav/FUO0sM/30NIsKJoaW/2crK05+wkG?=
 =?us-ascii?Q?tbCgIpb8ZIxtwzdLpahBCiSTtBdiuuPJHTTOu6PXdRxCjgQS26npEEAlCGm+?=
 =?us-ascii?Q?qj4ZNyCxWMLKK4lMgbpamvzE2egoJXcfCH6qWc85x1ZOYQkTl/ilC1kLZBto?=
 =?us-ascii?Q?XIrMr9yzO8wYLkL5Nyrkd4KZY01vRDikQ9TOsiS/JeXykbC78ZyqWHWI7q9N?=
 =?us-ascii?Q?loEeu3v5owbKMv8rCP1ffu8eTpB1wJeL2SEWA9yUo+UKOe/WFT39iaAfCbBt?=
 =?us-ascii?Q?x+XJ+koPLrYGxxXlZu1L5hhZQWASArcv/YasvaM6+KcRQP3v0tWwH2C6VXeo?=
 =?us-ascii?Q?SsbHTgh9DPV76IDtK6kULU2nNMOvgKHY4BDvI74CMUVlZafj43n5X176H3D0?=
 =?us-ascii?Q?Vco2v9N268ofOG49NV0kitJiqjlPeAOuEvctPZKzuRNvZqlDqlk3T6azMoWH?=
 =?us-ascii?Q?qT1rHFaHxtmNISgMoSZuYOF9UyqSsTn9hDOiq3Gc1yeF/kmFaTIPHnfYfm9a?=
 =?us-ascii?Q?c8+pFo1LUVaYOeB35FFRYkMqulI/YcSdYeLivptBVFihyg0NJhhjCJC5sABe?=
 =?us-ascii?Q?bWvXUYJT08BUyrhYx7agzuNgN8MGzvmk/tfTmjnruza6zw=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?CqADJ9x2Z81EJr0fqyY5Bx6uCo2AZ+MXAAECAxBz5Fd76XpEG5Db/zGOCz8O?=
 =?us-ascii?Q?fHqjlLxtWiR+HZDMPgP0jb5UMJyYmrADUjmw4yurcq2b+XMg3jkBfYlLV5Kg?=
 =?us-ascii?Q?nxm68ICZGTTPR4M61CN0GHvv3zwyEKa2toUTEvcPU3ykYOf4416Af+WuoRA7?=
 =?us-ascii?Q?xWdjggBv6oi0ZrhU8LK1UdyhKERdGf8HkkkkipA4uUn3I4TGZckYcdHIvX9o?=
 =?us-ascii?Q?d9DLmA9IIEWlw6hEuwlTV+hLGrD1x0gAbh9No0dZrAPn9FE3EoffySJi5mRG?=
 =?us-ascii?Q?ks2Dn5SfC8fU18h4U0JPfY7ysCC0aHAoMwBKE1XPFNOOEv3pKZbPtwRnRdEn?=
 =?us-ascii?Q?NCPriqe6zjikIX2gTZGTxQ6BrBnjz5wd3ChS5ZLBV7hO3VbwzQO8PwzGm9x1?=
 =?us-ascii?Q?JfwoieWQQWacQnl2X5V+oQ6dUAcszCJdOqShwPmESppyob4tShT/gtFjGU2X?=
 =?us-ascii?Q?mQMZq2t8qGP0CpyaTUNRcs8VK4TbaHOZEtXNUXVYFurV8vTTbyIpysu6JXq7?=
 =?us-ascii?Q?y+nc9rDCNCNklRMbF/jHbfCzObqBmP/1yyCV0XA4MXsa2NBiG5jNUPTDzZD9?=
 =?us-ascii?Q?UwVpYvp+2C5qBFnm8Nke6jrEkvTJ7oY8l41Dx8pblx0eTxpUdJ0DbK62H6ok?=
 =?us-ascii?Q?Fvvi8Eeeu4QQHzo/X0y8pgga22OcZ014dZiasbes77aUeIBWZPyupEtorhqp?=
 =?us-ascii?Q?QXZexAqav7qQW3z+4YH5NQJb4yGAZnUcrfIHAQvEiQRSWnilYfuSE1EjWxXK?=
 =?us-ascii?Q?ph/pvsz+ecPm2lzYyLTjRNi5K7bBhpGBsUVLpiRRNeZfOBINgt9BLvsUSxBf?=
 =?us-ascii?Q?klHZz/4GZCZXnzUjv7C5crm9ORbcu3ObaeOqbsGSzOYJDOiK53Qg3fA8kq34?=
 =?us-ascii?Q?aiaY+pn6qepXrnA0cS2KsF1V5eN/e0JnbTbQZ0KI8LvJayx4eIj4bLMoTqnQ?=
 =?us-ascii?Q?hF1S2TTdk6rDaMWYjgXVOv3R3VkZbWShwBp91wFXWyJURa81XYeN7aYz35W3?=
 =?us-ascii?Q?4oSoCskh4ReLFVKvwIUIWDdd2uSy1DIoYg5nfJD+UPJhy5soKVWuiEBhRRxS?=
 =?us-ascii?Q?Bu4/shGFdYSduneCeDC3N910MbxN++0wWtYFg8Y+yIHXTHwgCIfc4DpnCIYZ?=
 =?us-ascii?Q?lIK1JrZxTGlQPRUkOj7kjwiY/W9/0aoS0k9zLg/EMxKqtcolqSUFFjbAAuOj?=
 =?us-ascii?Q?ZsO9VewwDA+DgdfF3UaINJBg1SZKnMs4IgBeKwJ3QnwU/JQhKZWkpkYV6ZkW?=
 =?us-ascii?Q?j4XvcD0HARDPWyfG/EcN6SEEpwvXuaFsXcEx7cXYmimea9FlJSNX0s/Eg/a1?=
 =?us-ascii?Q?t1mvcsEZKcBkhL/8HxKurswLul2GVcaFUn524zUqb6KP1ZEIdX5z4peb1X9t?=
 =?us-ascii?Q?ZujftzLQHcPMR0a/FsaB56M7pLOWLOYpmi5vjfhBHEk4jXwFfq6jvk2AD+Hn?=
 =?us-ascii?Q?zf88ki3SH7RY9lgvzS+bc4+hOQ9y2RpvNDINOIegj3Af9t5XPYPxlxGYpGa9?=
 =?us-ascii?Q?YBm/1lpxABX7QUcE7gV/pF4Rsn4xpSelbHIssodIy12U6o69A+71OHippsvu?=
 =?us-ascii?Q?AApqnPf8b+HIZDBuahhLwljKz6bK1lpxw3vo7MKEOkwRTLAzsFD+8qdbvHog?=
 =?us-ascii?Q?5/Fbk0WY+PXphwMZ/LkfpTjr5QJDq5ZxomKBpLDY84U88QgPziGp8OjeBHQS?=
 =?us-ascii?Q?gZldUw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	j9HTbALXb0hoHCaZFZ5zdcR+jX5ytmkBUlUFrlW/21V2qaLVeptP/qtwT14ZfHP1HGIRhmmxrEsLRe0EFUF0Akumoo76ckzRGwGaUTW2uU01Aa9N2u05mU8YCYodEPjpjZL9yGvCRXtzaPtI8jc31HRt3kfKLByTL5OY/Ho9W5nkpVNKNu2MoRdWk2MbU+rJeGnE6wyBl6T8BdvxKTepga/ru3fJMcXnbBFeuBrQJ4b41NYrxb46ug3+7cKmnYRJ1ttaazvZ5zhz5Rk2QzhlOYVmDCnfWF0GtQ4yb3oTkGb2ygy9oz6Gwx4WCTlYK6qhCX0aZFE1XYsrtKS+GqtO0uB7ckie0pLKeL8EMJ5F18Vr7jgMM8eK5tYukOWUdlYfbJb/zLr/7cWgsZRvBYJ6lZta7IYmGdE3zFT10TMZT+kYuCq4SwCQmRIZbKNieHeYmyRLVur2197PJitAHXk257a9L/CaIXOSDDc3YrY1m0kMOVeiIaPKT+e8/FsnkX9IetTpLzSr4OieVyG6r5A7fQfHRVbCqNnNgQF93AmGjSZKXrzpUKJ7gLOZ+zL1AUYNRB5miCe15s7UDoM/zh6yflfZ0bf8uYG+NX0GSIXvknM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6057f0-b07b-491b-6f50-08dcaa5a2338
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 14:25:29.5777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCqG5WxWC0FmOwQT8fF4iXasiIQUvad5sa2ExA8kGbA3HJyPyUSJ3nUQzm/qRk4Ki1rMK8pbXGwf7dNSEFH6heLYXu/9vprYunMc9f2D1xM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6134
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_10,2024-07-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407220108
X-Proofpoint-GUID: a8i0wnb2yPBNGsdCeB6isqNtJ_XED6tx
X-Proofpoint-ORIG-GUID: a8i0wnb2yPBNGsdCeB6isqNtJ_XED6tx
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, Jeff Xu <jeffxu@chromium.org>, Kees Cook <kees@kernel.org>, Jiri Olsa <olsajiri@gmail.com>, linuxppc-dev@lists.ozlabs.org, Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Bert Karwatzki <spasswolf@web.de>, Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, sidhartha.kumar@oracle.com, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 17, 2024 at 04:07:05PM GMT, Liam R. Howlett wrote:
> From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
>
> The arch_unmap call was previously moved above the rbtree modifications
> in commit 5a28fc94c914 ("x86/mpx, mm/core: Fix recursive munmap()
> corruption").  The move was motivated by an issue with calling
> arch_unmap() after the rbtree was modified.
>
> Since the above commit, mpx was dropped from the kernel in 45fc24e89b7c
> ("x86/mpx: remove MPX from arch/x86"), so the motivation for calling
> arch_unmap() prior to modifying the vma tree no longer exists
> (regardless of rbtree or maple tree implementations).
>
> Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
> Cc: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Dave Hansen <dave.hansen@intel.com>
> ---
>  mm/mmap.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 9f870e715a47..117e8240f697 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -2680,6 +2680,7 @@ static void vms_complete_munmap_vmas(struct vma_munmap_struct *vms,
>  	mm = vms->mm;
>  	mm->map_count -= vms->vma_count;
>  	mm->locked_vm -= vms->locked_vm;
> +	arch_unmap(mm, vms->start, vms->end); /* write lock needed */

Worth having a mmap_assert_write_locked() here? Would make this
self-documenting also.

>  	if (vms->unlock)
>  		mmap_write_downgrade(mm);
>
> @@ -2907,7 +2908,7 @@ do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
>   *
>   * This function takes a @mas that is either pointing to the previous VMA or set
>   * to MA_START and sets it up to remove the mapping(s).  The @len will be
> - * aligned and any arch_unmap work will be preformed.
> + * aligned prior to munmap.
>   *
>   * Return: 0 on success and drops the lock if so directed, error and leaves the
>   * lock held otherwise.
> @@ -2927,16 +2928,12 @@ int do_vmi_munmap(struct vma_iterator *vmi, struct mm_struct *mm,
>  		return -EINVAL;
>
>  	/*
> -	 * Check if memory is sealed before arch_unmap.
>  	 * Prevent unmapping a sealed VMA.
>  	 * can_modify_mm assumes we have acquired the lock on MM.
>  	 */
>  	if (unlikely(!can_modify_mm(mm, start, end)))
>  		return -EPERM;
>
> -	 /* arch_unmap() might do unmaps itself.  */
> -	arch_unmap(mm, start, end);
> -
>  	/* Find the first overlapping VMA */
>  	vma = vma_find(vmi, end);
>  	if (!vma) {
> @@ -2997,9 +2994,6 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
>  	if (unlikely(!can_modify_mm(mm, addr, end)))
>  		return -EPERM;
>
> -	 /* arch_unmap() might do unmaps itself.  */
> -	arch_unmap(mm, addr, end);
> -

It seems to me that the intent of this particular invocation was to ensure
we have done what we can to unmap before trying to unmap ourselves.

However this seems stupid to me anyway - 'hey maybe the arch will do this
for us' - yeah probably not.

So this should definitely go regardless, given we will invoke it later now
anyway.

>  	/* Find the first overlapping VMA */
>  	vma = vma_find(&vmi, end);
>  	init_vma_munmap(&vms, &vmi, vma, addr, end, uf, /* unlock = */ false);
> @@ -3377,14 +3371,12 @@ int do_vma_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	struct mm_struct *mm = vma->vm_mm;
>
>  	/*
> -	 * Check if memory is sealed before arch_unmap.
>  	 * Prevent unmapping a sealed VMA.
>  	 * can_modify_mm assumes we have acquired the lock on MM.
>  	 */
>  	if (unlikely(!can_modify_mm(mm, start, end)))
>  		return -EPERM;
>
> -	arch_unmap(mm, start, end);
>  	return do_vmi_align_munmap(vmi, vma, mm, start, end, uf, unlock);
>  }
>
> --
> 2.43.0
>

I hope we can find a way to eliminate these kind of hooks altogether as
they reduce our control over how VMA operations are performed.

LGTM,

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
