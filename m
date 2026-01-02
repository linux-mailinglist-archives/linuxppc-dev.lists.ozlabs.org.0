Return-Path: <linuxppc-dev+bounces-15122-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E777ACEDAAF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 07:05:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djCpT03sWz2xrC;
	Fri, 02 Jan 2026 17:05:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767333904;
	cv=pass; b=fLAyl17kh0Mv2SeeUYGHn07rnC6Ds8rOvECz58fP+QmdEr5jJW3mW6d6xfVwQl/aFb5T6iww1+rkbW73LQTogvPzA6mSDLlmoHMth46usf9H0Tarx1ibVeBcKIin10JuECjZ2ClnQy2IEkej+JK/Onb5SZvltenBNMzDMNyKWBGGR5O6kEq+O569p0MpOYOLfaoM7BGpg+NhWE13atdkjCxhouh3HUorAOEl1A5akpxpn0gtsy4rPUNJGrj3pG2Jf1G65efFXJSMekw/pt3CNl1UVbtLlTkT9seCGrSxsCC5bh7Oaiqe5gMC5akDuSI7YohsUVF4fcQPuLwyHtIXNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767333904; c=relaxed/relaxed;
	bh=wpCntIwC216D1cOXEPcC9gWIGbjKMfHggZ58+44mX/M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fjoHjv3XzwT1nEEhaNKLRqRKtkidQI7cvQ267n+48k9bDucHd6Vz1H0dtiizR16eZRl/9AqtDs97C/TBVFZ1SEA6stVPKh7BudTygMyLPwXbEiqnol86+tgjiX37klXSc+JOr1ku1thcANyPaqBl7koAq5S49ugdyI6OjvbWXTKZBnXTQFPgkIPprjda4Gw1tyHkweN88/6hOSUX/owLswq5g0EZ/j03RMpOmJ3Avu+KhR+57XdtyUhSDrbHO48dPvFsr4qfaWvfInK5X54hOqOkTOPFvlUaYVWrCB/+mDoK/FOO9f8sre2i3/LQO9PaHEYU3LVIYux+iJSpKXhHbA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=B23XYzBj; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=OucXu0vc; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=alok.a.tiwari@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=B23XYzBj;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=OucXu0vc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=alok.a.tiwari@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 674 seconds by postgrey-1.37 at boromir; Fri, 02 Jan 2026 17:05:02 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djCpQ1k31z2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 17:05:01 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6023jsrH2209801;
	Fri, 2 Jan 2026 05:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=wpCntIwC216D1cOXEPcC9gWIGbjKMfHggZ58+44mX/M=; b=
	B23XYzBjP6PxKFTyu0BY0Kj6p3yq0EncAozVjiGcuRmhg/rgkC/c9L+Vt5ev3Qiv
	iqCD3XuEHQ15Y+oU730ktYtphsghxwCgtBy6j6VB0wC1gppVFlmjr4MoZb0Ucxhy
	9bbCHyhsnHIaEONvdJ3WpBj3Xg/jzq8sq+28D5p0pDTs0SWNo8xNC8YYhFfaq+on
	/Bf4UXEXTTxHf+syKzaojqXGrJmyoZCXrkYW3yaUINweRfZdAqRHH5SejEUOrmC9
	8E65wR53D++xS5qRqhwYKChvmCgs037cG48ujgmtBJycT+4BUH20pQEniT1s3+Ct
	4+80GsRdDvdksc8Fy6wl4A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ba5va4rhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 Jan 2026 05:53:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6025KOWa024458;
	Fri, 2 Jan 2026 05:53:31 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012019.outbound.protection.outlook.com [40.107.209.19])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ba5wm45nk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 Jan 2026 05:53:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Le9Qf026Vp9MZgqYYcEkCJZTAwuE9USSx8qNlfDYI9i0zagVXqCFQCb3rtP/7rkWrGl/QVOgGw4zL0bxR0vbJLLgci5F+3gMaI2f0lGNIPbCioTbsFZFr/4A2M2sjQZNJZxsuONehYjc9E+JZVoSIqXYrHkB42a70DHMDSTWvERi8NZ9sQQIdIuCYICttVJBz9MBcYfWJScYMbdXcIOE0WYGicNnpp4zpoHfOiUs1eAZkeG2dAi0KN68W1UDhgzWX6xPItD6voOW1+0gui3sQ/yy38cHzhFT3u4jx6r78wdb3JPlvJuAp6AJjFJg8igtsd5fHdSGq9S1d+754NB63g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpCntIwC216D1cOXEPcC9gWIGbjKMfHggZ58+44mX/M=;
 b=BdAT6WydQ3IIB8amDm0eDnMiKuVYswpEx6VV5ZpA0k2jbVNgR5Pml0BiuDi2hyLDgxR7JdmwwAee/bA4npeZ4IpCDk/croOPlTvRVUXMxuvP3kfNvReCPbeMtSLJS0QjHqNN0LYPpMoTdrUDVM+ujblPK15V+5Z49gtX4gj4rR1LxhC7yJ9nrGv91TyD2OAQ1+qC2TDqUTXj1M93KbV/Bt9cxG3FxK8Of0eBpyxrFpENjWjCVmY91pA9H25EV6SpTA2Tk6fKejdGLv7K4zA9sqjHSbKOx1t4PQ4vflM+JYL1qxiNJd1ibK9ytttXgd/y7HibJO7Ka4Hlg4I364Du0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpCntIwC216D1cOXEPcC9gWIGbjKMfHggZ58+44mX/M=;
 b=OucXu0vcQVqcbYnFlaOqKZ20bgm0C5qXxs6kaC7kpzZVU87sGel2NU/qNN1t6ocHwvrKb80wiadRRNk00OUmihyvmhrDBCq0jEi6F2kBJzG9E+W0chXbK9bckHz7B0RWc/5110iUvnXuRfKPzcVH/Ar9Avyy9Vs5XLgApwEdPbw=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by DS4PPF80E5E852F.namprd10.prod.outlook.com (2603:10b6:f:fc00::d2e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 05:53:06 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%6]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 05:53:06 +0000
Message-ID: <eaf4e333-a369-443c-9afc-98721c3a1c7f@oracle.com>
Date: Fri, 2 Jan 2026 11:23:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [next-20251219]powerpc/pSeries: NULL deref in __dev_xmit_skb()
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, riteshh@linux.ibm.com
References: <efde8090-bb33-4fdf-aa8a-38eef4ce8446@linux.ibm.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <efde8090-bb33-4fdf-aa8a-38eef4ce8446@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::10) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
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
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|DS4PPF80E5E852F:EE_
X-MS-Office365-Filtering-Correlation-Id: bb5cc183-fd3b-44f6-30ad-08de49c33389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHNuS1krcVhEdFFyb1ptc0pyYVNDdnlyMk1GN1VZV1ZrU3BnTFRDLzRsS0VG?=
 =?utf-8?B?SVpGQWtadmMxZUQwMk5hbStaY3YrQittMjRtczVvK0hBOTA4NjdFUGRCTWdB?=
 =?utf-8?B?bThaNk9ySWlzV0phVWZtV00xMThmUlhSdSszdDV6RG82ZHozU2ZBZlpjTnlE?=
 =?utf-8?B?RHc1S3ExU3B5WFlibjRtUGxwaWRYcEhCY2RCZ2tnT2l5bXVRV3IrbTY5cHhJ?=
 =?utf-8?B?Q1NVT3hwNVdzdGV1MVBFdmdqU2dNaFdTaGtQakNZcFJHTjMrNWRVZjF1U1VG?=
 =?utf-8?B?WkJvWUZOME9MM05UODVnQS9nbFNJS0RvNVM1blpRRklmZWl4c2ptQVUwYkZX?=
 =?utf-8?B?TEFuc0RQeUtVUTFrNDNXNUpBUFA5N3pKKzBOZWtQMk5DcWFudDl2VXlhWXhh?=
 =?utf-8?B?RGNTYlZpWllOMWFMWVB3WlBkdDZ5QS9LRU5nME90VjBuZXpvd25iYWszenhU?=
 =?utf-8?B?TStlMjJQT2JENG9HN0N3QnJjb2lKZ0VTaEpRbXZBKzY0VWV5Y3l1czBYTlVa?=
 =?utf-8?B?RFV6eEpMbU5lYk9OYktzQWNpNGUxVkRXeXo0TzJuY2VuUnc3ZklBWXZXb0pj?=
 =?utf-8?B?b0hVSTdtSUE2MzJsamF5NERZbUxZNDhNM2NFMnFENGVJazd0aTE3bVkydFdX?=
 =?utf-8?B?NFlvT3BkcXZ6Q2hEMFV4d0ZHazJtaTBPUGhrTEQ5NlZ5U0NlMzRGL0FvN1Bz?=
 =?utf-8?B?blVGL1k2M2JsdHFZM1NmZnVNL2Y3N1ZHSHpWdTBNZGJtc09ja0QyTHp6M2ZN?=
 =?utf-8?B?UjFHcWxzY2pROFVNVmRmc0pqY3ZuelY4WXlHeVBDQURWNG5JUFZKVnZHbDVX?=
 =?utf-8?B?TUdlWm5zay9sNmZiMGJuMXFQSE4zY042aW9XSm1pOGV2YklmOTdkdXdhRS9U?=
 =?utf-8?B?WnowczJ3TmtUSFNBbVFWcVNXZEpRRjY0WmFjRzBsaGQ4NUx2TDBSVDZodWRr?=
 =?utf-8?B?WWljVUZ4UVJhc1M4RFBvMm9sQ251RzhhL2x2M2h4bWtNcVpIN2dGa1UvV1ln?=
 =?utf-8?B?RXNhcXJmRHBERVE5aGY3VUtobjN3T3dpNGdWZFloc2RBN21RMFowOWIrSzg1?=
 =?utf-8?B?bWZYbnZ5QmVxWU5LQ0s2Sm80b1BrOXZuaGpwVGhNM1pINzNFZWVmcEFjQ0pW?=
 =?utf-8?B?QnBRKzJYdmtaNHUvS1k2aFhibkpOcVN2YlFveG56Mnh6c0JLWmx1MlhodklO?=
 =?utf-8?B?ZS9wUUdwNlN5aXllUks3SVNOK2pBVktoRVQrcXNYWGlRK3BMcTZyUFNIN0dQ?=
 =?utf-8?B?Y0V4QzR6QlltQVpZMW1PbW5XcHhlbDlqWVJEenZLaFUyYUE2SWJZWUE0T3pD?=
 =?utf-8?B?OGpubUdTZ2Z6bXlyYXIzdVBOY2RSbFlnckJySUFEQzJnWS9aL3ViWmxvN1gy?=
 =?utf-8?B?WmprdzZhQmk4R21vb1BDKzBjVDNUZVEvc0xwN3JVcm1haCtZQm8rLy9MOVND?=
 =?utf-8?B?VzVHMnhxV094UHRaSFZTUCtiQUtobTdEbmhIdHlmR0VkOE8xL0k3bGpINGRa?=
 =?utf-8?B?ekhSTTUrK2FobWVLOE9Sc2FmYSt5WDdaUldrbWpKQlpOV1F4dWh2ZWxYYWpq?=
 =?utf-8?B?ZG5hblFkVTdLZGg1Z05BQkljK1MxNXI0TklzVE1GcEd1amtUdXNLN0U2cVZ4?=
 =?utf-8?B?TGZRSlBWZHJwK1Y4QklCNFZQbUxkeU1XWHdBQkFBbzUrSmFsSFZwSHhhcC9w?=
 =?utf-8?B?NHA4Z05MQytUME5JUVdqaHl6NnhENVdHN08yTEJhOCtSNDEySzVDK05PMmNS?=
 =?utf-8?B?V0NaaDQvTTNXV21MekpzTm53MWVaUXBrOFJDL1FraURwcjdnMEx0T09UVS9m?=
 =?utf-8?B?bDdkU090VXhaS2c1aHpISXRxUDFac0I3NVI3eGp2UWRwU2VoMTJxNk1WUDBI?=
 =?utf-8?B?aHdQa091K25GZWNrMlJzSEl2bU9RbXZuZzN0L0RoZkFiaTYxSG1UQkozOTd1?=
 =?utf-8?B?QXVHekxlS0JzSGZiZWdkYjJ1T2dHUStiOEFmeGQ5MldHYlZNL3BFVGUwOGZw?=
 =?utf-8?B?OElLYkliWXRnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVcraHVXaWYrV080VUJNWDV6OEw0YUJNVkZVSlg0bFhtaFhYcUdUWE44TWs4?=
 =?utf-8?B?cXkvdWx3K0g4UnovU1dqWklkR1E5NlMvWjh0Zm9RSHRXL3A5YkIwWm9sZDZN?=
 =?utf-8?B?TEZFdmtnL2xGN2N3VHBoQ01UMzFWUEZiNGVFbjZSLzh5YnprekxlU1lIaDBG?=
 =?utf-8?B?RlBBT2NZdlNRSitnWEkwMmlETzJhUmR1S2tiemd4a2VqYk55M3NCT09mMzJO?=
 =?utf-8?B?WWI3ZnozRWdsQXBIb2ZxY05FNkpXZ0VlSHJaajVnVXFPeFp4V3NpYitrYXds?=
 =?utf-8?B?dkU0U1V3UTBHdGNmNXF2UTZvTTNWVjFlOVBEU0J6dlhwVjllc09YL1ZFK24x?=
 =?utf-8?B?bkovQjFiWHVzRk5FbWRWK2VNdmkySm9wbXRKaWo3U01hSGZZTUtJazVsbFBw?=
 =?utf-8?B?WkVMTVhUKy9HTWVYSzE1UHR1by94TTNSV3UzaVRlcm9TaDlFZFZGclVya0xy?=
 =?utf-8?B?UUtQYXpXUXk0cWwrVkxKRGtjTkp3REtQR2cwSlFuNUcwZDZ0aHlRdEx6V2lr?=
 =?utf-8?B?aUEyNXd2c2graGd4bEVOZTBXWlp4ZXZVTjY0SlhrUXhVNVdPY3p5RHJwbmc2?=
 =?utf-8?B?SHV2SXY3WDdtTlljN1pkM21wazczRHI0dEhIWVd4N2t1ZkFiRzByOTFYWmF3?=
 =?utf-8?B?eE5iRk9ZcTJNUUVXRE1FbWRwbndZd084UDNIWmxaWDFZQVFTUXZpS3VGMU5S?=
 =?utf-8?B?bTMrMURmL05BbEV4eEJaN0xmcVdmeTM0bXBnZ0NtREpubmx1bXlwOG11Ymtt?=
 =?utf-8?B?UTNLcElsSlFCWTFrV2NFMjVveDJoU0M5TFVkOUI5ZFdiM2s5Q0JmN3NjbnIz?=
 =?utf-8?B?RWY2eVZSSDQ5RkxtR3dvaGVVdFZBaDBjWjhScmJHSUMxL2F6WDNJTXh6WWJQ?=
 =?utf-8?B?OUNwQWZFNmZpY3NiMlBncytYeTl6cytTdWtZN05yRWpYTjlHZnZvdHdveWFX?=
 =?utf-8?B?WGtQMnRrS3Z4TU5QQmswVGcvalBHREN0eE9UYXh3NDR3c1RkMVkwaFI0cGZo?=
 =?utf-8?B?NmJGbndET0QxQytaWXBJQ3RFR1RGWUpkSmVBZHQzRkRzdjVSM0hGdUVKY1BH?=
 =?utf-8?B?RDBjOG9SWGc5U2dSV2h4cWVsK3Zjc0NNb2JSQ0VrYStvRklkWEpHemVHUUJp?=
 =?utf-8?B?a2VYS1BhNmJCWW5SQ20vZVA3Z1MzeFU1WTNSalJEUFArYTZ4TEdqSE02SHFt?=
 =?utf-8?B?TU1hOUZlY3hjZEFyM2N0NUF3UlJrSHhmeFJqeUtQczVHblQwbDBVNjNOZW9l?=
 =?utf-8?B?QzcxaVV0Y1BVeUlkeitzY0lzSzFyYWdLNTN6SzJRSmUvS2dDOEczWmpXKzV0?=
 =?utf-8?B?QTJ4dm51VVJ0RnByNGJ6eGJERnc3Sm85Z3JaZkpTdXZnMUowYTRYeFhRTnU4?=
 =?utf-8?B?QjNZOUJxbThOV3NLNHJUaHpuMm5CZ2lCN2pDTWZHTmRlVndIYlp3bzVQemxn?=
 =?utf-8?B?WVNlbXJMMVlqRUcwUHBJNU5FTlZmVE91RnhDUmJJV05Ib0Q3ckwvZVZBVDk4?=
 =?utf-8?B?Sm02SlYxK1ltNEcyYVc3THV5V0tDRXI4ODd0T2ptNGpwblk2ZXh3U3ZNK3k2?=
 =?utf-8?B?Z3FMamI1VmZka0FYSjRiVXFwNWlMb1ZuZm1VbnpqZnZrMkNjcnZzd0crWThu?=
 =?utf-8?B?UDkvZW5KNkg0ZmFYZUd6QXdxNUNnTE90d2lsbTkweWs0cUdEQTNPVDdoTER2?=
 =?utf-8?B?c1A1R0N5U3U4Y0haSTl5ZkZWOUdjM1dFQndtT2tKU05ocEVSZThJeU5vcnBP?=
 =?utf-8?B?WStQWUdXMDZHTlcxbmM3UVJsdFpyTGk5c2RBQkZyd05CV0FJc2MxUjZGSmVu?=
 =?utf-8?B?MTVkSSt0TXRTNVBXbXVNRW52dEx2SzNOcVRUc0hPMThOVDRRZ1FDRW00T0Ns?=
 =?utf-8?B?TVdRZkZCSm1NeEVEblZjSXZ4ZTlDd3ArcXRhT0VyaXdHYXcxSms3TElNRHoz?=
 =?utf-8?B?VFV4T01BU3lNVmxPc205dVdEOXl4RG8yVGpzYndYU1p5eWNrK3F3TUpCZHJN?=
 =?utf-8?B?RlZPalpmc1Y4ZFhReGlDMjJDMmZjcGRPMEROa0NRems0MmFPMUpIVlFiYjlV?=
 =?utf-8?B?ZHNuQnVCWWs5S0xLSzA2YlhYWmRjMmNpZGxLcjhQZ0s5NTFQYkdwMStKdGxU?=
 =?utf-8?B?bW1qQVlVaUhSSjVBMmVzdk4vbDZENjZ3N04ybU5jSW00akFEeUhIbWtQc0hO?=
 =?utf-8?B?UVFuOUtuUTBWT01wUU44UHFFMURSNjU4aGE0aGYxeWg3QWVDblhUR2dqbXdv?=
 =?utf-8?B?VFBFRnFWcERSUmZ4enhsTi9yN1NLbSttSFpoNDJNNGxpeFBSYmhqYVcyWXUv?=
 =?utf-8?B?cTF3Q0NDOHlUeTdUMUlFa0VZZzBUaWZvNWlOeVF6TDhvWHZlTC9IejJWc2pO?=
 =?utf-8?Q?5zvnB2LnTsUvkUmY=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AoH7Zu+i8ZjEMrQOn94SbOrUAlIETWyQki9aKmiV97F4XIRcxdxPeIF3tXDa07npapz13WnYW8IM2gSJiPWPpBVinHUV8nxsDX/9H7GNEPbG3lpqmHm57fbQkj++9m2Gjz7G3EpR/KgAFQRFqFnU+Ekz16tZo+Od4IR4m2HWoiVy2VDMJvnqLuXrWH7F9WPp8MSVpwrXM/GeI7WYkzxMeNq5a2ZLJzIEAW6fUSANH2oCc5EWkYluafQc2yHMfo66Ljs40GVv+6GA0JtDtHRPHvmKcqvrma3+ch+9sxCssRl7wMxKTpCO0RopbZX+Ek7qDgBhempEbiSJVI9JVZJ4HPpCDegOFnJY/SZeQ1uDvw5E13yC/g0p/5B+RYRaHpLB7jS0ZAFpDb3njUCd7GqQmcPOiiPEqfFT9qGna5cshx95tUc8TNuSuW4NW19LLWR6EMu1CCaKeMsLKWPhdxl29ZO4yFfR5m86pxpaseEGxnjs+JeadXPhAKRUPLvjcRu5pNcIlkoB52BdjB7I7BNTdwwokvSX+G9/6BVeXRmgNOTuMiPGxUeyjuN1U+ioq802HxgexBQtAEedzgb3iZbwo95dx7k4u1atlpEWvna/wNA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5cc183-fd3b-44f6-30ad-08de49c33389
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 05:53:06.8386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+GvncOb/imDe5lkCZwNspYkJvISNMt873+oxb4nboL/+eApzID9BfQuZLGCCLl/lHiEbjHCPKwLlUJ5xjnguFz9ozcmxt/ZG/XesrPoPL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF80E5E852F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601020053
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA1MyBTYWx0ZWRfX6YEB0puJSNOZ
 pHDJpOelbe2z47Ey0QXIP2eQlo1JGwvtV6wKfqYMgtxmN2iMZr2H8sjAx5QjWuYLpB2M9KrVKA0
 gL5JmST4vmyP7jkZjE7WkBfxK1f098NqGR5VYggGHhrjNYdJXQAsAbEQ03r723Q7yV7swstQi2I
 AVYJv4Sxfe4EG9oY4rlLyWPQ4+CeJWKD7uJ4IALa/xsZYtgulBObCYR0tUjTYV4yT395OfmPHac
 bXBDiWeUbcamvaKDpPrl5vYkv2SylQ/lkrVZG6hfFi8bt/aRH6sENA2Er8lPbXkgBeMWSOf1Xuc
 e7hJN5DtT895DZ0zOz0CgBrx/lzNbPiWTYs+2+vbvJoFrXJRTmcxFVzHmSpmLYMvpjQqJF/YGx3
 5jluNR9fXiFl3iqmLZI8LydzofywYE0x9p6Aw39te3UV7ZCYjUFt8AswFhTZz6T6nJJzlX2+Ua5
 5B8hYromELVMAIbF5zeXFGdhyCJ8udCmuoh2ldjM=
X-Authority-Analysis: v=2.4 cv=NMvYOk6g c=1 sm=1 tr=0 ts=69575d5b b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=1XWaLZrsAAAA:8 a=plZmJrdneZ7xcmUkwtAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13654
X-Proofpoint-GUID: SETGxWkwHiN66m--o8kAsQLDa3Lp3lrW
X-Proofpoint-ORIG-GUID: SETGxWkwHiN66m--o8kAsQLDa3Lp3lrW
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 1/2/2026 9:51 AM, Venkat Rao Bagalkote wrote:
> Greetings!!!
> 
> 
> IBM CI has reported a below crash. This occurs, in the TX path while 
> sending data over TCP. e.g., cloning the linux repo or running iperf3 tool.
> 
> 
> Environment
> -----------
> - Platform: IBM,9080-HEX Power11 (architected), HV: phyp (pSeries)
> - Firmware: FW1110.01 (NH1110_069)
> - Kernel: v6.19-rc3 (Linus master)
> - Config: LE, PAGE_SIZE=64K, MMU=Radix, SMP NR_CPUS=8192, NUMA pSeries
> - Workload: sustained TCP send from sshd
> 
> 
> Traces:
> 
> 
> [ 2480.578185] BUG: Kernel NULL pointer dereference on read at 0x00000000
> [ 2480.578189] Faulting instruction address: 0xc000000000f92830
> [ 2480.578192] Oops: Kernel access of bad area, sig: 11 [#1]
> [ 2480.578195] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=8192 NUMA pSeries
> [ 2480.578200] Modules linked in: nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 
> nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct 
> nft_chain_nat nf_nat nf_conntrack bonding nf_defrag_ipv6 nf_defrag_ipv4 
> tls rfkill ip_set nf_tables nfnetlink kmem device_dax pseries_rng 
> vmx_crypto dax_pmem fuse ext4 crc16 mbcache jbd2 sd_mod nd_pmem sg 
> papr_scm libnvdimm ibmvscsi ibmveth scsi_transport_srp pseries_wdt
> [ 2480.578234] CPU: 31 UID: 0 PID: 1895 Comm: sshd Kdump: loaded Not 
> tainted 6.19.0-rc1-next-20251219 #1 VOLUNTARY
> [ 2480.578239] Hardware name: IBM,9080-HEX Power11 (architected) 
> 0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
> [ 2480.578243] NIP:  c000000000f92830 LR: c000000000f92830 CTR: 
> c00000000002852c
> [ 2480.578246] REGS: c000000071d3f0c0 TRAP: 0300   Not tainted (6.19.0- 
> rc1-next-20251219)


This looks like the same NULL pointer dereference in __dev_xmit_skb() 
fixed in v6.19-rc4 
(https://lore.kernel.org/all/20251230143959.325961-1-pabeni@redhat.com/).

https://lore.kernel.org/all/20251218081844.809008-1-edumazet@google.com/

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=c04de0c79534


Thanks,
Alok

