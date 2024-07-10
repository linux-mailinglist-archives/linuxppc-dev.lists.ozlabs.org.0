Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEF192D90A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 21:24:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=PXtWlpOb;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ECRiIXPL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WK7914G0Rz3cYB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 05:24:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=PXtWlpOb;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ECRiIXPL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WK78K1FMLz3by2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 05:24:07 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46AG3ITd012180;
	Wed, 10 Jul 2024 19:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=W18XszWvqh1fOjVwbse2DTRvwRw3frweJXxqWBMiXto=; b=
	PXtWlpOb2I3OZY69snEOtruvJc6tmBxqL5ahByZMS3/eE1uN3sVizcRP699swLSV
	kXhIklWSNPKqiu+UwkWmqbSj2ynMWtMvMNGdzhNYXYnUX/29Cl/FNS1fn1tuQK+d
	z1IeINqdgqFCdvlT6cBVGjoDRHhWzsArjS55Wq88U9LHTCyHJ/aWltP2sgXEZsEo
	MxFt57YkLTnyEICKwAZmdQpTmJ40lBbGYBkri/S+WYbSgcXu7bm2n0JOcWYlNueY
	+UrSDSNSBRNEtNzjeuY1UWMiU6D+tXiFq0JJ2xqdal96Si0uosCTloDRncIiDLuE
	TppXd4HWaUEnvrLyc9Rzqw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 407emsyctq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jul 2024 19:23:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46AIlfXt010839;
	Wed, 10 Jul 2024 19:23:42 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 409vv4s3w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jul 2024 19:23:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgaGPzlW7Jk+s79lWtcjvAZT18BvxhrBpTLCOe7VomVqCc6t5Vlkih1HDr6+jw4bdBneZDemXB9xDyLY+NcFkv1whA+5Fdx58IFPBo7gYpqF1MeMod8N1+JJF7AaQMrAScqFQjAfUnVIca97msV+48k+EZPfj3PUm+o7IQBH2jwVnq7Cb/pYlRmm08pXq17ApGwHQzEb+D2eNgvkXJ0YSLkzudVCh4JMwsk6R17EvUbpwUlpJ9An142qplGgB9nb9YZWyhKos94pm6utaI57GyNkZ1+jhdyIaQUngg8VRY5eMlzjLEfwr2JXeqNtKa+uv+zcDjCdr37spaKYJ6w5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W18XszWvqh1fOjVwbse2DTRvwRw3frweJXxqWBMiXto=;
 b=Jo7uV+NExocfVB0okTYClrfD29YjEubRXzRUtacUJbHl/Qs5lqOzLPnQdf3o/L9B8y5wZ8S42omPqjjqRzVnXgtrYl1LUAtRpsU74oHHdkhZ86cddmAT+Hee2t+4rePW+v5bAxi3Ro3pdS9N4rbcZZ8630YOd8rKBS/1DaqEoBwjE7B+AJ1oQlox5ftJ1QIpWyo/LDv31YnoEiuPmIkLx8cyjNxz908oE2WGVmOyJVgxWbdjZNUa9sk1ufKYSjqpWZjnF+gCyUmJmp9HrILKx3QhT7dA+f58C2rGc6cfpgoUF2ykUMFduWX8G+tLB/+0J6Cw6zY/CeZ83eNMU+3kxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W18XszWvqh1fOjVwbse2DTRvwRw3frweJXxqWBMiXto=;
 b=ECRiIXPLNhtWtj5pmQtFG36n2IFs0FQ5RuTz6g413/9TzM6ra/b7jx/5/fC2eNvFDJHQIYH9yKnzxvD1iebCRELwWIrs1rbxXbhhY2zUsaGtGADKI/f/JUn+KSnTBqRfpytvKLuIjJMcSHPlWv0is763Owg4gF33FZEI5OskeX0=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by PH7PR10MB6106.namprd10.prod.outlook.com (2603:10b6:510:1fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 19:23:33 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%3]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 19:23:33 +0000
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 17/21] mm/mmap: Drop arch_unmap() call from all archs
Date: Wed, 10 Jul 2024 15:22:46 -0400
Message-ID: <20240710192250.4114783-18-Liam.Howlett@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710192250.4114783-1-Liam.Howlett@oracle.com>
References: <20240710192250.4114783-1-Liam.Howlett@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT3PR01CA0104.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::29) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|PH7PR10MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1649dc-5274-4076-1713-08dca115c9e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?cY2t7v0mAFCCfuouD3cpYay9V8vHfA88MH6UnDSeEhmd06IH77D5VkXAUDZP?=
 =?us-ascii?Q?uRtdT7/0Jg/KIrqba22R2GGPfgfOMGalXiPloTSiBiAQail3CjP4fDkaPKcW?=
 =?us-ascii?Q?0NfRP8TOvXLqJJp1Ile26e+VyIGnoUvHRfeb+QSqCuVk9bDLXEM9T48WA2L6?=
 =?us-ascii?Q?5C+a7HWPVpi4XEKIXuNN7+pMtfkd9WI1zsVbJrg0mrAfKWyaTaGIB80pfpD5?=
 =?us-ascii?Q?akHz7S3GvFho9rE0fa7j6YoScNKruJNWW20eV3oEEWy8164c/LdhKNv77T9k?=
 =?us-ascii?Q?JRp7W1aiq9dBOGqFoDnYy4o7gyark/eGc+swaDKhM6fBuSk62lhE4l0kYUWf?=
 =?us-ascii?Q?F3gRvUvqv4DFkSj8KErQvQzEhqShM7VnGoCP8mPGOqszDsA58N5VDXvPUOKN?=
 =?us-ascii?Q?c+m43bdlcJJy556RJ2e2Y0wchI/TW6Numx5JZdNYvfJoKeE7nWWZEc5Z+bcN?=
 =?us-ascii?Q?UN4YSyHZl9qO5mqn1zuoxAijFGs4woeQTzBy3x1pQCAdJc5R2td/SCdsyJBS?=
 =?us-ascii?Q?fXGzvrZs50Lvo/sUTWvyVlbWyEh53m+gShWrFWSSLlnoTtolAR4sdgy71vHk?=
 =?us-ascii?Q?YGE1xIN6+41kOxDsFwzh9qLZ/YX4j7kb0IeCzRXSUCdkHHMiVaaagjKVVz/R?=
 =?us-ascii?Q?//ueNSUtz9DU31LwzFsvtODCp1vvwGenWNhCutaj71UB8BaInK52ReEN2DoL?=
 =?us-ascii?Q?2+o/uv0mKOurK5QP4cysjK8H9Ufnt3fiqSDIPrJvbPqucXE8sk/7ZaL/KjIu?=
 =?us-ascii?Q?9eDiCQ4sOBVXGPXwKSp8mbqanOHX1mllFQSl2UlZkwA+6znbO3Mf4LGv3Dnn?=
 =?us-ascii?Q?joNoTvXzNofK95RzXufx+51znNCrCEWGcGGfot9DzpI0KPagpjErPwQhaEKz?=
 =?us-ascii?Q?1P6gALgF4IYmGkEQBr5X/y2MR0GPD0yskve7py0FbeWMhqsqq8vIrK9B/hvz?=
 =?us-ascii?Q?2Gx4NY/lQ2y2iCCEo3WMwIYLYMro85QafqYTqAO8b3IMBKXSvWMddPhTESIQ?=
 =?us-ascii?Q?Zr5R5qkZbcGTko3T/DZr1eEF+TL5fUaljrrITeIf5ItX+FuNd2t7GuQ6Um0w?=
 =?us-ascii?Q?qAoL0sG84Ws95ybys/i4LBCF5zWWxuJ313Bd89fJ6fA7vM0B4oy544XL3XJD?=
 =?us-ascii?Q?mM0LLfJPYEv/AJfj09p7t9TCa0EuzopffgNXe5KXL7nnCCR/CDvIKXTHACms?=
 =?us-ascii?Q?N6o4ZvC4jkX4+fARAyIjRD+eFQwuFFQZ07lOdploWirRRCRU6w6/hsFXdORT?=
 =?us-ascii?Q?1Wsl02q6L0f+xT9Ybe5ETvh9OHZWJiYqwZcU5MmO6lNGmF0xhUfmEAkQeg2+?=
 =?us-ascii?Q?bCOtp3F57xRj7No+MqBpB2YV?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?DWS8VbW5VtiCheZwyLzM7/8zK+tO6MGPoL7A9Y5pGZ1aDA4ATaamauhLa4KL?=
 =?us-ascii?Q?y3Gs8PSKHjCDnIG6KyYKEezmXCMPGB+dUHGwJO48T+7ZWxjXRgwJKJYT4M+a?=
 =?us-ascii?Q?brRH0tKcuG5/g6PLNGRJcUnN/F/AXvMESDzpz17vvdFMy7sJ+yBPtPcm8zPS?=
 =?us-ascii?Q?da8aErlNGUfUoxrYVyJXNdlBcT8miyqRVfT5s47Lgx6mtEfsE50IelTGmCTh?=
 =?us-ascii?Q?8dRgcaCUCtfm1/bQubiloXrgf1JQucEgujSVRF/PtH+qx0UTbLLVFvQeQjSb?=
 =?us-ascii?Q?Hj1OUzfpdWWvb+/K1Vq1zcTskKLmAd5wS2LUo7Jrt4kzVHg8ERVnm81sGOZp?=
 =?us-ascii?Q?QhazIBMG7Ugp8eD7tWx3ZVaxxUwZBEsCFcD2XbjJDsw0+h60YKOrCcOawdES?=
 =?us-ascii?Q?JUk4UaWHtPKBziQWCArEjBtuZDlFMWZ1fH51auA29JbESCVsHvDbd1kV+DWO?=
 =?us-ascii?Q?z7i15P2STh9CRVzBPCwc3oYvE3RPPH4DxKrl1BP2N8LkbXW6ed4BPxmgIDki?=
 =?us-ascii?Q?JGdQ0xBJ+rpGB0AMZWLVWrwgqV9Gp/OvMxuiMBi1P1z4bHZGOwyOn+D5nAwf?=
 =?us-ascii?Q?1qqbJe1zBT3ldvt9qcJpA3Yu/YwsfAKtLgoLOuSmVR/wElIB3F+exClgobCe?=
 =?us-ascii?Q?oP0sQq5IgtK6wVXufBnlp0X2vsyvovVYBZE5TRSZf2BFhWd6BnJJlzZqyPRj?=
 =?us-ascii?Q?Gl6DoijSYvrfoIUXTW8RbOtt/rj/FkanvvQdNIrluQfk2FEzfXK8M8Z58lwD?=
 =?us-ascii?Q?abaJ1gXtCR+gssbWsw2qwdWuxWg1RzpBCJBZ8kh5I1YkFv50avFTGSXTwAfw?=
 =?us-ascii?Q?uVdhpfnPjZK94P+jx93y0r9uGR5n66hLNWb/C33of0IS3D42IuyMTSrvSiJ2?=
 =?us-ascii?Q?YKAlZMNjvB+jYcN44c4NMEzwyp6yX2Vv+jidp1PUeQV8Lq/lS92zDD0AY17K?=
 =?us-ascii?Q?sA6N1XcPoJ2iYChGTXfo7kxXa4/gg1i2Psw/c/5cgruOqvn/IHPymcNgva5A?=
 =?us-ascii?Q?7sjXZ0VWq6qsodVxnx5r/76PqCWnP5p0WTU5AskCSUiF/QfWF+0kjTUppCLA?=
 =?us-ascii?Q?WSM/vIZf8kCSzFAApXNpWNlY/qgAkdXesxdo8oGWUcWJYmCtA0BUdi20b6Tn?=
 =?us-ascii?Q?zecbprm4ecbP60nXqazGqFBf3Wr8XDt3UZh2vm8Baxo7IESgFBbcLR1r1vhW?=
 =?us-ascii?Q?tHxxiqgMQxpVMjMZW2/9/bPKCgUDos1BmVVTil7E+2q5BXv2Hrlb9nHeGjfc?=
 =?us-ascii?Q?RnMJ65oeD0PluDSxnMqLXRZ5+Z+PgfteUW+Qy6v4n/cbtJ7UzATzYVoh4WSg?=
 =?us-ascii?Q?WP+yQcNCbQtrR/F8nsJfc6zFisussRGU1T5YA5TeTHxtfltu+MdgSwzQS1Ol?=
 =?us-ascii?Q?G+KOYn/1o1UhTfk4POFU4ODvcQ9jCmPzEnQFc0V2WitoQPk3LFo8gyhvwAca?=
 =?us-ascii?Q?XWGAD0/kR9Nq8Lzu5hUq4L8+MgC3ZrFUcWkgI5bYitkla08KbKuvVGcVdn7K?=
 =?us-ascii?Q?SaVL/ofGDnxrbTLH/WbQUOvO+Um77F216HdLDG1YvjvoQpg77cSftK9hxWwp?=
 =?us-ascii?Q?pJL6LNVqZTVjRnshrKQRf9Dz9siHpN3PEVsCZVvPcqyKm8fnVsUVc5bV7QMC?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	Xz5FhkQQuAXT8V03cFFZiF88/Jm9UN2Rmo5Upk8l+bo7nComHZVz2F2B1YP26PxvKh/LiwZzn04STMYTrWHWf7krVjXGCBtvwqlaLW8FPdxwpD3ugVsNOtGXVd6SDatiXt4KxuVD2+TRsWTYC4tqjtf+jyZO+VocE969kH3ToQW1wtsmZp5urcqa3vhBrnqHYdf3NNotEZ1ZugdYaqdTKL3D71zlZD8dJBWFrXu2k6kfodOh7tiD5RcoF1CPDJNu6VC9pc3yZ47uG8fCnQZHW4K+TaH4AGw6C/EoANMUx+ziE9wZ9hs07zve2/177MWp2cRl18zHncxrHDeG7JzStoa/dycgTbvg+WFQz1axLQX+J3sDvDFF4lQYw4DUcInkW512z4Dx08EPc+arSpRTet9z7th3eJBNUxDZcKsCmfsyiYFM0HAXjVwkzX1c9FqhTGv+07IQX+2BjlEt2KUpBkOWjOObZp4Sps7GO0Au+kT9UIKZNEZnDxIxq80ezXs5hP+4zoWsSKeNL9JN1VKJKVXfoAoYP73sljFJLQ+Y/EbAgGCgBrYrENyf0uehLuThFd/aS8fRzzkNPLBk5t7GiZvUeTbSc/VVcTO+CMcAHJY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1649dc-5274-4076-1713-08dca115c9e7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 19:23:33.4315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzuAd0VlSWagOC2oGlL13r/IlRuKOxcca8L4DgZw7GhMmJEDcmFSzKR30wviNiYUYGnS6wGQc0T7LCH2upKPRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6106
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_14,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407100137
X-Proofpoint-GUID: ILyZD4BsG5QRVH4xa4azHR37Os1ZtWWo
X-Proofpoint-ORIG-GUID: ILyZD4BsG5QRVH4xa4azHR37Os1ZtWWo
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, Dmitry Safonov <dima@arista.com>, Kees Cook <kees@kernel.org>, Jiri Olsa <olsajiri@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Dave Hansen <dave.hansen@intel.com>, Bert Karwatzki <spasswolf@web.de>, "Liam R. Howlett" <Liam.Howlett@Oracle.com>, Suren Baghdasaryan <surenb@google.com>, sidhartha.kumar@oracle.com, Vlastimil Babka <vbabka@suse.cz>
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

Furthermore, the powerpc implementation is also no longer needed as per
[1] and [2].  So the arch_unmap() function can be completely removed.

Link: https://lore.kernel.org/lkml/20210611180242.711399-1-dima@arista.com/
Link: https://github.com/linuxppc/issues/issues/241
Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Dmitry Safonov <dima@arista.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/mmu_context.h |  9 ---------
 arch/x86/include/asm/mmu_context.h     |  5 -----
 include/asm-generic/mm_hooks.h         | 11 +++--------
 mm/mmap.c                              | 12 ++----------
 4 files changed, 5 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 37bffa0f7918..a334a1368848 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -260,15 +260,6 @@ static inline void enter_lazy_tlb(struct mm_struct *mm,
 
 extern void arch_exit_mmap(struct mm_struct *mm);
 
-static inline void arch_unmap(struct mm_struct *mm,
-			      unsigned long start, unsigned long end)
-{
-	unsigned long vdso_base = (unsigned long)mm->context.vdso;
-
-	if (start <= vdso_base && vdso_base < end)
-		mm->context.vdso = NULL;
-}
-
 #ifdef CONFIG_PPC_MEM_KEYS
 bool arch_vma_access_permitted(struct vm_area_struct *vma, bool write,
 			       bool execute, bool foreign);
diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
index 8dac45a2c7fc..80f2a3187aa6 100644
--- a/arch/x86/include/asm/mmu_context.h
+++ b/arch/x86/include/asm/mmu_context.h
@@ -232,11 +232,6 @@ static inline bool is_64bit_mm(struct mm_struct *mm)
 }
 #endif
 
-static inline void arch_unmap(struct mm_struct *mm, unsigned long start,
-			      unsigned long end)
-{
-}
-
 /*
  * We only want to enforce protection keys on the current process
  * because we effectively have no access to PKRU for other
diff --git a/include/asm-generic/mm_hooks.h b/include/asm-generic/mm_hooks.h
index 4dbb177d1150..f7996376baf9 100644
--- a/include/asm-generic/mm_hooks.h
+++ b/include/asm-generic/mm_hooks.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Define generic no-op hooks for arch_dup_mmap, arch_exit_mmap
- * and arch_unmap to be included in asm-FOO/mmu_context.h for any
- * arch FOO which doesn't need to hook these.
+ * Define generic no-op hooks for arch_dup_mmap and arch_exit_mmap to be
+ * included in asm-FOO/mmu_context.h for any arch FOO which doesn't need to hook
+ * these.
  */
 #ifndef _ASM_GENERIC_MM_HOOKS_H
 #define _ASM_GENERIC_MM_HOOKS_H
@@ -17,11 +17,6 @@ static inline void arch_exit_mmap(struct mm_struct *mm)
 {
 }
 
-static inline void arch_unmap(struct mm_struct *mm,
-			unsigned long start, unsigned long end)
-{
-}
-
 static inline bool arch_vma_access_permitted(struct vm_area_struct *vma,
 		bool write, bool execute, bool foreign)
 {
diff --git a/mm/mmap.c b/mm/mmap.c
index d5bd404893a8..df565f51971d 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2652,6 +2652,7 @@ static void vms_complete_munmap_vmas(struct vma_munmap_struct *vms,
 	mm = vms->mm;
 	mm->map_count -= vms->vma_count;
 	mm->locked_vm -= vms->locked_vm;
+
 	if (vms->unlock)
 		mmap_write_downgrade(mm);
 
@@ -2879,7 +2880,7 @@ do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
  *
  * This function takes a @mas that is either pointing to the previous VMA or set
  * to MA_START and sets it up to remove the mapping(s).  The @len will be
- * aligned and any arch_unmap work will be preformed.
+ * aligned.
  *
  * Return: 0 on success and drops the lock if so directed, error and leaves the
  * lock held otherwise.
@@ -2899,16 +2900,12 @@ int do_vmi_munmap(struct vma_iterator *vmi, struct mm_struct *mm,
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
@@ -2969,9 +2966,6 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 	if (unlikely(!can_modify_mm(mm, addr, end)))
 		return -EPERM;
 
-	 /* arch_unmap() might do unmaps itself.  */
-	arch_unmap(mm, addr, end);
-
 	/* Find the first overlapping VMA */
 	vma = vma_find(&vmi, end);
 	init_vma_munmap(&vms, &vmi, vma, addr, end, uf, /* unlock = */ false);
@@ -3348,14 +3342,12 @@ int do_vma_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
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

