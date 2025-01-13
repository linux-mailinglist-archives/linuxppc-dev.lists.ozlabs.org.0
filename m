Return-Path: <linuxppc-dev+bounces-5194-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E6CA0C477
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 23:17:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX67f2RYzz3cfR;
	Tue, 14 Jan 2025 09:17:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736806638;
	cv=none; b=W6ArDyBo5OBLGfGi8zH9rr7LEpqLMoKituFNikZb3h9iewBA8ZxmbrlVTb/NkJzOayk6i9p76G8E/MyM64I1FLDiW0tZzDLJDKZMBE4XbmFS5on4Oo/OKsegIF0AK6obAoMyL2fWoO1HkfAFK+4PSPJEqEEGXcj+h0eS3QVBvh8sRcpDQ3oxlofWQN73AqQfCI16fGy0aUAuGybsqzU9x/OoHJzx/V2ecTuVAGSuxQRFF394h2DHO2kXeaenvlypuaDgThnid2M6dWwZOVzPAEs3RgRkQ3ANvuv+kCondNu6VErc+2r+gOM5jzm0rN+EP6oagR4kEuof0WxCEkWtog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736806638; c=relaxed/relaxed;
	bh=h2HdAYgKZXGxEZpzL0ti7ClIBEEj+08LEvmtxYZoQv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcEPcF0XSUWmsyd0ooas19iYv+BSFXwcWpl7bcpvffm9iQ6II0RgIyhy/xh8CgnAci4O3Ojo3XJBHY8oYkoxdlX388IrkLUBTI4SKMDxQXf/emqoh1Z6YgM3edaFXAYoKBVdCsqn6TH4yWee/uvKnOaEGs6U/NawjHtC0dyYrevAnRgK4TJnJWiB0xdqjK5Ok3CB0CfsAe3lJneyudsu7Lv3oI9sbfIGkniHuzgKL7DHH6kdlRre0XyEF0FCyoUEpHk+ODadakxbwR8092XDF40A4u/MCPDdoBNyXolXUKQ1vMOkR6ZU+IfgDA1/3zasNrYVMCGP+7MDKr4qZd/tqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cApdJnv4; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cApdJnv4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YX67d29Lnz3bxf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 09:17:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BAA525C5754;
	Mon, 13 Jan 2025 22:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB0D7C4CED6;
	Mon, 13 Jan 2025 22:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736806634;
	bh=nyWosVO4gXhoNan9ZDnAorgdajMFfqV7pgwt7RBeMIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cApdJnv4KbxaGWcejg6A2RbyrozepKqmlndvXBi2hkv0PwCbDyuRefMCVC6AogllV
	 VOcVN4YfrAWCFkzgPg6hMg8iACkZVi05w3DrKIWxkEwjtyufI2g1QbdSHU5hLrvp1K
	 t4JDUPfbyrWaCCRAYhVSpsndbMdIMezIXlgdTsKkGDKy/JaL8aPa3HvTPx4ajSF7It
	 QqJ2PRDrdAyQDTcJJsS6xUB5RT4vTiqih4CfeKzsZdD7axjFa+7YhiK6bSMkIQUHfC
	 ga/avwv08EA7UVMkt1KjZc7WGO1E2ymB9ozc8a0NizLZA2pFMrAdivrTD7+lEObYC3
	 S1aPf7+G7CWXA==
Date: Mon, 13 Jan 2025 14:17:12 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
	irogers@google.com, linux-perf-users@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
	hbathini@linux.ibm.com
Subject: Re: [PATCH V2] tools/perf/builtin-lock: Fix return code for
 functions in __cmd_contention
Message-ID: <Z4WQ6IO1euKOMIHN@google.com>
References: <20250110093730.93610-1-atrajeev@linux.vnet.ibm.com>
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
In-Reply-To: <20250110093730.93610-1-atrajeev@linux.vnet.ibm.com>
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 03:07:30PM +0530, Athira Rajeev wrote:
> perf lock contention returns zero exit value even if the lock contention
> BPF setup failed.
> 
>   # ./perf lock con -b true
>   libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DEBUG_INFO_BTF enabled?
>   libbpf: failed to find '.BTF' ELF section in /lib/modules/6.13.0-rc3+/build/vmlinux
>   libbpf: failed to find valid kernel BTF
>   libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DEBUG_INFO_BTF enabled?
>   libbpf: failed to find '.BTF' ELF section in /lib/modules/6.13.0-rc3+/build/vmlinux
>   libbpf: failed to find valid kernel BTF
>   libbpf: Error loading vmlinux BTF: -ESRCH
>   libbpf: failed to load object 'lock_contention_bpf'
>   libbpf: failed to load BPF skeleton 'lock_contention_bpf': -ESRCH
>   Failed to load lock-contention BPF skeleton
>   lock contention BPF setup failed
>   # echo $?
>    0
> 
> Fix this by saving the return code for lock_contention_prepare
> so that command exits with proper return code. Similarly set the
> return code properly for two other functions in builtin-lock, namely
> setup_output_field() and select_key().
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Reviewed-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung

> ---
> Changelog:
>  v1 -> v2
>  Fixed return code in functions: setup_output_field()
>  and select_key() as pointed out by Namhyung.
> 
>  tools/perf/builtin-lock.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/builtin-lock.c b/tools/perf/builtin-lock.c
> index 208c482daa56..94a2bc15a2fa 100644
> --- a/tools/perf/builtin-lock.c
> +++ b/tools/perf/builtin-lock.c
> @@ -2049,7 +2049,8 @@ static int __cmd_contention(int argc, const char **argv)
>  				goto out_delete;
>  		}
>  
> -		if (lock_contention_prepare(&con) < 0) {
> +		err = lock_contention_prepare(&con);
> +		if (err < 0) {
>  			pr_err("lock contention BPF setup failed\n");
>  			goto out_delete;
>  		}
> @@ -2070,10 +2071,14 @@ static int __cmd_contention(int argc, const char **argv)
>  		}
>  	}
>  
> -	if (setup_output_field(true, output_fields))
> +	err = setup_output_field(true, output_fields);
> +	if (err) {
> +		pr_err("Failed to setup output field\n");
>  		goto out_delete;
> +	}
>  
> -	if (select_key(true))
> +	err = select_key(true);
> +	if (err)
>  		goto out_delete;
>  
>  	if (symbol_conf.field_sep) {
> -- 
> 2.43.5
> 

