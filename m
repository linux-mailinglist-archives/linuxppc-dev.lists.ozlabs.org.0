Return-Path: <linuxppc-dev+bounces-3792-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 447D39E3C73
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 15:16:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3KMW0mJpz30Tk;
	Thu,  5 Dec 2024 01:16:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733321799;
	cv=none; b=ob1eaLSLUx6qCp7ul5BM/Q8bSgWjH2X+U3yCxqoAkH7fnD0HRNnq8Ydk7xAZMxTRIBdZg2/tEsCgcOm/OgtYW/UKk1fBzyD5jEruSkCaiPuYvpiEhMquTvx18Ajrzlr01UBqpwewZHTwpDiJ9ARWCUNckwKAuPQ6YyUmyXoM40/uQYzwrWMkVcK+nQJMKMx/WT3zFgOtKIH7Su29MbMOXjgl3kXYxmMThU6PXCdC9m+WkJrm0Qk3WHUXhF0ydeKy/leFegmyYjB6QaEBf6CIke8hbAB3pswJRp9tdDepT+DpSnVvqnc7coBEqXZtjX5qAn8Y94ZgNWzo0gsBJrBX/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733321799; c=relaxed/relaxed;
	bh=iL4udhcYZijGOVW6eAYFdZXq8IZC3X/ZLuXpcLqVsEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUQsrYuAKFDpgJQziV0PdoBWyyCIdaYqJiA3HqVzCC9NDdr5R2Z3NT+UoJBgoQa19emYBX8gnNczsee4qDL+zO/rLpc73nJIR9IJ6yzFX5rdqSV/bE0a6cuuEIlxwH+iAQnki6asQmcP5FFllQmg55WX5w/alq7A4FX4Q4D1hsqD0Vk9KJU8kbwvEDTgkKL+m3t50LzYakJqH62q6QTp7STDpk5fjExYzxLZtAqeRAth1af/36y+ztuipUD0Ia5sLy0VUxGp95A4nPyZZtTkEicCgdPQ9X/dEi3MqH9VX8hZB+2qKNyMoqh/q/yFnoIW1FzIjIzfV74ApOkrAI+4Uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3KMT2DQ1z30Sx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 01:16:36 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4B4E9ZrU015093;
	Wed, 4 Dec 2024 08:09:35 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 4B4E9YNa015085;
	Wed, 4 Dec 2024 08:09:34 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 4 Dec 2024 08:09:33 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 2/4] objtool/powerpc: Add support for decoding all types of uncond branches
Message-ID: <20241204140933.GV29862@gate.crashing.org>
References: <cover.1733245362.git.christophe.leroy@csgroup.eu> <0ca71a4b0ac679ea52bd9fdd1f607195d72b499f.1733245362.git.christophe.leroy@csgroup.eu>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ca71a4b0ac679ea52bd9fdd1f607195d72b499f.1733245362.git.christophe.leroy@csgroup.eu>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Dec 03, 2024 at 08:44:50PM +0100, Christophe Leroy wrote:
> Add support for 'bla' instruction.
> 
> This is done by 'flagging' the address as an absolute address so that
> arch_jump_destination() can calculate it as expected. Because code is
> _always_ 4 bytes aligned, use bit 30 as flag.

The AA field already is there, so why not, eh :-)

> Also add support for 'b' and 'ba' instructions. Objtool call them jumps.

> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Segher Boessenkool <segher@kewrnel.crashing.org>

> --- a/tools/objtool/arch/powerpc/decode.c
> +++ b/tools/objtool/arch/powerpc/decode.c
> @@ -55,12 +55,15 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
>  
>  	switch (opcode) {
>  	case 18: /* b[l][a] */
> -		if ((ins & 3) == 1) /* bl */
> +		if (ins & 1)	/* bl[a] */
>  			typ = INSN_CALL;
> +		else		/* b[a] */
> +			typ = INSN_JUMP_UNCONDITIONAL;
>  
>  		imm = ins & 0x3fffffc;
>  		if (imm & 0x2000000)
>  			imm -= 0x4000000;
> +		imm |= ins & 2;	/* AA flag */

You could of course put that together with the 3fffffc thing, but you
can leave that to the compiler as well :-)


Segher

