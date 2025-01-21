Return-Path: <linuxppc-dev+bounces-5464-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A8FA181FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 17:29:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yct2k1XKlz30Vp;
	Wed, 22 Jan 2025 03:29:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b7"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737476974;
	cv=none; b=lXwNcR2qV7Dy7VkYWU0hOzvD9hKjDt9cc3mrlD8eDlXKoKq1hileIE//JwAsIezAFIp9KUcY3DD+RBGr1RkNHG4jbXk5kxaIcV5GCBItfmM2sRcwHKe3Rn7NIgzcvgU3tNZmf2l+HqJNzoSboj+9vpno8YO8rjBOTnL0vS/6BJSujo/jYsxfwx4r/dDAuqa9WVgZ0DGHrlCdOBN3Cp8VIEZkyMX6ExA7YcRwBDGO6BL1Ogg+TDN5NzaZMmd/LkK6+b8IHiX513bva4m0CQOX/tBcc+a9DIlDJ0YQ/yI4hhCB3rp6G1R9ZVUSfnGVwSbEEdLt2COlx4O0O8kvImxo/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737476974; c=relaxed/relaxed;
	bh=JHE1Ks4sha2VPulKTfL3JK8VfRv3tuso1k0l1+BbscY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdO0uTdiXL+Pih/0u25n1b6ynSPQEqg2G2+u/m/CojC4eAw5o6Qt/+kktB8yPBfe2nZZxBeNKC0HTaOw3fNYM9jC/a+ASZuSVI3LzEOvcU2fRlkU6PJ8N0FTBSfHdJPvh6UK7RRSWpPx6T0+u++f4f/iTxUSSc/bVtn+J/c4M3udDl78GqZMEARcfvd6A3JxuVlSnZZneU8qEjzZn9errMiRzkHbbEMoNF+nmJmWDK2jUd0NNkSfyuJfgqPppB0uzE1UDYPohgdrm34p5lNrdewam7uhAxlwkO5uGQwcBQZaFfMhoOBYmjsZ2R32G+3HxAQy34WmWb04dV1/bG848Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:203:375::b7; helo=out-183.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b7; helo=out-183.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [IPv6:2001:41d0:203:375::b7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yct2c3Fvtz30Ts
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 03:29:27 +1100 (AEDT)
Date: Tue, 21 Jan 2025 17:29:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737476948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JHE1Ks4sha2VPulKTfL3JK8VfRv3tuso1k0l1+BbscY=;
	b=ThyApVdiP12DgYTi+kjvBSrSt+RXWw1HLWvA8u4utOlNQmE4yb5C1jYj6Orkv1Dp2iJeY6
	rXmAwK6G9lbo4TBQOEmzkgkXQ6luL3C4+iz9Dxnj3EwunsaPkUpMGfXE7oNug+SLD5DSrN
	ZWyxbw6bSnfEJir2ggCFGEDT9G1saMQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 08/18] scripts/runtime: Detect kvmtool
 failure in premature_failure()
Message-ID: <20250121-ec03a2683ab979d2313e09ee@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-9-alexandru.elisei@arm.com>
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
In-Reply-To: <20250120164316.31473-9-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 04:43:06PM +0000, Alexandru Elisei wrote:
> kvm-unit-tests assumes that if the VMM is able to get to where it tries to
> load the kernel, then the VMM and the configuration parameters will also
> work for running the test. All of this is done in premature_failure().
> 
> Teach premature_failure() about the kvmtool's error message when it fails
> to load the dummy kernel.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  scripts/runtime.bash | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 451b5585f010..ee8a188b22ce 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -12,18 +12,27 @@ extract_summary()
>      tail -5 | grep '^SUMMARY: ' | sed 's/^SUMMARY: /(/;s/'"$cr"'\{0,1\}$/)/'
>  }
>  
> -# We assume that QEMU is going to work if it tried to load the kernel
> +# We assume that the VMM is going to work if it tried to load the kernel
>  premature_failure()
>  {
>      local log
>  
>      log="$(eval "$(get_cmdline _NO_FILE_4Uhere_)" 2>&1)"
>  
> -    echo "$log" | grep "_NO_FILE_4Uhere_" |
> -        grep -q -e "[Cc]ould not \(load\|open\) kernel" \
> -                -e "error loading" \
> -                -e "failed to load" &&
> -        return 1
> +    case "$TARGET" in
> +    qemu)
> +

extra blank line here

> +        echo "$log" | grep "_NO_FILE_4Uhere_" |
> +            grep -q -e "[Cc]ould not \(load\|open\) kernel" \
> +                    -e "error loading" \
> +                    -e "failed to load" &&
> +            return 1
> +        ;;
> +    kvmtool)
> +        echo "$log" | grep "Fatal: Unable to open kernel _NO_FILE_4Uhere_" &&
> +            return 1
> +        ;;
> +    esac

This looks good, but could possibly become

 eval echo "$log" | ${vmm_opts[$TARGET,premature_failure]} && return 1

if we got the vmm_opts route.

Thanks,
drew

>  
>      RUNTIME_log_stderr <<< "$log"
>  
> -- 
> 2.47.1
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

