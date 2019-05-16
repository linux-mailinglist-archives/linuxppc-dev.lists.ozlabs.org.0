Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6378B20AA5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 17:06:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454ZWM5NT8zDqB0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 01:06:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="OIHOP7ru"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454ZLB2m2vzDqdL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 00:58:26 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id p26so5743221edr.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 07:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xCVxcbycKijjP8G1i7Lu3aOPyQvDa5anPQzLbernNO4=;
 b=OIHOP7rucDEqRTu8tvry5PPcTvGug7bBvZ3Sj3gEtUFrGnhyINnCk+I0zkqsLasUKZ
 sDF9yMxrNz3GSuRfHnJ98dcv59fxALK1XZT/DdKM+RNStSEbUml+piQP0fMEz2cT77wZ
 5fUSex8dhyXEU6EezdQo3iMv+/oWdqQP14elkHUkCpZkBvTW8oAW6AfrrmA20E9iIhVk
 ZuAZmTbyIfWt5UMPyKY2uhM8QgCzF5SK4PrtHd7sRoTp6ulgh75hv6U20VbOqq0i/gZ+
 98BZhaBZoAMvoCxu8vxG/vqn+9IOpy6tDLSn4KBXR2pI1aOzSqOO7bUDxsGPIuc1Dou9
 GnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xCVxcbycKijjP8G1i7Lu3aOPyQvDa5anPQzLbernNO4=;
 b=YiROe8JxbxiAo6Nu61qPyDaCrya0VdZ/8tSspH4bMlmJvAMj9wTP7tQCe8gA/s9/A4
 Q5cdjeXUcNLUuJDPUl67tL18jTrPXc4rradFwzIIDUDEiAlMIrI4DrRfgV9fbZRGfc6O
 lSjr5uGWqDJwp/XRc0a35v8N4YjEXmyvzs6hb8lkLqaqYrk5VP22EALacQ5bwhc+++aO
 bBwFej+mimxgtcirn3DLbUdU9gxBTWT9gmKAIWaBD3CNvcvoU7n+OFXRSMoxoRR0HQeQ
 4ooy/5MlMWQHKB1BeCrWJizuyofCSvH5yugnvAyaI6H3tOsh3Jz2FXHV4uIGIESdwzuC
 rejw==
X-Gm-Message-State: APjAAAVi+NG+qwDMyDeA5QE+jYmYR/jGaHxJNPydU0OgA1sh3NBSNteb
 uDlHe3JKLp+jhUd5lYRyxDzQYA==
X-Google-Smtp-Source: APXvYqxgJ+X2Q+jweK2Am0efdrd0ewPSsOh9NTyeRf7XaOyCGLt/MTu5duHXcow8oFtMna8nvrnWUQ==
X-Received: by 2002:a17:906:c391:: with SMTP id
 t17mr28473151ejz.242.1558018702012; 
 Thu, 16 May 2019 07:58:22 -0700 (PDT)
Received: from brauner.io ([193.96.224.243])
 by smtp.gmail.com with ESMTPSA id s15sm1924877edm.6.2019.05.16.07.58.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 16 May 2019 07:58:21 -0700 (PDT)
Date: Thu, 16 May 2019 16:58:19 +0200
From: Christian Brauner <christian@brauner.io>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 1/2] pid: add pidfd_open()
Message-ID: <20190516145819.ofqkv6ozfpumhhuk@brauner.io>
References: <20190516135944.7205-1-christian@brauner.io>
 <CAMuHMdVbUJ0+28Lc2wHPah8UUk8Ou9m81KzLvhrcMsJzz2bX2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVbUJ0+28Lc2wHPah8UUk8Ou9m81KzLvhrcMsJzz2bX2A@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 David Howells <dhowells@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, elena.reshetova@intel.com,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Daniel Colascione <dancol@google.com>,
 linux-mips@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>, cyphar@cyphar.com,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 16, 2019 at 04:56:08PM +0200, Geert Uytterhoeven wrote:
> Hi Christian, David,
> 
> On Thu, May 16, 2019 at 4:00 PM Christian Brauner <christian@brauner.io> wrote:
> > This adds the pidfd_open() syscall. It allows a caller to retrieve pollable
> > pidfds for a process which did not get created via CLONE_PIDFD, i.e. for a
> > process that is created via traditional fork()/clone() calls that is only
> > referenced by a PID:
> >
> > int pidfd = pidfd_open(1234, 0);
> > ret = pidfd_send_signal(pidfd, SIGSTOP, NULL, 0);
> >
> > With the introduction of pidfds through CLONE_PIDFD it is possible to
> > created pidfds at process creation time.
> > However, a lot of processes get created with traditional PID-based calls
> > such as fork() or clone() (without CLONE_PIDFD). For these processes a
> > caller can currently not create a pollable pidfd. This is a huge problem
> > for Android's low memory killer (LMK) and service managers such as systemd.
> > Both are examples of tools that want to make use of pidfds to get reliable
> > notification of process exit for non-parents (pidfd polling) and race-free
> > signal sending (pidfd_send_signal()). They intend to switch to this API for
> > process supervision/management as soon as possible. Having no way to get
> > pollable pidfds from PID-only processes is one of the biggest blockers for
> > them in adopting this api. With pidfd_open() making it possible to retrieve
> > pidfd for PID-based processes we enable them to adopt this api.
> >
> > In line with Arnd's recent changes to consolidate syscall numbers across
> > architectures, I have added the pidfd_open() syscall to all architectures
> > at the same time.
> 
> > +428    common  pidfd_open                      sys_pidfd_open
> 
> This number conflicts with "[PATCH 4/4] uapi: Wire up the mount API
> syscalls on non-x86 arches", which is requested to be included before
> rc1.

Yep, already spotted this thanks to Arnd! Will change the syscall
numbers.

Thanks!
Christian

> 
> Note that none of this is part of linux-next.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
