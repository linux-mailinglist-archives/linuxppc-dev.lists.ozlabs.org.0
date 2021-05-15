Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB70381B8C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 00:48:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FjLD94XrPz3dgj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 08:48:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FjL8Y6Z22z3063
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 08:45:49 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FjL8Y49nbz9svs; Sun, 16 May 2021 08:45:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210508101455.1578318-1-npiggin@gmail.com>
References: <20210508101455.1578318-1-npiggin@gmail.com>
Subject: Re: [PATCH v2 0/4] Fix queued spinlocks and a bit more
Message-Id: <162111863350.1890426.4091908086891583769.b4-ty@ellerman.id.au>
Date: Sun, 16 May 2021 08:43:53 +1000
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 8 May 2021 20:14:51 +1000, Nicholas Piggin wrote:
> This didn't seem to send properly, apologies if you get a duplicate.
> 
> Patch 1 is the important fix. 2 might fix something, although I haven't
> provoked a crash yet.
> 
> Patch 3 is a small cleanup, and patch 4 I think is the right thing to do
> but these could wait for later.
> 
> [...]

Applied to powerpc/fixes.

[1/4] powerpc/pseries: Fix hcall tracing recursion in pv queued spinlocks
      https://git.kernel.org/powerpc/c/2c8c89b95831f46a2fb31a8d0fef4601694023ce
[2/4] powerpc/pseries: Don't trace hcall tracing wrapper
      https://git.kernel.org/powerpc/c/a3f1a39a5643d5c5ed3eee4edd933e0ebfeeed6e
[3/4] powerpc/pseries: use notrace hcall variant for H_CEDE idle
      https://git.kernel.org/powerpc/c/7058f4b13edd9dd2cb3c5b4fe340d8307dbe0208
[4/4] powerpc/pseries: warn if recursing into the hcall tracing code
      https://git.kernel.org/powerpc/c/4f242fc5f2e24412b89e934dad025b10293b2712

cheers
