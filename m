Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE421B89DD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 01:03:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498mmQ5sBczDqcx
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 09:03:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EXU1uMLf; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498mkx2sBdzDqXK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 09:02:00 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id hi11so5636054pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 16:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=kuyGG2WrwcRLhDmmOafr5C39I+M2elt9RC63O0/Z7SE=;
 b=EXU1uMLfZlRxtmAcs2eld6Bu7fbwGqBzOi/x2jpL7aK28iLIEgcDvgDm0LkzSkXDai
 VydlqHCX5agITQBVertFGGhJVWhkf4W9JdFRqYXBGapjwDvNKrWBSX8uX1+u1oAMi57q
 iwIBzJzvU81S3x8sZx6IiVG9Nd+8oouN7asvSdnE/JLoHDJSTNRxYCCLpmMbE2HduqPk
 3WgsZ9WzhopEVQgSeOCq4RaKf0+9GNG2zIwOoC3HaIPFXXS8sW8hYwCoQHLmsgqawZVp
 1hFVvqDxh7HgDt3cU+JvAYRaSdAKWKy/pZCaoifUFP5+7ZqUzKIkD5Q8qYj4sbsbdlTD
 YE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=kuyGG2WrwcRLhDmmOafr5C39I+M2elt9RC63O0/Z7SE=;
 b=ozxVv+0/R7W8SlbSu8uyXdWZYk0Mo5GEd2Zaqae8r2RznGM2w4HhtzgqUHD2sOPNp9
 z7UY9ia/RR1md2s3oVyMpLPLXqt+e3fCJLLOnTHRC0CaHcz1S8vPDak/mBtpJ+S+hvro
 53ivsbowL1o13zT5Zt3B9aKkMOswa+RXb2yWSt4nRvjANZPeE01r3s64OUdMeWiuybA/
 MzBOFAWtE9p6XL53gWRbRxJbIVs7J2pSfATGDhwYF3rZY2LsDIzXz6PpfLr+oOK74Z2M
 peWStPKA3wbX+dio7sGGeJZJosC9E8Zvf6kXmW6JSkwLSYhJMbzlKU28zOjtn/Z+G17F
 aELQ==
X-Gm-Message-State: AGi0PuYS2VqWSamD//g8rXkSCN9Um9PUXkA2DM4uy0M0w2KfnRCNCR50
 ypRtyqBPL9/1mzJ2XiYIxpY=
X-Google-Smtp-Source: APiQypIQz62BPXqy7A7XX0WODMxDjN3Uen5QDKuSmelR0+WXUJlbHIBrMkspB3YMzRDc1lKIJYYJRw==
X-Received: by 2002:a17:90a:690b:: with SMTP id
 r11mr4063564pjj.119.1587855714892; 
 Sat, 25 Apr 2020 16:01:54 -0700 (PDT)
Received: from localhost ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id v127sm8618043pfv.77.2020.04.25.16.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2020 16:01:54 -0700 (PDT)
Date: Sun, 26 Apr 2020 08:58:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: New powerpc vdso calling convention
To: binutils@sourceware.org, Christophe Leroy <christophe.leroy@c-s.fr>,
 linuxppc-dev@lists.ozlabs.org
References: <1587790194.w180xsw5be.astroid@bobo.none>
 <9371cac5-20bb-0552-2609-0d537f41fecd@c-s.fr>
 <1587810370.tg8ym9yjpc.astroid@bobo.none>
 <976551e8-229e-54c1-8fb2-c5df94b979c3@c-s.fr>
In-Reply-To: <976551e8-229e-54c1-8fb2-c5df94b979c3@c-s.fr>
MIME-Version: 1.0
Message-Id: <1587855423.jug0f1n0b8.astroid@bobo.none>
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
Cc: Rich Felker <dalias@libc.org>, libc-alpha@sourceware.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>, musl@lists.openwall.com,
 Andy Lutomirski <luto@kernel.org>, libc-dev@lists.llvm.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of April 25, 2020 10:20 pm:
>=20
>=20
> Le 25/04/2020 =C3=A0 12:56, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of April 25, 2020 5:47 pm:
>>>
>>>
>>> Le 25/04/2020 =C3=A0 07:22, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>> As noted in the 'scv' thread, powerpc's vdso calling convention does n=
ot
>>>> match the C ELF ABI calling convention (or the proposed scv convention=
).
>>>> I think we could implement a new ABI by basically duplicating function
>>>> entry points with different names.
>>>
>>> I think doing this is a real good idea.
>>>
>>> I've been working at porting powerpc VDSO to the GENERIC C VDSO, and th=
e
>>> main pitfall has been that our vdso calling convention is not compatibl=
e
>>> with C calling convention, so we have go through an ASM entry/exit.
>>>
>>> See https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D17=
1469
>>>
>>> We should kill this error flag return through CR[SO] and get it the
>>> "modern" way like other architectectures implementing the C VDSO: retur=
n
>>> 0 when successfull, return -err when failed.
>>=20
>> Agreed.
>>=20
>>>> The ELF v2 ABI convention would suit it well, because the caller alrea=
dy
>>>> requires the function address for ctr, so having it in r12 will
>>>> eliminate the need for address calculation, which suits the vdso data
>>>> page access.
>>>>
>>>> Is there a need for ELF v1 specific calls as well, or could those just=
 be
>>>> deprecated and remain on existing functions or required to use the ELF
>>>> v2 calls using asm wrappers?
>>>
>>> What's ELF v1 and ELF v2 ? Is ELF v1 what PPC32 uses ? If so, I'd say
>>> yes, it would be good to have it to avoid going through ASM in the midd=
le.
>>=20
>> I'm not sure about PPC32. On PPC64, ELFv2 functions must be called with
>> their address in r12 if called at their global entry point. ELFv1 have a
>> function descriptor with call address and TOC in it, caller has to load
>> the TOC if it's global.
>>=20
>> The vdso doesn't have TOC, it has one global address (the vdso data
>> page) which it loads by calculating its own address.
>>=20
>> The kernel doesn't change the vdso based on whether it's called by a v1
>> or v2 userspace (it doesn't really know itself and would have to export
>> different functions). glibc has a hack to create something:
>>=20
>> # define VDSO_IFUNC_RET(value)                           \
>>    ({                                                     \
>>      static Elf64_FuncDesc vdso_opd =3D { .fd_toc =3D ~0x0 }; \
>>      vdso_opd.fd_func =3D (Elf64_Addr)value;                \
>>      &vdso_opd;                                           \
>>    })
>>=20
>> If we could make something which links more like any other dso with
>> ELFv1, that would be good. Otherwise I think v2 is preferable so it
>> doesn't have to calculate its own address.
>=20
> I see the following in glibc. So looks like PPC32 is like PPC64 elfv1.=20
> By the way, they are talking about something not completely finished in=20
> the kernel. Can we finish it ?

Possibly can. It seems like a good idea to fix all loose ends if we are=20
going to add new versions. Will have to check with the toolchain people=20
to make sure we're doing the right thing.

Thanks,
Nick
