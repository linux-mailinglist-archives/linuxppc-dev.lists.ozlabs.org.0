Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E6D4BAF69
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 03:10:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0FXX70mzz3cQJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 13:10:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0FX45vctz3cFX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 13:10:12 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K0FX032d3z4xZp;
 Fri, 18 Feb 2022 13:10:08 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220111005404.162219-1-aik@ozlabs.ru>
References: <20220111005404.162219-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel v5] KVM: PPC: Merge powerpc's debugfs entry content
 into generic entry
Message-Id: <164515019044.908917.13867805067598579515.b4-ty@ellerman.id.au>
Date: Fri, 18 Feb 2022 13:09:50 +1100
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
Cc: Cédric Le Goater <clg@kaod.org>, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 11 Jan 2022 11:54:04 +1100, Alexey Kardashevskiy wrote:
> At the moment KVM on PPC creates 4 types of entries under the kvm debugfs:
> 1) "%pid-%fd" per a KVM instance (for all platforms);
> 2) "vm%pid" (for PPC Book3s HV KVM);
> 3) "vm%u_vcpu%u_timing" (for PPC Book3e KVM);
> 4) "kvm-xive-%p" (for XIVE PPC Book3s KVM, the same for XICS);
> 
> The problem with this is that multiple VMs per process is not allowed for
> 2) and 3) which makes it possible for userspace to trigger errors when
> creating duplicated debugfs entries.
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: PPC: Merge powerpc's debugfs entry content into generic entry
      https://git.kernel.org/powerpc/c/faf01aef0570757bfbf1d655e984742c1dd38068

cheers
