Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE3A30B605
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 04:45:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV9hL0XGDzDqvN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 14:45:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ACGMOTA/; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV9fN1mRszDqNF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 14:44:11 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id r20so10479081qtm.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Feb 2021 19:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rBhoyGWjkRsTCiTBILJWwj9Boa8VrzqKZ3SeTMdXre0=;
 b=ACGMOTA/8OZpInV0ItquQboxn9LAVxz6UJHSJIvcpOgRc/coMLx1GWsFQkrf+YlpPx
 qKl0peVuqCoKZgOsgH/lkY1YWvXBTQDZtsKsqa3pN56ktuWc8bCxVdtMcZ9DijXcnn8a
 HzvQ9PHH/ByPWra9+J1ObXTxEW87yRqD7/uoATM0MQlwnFIu5P6nXXjs3aGBKlOxpvzn
 ET30ue827ygRTsQUXCDmxz7gN7qMreMEcNECfW4FWSPyLETOQ3+iHGqPxP9CBy1aA7Sd
 wGrGB4VCEqQhJ97i4Un/bZQHCrDOZc6cEBI5X7V8zlJxZagNUFoyPVBQhLNc4Lj0hAe5
 aahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rBhoyGWjkRsTCiTBILJWwj9Boa8VrzqKZ3SeTMdXre0=;
 b=QAUKzi3WlReY8aArE1N7SahnsMs0VqqWAldKlmOPdE8sXv9OfvY3TNw37XQ86WqZBx
 wYly+bpQCOmRpMxSv6NS6h2qAU3FvUG7GCAB5i0UYN2sz+wWWOr6HsydYaEgD8uOY3ln
 Kq5HJMnVBx6j9lxT1ZLDoWCVOaNlcSHktMUhwa2rk4w67D5o5ZJvwjOxq/dVSxi1qEVm
 hE4susaGgqqTln23EyVZWV59mpYG41MPO9rfbvTiv7qrf74uaB319E/SeLZ88mOqJeuE
 /hp3GHmwt7FFE406NWyZuvCQsBXaV+heyVIm3U5AHr6PDJePENO6QuttlvvOHvMar7fm
 3Evw==
X-Gm-Message-State: AOAM530ZD0IKcK/9ntuyflBAlY3ZZ8TkOBuSsZGDIcd31aYlWeDuv0Rq
 oNhPgRYllCnHxyTI+gV1cEtpJ31/qnMOi0zaCMk=
X-Google-Smtp-Source: ABdhPJxzk7x152gj1ZR/fWJAgd6iIGwx/YPu/xELj1cCgD8ICJ9wFnTTN6i8d/IlUIhSBV9Uxps4qvOpKumMUMMgurM=
X-Received: by 2002:ac8:554d:: with SMTP id o13mr18240722qtr.55.1612237447824; 
 Mon, 01 Feb 2021 19:44:07 -0800 (PST)
MIME-Version: 1.0
References: <1612236096-91154-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1612236096-91154-1-git-send-email-yang.lee@linux.alibaba.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 2 Feb 2021 14:43:57 +1100
Message-ID: <CAOSf1CHrTda_mezUCspges_yTbrhJPLekb1uibA7qFWxbBG_3Q@mail.gmail.com>
Subject: Re: [PATCH] powerpc/eeh: remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 2, 2021 at 2:21 PM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Eliminate the following coccicheck warning:
> ./arch/powerpc/kernel/eeh.c:782:2-3: Unneeded semicolon

Doesn't appear to be a load-bearing semicolon. It's hard to tell with EEH.

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>

>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  arch/powerpc/kernel/eeh.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 813713c..02c058d 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -779,7 +779,7 @@ int pcibios_set_pcie_reset_state(struct pci_dev *dev, enum pcie_reset_state stat
>         default:
>                 eeh_pe_state_clear(pe, EEH_PE_ISOLATED | EEH_PE_CFG_BLOCKED, true);
>                 return -EINVAL;
> -       };
> +       }
>
>         return 0;
>  }
> --
> 1.8.3.1
>
