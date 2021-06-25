Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F15B83B3CAB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 08:26:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GB6Tc5HtVz3d9L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 16:26:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GB6RW2NLxz2yjS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 16:24:39 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GB6RV1JsHz9sXb; Fri, 25 Jun 2021 16:24:38 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210623022924.704645-1-npiggin@gmail.com>
References: <20210623022924.704645-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: accumulate_stolen_time remove irq mask
 workaround
Message-Id: <162460208833.3247425.2089314055415506694.b4-ty@ellerman.id.au>
Date: Fri, 25 Jun 2021 16:21:28 +1000
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

On Wed, 23 Jun 2021 12:29:24 +1000, Nicholas Piggin wrote:
> The caller has been moved to C after irq soft-mask state has been
> reconciled, and Linux irqs have been marked as disabled, so this
> does not have to play games with irq internals.

Applied to powerpc/next.

[1/1] powerpc/64s: accumulate_stolen_time remove irq mask workaround
      https://git.kernel.org/powerpc/c/0cdff98b395e5ab71b650c3df154217b1348e9b5

cheers
