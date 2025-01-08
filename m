Return-Path: <linuxppc-dev+bounces-4869-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F5BA065D5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 21:14:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSzfn0fGMz30Tt;
	Thu,  9 Jan 2025 07:14:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736367297;
	cv=none; b=heskrxy8LYywykJhMMg69kHbauDmrkNlAXv+wrGw5Ae1WXLWtx5hXTJmjVQ+w9yem/KNnKKaTPx116BurKVU1gjVdAYOOPgJanwBVwjx6u2rROPh41vCKNYDKAJoDBqKIssU1r8wufD8HIZiZNopMCGpMKkbu8j4oFyBUYcx23CZtd5RtPpT8JrxcyL4qX38Bl9+KGUZyJD2n0pE7QV+EdCDLXzuvEw76Irk5uzAqeS/Ou/4gvR/j9kzhZCKhuUl9W1Q+hy+KwucOBuu4JZApakw/1dbX58r0/Rf7VGKeVD7L+8fWlwannkNZRUlLiGkAhWNyvyv+22obstI1MX29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736367297; c=relaxed/relaxed;
	bh=irdZ0a192jwtxnm7/O0zqaok+/VoiMoD/GEREN5Js1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QS7NC+86ZJ+u7xaBB9oXSebTS4vjN38+D5SHZdMb7Ge3IEzo9OVczQcz0hVzCdrzD5yhaJyCXQKZGVtI05MRG/x7DMMO/+9EYAJPuPCaja4BTcK7po/LGMHVrBpIvySB/tLdM+W+INPBsIUl8k7VG3Nankjcrcc8XM1TXgCfJ/0hssDnBig7K3DbDgibssuO98zlEWsYNA90e78uRXByhMOpZUSaCs4De/N8Hg4+xMpff/RKqHqnzgE25ZqwzE9JBgGzGcajaf7mXNIBVinzZ3ow7ymn7+LMZX5ZmD/omSjrxeMohpx1lrGNiglTUXPeFZZf3yEpgbtLkO9EePh1mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=el/bqvOE; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=el/bqvOE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSzfm1d2zz30Tc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 07:14:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 218CBA41976;
	Wed,  8 Jan 2025 20:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEA1C4CED3;
	Wed,  8 Jan 2025 20:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736367293;
	bh=+k8VSgg2WNZLayqdbQDDh8INehLekajaO7o4aXfvkpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=el/bqvOEmDTzHp5fiNlPZyX8I/jbI79LrxZhOyFlRE2mlN2YQJPBX8XoFMH8+/zhz
	 QOxms9We+e8b6bF0okRur4OeFWM60a1IZraBU5+v6Hrdt/fnSSPnWLucPXLeE///HU
	 wH3zvmmHhIeMSXlTIEjLz4r5AWMFKS1You4/PdNpxnBpf946W3JUIp19drATxrpyiP
	 2SSGRy32UJYi4zcfGz6QrGh54TsXYIknlpZYooz7Sk9GWn9Y2SnavOKuSpusWVphuE
	 28/1a+ITi0dKmQmKW9fuCRnGnJ56k1jjGEdgF8AQmHWooUdrah2a1XzlAiL7Eh6STU
	 zNseIIk+8fhvw==
Date: Wed, 8 Jan 2025 17:14:50 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Song Liu <songliubraving@fb.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] perf machine: Don't ignore _etext when not a text symbol
Message-ID: <Z37cuobj6NVRUKoo@x1>
References: <b3ee1994d95257cb7f2de037c5030ba7d1bed404.1736327613.git.christophe.leroy@csgroup.eu>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3ee1994d95257cb7f2de037c5030ba7d1bed404.1736327613.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 08, 2025 at 10:15:24AM +0100, Christophe Leroy wrote:
> Depending on how vmlinux.lds is written, _etext might be the very
> first data symbol instead of the very last text symbol.
> 
> Don't require it to be a text symbol, accept any symbol type.

I'm adding a Link:

Link: https://lore.kernel.org/all/752a31b0-4370-4f52-b7cc-45f0078c1d6c@csgroup.eu

To give more context as where this has been observed, and also add a
snippet of your explanation there, this:

----
# grep -e _stext -e _etext -e _edata /proc/kallsyms
c0000000 T _stext
c08b8000 D _etext

So there is no _edata and _etext is not text

$ ppc-linux-objdump -x vmlinux | grep -e _stext -e _etext -e _edata
c0000000 g       .head.text	00000000 _stext
c08b8000 g       .rodata	00000000 _etext
c1378000 g       .sbss	00000000 _edata
----

Thanks,

- Arnaldo

> Fixes: ed9adb2035b5 ("perf machine: Read also the end of the kernel")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  tools/perf/util/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
> index 27d5345d2b30..9be2f4479f52 100644
> --- a/tools/perf/util/machine.c
> +++ b/tools/perf/util/machine.c
> @@ -1003,7 +1003,7 @@ static int machine__get_running_kernel_start(struct machine *machine,
>  
>  	err = kallsyms__get_symbol_start(filename, "_edata", &addr);
>  	if (err)
> -		err = kallsyms__get_function_start(filename, "_etext", &addr);
> +		err = kallsyms__get_symbol_start(filename, "_etext", &addr);
>  	if (!err)
>  		*end = addr;
>  
> -- 
> 2.47.0

