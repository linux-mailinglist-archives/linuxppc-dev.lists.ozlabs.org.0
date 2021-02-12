Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C93B331995A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 05:54:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcLkY62FwzDwyK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 15:54:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=VNW3B3XO; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcLj23164zDwn7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 15:52:52 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id t29so5083667pfg.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 20:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Saxit6NqSA+6QYkwaBsjDdtym5gLLpEny89P9JSDncw=;
 b=VNW3B3XOtb63e446W2UhF+OmjU5Xvvyf9RS8haDSbOWsMqgLkscNb87i613NYxqJti
 Lbj10TzYxAT0mvXzL8sIxzEkIvG+YiPI5DceOCEcMKE5t7t1n+2vfG+TYMxaGuCQJfdk
 m40caxf0J6nscLf8uCibEmWgwjDxtNGkMBkjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Saxit6NqSA+6QYkwaBsjDdtym5gLLpEny89P9JSDncw=;
 b=eBMEcmdm73p1TB1loNnlbqfMPMwW5eN+7qHsdIZ4J56seaNBbgK4ldsxsWO3v4DrJd
 MnrJDGSeISZUotnW/0kUIraGdd4QrBcuPAAsFofnXXLOgV/WCIcTDO3lH5m2GkIkZ2V6
 a32+bvsqsJZWAIXNEpw2J1qMNDI+ScvIglMQCuO4UVyE3LSd7XeTyQ/20t2iqg/0al7a
 EdXopYadQfHryOC8oOCXbNAvcxn3J4NYlEIaJTtCnwm4YwiVFs5cJGhd0GzWlZVGAGBV
 tQ4h2DX5s+t/XwMvnpoX5pHaLW41QzFhTjl2ZqKQXQhA1HDId+gtX9+m8PWiBXeTKMjv
 CxNA==
X-Gm-Message-State: AOAM533BdbeSd5Nvpm/Ov+XDO6/lsV2BYDpsJLq7fNyopSQIvuiBvsla
 KF+JlfE84k+bHBUJJWEc+ObtXA==
X-Google-Smtp-Source: ABdhPJyt3QQOvR7fm7lu+yfPkbsFAF2ro2m6yTUZwIGfMq5OYZJmNOg7ymfqwU2SsXfE1kKSYDC9GA==
X-Received: by 2002:a62:2ec3:0:b029:1dd:3eb1:bec9 with SMTP id
 u186-20020a622ec30000b02901dd3eb1bec9mr1181632pfu.62.1613105568155; 
 Thu, 11 Feb 2021 20:52:48 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-f9db-27eb-79e2-afa8.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:f9db:27eb:79e2:afa8])
 by smtp.gmail.com with ESMTPSA id v126sm7278265pfv.163.2021.02.11.20.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 20:52:47 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 04/10] powerpc: Reference param in MSR_TM_ACTIVE() macro
In-Reply-To: <20210203184323.20792-5-cmr@codefail.de>
References: <20210203184323.20792-1-cmr@codefail.de>
 <20210203184323.20792-5-cmr@codefail.de>
Date: Fri, 12 Feb 2021 15:52:43 +1100
Message-ID: <877dndevl0.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Chris,

(totally bikeshedding, but I'd use the full word parameter in the
subject if you have enough spare characters.)

> Unlike the other MSR_TM_* macros, MSR_TM_ACTIVE does not reference or
> use its parameter unless CONFIG_PPC_TRANSACTIONAL_MEM is defined. This
> causes an 'unused variable' compile warning unless the variable is also
> guarded with CONFIG_PPC_TRANSACTIONAL_MEM.
>
> Reference but do nothing with the argument in the macro to avoid a
> potential compile warning.

Andrew asked why we weren't seeing these warnings already.

I was able to reproduce them with CONFIG_PPC_TRANSACTIONAL_MEM off, but
only if I compiled with W=3D1:

arch/powerpc/kernel/process.c: In function =E2=80=98enable_kernel_fp=E2=80=
=99:
arch/powerpc/kernel/process.c:210:16: error: variable =E2=80=98cpumsr=E2=80=
=99 set but not used [-Werror=3Dunused-but-set-variable]
  210 |  unsigned long cpumsr;
      |                ^~~~~~

Having said that, this change seems like a good idea, squashing warnings
at W=3D1 is still valuable.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>  arch/powerpc/include/asm/reg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/re=
g.h
> index e40a921d78f9..c5a3e856191c 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -124,7 +124,7 @@
>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>  #define MSR_TM_ACTIVE(x) (((x) & MSR_TS_MASK) !=3D 0) /* Transaction act=
ive? */
>  #else
> -#define MSR_TM_ACTIVE(x) 0
> +#define MSR_TM_ACTIVE(x) ((void)(x), 0)
>  #endif
>=20=20
>  #if defined(CONFIG_PPC_BOOK3S_64)
> --=20
> 2.26.1
