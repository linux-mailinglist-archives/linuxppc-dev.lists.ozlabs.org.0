Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C9733F79F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 18:56:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0yX54LS1z3bdG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 04:56:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=ICdCW1pj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=ICdCW1pj; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0yWh1LhRz2yRR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 04:56:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=JD6DfhzlxHt/W60lBWVJyFcG2x+gwqEVVkFJO6VU0UI=; b=ICdCW1pjIhVGB7eUY6NwQVxOts
 syJUF0IVcJgd9GU0rJR9cc5eHqr1mJx0z7RnHUviicGAc9+QI/n4wg3BhGVxp7zbf0emKOvcx7YJS
 +u7tpJIQPtf2douFe4T29zbVID9/IfBd8cNMly2NaW2S1G7dU0Pbijj2JsFun0EMSFm0FZSf8R+vw
 p4pZrrz5DPRd5h5mJqcJncHleCWIrbLqZhi0tJQ+1R+VbgFd0RdOmX58jp2N/6K2v3nJzdrCc6R18
 wVQMb70u86NmCWZINEGBx2WuEr6Jg5V7wO3zak+tOJqpF8nEWlYJdvIuRJilAMnlOjb2VZdsLtQKn
 8FRvXzmg==;
Received: from [2601:1c0:6280:3f0::9757]
 by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMaOt-001fgJ-3Y; Wed, 17 Mar 2021 17:56:07 +0000
Subject: Re: [PATCH] powerpc: kernel: Trivial typo fix in the file kgdb.c
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, jniethe5@gmail.com,
 alistair@popple.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20210317090413.120891-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <eb64824a-2871-5046-01df-8ffead699e28@infradead.org>
Date: Wed, 17 Mar 2021 10:56:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317090413.120891-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/17/21 2:04 AM, Bhaskar Chowdhury wrote:
> 
> s/procesing/processing/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  arch/powerpc/kernel/kgdb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
> index 409080208a6c..7dd2ad3603ad 100644
> --- a/arch/powerpc/kernel/kgdb.c
> +++ b/arch/powerpc/kernel/kgdb.c
> @@ -376,7 +376,7 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
>  }
> 
>  /*
> - * This function does PowerPC specific procesing for interfacing to gdb.
> + * This function does PowerPC specific processing for interfacing to gdb.
>   */
>  int kgdb_arch_handle_exception(int vector, int signo, int err_code,
>  			       char *remcom_in_buffer, char *remcom_out_buffer,
> --


-- 
~Randy

