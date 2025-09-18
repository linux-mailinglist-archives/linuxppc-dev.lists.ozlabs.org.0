Return-Path: <linuxppc-dev+bounces-12428-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D35D1B8AA3D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 18:49:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSz432lS8z3ccV;
	Sat, 20 Sep 2025 02:49:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=23.83.208.52 arc.chain=mailchannels.net
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758219065;
	cv=pass; b=oO6kBx2T/FOAppu9bIxqCGJrGQRFPyjoHGhsKv36zAb7s0R1oFtSFyvYH/WAA8Nw6ey0EY5tCtK9ecUoi00iN/tapZVXuuqkMD7Y+d/DqwY5qXNY5ICuwNo+ATyI/Z/th9O8niN+GOj2pFjl+dIOzqEO/9b5p7AAvkIeoiicEE397HVbOtFnf5dJvtLeXGzwMZYK4kNWnuEZeAr4zKMLpjd2ZCkqcab6LdaqRVGqPM3Jb2ajgMzeJq8xxuw1r52/izfBm97i4M5P6S0PS4SaexBG+nwcwrqiDjvKRbh17jZgXcWWN3SEBp69HooQleoyYaJdtilKlVTa0xlbDwXwkg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758219065; c=relaxed/relaxed;
	bh=vxziR2/s/e3N4yQXhZx/LndwgXceRToeiW89frogJ9s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EGmij7kVEXnbqoBqx1tuhezWBevSI7V5Fh470HAlbX3Ufo0uVZuX0DoV3vfTTN0tZi30GLbSvqaJ1AurX8KnHYpdcsnPOzV9Y9QwIJC3MhS2SGwsfGCnP3LtnodHobCfzR5OBY2htzidHPcz2zoXze6n+9SjpwPXWWFNbghsIED4oudQHzAfHMoKUuZxGQgXKDx2v70a2K65Mw3L6vQyruUq9mYY+uUnrQyz0tgtlYhtqF+Ffza2qEnnqywSrib2Bc7ZYNsoPMBCVNuUAM9ZeX1tCm11qiVEc2xdo08qJPj4GM73NajKS9HhwVO/P8EBu7V2+rh8uWR/tiTcEGoyVQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=landley.net; dkim=pass (2048-bit key; unprotected) header.d=landley.net header.i=@landley.net header.a=rsa-sha256 header.s=dreamhost header.b=Qhv8mBXU; dkim-atps=neutral; spf=pass (client-ip=23.83.208.52; helo=duck.apple.relay.mailchannels.net; envelope-from=rob@landley.net; receiver=lists.ozlabs.org) smtp.mailfrom=landley.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=landley.net header.i=@landley.net header.a=rsa-sha256 header.s=dreamhost header.b=Qhv8mBXU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=landley.net (client-ip=23.83.208.52; helo=duck.apple.relay.mailchannels.net; envelope-from=rob@landley.net; receiver=lists.ozlabs.org)
Received: from duck.apple.relay.mailchannels.net (duck.apple.relay.mailchannels.net [23.83.208.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSNx06DfJz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 04:10:59 +1000 (AEST)
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 8A8537C2F4D;
	Thu, 18 Sep 2025 18:10:55 +0000 (UTC)
Received: from pdx1-sub0-mail-a308.dreamhost.com (100-110-178-205.trex-nlb.outbound.svc.cluster.local [100.110.178.205])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8DAEE7C2D63;
	Thu, 18 Sep 2025 18:10:54 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1758219055; a=rsa-sha256;
	cv=none;
	b=1ph6M5I5y5sWvnXj5jn59suy93KcaDDRb2w7X8r4+iej7jH0fol3tO20Xqt5phRCyrHaC4
	4W+Y2aBCAF4iteUKc4VUR5CQiMvYjgL5uhq5vQvNdQC9t7zDpMhcCgp8L/heuG6efQSov/
	QNJDCk/iml7Dr1n4hU+sMAFjx7uxx/IW37FPAq43xzo/5cu+hqdvIYv0Lv/RAbjvTK12J0
	mRS8aqHf8+TUnHZcvIwBwpnUWJI85+TPclDAnEi86zffDLwlPdSXiuC3sdGgXgLaW6XF2Y
	MmHxF5oonMnClShZb9p7wEOCmBYqbYN42aNsomEX4cyheyQnO0VXxGxccz7H0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1758219055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=vxziR2/s/e3N4yQXhZx/LndwgXceRToeiW89frogJ9s=;
	b=CZbXHCG9im95BJsDWSigIrXa4ZcXpl5lAKwkpFVFsDil1EWcE785KQjLHR/Cv5ZnFptLFD
	KCKyKvllMBlvq6YMj/kKfpyPaIaeIO6GyaSF6HxAnO3cUJzP6vDtjrOrTGTxIgL4hQwJcQ
	oPU527pxFQJhEL0TdQwBV5+OUmrJUvs1DuscioFrviEjpmd8DXo6dttVleQ+Z/G9d6y5Ii
	hBHTXtztw/0R9YSXMadpA0flmjeP8ok1/v10PuxLmJOVjQbyeBJFLyEGkrGSgHprq7AQ6P
	xtxNmG8lZzP9tSATuuKahIoZ4n4tsC7f2Q0jR8tVQTjrU1x/xHt+FaOzgy+dZg==
ARC-Authentication-Results: i=1;
	rspamd-54786f95c7-9cr5r;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Good
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-White-Trail: 5a5aa12f3147db95_1758219055459_2628947039
X-MC-Loop-Signature: 1758219055459:3129051173
X-MC-Ingress-Time: 1758219055458
Received: from pdx1-sub0-mail-a308.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.110.178.205 (trex/7.1.3);
	Thu, 18 Sep 2025 18:10:55 +0000
Received: from [192.168.88.7] (unknown [209.81.127.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a308.dreamhost.com (Postfix) with ESMTPSA id 4cSNwq2G6bz4j;
	Thu, 18 Sep 2025 11:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1758219054;
	bh=vxziR2/s/e3N4yQXhZx/LndwgXceRToeiW89frogJ9s=;
	h=Date:From:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	b=Qhv8mBXUwnZ4SRIqmQoiPIGK1pMFJ51QZF2epJXFATr5JNb+B5ZFlThgl9WHSxtig
	 ZKjEJtm4uOiF8mAEe10j2SyuLjy2W8CYtlC95qn2NemRa3RPlr/8SYIz+BZ5JMLgcy
	 VU4LdMJe5SvFxl+33ue1w9Ka9bL0FZyIIkGjCcKOR9MhMWOjJHc2tjqPUidllhpPGq
	 FSBJAe0G1sFuARPUoHSP14dFwM5dcPWoocu49KHV9Rc7lXHLf6mAzFeVXutu16nB3n
	 6eOqk+JKda2423m1ML3/ScvC4Hvje1JuS3SjDNhDzRzjEfO7/WM2YNYqOLrpgDza2K
	 s1aY/NqZU98fg==
Message-ID: <94023988-8498-4070-bdb7-6758dbe4b91d@landley.net>
Date: Thu, 18 Sep 2025 13:10:22 -0500
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 00/62] initrd: remove classic initrd support
To: Andy Lutomirski <luto@amacapital.net>
Cc: Askar Safin <safinaskar@zohomail.com>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Aleksa Sarai <cyphar@cyphar.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>,
 Alexander Graf <graf@amazon.com>, Lennart Poettering <mzxreary@0pointer.de>,
 linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org, Ingo Molnar
 <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, devicetree@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>,
 Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>,
 patches@lists.linux.dev
References: <20250912223937.3735076-1-safinaskar@zohomail.com>
 <0342fbda-9901-4293-afa7-ba6085eb1688@landley.net>
 <CALCETrXHxOkHoS+0zhvc4cfpZqJ0wpfQUDnXW-A-qyQkqur-DQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CALCETrXHxOkHoS+0zhvc4cfpZqJ0wpfQUDnXW-A-qyQkqur-DQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.4 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	SPF_PASS,URI_DOTEDU autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [209.81.127.98 listed in zen.spamhaus.org]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [23.83.208.52 listed in list.dnswl.org]
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.0 SPF_PASS SPF: sender matches SPF record
	*  0.0 ARC_VALID Message has a valid ARC signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 ARC_SIGNED Message has a ARC signature
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	*  0.0 RCVD_IN_MSPIKE_H4 RBL: Very Good reputation (+4)
	*      [23.83.208.52 listed in wl.mailspike.net]
	*  0.0 RCVD_IN_MSPIKE_WL Mailspike good senders
	*  0.0 URI_DOTEDU Has .edu URI
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 9/17/25 13:00, Andy Lutomirski wrote:
> On Mon, Sep 15, 2025 at 10:09 AM Rob Landley <rob@landley.net> wrote:
> 
>> While you're at it, could you fix static/builtin initramfs so PID 1 has
>> a valid stdin/stdout/stderr?
>>
>> A static initramfs won't create /dev/console if the embedded initramfs
>> image doesn't contain it, which a non-root build can't mknod, so the
>> kernel plumbing won't see it dev in the directory we point it at unless
>> we build with root access.
> 
> I have no current insight as to whether there's a kernel issue here,

They fixed the behavior in one codepath. They left it broken in the 
other codepath. The kernel's behavior is inconsistent.

Look:

$ mkdir sub; cc --static -xc - <<<'int main() {puts("hello\n");if 
(fork()) reboot(0x01234567); for(;;);}' -o sub/init
$ (cd sub; cpio -o -H newc <<<init | gzip) > sub.cpio.gz
$ make allnoconfig KCONFIG_ALLCONFIG=<(tr ' ' \\n <<<'PANIC_TIMEOUT=1 
RD_GZIP BINFMT_ELF BLK_DEV_INITRD EARLY_PRINTK 64BIT SERIAL_8250 
SERIAL_8250_CONSOLE UNWINDER_FRAME_POINTER' | sed 
's/^/CONFIG_/;/=/!s/$/=y/')
$ make -j $(nproc)
$ qemu-system-x86_64 -kernel arch/x86/boot/bzImage -nographic -no-reboot 
-append console=ttyS0 -initrd sub.cpio.gz

You get a "hello" output near the end there. (You can add "quiet" to the 
-append but given that qemu can't NOT output its bios spam there's not 
much point.)

Now add INITRAMFS_SOURCE="sub" to the config and remove -initrd 
sub.cpio.gz from the qemu invocation:

$ make clean allnoconfig KCONFIG_ALLCONFIG=<(tr ' ' \\n 
<<<'PANIC_TIMEOUT=1 RD_GZIP BINFMT_ELF BLK_DEV_INITRD EARLY_PRINTK 64BIT 
SERIAL_8250 SERIAL_8250_CONSOLE UNWINDER_FRAME_POINTER 
INITRAMFS_SOURCE="sub"' | sed 's/^/CONFIG_/;/=/!s/$/=y/')
$ make -j $(nproc)
$ qemu-system-x86_64 -kernel arch/x86/boot/bzImage -nographic -no-reboot 
-append 'console=ttyS0'

No "hello" output, but it DOES shut down cleanly instead of giving you a 
panic trace so you know it ran the init binary.

All that changed was statically linking the initramfs instead of feeding 
it in through the initrd mechanism: the kernel behaves differently in 
those two codepaths, as I explained in the message you replied to.

(The above instructions assume an x86-64 host toolchain, poke me if you 
want arm64 instead...)

> but why are you trying to put actual device nodes in an actual
> filesystem as part of a build process?

I'm not. Doing that would require root access on the build machine to 
mknod in "sub" directory above. I build new images WITHOUT root access 
on the host.

There used to be a way to feed a the kernel config a text file listing 
what to make in the cpio file instead of just pointing it at a 
directory, and my old Aboriginal Linux build used that mechanism 
(generating such a file by hand, borrowing the kernel infrastructure but 
driving it manually) 15 years ago:

https://landley.net/aboriginal/about.html

https://github.com/landley/aboriginal/blob/master/sources/functions.sh#L403

But kernel commit 469e87e89fd6 broke that mechanism because somebody 
dunning-krugered it away ("I don't understand why we need this therefore 
nobody needs it"). I had a patch to unbreak it for a while:

https://landley.net/bin/mkroot/0.8.10/linux-patches/0011-gen_init_cpio-regression.patch

But as with so many patches, lkml wasn't interested. (I mostly post them 
so when copyright trolls try to rattle sabers I can point to an lkml web 
archive entry that got ignored, and explain precisely HOW much bad PR 
they're in for when they proceed.)

And again: you ONLY need this for static initramfs. Dynamic initramfs 
has code create /dev/console (at boot time, not build time):

https://github.com/torvalds/linux/blob/v6.16/init/noinitramfs.c#L27

That code ONLY gets called for the external initrd loader, it does NOT 
get called when a static initramfs image built into the kernel has a 
runnable /init. This is an inconsistency in the kernel behavior, which 
is what I'm objecting to.

> It's extremely straightforward
> to emit devices nodes in cpio format, and IMO it's far *more*
> straightforward to do that than to make a whole directory, try to get
> all the modes right, and cpio it up.

You mean like commit 595a22acee26 from 2017?

> I wrote an absolutely trivial tool for this several years ago:
> 
> https://github.com/amluto/virtme/blob/master/virtme/cpiowriter.py

Let's see, I wrote the initramfs documentation in 2005:

https://lwn.net/Articles/157676/

Was already correcting kernel developers on how it actually worked 
(rather than theoretically worked) in 2006:

https://lkml.iu.edu/hypermail//linux/kernel/0603.2/2760.html

I added tmpfs support to it in 2013 (because nobody else had bothered 
for EIGHT YEARS):

https://lkml.iu.edu/hypermail/linux/kernel/1306.3/04204.html

I've maintained my own cpio implementation in toybox for over a decade:

https://github.com/landley/toybox/commit/a2d558151a63

The successor to aboriginal (above) is a 400 line bash script that 
builds a dozen archtectures that each boot to a shell prompt in qemu:

https://github.com/landley/toybox/blob/master/mkroot/mkroot.sh
https://landley.net/bin/mkroot/latest/

With automated regression test infrastructure to boot them all under 
qemu and confirm that it runs, the clocks are set right, the network 
works, and it can read from -hda:

https://github.com/landley/toybox/blob/master/mkroot/testroot.sh

So yes I _can_ create my own bespoke C program to modify the file in 
arbitrary ways, I have my reasons not to do that, and have thought about 
them for a while now.

> it would be barely more complicated to strip the trailer off an cpio
> file from some other source, add some device nodes, and stick the
> trailer back on.

So you're unaware that the kernel accepts concatenated archives, and you 
can just cat together two cpio.gz files and they'll extract. (In gzip 
anyway, I haven't tested the other compression formats. That's why I 
needed to do https://github.com/landley/toybox/commit/dafb9211c777 and 
95a15d238120 by the way.)

The problem is there's no portable existing userspace tool to create a 
cpio archive from non-filesystem data. Partly because there WAS a 
mechanism built into the kernel... until that guy broke it in 2020. When 
I'm making a squashfs I've got the -p option (presumably modeled on what 
the kernel used to do before it broke), but the host cpio hasn't got a 
way to specify that and adding my own bespoke format to toybox... I'm 
still trying to get 
https://lists.gnu.org/archive/html/coreutils/2023-08/msg00009.html into 
coreutils. (Alas lkml isn't the only 30 year old community that's gotten 
stiff and hard of hearing.)

I could emit cpio contents with xxd -r from a HERE document hexdump or 
something to append to the generated file, but xxd isn't installed by 
default on debian and echo \x is WAY ugly, and "here's a giant hex dump 
you're not expected to understand" isn't really something I want to add 
to an otherwise understandable build. Writing, building, and running my 
own bespoke tool in C to do it isn't really an improvement over the hexdump.

The kernel ALMOST already does this. The code just needs to be 
refactored a bit, preferably so there aren't two codepaths each with 
half the testing.

> But it's also really, really, really easy to emit an
> entire, functioning cpio-formatted initramfs from plain user code with
> no filesystem manipulation at all.  This also makes that portion of
> the build reproducible, which is worth quite a bit IMO.

Sigh. When I started working on reproducible builds they weren't called 
that yet, but I don't think digging for more links would help here. I 
did do a rollup of what I'm trying to accomplish 5 years ago though 
http://lists.landley.net/pipermail/toybox-landley.net/2020-July/011898.html 
and long long ago, there was https://landley.net/aboriginal/history.html 
and...

Query: is your "plain user code" built with "cc"? Do you reliably have a 
"cc" link, or do you need to explicitly say "gcc" or "clang"? The kernel 
needs to do the latter for some reason, and my patch to GET to the 
kernel to at least _try_ "cc" before falling back to the others was 
explicitly rejected...

> --Andy

Rob

