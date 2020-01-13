Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6E01390EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 13:17:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xCJC4Gs4zDqMv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 23:16:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=QI1q10T8; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xCFZ1QVfzDqLB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 23:14:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578917677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=quQDksyPyFcIuCqVPGqUPwx5B1xPgTdkurY5s4DtTQ8=;
 b=QI1q10T8ZPvkGjSYuoeZg0U2DRDkJWSZKfO7H3qMpe4dF9mkw6RYyBLleRxgVg9TZgGiea
 nSQPwyiVSZ6vSxhHOJsBPZ5O3GMKiHPgZc1Fy9CgPewUXBDQOh1IwQBu2FEIX6mvU1qjUi
 GbJ0ZeCaXxbYMyhdtMQsXnIxad7AboM=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-lHXDwHieM6aw2rYsQ7mK2Q-1; Mon, 13 Jan 2020 07:14:36 -0500
Received: by mail-pj1-f70.google.com with SMTP id c31so6628018pje.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 04:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=quQDksyPyFcIuCqVPGqUPwx5B1xPgTdkurY5s4DtTQ8=;
 b=YG3J4bYksg33UQczkZ4u8sgpsiEXEAeWAvOXTfgzg+eZoEfIdxFEeQNSy6LsOLiuf3
 93oNqdd3ewlaseVGmikv7arTKw6yK5EP/e+2cOHcRbNT6n0GeeycH/cXRKwOHuiqfQx2
 kS756eGtOpGxePswntSPfBeMl0wioQ1bhx07uKAz9wEE4UvYLeDV5N9ue7+XX3XZFuWF
 PZi1DPaAjhCz64IvCD1iNWOQsiH1v6TnX+aB2Ubinf/x2grpoSRaVyXDAc/AmAC2aWiM
 zUGFJBRTasA2gDBwSnl+syDWxiltril45J6NvcsynE7iBt02J5Ff6trlsA+FlWlDxbQM
 T/Qw==
X-Gm-Message-State: APjAAAVN4beC+NGSV7opyn6diVsdd4EuWx2hi+YbcYRZlkpibelUJBpW
 ktLkIkHbuJtXAYO6SvcPJ6rrdA7oo5aUJYXkw9PS/6vpG0T59sv5lb5y0VT9tC5vXoEpjDAPJ/G
 EEOj5oDP4hMKnGkujS9sbcGrQww==
X-Received: by 2002:a17:90a:fa88:: with SMTP id
 cu8mr20913878pjb.141.1578917675096; 
 Mon, 13 Jan 2020 04:14:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqxALQgnDcQJ9NkcfjZ+inUPcVHYoZsvLYAu6/sEEIOSdSjVJI/LaGA1hgTl2PAA71Zt8AwepA==
X-Received: by 2002:a17:90a:fa88:: with SMTP id
 cu8mr20913845pjb.141.1578917674799; 
 Mon, 13 Jan 2020 04:14:34 -0800 (PST)
Received: from localhost.localdomain ([122.177.255.46])
 by smtp.gmail.com with ESMTPSA id j20sm13806331pfe.168.2020.01.13.04.14.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jan 2020 04:14:34 -0800 (PST)
Subject: Re: [RESEND PATCH v5 2/5] arm64/crash_core: Export TCR_EL1.T1SZ in
 vmcoreinfo
To: Dave Anderson <anderson@redhat.com>, James Morse <james.morse@arm.com>
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
 <1575057559-25496-3-git-send-email-bhsharma@redhat.com>
 <63d6e63c-7218-d2dd-8767-4464be83603f@arm.com>
 <af0fd2b0-99db-9d58-bc8d-0dd9d640b1eb@redhat.com>
 <f791e777-781c-86ce-7619-1de3fe3e7b90@arm.com>
 <351975548.1986001.1578682810951.JavaMail.zimbra@redhat.com>
From: Bhupesh Sharma <bhsharma@redhat.com>
Message-ID: <04287d60-e99e-631b-c134-d6dc39e6a193@redhat.com>
Date: Mon, 13 Jan 2020 17:44:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <351975548.1986001.1578682810951.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-MC-Unique: lHXDwHieM6aw2rYsQ7mK2Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-doc@vger.kernel.org,
 Will Deacon <will@kernel.org>, x86@kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 bhupesh linux <bhupesh.linux@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Steve Capper <steve.capper@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi James,

On 01/11/2020 12:30 AM, Dave Anderson wrote:
> 
> ----- Original Message -----
>> Hi Bhupesh,
>>
>> On 25/12/2019 19:01, Bhupesh Sharma wrote:
>>> On 12/12/2019 04:02 PM, James Morse wrote:
>>>> On 29/11/2019 19:59, Bhupesh Sharma wrote:
>>>>> vabits_actual variable on arm64 indicates the actual VA space size,
>>>>> and allows a single binary to support both 48-bit and 52-bit VA
>>>>> spaces.
>>>>>
>>>>> If the ARMv8.2-LVA optional feature is present, and we are running
>>>>> with a 64KB page size; then it is possible to use 52-bits of address
>>>>> space for both userspace and kernel addresses. However, any kernel
>>>>> binary that supports 52-bit must also be able to fall back to 48-bit
>>>>> at early boot time if the hardware feature is not present.
>>>>>
>>>>> Since TCR_EL1.T1SZ indicates the size offset of the memory region
>>>>> addressed by TTBR1_EL1 (and hence can be used for determining the
>>>>> vabits_actual value) it makes more sense to export the same in
>>>>> vmcoreinfo rather than vabits_actual variable, as the name of the
>>>>> variable can change in future kernel versions, but the architectural
>>>>> constructs like TCR_EL1.T1SZ can be used better to indicate intended
>>>>> specific fields to user-space.
>>>>>
>>>>> User-space utilities like makedumpfile and crash-utility, need to
>>>>> read/write this value from/to vmcoreinfo
>>>>
>>>> (write?)
>>>
>>> Yes, also write so that the vmcoreinfo from an (crashing) arm64 system can
>>> be used for
>>> analysis of the root-cause of panic/crash on say an x86_64 host using
>>> utilities like
>>> crash-utility/gdb.
>>
>> I read this as as "User-space [...] needs to write to vmcoreinfo".

That's correct. But for writing to vmcore dump in the kdump kernel, we 
need to read the symbols from the vmcoreinfo in the primary kernel.

>>>>> for determining if a virtual address lies in the linear map range.
>>>>
>>>> I think this is a fragile example. The debugger shouldn't need to know
>>>> this.
>>>
>>> Well that the current user-space utility design, so I am not sure we can
>>> tweak that too much.
>>>
>>>>> The user-space computation for determining whether an address lies in
>>>>> the linear map range is the same as we have in kernel-space:
>>>>>
>>>>>     #define __is_lm_address(addr)    (!(((u64)addr) & BIT(vabits_actual -
>>>>>     1)))
>>>>
>>>> This was changed with 14c127c957c1 ("arm64: mm: Flip kernel VA space"). If
>>>> user-space
>>>> tools rely on 'knowing' the kernel memory layout, they must have to
>>>> constantly be fixed
>>>> and updated. This is a poor argument for adding this to something that
>>>> ends up as ABI.
>>>
>>> See above. The user-space has to rely on some ABI/guaranteed
>>> hardware-symbols which can be
>>> used for 'determining' the kernel memory layout.
>>
>> I disagree. Everything and anything in the kernel will change. The ABI rules apply to
>> stuff exposed via syscalls and kernel filesystems. It does not apply to kernel internals,
>> like the memory layout we used yesterday. 14c127c957c1 is a case in point.
>>
>> A debugger trying to rely on this sort of thing would have to play catchup whenever it
>> changes.
> 
> Exactly.  That's the whole point.
> 
> The crash utility and makedumpfile are not in the same league as other user-space tools.
> They have always had to "play catchup" precisely because they depend upon kernel internals,
> which constantly change.

I agree with you and DaveA here. Software user-space debuggers are 
dependent on kernel internals (which can change from time-to-time) and 
will have to play catch-up (which has been the case since the very start).

Unfortunately we don't have any clear ABI for software debugging tools - 
may be something to look for in future.

A case in point is gdb/kgdb, which still needs to run with KASLR 
turned-off (nokaslr) for debugging, as it confuses gdb which resolve 
kernel symbol address from symbol table of vmlinux. But we can 
work-around the same in makedumpfile/crash by reading the 'kaslr_offset' 
value. And I have several users telling me now they cannot use gdb on 
KASLR enabled kernel to debug panics, but can makedumpfile + crash 
combination to achieve the same.

So, we should be looking to fix these utilities which are broken since 
the 52-bit changes for arm64. Accordingly, I will try to send the v6
soon while incorporating the comments posted on the v5.

Thanks,
Bhupesh




