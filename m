Return-Path: <linuxppc-dev+bounces-15359-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECFECFC7A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 08:59:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmL6R1VBKz2yFh;
	Wed, 07 Jan 2026 18:59:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.194.3 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767772783;
	cv=pass; b=hvNmjh3nkxGWdbJrtvMTRMHPId/veV7QIFh0+MQ415Ef8m7tMLQeVY6g6grAjVNN0zkPUpgx229VBVK1DU+TBSoBBkA2fUoLi1tyns+bApGSMvM1xMyFTPAr47jWAEOXUV9AyL/ako+o1Pl9ccNcqDgGzxr6WqcVyFVdlzEhMO/kf0o6vyL0bKFxL2ITz9cFvd7aRYR2vrK4NTs2E6T1EEp/+XecfsjUZ2MelP7OxMFM6FsTvRA80ETACBfHeZ8B9UgTrvMm54topn1XerATIW3cMc+/fZvA4TNWBs2C/051VjIGpJUs9AvwaB1+JYJ/ADzDjxqwM5VmpHysVojO4w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767772783; c=relaxed/relaxed;
	bh=rUns9yes0y1Vf83wFC7MTxIUANaL6fCzl8j2ic22uqI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FmlXiHX/+8kcm1pFFLbazduGI0kyAJZc9i1EXGipZ+4uvpmAFQUDto2CUZTgQBEm+dCAUuG1bqXVC8+RMkS7uODjz/YY6AYKGykc7l+gJr9Elx1TnLB44mJWjSuipdXIOZWE2Ypb1H4Chu2oY+Mgf9d43HecUQTsfE7DPkXMxGGazmxReT6uHraNQzFmApxfLhOThF9dOYWNmbYFDAA3fjLbcpNyttqCucQgSjladr9LOlE8Odk/QZ+6u2h0r2vx1rARO6U0f8vE/s3bcY3+It2/1DXk+M50qjoUa5gnuEwpfsVs7PoLDZGVC1mMdcp5AsaqEcPcZktNVn0URZr4NA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Vbh3HQ+N; dkim-atps=neutral; spf=pass (client-ip=40.93.194.3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Vbh3HQ+N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.93.194.3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011003.outbound.protection.outlook.com [40.93.194.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmL6N5Ttnz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 18:59:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qSUISYKMk+HAsOYIVycruI64r6lFsfTGV3xOnDBb7tGwndW1j+5oO5auEJjBMTqONOgLEIMBWZvgKAO8nMqRNafUaxZ3A4UlFHnXu5gQH1WbrXvjXMAHwqynVHQERvaJgqpApWPMtfuJc7l1jV+7rVSrRI3NWJgDyihFC3a5JngFTfIzwps2gn6zR0Xp9CU3DXDrQ4AIRvvXN+HrfWAmc+DROiy3vvjVE3CPcnCHdmlnFrhp1GxEQtGrXPA6DE0GrtXXeCTYbrIhnVsREp6A21TOuJN1ZILiwow+irbSwbQQv2TuH9OWkeFYM3s1K4Z7syRnXLD1fq+dMWf+CzoE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUns9yes0y1Vf83wFC7MTxIUANaL6fCzl8j2ic22uqI=;
 b=lIiEHKIZ3mZt8MvcTnsjVgD3yUuGzCh2GETIwtpmv4+bsYGu3rbMsqq/Nl0OBX98E+XJKwdgiSBOk4qHokw86jpvnzeBe7G9x5VSbXFODhOs8tJinG9HZ6HLM0FLpCLgYGsjpQMq+lycdYUvinbW8xa65sCI+8m6EE7+Yvh0EvJ6753Pc6HEscnp/8jF5vxtHIq+QEfSyDJyZYfwTu6qI+IcuHhtkWAnVqWY3fpygDvbFvOj05ZH3wCXq8jJcG8p+3JwykrW/8a2tb1E7ziUazxNr3NSPtoFUXxeMu5Pizby04I/IizIzLb9PXdyQRMD+Z2NPUa1x/zGkubH1YYaJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUns9yes0y1Vf83wFC7MTxIUANaL6fCzl8j2ic22uqI=;
 b=Vbh3HQ+NJasz0vSpib05SpHIIZTLn7vW9dkqLBjDEVBoeKzQpDTD9PpGEj7iyuj8UQkckk7r1Jd/mUm9C/M5DLQL/U78iQGMWhTIchS/6TwU2GMOAmn5nnDq7oiiQHJE/tbfy1qCeAPct0Yzg1VVywqGRpOS5742rCtqqTJNaEdRes1plkZgodSpUa3ZwB29ZQwf1Y48yffLXds1yvetBMR8szgqY0hL8WHvNHU6yaPStoA1ev0yBtzW4sTKQnWLx94+t7NkrYd6UKCnp2Upq1hosUTgvKVUl2ZtxBx0fZcebd1u9zEBvS8G0A3HhEOY1mtMe3FJbV4Q8fW5jjAYcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 CY5PR12MB6250.namprd12.prod.outlook.com (2603:10b6:930:22::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.2; Wed, 7 Jan 2026 07:58:51 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 07:58:51 +0000
Message-ID: <5d1a7cc6-cf60-4978-a8a8-ec673f6cfd48@nvidia.com>
Date: Wed, 7 Jan 2026 18:58:42 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/8] mm: Remove device private pages from the physical
 address space
To: Rohan Mclure <rmclure@nvidia.com>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>
Cc: Balbir Singh <balbirs@nvidia.com>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "david@redhat.com" <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
 "lyude@redhat.com" <lyude@redhat.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "mpenttil@redhat.com" <mpenttil@redhat.com>, Jason Gunthorpe
 <jgg@nvidia.com>, "willy@infradead.org" <willy@infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "jgg@ziepe.ca" <jgg@ziepe.ca>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>
References: <20251231043154.42931-1-jniethe@nvidia.com>
 <20251231043154.42931-9-jniethe@nvidia.com>
 <a0315573-a979-4ece-a55a-acd80cce83f3@nvidia.com>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <a0315573-a979-4ece-a55a-acd80cce83f3@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|CY5PR12MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bc19827-d7c7-40c2-989a-08de4dc2988d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1Mwd0pMOWN4NzV1ZHQ0SmlwVTM2M3lOYXVBd0xqb3MvaVFONzRiSkRqM3U5?=
 =?utf-8?B?b25ZRld2bnNJTDJnb2tGQWlkWkU3RlRVbzJTZm4zS2VSN3FiM2E4ek5CZ3RJ?=
 =?utf-8?B?dTU4aWQ5WVBRSkVKNXJBQlpHNGIyUjZsQVVjTlBqWTczSU5iM2Mra0VES291?=
 =?utf-8?B?eXNpOTQ2QURsMWh0aWdGTGdHUEY3SE1ETitmWUVMNjhCemxUUDBQS3ZBdUUx?=
 =?utf-8?B?UC8rT2dBYTZFYzA2c2ZxZENYUTdwZkZreTMyNXFldUZSUlYxWStmQ3RwNTVL?=
 =?utf-8?B?NVVCOVA4NmFuWC9pZk8xcVFKZGJBQzBIUVJ1Mkc1RUZpb1VHOFNwcFluZGZ0?=
 =?utf-8?B?cnVvV25jaWNHSFREY3FybUpIT2JZQXlVUUVvRm9qUnNaNk5jUUE4OHU2RnFQ?=
 =?utf-8?B?eUxib1IzaXZHLzBrZUV0Nk8zbUpVTHJrRktIblVJM1BCSVU4SFdQUVdVcEtQ?=
 =?utf-8?B?UkhpZDNmQXZjdG1HbXh2NVY4N0RwRWh1emJXUlRWYXZidGVabkN0aFVOd3hm?=
 =?utf-8?B?dGNlSkNkMXRBdERUNm54RmZ2MzVvajRCV1FqVEUrcXorNnFkMUlsSGZXZ1ZM?=
 =?utf-8?B?ZndzNlVjSDVGVk53cTloMFhEZklvbmpBMmVpZDZjbEdCT1dNRWpkRzNXTHIr?=
 =?utf-8?B?SEpNMDB3SkFHMUhLcE1QZ3U4YUl0ZWozS2VMbmZZQTRsN2pjMTg1ODVKeUp3?=
 =?utf-8?B?WDl5NDZSMmVXbFc0cG0zUHQxeFNPY2hDRWVUc1Y4a3NFTENIeStSbEZlenhM?=
 =?utf-8?B?SlE4azI0L3hJcGpkQkUwUm42Zy9kTUx3RFJqYU4xQkorMGNEQ0pBcERjNUhq?=
 =?utf-8?B?b3puRFNUTUtuQndUcXdoSHJQNFh5UmRialA2citpOVNmdUVzd1Q1WEREb0dB?=
 =?utf-8?B?dE1WNGg0RU1JRUJsaGJ4MFl3WEVyMWlaTmxIOFZrM3dCK2ROcDRmVHFWOVJL?=
 =?utf-8?B?enk5WnY3aDlZQTVmVDg5Z2MyaTNadmRqamVZcTZLTWhabzh1VXNwbjF3YVhC?=
 =?utf-8?B?K2s5TFFhREt6a3diRU5maktZK2s2ZWhTbG5jeWJCTGdacjJ0NTY0QVRwaERQ?=
 =?utf-8?B?R1NsQ1pXMHVHR2hNbFpRWTV5RlpoZll6OHMxVDdxcTFZM3pkVTRQVUFIQXY4?=
 =?utf-8?B?UjVBRnFWazhHRXMrM0FQeEp1bHBZWXlyWTVNUUQ0OFFGVStKaEtwVENIeWcx?=
 =?utf-8?B?QmtjT0lkVHlBY0o4eXQxT0FyeklCWWpKYkFsb3Z3dHloMlhGcmhzUG5aellW?=
 =?utf-8?B?b3dFKzFGQmJzYmYzdVRHZklndmd4eS9CYXFjR1l3OUNFUnI3by96TENTaDFW?=
 =?utf-8?B?RGtMUUdhcG9qdzJKSFFsZ3FOMkRlRUJMd2tUcUNleUhuN2JiZUpCakZMRCtO?=
 =?utf-8?B?UXpWNFBVck4xR2NzUk01VUxyUXF6clZBQ2J0cmp4L0tjUmNXWTBPT3hvQUFK?=
 =?utf-8?B?STZUb0k3UitnYkM2VjhpYWU2T09GY0lkRW5idkdNY2NFbklGUTVFRXdqcnhT?=
 =?utf-8?B?Y0N2emRacUdwZE42K1JXODF5NlBXUFdEdmdvSVVHTElJOGpFaUI0Z0l5YlVU?=
 =?utf-8?B?RVM1SEtzZS9GK1cxWHl1Y2g1T21BMlVLRXJzVmloZncxcFFuK05DalU3Sllt?=
 =?utf-8?B?dkcyRm5CbVpicWNTOUV1OWZ0MkJIdkJnM2pYY1U3UW9KTXpUcHFmakFoczdQ?=
 =?utf-8?B?Q3VlQXZzbzlWQUJrZ09ncDNlcURhZHI4dkdUSTRTbkJKLzI0UTNqNnRMTDF4?=
 =?utf-8?B?OUlEUStIQnAxN29Gcmtta01PTmhleUpqUHZlK1NpcVVaZ0lCNlhSNmZiSzhU?=
 =?utf-8?B?ay84WVYvRkpoQ294dmNNRHlsUjNBRkliaHB1QWUreGR5TVlQQmY1MVRVckN6?=
 =?utf-8?B?QW5iSU1jc01Ra0pnajVvVmlFa0VRWEZFSGw1RzVMYjdKQWx3RkptSFBKMXgw?=
 =?utf-8?Q?TDP5Stsc27mJy7QCgZ1vdgNaO0dzQWXM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXJEUUdmK3pEb1h1elltNzFTYVR0cWNVeEc1K3E3TFlkLzhBcGlEMmo4NzZJ?=
 =?utf-8?B?bkk1eVRUd3NDYjhScU9XanNJWHZDK1JoMzBpNlBiWWU3ZncxR1M1TTNDdFh6?=
 =?utf-8?B?T25VSm1nZ3VjN3c0aG9UZUxpa3hRczdUY01WNnJhNE1sT2QyWmFZRHZFSXIw?=
 =?utf-8?B?L1g3dlZsYVRIeUZBN25mbWZOQnBUaDFOYUorZlhTd0NEYk05a0xHWks3UHha?=
 =?utf-8?B?RUNuTDhMZlEvNjFBVWpaZ3pRR3RrZERDK3liajNXUUgyRk8wQmJMdGtUeUF0?=
 =?utf-8?B?WjdGQTkxWnVYRUNzY3NENFc2TVZZMXZzeldqVTd3U1ZTMFdESWE4WW1oVEFs?=
 =?utf-8?B?T0tKMHFJNngrTHI1VFVhbWRMbmFqZlJSOGppSGg0NFNzd0NxTUkvdk9UOFJz?=
 =?utf-8?B?NlZCUFRsZzBWZEsxL0xPOExaWm5Qc3g1R2ZkeS8xNngzNGlTemlqRGRTL3hE?=
 =?utf-8?B?RlZDRW1vRFlUNXdFS2hjd0pJcDJ5a3Mva0JyNmVEb0kzSnpIVjh6VU8vdFlh?=
 =?utf-8?B?YmVDejErS0RBcFYwb3Z3TDFvaFBVU3FVSnA2VUJjVVhuTFJVTDBRaEtqUWxN?=
 =?utf-8?B?SmU0OHkrTDRFWVB0eitLNnR4d2xjQTJJMVowODU2MG1pNzVwa1ZmK0hVd1Zl?=
 =?utf-8?B?NkdROUFOOWErcHNXNFlYamo2UUE0dkxqMEJaNXA5TUhtN2dMaVFCR3kxRmJM?=
 =?utf-8?B?ZGZRell2VmVDNy8vTVBudkFWdUkxdXlwcXlIaGdCTWlHajhPd04zZUVDYlUx?=
 =?utf-8?B?MXVpNVlITFB4WkFDeGJPTkhIS0tVUzNyNkRDSzNMSTA1Umw3cDZ4dkQ1dUk4?=
 =?utf-8?B?TERTL2cvSVFSMjQvdk80QWlIOTlIaW9POUtZY29qbWMyUzJPRmZiUkcrYkpU?=
 =?utf-8?B?bkp1alBoSlArY0xWTWRRemV0Yk5MTG5RaEU1bTNtbEN5THN1d1Y3ci9ZN09m?=
 =?utf-8?B?UXA1RkZUY212UDduZk5MbzRXSWdiSklpREVtRkVjQ3hCTTFxUVgyLzJEd3o0?=
 =?utf-8?B?dlN1cXoybDM1WS9XUnRsVEovSlNwK3l1UnFTR3RFd01aZmxmb00vV09saHpJ?=
 =?utf-8?B?QjBZNWVPWnJOcFNUUW5GRlFHMStwdy82Y2d6SU5lTlkreDNBNlNmbzBWUGwy?=
 =?utf-8?B?blk2UVZOM0NPYmN0RHBSM0FwQ1lNOVZIczJqWCsxNk5zYVlPMXVYa094L2d3?=
 =?utf-8?B?OGk4cXZEQUlwT1FSS09iSVV6RStqRnQra1FPNzdJeERFM1l1d3Rmcnk4UVRJ?=
 =?utf-8?B?ZE1VeVFvb1l1NFlkR2ZPMjc3YXhwUFdWZ0NHb3FLVXVSMkY3Y3ZMSC9tTFI1?=
 =?utf-8?B?VDhqMFJGM2xRcXhKVFhhZzU3b2dLaFpyMnl6SU5jS2RXeUV4c2JuUU51Z2g0?=
 =?utf-8?B?WXQ2N0psMWtNZjl4MXRFb25iYkFsQzRMRjBKTENUN1RSTTcrZ2FxeThycFFV?=
 =?utf-8?B?ZG5ETDdqSlZuM09Wc1RqL2ZwSjlDRG1FczNRS20rSk0vMzdDRi9QUk1ockJ2?=
 =?utf-8?B?V0tKQU9ocW55SWpTZW5lTFVxcDVHK2lBQkkxb1hHbkt4TUhWWWpJTTJQcFBk?=
 =?utf-8?B?TW1BMUtZQUozL2dSZ3BXSTlKODFpZGF2UmJFTmVZVW1sd0RvVERJVEVMb3VW?=
 =?utf-8?B?VUg3UkRRaUtjMi9UWGpqbHdMR0M1UzhLTFhQdzNFbCs4V1BmQVZhbjhmUjhI?=
 =?utf-8?B?TzEyMHFQbjVnUll1SjZlcDlnRzdvdmlWWE5pZkpJTXUyQWRqbnJZeU5OSXpj?=
 =?utf-8?B?TXBGV0xGZFNETWdTckdzd1d2S0lwb0pSMjBMejh1QURTczdXNThyNE4xS2dY?=
 =?utf-8?B?T0prK0JZVE83aks2QVJNMzB1VXJBaENVbmpNT3ZOSUk0UTRPbldqbGZpMW5l?=
 =?utf-8?B?alBvYWFmYUZPS0cyNXlJQkMrYXVRR2M3bENwM3FvNUhBSUpyaElIaG9ueHdV?=
 =?utf-8?B?SVRQN1RkUHhXbndwQk5oZXFmMEQyUk9JcGx4ODhyS1JwOHlTRlcvTXpTK001?=
 =?utf-8?B?cktTNnJReWFyejNyVy93dTl3aElPa0dESzV0SWdTUVFzVlJGNWVsTERYUnJu?=
 =?utf-8?B?bENWaWU2R1dBYUprQnRDaTZpNklVQ0JZRUR3VTg4REpRa250UDBONldSQnFD?=
 =?utf-8?B?dmV3OVBzRjJwOTVtSW0zbG1Ta1pUMTFOWjZrdmRvSUY4N2xzcEt1TmJMYTNu?=
 =?utf-8?B?VTFFOExNejRFRmVJSnpNdytYODdVMytuL0tDTURCc0pqK014YmVZNzB5bGY2?=
 =?utf-8?B?R0VFc081Ri9WSlVxQU00RUtoTjVOWWxHdmlWMGdrN1JGNGxDdCsrY0J5M1hS?=
 =?utf-8?B?cXREUlpucDVRQmJDRkViRWhQODRneFNOZ216akU1VEJxWjcxK2x5dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc19827-d7c7-40c2-989a-08de4dc2988d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 07:58:51.4709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: felqKpWIvG4xYgoMIpocNjm+J4mnOxMunsHgwtb9jU+hvo8YR/7k6ouofE1tItFlr9d8P14M3jdE7X7eIWbhrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6250
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 7/1/26 11:42, Rohan Mclure wrote:
> On 12/31/25 3:31 PM, Jordan Niethe wrote:
>> Currently when creating these device private struct pages, the first
>> step is to use request_free_mem_region() to get a range of physical
>> address space large enough to represent the devices memory. This
>> allocated physical address range is then remapped as device private
>> memory using memremap_pages().
>>
>> Needing allocation of physical address space has some problems:
>>
>>     1) There may be insufficient physical address space to represent the
>>        device memory. KASLR reducing the physical address space and VM
>>        configurations with limited physical address space increase the
>>        likelihood of hitting this especially as device memory increases. This
>>        has been observed to prevent device private from being initialized.
>>
>>     2) Attempting to add the device private pages to the linear map at
>>        addresses beyond the actual physical memory causes issues on
>>        architectures like aarch64 meaning the feature does not work there.
>>
>> Instead of using the physical address space, introduce a device private
>> address space and allocate devices regions from there to represent the
>> device private pages.
>>
>> Introduce a new interface memremap_device_private_pagemap() that
>> allocates a requested amount of device private address space and creates
>> the necessary device private pages.
>>
>> To support this new interface, struct dev_pagemap needs some changes:
>>
>>     - Add a new dev_pagemap::nr_pages field as an input parameter.
>>     - Add a new dev_pagemap::pages array to store the device
>>       private pages.
>>
>> When using memremap_device_private_pagemap(), rather then passing in
>> dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space to
>> be remapped, dev_pagemap::nr_ranges will always be 1, and the device
>> private range that is reserved is returned in dev_pagemap::range.
>>
>> Forbid calling memremap_pages() with dev_pagemap::ranges::type =
>> MEMORY_DEVICE_PRIVATE.
>>
>> Represent this device private address space using a new
>> device_private_pgmap_tree maple tree. This tree maps a given device
>> private address to a struct dev_pagemap, where a specific device private
>> page may then be looked up in that dev_pagemap::pages array.
>>
>> Device private address space can be reclaimed and the assoicated device
>> private pages freed using the corresponding new
>> memunmap_device_private_pagemap() interface.
>>
>> Because the device private pages now live outside the physical address
>> space, they no longer have a normal PFN. This means that page_to_pfn(),
>> et al. are no longer meaningful.
>>
>> Introduce helpers:
>>
>>     - device_private_page_to_offset()
>>     - device_private_folio_to_offset()
>>
>> to take a given device private page / folio and return its offset within
>> the device private address space.
>>
>> Update the places where we previously converted a device private page to
>> a PFN to use these new helpers. When we encounter a device private
>> offset, instead of looking up its page within the pagemap use
>> device_private_offset_to_page() instead.
>>
>> Update the existing users:
>>
>>    - lib/test_hmm.c
>>    - ppc ultravisor
>>    - drm/amd/amdkfd
>>    - gpu/drm/xe
>>    - gpu/drm/nouveau
>>
>> to use the new memremap_device_private_pagemap() interface.
>>
>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>
>> ---
>>
>> NOTE: The updates to the existing drivers have only been compile tested.
>> I'll need some help in testing these drivers.
>>
>> v1:
>> - Include NUMA node paramater for memremap_device_private_pagemap()
>> - Add devm_memremap_device_private_pagemap() and friends
>> - Update existing users of memremap_pages():
>>       - ppc ultravisor
>>       - drm/amd/amdkfd
>>       - gpu/drm/xe
>>       - gpu/drm/nouveau
>> - Update for HMM huge page support
>> - Guard device_private_offset_to_page and friends with CONFIG_ZONE_DEVICE
>> ---
>>    Documentation/mm/hmm.rst                 |  11 +-
>>    arch/powerpc/kvm/book3s_hv_uvmem.c       |  43 ++---
>>    drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  29 ++--
>>    drivers/gpu/drm/drm_pagemap.c            |   2 +-
>>    drivers/gpu/drm/nouveau/nouveau_dmem.c   |  37 ++---
>>    drivers/gpu/drm/xe/xe_svm.c              |  28 +---
>>    include/linux/hmm.h                      |   3 +
>>    include/linux/leafops.h                  |  16 +-
>>    include/linux/memremap.h                 |  64 +++++++-
>>    include/linux/migrate.h                  |   4 +
>>    include/linux/mm.h                       |   2 +
>>    include/linux/rmap.h                     |   5 +-
>>    include/linux/swapops.h                  |  13 +-
>>    lib/test_hmm.c                           |  73 +++++----
>>    mm/debug.c                               |   9 +-
>>    mm/memremap.c                            | 193 ++++++++++++++++++-----
>>    mm/migrate_device.c                      |  12 +-
>>    mm/mm_init.c                             |   8 +-
>>    mm/page_vma_mapped.c                     |  13 ++
>>    mm/rmap.c                                |  43 +++--
>>    mm/util.c                                |   5 +-
>>    21 files changed, 406 insertions(+), 207 deletions(-)
>>
>> diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
>> index 7d61b7a8b65b..27067a6a2408 100644
>> --- a/Documentation/mm/hmm.rst
>> +++ b/Documentation/mm/hmm.rst
>> @@ -276,17 +276,12 @@ These can be allocated and freed with::
>>        struct resource *res;
>>        struct dev_pagemap pagemap;
>>    
>> -    res = request_free_mem_region(&iomem_resource, /* number of bytes */,
>> -                                  "name of driver resource");
>>        pagemap.type = MEMORY_DEVICE_PRIVATE;
>> -    pagemap.range.start = res->start;
>> -    pagemap.range.end = res->end;
>> -    pagemap.nr_range = 1;
>> +    pagemap.nr_pages = /* number of pages */;
>>        pagemap.ops = &device_devmem_ops;
>> -    memremap_pages(&pagemap, numa_node_id());
>> +    memremap_device_private_pagemap(&pagemap, numa_node_id());
>>    
>> -    memunmap_pages(&pagemap);
>> -    release_mem_region(pagemap.range.start, range_len(&pagemap.range));
>> +    memunmap_device_private_pagemap(&pagemap);
>>    
>>    There are also devm_request_free_mem_region(), devm_memremap_pages(),
>>    devm_memunmap_pages(), and devm_release_mem_region() when the resources can
>> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> index dac5d6454920..d4201536155c 100644
>> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
>> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> @@ -636,7 +636,7 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *slot,
>>    		mutex_lock(&kvm->arch.uvmem_lock);
>>    
>>    		if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
>> -			uvmem_page = pfn_to_page(uvmem_pfn);
>> +			uvmem_page = device_private_offset_to_page(uvmem_pfn);
>>    			pvt = uvmem_page->zone_device_data;
>>    			pvt->skip_page_out = skip_page_out;
>>    			pvt->remove_gfn = true;
>> @@ -721,7 +721,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>>    	pvt->gpa = gpa;
>>    	pvt->kvm = kvm;
>>    
>> -	dpage = pfn_to_page(uvmem_pfn);
>> +	dpage = device_private_offset_to_page(uvmem_pfn);
>>    	dpage->zone_device_data = pvt;
>>    	zone_device_page_init(dpage, 0);
>>    	return dpage;
>> @@ -784,7 +784,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
>>    		}
>>    	}
>>    
>> -	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE;
>> +	*mig.dst = migrate_pfn(device_private_page_to_offset(dpage)) | MIGRATE_PFN_DEVICE;
>>    	migrate_vma_pages(&mig);
>>    out_finalize:
>>    	migrate_vma_finalize(&mig);
>> @@ -888,7 +888,7 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
>>    	srcu_idx = srcu_read_lock(&kvm->srcu);
>>    	mutex_lock(&kvm->arch.uvmem_lock);
>>    	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
>> -		uvmem_page = pfn_to_page(uvmem_pfn);
>> +		uvmem_page = device_private_offset_to_page(uvmem_pfn);
>>    		pvt = uvmem_page->zone_device_data;
>>    		pvt->skip_page_out = true;
>>    		/*
>> @@ -906,7 +906,7 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
>>    
>>    	mutex_lock(&kvm->arch.uvmem_lock);
>>    	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
>> -		uvmem_page = pfn_to_page(uvmem_pfn);
>> +		uvmem_page = device_private_offset_to_page(uvmem_pfn);
>>    		pvt = uvmem_page->zone_device_data;
>>    		pvt->skip_page_out = true;
>>    		pvt->remove_gfn = false; /* it continues to be a valid GFN */
>> @@ -1017,7 +1017,7 @@ static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
>>    static void kvmppc_uvmem_folio_free(struct folio *folio)
>>    {
>>    	struct page *page = &folio->page;
>> -	unsigned long pfn = page_to_pfn(page) -
>> +	unsigned long pfn = device_private_page_to_offset(page) -
>>    			(kvmppc_uvmem_pgmap.range.start >> PAGE_SHIFT);
>>    	struct kvmppc_uvmem_page_pvt *pvt;
>>    
>> @@ -1159,8 +1159,6 @@ int kvmppc_uvmem_init(void)
>>    {
>>    	int ret = 0;
>>    	unsigned long size;
>> -	struct resource *res;
>> -	void *addr;
>>    	unsigned long pfn_last, pfn_first;
>>    
>>    	size = kvmppc_get_secmem_size();
>> @@ -1174,27 +1172,18 @@ int kvmppc_uvmem_init(void)
>>    		goto out;
>>    	}
>>    
>> -	res = request_free_mem_region(&iomem_resource, size, "kvmppc_uvmem");
>> -	if (IS_ERR(res)) {
>> -		ret = PTR_ERR(res);
>> -		goto out;
>> -	}
>> -
>>    	kvmppc_uvmem_pgmap.type = MEMORY_DEVICE_PRIVATE;
>> -	kvmppc_uvmem_pgmap.range.start = res->start;
>> -	kvmppc_uvmem_pgmap.range.end = res->end;
>>    	kvmppc_uvmem_pgmap.nr_range = 1;
>> +	kvmppc_uvmem_pgmap.nr_pages = size / PAGE_SIZE;
>>    	kvmppc_uvmem_pgmap.ops = &kvmppc_uvmem_ops;
>>    	/* just one global instance: */
>>    	kvmppc_uvmem_pgmap.owner = &kvmppc_uvmem_pgmap;
>> -	addr = memremap_pages(&kvmppc_uvmem_pgmap, NUMA_NO_NODE);
>> -	if (IS_ERR(addr)) {
>> -		ret = PTR_ERR(addr);
>> -		goto out_free_region;
>> -	}
>> +	ret = memremap_device_private_pagemap(&kvmppc_uvmem_pgmap, NUMA_NO_NODE);
>> +	if (ret)
>> +		goto out;
>>    
>> -	pfn_first = res->start >> PAGE_SHIFT;
>> -	pfn_last = pfn_first + (resource_size(res) >> PAGE_SHIFT);
>> +	pfn_first = kvmppc_uvmem_pgmap.range.start >> PAGE_SHIFT;
>> +	pfn_last = pfn_first + (range_len(&kvmppc_uvmem_pgmap.range) >> PAGE_SHIFT);
>>    	kvmppc_uvmem_bitmap = bitmap_zalloc(pfn_last - pfn_first, GFP_KERNEL);
>>    	if (!kvmppc_uvmem_bitmap) {
>>    		ret = -ENOMEM;
>> @@ -1204,9 +1193,7 @@ int kvmppc_uvmem_init(void)
>>    	pr_info("KVMPPC-UVMEM: Secure Memory size 0x%lx\n", size);
>>    	return ret;
>>    out_unmap:
>> -	memunmap_pages(&kvmppc_uvmem_pgmap);
>> -out_free_region:
>> -	release_mem_region(res->start, size);
>> +	memunmap_device_private_pagemap(&kvmppc_uvmem_pgmap);
>>    out:
>>    	return ret;
>>    }
>> @@ -1216,8 +1203,6 @@ void kvmppc_uvmem_free(void)
>>    	if (!kvmppc_uvmem_bitmap)
>>    		return;
>>    
>> -	memunmap_pages(&kvmppc_uvmem_pgmap);
>> -	release_mem_region(kvmppc_uvmem_pgmap.range.start,
>> -			   range_len(&kvmppc_uvmem_pgmap.range));
>> +	memunmap_device_private_pagemap(&kvmppc_uvmem_pgmap);
>>    	bitmap_free(kvmppc_uvmem_bitmap);
>>    }
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> index 0257c6e7f680..be6a07e9a75c 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> @@ -214,7 +214,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
>>    {
>>    	struct page *page;
>>    
>> -	page = pfn_to_page(pfn);
>> +	page = device_private_offset_to_page(pfn);
>>    	svm_range_bo_ref(prange->svm_bo);
>>    	page->zone_device_data = prange->svm_bo;
>>    	zone_device_page_init(page, 0);
>> @@ -225,7 +225,7 @@ svm_migrate_put_vram_page(struct amdgpu_device *adev, unsigned long addr)
>>    {
>>    	struct page *page;
>>    
>> -	page = pfn_to_page(svm_migrate_addr_to_pfn(adev, addr));
>> +	page = device_private_offset_to_page(svm_migrate_addr_to_pfn(adev, addr));
>>    	unlock_page(page);
>>    	put_page(page);
>>    }
>> @@ -235,7 +235,7 @@ svm_migrate_addr(struct amdgpu_device *adev, struct page *page)
>>    {
>>    	unsigned long addr;
>>    
>> -	addr = page_to_pfn(page) << PAGE_SHIFT;
>> +	addr = device_private_page_to_offset(page) << PAGE_SHIFT;
>>    	return (addr - adev->kfd.pgmap.range.start);
>>    }
>>    
>> @@ -1021,9 +1021,9 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
>>    {
>>    	struct amdgpu_kfd_dev *kfddev = &adev->kfd;
>>    	struct dev_pagemap *pgmap;
>> -	struct resource *res = NULL;
>>    	unsigned long size;
>>    	void *r;
>> +	int ret;
>>    
>>    	/* Page migration works on gfx9 or newer */
>>    	if (amdgpu_ip_version(adev, GC_HWIP, 0) < IP_VERSION(9, 0, 1))
>> @@ -1044,11 +1044,7 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
>>    		pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
>>    		pgmap->type = MEMORY_DEVICE_COHERENT;
>>    	} else {
>> -		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
>> -		if (IS_ERR(res))
>> -			return PTR_ERR(res);
>> -		pgmap->range.start = res->start;
>> -		pgmap->range.end = res->end;
>> +		pgmap->nr_pages = size / PAGE_SIZE;
>>    		pgmap->type = MEMORY_DEVICE_PRIVATE;
>>    	}
>>    
>> @@ -1059,14 +1055,19 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
>>    	/* Device manager releases device-specific resources, memory region and
>>    	 * pgmap when driver disconnects from device.
>>    	 */
>> -	r = devm_memremap_pages(adev->dev, pgmap);
>> -	if (IS_ERR(r)) {
>> +	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
>> +		ret = devm_memremap_device_private_pagemap(adev->dev, pgmap);
>> +	} else {
>> +		r = devm_memremap_pages(adev->dev, pgmap);
>> +		if (IS_ERR(r))
>> +			ret = PTR_ERR(r);
>> +	}
>> +
>> +	if (ret) {
>>    		pr_err("failed to register HMM device memory\n");
>> -		if (pgmap->type == MEMORY_DEVICE_PRIVATE)
>> -			devm_release_mem_region(adev->dev, res->start, resource_size(res));
>>    		/* Disable SVM support capability */
>>    		pgmap->type = 0;
>> -		return PTR_ERR(r);
>> +		return ret;
>>    	}
>>    
>>    	pr_debug("reserve %ldMB system memory for VRAM pages struct\n",
>> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
>> index 0c756d73419f..c703fc318f13 100644
>> --- a/drivers/gpu/drm/drm_pagemap.c
>> +++ b/drivers/gpu/drm/drm_pagemap.c
>> @@ -401,7 +401,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>>    		goto err_finalize;
>>    
>>    	for (i = 0; i < npages; ++i) {
>> -		struct page *page = pfn_to_page(migrate.dst[i]);
>> +		struct page *page = device_private_offset_to_page(migrate.dst[i]);
>>    
>>    		pages[i] = page;
>>    		migrate.dst[i] = migrate_pfn(migrate.dst[i]) | MIGRATE_PFN_DEVICE;
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> index 2bd80c6f5bcd..297e1d8b775a 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> @@ -109,7 +109,7 @@ static struct nouveau_drm *page_to_drm(struct page *page)
>>    unsigned long nouveau_dmem_page_addr(struct page *page)
>>    {
>>    	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(page);
>> -	unsigned long off = (page_to_pfn(page) << PAGE_SHIFT) -
>> +	unsigned long off = (device_private_page_to_offset(page) << PAGE_SHIFT) -
>>    				chunk->pagemap.range.start;
>>    
>>    	return chunk->bo->offset + off;
>> @@ -297,9 +297,7 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
>>    			 bool is_large)
>>    {
>>    	struct nouveau_dmem_chunk *chunk;
>> -	struct resource *res;
>>    	struct page *page;
>> -	void *ptr;
>>    	unsigned long i, pfn_first, pfn;
>>    	int ret;
>>    
>> @@ -309,39 +307,28 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
>>    		goto out;
>>    	}
>>    
>> -	/* Allocate unused physical address space for device private pages. */
>> -	res = request_free_mem_region(&iomem_resource, DMEM_CHUNK_SIZE * NR_CHUNKS,
>> -				      "nouveau_dmem");
>> -	if (IS_ERR(res)) {
>> -		ret = PTR_ERR(res);
>> -		goto out_free;
>> -	}
>> -
>>    	chunk->drm = drm;
>>    	chunk->pagemap.type = MEMORY_DEVICE_PRIVATE;
>> -	chunk->pagemap.range.start = res->start;
>> -	chunk->pagemap.range.end = res->end;
>>    	chunk->pagemap.nr_range = 1;
>> +	chunk->pagemap.nr_pages = DMEM_CHUNK_SIZE * NR_CHUNKS / PAGE_SIZE;
>>    	chunk->pagemap.ops = &nouveau_dmem_pagemap_ops;
>>    	chunk->pagemap.owner = drm->dev;
>>    
>>    	ret = nouveau_bo_new_pin(&drm->client, NOUVEAU_GEM_DOMAIN_VRAM, DMEM_CHUNK_SIZE,
>>    				 &chunk->bo);
>>    	if (ret)
>> -		goto out_release;
>> +		goto out_free;
>>    
>> -	ptr = memremap_pages(&chunk->pagemap, numa_node_id());
>> -	if (IS_ERR(ptr)) {
>> -		ret = PTR_ERR(ptr);
>> +	ret = memremap_device_private_pagemap(&chunk->pagemap, numa_node_id());
>> +	if (ret)
>>    		goto out_bo_free;
>> -	}
>>    
>>    	mutex_lock(&drm->dmem->mutex);
>>    	list_add(&chunk->list, &drm->dmem->chunks);
>>    	mutex_unlock(&drm->dmem->mutex);
>>    
>>    	pfn_first = chunk->pagemap.range.start >> PAGE_SHIFT;
>> -	page = pfn_to_page(pfn_first);
>> +	page = device_private_offset_to_page(pfn_first);
>>    	spin_lock(&drm->dmem->lock);
>>    
>>    	pfn = pfn_first;
>> @@ -350,12 +337,12 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
>>    
>>    		if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) || !is_large) {
>>    			for (j = 0; j < DMEM_CHUNK_NPAGES - 1; j++, pfn++) {
>> -				page = pfn_to_page(pfn);
>> +				page = device_private_offset_to_page(pfn);
>>    				page->zone_device_data = drm->dmem->free_pages;
>>    				drm->dmem->free_pages = page;
>>    			}
>>    		} else {
>> -			page = pfn_to_page(pfn);
>> +			page = device_private_offset_to_page(pfn);
>>    			page->zone_device_data = drm->dmem->free_folios;
>>    			drm->dmem->free_folios = page_folio(page);
>>    			pfn += DMEM_CHUNK_NPAGES;
>> @@ -382,8 +369,6 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
>>    
>>    out_bo_free:
>>    	nouveau_bo_unpin_del(&chunk->bo);
>> -out_release:
>> -	release_mem_region(chunk->pagemap.range.start, range_len(&chunk->pagemap.range));
>>    out_free:
>>    	kfree(chunk);
>>    out:
>> @@ -541,9 +526,7 @@ nouveau_dmem_fini(struct nouveau_drm *drm)
>>    		nouveau_bo_unpin_del(&chunk->bo);
>>    		WARN_ON(chunk->callocated);
>>    		list_del(&chunk->list);
>> -		memunmap_pages(&chunk->pagemap);
>> -		release_mem_region(chunk->pagemap.range.start,
>> -				   range_len(&chunk->pagemap.range));
>> +		memunmap_device_private_pagemap(&chunk->pagemap);
>>    		kfree(chunk);
>>    	}
>>    
>> @@ -766,7 +749,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
>>    		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
>>    	if (src & MIGRATE_PFN_WRITE)
>>    		*pfn |= NVIF_VMM_PFNMAP_V0_W;
>> -	mpfn = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE;
>> +	mpfn = migrate_pfn(device_private_page_to_offset(dpage)) | MIGRATE_PFN_DEVICE;
>>    	if (folio_order(page_folio(dpage)))
>>    		mpfn |= MIGRATE_PFN_COMPOUND;
>>    	return mpfn;
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 55c5a0eb82e1..e89317d7e062 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -403,7 +403,7 @@ static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
>>    				      struct page *page)
>>    {
>>    	u64 dpa;
>> -	u64 pfn = page_to_pfn(page);
>> +	u64 pfn = device_private_page_to_offset(page);
>>    	u64 offset;
>>    
>>    	xe_assert(vr->xe, is_device_private_page(page));
>> @@ -1470,39 +1470,27 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>>    {
>>    	struct xe_device *xe = tile_to_xe(tile);
>>    	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
>> -	struct resource *res;
>> -	void *addr;
>>    	int ret;
>>    
>> -	res = devm_request_free_mem_region(dev, &iomem_resource,
>> -					   vr->usable_size);
>> -	if (IS_ERR(res)) {
>> -		ret = PTR_ERR(res);
>> -		return ret;
>> -	}
>> -
>>    	vr->pagemap.type = MEMORY_DEVICE_PRIVATE;
>> -	vr->pagemap.range.start = res->start;
>> -	vr->pagemap.range.end = res->end;
>>    	vr->pagemap.nr_range = 1;
>> +	vr->pagemap.nr_pages = vr->usable_size / PAGE_SIZE;
>>    	vr->pagemap.ops = drm_pagemap_pagemap_ops_get();
>>    	vr->pagemap.owner = xe_svm_devm_owner(xe);
>> -	addr = devm_memremap_pages(dev, &vr->pagemap);
>> +	ret = devm_memremap_device_private_pagemap(dev, &vr->pagemap);
>>    
>>    	vr->dpagemap.dev = dev;
>>    	vr->dpagemap.ops = &xe_drm_pagemap_ops;
>>    
>> -	if (IS_ERR(addr)) {
>> -		devm_release_mem_region(dev, res->start, resource_size(res));
>> -		ret = PTR_ERR(addr);
>> -		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %pe\n",
>> -			tile->id, ERR_PTR(ret));
>> +	if (ret) {
>> +		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %d\n",
>> +			tile->id, ret);
>>    		return ret;
>>    	}
>> -	vr->hpa_base = res->start;
>> +	vr->hpa_base = vr->pagemap.range.start;
>>    
>>    	drm_dbg(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
>> -		tile->id, vr->io_start, vr->io_start + vr->usable_size, res);
>> +		tile->id, vr->io_start, vr->io_start + vr->usable_size, &vr->pagemap.range);
>>    	return 0;
>>    }
>>    #else
>> diff --git a/include/linux/hmm.h b/include/linux/hmm.h
>> index d8756c341620..25bb4df298f7 100644
>> --- a/include/linux/hmm.h
>> +++ b/include/linux/hmm.h
>> @@ -68,6 +68,9 @@ enum hmm_pfn_flags {
>>     */
>>    static inline struct page *hmm_pfn_to_page(unsigned long hmm_pfn)
>>    {
>> +	if (hmm_pfn & HMM_PFN_DEVICE_PRIVATE)
>> +		return device_private_offset_to_page(hmm_pfn & ~HMM_PFN_FLAGS);
>> +
>>    	return pfn_to_page(hmm_pfn & ~HMM_PFN_FLAGS);
>>    }
>>    
>> diff --git a/include/linux/leafops.h b/include/linux/leafops.h
>> index a4a5c3ad647b..34579ec047b3 100644
>> --- a/include/linux/leafops.h
>> +++ b/include/linux/leafops.h
>> @@ -427,7 +427,13 @@ static inline unsigned long softleaf_to_pfn(softleaf_t entry)
>>     */
>>    static inline struct page *softleaf_to_page(softleaf_t entry)
>>    {
>> -	struct page *page = pfn_to_page(softleaf_to_pfn(entry));
>> +	struct page *page;
>> +
>> +	if (softleaf_is_migration_device_private(entry) ||
>> +	    softleaf_is_device_private(entry))
>> +		page = device_private_entry_to_page(entry);
>> +	else
>> +		page = pfn_to_page(softleaf_to_pfn(entry));
>>    
>>    	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
>>    	/*
>> @@ -447,7 +453,13 @@ static inline struct page *softleaf_to_page(softleaf_t entry)
>>     */
>>    static inline struct folio *softleaf_to_folio(softleaf_t entry)
>>    {
>> -	struct folio *folio = pfn_folio(softleaf_to_pfn(entry));
>> +	struct folio *folio;
>> +
>> +	if (softleaf_is_migration_device_private(entry) ||
>> +	    softleaf_is_device_private(entry))
>> +		folio = page_folio(device_private_entry_to_page(entry));
>> +	else
>> +		folio = pfn_folio(softleaf_to_pfn(entry));
>>    
>>    	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
>>    	/*
>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>> index 713ec0435b48..c0c88735baa1 100644
>> --- a/include/linux/memremap.h
>> +++ b/include/linux/memremap.h
>> @@ -37,6 +37,7 @@ struct vmem_altmap {
>>     * backing the device memory. Doing so simplifies the implementation, but it is
>>     * important to remember that there are certain points at which the struct page
>>     * must be treated as an opaque object, rather than a "normal" struct page.
>> + * Unlike "normal" struct pages, the page_to_pfn() is invalid.
>>     *
>>     * A more complete discussion of unaddressable memory may be found in
>>     * include/linux/hmm.h and Documentation/mm/hmm.rst.
>> @@ -126,9 +127,13 @@ struct dev_pagemap_ops {
>>     * @owner: an opaque pointer identifying the entity that manages this
>>     *	instance.  Used by various helpers to make sure that no
>>     *	foreign ZONE_DEVICE memory is accessed.
>> - * @nr_range: number of ranges to be mapped
>> - * @range: range to be mapped when nr_range == 1
>> + * @nr_range: number of ranges to be mapped. Always == 1 for
>> + *	MEMORY_DEVICE_PRIVATE.
>> + * @range: range to be mapped when nr_range == 1. Used as an output param for
>> + *	MEMORY_DEVICE_PRIVATE.
>>     * @ranges: array of ranges to be mapped when nr_range > 1
>> + * @nr_pages: number of pages requested to be mapped for MEMORY_DEVICE_PRIVATE.
>> + * @pages: array of nr_pages initialized for MEMORY_DEVICE_PRIVATE.
>>     */
>>    struct dev_pagemap {
>>    	struct vmem_altmap altmap;
>> @@ -144,6 +149,8 @@ struct dev_pagemap {
>>    		struct range range;
>>    		DECLARE_FLEX_ARRAY(struct range, ranges);
>>    	};
>> +	unsigned long nr_pages;
>> +	struct page *pages;
>>    };
>>    
>>    static inline bool pgmap_has_memory_failure(struct dev_pagemap *pgmap)
>> @@ -224,7 +231,14 @@ static inline bool is_fsdax_page(const struct page *page)
>>    }
>>    
>>    #ifdef CONFIG_ZONE_DEVICE
>> +void __init_zone_device_page(struct page *page, unsigned long pfn,
>> +	unsigned long zone_idx, int nid,
>> +	struct dev_pagemap *pgmap);
>>    void zone_device_page_init(struct page *page, unsigned int order);
>> +unsigned long memremap_device_private_pagemap(struct dev_pagemap *pgmap, int nid);
>> +void memunmap_device_private_pagemap(struct dev_pagemap *pgmap);
>> +int devm_memremap_device_private_pagemap(struct device *dev, struct dev_pagemap *pgmap);
>> +void devm_memunmap_device_private_pagemap(struct device *dev, struct dev_pagemap *pgmap);
>>    void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>>    void memunmap_pages(struct dev_pagemap *pgmap);
>>    void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
>> @@ -234,6 +248,15 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>>    
>>    unsigned long memremap_compat_align(void);
>>    
>> +struct page *device_private_offset_to_page(unsigned long offset);
>> +struct page *device_private_entry_to_page(softleaf_t entry);
>> +pgoff_t device_private_page_to_offset(const struct page *page);
>> +
>> +static inline pgoff_t device_private_folio_to_offset(const struct folio *folio)
>> +{
>> +	return device_private_page_to_offset((const struct page *)&folio->page);
>> +}
>> +
>>    static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
>>    {
>>    	zone_device_page_init(&folio->page, order);
>> @@ -276,6 +299,23 @@ static inline void devm_memunmap_pages(struct device *dev,
>>    {
>>    }
>>    
>> +static inline int devm_memremap_device_private_pagemap(struct device *dev,
>> +		struct dev_pagemap *pgmap)
>> +{
>> +	/*
>> +	 * Fail attempts to call devm_memremap_device_private_pagemap() without
>> +	 * ZONE_DEVICE support enabled, this requires callers to fall
>> +	 * back to plain devm_memremap() based on config
>> +	 */
>> +	WARN_ON_ONCE(1);
>> +	return -ENXIO;
>> +}
>> +
>> +static inline void devm_memunmap_device_private_pagemap(struct device *dev,
>> +		struct dev_pagemap *pgmap)
>> +{
>> +}
>> +
>>    static inline struct dev_pagemap *get_dev_pagemap(unsigned long pfn)
>>    {
>>    	return NULL;
>> @@ -296,6 +336,26 @@ static inline void zone_device_private_split_cb(struct folio *original_folio,
>>    						struct folio *new_folio)
>>    {
>>    }
>> +
>> +static inline struct page *device_private_offset_to_page(unsigned long offset)
>> +{
>> +	return NULL;
>> +}
>> +
>> +static inline struct page *device_private_entry_to_page(softleaf_t entry)
>> +{
>> +	return NULL;
>> +}
>> +
>> +static inline pgoff_t device_private_page_to_offset(const struct page *page)
>> +{
>> +	return 0;
>> +}
>> +
>> +static inline pgoff_t device_private_folio_to_offset(const struct folio *folio)
>> +{
>> +	return 0;
>> +}
>>    #endif /* CONFIG_ZONE_DEVICE */
>>    
>>    static inline void put_dev_pagemap(struct dev_pagemap *pgmap)
>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>> index 52f65cd5c932..e6c4ff61a8fb 100644
>> --- a/include/linux/migrate.h
>> +++ b/include/linux/migrate.h
>> @@ -133,6 +133,10 @@ static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
>>    {
>>    	if (!(mpfn & MIGRATE_PFN_VALID))
>>    		return NULL;
>> +
>> +	if (mpfn & MIGRATE_PFN_DEVICE)
>> +		return device_private_offset_to_page(mpfn >> MIGRATE_PFN_SHIFT);
>> +
>>    	return pfn_to_page(mpfn >> MIGRATE_PFN_SHIFT);
>>    }
>>    
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index e65329e1969f..b36599ab41ba 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -2038,6 +2038,8 @@ static inline unsigned long memdesc_section(memdesc_flags_t mdf)
>>     */
>>    static inline unsigned long folio_pfn(const struct folio *folio)
>>    {
>> +	VM_BUG_ON(folio_is_device_private(folio));
>> +
>>    	return page_to_pfn(&folio->page);
>>    }
>>    
>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>> index 57c63b6a8f65..c1561a92864f 100644
>> --- a/include/linux/rmap.h
>> +++ b/include/linux/rmap.h
>> @@ -951,7 +951,7 @@ static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
>>    static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
>>    {
>>    	if (folio_is_device_private(folio))
>> -		return page_vma_walk_pfn(folio_pfn(folio)) |
>> +		return page_vma_walk_pfn(device_private_folio_to_offset(folio)) |
>>    		       PVMW_PFN_DEVICE_PRIVATE;
>>    
>>    	return page_vma_walk_pfn(folio_pfn(folio));
>> @@ -959,6 +959,9 @@ static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
>>    
>>    static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
>>    {
>> +	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
>> +		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>> +
>>    	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>>    }
>>    
>> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
>> index ddf2763d69e9..9d6de68a823b 100644
>> --- a/include/linux/swapops.h
>> +++ b/include/linux/swapops.h
>> @@ -140,7 +140,7 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
>>    
>>    static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page)
>>    {
>> -	return swp_entry(SWP_DEVICE_READ, page_to_pfn(page));
>> +	return swp_entry(SWP_DEVICE_READ, device_private_page_to_offset(page));
>>    }
>>    
>>    static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
>> @@ -150,7 +150,7 @@ static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
>>    
>>    static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page)
>>    {
>> -	return swp_entry(SWP_DEVICE_WRITE, page_to_pfn(page));
>> +	return swp_entry(SWP_DEVICE_WRITE, device_private_page_to_offset(page));
>>    }
>>    
>>    static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
>> @@ -263,7 +263,8 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
>>    static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page)
>>    {
>>    	if (is_device_private_page(page))
>> -		return make_readable_migration_device_private_entry(page_to_pfn(page));
>> +		return make_readable_migration_device_private_entry(
>> +				device_private_page_to_offset(page));
>>    
>>    	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page));
>>    }
>> @@ -276,7 +277,8 @@ static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset
>>    static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page)
>>    {
>>    	if (is_device_private_page(page))
>> -		return make_readable_exclusive_migration_device_private_entry(page_to_pfn(page));
>> +		return make_readable_exclusive_migration_device_private_entry(
>> +				device_private_page_to_offset(page));
>>    
>>    	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page));
>>    }
>> @@ -289,7 +291,8 @@ static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
>>    static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page)
>>    {
>>    	if (is_device_private_page(page))
>> -		return make_writable_migration_device_private_entry(page_to_pfn(page));
>> +		return make_writable_migration_device_private_entry(
>> +				device_private_page_to_offset(page));
>>    
>>    	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page));
>>    }
>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>> index 19681904a666..ac6649c7d7f7 100644
>> --- a/lib/test_hmm.c
>> +++ b/lib/test_hmm.c
>> @@ -497,7 +497,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
>>    				  struct page **ppage, bool is_large)
>>    {
>>    	struct dmirror_chunk *devmem;
>> -	struct resource *res = NULL;
>> +	bool device_private = false;
>>    	unsigned long pfn;
>>    	unsigned long pfn_first;
>>    	unsigned long pfn_last;
>> @@ -510,13 +510,9 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
>>    
>>    	switch (mdevice->zone_device_type) {
>>    	case HMM_DMIRROR_MEMORY_DEVICE_PRIVATE:
>> -		res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
>> -					      "hmm_dmirror");
>> -		if (IS_ERR_OR_NULL(res))
>> -			goto err_devmem;
>> -		devmem->pagemap.range.start = res->start;
>> -		devmem->pagemap.range.end = res->end;
>> +		device_private = true;
>>    		devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
>> +		devmem->pagemap.nr_pages = DEVMEM_CHUNK_SIZE / PAGE_SIZE;
>>    		break;
>>    	case HMM_DMIRROR_MEMORY_DEVICE_COHERENT:
>>    		devmem->pagemap.range.start = (MINOR(mdevice->cdevice.dev) - 2) ?
>> @@ -525,13 +521,13 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
>>    		devmem->pagemap.range.end = devmem->pagemap.range.start +
>>    					    DEVMEM_CHUNK_SIZE - 1;
>>    		devmem->pagemap.type = MEMORY_DEVICE_COHERENT;
>> +		devmem->pagemap.nr_range = 1;
>>    		break;
>>    	default:
>>    		ret = -EINVAL;
>>    		goto err_devmem;
>>    	}
>>    
>> -	devmem->pagemap.nr_range = 1;
>>    	devmem->pagemap.ops = &dmirror_devmem_ops;
>>    	devmem->pagemap.owner = mdevice;
>>    
>> @@ -551,13 +547,20 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
>>    		mdevice->devmem_capacity = new_capacity;
>>    		mdevice->devmem_chunks = new_chunks;
>>    	}
>> -	ptr = memremap_pages(&devmem->pagemap, numa_node_id());
>> -	if (IS_ERR_OR_NULL(ptr)) {
>> -		if (ptr)
>> -			ret = PTR_ERR(ptr);
>> -		else
>> -			ret = -EFAULT;
>> -		goto err_release;
>> +
>> +	if (device_private) {
>> +		ret = memremap_device_private_pagemap(&devmem->pagemap, numa_node_id());
>> +		if (ret)
>> +			goto err_release;
>> +	} else {
>> +		ptr = memremap_pages(&devmem->pagemap, numa_node_id());
>> +		if (IS_ERR_OR_NULL(ptr)) {
>> +			if (ptr)
>> +				ret = PTR_ERR(ptr);
>> +			else
>> +				ret = -EFAULT;
>> +			goto err_release;
>> +		}
>>    	}
>>    
>>    	devmem->mdevice = mdevice;
>> @@ -567,15 +570,21 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
>>    
>>    	mutex_unlock(&mdevice->devmem_lock);
>>    
>> -	pr_info("added new %u MB chunk (total %u chunks, %u MB) PFNs [0x%lx 0x%lx)\n",
>> +	pr_info("added new %u MB chunk (total %u chunks, %u MB) %sPFNs [0x%lx 0x%lx)\n",
>>    		DEVMEM_CHUNK_SIZE / (1024 * 1024),
>>    		mdevice->devmem_count,
>>    		mdevice->devmem_count * (DEVMEM_CHUNK_SIZE / (1024 * 1024)),
>> +		device_private ? "device " : "",
>>    		pfn_first, pfn_last);
>>    
>>    	spin_lock(&mdevice->lock);
>>    	for (pfn = pfn_first; pfn < pfn_last; ) {
>> -		struct page *page = pfn_to_page(pfn);
>> +		struct page *page;
>> +
>> +		if (device_private)
>> +			page = device_private_offset_to_page(pfn);
>> +		else
>> +			page = pfn_to_page(pfn);
>>    
>>    		if (is_large && IS_ALIGNED(pfn, HPAGE_PMD_NR)
>>    			&& (pfn + HPAGE_PMD_NR <= pfn_last)) {
>> @@ -616,9 +625,6 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
>>    
>>    err_release:
>>    	mutex_unlock(&mdevice->devmem_lock);
>> -	if (res && devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
>> -		release_mem_region(devmem->pagemap.range.start,
>> -				   range_len(&devmem->pagemap.range));
>>    err_devmem:
>>    	kfree(devmem);
>>    
>> @@ -696,8 +702,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>>    		 */
>>    		spage = migrate_pfn_to_page(*src);
>>    		if (WARN(spage && is_zone_device_page(spage),
>> -		     "page already in device spage pfn: 0x%lx\n",
>> -		     page_to_pfn(spage)))
>> +		     "page already in device spage dev pfn: 0x%lx\n",
>> +		     device_private_page_to_offset(spage)))
>>    			goto next;
>>    
>>    		if (dmirror->flags & HMM_DMIRROR_FLAG_FAIL_ALLOC) {
>> @@ -727,7 +733,9 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>>    				rpage = BACKING_PAGE(dpage);
>>    				rpage->zone_device_data = dmirror;
>>    
>> -				*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE | write;
>> +				*dst = migrate_pfn(device_private_page_to_offset(dpage)) |
>> +				       MIGRATE_PFN_DEVICE |
>> +				       write;
>>    				src_page = pfn_to_page(spfn + i);
>>    
>>    				if (spage)
>> @@ -752,9 +760,10 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>>    		rpage->zone_device_data = dmirror;
>>    
>>    		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
>> -			 page_to_pfn(spage), page_to_pfn(dpage));
>> +			 page_to_pfn(spage),
>> +			 device_private_page_to_offset(dpage));
>>    
>> -		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE | write;
>> +		*dst = migrate_pfn(device_private_page_to_offset(dpage)) | MIGRATE_PFN_DEVICE | write;
>>    
>>    		if (is_large) {
>>    			int i;
>> @@ -1457,10 +1466,10 @@ static void dmirror_device_remove_chunks(struct dmirror_device *mdevice)
>>    			spin_unlock(&mdevice->lock);
>>    
>>    			dmirror_device_evict_chunk(devmem);
>> -			memunmap_pages(&devmem->pagemap);
>>    			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
>> -				release_mem_region(devmem->pagemap.range.start,
>> -						   range_len(&devmem->pagemap.range));
>> +				memunmap_device_private_pagemap(&devmem->pagemap);
>> +			else
>> +				memunmap_pages(&devmem->pagemap);
>>    			kfree(devmem);
>>    		}
>>    		mdevice->devmem_count = 0;
>> @@ -1705,7 +1714,12 @@ static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
>>    		return;
>>    	}
>>    
>> -	offset = folio_pfn(tail) - folio_pfn(head);
>> +	tail->pgmap = head->pgmap;
>> +
>> +	if (folio_is_device_private(head))
>> +		offset = device_private_folio_to_offset(tail) - device_private_folio_to_offset(head);
>> +	else
>> +		offset = folio_pfn(tail) - folio_pfn(head);
>>    
>>    	rpage_tail = folio_page(rfolio, offset);
>>    	tail->page.zone_device_data = rpage_tail;
>> @@ -1714,7 +1728,6 @@ static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
>>    	rpage_tail->mapping = NULL;
>>    
>>    	folio_page(tail, 0)->mapping = folio_page(head, 0)->mapping;
>> -	tail->pgmap = head->pgmap;
>>    	folio_set_count(page_folio(rpage_tail), 1);
>>    }
>>    
>> diff --git a/mm/debug.c b/mm/debug.c
>> index 77fa8fe1d641..04fcc62d440f 100644
>> --- a/mm/debug.c
>> +++ b/mm/debug.c
>> @@ -77,9 +77,11 @@ static void __dump_folio(const struct folio *folio, const struct page *page,
>>    	if (page_mapcount_is_type(mapcount))
>>    		mapcount = 0;
>>    
>> -	pr_warn("page: refcount:%d mapcount:%d mapping:%p index:%#lx pfn:%#lx\n",
>> +	pr_warn("page: refcount:%d mapcount:%d mapping:%p index:%#lx %spfn:%#lx\n",
>>    			folio_ref_count(folio), mapcount, mapping,
>> -			folio->index + idx, pfn);
>> +			folio->index + idx,
>> +			folio_is_device_private(folio) ? "device " : "",
>> +			pfn);
>>    	if (folio_test_large(folio)) {
>>    		int pincount = 0;
>>    
>> @@ -113,7 +115,8 @@ static void __dump_folio(const struct folio *folio, const struct page *page,
>>    	 * inaccuracy here due to racing.
>>    	 */
>>    	pr_warn("%sflags: %pGp%s\n", type, &folio->flags,
>> -		is_migrate_cma_folio(folio, pfn) ? " CMA" : "");
>> +		(!folio_is_device_private(folio) &&
>> +		 is_migrate_cma_folio(folio, pfn)) ? " CMA" : "");
>>    	if (page_has_type(&folio->page))
>>    		pr_warn("page_type: %x(%s)\n", folio->page.page_type >> 24,
>>    				page_type_name(folio->page.page_type));
>> diff --git a/mm/memremap.c b/mm/memremap.c
>> index 4c2e0d68eb27..f0fe92c3227a 100644
>> --- a/mm/memremap.c
>> +++ b/mm/memremap.c
>> @@ -12,9 +12,12 @@
>>    #include <linux/types.h>
>>    #include <linux/wait_bit.h>
>>    #include <linux/xarray.h>
>> +#include <linux/maple_tree.h>
>>    #include "internal.h"
>>    
>>    static DEFINE_XARRAY(pgmap_array);
>> +static struct maple_tree device_private_pgmap_tree =
>> +	MTREE_INIT(device_private_pgmap_tree, MT_FLAGS_ALLOC_RANGE);
>>    
>>    /*
>>     * The memremap() and memremap_pages() interfaces are alternately used
>> @@ -113,9 +116,10 @@ void memunmap_pages(struct dev_pagemap *pgmap)
>>    {
>>    	int i;
>>    
>> +	WARN_ONCE(pgmap->type == MEMORY_DEVICE_PRIVATE, "Type should not be MEMORY_DEVICE_PRIVATE\n");
>> +
>>    	percpu_ref_kill(&pgmap->ref);
>> -	if (pgmap->type != MEMORY_DEVICE_PRIVATE &&
>> -	    pgmap->type != MEMORY_DEVICE_COHERENT)
>> +	if (pgmap->type != MEMORY_DEVICE_COHERENT)
>>    		for (i = 0; i < pgmap->nr_range; i++)
>>    			percpu_ref_put_many(&pgmap->ref, pfn_len(pgmap, i));
>>    
>> @@ -144,7 +148,6 @@ static void dev_pagemap_percpu_release(struct percpu_ref *ref)
>>    static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
>>    		int range_id, int nid)
>>    {
>> -	const bool is_private = pgmap->type == MEMORY_DEVICE_PRIVATE;
>>    	struct range *range = &pgmap->ranges[range_id];
>>    	struct dev_pagemap *conflict_pgmap;
>>    	int error, is_ram;
>> @@ -190,7 +193,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
>>    	if (error)
>>    		goto err_pfn_remap;
>>    
>> -	if (!mhp_range_allowed(range->start, range_len(range), !is_private)) {
>> +	if (!mhp_range_allowed(range->start, range_len(range), true)) {
>>    		error = -EINVAL;
>>    		goto err_kasan;
>>    	}
>> @@ -198,30 +201,19 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
>>    	mem_hotplug_begin();
>>    
>>    	/*
>> -	 * For device private memory we call add_pages() as we only need to
>> -	 * allocate and initialize struct page for the device memory. More-
>> -	 * over the device memory is un-accessible thus we do not want to
>> -	 * create a linear mapping for the memory like arch_add_memory()
>> -	 * would do.
>> -	 *
>> -	 * For all other device memory types, which are accessible by
>> -	 * the CPU, we do want the linear mapping and thus use
>> +	 * All device memory types except device private memory are accessible
>> +	 * by the CPU, so we want the linear mapping and thus use
>>    	 * arch_add_memory().
>>    	 */
>> -	if (is_private) {
>> -		error = add_pages(nid, PHYS_PFN(range->start),
>> -				PHYS_PFN(range_len(range)), params);
>> -	} else {
>> -		error = kasan_add_zero_shadow(__va(range->start), range_len(range));
>> -		if (error) {
>> -			mem_hotplug_done();
>> -			goto err_kasan;
>> -		}
>> -
>> -		error = arch_add_memory(nid, range->start, range_len(range),
>> -					params);
>> +	error = kasan_add_zero_shadow(__va(range->start), range_len(range));
>> +	if (error) {
>> +		mem_hotplug_done();
>> +		goto err_kasan;
>>    	}
>>    
>> +	error = arch_add_memory(nid, range->start, range_len(range),
>> +				params);
>> +
>>    	if (!error) {
>>    		struct zone *zone;
>>    
>> @@ -248,8 +240,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
>>    	return 0;
>>    
>>    err_add_memory:
>> -	if (!is_private)
>> -		kasan_remove_zero_shadow(__va(range->start), range_len(range));
>> +	kasan_remove_zero_shadow(__va(range->start), range_len(range));
>>    err_kasan:
>>    	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
>>    err_pfn_remap:
>> @@ -281,22 +272,8 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>>    
>>    	switch (pgmap->type) {
>>    	case MEMORY_DEVICE_PRIVATE:
>> -		if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
>> -			WARN(1, "Device private memory not supported\n");
>> -			return ERR_PTR(-EINVAL);
>> -		}
>> -		if (!pgmap->ops || !pgmap->ops->migrate_to_ram) {
>> -			WARN(1, "Missing migrate_to_ram method\n");
>> -			return ERR_PTR(-EINVAL);
>> -		}
>> -		if (!pgmap->ops->folio_free) {
>> -			WARN(1, "Missing folio_free method\n");
>> -			return ERR_PTR(-EINVAL);
>> -		}
>> -		if (!pgmap->owner) {
>> -			WARN(1, "Missing owner\n");
>> -			return ERR_PTR(-EINVAL);
>> -		}
>> +		WARN(1, "Use memremap_device_private_pagemap()\n");
>> +		return ERR_PTR(-EINVAL);
>>    		break;
>>    	case MEMORY_DEVICE_COHERENT:
>>    		if (!pgmap->ops->folio_free) {
>> @@ -394,6 +371,31 @@ void devm_memunmap_pages(struct device *dev, struct dev_pagemap *pgmap)
>>    }
>>    EXPORT_SYMBOL_GPL(devm_memunmap_pages);
>>    
>> +static void devm_memremap_device_private_pagemap_release(void *data)
>> +{
>> +	memunmap_device_private_pagemap(data);
>> +}
>> +
>> +int devm_memremap_device_private_pagemap(struct device *dev, struct dev_pagemap *pgmap)
>> +{
>> +	int ret;
>> +
>> +	ret = memremap_device_private_pagemap(pgmap, dev_to_node(dev));
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = devm_add_action_or_reset(dev, devm_memremap_device_private_pagemap_release,
>> +			pgmap);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(devm_memremap_device_private_pagemap);
>> +
>> +void devm_memunmap_device_private_pagemap(struct device *dev, struct dev_pagemap *pgmap)
>> +{
>> +	devm_release_action(dev, devm_memremap_device_private_pagemap_release, pgmap);
>> +}
>> +EXPORT_SYMBOL_GPL(devm_memunmap_device_private_pagemap);
>> +
>>    /**
>>     * get_dev_pagemap() - take a new live reference on the dev_pagemap for @pfn
>>     * @pfn: page frame number to lookup page_map
>> @@ -495,3 +497,110 @@ void zone_device_page_init(struct page *page, unsigned int order)
>>    		prep_compound_page(page, order);
>>    }
>>    EXPORT_SYMBOL_GPL(zone_device_page_init);
>> +
>> +unsigned long memremap_device_private_pagemap(struct dev_pagemap *pgmap, int nid)
>> +{
>> +	unsigned long dpfn, dpfn_first, dpfn_last = 0;
>> +	unsigned long start;
>> +	int rc;
>> +
>> +	if (pgmap->type != MEMORY_DEVICE_PRIVATE) {
>> +		WARN(1, "Not device private memory\n");
>> +		return -EINVAL;
>> +	}
>> +	if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
>> +		WARN(1, "Device private memory not supported\n");
>> +		return -EINVAL;
>> +	}
>> +	if (!pgmap->ops || !pgmap->ops->migrate_to_ram) {
>> +		WARN(1, "Missing migrate_to_ram method\n");
>> +		return -EINVAL;
>> +	}
>> +	if (!pgmap->owner) {
>> +		WARN(1, "Missing owner\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	pgmap->pages = kvzalloc(sizeof(struct page) * pgmap->nr_pages,
>> +			       GFP_KERNEL);
>> +	if (!pgmap->pages)
>> +		return -ENOMEM;
>> +
>> +	rc = mtree_alloc_range(&device_private_pgmap_tree, &start, pgmap,
>> +			       pgmap->nr_pages * PAGE_SIZE, 0,
>> +			       1ull << MAX_PHYSMEM_BITS, GFP_KERNEL);
>> +	if (rc < 0)
>> +		goto err_mtree_alloc;
>> +
>> +	pgmap->range.start = start;
>> +	pgmap->range.end = pgmap->range.start + (pgmap->nr_pages * PAGE_SIZE) - 1;
>> +	pgmap->nr_range = 1;
>> +
>> +	init_completion(&pgmap->done);
>> +	rc = percpu_ref_init(&pgmap->ref, dev_pagemap_percpu_release, 0,
>> +		GFP_KERNEL);
>> +	if (rc < 0)
>> +		goto err_ref_init;
>> +
>> +	dpfn_first = pgmap->range.start >> PAGE_SHIFT;
>> +	dpfn_last = dpfn_first + (range_len(&pgmap->range) >> PAGE_SHIFT);
>> +	for (dpfn = dpfn_first; dpfn < dpfn_last; dpfn++) {
>> +		struct page *page = device_private_offset_to_page(dpfn);
>> +
>> +		__init_zone_device_page(page, dpfn, ZONE_DEVICE, nid, pgmap);
>> +		page_folio(page)->pgmap = (void *) pgmap;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_ref_init:
>> +	mtree_erase(&device_private_pgmap_tree, pgmap->range.start);
>> +err_mtree_alloc:
>> +	kvfree(pgmap->pages);
>> +	return rc;
>> +}
>> +EXPORT_SYMBOL_GPL(memremap_device_private_pagemap);
>> +
>> +void memunmap_device_private_pagemap(struct dev_pagemap *pgmap)
>> +{
>> +	percpu_ref_kill(&pgmap->ref);
>> +	wait_for_completion(&pgmap->done);
>> +	percpu_ref_exit(&pgmap->ref);
>> +	kvfree(pgmap->pages);
>> +	mtree_erase(&device_private_pgmap_tree, pgmap->range.start);
>> +}
>> +EXPORT_SYMBOL_GPL(memunmap_device_private_pagemap);
>> +
>> +struct page *device_private_offset_to_page(unsigned long offset)
>> +{
>> +	struct dev_pagemap *pgmap;
>> +
>> +	pgmap = mtree_load(&device_private_pgmap_tree, offset << PAGE_SHIFT);
>> +	if (WARN_ON_ONCE(!pgmap))
>> +		return NULL;
>> +
>> +	return &pgmap->pages[offset - (pgmap->range.start >> PAGE_SHIFT)];
>> +}
>> +EXPORT_SYMBOL_GPL(device_private_offset_to_page);
>> +
>> +struct page *device_private_entry_to_page(softleaf_t entry)
>> +{
>> +	unsigned long offset;
>> +
>> +	if (!((softleaf_is_device_private(entry) ||
>> +	    (softleaf_is_migration_device_private(entry)))))
>> +		return NULL;
>> +
>> +	offset = softleaf_to_pfn(entry);
>> +	return device_private_offset_to_page(offset);
>> +}
> 
> Did we mean to add an EXPORT_SYMBOL_GPL here as well?

I don't expect modules would need to use this so I don't think it is needed.

Thanks,
Jordan.

> 
>> +
>> +pgoff_t device_private_page_to_offset(const struct page *page)
>> +{
>> +	struct dev_pagemap *pgmap = (struct dev_pagemap *) page_pgmap(page);
>> +
>> +	VM_BUG_ON_PAGE(!is_device_private_page(page), page);
>> +
>> +	return (pgmap->range.start >> PAGE_SHIFT) + ((page - pgmap->pages));
>> +}
>> +EXPORT_SYMBOL_GPL(device_private_page_to_offset);
>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> index 5cc58a5876a0..db8058705994 100644
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -200,6 +200,7 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
>>    		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
>>    		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
>>    		unsigned long device_private = 0;
>> +		unsigned long pfn;
>>    
>>    		struct page_vma_mapped_walk pvmw = {
>>    			.ptl = ptl,
>> @@ -208,9 +209,12 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
>>    			.vma = walk->vma,
>>    		};
>>    
>> -		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
>> -		if (folio_is_device_private(folio))
>> +		if (folio_is_device_private(folio)) {
>> +			pfn = device_private_folio_to_offset(folio);
>>    			device_private = MIGRATE_PFN_DEVICE;
>> +		} else {
>> +			pfn = page_to_pfn(folio_page(folio, 0));
>> +		}
>>    
>>    		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
>>    						| MIGRATE_PFN_MIGRATE
>> @@ -332,7 +336,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>    				goto again;
>>    			}
>>    
>> -			mpfn = migrate_pfn(page_to_pfn(page)) |
>> +			mpfn = migrate_pfn(device_private_page_to_offset(page)) |
>>    					MIGRATE_PFN_MIGRATE |
>>    					MIGRATE_PFN_DEVICE;
>>    			if (softleaf_is_device_private_write(entry))
>> @@ -1360,7 +1364,7 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
>>    {
>>    	struct folio *folio;
>>    
>> -	folio = folio_get_nontail_page(pfn_to_page(pfn));
>> +	folio = folio_get_nontail_page(device_private_offset_to_page(pfn));
>>    	if (!folio)
>>    		return 0;
>>    
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index fc2a6f1e518f..4a9420cb610c 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -1004,9 +1004,9 @@ static void __init memmap_init(void)
>>    }
>>    
>>    #ifdef CONFIG_ZONE_DEVICE
>> -static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
>> -					  unsigned long zone_idx, int nid,
>> -					  struct dev_pagemap *pgmap)
>> +void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
>> +				   unsigned long zone_idx, int nid,
>> +				   struct dev_pagemap *pgmap)
>>    {
>>    
>>    	__init_single_page(page, pfn, zone_idx, nid);
>> @@ -1038,7 +1038,7 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
>>    	 * Please note that MEMINIT_HOTPLUG path doesn't clear memmap
>>    	 * because this is done early in section_activate()
>>    	 */
>> -	if (pageblock_aligned(pfn)) {
>> +	if (pgmap->type != MEMORY_DEVICE_PRIVATE && pageblock_aligned(pfn)) {
>>    		init_pageblock_migratetype(page, MIGRATE_MOVABLE, false);
>>    		cond_resched();
>>    	}
>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>> index b19820a51e95..141fe5abd33f 100644
>> --- a/mm/page_vma_mapped.c
>> +++ b/mm/page_vma_mapped.c
>> @@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
>>    static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>    {
>>    	unsigned long pfn;
>> +	bool device_private = false;
>>    	pte_t ptent = ptep_get(pvmw->pte);
>>    
>>    	if (pvmw->flags & PVMW_MIGRATION) {
>> @@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>    		if (!softleaf_is_migration(entry))
>>    			return false;
>>    
>> +		if (softleaf_is_migration_device_private(entry))
>> +			device_private = true;
>> +
>>    		pfn = softleaf_to_pfn(entry);
>>    	} else if (pte_present(ptent)) {
>>    		pfn = pte_pfn(ptent);
>> @@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>    			return false;
>>    
>>    		pfn = softleaf_to_pfn(entry);
>> +
>> +		if (softleaf_is_device_private(entry))
>> +			device_private = true;
>>    	}
>>    
>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>> +		return false;
>> +
>>    	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>    		return false;
>>    	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
>> @@ -139,6 +149,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>    /* Returns true if the two ranges overlap.  Careful to not overflow. */
>>    static bool check_pmd(unsigned long pfn, bool device_private, struct page_vma_mapped_walk *pvmw)
>>    {
>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>> +		return false;
>> +
>>    	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>    		return false;
>>    	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index bb881b0c4b06..04d74579d1b1 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1860,7 +1860,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>>    	struct mmu_notifier_range range;
>>    	enum ttu_flags flags = (enum ttu_flags)(long)arg;
>>    	unsigned long nr_pages = 1, end_addr;
>> -	unsigned long pfn;
>> +	unsigned long nr;
>>    	unsigned long hsz = 0;
>>    	int ptes = 0;
>>    
>> @@ -1967,15 +1967,20 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>>    		 */
>>    		pteval = ptep_get(pvmw.pte);
>>    		if (likely(pte_present(pteval))) {
>> -			pfn = pte_pfn(pteval);
>> +			nr = pte_pfn(pteval) - folio_pfn(folio);
>>    		} else {
>>    			const softleaf_t entry = softleaf_from_pte(pteval);
>>    
>> -			pfn = softleaf_to_pfn(entry);
>> +			if (softleaf_is_device_private(entry) ||
>> +			    softleaf_is_migration_device_private(entry))
>> +				nr = softleaf_to_pfn(entry) - device_private_folio_to_offset(folio);
>> +			else
>> +				nr = softleaf_to_pfn(entry) - folio_pfn(folio);
>> +
>>    			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
>>    		}
>>    
>> -		subpage = folio_page(folio, pfn - folio_pfn(folio));
>> +		subpage = folio_page(folio, nr);
>>    		address = pvmw.address;
>>    		anon_exclusive = folio_test_anon(folio) &&
>>    				 PageAnonExclusive(subpage);
>> @@ -2289,7 +2294,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>>    	struct page *subpage;
>>    	struct mmu_notifier_range range;
>>    	enum ttu_flags flags = (enum ttu_flags)(long)arg;
>> -	unsigned long pfn;
>> +	unsigned long nr;
>>    	unsigned long hsz = 0;
>>    
>>    	/*
>> @@ -2328,7 +2333,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>>    	while (page_vma_mapped_walk(&pvmw)) {
>>    		/* PMD-mapped THP migration entry */
>>    		if (!pvmw.pte) {
>> -			__maybe_unused unsigned long pfn;
>> +			__maybe_unused softleaf_t entry;
>>    			__maybe_unused pmd_t pmdval;
>>    
>>    			if (flags & TTU_SPLIT_HUGE_PMD) {
>> @@ -2340,12 +2345,17 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>>    			}
>>    #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>>    			pmdval = pmdp_get(pvmw.pmd);
>> +			entry = softleaf_from_pmd(pmdval);
>>    			if (likely(pmd_present(pmdval)))
>> -				pfn = pmd_pfn(pmdval);
>> -			else
>> -				pfn = softleaf_to_pfn(softleaf_from_pmd(pmdval));
>> +				nr = pmd_pfn(pmdval) - folio_pfn(folio);
>> +			else if (softleaf_is_device_private(entry) ||
>> +				 softleaf_is_migration_device_private(entry)) {
>> +				nr = softleaf_to_pfn(entry) - device_private_folio_to_offset(folio);
>> +			} else {
>> +				nr = softleaf_to_pfn(entry) - folio_pfn(folio);
>> +			}
>>    
>> -			subpage = folio_page(folio, pfn - folio_pfn(folio));
>> +			subpage = folio_page(folio, nr);
>>    
>>    			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
>>    					!folio_test_pmd_mappable(folio), folio);
>> @@ -2368,15 +2378,20 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>>    		 */
>>    		pteval = ptep_get(pvmw.pte);
>>    		if (likely(pte_present(pteval))) {
>> -			pfn = pte_pfn(pteval);
>> +			nr = pte_pfn(pteval) - folio_pfn(folio);
>>    		} else {
>>    			const softleaf_t entry = softleaf_from_pte(pteval);
>>    
>> -			pfn = softleaf_to_pfn(entry);
>> +			if (softleaf_is_device_private(entry) ||
>> +			    is_device_private_migration_entry(entry))
>> +				nr = softleaf_to_pfn(entry) - device_private_folio_to_offset(folio);
>> +			else
>> +				nr = softleaf_to_pfn(entry) - folio_pfn(folio);
>> +
>>    			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
>>    		}
>>    
>> -		subpage = folio_page(folio, pfn - folio_pfn(folio));
>> +		subpage = folio_page(folio, nr);
>>    		address = pvmw.address;
>>    		anon_exclusive = folio_test_anon(folio) &&
>>    				 PageAnonExclusive(subpage);
>> @@ -2436,7 +2451,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>>    				folio_mark_dirty(folio);
>>    			writable = pte_write(pteval);
>>    		} else if (likely(pte_present(pteval))) {
>> -			flush_cache_page(vma, address, pfn);
>> +			flush_cache_page(vma, address, pte_pfn(pteval));
>>    			/* Nuke the page table entry. */
>>    			if (should_defer_flush(mm, flags)) {
>>    				/*
>> diff --git a/mm/util.c b/mm/util.c
>> index 65e3f1a97d76..8482ebc5c394 100644
>> --- a/mm/util.c
>> +++ b/mm/util.c
>> @@ -1244,7 +1244,10 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
>>    	struct folio *foliop;
>>    	int loops = 5;
>>    
>> -	ps->pfn = page_to_pfn(page);
>> +	if (is_device_private_page(page))
>> +		ps->pfn = device_private_page_to_offset(page);
>> +	else
>> +		ps->pfn = page_to_pfn(page);
>>    	ps->flags = PAGE_SNAPSHOT_FAITHFUL;
>>    
>>    again:


