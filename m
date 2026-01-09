Return-Path: <linuxppc-dev+bounces-15444-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D49AD06BD9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 02:28:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnPLM2Tpcz2yFq;
	Fri, 09 Jan 2026 12:28:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.209.18 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767922123;
	cv=pass; b=a6CKFTNu9Kdl1wEm4XmNSG93hRR5aBZLD+wKCoc9RKpxif//ie1NxRWkAJ6gt5gNpQSn/nV+RH/HNjU7V8/3a04qir2QUaIFe+GDx3lALkpceFXhZge1104RV0QBTKeKZcn6ej2ZQXziZCm0cKyDrmzzwQjmE0WNzFohzu8Q6eUUkh4arwRaveh16438A/Z+7tm2Mp2mDazKWnyg4rqkWW79AOP6ewpITjh+YDJtd3CwRal8FMDdI4m3LE00XGBMydWyr+wkkrysqR3DKOZybMw/VnVQZ9ScO5JLFUMgCIjhS8VUmgvFtusHmjnhjpV+SVbHDLuEcq+7iX84ygjpVA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767922123; c=relaxed/relaxed;
	bh=2i+LNS96Qib/f4b9aXlgSSKFphR+fxNsY/H/8eRteq4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZXr5ghHIP2wPc03+8tSddl5XTw+83iu3O7PkE5v+uVESaLMv4fZneKUoiUVl8MSqusxp5uxzgLR4S3urE+ld0m+tzUYvTYTywAZZxG0RVENp58uy0Y/P6uw9fDa/2tESyKM53x4sF3+UeO/eTGDvygeclCzG7UymohhW+C1iEorGP1xljHZyIBfFEiRedQ+7cDaqNYv88ACu4Wbz3tNzqRuHlatrdX+hI9F+kORttnUMNQyEFs1e8eoSLb7LBWJ9+LTQ/uto9gPP+g3cf+B4M9ccH+6x2D6uE4SZlHGMztN3KdlcP5jW1TWCpQQxaABGcA8C+rjHADzMJtuDYhyQnQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LXM9lY0b; dkim-atps=neutral; spf=pass (client-ip=40.107.209.18; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LXM9lY0b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.209.18; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012018.outbound.protection.outlook.com [40.107.209.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnPLK5pM5z2xpl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 12:28:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqgI48bVA0w1mR1dKy4+p8IgYYiFao9zgy70jSI4VFdgh/xjFhvsWBmDe+xx1ViUjvgs/RdO/39JjgbPGFWVK2r1NTfEeajg6j9Qrpu7FZDjMg+Er+EpcWGgYbfh0u0TjVqldz6ewCOdLC3sQUVIz2uviolsWiRY0UHVuPcjo9lqLxARNele4vTPpWfGKH3l+gZgZIE9E0xhBWekKjxougiSSdVe3qWEUGy2lRFyQZD+tSRV90SEREepxk9DqfgwaF3XMC1UzjcDYDOMyJQTEH27Mb/eTz7/X7QXJBwbDf3DBnaYMINDAVYhjNH8HpWNfMSNXkj30igy3l5f1o41bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2i+LNS96Qib/f4b9aXlgSSKFphR+fxNsY/H/8eRteq4=;
 b=ncwVh1DasTmJhs8om/47xdN2LTmoeCfv7DMFbRNSEsMUx1UBkn4v03Ih04dHcohrh6WLIhXtUVhA0VkSAM8ItHgKNA3uA+RFTIIrwqdQCmo9R5GJ4KMe09bXX5JeVyEeXprGkpI0QEKGgyN6hW0v3XDEMz9wYha6lTwGEH3V1nM61OcxTCcw56nZCbswPJHcv32skdl4Aw2HyCn6UbaCXyTMTKBRWsU5HGcQxg+yzHiIDO0ZZ6sJncYEoBRRxprqG+QwE0WkLBeDIGYC4e+00in/lv4GWcD15pvC0RRk4GjWU/kM+7SK96kDR3X30hBJFWotzczCEHGpjluddrBQ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2i+LNS96Qib/f4b9aXlgSSKFphR+fxNsY/H/8eRteq4=;
 b=LXM9lY0bYIryDIA8vRiHSIBM/lhbjJDl2YEUJl4HGiAP7A/LNtzQtmBxVxzWcHuVWF6JAYH2OXiGYbrunqKUlFu7oNzyLV8JodYNtYJahweIQLh2gDteauJEDWLrLzIF1KeQDFTtAQ7YqldMttXaQaQdnmDan3nYJvErkb6IPVr49bY61YPAbQwDTJexSVPyoM8dTVPSCTKA/7bwBFAD/Mz+/Hk+otI4Or7/uabN8e/U4FMCGa5C17Kjrq8JQ5XPwNIVpglfWoTvRzfuCrgQ1c8pLph37tEgI4naxQgnQ7xUgnIObv4h7bc+0n3rMge5u1nTw41o8k6C4v1hUMa68Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 01:28:00 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 01:28:00 +0000
Message-ID: <ad2a0fe8-6d00-46a8-8f4c-fd7fb6aac8b1@nvidia.com>
Date: Fri, 9 Jan 2026 12:27:50 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Remove device private pages from physical
 address space
To: Matthew Brost <matthew.brost@intel.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <aV6nvCw2ugAbSpFL@lstrano-desk.jf.intel.com>
 <3586d8f1-a25f-4087-a987-162ccd97c25f@nvidia.com>
 <6a911224-05e5-45ee-8008-e36ef35cbc7b@nvidia.com>
 <eb45fb36-4f0b-4a83-8852-abac3205a988@nvidia.com>
 <aWBMbGQApg81Kxba@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <aWBMbGQApg81Kxba@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0019.namprd21.prod.outlook.com
 (2603:10b6:a03:114::29) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d4f328-5ec7-41b5-4ffe-08de4f1e538a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3pYY2hWMVorcnRRajVPcEhwZXZlM2pjQldxVUpETSthQS91WnRUMmVCNEtJ?=
 =?utf-8?B?VGV1Q1hvQk1RWjdkZ1hQSjNSeWZmUmlXYWRKZ21tRWZ4T2tDTzFXYjV1TVcw?=
 =?utf-8?B?eUt1blhXZjlXYkpVZjd4bkQ2SFJObUVCUmVoa29yVDArYUtHbk5DUmF0a0FW?=
 =?utf-8?B?QWJmeVNxVkxVVWdPSXBOVEVPNDd0U1R0WDlEUHRhZTdsMDZITnpaVGZqRlB1?=
 =?utf-8?B?VkNTbEdsaWxJVktrcStsQmc2aWJ6WHJDZGVmYno2SDhESDMxNHB6NUFySFBn?=
 =?utf-8?B?eGNnY3RzWHBSdklOb0g2UExLY2Y1T2dtcFMvWncvcmFkODgyMGpidko2ZGNF?=
 =?utf-8?B?aldJaWlha0s2d29YSFIvSGJUa0psanlOTm8ycHhBemlFVmJCdjUvdHpsbEQ4?=
 =?utf-8?B?WFVMd2VJSUpDUjB6SVY4QnlLM1VuUTdLZnY2RDY2RlVlZ3RXRlZLc1djeWZs?=
 =?utf-8?B?RHR6M2NqcE8xV21pS0RERzFEM2o4eFZQTHUzNGQyZHllSHkwTWw3bDdoL2lN?=
 =?utf-8?B?R0RQVUlFLzFWYmhvZllSUDhSR1E5SGcwQlprOXlPZzVXdytqZzU0c0phU1Yv?=
 =?utf-8?B?VDRKNTE3S1Bha1hHMkdsdHpqVlBnNmpZOFVJSXl3eW5BUXMwQzVLckhSZWpa?=
 =?utf-8?B?RDl1U3diKzhZWnhpVUxmL3psSXEzMFFVclJabzFXRHEzMVIzanVxV2xYa2hI?=
 =?utf-8?B?TTM5c005NkpaV3dPQVZyTGErRmdTMW95d2pSRkhrblAwUU5ObjkxVkV6dDJj?=
 =?utf-8?B?TlBIUHp6MDNtR3IxZlhsdlFrbXhGSEVGSWdJbTBBMVM0SElRUjRmWG55dXZk?=
 =?utf-8?B?UnR3Z01GVHcvRHNVME10S0h0M2dUQ1hrbUlCQ1RRaGNDdUZwU3diYTJUVnRK?=
 =?utf-8?B?VVNZN1ZGRy9IZ01oYlRpQTAvSlB2UnNrTHdUUlduNmZ4aGY1UFM2SDNmVzJL?=
 =?utf-8?B?Vm91aE9yUWRMczA4UVFhRlg3clJST0FjVnQvVXhodE5jMGR3TE9nVUZxcDJa?=
 =?utf-8?B?RzQwK3Q4R2x5dGxGdjlyUENud0xNS3pSeE83eXlIY1lsbEV3ZlIvNXNYalJZ?=
 =?utf-8?B?UWpwRktEZGdzODNORXNjWEJGUTgrcHA1blM0c1J0cHh6SytJbldLdmIydUdz?=
 =?utf-8?B?K1loZStIRkh0Z1haWFpvSlkrNmlLYWtmYlp3TGs0TGxPTlRzRlRxUVd6VWVh?=
 =?utf-8?B?TkVOTTk5ZHVNYWVjeWVnWXhUcTExSlRBakxsMlhuUnVzQVpzcUdNaW4zT0tQ?=
 =?utf-8?B?ZUNUdFFDWXZhREovbm9Va1FtUG5UODVkdERWZEdSdFVDUXozanpNWWRrYkFT?=
 =?utf-8?B?TzNhdWYwd244Vmo0d1UwZitYY09kRDY2Ny9XYVZqdFNqOS9NWE9Cdm5MZGlX?=
 =?utf-8?B?dlhJZWtjRCsvZ08wRUQ1Wk9za3F4K083eWY3aksrOUJRS21HN21OVWlRMTZZ?=
 =?utf-8?B?Y2lESmVUam5pcXR1b3djclEzdjV5b1V2dERtbC8ya2pwaEFEdzV1UElIWDla?=
 =?utf-8?B?cks2Z1k0VzVIOFczN2VMWW0veStYUGlkd2Z6UEUveHlramgzWGZucytZcmwy?=
 =?utf-8?B?YXlzc2Rpb212Qm9WOGh3aWFDQkZoUzRjOEpDTzJRTjROTEdFVGtvT1Rmdm41?=
 =?utf-8?B?K1dMNUpHWFF1Um4xS1RFY2gyY0RoRDEwNFJNemdDclpydmN6YVp5bDdrV3dW?=
 =?utf-8?B?RXlCRXQramlqZXZhVm1sWDU3L1ZBMWFvQ0tXWDZNL01wQURkTjNKUHV6aUE1?=
 =?utf-8?B?MHBzUVdnNmxRcFhLQ3Z3alZVcUlkVXZLVTA1eDRsbEFaeDhYZzQrVHROeUxz?=
 =?utf-8?B?cFNsRy9Ua3dTVkpEQmptOEY5ZXVmaWc1cXpKRlNkT1JNOVg0YTBqOU0xNmdV?=
 =?utf-8?B?ZEdydGFJRFUzVThIV09tSjFEM3FHWjVzZEVSc2hFSzRMemxvSDV5NVVFRHJJ?=
 =?utf-8?Q?3Eb4QEpd1+beTKv8gawVQlTdfjwmK2nA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUdpcW9WV2xXMGtwWnZ2NVovVWRGWE01b0lqNWhBRkw2NzBJcGhRR1VjeFg2?=
 =?utf-8?B?THozQkkvcTB0b0JZemxjQkhjOUJtQU1nN1kvWEN6aWdPbjNpcGp1bGoyQVVo?=
 =?utf-8?B?aVR6NWM5Q09qL2h4SXdQancwbFhITnlQN2Y3RXNDMUk5MlVjbktPeXFHamxQ?=
 =?utf-8?B?ZGJacGRjVWVXK3U2d3BTN1ZOVHcrOW1veUVTY1FLQ1NPck5JUDlhM1JVZTFz?=
 =?utf-8?B?aTRjVDNkQ2lVVlkzejlUMzFaTlhIZ1JqdUl1MzQzMUVEdXVTcUNZU2t0bUE0?=
 =?utf-8?B?VjJzSjlHc1lVVGh0VUNMWm9GQ1MzbGZabGpPb2x3NFBGZVl4SkREczVZdWx6?=
 =?utf-8?B?RWtUTlQvN2lQWEVwNk4zYXVoSmd6Z3k2T0NPQ250ZmxzYWZhTVoxTkdYOG0v?=
 =?utf-8?B?dUlaSFpSNUR3enZiZDVCU2wreVZiaXZqSFZBNVNjNzZhc25rU1JTUFh4Y0VZ?=
 =?utf-8?B?MGg4QXAwSy9zY2hhNlg5QjdIY0lhSDR6bDU1ZXhVVzlvYWNLb3lxaTNaTjBs?=
 =?utf-8?B?VHdJcHhDZkVoeVJHQUJuT3VpNzNVSjhwN0V4K3RScG5yRlN6d1F4U0tqMjMx?=
 =?utf-8?B?dC93L0VINU44dFpKcDRHc0NjUCsySEd3ZVNVbi9KY3RXYWtseXc2ODR5ZHFV?=
 =?utf-8?B?bStFRkdNNFlxekhmbDdRQ0Rja2V6QUFYNFVFTDhOdzMreks4UmVaY2JTendr?=
 =?utf-8?B?elpXR2d2TTVLd0N6ZWNydVl1NURNK0FueDBFczAwOWZXOUZDTWdmYm05L3o0?=
 =?utf-8?B?TW9hWlBsTGVNVUhzV1ZJeE5qOEtndU9SYVo1VEcrTlZtbUlQVGo5WUltRnN1?=
 =?utf-8?B?UEkzYTIvZmZFUHd2UGt5NWJscHRUU3ExQStJaGZGUXRiaWpFUFhUK2JuYkxp?=
 =?utf-8?B?N0g4RFJVOEtXTUhjdThBSmFPSGRDV3UzSVRWK3pqWVZFRzRLU3lMa2w5bnF0?=
 =?utf-8?B?QTNpV0VjRTYxSlU3K2U3cWdzZjlYWHdCSmdTQTZ4bnlnNVNkd0R1ZDE2YkVw?=
 =?utf-8?B?dXkxcGd0SzFlZWpoZzdNeGFDTm41akJHU0k3MXU2TmU5ZHVuQnBKMGRGK0g3?=
 =?utf-8?B?ZkpCNDVMaGxnT3NwMEowV3kzWityQVZSZlIrWTU3Wml0dXFqV0M5TEs1Ym5t?=
 =?utf-8?B?NlRmM09rZzJxL3c0OVNNRDRhUmtvTUdqZXJVQXIzditoYU1DRS82RWtWOWxr?=
 =?utf-8?B?b1hsTnZWZDZzekk5bmtTRnIvVnNDaUNyamVJbXVicG5Wd2ZkaFMrVW4rUzhO?=
 =?utf-8?B?a3dtTW9wMVJvS0E3OUdpaEFSZm10RXhJVHRqeTNGOElCcElFcDREcFNoL1lB?=
 =?utf-8?B?Ym56eE1kODNjSW0vVDV5RDV1TmYyeHZ4U1c2MC9OT3lHQjMwSEs5RGo3YjFS?=
 =?utf-8?B?MFpJR01pZ0N0MklKUEpJMDNPYlJ3Tkw4cFJHbkZjUm81VnNrQlNVMG4rZThS?=
 =?utf-8?B?UW1vck4xN0h1U1I3VDllQ0NMeGxUSk4vY0FpaFVqbGRqVGpmV1NHU2NXMjdj?=
 =?utf-8?B?eWc0SjgwNVZmd0hIU3picjR5Q2pFS2pCN3RpWEZ3VFhTMUU1WG5YdXJQMEJL?=
 =?utf-8?B?a0NKV2puSG9odlNkby9KMUZ0RFpiSkVFUGY0ZjNUVXVYQkcwZTArYTlWelIy?=
 =?utf-8?B?RElTaHRPSklkRktWOWl5aFZZRis1M1RURVUra0hCc09HaHJEYmFHb0doVG84?=
 =?utf-8?B?NTQ0Qmt1NHFoc2dNeGVVNHRzb0ZaeGFhTTJ0VDV1dUpqcm14Rys2cW1nells?=
 =?utf-8?B?L0dsUG1PZ1ZtWXp0bzRxTGE3SVo0UVlsSGQ4UTdDTGVGaDZ6aC9uKytWN05F?=
 =?utf-8?B?Q1hmeWcxb0wraVdvOXk5elNSVEpOT0xsZng1Z0RTL1kvdkFVd0g4WTZFVzh6?=
 =?utf-8?B?YVdBQlpoSEtaTU9KVU8wd3UrMlBqemwzVWRtei9jUFhwOXFsdWh3UDNjbjh1?=
 =?utf-8?B?OHVVdDR3U3g3UGpkNmFoVi9vUHB4MGFCMXJhNHZlVXBYZzhrTU80MVExbWhL?=
 =?utf-8?B?Yi9lbGtWbkFjcUJHL1F3TkI4Z0hhZGY5TCtnUXF6ajZJY1BERHN0a1c3aEJv?=
 =?utf-8?B?cGRqazYvT3creUZ2ZnBocVdmNWY4S0c4NWZqbnFZV0EwZ052WHVmN1JReWVI?=
 =?utf-8?B?Y2Y5WHlXd0htelpXMml1M0t2SVV6YWRlekdxTlAvOG50ZDduTjFaSXR2K2ps?=
 =?utf-8?B?Q0JtTTZLb1lmOHhQNDNlNjRwWWhqZ21FZ0xDR3VzME9aZEhwT0ZzTHhZT2Nx?=
 =?utf-8?B?dldTQUpaTnRqT2JOdWFSY2RHSUN6NGlZcnBWT2h1ZXlRZktJMDJ6QnZuZUpp?=
 =?utf-8?B?WktDSXZJU1ErdVNWb2dhRGFoSllrSDRYSWJycjhVUzNaSGJMRGJ5QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d4f328-5ec7-41b5-4ffe-08de4f1e538a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 01:28:00.4106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJ/1a8i/7WzMqdRqMim2T3iT8eC16+0gUN3fTiyL/0KzvV/c+MSc01rKz1VevldA29f4ooihJ1n+sQLbvNH1lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7353
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi
On 9/1/26 11:31, Matthew Brost wrote:
> On Fri, Jan 09, 2026 at 11:01:13AM +1100, Jordan Niethe wrote:
>> Hi,
>>
>> On 8/1/26 16:42, Jordan Niethe wrote:
>>> Hi,
>>>
>>> On 8/1/26 13:25, Jordan Niethe wrote:
>>>> Hi,
>>>>
>>>> On 8/1/26 05:36, Matthew Brost wrote:
>>>>>
>>>>> Thanks for the series. For some reason Intel's CI couldn't apply this
>>>>> series to drm-tip to get results [1]. I'll manually apply this
>>>>> and run all
>>>>> our SVM tests and get back you on results + review the changes here. For
>>>>> future reference if you want to use our CI system, the series must apply
>>>>> to drm-tip, feel free to rebase this series and just send to intel-xe
>>>>> list if you want CI
>>>>
>>>> Thanks, I'll rebase on drm-tip and send to the intel-xe list.
>>>
>>> For reference the rebase on drm-tip on the intel-xe list:
>>>
>>> https://patchwork.freedesktop.org/series/159738/
>>>
>>> Will watch the CI results.
>>
>> The series causes some failures in the intel-xe tests:
>> https://patchwork.freedesktop.org/series/159738/#rev4
>>
>> Working through the failures now.
>>
> 
> Yea, I saw the failures. I haven't had time look at the patches on my
> end quite yet. Scrabling to get a few things in 6.20/7.0 PR, so I may
> not have bandwidth to look in depth until mid next week but digging is
> on my TODO list.

Sure, that's completely fine. The failures seem pretty directly related 
to the
series so I think I'll be able to make good progress.

For example 
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/bat-bmg-2/igt@xe_evict@evict-beng-small.html

It looks like I missed that xe_pagemap_destroy_work() needs to be updated to
remove the call to devm_release_mem_region() now we are no longer 
reserving a mem
region. 
  
  


Thanks,
Jordan.

> 
> Matt
> 
>> Thanks,
>> Jordan.
>>
>>>
>>> Thanks,
>>> Jordan.
>>>
>>>>
>>>> Jordan.
>>>>
>>>>>
>>>>> I was also wondering if Nvidia could help review one our core MM patches
>>>>> [2] which is gating enabling 2M device pages too?
>>>>>
>>>>> Matt
>>>>>
>>>>> [1] https://patchwork.freedesktop.org/series/159738/
>>>>> [2] https://patchwork.freedesktop.org/patch/694775/?series=159119&rev=1
>>>>
>>>>
>>>
>>


