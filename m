Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0AE394DC6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 May 2021 20:49:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FsrFK414fz309g
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 May 2021 04:49:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=egZtDVPv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20150623.gappssmtp.com
 header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=egZtDVPv; dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FsrDm41gbz2yRy
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 May 2021 04:48:54 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id t3so8620618edc.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 May 2021 11:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PxkN5674Gdo7C/DvFwdmRlPrHnz0qD2VW7zEeao9HA0=;
 b=egZtDVPv+pEmzpQcYmGqbrNNZyRf7Aqgebz64H8qjXLqaTKcUwlR3bcfeOXQVoQ0/I
 7zwI+0FvRjoKaxZUkV7/qMK527UOii8JwIHXsmWt3289bVTzi9jLS7DrylJywuRK85RH
 XBY1R3AHPL69XeC7SFpUqb6jYFOv1/r8nNtp8fKORkkIuxQaK7l7pwk6KrKXFhlZQCGE
 EcOZJePRxsnnGa9NxCm+Hg9bBxdVgKUxA06srzViIJ8xJs6i38G7NVkfnqvzrPg5uWam
 tPUgQZGd1V/osaT50MNDtOL3E3SbY3nnfIen9INxBSbFY2ZNJ5UWnlfEyLDqOf4fSzeX
 BIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PxkN5674Gdo7C/DvFwdmRlPrHnz0qD2VW7zEeao9HA0=;
 b=ag1e415KX9sqnVfIorTIkdb8vDo2ulXfEBxAhrEvUlH6F+PJ0zRIAneQ9Er4xDKuOd
 sDWoBYwvtvrJCahpvMWoBXEL8C/uv64MBvhgP99/kUbHUSRbTM3Psm75EjRiJqMzHj21
 mmEwkMBKfxTGiW6y4ej8XJo6i+bfPnIVRUk87g1eNaRaveDbZYLCMvbX8DqPBQqbxPSS
 0bTgiLKKZFDy1WQg8mHPIkCDGfGQzLVt11+2IqkTZszV6/k25oPyCxFuqTemHHEyiTQz
 At+8UQdRnxeY5/WTNUFdfElcjIVy3g6vOuRQ4eYlVd6LpPFYxyTVlHWGcEGRwgX8XA9m
 PB6A==
X-Gm-Message-State: AOAM531MUKx2nNPUNp93sTBYCCj+AwLiLJI+x6ZeBv8o7ly3NIl0L4zH
 3oZB8GTsSO61jtX/GUpJatCS2uapOIdFyKc9chcI
X-Google-Smtp-Source: ABdhPJyUKpixSoshzQJyPJqEx0bgxxFA8s58ydUH/2LXx1S03FTwjdX+rXFI9WK5gl/+d4oHpjX3EfrlNm+PVmnhJgQ=
X-Received: by 2002:a05:6402:430b:: with SMTP id
 m11mr16690557edc.31.1622314124071; 
 Sat, 29 May 2021 11:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210517092006.803332-1-omosnace@redhat.com>
 <CAHC9VhTasra0tU=bKwVqAwLRYaC+hYakirRz0Mn5jbVMuDkwrA@mail.gmail.com>
 <01135120-8bf7-df2e-cff0-1d73f1f841c3@iogearbox.net>
 <CAHC9VhR-kYmMA8gsqkiL5=poN9FoL-uCyx1YOLCoG2hRiUBYug@mail.gmail.com>
 <c7c2d7e1-e253-dce0-d35c-392192e4926e@iogearbox.net>
In-Reply-To: <c7c2d7e1-e253-dce0-d35c-392192e4926e@iogearbox.net>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 29 May 2021 14:48:33 -0400
Message-ID: <CAHC9VhS1XRZjKcTFgH1+n5uA-CeT+9BeSP5jvT2+RE5ougLpUg@mail.gmail.com>
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
> In the case of tracing, it's different. You install small programs that are
> triggered when certain events fire. Random example from bpftrace's README [0],
> you want to generate a histogram of syscall counts by program. One-liner is:
>
>    bpftrace -e 'tracepoint:raw_syscalls:sys_enter { @[comm] = count(); }'
>
> bpftrace then goes and generates a BPF prog from this internally. One way of
> doing it could be to call bpf_get_current_task() helper and then access
> current->comm via one of bpf_probe_read_kernel{,_str}() helpers ...

I think we can all agree that the BPF tracing is a bit chaotic in the
sense that the tracing programs can be executed in various
places/contexts and that presents some challenges with respect to
access control and auditing.  If you are following the io_uring stuff
that is going on now you can see a little of what is required to make
audit work properly in the various io_uring contexts and that is
relatively small compared to what is possible with BPF tracing.  Of
course this assumes I've managed to understand bpf tracing properly
this morning, and I very well may still be missing points and/or
confused about some of the important details.  Corrections are
welcome.

Daniel's patch side steps that worry by just doing the lockdown
permission check when the BPF program is loaded, but that isn't a
great solution if the policy changes afterward.  I was hoping there
might be some way to perform the permission check as needed, but the
more I look the more that appears to be difficult, if not impossible
(once again, corrections are welcome).

I'm now wondering if the right solution here is to make use of the LSM
notifier mechanism.  I'm not yet entirely sure if this would work from
a BPF perspective, but I could envision the BPF subsystem registering
a LSM notification callback via register_blocking_lsm_notifier(), see
if Infiniband code as an example, and then when the LSM(s) policy
changes the BPF subsystem would get a notification and it could
revalidate the existing BPF programs and take block/remove/whatever
the offending BPF programs.  This obviously requires a few things
which I'm not sure are easily done, or even possible:

1. Somehow the BPF programs would need to be "marked" at
load/verification time with respect to their lockdown requirements so
that decisions can be made later.  Perhaps a flag in bpf_prog_aux?

2. While it looks like it should be possible to iterate over all of
the loaded BPF programs in the LSM notifier callback via
idr_for_each(prog_idr, ...), it is not clear to me if it is possible
to safely remove, or somehow disable, BPF programs once they have been
loaded.  Hopefully the BPF folks can help answer that question.

3. Disabling of BPF programs might be preferable to removing them
entirely on LSM policy changes as it would be possible to make the
lockdown state less restrictive at a future point in time, allowing
for the BPF program to be executed again.  Once again, not sure if
this is even possible.

Related, the lockdown LSM should probably also grow LSM notifier
support similar to selinux_lsm_notifier_avc_callback(), for example
either lock_kernel_down() or lockdown_write() might want to do a
call_blocking_lsm_notifier(LSM_POLICY_CHANGE, NULL) call.

-- 
paul moore
www.paul-moore.com
