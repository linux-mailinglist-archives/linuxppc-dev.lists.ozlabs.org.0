Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14588474321
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 14:01:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCz5X6XHKz3c95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 00:01:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JPsvy3hK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dhsgkcsy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=JPsvy3hK; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dhsgkcsy; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCz4l1hphz2yJF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 00:00:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639486816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kg87+iepEuXBJrlDYsDuqAwGIPCcapC3qDh2z9ZFHZI=;
 b=JPsvy3hKu6sfusd0PMIslq07DlYsgS0NFNOXWnEi1hEqITcvw6vkh7ve4HeUBXgmW6bmRE
 pOEIEkwG7+nPb0DOjEIVad+t1LGfca55k20yXVILYWy2R8Yj7UjkCvqVsDQGlHk91mCcPO
 VY/ilqM+Z3x6maXBkOLbqCneZsXXMd0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639486817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kg87+iepEuXBJrlDYsDuqAwGIPCcapC3qDh2z9ZFHZI=;
 b=DhsgkcsyafjkWBW7tP8XxAkG5HhvhFEfBx8DZTMU1WZMn0EHNxX01OwWBvJEbdMz3XzFJW
 ky72IscYpX8Zr2sidjhVesxyOjdjRbdAv7OrVVgE1yOCK4nQUPmG0F5j6WvpIXgj4/beXR
 3im+IKfj7CsuOH//Fy5X5J+5CW3Pw2A=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-v1_jEWk3MYWpbOBZw0M5oA-1; Tue, 14 Dec 2021 08:00:13 -0500
X-MC-Unique: v1_jEWk3MYWpbOBZw0M5oA-1
Received: by mail-qv1-f71.google.com with SMTP id
 h14-20020a0562140dae00b003ae664126e9so27120213qvh.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 05:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kg87+iepEuXBJrlDYsDuqAwGIPCcapC3qDh2z9ZFHZI=;
 b=A59g2sYY35XEz1OceMRIm1KR4H6s10yz3sPpmmlgUs2wE1PRmIbt+ohj7315yNchOt
 SqsEsj6ekJ5+Q6KUsDjZSqJxEFnvcxgpHdUy860XRZ3Y5U2aAGaSIdyV84kN3UG251q2
 stvJhsLRD6wdn3ghCDML+jgRZOCbr2A9yv9X06tq1ABfum7Latr0rhZ9GkSe5+7BPj3o
 Ibe0RsYeT4TPU79K8UZFZXGXe+AiqgyxXtMSHFq3gQCUUanrYIjERcOjtuN2q4Lu9m0I
 7q2QwOrpLQ5VeW+pd7CCkOAVs+CagQP7ASkslFKItVzbnF9wiKT8Tb8AzaWhuodOeKYm
 p/fA==
X-Gm-Message-State: AOAM5328TapHPU/m9eeiQsLER1AM3zw5wwUlFtboOZYkN7b3+vWsvMd/
 kgo3q0onjIiPEniRk6PddrEo8msPrfWklOD60hG0l9oXdyiS+HOgTUOd4fEHzU1Kcq5cfkLnccE
 mDdfcpBGCIQHTT23Ffbq4blqvfg==
X-Received: by 2002:a05:6214:1c06:: with SMTP id
 u6mr5231082qvc.35.1639486812476; 
 Tue, 14 Dec 2021 05:00:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8MCP8C/P+JBe8G8JTUQ+MDM9AFEehMJUWgUeY0ZzVbaHyRwMLVGNqMJBHwYXERIkPClQxkQ==
X-Received: by 2002:a05:6214:1c06:: with SMTP id
 u6mr5231029qvc.35.1639486812037; 
 Tue, 14 Dec 2021 05:00:12 -0800 (PST)
Received: from [192.168.1.9] (pool-68-163-101-245.bstnma.fios.verizon.net.
 [68.163.101.245])
 by smtp.gmail.com with ESMTPSA id f12sm11193854qtj.93.2021.12.14.05.00.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 05:00:11 -0800 (PST)
Subject: Re: ppc64le STRICT_MODULE_RWX and livepatch apply_relocate_add()
 crashes
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Russell Currey <ruscur@russell.cc>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <YX9UUBeudSUuJs01@redhat.com>
 <7ee0c84650617e6307b29674dd0a12c7258417cf.camel@russell.cc>
 <f8a96ac1-fda3-92da-cf27-0992a43a2f3f@redhat.com>
 <bed88ff4-e5d3-4b78-4f28-29fc635c2f97@csgroup.eu>
 <919a79b8-feff-b0a4-b96a-73f376b7f6dc@redhat.com>
 <61a5f29c-5123-5f0f-11aa-91cb0ac95a69@csgroup.eu>
 <8a68ffef-7e0d-b1ff-1102-2e6f2c999455@redhat.com>
 <27cee0a4-aa34-7a52-f98c-ab8c13aafb12@csgroup.eu>
From: Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <af1eb0c3-4beb-bbc4-39da-da42f104f6c7@redhat.com>
Date: Tue, 14 Dec 2021 08:00:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <27cee0a4-aa34-7a52-f98c-ab8c13aafb12@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=joe.lawrence@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 Jessica Yu <jeyu@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/14/21 7:44 AM, Christophe Leroy wrote:
> 
> 
> Le 13/12/2021 à 18:26, Joe Lawrence a écrit :
>> On 12/13/21 11:36 AM, Christophe Leroy wrote:
>>>
>>>
>>> Le 13/12/2021 à 15:47, Joe Lawrence a écrit :
>>>> On 12/13/21 2:42 AM, Christophe Leroy wrote:
>>>>>
>>>>> Hello Joe,
>>>>>
>>>>> I'm implementing LIVEPATCH on PPC32 and I wanted to test with
>>>>> STRICT_MODULE_RWX enabled so I took your branch as suggested, but I'm
>>>>> getting the following errors on build. What shall I do ?
>>>>>
>>>>>      CALL    scripts/checksyscalls.sh
>>>>>      CALL    scripts/atomic/check-atomics.sh
>>>>>      CHK     include/generated/compile.h
>>>>>      KLP     lib/livepatch/test_klp_convert1.ko
>>>>> klp-convert: section .rela.klp.module_relocs.test_klp_convert_mod length
>>>>> beyond nr_entries
>>>>>
>>>>> klp-convert: Unable to load user-provided sympos
>>>>> make[2]: *** [scripts/Makefile.modfinal:79:
>>>>> lib/livepatch/test_klp_convert1.ko] Error 255
>>>>>      KLP     lib/livepatch/test_klp_convert2.ko
>>>>> klp-convert: section .rela.klp.module_relocs.test_klp_convert_mod length
>>>>> beyond nr_entries
>>>>>
>>>>> klp-convert: Unable to load user-provided sympos
>>>>> make[2]: *** [scripts/Makefile.modfinal:79:
>>>>> lib/livepatch/test_klp_convert2.ko] Error 255
>>>>>      KLP     lib/livepatch/test_klp_convert_sections.ko
>>>>> klp-convert: section .rela.klp.module_relocs.test_klp_convert_mod length
>>>>> beyond nr_entries
>>>>>
>>>>> klp-convert: Unable to load user-provided sympos
>>>>> make[2]: *** [scripts/Makefile.modfinal:79:
>>>>> lib/livepatch/test_klp_convert_sections.ko] Error 255
>>>>> make[2]: Target '__modfinal' not remade because of errors.
>>>>> make[1]: *** [scripts/Makefile.modpost:145: __modpost] Error 2
>>>>> make: *** [Makefile:1770: modules] Error 2
>>>>>
>>>>
>>>> Hi Christophe,
>>>>
>>>> Interesting failure mode.  That's klp-convert complaining that it found
>>>> more relocations in a .klp.module_relocs.<objname> section than
>>>> expected, i.e. nr_entries = sec->size / sizeof(struct klp_module_reloc).
>>>>
>>>> A few possibilities: the ELF sec->size was incorrectly set/read by
>>>> build/libelf (I doubt that).  Or maybe the layout/size of struct
>>>> klp_module_reloc is not consistent between kernel and userspace (I'm
>>>> more suspicious of this).
>>>>
>>>> Can you post a copy of the build's symbols.klp and
>>>> lib/livepatch/test_klp_convert1.tmp.ko somewhere?  I should be able to
>>>> start debug with those files.
>>>>
>>>
>>> I sent you both files off list.
>>>
>>> It looks like klp-convert doesn't use the correct size. It finds a
>>> struct of size 12 hence 3 entries for a section of size 40.
>>>
>>> On PPC32 the struct has size 8 (void * is 4 and int is 4).
>>>
>>> But I'm cross-building from x86_64 where the struct is 8 + 4 = 12.
>>>
>>> Can it be the reason ?
>>>
>>
>> I'm pretty sure that is it.  I haven't had much runtime with klp-convert
>> and cross-building (I've only found one big/little endian bug with
>> x86_64->s390x) and was going to ask you how you were testing :)
>>
>> Do you know if there are other kernel build tools that deal with similar
>> situations?  This seems like a tricky job for the userspace build tool
>> to determine non-native target struct layout.
>>
>> In the meantime, hacking in:
>>
>>   struct klp_module_reloc {
>> -       void *sym;
>> +       uint32_t sym;
>>          unsigned int sympos;
>>   } __packed;
>>
>> gets me generating an output .ko file, but the readelf output doesn't
>> look right.
>>
>> I'll add this to the patchset TODO list, but may not get to it for a
>> while -- is there any chance the above hack works or could you test a
>> local non-cross build?
>>
> 
> No I have no way to do a non-cross build. My target is an embedded board 
> with slow CPU and little memory.
> 
> I tested with your hack, I get:
> 
> root@vgoip:~# insmod /lib/modules/test_klp_convert1.ko
> insmod: can't insert '/lib/modules/test_klp_convert1.ko': unknown symbol 
> in module, or unknown parameter
> root@vgoip:~# insmod /lib/modules/test_klp_livepatch.ko
> insmod: can't insert '/lib/modules/test_klp_livepatch.ko': unknown 
> symbol in module, or unknown parameter
> 
> 
> I agree with you readelf shows something went wrong with relocations.
> 

Thanks for trying that.  Can you point me to the cross-compiler suite
that you are using for build and readelf?  Kernel .config would be handy
too and I can try to reproduce locally for debugging.

Thanks,

-- 
Joe

