Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C256B50B44E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Apr 2022 11:46:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kl8g056P5z3bh9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Apr 2022 19:46:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n1kiepiJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kl8fQ2MmCz2yMj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Apr 2022 19:45:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=n1kiepiJ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Kl8fN2BN9z4xXS;
 Fri, 22 Apr 2022 19:45:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1650620734;
 bh=Al83ymN/ho4hwVOypF35AMxE9htb4+ARNDtj3dzBOic=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=n1kiepiJd8a8t0vH2NyNoWar0AsBDtzB1cl/Fh45VwFPT5MK8tw1UTcLX17q8WY8x
 /7xNsb+93FcFBaFP2NiF6MDx8CcmozeREaY6MkKhoGHeZ6WSWzPS6pQLEicFyeOsx9
 zPDp4YE8G3p/q9e27K8R6pmEr5wXLas6eOraWwbg3X4rxYwsOE+1tm9/OZf5rixtcj
 3uGlTfzdlC3h1U3DKijnn+wq7uPxly76L8ow24pMuA4Fo1F2wRwKCg5b01JuxaptnE
 mh318QXvG2BkqiDkZ7wQbm/SqWlTmabZNHKvcn/GTzHYoN9JSHonn/T3uphH5DhXvq
 Ed1+/nokNrBog==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Tong Tiangen <tongtiangen@huawei.com>, Mark Rutland
 <mark.rutland@arm.com>, James Morse <james.morse@arm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Robin Murphy
 <robin.murphy@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -next v4 1/7] x86, powerpc: fix function define in
 copy_mc_to_user
In-Reply-To: <20220420030418.3189040-2-tongtiangen@huawei.com>
References: <20220420030418.3189040-1-tongtiangen@huawei.com>
 <20220420030418.3189040-2-tongtiangen@huawei.com>
Date: Fri, 22 Apr 2022 19:45:31 +1000
Message-ID: <87r15p8n9g.fsf@mpe.ellerman.id.au>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Xie XiuQi <xiexiuqi@huawei.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Tong Tiangen <tongtiangen@huawei.com>, Guohanjun <guohanjun@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tong Tiangen <tongtiangen@huawei.com> writes:
> x86/powerpc has it's implementation of copy_mc_to_user but not use #define
> to declare.
>
> This may cause problems, for example, if other architectures open
> CONFIG_ARCH_HAS_COPY_MC, but want to use copy_mc_to_user() outside the
> architecture, the code add to include/linux/uaddess.h is as follows:
>
>     #ifndef copy_mc_to_user
>     static inline unsigned long __must_check
>     copy_mc_to_user(void *dst, const void *src, size_t cnt)
>     {
> 	    ...
>     }
>     #endif
     
The above doesn't exist yet, you add it in patch 3, which is a little
confusing for a reader of this commit in isolation.

I think you could safely move that into this patch, and then this patch
would be ~= "Add generic fallback version of copy_mc_to_user()".

It's probably not worth doing a whole new version of the series just for
that, but if you need to do a new version for some other reason I think
it would be cleaner to introduce the fallback in this commit.

> Then this definition will conflict with the implementation of x86/powerpc
> and cause compilation errors as follow:
>
> Fixes: ec6347bb4339 ("x86, powerpc: Rename memcpy_mcsafe() to copy_mc_to_{user, kernel}()")
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> ---
>  arch/powerpc/include/asm/uaccess.h | 1 +

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
