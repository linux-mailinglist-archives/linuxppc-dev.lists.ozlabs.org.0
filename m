Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C11B28BFF77
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 15:51:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZGky2tRNz78rq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 23:51:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZGdX6qrFz3flb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 23:46:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZGdT5t9dz4x33;
	Wed,  8 May 2024 23:46:21 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
In-Reply-To: <20230411061446.26324-1-joel@jms.id.au>
References: <20230411061446.26324-1-joel@jms.id.au>
Subject: Re: [PATCH] KVM: PPC: Fix documentation for ppc mmu caps
Message-Id: <171517595458.167543.4513284574842934696.b4-ty@ellerman.id.au>
Date: Wed, 08 May 2024 23:45:54 +1000
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
Cc: Jonathan Corbet <corbet@lwn.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 11 Apr 2023 15:44:46 +0930, Joel Stanley wrote:
> The documentation mentions KVM_CAP_PPC_RADIX_MMU, but the defines in the
> kvm headers spell it KVM_CAP_PPC_MMU_RADIX. Similarly with
> KVM_CAP_PPC_MMU_HASH_V3.
> 
> 

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: PPC: Fix documentation for ppc mmu caps
      https://git.kernel.org/powerpc/c/651d61bc8b7d8bb622cfc24be2ee92eebb4ed3cc

cheers
