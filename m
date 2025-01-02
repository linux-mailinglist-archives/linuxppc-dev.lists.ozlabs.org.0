Return-Path: <linuxppc-dev+bounces-4593-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCB1A00041
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 21:56:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPJs83gCFz2yvl;
	Fri,  3 Jan 2025 07:56:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735851372;
	cv=pass; b=HnTU39D7c9B/UjEQUKAuOPmjU6MlMx9bkv9ali1SKFvOeQduOy0aoOs0PHltloF8k3cnef0ClAm9n+4pHmydYbDmz/chgYj53KH2NPswL1LU0deXhxfdtTUfgaPgJYvdOGp+ogkXcaoewQd/Ns/1O9SYGWRYFlHyRMm941pr+KmoYqGdpcRZ50l60qYw0/IwUF4Z2z5Fr2DaHNN4eTsnV9vw3RqAf4uNbjz7QHeDKE2xIDnQY+EvRn7tMfhOA9QBM6kugvgNeUAmF93QQzDzya/zzFdESflDDpE4yosKg4byo785hb0gg3n1ZoGhmEyeVHMsyM9RBpDDPfSZSIh6KQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735851372; c=relaxed/relaxed;
	bh=YiDuNti6fWszmY2BIrry1weu/t5wsXfLgQwDXMxo5gs=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=k1+TZ/jemz8MVB8CYPtaKbpXJBX9X04k9tOfbXssUkQYAu89K3s3c9K8p30ZeJYcUAj5ByZxvlIa8SdkIkQn6If1oMFg1Mk8oHu6bN9b5dXCPmIsUV4T21BXgPxaisfQOgzEoqj2GMaZGDocVEXibRFNB3oI5M+ayjYUiwF/i1t8mvKfcddFiSXtQs9UANCskOLBqNFn2otspbBHN+L8Yig4BxabwkiqrhMVqsuqTT+OeICo98dL7tKPJwbezINjdBm5weSKocK2xekaurdZ588yeiseaJ5lumhdmVM/6xLpPu2M8twOQzqbQRFsstBHGIEIpxUQ5IBVLZ4D+wZMyw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=oull48Hc; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=lAP97OH2; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=oull48Hc;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=lAP97OH2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2706 seconds by postgrey-1.37 at boromir; Fri, 03 Jan 2025 07:56:09 AEDT
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPJs52mtVz2yvj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 07:56:08 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502JXjtC004838;
	Thu, 2 Jan 2025 20:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=YiDuNti6fWszmY2BIr
	ry1weu/t5wsXfLgQwDXMxo5gs=; b=oull48HcrWa7lCCZSxdlaFK4sj4Zqxm6W8
	O+/dcvsDzh3lENEkrcd/ZlnHUJN0vXVAqlOeDAN9zoBCgPVXNo2mNFVwvG5BBkgX
	7q8Xpxc+JYUZqZNFj2avvsEOgzZirI8c0rQEQdYkUzAdjlsPVE1/Od0RVE/N4uzW
	vr3CQzEYrzICtYGR9zQJV+ZlcrHXDpPLOTiYeykIWOpksAspOsQSFR1+E2pThH7t
	N+LJu4g7x8wocyfgcIYoxu8oCSbSvVJjHr/JMPXL1Tz7gUpIEGbMTlAbWGflTYwg
	o9vvs/LuojqGbaxx7nC1XufsUqDCJCc509ErSjugBBrbDsKIedJw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43t9vt749m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jan 2025 20:10:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 502JBKDV009520;
	Thu, 2 Jan 2025 20:10:42 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43t7s8yyr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jan 2025 20:10:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgPBQ7ODwkJ+y7RgIZJXiXjwDjMTre3QDX5TP4lK6urOuLXpDqfJUGreQWABkajE7fRkJXudkTcM4H4vMV2XfHJJli+5EeZx1JG46Gz0mKpIkG1CDZE5K+BgEMfnkDkHHiu90hRx710+wnsvB9RfqYQFUhF5eKrr4/gkwafrfIG9CeSsBg4KSdfPAedjqeLoAtyyoYi/ftxe7zEXGquSPV+9oX1pX5+ptNSk0ttXVBX7DBE5KoF+qUVGvcTu81KtpGceDxtE3IAlCW354JRV1h19py9cJnyozxkIxt4KiZKAtbXp0RgboC8lyO32kUHDZCSBA/m1DREdhLZgwXJqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiDuNti6fWszmY2BIrry1weu/t5wsXfLgQwDXMxo5gs=;
 b=uGahRYLtpZjXCoTJwt2tCT474+kKHhv7hJ7E7vQUcb64du60rmNrURwQ/ZtQpxCSMvuSstG06bv/Spaj/PONOSx0lMqhd/MOoGpfzxTlZBXkk4qkUVIW4sFm5vMg1YLqv4JA0W/CKeyfbM7yMTlZO9crBgyN8BTia1kXmVKH7YoT8d29HZauMjPWgGJnLwZdwyJx3xg6j3lu+vOarPpx0/ise11zlsKwK7Z8qSk81eijlqqleIUFeNe3lgT25deN6Zm/yeIHEb92ugiUYfDC1f2+v1lMSd/p17++0ZnyfbovaVRFVfpY02Y/I4LYCXQdkvb9RkZFkyzhegs12VGCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiDuNti6fWszmY2BIrry1weu/t5wsXfLgQwDXMxo5gs=;
 b=lAP97OH2qnS2FtzkihUlVlmhIj8jwMjbH6x2TPupsOvBztM3MJ3ZLcGFV7YS78M9L3Eo87ocOy564aCEZBYEZ7RXuW7xn6dfq3HCPuFh8+ik5aYft4Q6DQakYqotXMvSPmr0JCoTjhlq8UERndwa1fiGoHKCmo96kW87FjaaYcQ=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by IA1PR10MB7470.namprd10.prod.outlook.com (2603:10b6:208:453::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Thu, 2 Jan
 2025 20:10:36 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.8314.013; Thu, 2 Jan 2025
 20:10:36 +0000
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin
 K. Petersen" <martin.petersen@oracle.com>,
        Adam Radford
 <aradford@gmail.com>,
        Bradley Grove <linuxdrivers@attotech.com>,
        Tyrel
 Datwyler <tyreld@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy
 <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        James Smart
 <james.smart@broadcom.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        Brian King <brking@us.ibm.com>, Saurav Kashyap <skashyap@marvell.com>,
        Javed Hasan <jhasan@marvell.com>,
        GR-QLogic-Storage-Upstream@marvell.com,
        Nilesh Javali
 <njavali@marvell.com>,
        Manish Rangankar <mrangankar@marvell.com>, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/11] scsi: Constify 'struct bin_attribute'
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20241216-sysfs-const-bin_attr-scsi-v1-0-f0a5e54b3437@weissschuh.net>
	("Thomas =?utf-8?Q?Wei=C3=9Fschuh=22's?= message of "Mon, 16 Dec 2024
 12:29:07 +0100")
Organization: Oracle Corporation
Message-ID: <yq134i1f03y.fsf@ca-mkp.ca.oracle.com>
References: <20241216-sysfs-const-bin_attr-scsi-v1-0-f0a5e54b3437@weissschuh.net>
Date: Thu, 02 Jan 2025 15:10:33 -0500
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0122.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::7) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
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
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|IA1PR10MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: e089cfe7-404f-4f2a-9b53-08dd2b6984dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KOl6Nr4L+qCgg5WwgG5RuG90pSQkf0D3mPbduSqM/6U5iZRIMdCHi0IY5ahJ?=
 =?us-ascii?Q?HcAqXK/xU2bsoHHm55aQ3Fs3mhkSOHavY/0u+gMfk3yYVqUoWTPxsHAfo2oz?=
 =?us-ascii?Q?u4GbG9kbRawSaXwb0/7rBqAUPZ0ZyrXv0p2A+a25Nsm5fZpUSpnr55wQKI7/?=
 =?us-ascii?Q?879EyGh4QE4oPLZdgeIFtVqdpRaAkW5TFa0CzPugPf0BOi5DhV9fEvykWsT/?=
 =?us-ascii?Q?vK9AQ7UDLkgfXkCIMN0++Vcf1POWphQtjgunRgLABo36uymLrw6R555ttg/G?=
 =?us-ascii?Q?CAFIJElLQe+Dqq60wzSf24n3hNi2dESUaIM+35V3ccoNAlX8B3YcW4iV1Hlm?=
 =?us-ascii?Q?AKr90eT1iyd4NQfNYD4zqwZW3X4wJQj3VnQG/I9okXyDIZ3FSGmNYLvawUOO?=
 =?us-ascii?Q?68i0SKdtWGMBJH187e6ypWaR45RJCrF2n8XBkTGwNotMeHwg6vm3RjsTKan0?=
 =?us-ascii?Q?xaap9ptf/ThniGAWwhszx/BWKzAC4vzNBrlesP15Kv4L/DvQoV9IsrON/+aU?=
 =?us-ascii?Q?ljnlShysc099Wx3TouRAPvKh7y0Jx/VK6oIigm6in3V3K5LKH+x1FTnGPs+c?=
 =?us-ascii?Q?8RKOLYiatfJh7tBDmQ1EJnj78lVYp7wq+z4KEd9uPv2MMAUk+v7JnAlj7vjs?=
 =?us-ascii?Q?MtguAZDVdVgjLbbSroHoE0gLzEbIDvZV2S1unrf188WlV5GK0+SQvhJH2HPD?=
 =?us-ascii?Q?bG2bZXbd+vwJHq6vB+Rdn3sk12Ti/PGqtC6hzZf9wvG93DwtkuD1oE387jyj?=
 =?us-ascii?Q?YFpkAq+Q0UYYpDdQ6gMlVyVvZmrKCjzUbIBwPwH8O3zFox6t6Yb2F2H+lZ0s?=
 =?us-ascii?Q?NdLToByRKSiyrF2K0F5uQ+NU9P/JODP5/518jrXuxZwPum1yWl8NhTl01Bcg?=
 =?us-ascii?Q?MIMyAuE0Jpm2BCnYi9Mf1DDd6XMCWOLDyssSyXZA4/2+1Ni/9st6DBDfDObY?=
 =?us-ascii?Q?WzxcDw66c6l2bi05MZ/wmzoqZtvRKZgevgTj/EoNzWOMHmXtObC7EUO5hB+o?=
 =?us-ascii?Q?aCyl+KM9b/egU5SPikZdxSWUsSq3tas6ju+g88ih+HJuAQL52HrS6g+kgclT?=
 =?us-ascii?Q?KOcjLbEuEBPk6Xdyzk3Dvx8jdvc/yQXBy7W0781kOKyiaaVKfkJq+g+5EfuR?=
 =?us-ascii?Q?fZqEPWjC1Y2y95LCLHHnNLM7SXCTVnyLdV6kfd/nI1oMuCeKbb5jsARd/60S?=
 =?us-ascii?Q?L9GxArpt5N7QMTr5sTfA7zSmi25i6BWkIdAHrDFSW4Iyfn1eJOMkzfvJAoSF?=
 =?us-ascii?Q?j5i8/HrN+CxYqGv+V25p3j7tfHUNNfio9ThLQ8HMC0aoN7eBLOP2lgPH1Pov?=
 =?us-ascii?Q?tfWnul5tmbl6cSeQZWa2aqqKAFOkrSf4qHzWeHTMmaUxIxPHTjV/7N5e+a5I?=
 =?us-ascii?Q?CGk11nIAZ8ejcjNhOLE2ngJFMMQR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MdFxi50N78j+hn0rFSF2IbqzM/SHGdTxL3GI9hnuKo5/f3jj9H9daJ90gYNo?=
 =?us-ascii?Q?qVzVXdsGV3V01MpnAgGtzpOAhmlMn9OqD2A8jch05i4VXBgnavyRhGKypm/k?=
 =?us-ascii?Q?yzsw8gEeMwuwaez7uCQOdDQ4+xnZH/amQMawnzsXgUHwwTUKoe9DBh2624Wj?=
 =?us-ascii?Q?ieQjQFzZawOlI355IW09w0PIZgK55fEhXx6n6Nm/Z2km9W/ggGcoLk3Sp3o5?=
 =?us-ascii?Q?PPT2dbaXq21PSOYK5YG36iwRl65Haw26B0YB1fMyStpbT3wQXQRA8PerQxVb?=
 =?us-ascii?Q?Yk+zidJkgAdtRloeARCkX7k6y3IrBS2FmoBk8Rpd64Hno6lnkMWgQuEcBDTI?=
 =?us-ascii?Q?tii8EsheWqKuN5SAmcyY1zlUqhIni5gYJl9aRgZNQYVWNJ06rzBAGNMglhxU?=
 =?us-ascii?Q?Ia2fE/y3mnl7Om2416GDIsQepUBKPzscBNDbiM9nrYeEy9aTWgqOdJ5JhXH7?=
 =?us-ascii?Q?JQ+IIT8gLDTel7aw6H8GSLCKSa/AKiNc2ARA1oTIpN/YFSYwDnQZXuip2svU?=
 =?us-ascii?Q?Gn+9CXrfEtNEqDHPJgEhzZIslqAJYejDrdWGullvUqmwxcDr3YGc6RZwc/Yf?=
 =?us-ascii?Q?T+o5TPv7nre6SpRsVs/7PhNS/uqLQRSwYevManBLv2dzyA1sJ8KncaoujyW/?=
 =?us-ascii?Q?szKp3XdK82exJmBorc1XjiigkcyvEJ529zBJd1Jn0LystlxOKodDgLRQVlrq?=
 =?us-ascii?Q?UFFDNdzVUSt6+WZLdR7R4ltqCsDpyAiwTgqY5ErCg2uFPjwUCqks5xqCWLlw?=
 =?us-ascii?Q?u/dQRNueCA82LJj+FkyavolPv7oD95BYsds76pvoXnoA6k2CdzN/DmuLtXnA?=
 =?us-ascii?Q?pXMY1XH+lN9Bija77YZ5qh7oIAhG34Uz+eAs1DZtdFVfh+lrw52bpN+ANWco?=
 =?us-ascii?Q?qLYfT9x2piZ46d5p7e6DQhNp2abbedUx8WRWg9OWXuh8oz5930VMJOl2+gVr?=
 =?us-ascii?Q?yQNUlOHD0GPMc4J4Adq86rB++U4xJ8thWJ4wZmXJPJNzkdQw3n9Jq/DLCB4M?=
 =?us-ascii?Q?N/yUn2j9uC8Fkolhz4Rym61D+czhrgjek0XbomEXQMaCAOh2lruihBH/2l7K?=
 =?us-ascii?Q?m0zMq1dFAldvv93b5bAE3iGH+f4ddqqkSQ/Tk2bvyAPdJa4uCWBf3AuFB9aC?=
 =?us-ascii?Q?+O8IlNvOJ8o1BsBSrxS674L73r8IQM3tV9kzKn6tfrcZWftytiMEp5MwFMKi?=
 =?us-ascii?Q?Xhiww5taB5MnfP6up6EVar7B2xmPrcvL66tJsOrb/mIk3Q0Mt0kuYOYopgk8?=
 =?us-ascii?Q?teBztGHt5icj8wIuXhPoI4OfQKauUywvwYFH9GvfVaVKI/xDaYME/ebHYoQZ?=
 =?us-ascii?Q?X7WYP0eviVZ7428fvvQ6iQWpoFltLMPjFn2+JMmOzQjhC+qb172g40BiAlMO?=
 =?us-ascii?Q?3NQQ5y87/PwElAAgXsCWwm4Cj6wYg+8uSb6c0xE1GRdOU94FAPapAv8N9pMk?=
 =?us-ascii?Q?LLNQuAS1jA8TygmGIidy9nsPL/VC+dex+2axDPwEhAVY1pubAyN6dFHBVbEf?=
 =?us-ascii?Q?FCdS3Ot9QuPqr07Zx+6X5qqkKUZ+ciF8R1hZto4gsc91CYkcebFWT/G0UO3M?=
 =?us-ascii?Q?jipen3cCXCutqMCi57rhLS/bpanUMuNNODkDJs+goue6Sf7XoVjw5OzkXBXi?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4EM2T5AjUQS3ld+xaE8b5+glURtyz8YRA4csLw465WuqGRCBnaYdgeQi7MrlXz9dom8NY7hGg+ovsqzPsy+ZUAk4TzvAbJ3BcEg+8xByQcY+EV6XPgHtJm4Rv2TCejZo0+16NfMPLwRj7rAMgQQDuyi5Bnp7nX9e6x5KHZOTSTZdovr32Ac2px8L8xpIwX3D1YZH2IWAN6GZLF+kLopHKqbfyYSwCoo5JQYJCv4cAw/X4OXg7XPW2wBq0xF/BcRqBPx/kf0Bt5TKc5E/oy5Q0c+cXadV8+fWBK8vQ5KqzRGNASKlEBJPZ+/vhPxxBn+9svXRTmxE/UvGLx+H/zcm+2lz+AA73HBKjU3wbIEcq6fRzJxDEnf7O3wg6uJYBv159rzqItUKugjnQUo5hCvzQ0oV6Cc2JKoYFSAF/64AxWdJlSZYOBSFcevp1eEo24zTi5rp7pEMOkENI+buGtJfmt/WSArPE+twQdPsGu/aB13ZnO43JTjckyjHfig9EvzMCFOm6gRgIAp311x8/guewzp9tyZ8KZ6eCakiifCCgaGpwK+xId8WAfij83mtUJp74AhtUTD7HzhtVFIzmrr8OzBicILgCbfcx+u3SLPO2io=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e089cfe7-404f-4f2a-9b53-08dd2b6984dd
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 20:10:35.9257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O5wW0w/FAOGJuCvW4/Xnv2RnOSU8+622Qe/guIa9eAvZXHt197FwGJw08DmYuK4fdGPZ/KzqxAtAaSn7pbBPHPFJYu5l2kWyK6pedfps8Sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7470
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 phishscore=0 mlxlogscore=884 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501020175
X-Proofpoint-GUID: ZoyJiTU99FTlmHDeeAzoIWr8yYP6bxKZ
X-Proofpoint-ORIG-GUID: ZoyJiTU99FTlmHDeeAzoIWr8yYP6bxKZ
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


Thomas,

> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.

Applied to 6.14/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

