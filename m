Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D025FAA4B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 03:45:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mmdrn4PMFz3dsq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 12:45:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rN1YKzXr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mmdqs52Jvz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 12:44:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rN1YKzXr;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mmdqn3Tqqz4xG5;
	Tue, 11 Oct 2022 12:44:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665452665;
	bh=JcgseN6nVvpYcTxrehKuNt/A+hJ5EAaSCMGt/sSQt5Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rN1YKzXruDqZkAObCQQi68Obtj2oxtNckBZfXFHzSjcVzAnSOf5BtYjrPb6j+cSm0
	 UGXz9KnGClDBJzr/pdItGSamN2FnB+o5EwIhtzKQI0Hd1/aDB/ZF0SbSh7uD3+eIqW
	 F6kbP4MAq/yO3tp49PxYjRdUtp0vZchgEkFTBDG8FhF/UZfTiGdNCeBVeUnXtlpUsU
	 Oe3MxobdNCDwLgz8AVoW+hDPJhU+FVlUthqsGUq8KBdrKCPmhXzCirZPMNgr2WX58Z
	 0qACoQtplVRuNd8rgk5N6ZDN5y8ZOu0h2k+eqxyfy+ZMB1mJvE0h1FLqcyhQIXZtq+
	 yqX+pBxZMPEaQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Andrew Donnellan
 <ajd@linux.ibm.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
In-Reply-To: <Y0S1DxwKCm0aVQjT@zx2c4.com>
References: <87edvhntv0.fsf@mpe.ellerman.id.au> <Y0RxpSFyn9m68zIb@zx2c4.com>
 <Y0R6fcvgGA858TQA@zx2c4.com> <Y0ScAhqysKK6Hrks@zx2c4.com>
 <d402a6a0a11d84906ecba3909f4c8f880298dc0f.camel@linux.ibm.com>
 <Y0S1DxwKCm0aVQjT@zx2c4.com>
Date: Tue, 11 Oct 2022 12:44:20 +1100
Message-ID: <877d17nngr.fsf@mpe.ellerman.id.au>
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
Cc: david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, linux@roeck-us.net, nathanl@linux.ibm.com, ye.xingchen@zte.com.cn, npiggin@gmail.com, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:
> Hi Andrew,
>
> On Tue, Oct 11, 2022 at 11:00:15AM +1100, Andrew Donnellan wrote:
>> Thanks for bisecting, this is interesting! Could you provide your
>> .config and the environment you're running in? Your reproducer doesn't
>> seem to trigger it on my baremetal POWER8 pseries_le_defconfig.
>
> Sure.
>
> .config: https://xn--4db.cc/NemFt2Vs (change CONFIG_INITRAMFS_SOURCE)
> Toolchain: https://download.wireguard.com/qemu-test/toolchains/20211123/powerpc-linux-musl-cross.tgz
>
> You can also just run:
>
>   ARCH=powerpc make -C tools/testing/selftests/wireguard/qemu -j$(nproc)
>
> And that'll assemble the whole thing.

I tried that :)

What host OS are you running that on?

I get:

  mkdir -p /scratch/michael/linus/tools/testing/selftests/wireguard/qemu/build/powerpc
  powerpc-linux-musl-gcc -o /scratch/michael/linus/tools/testing/selftests/wireguard/qemu/build/powerpc/init -O3 -pipe  -std=gnu11 init.c
  /scratch/michael/linus/tools/testing/selftests/wireguard/qemu/build/powerpc/powerpc-linux-musl-cross/bin/../lib/gcc/powerpc-linux-musl/11.2.1/../../../../powerpc-linux-musl/bin/ld: cannot find Scrt1.o: No such file or directory
  /scratch/michael/linus/tools/testing/selftests/wireguard/qemu/build/powerpc/powerpc-linux-musl-cross/bin/../lib/gcc/powerpc-linux-musl/11.2.1/../../../../powerpc-linux-musl/bin/ld: cannot find crti.o: No such file or directory
  /scratch/michael/linus/tools/testing/selftests/wireguard/qemu/build/powerpc/powerpc-linux-musl-cross/bin/../lib/gcc/powerpc-linux-musl/11.2.1/../../../../powerpc-linux-musl/bin/ld: cannot find crtbeginS.o: No such file or directory
  /scratch/michael/linus/tools/testing/selftests/wireguard/qemu/build/powerpc/powerpc-linux-musl-cross/bin/../lib/gcc/powerpc-linux-musl/11.2.1/../../../../powerpc-linux-musl/bin/ld: cannot find -lgcc
  /scratch/michael/linus/tools/testing/selftests/wireguard/qemu/build/powerpc/powerpc-linux-musl-cross/bin/../lib/gcc/powerpc-linux-musl/11.2.1/../../../../powerpc-linux-musl/bin/ld: cannot find -lgcc
  collect2: error: ld returned 1 exit status

cheers
