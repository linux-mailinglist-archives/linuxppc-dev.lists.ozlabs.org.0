Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 417AC92B9EB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 14:49:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cTf6Gnaa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJLQh6qSTz3dTL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 22:49:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cTf6Gnaa;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJLQ02s3Zz3cdB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 22:48:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720529304;
	bh=tR/p3OVCCVxP1O40AG1XUapVdWpxiZNGVHuoNkO2YZw=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=cTf6GnaaV57ps0rTXSjTPCsRz1wVfBgf5rjEa/vW1v8DEPel6Z1pUqtC6Y/IRkMBL
	 gdV1BuRk4xXMJ6bh7mIor2i/7KbXhHM6KpnZ/WmFT4pX3cuYOKwacP2yhqvVgzz76B
	 L9dI84Jvf1I8RN1W3cif5EZuHcI7+7gs5ZVihGO5e7q6j17fxzp4X48ePeGOZxaeAP
	 dZV7nrfMdBhA1r2J6bDkbnxGPM59ifXexJKK/tJR6FIw1cf7Obh4jJJ7774k2SVczg
	 +EK5tCB0hzG1QOpMEJI7wZKCVMGElHN0UY0/z9OINTZ7MxFsWREMmJAqd66yEj0f5s
	 xJZJOFp1eXu0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJLQ01Wzhz4x0w;
	Tue,  9 Jul 2024 22:48:23 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Damien Stewart <gvdecor@yahoo.com.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives
 after the of/irq updates 2024-05-29
In-Reply-To: <bfb21f1c-0e8e-40a8-a977-56d40a017f30@yahoo.com.au>
References: <12665d67dcf74cd9a2cd8388d8106f8d@kernel.org>
 <bfb21f1c-0e8e-40a8-a977-56d40a017f30@yahoo.com.au>
Date: Tue, 09 Jul 2024 22:48:23 +1000
Message-ID: <87plrm68a0.fsf@mail.lhotse>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Damien Stewart <gvdecor@yahoo.com.au> writes:
> Hello.
>
>> How does it fail? I've repeatedly asked for dmesg outputs
>> for working and non-working configurations.
>
> I am the alleged tester. Attached are two dmesg logs. First one fails.
> Second passes with 2nd IRQ patch. Also attached is device tree blob if
> I've followed the correct command.
>
> The good log is direct from dmesg. But the bad log is collected live
> over serial, since it ends up in kernel panic, with no where to save
> it.

Thanks.

Which kernel is the bad log from? Just plain rc6 with no patches?

What happened when you tried the patch from me? I think Christian called
it vmlinux-6.10-17. Did you get any different output?

Does anything appear before the "hash-mmu" lines? Those are from the
kernel, we'd really like to see the output from firmware which runs
before that.

cheers
