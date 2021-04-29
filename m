Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C418536EC18
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 16:08:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWHQQ5RXtz3fjX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 00:07:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWHJT4gHcz3bqx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 00:02:49 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FWHJS0xg5z9t19; Fri, 30 Apr 2021 00:02:47 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20210421210647.20836-1-rdunlap@infradead.org>
References: <20210421210647.20836-1-rdunlap@infradead.org>
Subject: Re: [PATCH v3] powerpc: make ALTIVEC select PPC_FPU
Message-Id: <161970488205.4033873.9121048311980600896.b4-ty@ellerman.id.au>
Date: Fri, 30 Apr 2021 00:01:22 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 21 Apr 2021 14:06:47 -0700, Randy Dunlap wrote:
> On a kernel config with ALTIVEC=y and PPC_FPU not set/enabled,
> there are build errors:
> 
> drivers/cpufreq/pmac32-cpufreq.c:262:2: error: implicit declaration of function 'enable_kernel_fp' [-Werror,-Wimplicit-function-declaration]
>            enable_kernel_fp();
> ../arch/powerpc/lib/sstep.c: In function 'do_vec_load':
> ../arch/powerpc/lib/sstep.c:637:3: error: implicit declaration of function 'put_vr' [-Werror=implicit-function-declaration]
>   637 |   put_vr(rn, &u.v);
>       |   ^~~~~~
> ../arch/powerpc/lib/sstep.c: In function 'do_vec_store':
> ../arch/powerpc/lib/sstep.c:660:3: error: implicit declaration of function 'get_vr'; did you mean 'get_oc'? [-Werror=implicit-function-declaration]
>   660 |   get_vr(rn, &u.v);
>       |   ^~~~~~
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: make ALTIVEC select PPC_FPU
      https://git.kernel.org/powerpc/c/389586333c0229a4fbc5c1a7f89148d141293682

cheers
