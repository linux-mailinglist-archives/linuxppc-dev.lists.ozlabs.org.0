Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9987454EE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:36:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZR13rfSz3cZv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:36:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZP332pBz3bP2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:34:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZP20DYTz4wxS;
	Mon,  3 Jul 2023 15:34:30 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, "Paul E. McKenney" <paulmck@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1683892665.git.christophe.leroy@csgroup.eu>
References: <cover.1683892665.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 0/3] Extend KCSAN to all powerpc
Message-Id: <168836201883.50010.16266070359338968346.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:26:58 +1000
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 May 2023 17:31:16 +0200, Christophe Leroy wrote:
> This series enables KCSAN on all powerpc.
> 
> To do this, a fix is required to KCSAN core.
> 
> Once that fix is done, the stubs can also be removed from xtensa.
> 
> It would be nice if patch 1 could go in v6.4 as a fix, then patches 2 and 3
> could be handled separately in each architecture in next cycle.
> 
> [...]

Applied to powerpc/next.

[1/3] kcsan: Don't expect 64 bits atomic builtins from 32 bits architectures
      https://git.kernel.org/powerpc/c/353e7300a1db928e427462f2745f9a2cd1625b3d
[2/3] powerpc/{32,book3e}: kcsan: Extend KCSAN Support
      https://git.kernel.org/powerpc/c/95567f46b4d20c047750a5e3029461afcdc67697
[3/3] xtensa: Remove 64 bits atomic builtins stubs
      https://git.kernel.org/powerpc/c/bcea4f7a70dc800e769ef02d8c3bc4df357ed893

cheers
