Return-Path: <linuxppc-dev+bounces-122-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA357954858
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2024 13:55:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cOTM7tZW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WlgRm2kXDz2ymQ;
	Fri, 16 Aug 2024 21:55:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cOTM7tZW;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WlgRl4cpmz2ym1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2024 21:55:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723809347;
	bh=JK2ZEGKF5wUVngvJcuzrxy5s4hF6B4QBRkWO2T8fN14=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cOTM7tZWaasIp1kq7AiZ+im9Cw1jkBHytjEgXK+aD45QJ38VX6mAaF1RmThmj1xLv
	 O1oYjl0L21nJWGQRqPayxsg6DXPSvBnG+zd5Sw83uYmoeRHWe/SuJ6MOuJdJLVt/su
	 xUKrfRdluFTdmGDL7qrOg01TdZjQ2y+UBmixQPlXG02P+kkQs1qGx/MJJOynynXFl/
	 DWwrld8VHANDtnSQ4p5hdtnREFmEOhkCBtekf6Virvmf8r+EZV6mY7ClHVfsIKotm+
	 oNhB2Rlth2qbdDFT+I+Vqj88P3dfwiBVBK3vZwQGYP4sZ8zaxLbU4HpH5cxi8Mossc
	 TEz42c1x7SKhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WlgRl39kVz4wp0;
	Fri, 16 Aug 2024 21:55:47 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Erhard Furtner <erhard_f@mailbox.org>, linux-bcachefs@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: 'do_IRQ: stack overflow: 1072' at using bcachefs partition
 (ppc32, kernel 6.10.5)
In-Reply-To: <20240815125651.3189da31@yea>
References: <20240815125651.3189da31@yea>
Date: Fri, 16 Aug 2024 21:55:46 +1000
Message-ID: <87v8003cn1.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Erhard Furtner <erhard_f@mailbox.org> writes:
> Greetings!
>
> Basically bcachefs works on ppc32 but I get stack overflows like this one rather easy:
>
> [...]
> do_IRQ: stack overflow: 1072
> CPU: 1 PID: 2114 Comm: bash Not tainted 6.10.5-gentoo-PMacG4 #1
> Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
> Call Trace:
> [effe3fc0] [c0785664] dump_stack_lvl+0x70/0x8c (unreliable)
> [effe3fe0] [c00081fc] __do_irq+0x28/0x80
> [effe3ff0] [c000873c] __do_IRQ+0x7c/0x84
> [c8aec430] [c8aec610] 0xc8aec610
   ^ 
That's your lowest frame on the process stack. It should actually extend
down to c8aec000, so you had a little bit of space left.

CONFIG_DEBUG_STACKOVERFLOW warns when you have less than 1/4 of the stack
free. You could try turning it off and see if the system survives.

The other thing to try would be increasing the THREAD_SHIFT to 14.

cheers

