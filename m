Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3829199AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 23:17:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K8dF3Iv7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8ZKn7217z3cR3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 07:17:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K8dF3Iv7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8ZK45W0Xz30Sv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 07:17:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB61861D09;
	Wed, 26 Jun 2024 21:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D638CC116B1;
	Wed, 26 Jun 2024 21:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719436630;
	bh=xnBvbtkr+krg9eOnoyPvmkL0Vo7bx1Jml/6pqm7xWvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K8dF3Iv7f4Qe/n7OIonxeS5mjKUCftTEAvUy0DjScGUYSYdlGf+OXf5U3gCCg7UPx
	 +HxvfhS0f6XFiQq6hXlsABOlcrRU3Rv15Yxy9xyYBEtZFa4Daop7a7rvzZcpS9/o+s
	 myzv++ckeIllQ/TbyCrNX2zcjtMNpWEMkKHruOh4HdlBnInzj5k3HW2ALabIcKdpha
	 N3vgw95FCb4WoFpUw7/FOGC15Z2y7EpEpzs/azR4K9jbdB/3jwjQaIPR2CGFU0Ul7G
	 IK7M9sKia7RGX5E/3/llnPArGcIT/01jO7LQe7uFGTm70SVk0jcw7e7MM2eaQHKVys
	 OpM8yTWbaDmKg==
Date: Wed, 26 Jun 2024 14:17:08 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [V4 05/16] tools/perf: Add disasm_line__parse to parse raw
 instruction for powerpc
Message-ID: <ZnyFVE22bcdilUyL@google.com>
References: <20240614172631.56803-1-atrajeev@linux.vnet.ibm.com>
 <20240614172631.56803-6-atrajeev@linux.vnet.ibm.com>
 <ZnpYBvXLhyAqZzvh@google.com>
 <E2A1A4AA-E344-4B42-86CE-E0EDD82A398F@linux.vnet.ibm.com>
 <ZnsQOD3arkR0qoPJ@google.com>
 <40DB645D-BFA7-44EA-B937-ADE81EEC1316@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40DB645D-BFA7-44EA-B937-ADE81EEC1316@linux.vnet.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, LKML <linux-kernel@vger.kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, akanksha@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Wed, Jun 26, 2024 at 09:38:28AM +0530, Athira Rajeev wrote:
> 
> 
> > On 26 Jun 2024, at 12:15 AM, Namhyung Kim <namhyung@kernel.org> wrote:
> > 
> > On Tue, Jun 25, 2024 at 06:12:51PM +0530, Athira Rajeev wrote:
> >> 
> >> 
> >>> On 25 Jun 2024, at 11:09 AM, Namhyung Kim <namhyung@kernel.org> wrote:
> >>> 
> >>> On Fri, Jun 14, 2024 at 10:56:20PM +0530, Athira Rajeev wrote:
> >>>> Currently, the perf tool infrastructure disasm_line__parse function to
> >>>> parse disassembled line.
> >>>> 
> >>>> Example snippet from objdump:
> >>>> objdump  --start-address=<address> --stop-address=<address>  -d --no-show-raw-insn -C <vmlinux>
> >>>> 
> >>>> c0000000010224b4: lwz     r10,0(r9)
> >>>> 
> >>>> This line "lwz r10,0(r9)" is parsed to extract instruction name,
> >>>> registers names and offset. In powerpc, the approach for data type
> >>>> profiling uses raw instruction instead of result from objdump to identify
> >>>> the instruction category and extract the source/target registers.
> >>>> 
> >>>> Example: 38 01 81 e8     ld      r4,312(r1)
> >>>> 
> >>>> Here "38 01 81 e8" is the raw instruction representation. Add function
> >>>> "disasm_line__parse_powerpc" to handle parsing of raw instruction.
> >>>> Also update "struct disasm_line" to save the binary code/
> >>>> With the change, function captures:
> >>>> 
> >>>> line -> "38 01 81 e8     ld      r4,312(r1)"
> >>>> raw instruction "38 01 81 e8"
> >>>> 
> >>>> Raw instruction is used later to extract the reg/offset fields. Macros
> >>>> are added to extract opcode and register fields. "struct disasm_line"
> >>>> is updated to carry union of "bytes" and "raw_insn" of 32 bit to carry raw
> >>>> code (raw). Function "disasm_line__parse_powerpc fills the raw
> >>>> instruction hex value and can use macros to get opcode. There is no
> >>>> changes in existing code paths, which parses the disassembled code.
> >>>> The architecture using the instruction name and present approach is
> >>>> not altered. Since this approach targets powerpc, the macro
> >>>> implementation is added for powerpc as of now.
> >>>> 
> >>>> Since the disasm_line__parse is used in other cases (perf annotate) and
> >>>> not only data tye profiling, the powerpc callback includes changes to
> >>>> work with binary code as well as mneumonic representation. Also in case
> >>>> if the DSO read fails and libcapstone is not supported, the approach
> >>>> fallback to use objdump as option. Hence as option, patch has changes to
> >>>> ensure objdump option also works well.
> >>>> 
> >>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >>>> ---
[SNIP]
> >>>> +/*
> >>>> + * Parses the result captured from symbol__disassemble_*
> >>>> + * Example, line read from DSO file in powerpc:
> >>>> + * line:    38 01 81 e8
> >>>> + * opcode: fetched from arch specific get_opcode_insn
> >>>> + * rawp_insn: e8810138
> >>>> + *
> >>>> + * rawp_insn is used later to extract the reg/offset fields
> >>>> + */
> >>>> +#define PPC_OP(op) (((op) >> 26) & 0x3F)
> >>>> +
> >>>> +static int disasm_line__parse_powerpc(struct disasm_line *dl)
> >>>> +{
> >>>> + char *line = dl->al.line;
> >>>> + const char **namep = &dl->ins.name;
> >>>> + char **rawp = &dl->ops.raw;
> >>>> + char tmp, *tmp_raw_insn, *name_raw_insn = skip_spaces(line);
> >>>> + char *name = skip_spaces(name_raw_insn + 11);
> >>>> + int objdump = 0;
> >>>> +
> >>>> + if (strlen(line) > 11)
> >>>> + objdump = 1;
> >>>> +
> >>>> + if (name_raw_insn[0] == '\0')
> >>>> + return -1;
> >>>> +
> >>>> + if (objdump) {
> >>>> + *rawp = name + 1;
> >>>> + while ((*rawp)[0] != '\0' && !isspace((*rawp)[0]))
> >>>> + ++*rawp;
> >>>> + tmp = (*rawp)[0];
> >>>> + (*rawp)[0] = '\0';
> >>>> +
> >>>> + *namep = strdup(name);
> >>>> + if (*namep == NULL)
> >>>> + return -1;
> >>>> +
> >>>> + (*rawp)[0] = tmp;
> >>>> + *rawp = strim(*rawp);
> >>>> + } else
> >>>> + *namep = "";
> > 
> > Then can you handle this logic under if (annotate_opts.show_raw_insn)
> > in disasm_line__parse() instead of adding a new function?
> > 
> > Thanks,
> > Namhyung
> 
> Hi Namhyung,
> 
> We discussed to have a per-arch disasm_line_parse() here:
> https://lore.kernel.org/all/CAM9d7ci1LDa7moT2qDr2qK+DTNLU6ZBkmROnbdozAjuQLQfNog@mail.gmail.com/#t
> 
> So I added it as a new function : disasm_line__parse_powerpc
> Since it is not used by other archs, we can go with having new function ?

Ok, I thought it'd be quite different from disasm_line__parse() but it
seems that it's mostly similar except for the raw insn.  So I think it's
better to add the logic to the generic disasm_line__parse().  Sorry for
the inconvenience.

Thanks,
Namhyung

> >>>> +
> >>>> + tmp_raw_insn = strdup(name_raw_insn);
> >>>> + tmp_raw_insn[11] = '\0';
> >>>> + remove_spaces(tmp_raw_insn);
> >>>> +
> >>>> + dl->raw.raw_insn = strtol(tmp_raw_insn, NULL, 16);
> >>>> + if (objdump)
> >>>> + dl->raw.raw_insn = be32_to_cpu(strtol(tmp_raw_insn, NULL, 16));
> >>> 
> >>> Hmm.. can you use a sscanf() instead?
> >>> 
> >>> sscanf(line, "%x %x %x %x", &dl->raw.bytes[0], &dl->raw.bytes[1], ...)
> >>> 
> >>> Thanks,
> >>> Namhyung
> >>> 
> >> Sure will address in V5
> >> 
> >> Thanks
> >> Athira
> >>>> +
> >>>> + return 0;
> >>>> +}
