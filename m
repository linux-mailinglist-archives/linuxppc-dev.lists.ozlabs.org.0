Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C1EB04F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 22:39:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TDJc16BSzF3tw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 06:38:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=neo-zeon.de
 (client-ip=96.90.244.226; helo=neo-zeon.de; envelope-from=cam@neo-zeon.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neo-zeon.de
X-Greylist: delayed 1701 seconds by postgrey-1.36 at bilbo;
 Thu, 12 Sep 2019 02:03:17 AEST
Received: from neo-zeon.de (neo-zeon.de [96.90.244.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T6BY3bg0zF3bv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 02:03:16 +1000 (AEST)
Received: from [192.168.0.55] (ukyo.nerv.lan [192.168.0.55])
 (authenticated bits=0)
 by neo-zeon.de (8.15.2/8.15.2) with ESMTPSA id x8BFYnnx084719
 (version=TLSv1.2 cipher=AES128-SHA bits=128 verify=NO);
 Wed, 11 Sep 2019 08:34:49 -0700 (PDT) (envelope-from cam@neo-zeon.de)
Subject: Re: [Bug 204789] New: Boot failure with more than 256G of memory
To: Andrew Morton <akpm@linux-foundation.org>
References: <bug-204789-27@https.bugzilla.kernel.org/>
 <20190911073153.9df4d4618d7f99752cd18edd@linux-foundation.org>
From: Cameron Berkenpas <cam@neo-zeon.de>
Message-ID: <b966080e-0a5f-a584-9fe3-85d26be8fda4@neo-zeon.de>
Date: Wed, 11 Sep 2019 08:34:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911073153.9df4d4618d7f99752cd18edd@linux-foundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Thu, 12 Sep 2019 06:37:11 +1000
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
Cc: bugzilla-daemon@bugzilla.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Regression set to "yes". Not sure how I missed that. :)

Will report future PPC issues to that I come across to this list as well.

Thanks!

-Cameron

On 9/11/19 7:31 AM, Andrew Morton wrote:
> (switched to email.  Please respond via emailed reply-to-all, not via the
> bugzilla web interface).
>
> On Sun, 08 Sep 2019 00:04:26 +0000 bugzilla-daemon@bugzilla.kernel.org wrote:
>
>> https://bugzilla.kernel.org/show_bug.cgi?id=204789
>>
>>              Bug ID: 204789
>>             Summary: Boot failure with more than 256G of memory
>>             Product: Memory Management
>>             Version: 2.5
>>      Kernel Version: 5.2.x
>>            Hardware: PPC-64
>>                  OS: Linux
>>                Tree: Mainline
>>              Status: NEW
>>            Severity: high
>>            Priority: P1
>>           Component: Other
>>            Assignee: akpm@linux-foundation.org
>>            Reporter: cam@neo-zeon.de
>>          Regression: No
> "Yes" :)
>
>> Kernel series 5.2.x will not boot on my Talos II workstation with dual POWER9
>> 18 core processors and 512G of physical memory with disable_radix=yes and 4k
>> pages.
>>
>> 5.3-rc6 did not work either.
>>
>> 5.1 and earlier boot fine.
> Thanks.  It's probably best to report this on the powerpc list, cc'ed here.
>
>> I can get the system to boot IF I leave the Radix MMU enabled or if I boot a
>> kernel with 64k pages. I haven't yet tested enabling the Radix MMU with 64k
>> pages at the same time, but I suspect this would work. This is a system I
>> cannot take down TOO frequently.
>>
>> The system will also boot with the Radix MMU disabled and 4k pages with 256G or
>> less memory. Setting mem on the kernel CLI to 256G or less results in a
>> successful boot. Setting mem=257G or higher no Radix MMU and 4k pages and the
>> kernel will not boot.
>>
>> Petitboot comes up, but the system fails VERY early in boot in the serial
>> console with:
>> SIGTERM received, booting...
>> [   23.838858] kexec_core: Starting new kernel
>>
>> Early printk is enabled, and it never progresses any further.
>>
>> 5.1 boots just fine with the Radix MMU disabled and 4k pages.
>>
>> Unfortunately, I currently need 4k pages for bcache to work, and Radix MMU
>> disabled in order for FreeBSD 12.x to work under KVM so I'm sticking with
>> 5.1.21 for now.
>>
>> I have been unable to reproduce this issue in KVM.
>>
>> Here are my PCIe peripherals:
>> 1. Microsemi/Adaptec HBA 1100-4i SAS controller
>> 2. Megaraid 9316-16i SAS RAID controller.
>>
>> I've only tried little endian as this is a little endian install.
>>
>> -- 
>> You are receiving this mail because:
>> You are the assignee for the bug.

