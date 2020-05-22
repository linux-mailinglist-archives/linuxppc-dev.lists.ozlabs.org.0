Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E421DDC77
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 03:12:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SpPj6zrPzDqvv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 11:12:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XHJ890HH; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SpN50CN3zDqvN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 11:11:16 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id n15so4261696pjt.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 18:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tSo4NoTuRxDTr+YPCjcACPFp+Eah2j+hAJOrlQ361pk=;
 b=XHJ890HHDoAKe+yk8IzwTWP4yxeaKrOCJgkw0pq6nnPqlA2XR5GCF9RPBqhw9fk5jk
 Ol4XAOBCZkYTw7wU710QTE+ugrYeKtQzd1GoFF44W9/OgMgkyqAyf/DdPozUGPF5TbKO
 QEOatvtnAxolp1ev6K0bp0m4d1BfJNUfe8yCU5/4KmxaG0/K/Oc76VsgNidn1ZISuzhm
 gDDbPrKV0TOKikLQIHTO7byIOdfAHlZe/u3R755Ecxdiu6zqXQK5RUbUdyLBlUaBNZid
 Dn2mY39/6XR82gwd7KzqHOhh3b6GvKEp3B9q2oabz0Gk0gop9Z5jHPHaF1k5P80xfdpr
 FOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tSo4NoTuRxDTr+YPCjcACPFp+Eah2j+hAJOrlQ361pk=;
 b=DRAlxjrY0AGGP4Ld0TUx+DhQlHJiB4bwSuy/yXiLIhZCxcHm7jiom4S/pL8/5nptYn
 +jOdYWE0VcmikOnLFafZ5BDqFpst8WYhmBip69Q5Y2CBqsrWUn5QZVJCx7Ry9GIn/4Qj
 7oDccPtvl1iYSQhXlKCqxnVWhToH6H2QeSGa/qvLUopmkHIEXyWjixK1K7wrxXcJon0F
 HMw1F1rbzWuycOO9Lvj860Uid4Ka5qRgBwVRTX2FW467M2EwZT/syeXXKg+AmhJAibB5
 FaZjqX4mB/JIKSBY1NqVCWplswhUD6XBC/z/revHWdnFOp+qYC8JKxhP+pYFl57zmU5R
 wGeQ==
X-Gm-Message-State: AOAM533mNcgRLGVMbQw59tuDnHvv3Xq1yz4ag5bb/I86RvCGmwc0IgcN
 eYV2MWn/3FDfUPgNyLn19Yg=
X-Google-Smtp-Source: ABdhPJwICBU4niNtPQuz9RcHNkUJF280bbLGpjPfNFBjmEPr1b13gwA/RHJHxo2gkN9ypjOGh41Iww==
X-Received: by 2002:a17:902:9007:: with SMTP id
 a7mr12934539plp.194.1590109873119; 
 Thu, 21 May 2020 18:11:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 y75sm5442903pfb.212.2020.05.21.18.11.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 18:11:12 -0700 (PDT)
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
To: Al Viro <viro@zeniv.linux.org.uk>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200521172704.GF23230@ZenIV.linux.org.uk>
 <bdc8dc64-622c-3b0d-1ae1-48222cf34358@roeck-us.net>
 <20200521224612.GJ23230@ZenIV.linux.org.uk>
 <20200522004618.GA3151350@ZenIV.linux.org.uk>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <970857bd-bb56-7b2e-833e-ca74a82fa9b5@roeck-us.net>
Date: Thu, 21 May 2020 18:11:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200522004618.GA3151350@ZenIV.linux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 ira.weiny@intel.com, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/21/20 5:46 PM, Al Viro wrote:
> On Thu, May 21, 2020 at 11:46:12PM +0100, Al Viro wrote:
>> On Thu, May 21, 2020 at 03:20:46PM -0700, Guenter Roeck wrote:
>>> On 5/21/20 10:27 AM, Al Viro wrote:
>>>> On Tue, May 19, 2020 at 09:54:22AM -0700, Guenter Roeck wrote:
>>>>> On Mon, May 18, 2020 at 11:48:43AM -0700, ira.weiny@intel.com wrote:
>>>>>> From: Ira Weiny <ira.weiny@intel.com>
>>>>>>
>>>>>> The kunmap_atomic clean up failed to remove one set of pagefault/preempt
>>>>>> enables when vaddr is not in the fixmap.
>>>>>>
>>>>>> Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
>>>>>> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
>>>>>
>>>>> microblazeel works with this patch, as do the nosmp sparc32 boot tests,
>>>>> but sparc32 boot tests with SMP enabled still fail with lots of messages
>>>>> such as:
>>>>
>>>> BTW, what's your setup for sparc32 boot tests?  IOW, how do you manage to
>>>> shrink the damn thing enough to have the loader cope with it?  I hadn't
>>>> been able to do that for the current mainline ;-/
>>>>
>>>
>>> defconfig seems to work just fine, even after enabling various debug
>>> and file system options.
>>
>> The hell?  How do you manage to get the kernel in?  sparc32_defconfig
>> ends up with 5316876 bytes unpacked...
> 
> Incidentally, trying to load it via -kernel/-initrd leads to
> Configuration device id QEMU version 1 machine id 64
> Probing SBus slot 0 offset 0
> Probing SBus slot 1 offset 0
> Probing SBus slot 2 offset 0
> Probing SBus slot 3 offset 0
> Probing SBus slot 15 offset 0
> Invalid FCode start byte
> CPUs: 1 x TI,TMS390Z55
> UUID: 00000000-0000-0000-0000-000000000000
> Welcome to OpenBIOS v1.1 built on Dec 27 2018 19:17
>   Type 'help' for detailed information
> [sparc] Kernel already loaded
> switching to new context:
> PROMLIB: obio_ranges 1
> PROMLIB: Sun Boot Prom Version 3 Revision 2
> Linux version 5.7.0-rc1-00002-gcf51e129b968 (al@duke) (gcc version 6.3.0 20170516 (Debian 6.3.0-18), GNU ld (GNU Binutils for Debian) 2.28) #32 Thu May 21 18:36:07 EDT 2020
> printk: bootconsole [earlyprom0] enabled
> ARCH: SUN4M
> TYPE: Sun4m SparcStation10/20
> Ethernet address: 52:54:00:12:34:56
> 303MB HIGHMEM available.
> OF stdout device is: /obio/zs@0,100000:a
> PROM: Built device tree with 30051 bytes of memory.
> Booting Linux...
> Power off control detected.
> Kernel panic - not syncing: Failed to allocate memory for percpu areas.
> CPU: 0 PID: 0 Comm: swapper Not tainted 5.7.0-rc1-00002-gcf51e129b968 #32
> [f04f92a8 : 
> setup_per_cpu_areas+0x58/0x90 ] 
> [f04edbf4 : 
> start_kernel+0xc0/0x4a0 ] 
> [f04ed43c : 
> continue_boot+0x324/0x334 ] 
> [00000000 : 
> 0x0 ] 
> 
> Press Stop-A (L1-A) from sun keyboard or send break
> twice on console to return to the boot prom
> ---[ end Kernel panic - not syncing: Failed to allocate memory for percpu areas. ]---
> 
> Giving guest more RAM doesn't change the outcome (well, the number HIGHMEM line is
> obviously higher, but that's it).
> 
> So which sparc32 kernel have you booted with defconfig and how have you done
> that?
> 

Mainline, with:

qemu-system-sparc -M SS-4 -kernel arch/sparc/boot/zImage -no-reboot \
	-snapshot -drive file=rootfs.ext2,format=raw,if=scsi \
	-append "panic=-1 slub_debug=FZPUA root=/dev/sda console=ttyS0"
	-nographic -monitor none

The machine doesn't really matter, though. The root file system is built
with buildroot.

Note that I carry two reverts in my qemu images.

Revert "tcx: switch to load_image_mr() and remove prom_addr hack"
Revert "cg3: switch to load_image_mr() and remove prom-addr hack"

I have been carrying those since ~2017. I didn't check recently
if they are still needed.

If sparc32 is no longer supported in the upstream kernel,
would it possibly make sense remove its support ?

Guenter
