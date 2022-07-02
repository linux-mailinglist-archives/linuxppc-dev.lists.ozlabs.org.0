Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFB3563F50
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 11:44:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZnGl2lPJz3bt8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 19:44:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r+EE9SVz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r+EE9SVz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZnG50zfyz308w
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 19:44:12 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B115F60B1D;
	Sat,  2 Jul 2022 09:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFBFFC34114;
	Sat,  2 Jul 2022 09:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656755049;
	bh=eEHHSuYuqZS5McmgfU626Axa9JPZVKK9isQ4pht82jA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r+EE9SVzQ+GRkB3D+I3QaY7n9xdGIS78EWAP5eMzIsIPcSAH04e7hO5BBmU3Wa8eS
	 snNXdrw3/lLINOt+A0LLIwuUl5+30S91r59iX/Do4Ju4Y86OwM2an3GsQKGaUeSEqF
	 kvpCPxnyIe987aOjyhWgqDws2P9JK1vHbZdwmeTLw59Q4+tbNAPV4cxrOrQDeHtzeA
	 SdWljkHNgElRaCFJv/DKrgwBvgpC8sChFrIDwtogL6cFU7Gq+dELL9JnXu9bDbRqTn
	 KXzjcIwDFMLoMv3pNDcMQGWjJ/nxUgYc3ZfXavOrxStJdJRExmIdFTK4l5JfipLlp6
	 apjLVqtBkN5tg==
Received: by pali.im (Postfix)
	id ED2E4777; Sat,  2 Jul 2022 11:44:05 +0200 (CEST)
Date: Sat, 2 Jul 2022 11:44:05 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Message-ID: <20220702094405.tp7eo4df7fjvn2ng@pali>
References: <20220524093939.30927-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524093939.30927-1-pali@kernel.org>
User-Agent: NeoMutt/20180716
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tuesday 24 May 2022 11:39:39 Pali Rohár wrote:
> gcc e500 compiler does not support -mcpu=powerpc option. When it is
> specified then gcc throws compile error:
> 
>   gcc: error: unrecognized argument in option ‘-mcpu=powerpc’
>   gcc: note: valid arguments to ‘-mcpu=’ are: 8540 8548 native
> 
> So do not set -mcpu=powerpc option when CONFIG_E500 is set. Correct option
> -mcpu=8540 for CONFIG_E500 is set few lines below in that Makefile.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> Cc: stable@vger.kernel.org

Michael, do you have any objections about this patch?

> ---
>  arch/powerpc/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index eb541e730d3c..87f9f29ac9d2 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -22,11 +22,16 @@ ifdef CONFIG_PPC32
>  # or platform code sets later on the command line, but they are needed
>  # to set a sane 32-bit cpu target for the 64-bit cross compiler which
>  # may default to the wrong ISA.
> +# Never set -mcpu=powerpc option for gcc e500 compiler because this
> +# option is unsupported and throws error. The correct option for
> +# CONFIG_E500 is -mcpu=8540 and it is set few lines below.
> +ifndef CONFIG_E500
>  KBUILD_CFLAGS		+= -mcpu=powerpc
>  KBUILD_AFLAGS		+= -mcpu=powerpc
>  endif
>  endif
>  endif
> +endif
>  
>  ifdef CONFIG_PPC_BOOK3S_32
>  KBUILD_CFLAGS		+= -mcpu=powerpc
> -- 
> 2.20.1
> 
