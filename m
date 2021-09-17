Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 689BD40F558
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 11:53:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9q5K2slXz2yNM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 19:53:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=mimecast20200619 header.b=OF54Xgu3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=mimecast20200619 header.b=Me4fz353;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=194.104.111.102;
 helo=de-smtp-delivery-102.mimecast.com; envelope-from=jbeulich@suse.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=mimecast20200619 header.b=OF54Xgu3; 
 dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com
 header.a=rsa-sha256 header.s=mimecast20200619 header.b=Me4fz353; 
 dkim-atps=neutral
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9q4X0Xbnz2xrT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 19:52:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1631872339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXHtNvXg31UQSdkLZPhgMtWUpYK/lfDRKw9DfFedgMc=;
 b=OF54Xgu3bDNP+32BLf7zECCaYqPHoopDxPAbbHu/fg9DmGRWny3C39Tk+Jr5nFvy/cB4nH
 7TcIdjKFdiMfkbcQbW7aJj+7cMLjpony6f22x4akX9exyCd456MkNaeDAfEI3vJ4NEkyQ/
 QfNjpezBmiojI27JTuafz/vhirdnU9E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1631872340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXHtNvXg31UQSdkLZPhgMtWUpYK/lfDRKw9DfFedgMc=;
 b=Me4fz35346Km1bEcB/VuyxGjDPBXVSS7kUSosNVCma+KRYVNyeEBlKYPhOzipb447f2YpG
 Q2DKb+Rtt/KgCZoVwR2KxDbXaID81xE51LoQITMYI5mkr+53M6uB7VbN+u4f2HeQcNZKun
 WmXAF3fvCIesWneXY6CiLJpR37IJ5IA=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-NQXKte9aM7SPAoFTTsTJOg-2; Fri, 17 Sep 2021 11:52:17 +0200
X-MC-Unique: NQXKte9aM7SPAoFTTsTJOg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUQsuEEnqhFH6XUniREkRWHldNtvBNSFqKWRJyjQ47DLH6REuqr55XETps2U7VE0eJa6iaSLrU5eR0JWtDh9ngNhOMmjsMpgF/714vi33IOFe1f4w7lnDzIznJa0HYICMcCCNTAGZ+74D4xNSiwSe/al1QkCgXgScJZFWUEKkyjXYrCXOb0Cs0xl7SPH2nYmJqfWvz7f/mis2/CyJ6rHWhDSIfNCnrV7z4wJqhRqnICc50eH9bq1+HL26hL+IIfeZCih3W2AhIFExaBKLTqq+1njywA1hACQ7Epf7Cc8HDrAe65zkhuTFy998jBhQiJrb9DVimV08kpn8tAJfiUAsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=GXHtNvXg31UQSdkLZPhgMtWUpYK/lfDRKw9DfFedgMc=;
 b=OLltJ3gskAm7qdPVBo7pvXAtBW/wT09MdgkntEQTZlOjl26TqZHoVL8MkCPx7/SivPold0Kdwi/2n1In4B2aJE5QDkGywwClTqpTgQPBMbhL86iTgkei6LOMrKIr5xEzPL1Y4V8zt3YsFePbCHP3E+dluRbDmS7Ildru0U6ghPUfhDpbj0e4e6HYxjdh12i2zTH5zHFpG6heZigZVgcHITqGU1mYgmsGTXmagDjiboEz90g5csC3AJMvyT/4qQJ3FA8XPciH9aCCA8ObLe3yTR7YtXoEoCFIGT6GMV86rxiYFqm9OLgj0su3jbQAEk6+7+koQ8uPPgqGIxOQdM2e7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3936.eurprd04.prod.outlook.com (2603:10a6:803:23::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 09:52:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 09:52:14 +0000
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
To: Roman Skakun <rm.skakun@gmail.com>
References: <20210914151016.3174924-1-Roman_Skakun@epam.com>
 <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com>
 <CADu_u-Ou08tMFm5xU871ae8ct+2YOuvn4rQ=83CMTbg2bx87Pg@mail.gmail.com>
 <84ef7ff7-2c9c-113a-4a2c-cef54a6ded51@suse.com>
 <20210915135321.GA15216@lst.de>
 <CADu_u-OZzgVj+z=iD6kUQOZxUufF5QSMR6-MmpN_hLZ9PyQJhQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ece0bbcf-2be8-e655-b164-b39b5d535c63@suse.com>
Date: Fri, 17 Sep 2021 11:52:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CADu_u-OZzgVj+z=iD6kUQOZxUufF5QSMR6-MmpN_hLZ9PyQJhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0178.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 09:52:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7dda98c-565b-4ff6-e6d7-08d979c0d3bd
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3936:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB393646432D8345BD571CFCD1B3DD9@VI1PR0402MB3936.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VSBJD+Hpucunccno3ObKklm855Ig/SKMAaqRud98vyrGFLRBH+JYmoy/Hy7BzM1qlbD3Hw82yH38E+61gAQGQkTu3F6VBgOutaClbVpzKCSZT7y6lQp7q7B6CwECHBJo+XR4nWT0mxOjpDMXBIqyvkejLaeOLI3TETFOWy6F3goaEqIhYtE778B2kCIH00lndBwLcPzUgKajEsJDnwal0NGWAE1KFPVMg+5dNUZUCo+0Vcr9/UD8AkBN7S6sN74XoJF8PwAO2yFbIvQ0BZ4th5axLvdidJEAyRZ5c0GhOE3L1VznzmUJ0RS9ZBePAX/aPAePS70l9j+c8nmasK9eRkRpHpkdtBU6FCSbfX3wJmWaVG2vRG3FGknSs0iZM4IKkoTsaL+4g9k0MY+93hrFqGx3OkqPBy8WNxo4rSuaYj3O40wXvZ9oYfrmKukwIhNewJxnPlFi08lUXxPFEsvbmFAmgnwEUYqlJdSCsPdIidp9ccPzxVEJMz/KToZFdJZhI4IGT67JZ8rDuGSWvmxKhu0JIBWCDSDs1Q4TjWzRjKoRh/bqyPfqPzUI6N1Zxx+mDJbnyVhqhD6+BrwABQONjTBTHUTYQz7JK2fQmWoOlw1K11eh0RfGoWxrjSJGLif3XP800x6XbphXriKg+BTZwD1I1lZz5d5X4WmViz0NtAXGunYhWnrdPe8+pQb4DGg1vLxFT4C8SCOXez+T5yaQASbH6TzfiDtYiOqYfhG4tRs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6916009)(26005)(4326008)(53546011)(54906003)(7406005)(316002)(66946007)(36756003)(8936002)(5660300002)(2616005)(31686004)(956004)(66556008)(16576012)(83380400001)(66476007)(508600001)(7416002)(6486002)(86362001)(2906002)(4744005)(31696002)(186003)(8676002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWh1Qk45cENNVHNnTGcrUnRkYXpQRllDQ0NJZmZvR3dzbGIzTmUzRkdkTmc1?=
 =?utf-8?B?Y2lBck1PdjVNY3BGU24rVlJLSlEzNnNYd1Z1WHA3MUJ0RmoycTE2bVdPckZ2?=
 =?utf-8?B?ZWFFZTBZL2pTdEJpRlNmZHluMEhURVB4dzA5UFVRTU14UURHeUgzWHBxUlRh?=
 =?utf-8?B?b3R5cUgrM3NvWTVtcm5oQkpFelBKdUl0bkFQZldHNE1OczN4eEdLd0NNRS9K?=
 =?utf-8?B?Vmx1WXJrelVQVHlDWndHbER3aWZhdmlkTlByN0I3anRaMFFHVTk5alJiTWU1?=
 =?utf-8?B?SjhOUE9jN3owOVhQQTJUREtFQzdubENkRFpNYmxSa0Z0d3N4R0pWcy8rQW1C?=
 =?utf-8?B?a1p5N3NDdXNRdXZ6OGVoSVZEcitFclJWUHIweU1JclVpOFdUbk12Wm1UMXd3?=
 =?utf-8?B?cWtMZkpFcExIN0JNU0tEMHFlOHVTUTBHZ2lISEhEOTVHb3p5cmpzWm13OVhy?=
 =?utf-8?B?Q3d3WGdnV0hhd2pualBSRm1pR0tzOGVWdnBmOHdsUldHaml0UHY3OHphbTU2?=
 =?utf-8?B?Yk1jb29PQnpFRGFwS3VLTWM4c0VTR0o0Rnd3NEQveTluakpLTGovWkl5M3JN?=
 =?utf-8?B?aWQwY0d2SXZGenFLL0F1c3ZndHJtZ2FFYkt3VjdJNmsxODJCTGxuTGQzWTY5?=
 =?utf-8?B?RFE2ZWJEY0VyY1J0Tk9rV0pwd2JEbkp0ZzJJODJzNCtiRDJkV00rd2k4NnhH?=
 =?utf-8?B?cjRGWWU5RXRsU3M2dkxualBqK09pNXlhUXFleGs3Uk54T2U3aFR5eldMR3Av?=
 =?utf-8?B?ZUJkZ3dVTVZtTk5xZWNxSFQveVloZEFmUVFOemxwc3owSGxQVVhoRG9NM0I0?=
 =?utf-8?B?Q1lXQlpTMk1hN1RUWW5JUnBMUDRjeDV5bWw2UmxZenJWT0R6SW5qN1pTWEs2?=
 =?utf-8?B?TzhnUXIxMlU4MnVCNGxaNkdYcWQxN01TQ29hQUhuSFNxOGEzTm9ESGN3aWtk?=
 =?utf-8?B?UFFtbEd5UWlmVExKcStvTytuOHpyY3RYTzJ3QkkzdVYvTHFwYjBLenZUc09x?=
 =?utf-8?B?Unp1WXdJdTdiZEovdHlSdWs4QXo3VFM4UlRqWjMvWmZYRnNQUTBaUEd1Vm1Q?=
 =?utf-8?B?aEorMjlGbFJZNWpmYlhmNEJhQ2VTbmR5ZXU5eENzV1JMcmVhNFlhb0Z3SUpp?=
 =?utf-8?B?WnhraEcveVhKb2VFR0RDWHNwQXlJWFRIMDB1UFNuNjBMaEhiTGdURWNDTEVw?=
 =?utf-8?B?MUpyajE5dkI4MmthcFRidmo0SmxpQUJVL3NXUFJQbTRpTGQza1NhRVZnNjBk?=
 =?utf-8?B?VEhVblNUTnpDZ2pOaFlLdzNxQkFFbVpWZ0JvZWhtNGp0a1UvWHJLT3ZRWnhq?=
 =?utf-8?B?cUYzU2pTQVlaUjhnWGo0a1dGaTh4SklTbS81WVAxVkZobkdqc1JmeGpQbVlh?=
 =?utf-8?B?UTFxaXdjSTFwRnJCQ000N2RrTm83VGx6clczYkhFcWI3R3BEaVBJK3ZVQW50?=
 =?utf-8?B?Zy9uNjNJNU9wNEFJbjZXcW5JK3RrQ3h6ZnhEY1F6VHl1MC9MVGpWN3I2WlVw?=
 =?utf-8?B?UzBHVmlFaWt2UTlBRk1SV2pNVllBQmR3cTZvRUN6MzhDODFuUnJTVTQwSUZy?=
 =?utf-8?B?QXluT1NTR1poU2hZMXJ6eDQ5UHVaOC93V2lqcDFzOU5HVk5oN1hxNXgyaVRi?=
 =?utf-8?B?aGZkSkVkdHBsSXlvVDg5T2dBd25mWTV3bCtONTNaZnAxNzJNVFVtN0Qrd09M?=
 =?utf-8?B?WWt0UjJoN2RmeW9ZOFZYckdiRWN4N1krb3BwbXROU3g1ZjZLYkpoY21qYkZl?=
 =?utf-8?Q?tXdvUegyoB1lBi98nVCMJcsPYInAOshnLPJ5MAu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dda98c-565b-4ff6-e6d7-08d979c0d3bd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 09:52:14.4984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdlybJsY7Wdjq7223mSN8+JLrLBqmHTX8mLHVQUV8SHHaEKtzY/812DucDUvDwsb/d20AautVG5LUT35fL2u1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3936
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
Cc: linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Hellwig <hch@lst.de>, xen-devel@lists.xenproject.org,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Muchun Song <songmuchun@bytedance.com>, Thomas Gleixner <tglx@linutronix.de>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Andrii Anisov <andrii_anisov@epam.com>, linuxppc-dev@lists.ozlabs.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org,
 iommu <iommu@lists.linux-foundation.org>, Roman Skakun <roman_skakun@epam.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Robin Murphy <robin.murphy@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17.09.2021 11:36, Roman Skakun wrote:
> I use Xen PV display. In my case, PV display backend(Dom0) allocates
> contiguous buffer via DMA-API to
> to implement zero-copy between Dom0 and DomU.

Why does the buffer need to be allocated by Dom0? If it was allocated
by DomU, it could use grants to give the backend direct (zero-copy)
access.

Jan

