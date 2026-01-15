Return-Path: <linuxppc-dev+bounces-15848-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BC1D24D35
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 14:53:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsPZp1l6Yz309H;
	Fri, 16 Jan 2026 00:53:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768485202;
	cv=pass; b=Fd1EfVr32JlaT1d9PYhWgZ/I7MFZ8oYHCOqnOWVAG8yTiKHMr0UBLiHHXzmg3j2/qGuu53yBgj6TJ9KOKwm1SkPN74xKBgwEbE6fndXKfxwA4LAcbXy0jUZD8+8YuGLK/RAeBGKxk2j5Zx4oQBUIxoUXhHxFArjRf1lTEG/ACuYrApqs/t5fpaSk5mB4ooGQzQBDvXgZ6fq/gJDqmokAgnyfzEQcTqmtIJKAr/yS0LJ6oD+Ub4Zj5+npC731OWVe1VwLh+TJ6xeBZ/NsuT1ukzVSqf0AA8fNXV8zK/QVGvRUz1sijTa0n1hpLD6IQzqMrlvCE9TMFuc4d54pPryvIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768485202; c=relaxed/relaxed;
	bh=h5WpEUw2WVc3Mj0gL6fktjVmkcle06OKkcqbkrlFfIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HkWRQFTEpu//Dr4i/+LoZRLANZtdSRujxL9vlAtmueYjwH8siaEnYBNSj5Wp3mMpS9l0cEZLrfiFk2ahI2ZBRjDqjsw8BSKfEyHrQ1zUSq3SS8U3uQdwHp4NKxnfuHuz7G1qm6eovoWOc28Iq3u9JkFuAp4JN2LPcpdVsCCEakieSEGDt5ZCPmoG+dGAAF1KQnxnKRm+cnsHIfFNG+FdMaMQUTB3swaI9g2ZgW4xKs5I7S+rjAGbWVni9uHPG9agyrix+KP3L6djMmSLw+mP9hIp+im5A6AK+knO1NdGovUCNVUb0GFQFoHQfNWQYO90o6iN56bR2noek3kd2npYBg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=EnEzk1Bh; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=f25FHsFk; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=EnEzk1Bh;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=f25FHsFk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsPZn2Vy9z2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 00:53:20 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FBmapq2811623;
	Thu, 15 Jan 2026 13:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=h5WpEUw2WVc3Mj0gL6
	fktjVmkcle06OKkcqbkrlFfIY=; b=EnEzk1Bhen85LGHdYE4NuXa0CRJqBXJfGF
	Y7j1Soveml1TMXbILf3gyrHmAkQcDPW97lnzNyv9zi04kxp4V9oYrwuSxGFpNcGA
	jYV4RSflY/SANNHDtPmN/0aT/bNAl7YNl9nSG+zr67u9xVEbqHVI0/O7rYoAPV1G
	cA3x+72QRa7y/1a6W1yaq/DR5x81n2GfgXaezfDOKXUKdgUmhE99L13kjA1lfJis
	pcxlMvgNEtZai+TVq0HnQ1asaVOSBko1K3krGceo7TUDA5b2krE3tmU20bYt1dCY
	elcUrEyVsULf7goaLFuZk/hYZldNbFroO2JCyKrgHhhG9R9SXd+Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkh7nr0ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 13:52:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FBkl4X001857;
	Thu, 15 Jan 2026 13:52:47 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012060.outbound.protection.outlook.com [40.107.209.60])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7bb0c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 13:52:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzxOSNW9GHQmudSr2vV7ikaFB0GbFE7OqWkxbzm3KVTGAFpTGMPSCY8Uv9lS2/wo0+BcI7oooivo+2FQpVE2qWqPfbO7tBEU/o+Hocg0sUuNTlqcBKTcET3FFqiaYfzeR/9P71ejKl1P1vnvIyH7ra6RC8QyGf5IFHmfght2V1dS8P2WQ/kwtOq7NdG9B+R+fdZ09rBL0H17IOOq43cEtkTDj3UeN9MSfGyYNMpkHJLNQFkUJL+SYf1rQmjU7YRfBzpNkMJoW57KQqUqIJtVzJo7A9MTgAsgbGedJEypejG0rqY8zewlvmmG3GSmodcE0GqXx/km7D1M9VE/izx0AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5WpEUw2WVc3Mj0gL6fktjVmkcle06OKkcqbkrlFfIY=;
 b=n8xue9BGP2rwoZOZOY20+fjei4NID27i39AODvy8bPxDA9O4o9mj7+KfYuV8xpksVqQymr6AmW7fPqrnxvxUr6vcNjkJF5xYNA74h8xouAw8L8mgteVE8Th+S7Ayp7PISX2D7L0heeTpVYqhqlGQfYv9r6TqixUvxIRf6VuFpHYH2RmoyHBTz1HI9IJhG0r5nWvQgXHpqnyluuVhb7+fAdN/L5KiFRrc7XFb1U56aSjUX5weEmjo4dVmeexd0u31lV6XU3hn2kyQfPzqyDHfyD+2AWoJuc04AAmnylL1LI2RaY5xp6AWiNk0NHYAdcXl6Lyoz0NXuiY9dINWkKFxww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5WpEUw2WVc3Mj0gL6fktjVmkcle06OKkcqbkrlFfIY=;
 b=f25FHsFkOqcBMzMpjJhgHBZZ9Bfbv7yXwzfPjXCKOyF8ezSlc+B4OEL4dOknHsM/Xqu1iTCzhyCMevkrdFJZZekkJjWDuHj2KRXw6hI7XLKFKRXUmmS6NLckuwy8Wp8ti+pR7LpsPP/bmuxzx4e0w5ZvtkbVWPltp94KxhGn0Bs=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by BY5PR10MB4371.namprd10.prod.outlook.com (2603:10b6:a03:210::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 13:52:44 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 13:52:44 +0000
Date: Thu, 15 Jan 2026 13:52:47 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v2 21/23] mm: rename CONFIG_BALLOON_COMPACTION to
 CONFIG_BALLOON_MIGRATION
Message-ID: <76a1cf4e-7635-4bba-a350-d6f6da6fbe6e@lucifer.local>
References: <20260115092015.3928975-1-david@kernel.org>
 <20260115092015.3928975-22-david@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092015.3928975-22-david@kernel.org>
X-ClientProxiedBy: LO4P265CA0301.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::19) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|BY5PR10MB4371:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4ab2c9-50a9-41b3-bde0-08de543d5bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9xssNg0fJlfvZ8XuWTj83KMfA69XikLLeWy9GAxeH0QhmdF4slux5anguYm3?=
 =?us-ascii?Q?G/bn8Jkr/V4oxzLQ6XmF2VUV+N/iy8Ll7WPsRpiHqBE4DLGeSMXAy83ybD70?=
 =?us-ascii?Q?qfygtfVck2aTX5P6kl/o21sxWJKk4vxDaPBEhH7vSNGJIuQj4J+/JQ7Rn/MT?=
 =?us-ascii?Q?WYBHdGykh6fgCQVmqS/lm7rMSw7gLzSujrc/lxnGbCkTKwUXto6EDZiN7mzR?=
 =?us-ascii?Q?y6OXNDw0aPdcJ0ldMa5RSIPdKYmyDo9E7UzP93k1Hva5WldaiAeMVn0isqfm?=
 =?us-ascii?Q?q5aeqDm7qpiYW+vdjO0St5pCIg7DwTpXVSkl7ReXVjUt/yQQVeXOP7VUiP2w?=
 =?us-ascii?Q?OdobrYqosF2NaqLpE7sjKLfvlnAvTMcD1pA2diH5cntHv0q1HtlpOj0cksVO?=
 =?us-ascii?Q?0dUqyOPWVI/PuFqfSkH9jWty3I5VhdPVrWtvuSv7vs5mM03QiGUDtePf+9DA?=
 =?us-ascii?Q?Bp4KS3l2symlNd7gbrdmhibiIg2BaNKZhpHgJOVuQ6vzkgXp/bsMFZdGGrKI?=
 =?us-ascii?Q?Q3JzO9xFeI5tlS+7tZKWC0WQ947QVTLvT5vAec9bD9C6X4KtmjeChMSp1KnL?=
 =?us-ascii?Q?UVZQ/10fEoweJfLDMthSMmGro8kQaxisQQwYE/UbzpXhAi+AZEPaujS7uk70?=
 =?us-ascii?Q?86ouXaqOlhMsbyXJ8qq+cyHJ1FIJ6Mo4w2RLXzFIKTI0xBHg8+cxc/S1wnrk?=
 =?us-ascii?Q?rOa2rTNCuLbJtIw5y8/cr/Mq2+kF5Y9bNBkAFH4AzNmj540Os4fOGi2aGtgi?=
 =?us-ascii?Q?Ferb2mpdxbzEyaOQl40JjadzMSv6YeuQbvzujwf2/CXfGPF5QVMW1N1G50VR?=
 =?us-ascii?Q?ghrr51xhCOSyX2clV6J5CGLrR5EMkhx/xl0CZ9uk+G5kRxAxTvlTXKCIaGEk?=
 =?us-ascii?Q?ONT2rtGNGBkxHsdy+u8qCPpOge5osDHe/qQSyHrTiJxn2guNHXAfBPtwiNsf?=
 =?us-ascii?Q?wU03W5Dn3D7QmH8UVCYhSR/e404bxzBmDfObg2OErHPO5UBTqIn/K/CQFnFe?=
 =?us-ascii?Q?xNEs4iHT+BKslCL56uWDuwxIf/eOJHlMQWjnnbMuZR2g265wXXZYIs5446xI?=
 =?us-ascii?Q?kfpid3lz2i7f3eCEV4g758cZk4pwn2yPnOPU9iWXd+R/M8MpEtHH648E0jfj?=
 =?us-ascii?Q?F1mGSBJHhh6j311ry3S57cBOHE6bSNAUDjDGbucM2SMIhS8UjVRg1BuLw2zw?=
 =?us-ascii?Q?HFOZetYhC62oQ8WXtPyKDt3GlER3Cq1IFCF8Z7I1OoIzf+xovYeS433GRgxP?=
 =?us-ascii?Q?GtWqyGT3BA3eCicWhV1KmFh+jiXiWp6BzeVptk4DcU6z+m4ci8Fjpz5QNVy2?=
 =?us-ascii?Q?Z4oVGWKcj3zhSD72tj4uZKiu1VUHMHWTPPxy0Z/oPr9X96ufJySVi7cv7/80?=
 =?us-ascii?Q?qdkV0d+g/5L7J7jKPDRoUP+uu7nKXznIQ7HAMcAL+0uoJPI8xfAgKqiK6HWC?=
 =?us-ascii?Q?/9IRphrJG9bMbc1lHLfr9ADePw2jxEeUmjFEZi7zdCyiyA1MBB1eF1Qmo85t?=
 =?us-ascii?Q?Lj5Cce4Io9LGumP1PJJp+HVRYsAqz8pZ78Fi9y7fMg9dh7LG75k01Y2UpBIZ?=
 =?us-ascii?Q?hXOw6MiUUDBb4cR3YA0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9CfO1GVI3n1h+yTOjzZlBwLIGmKFmiOHDbCBAkVgs0F5p3jcDMi9GBNSGA4U?=
 =?us-ascii?Q?z0k1DM13h2BArpmYKNPzE9hw+QGKTCN3ZR9CORMgANgrXWNYcoWsCU9p/Nrh?=
 =?us-ascii?Q?5X/t+9/o5h/ogTTzHhnSW6sL2YK7lYIaAlWt3smPnd4JGsmGA9OV37AKoHfO?=
 =?us-ascii?Q?E7ZKrPrGQ08IezTotHsk+7TvI2zddceRMEnlY/ZUq86NVBF1ihZcJ89O13Qy?=
 =?us-ascii?Q?1//cuVa9eEcd99C5CTdRfjnpv+5xS7bMzZMI9CMvEiuUUj9D4nW89qN5CUZ8?=
 =?us-ascii?Q?XHlDkRCh9qOmExewPkGaUNgAow6Kdo0jJxcMLI+M6vFAqrQ4k3gzc5xON0p4?=
 =?us-ascii?Q?/mFbUgMeIEx6v+LR1yaneQjVojpjakv8SiV6aih0tK5XaMDYzKWy1laiF0o8?=
 =?us-ascii?Q?YUqBEDRJXiQJZOmHjmtVrGzW9Rk32kzd3yumxs9yMpFwp3sdntABeOOg9akf?=
 =?us-ascii?Q?PGHrlNR1fPejvbkbsgkYQUt8lJnSKusQi9frXcRK6XxjX78IPa/4LFIPLOj7?=
 =?us-ascii?Q?A1FiDpe03cMmyyJutODH7/Y/pQGN8XVQs0AUgJ5UL3recqTnLKiTMmhYvJTC?=
 =?us-ascii?Q?RepN35WmKYou9zPltVEdqricqOh5ahBDaU23dQbDKjQYbuN9aExdnzCfh1+m?=
 =?us-ascii?Q?5twiOqZNXwc8Eh9DZWMMJsBG3eSaA2z3bLQTahN/MBjBmiEty5p1VcAL7wdv?=
 =?us-ascii?Q?BlCf4qufnpqqKnAKV8sTMz3qtfISefSXq/mYb6QZuThVHAV137geVio8ct2n?=
 =?us-ascii?Q?1w+DQu8rQNhLIWMMa2mfxZf4mhJOo3AlR7vEGGjCzSj9aQdPgpwuNyqfnhxO?=
 =?us-ascii?Q?wurHWTC9ukLZ91fKx2SB421usggWmw3XPJrxxmwhenduCQ4Y3+vCiMFl5yzx?=
 =?us-ascii?Q?uXh59EuD7lHaERZm9inGppa0A5jyGTXIGThLgda2NnLDd71ef9FInNUiLvmT?=
 =?us-ascii?Q?2lSIepzvq0GCY/89IYL3ZTOeKXcIdbXyqkm+/Oi98qq/ppzzF0SwigOsuD67?=
 =?us-ascii?Q?JAFNnrxVE0lfxsU4bOz3y06EKoj/9UMrKekAwMtVCmTOPlDsVffUV2QtB2ev?=
 =?us-ascii?Q?Y6ZVWOXQn0MZPNJinYmNxwXPYnYMMH+nlip3jel9W6KBMYS2jER+hlvbsaMy?=
 =?us-ascii?Q?YiBSiUC0y8JkeGsqEkxTXjo88JCApSaFUR1tpGVtr3fPJW/FHV8mtS2os1h0?=
 =?us-ascii?Q?VbMRvWJCIrQAcGtZtj4FBG7RVlmprcp3H8az/CvECk8OddjMRAQHfh3gTdOV?=
 =?us-ascii?Q?B8x9TRsD6YeiVsXLSISwMq/0iWkAMcTg4InOSuE3mnthpi4PbJHTavhU/5jD?=
 =?us-ascii?Q?KpL7wgcttHj3ETBkOGMgnyuX/E3C6B2IsOugXb6g0mJr+tp18XVguZpwdtw6?=
 =?us-ascii?Q?a2Hq3QjgpAvfLl7pTh7gauTrTXVrvUq8V5LW7vnMLZvUdoggSGP4ro9YlOXv?=
 =?us-ascii?Q?DZs68zPAIbSHdi5rnBflDhqRBuMqa21kitFsHMmNeiC7hcjh8X9uprGAMiu3?=
 =?us-ascii?Q?Kuv6V3fvHnKW25XEBFQIoaLmCgkQQp47iwDQXi5xDq/YUy8s2JB2KkoMWphv?=
 =?us-ascii?Q?/8kqt4QVEQLaGJcLbS2CaDVndFlsuitIXJy1zGl+aX21GMovYY9hFC0fhRhj?=
 =?us-ascii?Q?zEEnh0vb0778mfsOFCmOEX3/RMdR9aofcro2X3cWO9EmVLs4VjSFII5jDeQ0?=
 =?us-ascii?Q?XuDsAfDyvypvLcia32EfkFf/OMWxcxr60EO36ORxyU4OH6o13f/54apYyqvj?=
 =?us-ascii?Q?FA3XIib1eMROAqM3Ns+ikFus+BHd9MQ=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rmanQWo5wdmYiHK2Z42nXbedUCJTbrNLO7klhxRkadUs0sXJOzAjoJ1mGjzXm+CwvhCjNaNd63AD5Mo5JRJy2+KI8Y5MzyU22WCfT6aKNlgMezLQK85B1d0RhAGv5P831dJbgapSZDOV9UO4/49ZvAR39GeBu941rVKQyaJfhhMOUZaGv2Lq4Hwimj/ug3N607Ab/HQuAigIsN0hB6yNJIevz2jlBonmHgYEhJX8k6twGdw1vHFoulvylnMl3pA0MCg8iDcuwesXggY0pFd55lC2JFv7DiPlbimn4oKFVKHtl39VRmXHvYS4sAVfr/0AezASpre32wqHzn5qaYLFVMix0aWkGFi0DNRmgx3HYJ+xeOgH9nbSQv840Kj+msmxiirhWBPLUkhwZCFO7wuiJ3Dqxk7TzUEyd300Ynw2NCAmeYd65A3ly9QFdDhuQJ1brcwiGsvtvlRU/DIxrFrU0qchNKroi+HkLaysr0Tb71hdbBfKxUZMiJWCmrAnsI4D1HuswmZgR3lFSclxq4AkX3VTBZwrjpQG1Qf9hauvh/zguW0BhLOqGFbQyZwS9AsiB5WYXyDBXWp+GhR4AdhhiXby5JJ5/pWA4b6jJ9FB0nQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4ab2c9-50a9-41b3-bde0-08de543d5bb8
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 13:52:44.2897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGsBw3+YWY8RSt8X+VjKNEeNKKduN33skpMuHkiaLIqJrcslXif3XWcARWoClzZlK7c5HztW2jG3MAO5PFeTTlhNKJ0wbmsyaP9amtsTwx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4371
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_04,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601150102
X-Proofpoint-GUID: HukTMBWSbdGdgIsNZSKnL7-_GV8o8M-v
X-Authority-Analysis: v=2.4 cv=X7Bf6WTe c=1 sm=1 tr=0 ts=6968f130 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=XraGVkj0le8dWsLnROYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEwMiBTYWx0ZWRfX+WWLKp2WDPyW
 xK/oHuNK3e7kgzDuWgoKLg7b5UD/u7/tM1G16xoa0gBk26sJuPvhi+7dQSPaPzWwUs3wpPvupIx
 pohWgQA3MljyB/ko1XWYj8/GiPlRBGgH8cmmtuOk8vhmhILCUSCZ7cCn/zbkrciFRbCEifocaWv
 ZBB1jwYgflG2SDnp1LonAQUeyaNLJ3/DZVKjbFrCUrb0q1ftZvSeQBAnIQAhtSlzQJiJYxenfdG
 l4ExWutpNM9+Ud+1KC1RL2jE+BM+2bKMto/DKgHb/MWQFsCvx3DlpWHsR3EQERzQr7LcAdiCkdr
 wja+1nh0eJMC7lUDkKk2WNaHjOdDHGIOPQysTYNYAlmt5CsQVu8n+3vz+4CBKChkZntNIDLxiws
 BxeIhvtKwtrylvo28O1XnpyjCGnraWDjt+GvE2+lN2yj/l6OKMzbNDFVdVcL/BBd6XbaJrgxZFD
 xeOUBk2O1PmTpz70TVw==
X-Proofpoint-ORIG-GUID: HukTMBWSbdGdgIsNZSKnL7-_GV8o8M-v
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 10:20:11AM +0100, David Hildenbrand (Red Hat) wrote:
> While compaction depends on migration, the other direction is not the
> case. So let's make it clearer that this is all about migration of
> balloon pages.
>
> Adjust all comments/docs in the core to talk about "migration" instead
> of "compaction".

Saw:

include/linux/balloon.h:25: * performing balloon page compaction. In order to sort out these racy scenarios
include/linux/balloon.h:26: * and safely perform balloon's page compaction and migration we must, always,
Documentation/mm/page_migration.rst:175:balloon-compaction infrastructure residing in the core kernel.

At this commit so maybe a few more to chase up?

>
> While at it add some "/* CONFIG_BALLOON_MIGRATION */".
>
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>

Otherwise LGTM, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  Documentation/admin-guide/mm/memory-hotplug.rst |  8 ++++----
>  arch/powerpc/platforms/pseries/cmm.c            |  8 ++++----
>  drivers/misc/vmw_balloon.c                      |  8 ++++----
>  drivers/virtio/virtio_balloon.c                 |  6 +++---
>  include/linux/balloon.h                         |  2 +-
>  include/linux/vm_event_item.h                   |  4 ++--
>  mm/Kconfig                                      |  4 ++--
>  mm/balloon.c                                    | 10 +++++-----
>  mm/memory_hotplug.c                             |  4 ++--
>  mm/migrate.c                                    |  2 +-
>  mm/vmstat.c                                     |  4 ++--
>  11 files changed, 30 insertions(+), 30 deletions(-)
>
> diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
> index 6581558fd0d7a..0207f87251421 100644
> --- a/Documentation/admin-guide/mm/memory-hotplug.rst
> +++ b/Documentation/admin-guide/mm/memory-hotplug.rst
> @@ -603,11 +603,11 @@ ZONE_MOVABLE, especially when fine-tuning zone ratios:
>    memory for metadata and page tables in the direct map; having a lot of offline
>    memory blocks is not a typical case, though.
>
> -- Memory ballooning without balloon compaction is incompatible with
> -  ZONE_MOVABLE. Only some implementations, such as virtio-balloon and
> -  pseries CMM, fully support balloon compaction.
> +- Memory ballooning without support for balloon memory migration is incompatible
> +  with ZONE_MOVABLE. Only some implementations, such as virtio-balloon and
> +  pseries CMM, fully support balloon memory migration.
>
> -  Further, the CONFIG_BALLOON_COMPACTION kernel configuration option might be
> +  Further, the CONFIG_BALLOON_MIGRATION kernel configuration option might be
>    disabled. In that case, balloon inflation will only perform unmovable
>    allocations and silently create a zone imbalance, usually triggered by
>    inflation requests from the hypervisor.
> diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
> index 7a3c4922685ab..8d83df12430f2 100644
> --- a/arch/powerpc/platforms/pseries/cmm.c
> +++ b/arch/powerpc/platforms/pseries/cmm.c
> @@ -494,7 +494,7 @@ static struct notifier_block cmm_mem_nb = {
>  	.priority = CMM_MEM_HOTPLUG_PRI
>  };
>
> -#ifdef CONFIG_BALLOON_COMPACTION
> +#ifdef CONFIG_BALLOON_MIGRATION
>  static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
>  			   struct page *newpage, struct page *page,
>  			   enum migrate_mode mode)
> @@ -520,10 +520,10 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
>  	plpar_page_set_active(page);
>  	return 0;
>  }
> -#else /* CONFIG_BALLOON_COMPACTION */
> +#else /* CONFIG_BALLOON_MIGRATION */
>  int cmm_migratepage(struct balloon_dev_info *b_dev_info, struct page *newpage,
>  		    struct page *page, enum migrate_mode mode);
> -#endif /* CONFIG_BALLOON_COMPACTION */
> +#endif /* CONFIG_BALLOON_MIGRATION */
>
>  /**
>   * cmm_init - Module initialization
> @@ -540,7 +540,7 @@ static int cmm_init(void)
>
>  	balloon_devinfo_init(&b_dev_info);
>  	b_dev_info.adjust_managed_page_count = true;
> -	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
> +	if (IS_ENABLED(CONFIG_BALLOON_MIGRATION))
>  		b_dev_info.migratepage = cmm_migratepage;
>
>  	rc = register_oom_notifier(&cmm_oom_nb);
> diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
> index 7fd3f709108c2..216a163959684 100644
> --- a/drivers/misc/vmw_balloon.c
> +++ b/drivers/misc/vmw_balloon.c
> @@ -1719,7 +1719,7 @@ static inline void vmballoon_debugfs_exit(struct vmballoon *b)
>  #endif	/* CONFIG_DEBUG_FS */
>
>
> -#ifdef CONFIG_BALLOON_COMPACTION
> +#ifdef CONFIG_BALLOON_MIGRATION
>  /**
>   * vmballoon_migratepage() - migrates a balloon page.
>   * @b_dev_info: balloon device information descriptor.
> @@ -1803,11 +1803,11 @@ static int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
>  	up_read(&b->conf_sem);
>  	return ret;
>  }
> -#else /* CONFIG_BALLOON_COMPACTION */
> +#else /* CONFIG_BALLOON_MIGRATION */
>  int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
>  			  struct page *newpage, struct page *page,
>  			  enum migrate_mode mode);
> -#endif /* CONFIG_BALLOON_COMPACTION */
> +#endif /* CONFIG_BALLOON_MIGRATION */
>
>  static int __init vmballoon_init(void)
>  {
> @@ -1827,7 +1827,7 @@ static int __init vmballoon_init(void)
>  		return error;
>
>  	balloon_devinfo_init(&balloon.b_dev_info);
> -	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
> +	if (IS_ENABLED(CONFIG_BALLOON_MIGRATION))
>  		balloon.b_dev_info.migratepage = vmballoon_migratepage;
>
>  	INIT_LIST_HEAD(&balloon.huge_pages);
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index de8041c3285a1..4e549abe59ff1 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -802,7 +802,7 @@ static void report_free_page_func(struct work_struct *work)
>  	}
>  }
>
> -#ifdef CONFIG_BALLOON_COMPACTION
> +#ifdef CONFIG_BALLOON_MIGRATION
>  /*
>   * virtballoon_migratepage - perform the balloon page migration on behalf of
>   *			     a compaction thread.     (called under page lock)
> @@ -851,7 +851,7 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
>  	mutex_unlock(&vb->balloon_lock);
>  	return 0;
>  }
> -#endif /* CONFIG_BALLOON_COMPACTION */
> +#endif /* CONFIG_BALLOON_MIGRATION */
>
>  static unsigned long shrink_free_pages(struct virtio_balloon *vb,
>  				       unsigned long pages_to_free)
> @@ -948,7 +948,7 @@ static int virtballoon_probe(struct virtio_device *vdev)
>
>  	if (!virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
>  		vb->vb_dev_info.adjust_managed_page_count = true;
> -#ifdef CONFIG_BALLOON_COMPACTION
> +#ifdef CONFIG_BALLOON_MIGRATION
>  	vb->vb_dev_info.migratepage = virtballoon_migratepage;
>  #endif
>  	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT)) {
> diff --git a/include/linux/balloon.h b/include/linux/balloon.h
> index 82585542300d6..e8da95ca4ad48 100644
> --- a/include/linux/balloon.h
> +++ b/include/linux/balloon.h
> @@ -45,7 +45,7 @@
>
>  /*
>   * Balloon device information descriptor.
> - * This struct is used to allow the common balloon compaction interface
> + * This struct is used to allow the common balloon page migration interface
>   * procedures to find the proper balloon device holding memory pages they'll
>   * have to cope for page compaction / migration, as well as it serves the
>   * balloon driver as a page book-keeper for its registered balloon devices.
> diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
> index 92f80b4d69a6d..fca34d3473b6b 100644
> --- a/include/linux/vm_event_item.h
> +++ b/include/linux/vm_event_item.h
> @@ -125,9 +125,9 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
>  #ifdef CONFIG_MEMORY_BALLOON
>  		BALLOON_INFLATE,
>  		BALLOON_DEFLATE,
> -#ifdef CONFIG_BALLOON_COMPACTION
> +#ifdef CONFIG_BALLOON_MIGRATION
>  		BALLOON_MIGRATE,
> -#endif
> +#endif /* CONFIG_BALLOON_MIGRATION */
>  #endif
>  #ifdef CONFIG_DEBUG_TLBFLUSH
>  		NR_TLB_REMOTE_FLUSH,	/* cpu tried to flush others' tlbs */
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 0d13c1b36e1c1..460a148d5b71a 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -597,8 +597,8 @@ config MEMORY_BALLOON
>  	bool
>
>  #
> -# support for memory balloon compaction
> -config BALLOON_COMPACTION
> +# support for memory balloon page migration
> +config BALLOON_MIGRATION
>  	bool "Allow for balloon memory migration"
>  	default y
>  	depends on MIGRATION && MEMORY_BALLOON
> diff --git a/mm/balloon.c b/mm/balloon.c
> index 5734dae81e318..8a21c6b9a7f0a 100644
> --- a/mm/balloon.c
> +++ b/mm/balloon.c
> @@ -34,7 +34,7 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
>  {
>  	lockdep_assert_held(&balloon_pages_lock);
>  	__SetPageOffline(page);
> -	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
> +	if (IS_ENABLED(CONFIG_BALLOON_MIGRATION)) {
>  		SetPageMovableOps(page);
>  		set_page_private(page, (unsigned long)balloon);
>  	}
> @@ -51,7 +51,7 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
>  static inline void balloon_page_finalize(struct page *page)
>  {
>  	lockdep_assert_held(&balloon_pages_lock);
> -	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
> +	if (IS_ENABLED(CONFIG_BALLOON_MIGRATION))
>  		set_page_private(page, 0);
>  	/* PageOffline is sticky until the page is freed to the buddy. */
>  }
> @@ -153,7 +153,7 @@ struct page *balloon_page_alloc(void)
>  {
>  	gfp_t gfp_flags = __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN;
>
> -	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
> +	if (IS_ENABLED(CONFIG_BALLOON_MIGRATION))
>  		gfp_flags |= GFP_HIGHUSER_MOVABLE;
>  	else
>  		gfp_flags |= GFP_HIGHUSER;
> @@ -232,7 +232,7 @@ struct page *balloon_page_dequeue(struct balloon_dev_info *b_dev_info)
>  }
>  EXPORT_SYMBOL_GPL(balloon_page_dequeue);
>
> -#ifdef CONFIG_BALLOON_COMPACTION
> +#ifdef CONFIG_BALLOON_MIGRATION
>
>  static bool balloon_page_isolate(struct page *page, isolate_mode_t mode)
>
> @@ -340,4 +340,4 @@ static int __init balloon_init(void)
>  }
>  core_initcall(balloon_init);
>
> -#endif /* CONFIG_BALLOON_COMPACTION */
> +#endif /* CONFIG_BALLOON_MIGRATION */
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 389989a28abe0..bc805029da517 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -946,8 +946,8 @@ static struct zone *default_kernel_zone_for_pfn(int nid, unsigned long start_pfn
>   * We rely on "present pages" instead of "managed pages", as the latter is
>   * highly unreliable and dynamic in virtualized environments, and does not
>   * consider boot time allocations. For example, memory ballooning adjusts the
> - * managed pages when inflating/deflating the balloon, and balloon compaction
> - * can even migrate inflated pages between zones.
> + * managed pages when inflating/deflating the balloon, and balloon page
> + * migration can even migrate inflated pages between zones.
>   *
>   * Using "present pages" is better but some things to keep in mind are:
>   *
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 4750a2ba15fef..1bf2cf8c44dd4 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -88,7 +88,7 @@ static const struct movable_operations *page_movable_ops(struct page *page)
>  	 * back to the buddy.
>  	 */
>  	if (PageOffline(page))
> -		/* Only balloon compaction sets PageOffline pages movable. */
> +		/* Only balloon page migration sets PageOffline pages movable. */
>  		return offline_movable_ops;
>  	if (PageZsmalloc(page))
>  		return zsmalloc_movable_ops;
> diff --git a/mm/vmstat.c b/mm/vmstat.c
> index 6ae8891c9693e..e96a344ab5974 100644
> --- a/mm/vmstat.c
> +++ b/mm/vmstat.c
> @@ -1422,9 +1422,9 @@ const char * const vmstat_text[] = {
>  #ifdef CONFIG_MEMORY_BALLOON
>  	[I(BALLOON_INFLATE)]			= "balloon_inflate",
>  	[I(BALLOON_DEFLATE)]			= "balloon_deflate",
> -#ifdef CONFIG_BALLOON_COMPACTION
> +#ifdef CONFIG_BALLOON_MIGRATION
>  	[I(BALLOON_MIGRATE)]			= "balloon_migrate",
> -#endif
> +#endif /* CONFIG_BALLOON_MIGRATION */
>  #endif /* CONFIG_MEMORY_BALLOON */
>  #ifdef CONFIG_DEBUG_TLBFLUSH
>  	[I(NR_TLB_REMOTE_FLUSH)]		= "nr_tlb_remote_flush",
> --
> 2.52.0
>

