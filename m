Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 004AB22A9D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 09:44:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC48q0X4lzDqXB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 17:44:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OC8Tcguz; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC46P413szDr7J
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 17:42:05 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id g37so3691248otb.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 00:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U+8N7GWgEgVv1K50QQ/3loKTT/p4q+9VM8bVlrohMEc=;
 b=OC8TcguzABMfWgxRsgFA2/m+2RD9oKMw3/O3mJm0ZttRo8rI7KmovIAAMPxX4ai8eB
 CWGMDsxHAT88MdBZb8uGIe7KxCtII/oTRU7L2iOMwB+iMycJPzw6fWqkqEQuQyWq8wqp
 ze24vDCPMoNH40/mCDSLm00ekb9T5Uew+nvs42+cISud9JnDySYtucE8vukp+MVaMtcr
 pRAdqxE1ZE3I3BpX1N5umZCRsNYKvf+OrLOCwYBg3G+VpWiavEbeLZKAF9ah7ZX+YEdi
 6k0DcBOC/ik+sLTlNyJt2emhMU7ZoQRcKd9ZXIWa7p+9lms5StNKEmTCPlncjm6Sf+Kf
 doHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U+8N7GWgEgVv1K50QQ/3loKTT/p4q+9VM8bVlrohMEc=;
 b=Z5GffVNtODIrE+r5r+d6/0HM8ySN8UQcf4KtHuqQbe/mmppESIaIzLk3K0luK7SK3e
 tjKWxgZqtxeP68vVjLd39u6+fB3z3ABeRbX6Gd2lCHdrH3VUwFF8BaBZbAsGQ2GUmUn1
 6SAaHMXKmzX7BhXcePHfsxY2r8JtT+Sey/UDHD8kZtQmAEsCY8SXd0cpX4WvPRaGUG60
 Kw20jCu8rCLJFbyzhF2rJ2+pAJ0OcJD9qu8EVaGSmraPCCwIWh8bc03O0R+cENkCQz0z
 upp+JYxsTgo70mqRyOpCKGCCDckdh5pXweTRrioySfeantcFV85dqsQKG79e1ywUp89M
 oUew==
X-Gm-Message-State: AOAM530Sd29MXmsJy/PCNQJ589blGwsVns8B1+eYbL2hCvgIWVKY4SiV
 34HkkJjridXDKHctw4x5/vlwT56k7lciQRPn8/2FMw==
X-Google-Smtp-Source: ABdhPJxTKtycC3xxRmcnVAouqd5evjRX/vXyycCCG29EoIpqjidkT+3UgfR9c5RLHrDTt0OV6PmRSDkCQS9/vQLQLmE=
X-Received: by 2002:a9d:2041:: with SMTP id n59mr3338343ota.28.1595490121925; 
 Thu, 23 Jul 2020 00:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <1595489557-2047-1-git-send-email-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1595489557-2047-1-git-send-email-atrajeev@linux.vnet.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 23 Jul 2020 17:40:26 +1000
Message-ID: <CACzsE9ogrEtmD9=fDZ0vMdFL7Tgo=132wdEb9mHbjoueRLj-dg@mail.gmail.com>
Subject: Re: [v4] powerpc/perf: Initialize power10 PMU registers in cpu setup
 routine
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
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
Cc: Michael Neuling <mikey@neuling.org>, maddy@linux.vnet.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 23, 2020 at 5:32 PM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> Initialize Monitor Mode Control Register 3 (MMCR3)
> SPR which is new in power10. For PowerISA v3.1, BHRB disable
> is controlled via Monitor Mode Control Register A (MMCRA) bit,
> namely "BHRB Recording Disable (BHRBRD)". This patch also initializes
> MMCRA BHRBRD to disable BHRB feature at boot for power10.
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reviewed-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> Dependency:
> - On power10 PMU base enablement series V3:
>   https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=190462
>
> Changes from v3 -> v4
> - Addressed review comments from Jordan and Michael Ellerman.
>   This patch was initially part of Power10 PMU base enablement
>   series. Moving this as separate patch as suggested by Michael
>   Ellerman. Hence dependency of initial series Patch 7 which defines
>   MMCRA_BHRB_DISABLE. Addressed review comments from Jordan to make
>   sure existing PMU function (__INIT_PMU) will not overwrite ISA 3.1
>   updates
>
> Changes from v2 -> v3
> - Addressed review comment from Michael Ellerman to
>   call PMU init from __setup_cpu_power10
>
>  arch/powerpc/kernel/cpu_setup_power.S | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/cpu_setup_power.S
> index efdcfa7..3fa6eef 100644
> --- a/arch/powerpc/kernel/cpu_setup_power.S
> +++ b/arch/powerpc/kernel/cpu_setup_power.S
> @@ -94,13 +94,15 @@ _GLOBAL(__restore_cpu_power8)
>  _GLOBAL(__setup_cpu_power10)
>         mflr    r11
>         bl      __init_FSCR_power10
> +       bl      __init_PMU
> +       bl      __init_PMU_ISA31
>         b       1f
>
>  _GLOBAL(__setup_cpu_power9)
>         mflr    r11
>         bl      __init_FSCR
> -1:     bl      __init_PMU
> -       bl      __init_hvmode_206
> +       bl      __init_PMU
> +1:     bl      __init_hvmode_206
>         mtlr    r11
>         beqlr
>         li      r0,0
> @@ -124,13 +126,15 @@ _GLOBAL(__setup_cpu_power9)
>  _GLOBAL(__restore_cpu_power10)
>         mflr    r11
>         bl      __init_FSCR_power10
> +       bl      __init_PMU
> +       bl      __init_PMU_ISA31
>         b       1f
>
>  _GLOBAL(__restore_cpu_power9)
>         mflr    r11
>         bl      __init_FSCR
> -1:     bl      __init_PMU
> -       mfmsr   r3
> +       bl      __init_PMU
> +1:     mfmsr   r3
>         rldicl. r0,r3,4,63
>         mtlr    r11
>         beqlr
> @@ -233,3 +237,10 @@ __init_PMU_ISA207:
>         li      r5,0
>         mtspr   SPRN_MMCRS,r5
>         blr
> +
> +__init_PMU_ISA31:
> +       li      r5,0
> +       mtspr   SPRN_MMCR3,r5
> +       LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)
> +       mtspr   SPRN_MMCRA,r5
> +       blr
> --
> 1.8.3.1
>
