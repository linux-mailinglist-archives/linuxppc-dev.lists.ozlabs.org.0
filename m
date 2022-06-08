Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF495542F7D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 13:53:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJ5Ft7255z3bmS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 21:53:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D0RLL4+M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJ5FF5KTPz2xm1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 21:52:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D0RLL4+M;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LJ5F95mFdz4xD9;
	Wed,  8 Jun 2022 21:52:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1654689149;
	bh=4QKXFvqEeDDn2j5NCgfQWE6xDbF9exF4VvXTC9j/Z3k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D0RLL4+M+iSf+tpzYfFR1qiYCNnU/V9sUKLUFMmM9YtcaGG9SDFvUHsHlBCnH+8IR
	 54ZtVItt+iOGgvlxtIXN3SIC2wmWW3vIa8evFCRodsQfA0ldzqVV4CJ2tg+zIphPxp
	 LnJdEjhJa56vU6URdJijTevqL01iaYAZccx9CsCJjwnSfQLbWznkuUn+NCXAdhWt7e
	 KPqSbEVjFb93/9b6b31EhegsW8I8YqG/uVV+jRTslm+BlcKNq2zQNxThPiTUiM95W1
	 k30faQIAEGGoWCzGJ7CqevF0RAZwwBs0J+1qNrUcDvlgCMZRGq1pbUfwtQAGWTQwvT
	 IdP/Pc+BQPl3A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Donald Zickus <dzickus@redhat.com>
Subject: Re: ppc64le bzImage and Build_id elf note
In-Reply-To: <CAK18DXZKs2PNmLndeGYqkPxmrrBR=6ca3bhyYCj=GhyA7dHfAQ@mail.gmail.com>
References: <CAK18DXZKs2PNmLndeGYqkPxmrrBR=6ca3bhyYCj=GhyA7dHfAQ@mail.gmail.com>
Date: Wed, 08 Jun 2022 21:52:25 +1000
Message-ID: <874k0vgyo6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Bruno Goncalves <bgoncalv@redhat.com>, Justin Forbes <jforbes@redhat.com>, linuxppc-dev@lists.ozlabs.org, Daniel Horak <dhorak@redhat.com>, Veronika Kabatova <vkabatov@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Donald Zickus <dzickus@redhat.com> writes:
> Hi Michael,
>
> I am working on two packaging issues with Fedora and CKI that I am hoping
> you can give me some guidance on.
>
> 1 - Fedora has always packaged an eu-strip'd vmlinux file for powerpc.  The
> other arches we support used native compressed images.  I was looking into
> using powerpc's zImage (pseries) binary to remove the powerpc workarounds
> in our rpm spec file.

What's the motivation for using the zImage?

My naive hope was that as more advanced boot loaders become the norm we
could eventually get rid of the zImage.

It's generally a pain to work with, and a bit crufty, it also doesn't
get as much testing as booting the vmlinux, so I'd be a little wary of
switching to it.

There's also multiple zImages (and others), although admittedly for the
platforms that Fedora supports the zImage.pseries should work (I think).

> However, the rpmbuild fails because it can't find a build-id with
> eu-readelf -n zImage.  Sure enough the build-id is found in vmlinux and
> vmlinux.stripped but disappears with vmlinux.stripped.gz.

Looks like other arches use objcopy rather than strip, maybe that's it?

> I had hoped
> arch/powerpc/boot/addnote would stick it back in but it doesn't (I am
> ignorant of how addnote works).

addnote adds some notes that firmware needs to read, it doesn't do
anything else, though maybe it could.

> eu-readelf -n  data
> vmlinux:
>
> Displaying notes found in: .notes
>   Owner                Data size        Description
>   GNU                  0x00000014       NT_GNU_BUILD_ID (unique build ID
> bitstring)
>     Build ID: b4c026d72ead7b4316a221cddb7f2b10d75fb313
>   Linux                0x00000004       func
>    description data: 00 00 00 00
>   Linux                0x00000001       OPEN
>    description data: 00
>   PowerPC              0x00000004       NT_VERSION (version)
>    description data: 01 00 00 00
>
> zImage:
>
> Displaying notes found at file offset 0x00000158 with length 0x0000002c:
>   Owner                Data size        Description
>   PowerPC              0x00000018       Unknown note type: (0x00001275)
>    description data: ff ff ff ff 02 00 00 00 ff ff ff ff ff ff ff ff ff ff
> ff ff 00 00 40 00
>
> Displaying notes found at file offset 0x00000184 with length 0x00000044:
>   Owner                Data size        Description
>   IBM,RPA-Client-[...] 0x00000020       Unknown note type: (0x12759999)
>    description data: 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00 28 00 00
> 00 01 ff ff ff ff 00 00 00 00 00 00 00 01
>
> Is this something that can be addressed?  Or should I/we expect the
> build-id to never make it into the zImage and just continue with our
> current vmlinux process?

Maybe :)

Is it correct for the build-id to be copied into the zImage anyway? It's
a different binary so shouldn't it have a different build-id?

If you have a zImage and a vmlinux with the same build-id isn't that
going to confuse debugging tools?

> 2 - CKI builds kernels using 'make targz-pkg'.  The arches we support
> (x86_64, s390, aarch64) provide compressed binaries to package using
> KBUILD_IMAGE or a specific entry in scripts/package/buildtar.  As a result,
> because powerpc doesn't have a KBUILD_IMAGE variable defined, the script
> builds vmlinx and cp's that to vmlinux-kbuild.  The problem with powerpc is
> that vmlinux for us is huge ( >256MB) and cp'ing that to vmlinux-kbuild
> occupies > 512MB of /boot and our distro runs out of disk space on that
> partition.

Is that just because it has debug info built in? I thought the distro
solution for that was doing split debug info?

> I was hoping to add a patch to arch/powerpc/Makefile that defines
> KBUILD_IMAGE:=$(boot)/zImage (mimicing arch/s390), which I believe would
> solve our problem.  However, that circles back to our first problem above.
>
> Thoughts?  Help?

Happy to try and help, though see my concerns at the top about using zImage.

cheers
