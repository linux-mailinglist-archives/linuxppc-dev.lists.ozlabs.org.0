Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDC85BDFA3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 10:16:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWvWm2D8jz2yT0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 18:16:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LiF4a8ET;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LiF4a8ET;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWvW86PPcz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 18:15:48 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id q3so2211227pjg.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 01:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=qTRYszXd5XP9TmiaPlUCkZYa4RjeSXo51FddiasD47c=;
        b=LiF4a8ETDj1UP+b5xxnXOBSFtvLC5gZEF/6P1Z0nqVsvfsgXxoQ5ChHQtvXrBjHxXT
         n/MHGAexMEmyTHB11XcD3503mVuNVLCeNqWz+qllOKX0DFPZueCgCV4kqhI6U2aoqrgK
         EpLnH6gGov3DdLLT/v4C2YO6ZsrISxFlNd5bE4ymk/o0Tg2muz9JPC9MWefwcFA3Cfhy
         /kNt42BXd9YzZGJqwzt6uAwVoKnACVubUkKnXeNPtJo9RVj2JN/Gl9ReHKDRMxDHds8g
         /7twePh7y68iuuPElklgAfI7yQWZaLHtuDfQIXLnq1SK1ewRmr8QvI7QwhP0ymxN41up
         coxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=qTRYszXd5XP9TmiaPlUCkZYa4RjeSXo51FddiasD47c=;
        b=HUFQhH2H2CofourW4A088T8wAScLPHS8ut3WDUBC/LOvNgbbN1QY04O1dRzKOv3FH7
         iovhkG/mKsDI4y2O+tauahTs63GOjxI1/06ji9TTqKdeR7BBHKK6NSO5UQLYV80JSfHk
         FFHDc2vklbXtJO09l5pEtITRrvhZmxv2S/jbCuFL9fasbHIFHgwYejWK4veU0SE/15LI
         hUfu7qgF871trKP7DrUrLPncwKOCl1bKz3QAiejM+sFNMqyd9Q+sAJ5s6/EUuWfbEQk8
         IUiS7rXzRCt2PnvTjJziLNjonaIskG24yFwmAmg7q8w5DdktBn4ZMgzh8x7ZBgLFPQ47
         PlJg==
X-Gm-Message-State: ACrzQf2VfRkiZlUgOE2PddloPbp77bXUa21ojhHAeqjDDEj/ZVr0HTtY
	FzhpXMogxuUfDGg8t/ZxtLlZy57PSxEfKw==
X-Google-Smtp-Source: AMsMyM4az+9yzWI/D1Hc1D4TfVc5e75pl364iIY4bQ/e7FFdNW46VuhhRCwRK4rJzf6YyuuQQ1jvFw==
X-Received: by 2002:a17:90b:4b84:b0:202:ec40:8643 with SMTP id lr4-20020a17090b4b8400b00202ec408643mr2601322pjb.86.1663661745685;
        Tue, 20 Sep 2022 01:15:45 -0700 (PDT)
Received: from localhost ([203.219.227.147])
        by smtp.gmail.com with ESMTPSA id o74-20020a62cd4d000000b005499599ed30sm951625pfg.10.2022.09.20.01.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:15:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 18:15:40 +1000
Message-Id: <CN12V8MQ0QHF.34K9KQO90IR0T@bobo>
Subject: Re: [PATCH v2 2/2] powerpc/kvm: Remove unused references for
 MMCR3/SIER2/SIER3 registers
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Disha Goel" <disgoel@linux.vnet.ibm.com>, <mpe@ellerman.id.au>
X-Mailer: aerc 0.11.0
References: <20220916105736.268153-1-disgoel@linux.vnet.ibm.com>
 <20220916105736.268153-3-disgoel@linux.vnet.ibm.com>
In-Reply-To: <20220916105736.268153-3-disgoel@linux.vnet.ibm.com>
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Sep 16, 2022 at 8:57 PM AEST, Disha Goel wrote:
> From: Kajol Jain" <kjain@linux.ibm.com>
>
> Commit 57dc0eed73ca ("KVM: PPC: Book3S HV P9: Implement PMU save/restore
> in C") removed the PMU save/restore functions from assembly code and
> implemented these functions in C, for power9 and later platforms.
>
> After the code refactoring, Performance Monitoring Unit (PMU) registers
> became part of "p9_host_os_sprs" structure and now this structure is
> used to save/restore pmu host registers, for power9 and later platfroms.
> But we still have old unused registers references. Patch removes unused
> host_mmcr references for Monitor Mode Control Register 3 (MMCR3)/
> Sampled Instruction Event Register 2 (SIER2)/ SIER3 registers from
> "struct kvmppc_host_state".
>
> Fixes: 57dc0eed73ca ("KVM: PPC: Book3S HV P9: Implement PMU save/restore =
in C")
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

And it was increased from 7 to 10 with 5752fe0b811bb which added the
POWER10 registers, so that makes sense to go back to 7 in the POWER8
path.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/include/asm/kvm_book3s_asm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_book3s_asm.h b/arch/powerpc/inc=
lude/asm/kvm_book3s_asm.h
> index c8882d9b86c2..a36797938620 100644
> --- a/arch/powerpc/include/asm/kvm_book3s_asm.h
> +++ b/arch/powerpc/include/asm/kvm_book3s_asm.h
> @@ -105,7 +105,7 @@ struct kvmppc_host_state {
>  	void __iomem *xive_tima_virt;
>  	u32 saved_xirr;
>  	u64 dabr;
> -	u64 host_mmcr[10];	/* MMCR 0,1,A, SIAR, SDAR, MMCR2, SIER, MMCR3, SIER2=
/3 */
> +	u64 host_mmcr[7];	/* MMCR 0,1,A, SIAR, SDAR, MMCR2, SIER */
>  	u32 host_pmc[8];
>  	u64 host_purr;
>  	u64 host_spurr;
> --=20
> 2.31.1

