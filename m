Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C09CD56C8F3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 12:19:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lg5k256HHz3fCr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 20:19:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lg5h15wbbz30Lp
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 20:18:09 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lg5h01cmVz4xvG;
	Sat,  9 Jul 2022 20:18:08 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Fabiano Rosas <farosas@linux.ibm.com>
In-Reply-To: <20220614165204.549229-1-farosas@linux.ibm.com>
References: <20220614165204.549229-1-farosas@linux.ibm.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: tracing: Add missing hcall names
Message-Id: <165736166961.12236.1738268896946645042.b4-ty@ellerman.id.au>
Date: Sat, 09 Jul 2022 20:14:29 +1000
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
Cc: kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Jun 2022 13:52:04 -0300, Fabiano Rosas wrote:
> The kvm_trace_symbol_hcall macro is missing several of the hypercalls
> defined in hvcall.h.
> 
> Add the most common ones that are issued during guest lifetime,
> including the ones that are only used by QEMU and SLOF.
> 
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: PPC: Book3S HV: tracing: Add missing hcall names
      https://git.kernel.org/powerpc/c/0df01238b8aa300cbc736e7ec433d201a76036f3

cheers
