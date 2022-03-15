Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C689B4DA4A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 22:31:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJ661514Yz3bTq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 08:31:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MwDakT+W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MwDakT+W; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJ65K1k8Hz2xF0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 08:30:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647379829; x=1678915829;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=A7BNzJil5UVOdacWFDYWEMOTLH+DuBVapnx31WlTQXY=;
 b=MwDakT+WBek+3MiR+oOA2RQIfrHAGxqIAsJ8HI/0IiilNFOjC3Au6LUT
 DT8tKyHwy1DQPoidijc7zJwsfwDUgWacIYEgn0HSWDPUNG9SjLZ64lN+M
 jX4Nw+RvnxgsKhLcvgWztBmEiiD8WFxzKKifAiYUuE+IhlFAAh+45QqsO
 1sDs72toAJRC9Uw35BStI8pu4qm1y0pKzBeBvB9+KTfn70duUI5fhmR+9
 87zQLA2Ou3l/YU9e4vX2JYCbcUUpG9GdojXW6wJH3sNbyk3BDEN1N8clP
 o6V5lcPH4T8idCp6Kn+tkF01R+Lm49exWFfGLZvBYPYtratyFy9UBF4QB A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256617837"
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="256617837"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 14:29:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="512767160"
Received: from rariley-mobl.amr.corp.intel.com (HELO [10.209.120.225])
 ([10.209.120.225])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 14:29:23 -0700
Message-ID: <f794a3fb-4d3a-7e3d-1600-27ee831526fd@linux.intel.com>
Date: Tue, 15 Mar 2022 14:29:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2] PCI/AER: Handle Multi UnCorrectable/Correctable errors
 properly
Content-Language: en-US
To: Eric Badger <ebadger@purestorage.com>
References: <20220315050842.120063-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20220315171425.GA1521135@ebps>
 <2d4e8811-dce6-c891-e92d-e3746434685e@linux.intel.com>
 <20220315195255.GA1523195@ebps>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20220315195255.GA1523195@ebps>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Oliver OHalloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/15/22 12:52 PM, Eric Badger wrote:
> On Tue, Mar 15, 2022 at 10:26:46AM -0700, Sathyanarayanan Kuppuswamy wrote:
>> On 3/15/22 10:14 AM, Eric Badger wrote:
>>>>    # Prep injection data for a correctable error.
>>>>    $ cd /sys/kernel/debug/apei/einj
>>>>    $ echo 0x00000040 > error_type
>>>>    $ echo 0x4 > flags
>>>>    $ echo 0x891000 > param4
>>>>
>>>>    # Root Error Status is initially clear
>>>>    $ setpci -s <Dev ID> ECAP0001+0x30.w
>>>>    0000
>>>>
>>>>    # Inject one error
>>>>    $ echo 1 > error_inject
>>>>
>>>>    # Interrupt received
>>>>    pcieport <Dev ID>: AER: Root Error Status 0001
>>>>
>>>>    # Inject another error (within 5 seconds)
>>>>    $ echo 1 > error_inject
>>>>
>>>>    # No interrupt received, but "multiple ERR_COR" is now set
>>>>    $ setpci -s <Dev ID> ECAP0001+0x30.w
>>>>    0003
>>>>
>>>>    # Wait for a while, then clear ERR_COR. A new interrupt immediately
>>>>      fires.
>>>>    $ setpci -s <Dev ID> ECAP0001+0x30.w=0x1
>>>>    pcieport <Dev ID>: AER: Root Error Status 0002
>>>>
>>>> Currently, the above issue has been only reproduced in the ICL server
>>>> platform.
>>>>
>>>> [Eric: proposed reproducing steps]
>>> Hmm, this differs from the procedure I described on v1, and I don't
>>> think will work as described here.
>>
>> I have attempted to modify the steps to reproduce it without returning
>> IRQ_NONE for all cases (which will break the functionality). But I
>> think I did not correct the last few steps.
> 
> Well, the thinking in always returning IRQ_NONE was so that only setpci
> modified the register and we could clearly see how writes to the
> register affect interrupt generation.

Got it. Makes sense.

> 
>> How about replacing the last 3 steps with following?
>>
>>   # Inject another error (within 5 seconds)
>>   $ echo 1 > error_inject
>>
>>   # You will get a new IRQ with only multiple ERR_COR bit set
>>   pcieport <Dev ID>: AER: Root Error Status 0002
> 
> This seems accurate. Though it does muddy a detail that I think was
> clearer in the original procedure: was the second interrupt triggered by
> the second error, or by the write of 0x1 to Root Error Status?

I think you are talking about the following command, right?

setpci -s <Dev ID> ECAP0001+0x30.w=0x1

If yes, my previously modified instructions already removed it. So
no confusion.

To summarize,

In your case, you have controlled both register read/write of Root
error status register to simulate the interrupt with only multi
ERR_COR bit set.

In my case, I have attempted to simulate it without changing the
default behavior of aer_irq() in the kernel.

Both seem ok to me. Although my personal preference is to trigger
the error without changing the code behavior, if both you and Bjorn
prefer to revert to old instructions, I will fix this in the next version.


> 
> Cheers,
> Eric

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
