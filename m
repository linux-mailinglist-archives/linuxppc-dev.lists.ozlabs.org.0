Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CABBF6AD6C7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:28:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PW3rR4kTZz3cLB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 16:28:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KiEN0lSr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KiEN0lSr;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PW3qY1yBmz3blJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 16:27:35 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id bn17so6913934pgb.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 21:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678166852;
        h=in-reply-to:references:message-id:date:content-transfer-encoding:to
         :from:subject:cc:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AlK7Hs19AjyIKqP3f0Dwl6HgKXmloRUX9J0NNF4qZqI=;
        b=KiEN0lSrI7WdHvK+rnjlsSC8PfIXOqThM5Yhp6on6h/pS31vZIWhH8yTZ2qjPpe5xx
         UisPU6FWCL9VtMjr0XD0FrVJdu8YtEuykkldNDr+WwhFsP/F2L/Ne7TzEO35zH/95bcJ
         Dp9+DwQeI8qzAXIIGQ1RvRmUNtswyBa3EbimAMf71e18GzxGYULJFWQslySGV8fQ2Uuo
         /+TYis8hkk9bNjVuQ0C47MRsNetBokRMxAA40JwP935fdjdtGoody8r/p6wUjtBo6zfK
         f04A52pp7kPEEgX+t5potcw4pVyMQ6OGAO23JYjSahl4xpQqux4T0WH1z2DpwPPydO8g
         mgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678166852;
        h=in-reply-to:references:message-id:date:content-transfer-encoding:to
         :from:subject:cc:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AlK7Hs19AjyIKqP3f0Dwl6HgKXmloRUX9J0NNF4qZqI=;
        b=Us0cfH3uN2HGaTiFiPgtH2y7JmDjpSO9GDWbuR2ZWdHXJCpm8kKNTZN1deEaCc7lCP
         oe3dHWJmuphKw6YZcmOus+CkOjirfhgGGhyB2x4XF5AsuPnn84xi9fTYuzLJgcOaUokA
         BM9sOCLNFL6aiCj99SYqJUCJWAx5B608hbsagYorjj3ZY2xT4TCKqMHtz6TAuebNcseE
         x6QqHgOqtK7/mZt8oCraDoqhP3mxYdiClhacNLA1IREPTDfgLrOqvZSjnVU24vsctVjw
         RRTE9dFOgOCGBVUAFEDO7ho9x6fhxitjks1bhvT1FOKJBXSyA7sd2ToL5BWVCUDSFdFO
         V/Aw==
X-Gm-Message-State: AO0yUKX8I2hiAoD9DossBtpzrt4vhmnSk0sfEVbKnweMYB//RNJQ05cq
	qJDXLGFjg3U331fvZuRG2XatNm5dwDk=
X-Google-Smtp-Source: AK7set+9FsF4BJMmdn0oPnSFIvoRnnZoR2gOxBSb5vcLt0/zI12PgdR5eqnOvR8okCGeDSq2c4ccgw==
X-Received: by 2002:a62:5401:0:b0:5e2:da34:4aaf with SMTP id i1-20020a625401000000b005e2da344aafmr10320547pfb.4.1678166852291;
        Mon, 06 Mar 2023 21:27:32 -0800 (PST)
Received: from localhost ([203.220.77.23])
        by smtp.gmail.com with ESMTPSA id q18-20020a62e112000000b005a8de0f4c64sm7137152pfh.82.2023.03.06.21.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 21:27:31 -0800 (PST)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Subject: Re: [RFC PATCH 06/13] powerpc/dexcr: Add prctl implementation
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Benjamin Gray" <bgray@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Mar 2023 15:12:57 +1000
Message-Id: <CQZW6V070YIU.3Q6OJGKRPH3KY@bobo>
X-Mailer: aerc 0.13.0
References: <20221128024458.46121-1-bgray@linux.ibm.com>
 <20221128024458.46121-7-bgray@linux.ibm.com>
In-Reply-To: <20221128024458.46121-7-bgray@linux.ibm.com>
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
Cc: linux-hardening@vger.kernel.org, ajd@linux.ibm.com, cmr@bluescreens.de, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Nov 28, 2022 at 12:44 PM AEST, Benjamin Gray wrote:
> Adds an initial prctl interface implementation. Unprivileged processes
> can query the current prctl setting, including whether an aspect is
> implemented by the hardware or is permitted to be modified by a setter
> prctl. Editable aspects can be changed by a CAP_SYS_ADMIN privileged
> process.
>
> The prctl setting represents what the process itself has requested, and
> does not account for any overrides. Either the kernel or a hypervisor
> may enforce a different setting for an aspect.
>
> Userspace can access a readonly view of the current DEXCR via SPR 812,
> and a readonly view of the aspects enforced by the hypervisor via
> SPR 455. A bitwise OR of these two SPRs will give the effective
> DEXCR aspect state of the process.

You said (offline) that you were looking at the PR_SPEC_* speculation
control APIs but that this was different enough that you needed a
different one.

It would be good to know what some of those issues were in the
changelog, would be nice to have some docs (could we add something
to spec_ctrl.rst maybe?). I assume at least one difference is that
some of our bits are not speculative but architectural (e.g., the
stack hash check).

I also wonder if we could implement some of the PR_SPEC controls
APIs by mapping relevant DEXCR aspects to them instead of (or as well
as) the DEXCR controls? Or would the PR_SPEC users be amenable to
extensions that make our usage fit a bit better?

I'm just thinking if we can reduce reliance on arch specific APIs a
bit would be nice.

>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/processor.h |  13 +++
>  arch/powerpc/kernel/dexcr.c          | 133 ++++++++++++++++++++++++++-
>  arch/powerpc/kernel/process.c        |   6 ++
>  3 files changed, 151 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/=
asm/processor.h
> index 2381217c95dc..4c995258f668 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -265,6 +265,9 @@ struct thread_struct {
>  	unsigned long   sier2;
>  	unsigned long   sier3;
>  	unsigned long	hashkeyr;
> +	unsigned int	dexcr_override;
> +	unsigned int	dexcr_mask;

Hmm, what's the mask doing here? It only gets bits set and never
cleared AFAIKS. What is different between an initial state and a
SET then CLEAR state?

Thanks,
Nick
