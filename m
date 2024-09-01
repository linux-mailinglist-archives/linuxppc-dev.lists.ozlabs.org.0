Return-Path: <linuxppc-dev+bounces-847-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7529096761F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Sep 2024 13:17:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WxTqr65Mjz2xwc;
	Sun,  1 Sep 2024 21:17:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725189432;
	cv=none; b=B3Y45GaU6dZA1DACTHKVm2EnEC14B+2ZH71zW49xPlrn/WBierjcmFX2SZM5ywkhNcOyW999et7uYk16aeqCYWO7BsXh35VJfrUvGjmHZbU1U2VTo9WmmaU+gNTEWwbgXYew3JHmGa74u/sH8Hbx7qzhFZ//Koka1oPUOVsfOJMwe2pySx61UuwN6pzNT9rhhqpWho3nN53yQeGhSFnP0zmZ7+XVcWjwbq/YT0DE7P65NIifFkA5iARQQ1VEfKHnnbllpW910Q4BiQpJiLc5X0thvFwEazllBRHEnaR/lEvNVJUje2Qef2HYf/j6iwWiNoCIzR9FiLZzVmLujCEcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725189432; c=relaxed/relaxed;
	bh=12cWuQ7mup9YTSiqwEKWyZdMv05ZO0xRLyuLQm0ks/k=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type; b=kOENjH7eRQa7JlEdIOETztNY+OlCtqbmoEqiaRhly33PZXR7t/8dA+zHXhc6/gyip/fdaaG0FkvKO4SbOJNLVVijc6Wo95o3HI+aNX/Q/zxkzqpRsJXPn9YeN9ggs+Oa71GpoqmyioYNa4yWpqX1ksmYnh+D95OL/m6BS/vS26UG15bNaL3bihHQ4iUi+Euzms2aT3Zo0Ul9THCceQzq01W1WmlxrwkERiBpr4Dm0httSktzLI5BXXi4tiH3eX2OoNM+hBNn1m6mbcU8K1ER+AWoM9382RZZMlPcEG/j5OzLAdMgsLK8u91gUeyG2rJETv0pW/QQ5UIB5eMSD1eDnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oPxs4d9/; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oPxs4d9/;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WxTqq64Trz2xtc
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Sep 2024 21:17:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725189425;
	bh=12cWuQ7mup9YTSiqwEKWyZdMv05ZO0xRLyuLQm0ks/k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oPxs4d9/PVThgd1vK3IHuP418JsvF/KuFs3uGnIiPI0SXxmT1DMemyoAckEdH3ccV
	 VYXU6v2evRZ8gsVzKQPhPhPQZXIChDv5R2rm2AwwD6kzu9/8N/PEtOeTYcHIdLrt8t
	 IXUukjkUMXx3Ni8RuqjJtU69mcoErckGRG2WkEdduYTDMVurBWlA7ROh3XXmoPgvtP
	 Q8UcO5zp2+RQNklj0buJqHJSvaPt5XpgK5osQoruTVDMaBCXWo5lDMJpQSRzuHY6Ri
	 gtBx6d0oRek5+QR+s3HXcKhq3+7x2+N+dOsu1cmp4MnUnJMY8fuhi2JSxpqLVv4B8w
	 7S8gWegPke53w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WxTqg3yTGz4wyR;
	Sun,  1 Sep 2024 21:17:03 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Andrew Morton
 <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Shuah Khan
 <shuah@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org, Adhemerval Zanella
 <adhemerval.zanella@linaro.org>, Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH v3 1/5] mm: Define VM_DROPPABLE for powerpc/32
In-Reply-To: <a0454ec1a8ab3455abc8205357681eaa685cd49b.1725031952.git.christophe.leroy@csgroup.eu>
References: <cover.1725031952.git.christophe.leroy@csgroup.eu>
 <a0454ec1a8ab3455abc8205357681eaa685cd49b.1725031952.git.christophe.leroy@csgroup.eu>
Date: Sun, 01 Sep 2024 21:17:02 +1000
Message-ID: <87bk17ei8h.fsf@mail.lhotse>
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Commit 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always
> lazily freeable mappings") only adds VM_DROPPABLE for 64 bits
> architectures.
>
> In order to also use the getrandom vDSO implementation on powerpc/32,
> use VM_ARCH_1 for VM_DROPPABLE on powerpc/32. This is possible because
> VM_ARCH_1 is used for VM_SAO on powerpc and VM_SAO is only for
> powerpc/64.

Also, there can't be any existing users of VM_SAO on 32-bit, because PROT_SAO
(which maps to VM_SAO) is only accepted on CPUs that support SAO, and
those CPUs are all 64-bit.

cheers

