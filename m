Return-Path: <linuxppc-dev+bounces-12085-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F99B54F6C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 15:24:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNZsg4Hnmz3dFm;
	Fri, 12 Sep 2025 23:24:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757683495;
	cv=none; b=me1uOt8aLxvSI5E9YgAupCxRPmP1j9UiVVurM1HVXQWbeZGUQfzno74ac8m5FR5oIiy8MTagk2AsYb/n9GO+M0htY9Mpx+BqmIAcUA+C3Zln3HG2sKbZ8LQEe6sPrbU/bPhNR3YPuMKJgNKBGt1+e5DNRSFetn9mk63/Wf4fKsDRUeA1Kp33UKi54NeQbCPQmB0OmZV8/iv95KECxcjSbB/iskErfmXphzEAjgfszfNZp/Pvjo/r3pOwfgU0IKSgwbe7cc/k3fOM3Ov+JYPEVgd+loB94j2rWEaNo1iMYmGv9fVgnFvfTd+axq7vfig75Obo5v3kBdnc+K13ThXM9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757683495; c=relaxed/relaxed;
	bh=zog0kqBlhpuNaxjvu/lo373GkjPToe400+RXOsdRbH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfmGHfEvMMU+/ZCsLCCa2fS7VvD5AHxkanSbw7D1+6MeCiRY6BU+UBEZdl5/iu1XXJQLyj8ptlce+dN2ilu8k9Mh3weJ1Hx1l9lGCJrW0kI+z82H0mBQLpK/c4up9et8Qb1f2EOTXLVdFUg+IFfLHJjZNJoccXl3G203xKkfSfbmiBp6GoSwERoVwotzuOGU8HKWr3nBJ37ltrzs+mch1NyBkkqx2fYAbqU7sIg768ewnvZCfUrhIMYK/ES6VVYbo7T2zW4CUND26m22e6TR1qXsVsDfLu5bqC8Ke7hj2bB32w/0XOEkmkoHgqaccI840kGUkQJnrNh+gdOUMXQudA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNZsd71qjz3dDJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 23:24:53 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 58CDOWIi048951;
	Fri, 12 Sep 2025 08:24:32 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 58CDOVJU048950;
	Fri, 12 Sep 2025 08:24:31 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 12 Sep 2025 08:24:31 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/32: Fix unpaired stwcx. on interrupt exit
Message-ID: <aMQfD5M5yNmYxLho@gate>
References: <6040b5dbcf5cdaa1cd919fcf0790f12974ea6e5a.1757666244.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <6040b5dbcf5cdaa1cd919fcf0790f12974ea6e5a.1757666244.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Fri, Sep 12, 2025 at 10:37:34AM +0200, Christophe Leroy wrote:
>  BEGIN_FTR_SECTION
> +	lwarx   r0,0,r1
> +END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
>  	stwcx.	r0,0,r1		/* to clear the reservation */
> -FTR_SECTION_ELSE
> -	lwarx	r0,0,r1
> -ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)

Hrm.  So this is for V'ger (mpc7450)?  What kind of issues does that
old thing have with unpaired larx/stcx., some performance impact?

The extra "dummy" larx has serious performance impact itself, on most
implementations (also on all newer stuff).


Segher

