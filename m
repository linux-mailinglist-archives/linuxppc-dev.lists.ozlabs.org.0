Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8AD5F8A7D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 12:01:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mlcyg6Hmyz3dtB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 21:01:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mlcx1111Zz3bjD
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 21:00:21 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mlcx06mwlz4xGd;
	Sun,  9 Oct 2022 21:00:20 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221004132952.984341-1-npiggin@gmail.com>
References: <20221004132952.984341-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/interrupt: stack backtrace fix
Message-Id: <166530952750.1856352.16376738835487370865.b4-ty@ellerman.id.au>
Date: Sun, 09 Oct 2022 20:58:47 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 Oct 2022 23:29:52 +1000, Nicholas Piggin wrote:
> The value of the stack frame regs marker that gets saved on the
> stack in interrupt entry code does not match the regs marker value,
> which breaks stack frame marker matching.
> 
> This stray instruction looks to have been introduced in a mismerge.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64s/interrupt: stack backtrace fix
      https://git.kernel.org/powerpc/c/b2e82e495a528eed77c15f3923c2b049a21d7280

cheers
