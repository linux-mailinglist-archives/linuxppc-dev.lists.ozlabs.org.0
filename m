Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD5B785786
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:07:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW4j85rDRz3fQT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:07:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4cf30vsz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:03:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4cf19WWz4x1S;
	Wed, 23 Aug 2023 22:03:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <830923f0e0375a14609204246d302c7476a8f948.1692279855.git.christophe.leroy@csgroup.eu>
References: <830923f0e0375a14609204246d302c7476a8f948.1692279855.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/4xx: Remove pika_dtm_[un]register_shutdown() to fix no previous prototype
Message-Id: <169279175575.797584.12867145459460437286.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Aug 2023 15:44:26 +0200, Christophe Leroy wrote:
> ppc4xx_defconfig with W=1 results in:
> 
>   CC      arch/powerpc/platforms/44x/warp.o
> arch/powerpc/platforms/44x/warp.c:369:5: error: no previous prototype for 'pika_dtm_register_shutdown' [-Werror=missing-prototypes]
>   369 | int pika_dtm_register_shutdown(void (*func)(void *arg), void *arg)
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/platforms/44x/warp.c:374:5: error: no previous prototype for 'pika_dtm_unregister_shutdown' [-Werror=missing-prototypes]
>   374 | int pika_dtm_unregister_shutdown(void (*func)(void *arg), void *arg)
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/4xx: Remove pika_dtm_[un]register_shutdown() to fix no previous prototype
      https://git.kernel.org/powerpc/c/81554d10b22a211e4598a067a0f84b6e9e492669

cheers
