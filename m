Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A998324684
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 05:59:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457MTJ16b8zDqMl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 13:59:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457MS26d7WzDqJ1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 13:58:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 457MS06LgNz9s9T;
 Tue, 21 May 2019 13:58:08 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: vmx - convert to SPDX license identifiers
In-Reply-To: <20190520164232.159053-1-ebiggers@kernel.org>
References: <20190520164232.159053-1-ebiggers@kernel.org>
Date: Tue, 21 May 2019 13:58:06 +1000
Message-ID: <874l5o8nn5.fsf@concordia.ellerman.id.au>
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
Cc: Breno =?utf-8?Q?Leit=C3=A3o?= <leitao@debian.org>,
 linuxppc-dev@lists.ozlabs.org, Nayna Jain <nayna@linux.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Eric Biggers <ebiggers@kernel.org> writes:
> From: Eric Biggers <ebiggers@google.com>
>
> Remove the boilerplate license text and replace it with the equivalent
> SPDX license identifier.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  drivers/crypto/vmx/aes.c     | 14 +-------------
>  drivers/crypto/vmx/aes_cbc.c | 14 +-------------
>  drivers/crypto/vmx/aes_ctr.c | 14 +-------------
>  drivers/crypto/vmx/aes_xts.c | 14 +-------------
>  drivers/crypto/vmx/vmx.c     | 14 +-------------
>  5 files changed, 5 insertions(+), 65 deletions(-)

Looks good to me.

Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
