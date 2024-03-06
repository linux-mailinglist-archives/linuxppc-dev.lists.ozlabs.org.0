Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC977872C62
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 02:57:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rKM9eBRy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqFts4Nl7z3vgS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 12:57:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rKM9eBRy;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqFt939lcz3d4F
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 12:57:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709690224;
	bh=zKjIhOo07MtPmZkbnub/h0pEuLD2fOChnv8bU5SJw1A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rKM9eBRypxT2aIpjYPm0gUUclSMPXmYCbEfDW2ZT5PC+W6DFDOE2dCKSbpR5RLkGS
	 IdPnHgl9zSgMhGdUomruBGiqv+Je38+YaB+5SM0rSS4A4DswIFEy1/lpNBEhR4QuOH
	 KBrGkGYEP+DJzXkhynEtMxHqX4mdA6nJvIc4BHSVXrPRh1ZuSlQ4zbKQ++tuxcacwp
	 EpTa0363SEbbVwVKL+S96LlI+Wpp8Ywa15IQHsV9HXO2eVfCMIxmc0qO79+NHBsfwJ
	 1uQxuWI41n6ALIicosBUelsH8TIzx1U3R63KaMm1LIsHLyK1L4qeRn2vMTjgdUZd4X
	 Fci9cLAKDYRPg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TqFt819Q3z4wcC;
	Wed,  6 Mar 2024 12:57:03 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, tuxayo
 <victor@tuxayo.net>
Subject: Re: Boot failure with ppc64 port on iMacs G5
In-Reply-To: <1768836b7e6895f3c2fb0cb4a01a40fee7473dd5.camel@physik.fu-berlin.de>
References: <fc93d03b-581d-40cd-8ab1-762a9ee2c20c@tuxayo.net>
 <42e9a15f6733dd48c64cbceeb3ad27349ca8c3e4.camel@physik.fu-berlin.de>
 <87r0gvg49s.fsf@mail.lhotse>
 <be7a1a66e9cc4789704d2c93f0b770ea391a4c28.camel@physik.fu-berlin.de>
 <87frxag1ew.fsf@mail.lhotse>
 <1768836b7e6895f3c2fb0cb4a01a40fee7473dd5.camel@physik.fu-berlin.de>
Date: Wed, 06 Mar 2024 12:57:02 +1100
Message-ID: <871q8op1g1.fsf@mail.lhotse>
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
> On Fri, 2024-03-01 at 12:56 +1100, Michael Ellerman wrote:
>> That second iso boots OK for me in qemu. It boots grub and then the
>> kernel loads and shows:
>> 
>>   Loading ...
>>   OF stdout device is: /pci@f0000000/mac-io@c/escc@13000/ch-a@13020
>>   Preparing to boot Linux version 6.3.0-1-powerpc64 (debian-kernel@lists.debian.org) (gcc-12 (Debian 12.3.0-2) 12.3.0, GNU ld (GNU Binutils for Debian) 2.40) #1 SMP Debian 6.3.7-1 (2023-06-12)
>>   Detected machine type: 0000000000000400
>>   command line: BOOT_IMAGE=/install/vmlinux --- quiet
>>   memory layout at init:
>>     memory_limit : 0000000000000000 (16 MB aligned)
>>     alloc_bottom : 0000000005e70000
>>     alloc_top    : 0000000030000000
>>     alloc_top_hi : 0000000080000000
>>     rmo_top      : 0000000030000000
>>     ram_top      : 0000000080000000
>>   copying OF device tree...
>>   Building dt strings...
>>   Building dt structure...
>>   Device tree strings 0x0000000005e80000 -> 0x0000000005e80560
>>   Device tree struct  0x0000000005e90000 -> 0x0000000005ea0000
>>   Quiescing Open Firmware ...
>>   Booting Linux via __start() @ 0x0000000002000000 ...
>>   Hello World !
>>   smp_core99_probe
>>   smp_core99_bringup_done
>>   Starting system log daemon: syslogd, klogd.
>> 
>> And eventually starts the installer.
>
> Yep, the second, older image works as expected. However, the recent one does not
> and I have absolutely no clue why.

I actually tested both, and both work, but then I cited the wrong one in
my email >_<

So at least on qemu that newer kernel is OK:

  Preparing to boot Linux version 6.6.15-powerpc64 (debian-kernel@lists.debian.org) (gcc-13 (Debian 13.2.0-13) 13.2.0, GNU ld (GNU Binutils for Debian) 2.42) #1 SMP Debian 6.6.15-2 (2024-02-04)
  ...
  Booting Linux via __start() @ 0x0000000004800000 ...
  Hello World !
  smp_core99_probe
  smp_core99_bringup_done
  Starting system log daemon: syslogd, klogd.


cheers
