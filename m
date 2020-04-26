Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C08BE1B8BC5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 05:47:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498v491PP4zDqfb
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 13:47:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PHGo295c; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498v1H1gbhzDqbW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 13:44:49 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id z1so5343879pfn.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 20:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Zmzz1bVAliE2cuiIu7xp76RGo/t+Ub8bw6j1w1DyGc0=;
 b=PHGo295cmYAqXqFXD2W4IQA6MsYzE8bCe6Zt9HU/6j4ZUg2LUlndiKRn15Nsc9NTAC
 pj6ZHUZAOT2emX0+ijqhSoaunvD10qFe4nRmhC04idxV8ymLnZCXc+HqTmsmy/vwrsNF
 l8n/myEtAhpLSstDo/mLdJVvRkxi1bz6R8HtkKgyq3wGsAsWhe5QzSawA1+b2ZOYUVas
 kS02Y9AcybOuTOR8yUfC3Qaof+ETHLDHH0iYE60fuv+O7+cXFHAEpG7nu+fLB8F0N++N
 wYFE1hjOWToRL7qgHC60qXUXQ6z4K7qe0Ghs4x4zy+qX1HVv2CpmpuTtj4cU/xDw3y3d
 4mtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Zmzz1bVAliE2cuiIu7xp76RGo/t+Ub8bw6j1w1DyGc0=;
 b=WXZWDnPd3PECeTKJRxjBSQj2T2fomWK7Q1cNpw5HE2WppE9LQ5sq74GUI6ayBCb1xX
 QRgC7BlPv8QP0a9vW5QzJdTqm9CRLMFDdp7O6Fuxk/R+pwSkJrDoCZfhO7cfWn4XWA/g
 5J2XwR4ILMonxx3mbTuE8sJHTXdOm3MIqE0PLsonDu+V0WBkD94C9yDj7TbAiUW0vGNy
 dj/WS9e6OeJaxPqOREfQetAgBfMlC7P9ZiiQs1zg3VJUxMCslKDiMyWR6oUvZBbPaZUr
 btC9crQlcvOnvrV57dwxVVbVutKGc8UgGT+DAwQIWZqqV/T7x1hdGgWro/sO5eQ5YR5J
 77Cw==
X-Gm-Message-State: AGi0PuZonmoo7tinv8KVfsxUEMSGs2bg+kb9UnDWyNoywaLguCHM2IFn
 x83omiX+h5bkT4GVAXMyYqY=
X-Google-Smtp-Source: APiQypIvfDlzxPSPiVTMw/OeZjkjBKrwC1/WUViST6RSzfGg4Kbx/3Sbu2maLkHBwQ/qduCzkQtlZA==
X-Received: by 2002:a62:7656:: with SMTP id r83mr17087756pfc.71.1587872685764; 
 Sat, 25 Apr 2020 20:44:45 -0700 (PDT)
Received: from localhost ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id w16sm7807811pgf.94.2020.04.25.20.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2020 20:44:44 -0700 (PDT)
Date: Sun, 26 Apr 2020 13:41:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: New powerpc vdso calling convention
To: Rich Felker <dalias@libc.org>
References: <1587790194.w180xsw5be.astroid@bobo.none>
 <9371cac5-20bb-0552-2609-0d537f41fecd@c-s.fr>
 <1587810370.tg8ym9yjpc.astroid@bobo.none>
 <976551e8-229e-54c1-8fb2-c5df94b979c3@c-s.fr>
 <1587855423.jug0f1n0b8.astroid@bobo.none>
 <20200425231119.GM11469@brightrain.aerifal.cx>
In-Reply-To: <20200425231119.GM11469@brightrain.aerifal.cx>
MIME-Version: 1.0
Message-Id: <1587872025.rtx2ygrmn0.astroid@bobo.none>
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
Cc: libc-alpha@sourceware.org, Andy Lutomirski <luto@kernel.org>,
 musl@lists.openwall.com, binutils@sourceware.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>, libc-dev@lists.llvm.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Rich Felker's message of April 26, 2020 9:11 am:
> On Sun, Apr 26, 2020 at 08:58:19AM +1000, Nicholas Piggin wrote:
>> Excerpts from Christophe Leroy's message of April 25, 2020 10:20 pm:
>> >=20
>> >=20
>> > Le 25/04/2020 =C3=A0 12:56, Nicholas Piggin a =C3=A9crit=C2=A0:
>> >> Excerpts from Christophe Leroy's message of April 25, 2020 5:47 pm:
>> >>>
>> >>>
>> >>> Le 25/04/2020 =C3=A0 07:22, Nicholas Piggin a =C3=A9crit=C2=A0:
>> >>>> As noted in the 'scv' thread, powerpc's vdso calling convention doe=
s not
>> >>>> match the C ELF ABI calling convention (or the proposed scv convent=
ion).
>> >>>> I think we could implement a new ABI by basically duplicating funct=
ion
>> >>>> entry points with different names.
>> >>>
>> >>> I think doing this is a real good idea.
>> >>>
>> >>> I've been working at porting powerpc VDSO to the GENERIC C VDSO, and=
 the
>> >>> main pitfall has been that our vdso calling convention is not compat=
ible
>> >>> with C calling convention, so we have go through an ASM entry/exit.
>> >>>
>> >>> See https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=
=3D171469
>> >>>
>> >>> We should kill this error flag return through CR[SO] and get it the
>> >>> "modern" way like other architectectures implementing the C VDSO: re=
turn
>> >>> 0 when successfull, return -err when failed.
>> >>=20
>> >> Agreed.
>> >>=20
>> >>>> The ELF v2 ABI convention would suit it well, because the caller al=
ready
>> >>>> requires the function address for ctr, so having it in r12 will
>> >>>> eliminate the need for address calculation, which suits the vdso da=
ta
>> >>>> page access.
>> >>>>
>> >>>> Is there a need for ELF v1 specific calls as well, or could those j=
ust be
>> >>>> deprecated and remain on existing functions or required to use the =
ELF
>> >>>> v2 calls using asm wrappers?
>> >>>
>> >>> What's ELF v1 and ELF v2 ? Is ELF v1 what PPC32 uses ? If so, I'd sa=
y
>> >>> yes, it would be good to have it to avoid going through ASM in the m=
iddle.
>> >>=20
>> >> I'm not sure about PPC32. On PPC64, ELFv2 functions must be called wi=
th
>> >> their address in r12 if called at their global entry point. ELFv1 hav=
e a
>> >> function descriptor with call address and TOC in it, caller has to lo=
ad
>> >> the TOC if it's global.
>> >>=20
>> >> The vdso doesn't have TOC, it has one global address (the vdso data
>> >> page) which it loads by calculating its own address.
>> >>=20
>> >> The kernel doesn't change the vdso based on whether it's called by a =
v1
>> >> or v2 userspace (it doesn't really know itself and would have to expo=
rt
>> >> different functions). glibc has a hack to create something:
>> >>=20
>> >> # define VDSO_IFUNC_RET(value)                           \
>> >>    ({                                                     \
>> >>      static Elf64_FuncDesc vdso_opd =3D { .fd_toc =3D ~0x0 }; \
>> >>      vdso_opd.fd_func =3D (Elf64_Addr)value;                \
>> >>      &vdso_opd;                                           \
>> >>    })
>> >>=20
>> >> If we could make something which links more like any other dso with
>> >> ELFv1, that would be good. Otherwise I think v2 is preferable so it
>> >> doesn't have to calculate its own address.
>> >=20
>> > I see the following in glibc. So looks like PPC32 is like PPC64 elfv1.=
=20
>> > By the way, they are talking about something not completely finished i=
n=20
>> > the kernel. Can we finish it ?
>>=20
>> Possibly can. It seems like a good idea to fix all loose ends if we are=20
>> going to add new versions. Will have to check with the toolchain people=20
>> to make sure we're doing the right thing.
>=20
> "ELFv1" and "ELFv2" are PPC64-specific names for the old and new
> version of the ELF psABI for PPC64. They have nothing at all to do
> with PPC32 which is a completely different ABI from either.

Right, I'm just talking about those comments -- it seems like the kernel=20
vdso should contain an .opd section with function descriptors in it for
elfv1 calls, rather than the hack it has now of creating one in the=20
caller's .data section.

But all that function descriptor code is gated by

#if (defined(__PPC64__) || defined(__powerpc64__)) && _CALL_ELF !=3D 2

So it seems PPC32 does not use function descriptors but a direct pointer=20
to the entry point like PPC64 with ELFv2.

Thanks,
Nick
