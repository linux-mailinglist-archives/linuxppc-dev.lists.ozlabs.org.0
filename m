Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 268291BECE4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 02:13:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CG763rzfzDr9Q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 10:13:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=broadcom.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=scott.branden@broadcom.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=CdmBNX7N; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CDbg0WBnzDr4r
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 09:04:10 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id x15so1872861pfa.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=pTsAs2CDlbVr46p0BUoXzORZ7PJqz3PIVNdyQM5hvA4=;
 b=CdmBNX7N3jvCxhnclyKjAisrCfjyJw95MD3shTrp1r6CmwGIN7H1/Pe2hnfly4p4PO
 0fzH1jsEO3VwWjfzTAlMTeXo1sP8SzpQEvZpEEAk7t/sUBLMMCH1yx3D/tl4Xy4G5z72
 AC7iaQy3XJAbuU0T+mYFO3vRkqx4GL0oQiEQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pTsAs2CDlbVr46p0BUoXzORZ7PJqz3PIVNdyQM5hvA4=;
 b=GLUyS8OGsgWNjh8PmgVaED+Tj5AVSM1YOF+aiE2kHRwTT044TmhgSGiptnkMEFrKE3
 3yH/MMvRo/+YMguw+Jd90dC526v9sji5gtTlL4ygzERkREzf65JUV+XO+bTf+uYlpYxz
 YHtYzAsFeQUbpEOVzJU2BDZ3t6OTYe4OHKDjLygX3ufBOorA5MAfYC7RM0jh+R1fpso6
 4ZLRI3Rn2QHQxn9fOtrMaA3kLUBMO76Fw9qD2hbT9pLNy/d65CkaciRItVmoM58G9GI/
 Fpw10ylW4BfB+VJLHlpKecDMgPbo79QGWM9FY5l61dhgf7xHka3U2/xjT6vkN3D1cmVH
 XRzg==
X-Gm-Message-State: AGi0PuaLZuDjWrRnQZ1lkkXKslEfBMI3imNQ+FnFRe9JkEUtpn3IaXnw
 ZgxDTLfv2VH9lgLP5yo2Or2WlA==
X-Google-Smtp-Source: APiQypKUxErsH+JxyFE5+lXNYp86SmB717RFqVubaZnyDLfFMUyyoUO8X3/GyvAYk7iDD2eJBJY2tQ==
X-Received: by 2002:aa7:8042:: with SMTP id y2mr504718pfm.94.1588201446938;
 Wed, 29 Apr 2020 16:04:06 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
 by smtp.gmail.com with ESMTPSA id l37sm255572pje.12.2020.04.29.16.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2020 16:04:06 -0700 (PDT)
Subject: Re: Re: [RESEND PATCH v5 2/5] arm64/crash_core: Export TCR_EL1.T1SZ
 in vmcoreinfo
To: Bhupesh Sharma <bhsharma@redhat.com>, Amit Kachhap <amit.kachhap@arm.com>
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
 <1575057559-25496-3-git-send-email-bhsharma@redhat.com>
 <63d6e63c-7218-d2dd-8767-4464be83603f@arm.com>
 <af0fd2b0-99db-9d58-bc8d-0dd9d640b1eb@redhat.com>
 <f791e777-781c-86ce-7619-1de3fe3e7b90@arm.com>
 <351975548.1986001.1578682810951.JavaMail.zimbra@redhat.com>
 <04287d60-e99e-631b-c134-d6dc39e6a193@redhat.com>
 <974f3601-25f8-f4e6-43a8-ff4275e9c174@arm.com>
 <CACi5LpOK6Q3ud3M3zakexLJNOtHy9TODHyYSHVwE3JHVakKzqA@mail.gmail.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <d401b003-af3e-c525-ba00-0de48486b7a0@broadcom.com>
Date: Wed, 29 Apr 2020 16:04:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CACi5LpOK6Q3ud3M3zakexLJNOtHy9TODHyYSHVwE3JHVakKzqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Thu, 30 Apr 2020 10:11:42 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ray Jui <ray.jui@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 James Morse <james.morse@arm.com>, Dave Anderson <anderson@redhat.com>,
 bhupesh linux <bhupesh.linux@gmail.com>, Will Deacon <will@kernel.org>,
 kexec mailing list <kexec@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Steve Capper <steve.capper@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Bhupesh,

On 2020-02-23 10:25 p.m., Bhupesh Sharma wrote:
> Hi Amit,
>
> On Fri, Feb 21, 2020 at 2:36 PM Amit Kachhap <amit.kachhap@arm.com> wrote:
>> Hi Bhupesh,
>>
>> On 1/13/20 5:44 PM, Bhupesh Sharma wrote:
>>> Hi James,
>>>
>>> On 01/11/2020 12:30 AM, Dave Anderson wrote:
>>>> ----- Original Message -----
>>>>> Hi Bhupesh,
>>>>>
>>>>> On 25/12/2019 19:01, Bhupesh Sharma wrote:
>>>>>> On 12/12/2019 04:02 PM, James Morse wrote:
>>>>>>> On 29/11/2019 19:59, Bhupesh Sharma wrote:
>>>>>>>> vabits_actual variable on arm64 indicates the actual VA space size,
>>>>>>>> and allows a single binary to support both 48-bit and 52-bit VA
>>>>>>>> spaces.
>>>>>>>>
>>>>>>>> If the ARMv8.2-LVA optional feature is present, and we are running
>>>>>>>> with a 64KB page size; then it is possible to use 52-bits of address
>>>>>>>> space for both userspace and kernel addresses. However, any kernel
>>>>>>>> binary that supports 52-bit must also be able to fall back to 48-bit
>>>>>>>> at early boot time if the hardware feature is not present.
>>>>>>>>
>>>>>>>> Since TCR_EL1.T1SZ indicates the size offset of the memory region
>>>>>>>> addressed by TTBR1_EL1 (and hence can be used for determining the
>>>>>>>> vabits_actual value) it makes more sense to export the same in
>>>>>>>> vmcoreinfo rather than vabits_actual variable, as the name of the
>>>>>>>> variable can change in future kernel versions, but the architectural
>>>>>>>> constructs like TCR_EL1.T1SZ can be used better to indicate intended
>>>>>>>> specific fields to user-space.
>>>>>>>>
>>>>>>>> User-space utilities like makedumpfile and crash-utility, need to
>>>>>>>> read/write this value from/to vmcoreinfo
>>>>>>> (write?)
>>>>>> Yes, also write so that the vmcoreinfo from an (crashing) arm64
>>>>>> system can
>>>>>> be used for
>>>>>> analysis of the root-cause of panic/crash on say an x86_64 host using
>>>>>> utilities like
>>>>>> crash-utility/gdb.
>>>>> I read this as as "User-space [...] needs to write to vmcoreinfo".
>>> That's correct. But for writing to vmcore dump in the kdump kernel, we
>>> need to read the symbols from the vmcoreinfo in the primary kernel.
>>>
>>>>>>>> for determining if a virtual address lies in the linear map range.
>>>>>>> I think this is a fragile example. The debugger shouldn't need to know
>>>>>>> this.
>>>>>> Well that the current user-space utility design, so I am not sure we
>>>>>> can
>>>>>> tweak that too much.
>>>>>>
>>>>>>>> The user-space computation for determining whether an address lies in
>>>>>>>> the linear map range is the same as we have in kernel-space:
>>>>>>>>
>>>>>>>>      #define __is_lm_address(addr)    (!(((u64)addr) &
>>>>>>>> BIT(vabits_actual -
>>>>>>>>      1)))
>>>>>>> This was changed with 14c127c957c1 ("arm64: mm: Flip kernel VA
>>>>>>> space"). If
>>>>>>> user-space
>>>>>>> tools rely on 'knowing' the kernel memory layout, they must have to
>>>>>>> constantly be fixed
>>>>>>> and updated. This is a poor argument for adding this to something that
>>>>>>> ends up as ABI.
>>>>>> See above. The user-space has to rely on some ABI/guaranteed
>>>>>> hardware-symbols which can be
>>>>>> used for 'determining' the kernel memory layout.
>>>>> I disagree. Everything and anything in the kernel will change. The
>>>>> ABI rules apply to
>>>>> stuff exposed via syscalls and kernel filesystems. It does not apply
>>>>> to kernel internals,
>>>>> like the memory layout we used yesterday. 14c127c957c1 is a case in
>>>>> point.
>>>>>
>>>>> A debugger trying to rely on this sort of thing would have to play
>>>>> catchup whenever it
>>>>> changes.
>>>> Exactly.  That's the whole point.
>>>>
>>>> The crash utility and makedumpfile are not in the same league as other
>>>> user-space tools.
>>>> They have always had to "play catchup" precisely because they depend
>>>> upon kernel internals,
>>>> which constantly change.
>>> I agree with you and DaveA here. Software user-space debuggers are
>>> dependent on kernel internals (which can change from time-to-time) and
>>> will have to play catch-up (which has been the case since the very start).
>>>
>>> Unfortunately we don't have any clear ABI for software debugging tools -
>>> may be something to look for in future.
>>>
>>> A case in point is gdb/kgdb, which still needs to run with KASLR
>>> turned-off (nokaslr) for debugging, as it confuses gdb which resolve
>>> kernel symbol address from symbol table of vmlinux. But we can
>>> work-around the same in makedumpfile/crash by reading the 'kaslr_offset'
>>> value. And I have several users telling me now they cannot use gdb on
>>> KASLR enabled kernel to debug panics, but can makedumpfile + crash
>>> combination to achieve the same.
>>>
>>> So, we should be looking to fix these utilities which are broken since
>>> the 52-bit changes for arm64. Accordingly, I will try to send the v6
>>> soon while incorporating the comments posted on the v5.
>> Any update on the next v6 version. Since this patch series is fixing the
>> current broken kdump so need this series to add some more fields in
>> vmcoreinfo for Pointer Authentication work.
> Sorry for the delay. I was caught up in some other urgent arm64
> user-space issues.
> I am preparing the v6 now and hopefully will be able to post it out
> for review later today.

Did v6 get sent out?

>
> Thanks,
> Bhupesh
>
>
Regards,
Scott
