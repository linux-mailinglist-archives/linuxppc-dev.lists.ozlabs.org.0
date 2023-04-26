Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDCF6EF41B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 14:14:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5yVT4G70z3gNn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 22:14:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5yMW1sPtz3f4C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 22:08:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q5yMW0hWTz4xN0;
	Wed, 26 Apr 2023 22:08:55 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20230426055848.402993-1-npiggin@gmail.com>
References: <20230426055848.402993-1-npiggin@gmail.com>
Subject: Re: (subset) [PATCH 0/9] powerpc: Build fixes
Message-Id: <168251050532.3973805.1545931612156859211.b4-ty@ellerman.id.au>
Date: Wed, 26 Apr 2023 22:01:45 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 26 Apr 2023 15:58:37 +1000, Nicholas Piggin wrote:
> This series is against powerpc next. The first two patches are
> independent build fixes for recent patches. Patches 3-5 separate
> boot Makefile BOOTCFLAGS and BOOTASFLAGS and stops passing some
> C code generation flags to the assembler which causes some
> warnings for llvm. Patches 6-9 are not fixes but a bunch of other
> improvements I noticed along the way.
> 
> [...]

Patches 1& 2 applied to powerpc/next.

[1/9] powerpc: Fix merge conflict between pcrel and copy_thread changes
      https://git.kernel.org/powerpc/c/0c993300d52bf5ce9b951c3b6b25d0d14acc49a9
[2/9] powerpc/64s: Disable pcrel code model on Clang
      https://git.kernel.org/powerpc/c/169f8997968ab620d750d9a45e15c5288d498356

cheers
