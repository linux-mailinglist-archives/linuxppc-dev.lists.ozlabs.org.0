Return-Path: <linuxppc-dev+bounces-16344-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIKUNB+aeWkNxwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16344-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 06:09:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB419D2A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 06:09:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f19Lh4ncKz30M6;
	Wed, 28 Jan 2026 16:09:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c100::f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769576988;
	cv=pass; b=I3sOizVPMSZELG5C7D13lkzWItzCTRCiMu1WeCrcKj+L7byPiV6goP/JlYnBYKb743eEpAbmxjAACViyOCe20mdH49Ah0glOX4H/nns21cFqpCL40gKhGLbPhUfPxS1yfMggi1zFWT1F/9eB8y7TuwVaElbLTEmK+TTUtULZ2nJz2DAET92JH2CE1ao9L6nSkA4rCQZRwv1KGHplpigJRDUXFmZoqdOZxRFGLegxzhj3beZJCu735xJrA0UQTvROMTzmBWgGsB2jgg8qG4CIxQ5rwhoulQAjojvCJTqfmZtc8ZfRqpoRoW+c+/WLWhJx+mAM3eS+zmpmnoXtmCnsaA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769576988; c=relaxed/relaxed;
	bh=OA7IFCsglmmczObmfcYhr+aM5USQ0fU1uWHF3aMmT6E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gj3IZcAhfK3pWjiemMqmFbf2uZr4Kg6biO5M3eCVAJFGKZcyiiSqttv0v4f3wRKngzk1e0eg1J1SRj3K6/Wgh6ZFOI+KA5xy29VhJClAyi739pOOHDYfCYj+OsB9jk9Yvc+Zh2zXmAFJcCX3jdO32FKXDdXBAfPYBylpFrsce/IjZWoEke5gRC0Qz9z3BY2qs9zjXdLDaQHGJxWyhqyTtHXQika63Vrk9EoBgCP0BW6RQ0K+D1h14Xe3/TsJfHDJsEC21QSPxKQgatxECI3QJ8eJeuPDUhtIY785MAw2BHb4N3F7AJcOjQeMPuuuiJd5rVEzOqX01EqZeaYNF9nSjg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bU6hrTmH; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=felix.kuehling@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bU6hrTmH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=felix.kuehling@amd.com; receiver=lists.ozlabs.org)
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazlp17011000f.outbound.protection.outlook.com [IPv6:2a01:111:f403:c100::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f19Lg3v9Dz30Lv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 16:09:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2u0HZP9J1NulrWjK762zFGj0RI1X7DtOR7xjplYfbjJ+w/5kAtgAyzIrUIpahavh7x5D17Q9Le1ZxhQpJsT92eU9yjVmG8Kw7TjA66Gl0FhQD/SJfxIGDtfwr51wOg4lpJjTFIzZdpxW2HwWcXuF4zhJuJyAMAxrUS5phSVVWTdxI4YCdr1s4PZi6+ixdBfdoRLXiy9GE23sT56i+t/3gNJoxe16rr3panpO78Y0Nb//M8S5xzvlS6mQrRt9ESqcpHBnmWxP9a3mcmwJwIT8TuNMYsGTUgAX8A81HLPD+wREmbzVTtjV3BPSM1uX4JbnyQW6JIpC6jJylTc1kKkGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OA7IFCsglmmczObmfcYhr+aM5USQ0fU1uWHF3aMmT6E=;
 b=H65FKivKwNTJK9oJgLx2aVMPlz5uylI6TSTSPSWhxH7YEG5QeWCZlVKOL+718sW8bWapkX3J3jcoD2VYxmiSwN90Cl8WYXj4Fv4gjj0DK/gOMv+gLnTBCeBnGoilQoaEZnhnA+2MoSqZ8GJ3SBECqrcG/DOElAmtFtfM1HFa6H20QdaR9XMCrCOU25u/H7bYRrRnR27ldbBrEPf6v/WsDXxvw9YZBp8K/oTug88yqDqmdTAiJ/x97XeqHooSAKqSl3IHxQ6Egm+mpMrHOWalsiqUJ/mFHgWgckxzVZEibKknZZrkJkdH/AvMlVOyACwv+v+U4ZunB0vlbPKl6KwBsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OA7IFCsglmmczObmfcYhr+aM5USQ0fU1uWHF3aMmT6E=;
 b=bU6hrTmHxJhloGRikEEzBVs3m0mSkf8jqM6ZPWrcG1g4697cRq0XaUSQRveQ4gGh6ywWqcF27+SxFQyL5ED+hNsv4MGOWuCeP5w6utYRLtwwpbnILjYrt85dFQI6TCfuBlAtTnjFZcO1k35Zgnw4kTrooOTbJAX+pj2q1IlcPtA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 05:09:25 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::230d:c588:d858:9977]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::230d:c588:d858:9977%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 05:09:25 +0000
Message-ID: <c8cac97b-a3b1-422d-bb40-4e828175dbfe@amd.com>
Date: Wed, 28 Jan 2026 00:09:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/13] mm/migrate_device: Add migrate PFN flag to track
 device private pages
To: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 jhubbard@nvidia.com
References: <20260123062309.23090-1-jniethe@nvidia.com>
 <20260123062309.23090-5-jniethe@nvidia.com>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <20260123062309.23090-5-jniethe@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0267.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::27) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
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
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN2PR12MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: ea675690-59f7-41b4-50f4-08de5e2b67b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1ViL3NHM0JvRlcxK2JQdXA0K3drMXFXQnJIcHQreFZPNzQ1N0g4MU01Y3dm?=
 =?utf-8?B?MHl4UkFUUUpxOWdtQmRWekFROFpodk85QlQwTlNDYXVzcGlvS3EwQUZydG5U?=
 =?utf-8?B?bDhaZnlzR3NCa2J6M0Nld0taLzNKWlFnVDJPMFJNZjkvSjJNb3FNLzVwWG9y?=
 =?utf-8?B?QzZXanFXWVB4enZ1MUtYc0dIUzltY0hoYm52b2JNK0VRZE5HUzBVSW5ZSzNW?=
 =?utf-8?B?NnpyZys5cmY2RWI5VisvT1hYdWtqdTZtMzVrTUhQWjd3bTAxbTIydVlQVkFM?=
 =?utf-8?B?QmVrcjVmcmNJeURGaUcyYThMcDFsK3NXa3hKOHlxUk9xTDlQdnRLQmZXdXAr?=
 =?utf-8?B?MWhpTTZ3N1JNNWFHakhPOGozYUx5bnVnTzFvUXYwOC9WQnRiaXlQcWV2aHpG?=
 =?utf-8?B?b3hQamlBYTE2OVlUTWJkNXpQMExzSHRhTkZqTVZmajlMaVd5UkMzdDRNOFlZ?=
 =?utf-8?B?R0tTWm9SSTQ4YTJNVXJBd3plai9jUGNzZlBvcmR1UHJpS2drb3o5eitTbW1T?=
 =?utf-8?B?TmQyMkExT2s4SGNwdFI2bUxvbnh1eFJpb1greTJLekJjelBMRlQ5dzBqeTVu?=
 =?utf-8?B?RHlNaHhqbnlldElTZlR4cDZYM2Z1Ti91cWFTdENWeUJHdC9LQ0Y5WmJTdnU0?=
 =?utf-8?B?QWJJMlU2VkpLWlhuWVFzcjJqQUlCOCtPeGx3ajRVNHA1Um1GdFcxZ1VxVGhD?=
 =?utf-8?B?WnE0MEpYM2E3UFJ6NlRaWVdDRWxkNVBsOXRJK1pHN0tZd05nMXNhZEFkODVG?=
 =?utf-8?B?MDkxbTJvVzAzWUh3VGdDbXNYYlYrQWtTMGprNytXVTlTdUlqWUgydERjVVQr?=
 =?utf-8?B?MHNqMDNjSzlUKzhXNGt1K0s2NzAvRVhsWmhMQkFHSkFOalpMdlZhNmQ5YWti?=
 =?utf-8?B?ajI1ZDcyUHpuaWRQRXVsam43b0xzemtKZUFLZ2hlUTlmN1RINSt2bXlMOHRr?=
 =?utf-8?B?OURUVHB0SW8yTXNvQTkrUk8wQldMWk9vaVEzbjlhUi9qNFYvVytqWnkzV00x?=
 =?utf-8?B?ZzRnZVgzcU96NFF5V1NXb2xLM25hYmg2Sm80aVdySUYzOUlhVEJIZXZ6TGgy?=
 =?utf-8?B?Q0lvTWFMNzY5ODZsbGVxNEdaSDE2K0xuTzlBU3B5ZVhWM3NsYXJ3TUg5K01w?=
 =?utf-8?B?aUZXZGNwTDdkMm1zMkdIdDFSdUNnUnlNMTZBYXE5WTJWMkRoWlAzNllIOXQz?=
 =?utf-8?B?RWVobkp3SFo5L0ZzWm9NdmZuTDVMaVVEQjQ4NFVLVkhCVkpNdFVYRTVOZFpI?=
 =?utf-8?B?U0kwQ1ZhTUtaWEE2U3RVVW1OVWQ3cXMrQ1lmcEw0VEFiQkc5cGFNYkxDZUda?=
 =?utf-8?B?ZDFQZkdETHlHUU9FNkxveTZ5Y3VHSFU1V2VDOXNKejE4YjJDalBYaE9XNVNl?=
 =?utf-8?B?dWJOeEtRb3JKNWNLaTl1ai9IclBKZVR4YmtFUVNqWDdJQVE3VGVmTnNsNExs?=
 =?utf-8?B?RkdFYWE4b1p0VXZQYm9MZkEranRvYmFXUnBWalNlYi9FdjhrRzJ3SDVkRUhR?=
 =?utf-8?B?NHVDSFdGZW1aWENhR24vSW5rMWw1VG45R3JIOHdrUGhGNDROQU1DbUU2ZEl0?=
 =?utf-8?B?QThBR1NOaGF0Mm10Sks2R2RXQmx1TkplWGNOVHBTSTlOdDVFKzgrbzFTTlBm?=
 =?utf-8?B?WWF0eHQ1REFmNnZvSHlBS2grc21wT01RR28rS2pleHl1YW1sN05XQmdoZGJp?=
 =?utf-8?B?V3ZNeU1Gcmk3UklkSGJqZFpPUGVncjFjZkU4ZHp5R1d0MU1TNWFqZFptd05s?=
 =?utf-8?B?RjNWOUYwVXZBazIvV2dralNzcXRZemFHbnpBRXVwY0lFUUFJTndIVTdIdkJL?=
 =?utf-8?B?aStYMm1rNmpVa0pEbEdnbjlKYlhudEpSSy9iMHJSSnp5c05XT3VoMDk4eXdH?=
 =?utf-8?B?Y3Zoekc1QXJUUGRwdHZYMXNpejdISlVKbUkyWHRQNDc0MDZ1Z3JEZ2JCeXNi?=
 =?utf-8?B?dWIzQlNwLzJaY0FYN3BPQk9VeTIwRU1JNTl0OGZuRzZ1RTNCeXgrOVNSSzFQ?=
 =?utf-8?B?TUdyTmdZM1NYUkdQYkxjR1FJMXhSazNGQUxIL2ExSDVVeER0K3RYSjA3QjVK?=
 =?utf-8?B?L0xJQkM3Slc1TmpjK2hQMU55MXY1MWFxelVDUVNuR0tWaHI1SU9hdzRvSHRJ?=
 =?utf-8?Q?Xgdw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5115.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEJhMGtrVTFNWVlkSld3YjZIeng3Y1JEWDhPalZlLzBqenBxYm1EZGVEb2Fl?=
 =?utf-8?B?K2ljeW9PWnNobWFabE4zMmpJdDIwOEtqWXdDcjB5L2U5K0xlM2NWbFE0NVM1?=
 =?utf-8?B?Slc5c2ZKWVZ3M3FtYXJLZW9sT1dtWmJWUVNJT0Z3eDc5RlN2bnJlM21YbU5R?=
 =?utf-8?B?TmFvWVhUSEQvUlNEalMyaGdrbVcrWlpoR04wSlNhVHBEa0hlbFZYSVExZmJP?=
 =?utf-8?B?Y29EeE9ycTBkSmo1R2F1Z1A3Q2s2MksvelRFSUdMNlltckVrS1Y2SkNmWm1o?=
 =?utf-8?B?NmhLd1RTUnpOTjhPeTBQT1lGUmJPbzJma3YyTVhOR05hNnVzYmdCbmh6c1gr?=
 =?utf-8?B?cjJZWnVXVUxiOVIwNFJDMmFlaDczeDFOUkJ3M04yQmdzanh3RTRmaEVhNFJy?=
 =?utf-8?B?TnZ6VjNQN1lKeExCRHdYWDRLWnJwdUhkcUxDWVl0Zmd4SVlPN2lUM0IwYjYy?=
 =?utf-8?B?OGcrZHFyemYrNWxGLytZYit1TXJxOEhuRnFtdjBJdXA5RHhKKy9KOVpVaGEy?=
 =?utf-8?B?bGcyd1dVMVlXZ2FWVCs0ZFNTOHp6anhqWWc1eW5ybGVnRkN2WEJncnZTcWRS?=
 =?utf-8?B?M29PVG9ZSUY4b0d5T3JpdVdYakVycXBqZGFBa2NiSGR6cmRmNVBBMkRGUXlm?=
 =?utf-8?B?MzA3bkVmMkxnbXZMZHE0NGFyZ2lCYU0wUUsxVDROUTlITjQxaXZmWmZHYW4z?=
 =?utf-8?B?VG16RDdLZ1dkdy9rOVFTa3hzZlNDY1NFWG12RXB1MmlXZ2pHaEg2b3dmKzI0?=
 =?utf-8?B?RE9ZYUFsR3F5UkxkdUZNMkhzM0RUbDdMQVI0VzlmR2FXRTlxemI4d1Z2TGU1?=
 =?utf-8?B?VlE4UmZBdW1Cc1NZTXVhL3FHN3o4ZG1LSklMQVgxZ2xtSjVwckVXTUsyMitn?=
 =?utf-8?B?NTBqTE0zSHFJMVdFZmh0MVhtVEpJb3ZpRytsc3NWVDFYWVJML0ZUM29uUGR5?=
 =?utf-8?B?QWJqRG9Lb1BqeTNKYVVoT21ZekdBb01iL0p4WXR2VU9PTTkvdjA5MTEyYmRG?=
 =?utf-8?B?T2o0K0wxc1VPcjlPV1lUZTVDcm5zNkkzL2hvZjlkYXdaT2wvMzNwc0pZZXdE?=
 =?utf-8?B?bjA1czZvam45V3RLdW5FQmxFbCtVWk5BeVdPU3I2UmV4V2Q5bmhNbkJzV3Vl?=
 =?utf-8?B?MGhsVkZIZHowOElwQ3Y3Q1N4dW5ndEZGYXpPakdLSTdtWTB5Y2M1ZlRNZjJK?=
 =?utf-8?B?WXIybFduTExzNkZqMlFPK2VPWHdGOUhQR2FkU3dFNGNRaUUva2NWc3RKS08w?=
 =?utf-8?B?Ry9aL1dabnREdnE2RlBaSy9EWFp6dE1rUHVweWdocEJMZTVWQkZTSGo2THhs?=
 =?utf-8?B?UkJBWDEvV2hxZFMrdFNXM3UzS3o1Vk92WnQxNHlDN0tMUVhma3BObHljUVZW?=
 =?utf-8?B?blVmeFNjWG92UlpBSHhmOURwYlRTK2sydXBXRmFqeUM5RVJ2N0hoUFFIUFdl?=
 =?utf-8?B?TXovUWpVVFAxZlAwSkI3Zk5KSDkrcXo1MUFJOFRKS3Nqb241NmZoTGRLbHpo?=
 =?utf-8?B?YmJmSG4xUnlJQ2I2emRaSDN3Y0phT0F5cE9YUnJyNGlhZzRkaW9GU2diWlRq?=
 =?utf-8?B?RkxVQ25nb01Fek5vWCswSFZtdzJCdDVycTNFUzRnbXd1enNrTkxGV3JxbWt6?=
 =?utf-8?B?Wk1RUlc4N0xHMkhaL0t3cS9CaXljdG1XQzlSNnpQVm9GSFZWQm1kQzZEdmhK?=
 =?utf-8?B?OG8xUkF3amNUNGVuZ3JBaUJ3Mzh5SkMwZExlVlR4b3BxZ09SZUx1NXNWejhF?=
 =?utf-8?B?OTdXc3hkUGFmTDJIK21xVzB6RVFGcXN6R1FOMlpha2lkTC9oL3lXYVU4QXY0?=
 =?utf-8?B?RlZlMzdBbStPL2QrUUExMlAzVmRzMmZNZjkxSFdpdVNOcEpHdm15UjlTTENz?=
 =?utf-8?B?NTd2OGNQM2ZTTWpTby9OQkI2VysrS3BzSVRuRjN1dGc0K3JvUWhlQVF0aVVk?=
 =?utf-8?B?b0NHLzFxODRpS2o3a2VBdW1XYkJNQ0VLZDgvZm5RYjI4U1ZEZW53UGd0SjE5?=
 =?utf-8?B?YjZLaGlQaStKdSt0K3RJUm5zNTU4Z2Q1dHd2Vm9sdGN1T3pYTmNKM1pNTmhE?=
 =?utf-8?B?L2V4c3pHWjFGNEhRLzdjdlp6eFQrZ0NqTTltMHZGcGh0UU56NU1jOTN4SFA2?=
 =?utf-8?B?d0NDaGgzWWxUdGxQRlZlM09nVENndlpqSTMySlcrV1MzMlZzeklEazZ4My9x?=
 =?utf-8?B?UnEzOU9YVXZFVFM5Y2dVZUtrTGp6azRja1pyWGVuVDdGU3c4algrbkcwcHR1?=
 =?utf-8?B?UHZSMUlUK2lrMHZScHFwY1ZYMElVdjNrUWc5QmlwVjNHb0t5eEFna2hzaTVG?=
 =?utf-8?B?QU1COHdGVEVuQlRxQ3lRUWpSYkZkdHpoTTl6RVdheE1PMUJSMGxGUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea675690-59f7-41b4-50f4-08de5e2b67b9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 05:09:25.0750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLZ9a+AAXp/CjDOzNqgpcNNDwPmjDDcyuRlHqcdbKKOH61SSqTZRL9FxI5xpfhJvQ1hlIH1CK1vMAZx8m303+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16344-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[felix.kuehling@amd.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:jhubbard@nvidia.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[felix.kuehling@amd.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: EAB419D2A3
X-Rspamd-Action: no action

On 2026-01-23 01:23, Jordan Niethe wrote:
> A future change will remove device private pages from the physical
> address space. This will mean that device private pages no longer have
> normal PFN and must be handled separately.
>
> Prepare for this by adding a MIGRATE_PFN_DEVICE_PRIVATE flag to indicate
> that a migrate pfn contains a PFN for a device private page.
>
> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

Acked-by: Felix Kuehling <felix.kuehling@amd.com>


>
> ---
> v1:
> - Update for HMM huge page support
> - Update existing drivers to use MIGRATE_PFN_DEVICE
> v2:
> - Include changes to migrate_pfn_from_page()
> - Rename to MIGRATE_PFN_DEVICE_PRIVATE
> - drm/amd: Check adev->gmc.xgmi.connected_to_cpu
> - lib/test_hmm.c: Check chunk->pagemap.type == MEMORY_DEVICE_PRIVATE
>
> v3:
> - Use adev->kfd.pgmap.type == MEMORY_DEVICE_PRIVATE
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  7 ++++++-
>   drivers/gpu/drm/nouveau/nouveau_dmem.c   |  3 ++-
>   drivers/gpu/drm/xe/xe_svm.c              |  2 +-
>   include/linux/migrate.h                  | 14 +++++++++-----
>   lib/test_hmm.c                           |  6 +++++-
>   5 files changed, 23 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 3dd7a35d19f7..5478e41877e5 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -212,7 +212,12 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
>   unsigned long
>   svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr)
>   {
> -	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT);
> +	unsigned long flags = 0;
> +
> +	if (adev->kfd.pgmap.type == MEMORY_DEVICE_PRIVATE)
> +		flags |= MIGRATE_PFN_DEVICE_PRIVATE;
> +	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT) |
> +	       flags;
>   }
>   
>   static void
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index bd3f7102c3f9..adfa3df5cbc5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -484,7 +484,8 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
>   	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
>   
>   	migrate_device_range(src_pfns,
> -			     migrate_pfn(chunk->pagemap.range.start >> PAGE_SHIFT),
> +			     migrate_pfn(chunk->pagemap.range.start >> PAGE_SHIFT) |
> +			     MIGRATE_PFN_DEVICE_PRIVATE,
>   			     npages);
>   
>   	for (i = 0; i < npages; i++) {
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index fbf5fd284616..a8aad9e0b1fb 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -770,7 +770,7 @@ static int xe_svm_populate_devmem_mpfn(struct drm_pagemap_devmem *devmem_allocat
>   		int i;
>   
>   		for (i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
> -			pfn[j++] = migrate_pfn(block_pfn + i);
> +			pfn[j++] = migrate_pfn(block_pfn + i) | MIGRATE_PFN_DEVICE_PRIVATE;
>   	}
>   
>   	return 0;
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index d269ec1400be..5fd2ee080bc0 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -122,11 +122,12 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
>    * have enough bits to store all physical address and flags. So far we have
>    * enough room for all our flags.
>    */
> -#define MIGRATE_PFN_VALID	(1UL << 0)
> -#define MIGRATE_PFN_MIGRATE	(1UL << 1)
> -#define MIGRATE_PFN_WRITE	(1UL << 3)
> -#define MIGRATE_PFN_COMPOUND	(1UL << 4)
> -#define MIGRATE_PFN_SHIFT	6
> +#define MIGRATE_PFN_VALID		(1UL << 0)
> +#define MIGRATE_PFN_MIGRATE		(1UL << 1)
> +#define MIGRATE_PFN_WRITE		(1UL << 3)
> +#define MIGRATE_PFN_COMPOUND		(1UL << 4)
> +#define MIGRATE_PFN_DEVICE_PRIVATE	(1UL << 5)
> +#define MIGRATE_PFN_SHIFT		6
>   
>   static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
>   {
> @@ -142,6 +143,9 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
>   
>   static inline unsigned long migrate_pfn_from_page(struct page *page)
>   {
> +	if (is_device_private_page(page))
> +		return migrate_pfn(page_to_pfn(page)) |
> +		       MIGRATE_PFN_DEVICE_PRIVATE;
>   	return migrate_pfn(page_to_pfn(page));
>   }
>   
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index a6ff292596f3..872d3846af7b 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -1385,11 +1385,15 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
>   	unsigned long *src_pfns;
>   	unsigned long *dst_pfns;
>   	unsigned int order = 0;
> +	unsigned long flags = 0;
>   
>   	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
>   	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
>   
> -	migrate_device_range(src_pfns, migrate_pfn(start_pfn), npages);
> +	if (chunk->pagemap.type == MEMORY_DEVICE_PRIVATE)
> +		flags |= MIGRATE_PFN_DEVICE_PRIVATE;
> +
> +	migrate_device_range(src_pfns, migrate_pfn(start_pfn) | flags, npages);
>   	for (i = 0; i < npages; i++) {
>   		struct page *dpage, *spage;
>   

