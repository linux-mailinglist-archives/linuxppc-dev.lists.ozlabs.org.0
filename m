Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6D9779101
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 15:47:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=upeDHgxL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMlVK4y7Pz3cNT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 23:47:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=upeDHgxL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMlTP3lKCz2ydR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 23:47:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 87BF06471D;
	Fri, 11 Aug 2023 13:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F52EC433C7;
	Fri, 11 Aug 2023 13:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691761621;
	bh=DyVTLT2NItQVze876SzD7NXM5CZcYX0ABirj6tNgd4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=upeDHgxLNvMAWBr125SeUwIkH9ZcKPCs2Ki7lPJ0bLJ0aRBaEGrLoZ5+v7436M7Qj
	 uAUFU+Yn2I6va1UqiDedV/tOiRw4uunYEoFXFg/GDwQK1YIpNlZ71NpEYRdAjnNsVs
	 jW8jFNRbzXOj1MTZiVuEPWR3C2kXoVBKl64BvqV+xXnsR/SB1Q79HNW77rVE3zejNI
	 rrv988q0vV6j1OuE4JxGteYMaXONCKTBj5tN7Dq9xBDJvn3e1jpvZB2eQ9v/M+IOwt
	 ksCtHKVujOURome8hzXz5KXQiXk2Pps3I1ATcZaP7okLfh66DCvLVrlqEp/oI91zOL
	 pdupy2EwFPV2g==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id B16DE404DF; Fri, 11 Aug 2023 10:46:57 -0300 (-03)
Date: Fri, 11 Aug 2023 10:46:57 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH] tools/perf: Fix dso kernel load and symbol process to
 correctly map dso to its long_name, type and adjust_symbols
Message-ID: <ZNY70VuUn0e86bAD@kernel.org>
References: <20230811051546.70039-1-atrajeev@linux.vnet.ibm.com>
 <f21cbbed-8e51-fae1-9e77-56b5d239bafd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f21cbbed-8e51-fae1-9e77-56b5d239bafd@intel.com>
X-Url: http://acmel.wordpress.com
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
Cc: irogers@google.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Fri, Aug 11, 2023 at 12:49:35PM +0300, Adrian Hunter escreveu:
> On 11/08/23 08:15, Athira Rajeev wrote:
> > Test "object cocde reading" fails sometimes for kernel address
> > as below:
> > 
> >     Reading object code for memory address: 0xc000000000004c3c
> >     File is: [kernel.kallsyms]
> >     On file address is: 0x14c3c
> >     dso__data_read_offset failed
> >     test child finished with -1
> >     ---- end ----
> >     Object code reading: FAILED!
> > 
> > Here the dso__data_read_offset fails for symbol address
> > 0xc000000000004c3c. This is because, the dso long_name here
> > is [kernel.kallsyms] and hence open_dso fails to open this
> > file. There is an incorrect dso to map handling here. The
> > key points here is:
> > - dso long_name is set to [kernel.kallsyms]. This file is
> >   not present and hence returns error
> > - DSO binary type is set to DSO_BINARY_TYPE__NOT_FOUND
> > - dso adjust_symbols is set to zero
> > 
> > In the end dso__data_read_offset() returns -1 and the address
> > 0x14c3c can not be resolved. Hence the test fails. But the
> > address actually maps to kernel dso
> > 
> >     # objdump -z -d --start-address=0xc000000000004c3c --stop-address=0xc000000000004cbc /home/athira/linux/vmlinux
> > 
> >     /home/athira/linux/vmlinux:     file format elf64-powerpcle
> > 
> >     Disassembly of section .head.text:
> > 
> >     c000000000004c3c <exc_virt_0x4c00_system_call+0x3c>:
> >     c000000000004c3c:	a6 02 9b 7d 	mfsrr1  r12
> >     c000000000004c40:	78 13 42 7c 	mr      r2,r2
> >     c000000000004c44:	18 00 4d e9 	ld      r10,24(r13)
> >     c000000000004c48:	60 c6 4a 61 	ori     r10,r10,50784
> >     c000000000004c4c:	a6 03 49 7d 	mtctr   r10
> > 
> > Fix the dso__process_kernel_symbol function to set the
> > binary_type and adjust_symbols. adjust_symbols is used by
> > function "map__rip_2objdump" which converts symbol start
> > address to objdump address. Also set the dso long_name during
> > dso__load_vmlinux function.
> > 
> > Suggested-by: Adrian Hunter <adrian.hunter@intel.com>
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> 
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Thanks, applied.

- Arnaldo

 
> > ---
> > Note: Found similar discussion here in thread:
> >       https://www.spinics.net/lists/linux-perf-users/msg06337.html
> >       where Adrian proposed the fix, but looks like this was
> >       not added to the perf. Hence addeed Suggested-by from Adrian.
> > 
> >       Additional to the fix proposed by Adrian, the patch also
> >       adds setting of adjust_symbols which is needed for
> >       map__rip_2objdump to convert symbol start to objdump address.
> > 
> >  tools/perf/util/symbol-elf.c |  2 ++
> >  tools/perf/util/symbol.c     | 15 ++++++++++-----
> >  2 files changed, 12 insertions(+), 5 deletions(-)
> > 
> > diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
> > index 252d26a59e64..9e7eeaf616b8 100644
> > --- a/tools/perf/util/symbol-elf.c
> > +++ b/tools/perf/util/symbol-elf.c
> > @@ -1440,6 +1440,8 @@ static int dso__process_kernel_symbol(struct dso *dso, struct map *map,
> >  		curr_dso->kernel = dso->kernel;
> >  		curr_dso->long_name = dso->long_name;
> >  		curr_dso->long_name_len = dso->long_name_len;
> > +		curr_dso->binary_type = dso->binary_type;
> > +		curr_dso->adjust_symbols = dso->adjust_symbols;
> >  		curr_map = map__new2(start, curr_dso);
> >  		dso__put(curr_dso);
> >  		if (curr_map == NULL)
> > diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
> > index f849f9ef68e6..3f36675b7c8f 100644
> > --- a/tools/perf/util/symbol.c
> > +++ b/tools/perf/util/symbol.c
> > @@ -2204,15 +2204,20 @@ int dso__load_vmlinux(struct dso *dso, struct map *map,
> >  	if (symsrc__init(&ss, dso, symfs_vmlinux, symtab_type))
> >  		return -1;
> >  
> > +	/*
> > +	 * dso__load_sym() may copy 'dso' which will result in the copies having
> > +	 * an incorrect long name unless we set it here first.
> > +	 */
> > +	dso__set_long_name(dso, vmlinux, vmlinux_allocated);
> > +	if (dso->kernel == DSO_SPACE__KERNEL_GUEST)
> > +		dso->binary_type = DSO_BINARY_TYPE__GUEST_VMLINUX;
> > +	else
> > +		dso->binary_type = DSO_BINARY_TYPE__VMLINUX;
> > +
> >  	err = dso__load_sym(dso, map, &ss, &ss, 0);
> >  	symsrc__destroy(&ss);
> >  
> >  	if (err > 0) {
> > -		if (dso->kernel == DSO_SPACE__KERNEL_GUEST)
> > -			dso->binary_type = DSO_BINARY_TYPE__GUEST_VMLINUX;
> > -		else
> > -			dso->binary_type = DSO_BINARY_TYPE__VMLINUX;
> > -		dso__set_long_name(dso, vmlinux, vmlinux_allocated);
> >  		dso__set_loaded(dso);
> >  		pr_debug("Using %s for symbols\n", symfs_vmlinux);
> >  	}
> 

-- 

- Arnaldo
