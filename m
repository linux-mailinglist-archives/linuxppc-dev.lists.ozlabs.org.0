Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B41E24BAF6C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 03:11:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0FXz249Rz3cm2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 13:10:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0FX474V3z3cFX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 13:10:12 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K0FX275nZz4xZq;
 Fri, 18 Feb 2022 13:10:10 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: kvm-ppc@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>
In-Reply-To: <20211223211931.3560887-1-farosas@linux.ibm.com>
References: <20211223211931.3560887-1-farosas@linux.ibm.com>
Subject: Re: [PATCH 0/3] KVM: PPC: KVM module exit fixes
Message-Id: <164515018870.908917.9938379332717463951.b4-ty@ellerman.id.au>
Date: Fri, 18 Feb 2022 13:09:48 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 23 Dec 2021 18:19:28 -0300, Fabiano Rosas wrote:
> This is a resend the module cleanup fixes but this time without the
> HV/PR merge.
> 
> Fabiano Rosas (1):
>   KVM: PPC: Book3S HV: Check return value of kvmppc_radix_init
>   KVM: PPC: Book3S HV: Delay setting of kvm ops
>   KVM: PPC: Book3S HV: Free allocated memory if module init fails
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/3] KVM: PPC: Book3S HV: Check return value of kvmppc_radix_init
      https://git.kernel.org/powerpc/c/69ab6ac380a00244575de02c406dcb9491bf3368
[2/3] KVM: PPC: Book3S HV: Delay setting of kvm ops
      https://git.kernel.org/powerpc/c/c5d0d77b45265905bba2ce6e63c9a02bbd11c43c
[3/3] KVM: PPC: Book3S HV: Free allocated memory if module init fails
      https://git.kernel.org/powerpc/c/175be7e5800e2782a7e38ee9e1b64633494c4b44

cheers
