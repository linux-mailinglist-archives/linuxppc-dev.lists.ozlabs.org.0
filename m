Return-Path: <linuxppc-dev+bounces-5334-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BED11A13694
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 10:28:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYcxV3tr8z30WC;
	Thu, 16 Jan 2025 20:28:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737019726;
	cv=none; b=IkPDQoY4z/tWRaw38wQZOgEleBMKAUnUjxriuactjLLGgiF5urbu/UiWRngTeNkg0esn4FVZHkAE1VlRDucVGQ6CUYzOzfD4kqln/ylS91rsKY2aWgzxSqX5WRxjotd/TJ+BDxi13/EkMMHyC+cZwB0a23W/e2CfgtpiqBzhZy2ggcz4cUO/V8bzUBL3ARbZA6A1nTtA/hc8aUoryhwvNfGxca+BXVTgQGoZFnFL5Rc9cATpzKB7rR+prjjyMxTvn+YZJaf1rLRcYsBE20OoH+rThgJ42PatPeAs7aiZ/aNwo/pCJjtz4PsKzWcKCB7i/C0TRUYoigxYEwx+j3Q+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737019726; c=relaxed/relaxed;
	bh=Z0Iy6G1ZUP0wTa1IVULCyE4DXrqOGuwbr9pw93Rn8q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIRd+Gtvzm1c0RO1TvHQuQpWdze65X72+O9dghFDr0I/3MCB0wn2l4LI3g9Yry2E7h1OeoJq5UnX18aDJThNsfS8BO0jgXs188cctV6SWsX96knMH0JmPCwpFkgQHTvNBDdcB7pRv9FjrDSyuuixTmQiFmlKapwFwpcDpk2uk62+dIXEbflTS+FHPu27TGS9phNvcZGiwdG1uWsHLorS/wN0tuDEDw7ifRMeM7VUfG+cQjqB9Plun5shrMaFkDssBJehLc8Z1kOBHIiUWBjLCWQZ8hM/o5ycJhDkuJZ8dn568HcKvYSeD6p54PBmMaOTId+Z6nW5O3dyAAVikMB/4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TPh4Nsho; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TPh4Nsho;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYcxR24Btz2ywS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 20:28:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z0Iy6G1ZUP0wTa1IVULCyE4DXrqOGuwbr9pw93Rn8q8=; b=TPh4NshoGx/paZseZCheS8u4fL
	V7N1zZ0cHmuC6v28KFSe6EQpQZZmb0QUDFbCxzlhM2Q6MQwdVEPv6lxdcH4+OXobM/U6Ffc7hp+2I
	6drY/2I7fJ7jLfojHbnG1FlE+3j82ULfvJ48CYk4g7UPsMYLDjmXZE+sL4BZOw8Ryv2WGpiBxFJai
	4YXfk7Oaq4D4W8qiBw3wdgGPPdqUCUbIjaIuq8Dl3ju0K/lQweDe2k62o6obSxyewZgOUhqcY4meT
	NY4d2sJkSiZM1DNtBkpxL6tu5Pk3xs26qoUhhjpmTRzGhcjpPCgXWuaSOhz3CT0ebUsQP5jXRciZv
	64DU8LcQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMAy-0000000B1dK-2sxh;
	Thu, 16 Jan 2025 09:28:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 19922300777; Thu, 16 Jan 2025 10:28:32 +0100 (CET)
Date: Thu, 16 Jan 2025 10:28:32 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Julien Thierry <jthierry@redhat.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Raphael Gault <raphael.gault@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5 12/15] objtool: Add support for more complex UACCESS
 control
Message-ID: <20250116092832.GG8362@noisy.programming.kicks-ass.net>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
 <64a6921ec7bc78c4b25561cf13e8147f26e884a6.1736955567.git.christophe.leroy@csgroup.eu>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64a6921ec7bc78c4b25561cf13e8147f26e884a6.1736955567.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 15, 2025 at 11:42:52PM +0100, Christophe Leroy wrote:

> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 91436f4b3622..54625f09d831 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -2422,6 +2422,14 @@ static int __annotate_late(struct objtool_file *file, int type, struct instructi
>  		insn->dead_end = false;
>  		break;
>  
> +	case ANNOTYPE_UACCESS_BEGIN:
> +		insn->type = INSN_STAC;
> +		break;
> +
> +	case ANNOTYPE_UACCESS_END:
> +		insn->type = INSN_CLAC;
> +		break;

I would feel better if this had something like:

	if (insn->type != INSN_OTHER)
		WARN_INSN(insn, "over-riding instruction type: %d", insn->type);

Adding these annotations to control flow instruction would be bad etc.

