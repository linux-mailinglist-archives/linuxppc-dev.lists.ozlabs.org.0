Return-Path: <linuxppc-dev+bounces-3310-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDD79CFB41
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2024 00:37:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xqtj12qjLz3bqD;
	Sat, 16 Nov 2024 10:37:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731713829;
	cv=pass; b=WJT0tam4nY+g1UhPQjmZcrCTz6NQ9wf3CAmOYTpBaPbvPqFjqFoeFTYlE4XWu0Qkur1tw6ye7jgmEMUfjVFEX4s/81DrXKZm/3ZzHfY2F4BC8qFhjBMoncXTPaBEsEg4s9tE1OT41j8WTt8y1KEsvV9qWO5mdS9kMbUI0uOHm+bi7RlQS1Yrf2vgidekYQITj6bVJs4bHdHv+diq3otVVWBFtOp8hUzfVOn1GyrxeYF1DqwCaXuJNlx11BytBT4lOAWz4qGKVN23CcTlY2o8XR55SthGITvLo7LBZHSrn4AkFRu7QUvh5lFBGc9ZLwqbVQGGCZnhB0pKZ1d8VcBC5A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731713829; c=relaxed/relaxed;
	bh=XnM4npQhavz1yVBF1GdzW/Qzgvnq2awTJIelT1DD+r8=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=g7ZPcJ9ma0a8X9YiLPOHLHmj3Yf9DYJquKdxi42IRkTTtewsMKnI442Q9Hu0DZVVmEwVckapM2vpA6lLrwtMpq1mVx5hAGysVy6+Xm9R8MkHb8QWEEMAdDYXteJ9ty4oxfPyJbgFHHBi8HATb6495i/DPGYuouCTEx1R1gqdv6KED/pRb0kppigLbEIvhOXAQvbx1xkSJS6uRe6nERQKfNiyp2ULNc2D2A7jblliCiVhEaA3TvPu+rJAuymTz7PfzfPCR1lqA+fwhbzQcdYcD4udKJ/Q15xuA3MI45E5S3TGAT+41rCeMWOG8o3STMR2lCmQyP+9KDoRP4ygb3H3wg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=KuqieK0e; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Dp5Bg9HX; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=ankur.a.arora@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=KuqieK0e;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Dp5Bg9HX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=ankur.a.arora@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 7450 seconds by postgrey-1.37 at boromir; Sat, 16 Nov 2024 10:37:06 AEDT
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xqthy6774z3005
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 10:37:05 +1100 (AEDT)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFLMbTC028824;
	Fri, 15 Nov 2024 21:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=XnM4npQhavz1yVBF1G
	dzW/Qzgvnq2awTJIelT1DD+r8=; b=KuqieK0eiRYYXB1kpjnMhXSi//GolDCByF
	lfWs06WK/VskQtwR9okfql/5ue27RnSq9aXjF4dIJPJsBOYSD104DzVN13yRyIJE
	9FdeSOpauKE7Npl19dYl9iNBTn4ZoC0hCmd/WcOX3dfFND+9py9HEK6T5usi1Rl3
	l+tdOSWsToBhnueQFCq61iBCZjaBrXwipEjcEtxvCfm6Rce2rpjPGHHOnO+ILZW2
	vVrQEvFImjMkjuAMezBNgbPxeIacIXft7ROLAaRJ4b4ouelLTTAv499st33yYNy9
	H7tNlQSSIcl5dkWLEJZbU7XCWR5sPrQ7FfHzV8A0igNHgCuwx8Mw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0kc4cks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Nov 2024 21:32:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFKEC6F005691;
	Fri, 15 Nov 2024 21:32:36 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6d6nxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Nov 2024 21:32:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9+w4BGhdi2kvBQJPr4pswkDo/U7Ti3NSzgvGEyCQdx2gUM+YDI4RFACE9B4YPyucTceuTgv5BfxrgDJ9ZMOEumYSUo7frcWQBeTnM170OYiAJqh1YD/TLkSHyAGwYx7ggNwvoeHytGpoXC3kKA/3xrN/8+8EGXnq5eCMbPv9PBpwh+ZjEuflS/0LX3Ky5VR91lTb+uUXh0y1ED1ms7d3iYBLV23C9eHkRQoj0IhGVRHO3A9RfCgMKMipssahfWtKQlADi4e3jgpzTfhKmddpWjUYTuH/H/7W9G46XGVpzhxxYBlYWAFIK8TcOr4toJINoiWiR4FcRd15DYrPWusAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnM4npQhavz1yVBF1GdzW/Qzgvnq2awTJIelT1DD+r8=;
 b=iYgrsmGm3D2yxTNV1OneAuXacTtyWTb/USN6pAoZrvwgoaX6N6qjObedw8KVUh4ZWoCKLDqnU5LwQ+pACT1DZbDnJvfWRYI+1JQrbqWdvJVvvEEsl7OGl6A9UrLEVjctW5f34WqQGxwGxKnmvaWGCJVGBrfJ8V6wvGO/G1uEGocBBGUxx0rzdrOGlmwfJ+H3JAO7zuv9OrBLcWtG1dmDa9y8VTXq1BeKc05bWq8H+Ya1mIQgXYh260kbgfrzxR2LYgCOc3z/5gCXSnVYzd/niF3opRF3xT8usk8MGWLRzhy79oQYZaGt1SRn+dzht295eQuqJnuq9cZHSrElkI2LFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnM4npQhavz1yVBF1GdzW/Qzgvnq2awTJIelT1DD+r8=;
 b=Dp5Bg9HXH8gAh8/F8M07MVYf3aCuRahfnGDujiOXoEpJ8Mu1HHvbBd3XtrjlIEvu32mMZjYRvx6SZuvaAtVsAYq55sSyhnkcM/Ht4fM/AW3qXqyq6YCm5F0J2t3tjTSYo04EOTWyt/6Tnm8jqvI3ZNA6gah7OWDxjsewHt0HlYk=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by IA1PR10MB7333.namprd10.prod.outlook.com (2603:10b6:208:3fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 21:32:33 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 21:32:33 +0000
References: <20241108101853.277808-1-sshegde@linux.ibm.com>
 <87fro135qt.fsf@oracle.com>
 <f8fe7182-d9e8-4323-a4ce-94fa0080365c@linux.ibm.com>
 <16e10c41-4e32-4987-b4e1-56d7247d3c1c@linux.ibm.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, maddy@linux.ibm.com,
        christophe.leroy@csgroup.eu, peterz@infradead.org,
        bigeasy@linutronix.de, vaibhav@linux.ibm.com
Subject: Re: [PATCH] powerpc: Add preempt lazy support
In-reply-to: <16e10c41-4e32-4987-b4e1-56d7247d3c1c@linux.ibm.com>
Date: Fri, 15 Nov 2024 13:32:28 -0800
Message-ID: <87ed3ckwsz.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0263.namprd04.prod.outlook.com
 (2603:10b6:303:88::28) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
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
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|IA1PR10MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: d4f3c6ef-af60-4da6-5120-08dd05bd020c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4UkWinFgIGs0BY8fvvUiRo52fWWapiT0ytCmg0xF8CfP6QwqwilGmBpLsS2Z?=
 =?us-ascii?Q?wiNcTeN/zqzf2n/tkIaD5787eKrjo+dPwS/BaK5U0uXGMiFPpeNIepOS4fvk?=
 =?us-ascii?Q?Z5Qi3FoFY+dpgtM7/uXiVNqEpgVoh5KnJ/htXYQiIUj83wDmr9tv1Xqo7Eok?=
 =?us-ascii?Q?I7ja8SJpijpbB4b9CztRAGqkx3ZiBKOurosJwlg1+wNQPoag6nST6qj6305b?=
 =?us-ascii?Q?ahjaJZgM8NZNhrqo7ticuGqxzopUvowKHFa+Q4f4OacKT7rCo81FkDqraywD?=
 =?us-ascii?Q?InHCgvrj9Z5LhzN7OgjN6iXPwdyqxSWuZXEKqeovcgkS6wjcNMN5sJ7sB8j3?=
 =?us-ascii?Q?8Jp2Y/TKwq4sMKvGIim6ujg5r0com1gI1Kmpw/6eGVgZq7vXPLFk0/e7ig2d?=
 =?us-ascii?Q?s/yO3KUZKj9CrVDN6usgA15km+pUv4SD94EzeHY00iaK7ng7FdtoLdw5tMjx?=
 =?us-ascii?Q?JC3o26TixsP5N9Ei/YF+NpxjhzeySBOa9R7WpLykmUxUMHsVG/4ii/3KfslW?=
 =?us-ascii?Q?gcAyzDT09crczo8dGnt7KXPT/rTUc9nJ1EruwSuyO0SA/hvpn5RuJlFfuBrC?=
 =?us-ascii?Q?fi1zXi5BMNbqJxemWAbKmXmiN1TzskG+apwubTlVw4S6LG9yAfQ4TBzjaKTX?=
 =?us-ascii?Q?vt5u8kUh2YAZL+xI839GyX4ab785IyGXUfVYI56nd5DycYjV3TU4R+hokMWV?=
 =?us-ascii?Q?X4nItMgG5Qe7rkrDFn8T8RrqeLqBhr67o3nsVMu0Lnogk1xekkeeVrhljkXO?=
 =?us-ascii?Q?M3e1NSTrS5aDoHcXnm9V2irEtbRIMkZdRunBgGo7L/IXXgXmXhemf6JWIaio?=
 =?us-ascii?Q?KkKDykc92HFKXA8S1CacUaYY3NNdrNElDayXMRJHmOHO/ECyfq0LbSXUhPhW?=
 =?us-ascii?Q?TbmfcQYHqjUMZ0VOG6AoCQmWtCKIPhj9PePChX6coVtOYi1nBjNM+6aq2v1/?=
 =?us-ascii?Q?rIVKMmBp2JaetOdsxX0PLA4G5cR/ZQA91jgHkcn916Of++54A/OK6W6UXxW+?=
 =?us-ascii?Q?nnKi9xVDqVUoJ8/lMAAOEyD5vtOIt5PJDOu88erbEDiI5FkJbW1fS8rdZ8f9?=
 =?us-ascii?Q?sl2Zph9ladASs8HDyz24BsJsPmglHFGgml2lL/2sdcULK5w3ceUgxHs8H4FF?=
 =?us-ascii?Q?MikrWbmFWsTBwqbXoh4+XFhE3gNi46hEkgZkQbgHg4jnS1s+sooua6Gf/pO1?=
 =?us-ascii?Q?InynmxRt4bFWvpLnpy3JxJ3tmQG7zhFOT1uANpkJqp37SkW56zKGU2SPHokb?=
 =?us-ascii?Q?/+O+YCKrJ2/2uEMqi/qn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1nqjrdrXClB2+I3C9Mgiov/c1e4iMxM14aOIhxHZzCAUfLyU240NmJVciE0C?=
 =?us-ascii?Q?JnTC70D/R5DPCF+qe3ZgsUkO5QPXnYXKAChdi/WFP42di4mk2WaTyGp0CRjG?=
 =?us-ascii?Q?DyKd71Sb1MSMRfnyd2VfwVn1RaR5nQCiYl8aYFMBj4uA/Fn8eNRmIB02aJf9?=
 =?us-ascii?Q?WDutmOR2DxMWohyXkkm11OElshjwCZ0vYmNM6YnZ/fb/77vzP3EiwpHZXzRC?=
 =?us-ascii?Q?VCYg2Ms+RHfHKkYekpwgAS48+k+4f+lH+7B3wWLjPz/iYc9fKpnQXUpj5svn?=
 =?us-ascii?Q?7d4QlyGDybIx/rO1x02B1l7RdIlCwzNgxVl74lGGMxe4ybUzx+nYzQkwXCIS?=
 =?us-ascii?Q?lJMdekCRxvvzA1V2j2/75VT4JtwVTqXhGuHNqkdNGee2MmkoyC+wXyuTg7mk?=
 =?us-ascii?Q?VR6hteTNBGabWhU5Pn91gBLs7atZGEjeE7uZiV8GDnZplj/u8UdEynQxHc0k?=
 =?us-ascii?Q?/NEcLTgzIjxXtgaUbY2o+kELCu8oVUvrwxVzcfnlDZSRI+Tbmoi3n73W9Eg7?=
 =?us-ascii?Q?gY4PUrvZ6UxRnjqZ/GNwYHhnnlg0smyCRlDi5JHM2ZvQQRLAyKNGfByt7GA+?=
 =?us-ascii?Q?oD6oJxzavE8jsnlQ9SFillvjlqqi5eGODnxV52KUilT3QQlu0gwJZFkHj5dd?=
 =?us-ascii?Q?jegArgL+/vmBeYfHo5QINBFoQe+hTAR1U0z7yiedwXIp5ucWo97suQ7OFZrT?=
 =?us-ascii?Q?E1I6IqvlzETm1C8OHny4+hcM9462IBW9zW7eyLtSHirXL3OjLx2yD7Y5gb3H?=
 =?us-ascii?Q?uuFNt2DYhn9oX+z0JWF2iUzsdaa1302YkWyfnwukB3dqjQgOMcbKnQlloKeK?=
 =?us-ascii?Q?E3TFBjSsCViAVmjhF/PsgNyXfy0OQBLn6yZV87YkcpsvbRi3z3P9pdR5mPUl?=
 =?us-ascii?Q?Rs6uMOgmB54yfypBgF2tqrzsaroXwVgePA2AvYbKGie/ifSGBBnfF89RwqMY?=
 =?us-ascii?Q?lXsHa99nSWeNszgDATpcI1ZxPGBVzCtyUxnDq6O0t1jrfALHPSg0dawfEgO/?=
 =?us-ascii?Q?KSHUhd7sMQBzVq51AC/EW9icTJ2cUyrPrPbTPSE3vKnMety1Z2Whabjr3ftT?=
 =?us-ascii?Q?ZvWssT7gOZsW9QM8Pa2VV637ymM0UQm460QkfuAmrTGZF0rEKRB8wADvQFR6?=
 =?us-ascii?Q?2vAKBhTPYng5Uro1Cw3+sumTGSonrJ15PPEdfWQi2WAbsf8fhwxqYmfAy0JL?=
 =?us-ascii?Q?7tRoWKa5kD1v0P20Tg0G+MPnH4/BJOtqC5aMmeJ3JXSxUxmgW4kPtrjE81jb?=
 =?us-ascii?Q?E9tWJGISCvV8ZVR9+9dAzQ9w0/QqZvg3Uxnuyewejf0JFYkEZBGyksucyaV8?=
 =?us-ascii?Q?Nr6RkIdGN8u0xPhdtAWFVobqI8xv+FcU3yQJqj5TVoz96pHsZH4G3gF9zWmN?=
 =?us-ascii?Q?O4w9ZTuimpA8V8WX8as9A/07QNnmMGjg00GmV7LARz1q0NGTpHyv8rZi5VyX?=
 =?us-ascii?Q?lYj4PhUBTft0+SfeU1BuLGYyOEs5w4/sfbjHaHu8N+IE4QLzL90KAxg7oYOH?=
 =?us-ascii?Q?UusERyqCnj0sJWmIqNvsy0tlZ9Z8H9Ywtb5En7u+Pkjq3b/HdDBOI/CICLMn?=
 =?us-ascii?Q?ys9C7hQvkdZ4UZLrPB/7GNDq1YidzNLusCgOhGDPSfTY7fNJF7Xv5NPhmBnp?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K6YElPa+uMNGUX08S4DPM0AFpHuCFqhcS+JCcVR75UMHYfDFn/z4IiCiz1GgC1Vtj/EzFmjwYMHlwhJsUCDGrDOQef8CK1jTBWbSPs6A/BxsAsi979/B4lYrd/54lErf1g/Sk3IhE67MVL0DJBP0Lxd/VyscDWS0fv8exARv+9z2AKYTX7gKkrA2bNEvIB5sxcIgTidbKS3LAxDhPc35HKat3Dl0E/nc5CRSM4FFNY7fFIGfAmkyDtOzTysIxYS3saT68inJTxufU3IDXfJn1usF+H/5YD4cM+KTaOB0YRtH8OThAC+KXWqEYGB6Z1RUUJoKNT6LAGXsRAaKh3WQ5VRW6QlVAWWdN9d6xSs98Mq+9v8rXMeW4V1aKsHuLFsGwXuSxRll7MxXKbWyhdDi1gp0nEj0kWe8AmIL1zIf96TuAN0otyfaw2gWNTLTB6B9jKtsO9guXnPHhO5m4sGTJqa7/MQ+VVF3A9WMOHsTLMxT2/QvD7e6yCIv3lTfAOvgr+Aeep24fcfHz1uik/YACAOlsFEPpsXzxgU0Vq9Geset9RuN+57SCaHCRP4KtW1w7wjkJdrkPgF7NOnJTe8yDPIdbBBdsjXgwJFhb3Fwscc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f3c6ef-af60-4da6-5120-08dd05bd020c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 21:32:33.1763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrnXVMYcpD8fCk80tN11MOeplPiJ4gBpXt5QJeeeavJ35vn/UkQlLLqwIHAnWZje+WbvXDzUad9QzWwQ1X9f+2emUGoDbPfDjgrhAkCKwPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7333
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-15_08,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411150181
X-Proofpoint-GUID: sTwriL_RfvSY6xcER1wbXRpJufGVZjGo
X-Proofpoint-ORIG-GUID: sTwriL_RfvSY6xcER1wbXRpJufGVZjGo
X-Spam-Status: No, score=-0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_SBL_A
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


Shrikanth Hegde <sshegde@linux.ibm.com> writes:

> On 11/9/24 22:24, Shrikanth Hegde wrote:
>>
>> On 11/9/24 00:36, Ankur Arora wrote:
>>>
>>> Shrikanth Hegde <sshegde@linux.ibm.com> writes:
>>>
>>>> Define preempt lazy bit for Powerpc. Use bit 9 which is free and within
>>>> 16 bit range of NEED_RESCHED, so compiler can issue single andi.
>>>>
>>>> Since Powerpc doesn't use the generic entry/exit, add lazy check at exit
>>>> to user. CONFIG_PREEMPTION is defined for lazy/full/rt so use it for
>>>> return to kernel.
>>>>
>>>> Ran a few benchmarks and db workload on Power10. Performance is close to
>>>> preempt=none/voluntary. It is possible that some patterns would
>>>> differ in lazy[2]. More details of preempt lazy is here [1]
>>>>
>>>> Since Powerpc system can have large core count and large memory,
>>>> preempt lazy is going to be helpful in avoiding soft lockup issues.
>>>>
>>>> [1]: https://lore.kernel.org/ lkml/20241007074609.447006177@infradead.org/
>>>> [2]: https://lore.kernel.org/all/1a973dda-c79e-4d95-935b-
>>>> e4b93eb077b8@linux.ibm.com/
>>>>
>>>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>>>
>>> Looks good. Reviewed-by: <ankur.a.arora@oracle.com>
>> Thank you Ankur for taking a look and rwb tag.
>>
>>>
>>> However, I just checked and powerpc does not have
>>> CONFIG_KVM_XFER_TO_GUEST_WORK. Do you need this additional patch
>>> for handling the lazy bit at KVM guest entry?
>>
>
> It doesn't use the generic kvm entry/exit either AFAIK. I need to understand
> more of this kvm maze. There are quite a lot of combinations.

The generic kvm entry/exit is gated by CONFIG_KVM_XFER_TO_GUEST_WORK.

>> will take a look. Thanks for the pointers.
>>
>>>
>>> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>>> index f14329989e9a..7bdf7015bb65 100644
>>> --- a/arch/powerpc/kvm/powerpc.c
>>> +++ b/arch/powerpc/kvm/powerpc.c
>>> @@ -84,7 +84,8 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>>>          hard_irq_disable();
>>>
>>>          while (true) {
>>> -               if (need_resched()) {
>>> +               unsigned long tf = read_thread_flags();
>>> +               if (tf & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
>>>                          local_irq_enable();
>>>                          cond_resched();
>>>                          hard_irq_disable();
>>>
>
> This is not going help since, with LAZY, cond_resched is nop. So it doesn't call
> to schedule. Same is true with preempt=full. I need to figure out if kvm stuff
> was tested for preempt=full.
>
> Instead of cond_resched this needs to use schedule instead. Need to test it out
> and also see other places for kvm.

Oh yeah. Missed that it was calling cond_resched().

> So, i need to spend more time on this and figure out, will send the patches
> after that.
>
>>>
>>> Ankur
>>


--
ankur

