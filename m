Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2FB4ACE82
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 02:58:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jt5lF0tfSz3bY6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 12:58:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=heyquark.com (client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=ash@heyquark.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 504 seconds by postgrey-1.36 at boromir;
 Tue, 08 Feb 2022 10:43:21 AEDT
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jt2lF3h5mz2xKK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 10:43:20 +1100 (AEDT)
Received: from relay12.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::232])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 2E92FCDB92
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Feb 2022 23:34:58 +0000 (UTC)
Received: (Authenticated sender: ash@heyquark.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 02369200002;
 Mon,  7 Feb 2022 23:34:32 +0000 (UTC)
Message-ID: <0020d47c-0e23-822c-33f5-ccb7ea4c1072@heyquark.com>
Date: Tue, 8 Feb 2022 10:34:29 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org
From: Ash Logan <ash@heyquark.com>
Subject: [RFC] Upstreaming Linux for Nintendo Wii U
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 08 Feb 2022 12:58:12 +1100
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
Cc: linkmauve@linkmauve.fr, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linuxppc-dev@lists.ozlabs.org, j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

I'm the lead dev on a downstream kernel with support for the Wii U[1],
Nintendo's previous-gen game console. You might have seen Emmanuel
<linkmauve@linkmauve.fr> submitting some of the more self-contained
drivers recently[2][3]. I've gotten to the point where I'd like to look
at upstreaming the platform. Since we need to refactor all the patches
for upstreaming anyway, I thought it would be good to talk to the
experts ahead of time ;)

Some quick details about the platform:
- Tri-core PowerPC "Espresso" (750CL) @ 1.24GHz
- 2GiB DDR3-1600 (and a little over 32MiB of SRAM)
- "Latte" proprietary SoC with USB, SDIO, SATA, crypto, ARM9
coprocessor, Radeon R7xx GPU
- Curiously, the entire graphics pipeline from the original Wii, usually
powered off

The bulk of the interesting work for Linux is in the SoC, which is
pretty similar to the original Wii's in layout (we expect to share a lot
of drivers), with the addition of some more modern blocks.

The state of the downstream work:
- Basic platform init works, "easy" drivers like SDIO, SATA, accelerated
cryptography, etc. all here - some are even upstreamed already.
- Bootloader duties are performed by linux-loader[4], a small firmware
for the ARM coprocessor that idles once Linux starts.
- linux-loader handles a dtbImage right now and has a hardcoded memory
area to pass commandline parameters, parsed from a config file. I don't
expect that to be acceptable, eventually I'd like to move it to loading
vmlinuz directly and pulling the dtb off the SD card, similar to the
Raspberry Pi. Alternatively, petitboot, but kexec doesn't seem to work
right now.
- Linux itself runs tolerably (though given the hardware it should be
faster), with framebuffer graphics and basic support for most hardware,
with the notable exceptions of the WiFi card and the GPU.
- No SMP - will cover this later.

That's about the state of things. I'm not sure how much is or isn't
upstreamable, but right now I'm only thinking about getting the basic
platform support up and some core hardware. On that front, there are a
few decisions that need to be made and help that needs to be had, which
is where I hope you all can give some insight:

- USB only works with patches to the USB core[5] that appear to have
failed upstreaming before[6]. I don't really understand these well
enough to say what particular hardware restriction they're working
around. I do know that there's a curious restriction on DMA addressing
where most SoC blocks (including USB) can't see the SRAM at address 0,
but we worked around this using reserved-mem in the devicetree. Almost
all of the peripherals on Wii U are connected over USB, so having a
working stack is pretty important.
- The Radeon, despite being a mostly standard card, has its GPUF0MMReg
area mapped into the SoC's mmio, with no PCI bus in sight. The Linux
drivers (radeon, too old for amdgpu) seem to expect PCI, so some pretty
extensive patching would be needed to get that moving - not to mention
things like the proprietary HDMI encoder, which seems similar to the
PS4's[7]. Downstream, we have an fbdev driver, which I obviously don't
expect to get accepted.
- Both of those issues together means I'm not convinced an initial port
would have any viable output device. I would like to fix USB, though
barring that we could use a flat framebuffer that linux-loader leaves
enabled.
- Right now I've made a new platform (like ps3) rather than joining the
GameCube and Wii in embedded6xx, since that is marked as BROKEN_ON_SMP.
The Wii U is a 3-core system, though a CPU bug[8] prevents existing
userspaces working with it. Bit of a "cross that bridge when we get
there" situation, though I'm reluctant to prevent that possibility by
using a BROKEN_ON_SMP platform.
- Like the Wii before it, the Wii U has a small amount of RAM at address
zero, a gap, then a large amount of RAM at a higher address. Instead of
the "map everything and reserve the gap" approach of the Wii, we loop
over each memblock and map only true RAM[9]. This seems to work, but as
far as I can tell is unique amongst powerpc32 platforms, so it's worth
pointing out. (Note: I've been told this doesn't work anymore after some
KUAP changes[10], so this point might be moot; haven't investigated)
- Due to the aformentioned DMA restrictions and possibly a fatal
bytemasking bug on uncached mappings[11], I have been wondering if it'd
be better to just give up on the SRAM at address 0 altogether and use it
as VRAM or something, loading the kernel at a higher address.
- Like the Wii, the Wii U also takes a bit of a loose approach to cache
coherency, and has several SoC peripherals with big-endian registers,
requiring driver patching. USB already has devicetree quirks, but others
require more drastic measures. I expect we'll take that on a
driver-by-driver basis.

In terms of platform bringup, the key issue is whether to be embedded6xx
or not and what output device to use. Beyond that it's just things like
IRQ controller drivers, should be pretty straightforward. I think on our
end, we'll start rebasing to 5.15 (LTS) and start sending patches from
there. I know getting closer to HEAD is preferable, this project has
just moved very slowly in the past and being on LTS has been a lifesaver.

Please let me know your thoughts, suggestions and questions, I'm new to
this and want to make sure we're sending you the best submissions we can.

Thanks,
Ash
https://heyquark.com/aboutme

[1] https://linux-wiiu.org
[2] https://lkml.org/lkml/2021/5/19/391
[3] https://lkml.org/lkml/2021/10/14/1150
[4] https://gitlab.com/linux-wiiu/linux-loader
[5] https://gitlab.com/linux-wiiu/linux-wiiu/-/merge_requests/8/diffs
[6] https://lists.ozlabs.org/pipermail/linuxppc-dev/2010-March/080705.html
[7]
https://github.com/eeply/ps4-linux/commit/b2e54fcc05d4ed77bcea4ba3f3bdc33cb3b318e0
[8]
https://fail0verflow.com/blog/2014/console-hacking-2013-omake/#espresso
(3rd paragraph, "In fact, the SMPization of the 750 in the Espresso is
not perfect...")
[9]
https://gitlab.com/linux-wiiu/linux-wiiu/-/blob/fabcfd93d47ba0d2105eec7f3b5d7785f2a69445/arch/powerpc/mm/pgtable_32.c#L273-L282
[10] https://lkml.org/lkml/2021/6/3/204
[11] https://bugs.dolphin-emu.org/issues/12565
