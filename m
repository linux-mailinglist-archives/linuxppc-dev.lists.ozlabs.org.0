Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB8239C432
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 02:09:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fxg3R0ZHFz3bsQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 10:09:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lONezNtA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=alexei.starovoitov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lONezNtA; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fxg2x4QF0z2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 10:08:40 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id n12so9516022lft.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jun 2021 17:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7O4yi6cn6gBER8XX7UVPJXE8JpTGO2BmTJOk3c1YezY=;
 b=lONezNtAYZiUSr1iYLLF2FAFUQSyPAyKMiOyNd4PyFlEEnMeuQSfMC3kgd+j+4lyji
 fB5o3HzOIrLuUbRM74zkvm4Lt68gJ2bu5r4E/DIf+13z01pKiEq2BtEUXGB73MKFTX3w
 OEDOrkvwgTp9wS6cLO57bDvnaiRV8YFGvYrFASu3FMK79mLc02KdHb6y+LVIDrnO6QKw
 OSuOcAHiocCmla4RrGF0uChppDDsJ5qc8sbiJuIE4IFOCKqw+6XUleMpLHNKKl40lPFC
 3RjG+nHOzqrsTla4+yu4BnwK2TNFFsAS5jni8Dx5cVESEw7yHiVvjBYtk2QSO39BkQ7e
 wgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7O4yi6cn6gBER8XX7UVPJXE8JpTGO2BmTJOk3c1YezY=;
 b=kA2U3VUaVYnDv3s7Em6LYSmxm3YoLsjW6oPIhezOJfE+5klEaypzhm7GjiBBHs1KCd
 Ezjz15QifKQG8kzoz+TfNiFNdy1BvwsRLskMJJaDLD9D4M+0rm4quKIaYjUJWJw8Jl9K
 nTRk5yYpU6++R1Xd9H2kQ9jElt1gSIrfsDUGAh2kxG+vKGfEVSyWwPhnTWJiX4Vu2LRj
 XyKYKMgQGn73+s4puiHWQUWqN7xNdOh9S+ww+hTH1DoWH6yQl4k355x/sOR3ElSL5UKq
 n7IyOze10oza4aSvvn1mvnFEXjYoOOYr39B4zvf8vZRh5/TUAfxPONvphY2owBKaSaLD
 fwJg==
X-Gm-Message-State: AOAM5317aGhuoNZKrjnsWjtboLaKWwxQ9cSZeZ8mCch+huahvBsyA9lI
 PUBvIC1bBpMKWJqX3z1H6pzaNDxj5JfeCsFnlsE=
X-Google-Smtp-Source: ABdhPJyE/AGEeMxwVpH/EFqVAUdh2yIubA70g70dg+zntH7F/uX+weKdCYbLk357XbEMR55n50qHL7nDnccDNBTMu8k=
X-Received: by 2002:a05:6512:3c91:: with SMTP id
 h17mr4482345lfv.214.1622851715688; 
 Fri, 04 Jun 2021 17:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210517092006.803332-1-omosnace@redhat.com>
 <CAHC9VhTasra0tU=bKwVqAwLRYaC+hYakirRz0Mn5jbVMuDkwrA@mail.gmail.com>
 <01135120-8bf7-df2e-cff0-1d73f1f841c3@iogearbox.net>
 <CAHC9VhR-kYmMA8gsqkiL5=poN9FoL-uCyx1YOLCoG2hRiUBYug@mail.gmail.com>
 <c7c2d7e1-e253-dce0-d35c-392192e4926e@iogearbox.net>
 <CAHC9VhS1XRZjKcTFgH1+n5uA-CeT+9BeSP5jvT2+RE5ougLpUg@mail.gmail.com>
 <2e541bdc-ae21-9a07-7ac7-6c6a4dda09e8@iogearbox.net>
 <CAHC9VhT464vr9sWxqY3PRB4DAccz=LvRMLgWBsSViWMR0JJvOQ@mail.gmail.com>
 <3ca181e3-df32-9ae0-12c6-efb899b7ce7a@iogearbox.net>
 <CAHC9VhTuPnPs1wMTmoGUZ4fvyy-es9QJpE7O_yTs2JKos4fgbw@mail.gmail.com>
 <f4373013-88fb-b839-aaaa-3826548ebd0c@iogearbox.net>
 <CAHC9VhS=BeGdaAi8Ae5Fx42Fzy_ybkcXwMNcPwK=uuA6=+SRcg@mail.gmail.com>
 <c59743f6-0000-1b15-bc16-ff761b443aef@iogearbox.net>
 <CAHC9VhT1JhdRw9P_m3niY-U-vukxTWKTE9q6AMyQ=r_ohpPxMw@mail.gmail.com>
In-Reply-To: <CAHC9VhT1JhdRw9P_m3niY-U-vukxTWKTE9q6AMyQ=r_ohpPxMw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 4 Jun 2021 17:08:24 -0700
Message-ID: <CAADnVQ+0bNtDj46Q8s-h=rqJgZz2JaGTeHpbmof3e7fBBQKuDQ@mail.gmail.com>
Subject: Re: [PATCH v2] lockdown,selinux: avoid bogus SELinux lockdown
 permission checks
To: Paul Moore <paul@paul-moore.com>
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
Cc: Jiri Olsa <jolsa@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, selinux@vger.kernel.org,
 Network Development <netdev@vger.kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrii Nakryiko <andrii@kernel.org>, Ondrej Mosnacek <omosnace@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, James Morris <jmorris@namei.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 LSM List <linux-security-module@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf <bpf@vger.kernel.org>,
 ppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 4, 2021 at 4:34 PM Paul Moore <paul@paul-moore.com> wrote:
>
> > Again, the problem is not limited to BPF at all. kprobes is doing register-
> > time hooks which are equivalent to the one of BPF. Anything in run-time
> > trying to prevent probe_read_kernel by kprobes or BPF is broken by design.
>
> Not being an expert on kprobes I can't really comment on that, but
> right now I'm focused on trying to make things work for the BPF
> helpers.  I suspect that if we can get the SELinux lockdown
> implementation working properly for BPF the solution for kprobes won't
> be far off.

Paul,

Both kprobe and bpf can call probe_read_kernel==copy_from_kernel_nofault
from all contexts.
Including NMI. Most of audit_log_* is not acceptable.
Just removing a wakeup is not solving anything.
Audit hooks don't belong in NMI.
Audit design needs memory allocation. Hence it's not suitable
for NMI and hardirq. But kprobes and bpf progs do run just fine there.
BPF, for example, only uses pre-allocated memory.
