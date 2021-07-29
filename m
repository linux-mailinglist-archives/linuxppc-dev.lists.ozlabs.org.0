Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A52FD3DA650
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 16:25:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbCVc2KHTz3cX5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jul 2021 00:25:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LIvpt20J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.102.86; helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thomas.lendacky@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=LIvpt20J; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2086.outbound.protection.outlook.com [40.107.102.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbCV14hXcz3cGJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jul 2021 00:24:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBPOZblI+D9q77pDFBSyLNHXzTrAz5IsLvp2O2F8c60Kl6isOKWXRrwlt1ZJxP3/O9ABpgyEyl210S07fUIJqdg6MUASfOl2zQ7DfbQdSdD3TJlTnn+soHx0lrQjWn4H/IsE1EHvsgYyFzAgj8m0mJ3BVcF7oNBEz++uZmFT/XcoMJeCanhq68znsaTFif9wI3z7l1YU2grMOV8MsDw2aIqKlHFCIqr/zXgvsvGeteEuII2MzBvf8t1W6U6EANqJK972jsXpjU4+bZPZmFvuJLYuQ2RJyRTlCPTp6TR+QOrt8uxMMiv2OCB/wN0Vg/GqSubLzK0Z70Sxszll2sv+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxOGcG2LsSuPhPcirirqQ/LcY/hiKUspD1DVlba2L3c=;
 b=TGC1W3GPQplOEI5Vu2rfdFM4EFWQu+dpNHlxxgTIHstcNsVx0E3Famfug+SaKINOZc8CI27DVXnchwAStUX9Y0Wxm5SfMO7U2e1HDnEyzPlh4Ui+GvlPX7pO37ejeNDoyL47nyZAQPcbY9nAN60RQ5ghlApHSr58+Cc53i+hdnnWsKAOUPh4Ql6MS1mxDKj5Gc90fOAB/vpFZ2/E3nKLKarwRsM0xwZf7f2ykK/J0UEH4duD2JYU8D3/JRZxMFaIrmkgelAem7yS+kwF7IIiMSrt9SmLdSH1YvBiNKQQUckxrDqczNrXV2y125ykG+cUCvXSioaga4XWmm4S3+mONQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxOGcG2LsSuPhPcirirqQ/LcY/hiKUspD1DVlba2L3c=;
 b=LIvpt20J02/WWVx2KsVWfVez16+ttvk4SPIxCg8AldfS1gQBEvUPs21El1F7ZZw72jymteXfSvkaKTKHdDouFQLMyVqLaIyECNno18DfU8UrRC0LdGZQ9hBN87q29w6BBNuiu43RoIZlFfQ8drIWnNQBz/d1QmlQIzU6wVunksA=
Authentication-Results: linutronix.de; dkim=none (message not signed)
 header.d=none;linutronix.de; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by DM4PR12MB5296.namprd12.prod.outlook.com (2603:10b6:5:39d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Thu, 29 Jul
 2021 14:24:38 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::73:2581:970b:3208]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::73:2581:970b:3208%3]) with mapi id 15.20.4373.020; Thu, 29 Jul 2021
 14:24:38 +0000
Subject: Re: [PATCH 02/11] x86/sev: Add an x86 version of prot_guest_has()
To: Christoph Hellwig <hch@infradead.org>
References: <cover.1627424773.git.thomas.lendacky@amd.com>
 <b3e929a77303dd47fd2adc2a1011009d3bfcee20.1627424774.git.thomas.lendacky@amd.com>
 <YQFaM7nOhD2d6SUQ@infradead.org>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <9f371091-7f73-8f60-e537-166984c650c1@amd.com>
Date: Thu, 29 Jul 2021 09:24:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YQFaM7nOhD2d6SUQ@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0158.namprd13.prod.outlook.com
 (2603:10b6:806:28::13) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-ryzen.texastahm.com (67.79.209.213) by
 SA9PR13CA0158.namprd13.prod.outlook.com (2603:10b6:806:28::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.9 via Frontend Transport; Thu, 29 Jul 2021 14:24:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c51be881-a8ee-4f10-1d19-08d9529c9870
X-MS-TrafficTypeDiagnostic: DM4PR12MB5296:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5296FD585C0C26204D6AB48BECEB9@DM4PR12MB5296.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g8YoiZL9oeNXf2hggdEMEReQ+f+DiLp2r9FTfxn88t2YLUE3pWUNn8K9VtxgI8iolh3GEkoas+UVQIrSlwwsn0ddWqksQBUcCLc4Uzf6H5rqzpW5qSn3OUEU7heA2gQpwQchJ/M19G+awOq+zZRXLe/2h5RbYxk931+1rw4HdoHwWoMSiGKwq+M1Jo/zWiDQvzLS4Kymdi27/i4xNFaGO/3NdVa4f2HkR3bWK8Npg4xGKFk3D9GV9PLQF6rTDrNk4pm2Z3HJJW7dxn29XFfNYIvhvkyYoeWKrzNgEMqGPktb27iDoOkEdvbGZDCOvEfusrO0GCbZrnqxrRiT/fDS1VQg6BU+Jql0WSzrT8jGbM0+bIzhtM9uIheXwtYjd5NlULBUjxcOdNLm/vHUDMSl24DqKpvBDHkaF31ZatgpoIKTudS+qRgeXy/onmmD0u7oIrZXGV3F/WJZAgXOZRkW/JsJIyE6WBIqmxAfHBPazdIeruy0Gs6bslyx9jWuHbX4JprQGnbAbbii71eN07uJ1TTYpUtj2M/P7OGEd1HcAoqjNDli+R7sOf+12ENRM0/tm4w6UF1XN3jjLJVwlG+A36O+bO9nvyJlIMmZKNKmSNbDnZtUwruXFh+x1i4No1RYrXFgyNIoqsiVN/cetcApGCTZ7xHqcxe6y1raQ1GK19K5lIaQncIMmHmhZztRCPInZdsbdwihBrS2ZVlEdkrhB7N+rO8CFWLP1X9/idqL/1c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5229.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(5660300002)(6486002)(4744005)(31696002)(38100700002)(36756003)(6916009)(478600001)(6512007)(31686004)(316002)(8676002)(26005)(8936002)(4326008)(7416002)(6506007)(956004)(2906002)(66476007)(66946007)(86362001)(53546011)(66556008)(186003)(54906003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDdDZ1VyMGZLZGtueGNoY1o0TTBwTEUyNnhuc3NiOFF1QVQ5QnlZN3FWS3g1?=
 =?utf-8?B?dDlqSzZsWkdIdTFIWUVMc1NxaVptTStJMENLbERqQkg4eTdkOGlXeHFEckpH?=
 =?utf-8?B?VTF0aWljYXlKTW9QVkc3YWRlMHN6Z005MW5VSm9aYmErVjBHWmdxY3N2ZHpL?=
 =?utf-8?B?V0p5VE5WUVBnMTdlbkx2VHNDNDZlUDAxTW5adUxuVGRoMi9tNzdTTVk5bU5L?=
 =?utf-8?B?c05WdVRpUDZuMllJYjFmVkZLUmh4REVtVHVXTXQ1elhjbVlreVR2WlcyWkJp?=
 =?utf-8?B?NUVzQURpNytGa2VpcXJ0OEoyVVg0NzM3TmZZdXAyQ1FORnpCV2taUlNiVnZQ?=
 =?utf-8?B?R1U1RTREbVV3bkEwRTFkcU0rdE5mVnpmQkVRMnAxb2U5OXdsVXNrSTJnNjQz?=
 =?utf-8?B?T21oWU5Sb21aeE1KckRnaFJvVGJPZWY3Y0J6ZmkzSzRjd1BEWjltS055OGFz?=
 =?utf-8?B?V285VEdqalN6TmhCcmM4NlFLYlZZOXJMOTZaN0luNW9Scm9VTjRVYTVXYU4x?=
 =?utf-8?B?MU1FZGxXRktjYzdseHF0WElkbU5EMU9yNE9DdFlkMGczMzlGQnQ0V1RzMkpp?=
 =?utf-8?B?NWFRRlFYK0JwTG40SHhkS3VIOHltUXlVSG41N2h6UkVBOW93WWMrRE9KL0g2?=
 =?utf-8?B?SXQwVWRCZGVvRUE0YytDVzdYWmJKTnRmYm01SHZudnhHZmQyTHRJbEhlRmow?=
 =?utf-8?B?NWVSKzN0TmtFSk1zWmxqRTZoOG5GWDdhZFpBNTBPY1VUOTR6eXEzQTZmNytt?=
 =?utf-8?B?VnRGSjZtUlBIOGpFZStSUVA0VkN3dm5MS3BTTnBFSzNUK1NJUWtyaDhsV1ZY?=
 =?utf-8?B?eGd1ZHVkbnh4MEJPS3RxY3FLQzNLakoyL0lERW9UVzV3dlFxYnFpY0RIdTZR?=
 =?utf-8?B?QzZtbTVETTNUQnNQSytZVS8ySnVEQmFEczdzeUkvSkxlUEU5SkhaWTJGQUh6?=
 =?utf-8?B?MktRVkFObjFtdkhTdnNvRlkwVUZzZUxNSFhDaFdtTzVHWmJtS2E4a29JUVEy?=
 =?utf-8?B?NnYvaFhtMDhyOVltNTBlNDJwMWg5MmFCUXpjVjRkWCtZR1F5aE81VHpFclp0?=
 =?utf-8?B?ejFnWGJVM2g1Q0hMSVRSTWxDNkNwNGxsWVdrYnA3eUdaUGZ2dlZ4TEtoNXo2?=
 =?utf-8?B?OTVPNDE5YjQvZFU4alFmeUg5Q3kwRGxoUjBkZjJiOFFPNkl2OTBkWmt0ZExN?=
 =?utf-8?B?c3l6TEI0RkdvZnpSZzJPMTNzYXJnRUUza0pRUzFmcWhERk1zZVRSVktlYUZQ?=
 =?utf-8?B?MjZHNTdtL1A1MkxSUmN4bm1IZzNQaCt6WmpXSUlDWGxQUm9BVk1sUGE4b0RS?=
 =?utf-8?B?QUcweUozYjVpeG5jZ01lUTMxeGd0WVd2bkduZmNCM0RxNWNhdk4rNzlSMENl?=
 =?utf-8?B?Q1lEMGthSzVSYmNxNmg0TUFTdU45TGtOMGpkc0JReVlzTi9SZFE1aWJSUWds?=
 =?utf-8?B?YVFZQnVRQ1UrYld4S1BtVTQyc0hoVEJqdlBYOEtZaWx2dHBvUW53bU9GYUNH?=
 =?utf-8?B?TUc3V0d4WWltS0FDcytocVpHdDVPRyttVGtzUXoxTHl3aTNXWW55WlpDOXEw?=
 =?utf-8?B?RnZnU1RSOVFpNUNuNGsrSyt3VjhEMERpb280a3Bud1FTME5yZEtwV0x0dERP?=
 =?utf-8?B?Q0YwbVVwL1Q4bElrM3owdSt5dUUraTdDaU8zRi9DWWRQaWx1Q0tsTzNHVkh1?=
 =?utf-8?B?RXhYbTlsbVlKRjVHMkJvZE01alRWdFdsREJmV2ZlaTU3enJud2NIMnVCNTVO?=
 =?utf-8?Q?q4A8SyjXWCqV9AOU5580L5phdBMDoaGT3lNqj8e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c51be881-a8ee-4f10-1d19-08d9529c9870
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 14:24:37.8233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1yJKZYpE3WkuJiRwixNSm6zZLvrS6IgOGEpCjzchdd6GSdW+MSbiMQLNDM2RswlYPSEsW5kcYKeKwZNqRb27Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5296
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
Cc: linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-s390@vger.kernel.org,
 Andi Kleen <ak@linux.intel.com>, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, linux-graphics-maintainer@vmware.com,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/28/21 8:22 AM, Christoph Hellwig wrote:
> On Tue, Jul 27, 2021 at 05:26:05PM -0500, Tom Lendacky via iommu wrote:
>> Introduce an x86 version of the prot_guest_has() function. This will be
>> used in the more generic x86 code to replace vendor specific calls like
>> sev_active(), etc.
>>
>> While the name suggests this is intended mainly for guests, it will
>> also be used for host memory encryption checks in place of sme_active().
>>
>> The amd_prot_guest_has() function does not use EXPORT_SYMBOL_GPL for the
>> same reasons previously stated when changing sme_active(), sev_active and
> 
> None of that applies here as none of the callers get pulled into
> random macros.  The only case of that is sme_me_mask through
> sme_mask, but that's not something this series replaces as far as I can
> tell.

Ok, let me make sure of that and I'll change to EXPORT_SYMBOL_GPL if
that's the case.

Thanks,
Tom

> 
