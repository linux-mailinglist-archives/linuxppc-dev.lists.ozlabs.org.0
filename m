Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3832064BF41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 23:20:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWtGf74XFz3cKq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 09:20:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=elu8lDCv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=elu8lDCv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=elu8lDCv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=elu8lDCv;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWtFf4N4jz2xVr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 09:19:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670969953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/CHoK2HpHhEEysAUZtzY/hl1zhUH9ZxpSfovvfrKLKw=;
	b=elu8lDCvrJKFi8gXMBnZq8q+8wnq2iyiys6YHCxG3VsSR3SIGUid+NOK6jA6qUlIcpHV8T
	E+wBGSlRx99dk3FeB61gTw9nTs43nMqfEufapLH0yJoNSC6+uz3h5yZbCIs7GVZui8hKtC
	+EoAgu5PMjiEszjo73f+EeWPD8i9Q6Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670969953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/CHoK2HpHhEEysAUZtzY/hl1zhUH9ZxpSfovvfrKLKw=;
	b=elu8lDCvrJKFi8gXMBnZq8q+8wnq2iyiys6YHCxG3VsSR3SIGUid+NOK6jA6qUlIcpHV8T
	E+wBGSlRx99dk3FeB61gTw9nTs43nMqfEufapLH0yJoNSC6+uz3h5yZbCIs7GVZui8hKtC
	+EoAgu5PMjiEszjo73f+EeWPD8i9Q6Q=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-597-O0MzEMT5OBS2RSWwvp9RHg-1; Tue, 13 Dec 2022 17:19:12 -0500
X-MC-Unique: O0MzEMT5OBS2RSWwvp9RHg-1
Received: by mail-qt1-f197.google.com with SMTP id g12-20020ac870cc000000b003a8112df2e9so947877qtp.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 14:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:from:references:cc:to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/CHoK2HpHhEEysAUZtzY/hl1zhUH9ZxpSfovvfrKLKw=;
        b=C9fOkCF41+CdNmLAwpiI14nDjm8feCZoDsG7bJH3QLHVpExuGmlzWm10582UpHE56u
         cGBJq9X7YvF4E2BJr5bWU673jU3hPR8k+aT8FyWH8VOzGXDgZ7B65sE0n5OZ5rY8tCEp
         Tbs3YwH5mRhbFwL4jE/uejEXTNGQHdewSx2H1OCIRq0AGonlPMEZOlqGg2SSxTSzkTKY
         GTJvGNp1lJr3tB/MuCtFH12Glv8uVO1jp4SYND+Y/pzBWVlW+94qW54NGVnhZfIaAJKk
         BjGwvFY1Fp9hPmaDvx88OS0+Km8joYbgKZ1sVkRdftxF4GFs8JNVNB5R3ZQi7tlpRqDm
         u4ZA==
X-Gm-Message-State: ANoB5pm99B05H98O2v9oOhSJaU6ZZjwG3gz/6qrxUm+UIufQzaXckbkE
	PgQfDEvkRCrChIm9Z2lWgLpAOvMaWaa+9lgxhXRDDLZdzOzacgaJ/xRI97iH1oZofJL8/s5MVxx
	tmzdnleeEDmT2gEH4HRE1CgNHfw==
X-Received: by 2002:ac8:775c:0:b0:3a8:1c25:57fa with SMTP id g28-20020ac8775c000000b003a81c2557famr5875061qtu.42.1670969951507;
        Tue, 13 Dec 2022 14:19:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6OhAgFQn7DTQvxgad+rjUjO0fppY7ZjavOoJKidh13WEzvYiqGgupHyqI/NwTf4duGAn323A==
X-Received: by 2002:ac8:775c:0:b0:3a8:1c25:57fa with SMTP id g28-20020ac8775c000000b003a81c2557famr5875024qtu.42.1670969951098;
        Tue, 13 Dec 2022 14:19:11 -0800 (PST)
Received: from [192.168.1.9] (pool-68-160-135-240.bstnma.fios.verizon.net. [68.160.135.240])
        by smtp.gmail.com with ESMTPSA id g11-20020ac8124b000000b003a57eb7f212sm616807qtj.10.2022.12.13.14.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 14:19:10 -0800 (PST)
To: Petr Mladek <pmladek@suse.com>, Song Liu <song@kernel.org>
References: <20220901171252.2148348-1-song@kernel.org>
 <Y3expGRt4cPoZgHL@alley>
 <CAPhsuW4qYpX7wzHn5J5Hn9cnOFSZwwQPCjTM_HPTt_zbBS03ww@mail.gmail.com>
 <Y5Me5dTGv+GznvtO@alley>
 <CAPhsuW4pt7vfHTj8KorTRCx5zJaoUiyYUOLy8uXZDbTbur4RRA@mail.gmail.com>
 <Y5dg25LV24mBRf4t@alley>
 <CAPhsuW7y1GzT8+quk4vJEqM6SagqDqc=HXA3jtdmfTfC=Gsv-Q@mail.gmail.com>
 <Y5h+PX6a1a9yjQPp@alley>
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: powerpc-part: was: Re: [PATCH v6] livepatch: Clear relocation
 targets on a module removal
Message-ID: <21984193-f9a5-1a7d-ecb7-0ae74b8cf202@redhat.com>
Date: Tue, 13 Dec 2022 17:19:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <Y5h+PX6a1a9yjQPp@alley>
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
Cc: jikos@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Josh Poimboeuf <jpoimboe@redhat.com>, live-patching@vger.kernel.org, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/13/22 8:29 AM, Petr Mladek wrote:
> On Tue 2022-12-13 00:13:46, Song Liu wrote:
>> )() ()On Mon, Dec 12, 2022 at 9:12 AM Petr Mladek <pmladek@suse.com> wrote:
>>>
>>> On Fri 2022-12-09 11:59:35, Song Liu wrote:
>>>> On Fri, Dec 9, 2022 at 3:41 AM Petr Mladek <pmladek@suse.com> wrote:
>>>>> On Mon 2022-11-28 17:57:06, Song Liu wrote:
>>>>>> On Fri, Nov 18, 2022 at 8:24 AM Petr Mladek <pmladek@suse.com> wrote:
>>>>>>>
>>>>>>>> --- a/arch/powerpc/kernel/module_64.c
>>>>>>>> +++ b/arch/powerpc/kernel/module_64.c
>>>>>>>> +#ifdef CONFIG_LIVEPATCH
>>>>>>>> +void clear_relocate_add(Elf64_Shdr *sechdrs,
>>>>>>>> +                    const char *strtab,
>>>>>>>> +                    unsigned int symindex,
>>>>>>>> +                    unsigned int relsec,
>>>>>>>> +                    struct module *me)
>>>>>>>> +{
>>>
>>> [...]
>>>
>>>>>>>> +
>>>>>>>> +             instruction = (u32 *)location;
>>>>>>>> +             if (is_mprofile_ftrace_call(symname))
>>>>>>>> +                     continue;
>>>>>
>>>>> Why do we ignore these symbols?
>>>>>
>>>>> I can't find any counter-part in apply_relocate_add(). It looks super
>>>>> tricky. It would deserve a comment.
>>>>>
>>>>> And I have no idea how we could maintain these exceptions.
>>>>>
>>>>>>>> +             if (!instr_is_relative_link_branch(ppc_inst(*instruction)))
>>>>>>>> +                     continue;
>>>>>
>>>>> Same here. It looks super tricky and there is no explanation.
>>>>
>>>> The two checks are from restore_r2(). But I cannot really remember
>>>> why we needed them. It is probably an updated version from an earlier
>>>> version (3 year earlier..).
>>>
>>> This is a good sign that it has to be explained in a comment.
>>> Or even better, it should not by copy pasted.
>>>
>>>>>>>> +             instruction += 1;
>>>>>>>> +             patch_instruction(instruction, ppc_inst(PPC_RAW_NOP()));
>>>
>>> I believe that this is not enough. apply_relocate_add() does this:
>>>
>>> int apply_relocate_add(Elf64_Shdr *sechdrs,
>>> [...]
>>>                        struct module *me)
>>> {
>>> [...]
>>>                 case R_PPC_REL24:
>>>                         /* FIXME: Handle weak symbols here --RR */
>>>                         if (sym->st_shndx == SHN_UNDEF ||
>>>                             sym->st_shndx == SHN_LIVEPATCH) {
>>> [...]
>>>                         if (!restore_r2(strtab + sym->st_name,
>>>                                                         (u32 *)location + 1, me))
>>> [...]                                   return -ENOEXEC;
>>>
>>> --->                    if (patch_instruction((u32 *)location, ppc_inst(value)))
>>>                                 return -EFAULT;
>>>
>>> , where restore_r2() does:
>>>
>>> static int restore_r2(const char *name, u32 *instruction, struct module *me)
>>> {
>>> [...]
>>>         /* ld r2,R2_STACK_OFFSET(r1) */
>>> --->    if (patch_instruction(instruction, ppc_inst(PPC_INST_LD_TOC)))
>>>                 return 0;
>>> [...]
>>> }
>>>
>>> By other words, apply_relocate_add() modifies two instructions:
>>>
>>>    + patch_instruction() called in restore_r2() writes into "location + 1"
>>>    + patch_instruction() called in apply_relocate_add() writes into "location"
>>>
>>> IMHO, we have to clear both.
>>>
>>> IMHO, we need to implement a function that reverts the changes done
>>> in restore_r2(). Also we need to revert the changes done in
>>> apply_relocate_add().
>>
>> I finally got time to read all the details again and recalled what
>> happened with the code.
>>
>> The failure happens when we
>> 1) call apply_relocate_add() on klp load (or module first load,
>>    if klp was loaded first);
>> 2) do nothing when the module is unloaded;
>> 3) call apply_relocate_add() on module reload, which failed.
>>
>> The failure happens at this check in restore_r2():
>>
>>         if (*instruction != PPC_RAW_NOP()) {
>>                 pr_err("%s: Expected nop after call, got %08x at %pS\n",
>>                         me->name, *instruction, instruction);
>>                 return 0;
>>         }
>>
>> Therefore, apply_relocate_add only fails when "location + 1"
>> is not NOP. And to make it not fail, we only need to write NOP to
>> "location + 1" in clear_relocate_add().
> 
> Yes, this should be enough to pass the existing check.
> 
>> IIUC, you want clear_relocate_add() to undo everything we did
>> in apply_relocate_add(); while I was writing clear_relocate_add()
>> to make the next apply_relocate_add() not fail.
>>
>> I agree that, based on the name, clear_relocate_add() should
>> undo everything by apply_relocate_add(). But I am not sure how
>> to handle some cases. For example, how do we undo
>>
>>                 case R_PPC64_ADDR32:
>>                         /* Simply set it */
>>                         *(u32 *)location = value;
>>                        break;
>>
>> Shall we just write zeros? I don't think this matters.
> 
> I guess that it would be zeros as we do in x86_64.
> 
> 
>> I think this is the question we should answer first:
>> What shall clear_relocate_add() do?
>> 1) undo everything by apply_relocate_add();
>> 2) only do things needed to make the next
>>    apply_relocate_add succeed;
>> 3) something between 1) and 2).
> 
> Good question.
> 
> Hmm, the commit a443bf6e8a7674b86221f49 ("powerpc/modules: Add REL24
> relocation support of livepatch symbols") suggests that all symbols
> in the section SHN_LIVEPATCH have the type R_PPC_REL24. AFAIK, the
> kernel livepatches are the only user of the clear_relocate_add()
> feature.
> 
> If the above is correct then it might be enough to clear only
> R_PPC_REL24 type. And it might be enough to warn when clear_relocate_add()
> is called for another type so that we know when the relocations
> were not cleared properly.
> 
> Good question.  We might need some input from people familiar
> with the architecture and creating the livepatches.
> 

Adding Russell to the to CC list as he worked some of recent ppc64le
livepatch klp-relocation threads [1] [2].

Maybe it would simpler to first organize a cleanup of the code, then add
the capability to undo the relocations?  According to [2] and the last
comment on [3], it sounded like the Power folks had a "full"(er)
solution in mind depending on our requirements.

Finally, I'll try to finish my v6.1 rebase of the klp-convert patchset
this week.  That includes a bunch of kselftests that generate all manner
of klp-relocation types and sections.  (More than I've ever seen out of
kpatch-build.)

[1] https://lore.kernel.org/linuxppc-dev/YX9UUBeudSUuJs01@redhat.com/
[2] https://lore.kernel.org/linuxppc-dev/YxAc87dTmclHGCUy@redhat.com/
[3] https://github.com/linuxppc/issues/issues/375

-- 
Joe

