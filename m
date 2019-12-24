Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D4E12A143
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 13:17:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hwFr5qdXzDqP2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 23:17:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.b="zDWD8XCA"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hwCV3cQhzDqGW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 23:15:15 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id x185so10690371pfc.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 04:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=cUl5gZioHf+9+6AN9dmbhGHLhNt8/shlwV1E7YstAts=;
 b=zDWD8XCA/EeC40f+rqUuDAnCbmAAgAgN8grpTLGD/hu+c6oJ0ekyx9F6083vGsPNpB
 IGrhdkZdQkxUJLQB7IC7MUBKdiAhvr42yCtnEmbLuDVhaVlWU50A+XXkfqUzCfKxLwYd
 NcWZApcamRuoTETR8c7gHOWeAVehTsmseTXj6LnGvlE98ZW3YWEywJh2onhr62RKIN/O
 QbWUv3VfPQ9hUaNXtaLLQYhY2txQ0sPDCgcRwZIrZh36FXuwhdnUh56nRBpE8VWMrHr3
 eko3/wFRsyPKl+dK9FEf1/R7qWEszOxJvMCuzKzRvNgASrlCBXtD9TcieHqLYVVfd8P7
 LnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=cUl5gZioHf+9+6AN9dmbhGHLhNt8/shlwV1E7YstAts=;
 b=UDVd08NZyRLf9th+rhldY+kYiidc5vXYDhjzmfkXEjPnmwQiBUbJqLixC2Tq2wB42K
 MwLGdkHl5jiv8bS9YRJ0yYFS6tJUIpMJQDqLp7196r4g/mGzzFeZMUp+fdeYdNNwyAXl
 +Oa/dYlwL6U9bl5k9z7LEfxJHVmVxULtGrWJF5vTPTvqQA7wMrP2JKL/priRXclxKVBe
 8cQrAChjTGA5Ep/cc7z03vfeC8sWPIHkBWHdUPh+uquFjFvJ22KazBMavEyieVW+K8dP
 jUm60LE7SMLM+MmtWUvkSrw2zkw38JnoobxpkbXbLopngA3oVFKtmS+7cokteGvOF9dZ
 bhHw==
X-Gm-Message-State: APjAAAVA+H1RjAr8I356Mh4LgVVln85aGXYMQifvC59gBJ08QrB7IVvJ
 y6hzyh808a2aGW9d44ls+MbASw==
X-Google-Smtp-Source: APXvYqxQw1UT4Rk2hWrXeLnplHcgXPOvZ2uVcW7HJIiySYb8+fVviH72PQISJdC4tjd4Z7zmNcXU4Q==
X-Received: by 2002:a62:868f:: with SMTP id
 x137mr34816521pfd.228.1577189713974; 
 Tue, 24 Dec 2019 04:15:13 -0800 (PST)
Received: from [192.168.0.9] (111-255-104-19.dynamic-ip.hinet.net.
 [111.255.104.19])
 by smtp.gmail.com with ESMTPSA id j5sm11842535pfn.180.2019.12.24.04.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Dec 2019 04:15:13 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH v2 04/10] lib: vdso: get pointer to vdso data from the
 arch
Date: Tue, 24 Dec 2019 20:15:11 +0800
Message-Id: <D2614EC4-5B80-4846-994D-22730ACD44A1@amacapital.net>
References: <de5273aa-69dc-8e37-c917-44708257d2ba@c-s.fr>
In-Reply-To: <de5273aa-69dc-8e37-c917-44708257d2ba@c-s.fr>
To: christophe leroy <christophe.leroy@c-s.fr>
X-Mailer: iPhone Mail (17C54)
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
Cc: Arnd Bergmann <arnd@arndb.de>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Dec 24, 2019, at 7:53 PM, christophe leroy <christophe.leroy@c-s.fr> wr=
ote:
>=20
> =EF=BB=BF
>=20
>> Le 24/12/2019 =C3=A0 03:27, Andy Lutomirski a =C3=A9crit :
>>> On Mon, Dec 23, 2019 at 6:31 AM Christophe Leroy
>>> <christophe.leroy@c-s.fr> wrote:
>>>=20
>>> On powerpc, __arch_get_vdso_data() clobbers the link register,
>>> requiring the caller to set a stack frame in order to save it.
>>>=20
>>> As the parent function already has to set a stack frame and save
>>> the link register to call the C vdso function, retriving the
>>> vdso data pointer there is lighter.
>> I'm confused.  Can't you inline __arch_get_vdso_data()?  Or is the
>> issue that you can't retrieve the program counter on power without
>> clobbering the link register?
>=20
> Yes it can be inlined (I did it in V1 https://patchwork.ozlabs.org/patch/1=
180571/), but you can't do it without clobbering the link register, because t=
he only way to get the program counter is to do to as if you were calling an=
other function but you call to the address which just follows where you are,=
 so that it sets LR which the simulated return address which corresponds to t=
he address following the branch.
>=20
> static __always_inline
> const struct vdso_data *__arch_get_vdso_data(void)
> {
>    void *ptr;
>=20
>    asm volatile(
>        "    bcl    20, 31, .+4;\n"
>        "    mflr    %0;\n"
>        "    addi    %0, %0, __kernel_datapage_offset - (.-4);\n"
>        : "=3Db"(ptr) : : "lr");
>=20
>    return ptr + *(unsigned long *)ptr;
> }
>=20
>> I would imagine that this patch generates worse code on any
>> architecture with PC-relative addressing modes (which includes at
>> least x86_64, and I would guess includes most modern architectures).
>=20
> Why ? Powerpc is also using PC-relative addressing for all calls but indir=
ect calls.

I mean PC-relative access for data.  The data page is at a constant, known o=
ffset from the vDSO text.

I haven=E2=80=99t checked how much x86_64 benefits from this, but at least t=
he non-array fields ought to be accessible with a PC-relative access.

It should be possible to refactor a little bit so that the compiler can stil=
l see what=E2=80=99s going on.  Maybe your patch actually does this. I=E2=80=
=99d want to look at the assembly.  This also might not matter much on x86_6=
4 in particular, since x86_64 can convert a PC-relative address to an absolu=
te address with a single instruction with no clobbers.

Does power have PC-relative data access?  If so, I wonder if the code can be=
 arranged so that even the array accesses don=E2=80=99t require computing an=
 absolute address at any point.
