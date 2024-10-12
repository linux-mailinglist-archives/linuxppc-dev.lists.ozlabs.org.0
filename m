Return-Path: <linuxppc-dev+bounces-2165-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5245C99B7F4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2024 04:22:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XR3zW3CCVz2yHj;
	Sun, 13 Oct 2024 13:22:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728743520;
	cv=none; b=X6QmyPbyrMwPbJRsXYVCilQ7Yv3UQP/Hy4txai6pgXQVn0MsjAtwpOmnurUXZUQJnvbY2FsQb76+sfEhTPScdXjbnyU5jFPK2RZT0tPy1Zm4Jzcoj+1wcjqVOTtYbFSjdWevdsOurl+IziXrb21BCMVxOPKhpSMjeNIn2hpXPez6JizCRKhPGAGlZvWaaYHSsYc7NEK68ez08ZjGqoawWIFkTPfOkk4gAWRgZWgAbVGdbEfOILpIFdt/MOADaJnmemX+kAT6t+mkTgyJjlFGcxxiDsnbngj1qZ71xjrWDpnWplbuTO5qCv5db6gWjg5TtSXPqZMAMkBAII9V7SMXUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728743520; c=relaxed/relaxed;
	bh=6NtASxZ+Nh7N9D/0fCi537u/reg/ta06+RNRhtFjJlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4ga+yBx/ODUVEBVB6oD9SEKJkzE0T0Hhq+bpsAmcocq0l5mE729F3QhmTSfy5QEz+xLnPjkhbWi4qEdN7SdfOlzSHSB+2KkmivzheqXiehJ8wXZ3vrXeHRL0zWfvoKXL6inmsWUSPNLW7wr6Gy9FW69GilQMuN/zlHCRSUIzKeQJdF6s8RI2/9+nQwlUvlQXAGX8R5YB/eAdSeUW4k4neMn7+N1p2MeexMungwP8hVZST4tclomEC5dNY1Ad2xe4YPJb1A9VokALVL8+Kp5hU7EJ+TmJ74XMbQTyQEFnKiNW4VCq61KaN/WMkquwo9weBzpt6Q1Rh3NC5e5QLz0Hg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de; dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=g8s6GP+S; dkim-atps=neutral; spf=pass (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org) smtp.mailfrom=alien8.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=g8s6GP+S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 567 seconds by postgrey-1.37 at boromir; Sun, 13 Oct 2024 01:31:52 AEDT
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQmCX0jHWz307y
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 01:31:52 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DE19F40E0263;
	Sat, 12 Oct 2024 14:21:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id y-0AP6zGpEVP; Sat, 12 Oct 2024 14:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1728742886; bh=6NtASxZ+Nh7N9D/0fCi537u/reg/ta06+RNRhtFjJlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g8s6GP+SAj7/RVzXD35YhsODRA56gKaMPUPhsRH0BIe37MXzPZM6+P1gcS2EkxTkb
	 4Ne8LNawWg92v3Rt+MkRlHedQ65xHsQA3YSGTJpLncT75LCHTFlA12da0Y5lw0FHpA
	 BxNXM65J9zeW6rYoDZECKK2zsIw6fcIELWiNYnPR/phEY9stWxBtLgv1xBaX9r4ONv
	 8KptK8t7BL4e2f/TBuev/ypWvQnrqeEwZM1ofI1rnJ70mzU1qow9RU7h/7/e/nq8UJ
	 /gN3yGYuL5JHx4Re1DOUzVnOhZpyM1rG7NSfwSfqRYB4rJKPtbXETxMU1Cp8juweT0
	 oMJCTUzNtodjzGSv6gEOoJgb4Ek9Ec5vh6KqvYE7b0PUMVVkPMWRmS3/nWgrkGGbcr
	 y2n7hHkfjYKC+qsElpaxFPorIJYaNWLscozYkYpKUPJC6KOThjBlahMOWtZ32QWPpE
	 RUV6yMAR6AIRukTe30+m9XMDiLHCu9+jRu/NrDlu3Sz/SGnBzMU+Fei5s8jcYNuQa7
	 3YRGK0nFy0kzgJ+6P+OXNBdlFlXr+eowTEXGfu5HrEGRyK6lhOt2yMXdLPANF+iyvG
	 Gle+7yHXz7oFIb6G7+KyJijJzynqUUH4RvHXKgi6WZCYUP4hQUaaNae4v8tzMumDfV
	 33VJjlmPw3s4NmkMh+Fglj0U=
Received: from zn.tnic (p5de8e8eb.dip0.t-ipconnect.de [93.232.232.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 989CD40E0163;
	Sat, 12 Oct 2024 14:21:13 +0000 (UTC)
Date: Sat, 12 Oct 2024 16:21:07 +0200
From: Borislav Petkov <bp@alien8.de>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Message-ID: <20241012142107.GBZwqF01t-TX1J786b@fat_crate.local>
References: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com>
 <20241012140923.kl2evqb6aue2pzfs@treble>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241012140923.kl2evqb6aue2pzfs@treble>
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Oct 12, 2024 at 09:09:23AM -0500, Josh Poimboeuf wrote:
> On Sat, Oct 12, 2024 at 09:48:57AM +0100, Andrew Cooper wrote:
> > On 12/10/2024 5:09 am, Josh Poimboeuf wrote:
> > > For x86-64, the barrier_nospec() in copy_from_user() is overkill and
> > > painfully slow.  Instead, use pointer masking to force the user pointer
> > > to a non-kernel value even in speculative paths.
> > >
> > > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> > 
> > You do realise mask_user_address() is unsafe under speculation on AMD
> > systems?
> > 
> > Had the mask_user_address() patch been put for review, this feedback
> > would have been given then.
> > 
> > 
> > AMD needs to arrange for bit 47 (bit 58 with LA57) to be the one
> > saturated by shifting, not bit 63.
> 
> Ok... why?

I've been working on a fix for this. Still WIP.

Author: Borislav Petkov (AMD) <bp@alien8.de>
Date:   Sat Oct 12 00:18:10 2024 +0200

    x86/uaccess: Fix user access masking on AMD
    
    Commit
    
      2865baf54077 ("x86: support user address masking instead of non-speculative conditional")
    
    started doing a data-dependent mask on the user address in order to
    speed up the fast unsafe user access patterns.
    
    However, AMD CPUs would use only 48, or 56 bits respectively when doing
    transient TLB accesses and a non-canonical kernel address supplied by
    user can still result in a TLB hit and access kernel data transiently,
    leading to a potential spectre v1 leak, see bulletin Link below.
    
    Therefore, use the most-significant address bit when doing the masking
    and prevent such transient TLB hits.
    
    Fixes: 2865baf54077 ("x86: support user address masking instead of non-speculative conditional")
    Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
    Link: https://www.amd.com/en/resources/product-security/bulletin/amd-sb-1010.html

diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/uaccess_64.h
index afce8ee5d7b7..73c7a6bf1468 100644
--- a/arch/x86/include/asm/uaccess_64.h
+++ b/arch/x86/include/asm/uaccess_64.h
@@ -58,7 +58,9 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm,
  * user_access_begin that can avoid the fencing. This only works
  * for dense accesses starting at the address.
  */
-#define mask_user_address(x) ((typeof(x))((long)(x)|((long)(x)>>63)))
+#define mask_user_address(x) ((typeof(x)) \
+			((long)(x) | ((long)(x) << (63 - __VIRTUAL_MASK_SHIFT) >> 63)))
+
 #define masked_user_access_begin(x) ({				\
 	__auto_type __masked_ptr = (x);				\
 	__masked_ptr = mask_user_address(__masked_ptr);		\

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

