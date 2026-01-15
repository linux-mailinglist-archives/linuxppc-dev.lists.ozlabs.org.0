Return-Path: <linuxppc-dev+bounces-15842-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5508D24871
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 13:34:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsMqW39Mxz309H;
	Thu, 15 Jan 2026 23:34:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768480455;
	cv=pass; b=ikFxO6gxXmNYsWLPzyQvjfic1N/ihA1CfdtBjehf4k1QG4YNsxZIRH+2XM1Cn9MQU6+6DueYD21WPLaR/Xvq4uevGQLMxGqki1c0IExMuYSM0yDlbnWVNv6ZXNGPvV03NNRpb1r5/CrpYwTjfrt/tfpQ2uXNEcE1MIu/j21OGIRGmn4w2CJGl8wHZ25qoOZCgXazg5XS98nX+7jsE//EB3x46Ip0MY3BzhbowNGFAjgj43ogkm9yefdoedhg/Ro1XPn3utvGBq7UwIz8+h8Id+zzMNoTVNxyIO+5GIaucf/6T1mdzGN7VDE2SqKOxfyLX22wuwSoTko44izFq3yxig==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768480455; c=relaxed/relaxed;
	bh=EBV+/04lZKdptAbRJIYqAv3rxwYt+XA7YTl9awQgrnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BFwpfXKLgXlD5Xjdg5IPPFnY5qVXXcEFYiEqUuzUNcO6EmpARVjaN+a7YsCh4z1uUnU/uKllv3PaPbuqi6JjFQyaOpChNQjZ7SKZ0RWbeakBoOqMytVksqm+pvILlloR8Y07eNMs5E4Qms9WEgrV/dNPz9oJcO1XSnc2fYXPejjn+2Xz/SLAtqlwZ1BG7vP81nnJqAd1knMzkcC1ucmDXuN/jGykQJc9FMSBUuivvvCZ8mXPNAXOlHqMJI8cQ7Pw9OWLTXjBiiG7T3Uycp6bRwwVeZNgC8O8hrbP6fweLcci0x49ZhLogURf9rhGWsmnD3fKK4JSYqFWkIsbL4dkAQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=aq/dtEEK; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=txHdk3nI; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=aq/dtEEK;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=txHdk3nI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsMqV3cl2z2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 23:34:13 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FBCqOL1360856;
	Thu, 15 Jan 2026 12:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=EBV+/04lZKdptAbRJI
	YqAv3rxwYt+XA7YTl9awQgrnM=; b=aq/dtEEKfNQHHaS/6GVeeXRWmLKoFtsgaT
	I/cIaLUaKB6DrXkdMC/6vFWbnsoPQEcoC795dxkxqVTcMXbjlOQYpt+knCXD6+o9
	2DpzqETqIoHr/D89pYI7n+UZ+DTa6x+vODs1MQe+WfYIM2DLyJZ8qCHKIlU+Cd0j
	YAy32s5r5B9fQ2q3A55JefshOI0y7F2WnuCEdPjj4pSZjHByRfkTR38V62+Y5VQE
	7m+4ZCuj2dzg8xwVLtkuqs6UOO3WI0fqAjTZwQJGocEGkNUybbqNe9joKvI6x88P
	2wcjdzmTEnub2QlphKkNNBmq+KKhmb+nTEp2HfKH6f7h0l6PeJiA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bp5vp2wq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 12:33:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FB8dHH004157;
	Thu, 15 Jan 2026 12:33:48 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011058.outbound.protection.outlook.com [40.93.194.58])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7n2wjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 12:33:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YiKRG9OMt+wLtxNjrChIyiRLlzhWBgYLi+qKIDCPYvEuP3aHDntH4a4nth+nz8TPuZhXzYY/lfQRmrtOBwuYBcOZ5wzLaFL96H1ZSjYvJXQIR2fqUXWl75fWs8niTOCQPoC9UwlmB7FxfkVNHeqEYh2arxPJOdYKvSa1dMiWfZXg7ib4GPOsnMGEdTErlEtYjvJszhrEwKOetgMSlA1Fsy1y565P7sW0UzpfQ65HBCf3jarW7r/N4DljDQmrHUhAc7b/C3UX0QqCVD6FIoUvBC3Ndc8JV097WGj338YKGom+wcnySrL1kLkorfykbzrrCfiOTrTJhWffB9BOj+Wwpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBV+/04lZKdptAbRJIYqAv3rxwYt+XA7YTl9awQgrnM=;
 b=MPs0vp0+CjZNAyV01Tx9K6NBKSxuuzWmuoleO6RtZNuk76D8cv7pJ3aSkRSBFTjWTPQARwFeDx5cHslXVW1vLDJ7zRpyMQp54FRkno5mPlD3JaSBHE0tRCGbvrIVU4w0IVmiMBJPe5LcvxYDzTnFRAetY4JFUrv/ypFH4ExcfJLEVlABZpVWCd3E0XVEIWr+PESv5gXPAxAKqUhR1gEeRlvAHsDWogfM7uG7VXs17g4ZcRUhnAvsT02lW4c8WKM7FBwppH3rDjzwSixGsZmNAUf+Oe36gCySAZw7JADsej4p3VtrXqxrBRknnOoWaqC05Ble5m0HTt350sg4NVr+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBV+/04lZKdptAbRJIYqAv3rxwYt+XA7YTl9awQgrnM=;
 b=txHdk3nI8ncEVXsnPjYCc4s4WkfTm/3yo4vaWpWgaOMlzNnhUDeXpad/4AZdKcN7oKHcYYD+UYFR6ii0yYB9h8APMzgSRtbmg3dZv9WL8PJ32LOGP8N/GUWdNXApf/jgt/6I20r5YNxbaI1i7Ry/99A/1z2i02npTfDxlAZw31w=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by CO1PR10MB4801.namprd10.prod.outlook.com (2603:10b6:303:96::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 12:33:43 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 12:33:43 +0000
Date: Thu, 15 Jan 2026 12:33:46 +0000
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
Subject: Re: [PATCH v2 16/23] mm/balloon_compaction: mark remaining functions
 for having proper kerneldoc
Message-ID: <e093894b-4846-4115-91af-22884804b2fd@lucifer.local>
References: <20260115092015.3928975-1-david@kernel.org>
 <20260115092015.3928975-17-david@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092015.3928975-17-david@kernel.org>
X-ClientProxiedBy: LO4P123CA0671.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::11) To BL4PR10MB8229.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|CO1PR10MB4801:EE_
X-MS-Office365-Filtering-Correlation-Id: 3004a1f0-1aad-4ac2-cae8-08de543251ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MZvMqTLKcmtJfAL5UZo1bGvJ5cfj6Y9miXllibxk6fVFtVVPSx5lEFmoLsVj?=
 =?us-ascii?Q?3646DbRpO548qUXQucQ9A28r2GoY4q+0XnmP9X7Vab3lkhDWoYPXnXc0Olqe?=
 =?us-ascii?Q?YFDaw8KIxZ5/Ho5y24xShc2GSnzeXcurZw54r62YjUmWPV2R6dxlNZ//3Tya?=
 =?us-ascii?Q?GGvCbiZ+BhyJbm/DjT2hOzzGW+zybUDAwfICvYkri6J11qcQn7/ycgbteH20?=
 =?us-ascii?Q?Zw+RQ6QFRkj/jlSyQkXKbSp8MA/Iq8AFpFc/0NH0FR4HjhBDAyOQzUl2L14X?=
 =?us-ascii?Q?h3MOkjMq8r33oiggCpHDbP9nyfqcT7gy6eryUbunI6lcCPbdPdOzIDdQj9EC?=
 =?us-ascii?Q?m0JWrEtzQtLFb07JPwIdsobRMtf2xgWwazm/SM137toSAYULYDW9L7cSdihy?=
 =?us-ascii?Q?V6TW+CmQ2HZl0KIcGQyQR8zVf2w8aWEmHnS37ok+oVyG1Nnx1+TfDBbpY6So?=
 =?us-ascii?Q?37jGmR5RVeyOqReChdXIaFIJICe/iNGpG5J9QZpaLOlJHa0NQ6Tn/q6HShJa?=
 =?us-ascii?Q?Ldm1ZiICmPb7KG5jdcjYvio6/gdM6jUCxIi3eN6RWVqY8UQlr7rQXJatMRDx?=
 =?us-ascii?Q?qbRl3QqlZ9g5JjP0Q8DbuUGG19T/oJdMbVxFFfS8US0C8HS3IwWcFAep1Im1?=
 =?us-ascii?Q?iUc5zOhZFIykRRUQadI60dr8r0/M+5wruDGHr+S/jmvqFMszrjCE1cXyxIDt?=
 =?us-ascii?Q?t0CIgq9Y4wK6NrT63QdbkNxvnZlV1otfpLwu76HoozZTf+zjsodA3Btw9D+5?=
 =?us-ascii?Q?MriGM5o6dA+ZZ4asnbxkRLnD5qDSbmWuNU1IqdrMiE4vdaJ0OdXXEgRO58GQ?=
 =?us-ascii?Q?dEY7ryVAvukWGYDq4MMCRVdBV9pfCNvMiRH+MWyuZDhZRRpdEsL+f8IQndjo?=
 =?us-ascii?Q?v63gKCaZZMCmHgPW7cCQt6V5Ul8Vrlhuvg03zfX2A4PYx6FEf7UZXMGd81oh?=
 =?us-ascii?Q?Ly5+erwrWGZqZgpOT8IFDe2I9OnSTHMehHPFpZXUFDIR8aCze4dMLgNla2Qu?=
 =?us-ascii?Q?mIkbR/GuZcjOIPEu7rJCGO1Y07THzul9Rb1dncL9bf6qUc3pw1ubdR97rAkn?=
 =?us-ascii?Q?fTSUJ2SldzAIrZMYHbhekgffB69LD66XAjmCHwl1lDStsrN8Rai5lKZVg0vP?=
 =?us-ascii?Q?uNmsv0jYvoa7yVOssQeuPJm+7gZ2b4Uw3w32DCNUTFqs0d1Dbbku11yyHpKM?=
 =?us-ascii?Q?kUiZMRIdINCbb81/alc9vP7XPaUl6menMrAs3HZcV+VVIdHi5jg2dqtMnnV0?=
 =?us-ascii?Q?sy/fq6T2ZnK7rP3IE/pDsWeVRcuygHr5Oomxgf14W/pmOB0awq9yPZhiucLG?=
 =?us-ascii?Q?kYhhwofafLJb0DkqzJ8bvzwNNcGcCbSyMIKFfCEJi+WgIqg6yae2/7Krtf8h?=
 =?us-ascii?Q?+MsL5eJCyF0ooF/t8xWgMrZJEE99FzueNRy8W2SxGu9lkLQ037AecZouamYK?=
 =?us-ascii?Q?bFBSXJcWTRHUT9mVwD9X4YkVVv2oVgO2QzffMRgQ1uM2aLXtdZouYYmQdnzu?=
 =?us-ascii?Q?GJ6GQHmBcjdZvyKDjnWIoxtsWkzwQ74YRQJSfDXmjPfM1/6vviid4sTBefcr?=
 =?us-ascii?Q?OB4UyO81VT3qzkafceI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/D9T20CwvVhgH/hOC72St6Ktgd2BawkMpStbKV5RrBIXZCMJD6QOy/TNS/fD?=
 =?us-ascii?Q?zJrUqFvVd551d6a1z2YfLN7CfawvBvzQ/hRGhAOPifkd2VgIT48o4aei2EM1?=
 =?us-ascii?Q?zjRMplbLor8eY4NC32bN9OJSSm9wG71K3j7aGxMSLWXlWHN2Jvdy5l0l+MeR?=
 =?us-ascii?Q?NhO/adj7rYY1ESzJ46PY/xXJl5w8BMU/WPw0bmktB1p5FcB/dv/O4SExmRpu?=
 =?us-ascii?Q?ilwB9y1BfHa4EMhxj0SJENEfIv1ZM+IMditkwYE1dlzOKMuRbnkHDu4zN0ZS?=
 =?us-ascii?Q?jR2u78P6172QydPfCPyrCicXQny33eZKKIPaul/t06t2b8OCOIrFvK9C+O+Q?=
 =?us-ascii?Q?DPlMbK+muH3ip89QeD2Cw2WkwCtfkhmF7Kf7xPaDdOmTlNAmpPlz+2QVHes4?=
 =?us-ascii?Q?tocChst0neaUqtiXDBKRzxbYDivayfg/AjnZYRlI1p4LZoJYpn/RsioEXQ4G?=
 =?us-ascii?Q?lI6krz6I1rxiuFUAua+bFNrHelhxval2QCLgtmjaQRAv/4wt8WFhNRUnrI3G?=
 =?us-ascii?Q?9IGZLFmj0LqasdwoJj6AWmeS7diBfPse3CQ+a8uAs9qJbTnZDivY//M+cEHE?=
 =?us-ascii?Q?c+juqhqfyDNdw4HWnaWxKR9mdkgSjslNsLJQKv1zig4PE0JXia9VKD+uF5DU?=
 =?us-ascii?Q?O+0ivNSaQrwtj1vhcXSyLTVIxJ9px1m2VZOBqdYV9r3WlmtFSBOQAKPDcgtt?=
 =?us-ascii?Q?AchXa0GFgPPo0r0JSeEwN7ondzTM1EIlNVVZHJTtrmX91oENIMQPz/0h8YKx?=
 =?us-ascii?Q?0Gy4OtaqomweLeMZFNEs1kRT8+qH8FOYktbr/B3nEuhKao3Y1rQG9tJYoo3F?=
 =?us-ascii?Q?S2A/LW0yL/zrAYDmTsp8BrNQFJ3MiT/ciEUdQ3g0S99cMimSmhAlgXEYfbsl?=
 =?us-ascii?Q?oJ7dg/uVZ3wQLueU4hiyRlmMFO4fKpzRhWJcpZ2kCaoMPt7b/WUe5Jg9dh35?=
 =?us-ascii?Q?IUdGu1+1G2u2rc+w7geAh9gVdTI6CbG7q7sIqBvn5HgauEC8qFtbIYMlcTY6?=
 =?us-ascii?Q?w8E8abHkO8Ta5QcMLnePc+g2zjYmeHpibswWNsRiTpUQHZ5V6Zzl6M49Klyu?=
 =?us-ascii?Q?ZEkzIfuVnSDwuKcvb+QMwbV4e4A83UBPJAaS6E7Mlyeu9ukOa0VcOQ2uN+3Y?=
 =?us-ascii?Q?B/AvrUUMRDlSxX7p98gobDk4mVIuS9G3wRJ9Nyu663ozF6Ccz400xlobZY2i?=
 =?us-ascii?Q?YZ1ZzODLxPZ5UjZE6yOrRSiPb9YBunTRe6xE/VDYX9mho13CeeZDiwObkp/Z?=
 =?us-ascii?Q?0OfcXdpRZHnjV6/eHkpSsG/HWi4PONbzi2zgubP1gWpijBVlp576Ok7juPzc?=
 =?us-ascii?Q?Q2ZsmgVmEIRwBAPRGThwPgyi+1wy/kgBtzcKDdk9wr1Rr5deIklHB0Hl49dA?=
 =?us-ascii?Q?sx0b34byyZ0Uhx+MPpHOEgtCBYhG/UWOsjtJc833rVLNpFdRO197IsR9QJZ2?=
 =?us-ascii?Q?YDrs1uiBZO2S9Mqln4NnatqVLJ0Vko1g7ZaFsNL14AfDga+85FPN3Jfh4NJ/?=
 =?us-ascii?Q?J7nmtSJ175PeNRcAGH5H68BJC74+CH2Np8yyTnkPHAkpoD2APzEUtV31noSo?=
 =?us-ascii?Q?rVqLU+IOAyiTY3RJ8D9CLEZV7D4Oa/Wy0RpC0gDn765kqJAA1bAUf9WbC5G+?=
 =?us-ascii?Q?X5wkMeQs8snsR3O8vj/ev2zJQbaNN5tvJaIIWlOM44N24TF9OBYhDTgZXa/g?=
 =?us-ascii?Q?0q9z32SmwDb2DoI/XwYiDSNmIuSRCURi6LwdrlztxNyt/B7nG99gZBtlaPUM?=
 =?us-ascii?Q?AfMsuVfnT9Z30uVgQTRGFBZiYDlgjeE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oMN0xPXs1p3NHJUvTAQ9avDjoSeKctucFD+BLpL5yW/pDHpJEMUxjbLEeF0zZ9e8So3jjcor8CyrkZvz75IF12RHvhQ/cDccxGYE3Wh8WhtJ9n5z19SwY8Bp4plXZnejvG5/D+WN/AoESpvNk89JxBi4LWdgYHz9q9XQsKdJYsyGWgS+nBEQlvrpqFxC9+Kplrbw27IkooXwoTMAls3xHLEMb+MnhF87/bBQ2vnvKREoFJ/vfj04H07Qobt0SEm7PuAhGUyTdiVNVEi3M/eUosMUyudZTUlp3SLy9Ephz9v3SKNCrHHhyoBiy8ERVMTLAe3CIR2DAF6AeNvk0qbb8HqR4YzWDoN7FI0v4pbl5i8l4mUkgsJrDHRq95yhGaXOjCllsMLHcHHqSiMX50ViggVtMXzd8PWUcyMwZRh6ETs0OnOyRXIVElnJVuUpU8SuCL8a0uUXV2a3SYJcL90dqBc/xP3Emq17KqyMYzUZERdcL4xZGyUXhBVEKB0r1XfpVIzFyu6hNbfn55y8iL0Lo8klqNlJ+PLyLDo/2smAeQVvILelvaFAzmWu/d7wnfb+t0TPAgnU1j5g5kNZNYZH8puufodtshwkLGZtgHqCtJo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3004a1f0-1aad-4ac2-cae8-08de543251ec
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 12:33:43.3399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTbIoZ4aBrJFwhDX6htbTOK0YH6T8jqv0aUJqwNbMlVo/MBDuq0eYvQKbG4GZ8LYU1KGlIWxAuXjiNcE9IrjRe2fVHHXUY3UkYF+UKRpTdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4801
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601150093
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA5MyBTYWx0ZWRfX5CG00fggakSO
 7fqawI95PXbvXYUuGqRnyyKgpzm5UnGCT79+yp9bEdVF5Zxh+Ig7/eJHCC33jnxtI3YlSnjfep7
 XW9xG3SVEiBO2j4uylpTXU8Azrlj3bRL19qk1KQsKO+OtDCjIV6a3D1vJSOsCBtu7vqZz8J4V9q
 VUVag5NREu26A8E4J8GjgykGuFlEsGW49MGpLhQbv1vQwRHpTPxOYnx4l3JrCk0x14l24I8JIa/
 7igxKkR3IMQvFvQAitz2FZSvn9vHsX4KDBgb0OBnLfHTdaFu/wagRwa70nCZUF/YWjymYYIEkKj
 GpsRqM1BaIWop+ZzVU2xSFTMd6+ZjxwTgQ2u8U1ldDCrBhVqZm2iNl84qzvPwM89uWfYuzCQgSR
 V7oj5+foZx3VS3m6achyi/srhige/szvhgzxN40BlSCuL8B6HSM2ZuEi3aerC4eE/EybirgXidt
 HLQHtk/Qs2aq8NJ5Xiji1jBs7U072FqNYIZTyPqk=
X-Proofpoint-GUID: noDIkNUBDA58vlQWq9BTBJpSap4_aQQU
X-Authority-Analysis: v=2.4 cv=aZtsXBot c=1 sm=1 tr=0 ts=6968deac b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=RkSXhLthngpksvzXFfEA:9 a=CjuIK1q_8ugA:10
 cc=ntf awl=host:12110
X-Proofpoint-ORIG-GUID: noDIkNUBDA58vlQWq9BTBJpSap4_aQQU
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 10:20:06AM +0100, David Hildenbrand (Red Hat) wrote:
> Looks like all we are missing for proper kerneldoc is another "*".

Ah nice and easy :) If only it were so easy across the kernel... ;)

>
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/balloon_compaction.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
> index f6e0582bd7ffe..f41e4a179a431 100644
> --- a/mm/balloon_compaction.c
> +++ b/mm/balloon_compaction.c
> @@ -22,7 +22,7 @@ static inline struct balloon_dev_info *balloon_page_device(struct page *page)
>  	return (struct balloon_dev_info *)page_private(page);
>  }
>
> -/*
> +/**
>   * balloon_page_insert - insert a page into the balloon's page list and make
>   *			 the page->private assignment accordingly.
>   * @balloon : pointer to balloon device
> @@ -42,7 +42,7 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
>  	list_add(&page->lru, &balloon->pages);
>  }
>
> -/*
> +/**
>   * balloon_page_finalize - prepare a balloon page that was removed from the
>   *			   balloon list for release to the page allocator
>   * @page: page to be released to the page allocator
> @@ -140,7 +140,7 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
>  }
>  EXPORT_SYMBOL_GPL(balloon_page_list_dequeue);
>
> -/*
> +/**
>   * balloon_page_alloc - allocates a new page for insertion into the balloon
>   *			page list.
>   *
> @@ -163,7 +163,7 @@ struct page *balloon_page_alloc(void)
>  }
>  EXPORT_SYMBOL_GPL(balloon_page_alloc);
>
> -/*
> +/**
>   * balloon_page_enqueue - inserts a new page into the balloon page list.
>   *
>   * @b_dev_info: balloon device descriptor where we will insert a new page
> @@ -186,7 +186,7 @@ void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
>  }
>  EXPORT_SYMBOL_GPL(balloon_page_enqueue);
>
> -/*
> +/**
>   * balloon_page_dequeue - removes a page from balloon's page list and returns
>   *			  its address to allow the driver to release the page.
>   * @b_dev_info: balloon device descriptor where we will grab a page from.
> --
> 2.52.0
>

