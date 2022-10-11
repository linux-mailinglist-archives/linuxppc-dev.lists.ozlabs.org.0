Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AB55FAF68
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 11:36:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmrHy4rtkz3dtS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 20:35:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QHRdOdpL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmrH03xf9z3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 20:35:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QHRdOdpL;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MmrGv4NDMz4x1F;
	Tue, 11 Oct 2022 20:35:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665480908;
	bh=YwJdh7W1HQe11kjs4IuDI2P8WyC3aa+tzh5fvsTHBJg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QHRdOdpL55OfQgDe93lCrQyGdvlBgT1zOJ+wbYonQwr6f9VPaZsete2c9ULsliKFp
	 FCANFGKxDQTOO7TkS0Ew3NvBKyuahu5JOKM5Bda91bIip7yJMQ0cdwh6BcNeaatTSC
	 fP4ZiAzrO42/pDcYy6YI1lBNJ3jYHp39RWNnySCJJVt1NhR7c5Dbh2n8dIm0y5ODD9
	 OSY3WSr8PUyYWq3OdPl898wN9myovqaCvteeXbn3myg7KKeChqmht1X9TI3tf2ZZId
	 TsC2PZMEDn0V213B1icKeK+SIF+KbO22/yUVkJsxwSubd/DFaEmW/zn5h+apxJYTjy
	 WkXYYSnW4UVqg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
In-Reply-To: <Y0TbfObFu2YRDm0I@zx2c4.com>
References: <87edvhntv0.fsf@mpe.ellerman.id.au> <Y0RxpSFyn9m68zIb@zx2c4.com>
 <Y0R6fcvgGA858TQA@zx2c4.com> <Y0ScAhqysKK6Hrks@zx2c4.com>
 <d402a6a0a11d84906ecba3909f4c8f880298dc0f.camel@linux.ibm.com>
 <Y0S1DxwKCm0aVQjT@zx2c4.com> <877d17nngr.fsf@mpe.ellerman.id.au>
 <Y0TbfObFu2YRDm0I@zx2c4.com>
Date: Tue, 11 Oct 2022 20:34:56 +1100
Message-ID: <871qreog8v.fsf@mpe.ellerman.id.au>
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
Cc: david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, linux@roeck-us.net, nathanl@linux.ibm.com, Andrew Donnellan <ajd@linux.ibm.com>, ye.xingchen@zte.com.cn, npiggin@gmail.com, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:
> On Tue, Oct 11, 2022 at 12:44:20PM +1100, Michael Ellerman wrote:
>> "Jason A. Donenfeld" <Jason@zx2c4.com> writes:
>> > Hi Andrew,
>> >
>> > On Tue, Oct 11, 2022 at 11:00:15AM +1100, Andrew Donnellan wrote:
>> >> Thanks for bisecting, this is interesting! Could you provide your
>> >> .config and the environment you're running in? Your reproducer doesn't
>> >> seem to trigger it on my baremetal POWER8 pseries_le_defconfig.
>> >
>> > Sure.
>> >
>> > .config: https://xn--4db.cc/NemFt2Vs (change CONFIG_INITRAMFS_SOURCE)
>> > Toolchain: https://download.wireguard.com/qemu-test/toolchains/20211123/powerpc-linux-musl-cross.tgz
>> >
>> > You can also just run:
>> >
>> >   ARCH=powerpc make -C tools/testing/selftests/wireguard/qemu -j$(nproc)
>> >
>> > And that'll assemble the whole thing.
>> 
>> I tried that :)
>> 
>> What host OS are you running that on?
>> 
>> I get:
>> 
>>   mkdir -p /scratch/michael/linus/tools/testing/selftests/wireguard/qemu/build/powerpc
>>   powerpc-linux-musl-gcc -o /scratch/michael/linus/tools/testing/selftests/wireguard/qemu/build/powerpc/init -O3 -pipe  -std=gnu11 init.c
>>   /scratch/michael/linus/tools/testing/selftests/wireguard/qemu/build/powerpc/powerpc-linux-musl-cross/bin/../lib/gcc/powerpc-linux-musl/11.2.1/../../../../powerpc-linux-musl/bin/ld: cannot find Scrt1.o: No such file or directory
>>   /scratch/michael/linus/tools/testing/selftests/wireguard/qemu/build/powerpc/powerpc-linux-musl-cross/bin/../lib/gcc/powerpc-linux-musl/11.2.1/../../../../powerpc-linux-musl/bin/ld: cannot find crti.o: No such file or directory
>>   /scratch/michael/linus/tools/testing/selftests/wireguard/qemu/build/powerpc/powerpc-linux-musl-cross/bin/../lib/gcc/powerpc-linux-musl/11.2.1/../../../../powerpc-linux-musl/bin/ld: cannot find crtbeginS.o: No such file or directory
>>   /scratch/michael/linus/tools/testing/selftests/wireguard/qemu/build/powerpc/powerpc-linux-musl-cross/bin/../lib/gcc/powerpc-linux-musl/11.2.1/../../../../powerpc-linux-musl/bin/ld: cannot find -lgcc
>>   /scratch/michael/linus/tools/testing/selftests/wireguard/qemu/build/powerpc/powerpc-linux-musl-cross/bin/../lib/gcc/powerpc-linux-musl/11.2.1/../../../../powerpc-linux-musl/bin/ld: cannot find -lgcc
>>   collect2: error: ld returned 1 exit status
>
> Here's what happened:
>
> - You started the thing and the kernel compile complained about an
>   unclean tree.
> - You ran mrproper.
> - You tried to run the thing again.
>
> amirite?

I think so yeah. I tried it on 3 different machines so I'm not sure
exactly what I did where, but I definitely ran mrproper on one of them.

> If so, what happened is that mrproper deleted the .o files from the
> toolchain. Solution:
>
>   ARCH=powerpc make -C tools/testing/selftests/wireguard/qemu -j$(nproc) clean
>   ARCH=powerpc make -C tools/testing/selftests/wireguard/qemu -j$(nproc)
>
> Let me know how that goes.

Yep that works thanks.

And I see the iperf failure. Though I still can't see what the bug is,
but hopefully if I stare at it longer I'll work it out.

cheers
