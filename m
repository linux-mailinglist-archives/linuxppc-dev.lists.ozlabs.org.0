Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B0F2B57B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 04:09:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZrXL34Z0zDqQJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 14:09:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iU3kKuyv; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZrN11p81zDqQJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 14:02:40 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id k4so9257189qko.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 19:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OrFb4zM53elIT7cUSmZjOKhggxTeko72lh8gYsva7hU=;
 b=iU3kKuyvQRxAJ2xeOPjzmOu8Jcu8QJfJocxHmvGc++AIp+Sw7/xgGEvQo9PkL7IkFP
 cdWcbSK/MT+F5maLoEsLzJMRr0l0AYumPN/MnS3EEGJ0GpxGZO5OatPg8zgESabJ442L
 uSTBA0pUo0RCTarpFKrQEIX8cYheEEQMDJwP1Ep43mQT94oC2AjOLFNVf4W8DF8Ms3FT
 Y6+4jq51wy1cLKa+ik2QCaHAEYcZm8UxI3cw7GxFA6jp8y9wYYnaBwADLFqZwySRz6XZ
 J+eO9finfZ6fXsmmyRgDvFPwbM2Tse75go2iIAnH8r0CLqd7cFwZuB0yL4smoarr3tO7
 c2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OrFb4zM53elIT7cUSmZjOKhggxTeko72lh8gYsva7hU=;
 b=ubKSIunvRSL1kKH+SmGugwItsXE/K1wMqcouUhI28dFSxNtDTsEuQJF/x4pbPxlRqy
 rTippZd2rGMChhPBnMwcJxA0/6GqIWdORSivE1RlIrYJOszrpdjYklptnw044JEXBp9v
 t6E1fQ/Jv4/kgV/5wSIGqUwE8s5Gc2P1gRrd+FYrOxwxsfawAAG7vSJ2BcS8WomBuz5T
 LQRiFBn8K1PnQ+cPm3LYBYYLqDeA02WfYBHL1xzLE9v/C1ovn2qFWCeh4nleGuM9bK42
 Z1bADrkVi7J+fz5PeWzN0s25wCF9z/HY/qFk69Gy9JCO8oB8TGSwDqvDfWGE+hsU4+4q
 RmCg==
X-Gm-Message-State: AOAM5311YcWNnKyNMrfQ18IrcLwY8UPrEp5AvpQKcExJJfZv0guzZql0
 FWLRVf6dxv6VHl9HDGRl2bE=
X-Google-Smtp-Source: ABdhPJzF6HfIdmdD/B8loBrHQSKslXMtaSiE0xSd3YLxEd32d4j8tZVQ20B35c/cct/Bndyi3mdE+g==
X-Received: by 2002:a37:6854:: with SMTP id d81mr17624635qkc.230.1605582156017; 
 Mon, 16 Nov 2020 19:02:36 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id v14sm13948831qkb.15.2020.11.16.19.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 19:02:35 -0800 (PST)
Date: Mon, 16 Nov 2020 20:02:34 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 3/3] powerpc: fix -Wimplicit-fallthrough
Message-ID: <20201117030234.GC1340689@ubuntu-m3-large-x86>
References: <20201116043532.4032932-1-ndesaulniers@google.com>
 <20201116043532.4032932-4-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116043532.4032932-4-ndesaulniers@google.com>
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
Cc: clang-built-linux@googlegroups.com,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 15, 2020 at 08:35:32PM -0800, Nick Desaulniers wrote:
> The "fallthrough" pseudo-keyword was added as a portable way to denote
> intentional fallthrough. Clang will still warn on cases where there is a
> fallthrough to an immediate break. Add explicit breaks for those cases.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/236
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  arch/powerpc/kernel/prom_init.c | 1 +
>  arch/powerpc/kernel/uprobes.c   | 1 +
>  arch/powerpc/perf/imc-pmu.c     | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index 38ae5933d917..e9d4eb6144e1 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -355,6 +355,7 @@ static int __init prom_strtobool(const char *s, bool *res)
>  		default:
>  			break;
>  		}
> +		break;
>  	default:
>  		break;
>  	}
> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
> index d200e7df7167..e8a63713e655 100644
> --- a/arch/powerpc/kernel/uprobes.c
> +++ b/arch/powerpc/kernel/uprobes.c
> @@ -141,6 +141,7 @@ int arch_uprobe_exception_notify(struct notifier_block *self,
>  	case DIE_SSTEP:
>  		if (uprobe_post_sstep_notifier(regs))
>  			return NOTIFY_STOP;
> +		break;
>  	default:
>  		break;
>  	}
> diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
> index 7b25548ec42b..e106909ff9c3 100644
> --- a/arch/powerpc/perf/imc-pmu.c
> +++ b/arch/powerpc/perf/imc-pmu.c
> @@ -1500,6 +1500,7 @@ static int update_pmu_ops(struct imc_pmu *pmu)
>  		pmu->pmu.stop = trace_imc_event_stop;
>  		pmu->pmu.read = trace_imc_event_read;
>  		pmu->attr_groups[IMC_FORMAT_ATTR] = &trace_imc_format_group;
> +		break;
>  	default:
>  		break;
>  	}
> -- 
> 2.29.2.299.gdc1121823c-goog
> 
