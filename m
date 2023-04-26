Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2776EF416
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 14:14:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5yTS23nCz3gJD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 22:14:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5yMV1Q22z3cgT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 22:08:54 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q5yMT2GHGz4xMy;
	Wed, 26 Apr 2023 22:08:53 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Nathan Chancellor <nathan@kernel.org>
In-Reply-To: <20230406-wundef-thread_shift_booke-v1-1-8deffa4d84f9@kernel.org>
References: <20230406-wundef-thread_shift_booke-v1-1-8deffa4d84f9@kernel.org>
Subject: Re: [PATCH] powerpc/32: Include thread_info.h in head_booke.h
Message-Id: <168251050520.3973805.11314426233471106968.b4-ty@ellerman.id.au>
Date: Wed, 26 Apr 2023 22:01:45 +1000
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
Cc: kernel test robot <lkp@intel.com>, masahiroy@kernel.org, patches@lists.linux.dev, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 06 Apr 2023 10:51:30 -0700, Nathan Chancellor wrote:
> When building with W=1 after commit 80b6093b55e3 ("kbuild: add -Wundef
> to KBUILD_CPPFLAGS for W=1 builds"), the following warning occurs.
> 
>   In file included from arch/powerpc/kvm/bookehv_interrupts.S:26:
>   arch/powerpc/kvm/../kernel/head_booke.h:20:6: warning: "THREAD_SHIFT" is not defined, evaluates to 0 [-Wundef]
>      20 | #if (THREAD_SHIFT < 15)
>         |      ^~~~~~~~~~~~
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/32: Include thread_info.h in head_booke.h
      https://git.kernel.org/powerpc/c/8002725b9e3369ce8616d32dc2e7a57870475142

cheers
