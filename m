Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D065E7165
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 03:28:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYZLJ6GBZz3cNM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 11:28:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20210112.gappssmtp.com header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=MiEmXExP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore-com.20210112.gappssmtp.com header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=MiEmXExP;
	dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYZKf4sglz3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 11:28:21 +1000 (AEST)
Received: by mail-oi1-x22f.google.com with SMTP id d64so11648262oia.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 18:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=s/6p8wN+VGvSrnwRHCNxYJbAlNC9MCYqHdn8E1KltBc=;
        b=MiEmXExP/Uly7GSmB4QzuSnXDeHlqxx2OYMWx1W1iLm6vljxXfeG/Z1YepMPzxT3Vr
         pjf3zh1pkkU+//zUrJhF4e4JGkNqdyppztz4T8wJ/uCNDG9n1+wm2AxbOTmrrnSjbib3
         iMJkLUI1e210eZUYsproVon8WIbSm9FDnQrMocQmAf+cwSoPvcJxl/EQW1gPOTO1a1v0
         uKM3uV4+5qY4zCW/+rO28NdwsOmv63e8AuEiKOD5G1dvIwDKIFKt7sQe31/J+fhjZf9J
         3P9O5j8Qmjl6gy2o2ER9gscgaXthVC4wjW5i2vSOkefhL6zf7xf6j0QhCmz9O5sjsKwf
         W2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=s/6p8wN+VGvSrnwRHCNxYJbAlNC9MCYqHdn8E1KltBc=;
        b=s+TWGz8j9lR+yks//bDoJ/poi+EUX268ZCRxVIJt2UfkC085lTnjF+Gj9dwtFoh0d4
         1lGdEXMT2bhoHT4gk1D6fXMBpu6PoNzKIaIH2KIkY6B3sg57GbXAR4Tmnjj8wvxaFUca
         GJRTwct8JOi4XTWsZt63PanH9c+jXevAxCNUt/tlBfXHWjqGlBOOeVf4HAUFz+1X9y6c
         Xz19kH/9tniO6P3CerJ/X3hQaanM1VTRIgGck5Uj911HfpmdRp/iSw5/mqkG/fX9choO
         5C0Y0Eh3qQ2edNnX549teJ8Y/a3mcpIN2yKTD1mNDIlUVMVF7kGXZRmxJSfMIZNxCJR7
         KWpQ==
X-Gm-Message-State: ACrzQf2avQLTYXJMSfH39/LPTElupPw5cnIroTI7BasC06sC+CuPLmbw
	TuWCscecpys8Rxo1ZhoXwHYX6+QLrBHqhz1/jEl0
X-Google-Smtp-Source: AMsMyM7Yf+KZZuONXI++p3mR8psQkZBWvo4g+9yZJfNGgyny4tIddm5WbnhMos4FwWrI0S/BZoFi1lqAinau9cVB2O0=
X-Received: by 2002:a05:6808:144b:b0:350:a06a:f8cb with SMTP id
 x11-20020a056808144b00b00350a06af8cbmr7833965oiv.51.1663896497881; Thu, 22
 Sep 2022 18:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220922193817.106041-1-nathanl@linux.ibm.com> <20220922193817.106041-3-nathanl@linux.ibm.com>
In-Reply-To: <20220922193817.106041-3-nathanl@linux.ibm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 22 Sep 2022 21:28:07 -0400
Message-ID: <CAHC9VhTWMFbCxQFAEJZzS3Kd5cSFigmvHac5y5ypVU7TqRqpTA@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/rtas: block error injection when locked down
To: Nathan Lynch <nathanl@linux.ibm.com>
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
Cc: ajd@linux.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, jmorris@namei.org, linux-security-module@vger.kernel.org, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, serge@hallyn.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 22, 2022 at 3:38 PM Nathan Lynch <nathanl@linux.ibm.com> wrote:
>
> The error injection facility on pseries VMs allows corruption of
> arbitrary guest memory, potentially enabling a sufficiently privileged
> user to disable lockdown or perform other modifications of the running
> kernel via the rtas syscall.
>
> Block the PAPR error injection facility from being opened or called
> when locked down.
>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/kernel/rtas.c | 25 ++++++++++++++++++++++++-
>  include/linux/security.h   |  1 +
>  security/security.c        |  1 +
>  3 files changed, 26 insertions(+), 1 deletion(-)

...

> diff --git a/include/linux/security.h b/include/linux/security.h
> index 1ca8dbacd3cc..b5d5138ae66a 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -123,6 +123,7 @@ enum lockdown_reason {
>         LOCKDOWN_BPF_WRITE_USER,
>         LOCKDOWN_DBG_WRITE_KERNEL,
>         LOCKDOWN_DEVICE_TREE,
> +       LOCKDOWN_RTAS_ERROR_INJECTION,

With the understanding that I've never heard of RTAS until now, are
there any other RTAS events that would require a lockdown reason?  As
a follow up, is it important to distinguish between different RTAS
lockdown reasons?

I'm trying to determine if we can just call it LOCKDOWN_RTAS.

>         LOCKDOWN_INTEGRITY_MAX,
>         LOCKDOWN_KCORE,
>         LOCKDOWN_KPROBES,
> diff --git a/security/security.c b/security/security.c
> index 2863fc31eec6..6518b239ada2 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -61,6 +61,7 @@ const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1] = {
>         [LOCKDOWN_BPF_WRITE_USER] = "use of bpf to write user RAM",
>         [LOCKDOWN_DBG_WRITE_KERNEL] = "use of kgdb/kdb to write kernel RAM",
>         [LOCKDOWN_DEVICE_TREE] = "modifying device tree contents",
> +       [LOCKDOWN_RTAS_ERROR_INJECTION] = "RTAS error injection",

See above.

>         [LOCKDOWN_INTEGRITY_MAX] = "integrity",
>         [LOCKDOWN_KCORE] = "/proc/kcore access",
>         [LOCKDOWN_KPROBES] = "use of kprobes",
> --
> 2.37.3

-- 
paul-moore.com
