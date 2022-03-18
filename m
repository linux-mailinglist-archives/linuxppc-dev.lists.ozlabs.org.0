Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FD74DD9B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 13:28:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKjwH1NdVz3bTq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 23:28:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=sD9r9ejm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=sD9r9ejm; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKjvX65ldz3089
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 23:27:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=eD8tHWmaTx8P3KCt4/NT+8IXDEPFOlKb/XA8R7/3lFQ=; b=sD9r9ejmX3ReiEsAx5vVRKxbu7
 ZA+L7FENoatLkfcIySOgzFLthOn4EYhE9TuB46R/BSsm0S/At7NT7/1nqJnOcylT+hzrfNe5O8Rsy
 k0e+kMm4INgIpE4o5GGvcfWby/IgVC6zQv/Z7EJL4hEBE2pD+NQX0MqG/Z28jO9aqHWW2m/c3H4Ym
 2FFQ/ohRAmVgBa6Q/woubnW6GvweG9jdDdn1e2lZAhXpdJko04sMUKqsHty8DsckMkpdQtqi65xuR
 iQUgy/iJCSWbKDQ58YkoyxRieyZER2PRwW/0wKoVLZmATsn9Xx2zSsyYNorRA3SPD7PJOqUgnZRWv
 Wg8mH7Vg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVBh6-007vr7-Kh; Fri, 18 Mar 2022 12:27:00 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 14D003001C7;
 Fri, 18 Mar 2022 13:26:56 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A2F9920D9D81E; Fri, 18 Mar 2022 13:26:56 +0100 (CET)
Date: Fri, 18 Mar 2022 13:26:56 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Message-ID: <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318105140.43914-4-sv@linux.ibm.com>
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
Cc: aik@ozlabs.ru, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 18, 2022 at 04:21:40PM +0530, Sathvika Vasireddy wrote:
> This patch adds powerpc specific functions required for
> 'objtool mcount' to work, and enables mcount for ppc.

I would love to see more objtool enablement for Power :-)


> diff --git a/tools/objtool/arch/powerpc/include/arch/elf.h b/tools/objtool/arch/powerpc/include/arch/elf.h
> new file mode 100644
> index 000000000000..3c8ebb7d2a6b
> --- /dev/null
> +++ b/tools/objtool/arch/powerpc/include/arch/elf.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#ifndef _OBJTOOL_ARCH_ELF
> +#define _OBJTOOL_ARCH_ELF
> +
> +#define R_NONE R_PPC_NONE
> +
> +#endif /* _OBJTOOL_ARCH_ELF */
> diff --git a/tools/objtool/utils.c b/tools/objtool/utils.c
> index d1fc6a123a6e..c9c14fa0dfd7 100644
> --- a/tools/objtool/utils.c
> +++ b/tools/objtool/utils.c
> @@ -179,11 +179,29 @@ int create_mcount_loc_sections(struct objtool_file *file)
>  		loc = (unsigned long *)sec->data->d_buf + idx;
>  		memset(loc, 0, sizeof(unsigned long));
>  
> -		if (elf_add_reloc_to_insn(file->elf, sec,
> -					  idx * sizeof(unsigned long),
> -					  R_X86_64_64,
> -					  insn->sec, insn->offset))
> -			return -1;
> +		if (file->elf->ehdr.e_machine == EM_X86_64) {
> +			if (elf_add_reloc_to_insn(file->elf, sec,
> +						  idx * sizeof(unsigned long),
> +						  R_X86_64_64,
> +						  insn->sec, insn->offset))
> +				return -1;
> +		}
> +
> +		if (file->elf->ehdr.e_machine == EM_PPC64) {
> +			if (elf_add_reloc_to_insn(file->elf, sec,
> +						  idx * sizeof(unsigned long),
> +						  R_PPC64_ADDR64,
> +						  insn->sec, insn->offset))
> +				return -1;
> +		}
> +
> +		if (file->elf->ehdr.e_machine == EM_PPC) {
> +			if (elf_add_reloc_to_insn(file->elf, sec,
> +						  idx * sizeof(unsigned long),
> +						  R_PPC_ADDR32,
> +						  insn->sec, insn->offset))
> +				return -1;
> +		}

It appears to me that repeating this code 3 times doesn't really scale
well, how about we introduce a helper like:


int elf_reloc_type_long(struct elf *elf)
{
	switch (elf->ehdr.e_machine) {
	case EM_X86_64:
		return R_X86_64_64;
	case EM_PPC64:
		return R_PPC64_ADDR64;
	case EM_PPC:
		return R_PPC_ADDR32;
	default:
		WARN("unknown machine...")
		exit(-1);
	}
}

		if (elf_add_reloc_to_insn(file->elf, sec,
					  idx * sizeof(unsigned long),
					  elf_reloc_type_long(file->elf),
					  insn->sec, insn->offset))
			return -1;

