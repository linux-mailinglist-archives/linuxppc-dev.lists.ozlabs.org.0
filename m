Return-Path: <linuxppc-dev+bounces-16184-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SM9tB5IJc2mWrwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16184-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 06:39:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FE5707B5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 06:39:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy6F73D4Tz2xJ5;
	Fri, 23 Jan 2026 16:39:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769146763;
	cv=pass; b=N/1IR20kK2XTnSiOMs6sgE6ZFJkBWcOOek77uIIzlxWErB7ArZVDlqBue2nM1vu5DTTWhU3Y6dIM3Ho5CId0QNN1Oucbt1A7cSYcALJUHVuTbDHtdc/NYO6ItEZtKrAbQzq329zKO/NPgy1zWtAqgZiJLZuaFV1KbkJlCEpRE2UGQ8ko7sLFGEvWIcyh5lOaPit/T1dvZVp6Q6DJpDeZNdFRdyMsZiFylSTUCxOqLPZUTVnKq92t205pdn1S96aLIctL7v4AHrWJoS9IaHhCP6KhpivhAY2fNtGkkVFEbtNnAXyhFDlOnQRuyYnVBMhGnyP4kdxZ47mPyEyiDXpdJg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769146763; c=relaxed/relaxed;
	bh=KsxljKAh94X0v4Pcrfc4mtCBLf1ukYCqZJtpZjRN850=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dN884LbMaqxobYPUOqZLsgsu+tlq3jf/RZJwEc2vAo2wJEYNK5kykc1nsiAtnYMqg+bwLs0+t18NKQUDPUBnuT8+Gn/t0mUUsbq/s8OIBO3hwV86NoFPLdvatrKzY/thIxHTPpUVL7683MGibllGo4Bb4XACGq4azTNrnA1W/zp72WkuOjkHP7aV5vYrnqjMPrYqTG/oboQSw6aQDbSrhfVuNGS38tp316w5tHS/nYWRwf/H8zBOQOujE58LihOHHYsXCn1si0ErgIqRA+D+fm/j6a60agK6oTF7dYdGd6ahoRRZOi5HYY7SoJSmF5urwyc4WVD4QWBC00O8O1bcFg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kqanfFcQ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kqanfFcQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy6F54JYhz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 16:39:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4ecgIYAkTOc6wQIh4/fIoqaVGcYIW9pQgYClA+5yFHhpmkPHqFAlsuxaXsCSkbqarX/kFHOi4FTPrfAmGiOijq3uKIJom9W+EN4/B+z/ZaCz9+g8R0PO7r6Kn1CnkCF2kH0UNj+Ia2puxihhtwtJCieSOFKOlYX9+bCEowwWyy9LMKBfzdxRKX8/JSp9diMR+PbtW/d2IIbKxQHNRkNvYDqHl5EMDrmr/eZSk4L3YS0AeYQExHodwVQMTF3wcQ2jQM+MrJppYAipYTA/e/f8rO26OTeJqdPi7g/cxr0Cd7/k6ooSk2ozfwkuagCop1Rt5e76Ed6ivD3EsPDCHEcgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsxljKAh94X0v4Pcrfc4mtCBLf1ukYCqZJtpZjRN850=;
 b=akY3TEfgEkOJmKd+i798CVRGL+qhezpQkGSbf+EceTZJXtfUdmYbxvH5oYxxn8Dbxau0BRCgLdvRa/X3xYZOViY2lVWvKTGmIhn5R8pOhw6P7L5ZDQE3Z7Coxue3sKDWRyjMaZ6VE1Ule83zY8/ijZyJr+IMpJUp7q4OIQ0TR7lf+kQjBQGDstvY3D9WNWbkWNlYlvJtna3WdVHmEUqbSXkZuyrIkkq/qveEFQLov7yZ1RdfQvG3lLULB33A0B930IYC9kaBYPx3UDJJtXR/q719gl0LSaH6/8o+gGoPse4IHyvuear0rcrrSNneHteyhqDN5mdN1OQV2uZHBM5FJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsxljKAh94X0v4Pcrfc4mtCBLf1ukYCqZJtpZjRN850=;
 b=kqanfFcQcmgZg9sqQmY4Ll6DW8nDQOhnNMiG11sYlK/Yr8MUT4URBSA/cKF4LxfRWrWzfPUJZBI9wHmETD7o0oskxiuyDbrJQAZ8EkEhgean5pfgSP3z/NEI9ej+knhIQnlkn4HWq9GLSbTnSw6XeVZQnJkw049wGnYcX3MZT0pUJ2zerTc6pfNZ3q6dQgqjg2qQZe9F7DrdNYZVXmVg/+bSiRX1vuemq070TJbe8Oy3uFwCBCe0QsF2/QCd1+4K/dwcDHfarUFgnY8jfnHbgJHXhN+HYjqZElcGiEDch5zYwWQz4NE3xYZfS7lLuDx/epZwZaUjpjb0u9ALBTFzKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ0PR12MB6831.namprd12.prod.outlook.com (2603:10b6:a03:47d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 05:38:55 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 05:38:54 +0000
Date: Fri, 23 Jan 2026 16:38:49 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org, 
	balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, david@redhat.com, 
	lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, rcampbell@nvidia.com, mpenttil@redhat.com, jgg@nvidia.com, 
	willy@infradead.org, linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, 
	jgg@ziepe.ca, Felix.Kuehling@amd.com
Subject: Re: [PATCH v2 11/11] mm: Remove device private pages from the
 physical address space
Message-ID: <l5jxxobpj6shwuuthsyxlzfnhs6dx4spvzcqxrycn4chtywniq@e2eaio4nhorq>
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107091823.68974-12-jniethe@nvidia.com>
 <36F96303-8FBB-4350-9472-52CC50BAB956@nvidia.com>
 <c9afedc6-f763-410f-b78b-522b98122f06@nvidia.com>
 <6C5F185E-BB12-4B01-8283-F2C956E84AA3@nvidia.com>
 <fd4b6553-3e9e-4829-a12f-51d29a5d7571@nvidia.com>
 <16770FCE-A248-4184-ABFC-94C02C0B30F3@nvidia.com>
 <sezye7d27h7pioazf4k3wfrdbradxovmdqyyp5slhljkmcnxf5@ckj3ujikhsnj>
 <DBBD65CA-A8F2-40AC-AFA0-FC95CBDB3DF5@nvidia.com>
 <0C16A79F-5A7B-4358-9806-7F78E7EA8EE6@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0C16A79F-5A7B-4358-9806-7F78E7EA8EE6@nvidia.com>
X-ClientProxiedBy: SY4P282CA0015.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:a0::25) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ0PR12MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c4d5552-044f-447a-ce5b-08de5a41b237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzJkVks0RFJlc3EyWVlQWUtGODNWNjk5R3cyd09zais3bWQwVFFHNFA1Rmxr?=
 =?utf-8?B?K0tITHZ5d1prYzNYeUcrUi8vK3Z1L3U3Yklld3VHOElqbmMwd0o5SlRvM29a?=
 =?utf-8?B?RTA2WEFKVDBFVTh0NS9HNk1iTFI2VjFmbFh0d0tEeDVwQlVaY0lzcWVSVUxX?=
 =?utf-8?B?QTdDL2dNYmFNSWZnS3R0YzEyTm96NDBRcVU5UVplbUwvQnFSV3hPSXdkS2k2?=
 =?utf-8?B?djRiZDNJejdLLzNZR1daeDgwMXBOSytKS0pkcjZsOHZKRndHT1JIbDlNS05K?=
 =?utf-8?B?dzY0eFp1OHhXZ0tJak9admo1ajZhdHFGNUhaV1JKbWZxMVVGQ29Lc1pNOFZY?=
 =?utf-8?B?TlNIY3dIMjZqNkdRWElqNmxYVGhsUHZEYm9kWkh5SFl6bUxDWm9UVDAzWjZO?=
 =?utf-8?B?OFQ1Ulcvb0kveCtwaFlkSzNNeW9TMnlHRkJid1FHUXgraWxCNjFTZVl6YzJv?=
 =?utf-8?B?bzhjQWN1L0txK2pMdEMrTjV0Z2pDek5Wc3pLdmZlbFZjKzBEbmxLcGpZTXJG?=
 =?utf-8?B?MFFlY1dKNDd6UzVRQ0lUV2lOOFJ1TGoxKzJlTnJmcUZIaVdXYWU4Vm1YMEdI?=
 =?utf-8?B?em03MlpBMjRRcDlvYlFQOWhOcEpLYmRlSEpIWkVpUWdJcWtVdURMOERucnJj?=
 =?utf-8?B?cnFMN0tyQ3NlUCtNNmhXN2NSeDJING05YXVHYlpIMWRKTWd0aUNmd0JLc2tF?=
 =?utf-8?B?WmhQL3c1eVZRWVpmcWRJU3VLMFQ5cURySllqRGRpaWJUcXJGSWc5Y0I3Vnho?=
 =?utf-8?B?dXIrcTVvbk5sSFAwUnFWanVEREdWTlV2Y2szVkVHOGgvNGp1UzcxbmhEa0Qx?=
 =?utf-8?B?UVJmVXJEdTlhZUtlWXZLdWZPL0dETk40bmg5bitGcTJpb1QvYjdDUUJBQjA3?=
 =?utf-8?B?bERNMG9GckRGRzRySmZBSzRoUG9aNHdvR0I5OGU4TThtUkx6YmVqV21meU9P?=
 =?utf-8?B?bVdPUS9DNWp3OEFYNDd6eFVMNzh1eDFtUmNRNTkzZEZPYW9NRFFqU2JmekFr?=
 =?utf-8?B?NklsSU1YZ21Sb2EvUDB0YkdMd3Y2QjZrV3NmcHhrTGhHVG9DMkx5TmdZSmJM?=
 =?utf-8?B?UUlkdVlBVS95YWFWUmgvaUNGc1dYU0MwVWRqZXBVQ3lJQkZIbWx6NmRualJB?=
 =?utf-8?B?WWIyVnkvaHhSbEEzM3Y4dUNodzZNNnRwaXhXN2I1UktIM2lPbkdCdFhtTmJn?=
 =?utf-8?B?Q2Jadi9zUjViU081R1dNR2JtdmZKSWlwYmsvb0paZzdyV2RHTXlBWkp2WUh0?=
 =?utf-8?B?RWk2YWtySmFaWkQ3REFLTWwvWnhWbjlXQTlzZGRETDZVM3NnL0tGNXQ2dm45?=
 =?utf-8?B?SFR5bG9BaDVLN25zTGpUYVlSeFNNVnp5Qm1MajdONG1XTDZrZGFJUGl0blhV?=
 =?utf-8?B?ZEQyZncxSkRpWnZrZFdUSy9Wb2RTalIreDVITWQ5TkljL2RUNlFtOXozalho?=
 =?utf-8?B?dUgvN2p3N25BUDc5cWdPQlE3RENHVGtpSXZxeG5JSVFCbC9sVDU0enR3a0hZ?=
 =?utf-8?B?ZFJOL1c0TWhVcThiamZidUxjdjJzNDU4dzBoc0QxQlcray9WMkpPajVyMDlN?=
 =?utf-8?B?SUJaWlRGY2tiK3RmLzQ4a3lQbWxmdit0VThSM1NBNHp5bzdWUDhmVnNDeklR?=
 =?utf-8?B?TXRkV0hSbkxPZkpMSW9tNnhDWWlMQ0hPaFJ6OVRyWnppSGl0YnZrTXdHRFpL?=
 =?utf-8?B?SDE4WmdrVWRVOFJyb1ZrWElUdEtyTkloM25JTGROWnBydlFXWitNYWJkZ3Zl?=
 =?utf-8?B?QjhVVk1ld3MrWDlDMXQ3QlRyMng5YjZ6WmFDY1l5QmN3Z2s2bFhYM01DaUF1?=
 =?utf-8?B?RDg2cnBuVGx6NFNZTisvQStrWWpkSWxnellEWUJQcmgyUHE5ZHpjRk5HUWNK?=
 =?utf-8?B?amY5YzcrSUVEN2FTZk5qZ2k5TzcyUDlwdno2YWlPT1MvZlJLZkNHQUlqZDRP?=
 =?utf-8?B?SnFJc0tXOEYrazdxY3VaQStaeU9ZdDllSk11OWRUUzFBUkMybXZDZ2RwVkFY?=
 =?utf-8?B?bitibVpCaWJqbWZhM3BsTkY1LzJSQzEzK0pBTzc0SExkM2hSMzd0dEpBWUc1?=
 =?utf-8?B?anNIZTVoKzc4Sm5jZHRSdFdMVzkyZkRjNWxpb0lxdmMxY28vVmprTWgvWi9Y?=
 =?utf-8?Q?A9Bw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnpucWs2RjNzR0o5Y1Vob0RIeGhwQ1pyY04vQVZwWVduTUw2ZXlWNXkza3dY?=
 =?utf-8?B?aWJlTHE1ZUNYSTU1MmwxajBKYWRWSTBqcGdQQXlaVVQzckpLanUvUjQ5SExp?=
 =?utf-8?B?UjlDM01ZaHp4MHErWUlYdCtGY2w3OXg0eEhaM1FmNVFJVmdkMXFrNmxxMmpI?=
 =?utf-8?B?MWxUWi9JTG1LQUlFY1FkM0NOc0ZJTWJBREZQSUhnUnJGRXo2SHlIQUY2ejlr?=
 =?utf-8?B?OVFsZ1lRV01uVmx0YWlLT3BxcHI0Z05RYUV0aUtUNkcwazlsY3NoR2dWUDJR?=
 =?utf-8?B?SGs1dmhYci9BQzRDaUx4OTBLL2gyNWw4bC9qaWtGa0hLcUlJMFRpYkIxcUQ3?=
 =?utf-8?B?ZVZLNW9SMC9XT21UOFpwN3F1KzlzdjhaVm81aEYyUWphRWl2TmdTdjlQVENx?=
 =?utf-8?B?eERUQjEwV2h0Z1Fxb0JXTmR0b0xoMG1wT3U3a2gvbXhuL3NYSE9qcUNtcjVl?=
 =?utf-8?B?N3pYMDZrb0JzRkhSSTdWYW10SWozbEMxdVkyd1lRMWZMejhwY0JqREpWL1M2?=
 =?utf-8?B?MXhJalR0VEhxeTVwSVpKYVRxOHB2emZ1YkVZbmkyTVJWNzljUVV4K1VCQzkx?=
 =?utf-8?B?RE9Wamx2RXdRMHl3MGY0NjVtMEwyUG1TRjdyNzVYb2RZcHZzV09YTWlYWUFq?=
 =?utf-8?B?MVB4SWRuZ0RJemh0OUdlaDJESTUrRG1RRERkU0VjdlVheEt3WTN1SDM5d2k3?=
 =?utf-8?B?ZDNzTkUzRFM2SGQ4N2ZJMkJsWGJyTFVwdE9wNDVENllDUUJFbFE1YjBxRWdn?=
 =?utf-8?B?MlRTV1F6cEZNYk9OSXhHQXJjSGwzYTdoNHNGVTd5VWk0M3dITmVhSDQvYjFK?=
 =?utf-8?B?VU1aQXdSZXIvSlJ2QzdwQkpsdmk4MU82Q3VSNStYVW1Ed3AvdWttZ1Q5eVJk?=
 =?utf-8?B?cytsYVl5YXZDUWIyalZVeitXQTg4elE2UVRTR0xLZHZRSzV2L2lJK0hJS2lT?=
 =?utf-8?B?aW9JaDZSc3ZETWJXOW9tdzZTcDJ5OS9TL3M2SStMS1F4RU1YM1VrR2VRMWJN?=
 =?utf-8?B?eEc4MWw2aWFPQkFCQlhBajROamV1a1lDeTlFZ01nS0VSQmlzWDlLdkpyL2kz?=
 =?utf-8?B?WnNoZXcvSjB2Y0Q4UVQzb0M2bm8yODlNQUpqU1JQdXNoU29ybVgvdDZrcXdC?=
 =?utf-8?B?WXR1WE9Jekx3anR0U0VBOUIraE54Ym1EYzlFY3YycStpc0RPVk0xTExVT1BU?=
 =?utf-8?B?d1JrclZvZEw3ZEVGN0laUWUwWGR4c0N6cVpLbTBDNEpUN3RNbURXNHZWdWVK?=
 =?utf-8?B?WFFvbnlSUnRtUTZ1R012Q1J4MXN2Z2M5QUFUQjlBRWhxempodnZYbTV2dnc4?=
 =?utf-8?B?aXNlL3lsYmpYNkJjTTMyN2NQeW1BanBOT0N1cGpOTWQ4bFRZSmczenlNR1c4?=
 =?utf-8?B?ZXJEL0xna0VFSzB2RnAxaGZ6NzBEbUZUbzI2Sk5uMHczSzVhemsyckVjZGhT?=
 =?utf-8?B?RGJwbXZWenFnazNJa0hpM3NlWnhERUVWcElzOHlHczFmNlRwcnNIdDZFR0VL?=
 =?utf-8?B?WXpMbk5tSzU2NVVhYXNwU1RjZlRLY2FEQWdTYTZxbk5hQzVUd3BXWTVwajY4?=
 =?utf-8?B?OHlwdUhIOFhSd3lrTk1pZ05EeUhaYU0zOVJINk4rdEdOQXRDeGNaMGluT29v?=
 =?utf-8?B?ZjNZaXU2Mzdnb3hIdTJTQ1ArU3ViZThGL2ZwMVRHSXM0aGkvK0plWVFxbUdM?=
 =?utf-8?B?bTFUamRKc3N2WTBHZVBhUEl1dTQ0a2I5aDl3ZGpZYUNSbkhicWpXUmlYS2dk?=
 =?utf-8?B?ZEVZV3A4R3RyQUhUSlpvSDI3U2xHdjBzVkM1RTR1b0h5eFp3am5qa1M4cnY0?=
 =?utf-8?B?dk9OaXAxdnR6ZDkva1hFaExaMVlpeG83dXBTbHcydFNaSC9KRzlQbEdRU3Nj?=
 =?utf-8?B?VHVFbmI2MGFXeUdUNkx1M1hxUzVZWSs1YU9Wdk1ETUxXRlFuYVpSS1dCWW94?=
 =?utf-8?B?LzBZdW9zak1Za28wbkdRenc5OGlxUTRCZjEwOGNXQkkrWERyMXFsclNEU0ZB?=
 =?utf-8?B?N3hibDNsZjNGSlRwaUVFYWQ1b1FXZUg4cThVR01KVERQWGNOWURrbWdhREc1?=
 =?utf-8?B?QlA1RGtGNFJpcXJPcG94Rkd1VmVmRFRDMHpLM2tZdmhwVzVPZzI4S0lnWE1W?=
 =?utf-8?B?c0RIZVQzUlo5NmFxbEJaTTdRWFYvTG9vTTYvSFBleXZxd1pDRUhCNlVjVFQy?=
 =?utf-8?B?RzVtRE9iR1dpeG5uL3BtdHQrMlBGZ2d2RkpLU1EzbmpsRUNkUSsyODZyY0tC?=
 =?utf-8?B?M29oS2pTcWJ4TGg5bXJSYm9VeFVGbmd2K2Y5Z0hrekFPREJNdkkvaGtad2dr?=
 =?utf-8?B?aXNtbmFJNzhYR2REWEZrOVl6aC95R0dBUjhaODhkamZFdWl3dDUxdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4d5552-044f-447a-ce5b-08de5a41b237
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 05:38:54.7305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XQqG2bnwQBsSRj3gB5gosaO4hsYssnG9/gYdJDeRYjZdChtn+FnkIs/gNTuhiTC8slWIA1VmV3MHOp9Mc0DTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6831
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16184-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ziy@nvidia.com,m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[apopple@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,kvack.org,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apopple@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	NEURAL_SPAM(0.00)[0.394];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C5FE5707B5
X-Rspamd-Action: no action

On 2026-01-23 at 14:09 +1100, Zi Yan <ziy@nvidia.com> wrote...
> On 22 Jan 2026, at 22:06, Zi Yan wrote:
> 
> > On 22 Jan 2026, at 21:02, Alistair Popple wrote:
> >
> >> On 2026-01-21 at 10:06 +1100, Zi Yan <ziy@nvidia.com> wrote...
> >>> On 20 Jan 2026, at 18:02, Jordan Niethe wrote:
> >>>
> >>>> Hi,
> >>>>
> >>>> On 21/1/26 09:53, Zi Yan wrote:
> >>>>> On 20 Jan 2026, at 17:33, Jordan Niethe wrote:
> >>>>>
> >>>>>> On 14/1/26 07:04, Zi Yan wrote:
> >>>>>>> On 7 Jan 2026, at 4:18, Jordan Niethe wrote:
> >>>>>>>
> >>>>>>>> Currently when creating these device private struct pages, the first
> >>>>>>>> step is to use request_free_mem_region() to get a range of physical
> >>>>>>>> address space large enough to represent the devices memory. This
> >>>>>>>> allocated physical address range is then remapped as device private
> >>>>>>>> memory using memremap_pages().
> >>>>>>>>
> >>>>>>>> Needing allocation of physical address space has some problems:
> >>>>>>>>
> >>>>>>>>     1) There may be insufficient physical address space to represent the
> >>>>>>>>        device memory. KASLR reducing the physical address space and VM
> >>>>>>>>        configurations with limited physical address space increase the
> >>>>>>>>        likelihood of hitting this especially as device memory increases. This
> >>>>>>>>        has been observed to prevent device private from being initialized.
> >>>>>>>>
> >>>>>>>>     2) Attempting to add the device private pages to the linear map at
> >>>>>>>>        addresses beyond the actual physical memory causes issues on
> >>>>>>>>        architectures like aarch64 meaning the feature does not work there.
> >>>>>>>>
> >>>>>>>> Instead of using the physical address space, introduce a device private
> >>>>>>>> address space and allocate devices regions from there to represent the
> >>>>>>>> device private pages.
> >>>>>>>>
> >>>>>>>> Introduce a new interface memremap_device_private_pagemap() that
> >>>>>>>> allocates a requested amount of device private address space and creates
> >>>>>>>> the necessary device private pages.
> >>>>>>>>
> >>>>>>>> To support this new interface, struct dev_pagemap needs some changes:
> >>>>>>>>
> >>>>>>>>     - Add a new dev_pagemap::nr_pages field as an input parameter.
> >>>>>>>>     - Add a new dev_pagemap::pages array to store the device
> >>>>>>>>       private pages.
> >>>>>>>>
> >>>>>>>> When using memremap_device_private_pagemap(), rather then passing in
> >>>>>>>> dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space to
> >>>>>>>> be remapped, dev_pagemap::nr_ranges will always be 1, and the device
> >>>>>>>> private range that is reserved is returned in dev_pagemap::range.
> >>>>>>>>
> >>>>>>>> Forbid calling memremap_pages() with dev_pagemap::ranges::type =
> >>>>>>>> MEMORY_DEVICE_PRIVATE.
> >>>>>>>>
> >>>>>>>> Represent this device private address space using a new
> >>>>>>>> device_private_pgmap_tree maple tree. This tree maps a given device
> >>>>>>>> private address to a struct dev_pagemap, where a specific device private
> >>>>>>>> page may then be looked up in that dev_pagemap::pages array.
> >>>>>>>>
> >>>>>>>> Device private address space can be reclaimed and the assoicated device
> >>>>>>>> private pages freed using the corresponding new
> >>>>>>>> memunmap_device_private_pagemap() interface.
> >>>>>>>>
> >>>>>>>> Because the device private pages now live outside the physical address
> >>>>>>>> space, they no longer have a normal PFN. This means that page_to_pfn(),
> >>>>>>>> et al. are no longer meaningful.
> >>>>>>>>
> >>>>>>>> Introduce helpers:
> >>>>>>>>
> >>>>>>>>     - device_private_page_to_offset()
> >>>>>>>>     - device_private_folio_to_offset()
> >>>>>>>>
> >>>>>>>> to take a given device private page / folio and return its offset within
> >>>>>>>> the device private address space.
> >>>>>>>>
> >>>>>>>> Update the places where we previously converted a device private page to
> >>>>>>>> a PFN to use these new helpers. When we encounter a device private
> >>>>>>>> offset, instead of looking up its page within the pagemap use
> >>>>>>>> device_private_offset_to_page() instead.
> >>>>>>>>
> >>>>>>>> Update the existing users:
> >>>>>>>>
> >>>>>>>>    - lib/test_hmm.c
> >>>>>>>>    - ppc ultravisor
> >>>>>>>>    - drm/amd/amdkfd
> >>>>>>>>    - gpu/drm/xe
> >>>>>>>>    - gpu/drm/nouveau
> >>>>>>>>
> >>>>>>>> to use the new memremap_device_private_pagemap() interface.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> >>>>>>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >>>>>>>>
> >>>>>>>> ---
> >>>>>>>>
> >>>>>>>> NOTE: The updates to the existing drivers have only been compile tested.
> >>>>>>>> I'll need some help in testing these drivers.
> >>>>>>>>
> >>>>>>>> v1:
> >>>>>>>> - Include NUMA node paramater for memremap_device_private_pagemap()
> >>>>>>>> - Add devm_memremap_device_private_pagemap() and friends
> >>>>>>>> - Update existing users of memremap_pages():
> >>>>>>>>       - ppc ultravisor
> >>>>>>>>       - drm/amd/amdkfd
> >>>>>>>>       - gpu/drm/xe
> >>>>>>>>       - gpu/drm/nouveau
> >>>>>>>> - Update for HMM huge page support
> >>>>>>>> - Guard device_private_offset_to_page and friends with CONFIG_ZONE_DEVICE
> >>>>>>>>
> >>>>>>>> v2:
> >>>>>>>> - Make sure last member of struct dev_pagemap remains DECLARE_FLEX_ARRAY(struct range, ranges);
> >>>>>>>> ---
> >>>>>>>>    Documentation/mm/hmm.rst                 |  11 +-
> >>>>>>>>    arch/powerpc/kvm/book3s_hv_uvmem.c       |  41 ++---
> >>>>>>>>    drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  23 +--
> >>>>>>>>    drivers/gpu/drm/nouveau/nouveau_dmem.c   |  35 ++--
> >>>>>>>>    drivers/gpu/drm/xe/xe_svm.c              |  28 +---
> >>>>>>>>    include/linux/hmm.h                      |   3 +
> >>>>>>>>    include/linux/leafops.h                  |  16 +-
> >>>>>>>>    include/linux/memremap.h                 |  64 +++++++-
> >>>>>>>>    include/linux/migrate.h                  |   6 +-
> >>>>>>>>    include/linux/mm.h                       |   2 +
> >>>>>>>>    include/linux/rmap.h                     |   5 +-
> >>>>>>>>    include/linux/swapops.h                  |  10 +-
> >>>>>>>>    lib/test_hmm.c                           |  69 ++++----
> >>>>>>>>    mm/debug.c                               |   9 +-
> >>>>>>>>    mm/memremap.c                            | 193 ++++++++++++++++++-----
> >>>>>>>>    mm/mm_init.c                             |   8 +-
> >>>>>>>>    mm/page_vma_mapped.c                     |  19 ++-
> >>>>>>>>    mm/rmap.c                                |  43 +++--
> >>>>>>>>    mm/util.c                                |   5 +-
> >>>>>>>>    19 files changed, 391 insertions(+), 199 deletions(-)
> >>>>>>>>
> >>>>>>> <snip>
> >>>>>>>
> >>>>>>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
> >>>>>>>> index e65329e1969f..b36599ab41ba 100644
> >>>>>>>> --- a/include/linux/mm.h
> >>>>>>>> +++ b/include/linux/mm.h
> >>>>>>>> @@ -2038,6 +2038,8 @@ static inline unsigned long memdesc_section(memdesc_flags_t mdf)
> >>>>>>>>     */
> >>>>>>>>    static inline unsigned long folio_pfn(const struct folio *folio)
> >>>>>>>>    {
> >>>>>>>> +	VM_BUG_ON(folio_is_device_private(folio));
> >>>>>>>
> >>>>>>> Please use VM_WARN_ON instead.
> >>>>>>
> >>>>>> ack.
> >>>>>>
> >>>>>>>
> >>>>>>>> +
> >>>>>>>>    	return page_to_pfn(&folio->page);
> >>>>>>>>    }
> >>>>>>>>
> >>>>>>>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> >>>>>>>> index 57c63b6a8f65..c1561a92864f 100644
> >>>>>>>> --- a/include/linux/rmap.h
> >>>>>>>> +++ b/include/linux/rmap.h
> >>>>>>>> @@ -951,7 +951,7 @@ static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
> >>>>>>>>    static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
> >>>>>>>>    {
> >>>>>>>>    	if (folio_is_device_private(folio))
> >>>>>>>> -		return page_vma_walk_pfn(folio_pfn(folio)) |
> >>>>>>>> +		return page_vma_walk_pfn(device_private_folio_to_offset(folio)) |
> >>>>>>>>    		       PVMW_PFN_DEVICE_PRIVATE;
> >>>>>>>>
> >>>>>>>>    	return page_vma_walk_pfn(folio_pfn(folio));
> >>>>>>>> @@ -959,6 +959,9 @@ static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
> >>>>>>>>
> >>>>>>>>    static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
> >>>>>>>>    {
> >>>>>>>> +	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
> >>>>>>>> +		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
> >>>>>>>> +
> >>>>>>>>    	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
> >>>>>>>>    }
> >>>>>>>
> >>>>>>> <snip>
> >>>>>>>
> >>>>>>>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> >>>>>>>> index 96c525785d78..141fe5abd33f 100644
> >>>>>>>> --- a/mm/page_vma_mapped.c
> >>>>>>>> +++ b/mm/page_vma_mapped.c
> >>>>>>>> @@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
> >>>>>>>>    static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
> >>>>>>>>    {
> >>>>>>>>    	unsigned long pfn;
> >>>>>>>> +	bool device_private = false;
> >>>>>>>>    	pte_t ptent = ptep_get(pvmw->pte);
> >>>>>>>>
> >>>>>>>>    	if (pvmw->flags & PVMW_MIGRATION) {
> >>>>>>>> @@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
> >>>>>>>>    		if (!softleaf_is_migration(entry))
> >>>>>>>>    			return false;
> >>>>>>>>
> >>>>>>>> +		if (softleaf_is_migration_device_private(entry))
> >>>>>>>> +			device_private = true;
> >>>>>>>> +
> >>>>>>>>    		pfn = softleaf_to_pfn(entry);
> >>>>>>>>    	} else if (pte_present(ptent)) {
> >>>>>>>>    		pfn = pte_pfn(ptent);
> >>>>>>>> @@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
> >>>>>>>>    			return false;
> >>>>>>>>
> >>>>>>>>    		pfn = softleaf_to_pfn(entry);
> >>>>>>>> +
> >>>>>>>> +		if (softleaf_is_device_private(entry))
> >>>>>>>> +			device_private = true;
> >>>>>>>>    	}
> >>>>>>>>
> >>>>>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
> >>>>>>>> +		return false;
> >>>>>>>> +
> >>>>>>>>    	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
> >>>>>>>>    		return false;
> >>>>>>>>    	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
> >>>>>>>> @@ -137,8 +147,11 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
> >>>>>>>>    }
> >>>>>>>>
> >>>>>>>>    /* Returns true if the two ranges overlap.  Careful to not overflow. */
> >>>>>>>> -static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
> >>>>>>>> +static bool check_pmd(unsigned long pfn, bool device_private, struct page_vma_mapped_walk *pvmw)
> >>>>>>>>    {
> >>>>>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
> >>>>>>>> +		return false;
> >>>>>>>> +
> >>>>>>>>    	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
> >>>>>>>>    		return false;
> >>>>>>>>    	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
> >>>>>>>> @@ -255,6 +268,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
> >>>>>>>>
> >>>>>>>>    				if (!softleaf_is_migration(entry) ||
> >>>>>>>>    				    !check_pmd(softleaf_to_pfn(entry),
> >>>>>>>> +					       softleaf_is_device_private(entry) ||
> >>>>>>>> +					       softleaf_is_migration_device_private(entry),
> >>>>>>>>    					       pvmw))
> >>>>>>>>    					return not_found(pvmw);
> >>>>>>>>    				return true;
> >>>>>>>> @@ -262,7 +277,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
> >>>>>>>>    			if (likely(pmd_trans_huge(pmde))) {
> >>>>>>>>    				if (pvmw->flags & PVMW_MIGRATION)
> >>>>>>>>    					return not_found(pvmw);
> >>>>>>>> -				if (!check_pmd(pmd_pfn(pmde), pvmw))
> >>>>>>>> +				if (!check_pmd(pmd_pfn(pmde), false, pvmw))
> >>>>>>>>    					return not_found(pvmw);
> >>>>>>>>    				return true;
> >>>>>>>>    			}
> >>>>>>>
> >>>>>>> It seems to me that you can add a new flag like “bool is_device_private” to
> >>>>>>> indicate whether pfn is a device private index instead of pfn without
> >>>>>>> manipulating pvmw->pfn itself.
> >>>>>>
> >>>>>> We could do it like that, however my concern with using a new param was that
> >>>>>> storing this info seperately might make it easier to misuse a device private
> >>>>>> index as a regular pfn.
> >>>>>>
> >>>>>> It seemed like it could be easy to overlook both when creating the pvmw and
> >>>>>> then when accessing the pfn.
> >>>>>
> >>>>> That is why I asked for a helper function like page_vma_walk_pfn(pvmw) to
> >>>>> return the converted pfn instead of pvmw->pfn directly. You can add a comment
> >>>>> to ask people to use helper function and even mark pvmw->pfn /* do not use
> >>>>> directly */.
> >>>>
> >>>> Yeah I agree that is a good idea.
> >>>>
> >>>>>
> >>>>> In addition, your patch manipulates pfn by left shifting it by 1. Are you sure
> >>>>> there is no weird arch having pfns with bit 63 being 1? Your change could
> >>>>> break it, right?
> >>>>
> >>>> Currently for migrate pfns we left shift by pfns by MIGRATE_PFN_SHIFT (6), so I
> >>>> thought doing something similiar here should be safe.
> >>>
> >>> Yeah, but that limits to archs supporting HMM. page_vma_mapped_walk is used
> >>> by almost every arch, so it has a broader impact.
> >>
> >> We need to be a bit careful by what we mean when we say "HMM" in the kernel.
> >>
> >> Specifically MIGRATE_PFN_SHIFT is used with migrate_vma/migrate_device, which
> >> is the migration half of "HMM" which does depend on CONFIG_DEVICE_MIGRATION or
> >> really just CONFIG_ZONE_DEVICE making it somewhat arch specific.
> >>
> >> However hmm_range_fault() does something similar - see the definition of
> >> hmm_pfn_flags - it actually steals the top 11 bits of a pfn for flags, and it is
> >> not architecture specific. It only depends on CONFIG_MMU.
> >
> > Oh, that is hacky. But are HMM PFNs with any flag exposed to code outside HMM?
> > Currently, device private needs to reserve PFNs for struct page, so I assume
> > only the reserved PFNs are seen by outsiders. Otherwise, when outsiders see
> > a HMM PFN with a flag, pfn_to_page() on such a PFN will read non exist
> > struct page, right?

Any user of hmm_range_fault() would be exposed to an issue - most users of
hmm_range_fault() use it to grab a PFN (ie. physical address) to map into some
remote page table. So potentially if some important bit in the PFN is dropped
that could potentially result in users mapping the wrong physical address or
page.

And just to be clear this is completely orthogonal to any DEVICE_PRIVATE
specific issue - it existed well before any changes here. Of course it may not
actually be an issue - do we know if there are any architectures that actually
use upper physical address bits? I assume not because how would they fit in a
page table entry. But I don't really know.

> > For this page_vma_mapped_walk code, it is manipulating PFNs used by everyone,
> > not just HMM, and can potentially (might be very rare) alter their values
> > after shifts.
> 
> 
> > And if an HMM PFN with HMM_PFN_VALID is processed by the code,
> > the HMM PFN will lose HMM_PFN_VALID bit. So I guess HMM PFN is not showing
> > outside HMM code.
> 
> Oops, this code is removing PFN reservation mechanism, so please ignore
> the above two sentences.
> 
> >
> >>
> >> Now I'm not saying this implies it actually works on all architectures as I
> >> agree the page_vma_mapped_walk code is used much more widely. Rather I'm just
> >> pointing out if there are issues with some architectures using high PFN bits
> >> then we likely have a problem here too :-)
> >
> >
> > Best Regards,
> > Yan, Zi
> 
> 
> Best Regards,
> Yan, Zi

