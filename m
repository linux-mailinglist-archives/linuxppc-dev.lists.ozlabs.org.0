Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DF93B30BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 16:01:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9hcg3hfyz3c2F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 00:01:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9hbG5bRzz2yRD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 23:59:54 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G9hbD5jzzz9sVt; Thu, 24 Jun 2021 23:59:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Chancellor <nathan@kernel.org>
In-Reply-To: <20210621182440.990242-1-nathan@kernel.org>
References: <YNDUEoanTqvayZ5P@archlinux-ax161>
 <20210621182440.990242-1-nathan@kernel.org>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Workaround high stack usage with
 clang
Message-Id: <162454315620.2927609.2836123364412705213.b4-ty@ellerman.id.au>
Date: Thu, 24 Jun 2021 23:59:16 +1000
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
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, clang-built-linux@googlegroups.com,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 21 Jun 2021 11:24:40 -0700, Nathan Chancellor wrote:
> LLVM does not emit optimal byteswap assembly, which results in high
> stack usage in kvmhv_enter_nested_guest() due to the inlining of
> byteswap_pt_regs(). With LLVM 12.0.0:
> 
> arch/powerpc/kvm/book3s_hv_nested.c:289:6: error: stack frame size of
> 2512 bytes in function 'kvmhv_enter_nested_guest' [-Werror,-Wframe-larger-than=]
> long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>      ^
> 1 error generated.
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: PPC: Book3S HV: Workaround high stack usage with clang
      https://git.kernel.org/powerpc/c/51696f39cbee5bb684e7959c0c98b5f54548aa34

cheers
