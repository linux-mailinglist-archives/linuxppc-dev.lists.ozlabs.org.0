Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BE23948F9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 May 2021 00:53:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FsKjF5NHhz3002
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 May 2021 08:53:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=yuNgeXWN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20150623.gappssmtp.com
 header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=yuNgeXWN; dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FsKhl2Gmvz2yQy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 May 2021 08:52:53 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id e12so7598907ejt.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 15:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hYw5L9uovAkFsfHnHeXQzSMU5L4IRTMjhY6/K5rzT9U=;
 b=yuNgeXWN+6xWyHkZN3hopiuhLwOwLkMW4jfx/Ke9qnP+4D2F8F70wSggXfODvDfJTi
 ILz10rk+8ClZi8HbQdGtQbcSvgtB1sGOONGOZStOBth62K6Hz5gg9CX1vrt+j4VA5tlX
 Ix+Nfa7RDnmnOhfUmMbJi+8cg+u3ye37cM6IYBcAIMHhRDDaEBkVCskOi0kOs7gnKSdI
 mXKdCDDvyo3dLsxWV8KBORTR/cOBJBOknrc9qVd3Bzm0TtTxq1bM5m5gMw8Uhs9lgJXG
 aX1MQzG+pMBsWwu0lszw5ECGLix/RDqMzdlR8Bx+v92dGBI1vhRO3aOIv5eom6bntiJ4
 /j8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hYw5L9uovAkFsfHnHeXQzSMU5L4IRTMjhY6/K5rzT9U=;
 b=rXgbHmMDBBkVOBIG6IrFVak7pDsD8Qv9vpaEKjOsp+v/aV0TfAJeXUU02OCkFE5Y/e
 Afya3T7AbPRhkUKktOb4gkoi/zhvl4fbJHUPRMVw8Je6ux7ywY8AEpfzrx/GwxzLwIQs
 DfYDchdvn2z1weT8yNLM8wSuGmJ4ynROyWU/eGJerA0rkIcVThUbsxzqZAGyO4OLNR28
 d8hZX8sticidxt9wbQ8brXqk+IknDX+ZhzWBs6kw6Is1xCBXEoh9LwiNMwOKAGR287PW
 5XUX1H31BAD7MwE9+B3r3U4NwWugSQt6uN1zZS9Z7MQreECOR0+xrlMk7IV2u9GwfQbo
 /okw==
X-Gm-Message-State: AOAM5338tN1rPy4fN0NxnWZZXCKUmZFHkYw3PDs/WYQ3ZiAZusTs+Z5Y
 7FI3uc2KPnHinCdPSELg7IpfyT364+wF6Kcr28tr
X-Google-Smtp-Source: ABdhPJyM59D/3ndTZ2tM5xKxQiqHabnQvuoHlfDxd+J5YttV0ukxr9SsE/gZ/BunSIgaPf5x9SH6g251CYE//WbdFbc=
X-Received: by 2002:a17:906:4111:: with SMTP id
 j17mr1665351ejk.488.1622242365987; 
 Fri, 28 May 2021 15:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210517092006.803332-1-omosnace@redhat.com>
 <CAHC9VhTasra0tU=bKwVqAwLRYaC+hYakirRz0Mn5jbVMuDkwrA@mail.gmail.com>
 <01135120-8bf7-df2e-cff0-1d73f1f841c3@iogearbox.net>
 <CAHC9VhR-kYmMA8gsqkiL5=poN9FoL-uCyx1YOLCoG2hRiUBYug@mail.gmail.com>
 <c7c2d7e1-e253-dce0-d35c-392192e4926e@iogearbox.net>
In-Reply-To: <c7c2d7e1-e253-dce0-d35c-392192e4926e@iogearbox.net>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 28 May 2021 18:52:34 -0400
Message-ID: <CAHC9VhRkz48MLv_QNfnRWFPvFxEV7oJH5eNHGUtvWdjG4M1YFA@mail.gmail.com>
Subject: Re: [PATCH v2] lockdown,selinux: avoid bogus SELinux lockdown
 permission checks
To: Daniel Borkmann <daniel@iogearbox.net>
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
Cc: jolsa@redhat.com, selinux@vger.kernel.org, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 James Morris <jmorris@namei.org>, Casey Schaufler <casey@schaufler-ca.com>,
 linux-security-module@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 28, 2021 at 2:28 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
> On 5/28/21 5:47 PM, Paul Moore wrote:
> > Let's reset.
>
> Sure, yep, lets shortly take one step back. :)
>
> > What task_struct is running the BPF tracing program which is calling
> > into security_locked_down()?  My current feeling is that it is this
> > context/domain/cred that should be used for the access control check;
> > in the cases where it is a kernel thread, I think passing NULL is
> > reasonable, but I think the proper thing for SELinux is to interpret
> > NULL as kernel_t.
>
> If this was a typical LSM hook and, say, your app calls into bind(2) where
> we then invoke security_socket_bind() and check 'current' task, then I'm all
> with you, because this was _explicitly initiated_ by the httpd app, so that
> allow/deny policy belongs in the context of httpd.
>
> In the case of tracing, it's different. You install small programs that are
> triggered when certain events fire. Random example from bpftrace's README [0],
> you want to generate a histogram of syscall counts by program. One-liner is:
>
>    bpftrace -e 'tracepoint:raw_syscalls:sys_enter { @[comm] = count(); }'
>
> bpftrace then goes and generates a BPF prog from this internally. One way of
> doing it could be to call bpf_get_current_task() helper and then access
> current->comm via one of bpf_probe_read_kernel{,_str}() helpers. So the
> program itself has nothing to do with httpd or any other random app doing
> a syscall here. The BPF prog _explicitly initiated_ the lockdown check.
> The allow/deny policy belongs in the context of bpftrace: meaning, you want
> to grant bpftrace access to use these helpers, but other tracers on the
> systems like my_random_tracer not. While this works for prior mentioned
> cases of security_locked_down() with open_kcore() for /proc/kcore access
> or the module_sig_check(), it is broken for tracing as-is, and the patch
> I sent earlier fixes this.

Sigh.

Generally it's helpful when someone asks a question if you answer it
directly before going off and answering your own questions.  Listen, I
get it, you wrote a patch and it fixes your problem (you've mentioned
that already) and it's wonderful and all that, but the rest of us
(maybe just me) need to sort this out too and talking past questions
isn't a great way to help us get there (once again, maybe just me).  I
think I can infer an answer from you, but you've made me grumpy now so
I'm not ACK'ing or NACK'ing anything right now; I clearly need to go
spend some time reading through BPF code.  Woo.

>    [0] https://github.com/iovisor/bpftrace

-- 
paul moore
www.paul-moore.com
