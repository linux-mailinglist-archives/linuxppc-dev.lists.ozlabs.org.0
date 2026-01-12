Return-Path: <linuxppc-dev+bounces-15526-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A397CD10385
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 02:01:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqDb22jTHz2yFK;
	Mon, 12 Jan 2026 12:01:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.46.30 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768179662;
	cv=pass; b=emXuR2xku9J5r3QUkv+mk2qt0vW6cAoZq7ijrPAhMZP9IX5QqWcqltlaoXkSaL1ejF8EKofE5FNhaFr2TpJCsPkhGauM8zWk1QY/NR6GYodEwI+GDh4QrVptvodaZb5WqQTrfiHjJmi+w5GRMqpBomCI/EfvQEo2GqFMIN1Tr2Xz3lUFsFjd72sUl0E0kCGdsIXJuAoaWAJvQTzrErxbUY2Pfx/tS5y4mM40LDo7vS67bXiviZXlJwMrtP9Y2o1Wx7AAOr8/ELFLapAYeOusTOsI9sO/dF3NYGJiHsbNn0Rgs50JhOr72Xgrjdlm+8r9NelsJxAd1IdK2/k2QOgOLw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768179662; c=relaxed/relaxed;
	bh=r+meQ6zbdYPWRMSc2n+22RHDs+DG44QvVuLeQb0l3NY=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nnP9rMACSmKl5VXq6R4+YUPMAJ+plEF3G0Edi/jqnQtlXf8elwt3JEmIXkkCneSAsmDj0/YdXdb8uDwWGQPZvwH5Baqu4EnRjxwc+1JHHxdjKDI+E2tAhoU5GBXtPC6s3FbDGR8uWbs1NdFYy8mqtBkwdFnSMXk2AXZpi2J/59TopcEvlvDJV394yG+zvbnq6ea1jqy64Vb3xHFUjTVGgWsm5mjr7Aga/VUNOJ8x0SDjNrWOG57H4GVYqcUEwqdfYOmhu742SDSPMt1Gx/4B6qO+Hxw+vjsEJgD25acx7+Q42G7vWttNBJlqhZp8fehnlzr5qxAzqja0svOq/GGxag==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FOWrlhCe; dkim-atps=neutral; spf=pass (client-ip=52.101.46.30; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FOWrlhCe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.46.30; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010030.outbound.protection.outlook.com [52.101.46.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqDb12gsPz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 12:01:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMfoF4MJD3TLgH1fHCz1Oat+LISY5SM+gvm0XdebW3yRXrsFv5f6f9XtjPmYVABOUBsncH65xgu/eGn37eCFMj1dSYc3nCSj4RXzjnD2LgvMLkmDVSapolHcrAtv+NRqZVDoBkz60u4eyHSLtWnMPsrV31AsnBh52J021+g0gacDWel4FX92AA1GFMFCJUStCjPrcIXypQmmcqv0pYO+8n9wdzDkKB3xbje/7yyk3w5nA2WBIWH+AfglbWbbEqrZiMyFaTdo1d6z89H1LOk7a/DAZUWwpfeEkL0PS+UdopwbCZIncq3q/LTm5AJMZRBEk1YXNYvdn99Ux2Bjfgrz9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+meQ6zbdYPWRMSc2n+22RHDs+DG44QvVuLeQb0l3NY=;
 b=oya1nJy5qNlI3UV8huCKm5d2G0JRZ0nDyMQ8Gw7W0zPpXuh7aBy0VknKsglBG5uji/nh3lYfKGt5WlD50doDHxYzVMvbZ+eUmzRZ1ZKPGE+F9nQoCsSbVZAgWH4JtyANUEVDVGBYlcPpMIxef9jx2dIYxOgepg4tzw+6K24/uSC8kOwFBBaokCcu08WgSNmEvbVPKvot8VqK/W99bXa3r68gu0WHv3HSMs5bfJNNU1wzdGtK4lM6gInu5lYjG369WkIszsaPv4wQDmKwJCvkCxLjtqCuk8QhA2pioFCu21Lcsa5PiOZdYjA80LlXWj/k7MAalqtw+M5kEBUaVCnbaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+meQ6zbdYPWRMSc2n+22RHDs+DG44QvVuLeQb0l3NY=;
 b=FOWrlhCeZLekaGr0TnY15KjY0xR5ssRpLoQqT8q5ZWFAcoFilswbb8qeKqp7YiqtF+VpQa6Ormr+8sBv4rjyuym7ZVQHuhQSF14dGF25QsLozsSfcNNX2DK/+jxKiygq95T6EubG12HDovD9RsyXT4pcydvjkd1uahkBAAY+c1UGHzLiJu1Vb2KrYHGJn5mpk2oiOixfI7n56fn00xmCjkDelKWXDmhyTKxv1aV0rHS9JSWBe350Im5GhKyFhsnFug4y0l3sZHk0ivSBnXWAhenUWxOUo7rKQ1Q0379h5ifPUe4SkqG5fA8kJEs/XOCYvmPvNkYVu37yC0gOAFCWfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 01:00:18 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 01:00:17 +0000
Message-ID: <375f5d20-7c15-4f8e-a9cd-c58e3e398c62@nvidia.com>
Date: Mon, 12 Jan 2026 12:00:07 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] mm: Add a new swap type for migration entries of
 device private pages
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107091823.68974-8-jniethe@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260107091823.68974-8-jniethe@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|PH8PR12MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 17eb325d-e198-4dca-e597-08de5175f3d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXRwaXZPdHhpdGxaWUt0bUkzL1grckFtd0ZZalF0UWJMM203V0g2S1pRbkFj?=
 =?utf-8?B?ZTVlK21HZ3FYSW53VHIrOG12bTJjeXpnYUQwMmpvaWJvaDRGTjVTek1KdU4x?=
 =?utf-8?B?ajAxZng5WDNHU3VZY1grVS9EVHI0a3NFRnNYSU11MDY2dmRlMFZGTGlyU2VL?=
 =?utf-8?B?b3BzRmp0a0VRczRKbG1FcGcvVVpiWm1zOTQxK3laK3J5bm1hK1FPZXJoaCta?=
 =?utf-8?B?ejhKdWJSOGpwTWtNMHJSMlFXb3o5Ym5lTG50V2xkNjMyNDhXWlhCUVRZaTJ0?=
 =?utf-8?B?ZVVGSXhSd3gwbzJCZVJDR1dCOEZHeDI2UGY0REdTb3M1OWd6QmkrTlRhL2E4?=
 =?utf-8?B?elk0YjJQTXMydVZFMWhiS3I5aHJJem9nWUJYQk1aVDZaMlZtVWRCOWUrK1F2?=
 =?utf-8?B?d0NBZ1FFc2QwWlJaQlJOMDVMVkJQdjYzak5vRVZnODVPWHNVSHBkTDlpZVF2?=
 =?utf-8?B?TWNMYUw0dEJNbEV6cjR4dkFNU3FxWXp6NksvYnpHZFFMM1lkei9lMms5OTdC?=
 =?utf-8?B?cTc2dE8vampKVDZFZUpjcjBIQ3FwU0tEeGVUR2tjS2s3OFdIbzNMeU1TemxQ?=
 =?utf-8?B?U3NBQllpSjlvVzlhWnBiZ0FMU09iWXFaVmFSZE55eWpvVXBGL0ZxcERoSkhL?=
 =?utf-8?B?MXZFMWxURHBISVM0bGQ3YmpvaUlYZmlTOTNLRVdab251VUU0VzJCeEpoTTVq?=
 =?utf-8?B?OFpkNTJIdXJQOElmNzVNd3RPRm5HRlpCMlA2MkhHajdNT3ppNERSOFVyOEZY?=
 =?utf-8?B?MnJ1azNGUFk3OGRrQTlJeGtqaVFPemNZYzVlZmRzeVJhSGVxY0M1KzNDQm5p?=
 =?utf-8?B?aU1HT1QvcVdldjJmaFh3RDNOQzRoNjVqYnlaUmFTczdPYUhNd0VSNlg4aEpF?=
 =?utf-8?B?cFVUeFRoUitYeDlOTlZHZzYzQkNDK0MwWjlVM2hVNVRzWjhrczRNRWR3ZGtx?=
 =?utf-8?B?elJ5Z25jekFtSWNTeGFRSmttaVVuQVZCS1RrUENpc0huaXo2clB2a29qRFZm?=
 =?utf-8?B?bmFkSHhySEhJdWZuTFJHNTVaSDNPNVdVVnJKK3lLWVRFMUFyWVY0UlIvUzB1?=
 =?utf-8?B?aTRpejZ0R1ZzYVZoR1dBdDFsNFpuckNueFdZYTRoOHkrcVFvYitpc2VHUWNp?=
 =?utf-8?B?QVBBRWdOSEpWZzdHdUhZb0V0cWtIK2tzRjZQU3M2TVlsOFJsMDBvQnZ2WlVI?=
 =?utf-8?B?WEVFb2poekgyQVpGbDRlaWFUdWh2bVRFcjZERlNjdlVYbUhCYlIvN2VPQlNS?=
 =?utf-8?B?M1NubEFsS05tMFBUQ3AvcHFkVFltdDZydGJKNm1xUlI3Wkp6dHMwMTlhRE1p?=
 =?utf-8?B?Nzl4Ukg4aTB2TTNSTXpmQ0Q0bzU3QUJSeUhFcGNEb29CTVZFbzJBWlMyQ0hm?=
 =?utf-8?B?TXVYNUJ6YzR5T3p0UDNWNDYzS3AzK01TYmJQdVRpb1RCU0FuOVhkRUsvNE55?=
 =?utf-8?B?K1dsck42MjlWNjd6SzBVUUc1UVJRUk9pWStreVFQS2hidWFxeTVMUStvZE5B?=
 =?utf-8?B?ZzExQVpOUDhnTXZtRi9kMG0zKy8rNGhZbFpMMDVQSExwRTk0eWNERlU5d3hW?=
 =?utf-8?B?cXJGOEtYYm5ha2M0d3o3Qy9ScTN6bXBFZVFPYTNoeU5IWHBmc3ZLZnFpc1BU?=
 =?utf-8?B?UHkvRjVFNTZGNXhLa3JINDUyVmh2aWNHdHBNdFRqQnprejlJRjdOUUNxSnhB?=
 =?utf-8?B?Y1ZwSzZEN29uVm9Cbjh1ZDU1dWZHc1hiSld6MVoxVUVPdlFrL1ZLOFM0dHBI?=
 =?utf-8?B?Q0ZDU0FQWmowM0p4VUpxdkFaZ0E5bUxoVEM3WGFqRmJ5Rnp6NTg0NWI4MmJT?=
 =?utf-8?B?R3Uyajkrd3RhL1NtYjF0MXUzSWdQUERGOXFZeVlhMjVwS3Zmd1lYNkhad1lF?=
 =?utf-8?B?cFYzUHFyMlArRldxS2tjV0xpYlY1NkNNbkVPd1dWQXJBRjUwUjZaaU12UjNB?=
 =?utf-8?B?MzR5VC96N0tLVmVyc3A5SEltc2lFaERqTUh6TjVkV25YZ0t6bkM2T01SYjkv?=
 =?utf-8?B?bjFmNHFvRFJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R01rZWhmK0t6SFdBckZ3dU1sNnNMZFIwN2Z6TW5KODJqNTNaT1FZNTR0azVQ?=
 =?utf-8?B?TzBWSXo4SC9DY3VYbEZCcWhoNDJSWUlpcjN3czNoaEh4QWp4aGJtZ3lIMXNW?=
 =?utf-8?B?Rmcyazk0aGxSdEttb3Nvei9WSTd5V1c0MVZHWWwzcUdLbHo2Z0NsRTVWNzRT?=
 =?utf-8?B?cjNCMjBUUVlGWG51bXU1VmRRSS85NmxtazREM0VOZnQxS1lHUlVCQWJoQmFl?=
 =?utf-8?B?bC9lSG5oVWNLR0tVVEI0U0FXcmdoQ21SdzNBbUVLK1REamt0YkVvUGhOVm8v?=
 =?utf-8?B?K1RUWVJiT1ZsNnd3ZEw2Sy9TeXVjSTh2bHp0MmxiRVdXeEpsVzRGWU1raDJC?=
 =?utf-8?B?WG81VnNwa3M1SWp5SUhEUWJ4Qk5kYURzY2t6aExONWNVemMvTndyZEpYd2RO?=
 =?utf-8?B?bUI3R1RpUG5oTUhucFUxRXFoak1hS3FLWUZPeng2MTRLZjBIV2pCdTI3dlNS?=
 =?utf-8?B?SkJEUVhtMlV0ekZNUnhZK0c4azQ2OWw1b2NuWDdJZ2xlL01HZjBmNnZUZGlE?=
 =?utf-8?B?N3RHcU11TTdJYVFzL2s1VkZsWHo5ZWhpdlpnWTFYUGVlUkNCZTNYU1UxNjEz?=
 =?utf-8?B?WEMzRmtmYlJnbkc3QllYV2tNRmNTajRqZ3d5RlVhSlNOVUVBSjhEMGJPSVdj?=
 =?utf-8?B?UmgrWDd4OVBZZEVhMEw1UDZPRGk0cHNJMHBkQ2RuOTFjdDJjQ1RLL2t4bHov?=
 =?utf-8?B?NnlOdURaaXp1aUc5dWlXYUQ1ZUxNc0tDYVFXd3JIekdWU1JZc1VucnRMK0ZQ?=
 =?utf-8?B?RXdNL3lpQjhFNi8xd2YrRXU4K0pKQzE1UmpMc0pEM0dUMmRjNGt1c1o1em9B?=
 =?utf-8?B?N1F6K2xmSnBFTEI5OG9ZY2t3UFBPbjNwZ3JyTTFZRis0b2JuY1k2ZFlwVk9B?=
 =?utf-8?B?dXpINjZLK01FNitSVUJLUmVqMTU0L0RNRnZpd01JSzhMMkJWWERLMld3allM?=
 =?utf-8?B?Um1uSzltM3JjWFlkdEtXMUFJbitvZEMwdFFFOE5uTlM5OTJwa0NBYUozcito?=
 =?utf-8?B?ei9CYTFRV0hFMVZlVmFuMXVRbG5vUU95N1V5S2tiWVhtLzl1ekx5UnBHMW5r?=
 =?utf-8?B?R3Z2VFM0bC82K0VzdzRUWGxYNXBuTnBzckdkSHFRcUxIYittU3RmdHhkR3R1?=
 =?utf-8?B?bW1jVEtjVlJyK2tyTzU2SU5aNGtUS051OENFMDlPSE9YdEVtOXNtYVhhTjQz?=
 =?utf-8?B?N0VJQnNpNnIzWm9neE9TekpQUjA5WU41MEwxMDl0RXA1WXpBekF0NjRDYURx?=
 =?utf-8?B?NXg1bjR6TWM0UmM0VG8zZUtVR0pBckhlUExjL2hXOThaY1IxVW45WEFFcXFU?=
 =?utf-8?B?czFsRzBnUGpwWDZjbHlJbXZHVWYwQlFsZHZvbVhzRjdNemZJK0srMVZlVGNi?=
 =?utf-8?B?WVNuWHlYSGJ6SFlQVzFWZmFWeDJ6K1FRa1MxSXNtSlhnSmRxNCtmVGc0TXBS?=
 =?utf-8?B?b29mQW5EeC9DVHBxbTJZSlAzU1JSanlkbWt2Vkt3ditxRTF0RHNBSHBPY2Vt?=
 =?utf-8?B?cXZ6ODFCZVAybm45UEF4WTh2emNXZHJIbWNNbXZ6UjI1YUREQXRyaFpxTStX?=
 =?utf-8?B?OTlNUWczUHJLV0JCV3lXNUczOXFXU3FkbkIzZlgrRFRWRFVYVmNXSVdXWkk2?=
 =?utf-8?B?ZjR5SmwwbGhvR2ZDaEw3ZXRscW9WT2Y3K09NNVVkR3Q4NnlmVUdGMTFkdkF6?=
 =?utf-8?B?V2UyZHZlZ3pqU3FVU0lLYmNBUUs0a0R6UjVNZC96Q08wc1hMcjNWa0ZJd2dw?=
 =?utf-8?B?ZFQ3MnpRdjZ6RW9XQnA4K2hTNHg2R2syMTNCUlZPTFM0di9UM1dUU0NUbm9S?=
 =?utf-8?B?NVIrcS9LS3k4dDgwYlgwbmhIQ09rRlpaYlF1VDAveDhtWUU5QVVadHJoTUxI?=
 =?utf-8?B?UDNWYlhDSjJPaTJTUm1nWUdRZ1dHdENXS2NkVFNZKzNUVDZGT2NrYStPY1c1?=
 =?utf-8?B?L2k3bGVFemQ5RHJQcStaT2k1Y0N0bCtnMysyWm9KUkJKSkVuZ1ZlMHA3aDFq?=
 =?utf-8?B?TmZmTGhNN1ZJUzlHTGJNbHdRSW5Tc0xPZGw0RHhkbmIwWmpSYnlhcDUreUUw?=
 =?utf-8?B?a2w2ODVtSER1NW9nZFA5Qm1id3lkQ1haNEFwQkNHUWFNcm9rWTBJMEVidU1M?=
 =?utf-8?B?eUdRMmFBOGxUL2hOZ1JENk5aL1hVTk5TNWVSblhJV0ppeDhsK3pxRjBTRlhp?=
 =?utf-8?B?Q0dGaWFnNUZScldMemltZThpejRRTGgrQlpxNEQ4MmhyKzJSMXpJaVY1Q2dF?=
 =?utf-8?B?bzArN0NvQlhWRGZUNU9rOWV4L3RoYWxldmJFTUxGQ0x0ekJNUWNPUFlpLytS?=
 =?utf-8?B?MkhwRzRDV0gveE1EMnV0MHk3TS9OVWJMYmVUMHFzZFo2WHVNYzFvQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17eb325d-e198-4dca-e597-08de5175f3d1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 01:00:17.8202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYFbfUWO29eH7n1Uyfx2wP5aGqrcS4CIMy/VQKEqGNv//Hsy/SXtsO9w0uE+pkaxBEC/9IuySeT2v469xf4vAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

I am copying across this discussion that occurred on a resend of this 
series on the intel-xe list for a wider audience [0].

[0] 
https://lore.kernel.org/all/8bf680f0-94ed-4614-9ace-a081a6558460@nvidia.com/

On 9/1/26 06:08, Lorenzo Stoakes wrote:

 >> @@ -28,6 +28,9 @@ enum softleaf_type {
 >>       SOFTLEAF_DEVICE_PRIVATE_READ,
 >>       SOFTLEAF_DEVICE_PRIVATE_WRITE,
 >>       SOFTLEAF_DEVICE_EXCLUSIVE,
 >> +    SOFTLEAF_MIGRATION_DEVICE_READ,
 >> +    SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE,
 >> +    SOFTLEAF_MIGRATION_DEVICE_WRITE,
 >
 > I think these should be SOFTLEAF_MIGRATION_DEVICE_PRIVATE_xxx
 >
 > And I realise that's a mouthful 🙂
 >
 > But to be consistent with other naming, including 
SOFTLEAF_DEVICE_PRIVATE_*.

Sure.

 >
 >
 > I don't see any users of this, do you definitely use it? I mean 
presumably you
 > might in a subsequent patch, not checked.
 >
 > Otherwise I'd wrap it into softleaf_is_migration().

It gets used in the final patch of the series when we begin doing things 
like:

static inline struct page *softleaf_to_page(softleaf_t entry)
{
     struct page *page;

     if (softleaf_is_migration_device_private(entry) ||
         softleaf_is_device_private(entry))
         page = device_private_entry_to_page(entry);
     else
         page = pfn_to_page(softleaf_to_pfn(entry));


 >
 >>
 >>   /**
 >> @@ -211,7 +279,8 @@ static inline bool 
softleaf_is_migration_write(softleaf_t entry)
 >>    */
 >>   static inline bool softleaf_is_migration_read(softleaf_t entry)
 >>   {
 >
 > For these ones that you are making sort of compound now, can you 
please update
 > the kdoc to reflect it? You've done it for others but not this one.
 >

Sure, sorry I missed this one.

 >> -    return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ;
 >> +    return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ ||
 >> +           softleaf_is_migration_device_private_read(entry);
 >>   }
 >>
 >>   /**
 >> @@ -219,12 +288,13 @@ static inline bool 
softleaf_is_migration_read(softleaf_t entry)
 >>    * readable migration entry?
 >>    * @entry: Leaf entry.
 >>    *
 >> - * Returns: true if the leaf entry is an exclusive readable 
migration entry,
 >> - * otherwise false.
 >> + * Returns: true if the leaf entry is an exclusive readable 
migration entry or
 >> + * exclusive readable device private migration entry, otherwise false.
 >>    */
 >>   static inline bool softleaf_is_migration_read_exclusive(softleaf_t 
entry)
 >>   {
 >> -    return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE;
 >> +    return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE ||
 >> +           softleaf_is_migration_device_private_read_exclusive(entry);
 >>   }
 >>
 >>   /**
 >> @@ -241,7 +311,7 @@ static inline bool 
softleaf_is_migration(softleaf_t entry)
 >>       case SOFTLEAF_MIGRATION_WRITE:
 >>           return true;
 >>       default:
 >> -        return false;
 >> +        return softleaf_is_migration_device_private(entry);
 >>       }
 >>   }
 >
 > So all of these above ^^^ are making it so you can't determine if an 
entry is
 > 'migration xxx' vs. 'migration xxx device private'. Is this ok?
 >
 > Does anything need to exclusively determine if something is a 'migration
 > xxx'?
 >
 > If not then fine, but just wanted to check.

The new entry types have the following relationship:

SOFTLEAF_MIGRATION_DEVICE_READ is-a SOFTLEAF_MIGRATION_READ
SOFTLEAF_MIGRATION_READ !is-a SOFTLEAF_MIGRATION_DEVICE_READ

So it is remains possible the distinguish the types using the
softleaf_is_migration_device_private_read() check

In practice, the only reason for introducing this new type is so we know 
when
we can not call pfn_to_page() on the swap entry offset. That is the only 
time
that the difference matters.

Rather than introducing a new type we could accomplish this by adding a new
flag like SWP_MIG_DIRTY, SWP_MIG_YOUNG but my concern was how we handle the
!migration_entry_supports_ad() case.


 >
 >>
 >> diff --git a/include/linux/swap.h b/include/linux/swap.h
 >> index 38ca3df68716..c15e3b3067cd 100644
 >> --- a/include/linux/swap.h
 >> +++ b/include/linux/swap.h
 >> @@ -74,12 +74,18 @@ static inline int current_is_kswapd(void)
 >>    *
 >>    * When a page is mapped by the device for exclusive access we set 
the CPU page
 >>    * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
 >> + *
 >> + * Because device private pages do not use regular PFNs, special 
migration
 >> + * entries are also needed.
 >>    */
 >>   #ifdef CONFIG_DEVICE_PRIVATE
 >> -#define SWP_DEVICE_NUM 3
 >> +#define SWP_DEVICE_NUM 6
 >>   #define SWP_DEVICE_WRITE 
(MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
 >>   #define SWP_DEVICE_READ 
(MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
 >>   #define SWP_DEVICE_EXCLUSIVE 
(MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
 >> +#define SWP_MIGRATION_DEVICE_READ 
(MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
 >> +#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE 
(MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
 >> +#define SWP_MIGRATION_DEVICE_WRITE 
(MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
 >
 > I've lost track on how many entries we have left, have you tested 
this with a
 > config that maximises the number?

Good point - let me double check that.

 >
 > I really hate how we do this by the way, that's another thing to 
fix... 🙂
 >
 >>   #else
 >>   #define SWP_DEVICE_NUM 0
 >>   #endif
 >> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
 >> index a9ad997bd5ec..bae76d3831fb 100644
 >> --- a/include/linux/swapops.h
 >> +++ b/include/linux/swapops.h
 >
 > Since this is pure softleaf stuff can we please put it all in 
leafops.h if
 > possible? I know we already have some stuff here rather than there, 
but this
 > really doesn't seem to belong here.

The reason for adding the swapops.h entries to correspond with the softleaf
entries was it looked like the swapops were still required for making
the entries currently.

That is, there aren't softleaf equivalents to
make_readable_device_private_entry() and friends yet.

Would it be better if I introduced the swapops.h changes in a proceeding 
patch?

 >
 >
 > Cheers, Lorenzo

Thanks for reviewing.

Jordan.

