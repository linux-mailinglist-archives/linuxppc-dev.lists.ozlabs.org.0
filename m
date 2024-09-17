Return-Path: <linuxppc-dev+bounces-1417-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AB897AAC0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2024 06:35:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X788x3WXWz2xfT;
	Tue, 17 Sep 2024 14:35:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726547729;
	cv=none; b=HMNp6bZfnwhwD+B+LbR2UUSfGrh0g52Aez+Dj1utSucxs8I0QETzq0pXcFKZuqyEdwK5i820nn+1PPU7bg4SwrLeKmzfx47vlcAxAGG2Uxg3NlQKvT85F45POwwsIGXk3kh6dbAicGw5/0q09+Cv3Td1ICxoLy+qvDmefIzQWB2Hc0hRMjkIYCsnWnSzy8fafDLh7Z2qQdtq2LwisL4BwhpZxyRStZ2JCSBIBHiB1qvhokM6LcdsWvk2Elz/4Gi1JlFznU3jAxq2bLiNFlK4l/TVod6M19wAznIlefoeHdeI5YAi9URuCrrPSAbgli2xYMf9m4b6X66lsCOp6+EK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726547729; c=relaxed/relaxed;
	bh=IUEa298+/HnSGhVzOT26xrNR64cr3qT+KBkosyliq2A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jl1Q+zHXD6q8Lnm7OlQGwZy8RIdDq+raA+l825UpxKrdxW04qjn8jtsUDPbDdysX4LWuBUbdsVE8eLbbxKT0arYCqZd2SinS6I3GOv9tEPidrYKmM2zG0nXd/MOWCFpDmQpExcU8uiBREG3u9QyKY6GHXCVxlSEwqlRijvszUWA6fIv6VA3nKTPII2ZAu4RBFP8UY3tEWvF+OF3/2wkZyXx7KFHOacyL1U3sDP/ASqo2DbdWN45pQsOGR8wpdH6vleKeqT75seIFRyz4P4lp0b7ZmkHLJQTYj09tTGagpq9BZIKmCClwceUsbB1mN38ODr+89d4Nj/DTiV/f61hyng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IaI+3H6y; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IaI+3H6y;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X788w4YYMz2xb9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2024 14:35:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726547719;
	bh=IUEa298+/HnSGhVzOT26xrNR64cr3qT+KBkosyliq2A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IaI+3H6ys+fmP41dMTuJyHVoH7u4Qj7Xw3zVhhBSQs9jLFZeo+ep7lMgHu4jaec7T
	 OLJD9DgD75YUc+PBZLbv1wowf49AII0+Qf7wF+s1uQg6oNYzMvg7rMHroPPE+0EfRS
	 AhEBVyb3GIrmck9wYgs+u0CrKwzQCwILDFajlvfyOYZ2ygVnwcG0Zb25NXboMb3lhV
	 AvhuN31qcOF4BcIusJcf/JzauI//CC+BqjpThqeoBtX7No6TzpeKrWvlvzfTKAoyS5
	 q7RqaL2B4lazVZrsfGPmQJ1iDyJ1bUEu3YPGPctN1uAP2NCIJfEgCvNvqktvVisH5p
	 CZBDkNo8yFEOg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X788l4wjyz4xZZ;
	Tue, 17 Sep 2024 14:35:19 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mina Almasry <almasrymina@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu,
 segher@kernel.crashing.org, sfr@canb.auug.org.au,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kuba@kernel.org
Subject: Re: [PATCH] powerpc/atomic: Use YZ constraints for DS-form
 instructions
In-Reply-To: <CAHS8izM-3DSw+hvFasu=xge5st9cE9MrwJ3FOOHpYHsj5r0Ydg@mail.gmail.com>
References: <20240916120510.2017749-1-mpe@ellerman.id.au>
 <CAHS8izM-3DSw+hvFasu=xge5st9cE9MrwJ3FOOHpYHsj5r0Ydg@mail.gmail.com>
Date: Tue, 17 Sep 2024 14:35:17 +1000
Message-ID: <878qvqrj7e.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mina Almasry <almasrymina@google.com> writes:
> On Mon, Sep 16, 2024 at 5:05=E2=80=AFAM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
>>
>> The 'ld' and 'std' instructions require a 4-byte aligned displacement
>> because they are DS-form instructions. But the "m" asm constraint
>> doesn't enforce that.
>>
>> That can lead to build errors if the compiler chooses a non-aligned
>> displacement, as seen with GCC 14:
>>
>>   /tmp/ccuSzwiR.s: Assembler messages:
>>   /tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is not a multip=
le of 4)
>>   make[5]: *** [scripts/Makefile.build:229: net/core/page_pool.o] Error 1
>>
>> Dumping the generated assembler shows:
>>
>>   ld 8,39(8)       # MEM[(const struct atomic64_t *)_29].counter, t
>>
>> Use the YZ constraints to tell the compiler either to generate a DS-form
>> displacement, or use an X-form instruction, either of which prevents the
>> build error.
>>
>> See commit 2d43cc701b96 ("powerpc/uaccess: Fix build errors seen with
>> GCC 13/14") for more details on the constraint letters.
>>
>> Fixes: 9f0cbea0d8cc ("[POWERPC] Implement atomic{, 64}_{read, write}() w=
ithout volatile")
>> Cc: stable@vger.kernel.org # v2.6.24+
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Closes: https://lore.kernel.org/all/20240913125302.0a06b4c7@canb.auug.or=
g.au
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> I'm not familiar enough with the code around the changes, but I have
> been able to confirm cherry-picking this resolves the build issue I'm
> seeing on net-next, so, FWIW,
>
> Tested-by: Mina Almasry <almasrymina@google.com>

Thanks.

cheers

