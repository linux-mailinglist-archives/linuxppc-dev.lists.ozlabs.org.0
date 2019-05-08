Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3CF181FD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 00:20:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zrWk0jcnzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 08:20:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zrVP2JYtzDqJX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 08:19:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="g2qc3HCd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="K8+AjeS4"; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44zrVN5l93z8tGc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 08:19:08 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44zrVN5XHPz9s9y; Thu,  9 May 2019 08:19:08 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="g2qc3HCd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="K8+AjeS4"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44zrVK23MRz9s5c
 for <linuxppc-dev@ozlabs.org>; Thu,  9 May 2019 08:19:04 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8196022136;
 Wed,  8 May 2019 18:19:01 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
 by compute6.internal (MEProxy); Wed, 08 May 2019 18:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=dUFEvinBY45jVKzXLujBoVg7MttlgbV
 HhUdhJEq+gBY=; b=g2qc3HCd5gCutymTrBuA0ljFgqdefJlD14r3ZYsKREQfEUa
 tl0vS9aWufoeyALeLE5wqF02BehbyodmkT2kzmPWaKXw/6X6RZKSTjXq5aa9y+QE
 ijQ6qlCqeem2NMAtg5Lr+8kCQIV7t9tM9TnEc2c6yW/m2f+hpe/oraFrT6JYcbI9
 ClGNjYngbcDJKZuP2GDaeqIALlOoDmexEjM0wKIa35mrp/nS5awLnhhwa+gjTMNo
 ASovDmTqqQnYLf5GZK/1mpPUI6b3clEa6eOaEcUqsRkTSa4EghCLaFfni9Fhd7/d
 wy+5iTs2aFwmtX4NPCsL9X7ah1K7sR3SisMHxZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dUFEvi
 nBY45jVKzXLujBoVg7MttlgbVHhUdhJEq+gBY=; b=K8+AjeS4oSYRFMp8gdyVMC
 RQQL9q/75IrqdAXYVumOHWNUrdnJ8ZFxzQ5FwgKcD65spfYqH/T26mSdcWGZEqaC
 xDadHsVvEoxLfS9uiSRtZ1itaQd7eUSxk+t6dcL8bW07ImsTU4oEYLvFN51kmWmL
 mxqXfuizm3oZBt+bZN8tva5EVUwzOrMegDmINcS9wRaqpWLiAHEPJ/DvP2Fnzt/p
 ICohgxeEAI1r1CR3TVvVTruFqSrKjlXTx8eniorGUVHohvaF/lcPJPTeGdRYiCBi
 NZ2I4mmfnu+5d2q/yMlxZdSlHuV8fWMb5IxPP6v3JOt9SWHmQdtqESGNv23IAZ4g
 ==
X-ME-Sender: <xms:1FXTXM8K3ZQT6Lpocd0MP2i8thsRzbGTFpNLmM7JYk5lyS2yRIa5cQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeeggddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddutddmnecujfgurhepofgfggfkjghffffhvffutgesthdtredtreer
 tdenucfhrhhomhepfdftuhhsshgvlhhlucevuhhrrhgvhidfuceorhhushgtuhhrsehruh
 hsshgvlhhlrdgttgeqnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhu
 shhsvghllhdrtggtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:1VXTXCSazNHQQclJNlwO1Xpixzq3q-C4rC6-3z7rDkVWXMsZafa9PA>
 <xmx:1VXTXDXRZkDwKS5IGLCW5eevlYIMaot8DQkzsBI27XI9hmHz0tPPtg>
 <xmx:1VXTXG1WqtYIUV8KQX4FET0ggto0uUZQZtkp68dPUj0FJ0VnbfM-LQ>
 <xmx:1VXTXOCOd-NTlNEWOAnh7PDVJiUKJpGWrL1E-ubmUce1hWSl57MTRw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D6F1872303; Wed,  8 May 2019 18:19:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <36775962-bfab-4dfb-98c5-f35dab1ae988@www.fastmail.com>
In-Reply-To: <20190508123047.10217-1-mpe@ellerman.id.au>
References: <20190508123047.10217-1-mpe@ellerman.id.au>
Date: Wed, 08 May 2019 18:18:56 -0400
From: "Russell Currey" <ruscur@russell.cc>
To: "Michael Ellerman" <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] powerpc/64s: Use early_mmu_has_feature() in set_kuap()
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 8, 2019, at 10:31 PM, Michael Ellerman wrote:
> When implementing the KUAP support on Radix we fixed one case where
> mmu_has_feature() was being called too early in boot via
> __put_user_size().
> 
> However since then some new code in linux-next has created a new path
> via which we can end up calling mmu_has_feature() too early.
> 
> On P9 this leads to crashes early in boot if we have both PPC_KUAP and
> CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG enabled. Our early boot code
> calls printk() which calls probe_kernel_read(), that does a
> __copy_from_user_inatomic() which calls into set_kuap() and that uses
> mmu_has_feature().
> 
> At that point in boot we haven't patched MMU features yet so the debug
> code in mmu_has_feature() complains, and calls printk(). At that point
> we recurse, eg:
> 
>   ...
>   dump_stack+0xdc
>   probe_kernel_read+0x1a4
>   check_pointer+0x58
>   ...
>   printk+0x40
>   dump_stack_print_info+0xbc
>   dump_stack+0x8
>   probe_kernel_read+0x1a4
>   probe_kernel_read+0x19c
>   check_pointer+0x58
>   ...
>   printk+0x40
>   cpufeatures_process_feature+0xc8
>   scan_cpufeatures_subnodes+0x380
>   of_scan_flat_dt_subnodes+0xb4
>   dt_cpu_ftrs_scan_callback+0x158
>   of_scan_flat_dt+0xf0
>   dt_cpu_ftrs_scan+0x3c
>   early_init_devtree+0x360
>   early_setup+0x9c
> 
> And so on for infinity, symptom is a dead system.
> 
> Even more fun is what happens when using the hash MMU (ie. p8 or p9
> with Radix disabled), and when we don't have
> CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG enabled. With the debug disabled
> we don't check if static keys have been initialised, we just rely on
> the jump label. But the jump label defaults to true so we just whack
> the AMR even though Radix is not enabled.
> 
> Clearing the AMR is fine, but after we've done the user copy we write
> (0b11 << 62) into AMR. When using hash that makes all pages with key
> zero no longer readable or writable. All kernel pages implicitly have
> key zero, and so all of a sudden the kernel can't read or write any of
> its memory. Again dead system.
> 
> In the medium term we have several options for fixing this.
> probe_kernel_read() doesn't need to touch AMR at all, it's not doing a
> user access after all, but it uses __copy_from_user_inatomic() just
> because it's easy, we could fix that.
> 
> It would also be safe to default to not writing to the AMR during
> early boot, until we've detected features. But it's not clear that
> flipping all the MMU features to static_key_false won't introduce
> other bugs.
> 
> But for now just switch to early_mmu_has_feature() in set_kuap(), that
> avoids all the problems with jump labels. It adds the overhead of a
> global lookup and test, but that's probably trivial compared to the
> writes to the AMR anyway.
> 
> Fixes: 890274c2dc4c ("powerpc/64s: Implement KUAP for Radix MMU")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Russell Currey <ruscur@russell.cc>

> ---
>  arch/powerpc/include/asm/book3s/64/kup-radix.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h 
> b/arch/powerpc/include/asm/book3s/64/kup-radix.h
> index 7679bd0c5af0..f254de956d6a 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
> @@ -65,7 +65,7 @@
>  
>  static inline void set_kuap(unsigned long value)
>  {
> -	if (!mmu_has_feature(MMU_FTR_RADIX_KUAP))
> +	if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
>  		return;
>  
>  	/*
> -- 
> 2.20.1
> 
>
