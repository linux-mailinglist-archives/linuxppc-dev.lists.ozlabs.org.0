Return-Path: <linuxppc-dev+bounces-3255-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D332E9CF5BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2024 21:20:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqpLF5qpZz2ysZ;
	Sat, 16 Nov 2024 07:20:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::60b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731702037;
	cv=pass; b=jSnRRtq5kSkArl7X7B7ly197Pe/8ojTouCP+6y5E2vJeySW+ol8qOXcOh5OpWIAjrjpXTNQmeOD5t2PytL+AOafXmb3WGmWgQqZ5QGyXeqHo/fmab1ftIP5mjfFR7XNRCZ+ZcPnfpJLiCQFbM1VUQwrioH4h7TtuZP6ZRFFu8HX55rBQNpEPrk66vSbdGiMOcEoWTJi5LXlr66fVhoI6LK0y5HND0wPiU85v8pEqqn6dGEdlJrdNZF8Su0UdWrIC2M36R5JyS/V2olbgWvT+0Akh2et7zjCBxQdKHJhl9Uq9/Ob9wGkTMDp6eip+bAAkalZI2eObM0Za7ARixaG2DA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731702037; c=relaxed/relaxed;
	bh=bB08YCh3+9DROHQPaAXsRlnA3MHhfKmvhsmvUhy14y8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fvse/XChz5aRd8sjPn1cR6v+7IX3q4S55RzpJ8nWh16PcksC0ILZNOyNkhYS2i/zr7FBAQTfzAG6Qg7ln605yhjbNY4G6lDN6ELbShZmuISsuOI+FS9Ed6GuZ7vamNhTbAP9oeuD49NuJN6+y7LdTsyezSZVPipG9wxb2r0MqhAzIIzlvuifFcvugJaKmKpKIzZ3OkuszpL2SOmmt54JoLy3YWm96HIpnTmXAVVLGVJkzXLRPcl7WRvbBk92mXorucFDbId1Uz8GNTRy6kKFuFVAJC+MZ7tYivPpUPP15JSg1/SuHc+gbYbNzKS4qr/aTmoFef/qoYYLjz5qUI9Nng==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EBqg/FG4; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::60b; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=terry.bowman@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EBqg/FG4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:200a::60b; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=terry.bowman@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::60b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XqpLC4wXjz2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 07:20:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIV1o5gGwfnBWqOcHLK+FGYo+HpRxG1yxMvaVriR1wFmyMQO0e98hpH7OfMxr0UibIXKJMaxi3G+k2wIld+iFK+tJ/AAeriZVq9JB1FRfdWjTbv1J8IT1u50i5qvMz4EdMiSzsIOtXI35hnDj6s8nssigacUPbk0ehn6ZoxKUIVdM1/SRS+AirZ0dsja7RbdOhzqfuAFObpuEbYp3eOdQYHNbLRza1+154RmG4Vnvz4585NZpUw6A4kuAH1qWa+nUNm/YywHkEf5BI8TH1M76jyLYHnetJct3O0NUWCyMqSWm7fF6fCLDeUrw5dtbZqwwTEu/DxxtjN00CSQWnRN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bB08YCh3+9DROHQPaAXsRlnA3MHhfKmvhsmvUhy14y8=;
 b=kuFYcQN3lfy4AkKVbnNn2oojZFUuki+Kn/rp0rzuenilBKM3tD8dHFxCkygCvz4hPfKci7ADhAogDt2nwIwct2e+6RfQftMwOFSnNVW2m2DZzOcLFssZ+SZzNTCa4Rvyg5ww7XrJUayCxjdIF0rdnWGb5pwR3pE36csTvfunthxLU4g0xwDiNoM8Wz80HwwDZq7qeCaZL7WP6sxkvxSa5upSZL2VxR9Y6I5cVbcQyVWzb+2/oU9vQe6Cw56vbSDPB/4eriJtMmKtwkv2EZWyRVre6O3gEQlRJ/Mdw5qWNPWkU1W5q963vUoZtxf8dXlJ4Brl4Pi1/5u8m0VXt7b/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bB08YCh3+9DROHQPaAXsRlnA3MHhfKmvhsmvUhy14y8=;
 b=EBqg/FG4DzhPOHJq346/bF8Ls+uLaP9mVPzwN2ZfU3ht7VP/zMIQKIpMJRdROc/5j9Wh5Xb1DV1jycRA8UYcoAxiBu/VDD25s+Qyw5fBZkQBJq6gyU9lleDDM8oqwM5+I4MU4dyptVL/Ll0TnQbmyXJR4oDIwhzbASlkyuTvnQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) by
 MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.18; Fri, 15 Nov 2024 20:20:12 +0000
Received: from DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::38ec:7496:1a35:599f]) by DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::38ec:7496:1a35:599f%3]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 20:20:12 +0000
Message-ID: <a76394c4-8746-46c0-9cb5-bf0e2e0aa9b5@amd.com>
Date: Fri, 15 Nov 2024 14:20:09 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
To: Shuai Xue <xueshuai@linux.alibaba.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bhelgaas@google.com, kbusch@kernel.org, Lukas Wunner <lukas@wunner.de>
Cc: mahesh@linux.ibm.com, oohall@gmail.com,
 sathyanarayanan.kuppuswamy@linux.intel.com
References: <20241112135419.59491-1-xueshuai@linux.alibaba.com>
 <20241112135419.59491-3-xueshuai@linux.alibaba.com>
Content-Language: en-US
From: "Bowman, Terry" <terry.bowman@amd.com>
In-Reply-To: <20241112135419.59491-3-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0077.namprd12.prod.outlook.com
 (2603:10b6:802:20::48) To DS0PR12MB6390.namprd12.prod.outlook.com
 (2603:10b6:8:ce::7)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6390:EE_|MW6PR12MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b9330d-60ab-4cf7-a523-08dd05b2e880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWF0VFFZa1l2eEtnYldEUmJKSFJhUm9tL1ZHMStWUytyZXNvTkNzWWhlQVJC?=
 =?utf-8?B?bHVzeUZ6aXdGdHU2bjRMM2JLZXkyL3hCZVVBeXhvT3pHVlBMcjk1OU9FSEJJ?=
 =?utf-8?B?WTVrZlVYWlFub3Z4eDVYRUhIQXdQY1lCM3g1VVFHVWtURDdxTndoYlJIa0Ns?=
 =?utf-8?B?VTZYQ0lVb0cxdVZWS2RnWVNUcTFMTlJkQzZCQWdBSld3anNLWnZsRytCWk02?=
 =?utf-8?B?ZVVVaVBqTEJNNkk0NGZ1V1lUMXk3clN0bExqeTdZU0Q4VU9ocmhWdmUxT1di?=
 =?utf-8?B?VU1EeHJzb3YxQXJ4U3JJNnNrZ2FLT3I5UTFLNk1EcnVldUUxaWVYVk9MejJS?=
 =?utf-8?B?TFB1QkVtS3p2cnlrYmozUE1CQjZaWUI4VUd4cDUwRWJMdkxxVmFHamZhbXQz?=
 =?utf-8?B?MnlXMzZyYThBbHVXZGpKN1Q0azlMaktYRXQzeEdHU2tuZWI2VVdYaE9sSWZF?=
 =?utf-8?B?Q0xuSlQ4TXpvWVV3SlMwTTRhVUFxU1FwaGFWNEIvMmZSWXJwQVB6S054WFNL?=
 =?utf-8?B?TnZRcmFnZi9RTkQ5NGZHYVFwcEprSVdhcVloWkJ4NE1tZGtseSt1ZHdMaWZQ?=
 =?utf-8?B?Z1BSWVVGUFRNK2haWTd6Uzl4elZpbmpjbHJoaDFNdW11QlVzTmZWZE5FYmRs?=
 =?utf-8?B?aWk0R1pRZ0xYdnczMlVTQjdqeWp0RFR5Q2hrSkkyK0g4d2dvQ2sxcm5NRGlw?=
 =?utf-8?B?eW9CVjg5cW50QWJpY0xnWGlPTWlSQng2NE9wVTdSR2FsR2ZqVStnOUk5VzEr?=
 =?utf-8?B?UENFZzVwaitFcFhlc0lLZHlVSysyWFFHNnRmeGVySU5ZZkVNSnYvSmdRaGNx?=
 =?utf-8?B?RzlMRysvNjNMc3J5SUhkaXNJTWZIaVBWaHNQeVJjQThXdEV5VTU2N2VxNStn?=
 =?utf-8?B?MUxuU1BncVZOaGlpa0Z4cm4xV0NuK2FlSVl3b0o3b1lpOFplRlI4Nm1EOS9Y?=
 =?utf-8?B?WjdNb2F3T0doelhBWlQ4a2VqU2hyYUdLRllEMkpWdS85NTdXVjhsSUJFc3hR?=
 =?utf-8?B?MlJ5QVhva3lKU0w4dGNUNlBaT2hUMGJQV2gxNFhBenNEQVFGaGhhZ244UFVl?=
 =?utf-8?B?b3E2N2hDN2FlQ3RWanJqUjQyRjBpZzFCSmEyNUJ0MGJIMzU1YlpHd3cxSzhQ?=
 =?utf-8?B?N1BqOFhuTVdDcnRGeVpxY0hiTVoyQXM5VEFsTThGcGQ1cURHaXhBcENVRG5I?=
 =?utf-8?B?eEhUQld3dFNpUVlJV1Vzb3l2cFlOZ29hOWNMcGZNVXJGSFBuU09NQVVvZVVi?=
 =?utf-8?B?eHlCeDdPanFwdTBmSmNIRmRsU3V6MFRFT3EyTUhRemYrQzQwVjZWaFhINi9l?=
 =?utf-8?B?eG5jK0VSUUVSTUpxZ2w3Mjd4NVRhNytoT3JHajA2Wk14WllSbnowRDVNY0Nz?=
 =?utf-8?B?S0tRYmFTb3VFQWNGbE51QzI3SXE1MWhlNGE4TTBRVmI4cUdNUWt0eVA0d3By?=
 =?utf-8?B?dnRhdnVCK3d2Zlp2dC90VkJBYThyRWIxT0xyQUlzSjhQQThlcDdWZGNJLzd3?=
 =?utf-8?B?SzZvUmRZVEtIa2thLzF1U0RRdmpxekVDaFVYbXpmZmQzaFl0cXhxcW5xREVT?=
 =?utf-8?B?Rm5UblIzSVEwMk0wcTVFNXpTYVBrYlNtQU9JWERvbkZSelI4dUhiRDVsYTZE?=
 =?utf-8?B?d0dlandrRWFEa1NvYW9pY2kyOXA2YmxaZnpsV09QTHhVZWViVHVEV1EzVHNw?=
 =?utf-8?B?ME5XM3lHSVo2YWtOYm5TTXMrQkpBcGtVWkY5dkFPaWh5Nit3TEYyZGNocjhP?=
 =?utf-8?Q?zILItrsIE4OtGsg5oHiTdmjq79wJSc/bf1txrus?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFhpR2UzMVZkQmE1ZDJUZm90UWJiUG00MTZnbkNLU1NCZUpFN2h5bUZFTzd1?=
 =?utf-8?B?SktEUW5ibG9OR3I4MlZZR0FFQkVzbXZRU2tlaE9PM2EyTmVBQUhCS3N4NW5Q?=
 =?utf-8?B?SndzT2lrMUoybjJ1cDRrUmtBdGNRNnZxSXFHTUo0eUFFSzdzYUdJZThiaHNB?=
 =?utf-8?B?WHAra3FGbEhUNmdXNEIzN1Z3cUFON05Lb2RqYyttdjF6TTJOLzFjdjZJRWZN?=
 =?utf-8?B?bndhNldralZXTm9NU0o2ckE4K0YvTFVDaVVlM1I4d3YwZEkyNmN6cHlrWkdx?=
 =?utf-8?B?enpEdHNOMEcxMDhUeHEycDdZb2M0eEpleWRXaDNHb0tyeWV1OVdmV2YyeGhQ?=
 =?utf-8?B?QjBWSm5QM3BKVTFLMlREbVcyeFh0cDVIb08xYkNxRnZqdUFnT3Q5SUlUUUwz?=
 =?utf-8?B?MnFkYlBEWEYydTlNSWxrc3VlbGxkOTJDRXlUZUlLaTgxOTVnSHU1cC8yRTNr?=
 =?utf-8?B?RWtCVytRbGlPRjVwRFBOYmJLWUR1YmkxVTVvTWh6ZkZBSXRTUE11SG9PZWcy?=
 =?utf-8?B?Qk5hOHl4aUJwNHZVMnpjejdBTDA5Mk14N014L2RkTHJDUHRHMmM3MzdESWkw?=
 =?utf-8?B?aXRqc29MclRMOWl6KzlVUzZGcjMyYytyQ2VWTERsQlZrcTRYVXVqL3d6eUJD?=
 =?utf-8?B?R25ra2w3RmdxVjUrdzltVGRwN3Q0VUtUWXZIVFdQS3BPaUE2N3E2RUIvcnNJ?=
 =?utf-8?B?Y0tia2E4VGUwblprY0hKRlRFdXljTmJhZUFUaFZvdktzeTBHZk51TzZVOEZ1?=
 =?utf-8?B?ZUU2N3NFUzJGWjFhbkhkM3hIak9wU3JGdis2VVhkNVFDMlZ1QlFRQmdGbkQw?=
 =?utf-8?B?NFByc0tzOU10T2E0c3NYeEVNVXJpRC9HbnBKclhHZ0VEMkJSRTI0d2EzUmxW?=
 =?utf-8?B?RmVJTkpVTEdUTjdJK1pMWG92WGFZUUpONUE5NEFBWjhyNm5VQXF2anp0VGR2?=
 =?utf-8?B?UTFPbU94UDNTTEpvbWk2TDZIcW5sRDVsSU1wOXBreWJCZWE3S3N4dTA5eHN3?=
 =?utf-8?B?ajh4TzZnMXZhLzlXVExzNWlRVTZ0MXp3ZDA1RzNKQWlJL2dUSG5Sc1lYaVc0?=
 =?utf-8?B?VnRTdUJ4UUNoVjRXTDFzMGJ6VVkvazRRaVBXRFA1eXZFRVl5V2JoQS9HaEx2?=
 =?utf-8?B?ZTkxZldZaXRMYXdDYmNLYU5hVU9lWXBidTl0c2ViM0NXd1h4SEcxOTFKeU1E?=
 =?utf-8?B?dHJsemZ3ODlPdmlIYTAyVWxkNXBWVmpyWE50NWZiOEhuaUZ1VGV4cGhSaU9H?=
 =?utf-8?B?c0tVeDRRQklPeXBsWG9SZkpMWjhRazhsbmxhUHlBcnFjTkx4aDEySndZOXZC?=
 =?utf-8?B?aDJnNVJUczJ5N0JtQXNScXRYaHBZWGFqZzhhOE1vcW53MDVpV0Znd3BCMmdr?=
 =?utf-8?B?YTcrN3Vyd1pMNWVjYnNZZUJaVDllbWZUelhPZDR3N25Gc1orcFhhS25lclJx?=
 =?utf-8?B?Y01WemtEUjVZS0tPeHVEbUJUSUdvd3NORkIyM2ViSDNCdXlGdE5EQXFHTm9Y?=
 =?utf-8?B?TjluQys1V25oZk9LQ2dxU0szeTlkUUdhWnlmd1B4bWp6dC9pdEJsK2libXlB?=
 =?utf-8?B?NEhPSk9vK2NIUzhSS3hFc1lvZGZFSVRKdjVKWG9XRFZFeHduU1lLQ0t4bDFz?=
 =?utf-8?B?TmdwSVVWc0JGeTRleEd6bU11TXMya2J1V05TZ3VMcUxLWTdLSTZoeHdMYXpU?=
 =?utf-8?B?NitQVlowSnJ5eUZBSjBZRTkxNHZYQjlhRW5DZFpxdW5QdmRaWVVWNS81SXM2?=
 =?utf-8?B?TFBXL3JFVFE2UGZYaEd3VXhTeCthdFZVT3kyUCtQTkQ1d25Pc1RiS1NpUWRP?=
 =?utf-8?B?c2lralphdEV5Q0hrREl6dVhDY0ZDRzFQNVJrajVTN2xPL08vbGhKSWtKZ1hI?=
 =?utf-8?B?S0orUldscmhHY1UwUkV2NVA5UTdDeVNxTEl5cENRaTBqN1ljdnNsOTBrWGVG?=
 =?utf-8?B?eW4zWERZSEJCYWtlWEN4SGFlU3hGS2w2MmJIWGE2MzdMM2lDdXNsTHhqUnBp?=
 =?utf-8?B?S2V5RGd2a3l1OGVzdnBFbFNVRnRDczZtOVVYdm1RdW9GZU5JZGlSV01EQ2Zm?=
 =?utf-8?B?cWp2bFIyRDNOaklWRmFHWk9YSURXWVlVY25YMXhPNEZURUhkdWhScEV2M2g4?=
 =?utf-8?Q?TpTSzf7CcOtY2/Cy9zFGfkydk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b9330d-60ab-4cf7-a523-08dd05b2e880
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 20:20:12.2080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxwY2FMe3kX+DH6AdosUa5/cAoliMWGAIudufyyvAJU4/2moPSFhNKSMxdQsMB6faFKU4QV8sKqD/besl7AXMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8733
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Shuai,


On 11/12/2024 7:54 AM, Shuai Xue wrote:
> The AER driver has historically avoided reading the configuration space of
> an endpoint or RCiEP that reported a fatal error, considering the link to
> that device unreliable. Consequently, when a fatal error occurs, the AER
> and DPC drivers do not report specific error types, resulting in logs like:
> 
>   pcieport 0000:30:03.0: EDR: EDR event received
>   pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>   pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>   pcieport 0000:30:03.0: AER: broadcast error_detected message
>   nvme nvme0: frozen state error detected, reset controller
>   nvme 0000:34:00.0: ready 0ms after DPC
>   pcieport 0000:30:03.0: AER: broadcast slot_reset message
> 
> AER status registers are sticky and Write-1-to-clear. If the link recovered
> after hot reset, we can still safely access AER status of the error device.
> In such case, report fatal errors which helps to figure out the error root
> case.
> 
> After this patch, the logs like:
> 
>   pcieport 0000:30:03.0: EDR: EDR event received
>   pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>   pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>   pcieport 0000:30:03.0: AER: broadcast error_detected message
>   nvme nvme0: frozen state error detected, reset controller
>   pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
>   nvme 0000:34:00.0: ready 0ms after DPC
>   nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
>   nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
>   nvme 0000:34:00.0:    [ 4] DLP                    (First)
>   pcieport 0000:30:03.0: AER: broadcast slot_reset message
> 
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---
>  drivers/pci/pci.h      |  3 ++-
>  drivers/pci/pcie/aer.c | 11 +++++++----
>  drivers/pci/pcie/dpc.c |  2 +-
>  drivers/pci/pcie/err.c |  9 +++++++++
>  4 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 0866f79aec54..6f827c313639 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -504,7 +504,8 @@ struct aer_err_info {
>  	struct pcie_tlp_log tlp;	/* TLP Header */
>  };
>  
> -int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
> +int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info,
> +			      bool link_healthy);
>  void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
>  #endif	/* CONFIG_PCIEAER */
>  
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 13b8586924ea..97ec1c17b6f4 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1200,12 +1200,14 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
>   * aer_get_device_error_info - read error status from dev and store it to info
>   * @dev: pointer to the device expected to have a error record
>   * @info: pointer to structure to store the error record
> + * @link_healthy: link is healthy or not
>   *
>   * Return 1 on success, 0 on error.
>   *
>   * Note that @info is reused among all error devices. Clear fields properly.
>   */
> -int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
> +int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info,
> +			      bool link_healthy)
>  {
>  	int type = pci_pcie_type(dev);
>  	int aer = dev->aer_cap;
> @@ -1229,7 +1231,8 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
>  	} else if (type == PCI_EXP_TYPE_ROOT_PORT ||
>  		   type == PCI_EXP_TYPE_RC_EC ||
>  		   type == PCI_EXP_TYPE_DOWNSTREAM ||
> -		   info->severity == AER_NONFATAL) {
> +		   info->severity == AER_NONFATAL ||
> +		   (info->severity == AER_FATAL && link_healthy)) {
>  
>  		/* Link is still healthy for IO reads */
>  		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
> @@ -1258,11 +1261,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
>  
>  	/* Report all before handle them, not to lost records by reset etc. */
>  	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
> -		if (aer_get_device_error_info(e_info->dev[i], e_info))
> +		if (aer_get_device_error_info(e_info->dev[i], e_info, false))
>  			aer_print_error(e_info->dev[i], e_info);
>  	}

Would it be reasonable to detect if the link is intact and set the aer_get_device_error_info()
function's 'link_healthy' parameter accordingly? I was thinking the port upstream capability 
link status register could be used to indicate the link viability.

Regards,
Terry

