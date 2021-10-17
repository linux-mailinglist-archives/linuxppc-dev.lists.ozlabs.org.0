Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 231054308A5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 14:28:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXK780HQ3z3cB3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 23:28:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXK6g4Ztkz2yYd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Oct 2021 23:28:27 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HXK6b2fk7z4xqM;
 Sun, 17 Oct 2021 23:28:23 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Cédric Le Goater <clg@kaod.org>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211011070203.99726-1-clg@kaod.org>
References: <20211011070203.99726-1-clg@kaod.org>
Subject: Re: [PATCH] powerpc/xive: Discard disabled interrupts in
 get_irqchip_state()
Message-Id: <163447368300.1156783.15492137091707859947.b4-ty@ellerman.id.au>
Date: Sun, 17 Oct 2021 23:28:03 +1100
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
Cc: stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 11 Oct 2021 09:02:03 +0200, Cédric Le Goater wrote:
> When an interrupt is passed through, the KVM XIVE device calls the
> set_vcpu_affinity() handler which raises the P bit to mask the
> interrupt and to catch any in-flight interrupts while routing the
> interrupt to the guest.
> 
> On the guest side, drivers (like some Intels) can request at probe
> time some MSIs and call synchronize_irq() to check that there are no
> in flight interrupts. This will call the XIVE get_irqchip_state()
> handler which will always return true as the interrupt P bit has been
> set on the host side and lock the CPU in an infinite loop.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/xive: Discard disabled interrupts in get_irqchip_state()
      https://git.kernel.org/powerpc/c/6f779e1d359b8d5801f677c1d49dcfa10bf95674

cheers
