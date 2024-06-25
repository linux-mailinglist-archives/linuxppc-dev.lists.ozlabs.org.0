Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99139915E2C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 07:33:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ehu6Shsh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7YQ70Xvmz3dBk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 15:33:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ehu6Shsh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7YPP5ZKpz3c8Q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 15:32:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6D01DCE17D7;
	Tue, 25 Jun 2024 05:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3220FC32782;
	Tue, 25 Jun 2024 05:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719293544;
	bh=3Z7LyAhh4LTv+HNrBs8+IYT8Sjq4E0mp/A8dkZddR7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ehu6Shsh30K9d1HWMHxun7sN8Eg/DiR6XASTLsXqTwthhOrRuj8ExbNvKkT0uYs2l
	 0XPRQydpOsnYYKSV1lHBTf6Ra0TKoYLk7G+dVxmEd9nsCuTVOHarnRNAlujD9Bo1Gd
	 JDjwmKAlAjl7bv+hB5NV8wECed1BdIS18MZPmxgWGa9JJcg1ZXMG+yRW+3wuJYEIwX
	 WrNIpWYKgXwu8aC4OJap5S9Ab/T1ywsBp/yVLwsITg5DenGnaO601b6PpvPnCuPrqZ
	 VDXXd/Iewg6vjxHXIJxvwYsOydsJ3A7rzeEFC49grlIfkt8eIW5/Zg/ieBqhhqYKvB
	 l5g/S7pP4d/Rw==
Date: Mon, 24 Jun 2024 22:32:22 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [V4 04/16] tools/perf: Use sort keys to determine whether to
 pick objdump to disassemble
Message-ID: <ZnpWZlz6T2PyG6R6@google.com>
References: <20240614172631.56803-1-atrajeev@linux.vnet.ibm.com>
 <20240614172631.56803-5-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614172631.56803-5-atrajeev@linux.vnet.ibm.com>
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

On Fri, Jun 14, 2024 at 10:56:19PM +0530, Athira Rajeev wrote:
> perf annotate can be done in different ways. One way is to directly use
> "perf annotate" command, other way to annotate specific symbol is to do
> "perf report" and press "a" on the sample in UI mode. The approach
> preferred in powerpc to parse sample for data type profiling is:
> - Read directly from DSO using dso__data_read_offset
> - If that fails for any case, fallback to using libcapstone
> - If libcapstone is not supported, approach will use objdump
> 
> The above works well when perf report is invoked with only sort keys for
> data type ie type and typeoff. Because there is no instruction level
> annotation needed if only data type information is requested for. For
> annotating sample, along with type and typeoff sort key, "sym" sort key
> is also needed. And by default invoking just "perf report" uses sort key
> "sym" that displays the symbol information.
> 
> With approach changes in powerpc which first reads DSO for raw
> instruction, "perf annotate" and "perf report" + a key breaks since
> it doesn't do the instruction level disassembly.

So as I said, it'd be nice you can read the raw insn from the objdump
output directly.

Thanks,
Namhyung

> 
> Snippet of result from perf report:
> 
> Samples: 1K of event 'mem-loads', 4000 Hz, Event count (approx.): 937238
> do_work  /usr/bin/pmlogger [Percent: local period]
> Percent│        ea230010
>        │        3a550010
>        │        3a600000
> 
>        │        38f60001
>        │        39490008
>        │        42400438
>  51.44 │        81290008
>        │        7d485378
> 
> Here, raw instruction is displayed in the output instead of human
> readable annotated form.
> 
> One way to get the appropriate data is to specify "--objdump path", by
> which code annotation will be done. But the default behaviour will be
> changed. To fix this breakage, check if "sym" sort key is set. If so
> fallback and use the libcapstone/objdump way of disassmbling the sample.
> 
> With the changes and "perf report"
> 
> Samples: 1K of event 'mem-loads', 4000 Hz, Event count (approx.): 937238
> do_work  /usr/bin/pmlogger [Percent: local period]
> Percent│        ld        r17,16(r3)
>        │        addi      r18,r21,16
>        │        li        r19,0
> 
>        │ 8b0:   rldicl    r10,r10,63,33
>        │        addi      r10,r10,1
>        │        mtctr     r10
>        │      ↓ b         8e4
>        │ 8c0:   addi      r7,r22,1
>        │        addi      r10,r9,8
>        │      ↓ bdz       d00
>  51.44 │        lwz       r9,8(r9)
>        │        mr        r8,r10
>        │        cmpw      r20,r9
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/util/disasm.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index f19496133bf0..b81cdcf4d6b4 100644
> --- a/tools/perf/util/disasm.c
> +++ b/tools/perf/util/disasm.c
> @@ -25,6 +25,7 @@
>  #include "srcline.h"
>  #include "symbol.h"
>  #include "util.h"
> +#include "sort.h"
>  
>  static regex_t	 file_lineno;
>  
> @@ -1803,9 +1804,11 @@ int symbol__disassemble(struct symbol *sym, struct annotate_args *args)
>  	 * not required in case of powerpc.
>  	 */
>  	if (arch__is(args->arch, "powerpc")) {
> -		err = symbol__disassemble_dso(symfs_filename, sym, args);
> -		if (err == 0)
> -			goto out_remove_tmp;
> +		if (sort_order && !strstr(sort_order, "sym")) {
> +			err = symbol__disassemble_dso(symfs_filename, sym, args);
> +			if (err == 0)
> +				goto out_remove_tmp;
> +		}
>  	}
>  
>  #ifdef HAVE_LIBCAPSTONE_SUPPORT
> -- 
> 2.43.0
> 
