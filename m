Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3372B92AF56
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 07:13:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5UZnVksN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJ8KB5Lbjz3fnW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 15:13:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5UZnVksN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:200a::619; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20619.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJ8JS22RJz3fQq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 15:12:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1OzHqCoMFppq14qoWGmjzVtJr+bLhBfu2kCEu9DFdPQ4lzbL8Kg1oyHWA8MSEkvWlb9L0bQ8/L1odV9BI83xwv3aJkogf4w3fPOAWqiQ3rwZzMUOG6mTjiQAOAgpTkyodt92yE6SAs9EtaLMOokZnk2XLnOqUWXpuOPGneYzpdn2NIn4J8sw8b1XSgU/hsub7nvU16WxUN0N9UwYkRv/GysZIjigI/uxu67nkhJqiI9vYTZfVjIehiih57IAWcOcdnBGam7WqsyuoO1CeVOOrnG3QixtS1EaSTYLIoEVwm4j32sJvB5kusPL7kOVxjB35bBd7nYy567g4loCsx3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0zOdtwsj4sNm5j8gkJm0YcmiZsal8v4olmCA5d+pG8=;
 b=HUUus8zFN7pz1U8Ely16ndk2EZVJaAuHvSzgoNDru6CEUXhTKQoSNMbdko8KRRePtGcgZ5u8O7FzdbvhreK8OS1IddQntkgEkJymh29wVbnKHvrBxTzpvzHv08YFnjhTXPUujzIElmQ73kZpDbl0eQOGIGA1+f3xCIXLof2uY4ztJjGWMX98z6SsIFQ/wN7KIfdUBY6gvgz8e+9GTpgzjHKBZAeqR7xShG081HdvnlKdWUJm926XwtPftQQs4gYEuklGNv+nME9kOckDT2zBRwC4Tv93dh+4/FaZQ1pedjRBiHjcCwlzqj6Wnkfy6msY1+++d1/DJ4JyGg/5qdAV7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0zOdtwsj4sNm5j8gkJm0YcmiZsal8v4olmCA5d+pG8=;
 b=5UZnVksNy0pDX7BzQikTxSHUpkL0p7d2J8+pnDmAF6UZQgfUgVtpdhmC0XHGOYRc8/ngnilRmDV+GEiFctYKoOhb1SPw25g/G7QWWtDwZjmSQauFCOEYBogrlRpqzMiwQVroLJOa+PD4yOakJizIF4z1WZK1Nn1gSomMwyK3FZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 by DM4PR12MB6424.namprd12.prod.outlook.com (2603:10b6:8:be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 05:12:31 +0000
Received: from SJ1PR12MB6124.namprd12.prod.outlook.com
 ([fe80::c15b:b99d:8d9e:fb25]) by SJ1PR12MB6124.namprd12.prod.outlook.com
 ([fe80::c15b:b99d:8d9e:fb25%3]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 05:12:30 +0000
Message-ID: <456d9a5f-45cb-4307-b8e9-3333a2c71e69@amd.com>
Date: Tue, 9 Jul 2024 10:42:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>,
 "Balasubrmanian, Vignesh" <Vignesh.Balasubrmanian@amd.com>
References: <87wmo4o3r4.ffs@tglx>
 <4a090901-9705-40aa-ac3d-d67c52660f22@amd.com>
 <20240522153433.GCZk4QiX4Hf0OuI48E@fat_crate.local>
 <902b1bf0-15e6-42df-8f86-21387deef437@amd.com>
 <20240523144543.GDZk9WlwKpCKx8I3RE@fat_crate.local>
 <664e101b-3689-4876-825b-a5aa12b7978f@amd.com>
 <20240526090554.GAZlL7cpva88mMUbCK@fat_crate.local>
 <b370276c-cbe7-4583-a906-dd0ef9f5afad@amd.com>
 <20240531105843.GBZlmtY7j7p8LJfQOh@fat_crate.local>
From: "Balasubrmanian, Vignesh" <vigbalas@amd.com>
In-Reply-To: <20240531105843.GBZlmtY7j7p8LJfQOh@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::6) To SJ1PR12MB6124.namprd12.prod.outlook.com
 (2603:10b6:a03:459::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6124:EE_|DM4PR12MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: e397db35-1608-4f59-a75d-08dc9fd5bba9
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?eHBzRWdPU0ZjN1lMY2FiaDRBZ01ROFpyZjkwbmpHeS8vd3pWNDZEWEZEeWhW?=
 =?utf-8?B?V1RsVnJtMkhuNHlNTkhUaTJkRDF1TTQzbXNxNzJHR1Zrd2xUZ2U1TU43QVRr?=
 =?utf-8?B?VlFRYUQ0WGxsQzVHK1pVZ0NFa21PTVBLd0ErY2RyNVMwYlN4b2RtQklOMTNq?=
 =?utf-8?B?ZFFKcG1nbFVEVE5odnhwNmxQTEFYOVllZjIvQnBNa2RSK0NTMHh3bExHaUxI?=
 =?utf-8?B?SC9DV0VLdDN5S0FQUkRYWW1hdnFVb1FmYUpUTEFYQ1EvODlTU3l5dXRDWFkx?=
 =?utf-8?B?Q1V1NjQ3L0srM2psK2lIMHFSc3BKWHFnN1ZUZ1ZOc01SZUlBTUtjZW91akRh?=
 =?utf-8?B?Y0M4Q3VHQnlDN05DTk5WYnM4Z09hZ0xRbmZteU9OOTFWNWJPOE5rejlvUmFa?=
 =?utf-8?B?NTJUNU5DNVZMaFZCR0ZJa0xGT0FobFFnQ1FoNGduV0hUSmJNRGNpeTJwY21F?=
 =?utf-8?B?b0swSnR1TzVLZElqbDA0YlgySUJ0bHFlSm9JdWZnblZJRjdxMlJrNVlGZzFC?=
 =?utf-8?B?ZTNna3Z2ajZpVGk0OVpNSUNqV0cwZ1hTSXl4dnpXeDlhaVZiL0RCYlFSUnpz?=
 =?utf-8?B?Z2hlaUdKYnFpNTRnUlZPalNML1FRRDh1OFZSME40NGI4ZFBvQ0JjUktKVW5M?=
 =?utf-8?B?RHlsL3ltQkppTDh0OFNyTWZvRVBvcXR3L2tzTjFuakZJMVdoTnkyMUgrdHdN?=
 =?utf-8?B?UVFYcVVJLzJ6eXllc0hYbnJMOGhSWERsMWZrY2ZRL200eDZmZU5qYksrTGJQ?=
 =?utf-8?B?bUc4bFNLa2FGdURxQzBVc1JJdlJMZVVzRUEwSVpVTzVYVGl3clAxZElkSW1w?=
 =?utf-8?B?VzRwbTkzMEVNb1lvejJMS0dZR0kweEpvWGJZMXM0SmswK3FGbG1XRFNrSDZ5?=
 =?utf-8?B?NzJySllVNnY0UEp0YW90RG1DL2RFZXdWU2QrMGFCODBIT2ZCdnlrWldQZml4?=
 =?utf-8?B?LytBZ2R1Y2J3Qjd6bUpoMk1NVW1kZVNqSnBNSFZ5SGZ1UDZ1dUptKzB6WENM?=
 =?utf-8?B?M1RVc0tNY2NJMnBNa0xHcG9YTHVad0lYeWF6TE1HZmVqS2lUdUFHOFFXQlgx?=
 =?utf-8?B?K2pyMmJkNnpOZlBtWEk4elpYSys4YjJBSDR5TG42RG1sMkxZRzgwQlF0eFdX?=
 =?utf-8?B?RlJXOU1YSStyZEtpSFVQc3VLR3RRRC82RVdnekE4NHNiWmVwVmt2Z1pUY3FQ?=
 =?utf-8?B?QnZ4Z1E3VzkydWVGYXFBWjVYbGZ0M3dIUE1ZNHRiMVBFaVg2Z1dxYTBsS2Z1?=
 =?utf-8?B?L3IyTDNod09QY2wrSE85d3c0aENsUm4zLzNNSUw3LzJkS0VUSWVudVlzNk1r?=
 =?utf-8?B?TTc2L1hObUdoeUFrV25pazZZWVZOQkJOSFVIdWNXNndaZUZEaGNnVWR2VXRO?=
 =?utf-8?B?SkR6TllvVm95SExQWnlkZFk2OWNvRnFvNjR1SDJwMkJQZFBqSjBVSzZRK3hI?=
 =?utf-8?B?VGtYRzJPTnQ3NUtqNTF1TlgvQ1JHUUdvZzNwMzUrNkRkOHFWcUwraUo5aVFS?=
 =?utf-8?B?RmtadXA5OTFiU3oxc1JEa243bjY4d2tSdUZNMkNqQ0JXRUMvSS9kTDdCck5W?=
 =?utf-8?B?MVAvKzNYTDJLalAxVDUyaWxIQUhjSDVJRkVZcGVRcU5QVDI2QVZGUmZYNXlN?=
 =?utf-8?B?dmZCYVU2RnRsMXI4OTh4cmxQb2VGbFR6SVVyZE5HREVmbEttRXlaSjJKdnlR?=
 =?utf-8?B?bmNteWhDZTFYTG02a2FTSGtZRE82ZHhrRVNJeTJLYkxoMlVvY1RSQ0M2ekhO?=
 =?utf-8?Q?mo4U2hH+eP23pB5aAw=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6124.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NG5oVC9rakxxNWsveVBpV0VvQ2liSEZoWVdnOVhkV1l3ZzYzNWw4d2RseVF4?=
 =?utf-8?B?d2tFVDQyRXltT3BSYkpsUmZjSTlhQXk2R3Z0cTA2QU1lL2lGZUErTXVNejVI?=
 =?utf-8?B?MlJ3WmRZbmFrenlZa1NtczIzU2JLR0Z2NjFRQ1poM3NKK25aU09Id3g2MGpW?=
 =?utf-8?B?LzhvbElrd3V0T2YxR1J4eUJyN2ZGWDdpU2xta0UweHV4L3IzWFNwS1RXTDNM?=
 =?utf-8?B?ZTNadGJZV0NJNUhySk8vTWRmVWlrU1FEMUMxcXRUSThTNzZOTTlESW00c1Jm?=
 =?utf-8?B?b24zSWNWbVJaS05nL3dBbkhKa0VHNGdHZWtlZ2d5K1haU0hmSkExWWxxOWFs?=
 =?utf-8?B?QWVoUGdXeWJLV1NWNURCR0dkR3QzSGxhaGJjc2xEZmNuWk9sYWYzUlNLZzcx?=
 =?utf-8?B?RFU0TThqOWRYR0h4b2J0TUwzT1I4NTZydlRHZmxEUUM4eGNQeUE2WkF3Vm9x?=
 =?utf-8?B?QjZuWmprTEFDN3IrS3ExUHkzQ3EzdmJzSFR1RlpjelBqZUNMdlhqWFdYQUNL?=
 =?utf-8?B?eW1qcFZDSG9uWE45MU9hR3JNRTlvUzhKa2xrdm9LSXZCZHAyQ2Y1aTY5TDNx?=
 =?utf-8?B?VDB6b0dzQmpoL0dCNk9admdhOS8vVCt1aENGNUhhSHlHaWZraXc5V2xNL29C?=
 =?utf-8?B?a1o3YiszYWhuYWZtT1pjRUtQdFZWTUZuN0doMFVzRWJWWXRRM0x2VTg5Z0sv?=
 =?utf-8?B?WFkzRmptTWI5Rm5JcGhRQUpoUURWSDl5YWZUcTRVcS84ejV6VTd2dUNYMm9o?=
 =?utf-8?B?Nkw3eDRaaWJKN1JqcVM1K1RLTDYrVGp5QmFoR0FQQXVDbGswMVZEM3B5cjlt?=
 =?utf-8?B?MFpaa0RHeUJRbHAwdFg0Nis3T1FjNmtINEdaSTlnY05JTFkrU2NaT25OS3BU?=
 =?utf-8?B?RC9QczNnWkZhenBReTlMN3NnV1V5WVdYNEUrbmNnT3ZMS3pLUjJWOEY4Mk1W?=
 =?utf-8?B?REZNT2tpS1N0aFoxYWNLZHpnQTJzQ3BkYUxXMStzSS9RN2RCNE55S1k0UXVz?=
 =?utf-8?B?eVRsbyt1VStEaExyMERsLzc0WTBCYXFjYUIreTd5OGowYlIxRkZyZGpTYjFh?=
 =?utf-8?B?NWR4OGpxOTVkZlFIK2hNT2VNR2NMVU81bXpZN2dSSVY1OUp5NGc5Ym50YkNa?=
 =?utf-8?B?MnNxcDhOZWpqL0E3dlR5Y2Z0S2U1eWlrQ1JkeXBkdXBXQmU4NEZORXFvZ2Ru?=
 =?utf-8?B?UDFKYTl0dkxtMExNeG1XSG1UbDZsdVJWVVc2bldwVjhHSHBET012cUxWWHZJ?=
 =?utf-8?B?ZFNaVW9xZS9zd09NZVZtWUEvU3cySWJRZXBvNVVWQmY1Y242OGh4ekNBQnpx?=
 =?utf-8?B?NjVkQVlVcFRBck94M0pJd0xoNGx2WUtIN2ZHa0pSc2dMYk5zNTVaWVorek9B?=
 =?utf-8?B?UzcvZFdadGxINUJuQWtyWFVwWDNxRmFIOUNIVUMrcUErL3NtOXhNeTNzRGN5?=
 =?utf-8?B?K2JnYjQ2MVorYzg0amZFNUdBWitMbldQb245VzFXVzV6K2xKNGEyMUU1UTFs?=
 =?utf-8?B?Y0NpbXZ3YzZiYlJKZ2xLQVdRb3BrSVhNZDhDLy9VbExSaXRLNndZeTA3VXVs?=
 =?utf-8?B?UnBFTEJHaWx5bXkwTjNCdTlVRGhhWkpGaGxKKytQWmozUytwbWt0VDhOS3ZN?=
 =?utf-8?B?UVpaSVc3S2FqWEZGdXBpOUNUNEtkbFFjRGlycC91N2FmTGptMU56TmhjWnMr?=
 =?utf-8?B?RE5reS8yVnY2bnVRZ3hhRjFWdzJaT3Y3STdNUTUvbEFXa1cvUkxDa0F5bzZT?=
 =?utf-8?B?MjBNYjlxODlvWndXa2NGbWkyN1NiQVA2YWpGTSsveDBWRzllRUdMMEpNREJ0?=
 =?utf-8?B?R1pDWlZpUVY2Mk43ZkxyVE9COTlGcndiRzhHSjlYTUlyVXhIaVAxTjl0Q1Fk?=
 =?utf-8?B?WmIyUmtsbXlSWVUxeVk4cGZpUEVQOG1lOGJseURoZGJQS0VsSGozSjBZZDNU?=
 =?utf-8?B?UkFjWE5LMjlDZDJGMHdYZGxFWjV1VTducFAyRVNtc0EvT0JBNUpyUUh0dWNN?=
 =?utf-8?B?VE52VklXOTRUVjI5eXdwdGV1dnF2WTk2eDljU05nUkR0OC9IcGR5M2U2WXZo?=
 =?utf-8?B?bk5Va1FCTWcxME1rY2JMci8wNzZ3L0FFWjZrM3BGZUJyanp4OU5ia3M0Y2E3?=
 =?utf-8?Q?IeMUI+obWD/C52GzA1OG+IZ5O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e397db35-1608-4f59-a75d-08dc9fd5bba9
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 05:12:30.8238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9+Zcy1rqk/MXOvG4yBnb0CQVUPu7AQgqay3pcd/oyfnK6bf+LzxMS3hLwS334rV7PvmzYFIbZK8iTXXjbwSFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6424
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "felix.willgerodt@intel.com" <felix.willgerodt@intel.com>, "matz@suse.de" <matz@suse.de>, "keescook@chromium.org" <keescook@chromium.org>, "jhb@FreeBSD.org" <jhb@freebsd.org>, "binutils@sourceware.org" <binutils@sourceware.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "George, Jini Susan" <JiniSusan.George@amd.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Apologies for the delay. I am sending the new version patch with below 
changes.

On 5/31/2024 4:28 PM, Borislav Petkov wrote:
> p type, size, offset and flag values for every xfeature that is present.
> + */
> +static int dump_xsave_layout_desc(struct coredump_params *cprm)
> +{
> +       int num_records = 0;
> +       int i;
> +
> +       for_each_extended_xfeature(i, fpu_kernel_cfg.max_features) {

Modifying "fpu_kernel_cfg.max_features" to "fpu_user_cfg.max_features"

Supervisor bits also set in "fpu_kernel_cfg.max_features"

(https://github.com/torvalds/linux/blob/master/arch/x86/kernel/fpu/xstate.c#L777)

> +               struct xfeat_component xc = {
> +                       .type   = i,
> +                       .size   = xstate_sizes[i],
> +                       .offset = xstate_offsets[i],
> +                       /* reserved for future use */
> +                       .flags  = 0,
> +               };
> +
> +               if (!dump_emit(cprm, &xc, sizeof(xc)))
> +                       return 0;
> +
> +               num_records++;
> +       }
> +       return num_records;
> +}
> +
> +static int get_xsave_desc_size(void)
> +{
> +       int cnt = 0;
> +       int i;
> +
changing "int" to "u32" as per review comment.
> +       for_each_extended_xfeature(i, fpu_kernel_cfg.max_features)
> +               cnt++;
> +
> +       return cnt * (sizeof(struct xfeat_component));
> +}
> +
>
> +
> +int elf_coredump_extra_notes_size(void)
> +{
> +       int size;

Adding below check, same as in "elf_coredump_extra_notes_write"

if (!fpu_user_cfg.max_features)

return 0;


thanks,
vigneshbalu.

> +       /* .note header */
> +       size  = sizeof(struct elf_note);
> +       /* name + align */
> +       size += roundup(sizeof(owner_name), 4);
> +       size += get_xsave_desc_size();
> +
>
>   #define NT_S390_TIMER  0x301           /* s390 timer register */
>   #define NT_S390_TODCMP 0x302           /* s390 TOD clock comparator register */
> --
> 2.43.0
>
>
> --
> Regards/Gruss,
>      Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
