Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B568FDEC9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 08:34:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qFnpitGl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvvg85fdGz3cfK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 16:33:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qFnpitGl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvvfS50hkz3cQq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 16:33:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4832661BC4;
	Thu,  6 Jun 2024 06:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75168C4AF0C;
	Thu,  6 Jun 2024 06:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717655598;
	bh=Uhu+KFLXXWQmIS9busJjbM9iWvKGKbQaK7TAgsHdn1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFnpitGlvXRH1PN3cBpTQrl1lxHirtYlcCdJKdkuqZpZX4VvEL0Wu2RZra8KgYXqg
	 zb+is1WrHirfaOeMqEj8z7tP0hzTm6lpPFnkhuxVnRO9gRDHQKKwxk2B7y6G1bjyUp
	 10qtfaTSUTyAZw/oxmzFlMEKOZIHyGLim1c48/xtXhSzLx92MimoK1fDIjCcySsIEe
	 wLzxHXDZffqngv885lFIwtRgx6686bu7B02hMOko1LpoMmA23BwuZaP/airHBW5Zpv
	 tXSbIjr7IAXDs13+6cOwUZnTmn+koKVgv1UBI1JmUjtAPu3TUaD57aaJ67+jwk7aTp
	 WxQkrK7RU5OLQ==
Date: Wed, 5 Jun 2024 23:33:16 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V3 05/14] tools/perf: Add disasm_line__parse to parse raw
 instruction for powerpc
Message-ID: <ZmFYLK3pK3Uov4pe@google.com>
References: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
 <20240601060941.13692-6-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240601060941.13692-6-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, disgoel@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, acme@kernel.org, jolsa@kernel.org, akanksha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Sat, Jun 01, 2024 at 11:39:32AM +0530, Athira Rajeev wrote:
> Currently, the perf tool infrastructure disasm_line__parse function to
> parse disassembled line.
> 
> Example snippet from objdump:
> objdump  --start-address=<address> --stop-address=<address>  -d --no-show-raw-insn -C <vmlinux>
> 
> c0000000010224b4:	lwz     r10,0(r9)
> 
> This line "lwz r10,0(r9)" is parsed to extract instruction name,
> registers names and offset. In powerpc, the approach for data type
> profiling uses raw instruction instead of result from objdump to identify
> the instruction category and extract the source/target registers.
> 
> Example: 38 01 81 e8     ld      r4,312(r1)
> 
> Here "38 01 81 e8" is the raw instruction representation. Add function
> "disasm_line__parse_powerpc" to handle parsing of raw instruction. Also
> update "struct ins" and "struct ins_operands" to save "opcode" and
> binary code. With the change, function captures:
> 
> line -> "38 01 81 e8     ld      r4,312(r1)"
> opcode and raw instruction "38 01 81 e8"
> 
> Raw instruction is used later to extract the reg/offset fields. Macros
> are added to extract opcode and register fields. "struct ins_operands"
> and "struct ins" is updated to carry opcode and raw instruction binary
> code (raw_insn). Function "disasm_line__parse_powerpc fills the raw
> instruction hex value and opcode in newly added fields. There is no
> changes in existing code paths, which parses the disassembled code.
> The architecture using the instruction name and present approach is
> not altered. Since this approach targets powerpc, the macro
> implementation is added for powerpc as of now.
> 
> Since the disasm_line__parse is used in other cases (perf annotate) and
> not only data tye profiling, the powerpc callback includes changes to
> work with binary code as well as mneumonic representation. Also in case
> if the DSO read fails and libcapstone is not supported, the approach
> fallback to use objdump as option. Hence as option, patch has changes to
> ensure objdump option also works well.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/include/linux/string.h                  |  2 +
>  tools/lib/string.c                            | 13 ++++
>  .../perf/arch/powerpc/annotate/instructions.c |  1 +
>  tools/perf/arch/powerpc/util/dwarf-regs.c     |  9 +++
>  tools/perf/util/disasm.c                      | 63 ++++++++++++++++++-
>  tools/perf/util/disasm.h                      |  7 +++
>  6 files changed, 94 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/include/linux/string.h b/tools/include/linux/string.h
> index db5c99318c79..0acb1fc14e19 100644
> --- a/tools/include/linux/string.h
> +++ b/tools/include/linux/string.h
> @@ -46,5 +46,7 @@ extern char * __must_check skip_spaces(const char *);
>  
>  extern char *strim(char *);
>  
> +extern void remove_spaces(char *s);
> +
>  extern void *memchr_inv(const void *start, int c, size_t bytes);
>  #endif /* _TOOLS_LINUX_STRING_H_ */
> diff --git a/tools/lib/string.c b/tools/lib/string.c
> index 8b6892f959ab..3126d2cff716 100644
> --- a/tools/lib/string.c
> +++ b/tools/lib/string.c
> @@ -153,6 +153,19 @@ char *strim(char *s)
>  	return skip_spaces(s);
>  }
>  
> +/*
> + * remove_spaces - Removes whitespaces from @s
> + */
> +void remove_spaces(char *s)
> +{
> +	char *d = s;
> +
> +	do {
> +		while (*d == ' ')
> +			++d;
> +	} while ((*s++ = *d++));
> +}
> +
>  /**
>   * strreplace - Replace all occurrences of character in string.
>   * @s: The string to operate on.
> diff --git a/tools/perf/arch/powerpc/annotate/instructions.c b/tools/perf/arch/powerpc/annotate/instructions.c
> index a3f423c27cae..d57fd023ef9c 100644
> --- a/tools/perf/arch/powerpc/annotate/instructions.c
> +++ b/tools/perf/arch/powerpc/annotate/instructions.c
> @@ -55,6 +55,7 @@ static int powerpc__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
>  		arch->initialized = true;
>  		arch->associate_instruction_ops = powerpc__associate_instruction_ops;
>  		arch->objdump.comment_char      = '#';
> +		annotate_opts.show_asm_raw = true;
>  	}
>  
>  	return 0;
> diff --git a/tools/perf/arch/powerpc/util/dwarf-regs.c b/tools/perf/arch/powerpc/util/dwarf-regs.c
> index 0c4f4caf53ac..430623ca5612 100644
> --- a/tools/perf/arch/powerpc/util/dwarf-regs.c
> +++ b/tools/perf/arch/powerpc/util/dwarf-regs.c
> @@ -98,3 +98,12 @@ int regs_query_register_offset(const char *name)
>  			return roff->ptregs_offset;
>  	return -EINVAL;
>  }
> +
> +#define PPC_OP(op)	(((op) >> 26) & 0x3F)
> +#define PPC_RA(a)	(((a) >> 16) & 0x1f)
> +#define PPC_RT(t)	(((t) >> 21) & 0x1f)
> +#define PPC_RB(b)	(((b) >> 11) & 0x1f)
> +#define PPC_D(D)	((D) & 0xfffe)
> +#define PPC_DS(DS)	((DS) & 0xfffc)
> +#define OP_LD	58
> +#define OP_STD	62
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index 3cd187f08193..61f0f1656f82 100644
> --- a/tools/perf/util/disasm.c
> +++ b/tools/perf/util/disasm.c
> @@ -45,6 +45,7 @@ static int call__scnprintf(struct ins *ins, char *bf, size_t size,
>  
>  static void ins__sort(struct arch *arch);
>  static int disasm_line__parse(char *line, const char **namep, char **rawp);
> +static int disasm_line__parse_powerpc(struct disasm_line *dl);
>  
>  static __attribute__((constructor)) void symbol__init_regexpr(void)
>  {
> @@ -844,6 +845,63 @@ static int disasm_line__parse(char *line, const char **namep, char **rawp)
>  	return -1;
>  }
>  
> +/*
> + * Parses the result captured from symbol__disassemble_*
> + * Example, line read from DSO file in powerpc:
> + * line:    38 01 81 e8
> + * opcode: fetched from arch specific get_opcode_insn
> + * rawp_insn: e8810138
> + *
> + * rawp_insn is used later to extract the reg/offset fields
> + */
> +#define	PPC_OP(op)	(((op) >> 26) & 0x3F)
> +
> +static int disasm_line__parse_powerpc(struct disasm_line *dl)
> +{
> +	char *line = dl->al.line;
> +	const char **namep = &dl->ins.name;
> +	char **rawp = &dl->ops.raw;
> +	char tmp, *tmp_opcode, *name_opcode = skip_spaces(line);
> +	char *name = skip_spaces(name_opcode + 11);
> +	int objdump = 0;
> +
> +	if (strlen(line) > 11)
> +		objdump = 1;
> +
> +	if (name_opcode[0] == '\0')
> +		return -1;
> +
> +	if (objdump) {
> +		*rawp = name + 1;
> +		while ((*rawp)[0] != '\0' && !isspace((*rawp)[0]))
> +			++*rawp;
> +		tmp = (*rawp)[0];
> +		(*rawp)[0] = '\0';
> +
> +		*namep = strdup(name);
> +		if (*namep == NULL)
> +			return -1;
> +
> +		(*rawp)[0] = tmp;
> +		*rawp = strim(*rawp);
> +	} else
> +		*namep = "";
> +
> +	tmp_opcode = strdup(name_opcode);
> +	tmp_opcode[11] = '\0';
> +	remove_spaces(tmp_opcode);
> +
> +	dl->ins.opcode = PPC_OP(strtol(tmp_opcode, NULL, 16));
> +	if (objdump)
> +		dl->ins.opcode = PPC_OP(be32_to_cpu(strtol(tmp_opcode, NULL, 16)));
> +	dl->ops.opcode = dl->ins.opcode;
> +
> +	dl->ops.raw_insn = strtol(tmp_opcode, NULL, 16);
> +	if (objdump)
> +		dl->ops.raw_insn = be32_to_cpu(strtol(tmp_opcode, NULL, 16));
> +	return 0;
> +}
> +
>  static void annotation_line__init(struct annotation_line *al,
>  				  struct annotate_args *args,
>  				  int nr)
> @@ -897,7 +955,10 @@ struct disasm_line *disasm_line__new(struct annotate_args *args)
>  		goto out_delete;
>  
>  	if (args->offset != -1) {
> -		if (disasm_line__parse(dl->al.line, &dl->ins.name, &dl->ops.raw) < 0)
> +		if (arch__is(args->arch, "powerpc")) {
> +			if (disasm_line__parse_powerpc(dl) < 0)
> +				goto out_free_line;
> +		} else if (disasm_line__parse(dl->al.line, &dl->ins.name, &dl->ops.raw) < 0)
>  			goto out_free_line;
>  
>  		disasm_line__init_ins(dl, args->arch, &args->ms);
> diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
> index 718177fa4775..a391e1bb81f7 100644
> --- a/tools/perf/util/disasm.h
> +++ b/tools/perf/util/disasm.h
> @@ -43,14 +43,19 @@ struct arch {
>  
>  struct ins {
>  	const char     *name;
> +	int	opcode;

I don't think this is the right place as 'ins' can be shared for
different opcodes.  IIUC it's like a class and disasm_line should
have a pointer instead of a copy of the arch instructions.  So I'd
like to keep a single instance if they behave in the same way.  But
this is a separate change.

I guess we can move it to struct disasm_line and use helper macros when
we need to access the opcode.  This will be helpful for other arches.

  struct disasm_line {
      struct ins *ins;
      struct ins_operands ops;
      union {
          u8 bytes[4];
          u32 opcode;
      } raw;
      struct annotation_line al;
  };
  
  #define PPC_OP(dl)  (((dl)->raw.bytes[0] >> 2) & 0x3F)

Thanks,
Namhyung

>
>  	struct ins_ops *ops;
>  };
>  
>  struct ins_operands {
>  	char	*raw;
> +	int	raw_insn;
> +	int	opcode;
>  	struct {
>  		char	*raw;
>  		char	*name;
> +		int	opcode;
> +		int	raw_insn;
>  		struct symbol *sym;
>  		u64	addr;
>  		s64	offset;
> @@ -62,6 +67,8 @@ struct ins_operands {
>  		struct {
>  			char	*raw;
>  			char	*name;
> +			int	opcode;
> +			int	raw_insn;
>  			u64	addr;
>  			bool	multi_regs;
>  		} source;
> -- 
> 2.43.0
> 
