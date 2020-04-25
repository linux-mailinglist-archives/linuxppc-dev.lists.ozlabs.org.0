Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1562B1B85E4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 13:02:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498Sm51YkvzDqv8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 21:01:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DEJCN4RX; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498SkN1L1YzDqHh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 21:00:27 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id h69so5929200pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 04:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=WJ1ftYIEA71lZ9W+K+8CT7Do3y8++eTLYCbmeD3KoUI=;
 b=DEJCN4RXawMdO6MPziJCPk46ZSi544uBE0LvPk3myFTOdMoCvRtEtu/pnVyHn21YWX
 au4vGc6qlWFRxmgFOWhL46dTKD65LNMBRoMG2ciKmRTCsqL4xEYn/PUO76VTry0yMj5p
 Ak7B9dSFfEcdwvoPuflvrnHGdlXUZCd6wEzD+RSgh6g4XwElKh8ZOFg3CwRDy264fZjD
 ExJEt6ykIvZRWNVnm7WKOJtjZd7HE5bhFqp+B+TsjvF0bF9cE2sMbxNbFICh1Hc7/DKf
 T0xA+AEBKS01KSUIiEvDRENVYo5rqk/gEl0N6oRvhQ5KDoVeRzk9NhpPBelaFkXrQvHa
 91xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=WJ1ftYIEA71lZ9W+K+8CT7Do3y8++eTLYCbmeD3KoUI=;
 b=ejKsP5qYxDR+XEBZMCEfGfCcYCFHFBy99ZxgjD0EOYbte/kJ+zpL5E8cLsCCQaH2/7
 D9j06arNEIBt1tK34GAH6qYgNOk9nOL4o2f63n2aXWJzesQtjZHyqVmRle9KqNxy9PfE
 P+6Tcv9UNgLQyyc7Pptig5ktExea9btzkX3cp2NyRWIIOYxhPGZNvTmw5yYV18H9a2kx
 EusC6JpN56fMUhp51ZIK05Innv8+JQ4VkQ4j6rNAYdnt4iPtn4Zn0tVzfDgbLJZhNVjN
 cv753ABksbX5GLsWlcmrjNRu914c24DgqILl1VselWzSV4HPHSVKWUwfm20b87eFJfJ6
 K00Q==
X-Gm-Message-State: AGi0PuYReVdLvCltK6ADdh+jsOfJGWo7sfSPK76JhHYNjpAwfFmKJ7vS
 /UzfEyWGI5XcrXspQP8kIZk=
X-Google-Smtp-Source: APiQypItDEkctIh/qxACRlcEm3tb75XxC/s0wL9AAIHQLpsPTBcEow031P839mfNKFW4unJOZbVOFA==
X-Received: by 2002:a63:7f1a:: with SMTP id a26mr1174761pgd.252.1587812421787; 
 Sat, 25 Apr 2020 04:00:21 -0700 (PDT)
Received: from localhost ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id 1sm7110011pjc.32.2020.04.25.04.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2020 04:00:21 -0700 (PDT)
Date: Sat, 25 Apr 2020 20:56:54 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: New powerpc vdso calling convention
To: binutils@sourceware.org, Christophe Leroy <christophe.leroy@c-s.fr>,
 linuxppc-dev@lists.ozlabs.org
References: <1587790194.w180xsw5be.astroid@bobo.none>
 <9371cac5-20bb-0552-2609-0d537f41fecd@c-s.fr>
In-Reply-To: <9371cac5-20bb-0552-2609-0d537f41fecd@c-s.fr>
MIME-Version: 1.0
Message-Id: <1587810370.tg8ym9yjpc.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of April 25, 2020 5:47 pm:
>=20
>=20
> Le 25/04/2020 =C3=A0 07:22, Nicholas Piggin a =C3=A9crit=C2=A0:
>> As noted in the 'scv' thread, powerpc's vdso calling convention does not
>> match the C ELF ABI calling convention (or the proposed scv convention).
>> I think we could implement a new ABI by basically duplicating function
>> entry points with different names.
>=20
> I think doing this is a real good idea.
>=20
> I've been working at porting powerpc VDSO to the GENERIC C VDSO, and the=20
> main pitfall has been that our vdso calling convention is not compatible=20
> with C calling convention, so we have go through an ASM entry/exit.
>=20
> See https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D1714=
69
>=20
> We should kill this error flag return through CR[SO] and get it the=20
> "modern" way like other architectectures implementing the C VDSO: return=20
> 0 when successfull, return -err when failed.

Agreed.

>> The ELF v2 ABI convention would suit it well, because the caller already
>> requires the function address for ctr, so having it in r12 will
>> eliminate the need for address calculation, which suits the vdso data
>> page access.
>>=20
>> Is there a need for ELF v1 specific calls as well, or could those just b=
e
>> deprecated and remain on existing functions or required to use the ELF
>> v2 calls using asm wrappers?
>=20
> What's ELF v1 and ELF v2 ? Is ELF v1 what PPC32 uses ? If so, I'd say=20
> yes, it would be good to have it to avoid going through ASM in the middle=
.

I'm not sure about PPC32. On PPC64, ELFv2 functions must be called with=20
their address in r12 if called at their global entry point. ELFv1 have a=20
function descriptor with call address and TOC in it, caller has to load=20
the TOC if it's global.

The vdso doesn't have TOC, it has one global address (the vdso data=20
page) which it loads by calculating its own address.

The kernel doesn't change the vdso based on whether it's called by a v1=20
or v2 userspace (it doesn't really know itself and would have to export=20
different functions). glibc has a hack to create something:

# define VDSO_IFUNC_RET(value)                           \
  ({                                                     \
    static Elf64_FuncDesc vdso_opd =3D { .fd_toc =3D ~0x0 }; \
    vdso_opd.fd_func =3D (Elf64_Addr)value;                \
    &vdso_opd;                                           \
  })

If we could make something which links more like any other dso with
ELFv1, that would be good. Otherwise I think v2 is preferable so it=20
doesn't have to calculate its own address.

>> Is there a good reason for the system call fallback to go in the vdso
>> function rather than have the caller handle it?
>=20
> I've seen at least one while porting powerpc to the C VDSO: arguments=20
> toward VDSO functions are in volatile registers. If the caller has to=20
> call the fallback by itself, it has to save them before calling the=20
> VDSO, allthought in 99% of cases it won't use them again. With the=20
> fallback called by the VDSO itself, the arguments are still hot in=20
> volatile registers and ready for calling the fallback. That make it very=20
> easy to call them, see patch 5 in the series=20
> (https://patchwork.ozlabs.org/project/linuxppc-dev/patch/59bea35725ab4cef=
c67a678577da8b3ab7771af5.1587401492.git.christophe.leroy@c-s.fr/)

I see. Well the kernel can probably patch in sc or scv depending on=20
which is supported, so we could keep the automatic fallback.

Thanks,
Nick
