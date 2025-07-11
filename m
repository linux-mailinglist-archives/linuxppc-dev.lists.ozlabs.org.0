Return-Path: <linuxppc-dev+bounces-10199-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B36DB02796
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Jul 2025 01:20:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bf73f0PzRz30Vr;
	Sat, 12 Jul 2025 09:20:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752276013;
	cv=none; b=Bcw+jrZxRQy+GdZxB+Gc90ew+iTnprV0WsyhQRzHWtto9XXQ4WIPd6FLeu7b9gEfgH1ULN6OZSZcCRprjwKQD7PfaK9YwsdN//vuCzRMIcmez7pe6w2hMEy8yFpIJn/vqNR8GPrxe2ZWGKUFUaHyx8BdXqXMIfBg0RpyefZALD8ObRuwZf3AtxN4Ncpx+x8eXUT9vVEsE9pl/BPgsZUIz8HFdSnPEZCTUrlq/x5az9MvvVBstfH8iJ5sAZJKa1uMpEZfE/K1pDKBkNPszH/L70JlO1uWk2Ic0YoV1eDWOFhFyJxUBxfEiuYlcTSAXJRf+/C2cUC4LJhuIoE3bSt3oA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752276013; c=relaxed/relaxed;
	bh=HnNQWi8zyR7O99LV+ETTarMhaXac6kNrlR6Od5yG0ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nhqtx46U2UU2q+L2cIHPJ5VtFV3Kr/R3gQCEbr0waANRZ70Ki29Gi05oIwVZFeGxlVZCX1U+EO8EX3PbY4YDeZoxd+cMTNhR0iONeyd7eaucX8AgK5kPYufsfzzWeHR+jTghFoJ3eqPqqMpGgUB9d43dfX5sLECcCHdAtaTI4eF1zwXw55Q1xPz+EGS+k5T1I7OICUSjwBU8wel4Y+PCiEVxN1z9B/zGJcYpSDB2RhqbbndH5ehM6y9anFPPpcWzCka4Ed6TN+/zDnRIjeSFEPBjCh/EpwfgIJ8EZ+fzK77Gv4z9ijky33ytoOhXu/ThEqLWRXsb+jXmukiaLSRg2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bf73d0rpBz2yrj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jul 2025 09:20:12 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 56BNJptK624605;
	Fri, 11 Jul 2025 18:19:51 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 56BNJjtJ624601;
	Fri, 11 Jul 2025 18:19:45 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 11 Jul 2025 18:19:45 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Huth <thuth@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, linux-spdx@vger.kernel.org
Subject: Re: [PATCH v2] powerpc: Replace the obsolete address of the FSF
Message-ID: <aHGcEdTmhlsfx7Tz@gate>
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
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
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

Almost.  It is called the "GCC Runtime Library Exception", and it is
about a lot more than libgcc, although that of course is one of the most
important things it covers :-)

Not linking to libgcc is a foolish thing btw.  The main reason for it
originally is to not have long divisions in the kernel (for x86
anyway!), but not using libgcc is neither sufficient nor necessary for
that goal.


Segher

