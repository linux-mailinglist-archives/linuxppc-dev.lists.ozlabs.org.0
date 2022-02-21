Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8DB4BD2C8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 01:16:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K22sV37bSz3cPj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 11:16:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A3W6zbWg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=mhiramat@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=A3W6zbWg; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K22rt2B1Vz2yZt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 11:15:58 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D2A6860DCE;
 Mon, 21 Feb 2022 00:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B509C340E8;
 Mon, 21 Feb 2022 00:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645402556;
 bh=FAHiQRsRhdAMMfAapmFl44a3/9FTSkSi6leb9aKOKcA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A3W6zbWgqlygo5WCNFb0oHIBKSNtZ7Sf7inAorLorqvgrgfZL+ANqoYv8amuWMiKn
 q2W4LyWNsGMsjgm1Ck0rCalUkCvnUUPQYnr6NwGUpJPv/htT3YjRh5YeDyElHd3QnP
 9sLlyewF/dEEremdms2IETorBzO+YmpTRtdUfS3O/8p0gTZCGpDyhzXPW5TiMys0Vf
 r2/+BDfwL7+Izf0KZXhIztMCDyWbt+UgpGlhcMNJZa7Bu92+EdWbzZ8KAT8F0C+al9
 NggPSitm9tLMhvCeQPafFC/bJPy+YzwWSDdJX3y8EbI2zu6JwSar1ZZpL/Hqng2i5Z
 XqdBmQnWEAu9w==
Date: Mon, 21 Feb 2022 09:15:52 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] kprobes: Allow probing on any address belonging to
 ftrace
Message-Id: <20220221091552.f2b24bde8142df1d3fd63b42@kernel.org>
In-Reply-To: <78480d05821d45e09fb234f61f9037e26d42f02d.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
 <78480d05821d45e09fb234f61f9037e26d42f02d.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Feb 2022 17:06:25 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> On certain architectures, ftrace can reserve multiple instructions at
> function entry. Rather than rejecting kprobe on addresses other than the
> exact ftrace call instruction, use the address returned by ftrace to
> probe at the correct address when CONFIG_KPROBES_ON_FTRACE is enabled.
> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  kernel/kprobes.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 94cab8c9ce56cc..0a797ede3fdf37 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -1497,6 +1497,10 @@ bool within_kprobe_blacklist(unsigned long addr)
>  static kprobe_opcode_t *_kprobe_addr(kprobe_opcode_t *addr,
>  			const char *symbol_name, unsigned int offset)
>  {
> +#ifdef CONFIG_KPROBES_ON_FTRACE
> +	unsigned long ftrace_addr = 0;
> +#endif
> +
>  	if ((symbol_name && addr) || (!symbol_name && !addr))
>  		goto invalid;
>  
> @@ -1507,6 +1511,14 @@ static kprobe_opcode_t *_kprobe_addr(kprobe_opcode_t *addr,
>  	}
>  
>  	addr = (kprobe_opcode_t *)(((char *)addr) + offset);
> +
> +#ifdef CONFIG_KPROBES_ON_FTRACE
> +	if (addr)
> +		ftrace_addr = ftrace_location((unsigned long)addr);
> +	if (ftrace_addr)
> +		return (kprobe_opcode_t *)ftrace_addr;

As I said, this must be

if (ftrace_addr != addr)
	return -EILSEQ;

This will prevent users from being confused by the results of probing
that 'func' and 'func+4' are the same. (now only 'func' is allowed to
be probed.)

Thank you,

> +#endif
> +
>  	if (addr)
>  		return addr;
>  
> -- 
> 2.35.1
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
