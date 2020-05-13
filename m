Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B4F1D1347
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 14:53:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MZNS5Gx6zDqLc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 22:53:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MZ9C0FymzDqgF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 22:43:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49MZ9B5R9Kz9sSf; Wed, 13 May 2020 22:43:42 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Aurelien Jarno <aurelien@aurel32.net>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <7316a9e2c0c2517923eb4b0411c4a08d15e675a4.1589017281.git.christophe.leroy@csgroup.eu>
References: <7316a9e2c0c2517923eb4b0411c4a08d15e675a4.1589017281.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH fixes] powerpc/vdso32: Fallback on getres syscall when
 clock is unknown
Message-Id: <158937375618.3526905.2066468534333015968.b4-ty@ellerman.id.au>
Date: Wed, 13 May 2020 22:43:42 +1000 (AEST)
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

On Sat, 9 May 2020 09:42:14 +0000 (UTC), Christophe Leroy wrote:
> There are other clocks than the standard ones, for instance
> per process clocks. Therefore, being above the last standard clock
> doesn't mean it is a bad clock. So, fallback to syscall instead
> of returning -EINVAL inconditionaly.

Applied to powerpc/fixes.

[1/1] powerpc/vdso32: Fallback on getres syscall when clock is unknown
      https://git.kernel.org/powerpc/c/e963b7a28b2bf2416304e1a15df967fcf662aff5

cheers
