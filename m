Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE86029673
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 12:55:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459NZ00nWTzDqX6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 20:55:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2607:f8b0:4864:20::141; helo=mail-it1-x141.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="Em430Lcw"; 
 dkim-atps=neutral
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459NXl0hjszDqDb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 20:54:14 +1000 (AEST)
Received: by mail-it1-x141.google.com with SMTP id m141so14988542ita.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 03:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CfQCPeLhxIRZNFUFprUfxjdraaUe3oFHAGmuDz7teoQ=;
 b=Em430Lcwry47jSvpo2CX3tGth2isfe0jStpDuxS7CMmLdA3d0PXEVPlYO1LA5R1mzt
 HY4rafqjGQJavFGnE3XaT/sGBtGX54ySCbaX7DVDZMmxBcy/N79r+hv4lU4j2oA3k9uH
 3qZj79cuHnNGNu2oYXdLcTSXDzUD2I8KQ+AfcVybt1p+pDbSSV/BxOdIjemHzveC4b7q
 duRReG8ScM5eer/3Afm7cUzTfGgmoE34PFQheJOvRIbKuqLqZGUfkiFLLL9ErcrO39tc
 F/9MwQeUr7EmYtaiFsYdYlVOLNriujpFjX0na3vmEkcAGEzSA9rJkFtPpvRuu71lHiOs
 lhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CfQCPeLhxIRZNFUFprUfxjdraaUe3oFHAGmuDz7teoQ=;
 b=SmRJrJbYB8S+8PyESZFPouhWyBC6Pqs/wtyL2CiSgGVCRiXlEkA+L7UCBqOjr6sCcH
 DB4QEMIODHr2zM+xr+CGjvf0zwaA0hHPGAGlryTaWoYj33J82+lPuhFmijFdtvUVBg5D
 bWqB7Mdz/K2nPbB/DOGxIPEgCKT7XlwClurTW1Bl3+58ibxnPzdEpDwDg+Zwq/ZLMZEX
 R2/vL4A1fLvXZXEb5j8F2WSB5Phtr7My50msPMmeG1Tc2u+j6WooINOjSLl7eEuS/o2U
 SDU5/+csnvw9Hkkinvz/RQGn0Tot+bwvGLiK+gPGvm8yYAQK9+0wfTsTqA2HazL+VV0A
 1CrA==
X-Gm-Message-State: APjAAAXfXuz2CuiPlHiEWNlYBiLRrQ3lyYtxHBvJVq0LfJZjdZAPPd9T
 xdb+z9JDNdeq01iyNbS8lBPwXLNy0vTfXQ==
X-Google-Smtp-Source: APXvYqzek4vSIIuFlylSllnN9c1fb45hmMMLlcQcM2y40ZIswZUPrKTiVfMzOtV1j/enrZtL4iFGng==
X-Received: by 2002:a24:4043:: with SMTP id n64mr17805822ita.25.1558695251429; 
 Fri, 24 May 2019 03:54:11 -0700 (PDT)
Received: from brauner.io ([172.56.12.37])
 by smtp.gmail.com with ESMTPSA id f14sm955704itb.31.2019.05.24.03.54.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 24 May 2019 03:54:10 -0700 (PDT)
Date: Fri, 24 May 2019 12:54:00 +0200
From: Christian Brauner <christian@brauner.io>
To: jannh@google.com, oleg@redhat.com, viro@zeniv.linux.org.uk,
 torvalds@linux-foundation.org, arnd@arndb.de
Subject: Re: [PATCH v3 1/2] pid: add pidfd_open()
Message-ID: <20190524105358.dfnelxhxodkvwbcn@brauner.io>
References: <20190520155630.21684-1-christian@brauner.io>
 <20190521143220.crb2zyvdov3fl4g7@brauner.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190521143220.crb2zyvdov3fl4g7@brauner.io>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, dhowells@redhat.com, joel@joelfernandes.org,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 elena.reshetova@intel.com, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, dancol@google.com, kernel-team@android.com,
 serge@hallyn.com, linux-xtensa@linux-xtensa.org, keescook@chromium.org,
 linux-m68k@lists.linux-m68k.org, luto@kernel.org, tglx@linutronix.de,
 surenb@google.com, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, cyphar@cyphar.com,
 luto@amacapital.net, ebiederm@xmission.com, linux-alpha@vger.kernel.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 21, 2019 at 04:32:20PM +0200, Christian Brauner wrote:
> On Mon, May 20, 2019 at 05:56:29PM +0200, Christian Brauner wrote:
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
> > caller can currently not create a pollable pidfd. This is a problem for
> > Android's low memory killer (LMK) and service managers such as systemd.
> > Both are examples of tools that want to make use of pidfds to get reliable
> > notification of process exit for non-parents (pidfd polling) and race-free
> > signal sending (pidfd_send_signal()). They intend to switch to this API for
> > process supervision/management as soon as possible. Having no way to get
> > pollable pidfds from PID-only processes is one of the biggest blockers for
> > them in adopting this api. With pidfd_open() making it possible to retrieve
> > pidfds for PID-based processes we enable them to adopt this api.
> > 
> > In line with Arnd's recent changes to consolidate syscall numbers across
> > architectures, I have added the pidfd_open() syscall to all architectures
> > at the same time.
> > 
> > Signed-off-by: Christian Brauner <christian@brauner.io>
> > Reviewed-by: Oleg Nesterov <oleg@redhat.com>
> 
> This now also carries a Reviewed-by from David.
> 
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > Cc: "Eric W. Biederman" <ebiederm@xmission.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Joel Fernandes (Google) <joel@joelfernandes.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Jann Horn <jannh@google.com>
> > Cc: David Howells <dhowells@redhat.com>
> > Cc: Andy Lutomirsky <luto@kernel.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Aleksa Sarai <cyphar@cyphar.com>
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Al Viro <viro@zeniv.linux.org.uk>
> > Cc: linux-api@vger.kernel.org
> 
> I've moved pidfd_open() into my for-next branch together with Joel's
> pidfd polling changes. Everything is based on v5.2-rc1.
> 
> The chosen syscall number for now is 434. David is going to send out
> another pile of mount api related syscalls. I'll coordinate with him
> accordingly prior to the 5.3 merge window.

After talking to Arnd, I split the syscall addition and the per-arch
wiring-up of pidfd_open() into two patches. There are no functional
changes and everything is still sitting in for-next.

Thanks!
Christian
