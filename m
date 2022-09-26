Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F8C5EB4AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 00:40:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbyQR44Dmz3c8Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 08:40:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20210112.gappssmtp.com header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=7+CFRdW0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=paul-moore.com (client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com; envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore-com.20210112.gappssmtp.com header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=7+CFRdW0;
	dkim-atps=neutral
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbyPp05hbz2xsD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 08:40:12 +1000 (AEST)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-13122bfaea6so6102949fac.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=4KiOCtK+FPFBaBSD234AcIQn4ASKrCbdEIcGR0w5qNk=;
        b=7+CFRdW0czdFMr1fo9cqKgwdxvrbCUgUi7NgTJtgJQ3kn42uE8kl6ujsx/zLde2e27
         T+ZOnm2/q3O/3H/OVE9eJGRXyUXjuBdxpYKtJLFjG/LrO+OesomoiF2jfjAw2Algu83k
         Uh/WPeXaXa26ZafAV+73r8GzNQaMcLnAsBKdhXzSNvSHNDin8kJufynJ4zRompBBsn6k
         HKNSoQoX+zfprEEdRC9e4yOGnbULJVD9jX2bSIOXTiU/S7i3CYEiMCtp20c69am4sxIV
         trxEzqWF7S14zPqZwGBLxKhoUDbzRq4LqMx0VlPHXSwjodF5VvtQ7jN4w/9JNvvORLTo
         sJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=4KiOCtK+FPFBaBSD234AcIQn4ASKrCbdEIcGR0w5qNk=;
        b=hG+BsCPtJvcJYEhdHtVRzuX1E1XLfRbuKzfv0fkcwKyxEfCxNIMbxnKUlvF+3i/90t
         epDSRSPahpDKd2pqRTRKazCRrqiC8+uWfwg99Ddmg2t+z8/Hpphs/PBHKtOSwS61Jd00
         p5fWqPSyrM/dUKjwxgWUUWhWD2kOFKhy66OacrgT8fceRb0D30XRA7NLNWvztDJUtVNh
         Sw5pMST9LzGt8Kx6AYxZBIDBY7ztjtU5vgCKq9PuhDcfvfcCoLOOUUWXLLP0hyr8qvyZ
         ZCydZJoUujxOTilXm992UJAlVzlaRHVHNSDe21+QFjjSiW06QTPvMOe7ELzPyzkoYbwa
         Gg2Q==
X-Gm-Message-State: ACrzQf2lq23KyRp5WaOWLlp/Zk15jB3Kdcy09noeyP16B7sQQv3awkQN
	cXANFO/RU5d9J9jonr+IiQXdYRk6jAEiDlNcQTMB
X-Google-Smtp-Source: AMsMyM5Ll9Hz28q5EJA3C/EjbWd7oQiroSVNZyLN57TX2DOCveozh6b12WXc6/n86trpkP0syEDwGLAINQe6ZtKirUg=
X-Received: by 2002:a05:6870:15c9:b0:101:e18b:d12d with SMTP id
 k9-20020a05687015c900b00101e18bd12dmr552208oad.51.1664232008652; Mon, 26 Sep
 2022 15:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220926131643.146502-1-nathanl@linux.ibm.com> <20220926131643.146502-2-nathanl@linux.ibm.com>
In-Reply-To: <20220926131643.146502-2-nathanl@linux.ibm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 26 Sep 2022 18:39:57 -0400
Message-ID: <CAHC9VhQwypiLEwdiktaycyeMiArajgDd7YNiOoZ-XFaMx72Qqw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] powerpc/pseries: block untrusted device tree
 changes when locked down
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

On Mon, Sep 26, 2022 at 9:17 AM Nathan Lynch <nathanl@linux.ibm.com> wrote:
>
> The /proc/powerpc/ofdt interface allows the root user to freely alter
> the in-kernel device tree, enabling arbitrary physical address writes
> via drivers that could bind to malicious device nodes, thus making it
> possible to disable lockdown.
>
> Historically this interface has been used on the pseries platform to
> facilitate the runtime addition and removal of processor, memory, and
> device resources (aka Dynamic Logical Partitioning or DLPAR). Years
> ago, the processor and memory use cases were migrated to designs that
> happen to be lockdown-friendly: device tree updates are communicated
> directly to the kernel from firmware without passing through untrusted
> user space. I/O device DLPAR via the "drmgr" command in powerpc-utils
> remains the sole legitimate user of /proc/powerpc/ofdt, but it is
> already broken in lockdown since it uses /dev/mem to allocate argument
> buffers for the rtas syscall. So only illegitimate uses of the
> interface should see a behavior change when running on a locked down
> kernel.
>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/reconfig.c | 5 +++++
>  include/linux/security.h                  | 1 +
>  security/security.c                       | 1 +
>  3 files changed, 7 insertions(+)

Thanks for moving the definitions.

Acked-by: Paul Moore <paul@paul-moore.com> (LSM)

> diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/platforms/pseries/reconfig.c
> index cad7a0c93117..599bd2c78514 100644
> --- a/arch/powerpc/platforms/pseries/reconfig.c
> +++ b/arch/powerpc/platforms/pseries/reconfig.c
> @@ -10,6 +10,7 @@
>  #include <linux/kernel.h>
>  #include <linux/notifier.h>
>  #include <linux/proc_fs.h>
> +#include <linux/security.h>
>  #include <linux/slab.h>
>  #include <linux/of.h>
>
> @@ -361,6 +362,10 @@ static ssize_t ofdt_write(struct file *file, const char __user *buf, size_t coun
>         char *kbuf;
>         char *tmp;
>
> +       rv = security_locked_down(LOCKDOWN_DEVICE_TREE);
> +       if (rv)
> +               return rv;
> +
>         kbuf = memdup_user_nul(buf, count);
>         if (IS_ERR(kbuf))
>                 return PTR_ERR(kbuf);
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 7bd0c490703d..39e7c0e403d9 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -114,6 +114,7 @@ enum lockdown_reason {
>         LOCKDOWN_IOPORT,
>         LOCKDOWN_MSR,
>         LOCKDOWN_ACPI_TABLES,
> +       LOCKDOWN_DEVICE_TREE,
>         LOCKDOWN_PCMCIA_CIS,
>         LOCKDOWN_TIOCSSERIAL,
>         LOCKDOWN_MODULE_PARAMETERS,
> diff --git a/security/security.c b/security/security.c
> index 4b95de24bc8d..51bf66d4f472 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -52,6 +52,7 @@ const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1] = {
>         [LOCKDOWN_IOPORT] = "raw io port access",
>         [LOCKDOWN_MSR] = "raw MSR access",
>         [LOCKDOWN_ACPI_TABLES] = "modifying ACPI tables",
> +       [LOCKDOWN_DEVICE_TREE] = "modifying device tree contents",
>         [LOCKDOWN_PCMCIA_CIS] = "direct PCMCIA CIS storage",
>         [LOCKDOWN_TIOCSSERIAL] = "reconfiguration of serial port IO",
>         [LOCKDOWN_MODULE_PARAMETERS] = "unsafe module parameters",
> --
> 2.37.3
>


-- 
paul-moore.com
