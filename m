Return-Path: <linuxppc-dev+bounces-10187-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D5DB014D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jul 2025 09:38:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bdk9R1Q0xz30Qk;
	Fri, 11 Jul 2025 17:38:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752219531;
	cv=none; b=F2tetBOm8P3LzLHmgX0Qu+68c6or3Xt/IgVw2949J5wxJs78QnBykLZjI47zGABrLGGUZSMKxR75kQEgNncTdDYhpvOQxJH0q6L06GER3pGpxRVBEuQQ890quTEM2S5lsOcGPoGfmC97NtpRl+kRAt5AnS9/8YXmUupbhpMw0/93yGr6apotmshhZcDgZOwFP8N+QcZfcCGRUiqBjlwOuUTwWBA+iKCWAPH8wqxver9jOhHeTi4c00ySyIoxM0un7+MjoVKtJzcdNVfNXnAquLG8od4wdyHZjLb1B3sfTjwDRO4bBMOd+yG5/EozhbooKsezn0bFbBFSZoYH0aDqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752219531; c=relaxed/relaxed;
	bh=bf87/HMHKIbzXavjsV8JJ1zj7J7XTbDBnRfckBO0En4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laBPuScvPPWolUfX33D3WTbZaacyIFL+WBUV4ZxRcI9VXrnOsrBY3WSpfkPcVgmmViquCmRBM/EISj48u+/pibnT7toXhePs5tK12BAPJHJEDVt5JOWSoBCZ1/z9hP3E55Y3rAPC/n/OCvc5ZtZ3J25qz5WWswb/u2JZqWsYwv23wdwyuJHqOeLUNdckrHn2fEMMONhIwhUU0zQ1SJd0Q2n07eMJ9xsEU7SH8kBqbrGbngL+HMjzOMQpfTDotWin/1e2sW1BweHOMgBPbEYgmG1/A81UhVZ/d3fhl+uBUIaFmgbjoIfJFO64ynjHuxRdd6wlBuanBvyUp7ORLaGHRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Oi1lj1Ye; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Oi1lj1Ye;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdk9Q2xRzz2xHv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jul 2025 17:38:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 01E155C5C08;
	Fri, 11 Jul 2025 07:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586CEC4CEED;
	Fri, 11 Jul 2025 07:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752219525;
	bh=qBfAnNPFlJIvLFh79dRJlYctXmYnodTHUO9RBCiagGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oi1lj1Ye9Z7o1T1LwRuh0e+RHwXKmqPAc4qr087+696O6Zj6YB6UOvtzxC0Zk9RuD
	 b9wNyNfKdZIjrzeede/wPlhZDESnY9L7s0blVMHCWovinGzz+NRXB11J2ybr70uBZc
	 2IlZ+lst1GVXs5DJsu/yk2pY/6D0fTDbSGKrmNYU=
Date: Fri, 11 Jul 2025 09:38:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Thomas Huth <thuth@redhat.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, linux-spdx@vger.kernel.org
Subject: Re: [PATCH v2] powerpc: Replace the obsolete address of the FSF
Message-ID: <2025071119-important-convene-ab85@gregkh>
References: <20250711053509.194751-1-thuth@redhat.com>
 <2025071125-talon-clammy-4971@gregkh>
 <9f7242e8-1082-4a5d-bb6e-a80106d1b1f9@redhat.com>
 <2025071152-name-spoon-88e8@gregkh>
 <aHC-Ke2oLri_m7p6@infradead.org>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHC-Ke2oLri_m7p6@infradead.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 11, 2025 at 12:32:57AM -0700, Christoph Hellwig wrote:
> On Fri, Jul 11, 2025 at 09:30:31AM +0200, Greg Kroah-Hartman wrote:
> > That's a crazy exception, and one that should probably be talked about
> > with the FSF to determine exactly what the SPDX lines should be.
> 
> It is called the libgcc exception and has been around forever for the
> files in libgcc.a that a lot of these low-level kernel helpers were
> copied from as the kernel doesn't link libgcc.

Ah, so it would be something like this exception:
	https://spdx.org/licenses/GCC-exception-2.0.html
but the wording doesn't seem to match.

I'll let the license lawyers figure this out, thanks for the hint!

greg k-h

