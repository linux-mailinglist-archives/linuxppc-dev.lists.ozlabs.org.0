Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F4114945B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2020 11:32:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 484XPf0jZbzDqRC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2020 21:32:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 484XMd0HSPzDqJN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2020 21:30:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VQCiiUvT; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 484XMZ4NFjz9sRf;
 Sat, 25 Jan 2020 21:30:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579948220;
 bh=MKJ3akkqBDpIwlA/rrWKKg4vSQxjH3r2oaJx94GTDh4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VQCiiUvT6tJus8SFX4OLVdFgDxBSXyc6DVARZN8SVHjhs4czKyRXPHm5K72mH2yVA
 78wOtakQP0g4CsDJjkUmkA4hywWwQzsTGcCBk98zK6eU7Y48/Ld60VLu83408gG2PY
 7Ps2SZ1pn8aUakCbYQJ9Pa1NRW5iPAIMLPM9tlyV7YLBE+MZDGnMbz5LlpSxeHa0sf
 0BKCg+DsBrB7jvKLI6S8Hbq+xHcK7Y15LuT70ksyC/gM9xBoKPCY5JhPko2Gx8QYid
 iQ3cNdEKg6f7ktIziSNjpDUD7a/4uHAPGYGvx9dU6nZt3B+Kfdvi181qeTu5nf0+Xw
 udA4tJI2UaoPw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/32: Add missing context synchronisation with
 CONFIG_VMAP_STACK
In-Reply-To: <872477f7c7552d3bb7baf0b302398fcd42c5fcfd.1579885334.git.christophe.leroy@c-s.fr>
References: <872477f7c7552d3bb7baf0b302398fcd42c5fcfd.1579885334.git.christophe.leroy@c-s.fr>
Date: Sat, 25 Jan 2020 21:30:14 +1100
Message-ID: <87wo9fhlqh.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> After reactivation of data translation by modifying MSR[DR], a isync
> is required to ensure the translation is effective.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
> Rebased on powerpc/merge-test
>
> @mpe: If not too late:
> - change to head_32.h should be squashed into "powerpc/32: prepare for CONFIG_VMAP_STACK"
> - change to head_32.S should be squashed into "powerpc/32s: Enable CONFIG_VMAP_STACK"

Done. Thanks.

cheers
