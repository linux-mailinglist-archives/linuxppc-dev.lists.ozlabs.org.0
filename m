Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD1D397B65
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 22:47:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fvkkg377Nz2ysq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 06:47:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=a7qjHsKT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20150623.gappssmtp.com
 header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=a7qjHsKT; dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvkkC3ZRDz2yjJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 06:47:29 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id dj8so189727edb.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jun 2021 13:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tTNIBzYtON70L8W0i/P9C9vefa2RWt2U+aq2jjrO0Nw=;
 b=a7qjHsKTaqa3sWrWdZ5Gh9wO8wYHYyLL1wPg/UcCE7WulKyadI3xcZi7iFuzK0u1Ce
 IkSY1GVr6EEc8j3nyeg4ebI1UMrBkZhJ4VQc/fi9aoa2EltyNevU04GfDQ5ppE1IbA8B
 o/MByBqkj1YE9ylhArUoRCj0NUDDOzKmyG/jCGVAasz7umc4Dr4Pd/t6Eyy7zlYWliQq
 4ArqLMbKLawihtbRZaRj6YUhJNMF+wo/VNZBxG78x6i56+dgCU1YWPsuNdHxjOGUGzvK
 bHh6Y91IphMkFIda1nqGEdYuSLZ6RDd4IGBJvo9dx8WnU2kK8sOcCJ9N7gn+NW/tjSkf
 aJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tTNIBzYtON70L8W0i/P9C9vefa2RWt2U+aq2jjrO0Nw=;
 b=W7gFZ+wqAkxYFJSr5IXjgsumvp8R7iBLalSwQbZ5Y6qj+tmY5HEaU6M7ahw1gLHpBw
 PXidkY+kDHwVSnBZTyObeiRMLx/gomioHG7JG+NlV3p2ZDpSAfgzvHz0cNJ6XO8AaPmd
 +P3ABTA4S7B9qmriX9KtHlBFHFdfrQegY+hYX7drK0MfhdjijarrOsWpbdqhHnX1cJ/f
 DZJneWOU/teibjYRTtYvPIi+gzopxK01+1YIilwGb9tQFRa8kPaAK+k4aCnA+qxaTuNU
 6pAN0Gy0LR1lyFkoM27ybRSAiJ+nWL5AXuVgGYtbkrLTrgpCy6SZTV5HarflQsa40Rnf
 mTRw==
X-Gm-Message-State: AOAM530d0CcNoDFtOYTag37lutetn2Ko3NcocovRli+IPuzJPlVXIUTa
 73zbQMdF1YnW8q9X9EsPSL4eQZ1i++7p2cq20SdU
X-Google-Smtp-Source: ABdhPJwU7tcZXG/Pm25o7D7/1VUxLtr+XnMQYQgFFvc5bxqJe1U1fscpsf+4cHErKF2itcPOfxYxe2ICVSz4Nvu1ZGs=
X-Received: by 2002:aa7:d84e:: with SMTP id f14mr21519965eds.12.1622580442071; 
 Tue, 01 Jun 2021 13:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210517092006.803332-1-omosnace@redhat.com>
 <CAHC9VhTasra0tU=bKwVqAwLRYaC+hYakirRz0Mn5jbVMuDkwrA@mail.gmail.com>
 <01135120-8bf7-df2e-cff0-1d73f1f841c3@iogearbox.net>
 <CAHC9VhR-kYmMA8gsqkiL5=poN9FoL-uCyx1YOLCoG2hRiUBYug@mail.gmail.com>
 <c7c2d7e1-e253-dce0-d35c-392192e4926e@iogearbox.net>
 <CAHC9VhS1XRZjKcTFgH1+n5uA-CeT+9BeSP5jvT2+RE5ougLpUg@mail.gmail.com>
 <2e541bdc-ae21-9a07-7ac7-6c6a4dda09e8@iogearbox.net>
In-Reply-To: <2e541bdc-ae21-9a07-7ac7-6c6a4dda09e8@iogearbox.net>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 1 Jun 2021 16:47:10 -0400
Message-ID: <CAHC9VhT464vr9sWxqY3PRB4DAccz=LvRMLgWBsSViWMR0JJvOQ@mail.gmail.com>
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

On Mon, May 31, 2021 at 4:24 AM Daniel Borkmann <daniel@iogearbox.net> wrote:
> On 5/29/21 8:48 PM, Paul Moore wrote:
> [...]
> > Daniel's patch side steps that worry by just doing the lockdown
> > permission check when the BPF program is loaded, but that isn't a
> > great solution if the policy changes afterward.  I was hoping there
> > might be some way to perform the permission check as needed, but the
> > more I look the more that appears to be difficult, if not impossible
> > (once again, corrections are welcome).
>
> Your observation is correct, will try to clarify below a bit.
>
> > I'm now wondering if the right solution here is to make use of the LSM
> > notifier mechanism.  I'm not yet entirely sure if this would work from
> > a BPF perspective, but I could envision the BPF subsystem registering
> > a LSM notification callback via register_blocking_lsm_notifier(), see
> > if Infiniband code as an example, and then when the LSM(s) policy
> > changes the BPF subsystem would get a notification and it could
> > revalidate the existing BPF programs and take block/remove/whatever
> > the offending BPF programs.  This obviously requires a few things
> > which I'm not sure are easily done, or even possible:
> >
> > 1. Somehow the BPF programs would need to be "marked" at
> > load/verification time with respect to their lockdown requirements so
> > that decisions can be made later.  Perhaps a flag in bpf_prog_aux?
> >
> > 2. While it looks like it should be possible to iterate over all of
> > the loaded BPF programs in the LSM notifier callback via
> > idr_for_each(prog_idr, ...), it is not clear to me if it is possible
> > to safely remove, or somehow disable, BPF programs once they have been
> > loaded.  Hopefully the BPF folks can help answer that question.
> >
> > 3. Disabling of BPF programs might be preferable to removing them
> > entirely on LSM policy changes as it would be possible to make the
> > lockdown state less restrictive at a future point in time, allowing
> > for the BPF program to be executed again.  Once again, not sure if
> > this is even possible.
>
> Part of why this gets really complex/impossible is that BPF programs in
> the kernel are reference counted from various sides, be it that there
> are references from user space to them (fd from application, BPF fs, or
> BPF links), hooks where they are attached to as well as tail call maps
> where one BPF prog calls into another. There is currently also no global
> infra of some sort where you could piggy back to atomically keep track of
> all the references in a list or such. And the other thing is that BPF progs
> have no ownership that is tied to a specific task after they have been
> loaded. Meaning, once they are loaded into the kernel by an application
> and attached to a specific hook, they can remain there potentially until
> reboot of the node, so lifecycle of the user space application != lifecycle
> of the BPF program.

I don't think the disjoint lifecycle or lack of task ownership is a
deal breaker from a LSM perspective as the LSMs can stash whatever
info they need in the security pointer during the program allocation
hook, e.g. selinux_bpf_prog_alloc() saves the security domain which
allocates/loads the BPF program.

The thing I'm worried about would be the case where a LSM policy
change requires that an existing BPF program be removed or disabled.
I'm guessing based on the refcounting that there is not presently a
clean way to remove a BPF program from the system, but is this
something we could resolve?  If we can't safely remove a BPF program
from the system, can we replace/swap it with an empty/NULL BPF
program?

> It's maybe best to compare this aspect to kernel modules in the sense that
> you have an application that loads it into the kernel (insmod, etc, where
> you could also enforce lockdown signature check), but after that, they can
> be managed by other entities as well (implicitly refcounted from kernel,
> removed by other applications, etc).

Well, I guess we could consider BPF programs as out-of-tree kernel
modules that potentially do very odd and dangerous things, e.g.
performing access control checks *inside* access control checks ...
but yeah, I get your point at a basic level, I just think that
comparing BPF programs to kernel modules is a not-so-great comparison
in general.

> My understanding of the lockdown settings are that users have options
> to select/enforce a lockdown level of CONFIG_LOCK_DOWN_KERNEL_FORCE_{INTEGRITY,
> CONFIDENTIALITY} at compilation time, they have a lockdown={integrity|
> confidentiality} boot-time parameter, /sys/kernel/security/lockdown,
> and then more fine-grained policy via 59438b46471a ("security,lockdown,selinux:
> implement SELinux lockdown"). Once you have set a global policy level,
> you cannot revert back to a less strict mode.

I don't recall there being anything in the SELinux lockdown support
that prevents a newly loaded policy from allowing a change in the
lockdown level, either stricter or more permissive, for a given
domain.  Looking quickly at the code, that still seems to be the case.

The SELinux lockdown access controls function independently of the
global build and runtime lockdown configuration.

> So the SELinux policy is
> specifically tied around tasks to further restrict applications in respect
> to the global policy.

As a reminder, there is no guarantee that both the SELinux and
lockdown LSM are both loaded and active at runtime, it is possible
that only SELinux is active.  If SELinux is the only LSM enforcing
lockdown access controls, there is no global lockdown setting, it is
determined per-domain.

> I presume that would mean for those users that majority
> of tasks have the confidentiality option set via SELinux with just a few
> necessary using the integrity global policy. So overall the enforcing
> option when BPF program is loaded is the only really sensible option to
> me given only there we have the valid current task where such policy can
> be enforced.

--
paul moore
www.paul-moore.com
