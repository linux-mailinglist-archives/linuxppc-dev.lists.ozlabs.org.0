Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAFB77F092
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 08:35:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YtX6jgHN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRFcl0VS4z3cRP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 16:35:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YtX6jgHN;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRFbt2Vplz2yWD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 16:34:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692254089;
	bh=QOKoW3wyRNr1RLwRnOsY4BbnnwrSfpgB6x3DEw7vRYI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YtX6jgHNQC0nPGKx1/R/ojff9UHbjVywbxalcoJG1mImb7/m3AfOy1YxIRzmpUbXz
	 XMOqb3hmaYHVodauNH9eIpdozm6OBERMmsll7/Pw+Wl0cb9VQ/2acakYaNYNBXADU1
	 O9zbt1mjuLqWzpm2qnJy//jGVuMgsiuvuuFbOULlvWIbaDARBudQxqDQZHZgua4nNq
	 BaBkSHCqV8nZZfoFR5FIXAu/CUfAjssMfrDBv75ftIBAQM65jNufcC778EP8Y6dbTH
	 FIFgeb/6SxFuQcbuJ1QvROfVwJ9x+X54Mv9MVyQf8i0ZvwA422MnIBpZdqsUHF03T9
	 yd7OYR/Nrd/RQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RRFbs15Tdz4wZn;
	Thu, 17 Aug 2023 16:34:49 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Justin Stitt <justinstitt@google.com>, Geoff Levand
 <geoff@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/ps3: refactor strncpy usage
In-Reply-To: <20230816-strncpy-arch-powerpc-platforms-ps3-repository-v1-1-88283b02fb09@google.com>
References: <20230816-strncpy-arch-powerpc-platforms-ps3-repository-v1-1-88283b02fb09@google.com>
Date: Thu, 17 Aug 2023 16:34:47 +1000
Message-ID: <87350i6ut4.fsf@mail.lhotse>
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
Cc: linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Justin Stitt <justinstitt@google.com> writes:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
>
> `make_first_field()` should use similar implementation to `make_field()`
> due to memcpy having more obvious behavior here. The end result yields
> the same behavior as the previous `strncpy`-based implementation
> including the NUL-padding.
>
> Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings[1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note:
> This follows up on a previous RFC which can be found here:
> https://lore.kernel.org/all/20230811-strncpy-arch-powerpc-platforms-ps3-v1-0-301052a5663e@google.com/
> ---
>  arch/powerpc/platforms/ps3/repository.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

This looks good to me. I'll pick this up directly, Geoff let me know if
this breaks something somehow.

cheers
