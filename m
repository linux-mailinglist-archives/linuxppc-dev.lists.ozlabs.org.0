Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8441938F610
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 01:04:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fpt8Q41qHz30BG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 09:04:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=QQB024vh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20150623.gappssmtp.com
 header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=QQB024vh; dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fpt7w2wxKz2yYc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 09:04:26 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id gb17so26219264ejc.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 16:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uHnwU/8zVxK9/bfw4gLk9ClQH8SbH6WwTZFdoRwbAtE=;
 b=QQB024vhpmn4hq25e6Gkh0zhdrnh3KHdtxH6hg6RDKH7CnpR3mYJd6drz35kPPn+vq
 h6264Me+UgyGvlpwu30FVPeTMz+AEc12Q0M+XUT2JohzSMatCOapVMLXEXEiejzFf7ti
 ktfb2nZNhIlo275VOb2O2BOnbc3ySbclEou9yYwi6+PYR4gUlNFMkKIpexQj+R7biYK9
 xXDP+mzIofYbIEFKZVe3ZXLMSxK2QP8MWFHo5cfoJS3ZJay5Rqyq5UdBp1+zLKULS08J
 lwUq6hGqLZp80Ar+2xFbnq6NvtyQI7K0uQTTZPi/naCAAye6mC44N7eH6EQPj41saYzr
 cNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uHnwU/8zVxK9/bfw4gLk9ClQH8SbH6WwTZFdoRwbAtE=;
 b=M1z4OakADSJBLq44GgkQpwYH1HVCr7d/6T7kCVrs7UQ57ji3o1IsdPn6XWKi8rE+tS
 psm8oxxHPwlVgjIBUma02rfUuLgO//QMXiiuvXNItVjKeYvk5cwNex2HFojL2vrD/IsX
 dLqZGes3hpwiY/JbgVui3wr7uBCA9uMC25GhxqEcW+QRNLHB2bWMMAoEyxF8uUtAnISf
 C6/tp0Ox3dThM3CSey5RlwQWuPnBCrxoA3ve3JV3smfzAkXnb7YGsqNTFwUglzrINtcF
 NsUiBt1/2MlcJssWb8iwtYvr1J5lg0txHAz1NrDXeDgr74T2FWua9ykPj6PgPHlD3IlA
 RwGg==
X-Gm-Message-State: AOAM531QdQthexdG7psZIqc7gSsrpjyOWO43azx8x17sQOQh1SEXwLT+
 860zHSOTAE8tMuPBX83OUXiVI8kWKRjpKZBPvvJs
X-Google-Smtp-Source: ABdhPJzHdwSaxqdMgKRFDcoSWE+vBddUp/NzMoTBPda3nQNAVt0QAUQEdTUit8AXk9QB29Wy0DPtdDjKh5nmDnbZhoc=
X-Received: by 2002:a17:907:10d8:: with SMTP id
 rv24mr25356059ejb.542.1621897458726; 
 Mon, 24 May 2021 16:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621363275.git.rgb@redhat.com>
 <f5f1a4d8699613f8c02ce762807228c841c2e26f.1621363275.git.rgb@redhat.com>
 <20210520075842.vnbwbw6yffkybk6z@wittgenstein>
In-Reply-To: <20210520075842.vnbwbw6yffkybk6z@wittgenstein>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 24 May 2021 19:04:07 -0400
Message-ID: <CAHC9VhTyAFou=_Xu7ZSZSY+19Yii=hQ1NW1LPisk49Ot9wg7rg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] audit: add support for the openat2 syscall
To: Christian Brauner <christian.brauner@ubuntu.com>
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
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 Richard Guy Briggs <rgb@redhat.com>, x86@kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Eric Paris <eparis@redhat.com>,
 sparclinux@vger.kernel.org, Aleksa Sarai <cyphar@cyphar.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>,
 Steve Grubb <sgrubb@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 3:58 AM Christian Brauner
<christian.brauner@ubuntu.com> wrote:
> On Wed, May 19, 2021 at 04:00:21PM -0400, Richard Guy Briggs wrote:
> > The openat2(2) syscall was added in kernel v5.6 with commit fddb5d430ad9
> > ("open: introduce openat2(2) syscall")
> >
> > Add the openat2(2) syscall to the audit syscall classifier.
> >
> > Link: https://github.com/linux-audit/audit-kernel/issues/67
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > Link: https://lore.kernel.org/r/f5f1a4d8699613f8c02ce762807228c841c2e26f.1621363275.git.rgb@redhat.com
> > ---
> >  arch/alpha/kernel/audit.c           | 2 ++
> >  arch/ia64/kernel/audit.c            | 2 ++
> >  arch/parisc/kernel/audit.c          | 2 ++
> >  arch/parisc/kernel/compat_audit.c   | 2 ++
> >  arch/powerpc/kernel/audit.c         | 2 ++
> >  arch/powerpc/kernel/compat_audit.c  | 2 ++
> >  arch/s390/kernel/audit.c            | 2 ++
> >  arch/s390/kernel/compat_audit.c     | 2 ++
> >  arch/sparc/kernel/audit.c           | 2 ++
> >  arch/sparc/kernel/compat_audit.c    | 2 ++
> >  arch/x86/ia32/audit.c               | 2 ++
> >  arch/x86/kernel/audit_64.c          | 2 ++
> >  include/linux/auditsc_classmacros.h | 1 +
> >  kernel/auditsc.c                    | 3 +++
> >  lib/audit.c                         | 4 ++++
> >  lib/compat_audit.c                  | 4 ++++
> >  16 files changed, 36 insertions(+)

...

> > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > index d775ea16505b..3f59ab209dfd 100644
> > --- a/kernel/auditsc.c
> > +++ b/kernel/auditsc.c
> > @@ -76,6 +76,7 @@
> >  #include <linux/fsnotify_backend.h>
> >  #include <uapi/linux/limits.h>
> >  #include <uapi/linux/netfilter/nf_tables.h>
> > +#include <uapi/linux/openat2.h>
> >
> >  #include "audit.h"
> >
> > @@ -196,6 +197,8 @@ static int audit_match_perm(struct audit_context *ctx, int mask)
> >               return ((mask & AUDIT_PERM_WRITE) && ctx->argv[0] == SYS_BIND);
> >       case AUDITSC_EXECVE:
> >               return mask & AUDIT_PERM_EXEC;
> > +     case AUDITSC_OPENAT2:
> > +             return mask & ACC_MODE((u32)((struct open_how *)ctx->argv[2])->flags);
>
> That's a lot of dereferncing, casting and masking all at once. Maybe a
> small static inline helper would be good for the sake of legibility? Sm
> like:
>
> static inline u32 audit_openat2_acc(struct open_how *how, int mask)
> {
>         u32 flags = how->flags;
>         return mask & ACC_MODE(flags);
> }
>
> but not sure. Just seems more legible to me.
> Otherwise.

I'm on the fence about this.  I understand Christian's concern, but I
have a bit of hatred towards single caller functions like this.  Since
this function isn't really high-touch, and I don't expect that to
change in the near future, let's leave the casting mess as-is.

-- 
paul moore
www.paul-moore.com
