Return-Path: <linuxppc-dev+bounces-4731-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D28C9A0323E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 22:46:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRnmy2bqbz2yTs;
	Tue,  7 Jan 2025 08:46:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736199970;
	cv=none; b=A2jcO8Whr17i1hKu5gNibDw8dJtVYYlroTJtB8stbfFoWxBoH3kMqDowN4cDnbuCi2987AqraEFdyhWxvz4gk74KspTVpVZVKP839+GK3HRAWW84v/8Icq9QE2hJWnkqBhgNQ2swUkKj8y6RMI5pUbFpNok0sj+9pklzYoMtCNnEQn46e6Wab03PNCkkyy46jx1ZcRilxpw+HJuY+mslsGZ1p7pw0IwSZi/S5Lz01P6h8wWUR4EXsYdhKkHOkcHXCdI8YCp5/iZu2XMAfZ5YTZxkmTpeQ8UwbcKVO36bL5Gkhfk2DsnSzDJrgXtIpDqi+zwVdKgvMtpEPBzqZIykKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736199970; c=relaxed/relaxed;
	bh=RIa7dk7DyibyYUW6tilf8nvcfipwcDzdV5SP/TBUoZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2shYiz3WbYkYVevVSyMvQheUQv/wfJp4KvowahQm4iH4zYxcTipTLBrQO/ktU4AYRd/xz+bnoyxdtptpXSxXJArD6QLIpCjtVlpaq11dhFvqZnF49vfcBc4/4lswVL+w3JSQDg3IBlUlJ8YjwDXeAnxXSMBGuGWty//wJnUlBDd7ObvnGXME+tvnWBL638r+ax99iH8n5IOKYUZ8Pqx6nM1VPO5PCog2L1tyZxkC+svBGr1wF2/enSHYjuJaRfRc2Ck1pocFhNSVIBIQ9NsN/D0pc3MlY2WeXDGB6J+QWJBDKXE5SEiRkWRfav2Jxn5DZq+GhLD3Wv0PltDOE24mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Aly9tu4w; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Aly9tu4w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRnmx17Npz2xGw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 08:46:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B9365C5CDB;
	Mon,  6 Jan 2025 21:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0D3C4CED2;
	Mon,  6 Jan 2025 21:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736199967;
	bh=F1sKZwTHiDTNo86eh/r784QGetXHzZDl8w+awG/fwRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aly9tu4wCMb5SPwgZDehcwIILLimKHfTMEb9Y3zKUBQXb3wRF1zfMpokN2scTX3C8
	 XYkncR/VF/QCksOU21juTror0IkapkMxBOKmLZtBuJ0sB0eh2GZzrZbMOcROjsn/eI
	 0I96c/C8SeLo8UsDA7N2je+PtorgvCFZDBa2UeG2qzvM/tOju3QVZV/sJYGK+wsfAi
	 laa7C6ExZOi5VCQQy9/Y1b2QT7KAxxMuw8LiRx64idGgna/+l5Gdkorzv4Bk2J9w+z
	 Rm4Rca5J24H9fLBynACcbFbJCUhDDLSfMf5lG2t2kj5Up51tpI79+2QwSlOQTGed9L
	 mDfeIuefrKOPA==
Date: Mon, 6 Jan 2025 13:46:05 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	James Clark <james.clark@linaro.org>,
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Ian Rogers <irogers@google.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Perf doesn't display kernel symbols anymore (bisected commit
 659ad3492b91 ("perf maps: Switch from rbtree to lazily sorted array for
 addresses"))
Message-ID: <Z3xPHSrVInsc6W6I@google.com>
References: <719a89a5-8dff-48a0-ba8f-802c740a00a6@csgroup.eu>
 <53f3abe5-dd22-4a1a-82e6-bc88e91d1869@linaro.org>
 <Z217eBsXIaSgKuSs@x1>
 <5217124a-f033-4085-b9f5-a477c96728d6@csgroup.eu>
 <Z3bYltoidQpqtyJ_@x1>
 <48724052-4003-4140-8106-f9ea098cedcb@csgroup.eu>
 <Z3c4nupM-UENN5LM@x1>
 <5b8ec160-4b50-4736-8012-30ae35c45028@csgroup.eu>
 <Z3gPncBcCnZiNy57@x1>
 <752a31b0-4370-4f52-b7cc-45f0078c1d6c@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <752a31b0-4370-4f52-b7cc-45f0078c1d6c@csgroup.eu>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

On Mon, Jan 06, 2025 at 01:38:52PM +0100, Christophe Leroy wrote:
> 
> 
> Le 03/01/2025 à 17:26, Arnaldo Carvalho de Melo a écrit :
> > On Fri, Jan 03, 2025 at 01:40:24PM +0100, Christophe Leroy wrote:
> > > Le 03/01/2025 à 02:08, Arnaldo Carvalho de Melo a écrit :
> > > > >      PerfTop:     524 irqs/sec  kernel:51.1%  exact:  0.0% lost: 0/0 drop: 0/0
> > > > > [4000Hz cpu-clock:ppp],  (all, 1 CPU)
> > > > > -------------------------------------------------------------------------------
> > 
> > > > >       17.18%  [unknown]      [k] 0xc0891c14
> > > > >        7.63%  [unknown]      [k] 0xc005f11c
> > 
> > > > I think I hadn't notice this '[unknown]' one bit before :-\ the [k] is
> > > > there, so having unknown is odd
> > > Problem found, it's in maps__find_next_entry(), this leads to both
> > > map->start and map->end of kernel map being set to 0xc0000000, which leads
> > > to the failure of bsearch() in maps__find().
> > 
> > Right, and since you don't have any module (CONFIG_MODULES not set),
> > and most machines do, that is when the buggy function is called:
> > 
> > machine__create_kernel_maps()
> > 	if (!machine__get_running_kernel_start(machine, &name, &start, &end))
> > <SNIP>
> >          if (end == ~0ULL) {
> >                  /* update end address of the kernel map using adjacent module address */
> >                  struct map *next = maps__find_next_entry(machine__kernel_maps(machine),
> >                                                           machine__kernel_map(machine));
> > 
> >                  if (next) {
> >                          machine__set_kernel_mmap(machine, start, map__start(next));
> >                          map__put(next);
> >                  }
> >          }
> > <SNIP>
> > 
> > So machine__get_running_kernel_start() doesn't manage to fill end with
> > either because it doesn't find the ref_reloc_sym, one of:
> > 
> > const char *ref_reloc_sym_names[] = {"_text", "_stext", NULL}
> > 
> > And returns -1, so that first if block fails, and then start also
> > doesn't get set and remains 0, which doesn't seem to be the case, as you
> > get 0xc0000000 in it, or this fails:
> > 
> >          err = kallsyms__get_symbol_start(filename, "_edata", &addr);
> >          if (err)
> >                  err = kallsyms__get_function_start(filename, "_etext", &addr);
> >          if (!err)
> >                  *end = addr;
> > 
> 
> Indeed yes that one fails, because:
> 
> ~# grep -e _stext -e _etext -e _edata /proc/kallsyms
> c0000000 T _stext
> c08b8000 D _etext
> 
> So there is no _edata and _etext is not text
> 
> $ ppc-linux-objdump -x vmlinux | grep -e _stext -e _etext -e _edata
> c0000000 g       .head.text	00000000 _stext
> c08b8000 g       .rodata	00000000 _etext
> c1378000 g       .sbss	00000000 _edata
> 
> Changing
> 
> 	kallsyms__get_function_start(filename, "_etext", &addr);
> 
> to
> 
> 	kallsyms__get_symbol_start(filename, "_etext", &addr);
> 
> works.
> 
> 
> The following change works as well:
> 
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S
> b/arch/powerpc/kernel/vmlinux.lds.S
> index b4c9decc7a75..b7b2cd7e2a20 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -123,10 +123,11 @@ SECTIONS
>  		 */
>  		*(.sfpr);
>  		*(.text.asan.* .text.tsan.*)
> +
> +		. = ALIGN(PAGE_SIZE);
> +		_etext = .;
>  	} :text
> 
> -	. = ALIGN(PAGE_SIZE);
> -	_etext = .;
>  	PROVIDE32 (etext = .);
> 
>  	/* Read-only data */
> 
> As it leads to:
> 
> ~# grep -e _stext -e _etext -e _edata /proc/kallsyms
> c0000000 T _stext
> c08b8000 T _etext
> 
> $ ppc-linux-objdump -x vmlinux | grep -e _stext -e _etext -e _edata
> c0000000 g       .head.text	00000000 _stext
> c08b8000 g       .text	00000000 _etext
> c1378000 g       .sbss	00000000 _edata
> 
> So what is the most correct fix ? Change architectures link script or make
> perf _etext lookup more flexible, allowing non-text ?
> 
> Looking at vmlinux.lds.S from various architectures, I have the feeling
> several of them are affected.
> 
> Now, regarding _edata, what I see is:
> 
> ~# tail -2 /proc/kallsyms
> c136a000 D __start___bug_table
> c1377c14 D __stop___bug_table
> 
> And in System.map I have:
> 
> c136a000 D __start___bug_table
> c1377c14 D __stop___bug_table
> c1378000 B __bss_start
> c1378000 B _edata
> c1378000 B initcall_debug
> c1378004 B reset_devices
> 
> Should perf try to locate the very last symbol when it doesn't find _edata ?
> Or should architecture's link script be modified ? Otherwise commit
> 69a87a32f5cd ("perf machine: Include data symbols in the kernel map") is
> just pointless.

Let's go with kallsyms__get_symbol_start().  I think it's the most
straight-forward and simplest fix.

Thanks,
Namhyung


