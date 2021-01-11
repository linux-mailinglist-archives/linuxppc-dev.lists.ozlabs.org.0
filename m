Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C192F0D19
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 08:07:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDlCX5P3CzDqWq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 18:07:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDl9q1CLPzDqPC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 18:06:21 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DDl9d1xKXz9vBnG;
 Mon, 11 Jan 2021 08:06:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id prXPXq5z2Ylb; Mon, 11 Jan 2021 08:06:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DDl9c3cZSz9vBnB;
 Mon, 11 Jan 2021 08:06:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D0D38B78A;
 Mon, 11 Jan 2021 08:06:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HC1KZHsRdfsP; Mon, 11 Jan 2021 08:06:17 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EA1D08B75B;
 Mon, 11 Jan 2021 08:06:16 +0100 (CET)
Subject: Re: [PATCH v2] powerpc: fix alignment bug whithin the init sections
To: Ariel Marcovitch <arielmarcovitch@gmail.com>, mpe@ellerman.id.au
References: <20210102201156.10805-1-ariel.marcovitch@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <dacc0535-217d-1a35-fcfe-7ff730e32735@csgroup.eu>
Date: Mon, 11 Jan 2021 08:06:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210102201156.10805-1-ariel.marcovitch@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: keescook@chromium.org, maskray@google.com, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, oss@buserror.net, paulus@samba.org,
 ariel.marcovitch@gmail.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/01/2021 à 21:11, Ariel Marcovitch a écrit :
> This is a bug that causes early crashes in builds with a
> .exit.text section smaller than a page and a .init.text section that
> ends in the beginning of a physical page (this is kinda random, which
> might explain why this wasn't really encountered before).
> 
> The init sections are ordered like this:
> 	.init.text
> 	.exit.text
> 	.init.data
> 
> Currently, these sections aren't page aligned.
> 
> Because the init code might become read-only at runtime and because the
> .init.text section can potentially reside on the same physical page as
> .init.data, the beginning of .init.data might be mapped read-only along
> with .init.text.
> 
> Then when the kernel tries to modify a variable in .init.data (like
> kthreadd_done, used in kernel_init()) the kernel panics.
> 
> To avoid this, make _einittext page aligned and also align .exit.text
> to make sure .init.data is always seperated from the text segments.
> 
> Fixes: 060ef9d89d18 ("powerpc32: PAGE_EXEC required for inittext")
> Signed-off-by: Ariel Marcovitch <ariel.marcovitch@gmail.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/kernel/vmlinux.lds.S | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> index 6db90cdf11da..b6c765d8e7ee 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -187,6 +187,11 @@ SECTIONS
>   	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) {
>   		_sinittext = .;
>   		INIT_TEXT
> +
> +		/* .init.text might be RO so we must
> +		* ensure this section ends in a page boundary.
> +		*/
> +		. = ALIGN(PAGE_SIZE);
>   		_einittext = .;
>   #ifdef CONFIG_PPC64
>   		*(.tramp.ftrace.init);
> @@ -200,6 +205,8 @@ SECTIONS
>   		EXIT_TEXT
>   	}
>   
> +	. = ALIGN(PAGE_SIZE);
> +
>   	.init.data : AT(ADDR(.init.data) - LOAD_OFFSET) {
>   		INIT_DATA
>   	}
> 
> base-commit: 2c85ebc57b3e1817b6ce1a6b703928e113a90442
> 
