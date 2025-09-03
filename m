Return-Path: <linuxppc-dev+bounces-11652-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 096C2B414CF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 08:16:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGsn84Fwjz2yrV;
	Wed,  3 Sep 2025 16:16:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756880172;
	cv=none; b=V7ZW6fLCZNpx3CUQvwIdfxBq0jJDgHuBN/v4QlSFr8YNqPXVT9wfeK9WJqOEoVfIVDBsdpIUmgyFZfyt8IPPTDxqvGSAhEIwAKM2gvm1E3KtIunBj2VS7E0Y1iuJdf2ieSx583cAEpmLG53tvBPNzAaJDIMyn62WdWXFI0zaRREPr87QpVr3NLCLa0h5wz3g/HhdOZZQgPjcE1uD2Togh4K69U10blPyquY3MhpdA767vZOhZzc3DFn4RMapYU/TjccpsaxUyAJRIo/vPIdH2fPWiDQR2ediQi5kJ6d5ujGe9ZnNY6iFQGffaJvBZ4XNCdSNqClNZoNGO5aHiFBV7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756880172; c=relaxed/relaxed;
	bh=pVH77k9WVfNagR7TnzL3kxZFduWcqv+jM0mglh+AsHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/R0RCbtoAsykc5xBU9fHDcwsAzuMHaP1nWi4Axg9fKfa+K9+9S69BPD171Pximu/nTcDgt0z0c52CDpgcwtXPy1KnmzjfGD16iaBVMD6EE1wXdBmCeL98Ex96Ey2bzzmSxWg7tFRk38MgOTl01OpkRvRuG83nEyU5jtSVykouUc7fvtc6MbFQJbr3JehgyhFDpmfCSZ0PG041yweERKLsMt8NHx29o+v7LgXdMSw2V2uEvpLe4+Z80VFsAcjunv8fYpJdgWnM0dh2f3HtmVO3le/vConp/A3qa6hagwpWpRV1nEmh4XF6Mbh8Cg8QrbGwsCEV4zaCUeQxfUuMV/iA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGsn40wPsz2xnw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 16:16:07 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 5836FdIZ3679080;
	Wed, 3 Sep 2025 01:15:39 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 5836FcKJ3679079;
	Wed, 3 Sep 2025 01:15:38 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 3 Sep 2025 01:15:38 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5.4 only] powerpc: boot: Remove unnecessary zero in label
 in udelay()
Message-ID: <aLfdCkj4z99QmfMd@gate>
References: <20250902235234.2046667-1-nathan@kernel.org>
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
In-Reply-To: <20250902235234.2046667-1-nathan@kernel.org>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Tue, Sep 02, 2025 at 04:52:34PM -0700, Nathan Chancellor wrote:
> When building powerpc configurations in linux-5.4.y with binutils 2.43
> or newer, there is an assembler error in arch/powerpc/boot/util.S:
> 
>   arch/powerpc/boot/util.S: Assembler messages:
>   arch/powerpc/boot/util.S:44: Error: junk at end of line, first unrecognized character is `0'
>   arch/powerpc/boot/util.S:49: Error: syntax error; found `b', expected `,'
>   arch/powerpc/boot/util.S:49: Error: junk at end of line: `b'
> 
> binutils 2.43 contains stricter parsing of certain labels [1].
> 
> Remove the unnecessary leading zero to fix the build.

To fix it by getting rid of this syntax error, you mean?  "00" is not a
valid label name: a) it cannot be a symbol name, it starts with a digit;
and b) it isn't a valid local label either.  As the manual says
> To define a local label, write a label of the form ‘N:’ (where N
> represents any non-negative integer).
"0" is written "0", not as "00" (or "0-0" or even "0-0-0", hehe).


Segher

