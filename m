Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D3E915E24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 07:29:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WFOh9e1U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7YLL4b62z3dBg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 15:29:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WFOh9e1U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7YKf3b3Sz3c8Q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 15:29:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 10155CE17D8;
	Tue, 25 Jun 2024 05:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF01C32782;
	Tue, 25 Jun 2024 05:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719293345;
	bh=LFjHwemcdLE3RjWfSMOIzmFSkp1A8AtvyedlXK7t8pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WFOh9e1UamzVzR7qSL/yChRjYlxaBXB6f8W5q8tw8hoYeS29+3rL/a+apGHJSHDzE
	 2OcUL8Dw0boWrZUGYX9s9lEg5VMWD0Z6BAqUgqiKhAn9h+lBo2DiGjZXdxjs9phJIm
	 A9llAwF0m0nErvkjo60MNHszvFkkuY45WeJ+GER84SvY3fUgmsxIp+KUU5+PuR6wwt
	 28lcLCCZh/9Grkq4O5iCvQFv5RDTuVSDDKP3rbYVOklJblkCrxLON5Otcrvbv54c5+
	 NlkSixGGSqRWzZT7NkT7rfljL2hABX5T/V0EYe4qhukBYW8XpViUQKR5C9Ym+FV4NM
	 WDV/GSEdzo+gg==
Date: Mon, 24 Jun 2024 22:29:03 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [V4 03/16] tools/perf: Add support to capture and parse raw
 instruction in powerpc using dso__data_read_offset utility
Message-ID: <ZnpVn1yLtDnRnTBh@google.com>
References: <20240614172631.56803-1-atrajeev@linux.vnet.ibm.com>
 <20240614172631.56803-4-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240614172631.56803-4-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, disgoel@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, acme@kernel.org, jolsa@kernel.org, akanksha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 14, 2024 at 10:56:18PM +0530, Athira Rajeev wrote:
> Add support to capture and parse raw instruction in powerpc.
> Currently, the perf tool infrastructure uses two ways to disassemble
> and understand the instruction. One is objdump and other option is
> via libcapstone.
> 
> Currently, the perf tool infrastructure uses "--no-show-raw-insn" option
> with "objdump" while disassemble. Example from powerpc with this option
> for an instruction address is:
> 
> Snippet from:
> objdump  --start-address=<address> --stop-address=<address>  -d --no-show-raw-insn -C <vmlinux>
> 
> c0000000010224b4:	lwz     r10,0(r9)

What about removing --no-show-raw-insn and parse the raw byte code in
the output for powerpc?  I think it's better to support normal
annotation together.

> 
> This line "lwz r10,0(r9)" is parsed to extract instruction name,
> registers names and offset. Also to find whether there is a memory
> reference in the operands, "memory_ref_char" field of objdump is used.
> For x86, "(" is used as memory_ref_char to tackle instructions of the
> form "mov  (%rax), %rcx".
> 
> In case of powerpc, not all instructions using "(" are the only memory
> instructions. Example, above instruction can also be of extended form (X
> form) "lwzx r10,0,r19". Inorder to easy identify the instruction category
> and extract the source/target registers, patch adds support to use raw
> instruction for powerpc. Approach used is to read the raw instruction
> directly from the DSO file using "dso__data_read_offset" utility which
> is already implemented in perf infrastructure in "util/dso.c".
> 
> Example:
> 
> 38 01 81 e8     ld      r4,312(r1)
> 
> Here "38 01 81 e8" is the raw instruction representation. In powerpc,
> this translates to instruction form: "ld RT,DS(RA)" and binary code
> as:
> 
>    | 58 |  RT  |  RA |      DS       | |
>    -------------------------------------
>    0    6     11    16              30 31
> 
> Function "symbol__disassemble_dso" is updated to read raw instruction
> directly from DSO using dso__data_read_offset utility. In case of
> above example, this captures:
> line:    38 01 81 e8
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/util/disasm.c | 98 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index b5fe3a7508bb..f19496133bf0 100644
> --- a/tools/perf/util/disasm.c
> +++ b/tools/perf/util/disasm.c
> @@ -1586,6 +1586,91 @@ static int symbol__disassemble_capstone(char *filename, struct symbol *sym,
>  }
>  #endif
>  
> +static int symbol__disassemble_dso(char *filename, struct symbol *sym,

Maybe rename to symbol__disassemble_raw() ?

> +					struct annotate_args *args)
> +{
> +	struct annotation *notes = symbol__annotation(sym);
> +	struct map *map = args->ms.map;
> +	struct dso *dso = map__dso(map);
> +	u64 start = map__rip_2objdump(map, sym->start);
> +	u64 end = map__rip_2objdump(map, sym->end);
> +	u64 len = end - start;
> +	u64 offset;
> +	int i, count;
> +	u8 *buf = NULL;
> +	char disasm_buf[512];
> +	struct disasm_line *dl;
> +	u32 *line;
> +
> +	/* Return if objdump is specified explicitly */
> +	if (args->options->objdump_path)
> +		return -1;
> +
> +	pr_debug("Reading raw instruction from : %s using dso__data_read_offset\n", filename);

You may want to print the actual offset and remove the "using
dso__data_read_offset" part.

Thanks,
Namhyung

> +
> +	buf = malloc(len);
> +	if (buf == NULL)
> +		goto err;
> +
> +	count = dso__data_read_offset(dso, NULL, sym->start, buf, len);
> +
> +	line = (u32 *)buf;
> +
> +	if ((u64)count != len)
> +		goto err;
> +
> +	/* add the function address and name */
> +	scnprintf(disasm_buf, sizeof(disasm_buf), "%#"PRIx64" <%s>:",
> +		  start, sym->name);
> +
> +	args->offset = -1;
> +	args->line = disasm_buf;
> +	args->line_nr = 0;
> +	args->fileloc = NULL;
> +	args->ms.sym = sym;
> +
> +	dl = disasm_line__new(args);
> +	if (dl == NULL)
> +		goto err;
> +
> +	annotation_line__add(&dl->al, &notes->src->source);
> +
> +	/* Each raw instruction is 4 byte */
> +	count = len/4;
> +
> +	for (i = 0, offset = 0; i < count; i++) {
> +		args->offset = offset;
> +		sprintf(args->line, "%x", line[i]);
> +		dl = disasm_line__new(args);
> +		if (dl == NULL)
> +			goto err;
> +
> +		annotation_line__add(&dl->al, &notes->src->source);
> +		offset += 4;
> +	}
> +
> +	/* It failed in the middle */
> +	if (offset != len) {
> +		struct list_head *list = &notes->src->source;
> +
> +		/* Discard all lines and fallback to objdump */
> +		while (!list_empty(list)) {
> +			dl = list_first_entry(list, struct disasm_line, al.node);
> +
> +			list_del_init(&dl->al.node);
> +			disasm_line__free(dl);
> +		}
> +		count = -1;
> +	}
> +
> +out:
> +	free(buf);
> +	return count < 0 ? count : 0;
> +
> +err:
> +	count = -1;
> +	goto out;
> +}
>  /*
>   * Possibly create a new version of line with tabs expanded. Returns the
>   * existing or new line, storage is updated if a new line is allocated. If
> @@ -1710,6 +1795,19 @@ int symbol__disassemble(struct symbol *sym, struct annotate_args *args)
>  		strcpy(symfs_filename, tmp);
>  	}
>  
> +	/*
> +	 * For powerpc data type profiling, use the dso__data_read_offset
> +	 * to read raw instruction directly and interpret the binary code
> +	 * to understand instructions and register fields. For sort keys as
> +	 * type and typeoff, disassemble to mnemonic notation is
> +	 * not required in case of powerpc.
> +	 */
> +	if (arch__is(args->arch, "powerpc")) {
> +		err = symbol__disassemble_dso(symfs_filename, sym, args);
> +		if (err == 0)
> +			goto out_remove_tmp;
> +	}
> +
>  #ifdef HAVE_LIBCAPSTONE_SUPPORT
>  	err = symbol__disassemble_capstone(symfs_filename, sym, args);
>  	if (err == 0)
> -- 
> 2.43.0
> 
