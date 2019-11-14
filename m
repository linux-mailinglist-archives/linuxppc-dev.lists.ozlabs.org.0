Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F371FC0AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 08:22:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DCcT10pPzF5Px
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 18:22:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LwRHpOhf"; 
 dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DCZF3357zF6qs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 18:20:53 +1100 (AEDT)
Received: by mail-il1-x144.google.com with SMTP id z12so4415642ilp.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 23:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aU/9BHDvHIQmdSp9qV3K75LLCjIKeKU+ORdkaNriFrw=;
 b=LwRHpOhfYxeiNJpwzVgF97mjhfvRV1f3+pZCTUo6N1rvwE/jxDtPOA6I9nEKrEHzcU
 sTIqS9El+VLgQxKCAldkgX2LdU0hmxQcmDLLk+U6ZXzxAThLg/gR20r8hHg26qszt946
 2EWLYDCPinHMAjd3xEW309F1dx4o6KdW7aYAB6kx0i2JlVmo2n9mf7OUO1+7QIUCGpHH
 nHzA0pnwoIszOA8zQG/z5ynFZrVKpwCnBSXqpXWWK9O/NYK6+DaNJDuL046ohIQnN5fz
 1MxwjnJCh9brsN3pIK8X4hbocP+wg6gAE4E3jh95nk5812sjeaVfSK/ezhB/DJKpjjJS
 4IvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aU/9BHDvHIQmdSp9qV3K75LLCjIKeKU+ORdkaNriFrw=;
 b=IrXbcwe6UFwU5XNr0Wom+VMZZIMKZ3gjVpEOFCoZS/0hAUuEZqqkMEI4vNfVlNj9kG
 W76EvAbcUIN1jf+UBp5gf4r3G5A92sEwBI1Iu5PRDX7kX9xmmPN4jFRrcighwcojaySQ
 VnYqQlkdxwWX7/liU+/E90tJ4OoHnCs0caVoaQpIuAMRSZx1jy6kipXMGQt1vGfAU86+
 ObrA+JzMsk+skxmdXh1Xn6ufuAVRSdf1DkvLcIBb5WxnMQGVUwPOEK3UTIZatInW+t2l
 Tk1osEJB8tSR6iRoUA3TstLh1KbP44mqceQ4M2FQE1JzzvUxsFWFKb+AbSPm7kZojk6l
 iuHg==
X-Gm-Message-State: APjAAAWFEyDYLqWAXibogB9U4JjNc81kxm5Z1i4BY7gSZXp4vs40d1ew
 c9f8gN+k5qb8Uu5g3fumoLXIvYaEJN1axNFMOkc=
X-Google-Smtp-Source: APXvYqy6cMYTpIsJ7I6hS852jffBa35D7INNrUzGQswQl8mJkPo8wHY5UHL15hr1oOGXzszcFWR3F5DCOIgtoCzYjsM=
X-Received: by 2002:a92:cb0d:: with SMTP id s13mr8625950ilo.195.1573716049810; 
 Wed, 13 Nov 2019 23:20:49 -0800 (PST)
MIME-Version: 1.0
References: <20191114071836.31209-1-maddy@linux.vnet.ibm.com>
In-Reply-To: <20191114071836.31209-1-maddy@linux.vnet.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 14 Nov 2019 18:20:38 +1100
Message-ID: <CAOSf1CF=6GA_W3PZq4fP9hJrkxc=RuAYUWDpRrTUWjiGTK_Wcw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/perf: Disable trace_imc pmu
To: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 14, 2019 at 6:19 PM Madhavan Srinivasan
<maddy@linux.vnet.ibm.com> wrote:
>
> When a root user or a user with CAP_SYS_ADMIN
> privilege use trace_imc performance monitoring
> unit events, to monitor application or KVM threads,
> may result in a checkstop (System crash). Reason
> being frequent switch of the "trace/accumulation"
> mode of In-Memory Collection hardware.
> This patch disables trace_imc pmu unit, but will
> be re-enabled at a later stage with a fix patchset.
> ---
>  arch/powerpc/platforms/powernv/opal-imc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
> index e04b20625cb9..5790f078771f 100644
> --- a/arch/powerpc/platforms/powernv/opal-imc.c
> +++ b/arch/powerpc/platforms/powernv/opal-imc.c
> @@ -285,7 +285,12 @@ static int opal_imc_counters_probe(struct platform_device *pdev)
>                         domain = IMC_DOMAIN_THREAD;
>                         break;
>                 case IMC_TYPE_TRACE:
> -                       domain = IMC_DOMAIN_TRACE;
> +                       /* Using trace_imc events to monitor
> +                        * application or KVM thread performances
> +                        * may result in a checkstop (system crash).
> +                        * So disabling it for now.
> +                        */
> +                       domain = -1;
>                         break;
>                 default:
>                         pr_warn("IMC Unknown Device type \n");
> --
> 2.21.0
>

Does this need a Fixes: tag?
