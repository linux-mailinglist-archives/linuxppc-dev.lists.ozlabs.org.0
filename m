Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D8D381B8B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 00:48:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FjLCr1vFwz2yYP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 08:48:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4FjL8Y16qnz302K
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 08:45:49 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FjL8X6DLYz9ssP; Sun, 16 May 2021 08:45:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210503111708.758261-1-npiggin@gmail.com>
References: <20210503111708.758261-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: Make NMI record implicitly soft-masked code
 as irqs disabled
Message-Id: <162111863488.1890426.15623689321545527511.b4-ty@ellerman.id.au>
Date: Sun, 16 May 2021 08:43:54 +1000
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
Cc: Cédric Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 3 May 2021 21:17:08 +1000, Nicholas Piggin wrote:
> scv support introduced the notion of code that implicitly soft-masks
> irqs due to the instruction addresses. This is required because scv
> enters the kernel with MSR[EE]=1.
> 
> If a NMI (including soft-NMI) interrupt hits when we are implicitly
> soft-masked then its regs->softe does not reflect this because it is
> derived from the explicit soft mask state (paca->irq_soft_mask). This
> makes arch_irq_disabled_regs(regs) return false.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s: Make NMI record implicitly soft-masked code as irqs disabled
      https://git.kernel.org/powerpc/c/4ec5feec1ad029bdf7d49bc50ccc0c195eeabe93

cheers
