Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6011E4F20D5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 04:50:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXXF41xyyz3bYG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 12:50:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nDSKlTbn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=nDSKlTbn; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXXDP36dkz2xWg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Apr 2022 12:49:39 +1000 (AEST)
Received: by mail-qv1-xf30.google.com with SMTP id kd21so9046664qvb.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Apr 2022 19:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+3yYs4jPEdpiPVZtw96RU6MjJ9sWjKN7KDqJyIXraKE=;
 b=nDSKlTbnhB5zbglbFxSPUYNryzfXcRiscLFyNo1n0TiZssQFMqexQblAcNe/CQdp7o
 anCH9utw/gOPubIATJxxSLlNS3051COoPiJud7P3KXrU7IClDAnHBax6+SdVpmW9Pi2C
 Aug855s/iXmdOEDqZQpItCzF+BTZi9hGc234Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+3yYs4jPEdpiPVZtw96RU6MjJ9sWjKN7KDqJyIXraKE=;
 b=yiFwaNnLL4o5XnoqSOowHaKi8RhC4Gnlt8mY8H2CpoNQkL+ABcZsnOYVS32/KeyK2/
 lXz60gLswGLWa5mbYazQdHBUsEjYl/nutL1cwQJSEc598SrOCzm8cDinbH/+wBoS5nXF
 s709I6lqsZblzxtoGvNVTaGObN9ffRCfEDM/hu/9IxW+Y5Z4NBIcfQBsaglJohRCWu7X
 tYNAGtxlUPetOeZXNOd12TFIY3wOmA6RJ61JxurN+u2khUg+xHaCpbkco1s2jcxOSwXQ
 2OHlfkDoMOOJfgc8Ib4TuAZ5cdgDorrBIKN1icPxDhE/Za83Muc3NNmZ4wuB0z5iJ2vB
 LdAQ==
X-Gm-Message-State: AOAM532NVY18xhU+ZkDis397vAYir6jqw/1KxYLJkSkh4UCWMkaghpYD
 0kJLpEG/2S74oBahhWuqiRtde8f9Cda7I5ggGow=
X-Google-Smtp-Source: ABdhPJw2+1ELG901fsXNiJurRT6Bsuasdk/BUE7Ro7b5ylkqz0PfvneXSY7SwCFYyl9MtH/vdqodwd5i+MDOgbqRfU4=
X-Received: by 2002:a0c:f583:0:b0:443:d114:e059 with SMTP id
 k3-20020a0cf583000000b00443d114e059mr933170qvm.107.1649126974510; Mon, 04 Apr
 2022 19:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220404101536.104794-1-ruscur@russell.cc>
In-Reply-To: <20220404101536.104794-1-ruscur@russell.cc>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 5 Apr 2022 02:49:21 +0000
Message-ID: <CACPK8XdifXFmjCJL3KDu8PJi4KLKWnOBeq86wZvN0kiHGQ=JHw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] powerpc/powernv: Get L1D flush requirements from
 device-tree
To: Russell Currey <ruscur@russell.cc>
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
Cc: =?UTF-8?Q?Murilo_Opsfelder_Ara=C3=BAjo?= <mopsfelder@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 4 Apr 2022 at 10:15, Russell Currey <ruscur@russell.cc> wrote:
>
> The device-tree properties no-need-l1d-flush-msr-pr-1-to-0 and
> no-need-l1d-flush-kernel-on-user-access are the equivalents of
> H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY and H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS
> from the H_GET_CPU_CHARACTERISTICS hcall on pseries respectively.
>
> In commit d02fa40d759f ("powerpc/powernv: Remove POWER9 PVR version
> check for entry and uaccess flushes") the condition for disabling the
> L1D flush on kernel entry and user access was changed from any non-P9
> CPU to only checking P7 and P8.  Without the appropriate device-tree
> checks for newer processors on powernv, these flushes are unnecessarily
> enabled on those systems.  This patch corrects this.
>
> Fixes: d02fa40d759f ("powerpc/powernv: Remove POWER9 PVR version check for entry and uaccess flushes")
> Reported-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Russell Currey <ruscur@russell.cc>

I booted both patches in this series on a power10 powernv machine,
applied on top of v5.18-rc1:

$ dmesg |grep -i flush
[    0.000000] rfi-flush: fallback displacement flush available
[    0.000000] rfi-flush: patched 12 locations (no flush)
[    0.000000] count-cache-flush: flush disabled.
[    0.000000] link-stack-flush: flush disabled.

$ grep . /sys/devices/system/cpu/vulnerabilities/*
/sys/devices/system/cpu/vulnerabilities/itlb_multihit:Not affected
/sys/devices/system/cpu/vulnerabilities/l1tf:Not affected
/sys/devices/system/cpu/vulnerabilities/mds:Not affected
/sys/devices/system/cpu/vulnerabilities/meltdown:Not affected
/sys/devices/system/cpu/vulnerabilities/spec_store_bypass:Not affected
/sys/devices/system/cpu/vulnerabilities/spectre_v1:Mitigation: __user
pointer sanitization, ori31 speculation barrier enabled
/sys/devices/system/cpu/vulnerabilities/spectre_v2:Mitigation:
Software count cache flush (hardware accelerated), Software link stack
flush
/sys/devices/system/cpu/vulnerabilities/srbds:Not affected
/sys/devices/system/cpu/vulnerabilities/tsx_async_abort:Not affected

Does that match what we expect?

Cheers,

Joel

> ---
>  arch/powerpc/platforms/powernv/setup.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
> index 105d889abd51..378f7e5f18d2 100644
> --- a/arch/powerpc/platforms/powernv/setup.c
> +++ b/arch/powerpc/platforms/powernv/setup.c
> @@ -96,6 +96,12 @@ static void __init init_fw_feat_flags(struct device_node *np)
>
>         if (fw_feature_is("disabled", "needs-spec-barrier-for-bound-checks", np))
>                 security_ftr_clear(SEC_FTR_BNDS_CHK_SPEC_BAR);
> +
> +       if (fw_feature_is("enabled", "no-need-l1d-flush-msr-pr-1-to-0", np))
> +               security_ftr_clear(SEC_FTR_L1D_FLUSH_ENTRY);
> +
> +       if (fw_feature_is("enabled", "no-need-l1d-flush-kernel-on-user-access", np))
> +               security_ftr_clear(SEC_FTR_L1D_FLUSH_UACCESS);
>  }
>
>  static void __init pnv_setup_security_mitigations(void)
> --
> 2.35.1
>
