Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1785887A2CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 06:59:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvfwZ71Tnz3vY4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 16:59:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.49; helo=mail-ej1-f49.google.com; envelope-from=jirislaby@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvfw74s7Sz30Dg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 16:59:02 +1100 (AEDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a44665605f3so869262066b.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 22:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710309539; x=1710914339;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FC9guWLxmmXH86zOi5oh/8tWOg1aYsuSWdN0hdUo1c0=;
        b=uNbJc1m/jhLwLHeLBkE3TKu1mQrnl4PMYfjA3SUnaqXQQUf97ytZoYY7zwp53jksB/
         pFpE/CKeZ8FsfTVQupca6g208Q5VbY0DqsofHCX9KlMbPRryts9o/iPlpukAdbRAfWhg
         /wvHwjfV4lS3O/KBfvZ9mK4OM6B0tufPXJbRL5m10QYg5bH5Y5OshIBMdlKDBfOP8v9l
         s3A4OqVEDQIiZKLJfAp5kizTRtg5CY84cA7b2Yckb6QxcNc4QWyJvgGryux3fxr92Id0
         OK0fWEebDXWscncDYTL65E32vXVFDNryQyQFp/FV1ARsxdv4bMpNP1vMdoxwgjrW06Xh
         jJZg==
X-Forwarded-Encrypted: i=1; AJvYcCXXon4MEe1rMkns8cnlquGKtoyQem0q7aWBihjoKHPYmS4MH263qkdz77YrKdUXm7IIaVbCNHPdKsi+rcMWLGNeRG0X4+I3JmnXFwpOJw==
X-Gm-Message-State: AOJu0YyJc+0AlnrsxAoDD9japz/TNxUAnrNnitexQDPs3G1dKHlXDU+w
	79SLTkI/JM1rKZW5RjB2MN52gnBOpDZ6UZJOAt0O1e00XshGmX+4
X-Google-Smtp-Source: AGHT+IF1DKEBHH7THeHK7qF/QH9nX9dnPPdf2eLf09VtJZVQ94PHeKO2IRHzU23lHnfF+f8pqyGa4Q==
X-Received: by 2002:a17:906:3da2:b0:a45:f477:f9bf with SMTP id y2-20020a1709063da200b00a45f477f9bfmr6173196ejh.56.1710309538985;
        Tue, 12 Mar 2024 22:58:58 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id v8-20020a1709067d8800b00a45aeaf9969sm4518500ejo.5.2024.03.12.22.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 22:58:58 -0700 (PDT)
Message-ID: <2f8b1b2d-0abb-43f0-8665-0855928f017c@kernel.org>
Date: Wed, 13 Mar 2024 06:58:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kexec verbose dumps with 6.8 [was: [PATCH v4 1/7] kexec_file: add
 kexec_file flag to control debug printing]
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>
References: <20231213055747.61826-1-bhe@redhat.com>
 <20231213055747.61826-2-bhe@redhat.com>
 <4c775fca-5def-4a2d-8437-7130b02722a2@kernel.org>
 <ZfD37AlznCXJ6P54@MiWiFi-R3L-srv>
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <ZfD37AlznCXJ6P54@MiWiFi-R3L-srv>
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
Cc: linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, conor@kernel.org, nathan@kernel.org, joe@perches.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,


On 13. 03. 24, 1:48, Baoquan He wrote:
> Hi Jiri,
> 
> On 03/12/24 at 10:58am, Jiri Slaby wrote:
>> On 13. 12. 23, 6:57, Baoquan He wrote:
>   ... snip...
>>> --- a/include/linux/kexec.h
>>> +++ b/include/linux/kexec.h
>> ...
>>> @@ -500,6 +500,13 @@ static inline int crash_hotplug_memory_support(void) { return 0; }
>>>    static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
>>>    #endif
>>> +extern bool kexec_file_dbg_print;
>>> +
>>> +#define kexec_dprintk(fmt, ...)					\
>>> +	printk("%s" fmt,					\
>>> +	       kexec_file_dbg_print ? KERN_INFO : KERN_DEBUG,	\
>>> +	       ##__VA_ARGS__)
>>
>> This means you dump it _always_. Only with different levels.
> 
> It dumped always too with pr_debug() before, I just add a switch to
> control it's pr_info() or pr_debug().

Not really, see below.

>>
>> And without any prefix whatsoever, so people see bloat like this in their
>> log now:
>> [  +0.000001] 0000000000001000-000000000009ffff (1)
>> [  +0.000002] 000000007f96d000-000000007f97efff (3)
>> [  +0.000002] 0000000000800000-0000000000807fff (4)
>> [  +0.000001] 000000000080b000-000000000080bfff (4)
>> [  +0.000002] 0000000000810000-00000000008fffff (4)
>> [  +0.000001] 000000007f97f000-000000007f9fefff (4)
>> [  +0.000001] 000000007ff00000-000000007fffffff (4)
>> [  +0.000002] 0000000000000000-0000000000000fff (2)
> 
> On which arch are you seeing this? There should be one line above these
> range printing to tell what they are, like:
> 
> E820 memmap:

Ah this is there too. It's a lot of output, so I took it out of context, 
apparently.

> 0000000000000000-000000000009a3ff (1)
> 000000000009a400-000000000009ffff (2)
> 00000000000e0000-00000000000fffff (2)
> 0000000000100000-000000006ff83fff (1)
> 000000006ff84000-000000007ac50fff (2)

It should all be prefixed like kdump: or kexec: in any way.

>> without actually knowing what that is.
>>
>> There should be nothing logged if that is not asked for and especially if
>> kexec load went fine, right?
> 
> Right. Before this patch, those pr_debug() were already there. You need
> enable them to print out like add '#define DEBUG' in *.c file, or enable
> the dynamic debugging of the file or function.

I think it's perfectly fine for DEBUG builds to print this out. And many 
(all major?) distros use dyndbg, so it used to print nothing by default.

> With this patch applied,
> you only need specify '-d' when you execute kexec command with
> kexec_file load interface, like:
> 
> kexec -s -l -d /boot/vmlinuz-xxxx.img --initrd xxx.img --reuse-cmdline

Perhaps our (SUSE) tooling passes -d? But I am seeing this every time I 
boot.

No, it does not seem so:
load.sh[915]: Starting kdump kernel load; kexec cmdline: /sbin/kexec -p 
/var/lib/kdump/kernel --append=" loglevel=7 console=tty0 console=ttyS0 
video=1920x1080,1024x768,800x600 oops=panic 
lsm=lockdown,capability,integrity,selinux sysrq=yes reset_devices 
acpi_no_memhotplug cgroup_disable=memory nokaslr numa=off irqpoll 
nr_cpus=1 root=kdump rootflags=bind rd.udev.children-max=8 
disable_cpu_apicid=0   panic=1" --initrd=/var/lib/kdump/initrd  -a

> For kexec_file load, it is not logging if not specifying '-d', unless
> you take way to make pr_debug() work in that file.

So is -d detection malfunctioning under some circumstances?

>> Can this be redesigned, please?
> 
> Sure, after making clear what's going on with this, I will try.
> 
>>
>> Actually what was wrong on the pr_debug()s? Can you simply turn them on from
>> the kernel when -d is passed to kexec instead of all this?
> 
> Joe suggested this during v1 reviewing:
> https://lore.kernel.org/all/1e7863ec4e4ab10b84fd0e64f30f8464d2e484a3.camel@perches.com/T/#u
> 
>>
>> ...
>>> --- a/kernel/kexec_core.c
>>> +++ b/kernel/kexec_core.c
>>> @@ -52,6 +52,8 @@ atomic_t __kexec_lock = ATOMIC_INIT(0);
>>>    /* Flag to indicate we are going to kexec a new kernel */
>>>    bool kexec_in_progress = false;
>>> +bool kexec_file_dbg_print;
>>
>> Ugh, and a global flag for this?
> 
> Yeah, kexec_file_dbg_print records if '-d' is specified when 'kexec'
> command executed. Anything wrong with the global flag?

Global variables are frowned upon. To cite coding style: unless you 
**really** need them. Here, it looks like you do not.

thanks,
-- 
js
suse labs

