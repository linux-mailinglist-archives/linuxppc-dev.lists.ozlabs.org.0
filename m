Return-Path: <linuxppc-dev+bounces-2696-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A10609B5AFB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 06:00:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdZgL0spjz2xg8;
	Wed, 30 Oct 2024 15:59:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730264398;
	cv=none; b=Nv1Ici/zvskE9pDW4gnnq0tRO5NMeXGVZJmZSykb94pIicC/34x0a5DSBr3VEP989HpHPDNWUyEN8mVi3F+j7OpEcZbYCXg0q1YC81N0Q+cfVcY8D3d32w1ZYbWhYbm/WyVa2lBCvT9ZvSKyardZTsful72Dzu/k4Ku7xMNhG4ILjYcXAFLGZtprhss04Sct/S/981t79YKVgAutbErFrBPm7mWPjlltt1avDcxwFSb04Bqyzt6XKjWSRFASHbgbJMifNExyHgKIImRAZjjn7wVx+bakFl35F5z9odxMWjvbazaOjWRK0/qpZDZ0rZypOYM4as8HTJfg1GtcOwy5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730264398; c=relaxed/relaxed;
	bh=imKhoc36jUdqmNcNH19dO9zZ0ZT14Fwne9pXf+gG2r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UI8ySx21l9Ot4ZMZSwtrLkmcCL33hxGVL+U+pSDM9SNzpH5VzIEc6TkZAKzblbQ4QfDYPrpXlIF96BA+oDGJ7t992KcUXCgGLTS+CUbZwaI/D8tknoTNN4E4IcYQcQqOeKjNqsb7fNKza8Sblf/BfVY7fwlEsCOvowLn2agR9tBFqBDV4tZ9lVkfnuyZjfhzh6bVJvGEUidUku6Tn5NjhncP6g3UKHe4vAFMQMcZE3gzptu+F8ZTgKrbjxnHxOpuDwCyMs5detEkbp8qk2Sf4tcwuruZ9Ip6QEvuB0Q8BTPSiKI6tck0Eh+eZjY1htgAdSIZMX7Fl2OJH1AHn8GaBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GURAcYsa; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GURAcYsa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdZgJ6qRkz2xZt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 15:59:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 223A2A43556;
	Wed, 30 Oct 2024 04:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DFAC4CEE4;
	Wed, 30 Oct 2024 04:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730264392;
	bh=clwkCkL3BZR7sqMAfkQC96bSOyRLVozXznaixOXl9DE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GURAcYsarscbouOoVAkYLa3mgqib+mMtxhOmhXZhTMYl+WV9MczAevmN78y1o0Ssn
	 Zak27Gd4PMmkVsYjF9pgQ3Cy8BLzS1YOb9FJFO20epHkNoV1Yy2u59HmKuWRNK4o8D
	 vH5i1aHb8tJ0zf7HwYu1gZby+3jLyD/CSkmJ6/YxmXtX6axNYc2qqOpQtuG/olDzcv
	 RqQrUzVeWFHfTK4aVWGGBAypmeO8lUQxiOSmVs+d7rWEExPQ9+agnNlSRJlwtQN0cw
	 /KvBdv1H/m3SSx9h4vXVEd4GoPVXi0ZEJk71t8nn+wr8DUpfduK335zRcRxJmsxuMi
	 ReiuUH97ViYDQ==
Date: Tue, 29 Oct 2024 21:59:50 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v3 1/6] x86/uaccess: Avoid barrier_nospec() in 64-bit
 copy_from_user()
Message-ID: <20241030045950.p6fc7xnkd3rq2gob@treble.attlocal.net>
References: <cover.1730166635.git.jpoimboe@kernel.org>
 <5b887fe4c580214900e21f6c61095adf9a142735.1730166635.git.jpoimboe@kernel.org>
 <CAHk-=wgaPk0tB-RtVAK4b6dTrtTAC3WkL1LmGO==ATrDLL-DRA@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wgaPk0tB-RtVAK4b6dTrtTAC3WkL1LmGO==ATrDLL-DRA@mail.gmail.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 29, 2024 at 04:03:31PM -1000, Linus Torvalds wrote:
> Hmm. So it strikes me that this still does the "access_ok()", but
> that's pointless for the actual pointer masking case. One of the whole
> points of the pointer masking is that we can just do this without
> actually checking the address (or length) at all.
> 
> That's why the strncpy_from_user() has the pattern of
> 
>         if (can_do_masked_user_access()) {
>                 ... don't worry about the size of the address space ..
> 
> and I think this code should do that too.
> 
> IOW, I think we can do even better than your patch with something
> (UNTESTED!) like the attached.
> 
> That will also mean that any other architecture that starts doing the
> user address masking trick will pick up on this automatically.
> 
> Hmm?

Yeah, it makes sense to hook into that existing
can_do_masked_user_access() thing.  The patch looks good, and it boots
without blowing up.  Thanks!

Reviewed-by: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
Josh

