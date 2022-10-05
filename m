Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F815F4CF7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 02:16:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhw9P4cSjz3drq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 11:16:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhw8p0mt4z2xfv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 11:16:10 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhw8n6hTVz4x1D;
	Wed,  5 Oct 2022 11:16:09 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220908132545.4085849-1-npiggin@gmail.com>
References: <20220908132545.4085849-1-npiggin@gmail.com>
Subject: Re: [PATCH 1/5] KVM: PPC: Book3S HV P9: Clear vcpu cpu fields before enabling host irqs
Message-Id: <166492892651.918434.630990238646577685.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 11:15:26 +1100
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

On Thu, 8 Sep 2022 23:25:41 +1000, Nicholas Piggin wrote:
> On guest entry, vcpu->cpu and vcpu->arch.thread_cpu are set after
> disabling host irqs. On guest exit there is a window whre tick time
> accounting briefly enables irqs before these fields are cleared.
> 
> Move them up to ensure they are cleared before host irqs are run.
> This is possibly not a problem, but is more symmetric and makes the
> fields less surprising.
> 
> [...]

Patches 1-4 applied to powerpc/topic/ppc-kvm.

[1/5] KVM: PPC: Book3S HV P9: Clear vcpu cpu fields before enabling host irqs
      https://git.kernel.org/powerpc/c/bc91c04bfff7cdf676011b97bb21b2861d7b21c9
[2/5] KVM: PPC: Book3S HV P9: Fix irq disabling in tick accounting
      https://git.kernel.org/powerpc/c/c953f7500b65f2b157d1eb468ca8b86328834cce
[3/5] KVM: PPC: Book3S HV: Update guest state entry/exit accounting to new API
      https://git.kernel.org/powerpc/c/b31bc24a49037aad7aa00d2b0354e9704d8134dc
[4/5] KVM: PPC: Book3S HV P9: Restore stolen time logging in dtl
      https://git.kernel.org/powerpc/c/1a5486b3c3517aa1f608a10003ade4da122cb175

cheers
