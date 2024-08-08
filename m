Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A88F794C265
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 18:16:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=It6DPwJK;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=uvmjbLAO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfscJ4FtZz2yV8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 02:16:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=It6DPwJK;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=uvmjbLAO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wfsbb0JR8z2xZT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 02:15:53 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 478AMfbX001725;
	Thu, 8 Aug 2024 16:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=DLMAffY3WP8BGMF
	QTeGm0Eh/pMrnXXrfpckB+oZn3/8=; b=It6DPwJKE4xFbw04IlGnS0vSipPWKCH
	eaxcqkMx/CyrFcegYEhJztE6Flm2mUiUAO7QzAb+bYl1zR8+DxQkdmhlotzTGIW8
	YpL4hj9fkVjz5d6vBhWfRu7Te8vWLbjRhsaPVLOFCGQy/0wb5zVjO/7E3cx86W9+
	6y7lrXcF0fiOFT8V9/bzyUeeOD0gV9wb1kWwHUdaypkre5vWABv8Ub5LPnt0qgFs
	Q9wa0YBX2y6y6Gk3SVvJ7YM8+Y7QXI2Xn4ITgYHSIYKW0odGtAdLOGb5DyyfYCav
	1k1CDl6GDtWu4UCeGwGU22lfLIiaKgl10w/nDYbzmRyAAFdADOEyquA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40sb51j8yn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Aug 2024 16:15:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 478GCOqQ023811;
	Thu, 8 Aug 2024 16:15:34 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40sb0hkxu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Aug 2024 16:15:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZHe8Vb/rPelAqdK1bVKVoCNhcyNFYzvhKB90ik5CkU9J59cHKgbZIbQd1ORTgHpFS7wsvZjTEkb5cIfysuYaKwzUs9trGwMJTkDCVpn9/C/hpzdISivNg2jKyOM24FD2FLTNEJfB9LEQiuFGSSotXh1ebLQLVqvHlcAxNub2b8M4830x71g5IOdaEX9MO91tUK3k3coCRQFBXP2dhhh5zPDOi5ccGlnTF6bncnyWfTBkbKRCkuU8oG26S948V6tH8OxfdjP36g7Xnwv6yzJPZrQe8z/oM7FntX/D4Z1WlFlx4UabZokeB/P34EauSPHpONst35/iov+wVome5bvwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLMAffY3WP8BGMFQTeGm0Eh/pMrnXXrfpckB+oZn3/8=;
 b=kFHAsmPqahLa8vKNcjpTXR5xEBIzHF2xT9/aRyaFffjFRI6sT7+dPO2QkDZTvShacLrm6w7Qopi0j6th0FpFqwW3mKcZrjruJld9iNRLXTYy3HdhN+JzmSJdBb4PuMe4EEMH0MeJBQ+aGlq5zlCUvV9xU6SXaLxnK1ZmqL49fWJqUos3T8I9e+VezCFPc8bq/uF4bwA6hwL0yY1cdiym1DN/40ZZMwAH7+oRbmeUAZXHgaUJGq9rEl8pW+6CmJxeSZz4fcfztwpiAJG7QbYaROUXRp+A027vortsASigCtOfTgNUfPD4s5WYnlqP1udCjhRmGw3E1uS5d+dxagrj0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLMAffY3WP8BGMFQTeGm0Eh/pMrnXXrfpckB+oZn3/8=;
 b=uvmjbLAO/cX/k1wTTtq8CzLSrCMh8P9zJClvSRSZF0ZSa+RtE71GWbuksDsSie1KIvEh15N6BMyhFqXVZpKLqI5gEkupy6FFfDoNlH3nedvv0K8Yx4TJRxr+u5uJX1lMLHFJdbHkHpRwIVRIR0FFF7cCbdfB12WD4Ba+f2aXytM=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by LV8PR10MB7967.namprd10.prod.outlook.com (2603:10b6:408:206::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.8; Thu, 8 Aug
 2024 16:15:31 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%3]) with mapi id 15.20.7849.008; Thu, 8 Aug 2024
 16:15:30 +0000
Date: Thu, 8 Aug 2024 12:15:28 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 2/4] powerpc/mm: Handle VDSO unmapping via close() rather
 than arch_unmap()
Message-ID: <2dt5xz7yqua6n2mzqa2lkmguqy7lpwok7tcz5l5u7qpptl375m@ydcfa3efvi6h>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jeff Xu <jeffxu@google.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, jeffxu@chromium.org, 
	linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com, 
	pedro.falcato@gmail.com, Kees Cook <keescook@chromium.org>
References: <20240807124103.85644-1-mpe@ellerman.id.au>
 <20240807124103.85644-2-mpe@ellerman.id.au>
 <CALmYWFsCrMxkA1v58fJxtyGR15ZGxmSP8x7QC=oeKwzcwGL76A@mail.gmail.com>
 <gtz7s4eyzydaomh2msvfhpemhiruexy53nutd3fwumqfpos7v5@4fnqun2olore>
 <CALmYWFvqoxyBf4iP7WPTU_Oxq_zpRzvaBOWoHc4n4EwQTYhyBA@mail.gmail.com>
 <babup6k7qh5ii5avcvtz2rqo4n2mzh2wjbbgk5xeuivfypqnuc@2gydsfao3w7b>
 <CALmYWFsAT+Cb37-cSTykc_P7bJDHmFa7mWD5+B1pEz73thchcQ@mail.gmail.com>
 <lhe2mky6ahlk2jzvvfjyongqiseelyx2uy7sbyuso6jcy3b2dq@7ju6cea62jgk>
 <CAHk-=wgTXVMBRuya5J0peujSrtunehRtzk=WVrm6njPhHrpTJw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgTXVMBRuya5J0peujSrtunehRtzk=WVrm6njPhHrpTJw@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0320.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::13) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|LV8PR10MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 324c3f89-ad8e-469c-a156-08dcb7c552c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?AjhDxPJVv1TcWdMpzhaGLGZg2E/htBCkO8wubCY9IFsbAzBtMUsxdKDmSGYC?=
 =?us-ascii?Q?ov7vTJr8eKHOxScerSZwPG5sWvOiDP+VcozNX6g+Qh484fLRyHJn1/OIjBRG?=
 =?us-ascii?Q?/7QqlxJC5xZGX3GrJ+Yv1bSUHhOnbFCHa5Voszq/Vg4V1gEQ0a2iOdSzmqxO?=
 =?us-ascii?Q?R4Y3zeJncH4fFYHTYEp1nkFAdET2uhne5WzC2oXljyh89Zb6C3WBGe+Z97ME?=
 =?us-ascii?Q?VLSvGWUZDrDRsAiGafHMKVr6Ga+y5pBQG3ZnPppCL28c6x+h7+eN7/ZNd88A?=
 =?us-ascii?Q?+mFCoV7jvIZXUayVRJqdypU+O7DfmYWf2+Xy32q2ZKybgeqNUOmlHCsBDz/i?=
 =?us-ascii?Q?LHgup2UPbc9H1d6im4G0ny6sh/jdSc2RGrp5QwhrxEnOOnDacooYuRDwyBne?=
 =?us-ascii?Q?XrPK1mQ8K6szmtwm3PgN3w692miflyWPylcM3bc0Fb535j8CGd7Qlmcwt53t?=
 =?us-ascii?Q?sEZPaYfEX+fBpYC80DWy6uISn7HynblFZ08LWEfasK6jr0TT8Jrh54HQ0Xpq?=
 =?us-ascii?Q?0ppcR6jWmWcgP27bT/VL6q87BQ7iecXqDO5yY2ZxxoZtQGIsVeG/31ts/PIn?=
 =?us-ascii?Q?eBW7PW1R3yYSWPFvTPVJdOhc9OIQcKwU1c8zr6+TJmOBJ6U1eiXFE66rECGP?=
 =?us-ascii?Q?RWXZq+WCJwMulE/LA/jEPVK6lJ9J6k+nr7Oo+vtZMHwDYfik8w3XBpAhS0d2?=
 =?us-ascii?Q?KH/dk9reena2RREAVqHcuO0WxsN1IfvVHCCs8i6AfrFqHfsElKIacZ/OGaBf?=
 =?us-ascii?Q?mM9RYD8oo6c8f2ZteAFRKWif200A2Yhoi0UyhwBkP26zUORQbZr6WY+0QsUh?=
 =?us-ascii?Q?KjrlfCSN3/0q6cdNfpjckLHGBKmJammkH2SdWj/mOZt8fsP6IoX3HgASjOOH?=
 =?us-ascii?Q?Rl49QT7MSXtDwEYolusv5zMTQnMpCz1bxRP3fUi/mEplt7K+dqtzHQIem7j7?=
 =?us-ascii?Q?gCwfYHU82Qzsx7wR/VAf6XDx5AwPxS/U79flTAc5BcH8GenCFzZoWu4tOdn3?=
 =?us-ascii?Q?+g38qof94H5VSBlFLngY1ZFbwE3ELcYTbdf4GegERQW61UncYjqd1Cto36z8?=
 =?us-ascii?Q?4KjODJWkgedtYBTxcghuk/PDAJC6Ckicade1W/EnMlCspNJ/Qq05KmSPgkD5?=
 =?us-ascii?Q?ZS4CeHJgz3jldT1taArRcYBdkmMQ3qMw4Dv+BcmXaUKdg/pE3fRYJVbhYBXi?=
 =?us-ascii?Q?asP/ZMJUDONnJblb5JPbEir7SEpLthZFzVolyXpUhRUq+BttraleHJe/jshP?=
 =?us-ascii?Q?UIC8xGJNjAjJR5Fym0ymNW09Ys6t89qggNCAfCJaUhjR1s81TAdoCitzrCRK?=
 =?us-ascii?Q?QtXXW7XfQdPVzjN4hrFdfaxGAxHppm8dQU6WYYFDh+tsVw=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?7Cv98ovn099QxKFofo0cuoS4Mw7FIpielE3jlZqD0N/QEhh2ekvXrQI0eIP8?=
 =?us-ascii?Q?FnvxNxVE1QaOh8xIoT8pmAtTIYnUYVdDb4k2pKTCWw6OXdoQ3v4T8Ot/b5mZ?=
 =?us-ascii?Q?iJCYPex0MHH1NosuIPgMzF7DLyIbXYuIUA8kEHrlpwhnNxaCp2575fIWu+0o?=
 =?us-ascii?Q?BTHoM7m0D6MVUY0ZV9UkycmhlBWttsxyIAjVPC11g16FlxJsCCLSgIhUdEUG?=
 =?us-ascii?Q?Jpvgd0J/jFNXKVtcmlaGMdlkdRGLOYywQxYz48XoBfm0lapCu+ZrzOgChmB/?=
 =?us-ascii?Q?NbmPHQ9N2DB90Asg66KjBOqgRPGxYW90n+LuTywVTgT4sxD2EVsmqMwya8g6?=
 =?us-ascii?Q?utYyM65MF1F3YV1pfjj6qeFhGGAeiEbDV9V8o0WWA4X3y0bc5x4cK7+pvg34?=
 =?us-ascii?Q?Y9h4/eugXT875aGcyKmRVeMyihEEqk0UfnAliQ/pKC+WKVX8QD9riAmMCr9x?=
 =?us-ascii?Q?4cg8Nedb2XL+EvvkmGyuG6e2I0EArVJf3UfPz5TGLpZUfO+tYqrIK7WQp9Ex?=
 =?us-ascii?Q?pRam9qIE7oypMReMKbmRzYJCOPeB7J3TDqlb1Ey0FUilp+67qU/BXX/Z++kj?=
 =?us-ascii?Q?6tRmzjzmb367NVXIeyy4epdu+r/pBcfR8QOiUADLK1lsCkxpicXYLcp21apl?=
 =?us-ascii?Q?ZKdP7EwQWTidCAQxPEubxtLs6D2Ra8ZK1LTQHSGaSQiBA9sZdl1h1vD5Fo/H?=
 =?us-ascii?Q?VYhfYIoIduQFNaWJ5EDuLaZOZtFMN2hKkY9BAiKNkkvPHkqVVuFtgkxOGKwc?=
 =?us-ascii?Q?MM2qy0dCSkjlBQQs/NsAWYIG25/uzJbP83shJTupVEB/ikv8af7/fxe5XcxV?=
 =?us-ascii?Q?GjcoITEqJPOy9L6mseD4JgIlsWxHR+BWINgT7fph0naxhdedTI1WR6XraYXv?=
 =?us-ascii?Q?PW3pkyM43Wd/P89O1OeuCURQXqa8TqfNySTGcDpjjM/kri+eKNGWD3cclOfl?=
 =?us-ascii?Q?RvmL071jvzs2Aa7lzwzwuUjtMsAdL0/tkbRWUvZ0Mb8s9YTrXXjig5SOtv9z?=
 =?us-ascii?Q?r7QcHlRx7RdNOr5wR4pMKGA1r7lg0OsUFDpQLAfmRT0SKyCVskU24uwbbH8I?=
 =?us-ascii?Q?Ml785tPC6y6nRRLFRALO8Tezmy6k5ZQci9+A2904qYgJaBn9qV+EWQDwRoXZ?=
 =?us-ascii?Q?iTEwHvNbYUj3ryeQwz52o4G0HPmoSugl/0vXCXhbXU3i94sdlQJaCCaXMCAb?=
 =?us-ascii?Q?sdynFLCnPk8UceqK/Cnzwia/PHJwAcFggSSLJolPRrSYQA5KTZNNaZSbnfX3?=
 =?us-ascii?Q?jIn06iBv4yOA3w6YjtdjniTtR068eehKGrDRHqZZo7gBlXBw4Vm7y6rEib6z?=
 =?us-ascii?Q?wT7X0CRADwOLbSF6Ya8FdfldWItoOfHxwj5c0KMNiI8CQ7wF855drtCHyrGm?=
 =?us-ascii?Q?ghAb/epKfE0UrUtXAEpV4k+jLneSIt2abwxLw4CsENz3SIMz/S0uECBQ6iEV?=
 =?us-ascii?Q?ZW0qfHsNEqsfFbb4t62Xd9VbXlSv9lt3IYtFLnu52HxJznGYtU3y6A0ZQ2Ta?=
 =?us-ascii?Q?AfAQmLuFPV8OqvSmfRYNsR12p5wTKga1M2lLRqMk9vHDADgzOSXdEBWtP9ga?=
 =?us-ascii?Q?5bvpLQ/Qn6SxhSdzikaVGdmEuzwVgK7sFxScC28R?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	L1mGFsOIfGRaelN/tnpLwXKbMnSPdQWi8HG9uLlAMOVLXbfroLpY92HTnu6Bs8f0StPepK+hrxvEkVPQOH0zkEG1wW+EWvu0gkamAqdOSmHa/AzC7PhhIVjJGPE45IGeJXcS6Zql9kycJ0KLBuV4B57mfiCB3ejavXezxVCHWmN2OQ3Rw/NgKA6oYs+tErKmWd2m6Vynls6a56Ksk2QZJcEP3mNHUKrj80//1cI8W/YqYLlA6LuExHkF8j6jHAeuKWvE0fwI119LR5vCxl5s6pvuKOo6nUQGtt9e62UVPb2ikhvQVjPW/asZIZfBrmoE3yv8ZOaIVu0AQhm/5WO8FDd4rZdPvc59qKXrGHlfsB9fy04kLLEK+MDCQrh6ZbVqgp5ww7Pz4CyV2O5ZbYLYEE1FFTu1kYpXHQnd8YLTXTK4mfuRtRED47cfihzvH+Uzsv2F1k5iaxvOibkvjVwZRic8tz78tQxfk5nHCqv9hfKdbu1fjsEWywEYQ0IMdd6M74AiUIkrSEKsTHB3rGDDHjRO3m5QbedMaH5zmGh03vIqoEWIoPsOAGnhfYM6mcbqqpSL/rSn7ngA1SmuSa30X00IaPFdwCnzNgHIwfjYEd0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324c3f89-ad8e-469c-a156-08dcb7c552c9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 16:15:30.8722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BT3G+7VuyzinddUJx3Sl6Uw5Eb6VS/xDSHFmL2CviyYJmafX5zz7SCnsYMJrn970hMGJGoptquwi+vTJzo1dPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7967
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_16,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=736 spamscore=0 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408080115
X-Proofpoint-ORIG-GUID: 0J2wapnoP1Vf8mfNijA82WNJnjA4Jiu6
X-Proofpoint-GUID: 0J2wapnoP1Vf8mfNijA82WNJnjA4Jiu6
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
Cc: Kees Cook <keescook@chromium.org>, jeffxu@chromium.org, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, Jeff Xu <jeffxu@google.com>, linux-mm@kvack.org, oliver.sang@intel.com, npiggin@gmail.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, pedro.falcato@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Linus Torvalds <torvalds@linux-foundation.org> [240807 23:21]:
> On Wed, 7 Aug 2024 at 16:20, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> >

...

> 
> That said, I don't love how special powerpc is here.

I think more (all?) archs should be doing something like ppc when the
vdso is removed.  If someone removes the vdso, then the speed up
provided should just go away and the function calls shouldn't try to use
the quick look up and crash.

I view this as another 'caching of a vma pointer' issue that isn't
cleaned up when the vma goes away.

> 
> What we could do is to is
> 
>  - stop calling these things "special mappings", and just admit that
> it's for different vdso mappings and nothing else (for some odd reason
> arm and nios2 calls it a "kuser helper" rather than vdso, but it's the
> exact same thing)

But isn't it a special mapping?  We don't allow for merging of the vma,
the mlock handling has some odd behaviour with this vma, and there is
the comment in mm/internal.h's mlock_vma_folio about ignoring these
special vmas in a race.

There is also some other 'special mapping' of vvars too?  I haven't
looked deeply into this yet as my investigation was preempted by
vacation.

> 
>  - don't do this whole indirect function pointer thing with mremap and
> close at all, and just do this all unapologetically and for all
> architectures in the generic VM layer together with "if (vma->vm_start
> == mm->context.vdso)" etc.
> 
> that would get rid of the conceptual complexity of having different
> architectures doing different things (and the unnecessary overhead of
> having an indirect function pointer that just points to one single
> thing).
> 
> But I think the current "clean up the existing mess" is probably the
> less invasive one over "make the existing mess be explicitly about
> vdso and avoid unnecessary per-architecture differences".

Okay, sure.

> 
> If people want to, we can do the unification (and stop pretending the
> "special mappings" could be something else) later.
> 

I was planning to use the regular vma vm_ops to jump into the 'special
unmap code' and then do all the checks there.  IOW, keep the vma flagged
as VM_SPECIAL and call the special_mapping_whatever() function as a
regular vmops for, say, ->remove_vma() or ->mremap().  Keeping the flag
means all the race avoidance/locking/merging works the same as it does
today.

What I am trying to avoid is another arch_get_unmapped_area() scenario
where a bug exists for a decade in some versions of the cloned code.

Thanks,
Liam
