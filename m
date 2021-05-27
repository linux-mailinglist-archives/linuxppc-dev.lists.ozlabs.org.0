Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FED3393406
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 18:32:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrYJb1Zhxz3002
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 02:32:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=g/d9DN9E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.94.81; helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=thomas.lendacky@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=g/d9DN9E; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrYJ14rbYz2ykG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:32:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0EXOuzHfeW8Iat9tH7IYa4viwaQRqAxRiTx6Pf5tPuTZBl6QWNpdRazjP/9ydPI0Pkw9hrvK6cBbTZPDjFFIU6g63P9eOsI3BPOcE90GkpneynOBtwqw+F2Jk7Q62LYhTq144ENp0lk7Nfd81gQXjEsdadtR6Qv+9/NTVS25yRC2vqPAXpIFP9aTIjJdfyPYz3f3PvBqQ4BWkAm93eSGIcLepZlkKpLA6BlTj7TYzuRd3cOrNcrG6cIWyZpv69hLR2TnEnD085EORKuHcd7EZSJwsFAXipoqnqxM/kdaN2An+I9U+LLyJO7a9nsXqLJqdziAHgbZ12kRdC+a+byLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q45R70SZ4GNbGD0yl6IMD+eivKNAhgiOmhZWzOMDiKM=;
 b=b71QOtg/qgOOp3s4MYD1PZ4Q0gYjwloXnONbLFzLs5XFy+vmICGhm9dXZNEDKsRfSL8jjYPveExNaOfi92dXuYHAsmMAeWb83ShugjLHX//H7MZvdOr4MJFQ633VQbgEudYI8PElYsJpOjg9UI92SSx1W+08eEQN1ZDfuZihLzVgIfz/Vg/uX/Hyk8HIhZnXQ+v3u79eEw3k06YJ9mhXy/PuzX58pHMC8iUy6ppAPE9PCitxQiW3HHIPhIBgl6PlWEd3xmmiq1rdDs+3qfeFJpGdb2mC0g25lSdv1uWH0fIoJoiYzkuCaST0YWRJoOGk0fKhDurej+TrTjcUy66lhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q45R70SZ4GNbGD0yl6IMD+eivKNAhgiOmhZWzOMDiKM=;
 b=g/d9DN9EYyUlZgOsqqs0xcYYISoNY4012McHrOuqNSyIGphFMQCt3rbkv8VwaK5XWjqOd72J5TnTn2HRYIGCZfYh4XjjY4WheSNsveTzV+TfOSIMjL/E7UD9YRAqprBxnIBkGso/CDuxyF0/kXvuN5Ivac6y6J2FCUDG0kbHgZI=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23; Thu, 27 May 2021 16:32:07 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9%12]) with mapi id 15.20.4173.022; Thu, 27 May
 2021 16:32:07 +0000
Subject: Re: [PATCH v7 01/15] swiotlb: Refactor swiotlb init functions
From: Tom Lendacky <thomas.lendacky@amd.com>
To: Christoph Hellwig <hch@lst.de>, Florian Fainelli <f.fainelli@gmail.com>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-2-tientzu@chromium.org>
 <170a54f2-be20-ec29-1d7f-3388e5f928c6@gmail.com>
 <20210527130211.GA24344@lst.de>
 <bab261b4-f801-05af-8fd9-c440ed219591@amd.com>
Message-ID: <e59d4799-a6ff-6d13-0fed-087fc3482587@amd.com>
Date: Thu, 27 May 2021 11:32:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <bab261b4-f801-05af-8fd9-c440ed219591@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SN7P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::30) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-linux.texastahm.com (67.79.209.213) by
 SN7P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Thu, 27 May 2021 16:32:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff9c356c-975c-4f82-7c16-08d9212cf790
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:
X-Microsoft-Antispam-PRVS: <DM5PR12MB250437DEE02CE4B6ED65D870EC239@DM5PR12MB2504.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FcGVaNUqWOacS4qyh3m/JN7k7/837FC8duYo0XVAJJd5k+WqoYLcoTR+CTvv8QEbyCZD/Z99yKW0kAO/XRRI76AF8ViBY7bKdBH3JWMeXgSYWuMNv8muI7pDCgCBAxpmWG89Hq/oD84DLTSFpgo7HqLuM/2mDEQUfE6/aGa1Q/mXdIALomEgUe0Xgf0ngsouf2bB533WVY1G2z89gYG2RtOfOu1QxzLU49yHRZJDEtwlCcLbmgYoLQdbPBISX+FoYH6zpn/l20UKvHeIxwim2wqN8iWydRQNAyFZc4jSwJGbg0cwBZY1maWQN0Po81sVGfMdNxrGtRXK+T/DGKXUvvZ0Gv3fRxThTXv3I5LeRx5wIIQ2/w/WfQwsIViUT3x/+A3k9ookLYdS8i+qbGEMpvTmHRo9Xa3cjHUXCjY4lS8YypbGSN2F5vKIo8MiexdPG1Q7ppDLRW1WZeGiRYY1EN1iE6lmwlICHca8PKDTmzcSc5LOpVaJx4MZ+EJdDGNLqsp6Kl/qrCErsXsy3WgG8QiaDkspb8J1sguRu/u/MAqKN1VLkgztc/Ar3wDwSPKMuImq3UJILi3oL2YUKwaoi4e+DvhFDTXmBtInykztacIVUheNAJl44l/pXBLmcpbwcCiQU9wj6iOMaWKkenoslOi4QhEkeWzwPrSiIB3ABRovYX+gkMWut/H8L4c2FRYl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(86362001)(54906003)(31696002)(110136005)(66946007)(4326008)(5660300002)(7416002)(6512007)(45080400002)(478600001)(31686004)(66556008)(2906002)(7366002)(316002)(956004)(2616005)(66476007)(8936002)(7406005)(36756003)(8676002)(6486002)(83380400001)(186003)(6506007)(38100700002)(26005)(53546011)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TUpkeGdMc1lLRmhsNm55LzRZYkp1WlhZQjluUXU0SENsK21aRHg1Y3NaQm1q?=
 =?utf-8?B?ZXRkb0NrUXNRM2FWL3l3UFFwNno2TXJRcFZ2M2ZGazNnS0RjaEpvS29ycnZQ?=
 =?utf-8?B?cUFtMUQvQ3RZbnJQdEtmdXg5SkZpL2hJdmloV3V0UXNrdFJUQ3F4dTh4KzQ0?=
 =?utf-8?B?QnU0LzVzL1NiSzcxZjNWbHllM2hNdHlMblRkMUUwdkxOT01JS2ZiZWMwMXZ6?=
 =?utf-8?B?OEwwWmNtd01EYjQ4SnZNKzNtcWZnTDFiRTYzam5yYS9Jei9FcGl0WkdCZzQ4?=
 =?utf-8?B?Ulg3QjNnb2V3V2JBNzVya2tVWDg1NFEvZ0JEdC8vajVvQ0wxZ2hrb2V5MHRF?=
 =?utf-8?B?K3RWVi9PUXE4UkxlSGhLOFAwRFdoa3lCbEhzbXBKR2wrT1kvQ1I5TUNQdUJi?=
 =?utf-8?B?TWRhUEkwNHJSVXh5bU1DQk1aRGdrSllDUnJDOVpjZkdRUGY2NDNOQVNBa0E3?=
 =?utf-8?B?RVdNM1QvWmVMWDdtak43bytsQ1BDL2J6UWQrRTdtVmdFS2oyMUdPWVFLa2VH?=
 =?utf-8?B?THMxV3ZzR1BNbTNSOVdwTkhKeWxja0lFMnQwMWZoK1pGVmZNV0tNdm82YUZX?=
 =?utf-8?B?MFJZalRUNXc2aDNKSzNQK0wxR1UrS2ZlaTYrMFFDSmhNTlFPaDF5VmdGZU9y?=
 =?utf-8?B?TzAyS1IzT1RYRklRQmVHbnArdGRScEt3UCs5OVAxanlDMHhDTTVQUUlTZXZD?=
 =?utf-8?B?T2FkM0NHcmIrVUdkY0tJR25ONjl0QmhlUjR4ME5XY1hPaUo0b1hZd20rb2RB?=
 =?utf-8?B?OHFGRkpBanlNZ2RWaHI2a1lIcm11Wks2S0V4a2pHaHlYMjR2bWdVakR2ajdK?=
 =?utf-8?B?ajFjL05jQTdzdHkzTkNEOVpYbXltcFM3ZlN3WDRrYVdNTHhtVWtqY2I4dzd6?=
 =?utf-8?B?dGowa1k3b3RLZjFwNkkrd3JZWjh0c2ZpUEpiQzZKQXdWL1REUURQL3l6ckxj?=
 =?utf-8?B?TGVtNURpb0JNS0NmM2NPRW5DS1FNMG1PY0NSUVdaWHV0ek5aenRrSHNNSVhC?=
 =?utf-8?B?YnlxUituYmtEbjBUcHhtSGJhTXduS2x6RFgvcTlZNmZKdDZqcnROQmFLZWk5?=
 =?utf-8?B?ZG5GRGhWdG94dSsvaE9uOFBUa0ZWWUU3YXJGWW8yaFo1RHNlOW5uU0N4MUxR?=
 =?utf-8?B?VkFGMFkwdzRKTFZPZmkydVI5b1hIZnR1Q2ZvUlB6V2xCQWNxLy84alFwQk93?=
 =?utf-8?B?Zm93Rk5FcWlvekJyeWpxYWFZVU1GRnJQUnViOTNaN2FtZzhBaXVXcU9wRzk4?=
 =?utf-8?B?Mmd4TXZhUTREYUdZN1NDVjl2QUIzeEM4dlVVSlhicVZ5SDJuTFkwZkVYTEVq?=
 =?utf-8?B?L25KZ1dSbllXUEk5WXltY0lPcGw2eW4vYkJocm1VaWh1RENkUEhrVU5YUUhM?=
 =?utf-8?B?Smx5NmY1NHZTWC9BTkdTNmlHWDM5QzVZL1lYOEZidU1Zak8zMVZUSC90amJl?=
 =?utf-8?B?Tk94T2QzOHM4L1BCalMyVStGSy9XaVdiWkc4NXlCLzlpT0ZXOHRzT0F6V2VT?=
 =?utf-8?B?bWNyNE00c0V1RStvK053clZFSmYyZ1JzMjhwSE8yR3BYMm5tNWRzYWVtSTd2?=
 =?utf-8?B?aDZVcUlGbHdoYld1VTk3ZEFtTWJzVE9FNkc3Rjd6MWIzMVFPekFQUXdiSm5K?=
 =?utf-8?B?eTZrU3hzbXFDWGJzckZrNGhqV2RFRTZQVWJQeVcxaWZGNGI5TUZWRUlBREtt?=
 =?utf-8?B?ZzU0RGN0Skprd3ExU1NTMjZDaGtzMUdEeHphR054NWpFVlozK0FsOGxiRCtR?=
 =?utf-8?Q?qfedf2phVVGR5NGp69NYP3DhJAKJa9XLDzqnT+9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9c356c-975c-4f82-7c16-08d9212cf790
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 16:32:06.8243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJS6bIZ0vjGRb0nzhcqirX3WEUS9JFIjV74y0C7suMUncSWyTzMsKQx1kkXffQS7NpGhfRw3Qzl5gmec0Rv+Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2504
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
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 xypron.glpk@gmx.de, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 jxgao@google.com, daniel@ffwll.ch, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com,
 Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/27/21 9:41 AM, Tom Lendacky wrote:
> On 5/27/21 8:02 AM, Christoph Hellwig wrote:
>> On Wed, May 19, 2021 at 11:50:07AM -0700, Florian Fainelli wrote:
>>> You convert this call site with swiotlb_init_io_tlb_mem() which did not
>>> do the set_memory_decrypted()+memset(). Is this okay or should
>>> swiotlb_init_io_tlb_mem() add an additional argument to do this
>>> conditionally?
>>
>> The zeroing is useful and was missing before.  I think having a clean
>> state here is the right thing.
>>
>> Not sure about the set_memory_decrypted, swiotlb_update_mem_attributes
>> kinda suggests it is too early to set the memory decrupted.
>>
>> Adding Tom who should now about all this.
> 
> The reason for adding swiotlb_update_mem_attributes() was because having
> the call to set_memory_decrypted() in swiotlb_init_with_tbl() triggered a
> BUG_ON() related to interrupts not being enabled yet during boot. So that
> call had to be delayed until interrupts were enabled.

I pulled down and tested the patch set and booted with SME enabled. The
following was seen during the boot:

[    0.134184] BUG: Bad page state in process swapper  pfn:108002
[    0.134196] page:(____ptrval____) refcount:0 mapcount:-128 mapping:0000000000000000 index:0x0 pfn:0x108002
[    0.134201] flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
[    0.134208] raw: 0017ffffc0000000 ffff88847f355e28 ffff88847f355e28 0000000000000000
[    0.134210] raw: 0000000000000000 0000000000000001 00000000ffffff7f 0000000000000000
[    0.134212] page dumped because: nonzero mapcount
[    0.134213] Modules linked in:
[    0.134218] CPU: 0 PID: 0 Comm: swapper Not tainted 5.13.0-rc2-sos-custom #3
[    0.134221] Hardware name: ...
[    0.134224] Call Trace:
[    0.134233]  dump_stack+0x76/0x94
[    0.134244]  bad_page+0xa6/0xf0
[    0.134252]  __free_pages_ok+0x331/0x360
[    0.134256]  memblock_free_all+0x158/0x1c1
[    0.134267]  mem_init+0x1f/0x14c
[    0.134273]  start_kernel+0x290/0x574
[    0.134279]  secondary_startup_64_no_verify+0xb0/0xbb

I see this about 40 times during the boot, each with a different PFN. The
system boots (which seemed odd), but I don't know if there will be side
effects to this (I didn't stress the system).

I modified the code to add a flag to not do the set_memory_decrypted(), as
suggested by Florian, when invoked from swiotlb_init_with_tbl(), and that
eliminated the bad page state BUG.

Thanks,
Tom

> 
> Thanks,
> Tom
> 
>>
