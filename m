Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D23591B89E9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 01:15:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498n1s6nklzDqY1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 09:14:57 +1000 (AEST)
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
 header.s=20161025 header.b=Vn87GL3h; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498my02817zDqcL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 09:11:35 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id hi11so5652950pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 16:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=b1I5VhmS8YlY121R50I9dZXRP0z5VOB+6nzHXeobRZ4=;
 b=Vn87GL3hdeo7q6ppZlZEa/w8RyrReG9X4iuCmVAVk/sWg6KZkFHI1pn/hOlNtAbL7v
 lfscA8xrncfUGRRbwIWd+Ov9VFsBXdQySAnpxn/N51KCmnvUIAyTQ1d+OnnAguxeAyz0
 9u9JEqu5/H1BsRDYuSxRUFpU027aJ8tMvVn5M++YpnW0qktGwxWv233kZ+RtEwW0z7RQ
 Bp8O+pwIxejucCrt6bC9/w/A/W9p4IWeXfgQvH613IPIKsQXbOdjQMx+ebx90emDc03t
 JW7DXCKc3AprUqw2XA24QDXfA7Qza6eEiCdpJcI+mTbdg6pP3WqKBvcwkSYcWn6AZIx4
 Cn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=b1I5VhmS8YlY121R50I9dZXRP0z5VOB+6nzHXeobRZ4=;
 b=EEj88MhtkztduqFFgFH2TC6pdx3f8oRKQnqbQHohHXD+Jjdv6Knix0IPVFvqRBVUsv
 0Kn6CTCnc0CaqN+lqeo/epCQH2hgrZqAcUpsh41H8cU4n4gCkiD5LuDybLIlcGMnM0CM
 vNAxqJXAgFSsVlI0gW5ny2+TMdO8PXjwZ/yCisadXoDI6KlQt3cPO2dEOJRRa9Ujomkr
 qO5B2Oa6XeKTtqxK4C/4+pSF+AuaZ/168de7pzzrxknROWPt6nCmDcujGtmcN1OB1muI
 ER3H8hdM13WoOGab8t1VQc8FKQOpBv6UtlzivkS9hbr5xeCY6Hvo1zzzMjI+o7CXSSrt
 eHmw==
X-Gm-Message-State: AGi0Pub8Rt4Bvac0Fmu2ls0x40wg3q9qMkA5OqbfAqtBhYOQoJzW2TIg
 D+G+7H6N3nEvmlZoDQwQ204=
X-Google-Smtp-Source: APiQypL9z+lErGO3Wv2xONslRLBtES/YBKacmV2UyBDfRuMs50K/d/6Z/lqEOzMwQ8lxDl7Id7383A==
X-Received: by 2002:a17:90a:cb88:: with SMTP id
 a8mr3584852pju.82.1587856293025; 
 Sat, 25 Apr 2020 16:11:33 -0700 (PDT)
Received: from localhost ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id b75sm7598803pjc.23.2020.04.25.16.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2020 16:11:32 -0700 (PDT)
Date: Sun, 26 Apr 2020 09:07:57 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Re: New powerpc vdso calling convention
To: Rich Felker <dalias@libc.org>
References: <1587790194.w180xsw5be.astroid@bobo.none>
 <9371cac5-20bb-0552-2609-0d537f41fecd@c-s.fr>
 <1587810370.tg8ym9yjpc.astroid@bobo.none>
 <20200425162204.GJ11469@brightrain.aerifal.cx>
In-Reply-To: <20200425162204.GJ11469@brightrain.aerifal.cx>
MIME-Version: 1.0
Message-Id: <1587855503.8grsasuwof.astroid@bobo.none>
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

Excerpts from Rich Felker's message of April 26, 2020 2:22 am:
> On Sat, Apr 25, 2020 at 08:56:54PM +1000, Nicholas Piggin wrote:
>> >> The ELF v2 ABI convention would suit it well, because the caller alre=
ady
>> >> requires the function address for ctr, so having it in r12 will
>> >> eliminate the need for address calculation, which suits the vdso data
>> >> page access.
>> >>=20
>> >> Is there a need for ELF v1 specific calls as well, or could those jus=
t be
>> >> deprecated and remain on existing functions or required to use the EL=
F
>> >> v2 calls using asm wrappers?
>> >=20
>> > What's ELF v1 and ELF v2 ? Is ELF v1 what PPC32 uses ? If so, I'd say=20
>> > yes, it would be good to have it to avoid going through ASM in the mid=
dle..
>>=20
>> I'm not sure about PPC32. On PPC64, ELFv2 functions must be called with=20
>> their address in r12 if called at their global entry point. ELFv1 have a=
=20
>> function descriptor with call address and TOC in it, caller has to load=20
>> the TOC if it's global.
>>=20
>> The vdso doesn't have TOC, it has one global address (the vdso data=20
>> page) which it loads by calculating its own address.
>=20
> A function descriptor could be put in the VDSO data page, or as it's
> done now by glibc the vdso linkage code could create it. My leaning is
> to at least have a version of the code that's callable (with the right
> descriptor around it) by v1 binaries, but since musl does not use
> ELFv1 at all we really have no stake in this and I'm fine with
> whatever outcome users of v1 decide on.

I agree, I think it would be good to make it look as much like a normal
function as possible.

>> The kernel doesn't change the vdso based on whether it's called by a v1=20
>> or v2 userspace (it doesn't really know itself and would have to export=20
>> different functions). glibc has a hack to create something:
>=20
> I'm pretty sure it does know because signal invocation has to know
> whether the function pointer points to a descriptor or code. At least
> for FDPIC archs (similar to PPC64 ELFv1 function descriptors) it knows
> and has to know.

It knows on a per-executable basis (by looking at the ELF header). It=20
doesn't know per-system though so we can't patch the vdso accordingly.=20
But we could include both sets of entry points and map in the=20
appropriate one at exec time I think.

>> >> Is there a good reason for the system call fallback to go in the vdso
>> >> function rather than have the caller handle it?
>> >=20
>> > I've seen at least one while porting powerpc to the C VDSO: arguments=20
>> > toward VDSO functions are in volatile registers. If the caller has to=20
>> > call the fallback by itself, it has to save them before calling the=20
>> > VDSO, allthought in 99% of cases it won't use them again. With the=20
>> > fallback called by the VDSO itself, the arguments are still hot in=20
>> > volatile registers and ready for calling the fallback. That make it ve=
ry=20
>> > easy to call them, see patch 5 in the series=20
>> > (https://patchwork.ozlabs.org/project/linuxppc-dev/patch/59bea35725ab4=
cefc67a678577da8b3ab7771af5.1587401492.git.christophe.leroy@c-s.fr/)
>=20
> This is actually a good reason not to spuriously fail and fallback. At
> present musl wouldn't take advantage of it because musl uses the
> fallback path for lazy initialization of the vdso function pointer and
> doesn't special-case the MIPS badness, but if it made a big difference
> we probably could shuffle things around to only do the fallback on
> archs that need it and avoid saving the input arg registers across the
> vdso call.

It's a point for it yes. I don't know if any libc or app would want to=20
instrument it or do special accounting or something for system calls.

Thanks,
Nick
