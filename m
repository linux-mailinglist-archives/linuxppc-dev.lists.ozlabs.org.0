Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ECA591D03
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 00:39:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M4wTT5wW3z3dyF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 08:39:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M4wSL6j4wz2xGy
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Aug 2022 08:38:42 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M4wSH0V7Kz4xFx;
	Sun, 14 Aug 2022 08:38:39 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <a1176e19e627dd6a1b8d24c6c457a8ab874b7d12.1659430931.git.christophe.leroy@csgroup.eu>
References: <a1176e19e627dd6a1b8d24c6c457a8ab874b7d12.1659430931.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/3] powerpc: Fix eh field when calling lwarx on PPC32
Message-Id: <166043029735.1050412.4772349986692144598.b4-ty@ellerman.id.au>
Date: Sun, 14 Aug 2022 08:38:17 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, Pali Rohár <pali@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2 Aug 2022 11:02:36 +0200, Christophe Leroy wrote:
> Commit 9401f4e46cf6 ("powerpc: Use lwarx/ldarx directly instead of
> PPC_LWARX/LDARX macros") properly handled the eh field of lwarx
> in asm/bitops.h but failed to clear it for PPC32 in
> asm/simple_spinlock.h
> 
> So, do as in arch_atomic_try_cmpxchg_lock(), set it to 1 if PPC64
> but set it to 0 if PPC32. For that use IS_ENABLED(CONFIG_PPC64) which
> returns 1 when CONFIG_PPC64 is set and 0 otherwise.
> 
> [...]

Applied to powerpc/fixes.

[1/3] powerpc: Fix eh field when calling lwarx on PPC32
      https://git.kernel.org/powerpc/c/18db466a9a306406dab3b134014d9f6ed642471c
[2/3] powerpc: Don't hide eh field of lwarx behind a macro
      https://git.kernel.org/powerpc/c/eb5a33ea31190c189ca4a59de4687b0877662c06
[3/3] powerpc: Make eh value more explicit when using lwarx
      https://git.kernel.org/powerpc/c/5cccf7a5215d12027e55e247907817631b413c28

cheers
