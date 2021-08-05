Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8733E1E46
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 00:02:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgjJh1bwXz3dCb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 08:02:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=Y9dxhU40;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20150623.gappssmtp.com
 header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Y9dxhU40; dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgjJF2qTzz2yNf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 08:02:04 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id y7so10457775eda.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Aug 2021 15:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c3urkHLQm5QwJdZ9O5/+QqeYs/qIDb1LdTwMX8UuIJo=;
 b=Y9dxhU40Cp8veCcp+fcPVCm4ifcChrN1zCWT6snRwiYjugw4bnQknql6Al6HruhkGh
 hRr2EK3dfowDwcLy/91ol0zhq75r4GYw/0FGGfHCvI9pwgM/NBpebJBtEgcpxjZPzh7X
 6Qb4mLJ2AkRFR7FJQcLLLzFC1VGLUVsRMVl3aLy6lBeo2Y7pxZfomIrU+VomHL3c87QG
 q3wIiaH3OeaFpPWo49uBcSya0/hSPyR98ZBBjPRupyhM1wN8h8eCnG23kWHKYe5oxTOx
 ekDzNhD/GOj4/cx6e4T7C6fCiv+h+myJcrv4/jTtK0HBwN5TieASVgvaRp9YnmbuiQXC
 4KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c3urkHLQm5QwJdZ9O5/+QqeYs/qIDb1LdTwMX8UuIJo=;
 b=a3EktE3TMjPXJ/jjnITNUzp47I+e3hdRPydksVezmy7vOcl3WrY1s/cucc5FmMzE++
 eEC2OSUEvNA/NLqMtEmHN+HLAhVZiuCMAoez37phwhS+Y3jEIlDElloY3KDGDhxPp/PE
 51PoXC9O/gPLfcF7z2+koF+JeLYRkittYf+E3kW/bM3z6FNde5OwulSyOItuJk2ys6U+
 ROJJtVxVHnUnSSV3x25fi3asbe4OmJyze9jpCAVB+XDxi6qXLqqSaddu20JaYvhMkAaV
 bhVw+ATUJ0x3TlJbXs5hEt89hpl9lAvVPVU/aMBdCk6JkY1x9DGZ63hHeEcyGZ22pZEk
 EMBw==
X-Gm-Message-State: AOAM530umlAeqBBqU3n7LQ0yeSANcRmOiKeuv0WoSFfWd+eS4IsUnxHq
 jEtjNWAZOQhKlGP3jVERHX9O0lvviOMnGsRYN60C
X-Google-Smtp-Source: ABdhPJyUIiWYAz6aUFc6MPvieEo2GUkchlv7WYU/OChfOMJj/dkrDY3GEEK87ConDlVxbwRyeX2EW3ZWABWXQS8VcSk=
X-Received: by 2002:a05:6402:b83:: with SMTP id
 cf3mr9240826edb.12.1628200918472; 
 Thu, 05 Aug 2021 15:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621363275.git.rgb@redhat.com>
 <2300b1083a32aade7ae7efb95826e8f3f260b1df.1621363275.git.rgb@redhat.com>
In-Reply-To: <2300b1083a32aade7ae7efb95826e8f3f260b1df.1621363275.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Aug 2021 18:01:47 -0400
Message-ID: <CAHC9VhRDYYOpUvCkcWw=2a_P0AJxtA5N5y_Kj5PAG-0BQ02COQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] audit: replace magic audit syscall class numbers
 with macros
To: Richard Guy Briggs <rgb@redhat.com>
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
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, x86@kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Eric Paris <eparis@redhat.com>,
 sparclinux@vger.kernel.org, Aleksa Sarai <cyphar@cyphar.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>,
 Steve Grubb <sgrubb@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 19, 2021 at 4:01 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Replace audit syscall class magic numbers with macros.
>
> This required putting the macros into new header file
> include/linux/auditsc_classmacros.h since the syscall macros were
> included for both 64 bit and 32 bit in any compat code, causing
> redefinition warnings.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> Link: https://lore.kernel.org/r/2300b1083a32aade7ae7efb95826e8f3f260b1df.1621363275.git.rgb@redhat.com
> ---
>  MAINTAINERS                         |  1 +
>  arch/alpha/kernel/audit.c           |  8 ++++----
>  arch/ia64/kernel/audit.c            |  8 ++++----
>  arch/parisc/kernel/audit.c          |  8 ++++----
>  arch/parisc/kernel/compat_audit.c   |  9 +++++----
>  arch/powerpc/kernel/audit.c         | 10 +++++-----
>  arch/powerpc/kernel/compat_audit.c  | 11 ++++++-----
>  arch/s390/kernel/audit.c            | 10 +++++-----
>  arch/s390/kernel/compat_audit.c     | 11 ++++++-----
>  arch/sparc/kernel/audit.c           | 10 +++++-----
>  arch/sparc/kernel/compat_audit.c    | 11 ++++++-----
>  arch/x86/ia32/audit.c               | 11 ++++++-----
>  arch/x86/kernel/audit_64.c          |  8 ++++----
>  include/linux/audit.h               |  1 +
>  include/linux/auditsc_classmacros.h | 23 +++++++++++++++++++++++
>  kernel/auditsc.c                    | 12 ++++++------
>  lib/audit.c                         | 10 +++++-----
>  lib/compat_audit.c                  | 11 ++++++-----
>  18 files changed, 102 insertions(+), 71 deletions(-)
>  create mode 100644 include/linux/auditsc_classmacros.h

...

> diff --git a/include/linux/auditsc_classmacros.h b/include/linux/auditsc_classmacros.h
> new file mode 100644
> index 000000000000..18757d270961
> --- /dev/null
> +++ b/include/linux/auditsc_classmacros.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* auditsc_classmacros.h -- Auditing support syscall macros
> + *
> + * Copyright 2021 Red Hat Inc., Durham, North Carolina.
> + * All Rights Reserved.
> + *
> + * Author: Richard Guy Briggs <rgb@redhat.com>
> + */
> +#ifndef _LINUX_AUDITSCM_H_
> +#define _LINUX_AUDITSCM_H_
> +
> +enum auditsc_class_t {
> +       AUDITSC_NATIVE = 0,
> +       AUDITSC_COMPAT,
> +       AUDITSC_OPEN,
> +       AUDITSC_OPENAT,
> +       AUDITSC_SOCKETCALL,
> +       AUDITSC_EXECVE,
> +
> +       AUDITSC_NVALS /* count */
> +};
> +
> +#endif

My apologies Richard, for some reason I had it in my mind that this
series was waiting on you to answer a question and/or respin; however,
now that I'm clearing my patch queues looking for any stragglers I see
that isn't the case.  Looking over the patchset I think it looks okay
to me, my only concern is that "auditsc_classmacros.h" is an awfully
specific header file name and could prove to be annoying if we want to
add to it in the future.  What do you think about something like
"audit_arch.h" instead?

If that change is okay with you I can go ahead and do the rename while
I'm merging the patches, I'll consider it penance for letting this
patchset sit for so long :/

-- 
paul moore
www.paul-moore.com
