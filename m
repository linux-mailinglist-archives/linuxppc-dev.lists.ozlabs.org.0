Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C81F457F0F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 16:50:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HxHzT4jrZz3bfv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Nov 2021 02:49:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=NextfourGroupOy.onmicrosoft.com header.i=@NextfourGroupOy.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-NextfourGroupOy-onmicrosoft-com header.b=qXFV4hG2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Two or more type
 TXT spf records found.) smtp.mailfrom=nextfour.com (client-ip=40.107.5.51;
 helo=eur03-ve1-obe.outbound.protection.outlook.com;
 envelope-from=mika.penttila@nextfour.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NextfourGroupOy.onmicrosoft.com
 header.i=@NextfourGroupOy.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-NextfourGroupOy-onmicrosoft-com header.b=qXFV4hG2; 
 dkim-atps=neutral
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50051.outbound.protection.outlook.com [40.107.5.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HxHyb661rz2xgb
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Nov 2021 02:49:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oD3F9dvoZdbkQPBve2lQftNNVab1Fkcr0lnj9bcvyYT4+8dNDrIa/CtBtChOciREc7+QHczKSCjJX05yLU2pyVx3EOHDNef/auyzfcJj6rn8/GyitwlYg3F52rjRQjdPl+MHE/9hw6bPhAJwqlOvvL6SY+7xDxP6S6UEDDKlBS2KbsraX9l2pRrUr1w35t4ktMmC4SlzcXF4EhYDy6vn8NoO8OfUp2RIUJNDdbwCKmekb5GVAXnbyAh618BItWZ3LT2YNoUyvY2B7sFhIWZuxUcpYaEH+U5VYaNWRNdmHaHCGJ9fh+zhsOIV7Mk2n88XknFGPLVk4YwQRyvivDSegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eSIOx05ZlZFvTjs8Z+x2u1vR8mqEgVOJyrlmUYbuBk=;
 b=exL3pgq85ul7WX3IYkCkxWmQolEYr49nAmD3x1C/0+WyNt38sJRGnl2JOHXjS/NCtb09rbc4FQXCvTCmfocTgNmbhAEx40BFqLkX/IJvK3wbBzPR9z1sw6SMDRUa5A9CC3PhnJ7YlnQHZ1Si3uvPWpMbwxPQ/2JjWfFZXT6FbMyDXDiOczA1PASXRPP4Z1rvN/VrkgyiyvieHqP+7p9SAQmnidnxqSO3xmgBbE7Xn8vUPL5zvKRfojvHMH3CjrCQsnyQj9QEHH0GpMONIR8HOEl0DYMqIAgbxW4iUNNFyF16av8+bf1VQqtNEDeyym16p02Ubj4omgIIjDOD0Wd0+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nextfour.com; dmarc=pass action=none header.from=nextfour.com;
 dkim=pass header.d=nextfour.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NextfourGroupOy.onmicrosoft.com;
 s=selector2-NextfourGroupOy-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eSIOx05ZlZFvTjs8Z+x2u1vR8mqEgVOJyrlmUYbuBk=;
 b=qXFV4hG2ESmz58E4f/gSM2UWNBJtrsfIwIMnFk/jLfz7pxlesc+QEpRez4BNM/qd4Kt4kf6hOskZDTpW6AKJkMqyiu3W4nHWe9N+TBsYpx2VUoCwhsHKwzCamv4Hvy/jspoWfG7ZjafAET7u3+FRxWlaI3k1Mnx1MKmIm72iApE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nextfour.com;
Received: from DBAPR03MB6630.eurprd03.prod.outlook.com (2603:10a6:10:194::6)
 by DB6PR0301MB2277.eurprd03.prod.outlook.com (2603:10a6:4:46::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Sat, 20 Nov
 2021 15:48:47 +0000
Received: from DBAPR03MB6630.eurprd03.prod.outlook.com
 ([fe80::78b9:c389:1d86:b28e]) by DBAPR03MB6630.eurprd03.prod.outlook.com
 ([fe80::78b9:c389:1d86:b28e%8]) with mapi id 15.20.4713.024; Sat, 20 Nov 2021
 15:48:47 +0000
Subject: Re: [PATCH v4 11/11] KVM: x86: First attempt at converting nested
 virtual APIC page to gpc
To: David Woodhouse <dwmw2@infradead.org>, Paolo Bonzini
 <pbonzini@redhat.com>, kvm <kvm@vger.kernel.org>
References: <20211120102810.8858-1-dwmw2@infradead.org>
 <20211120102810.8858-12-dwmw2@infradead.org>
From: =?UTF-8?Q?Mika_Penttil=c3=a4?= <mika.penttila@nextfour.com>
Message-ID: <d87de1ec-8be7-3967-87b2-c8906c1ab1b3@nextfour.com>
Date: Sat, 20 Nov 2021 17:48:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211120102810.8858-12-dwmw2@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: HE1PR0402CA0021.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::31) To DBAPR03MB6630.eurprd03.prod.outlook.com
 (2603:10a6:10:194::6)
MIME-Version: 1.0
Received: from [192.168.1.121] (91.145.109.188) by
 HE1PR0402CA0021.eurprd04.prod.outlook.com (2603:10a6:3:d0::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Sat, 20 Nov 2021 15:48:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b54d4d4-80fd-4cfb-5b9e-08d9ac3d3d63
X-MS-TrafficTypeDiagnostic: DB6PR0301MB2277:
X-Microsoft-Antispam-PRVS: <DB6PR0301MB2277C06C119D7FF74E1B33A9839D9@DB6PR0301MB2277.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oHn2Sg7PgYCKK7nC5Z3wJ9ZfRzQ/HfbFNExFc7UWvCvltO8q3C1a0VyZNkCBbta9QzVhflG+HsNlQ329lNG5U7nal+T5rtFnsCzP2l4p0GgyG6cf16DrQeMIPLDHsZmZofPFUyooGi+a2gK4JAMCcVK7qQ1kEKysTZkl3+OdyjIF2o+TcdSC7aFnU45VmWsaonXbNpQj/F4Ok5BarbONFlY8z6EUMjqioFy2Y/txrOY0dniQd8DeCTsSOYZieultSGl8kIba80sjrzjQ/ynVzJuVAqgmD3te/Bxf8YeCVELub9eo7C9M85R24WYW0SrJVc5QUJ5v1l3OhP6kbyC6g0zldKAlfSiaWSh9kbcKrGfKhJHox4p7JBJMLBXmM4Pokmj1pmtzcHHWXb6t1OowgPsFzrz9kjxATW7RSSNzjzXYTIJ5f3T4i1fOSbTldtk8UJgdnyCscxtcxLrqboKoozI2EnuwTOxVThWLbks/WCTxOSpC25vLSjefnGSErM5SCx8WIU9ZER7LiMEwUeLL/EAY+SY7W77soj3pKnKEqNUOHW/ZRIdpxgrhM2832C5L2BBN2VZm2vmJ+uvJK39kF0KCBoSiOB7fTA4DnLzGfzgPM/uNfIRC6Nehzh4XWCBYSPlSJP8q/hYSzOf+oF5+zuuI1RH+v11PSuteIG9JinLrMx8/oxKuAJIl38PWmSPIdyjIRT8jyqkP+VI7DTkZvC1fhm7IiwU4N9tif7DHCucv8aS23JQ/WHZSOettwqpO7L/3Fuz/e0dqae2A/TLCtDZzjyfDxmEa0oxFkjjKNHFmBBvjSFaEpJyCTiy5SUz7zSupUQGL41KTSdBRn6UXtXKLd8AyWl2RNrPllx5cVC8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBAPR03MB6630.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39830400003)(366004)(376002)(396003)(136003)(2906002)(54906003)(36756003)(316002)(110136005)(52116002)(186003)(8936002)(31696002)(16576012)(4326008)(966005)(83380400001)(508600001)(7406005)(31686004)(7416002)(6486002)(86362001)(5660300002)(8676002)(26005)(2616005)(956004)(66556008)(38350700002)(66476007)(66946007)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUhia2JqcUJmRUNxWDVvUk4zSzA5dkRwcFZiRiszUWYwdlh1YmFZN3h6ekQr?=
 =?utf-8?B?ajNnUmQrNkY1WVJOZm52Qzh1aVB3dUFiWXBnVG5xZUkzcStObGYzSHRPbHB2?=
 =?utf-8?B?eVdKSk9YNHJaTHQzR003YUhUZVpzWUdNd1R6UjA0UDFPMnQ4dlczc04zMUhm?=
 =?utf-8?B?aXJVd0NzVG80Y28yMTZKRytTQ29IZ3Z3MnFwbjdZSnBBNEtpL2lDc050c0ti?=
 =?utf-8?B?YnZHZnA4MEl0OHE0TlJFL2tNMGVxakcwVXRYUngwblJDbFl0dnlSSWZuVWk4?=
 =?utf-8?B?b0FpNWlxL1F6Zkhocy90ZEtqNDZhMkl6RndReGwrMVRpVXo4TXpLci9TY0R4?=
 =?utf-8?B?MWlaL0VhUkpsVzBDVFlvdGsyUE9wR2RKNTVFeFVOZEdJcnc4QXJ2b21QS2gy?=
 =?utf-8?B?bk9KTmhvUWZmZVdVdUJsRGVjUURYRzl1akp0WGJrZ3BIQ0VPaDA0U1U2N1hJ?=
 =?utf-8?B?T1RXRFpjRHk1cTU4bXk4U2xYNXpYL0psRXBRN1hIMVpyVVJBekNNTzcwS09t?=
 =?utf-8?B?SVFrNlVrdUJEUHN0Qzl3aHVxWHZ1NGdrTGtpYitjV1ZQUkp5N05CL3c1bGdy?=
 =?utf-8?B?dEZMT2dPM2hQaHJlUWZ5WjhVL2RWQUowTFBLT1U2Tk9KbUh6aVNOb3FCZ3p1?=
 =?utf-8?B?TzV5Q2VPWTVHRVAvU0txeXNYNFJrRGRNMVJWMThiTndtQit6WVMzU2VrNDdE?=
 =?utf-8?B?VVJ6Szd6ZXhEMkdhNmpWRzJJL2FnSlI3dGpMTzZYaUhJSHNlbHdkSXVSRlRX?=
 =?utf-8?B?Y1RhakoxSFlGZzljalNqcGw5SmpCTVI0M3QyWXI1cmRPcXNQM3pVbHpOTUhW?=
 =?utf-8?B?VTliVGZMRWVZUXpvNmkwK2g3UUZET3ZPbm9qc1pKZ1FaZkpzNW5hTU0zT0pP?=
 =?utf-8?B?WXFvbDJyVFZ1aEI0c2poTmZ2NHV2VkxQbFg3bU9iczRkTjR5MVNEbVRZNlRv?=
 =?utf-8?B?d1krdHBkZ0NYNlpvL2xZMHZTMHZnWE5PRDBqOG1ra0FDZm5MRnd3UmJyOXBk?=
 =?utf-8?B?b2RhTlJ5eDEvaW41MjdIODJJLzJYblJwcFFPZDBQblJqWDF1aUFibUJzZ0RV?=
 =?utf-8?B?WlZtYmlpOERkcjJyeElTdGY3RDAyanh5VjFEb2lqbTFacS90NFY2Sk1TeXFs?=
 =?utf-8?B?czdPREJOQnJmYXNjNHR0TkwrZE9ualZiNG4yOUhiUWFlRUxHT2ZKTm4yczlo?=
 =?utf-8?B?SHI0Znl4ZDZCSFdkZHBqQ1NwUzBWUjJSOUtvbWI2VElVdFR1aEN6cHFWdzhh?=
 =?utf-8?B?eXNVNTZzZ09Cc1BraU9xZlc2anFIeTM4Q2JQN1FPM0l0dEFMS0RqTDJUdkdQ?=
 =?utf-8?B?ajJmT2hVdFEwS2VjaTEvbXZvQ3h2T0JSa2l4cGd5NXU1NkhMYnV3V3FQa3Iz?=
 =?utf-8?B?MGs5QUxMcXZNYi82VUUyRXhCL2x1ZTYvRmxEZElCWE9PWjlvUWVxcjhoUUUv?=
 =?utf-8?B?NXJSdGN0MjZ4WlZpNVNHNlV6ZVVIa3hJR0Y0c25WT1hyc2k5aG5BcExiMnBl?=
 =?utf-8?B?OFJxeXo5NHdRWnlobWVFYXZuczdGUmd1K0xsaFhYRmlBMFNWUmh1RllibkVN?=
 =?utf-8?B?aUV3N3hGeVNNdjI2bnhxa1h0c05wWnd6THJ1KzNsblFseGdYOS9xMzFGL1dr?=
 =?utf-8?B?TWFCU1ZVNmI2UzZCK2tRQ0F4NjF5ZUkrS3NVWng2Z0VnR0FGeHdYeXg3SDBD?=
 =?utf-8?B?ZmZVZGV0TXBHU3BxY2RjVGxkM0MxNi8zTjVaSlpzdlBIdlAwZ0hiODlaR2RD?=
 =?utf-8?B?TGNQOXV3aHZGSVVFaENyODU4cWJmM3ZYMDRTekkrc0NlelJrcjIxazBkdUlT?=
 =?utf-8?B?MU5yY0VoWkdYWmlQZ2JzaVhRM0RyMThBT0RRZnlna0FhRDg5S1N5ZExDaGFM?=
 =?utf-8?B?ZDJoTlkySUVaY0txVjR3WkM1WlVWaTZLUytBKzN1dmc4UUI1TDBUY0xwcnRY?=
 =?utf-8?B?c0NEUDU5MWhUTVY2NG91NDVJZVZHWWVxZnpURGtOMjQvQnFVamZ0TzhxOEVZ?=
 =?utf-8?B?c2NxaGdmQXNCSTFkNi94WnhVa2ZmbUFFYWRkdmVHUXZOdnVlK3p2djYrQmEv?=
 =?utf-8?B?VzgvY2E2Nm5lSDRrVlBjL2s5Q1BKYXM1VkxOOVFkdU5vaE5OZG1rNm1FdUgv?=
 =?utf-8?B?NXlFNUExUFdtY1ZTSzF4ZXVLak8rRzd2M21VNmpPNVJVaDg3LzVnVktZd1BO?=
 =?utf-8?B?NUhIR25ySnY3OCs1WlVuZS9mR0FZMVIyVE9haGduR2o3cVIxUHRkQnJLV3Nu?=
 =?utf-8?B?aGNJWUxPZTAvclhFT3ZqMVE1QS9BPT0=?=
X-OriginatorOrg: nextfour.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b54d4d4-80fd-4cfb-5b9e-08d9ac3d3d63
X-MS-Exchange-CrossTenant-AuthSource: DBAPR03MB6630.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2021 15:48:47.4342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 972e95c2-9290-4a02-8705-4014700ea294
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSghsTezAHzi4PBZrN0EXVaYKDTGCLZTIHJ7rNeJoYW1HYeRM6Tb2uQ59j8U5HGQOY+3cOQiV526ETFtGQ0Y+AUO0vprrxHvea5l8eqNmZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0301MB2277
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
Cc: Anup Patel <anup.patel@wdc.com>,
 "wanpengli @ tencent . com" <wanpengli@tencent.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "seanjc @ google . com" <seanjc@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, "vkuznets @ redhat . com" <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 20.11.2021 12.28, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> This is what evolved during the discussion at
> https://lore.kernel.org/kvm/960E233F-EC0B-4FB5-BA2E-C8D2CCB38B12@infradead.org/T/#m11d75fcfe2da357ec1dabba0d0e3abb91fd13665
>
> As discussed, an alternative approach might be to augment
> kvm_arch_memslots_updated() to raise KVM_REQ_GET_NESTED_STATE_PAGES to
> each vCPU (and make that req only do anything on a given vCPU if that
> vCPU is actually in L2 guest mode).
>
> That would mean the reload gets actively triggered even on memslot
> changes rather than only on MMU notifiers as is the case now. It could
> *potentially* mean we can drop the new 'check_guest_maps' function.
>
> The 'check_guest_maps' function could be a lot simpler than it is,
> though. It only really needs to get kvm->memslots->generation, then
> check each gpc->generation against that, and each gpc->valid.
>
> Also I suspect we *shouldn't* destroy the virtual_apic_cache in
> nested_vmx_vmexit(). We can just leave it there for next time the
> vCPU enters guest mode. If it happens to get invalidated in the
> meantime, that's fine and we'll refresh it on the way back in.
> We probably *would* want to actively do something on memslot changes
> in that case though, to ensure that even if the vCPU isn't in guest
> mode any more, we *release* the cached page.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   arch/x86/include/asm/kvm_host.h |  1 +
>   arch/x86/kvm/vmx/nested.c       | 50 ++++++++++++++++++++++++++++-----
>   arch/x86/kvm/vmx/vmx.c          | 12 +++++---
>   arch/x86/kvm/vmx/vmx.h          |  2 +-
>   arch/x86/kvm/x86.c              | 10 +++++++
>   5 files changed, 63 insertions(+), 12 deletions(-)
>
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 6ea2446ab851..24f6f3e2de47 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1511,6 +1511,7 @@ struct kvm_x86_nested_ops {
>   	int (*enable_evmcs)(struct kvm_vcpu *vcpu,
>   			    uint16_t *vmcs_version);
>   	uint16_t (*get_evmcs_version)(struct kvm_vcpu *vcpu);
> +	void (*check_guest_maps)(struct kvm_vcpu *vcpu);
>   };
>   
>   struct kvm_x86_init_ops {
> diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> index 1e2f66951566..01bfabcfbbce 100644
> --- a/arch/x86/kvm/vmx/nested.c
> +++ b/arch/x86/kvm/vmx/nested.c
> @@ -309,7 +309,7 @@ static void free_nested(struct kvm_vcpu *vcpu)
>   		kvm_release_page_clean(vmx->nested.apic_access_page);
>   		vmx->nested.apic_access_page = NULL;
>   	}
> -	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
> +	kvm_gfn_to_pfn_cache_destroy(vcpu->kvm, &vmx->nested.virtual_apic_cache);
>   	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
>   	vmx->nested.pi_desc = NULL;
>   
> @@ -3179,10 +3179,12 @@ static bool nested_get_vmcs12_pages(struct kvm_vcpu *vcpu)
>   	}
>   
>   	if (nested_cpu_has(vmcs12, CPU_BASED_TPR_SHADOW)) {
> -		map = &vmx->nested.virtual_apic_map;
> +		struct gfn_to_pfn_cache *gpc = &vmx->nested.virtual_apic_cache;
>   
> -		if (!kvm_vcpu_map(vcpu, gpa_to_gfn(vmcs12->virtual_apic_page_addr), map)) {
> -			vmcs_write64(VIRTUAL_APIC_PAGE_ADDR, pfn_to_hpa(map->pfn));
> + 		if (!kvm_gfn_to_pfn_cache_init(vcpu->kvm, gpc, vcpu, true, true,
> +					       vmcs12->virtual_apic_page_addr,
> +					       PAGE_SIZE, true)) {
> +			vmcs_write64(VIRTUAL_APIC_PAGE_ADDR, pfn_to_hpa(gpc->pfn));
>   		} else if (nested_cpu_has(vmcs12, CPU_BASED_CR8_LOAD_EXITING) &&
>   		           nested_cpu_has(vmcs12, CPU_BASED_CR8_STORE_EXITING) &&
>   			   !nested_cpu_has2(vmcs12, SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES)) {
> @@ -3207,6 +3209,9 @@ static bool nested_get_vmcs12_pages(struct kvm_vcpu *vcpu)
>   	if (nested_cpu_has_posted_intr(vmcs12)) {
>   		map = &vmx->nested.pi_desc_map;
>   
> +		if (kvm_vcpu_mapped(map))
> +			kvm_vcpu_unmap(vcpu, map, true);
> +
>   		if (!kvm_vcpu_map(vcpu, gpa_to_gfn(vmcs12->posted_intr_desc_addr), map)) {
>   			vmx->nested.pi_desc =
>   				(struct pi_desc *)(((void *)map->hva) +
> @@ -3251,6 +3256,29 @@ static bool vmx_get_nested_state_pages(struct kvm_vcpu *vcpu)
>   	return true;
>   }
>   
> +static void nested_vmx_check_guest_maps(struct kvm_vcpu *vcpu)
> +{
> +	struct vmcs12 *vmcs12 = get_vmcs12(vcpu);
> +	struct vcpu_vmx *vmx = to_vmx(vcpu);
> +	struct gfn_to_pfn_cache *gpc;
> +
> +	int valid;
> +
> +	if (nested_cpu_has_posted_intr(vmcs12)) {
> +		gpc = &vmx->nested.virtual_apic_cache;
> +
> +		read_lock(&gpc->lock);
> +		valid = kvm_gfn_to_pfn_cache_check(vcpu->kvm, gpc,
> +						   vmcs12->virtual_apic_page_addr,
> +						   PAGE_SIZE);
> +		read_unlock(&gpc->lock);
> +		if (!valid) {
> +			kvm_make_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu);
> +			return;
> +		}
> +	}
> +}
> +
>   static int nested_vmx_write_pml_buffer(struct kvm_vcpu *vcpu, gpa_t gpa)
>   {
>   	struct vmcs12 *vmcs12;
> @@ -3749,9 +3777,15 @@ static int vmx_complete_nested_posted_interrupt(struct kvm_vcpu *vcpu)
>   
>   	max_irr = find_last_bit((unsigned long *)vmx->nested.pi_desc->pir, 256);
>   	if (max_irr != 256) {
> -		vapic_page = vmx->nested.virtual_apic_map.hva;
> -		if (!vapic_page)
> +		struct gfn_to_pfn_cache *gpc = &vmx->nested.virtual_apic_cache;
> +
> +		read_lock(&gpc->lock);
> +		if (!kvm_gfn_to_pfn_cache_check(vcpu->kvm, gpc, gpc->gpa, PAGE_SIZE)) {
> +			read_unlock(&gpc->lock);
>   			goto mmio_needed;
> +		}
> +
> +		vapic_page = gpc->khva;
>   
>   		__kvm_apic_update_irr(vmx->nested.pi_desc->pir,
>   			vapic_page, &max_irr);
> @@ -3761,6 +3795,7 @@ static int vmx_complete_nested_posted_interrupt(struct kvm_vcpu *vcpu)
>   			status |= (u8)max_irr;
>   			vmcs_write16(GUEST_INTR_STATUS, status);
>   		}
> +		read_unlock(&gpc->lock);
>   	}
>   
>   	nested_mark_vmcs12_pages_dirty(vcpu);
> @@ -4581,7 +4616,7 @@ void nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
>   		kvm_release_page_clean(vmx->nested.apic_access_page);
>   		vmx->nested.apic_access_page = NULL;
>   	}
> -	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
> +	kvm_gfn_to_pfn_cache_unmap(vcpu->kvm, &vmx->nested.virtual_apic_cache);
>   	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
>   	vmx->nested.pi_desc = NULL;
>   
> @@ -6756,4 +6791,5 @@ struct kvm_x86_nested_ops vmx_nested_ops = {
>   	.write_log_dirty = nested_vmx_write_pml_buffer,
>   	.enable_evmcs = nested_enable_evmcs,
>   	.get_evmcs_version = nested_get_evmcs_version,
> +	.check_guest_maps = nested_vmx_check_guest_maps,
>   };
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index ba66c171d951..6c61faef86d3 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -3839,19 +3839,23 @@ void pt_update_intercept_for_msr(struct kvm_vcpu *vcpu)
>   static bool vmx_guest_apic_has_interrupt(struct kvm_vcpu *vcpu)
>   {
>   	struct vcpu_vmx *vmx = to_vmx(vcpu);
> -	void *vapic_page;
> +	struct gfn_to_pfn_cache *gpc = &vmx->nested.virtual_apic_cache;
>   	u32 vppr;
>   	int rvi;
>   
>   	if (WARN_ON_ONCE(!is_guest_mode(vcpu)) ||
>   		!nested_cpu_has_vid(get_vmcs12(vcpu)) ||
> -		WARN_ON_ONCE(!vmx->nested.virtual_apic_map.gfn))
> +		WARN_ON_ONCE(gpc->gpa == GPA_INVALID))
>   		return false;
>   
>   	rvi = vmx_get_rvi();
>   
> -	vapic_page = vmx->nested.virtual_apic_map.hva;
> -	vppr = *((u32 *)(vapic_page + APIC_PROCPRI));
> +	read_lock(&gpc->lock);
> +	if (!kvm_gfn_to_pfn_cache_check(vcpu->kvm, gpc, gpc->gpa, PAGE_SIZE))
> +		vppr = *((u32 *)(gpc->khva + APIC_PROCPRI));
> +	else
> +		vppr = 0xff;
> +	read_unlock(&gpc->lock);
>   
>   	return ((rvi & 0xf0) > (vppr & 0xf0));
>   }
> diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
> index 4df2ac24ffc1..8364e7fc92a0 100644
> --- a/arch/x86/kvm/vmx/vmx.h
> +++ b/arch/x86/kvm/vmx/vmx.h
> @@ -195,7 +195,7 @@ struct nested_vmx {
>   	 * pointers, so we must keep them pinned while L2 runs.
>   	 */
>   	struct page *apic_access_page;
> -	struct kvm_host_map virtual_apic_map;
> +	struct gfn_to_pfn_cache virtual_apic_cache;
>   	struct kvm_host_map pi_desc_map;
>   
>   	struct kvm_host_map msr_bitmap_map;
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index fa56c590d8db..01d20db5b1f4 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9739,6 +9739,8 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
>   
>   		if (kvm_check_request(KVM_REQ_UPDATE_CPU_DIRTY_LOGGING, vcpu))
>   			static_call(kvm_x86_update_cpu_dirty_logging)(vcpu);
> +		if (kvm_check_request(KVM_REQ_GPC_INVALIDATE, vcpu))
> +			; /* Nothing to do. It just wanted to wake us */
>   	}
>   
>   	if (kvm_check_request(KVM_REQ_EVENT, vcpu) || req_int_win ||
> @@ -9785,6 +9787,14 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
>   	local_irq_disable();
>   	vcpu->mode = IN_GUEST_MODE;
>   
> +	/*
> +	 * If the guest requires direct access to mapped L1 pages, check
> +	 * the caches are valid. Will raise KVM_REQ_GET_NESTED_STATE_PAGES
> +	 * to go and revalidate them, if necessary.
> +	 */
> +	if (is_guest_mode(vcpu) && kvm_x86_ops.nested_ops->check_guest_maps)
> +		kvm_x86_ops.nested_ops->check_guest_maps(vcpu);

But KVM_REQ_GET_NESTED_STATE_PAGES is not check until next 
vcpu_enter_guest() entry ?


> +
>   	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
>   
>   	/*

