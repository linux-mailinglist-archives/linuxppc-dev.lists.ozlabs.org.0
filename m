Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C09293B851
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 23:01:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tmyPlJmB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTmfC07Wjz3dBd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 07:01:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tmyPlJmB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTmdS0snqz3c47
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2024 07:01:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5FCFE61263;
	Wed, 24 Jul 2024 21:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9048AC32781;
	Wed, 24 Jul 2024 21:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721854856;
	bh=apiiPm2sN2lMCk/MqKB3mzoyPdTD3NiyamqHd/Iu6Uk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmyPlJmBPjmfr1kk10V3MpyVE67ACEXME6v7/LTkG2E3p5a8+FWLZGDUkJq+xR4q6
	 6ZFxT9RnPEwujqhBqJAmDSE3iUAk5nx7sQBfTLWQFPlzrL9E46Q+M6HauomznVweG9
	 qsspgv4MNvvjj7wi6evPUDAIRiLD4KH1tICikcFXhvNgU81IbQ/nGZd/ogjuS41k7N
	 AO55aaCEshdvI8zAdDyvzZn3/lnq4/W/0DTUnZjJ9sKlGegAIrEF94DIWP0lOFyIud
	 SSwl+X4IaNnESItKB7L36GJc0e+F8YHyXNWWgUBOFwJWtvloIU8QHdKm214cgO/oug
	 fFm6n1rY9Jl6g==
Date: Wed, 24 Jul 2024 18:00:52 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V8 14/15] tools/perf: Add support to use libcapstone in
 powerpc
Message-ID: <ZqFrhCguUd_8n-xa@x1>
References: <20240718084358.72242-1-atrajeev@linux.vnet.ibm.com>
 <20240718084358.72242-15-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240718084358.72242-15-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, disgoel@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, namhyung@kernel.org, akanksha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 18, 2024 at 02:13:57PM +0530, Athira Rajeev wrote:
> Now perf uses the capstone library to disassemble the instructions in
> x86. capstone is used (if available) for perf annotate to speed up.
> Currently it only supports x86 architecture. Patch includes changes to
> enable this in powerpc. For now, only for data type sort keys, this
> method is used and only binary code (raw instruction) is read. This is
> because powerpc approach to understand instructions and reg fields uses
> raw instruction. The "cs_disasm" is currently not enabled. While
> attempting to do cs_disasm, observation is that some of the instructions
> were not identified (ex: extswsli, maddld) and it had to fallback to use
> objdump. Hence enabling "cs_disasm" is added in comment section as a
> TODO for powerpc.
> 
> Reviewed-and-tested-by: Kajol Jain <kjain@linux.ibm.com>
> Reviewed-by: Namhyung Kim <namhyung@kernel.org>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Is this building on ppc?

Here, when building on a x86-64 machine with:

ake -C tools/perf EXTRA_CFLAGS=-DREFCNT_CHECKING=1 O=/tmp/build/perf-tools-next/

That I got to by the usual:

make -C tools/perf build-test

I get:

util/disasm.c: In function ‘symbol__disassemble_capstone_powerpc’:
util/disasm.c:1618:34: error: ‘struct dso’ has no member named ‘nsinfo’
 1618 |         nsinfo__mountns_enter(dso->nsinfo, &nsc);
      |                                  ^~
make[4]: *** [/home/acme/git/perf-tools-next/tools/build/Makefile.build:105: /tmp/build/perf-tools-next/util/disasm.o] Error 1
make[3]: *** [/home/acme/git/perf-tools-next/tools/build/Makefile.build:158: util] Error 2
make[2]: *** [Makefile.perf:762: /tmp/build/perf-tools-next/perf-util-in.o] Error 2
make[1]: *** [Makefile.perf:265: sub-make] Error 2
make: *** [Makefile:70: all] Error 2
make: Leaving directory '/home/acme/git/perf-tools-next/tools/perf'
⬢[acme@toolbox perf-tools-next]$

And then when looking at this changeset I noticed that you added a
function and then only called it if:

 static int symbol__disassemble_capstone(char *filename, struct symbol *sym,
                                        struct annotate_args *args)
 {
@@ -1945,6 +2083,11 @@ int symbol__disassemble(struct symbol *sym, struct annotate_args *args)
                        err = symbol__disassemble_raw(symfs_filename, sym, args);
                        if (err == 0)
                                goto out_remove_tmp;
+#ifdef HAVE_LIBCAPSTONE_SUPPORT
+                       err = symbol__disassemble_capstone_powerpc(symfs_filename, sym, args);
+                       if (err == 0)
+                               goto out_remove_tmp;
+#endif
                }
        }

but the symbol__disassemble_capstone_powerpc() is being unconditionally
built, i.e. it is not surrounded by '#ifdef HAVE_LIBCAPSTONE_SUPPORT'

And then there:

dso->nsinfo

It should have been:

⬢[acme@toolbox perf-tools-next]$ git diff
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 2a1c657d6aa66cc2..99081f37c5daba60 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -1615,7 +1615,7 @@ static int symbol__disassemble_capstone_powerpc(char *filename, struct symbol *s
        if (args->options->objdump_path)
                return -1;
 
-       nsinfo__mountns_enter(dso->nsinfo, &nsc);
+       nsinfo__mountns_enter(dso__nsinfo(dso), &nsc);
        fd = open(filename, O_RDONLY);
        nsinfo__mountns_exit(&nsc);
        if (fd < 0)
⬢[acme@toolbox perf-tools-next]$

So it is critical that you try using:

make -C tools/perf build-test

Before asking for review.

Please do that next time.

I'm fixing this up this time so that we can make progress.

Best regards,

- Arnaldo


> ---
>  tools/perf/util/disasm.c | 143 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 143 insertions(+)
> 
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index a848e6f5f05a..63681df6482b 100644
> --- a/tools/perf/util/disasm.c
> +++ b/tools/perf/util/disasm.c
> @@ -1585,6 +1585,144 @@ static void print_capstone_detail(cs_insn *insn, char *buf, size_t len,
>  	}
>  }
>  
> +static int symbol__disassemble_capstone_powerpc(char *filename, struct symbol *sym,
> +					struct annotate_args *args)
> +{
> +	struct annotation *notes = symbol__annotation(sym);
> +	struct map *map = args->ms.map;
> +	struct dso *dso = map__dso(map);
> +	struct nscookie nsc;
> +	u64 start = map__rip_2objdump(map, sym->start);
> +	u64 end = map__rip_2objdump(map, sym->end);
> +	u64 len = end - start;
> +	u64 offset;
> +	int i, fd, count;
> +	bool is_64bit = false;
> +	bool needs_cs_close = false;
> +	u8 *buf = NULL;
> +	struct find_file_offset_data data = {
> +		.ip = start,
> +	};
> +	csh handle;
> +	char disasm_buf[512];
> +	struct disasm_line *dl;
> +	u32 *line;
> +	bool disassembler_style = false;
> +
> +	if (args->options->objdump_path)
> +		return -1;
> +
> +	nsinfo__mountns_enter(dso->nsinfo, &nsc);
> +	fd = open(filename, O_RDONLY);
> +	nsinfo__mountns_exit(&nsc);
> +	if (fd < 0)
> +		return -1;
> +
> +	if (file__read_maps(fd, /*exe=*/true, find_file_offset, &data,
> +			    &is_64bit) == 0)
> +		goto err;
> +
> +	if (!args->options->disassembler_style ||
> +			!strcmp(args->options->disassembler_style, "att"))
> +		disassembler_style = true;
> +
> +	if (capstone_init(maps__machine(args->ms.maps), &handle, is_64bit, disassembler_style) < 0)
> +		goto err;
> +
> +	needs_cs_close = true;
> +
> +	buf = malloc(len);
> +	if (buf == NULL)
> +		goto err;
> +
> +	count = pread(fd, buf, len, data.offset);
> +	close(fd);
> +	fd = -1;
> +
> +	if ((u64)count != len)
> +		goto err;
> +
> +	line = (u32 *)buf;
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
> +	/*
> +	 * TODO: enable disassm for powerpc
> +	 * count = cs_disasm(handle, buf, len, start, len, &insn);
> +	 *
> +	 * For now, only binary code is saved in disassembled line
> +	 * to be used in "type" and "typeoff" sort keys. Each raw code
> +	 * is 32 bit instruction. So use "len/4" to get the number of
> +	 * entries.
> +	 */
> +	count = len/4;
> +
> +	for (i = 0, offset = 0; i < count; i++) {
> +		args->offset = offset;
> +		sprintf(args->line, "%x", line[i]);
> +
> +		dl = disasm_line__new(args);
> +		if (dl == NULL)
> +			goto err;
> +
> +		annotation_line__add(&dl->al, &notes->src->source);
> +
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
> +	if (needs_cs_close)
> +		cs_close(&handle);
> +	free(buf);
> +	return count < 0 ? count : 0;
> +
> +err:
> +	if (fd >= 0)
> +		close(fd);
> +	if (needs_cs_close) {
> +		struct disasm_line *tmp;
> +
> +		/*
> +		 * It probably failed in the middle of the above loop.
> +		 * Release any resources it might add.
> +		 */
> +		list_for_each_entry_safe(dl, tmp, &notes->src->source, al.node) {
> +			list_del(&dl->al.node);
> +			free(dl);
> +		}
> +	}
> +	count = -1;
> +	goto out;
> +}
> +
>  static int symbol__disassemble_capstone(char *filename, struct symbol *sym,
>  					struct annotate_args *args)
>  {
> @@ -1942,6 +2080,11 @@ int symbol__disassemble(struct symbol *sym, struct annotate_args *args)
>  			err = symbol__disassemble_raw(symfs_filename, sym, args);
>  			if (err == 0)
>  				goto out_remove_tmp;
> +#ifdef HAVE_LIBCAPSTONE_SUPPORT
> +			err = symbol__disassemble_capstone_powerpc(symfs_filename, sym, args);
> +			if (err == 0)
> +				goto out_remove_tmp;
> +#endif
>  		}
>  	}
>  
> -- 
> 2.43.0
