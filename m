Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1122577F659
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 14:22:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fyK30UdM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRPJX64JQz3cGG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 22:22:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fyK30UdM;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRPHf43sCz2yDd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 22:21:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692274872;
	bh=sLthMGDrejd/+Upyz0eADzLiwIR8d6FGoid5g5aROAs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fyK30UdMARTCEL0DhU0ZobRNv7juNp+cglDorOULB/oR7vFlum5jGurL316AFaTxa
	 pkvrH2XVNiKIv/NZQva5jX9AVjHBM86hmnxsMtM8BS0HH1J/S71pl1eJk7I3gxPovM
	 ZRkmKSQCyGROHjrouAKDud0QtEYn2/WXqXpnHWEGnPkt+uEBKoJI8Go2hIUowQKmiN
	 tPNLUxgii+DIDCASmNzJO7YhROkSw58E3PLB4Wt1gP1tTyozgaamL1O1fxs07Avewd
	 4pIIru7p21N+HdgX1VOVgp1mU48XiZlZCFVzwamou9KImxaKzWogO5YYRa+iRgLRFN
	 HTlfRMXT9gKXg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RRPHX4kpbz4wZx;
	Thu, 17 Aug 2023 22:21:12 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 4/6] KVM: PPC: Book3s HV: Hold LPIDs in an unsigned long
In-Reply-To: <20230807014553.1168699-5-jniethe5@gmail.com>
References: <20230807014553.1168699-1-jniethe5@gmail.com>
 <20230807014553.1168699-5-jniethe5@gmail.com>
Date: Thu, 17 Aug 2023 22:21:08 +1000
Message-ID: <87a5upeu6j.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, kvm@vger.kernel.org, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, npiggin@gmail.com, kvm-ppc@vger.kernel.org, vaibhav@linux.ibm.com, kconsul@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:
> The LPID register is 32 bits long. The host keeps the lpids for each
> guest in an unsigned word struct kvm_arch. Currently, LPIDs are already
> limited by mmu_lpid_bits and KVM_MAX_NESTED_GUESTS_SHIFT.
>
> The nestedv2 API returns a 64 bit "Guest ID" to be used be the L1 host
> for each L2 guest. This value is used as an lpid, e.g. it is the
> parameter used by H_RPT_INVALIDATE. To minimize needless special casing
> it makes sense to keep this "Guest ID" in struct kvm_arch::lpid.
>
> This means that struct kvm_arch::lpid is too small so prepare for this
> and make it an unsigned long. This is not a problem for the KVM-HV and
> nestedv1 cases as their lpid values are already limited to valid ranges
> so in those contexts the lpid can be used as an unsigned word safely as
> needed.
>
> In the PAPR, the H_RPT_INVALIDATE pid/lpid parameter is already
> specified as an unsigned long so change pseries_rpt_invalidate() to
> match that.  Update the callers of pseries_rpt_invalidate() to also take
> an unsigned long if they take an lpid value.
>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---

This needs:

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 709ebd578394..08e32b44ee32 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -857,7 +857,7 @@ unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
        }

        kvm->arch.secure_guest |= KVMPPC_SECURE_INIT_DONE;
-       pr_info("LPID %d went secure\n", kvm->arch.lpid);
+       pr_info("LPID %lu went secure\n", kvm->arch.lpid);

 out:
        srcu_read_unlock(&kvm->srcu, srcu_idx);

cheers
