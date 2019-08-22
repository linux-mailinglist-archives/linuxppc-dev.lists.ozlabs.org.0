Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BC299164
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 12:52:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DhFN2vc0zDrTf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 20:52:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Dh6J6V79zDqHX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 20:46:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46Dh6J3Brgz9s3Z; Thu, 22 Aug 2019 20:46:32 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46Dh6J1Yyqz9sNy; Thu, 22 Aug 2019 20:46:31 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 8d4ba9c931bc384bcc6889a43915aaaf19d3e499
In-Reply-To: <20190813100100.GC9567@blackberry>
To: Paul Mackerras <paulus@ozlabs.org>, linuxppc-dev@ozlabs.org,
 kvm@vger.kernel.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2 2/3] KVM: PPC: Book3S HV: Don't push XIVE context when
 not using XIVE device
Message-Id: <46Dh6J1Yyqz9sNy@ozlabs.org>
Date: Thu, 22 Aug 2019 20:46:31 +1000 (AEST)
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
Cc: kvm-ppc@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-08-13 at 10:01:00 UTC, Paul Mackerras wrote:
> At present, when running a guest on POWER9 using HV KVM but not using
> an in-kernel interrupt controller (XICS or XIVE), for example if QEMU
> is run with the kernel_irqchip=off option, the guest entry code goes
> ahead and tries to load the guest context into the XIVE hardware, even
> though no context has been set up.
> 
> To fix this, we check that the "CAM word" is non-zero before pushing
> it to the hardware.  The CAM word is initialized to a non-zero value
> in kvmppc_xive_connect_vcpu() and kvmppc_xive_native_connect_vcpu(),
> and is now cleared in kvmppc_xive_{,native_}cleanup_vcpu.
> 
> Cc: stable@vger.kernel.org # v4.11+
> Reported-by: Cédric Le Goater <clg@kaod.org>
> Fixes: 5af50993850a ("KVM: PPC: Book3S HV: Native usage of the XIVE interrupt controller")
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>

Applied to powerpc topic/ppc-kvm, thanks.

https://git.kernel.org/powerpc/c/8d4ba9c931bc384bcc6889a43915aaaf19d3e499

cheers
