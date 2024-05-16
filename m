Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FFF8C7139
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 06:54:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OUNZLTRh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfySL2TCXz3ddX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 14:54:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OUNZLTRh;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfyRb2zfHz3cZP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 14:54:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1715835235;
	bh=m3B6pGxVJXAV9NrNGs8JIZ52KN55fQeOYZ6IyLFS/7U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OUNZLTRhwGC6IkMsHHS1uFhQRNsV3kBp5lTXh/utKzcmhIrlDNQwFVNrU+6dboVEP
	 JAzjsl4aQBPZX+og2Jq+XI1ZJgFDZaY7WhC5C/ZIXn/taSzMeTFdaZIP6JUwEoYHSt
	 2AVdJFyuONp2EfXjPo9eKZtz6rkXnrLm28algrYaqPsotuRLoEqAM5fGmGg3D5v0Z9
	 fqVbyh9LPYtSBa2ZYp2tYmL0ccBazO+uTpZ5LuhaDWHcr/91bY4P7dtiIpJRBq0uBu
	 6Su/HpNL3xEc3sf+P4fDzmUkjNjpo68JpsmW9iqsARA/3JpndVNq0FrfT3gQa9fbsQ
	 1kyZOFMmRFtjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VfyRR1dqQz4wby;
	Thu, 16 May 2024 14:53:55 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Danny Tsen <dtsen@linux.ibm.com>, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 1/3] crypto: X25519 low-level primitives for ppc64le.
In-Reply-To: <20240514173835.4814-2-dtsen@linux.ibm.com>
References: <20240514173835.4814-1-dtsen@linux.ibm.com>
 <20240514173835.4814-2-dtsen@linux.ibm.com>
Date: Thu, 16 May 2024 14:53:54 +1000
Message-ID: <87a5kqwe59.fsf@mail.lhotse>
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, Danny Tsen <dtsen@linux.ibm.com>, appro@cryptogams.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Danny,

Danny Tsen <dtsen@linux.ibm.com> writes:
> Use the perl output of x25519-ppc64.pl from CRYPTOGAMs and added three
> supporting functions, x25519_fe51_sqr_times, x25519_fe51_frombytes
> and x25519_fe51_tobytes.

For other algorithms we have checked-in the perl script and generated
the code at runtime. Is there a reason you've done it differently this time?

> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
> ---
>  arch/powerpc/crypto/curve25519-ppc64le_asm.S | 648 +++++++++++++++++++
>  1 file changed, 648 insertions(+)
>  create mode 100644 arch/powerpc/crypto/curve25519-ppc64le_asm.S
>
> diff --git a/arch/powerpc/crypto/curve25519-ppc64le_asm.S b/arch/powerpc/crypto/curve25519-ppc64le_asm.S
> new file mode 100644
> index 000000000000..8a018104838a
> --- /dev/null
> +++ b/arch/powerpc/crypto/curve25519-ppc64le_asm.S
> @@ -0,0 +1,648 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#
> +# Copyright 2024- IBM Corp.  All Rights Reserved.
 
I'm not a lawyer, but AFAIK "All Rights Reserved" is not required and
can be confusing - because we are not reserving all rights, we are
granting some rights under the GPL.

I also think the IBM copyright should be down below where your
modifications are described.

> +# This code is taken from CRYPTOGAMs[1] and is included here using the option
> +# in the license to distribute the code under the GPL. Therefore this program
> +# is free software; you can redistribute it and/or modify it under the terms of
> +# the GNU General Public License version 2 as published by the Free Software
> +# Foundation.
> +#
> +# [1] https://www.openssl.org/~appro/cryptogams/
> +
> +# Copyright (c) 2006-2017, CRYPTOGAMS by <appro@openssl.org>
> +# All rights reserved.
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +#
> +#       * Redistributions of source code must retain copyright notices,
> +#         this list of conditions and the following disclaimer.
> +#
> +#       * Redistributions in binary form must reproduce the above
> +#         copyright notice, this list of conditions and the following
> +#         disclaimer in the documentation and/or other materials
> +#         provided with the distribution.
> +#
> +#       * Neither the name of the CRYPTOGAMS nor the names of its
> +#         copyright holder and contributors may be used to endorse or
> +#         promote products derived from this software without specific
> +#         prior written permission.
> +#
> +# ALTERNATIVELY, provided that this notice is retained in full, this
> +# product may be distributed under the terms of the GNU General Public
> +# License (GPL), in which case the provisions of the GPL apply INSTEAD OF
> +# those given above.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS
> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> +# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> +# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
> +# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> +# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> +# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> +# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
> +# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> +# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> +# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +# ====================================================================
> +# Written by Andy Polyakov <appro@openssl.org> for the OpenSSL
> +# project. The module is, however, dual licensed under OpenSSL and
> +# CRYPTOGAMS licenses depending on where you obtain it. For further
> +# details see https://www.openssl.org/~appro/cryptogams/.
> +# ====================================================================
> +
> +#
> +# ====================================================================
> +# Written and Modified by Danny Tsen <dtsen@us.ibm.com>
> +# - Added x25519_fe51_sqr_times, x25519_fe51_frombytes, x25519_fe51_tobytes

ie. here.

> +# X25519 lower-level primitives for PPC64.
> +#
> +
> +#include <linux/linkage.h>
> +
> +.machine "any"
 
Please don't add new .machine directives unless they are required.

> +.abiversion	2

I'd prefer that was left to the compiler flags.

cheers
