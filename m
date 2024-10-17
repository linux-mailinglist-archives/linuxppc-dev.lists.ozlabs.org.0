Return-Path: <linuxppc-dev+bounces-2362-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8579A9A30E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 00:42:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XV2sm0Yhbz3bcP;
	Fri, 18 Oct 2024 09:42:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729204972;
	cv=none; b=nteRHb2obQLalJRk/a82Br66qE7FGmUX7X7iSHInL+5HPXww54q+mIovv9su9fldL6Was6WRALInC7Re5w+2ooC7v00Xy5vLXx+ijmlRnmIkJwBEqLlJ33i/8vJ2aAvvxw9PpSsyzDBKWQtiMx2Wyktx/mKV91Qov9Zg+3N6Kgz/DHmCMTj3UshiP1L+DJPa/xncrDSNTMNSqfoNSMfwWvS0Lg8MJbtUeYrXESKYCa9iTihQhmOzVU6LI/G6ltZ/dN3GeXqHcP51wt71lCQtUvDe4+pDUE4bJ6dbTu7qCTUX2X+3bSs6LR2XRh8cUUwgS84HnLj+IbVE1jcKTXxcxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729204972; c=relaxed/relaxed;
	bh=9gm0X5d1xKVvYO85SPc46hSVfRzU0HQXztOUzzQ2/lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiTGShcCYKwFvE96rbcnhf3SmFunrfwDBhMZOVf29BlI6qo/BYSz1K9NLIqcOfw/wYSWYXfDHb7oMOVelT8uzv4qHhiDZdkF5SM3WZ5ThGSrVxdjcnQiIjoIIMcCQUbF7WTI47A01OJeCmVi7zMn2mSvQrxgKiXvy6571cyTUBoRVih/WotHFErA+bbk6uT7LLlnYPuPTHoMjHs2L2ud0Elmee6WlRrG9LPk0Cducpjt9gjqF8/HIi1YempZ+TZu+7LX3txh30/A6uDNkJN6R/lh2P0/wg+wED69gdo3wKuYI5CMgWmKUe5XMTTsm6nexDIuQzUFvLSO2Ar4isX5kA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OKbqSTVB; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OKbqSTVB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XV2sl1bhtz3bbn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 09:42:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C418EA4451B;
	Thu, 17 Oct 2024 22:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FE8C4CEC3;
	Thu, 17 Oct 2024 22:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729204968;
	bh=JHtXMaB+CPINg+B2vnayFI8jLb4ohNW0ndJszacXDdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OKbqSTVBk5in3oaJm16Cu8TrK3dMAju+EqjhWQVO0uyQWvf3ROGYOAEY1Bdzraslj
	 VKSYT3M6sB9TQysgCUGRvqVPF7s37PIWMECySqi43QDVrJtYSlfSL9G17elD+ZFYmZ
	 GCzDtQOcW7rVBECyHJ+IR74xt3/NbjqDMFArnZzXiJ9F/eXMalfuiyp/iKZ0bgNCLJ
	 vM+3W0OmnWkjjNHCPwvDyJJyT0hqjaRPEBLOuZNGjdoLHhfeUwo1S6lU/Tl5ed21Pr
	 ZYfZFMDuPANvrMljA1iya1rOgq6J+SqilS1Ak6HNZp8Oah90EJvVXM1TQ7p98BCnYg
	 957xWZEfcbRlA==
Date: Thu, 17 Oct 2024 15:42:46 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v2 0/6] x86/uaccess: Avoid barrier_nospec()
Message-ID: <20241017224246.5pcgeeiforndgiha@treble>
References: <cover.1729201904.git.jpoimboe@kernel.org>
 <8baa42b8-2529-44d8-99e5-341132c09264@citrix.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <8baa42b8-2529-44d8-99e5-341132c09264@citrix.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 17, 2024 at 11:31:30PM +0100, Andrew Cooper wrote:
> Even if you can get Intel and AMD to agree that STAC/CLAC are really
> LFENCEs (and I think you'll struggle), they'd only confer the safety you
> want between a real conditional that excludes the non-canonical range,
> and the pointer deference.
> 
> Any path that genuinely deferences a non-canonical pointer is not safe,
> whatever serialisation you put in the way.  The attacker wins the moment
> the load uop executes.
> 
> The final hunk of patch 1 is safe (iff STAC is given extra guarantees)
> because it is between the conditional and the deference.  Patch 4 is not
> safe (if the comment is correct) because it removes the conditional.

So the naming is confusing:

  - put_user()   implementation is __put_user_*()
  - __put_user() implementation is __put_user_nocheck_*()

Patch 4 only affects __put_user(), for which the user is expected to
call access_ok() beforehand.

The current implementations of get_user(), put_user() and
masked_user_access_begin() avoid the conditional.  Those are the ones it
sounds like you're worried about?

None of my patches remove conditional checks.

-- 
Josh

