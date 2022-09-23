Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D79925E7154
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 03:19:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYZ7G3ysVz3cd7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 11:19:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20210112.gappssmtp.com header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=slE4TJt9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=paul-moore.com (client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore-com.20210112.gappssmtp.com header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=slE4TJt9;
	dkim-atps=neutral
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYZ6f0zqNz3bbj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 11:18:48 +1000 (AEST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-12c8312131fso16391514fac.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 18:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=wauY9icRcEzEDbhLIuBAjc38+zIZU9tq0CBry9g6Ooc=;
        b=slE4TJt9/dXDYfy+rMRKeN5k8cMVUfrps+7LGvGQhlqHE6ERCjN/lfbKJ4KjF9nXeo
         6AJfMTUFZk/R3ITkRAB/Iu6XNtGdRXBPvSyxmSSN46t4/ltDu6V8cBEYShJL5X92F18m
         G47uf8YuxIn+QgNPctzUMP3X6nCwc3O2N7GYJfAX+lJn8dMhfM1Fs9wWxlcxmEFakRjg
         FhXSZXSyWPYguhFhFLJaTPt3Tkf8N/sWD6l6MqxIPratLG/PZSTYa5OdrMZZxjtYgoFG
         Yr38vg6UpQ7rqJipbno3wA0356WdNtTAe8GeHQaSCsCsZefmQgqMzuM5E1DiycXT6Um/
         qm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=wauY9icRcEzEDbhLIuBAjc38+zIZU9tq0CBry9g6Ooc=;
        b=18QfbLUxj7zmS9lh+J4AfYXRL1u4oD2mqodvWicz4qM97wZLv96HUUCQTdCtcLnzLj
         MQdfqh6u1+e9fMvA6gAvtpyMkg36Xr0lSt9t61WHTjifRqTOJKiRB4q4c/cuOFsi+UZK
         xov/tHhpcRB+XJL+/RkzwLIfskIZGOzGNkhDg0ReyH8En02gyyHe+G8JpP+CoWxSeSNn
         5n5w5BiwdS4Vs6lImCx87QQOXMs5ZT8iyzTQXzGlI5RObom7AX2peX+VC93fMte0x+LK
         X+amNJf5SvH5UVAi0SpFzuOZJjw1g4jzRHrpVRRvUtJuqA1OOz6NbKrmKPoooAcHB8PR
         t8UA==
X-Gm-Message-State: ACrzQf2cNJ9N8ztP7ZOgv5FgTjAjF/npQZpR5+tWn7kqr72ilOkKkf1N
	IdBMq2Z7EVA8EuKGXvJl75lTnLnUm9RbEnUV+XPrG8jpj0sj
X-Google-Smtp-Source: AMsMyM7nqnRFdhUa3AKhiMDrdqfkMkNMtS+CAPxM0mIQs/OrjYyKafG9iMOvWz5ktyQ7ZfkZNj8lp2r17TUOYM734bw=
X-Received: by 2002:a05:6870:600c:b0:12d:9e19:9860 with SMTP id
 t12-20020a056870600c00b0012d9e199860mr3740124oaa.172.1663895925469; Thu, 22
 Sep 2022 18:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220922193817.106041-1-nathanl@linux.ibm.com> <20220922193817.106041-2-nathanl@linux.ibm.com>
In-Reply-To: <20220922193817.106041-2-nathanl@linux.ibm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 22 Sep 2022 21:18:34 -0400
Message-ID: <CAHC9VhQG_jEh_H8pV-qJgX2oX_fyGjXoBV7_EJOgvOd4ndc+Xw@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc/pseries: block untrusted device tree changes
 when locked down
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

A couple of small nits below, but in general this seems reasonable.
However, as we are currently at -rc6 I would like us to wait to merge
this until after the upcoming merge window closes (I don't like
merging new functionality into -next at -rc6).

https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git/tree/README.md

> diff --git a/include/linux/security.h b/include/linux/security.h
> index 7bd0c490703d..1ca8dbacd3cc 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -122,6 +122,7 @@ enum lockdown_reason {
>         LOCKDOWN_XMON_WR,
>         LOCKDOWN_BPF_WRITE_USER,
>         LOCKDOWN_DBG_WRITE_KERNEL,
> +       LOCKDOWN_DEVICE_TREE,

I would suggest moving LOCKDOWN_DEVICE_TREE to be next to
LOCKDOWN_ACPI_TABLES.  It's not a hard requirement, but it seems like
a nice idea to group similar things when we can.

>         LOCKDOWN_INTEGRITY_MAX,
>         LOCKDOWN_KCORE,
>         LOCKDOWN_KPROBES,
> diff --git a/security/security.c b/security/security.c
> index 4b95de24bc8d..2863fc31eec6 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -60,6 +60,7 @@ const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1] = {
>         [LOCKDOWN_XMON_WR] = "xmon write access",
>         [LOCKDOWN_BPF_WRITE_USER] = "use of bpf to write user RAM",
>         [LOCKDOWN_DBG_WRITE_KERNEL] = "use of kgdb/kdb to write kernel RAM",
> +       [LOCKDOWN_DEVICE_TREE] = "modifying device tree contents",

Might as well move this one too.

>         [LOCKDOWN_INTEGRITY_MAX] = "integrity",
>         [LOCKDOWN_KCORE] = "/proc/kcore access",
>         [LOCKDOWN_KPROBES] = "use of kprobes",
> --
> 2.37.3

-- 
paul-moore.com
