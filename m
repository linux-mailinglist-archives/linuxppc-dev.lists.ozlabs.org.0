Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8CB751CCE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 11:09:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XqOYj8vl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QpAk9dtG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1phM0gcHz3c51
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 19:09:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XqOYj8vl;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QpAk9dtG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1pgP4jFfz3bts
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 19:08:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689239308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sxdu/stClx226UmcIVBi+jl7HR8O+7PiCl/kTpcKiVU=;
	b=XqOYj8vl/QAJm+Cg8wDXrylnWSs6CxH1HZpQ2CH0MCNveZEaolGJLmMrdW05A9BjfzeJqC
	9s6H17myPWLC31w8J7OtWPxyRpOGdMCOh8+SmWGox7ivuggeAkfWv7e6OqsOnG58Qr8ZSA
	uFq9NaXVDFX1BbKzAv1xBYoAdw5FG50=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689239309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sxdu/stClx226UmcIVBi+jl7HR8O+7PiCl/kTpcKiVU=;
	b=QpAk9dtGHbxGZvRqq23A/EH70Ep0hLMeZn2fAQgnsJZ+8QlDRaes4vh6CV633ZgecbJtJa
	RciyRJKiXvempU4AusI1vTpOoZyiXegy6QdE5llRcTUY80kYGOt4uNyZ8axOJGurgT5s5l
	+czWMZ0Q4ccHU1wCeZzBIQB+TuyZCZE=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-rYdmD75zPuaV8SE0_kktQA-1; Thu, 13 Jul 2023 05:08:26 -0400
X-MC-Unique: rYdmD75zPuaV8SE0_kktQA-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2b70c46f121so4449491fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 02:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689239305; x=1691831305;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sxdu/stClx226UmcIVBi+jl7HR8O+7PiCl/kTpcKiVU=;
        b=XVYyFLedQ3DJJbAXyFWBh7OkSubDPQs6bW1w84llrE751S6TqSOVn79BMZxtajBgAR
         tS23Ixb3xzElmauFCmP+gqAtp2Cnp5RF7434jIh6eSx/VuQsE8jf8kBKm7hVvfyoLYHy
         stWPjFyS4uRBonupRam+kgTg3I1Z5/ioJ6raMdubAtUqJQCgcGV8j7ZaysiVtFxNB/i7
         deoeABr0P5VtQ/j5vNYAq083grv3v7CX/EPITztq41W37uxKodu8JEJLTiZxoveiF49c
         02cqcY3ILqJzVo8srRJYkzvgNHFi0g0vzaKshCYQjl1SmrMK/3ccK1iKCHNvwzpeSrLz
         dDRA==
X-Gm-Message-State: ABy/qLb5dcgp16r5T3n3R3bgWWT0gl1yIhqEKpl7F2mXxAv5GH3CfSFh
	1KAyckGxSxeZ9aFfO5IeShZlHP0jgmqS9G4r3QeK7yZqTMF+Vditm/sJt26Q43v7m2/OnPloTkX
	zRWAnww2RxOJ4D9vyP+Lzz74Y3Q==
X-Received: by 2002:a2e:9695:0:b0:2b7:1c0f:f20f with SMTP id q21-20020a2e9695000000b002b71c0ff20fmr790220lji.7.1689239304881;
        Thu, 13 Jul 2023 02:08:24 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFGMi1mJY7wH5j8EOil7zMuc3d0wZzihxSUm2Gw2/vrKM2KT50pGGqwUPyfOFSnHmKH1vwpbw==
X-Received: by 2002:a2e:9695:0:b0:2b7:1c0f:f20f with SMTP id q21-20020a2e9695000000b002b71c0ff20fmr790195lji.7.1689239304346;
        Thu, 13 Jul 2023 02:08:24 -0700 (PDT)
Received: from ?IPV6:2003:cb:c717:6100:2da7:427e:49a5:e07? (p200300cbc71761002da7427e49a50e07.dip0.t-ipconnect.de. [2003:cb:c717:6100:2da7:427e:49a5:e07])
        by smtp.gmail.com with ESMTPSA id q13-20020a05600000cd00b00314367cf43asm7328487wrx.106.2023.07.13.02.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 02:08:23 -0700 (PDT)
Message-ID: <5801c81e-cae4-2ba1-ec93-562fd8255423@redhat.com>
Date: Thu, 13 Jul 2023 11:08:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: John Hubbard <jhubbard@nvidia.com>,
 Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-4-aneesh.kumar@linux.ibm.com>
 <6f6764f6-4b5a-dfa8-c409-ba4f2828891f@redhat.com>
 <176cee16-f926-ab3b-92fe-98bebf79d43d@linux.ibm.com>
 <641a4276-cfb9-bd1b-36a8-cb4bcae408f6@redhat.com>
 <89d500a4-b639-bf00-ea65-6f2690c74867@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 3/7] mm/hotplug: Allow architecture to override memmap
 on memory support check
In-Reply-To: <89d500a4-b639-bf00-ea65-6f2690c74867@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12.07.23 22:07, John Hubbard wrote:
> On 7/11/23 09:09, David Hildenbrand wrote:
> ...
>>>> Can we make that a __weak function instead?
>>>
>>> We can. It is confusing because we do have these two patterns within the kernel where we use
>>>
>>> #ifndef x
>>> #endif
>>>
>>> vs
>>>
>>> __weak x
>>>
>>> What is the recommended way to override ? I have mostly been using #ifndef for most of the arch overrides till now.
>>>
>>
>> I think when placing the implementation in a C file, it's __weak. But don't ask me :)
>>
>> We do this already for arch_get_mappable_range() in mm/memory_hotplug.c and IMHO it looks quite nice.
>>
> 
> It does look nice. I always forget which parts are supposed to be
> __weak, so I went to check Documentation/ , and it was quite
> entertaining. There are only two search hits: one trivial reference in
> Documentation/conf.py, and the other in checkpatch.rst, which says:
> 
>     **WEAK_DECLARATION**
>       Using weak declarations like __attribute__((weak)) or __weak
>       can have unintended link defects.  Avoid using them.
> 
> ...which seems deeply out of touch with how arch layers work these days,
> doesn't it? (This is not rhetorical; I'm asking in order to get an
> opinion or two on the topic.)

Did some digging:

commit 65d9a9a60fd71be964effb2e94747a6acb6e7015
Author: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Date:   Fri Jul 1 13:04:04 2022 +0530

     kexec_file: drop weak attribute from functions
     
     As requested
     (http://lkml.kernel.org/r/87ee0q7b92.fsf@email.froward.int.ebiederm.org),
     this series converts weak functions in kexec to use the #ifdef approach.
     
     Quoting the 3e35142ef99fe ("kexec_file: drop weak attribute from
     arch_kexec_apply_relocations[_add]") changelog:
     
     : Since commit d1bcae833b32f1 ("ELF: Don't generate unused section symbols")
     : [1], binutils (v2.36+) started dropping section symbols that it thought
     : were unused.  This isn't an issue in general, but with kexec_file.c, gcc
     : is placing kexec_arch_apply_relocations[_add] into a separate
     : .text.unlikely section and the section symbol ".text.unlikely" is being
     : dropped.  Due to this, recordmcount is unable to find a non-weak symbol in
     : .text.unlikely to generate a relocation record against.
     
     This patch (of 2);
     
     Drop __weak attribute from functions in kexec_file.c:
     - arch_kexec_kernel_image_probe()
     - arch_kimage_file_post_load_cleanup()
     - arch_kexec_kernel_image_load()
     - arch_kexec_locate_mem_hole()
     - arch_kexec_kernel_verify_sig()
     
     arch_kexec_kernel_image_load() calls into kexec_image_load_default(), so
     drop the static attribute for the latter.
     
     arch_kexec_kernel_verify_sig() is not overridden by any architecture, so
     drop the __weak attribute.
     
     Link: https://lkml.kernel.org/r/cover.1656659357.git.naveen.n.rao@linux.vnet.ibm.com
     Link: https://lkml.kernel.org/r/2cd7ca1fe4d6bb6ca38e3283c717878388ed6788.1656659357.git.naveen.n.rao@linux.vnet.ibm.com
     Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
     Suggested-by: Eric Biederman <ebiederm@xmission.com>
     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
     Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>


So, in general, it's use seems to be fine (unless some tool actually bails out).

https://lore.kernel.org/all/87ee0q7b92.fsf@email.froward.int.ebiederm.org/T/#u

Also mentions that__weak and non __weak variants ending up in the vmlinux. Did not
check if that's actually (still) the case.

-- 
Cheers,

David / dhildenb

