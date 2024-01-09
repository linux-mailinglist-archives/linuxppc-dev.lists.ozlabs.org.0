Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9FE8282AA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 10:03:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8Q2X29D6z3cX3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 20:03:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=195.130.132.48; helo=cantor.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 458 seconds by postgrey-1.37 at boromir; Tue, 09 Jan 2024 20:03:06 AEDT
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8Q2267vFz2xXY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jan 2024 20:03:06 +1100 (AEDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4T8Prw25cFz4wxbL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jan 2024 09:55:12 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:b0d9:a4e2:30ba:1f13])
	by baptiste.telenet-ops.be with bizsmtp
	id YYvA2B0061LwnfP01YvA2D; Tue, 09 Jan 2024 09:55:11 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rN7t8-00Ex2c-6s;
	Tue, 09 Jan 2024 09:55:10 +0100
Date: Tue, 9 Jan 2024 09:55:10 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Geoff Levand <geoff@infradead.org>
Subject: Re: [PATCH] powerpc/ps3_defconfig: Disable
 PPC64_BIG_ENDIAN_ELF_ABI_V2
In-Reply-To: <3daebc86-abbf-4f37-8268-0e2a4fefede9@infradead.org>
Message-ID: <999fb114-7c46-50aa-1f64-a9d421f35897@linux-m68k.org>
References: <df906ac1-5f17-44b9-b0bb-7cd292a0df65@infradead.org> <87zfxwjuxt.fsf@mail.lhotse> <3daebc86-abbf-4f37-8268-0e2a4fefede9@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

 	Hi Geoff,

On Wed, 27 Dec 2023, Geoff Levand wrote:
> On 12/27/23 10:27, Michael Ellerman wrote:
>> Geoff Levand <geoff@infradead.org> writes:
>>> Commit 8c5fa3b5c4df3d071dab42b04b971df370d99354 (powerpc/64: Make ELFv2 the
>>> default for big-endian builds), merged in Linux-6.5-rc1 changes the calling ABI
>>> in a way that is incompatible with the current code for the PS3's LV1 hypervisor
>>> calls.
>>
>> I'll take this for now.
>>
>> But medium term we would like to switch to only using ELFv2, so it would
>> be good if we can work out what the actual problem is.
>
> I've been looking into converting the LV1 hypercalls to v2.

Until then, you may want to add "depends on !CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2"
to config PPC_PS3.

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
