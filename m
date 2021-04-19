Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1891363A1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:10:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtdC4Wjmz3fkS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:10:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVp4cStz3cTH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:34 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVj1sHCz9vHY; Mon, 19 Apr 2021 14:04:28 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
In-Reply-To: <20210412014845.1517916-1-npiggin@gmail.com>
References: <20210412014845.1517916-1-npiggin@gmail.com>
Subject: Re: [PATCH v1 00/12] minor KVM fixes and cleanups
Message-Id: <161880479451.1398509.3440383363531390198.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 13:59:54 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 12 Apr 2021 11:48:33 +1000, Nicholas Piggin wrote:
> Here is the first batch of patches are extracted from the patches of the
> KVM C conversion series, plus one new fix (host CTRL not restored) since
> v6 was posted.
> 
> Please consider for merging.
> 
> Thanks,
> Nick
> 
> [...]

Applied to powerpc/next.

[01/12] KVM: PPC: Book3S HV P9: Restore host CTRL SPR after guest exit
        https://git.kernel.org/powerpc/c/5088eb4092df12d701af8e0e92860b7186365279
[02/12] KVM: PPC: Book3S HV: Nested move LPCR sanitising to sanitise_hv_regs
        https://git.kernel.org/powerpc/c/a19b70abc69aea8ea5974c57e1c3457d9df6aff2
[03/12] KVM: PPC: Book3S HV: Add a function to filter guest LPCR bits
        https://git.kernel.org/powerpc/c/67145ef4960f55923b9e404c0b184944bfeded4d
[04/12] KVM: PPC: Book3S HV: Disallow LPCR[AIL] to be set to 1 or 2
        https://git.kernel.org/powerpc/c/bcc92a0d6d6eae1e7b34a88f58ae69c081d85f97
[05/12] KVM: PPC: Book3S HV: Prevent radix guests setting LPCR[TC]
        https://git.kernel.org/powerpc/c/72c15287210f7433f5fcb55452b05e4b6ccc6c15
[06/12] KVM: PPC: Book3S HV: Remove redundant mtspr PSPB
        https://git.kernel.org/powerpc/c/4b5f0a0d49e663adf1c7c6f2dd05cb18dd53db8c
[07/12] KVM: PPC: Book3S HV: remove unused kvmppc_h_protect argument
        https://git.kernel.org/powerpc/c/6c12c4376bbbc89fc84480096ba838e07ab7c405
[08/12] KVM: PPC: Book3S HV: Fix CONFIG_SPAPR_TCE_IOMMU=n default hcalls
        https://git.kernel.org/powerpc/c/0fd85cb83fbd7048d8a024ba1338924349e26fd5
[09/12] powerpc/64s: Remove KVM handler support from CBE_RAS interrupts
        https://git.kernel.org/powerpc/c/5eee8371828a92a2620453907d6b2b6dc819ab3a
[10/12] powerpc/64s: remove KVM SKIP test from instruction breakpoint handler
        https://git.kernel.org/powerpc/c/da487a5d1bee6a30798a8db15986d3d028c8ac92
[11/12] KVM: PPC: Book3S HV: Ensure MSR[ME] is always set in guest MSR
        https://git.kernel.org/powerpc/c/946cf44ac6ce61378ea02386d39394a06d502f28
[12/12] KVM: PPC: Book3S HV: Ensure MSR[HV] is always clear in guest MSR
        https://git.kernel.org/powerpc/c/732f21a3053cf279eb6b85d19b7818a8f1dd2071

cheers
