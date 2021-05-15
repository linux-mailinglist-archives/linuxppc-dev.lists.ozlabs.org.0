Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04707381B8A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 00:48:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FjLCW06pLz3dD4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 08:48:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FjL8X5pDKz300T
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 08:45:48 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FjL8X1zxWz9srX; Sun, 16 May 2021 08:45:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210514044008.1955783-1-npiggin@gmail.com>
References: <20210514044008.1955783-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64e/interrupt: fix nvgprs being clobbered
Message-Id: <162111863548.1890426.6272276693294050982.b4-ty@ellerman.id.au>
Date: Sun, 16 May 2021 08:43:55 +1000
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
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 14 May 2021 14:40:08 +1000, Nicholas Piggin wrote:
> Some interrupt handlers have an "extra" that saves 1 or 2 registers
> (r14, r15) in the paca save area and makes them available to use by the
> handler.
> 
> The change to always save nvgprs in exception handlers lead to some
> interrupt handlers saving those scratch r14 / r15 registers into the
> interrupt frame's GPR saves, which get restored on interrupt exit.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64e/interrupt: fix nvgprs being clobbered
      https://git.kernel.org/powerpc/c/c6ac667b07996929835b512de0e9a988977e6abc

cheers
