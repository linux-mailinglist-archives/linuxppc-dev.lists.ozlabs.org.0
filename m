Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1CB68ADB4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 01:49:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8W4N4WK1z3fWF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 11:49:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8W291Tckz3cdj
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 11:47:29 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P8W2545Mpz4xG5;
	Sun,  5 Feb 2023 11:47:25 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <76c11197b058193dcb8e8b26adffba09cfbdab11.1674632329.git.christophe.leroy@csgroup.eu>
References: <76c11197b058193dcb8e8b26adffba09cfbdab11.1674632329.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] powerpc/64: Set default CPU in Kconfig
Message-Id: <167555801928.1621279.9254309872014361674.b4-ty@ellerman.id.au>
Date: Sun, 05 Feb 2023 11:46:59 +1100
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
Cc: Pali Rohár <pali@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 Jan 2023 08:38:59 +0100, Christophe Leroy wrote:
> Since 0069f3d14e7a ("powerpc/64e: Tie PPC_BOOK3E_64 to PPC_E500MC"), the
> only possible BOOK3E/64 are E500, so no need of a default CPU over the
> E5500.
> 
> When the user selects book3e, they must have an e500 compatible
> compiler, and it won't work anymore with the default -mcpu=power64, see
> commit d6b551b8f90c ("powerpc/64e: Fix build failure with GCC 12
> (unrecognized opcode: `wrteei')").
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/64: Set default CPU in Kconfig
      https://git.kernel.org/powerpc/c/45f7091aac3546ef8112bf62836650ca0bbf0b79
[2/2] powerpc/boot: Don't always pass -mcpu=powerpc when building 32-bit uImage
      https://git.kernel.org/powerpc/c/ff7c76f66d8bad4e694c264c789249e1d3a8205d

cheers
