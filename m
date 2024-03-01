Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A2486D942
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 02:57:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LpW5/pYO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmB6q0Xthz3vdl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 12:57:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LpW5/pYO;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmB6271ptz3cFX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 12:56:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709258201;
	bh=NhRfz0fwuJ8H236qg4bFaUrtGCXiL5HAvS8qdoDbat0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LpW5/pYO8LldIKMgRqt6U0qDh4AiXUXb4qJslTK6WSDSqld+f0YKOXbzZh/OcQX+e
	 c0ozGIIN6gIHWpJmLU1ugkaIU7EIlT5BpnLH9L5UMKikQ334JsllLZcSgeVVRdzk7B
	 bGNh6CqMLMNG/fZ+9EEHNi3/enJYeh15f45imuCCtLM+AdroQYNNl4lWlGoXGSutE6
	 +Dmv3ZUF6VA39HV1OllIy7msT8GlpxekW1Xp44Zsfd39r+gSbRn+ZMCfufsLUQksTd
	 dpiPdHuzlx1kCzrAI1A7Z85YM4U67YGVIM07TQZQIDFVLrHHWBnoBpNf44mBijwCTq
	 vXCgVUE9pZmAg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TmB603yYvz4wc7;
	Fri,  1 Mar 2024 12:56:40 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, tuxayo
 <victor@tuxayo.net>
Subject: Re: Boot failure with ppc64 port on iMacs G5
In-Reply-To: <be7a1a66e9cc4789704d2c93f0b770ea391a4c28.camel@physik.fu-berlin.de>
References: <fc93d03b-581d-40cd-8ab1-762a9ee2c20c@tuxayo.net>
 <42e9a15f6733dd48c64cbceeb3ad27349ca8c3e4.camel@physik.fu-berlin.de>
 <87r0gvg49s.fsf@mail.lhotse>
 <be7a1a66e9cc4789704d2c93f0b770ea391a4c28.camel@physik.fu-berlin.de>
Date: Fri, 01 Mar 2024 12:56:39 +1100
Message-ID: <87frxag1ew.fsf@mail.lhotse>
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
Cc: debian-powerpc@lists.debian.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Claudia Neumann <dr.claudia.neumann@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> writes:
> Hi Michael,
>
> On Thu, 2024-02-29 at 17:42 +1100, Michael Ellerman wrote:
>> > There seems to be a regression in the kernel which affects PowerPC 970 machines,
>> > i.e. PowerMac G5 CPUs. The issue needs to be bisected and reported upstream.
>> 
>> I have a quad G5 that is booting mainline happily.
>
> it's a really tricky problem because it seems to depend on how the kernel image
> is booted.
>
> It fails when trying to boot the kernel off the installation CD, i.e. like from here:
>
>> https://cdimage.debian.org/cdimage/ports/snapshots/2024-02-25/debian-12.0.0-ppc64-NETINST-1.iso
>
> but the kernel will boot fine when installing in an existing system which was installed
> with an installation CD which uses an older kernel.
>
>> https://cdimage.debian.org/cdimage/ports/snapshots/2023-06-18/debian-12.0.0-ppc64-NETINST-1.iso
>
> I have not really figured out yet what the problem is.

OK.

That second iso boots OK for me in qemu. It boots grub and then the
kernel loads and shows:

  Loading ...
  OF stdout device is: /pci@f0000000/mac-io@c/escc@13000/ch-a@13020
  Preparing to boot Linux version 6.3.0-1-powerpc64 (debian-kernel@lists.debian.org) (gcc-12 (Debian 12.3.0-2) 12.3.0, GNU ld (GNU Binutils for Debian) 2.40) #1 SMP Debian 6.3.7-1 (2023-06-12)
  Detected machine type: 0000000000000400
  command line: BOOT_IMAGE=/install/vmlinux --- quiet
  memory layout at init:
    memory_limit : 0000000000000000 (16 MB aligned)
    alloc_bottom : 0000000005e70000
    alloc_top    : 0000000030000000
    alloc_top_hi : 0000000080000000
    rmo_top      : 0000000030000000
    ram_top      : 0000000080000000
  copying OF device tree...
  Building dt strings...
  Building dt structure...
  Device tree strings 0x0000000005e80000 -> 0x0000000005e80560
  Device tree struct  0x0000000005e90000 -> 0x0000000005ea0000
  Quiescing Open Firmware ...
  Booting Linux via __start() @ 0x0000000002000000 ...
  Hello World !
  smp_core99_probe
  smp_core99_bringup_done
  Starting system log daemon: syslogd, klogd.

And eventually starts the installer.

That's using no VGA, so possibly there's something wrong with the video
setup on real hardware:

  $ qemu-system-ppc64 -nographic -vga none -M mac99,via=pmu -smp 1 -m 2G -nic user -drive file=$HOME/debian-12.0.0-ppc64-NETINST-1.2023-06-18.iso,format=raw,media=cdrom -boot d

I'll try and find time to test it on my actual G5 next week when I'm in
the office.

cheers
