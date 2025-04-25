Return-Path: <linuxppc-dev+bounces-7972-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D14A9BBF4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 02:52:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkDpB3qHfz2xtt;
	Fri, 25 Apr 2025 10:52:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745542354;
	cv=pass; b=aJgNgq00MbLaGHEP6UmUfPXtLndPdLgzCYgUOSzcIpJNMehANl8rADXwj905cllM4qUdZm5QtGJNjr9CfX9HcD4Z+I/T9/NCAGi6BTk4vdPXI/2kT05CYcFp6q1r9jjbW8x5FgJ4G9wpalFgbI04SFxnniR+d1fiSl/cEFXAgE2LBuKX+Q2dJbHpIadt1kDZB3eWcoMqh1t4y36kXMazyXd2Ry0DAGDxowEuqqICdbm6m3NVgvcThTK/uw9LWz0V/szPcG9ulIvXVBd/t2kl3mNuPrqpJukpxei+c8IiB062hXsxpWDIIhJo7pr6pQpbC/RkvBEnU7Yqbzw+4+2/KQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745542354; c=relaxed/relaxed;
	bh=UbPCJZ7EqbgbzOETHHXtELMyvOc4fgLtqQceM3cU6Uo=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=ErkehK8ujaubyKSi3kMSPxedPvB2vpfkwtc3qe/7LdyTIuD1ICD5hz0swTN3gbmdVM3NyLiEJ55031NoPgvv6sJf8bKWKqlpUQ0nO5nx5UFutFjGQEnL8Lp2rLXWId9c8XdWT7dqyH5gTil0BjeAsUDQub+csXhU9AipItayAt/a5qDt97MX3e5g3Z1h+3PdcZai5HYDd7TqyE2+KuEpOcCp4V5/1JpDHKSQ6Q9Txt316g180oPJ4/LydXBHVmtJEzaHin2HRvu6BZKNeMmrp2qACH9Svam/V8AUR2bWRQczpqx7mbFMOMkkyyKwYjHWMm0x16HfCf4oFI2HDyTVoA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=gpj0nAjX; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=j4N7AIas; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=gpj0nAjX;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=j4N7AIas;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 70 seconds by postgrey-1.37 at boromir; Fri, 25 Apr 2025 10:52:32 AEST
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkDp85LMqz2xsM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 10:52:30 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ONwnBB019355;
	Fri, 25 Apr 2025 00:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=UbPCJZ7EqbgbzOETHH
	XtELMyvOc4fgLtqQceM3cU6Uo=; b=gpj0nAjXGmAaaly2QhOxc8AX8ebtCfdosF
	Bcwv4r2ocRkG4Zt4lJM74t8XvTnaek4fMHVyx/s+K7P162XVZp70DRD17wdTnJvF
	4SKoqWSDVQwwgm6w+ogPtsk4ezsFBBKXrwNODjEDoqP2d0moLdI0kr3BoK5wgEdG
	0Sgy2CuOy1oaB63w/3wO8jYcXTnTboD0E2Vu8HElUeuO+LjnUNXbOxCioBtc+lr2
	ITMFIttsmyuZhxA608rB+vpnGN4/dacHlntTUZLUaTbU0ES/H/tqGAJxb+XRqiUE
	oCh/pClwXcYT8ngasQY1i8lnyVUhTa0B+vJYTF0vNfXeBAGf1KuQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 467y2583wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 00:52:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53ONAlgp024806;
	Fri, 25 Apr 2025 00:52:12 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010002.outbound.protection.outlook.com [40.93.13.2])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 467puc60rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 00:52:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjGi39T1CwUGpWz59u4cfTIAn7V3EUQjm7gsDkoxyxS6bb4i+hGfnyqb0OyeKgy8kl7/RttVs4TmUda9Z6G3ZVwsHeHn8/cPgJKYMEelG+AeNaxLN2NFYfR4mdtoNcgpTFw80DRWTHI3xK6MxGBvnb5Ez97cMLo1AdAgyZn7CMN0ZdXmidc0/815hJ73OfgKQOusOu7CIBL98sckZV/daXKdsTK6psJxWZOmgBltiDce1B/n05wWgU0Obpr3Ivn58LH65+SglVpbjaCILZJ441Nj9bV/k1ZxkVukhmXDtUdjNusL+kZgXnlXY6+/nsmTBHnHOVn/NqU46PonIYlfcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbPCJZ7EqbgbzOETHHXtELMyvOc4fgLtqQceM3cU6Uo=;
 b=ENu+yGD2847xCe02JN8aURWgNkh/BpMtsBQ/xM1ZmOzSRcr+9f86xpfuY62UGeoJbffsT5EJPcGsA2OsoAyvdIE+VaD3MlnVHdZwUY6BQ17GD+r3SZeTxM+0ZNiI866o57RNEU8BIa4JHygs8HEyAcdcMNLcYbU5S751P86oYDoHFF7kCvK10nIyKv/fDW4Vua4phgGBXUVVmGi43gM/mPfaxDPqSdEYTozg69vFgpSjbd7zbRs24t0AHoPbUcAx63eFxaiwiWniKxks/OXEwAOplRibSNbm8Aye1NSkW3xbv97UDVR3e+52vdsB8zrAJ0L69z/6sM7TlQv2hXnqIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbPCJZ7EqbgbzOETHHXtELMyvOc4fgLtqQceM3cU6Uo=;
 b=j4N7AIasRhv0wND/XC3swYtSlWv8Zri9y/+ihdp8LfDZIKnHzo+P4jl4RiY0XoHFX7TTQOs5xOY9xPxASysfoJ+TzJ1NaJlHS2Fl9GyJOpCmdPmrRyKyK9pk0n3/DBkVPzUG3LxraP7DZvMPjguE2pud0193CLcmQTeXx0fus0E=
Received: from DS7PR10MB5344.namprd10.prod.outlook.com (2603:10b6:5:3ab::6) by
 IA1PR10MB7167.namprd10.prod.outlook.com (2603:10b6:208:3f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Fri, 25 Apr
 2025 00:52:10 +0000
Received: from DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::b527:ca1f:1129:a680]) by DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::b527:ca1f:1129:a680%5]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 00:52:10 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        <linux-crypto@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-s390@vger.kernel.org>,
        <sparclinux@vger.kernel.org>, <x86@kernel.org>
Subject: Re: [PATCH 0/7] lib/crc: drop "glue" from filenames
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <yq134dx6p3o.fsf@ca-mkp.ca.oracle.com> (Martin K. Petersen's
	message of "Thu, 24 Apr 2025 20:51:03 -0400")
Organization: Oracle Corporation
Message-ID: <yq1wmb95ahy.fsf@ca-mkp.ca.oracle.com>
References: <20250424002038.179114-1-ebiggers@kernel.org>
	<yq134dx6p3o.fsf@ca-mkp.ca.oracle.com>
Date: Thu, 24 Apr 2025 20:52:08 -0400
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:208:32a::27) To DS7PR10MB5344.namprd10.prod.outlook.com
 (2603:10b6:5:3ab::6)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5344:EE_|IA1PR10MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: a56f406b-80e2-4272-c645-08dd8393690e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+KOT/s9hTQ64PKt71w8qMJTK6csvUoSogEXtIsPN9vtbE6eRZoRfSHpeB4HW?=
 =?us-ascii?Q?5yN1pU9n2vIrfI3XEJezzHYilxhezL6G1AkyFr47aBk4ajzF1TnvClvJkBDa?=
 =?us-ascii?Q?t/yqaCRv6dYSBo2OaAFllhTjFMNFueaYADvEW7OHrx7KyyxAw/JzyT31SaBF?=
 =?us-ascii?Q?S4Rt/zonWCN7A6gVbvkGfC545MRtuX0e3gp+yU/BhmsI6IdOe56WU25qNbGK?=
 =?us-ascii?Q?JDt2NvlMjmoVo1oHlYkyUU0yZocZweRN3/JKxUxEVjqIrblxgiivsTGOI8Qt?=
 =?us-ascii?Q?CgbnEOwyxufeN7LH0dQ+p1RMUqG8GZSqdVZqRfLTvCDb8Mq7+tty3E6FXRtR?=
 =?us-ascii?Q?SseF9FHQnVf/iJ+AdPJCTsnfPNcVK5hFpONx8bc9HBf0FmE7EA5OaCo20CSx?=
 =?us-ascii?Q?FdcDDFxBoOM7BMXESCYgVR+yiXptrUY2iA3rwOnbxDtmG3YbRAW0X5fDis2H?=
 =?us-ascii?Q?3o4lm02lTgNzKhTy6+RNkfciNm4vyre3WNp2OGcENS61vkeg8k6tqGC9HOne?=
 =?us-ascii?Q?3Hq9W//LeF3b0ECPKEg/1ZthcWMt0e9zkeCNg1cFe1RxrlL0hgRJjHnL/Ya+?=
 =?us-ascii?Q?oEA32atks1wMPjX83gMslf7Itcn3nmyTnr+hYjw9hgSt9Q/qAhR8Cc+LXfSq?=
 =?us-ascii?Q?h8XEj7kDZUYHdaxM3yAbxqRaeBAZxDv/truHEn8flcNjBgsQ72rHjpwqgaa+?=
 =?us-ascii?Q?IZ6J3N7qhdv3wKyR3e60RZAvdR0a34E/LvPWEirJYOXVwGjXSiUeZyYX8yd2?=
 =?us-ascii?Q?pUZePjMAE8KV1GdngTgRUGhLaKPRLC8Z4j6av8rk9Occ91Q++NOS+5iI3ShT?=
 =?us-ascii?Q?+aW4kD2yumjSCYWwcBrnp61woOOolfsEVfVyVrSVUNRpcyeI03879jDFsrwN?=
 =?us-ascii?Q?mx8oAdUFxQxIxdyD7jnrTNRh+lMvIe8MLqHjDMEdgMgEohcwynB61LcQ9TTs?=
 =?us-ascii?Q?gir3vsn5Hw+co5Q+RvdXyWAf33ks8/CgbZNHiZKoeBKpMIKqxhfTntsmSqv6?=
 =?us-ascii?Q?LE4d9fduCwMxB00BNV5ttksghd5JmoLfWJ1F82FYxIL+Nd+pxwdkm5q0yoGq?=
 =?us-ascii?Q?4WGXtzPSQYkfIq5Zd7OTMxMvvKqR5Nb/pSDLy/IALGskCQXUBW+h4kiftyBc?=
 =?us-ascii?Q?LAFKhtCJVImP4XjULKeW2Cpaufr42/bjhDqEz9VlaidpiqgYr7xOpSwKfYu8?=
 =?us-ascii?Q?QDqgAhZlREmhBJ5cpDTuHr/UOUPABIKEEfUdh86ChmuFCXbeY+KdJ12w0HFp?=
 =?us-ascii?Q?+JzRCvFYSLQ6rN7r02BbWNYGY6exCTZ8TzNjMATYzIPnlRiEE3HqvVhUkswG?=
 =?us-ascii?Q?kBlkz2NaA28LqPPNsEO28lS2U/I6z1brmj6yObVUEW2DyqM5BYKowvhsccms?=
 =?us-ascii?Q?yQvUUFc3yc972CdTfvL541D0C5t5n5Wa0y/YMWjO+0+hgKdW3rcJyxWxoTvZ?=
 =?us-ascii?Q?Qx1Dec00oEY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5344.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GmIA8xRvO4MHIwNnnfFGuUE1XDp0gVGN99YYcszAm0ZaLWpTx6JK7TAo4mQd?=
 =?us-ascii?Q?LKc4O+/5BxIFh2axjwvbRWXKkWTpuMsw6fDbNXT4V+wBdPnZu8zCRA6bKiSW?=
 =?us-ascii?Q?vnnOlTYn8z0cyiauxd0OylB3EbQxf29irPtR9UA3EKAx1bWQZSFaM2+XO7Oa?=
 =?us-ascii?Q?9h3EaJAKbcdF8KFusIj4PB/Uz0nkKwpGDAnYwFk6QGUpnwkVnyGYt1nndkNf?=
 =?us-ascii?Q?5eP1fiYQAmxeXNY7NKaSeJPIuEZztYu1Zad2Hkmsg6YQTiwkHBMoW2S8JV3r?=
 =?us-ascii?Q?FS6jeZSkKqy29jjvm2TR6MM43AGKVJDijbEru1H/yTvn0uaAqSfmdxcIDAZ+?=
 =?us-ascii?Q?ZbBa8bqkHbv+1wW8NJp+ymNRL5kPQTB4A2QS9gC1UI17InDhd/h7+sOOvoPV?=
 =?us-ascii?Q?eJcF6gl91/oZ4dfPMrYCOrDrZ5fjDXUC12uUJtzroIRXdm+0ndeiuObl6aJa?=
 =?us-ascii?Q?MleGJmHEDIpIqJIQKQ4xBnqDMBhETd7fnQdh7+lk7hbgaGAkzE9K3TRZ6P5E?=
 =?us-ascii?Q?B2BxCOA6ZOD6OjQPSkZggmXculEYTnHFl8XOl4ynMZo8TEIJMsLZJaGcPRVq?=
 =?us-ascii?Q?cR487eMa/6Qg/mK0Sj99+T+JAp4D03DzQEO8/FPoZ26cm7TysD9/ZQqbzQdo?=
 =?us-ascii?Q?TBk8yGWdVZUuQdqUL2lAnUZG0SDDsYqM2MBR4pbwMCkc9mXrDuBDg7PUOC21?=
 =?us-ascii?Q?BzOtG9/LQlY89hKqdlqGO68iR0Cg8/5axxwKZMzKo7VO7vsFeVvs4seobaYX?=
 =?us-ascii?Q?vDKnkmHVXbfqlk/Vq927sLwOQ3YS7ph/+6cz8Xg9pthX6juoZXX9b7IIuuiE?=
 =?us-ascii?Q?n9/ml6fY44XX2jqPrrMMmatA90OMsfXrCphjGfb3hAPrYM6G3Agth+Pa60r1?=
 =?us-ascii?Q?oqPSj9XnBg2kreUI0Ac5udJNcSUgpf1rVd0ejNfMdqY4RU2wn2i7pt+i/i9Q?=
 =?us-ascii?Q?k4nWJu6PHG20FL7yYD1AecS+Bd9GxHOn6p0gP2VKvTRzFJilk/EFE8qSadvH?=
 =?us-ascii?Q?X9A0ujrsgQ63MlkiowtumwaM9Co38SKZzR06GT8w7iAWM4Rg8JlT5rpFk/Nz?=
 =?us-ascii?Q?Hcbqxgfur+HEAdN34Lm6HcJRY+d5ae1Lz7gf+4826+CwZukE2tcyJinAZrUX?=
 =?us-ascii?Q?qaaD1uIcnQAajPmrymOTM94m3776wD2AjjNYZA4Q9LH9f8u2rbWRTBExGQgh?=
 =?us-ascii?Q?OhEOEpnk5/VKB9gAbQool9ua24jqrtxTD42HugJgYVNGlFNLE+tJei1+xBTx?=
 =?us-ascii?Q?fSZvUYEt1BCJMp9z1PaARTWqKaHLyBevFVyWK9IKwkTL9Jbh8Zmms60yx9Ni?=
 =?us-ascii?Q?h82iAoxmA9zKu9CnAyzc+Y43fHB/ZbYTtI9srKzqsT2S0tpd8GH6/iEx5VcW?=
 =?us-ascii?Q?N5A/XDb0y2/dED6G+cDIfuNz7wonOqijVcRKzYS/TlmR7SgAQo5L/3GOySCF?=
 =?us-ascii?Q?tpichU9SKEyhmsVik6DxvPpTO7rOBQRgjMf6cDFb4D8ev5Cp5c+CEp0nosM0?=
 =?us-ascii?Q?y3Ej34qszarP3m9jcEe4dcNjQwFCzo9nAKSt+gaYrUwehW7OyyaX0fr+Os+M?=
 =?us-ascii?Q?kHN4+CmOG/hC36m3lSg3qia1rxONTu88OdSOlz7w2OdshD8RmPA/ou/ehxGN?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D/N3V37NURQ3X+nKbLYr73La0iR4EUzNZJCW5fZa1h9sVKZTGWEYNBayeOvooAMQNSrOlzNolSWzA1XPM8NtNi8lal90RjFtqL9frpLztgShgouGuv1TMjYE/P9EeIDY6SiwrUl30adk6RJ4BcUS3OuEseFiUITQ2p3GpiOoWvC57o+qoB50M89DmD66ejgnjiwdmLy2CBGg0D/iY4oRELFZMwN9CiiDQHYq1HAae+ei9PppNTfC2+DypevRd0F7zPstTo8ACWYMm+puq1r0ell5jJReIRgaMFjoz1gfjtjtQCCJdXuij7u++KDzQq3M2SjcZhDsvAlsP6i6ei7uER/9z6QipdBsw5vvhw7ZNkHXLcGXcohxAy3bUetxKEQH6oxloNXJsxaveKaD51saoLeMsRcfy2gMQBkved5z7Dxd2E8AfdroMsDu9vwqxDPbvlIvHejq/VahdtXUfh9ElwsCXc6ROz7nGSLCfdTfUTluiEdmcedNcmrMJ3Wjq9mjLv2Zr7QiRcozTx50sjsFgRWP3+ox5c+BhGL4Vqg1z8X3v+UMXUXi/wzjCYBOeAEHHlcprf6YxUfAsKDE2lPvO8SNFpPfhU+VWvDlBqXDQUU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a56f406b-80e2-4272-c645-08dd8393690e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5344.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 00:52:10.3472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqR/xlcG5szjI1KtnOVo4o62hGlWjK5lHpqKqMdYvzo0a5on4xYdYQgcb8FE1qhV09NsiRHYemBgOAs2DOemAC1iW/tJZU8o7ymXwuNaH+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7167
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=970
 mlxscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504250004
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDAwNCBTYWx0ZWRfX/s4UfopzV2tF j/TDL1mPPMX86otSxQ6LeW0GAkKCJSygO1iIyckL/HwugizkSJnU3C0BbyK5qNtcYOPMTGjezcc hPMQqqK1xBgCC0CB9a68LzOXcB1t2KLyYLBZknDNSdQB1kj220xFo/wV6Xqldrud6axKwqBuOQ1
 RNUrZHTQHAc6Yn1TjJmrShMEojKTkPfThs1YaQ/+WdQtgRuS/2udy7Bko+EFINUWIWXIX+0spFh Lq/+5A1b0uEMQ+6BG99lRE05wWM5BDVCa9yZcPidmG7Ilk4yCtnrV3KIQe/INeljJQC3U0hizmI ijkQjYY2XszJKezBvKUKo1MxBzeaiCaKD0bhNzwq+uv4DMkzsOUdwiv2SpQ9xjTZrB8RUNTcdbR gwKmCRlz
X-Proofpoint-ORIG-GUID: Xi52DCq_NOynydHUWHElTeJBZSY1FYNz
X-Proofpoint-GUID: Xi52DCq_NOynydHUWHElTeJBZSY1FYNz
X-Spam-Status: No, score=-2.0 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


>> This series fixes an odd naming convention that was unnecessarily
>> carried over from the original Crypto API code.
>
> LGTM.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen

