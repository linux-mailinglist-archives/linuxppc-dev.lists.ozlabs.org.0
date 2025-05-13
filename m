Return-Path: <linuxppc-dev+bounces-8542-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 058D1AB59FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 18:35:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxhsP0q1Qz2ygH;
	Wed, 14 May 2025 02:35:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747154105;
	cv=none; b=BAJEJF0Z6r0JITx/PCpQbIgSucWGfKVCWEJ96iXPd60TamByVhaJMCAM/RE04Luwz9qpAUc8YUJorO6KWQpt8sYPM5GknV4EWN6t2d8MGgX8lag+Ut1r5dr0vv2OIalY5hmkndU4GMs7ZqzgzlknnEykITwfJMiDokb3xI2tTHnnE/5yS5LU+hF40FqgbWz7Qe03tyDIxlHAr8WbJS2OzAdw8SKVH8hntyeAZbvfWOzC45AR2fu6uJeo5b5+S94sxSOK5teXXouJXFiCNJjwR+3Aa9rCgWB0ghVHoJjC7amvPohN+NnONGfYhNXoOTfVR0sa3pbNOeq0y7Uwghp9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747154105; c=relaxed/relaxed;
	bh=eA9Sqm5EoUL3YlBrqumQNpHU+p67ZyrnjeEzlKy4Nlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0ZtXOiSYGUd/Abs+/1PdN67pr0nuwxJzJjKR6n/6SPd8xcmIxOQDEVwo6r7Vd6R3s+Iy+VuqzpG1CeCTujmj6j+zSVBPuigMTLuH2+xeg8dzOS/k2WpkLglsemG09tL7V2hiR+yUVWGMU9Wfv9vm6isU4dLz7kyhEAeyzPkBrscCZAFu/a2T6ieXzrwJe2lLOUcaTnqCNkhLJKsI3002zyX1pyAeL7QGKYc4JaE0jmIpnXNZl7TqzBA37kpER8ecIGYCMZZNictTx+YS9QYGJr1ELTZ8sVOIKWY/WzzIOZ8puTPTn2uy5vLNTmB4Disr097zPzGics+vesj1qt1YQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxhsL4zxbz2yg0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 02:35:01 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 54DGVovs008981;
	Tue, 13 May 2025 11:31:50 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 54DGVmcK008980;
	Tue, 13 May 2025 11:31:48 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 13 May 2025 11:31:48 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@ozlabs.org>, linuxppc-dev@lists.ozlabs.org,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Crash in __do_IRQ with gcc 15
Message-ID: <20250513163148.GM30295@gate.crashing.org>
References: <aB6teOoVLWkdvyBu@bruin> <87y0v2sdwp.fsf@mpe.ellerman.id.au>
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
In-Reply-To: <87y0v2sdwp.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Mon, May 12, 2025 at 01:31:34PM +1000, Michael Ellerman wrote:
> Paul Mackerras <paulus@ozlabs.org> writes:
> Are you building with pcrel? Otherwise r2 shouldn't be getting used as
> an ordinary register.

With any ELFv2 in fact, which is implied by the target triple.  PCrel
has nothing to do with it (well, indirectly, functions that use PCrel
less often need a TOC register after all).

GPR2 usually *is* a normal volatile register in ELFv2.  (You detect
ELFv2 by checking if _CALL_ELF is 2).  If you want to treat it
differently (just like on other ABIs) you'll need to arrange for that,
maybe using some inline asm or such?  Ideally this will work everywhere
of course, and you do no longer depend on it accidentally working
elsewhere :-)


Segher

