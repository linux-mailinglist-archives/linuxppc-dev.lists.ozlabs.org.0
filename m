Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7737857CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:19:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW4yW2Nzdz3dhs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:19:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4dS4Hyjz3dDm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:04:28 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4dR1jM0z4x4T;
	Wed, 23 Aug 2023 22:04:26 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, ndesaulniers@google.com
In-Reply-To: <20230817-ppc_xmon-v1-1-8cc2d51b9995@google.com>
References: <20230817-ppc_xmon-v1-1-8cc2d51b9995@google.com>
Subject: Re: [PATCH] Revert "powerpc/xmon: Relax frame size for clang"
Message-Id: <169279175573.797584.2695589362102577867.b4-ty@ellerman.id.au>
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
Cc: llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Aug 2023 11:11:56 -0700, ndesaulniers@google.com wrote:
> This reverts commit 9c87156cce5a63735d1218f0096a65c50a7a32aa.
> 
> I have not been able to reproduce the reported -Wframe-larger-than=
> warning (or disassembly) with clang-11 or clang-18.
> 
> I don't know precisely when this was fixed in llvm, but it may be time
> to revert this.
> 
> [...]

Applied to powerpc/next.

[1/1] Revert "powerpc/xmon: Relax frame size for clang"
      https://git.kernel.org/powerpc/c/7f3c5d099b6f8452dc4dcfe4179ea48e6a13d0eb

cheers
