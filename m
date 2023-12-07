Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE71807FCA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 05:49:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=S3OFIEXV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sm1yX2X4Sz3clL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 15:49:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=S3OFIEXV;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sm1xg3nZzz2yts
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 15:48:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701924518;
	bh=5v86kuw+WREddg6/1BQXTyPrhQFcUlwGuC7Hep43V7w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=S3OFIEXVQyuJV7Ws1XwoxszchGOPw4PI3ELuLYrZ8O5AXipv+qrlyxTIzC82m7xKt
	 Ymw41Dw4UkY/6p/LtB2bN+0t3FYUnSKsoh0XlN7uRLnq+Mywb5a24azY6t+L5qsVSM
	 /r8R9LiKrpfGfgpLiCcdjgWHUwaUEMfrDQC1bEkEQanJni1i9IX8i7BE5P5hpnTm3J
	 77ABRINUkx+EAR3cEXEB58Y9mSCoiIXIza1X9fQJTEc6mjPzBoXmz3vMLGnJ5TMX5/
	 hIceK+2nMo066dyOGH0p2Qy9XNyS2SECDXY3wkVdWuFD6FJepCPj5vmCUnkxzuJZV5
	 6SikDYMHWxj2w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sm1xf5YJJz4wd0;
	Thu,  7 Dec 2023 15:48:35 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 4/4] powerpc/Makefile: Auto detect cross compiler
In-Reply-To: <20231206162556.GK19790@gate.crashing.org>
References: <20231206115548.1466874-1-mpe@ellerman.id.au>
 <20231206115548.1466874-4-mpe@ellerman.id.au>
 <20231206162556.GK19790@gate.crashing.org>
Date: Thu, 07 Dec 2023 15:48:30 +1100
Message-ID: <87y1e6ehy9.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Wed, Dec 06, 2023 at 10:55:48PM +1100, Michael Ellerman wrote:
>> Look for various combinations, matching:
>>   powerpc(64(le)?)?(-unknown)?-linux(-gnu)?-
>> 
>> There are more possibilities, but the above is known to find a compiler
>> on Fedora and Ubuntu (which use linux-gnu-), and also detects the
>> kernel.org cross compilers (which use linux-).
>
> $ sh ../config.sub powerpc64-linux
> powerpc64-unknown-linux-gnu
>
> I am very very lazy, so buildall uses short names everywhere :-)

I used to use just ppc64-gcc :)

I can add more variants but didn't want to add too many unless someone
is actually using them.

> Btw, can you build the kernel for a config that differs in 32/64 or
> BE/LE with the default your compiler uses?  There is no reason this
> shouldn't work (you don't use any system libraries), but you need to
> use the correct compiler command-line flags for that always.

Yes it should work. I've tested at least ppc64le/ppc64/ppc defconfigs.

There have been bugs in the past but AFAIK we have fixed all of them,
though there's probably some still lurking for more obscure configs.

> Acked-by: Segher Boessenkool <segher@kernel.crashing.org>

Thanks.

cheers
