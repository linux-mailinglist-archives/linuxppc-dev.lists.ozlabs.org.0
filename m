Return-Path: <linuxppc-dev+bounces-9676-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86840AE6698
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jun 2025 15:33:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRQrd4ctZz2xlK;
	Tue, 24 Jun 2025 23:33:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750772017;
	cv=none; b=ceYe4oQgoIPmqhY7Bnna5kLXzrGrsC1hB6tVzj/ZhKWsBtevk0q4FBDbfiNNBO0a8sy1BH+kufsr2sl7Usean4RzdT+wpQmOB3n+kjjhOSmzfDvHZmAwGF6YchiWEuazjRGKYI8f75d3A9ZiXLADYyHr1/5niZPX9LhZEXo82c6VB9l8vgih/d+jZlRox5m9vRwpFWS3fHuB3/n8ynbupqmc32JDNzPfJeyJy0Vo7DTvp67pL+u2WQIzDCnsyVnT87C3nj5DshbjR4FYYgGCXgUk/e78lAt4uexQ5SLhS+Fl8laYdh6J/MN1TaygmtfYgvySgjA0AiefH27Mp6KFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750772017; c=relaxed/relaxed;
	bh=691ttiBDJIdkODJscPLuyaSKn7jnRfewEk9Xj2GdrD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBFbjcK0HstDCelL1tQAwJnkju78wZarplMspTAfjZXu7z1Evha0Vyd+PyJdZ9CI6Le6t08aPV1yKGyuhCMY4dC4VivbIq3fF9Sig422aIvkkgNl6DTXhzt08D0YcxRaZgEqQFjoWwL6RbAJETr1Va7Z2BTmkq1VI9XHGJxR4bfgP6BKUvaAHXtRueVPIUryVcHS7UaVYvKP9wdC9cfJaUvdGSzJbwsd/qMyp7cUdeeR95IEnODdJZQ5jBxVj/fSzoK1v/0u+VyTbuLJfrbA0Nf/goasdKlJJFm3fGkdO4d2YDQ8eFhrPfo/NGeioXOUvk0NRp8fMXgv5kWE3/W31g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRQrb427Cz2xk5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 23:33:33 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55ODHH69017475;
	Tue, 24 Jun 2025 08:17:17 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 55ODHFe6017474;
	Tue, 24 Jun 2025 08:17:15 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 24 Jun 2025 08:17:14 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: David Laight <david.laight.linux@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Andre Almeida <andrealmeid@igalia.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/5] powerpc: Implement masked user access
Message-ID: <20250624131714.GG17294@gate.crashing.org>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu> <20250622172043.3fb0e54c@pumpkin> <ff2662ca-3b86-425b-97f8-3883f1018e83@csgroup.eu>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff2662ca-3b86-425b-97f8-3883f1018e83@csgroup.eu>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 24, 2025 at 07:27:47AM +0200, Christophe Leroy wrote:
> Ah ok, I overlooked that, I didn't know the cmove instruction, seem 
> similar to the isel instruction on powerpc e500.

cmove does a move (register or memory) when some condition is true.
isel (which is base PowerPC, not something "e500" only) is a
computational instruction, it copies one of two registers to a third,
which of the two is decided by any bit in the condition register.

But sure, seen from very far off both isel and cmove can be used to
implemente the ternary operator ("?:"), are similar in that way :-)


Segher

