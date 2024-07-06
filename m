Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 687A79295E0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 01:18:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGmXH1Vnmz3g22
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 09:18:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGmWt3H6fz3cQL
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2024 09:18:02 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WGmWt20yHz4w2P;
	Sun,  7 Jul 2024 09:18:02 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240615-md-powerpc-arch-powerpc-kvm-v1-1-7478648b3100@quicinc.com>
References: <20240615-md-powerpc-arch-powerpc-kvm-v1-1-7478648b3100@quicinc.com>
Subject: Re: [PATCH] KVM: PPC: add missing MODULE_DESCRIPTION() macros
Message-Id: <172030785715.968037.15780100801784026220.b4-ty@ellerman.id.au>
Date: Sun, 07 Jul 2024 09:17:37 +1000
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 15 Jun 2024 08:18:59 -0700, Jeff Johnson wrote:
> With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/kvm/test-guest-state-buffer.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/kvm/kvm-pr.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/kvm/kvm-hv.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: PPC: add missing MODULE_DESCRIPTION() macros
      https://git.kernel.org/powerpc/c/ca8dad0415162efea3597abe06b2025f34213eb5

cheers
