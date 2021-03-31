Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B59A3506E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 20:54:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9b8B1r3Sz3bq8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 05:54:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=Mgm0NPTv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256
 header.s=google header.b=Mgm0NPTv; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9b7k5Qf5z300S
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 05:53:52 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id j18so20707008wra.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 11:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3u7Et0H7oZ1l5+ZT9yV0GYS4scsUtLZ5FCnJUgJcrYc=;
 b=Mgm0NPTvspRnm2H/4m2momQHT290auYuLqDANl89pFpeXPjht2MQjc/9oGe/0kRF3r
 FFfSpw6pLg7HQUNMO+FUmKd7OlPJbzAdBkLOxYHVvGKD4bpvCSd93fmeWrM5UsixRe5Q
 FhpXRqxw19IrLrm3HlvXkMF5B74Oyn6XmtPUM9MzKL8IkLh5lxoQd6S+8Jsvv+MX2ZBy
 OHFJcVWq89q46mVCPuTkBi5800JUenUswWCTssAgpxdylHdEaVznXTpUGm4QbKkQl/jq
 R99EYo+OIkW5UzTANDPKCSwh+FWDFaGVPT0OyYd37kX3i5AUAfX/I2OZYTiZI/NH+yKL
 J2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3u7Et0H7oZ1l5+ZT9yV0GYS4scsUtLZ5FCnJUgJcrYc=;
 b=t/CNronal6fSUQ/GJA5TpUaaVPFM8gF7WGm+Y3T75oiS7HJpjJ6mbI0JUlFRzfcHyE
 9CCNmvd+5yFeM8hjGinVlvIop4qRPU7qpXjl+pr2UXkDH0U6gu9oSqj8H25zhadjHTJg
 RaAJizLlFyY0a5uqlxYY1CKhFCtvaNQhdByn/yTknSYLD9aq048q/IiXuUeUORf02D9U
 JBCmXTv1fNJRsSaYMgWCTzX2UYzkC+5YwBmolz8MKF6bU2artrVo82IDcEL++VMPGY6O
 QsFvOocGosfEoFJdwObYhZu/5XQyx8F7amn29fJaP/vrIklyMRHGOCl0q64LUzRe71YK
 dpvQ==
X-Gm-Message-State: AOAM5337UFBrz3gMHA8642qerjtwJnZRqFTxGPw0oFH0iZIqO72v3HJv
 bGmnW5NIrRq4T4wX2QbqsV8LOA==
X-Google-Smtp-Source: ABdhPJyPqgg2NxjIPCh/BtXZYrR1Sey+m3sh2KHpQm1VyfXtUb7l7xh32RumbSLj4ZvX3qCECfmddw==
X-Received: by 2002:adf:e34f:: with SMTP id n15mr5278586wrj.224.1617216828332; 
 Wed, 31 Mar 2021 11:53:48 -0700 (PDT)
Received: from ?IPv6:2a02:8084:e84:2480:228:f8ff:fe6f:83a8?
 ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id u20sm6368269wru.6.2021.03.31.11.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 11:53:48 -0700 (PDT)
Subject: Re: [PATCH] powerpc/vdso: Separate vvar vma from vdso
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org
References: <20210326191720.138155-1-dima@arista.com>
 <09e8d68d-54fe-e327-b44f-8f68543edba1@csgroup.eu>
 <8735wby77v.fsf@mpe.ellerman.id.au>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <361ec8ba-8335-157a-53e8-38a656626519@arista.com>
Date: Wed, 31 Mar 2021 19:53:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8735wby77v.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Dmitry Safonov <0x7f454c46@gmail.com>, stable@vger.kernel.org,
 Andrei Vagin <avagin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/31/21 10:59 AM, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
[..]
>>
>>> @@ -133,7 +135,13 @@ static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_int
>>>   	 * install_special_mapping or the perf counter mmap tracking code
>>>   	 * will fail to recognise it as a vDSO.
>>>   	 */
>>> -	mm->context.vdso = (void __user *)vdso_base + PAGE_SIZE;
>>> +	mm->context.vdso = (void __user *)vdso_base + vvar_size;
>>> +
>>> +	vma = _install_special_mapping(mm, vdso_base, vvar_size,
>>> +				       VM_READ | VM_MAYREAD | VM_IO |
>>> +				       VM_DONTDUMP | VM_PFNMAP, &vvar_spec);
>>> +	if (IS_ERR(vma))
>>> +		return PTR_ERR(vma);
>>>   
>>>   	/*
>>>   	 * our vma flags don't have VM_WRITE so by default, the process isn't
>>
>>
>> IIUC, VM_PFNMAP is for when we have a vvar_fault handler.
>> Allthough we will soon have one for handle TIME_NS, at the moment
>> powerpc doesn't have that handler.
>> Isn't it dangerous to set VM_PFNMAP then ?

I believe, it's fine, special_mapping_fault() does:
:		if (sm->fault)
:			return sm->fault(sm, vmf->vma, vmf);

> Some of the other flags seem odd too.
> eg. VM_IO ? VM_DONTDUMP ?

Yeah, so:
VM_PFNMAP | VM_IO is a protection from remote access on pages. So one
can't access such page with ptrace(), /proc/$pid/mem or
process_vm_write(). Otherwise, it would create COW mapping and the
tracee will stop working with stale vvar.

VM_DONTDUMP restricts the area from coredumping and gdb will also avoid
accessing those[1][2].

I agree that VM_PFNMAP was probably excessive in this patch alone and
rather synchronized code with other architectures, but it makes more
sense now in the new patches set by Christophe:
https://lore.kernel.org/linux-arch/cover.1617209141.git.christophe.leroy@csgroup.eu/


[1] https://lore.kernel.org/lkml/550731AF.6080904@redhat.com/T/
[2] https://sourceware.org/legacy-ml/gdb-patches/2015-03/msg00383.html

Thanks,
          Dmitry
