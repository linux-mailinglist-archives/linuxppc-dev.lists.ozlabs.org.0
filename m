Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F2E3ACD2D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 16:10:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G615w4JkJz3c55
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 00:10:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QkUKm9sE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.93.88; helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thomas.lendacky@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QkUKm9sE; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G615G6x6hz3bvw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 00:09:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJSsYvboq8gK2ur+DEJF7/J3IbzVkGpEzFSjZTQotrndojQ62R8+OibN05lQOSwpuRc5yfOJDVQ2BVstOZuRkgARLmJEedTW7/rb4NlqIdG/nSgXjlDPcGA1Bt4ylj1XnEo6/nUi+wHUwWTF3JwoVkJYMu7HlE2dU/pgZ8FDqjbAuoOCBKpYqxRKAz3w/ztqSwpT6Vod3rwpqF14EMGOG0qerWCrHKYmtzTohr2Sq2EeN3kg5pCgJZqLJtKOuFE1+piunZKuc1WJ6WPlW3X250BUvk8p2BVkiraXkGlwBmKS2V9lqjQKki18TVvmKpn9vbaH33eQvvuc2iq56sN1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLRi1XsPF7LgTrIYyzkEtdY9k36UwfVsdF2v+x/5S7Y=;
 b=TPRxPNpmSTJ/7vN1brX9+s2241iEZh09BhG6JVeUU09lOFXod+A15TqUFVEnNjvSqVI08EutTgspB2uGyk4fOxGW64vkzNmXqYSHoknJoM/xNx9Y8fSVib8DBrhlkTxPCdsmrfcKE4LThxydPppibLHnc7cQ8W/h0YiE+FAROIuH+8TlA/iLle1UkIZOo3BVM6TgRr/dUp1TJNSbBP28UFn7VQaVu2wqYvpnzy7VXoCwBG1zpo1B3AUkbfFtDU5rLW44pTkMKByGlZopoiH6iVwPR32388WBJ7XVHrnPzjuck8iDAf7HLSOv1UL060FuspIg3RA9tI22zAKQZJA+ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLRi1XsPF7LgTrIYyzkEtdY9k36UwfVsdF2v+x/5S7Y=;
 b=QkUKm9sET1rE+gXzqy9H/m4lcTx8io7KEu+5iEyilS9oOa536mQ9CuuzUlzqObo8Aqc/DocZRkn8x5EgNoclnkM+a94e4DFoy3ffNlXcdMSAejySPZ7CV8WK9ZTyTrzXWxITeNJ+c38M9xEbthHMZ/icYFKs5avw+x92jS1O4xU=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM5PR12MB1708.namprd12.prod.outlook.com (2603:10b6:3:10e::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19; Fri, 18 Jun 2021 14:09:22 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::6437:2e87:f7dc:a686]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::6437:2e87:f7dc:a686%12]) with mapi id 15.20.4219.026; Fri, 18 Jun
 2021 14:09:22 +0000
Subject: Re: [PATCH v13 01/12] swiotlb: Refactor swiotlb init functions
To: Claire Chang <tientzu@chromium.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20210617062635.1660944-1-tientzu@chromium.org>
 <20210617062635.1660944-2-tientzu@chromium.org>
 <alpine.DEB.2.21.2106171434480.24906@sstabellini-ThinkPad-T480s>
 <CALiNf29SJ0jXirWVDhJw4BUNvkjUeGPyGNJK9m8c30OPX41=5Q@mail.gmail.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <741a34cc-547c-984d-8af4-2f309880acfa@amd.com>
Date: Fri, 18 Jun 2021 09:09:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CALiNf29SJ0jXirWVDhJw4BUNvkjUeGPyGNJK9m8c30OPX41=5Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SN4PR0601CA0004.namprd06.prod.outlook.com
 (2603:10b6:803:2f::14) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-ryzen.texastahm.com (67.79.209.213) by
 SN4PR0601CA0004.namprd06.prod.outlook.com (2603:10b6:803:2f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19 via Frontend
 Transport; Fri, 18 Jun 2021 14:09:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f221e95d-4e30-47fa-acd3-08d93262abdb
X-MS-TrafficTypeDiagnostic: DM5PR12MB1708:
X-Microsoft-Antispam-PRVS: <DM5PR12MB17081865F840834BCF17A650EC0D9@DM5PR12MB1708.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W81zqNegGhXtmyGutYcXqZK6WKj93KvXEUQwinaX80I9UREJRH1X5ZjFo1bKCiBISoKjvPxFNrviGDgVpQw4M2gllzpECvkJWY31E4OCRtIQaq/+3i9fVL2/FWbzndFFmn2/y+Y5dZPeDx3ZIjwt6mOIuKijzIrzFQ7L07JWGQYcqmOaeNlKVE4rRh56CXuZQSFnvAy9O88DDyIBhSA15TxXobwBeyTQc3xSDctJrRF5sOM9pXIQNjT5lZWdEQR4xbKUdhtfp05lOLmbPIRSJcZQQwovsa52ZlzKn/NBTrjz5vqID/h+QlQpFRrBnO7I08jU+Z+zsoXIHstg6kSSgQ2UpU4Rqlv1EO4zKV/ShGbXgk2s1K2G0pJ1wpIHGmiRTwe/4FVtjVflUFLZdKECngBqGM4OUHsiEvIw6xj2dLFgkO1T/6vX0rIrWZPxn0eaHxGVv+xfGX6fpFkETbq5u79tnzKR5hgOZg2W85yQYeB8urPkhQEF7InNTbkkk6ZkrP6jjoNlBC/mg9wfDaylrRMM7DCner6q6TQ65AT0vHCMj1zGXzP8mAUQY8fy7AGzIrZAYKE+Q/p2lScDVNETcZNZlpdUzPXuQD4KNWNhh/JqTvD/fctFNKibIOQ0kWQP2L7pdUNyyHHO1WMMu3iAVHU8inHMg9CXJD30R9W34kljaPWy58nsvxvQExo0YNdotgHO21WNgw0xATsJMmODiG0GBp8KgvACKlNj80F4coAEgQWg5shi8PBatp0KTneYofTkP67Va0k2my2pPOGXG/JoKR5pQ4pBlKjmk8U2z4ObHjREhC0onwr2djrKFcQdKQzDyK/vHjjb8/LTdYo3vg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(83380400001)(186003)(8936002)(16526019)(26005)(4326008)(6486002)(7416002)(31696002)(66556008)(7366002)(6506007)(5660300002)(53546011)(2906002)(54906003)(38100700002)(8676002)(966005)(86362001)(45080400002)(66946007)(36756003)(478600001)(7406005)(6512007)(66476007)(2616005)(316002)(956004)(110136005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTF1VW8zMVRmaGpmRzFsSWRqT08wSW5zbFMvbFp6VGtDQXJpc1ZCT0doNCs3?=
 =?utf-8?B?YkxZMlpmMDFVUTZETXRLU0RsMCtwalpJWHlLaDh1U2ZZL2pCSnVCNXdvdUZQ?=
 =?utf-8?B?NG1nOUJ3bDh2NEkzN1VrempKQUpERzgwZ2dRSWZPcEZLRGhtU2N2Qkw0Q2FH?=
 =?utf-8?B?OTV0RWxiWnBrWmczM2FwWTlvRVYzVzljOW9xYTg4ZWhsc01rVVlodWdFUEx4?=
 =?utf-8?B?UFJzcEpIMjcrbGRVcVBoeFVjL09YemszMFNnd1pPRi84bFhibXIvbGhRSk93?=
 =?utf-8?B?Uis2WHFSakxvUjQ0ZUF1USt2NU05Z2tXZkV6TXZBdzdLL0RqWmpMbUF5K1Zv?=
 =?utf-8?B?TnMvSThpODNDMURUaEVmcG5EVFVEdjdpZ2R4RVlaR01NQVBqOGp3cjhxcnE2?=
 =?utf-8?B?b0daNFlPcVorYzlWV2IrNXJiQTA0R1VRY0FrWjV6UmVrYVM0U0VBUFpMYWMr?=
 =?utf-8?B?V3ZmU1pHSnVlUWpnRkJzOTB2Rkl3MDJnL3lRWVJuMkw0OS9nV3llMHMrSWU4?=
 =?utf-8?B?QkNjbGNIMjNNM002Q0pjeDhxL0E3Z29qVm1GQTdmUEpiajAxMGU1NVVJNFo2?=
 =?utf-8?B?WWYrS0V3QWNkSUFZbjVGRU5pQXg5V2hmTHhCaStPUnF3SVlOTHg1VHJmUjUr?=
 =?utf-8?B?a3FuOVFhYUNmQlk2Rk43aHNQTUo0Z29kQ3N2V3dFVkxnQlh6Z3cvZGtpTTBJ?=
 =?utf-8?B?bytrdDdKTm1iV3UvZnNpcjJkNC9RRCtwZlllUmQzOEs4UnZONytFMzZZNnk3?=
 =?utf-8?B?UDFPSEtwUDBGTGpldEJEVmtSNm42SC9PckxwaGxkaUlJMDU4T3lzWldPTUtM?=
 =?utf-8?B?clUzVlpjcDVuYWk3akYrZ0V1RmNwMXZFWVA5S0p4UzA3eUh6azFKVWtBRE5q?=
 =?utf-8?B?MVorMkVnY3l1dFpjNHRzK3E0YTIrSFRjQWlBRnhoZG01UVJNRGMzZXcrb3RD?=
 =?utf-8?B?Z1BSS3FBNm95bFdQemF0eitMMWZvS3Uva1ZlQWI0ZFd3MTB3cXJaS1FiSnRx?=
 =?utf-8?B?V2xkbGJvRnE1VnpMYUZUYjFvQi9RWmwzODcrajFsQzlDQjJaYWo0dDQ1UVB5?=
 =?utf-8?B?cGhpek5NS3hReDcvUVUvZUpoN2V1Q1pxbGNjMUVqUG44MWhMUU94eml6c2Rl?=
 =?utf-8?B?dmdpQysyVWppaE1qbXp6YUh4U0lyZU5TN1VueFFxazdienhmTDVmV1VyeDlT?=
 =?utf-8?B?dXFrNFgwLzNkeDFqRkdmcUFHNjhjWncwTHdKWkk3YVhJWnlMTGNGNkVNc29r?=
 =?utf-8?B?Z3NzSnZLQW5HRXFTMWZYdWdmT21samhtN0JMdzFzTmNLb21ZaHJyVnVqQnpB?=
 =?utf-8?B?VGVkMnFlTktvcldFQVdZMGxBQ1drNjdLV213N3ZIY3c3UGlCUmZuUXFmeHpF?=
 =?utf-8?B?TEJZRnN0U2hKeUx2S0RjWFVSZjllazZ4ckViUm1VSWQ1U0g1L1ZOZ1ZPL2k3?=
 =?utf-8?B?OG81QlFkK3lnUW5weUFJVnVqSnMyNndCSjdJdi9EazBlekxkYThJYldqMDhr?=
 =?utf-8?B?KzRaUUI3OFE1NlNCV1J3elBEVlNBTUtUdTU0eU5Ld3lQKzFER1oyb1ZEL2c0?=
 =?utf-8?B?aklFUEg1bGR2TXp1NE9Nd3dQVU81ZGJXb0FKUG01Tk5ZYUlPTWRWenpJbnAx?=
 =?utf-8?B?M01vYjh1THg4V0VaNDYvVXl1WDZ6aVI5TTFITlRDNzdTMGRmQ21NOTFOZEpz?=
 =?utf-8?B?eno3RGo1dFhiR2c1ZE1WOHlTVnVGenc3L2QrbHZ0S1diWTJJcDVhWEhUc2Fi?=
 =?utf-8?Q?esIpSlmSoBBKai4kWvfAW6bnueBOslxVkn4yALT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f221e95d-4e30-47fa-acd3-08d93262abdb
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 14:09:22.5058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fc+b5bk+EKsqI5tf6Y9m5leX8+yq5/ThpNw9DurxKQTMG6UvMLJkVdybTkyH0xi09bRkLzh9r2w1pSsYiVXV4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1708
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Will Deacon <will@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/18/21 1:25 AM, Claire Chang wrote:
> On Fri, Jun 18, 2021 at 7:30 AM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
>>
>> On Thu, 17 Jun 2021, Claire Chang wrote:
>>> Add a new function, swiotlb_init_io_tlb_mem, for the io_tlb_mem struct
>>> initialization to make the code reusable.
>>>
>>> Signed-off-by: Claire Chang <tientzu@chromium.org>
>>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Tested-by: Will Deacon <will@kernel.org>
>>> ---
>>>  kernel/dma/swiotlb.c | 50 ++++++++++++++++++++++----------------------
>>>  1 file changed, 25 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
>>> index 52e2ac526757..47bb2a766798 100644
>>> --- a/kernel/dma/swiotlb.c
>>> +++ b/kernel/dma/swiotlb.c
>>> @@ -168,9 +168,28 @@ void __init swiotlb_update_mem_attributes(void)
>>>       memset(vaddr, 0, bytes);
>>>  }
>>>
>>> -int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
>>> +static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
>>> +                                 unsigned long nslabs, bool late_alloc)
>>>  {
>>> +     void *vaddr = phys_to_virt(start);
>>>       unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
>>> +
>>> +     mem->nslabs = nslabs;
>>> +     mem->start = start;
>>> +     mem->end = mem->start + bytes;
>>> +     mem->index = 0;
>>> +     mem->late_alloc = late_alloc;
>>> +     spin_lock_init(&mem->lock);
>>> +     for (i = 0; i < mem->nslabs; i++) {
>>> +             mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
>>> +             mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
>>> +             mem->slots[i].alloc_size = 0;
>>> +     }
>>> +     memset(vaddr, 0, bytes);
>>> +}
>>> +
>>> +int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
>>> +{
>>>       struct io_tlb_mem *mem;
>>>       size_t alloc_size;
>>>
>>> @@ -186,16 +205,8 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
>>>       if (!mem)
>>>               panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
>>>                     __func__, alloc_size, PAGE_SIZE);
>>> -     mem->nslabs = nslabs;
>>> -     mem->start = __pa(tlb);
>>> -     mem->end = mem->start + bytes;
>>> -     mem->index = 0;
>>> -     spin_lock_init(&mem->lock);
>>> -     for (i = 0; i < mem->nslabs; i++) {
>>> -             mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
>>> -             mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
>>> -             mem->slots[i].alloc_size = 0;
>>> -     }
>>> +
>>> +     swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
>>>
>>>       io_tlb_default_mem = mem;
>>>       if (verbose)
>>> @@ -282,8 +293,8 @@ swiotlb_late_init_with_default_size(size_t default_size)
>>>  int
>>>  swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
>>>  {
>>> -     unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
>>>       struct io_tlb_mem *mem;
>>> +     unsigned long bytes = nslabs << IO_TLB_SHIFT;
>>>
>>>       if (swiotlb_force == SWIOTLB_NO_FORCE)
>>>               return 0;
>>> @@ -297,20 +308,9 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
>>>       if (!mem)
>>>               return -ENOMEM;
>>>
>>> -     mem->nslabs = nslabs;
>>> -     mem->start = virt_to_phys(tlb);
>>> -     mem->end = mem->start + bytes;
>>> -     mem->index = 0;
>>> -     mem->late_alloc = 1;
>>> -     spin_lock_init(&mem->lock);
>>> -     for (i = 0; i < mem->nslabs; i++) {
>>> -             mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
>>> -             mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
>>> -             mem->slots[i].alloc_size = 0;
>>> -     }
>>> -
>>> +     memset(mem, 0, sizeof(*mem));
>>> +     swiotlb_init_io_tlb_mem(mem, virt_to_phys(tlb), nslabs, true);
>>>       set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
>>> -     memset(tlb, 0, bytes);
>>
>> This is good for swiotlb_late_init_with_tbl. However I have just noticed
>> that mem could also be allocated from swiotlb_init_with_tbl, in which
>> case the zeroing is missing. I think we need another memset in
>> swiotlb_init_with_tbl as well. Or maybe it could be better to have a
>> single memset at the beginning of swiotlb_init_io_tlb_mem instead. Up to
>> you.
> 
> swiotlb_init_with_tbl uses memblock_alloc to allocate the io_tlb_mem
> and memblock_alloc[1] will do memset in memblock_alloc_try_nid[2], so
> swiotlb_init_with_tbl is also good.
> I'm happy to add the memset in swiotlb_init_io_tlb_mem if you think
> it's clearer and safer.

On x86, if the memset is done before set_memory_decrypted() and memory
encryption is active, then the memory will look like ciphertext afterwards
and not be zeroes. If zeroed memory is required, then a memset must be
done after the set_memory_decrypted() calls.

Thanks,
Tom

> 
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.13-rc6%2Fsource%2Finclude%2Flinux%2Fmemblock.h%23L407&amp;data=04%7C01%7Cthomas.lendacky%40amd.com%7C3e33e04212b84f9e4ed108d932230511%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637595948355050693%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=TGBDj18KuSHTb45EBz%2Bypfbr4Xgqb1aGTRDCTIpIgJo%3D&amp;reserved=0
> [2] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.13-rc6%2Fsource%2Fmm%2Fmemblock.c%23L1555&amp;data=04%7C01%7Cthomas.lendacky%40amd.com%7C3e33e04212b84f9e4ed108d932230511%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637595948355060689%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=K%2FWbN6iKN9JNtwDSkIaKH2BVLdDTWhn8tPfNdCOVkSA%3D&amp;reserved=0
> 
