Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2CE86C10A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 07:43:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GnVe+Cy7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlhWB6xKTz3vYk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 17:43:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GnVe+Cy7;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlhVT5lkHz3cFf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 17:42:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709188961;
	bh=NUQzVMKcOiN6v2F+G3cye/BMs49/zYRKP/k6csqRuHw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GnVe+Cy7PK2GbpscLsZfRp4dAjI6yJYdu0Y58gtFCtlQ+gzvt52bc9BKxwOkTVyBq
	 RdEzTr9S69t84xQ5rOIZRn/g6ngfUwA+ahhqsDGF8vF26mAopJAqjx6KRLVXu88Oyv
	 LlT7X7HqFbhBdBKxPSY491IkfXHK2G4AU4iPbd4dam8Ne7GXFhbK3VkNTg2OhEJxr1
	 ExocGmAngMoaBBJmFz7oouG7D+oTEGJfOFAEK4eIPBa4okO7URljs2Kya4NrJl5VtB
	 nLaAFkXOqk/Tgwp86y8Io2e9Op/r/eDvYs01c8i6xC688h9S2ERmMKAVN31mPpzCbQ
	 vKLnJRZiZ3bxA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TlhVT0dHqz4wc6;
	Thu, 29 Feb 2024 17:42:40 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, tuxayo
 <victor@tuxayo.net>
Subject: Re: Boot failure with ppc64 port on iMacs G5
In-Reply-To: <42e9a15f6733dd48c64cbceeb3ad27349ca8c3e4.camel@physik.fu-berlin.de>
References: <fc93d03b-581d-40cd-8ab1-762a9ee2c20c@tuxayo.net>
 <42e9a15f6733dd48c64cbceeb3ad27349ca8c3e4.camel@physik.fu-berlin.de>
Date: Thu, 29 Feb 2024 17:42:39 +1100
Message-ID: <87r0gvg49s.fsf@mail.lhotse>
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
> On Tue, 2024-02-20 at 04:16 +0100, tuxayo wrote:
>> I tried snapshots/2024-01-31/debian-12.0.0-ppc64-NETINST-1.iso
>> 
>> And was able to start booting from usb with:
>> boot usb0/disk@1:,\boot\grub\powerpc.elf
>> (typed in Open Firmware shell)
>> (usb0 is the top port)
>> 
>> Grub worked, and then I tried default install (the 1st option) and it 
>> started loading during like 2 minutes.
>> And then it got stuck with some superposition of the messages
>> smp_core99_probe
>> and
>> the stuff before
>> DO-QUIESCE finisedBooting Linux via __start() @ 0x0000000002090000 ...
>
> There seems to be a regression in the kernel which affects PowerPC 970 machines,
> i.e. PowerMac G5 CPUs. The issue needs to be bisected and reported upstream.

I have a quad G5 that is booting mainline happily.

I used to have an iMac G5 but it died.

> If you have the time, I would really appreciate if you could test the various
> snapshots and let me know which kernel is the first to not work. I expect that
> the breakage occurred somewhere around kernel 6.3 or so.

Can someone send the .config for the kernel in question? I could try
that on my machine here.

cheers
