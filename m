Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8683F0563
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 15:53:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqTry3BxPz3fnn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 23:53:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqTh34sC2z3d8X
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:46:11 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GqTgz2MfLz9t1s; Wed, 18 Aug 2021 23:46:07 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20210720141504.420110-1-npiggin@gmail.com>
References: <20210720141504.420110-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/perf: Always use SIAR for kernel interrupts
Message-Id: <162929389413.3619265.9033949276183345817.b4-ty@ellerman.id.au>
Date: Wed, 18 Aug 2021 23:38:14 +1000
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 21 Jul 2021 00:15:04 +1000, Nicholas Piggin wrote:
> If an interrupt is taken in kernel mode, always use SIAR for it rather than
> looking at regs_sipr. This prevents samples piling up around interrupt
> enable (hard enable or interrupt replay via soft enable) in PMUs / modes
> where the PR sample indication is not in synch with SIAR.
> 
> This results in better sampling of interrupt entry and exit in particular.

Applied to powerpc/next.

[1/1] powerpc/64s/perf: Always use SIAR for kernel interrupts
      https://git.kernel.org/powerpc/c/cf9c615cde49fb5d2480549c8c955a0a387798d3

cheers
