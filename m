Return-Path: <linuxppc-dev+bounces-16132-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEhiM7zpcWkONAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16132-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 10:11:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCF86448B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 10:11:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxb093SRWz2ySb;
	Thu, 22 Jan 2026 20:11:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769073081;
	cv=pass; b=WwBAZGbYiSkU2nsMgrHfqVUFftsGltQXKq5N1qfsGMehWovj/BC3+gUAqoCyDv5aAu1DElnBHPY1YK4Pj28VCzzcfX1Y4S68fGgcX0XD1+V2a7evnuprnHWq4FuZuHnzy2Kle4gv7wtjFwY/9njvkD4TPfroWnUuf5gxX7F9v0EKsIcOcWn4psAbC5NMSUVxYaJtze4Cg6ImesFkdmovo3xCGCSfnlB/0x/oe3/2K4hu2ToJFWUp0uyz3BPgQDj5L1t+Gh3rEA3oXwPxKY1K9OY8XTwvuturtju1dg/m5mlLlH9HJt3Rijh33p3A/sU62v76onvLkZPm8wtSp/QUZg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769073081; c=relaxed/relaxed;
	bh=i0hebeOKDRPad9y6i+fih1AebL1/WcupoZ5Ju9S49Nc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=maG9amNMSqfKLqFtqZlgj6PWDv9unG3+qK1tzBobMz0FgRKoV4Z1vH/TyDpUf7Cgc3DlNBwQ+jGn9BVrsYIPVJFA04ueG9rNsFESn7GyxxdkzIS2Zu7lOqdoBwHLTolOv75lcJua7JIDDjMHukBcr2huzHfbF0GSAluCLmDfuc/9TMOwZPhu0Fx7866IXrJ15FFSf2PX0/FKYI0xayEfSmojaiGC8BjYI4CYx9mpZPGkx4jVESh7pZgrl2Pl7EOIbI3C+f8Ns/HHV93Et2byBPF2v6Cb/TfvEM8h8tWnjL7c9dgnzs6Hu4EsvlWTPMqRJXA5eeYJM21o4XH6ar35Qg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lU64f+Bh; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lU64f+Bh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxb080m8Xz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 20:11:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtJmgflt+LRIhEs81tZMQHCVbyzd8ePWUS8/0rom5yvbDcNsO3+c1cq4K/+4czlzwItM6aLvR3f9/uRqaKh3PpDHrZ8dP4A1tGM6d12e9qUrms1mK6CprmTXVpm0srq1AdMYGawnfGrYtXsHvKxQ1aSAIRFCq7OfQkuR6RZRGze0qRkFjmhlFbJ+Jvr3f4xPIyKYDoypEcNjiEA8usjUA8lxuJwnfKLKl6yjdqvBtVvrbeowaexxI0hZQaimMfwAGX5wsEddoiDtxpvkUq9aAo4oGubDjqqpzsenZ/lLfbcaqdiWRCEBM+15R+sxg5n8rEkQYi41EmM9po1YQOM47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0hebeOKDRPad9y6i+fih1AebL1/WcupoZ5Ju9S49Nc=;
 b=uE64dix8dFYWzO08G/zOI2Ke2Vxr1lrkHF5IuFNdRx573l282S5xiX2b24gygMVlV/1y4BMBgihnq79qTf2ktK2OtAKf3uayPVA3FaMsb94+IjMiqLksvNoWmSnW4DdScAMonOy9S3E5omxirITNMo4ZxTaZXjHL5Ok4hQqTnn8KUR8P4npEQKCzr3tjTaNzttSRg6HDVhqQwCxTh5yp2pDDv3ZL7mYzhr5L4fEY9eisIH/uH1kePqWSoTLRhXTRCVGRCOm6DLfnVXyL+xMA6qLW4q9dBvWrUCsZW7oTR6nKfYmFJTQ3sd9LFIiCKWqSn7zoVKwzTGm2BI/rvcQvwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0hebeOKDRPad9y6i+fih1AebL1/WcupoZ5Ju9S49Nc=;
 b=lU64f+Bh7wsS/EBEzyj+qkKCad8R7S65Tkz9viCE6+CpHj3B9SymnBX56tD8Ngs4DEep/9mUVebdYeFfCOdH7MR7vi5wRDvl40P3nH21NMSG7rsQ0h3g+3d5lgJpUx+wWcZY6wsJI/Q5BIoRvvxnmWwN1FgvFXv0QA3OWWjdphTwF0o4vo8AFoEBi3ScFk1qbwZI7j46fQuteAfLreA8+vOcaxhP8hZ6Bo0wwrDJ30cBHSls5T45wBdyO++GKX5pDqY7N7IJhM8t85ZTFvMDdtdfARZqzEaGB5ruepSaBtLgv2wGZqfye663La0dVk7j4Bz8jf6Zr5J71RHAB5h1hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SA0PR12MB4429.namprd12.prod.outlook.com (2603:10b6:806:73::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 09:10:55 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 09:10:55 +0000
Message-ID: <626c34fc-34df-4629-baf3-fbebc9abafbb@nvidia.com>
Date: Thu, 22 Jan 2026 20:10:44 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
To: Vlastimil Babka <vbabka@suse.cz>, Matthew Brost
 <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Matthew Wilcox <willy@infradead.org>,
 Alistair Popple <apopple@nvidia.com>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, adhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky
 <leon@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-mm@kvack.org, linux-cxl@vger.kernel.org
References: <eb94d115-18a6-455b-b020-f18f372e283a@nvidia.com>
 <aWsdv6dX2RgqajFQ@lstrano-desk.jf.intel.com>
 <4k72r4n5poss2glrof5fsapczkpcrnpokposeikw5wjvtodbto@wpqsxoxzpvy6>
 <20260119142019.GG1134360@nvidia.com>
 <96926697-070C-45DE-AD26-559652625859@nvidia.com>
 <20260119203551.GQ1134360@nvidia.com>
 <ef6ef1e2-25f1-4f1b-a8d4-98c0d7b4ad0c@nvidia.com>
 <EE2956E3-CCEA-4EF9-A1A4-A483245091FC@nvidia.com>
 <20260120135340.GA1134360@nvidia.com>
 <F7E3DF24-A37B-40A0-A507-CEF4AB76C44D@nvidia.com>
 <aXHPkQfwhMHU/oP6@lstrano-desk.jf.intel.com>
 <9077ab5b-f2c8-4c8d-8441-631e7c2cf384@suse.cz>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <9077ab5b-f2c8-4c8d-8441-631e7c2cf384@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0051.prod.exchangelabs.com (2603:10b6:a03:94::28)
 To PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SA0PR12MB4429:EE_
X-MS-Office365-Filtering-Correlation-Id: e46775ea-521f-434e-a33d-08de599625e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDJ4c2NmVzRJbGcxTXRCOU9Bd0dGcmwzUW9jWURoTmRFVEd4WVVaaW9IOVhE?=
 =?utf-8?B?Q1ZYMlpvSUxyWW4yMHBjZ3pJUzdCVE1ZNDVoUmMzYVBLWG5hMEtsbGsxZzZo?=
 =?utf-8?B?dGJaZW9TWTY4My9hNmVNZk1KVmhJaEZIWDFhdFNwUUREaHF6Qi8yazgzcUgr?=
 =?utf-8?B?TmlSdG5yVC9wMmQzTTVqODFiQnhRZWdWeUFpalVWLy9FQ3lWTGdKaVAxVVBQ?=
 =?utf-8?B?YUpFTG5oYW1DdHQwR0xEYVZlSC9rQnhFb3RPaXNSWmlPS3hWbHpBbE14VUQ3?=
 =?utf-8?B?dUZhd0hYZEpSamlPc3FaUHVrUGtnMUhlS2VRZmJyVnN1c0h2b2VGZE1yUkxS?=
 =?utf-8?B?ekdiL0cxSVRIR2hSYUxNNmxxRW5mbVBnaTVKRkRsdUdrWk1uR1lydTNxQWJo?=
 =?utf-8?B?RzBIQ1BzTUxSNEFRYVdnbjNvUWhGOGJBS3JJZnY5ai9XbSs0L2svbFRjUW8v?=
 =?utf-8?B?UGU3VGx1YTlCQS82aGtleWlDNDFQdEV4VWMzdFNuSis4OVVnalR3NXdCTElD?=
 =?utf-8?B?Qjl5RUVLYkxERmJCNWsva3JTM2UxL0NCRU9LaTZ3TWtzRHBxVmNUT2tGWE1l?=
 =?utf-8?B?MmlDMVRmT0llb3E1bWJlMUhrTmIvZkozY3g2eUZWbW9EeG9rOUhFR3pPOGg0?=
 =?utf-8?B?YVRuMW9CRHVDU2EwSmluRjNmM2VLNWxkdXdSM0F4VjJOTEdUWlh0dnBYYWkx?=
 =?utf-8?B?TFcwK1ZQdFJ2V05qV29rRnJ1NGUyd2ozN1d4cDFXVmpYREIrMWJQb2M2dFg0?=
 =?utf-8?B?R3IwRjVONVB5SWZXdlIyYlI4ekZCUDllWm1wNmhKYmUrdlhPcDdmM2FENzRI?=
 =?utf-8?B?L093SlFmbGFOdjVReUFBczZhejRvTEpoVGcyNTRYeXRrb0pOUE42OUsrLzdY?=
 =?utf-8?B?dW40T0pKZjg0Z0NDWmxQR080NGxRWGZGcjMxWWpSbDNQSmYyakhud2t5R0ZE?=
 =?utf-8?B?dEJuTjJWNVBpV1AzSUt3Tm9GeUg1Ym5MZWpiOEdWMFhtRjA2TnE3ZHE3T3dD?=
 =?utf-8?B?M1ZCSkxxM3NJaEo2bVV5SHBhbzVxMzZvME82NHpYREpvdUNRRCtmaTJnV3BY?=
 =?utf-8?B?SUNtNzA5cGlWUTQ5NWtiZVV3Tk1EdDJ2Y1JtZW1TVDdCRENyeEpJb01jU0Fw?=
 =?utf-8?B?YWZEM1U5RnozUzJoNUVVb0NhSjhwaHJ0ZnFjYlg1MXJ4Z1p0aWpDVjVOL052?=
 =?utf-8?B?aXpEcU5FKzdsMjV5TUlkMHJpS1pPblZqR1U5bHI5YmY1bGZRUzQvT0QvaVhC?=
 =?utf-8?B?YjVEZHcyMUowaW40Q09YaHpMVjM5Z2tyZGtEOGpJQ1B0UGZVTG1ORzRyMERM?=
 =?utf-8?B?SjFWS25pSEtDRlNjUjdtMldtOXY5b0JZS1FnRkwzekxhSTJJcVpXZTl1eWx0?=
 =?utf-8?B?Z2lZUlJYWEZQcW5qMkNseS9TZ2sxYWgvOTFtdExDZkRkSVN6bU0ra3RvZ2NB?=
 =?utf-8?B?eU02di9yT3JmTTI5a1hqK1JKY3ZjU1h6S0pDU2hMQTRQbDlDUXoreTFGUDV0?=
 =?utf-8?B?WGJNWGlqRm41WHphUm1tQVlnMVA5bSs3cGwwN1p5aVUvVS9UQU1pVnVKNXFW?=
 =?utf-8?B?azNaWk9wRFd4VlVIUk1sa2NmVTAycEpmZThJUG1BaFhla2dzeVVKS3lhWjlH?=
 =?utf-8?B?RmpKYUF4TEZ6anBMK2RwaURuZGhCL0FjRlRaWWpHbzVqRTlMeEk4TE5MbHBT?=
 =?utf-8?B?SElRQ1dQYkNPMWw1UktYd1h2YkhJQnZEVHJxd05MQ2tYK2puakRIRDN6bGt6?=
 =?utf-8?B?dkNSZkJQZjEwZFl0ek04V0N2dngzNzB3aktCTGNHNUtsK0RIN1BsRlIzdmNC?=
 =?utf-8?B?emFaOG81WFk1NGRmNEQ1ZXhyWWtyNmROaTFzSkpTWUdRRisxVXoxb2xNelEv?=
 =?utf-8?B?SkRDRGdnaFhkb1VjZTIrZ1NMbnBPSVFhYnd5bTVrNlFid3J0RStyaVdiMVYw?=
 =?utf-8?B?SHBQMzA2RDVSaDV5bUdsTUs3aUtCZmI4dzkrRUFTL0tVdzRYZytlUnAzUzFW?=
 =?utf-8?B?WWdDL2FxbGVYQUhoWWVUUEl5Q3BaSy9OSXpDUlZPV282SFpkdlVlMExNU0lY?=
 =?utf-8?B?cmpIUkQyeFhheGZnMW03QWM2MU5CZmVKaVd5emF3Wk9hcVRiM1RuejgwejIz?=
 =?utf-8?Q?6GTY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFZ2WEJJQUVzaDBVOUo3ck5CbFhmMVFaaGMrTUVQOWQvd0JrcmZmc1duSEwz?=
 =?utf-8?B?aFlaSGtYUVd4KzQxZHRzUXZmOGdyaHVWalNrZCt2YnowbGNhblAxMkdFRXBF?=
 =?utf-8?B?WU16TUdnS0s3TGhHK2RKaFo1NU1saStZYlVvMVVEeHArZUprUld3Q3p4Rjc4?=
 =?utf-8?B?T2Q0emJWaHZaam5xWGdBTTZqcDNzaE9YM3p5L0ErVi9qRzdWZDUzTnA5R0pU?=
 =?utf-8?B?YkhPc2xSMytsVWhzZktvS1FzSlRhQ2tqRVNjeElVaWVnRGd4VlBmcnd2dllM?=
 =?utf-8?B?SFRYS1ltSldsL3ZLTDhVV1QxWmY4OGpXWFdUTmlLQzY0VFlSZ2JjVVQxYXd5?=
 =?utf-8?B?WnpxOVFiTkJWN2crZE9Mc2dOdFpiYlgzODluVTg4eGNOS21SbDhlMVFpT1Qr?=
 =?utf-8?B?NkJ4Z2ZsN05Jam9aR1AvQnlsdFRnRDEzbXFJRHZ4TlR1VlZKZXc1UnIxZ1pl?=
 =?utf-8?B?Z2h5UTFBSFFTeFUycTFMQnlpczN2aUtyczZNcXcrTEdEajJLblJSU29tYjdM?=
 =?utf-8?B?UDJUVHREaUp2Mm1FaDlVZHQyeURKOGNIS09DNDAzTTJrdkM2ZG9pTU03TndO?=
 =?utf-8?B?OTR2R3ZzRGltbkJjejZSaWM0ZHZPRmZqNU1zWktNVjJyS0lHQ3BYalRwcnVs?=
 =?utf-8?B?cW1hU1htRHQwcFNReG8reEtuci9XaHVIajZBRzl2NnVIYkZ3LzZGS3l5ZWx1?=
 =?utf-8?B?Y2t0MnVBTTZTbks4SlRtZGE0Wllid0lFU2lPeFBYeXp3Yi9nKzBVazF0SFEy?=
 =?utf-8?B?d0J1aTNxUmdIdWxPMkk5Q0k5Qk5la0J3bFltMzdDeWVLNUxwcmRReFJ3UVVk?=
 =?utf-8?B?ZFJ4SkkvL3hvUG9yWDhZdVgwN05TbDVvcHpvQmoxMlFYb1gwK0F3NFBXemY0?=
 =?utf-8?B?L0hPMUhWclpXUkQwbzhBak1wdERUSHFQY1NnYWtaK29xKzZwbU9vcEVvMmpa?=
 =?utf-8?B?VlBmazlrQmxObnhwM2plb1QxUGlTOCtpSERjN1FlWm1BbnpSNkpOR0ZyWEFR?=
 =?utf-8?B?dHZoTXpENFpITTVSS2pibmZNQlBVMzg1WVBlRVhOMmwvRjlWSUV2c1lUMjRO?=
 =?utf-8?B?MjF6NTYwYUhOYnkwQWdLZUt1VUtyZGNTcFhwWEVhVGl4Yzc3RjQyc1o5c2dG?=
 =?utf-8?B?S092THBybGxJZUVEUnpER0dsWkpuYTBRbytKZjNXTzFHS3BjTFAvNzdUTCtz?=
 =?utf-8?B?ODAzbit2YlJPSmRCalRieis0WUpwNlFNYUtNemgwcHFaZTNoL1MzWjk5c0tt?=
 =?utf-8?B?cU5LbWF2c1ZxSGE1S0Nrak5BaHVFL2tiUzR1Y055czRrbFdWZC81SHpPdE5X?=
 =?utf-8?B?SWJnOW1NZlVoWjJKQUtBK0lqM1g0RFN1TWtiTnhZa1BabEpiNFFPeThrZUIz?=
 =?utf-8?B?RGpWQ2oxL0JOSXJJTHV0eXhkMWlFQjI2ZXAwY0xETWlERXRYT3MzU0RLaGc0?=
 =?utf-8?B?ZS90aU1PTG11bHJNdkZleG0wdHh5VXk4azZJZWpWRGdadjVCR3B3UkNYVVN5?=
 =?utf-8?B?ZXhQOGhETVZQbm9DeEtaNlp0TDhSVEZFMkVCUlkvMzl5OThQakEvYTZkYUdL?=
 =?utf-8?B?TmFPT2RjU0tDU0JiaFZEc3Z1cE1vcXRjKzRTZGhvYUx5RU1Za29XL3JvR3o3?=
 =?utf-8?B?OUUrNEk3ZjltMk5QZUN3SkJLdHVMMGE4Z0c0b09ob0t0YjVXQkhQY01pU0RH?=
 =?utf-8?B?QzhGZEVycjNZQXhRWkQ0aGp0S0pMaDNIYW9ZdDE2MytHdTBzRFJpNVI2WkhU?=
 =?utf-8?B?NnNWMXdSb1FrZ0w3TWtNaEtiV3RRamxZRGlxYnlDZGRaS3FwK1FpamNIN3dy?=
 =?utf-8?B?N2RFWERqNkVFaFVRZ3lmUU9jaUk0MTQ4Y1pmOU9EbGpxdVFGUVJodys1Q1VI?=
 =?utf-8?B?WXROcWVTakFyUkhtc3k2YXd0T0hlMlZSRXpReS9Hc2EwR1loSFo4Qnl4WTJk?=
 =?utf-8?B?cW8wNGFlWUYxSHhpcDR1bUwrNTUwV2k5MXN1Y21qT00yWDk5b29jN1JqenhF?=
 =?utf-8?B?RU5iWjZKeDNKdTAvdXFYZS9ENjZ2L1k5K2loYjNPRWduQlJOYmpkZ0gvQmhS?=
 =?utf-8?B?SmwwdzJnWjhVWDJuejEzQ3IvQmZ3aGV4RjJoRXFJakU4SGYvdTgrL0s5UVN1?=
 =?utf-8?B?S2FDWnRJTXQ4N0FTYkxSOVlSbmMyYU4rYW5tTk5RVDhzVzJFUm11Qjd6Lzli?=
 =?utf-8?B?bjFpSERNOWloWXcwSldOaEwraXJqUnBWQk9aamlQTCtnS0YzRUx2UmhsUG5Y?=
 =?utf-8?B?UnlNM21IOW9xUlFMSjA2cERDYmtUNXN0aGlFaWx6ejA3Ti94bEhleTExZ1B1?=
 =?utf-8?B?SXpEQ2JKd2MrNEhoN0RYZ2NOK1lOZWY4R01YSjMyS2N6a0hQTVZCeTZNNlFE?=
 =?utf-8?Q?QSyQXJSaQLUQuJVnGdpWEzIjJhfH4zALPj42PtZKLKp2n?=
X-MS-Exchange-AntiSpam-MessageData-1: EHzCNiTJ32GXEQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e46775ea-521f-434e-a33d-08de599625e9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:10:55.0938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HF5GSrur9tdXdSjm8lfxAqBvr9x78S8dWBjAlJHwVElq+qrcpNzmGO/ETnsA2sw15hc2k1sgid3lKnAaovQ8SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4429
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[balbirs@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:vbabka@suse.cz,m:matthew.brost@intel.com,m:ziy@nvidia.com,m:jgg@nvidia.com,m:willy@infradead.org,m:apopple@nvidia.com,m:francois.dugast@intel.com,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:Felix.Kuehling@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lyude@redhat.com,m:dakr@kernel.org,m:david@kernel.org,m:osalvador@suse.de,m:akpm@linux-foundation.org,m:leon@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-mm@kvack.org,m:linux-cxl@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16132-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balbirs@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,infradead.org,intel.com,lists.freedesktop.org,linux.ibm.com,gmail.com,ellerman.id.au,kernel.org,amd.com,ffwll.ch,linux.intel.com,suse.de,redhat.com,linux-foundation.org,oracle.com,google.com,suse.com,lists.ozlabs.org,vger.kernel.org,kvack.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: ECCF86448B
X-Rspamd-Action: no action

On 1/22/26 19:00, Vlastimil Babka wrote:
> On 1/22/26 08:19, Matthew Brost wrote:
>> On Tue, Jan 20, 2026 at 10:01:18PM -0500, Zi Yan wrote:
>>> On 20 Jan 2026, at 8:53, Jason Gunthorpe wrote:
>>>
>>
>> This whole thread makes my head hurt, as does core MM.
>>
>> IMO the TL;DR is:
>>
>> - Why is Intel the only one proving this stuff works? We can debate all
>>   day about what should or should not work — but someone else needs to
>>   actually prove it.i, rather than type hypotheticals.
>>
>> - Intel has demonstrated that this works and is still getting blocked.
>>
>> - This entire thread is about a fixes patch for large device pages.
>>   Changing prep_compound_page is completely out of scope for a fixes
>>   patch, and honestly so is most of the rest of what’s being proposed.
> 
> FWIW I'm ok if this lands as a fix patch, and perceived the discussion to be
> about how refactor things more properly afterwards, going forward.
> 

I've said the same thing and I concur, we can use the patch as-is and
change this to set the relevant identified fields after 6.19

Balbir

>> - At a minimum, you must clear every page’s flags in the loop. So why not
>>   conservatively clear anything else a folio might have set before calling
>>   an existing core-MM function, ensuring the pages are in a known state?
>>   This is a fixes patch.
>>
>> - Given the current state of the discussion, I don’t think large device
>>   pages should be in 6.19. And if so, why didn’t the entire device pages
>>   series receive this level of scrutiny earlier? It’s my mistake for not
>>   saying “no” until the reallocation at different sizes issue was resolved.
>>
>> @Andrew. - I'd revert large device pages in 6.19 as it doesn't work and
>> we seemly cannot close on this.
>>
>> Matt


<snip>

