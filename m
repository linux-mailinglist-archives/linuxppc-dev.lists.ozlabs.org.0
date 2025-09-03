Return-Path: <linuxppc-dev+bounces-11692-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F26B42B9B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 23:14:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHFk23XsHz2yMh;
	Thu,  4 Sep 2025 07:14:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756934090;
	cv=none; b=NifxpOGbCxt+HjKFVdQPrGkeq4NaePBEt6Rs+KqcUXnBk/5syLnO6kYCcJimupJfTAtazR5xezYMQglLLDnFOJHzUO4oNoTJtfIQNZZhPnlVYTHvvR03uuTGim6UfFJr3Q/xv8/10/e/zPVQg+fCFXZEyWXfAT2nxwaasGbkw5MfY4PklLOXAyuj0zfbBeN9qkrvWdySMak+q6s0+9IyfwBSOHK6ZvMS+8zu4eVb05RJp5D04c4rikpDO7HMElNfZxdo7N0JrG4XBOhGqo7X/7GTzgMsaAdiq2mGXv13eFaerzEoxjWbfHZPWUJTZKlTU5uPk47RyG1S8x3h2qn0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756934090; c=relaxed/relaxed;
	bh=t1HDoqW6bNjex02izcD150c+2lF54Uso0qZKrB043rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enQkWHZsz6lAWDMzwzTZcSIHoxcupFlHf3cTbjz8gNuqm63osBfsdPFRuPhYB3xc5D3NiYnP2oZu+T+k9BNcC6fWwunWLsEY3GvUWy9JxgY6VttPA6BxE1paiO3pfjPWYLpYsVDDM+oilte9TM5t4jPVJhlQJ1YchowdziB8ptyTqQFPhrWPtkhdXFwJbJpF+ktUc+i0v4X8GN/U1nizdECFqemMw1mMp7BHYuavAcK1s3hzGXYCyu6o5+4o+O2bjEgo0F5Mi5bht2zUlALxok27IZlNKp4vucq065jS+JWsIgVKJav5T2kTCTHsJ13FxhEW/XLX3XoSWdHbBKtaEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ClZjpyKW; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ClZjpyKW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHFk05Y3Sz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 07:14:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF9C86013F;
	Wed,  3 Sep 2025 21:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9D6C4CEF5;
	Wed,  3 Sep 2025 21:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756934086;
	bh=4MXZl0VJ/IF+a02geJUNod5lzrf1oVb6NF5XHEnOCEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ClZjpyKWkJt0awCh9NN9x48sf9IQUIXPOtYurFCukjyk4oby1SCAnmv9dtF+XQEzz
	 7t1nxz4BBTrYOpZjWoRs/OWj+IasnDEiCvkNixiNHdZmOgA9rNtAG4F2X9h//qcNZ1
	 RQ83KvEQYjJ5LsoqkimUImH6cubfE5mXmbtTVl47575ZnIrK4vjGnTYD4Ut2m6uSs7
	 4gaDWdI0/tmgDbPLI9XPMZOPwMqvLtxCtihjFoyhSSeqM6TG69F29St4p10ix7R81e
	 r7HRrm0N6dWs6fndZ6bho63B1CZ1ZvUWWaP8xntQ6nogfFDAK5M4WIOlymEJpGX6hg
	 4v20/Kjzlmnhw==
Date: Wed, 3 Sep 2025 14:14:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5.4 only] powerpc: boot: Remove unnecessary zero in label
 in udelay()
Message-ID: <20250903211442.GA2866185@ax162>
References: <20250902235234.2046667-1-nathan@kernel.org>
 <aLfdCkj4z99QmfMd@gate>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLfdCkj4z99QmfMd@gate>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 03, 2025 at 01:15:38AM -0500, Segher Boessenkool wrote:
> Hi!
> 
> On Tue, Sep 02, 2025 at 04:52:34PM -0700, Nathan Chancellor wrote:
> > When building powerpc configurations in linux-5.4.y with binutils 2.43
> > or newer, there is an assembler error in arch/powerpc/boot/util.S:
> > 
> >   arch/powerpc/boot/util.S: Assembler messages:
> >   arch/powerpc/boot/util.S:44: Error: junk at end of line, first unrecognized character is `0'
> >   arch/powerpc/boot/util.S:49: Error: syntax error; found `b', expected `,'
> >   arch/powerpc/boot/util.S:49: Error: junk at end of line: `b'
> > 
> > binutils 2.43 contains stricter parsing of certain labels [1].
> > 
> > Remove the unnecessary leading zero to fix the build.
> 
> To fix it by getting rid of this syntax error, you mean?  "00" is not a
> valid label name: a) it cannot be a symbol name, it starts with a digit;
> and b) it isn't a valid local label either.  As the manual says
> > To define a local label, write a label of the form ‘N:’ (where N
> > represents any non-negative integer).
> "0" is written "0", not as "00" (or "0-0" or even "0-0-0", hehe).

Sure, I have sent a v2 that hopefully makes it a little clearer that the
code in the kernel was already problematic under the existing rules.

https://lore.kernel.org/20250903211158.2844032-1-nathan@kernel.org/

Cheers,
Nathan

