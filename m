Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F931E94D3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 02:59:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ZKhP2yWTzDqly
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 10:59:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.22; helo=mail2.protonmail.ch;
 envelope-from=skirmisher@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=l6+CKNqW; 
 dkim-atps=neutral
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ZKdw61ntzDqkR
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 May 2020 10:57:21 +1000 (AEST)
Date: Sun, 31 May 2020 00:57:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1590886636;
 bh=ODFUmKTqUnFad/cRgNMMBXAJHE0Nr41/obQ0vWTk2po=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=l6+CKNqWA5SNOsmyP53VmmFey32ANC+5Lq15WhBiIJs72xA3UfIQ9mO2byvbPXZPk
 kIma1DNJPGa3KcDpBYB93xg3LxPrJ4dUC0Dd46UsnKjnHAWT5YIt2Ig70bFiofjaRR
 NpljhX8Ly8tmfGo0+3QWtd8aRJyIfa1OI2b/5ecg=
To: Segher Boessenkool <segher@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org
From: Will Springer <skirmisher@protonmail.com>
Subject: Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <2956705.fEcJ0Lxnt5@sheen>
In-Reply-To: <20200530192212.GG31009@gate.crashing.org>
References: <2047231.C4sosBPzcN@sheen>
 <20200530192212.GG31009@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Will Springer <skirmisher@protonmail.com>
Cc: libc-alpha@sourceware.org, eery@paperfox.es, daniel@octaforge.org,
 musl@lists.openwall.com, binutils@sourceware.org, libc-dev@lists.llvm.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Saturday, May 30, 2020 12:22:12 PM PDT Segher Boessenkool wrote:
> The original sysv PowerPC supplement
> http://refspecs.linux-foundation.org/elf/elfspec_ppc.pdf
> supports LE as well, and most powerpcle ports use that.  But, the
> big-endian Linux ABI differs in quite a few places, and it of course
> makes a lot better sense if powerpcle-linux follows that.

Right, I should have clarified I was talking about Linux ABIs=20
specifically.

> What patches did you need?  I regularly build >30 cross compilers (on
> both BE and LE hosts; I haven't used 32-bit hosts for a long time, but
> in the past those worked fine as well).  I also cross-built
> powerpcle-linux-gcc quite a few times (from powerpc64le, from powerpc64,
> from various x86).

There was just an assumption that LE =3D=3D powerpc64le in libgo, spotted b=
y=20
q66 (daniel@ on the CC). I just pushed the patch to [1].

> Almost no project that used 32-bit PowerPC in LE mode has sent patches
> to the upstreams.

Right, but I have heard concerns from at least one person familiar with=20
the ppc kernel about breaking existing users of this arch-endianness=20
combo, if any. It seems likely that none of those use upstream, though ^^;

> The ABI says long longs are passed in the same order in registers as it
> would be in memory; so the high part and the low part are swapped
> between BE and LE.  Which registers make up a pair is exactly the same
> between the two.  (You can verify this with an existing powerpcle-*
> compiler, too; I did, and we implement it correctly as far as I can
> see).

I'll give it a closer look. This is my first time poking at this sort of=20
thing in depth, so excuse my unfamiliarity!

> A huge factor in having good GCC support for powerpcle-linux (or
> anything else) is someone needs to regularly test it, and share test
> results with us (via gcc-testresults@).  Hint hint hint :-)
>=20
> That way we know it is in good shape, know when we are regressing it,
> know there is interest in it.

Once I have more of a bootstrapped userland than a barely-functional=20
cross chroot, I'll get back to you on that :)
=20
> gl;hf,
>=20
>=20
> Segher

Thanks,
Will [she/her]

[1]: https://github.com/Skirmisher/void-packages/blob/master/srcpkgs/gcc/pa=
tches/libgo-ppcle.patch




