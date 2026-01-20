Return-Path: <linuxppc-dev+bounces-16082-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJbKOZcHcGlyUwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16082-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 23:54:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCF54D525
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 23:54:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwjLX49NCz2xrL;
	Wed, 21 Jan 2026 09:54:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768949652;
	cv=pass; b=S8qqh/A3fJap21q1rqVfy6s1Wr/ZOtp8OdIjIpiSzSEUy5IHHpV5AxBlSYStgsTJHGvwC8Lvn6PpjegskapiRFOBCns4JZYbTNM0Ss8xCf5YW+Nr2YRc/J/krhdOOOk+mOgV1nsf7VXHimHQUYb5citnYNfJaVLAOk9ZMHGZ7B4pnpsPmSMnhu3zBGEcAuW9EwKz06APyD6zSOteIL1jLx4lENHaUw29I5qL/BcAm73vV3uSHH/A7PYz31X31lTlm+eBoWQhsePrGWvwJbTlxOEX4QZxL3nl+DfFp6C7fQ2LWQ180C5JjQOr0lFNjNX2pJUKY0tAutOHfdd0UsRedw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768949652; c=relaxed/relaxed;
	bh=NZn82ZzzYTIroWb23yOu9XXNggXgXnV3+j/QTnnvkS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c1Uv4k3EB2dJVuuX9DxArusdLnECZY76FScQRD5c0KSfvjJqsD/+OB/WoMwbZfAVp3VLMRFs6FIYm/vOfANz657esrMZ3uf70hpN7A5yhA8a3zB8gbkEHOs8p8SbYPAHfH2zITNjbOIwkHzoqX/ZPMahc+jOy7TIZyptV9peqPOGth9TqJHdgoI07UunlZjuMtSU8dcKMI2ZFu0wgDtrIXmDm43NLdpSufl2tY9tNhteQwl23dJ0r1QdA/u8iKz6zbnrewx+xnYk6GmAsBOsMXw6Gyl8sLeA73Y0XOn/wqhfx4/5kbJ+yy0Jm8J3jce6sNHxi8stTbefGXa8ALe1xQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Vjkyb2ZA; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Vjkyb2ZA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwjLW4JVxz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 09:54:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhC+NzmJvLnHb2PwiZxAsbXNQZCshV/YVt7tyFQ8mTOlDuHm2PNJu96SJdQnFy7mMoXXljtruS24az6aH2uZlPXtjjye/Tics51kIeOtGjM0LxnU37u7A1kz8d36F7zXyY1FDzeptIDw+PB9PbM0hCJklrsIkToEnQniM2+GQ5cLd1w6O/VZN/fTguLI9fQ7KayzNc/RAB/nDLpokc1VY8iE3/b3OfN/e3JmFbMYlBPdbZx33Yqr9i9h0GkMYzrn5iLue9DhdKkAc1r7XgKYg50wMfwQp0AKmCZLT1xwkVuF0/FFRvgaaXg3P7T2iHsH3nEyw74erOzfSxiFp9CQfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZn82ZzzYTIroWb23yOu9XXNggXgXnV3+j/QTnnvkS0=;
 b=DgZ1vADCoZ9BJBphZd5IJcm2g/DIE+lj/mtzJNzIMfnTyeQgk43YRTsIlsvNHN/Jkziwcn+vxzaIVgprP9ItJmnt2YypOOJV3uXaoKuZXdKTviicsFwTYJXInowYpNp72lufSyuA0OUK6Yqh9iAbD97UDVQbi/r8aN793y5SkSF5/0KZxMNa2siZZ2fK9mISbiSCxmEWFJEvlIVFqhPRY//8f9OpQRbiHiHCBCWfkpU2XgFubl7zwIVm3yIRcevZvdFo1wp5pVrQYuoa+wfCdMLqfPhVrb3HStnVIBO/HwZrp4ZrjG1hAbk5pSaG1hiueTt+O9zf64sVTCP8vpNWJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZn82ZzzYTIroWb23yOu9XXNggXgXnV3+j/QTnnvkS0=;
 b=Vjkyb2ZAfQ2cROfnYkMqQocE6slAHAqZPgunz+ukV+tTIHzT+nf0O+F0VqmWZXOBEYp3ZxlD6A6p+egrLEcb2We7ClZva/6z7vrHBGir4fR6lX62T/+pHjyioXGrG34UY5W5ArNIIlCySMCvuKzEyyY4pmDkQY6DTJqbs/QDOph0xmAc0slJTWqwGPkxgAU+pkmLZBajB9yrzgs0H2lhHcIYQfGSPYv32ZlhedPeBDDp2rvtk5WzU/2XIE9VuThrm6h4abwbUtxx32VPgmbT9/dBKQNUMtWH0XmhFzIJ+q8bzs2nGcO8AnveFQuTFZR98onhVZ5ysGdyBoI3nt7oFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SN7PR12MB7275.namprd12.prod.outlook.com (2603:10b6:806:2ae::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 22:53:47 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 22:53:47 +0000
From: Zi Yan <ziy@nvidia.com>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com
Subject: Re: [PATCH v2 11/11] mm: Remove device private pages from the
 physical address space
Date: Tue, 20 Jan 2026 17:53:41 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <6C5F185E-BB12-4B01-8283-F2C956E84AA3@nvidia.com>
In-Reply-To: <c9afedc6-f763-410f-b78b-522b98122f06@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107091823.68974-12-jniethe@nvidia.com>
 <36F96303-8FBB-4350-9472-52CC50BAB956@nvidia.com>
 <c9afedc6-f763-410f-b78b-522b98122f06@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR08CA0031.namprd08.prod.outlook.com
 (2603:10b6:a03:100::44) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SN7PR12MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca40570-8371-4156-a8cd-08de5876c54c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDZVdW5SajkvSjRTUzZGL2QyNlBuSmk5RVQ1WlhWN2Y0dnptRUsyWGlldkRp?=
 =?utf-8?B?NXl6MVl2TjJodmZnaUdINjJva0RDajJGaEdidkdWOEFGSUwvbEI3RWphbjlv?=
 =?utf-8?B?Wkc2ODFxSndtZXFQdFdNckNsaUNMdkkzSTh2RGora3YrK3M2Q1dVN2hZMVBy?=
 =?utf-8?B?YUVCU0JjRGdKenJ6YmpJOXRKN0pNb1VHN0ZCU3Q0NkhoSllBbEx3N2pmRHdk?=
 =?utf-8?B?WjF5SDljbk82ZlJtcFp2QjhyQUFLUS93TVdjeUJHRGdMdzNEaUMreXY2bUZy?=
 =?utf-8?B?TXlqTjRCdjVFdHV2b21Wc1AxOVF1M0pXSjRNdzkvTTBTQVI4UnlHSm8vQVNF?=
 =?utf-8?B?Wm5oWlJMSkFpK3lqU2QwTXBiM1RjNzJmSDVXQU5lWVNvbjdHTloxc2QzWDQ0?=
 =?utf-8?B?dm9YOUMrV3NKZFBodzhETysrcEpHekpneGJQellQRGx2a2QzUjRqbTNaV204?=
 =?utf-8?B?Z2M3M1gzaHZyKzhuY0dEM0taOGxKQ0tkZ0hkbjcvTUI4TVc5NDZodjZVNGo3?=
 =?utf-8?B?YjZvRllWZEhoYmx6TG9IUVVkZW11Zjk4NXZPRGZRMUVXTjM1Z1FKdVV6TEdX?=
 =?utf-8?B?YXEyS3l0SzEzTXF0Wm5SUHJpeWxiYWtRbEx4ZnoyUXR3K1pWa2ZLaThqdGlL?=
 =?utf-8?B?RC82T1I2V20yU1ZkWjcyYk9qem5oa2taRFFQeUI1YStxNkJqbk1yOGZYbDJF?=
 =?utf-8?B?NXlBZnBicklSS1hhUHQ4Tm9wNFZpbkNhWjcxZWpWenVwanZyb1doK0RIZEtx?=
 =?utf-8?B?VVNWeldEMXR6N1dNcWhySVI3SVNjZGI5dWlaSkMwandxenpCV3VQYVJ4VWFk?=
 =?utf-8?B?bE9YeWwxSDNGMi9LaWk5RjV0T1MrWGJaanJqdG9hT2FGOFBETFByZDlaRVNj?=
 =?utf-8?B?YlplS3RzZWRQOVZ2VmpsZEkrdWk3OVlzVXMrUGQ1T3NocjJGRnk3b0ZYckZu?=
 =?utf-8?B?U3p5T0NrczFOblB0VFpacnIyeTBERk5oeEtzRmFDWVkwYmtjd1IyZ2psVUdH?=
 =?utf-8?B?ak5qRFNLOWZSWUdidURKMlpaazZvUEgwenI3NnRaejNIMVVTMkVoZGQ1Qmds?=
 =?utf-8?B?ZStQWUJYVWF1YWxpRmlSdTBET1YydE5tUGdOUFpxYWZrMG56a0Z2cWsxMTdE?=
 =?utf-8?B?NzRBS2Q4c0VEWjJ2SXYvZTA4YXFrN2JON0pKUEo4eGtVTUx3RmNNcmQ4U1hU?=
 =?utf-8?B?S0drb2FmKzBZT3E1K0RGOFRYWkpmVjYzU1NLY1cvcy8zemJIMXpjdXFlcmlB?=
 =?utf-8?B?MlQ4b0kvbzhRTndqYm03eGNTOW9CNTRuY2RJZjlkN3JLNW5FMFI4Q0Y4Zy9a?=
 =?utf-8?B?MHhKMUhvZk1QU25YZ2M2UW4xS2FWSFRySkh1NXVpRHhWaXdveHdTRlRxVjlP?=
 =?utf-8?B?cTdienp0MWN4UVhoai9YYkIwSGFHTGJzbVVBS2hzdlMrblBDQ1o3a2RmVW5o?=
 =?utf-8?B?ZVY5bUFGSWZZSXFCUnNUY2gzaGRRMndkaTFOSTY0Q0pxM1NNNWxoL2p5UXFI?=
 =?utf-8?B?cVdPa2lJUGwrTG1ZNVg4YnU4UlpYN1AxYzFCNHl4dlBkM0lJVktzR3FscHpN?=
 =?utf-8?B?bHllMWZ1b0JNN1lsOEtLZGVlYWpycFZMMEIxWDUvNUx1ektSanRrN0ViK2xE?=
 =?utf-8?B?OXVUNnk3QjUrM1E2cTZFTlVwVUY2SjBkQmx3UG9aT1hZc3liWXNDOWZEYS9q?=
 =?utf-8?B?R1kwVkhoeEMzMkZrOTBlcUNSSHlHMzgyeExrZEx0c1pHYm9ob2ZvYjdJRGpD?=
 =?utf-8?B?aE9LN1FDR21yYm5RQi9nYmI5cTZsZkwyc0lVdkVMSDg0VmVNbko3cWhwdk5X?=
 =?utf-8?B?ZmVIdENMTUZZajJISnovaHZPK0FJZzRadDFwZDFDSWM4WHdXSUdtdDNNK0Fv?=
 =?utf-8?B?aVo2cEdGeGg3SmZLRUpONzJrdldndm5rNGorNjBmOHBDOFJQQ05tY1g5WXdT?=
 =?utf-8?B?YTJiYUVybTNXcUxXbEt1cjU2SGIyVmpOQ21leGVwTFExa0pYY0RoQmh6Tk4w?=
 =?utf-8?B?cDMrSHk1RldTbzZqcDRURStJeHBxUmZ3Z0tpRGlVZFJmV3ErdnZjRHFHZG5V?=
 =?utf-8?B?THZ0d0FHbFlDQVlBd0VidnR0MzcyQmdhSjRrWVk1bGJkclFFL1hhM2pROWZK?=
 =?utf-8?Q?6LjE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVIxMlRTc0dIR2FrTmRQWkxLa1QwUkx3ZGxIQUJXYk9uOTY4a0w2T0VxK0ZJ?=
 =?utf-8?B?Y3Q4aXczMXNJWkYyeFZkMHpUVVF2VTBIanRQNUJ0U21LMEh3TWJQWnhpbHFJ?=
 =?utf-8?B?aXVqcVltaEV3NVI2RTNNUlJTTm1HMVMwdWdKbWRoajErZDlxVzFhY1ZvUDA2?=
 =?utf-8?B?c3BaRklUS1pSbUdFL29tVUtmeTNCK2NuOUN4aFJqMEQ2Tk5wWW91dlphSGdw?=
 =?utf-8?B?RFR6QWRzRFZJV0JKWmhlYk1VV0RoQStoWlcrdXdqSGhGYmsydWdvNmpjOVVX?=
 =?utf-8?B?QW1WYk1XVGZNWWN5bDh0Zll4MkVkdmp4bUlmK0hxa0VsQTlvVjgrYjdrMGYw?=
 =?utf-8?B?UERkQ3hiWkd3QVJ0U3NyUDVvRUdtZkVQUERiZXdOZi9NRDlMbFVzOHN5ekJH?=
 =?utf-8?B?K1NZaHZ3NWZHY0czcS9RZTNiQjF2czJCR3Z4dEE1UmIrN041RUNoOUt2czVw?=
 =?utf-8?B?NmQ2RXB5ZGFibWxPVVdnMzNpZzlsbnV4a0pQRjVYQnNVYnhuaDkzNFVjMEQ0?=
 =?utf-8?B?dTlQZCtpWklPaHVUbDVFaDNUdDBXeW8rMjhPbThMV28wNXlQVUZvbGg2ajF4?=
 =?utf-8?B?ZkNUUEpZdDhoS2k5cDQ2ZXV4TDc1UnEzKzRUMDNxMU15OXJvNlBaQjgyUEda?=
 =?utf-8?B?VnlNZnNob1ZOaHdWU0JDUGxwTHZWN1hXM0poQ08zdFpJcWQ2TFRPa1NISUV6?=
 =?utf-8?B?OGRqTzhVK0Jub2EyclFuSkhETFRmVmxlM3dOY1lweS9wV25wNmEyOWd6amEv?=
 =?utf-8?B?QVNQbEhmMXNsV3dmWDYrVUxZNUlrZkllL3RsV0JpUld2QWl5cWM3ZW1COHgr?=
 =?utf-8?B?THlUT1U5eWF1T2VTWS9pMk9VVHF3MG1mOXMreWdYdm8rTVRUa2wvQU55UGd5?=
 =?utf-8?B?ME1RdC9lVGx6czBZRXpiUzgvU0o2eSsvN2U4VVpSbVFKcXBMMU9rVm1Hck9z?=
 =?utf-8?B?L3NYNkR1aG9HSmhLU1VDNVkrV25JVDRzVkZEa2pOL09Cekp6aVF3MTVWNlRa?=
 =?utf-8?B?M2FGNGJSbHJDL1FMd1A4WWhyWkdTa3U0cDJYMW5YUnoxeTBzNWIwNXg0NVhE?=
 =?utf-8?B?ZmlrSzVHNWhZaW5BNWYrODZFQ09iQkU1MWdmdjFRWTNjaE16MS9KYWpLSzFj?=
 =?utf-8?B?K1o3c2tUdGVqQmVjWFF1TTdMK3FDbU1yN1gwU05JT1ordnJhY04xQWh3akFM?=
 =?utf-8?B?Z1hOcWo5bmhtRjFkSFRqVjRlRHJZbU0zcjhaOTFoUitYNW9lSjQxWEYrd1U4?=
 =?utf-8?B?UEl1bEpOc0s2VU81M1hpQ2hMTVQvekZRTDI5am54Z1g0Q0UxWklyR0g2dUcw?=
 =?utf-8?B?dm90V1JPck54bysvdGptN1M2QkZqcEZHT0I5ZEVXNDFSZjhKcm9WSGZCNHpT?=
 =?utf-8?B?K1lPaVdMQU1YWklYeTg0WTVyeGRJYWlvZXhIOERUck9zYjltbkhDdkxucnVx?=
 =?utf-8?B?WHkyZ1RHamdDcDI4Vm5ZL0RwTmMxYUNCQS9TcENEWksza3ZzRk5RQzZQU1JE?=
 =?utf-8?B?Vk1pZG1mY0NSSWVVN3BSbTR2by9NMzVweVd5RTkyVmdtUjcweEh3d2dtUkVp?=
 =?utf-8?B?RFZmRkxTbzF4ckpqakRHUkZ0YlpKeWE2RWNyM2hCd3JvQmgxOG1DZkVsYWYy?=
 =?utf-8?B?Y29nb08xaGx6WkZNNG1XWmdMOGgvcHRzdjV0d0d4VTRkYUE2SUtHUitVT0tw?=
 =?utf-8?B?MTBkOUhwMTlsbDRHWDZvZWk2Yi9Rb29YY2psTWgvcE1kTG5jOXlrVzh1WjZK?=
 =?utf-8?B?dmhsQ0pnd2JNNWQ5SmRCV2F0a3NLcHpydnd4Uk52NjdTRTdnczFpZWVzVGw2?=
 =?utf-8?B?UjhqdlBkZzlxc1NFZnozeGcwVU1GZkZvR2MvVjg4RlJzd29LaDVDWDZJN2dW?=
 =?utf-8?B?QnEzdUNJdTYwbXdWeW1IMzgwNXB2dGQ5QmpJcjRwTWRtT0lzZ3NLMHFWdzZO?=
 =?utf-8?B?TzlNczhhV3RBRmxKRmtUK3k5d2JRZCtxeWZwMzlGM3M4bXhubm1zYkNZdkRM?=
 =?utf-8?B?KzY1aDdVdG44UzdjLzV4WnRYUXFISHo5WGUzMDlISUpZbUV6bUVCQ1lYQlhP?=
 =?utf-8?B?ZVZiTU1sNWUxM21Ld3B3QW1iTStTSVo0RjRCVWpPODVMRWF6dWFuTVdJa3Mx?=
 =?utf-8?B?TnFPNlI3WTJIWDY3Z3FmbGxzaEV4d0d5NUZQMXZ6eVlPMldoTGt5V1JxRFND?=
 =?utf-8?B?cngrWjVyMnlHM0JCODd2NEcrQzQvSGY0MGpLcmt4MHhhdUVjYUJsTFZLMWd1?=
 =?utf-8?B?UUE0SE5vUzJ4Z2xCYVBKRjlmUnJVdWpmeG9KYXQyL05hL3VlejlDcCtqOEZs?=
 =?utf-8?Q?Bexu+yIxL15/EOFY33?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca40570-8371-4156-a8cd-08de5876c54c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 22:53:47.3899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXILLM66E1CHv/8Abfllz2RmjtFFIzoQNLEpp6WjMe7SrJLzVI56rLQVzr+cjrrK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7275
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ziy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16082-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kvack.org,nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:email,nvidia.com:mid]
X-Rspamd-Queue-Id: EDCF54D525
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20 Jan 2026, at 17:33, Jordan Niethe wrote:

> On 14/1/26 07:04, Zi Yan wrote:
>> On 7 Jan 2026, at 4:18, Jordan Niethe wrote:
>>
>>> Currently when creating these device private struct pages, the first
>>> step is to use request_free_mem_region() to get a range of physical
>>> address space large enough to represent the devices memory. This
>>> allocated physical address range is then remapped as device private
>>> memory using memremap_pages().
>>>
>>> Needing allocation of physical address space has some problems:
>>>
>>>    1) There may be insufficient physical address space to represent the
>>>       device memory. KASLR reducing the physical address space and VM
>>>       configurations with limited physical address space increase the
>>>       likelihood of hitting this especially as device memory increases.=
 This
>>>       has been observed to prevent device private from being initialize=
d.
>>>
>>>    2) Attempting to add the device private pages to the linear map at
>>>       addresses beyond the actual physical memory causes issues on
>>>       architectures like aarch64 meaning the feature does not work ther=
e.
>>>
>>> Instead of using the physical address space, introduce a device private
>>> address space and allocate devices regions from there to represent the
>>> device private pages.
>>>
>>> Introduce a new interface memremap_device_private_pagemap() that
>>> allocates a requested amount of device private address space and create=
s
>>> the necessary device private pages.
>>>
>>> To support this new interface, struct dev_pagemap needs some changes:
>>>
>>>    - Add a new dev_pagemap::nr_pages field as an input parameter.
>>>    - Add a new dev_pagemap::pages array to store the device
>>>      private pages.
>>>
>>> When using memremap_device_private_pagemap(), rather then passing in
>>> dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space t=
o
>>> be remapped, dev_pagemap::nr_ranges will always be 1, and the device
>>> private range that is reserved is returned in dev_pagemap::range.
>>>
>>> Forbid calling memremap_pages() with dev_pagemap::ranges::type =3D
>>> MEMORY_DEVICE_PRIVATE.
>>>
>>> Represent this device private address space using a new
>>> device_private_pgmap_tree maple tree. This tree maps a given device
>>> private address to a struct dev_pagemap, where a specific device privat=
e
>>> page may then be looked up in that dev_pagemap::pages array.
>>>
>>> Device private address space can be reclaimed and the assoicated device
>>> private pages freed using the corresponding new
>>> memunmap_device_private_pagemap() interface.
>>>
>>> Because the device private pages now live outside the physical address
>>> space, they no longer have a normal PFN. This means that page_to_pfn(),
>>> et al. are no longer meaningful.
>>>
>>> Introduce helpers:
>>>
>>>    - device_private_page_to_offset()
>>>    - device_private_folio_to_offset()
>>>
>>> to take a given device private page / folio and return its offset withi=
n
>>> the device private address space.
>>>
>>> Update the places where we previously converted a device private page t=
o
>>> a PFN to use these new helpers. When we encounter a device private
>>> offset, instead of looking up its page within the pagemap use
>>> device_private_offset_to_page() instead.
>>>
>>> Update the existing users:
>>>
>>>   - lib/test_hmm.c
>>>   - ppc ultravisor
>>>   - drm/amd/amdkfd
>>>   - gpu/drm/xe
>>>   - gpu/drm/nouveau
>>>
>>> to use the new memremap_device_private_pagemap() interface.
>>>
>>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>>
>>> ---
>>>
>>> NOTE: The updates to the existing drivers have only been compile tested=
.
>>> I'll need some help in testing these drivers.
>>>
>>> v1:
>>> - Include NUMA node paramater for memremap_device_private_pagemap()
>>> - Add devm_memremap_device_private_pagemap() and friends
>>> - Update existing users of memremap_pages():
>>>      - ppc ultravisor
>>>      - drm/amd/amdkfd
>>>      - gpu/drm/xe
>>>      - gpu/drm/nouveau
>>> - Update for HMM huge page support
>>> - Guard device_private_offset_to_page and friends with CONFIG_ZONE_DEVI=
CE
>>>
>>> v2:
>>> - Make sure last member of struct dev_pagemap remains DECLARE_FLEX_ARRA=
Y(struct range, ranges);
>>> ---
>>>   Documentation/mm/hmm.rst                 |  11 +-
>>>   arch/powerpc/kvm/book3s_hv_uvmem.c       |  41 ++---
>>>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  23 +--
>>>   drivers/gpu/drm/nouveau/nouveau_dmem.c   |  35 ++--
>>>   drivers/gpu/drm/xe/xe_svm.c              |  28 +---
>>>   include/linux/hmm.h                      |   3 +
>>>   include/linux/leafops.h                  |  16 +-
>>>   include/linux/memremap.h                 |  64 +++++++-
>>>   include/linux/migrate.h                  |   6 +-
>>>   include/linux/mm.h                       |   2 +
>>>   include/linux/rmap.h                     |   5 +-
>>>   include/linux/swapops.h                  |  10 +-
>>>   lib/test_hmm.c                           |  69 ++++----
>>>   mm/debug.c                               |   9 +-
>>>   mm/memremap.c                            | 193 ++++++++++++++++++----=
-
>>>   mm/mm_init.c                             |   8 +-
>>>   mm/page_vma_mapped.c                     |  19 ++-
>>>   mm/rmap.c                                |  43 +++--
>>>   mm/util.c                                |   5 +-
>>>   19 files changed, 391 insertions(+), 199 deletions(-)
>>>
>> <snip>
>>
>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>> index e65329e1969f..b36599ab41ba 100644
>>> --- a/include/linux/mm.h
>>> +++ b/include/linux/mm.h
>>> @@ -2038,6 +2038,8 @@ static inline unsigned long memdesc_section(memde=
sc_flags_t mdf)
>>>    */
>>>   static inline unsigned long folio_pfn(const struct folio *folio)
>>>   {
>>> +	VM_BUG_ON(folio_is_device_private(folio));
>>
>> Please use VM_WARN_ON instead.
>
> ack.
>
>>
>>> +
>>>   	return page_to_pfn(&folio->page);
>>>   }
>>>
>>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>>> index 57c63b6a8f65..c1561a92864f 100644
>>> --- a/include/linux/rmap.h
>>> +++ b/include/linux/rmap.h
>>> @@ -951,7 +951,7 @@ static inline unsigned long page_vma_walk_pfn(unsig=
ned long pfn)
>>>   static inline unsigned long folio_page_vma_walk_pfn(const struct foli=
o *folio)
>>>   {
>>>   	if (folio_is_device_private(folio))
>>> -		return page_vma_walk_pfn(folio_pfn(folio)) |
>>> +		return page_vma_walk_pfn(device_private_folio_to_offset(folio)) |
>>>   		       PVMW_PFN_DEVICE_PRIVATE;
>>>
>>>   	return page_vma_walk_pfn(folio_pfn(folio));
>>> @@ -959,6 +959,9 @@ static inline unsigned long folio_page_vma_walk_pfn=
(const struct folio *folio)
>>>
>>>   static inline struct page *page_vma_walk_pfn_to_page(unsigned long pv=
mw_pfn)
>>>   {
>>> +	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
>>> +		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>>> +
>>>   	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>>>   }
>>
>> <snip>
>>
>>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>>> index 96c525785d78..141fe5abd33f 100644
>>> --- a/mm/page_vma_mapped.c
>>> +++ b/mm/page_vma_mapped.c
>>> @@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_walk *pv=
mw, pmd_t *pmdvalp,
>>>   static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned lon=
g pte_nr)
>>>   {
>>>   	unsigned long pfn;
>>> +	bool device_private =3D false;
>>>   	pte_t ptent =3D ptep_get(pvmw->pte);
>>>
>>>   	if (pvmw->flags & PVMW_MIGRATION) {
>>> @@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_walk *=
pvmw, unsigned long pte_nr)
>>>   		if (!softleaf_is_migration(entry))
>>>   			return false;
>>>
>>> +		if (softleaf_is_migration_device_private(entry))
>>> +			device_private =3D true;
>>> +
>>>   		pfn =3D softleaf_to_pfn(entry);
>>>   	} else if (pte_present(ptent)) {
>>>   		pfn =3D pte_pfn(ptent);
>>> @@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_walk =
*pvmw, unsigned long pte_nr)
>>>   			return false;
>>>
>>>   		pfn =3D softleaf_to_pfn(entry);
>>> +
>>> +		if (softleaf_is_device_private(entry))
>>> +			device_private =3D true;
>>>   	}
>>>
>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>> +		return false;
>>> +
>>>   	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>   		return false;
>>>   	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
>>> @@ -137,8 +147,11 @@ static bool check_pte(struct page_vma_mapped_walk =
*pvmw, unsigned long pte_nr)
>>>   }
>>>
>>>   /* Returns true if the two ranges overlap.  Careful to not overflow. =
*/
>>> -static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *=
pvmw)
>>> +static bool check_pmd(unsigned long pfn, bool device_private, struct p=
age_vma_mapped_walk *pvmw)
>>>   {
>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>> +		return false;
>>> +
>>>   	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>   		return false;
>>>   	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
>>> @@ -255,6 +268,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_wa=
lk *pvmw)
>>>
>>>   				if (!softleaf_is_migration(entry) ||
>>>   				    !check_pmd(softleaf_to_pfn(entry),
>>> +					       softleaf_is_device_private(entry) ||
>>> +					       softleaf_is_migration_device_private(entry),
>>>   					       pvmw))
>>>   					return not_found(pvmw);
>>>   				return true;
>>> @@ -262,7 +277,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_wa=
lk *pvmw)
>>>   			if (likely(pmd_trans_huge(pmde))) {
>>>   				if (pvmw->flags & PVMW_MIGRATION)
>>>   					return not_found(pvmw);
>>> -				if (!check_pmd(pmd_pfn(pmde), pvmw))
>>> +				if (!check_pmd(pmd_pfn(pmde), false, pvmw))
>>>   					return not_found(pvmw);
>>>   				return true;
>>>   			}
>>
>> It seems to me that you can add a new flag like =E2=80=9Cbool is_device_=
private=E2=80=9D to
>> indicate whether pfn is a device private index instead of pfn without
>> manipulating pvmw->pfn itself.
>
> We could do it like that, however my concern with using a new param was t=
hat
> storing this info seperately might make it easier to misuse a device priv=
ate
> index as a regular pfn.
>
> It seemed like it could be easy to overlook both when creating the pvmw a=
nd
> then when accessing the pfn.

That is why I asked for a helper function like page_vma_walk_pfn(pvmw) to
return the converted pfn instead of pvmw->pfn directly. You can add a comme=
nt
to ask people to use helper function and even mark pvmw->pfn /* do not use
directly */.

In addition, your patch manipulates pfn by left shifting it by 1. Are you s=
ure
there is no weird arch having pfns with bit 63 being 1? Your change could
break it, right?


Best Regards,
Yan, Zi

