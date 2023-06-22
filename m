Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BAE73A019
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 13:50:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=NSW0YUyK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmzGN27qDz3bnv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 21:50:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=NSW0YUyK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmzDs35rHz3bhp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 21:49:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/hBMqGEXGgKsMRT6giEKvNALvuKz9PGl6SIeiNVw60M=; b=NSW0YUyKBLRQdO1HniWQcK82rY
	nKb4X3Kuft9OpacchKUitlQOF1fyat92vX5xDHykr9W2yOpZOHJV8mT2KoxOTJKKQy7LsF7a1GvCa
	Dni3GbLm3CpGZhJxxwZ6l6Yw5AoIJ0UNMCot0IAF827MqI4MmmDJBlxqRAjlnHxU/0QFgXjZ51wqr
	Mn2wHLgdkkmORGzbSTrN/omnp1oZs74bUZpgyWfcmwbL1THK5nYQ6luNCmtVMWun29BNUEvxWTxt8
	b25AlDk2EmO70AEyV4PUMJQteDWxci+Z3lVKboCzllYu2n89QdF9TGJlWAW/AKZC3QmWbrLoCxwtJ
	Jfi0yMFw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qCIoW-001Aqe-2q;
	Thu, 22 Jun 2023 11:49:25 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 87C6B300137;
	Thu, 22 Jun 2023 13:49:24 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 77E1224263362; Thu, 22 Jun 2023 13:49:24 +0200 (CEST)
Date: Thu, 22 Jun 2023 13:49:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 12/14] objtool: Add support for more complex UACCESS
 control
Message-ID: <20230622114924.GN4253@hirez.programming.kicks-ass.net>
References: <cover.1687430631.git.christophe.leroy@csgroup.eu>
 <02c7ecdfe636f078027fc110ab73b90331d9eb70.1687430631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02c7ecdfe636f078027fc110ab73b90331d9eb70.1687430631.git.christophe.leroy@csgroup.eu>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 22, 2023 at 12:54:34PM +0200, Christophe Leroy wrote:
> On x86, UACCESS is controlled by two instructions: STAC and CLAC.
> STAC instruction enables UACCESS while CLAC disables UACCESS.
> This is simple enough for objtool to locate UACCESS enable and
> disable.
> 
> But on powerpc it is a bit more complex, the same instruction is
> used for enabling and disabling UACCESS, and the same instruction
> can be used for many other things. It would be too complex to use
> exclusively instruction decoding.
> 
> To help objtool, mark such instruction into .discard.uaccess_begin
> and .discard.uaccess_end sections, on the same principle as for
> reachable/unreachable instructions. And add ASM_UACCESS_BEGIN
> and ASM_UACCESS_END macros to be used in inline assembly code to
> annotate UACCESS enable and UACCESS disable instructions.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  include/linux/objtool.h | 14 +++++++++++++
>  tools/objtool/check.c   | 44 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
> 
> diff --git a/include/linux/objtool.h b/include/linux/objtool.h
> index 03f82c2c2ebf..d8fde4158a40 100644
> --- a/include/linux/objtool.h
> +++ b/include/linux/objtool.h
> @@ -57,6 +57,18 @@
>  	".long 998b - .\n\t"						\
>  	".popsection\n\t"
>  
> +#define ASM_UACCESS_BEGIN						\
> +	"998:\n\t"							\
> +	".pushsection .discard.uaccess_begin\n\t"			\
> +	".long 998b - .\n\t"						\
> +	".popsection\n\t"
> +
> +#define ASM_UACCESS_END							\
> +	"998:\n\t"							\
> +	".pushsection .discard.uaccess_end\n\t"				\
> +	".long 998b - .\n\t"						\
> +	".popsection\n\t"
> +
>  #else /* __ASSEMBLY__ */

Yeah, this can work. Josh wanted a more generic hints infra, but I'm not
sure we should make you do that work now.
