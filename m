Return-Path: <linuxppc-dev+bounces-9259-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7589AD43A3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 22:21:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH0YC6V7jz30GV;
	Wed, 11 Jun 2025 06:21:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749586863;
	cv=none; b=PRXT9nyZBkllHF+p4R4HFcHJoi6BpN1ghmM1DbCfDES2hsptJ+YGN5nK6EQXJ/p/lguvAeb0jfa/hDh9BjdY+/H6Ee79eBTdSzavqPQpdCTLe5xwcyukEix0DWOYDZZZ78R3R2BUaIb/LWeG0mhPzIQkbBu9JGyQxYZKdhikHLzBwljTw1lcQqWuC+7UmgV/ArNqb9bYXTmtK+AnwSghwMt/VxX18Lily/9831KmgDEnR8olW+hTnEVVFdkV7kbJBElCu8YoH8uw1z+Al53Wd+8ZzXdBEWTSH4NmGsOIDfzfqlABtwcZTga+zMe4S6KPqbnvFoi/0hxuWlB2/bK4yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749586863; c=relaxed/relaxed;
	bh=x72o0WxVkmCFk7zb5IksmHWyU4h++gWCUvWBisSeZ3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QEyum0DqD1FPO8iRUpuoOm3ju4R5lM4FHsWcNmo1aLcsuxK+H574bv9+T6he6ryWmeRS0/GzRNa0ZKdpMjtqyyIZdVEPOswEWDapCzMiuO4enOONjnyguFJIFMfGB1a2utJZ6SAFOFQ1V3aI+sPp6MXs/9r3sdpH/7W6079k7dWIdE/ZsDCMmzUr5H5QwJLTQfUiSLQ0HPUXXWJ+XXkvVglEF2y7sriQASFHAYazXSEmVExal98LAY458mMmhEzg+jjDO1DGNZSO916mJIBOWiguaeYlODykCnq95jeMGxWAq0aC57klnoQj8QTOXTDnRo0iuwlmE9CmvLIzPxiLdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH0YB6Nv4z2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 06:21:02 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55AKCjUV015015;
	Tue, 10 Jun 2025 15:12:45 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 55AKCilP015012;
	Tue, 10 Jun 2025 15:12:44 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 10 Jun 2025 15:12:44 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Thomas Huth <thuth@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Geoff Levand <geoff@infradead.org>, Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH v2 1/2] powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
Message-ID: <20250610201244.GF30295@gate.crashing.org>
References: <20250610160128.69033-1-thuth@redhat.com> <20250610160128.69033-2-thuth@redhat.com>
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
In-Reply-To: <20250610160128.69033-2-thuth@redhat.com>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 10, 2025 at 06:01:27PM +0200, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> __ASSEMBLY__ is only defined by the Makefile of the kernel, so
> this is not really useful for uapi headers (unless the userspace
> Makefile defines it, too). Let's switch to __ASSEMBLER__ which
> gets set automatically by the compiler when compiling assembly
> code.

Assembl*er* code, yeah :-)  (What is "assembly"?  The dictionary says
"An assembly is a group of people gathered together for a particular
purpose.", but that is probably not what you mean :-) )

The patch looks fine, thanks!

Acked-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher

