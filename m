Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D7D22326E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 06:38:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7JJs6mQhzDrFL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 14:38:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Kh1uw69R; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7J0t2s8czDrJl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 14:24:14 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id 95so5966226otw.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 21:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fYRhNeJyMfpc078wL/j31HurR5nJxYBJf2WPWtqv67M=;
 b=Kh1uw69RH6AnDF+LGaQL/TlfB/OoFmyUPwbfUkO50aMlcjf5CR/uR2PYWm7tPKN3fV
 jR7mdlp9am3bRba3SEs4mJ98wUxBm4j2ANKGObN41QYgd+VRpQW4DhrruTPnYQ3z3glV
 OY5crlzGJJfGYp25p7IlnG4R7X17m+302T7QWNmLhESiLM4WbYkDMX2KCYfgRGhkjRuJ
 3t0kqv/fHJB1zQf2vfXSNrkDp/YM2LsW2XiRDXXq2zu7YrIoAu+G2Ill1BAKf03VcY/i
 /5olQ54IGuE99Z71PV7RCYsBFnoPJGHOYD32Q1XVFWl21dG2i54dvNwZZMKgR2jKspFb
 2S2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fYRhNeJyMfpc078wL/j31HurR5nJxYBJf2WPWtqv67M=;
 b=H0HCjr6tsjkL96bmLdm0I+vO12MX9OHqhGHEaM7kfKeaoNGgA6kCtQBh8FF+YQuQpN
 n3Ga7+MAqhM9NskpPBTJdLzSNvBvwygJj1R8I72QoLKLjW9LlxHLn0GzDlT4w6Sr5sqC
 zgsJdjhVE2zrdQ/23zuROfplBcSQewDLe+SpvhtkIWqPpLFdefRSdhuozY5TDqwtogdQ
 37KVa/6p+ltD3eXUipebZZEtozXtjpAjzhQdlDp5mVxVaV2AcZYs4aHGz21enPpsClSg
 Qgq+rVs9z3l9l8HRiKfLR867uhXFyxF3UnukJ4mH83dVyVznPrcmKb6uGKiYzxs0w5z0
 fCpg==
X-Gm-Message-State: AOAM533gJuXL1H/CkN7rinIBZJHpPeZHLClwasynkcUd7/R+Uahqw+hD
 K5YgMbuHKCuA5GlV3DrnIZq9VKrBdggb9mZd5UE=
X-Google-Smtp-Source: ABdhPJy9Qve7h79FN/Grjt90XmaceRcsY/1aZcCD1+74wKOmBXvf2VJ15Vwm0aB6fQ4xmUck1IdK6oqrCnN+I8ERfv0=
X-Received: by 2002:a9d:6a12:: with SMTP id g18mr7790181otn.155.1594959850557; 
 Thu, 16 Jul 2020 21:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200717040958.70561-1-ravi.bangoria@linux.ibm.com>
 <20200717040958.70561-5-ravi.bangoria@linux.ibm.com>
In-Reply-To: <20200717040958.70561-5-ravi.bangoria@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Fri, 17 Jul 2020 14:23:03 +1000
Message-ID: <CACzsE9py0x7wFyG-FgjK-cF8L02OQyOKbqDzP6agFt-Dxc4ejg@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] powerpc/watchpoint: Enable watchpoint
 functionality on power10 guest
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, apopple@linux.ibm.com,
 mikey@neuling.org, miltonm@us.ibm.com, peterz@infradead.org, oleg@redhat.com,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, jolsa@kernel.org, fweisbec@gmail.com,
 pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 17, 2020 at 2:10 PM Ravi Bangoria
<ravi.bangoria@linux.ibm.com> wrote:
>
> CPU_FTR_DAWR is by default enabled for host via CPU_FTRS_DT_CPU_BASE
> (controlled by CONFIG_PPC_DT_CPU_FTRS). But cpu-features device-tree
> node is not PAPR compatible and thus not yet used by kvm or pHyp
> guests. Enable watchpoint functionality on power10 guest (both kvm
> and powervm) by adding CPU_FTR_DAWR to CPU_FTRS_POWER10. Note that
> this change does not enable 2nd DAWR support.
>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
I ran the ptrace-hwbreak selftest successfully within a power10 kvm guest.
Tested-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/include/asm/cputable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
> index bac2252c839e..e506d429b1af 100644
> --- a/arch/powerpc/include/asm/cputable.h
> +++ b/arch/powerpc/include/asm/cputable.h
> @@ -478,7 +478,7 @@ static inline void cpu_feature_keys_init(void) { }
>             CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
>             CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
>             CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | CPU_FTR_PKEY | \
> -           CPU_FTR_ARCH_31)
> +           CPU_FTR_ARCH_31 | CPU_FTR_DAWR)
>  #define CPU_FTRS_CELL  (CPU_FTR_LWSYNC | \
>             CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | \
>             CPU_FTR_ALTIVEC_COMP | CPU_FTR_MMCRA | CPU_FTR_SMT | \
> --
> 2.26.2
>
