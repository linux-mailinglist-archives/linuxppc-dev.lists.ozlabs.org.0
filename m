Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D68343721
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 04:09:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3fcK20Snz304D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 14:09:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=M+kyU2zW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M+kyU2zW; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3fbv3HjSz2xxj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 14:09:12 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id m7so7700847pgj.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Mar 2021 20:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=03U/7+QYPnvn0L5my+8qiaOviX/EOvOSJ+XzfVr1ggU=;
 b=M+kyU2zWnOg1ySt+RIR+6Mjo6jl2l6F0jA7IGHOmlFsYIq6rjO5a/b1OGTS2IElJBB
 kZiPBNia2hh4MxXzvJtxW9/AUjHPP4heyRPNQzQjdjfjCli+5MlNQVmPekXaoXdf4ITD
 p/ot2KBCZTdarbfsCoksOGfV594eOTdm3yuh5ju3Q8UniUi4vk9WRz9s4Xa9xUW2yA10
 bW6vZfhK7js3shepKDY25zpuZI/PSGDSIzosbfbZXF9KSgbeLMMtUxMSUQUeXLzcChw7
 srusARel/ImturkpJxM751d8UBBmXpHO9YFL/bmKNkhpCMPlTv5KpYhGj4+30iEYJJl3
 1N0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=03U/7+QYPnvn0L5my+8qiaOviX/EOvOSJ+XzfVr1ggU=;
 b=FQ7Iq7CCc7r19NAfw46CbXGCsJLwrEh1hYCJ/J5PROi2Y6ZiOrUCzpN2cyNbsSQXPW
 ACelStxWX7X+0jtRsvSNyBbhJPTC839YOxt0qGs83zswsA7D9sI4LOe7ilQ++KTsow+U
 QDHvTMkD46x29kjQrYHZ4CxKVyv3KEmNSjOb75rtA1/6QHcUEBAmDt2/wMFDGZ+kW0rF
 f3A40rED+WsTrAkXqwNFu02J6X8Tl8lsMtforFYwrJ5ZR+4z8dqMJNb/+lJzjsz6w2Lc
 XZu2ghrnoZj1X9Gu1zgjntnMjoolf7RNIe4f5CdC0UTAK7UUY2w65VPZwe31ABZXzR+o
 p/fA==
X-Gm-Message-State: AOAM532tyAh661y96R66KpCaVFc7b7IRIf1Stf/Qd3LZKoo1nqqsT8c7
 LtUgYiXTTpSuFhrVu7Q5eQZ3grkyzKM=
X-Google-Smtp-Source: ABdhPJzCz0/b18jb0X3x85YOP2jlhHVYNM1onDsEly+8QH5RvchGLi6xDNsYSlTFNSItfcCLR5wczQ==
X-Received: by 2002:aa7:9293:0:b029:1df:4e2:c981 with SMTP id
 j19-20020aa792930000b02901df04e2c981mr19489935pfa.41.1616382549251; 
 Sun, 21 Mar 2021 20:09:09 -0700 (PDT)
Received: from localhost ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id u7sm11233132pfh.150.2021.03.21.20.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 20:09:08 -0700 (PDT)
Date: Mon, 22 Mar 2021 13:09:03 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 5/6] powerpc/mm/64s/hash: Add real-mode
 change_memory_range() for hash LPAR
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210211135130.3474832-1-mpe@ellerman.id.au>
 <20210211135130.3474832-5-mpe@ellerman.id.au>
 <1613086376.ygjdbhz8p5.astroid@bobo.none>
 <87czvz4n47.fsf@mpe.ellerman.id.au>
In-Reply-To: <87czvz4n47.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1616382012.2m85hefs07.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of March 16, 2021 4:40 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Excerpts from Michael Ellerman's message of February 11, 2021 11:51 pm:
>>> When we enabled STRICT_KERNEL_RWX we received some reports of boot
>>> failures when using the Hash MMU and running under phyp. The crashes
>>> are intermittent, and often exhibit as a completely unresponsive
>>> system, or possibly an oops.
> ...
>>>=20
>>> diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/=
book3s64/hash_pgtable.c
>>> index 3663d3cdffac..01de985df2c4 100644
>>> --- a/arch/powerpc/mm/book3s64/hash_pgtable.c
>>> +++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
>>> @@ -414,6 +428,73 @@ static void change_memory_range(unsigned long star=
t, unsigned long end,
>>>  							mmu_kernel_ssize);
>>>  }
>>> =20
>>> +static int notrace chmem_secondary_loop(struct change_memory_parms *pa=
rms)
>>> +{
>>> +	unsigned long msr, tmp, flags;
>>> +	int *p;
>>> +
>>> +	p =3D &parms->cpu_counter.counter;
>>> +
>>> +	local_irq_save(flags);
>>> +	__hard_EE_RI_disable();
>>> +
>>> +	asm volatile (
>>> +	// Switch to real mode and leave interrupts off
>>> +	"mfmsr	%[msr]			;"
>>> +	"li	%[tmp], %[MSR_IR_DR]	;"
>>> +	"andc	%[tmp], %[msr], %[tmp]	;"
>>> +	"mtmsrd %[tmp]			;"
>>> +
>>> +	// Tell the master we are in real mode
>>> +	"1:				"
>>> +	"lwarx	%[tmp], 0, %[p]		;"
>>> +	"addic	%[tmp], %[tmp], -1	;"
>>> +	"stwcx.	%[tmp], 0, %[p]		;"
>>> +	"bne-	1b			;"
>>> +
>>> +	// Spin until the counter goes to zero
>>> +	"2:				;"
>>> +	"lwz	%[tmp], 0(%[p])		;"
>>> +	"cmpwi	%[tmp], 0		;"
>>> +	"bne-	2b			;"
>>> +
>>> +	// Switch back to virtual mode
>>> +	"mtmsrd %[msr]			;"
>>
>> Pity we don't have something that can switch to emergency stack and
>> so we can write this stuff in C.
>>
>> How's something like this suit you?
>=20
> It looks like it would be really good for writing exploits :)

Hmm. In that case maybe the callee function could be inlined into it=20
like the interrupt wrappers, and the asm real-mode entry/exit gets
added around it rather than have this little exploit stub. So similar to=20
yours but with a stack switch as well so you can come back up in real=20
mode.

> I think at the very least we would want the asm part to load the SP
> from the paca itself, rather than taking it as a parameter.
>=20
> But I'm not sure writing these type of things in C is a big win, because
> you have to be so careful about what you call anyway. It's almost better
> in asm because it's so restrictive.
>=20
> Obviously having said that, my first attempt got the IRQ save/restore
> wrong, so maybe we should at least have some macros to help with it.
>=20
> Did you have another user for this in mind? The only one that I can
> think of at the moment is the subcore stuff.

Possibly rtas entry/exit (although that has other issues). But I guess=20
it's not a huge amount of asm compared with what I'm dealing with.

I'm okay if you just put your thing in at the moment, we might or might=20
not get keen and c-ify it later.

Thanks,
Nick
