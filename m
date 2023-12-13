Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65695810EFE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 11:55:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AiaR0lF5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sqsnb10XMz3cTl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 21:54:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AiaR0lF5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sqsmk5Tdvz3bfK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 21:54:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 77DDACE1DB0;
	Wed, 13 Dec 2023 10:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B24FC433C7;
	Wed, 13 Dec 2023 10:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702464849;
	bh=pOBIlhP9wI7aXPnXn5KzmjdpjbzTV4MzQtsYOzByjn4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AiaR0lF5PYw4trjUf0+sE/kigW9JcGdzw+6g406AcMBcJsos5nkJWOeFOfRhiEkw4
	 RYtFJ/Kl7ZVSWxN4pJSbcQqyOlBf0gwux8IuljMetblHfX25OKlip9gam+cJcCuRZM
	 GHpZbQ3Vo5zzlr9yPzhJY/8rm+InPGq+0fpY1kaYdRsZMlSqvA+JuFoyArVlmKFidH
	 FoYh8J2MXTqPzX1+s9XDdtuFzGbjsNdbHNQJ5WC3dxlG2SNIU+NIZ3S8WN5qkRGu6o
	 JbJeRI9rA4kKYb9YHDKrwXjQfTLb+i4SWu1hXkaelPOVuFM6fM5oKY6PhilCJfuPOH
	 7ladwIjXrSxiA==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] MAINTAINERS: powerpc: Add Aneesh & Naveen
In-Reply-To: <20231205051105.736470-1-mpe@ellerman.id.au>
References: <20231205051105.736470-1-mpe@ellerman.id.au>
Date: Wed, 13 Dec 2023 16:24:00 +0530
Message-ID: <874jgmnzjr.fsf@kernel.org>
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
Cc: naveen.n.rao@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Aneesh and Naveen are helping out with some aspects of upstream
> maintenance, add them as reviewers.
>

Acked-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>

> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea790149af79..562d048863ee 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12240,6 +12240,8 @@ LINUX FOR POWERPC (32-BIT AND 64-BIT)
>  M:	Michael Ellerman <mpe@ellerman.id.au>
>  R:	Nicholas Piggin <npiggin@gmail.com>
>  R:	Christophe Leroy <christophe.leroy@csgroup.eu>
> +R:	Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> +R:	Naveen N. Rao <naveen.n.rao@linux.ibm.com>
>  L:	linuxppc-dev@lists.ozlabs.org
>  S:	Supported
>  W:	https://github.com/linuxppc/wiki/wiki
> -- 
> 2.43.0
