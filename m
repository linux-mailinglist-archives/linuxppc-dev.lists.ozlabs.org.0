Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A88A0766DD7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 15:05:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Zk1YwlUB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RC7Cr4DB3z3ddd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 23:05:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Zk1YwlUB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=stephen.smalley.work@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RC5bq3hHKz30YV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 21:52:39 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2682e33509bso1481099a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 04:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690545154; x=1691149954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uH9ascag3hCYRu/BXQyOaYFN0XTaBKhDKrOIAGkCAeg=;
        b=Zk1YwlUBckWCahbtf+rodHjh6i5AfLASREmfXGKVNbGp5RnDGYpDb1ekLtVIiCByt/
         /2qKsdFXs6m8jsVB2Bj7FgS48MXAnrDJUGbPIg+CNSBARDm6XhXPzGlesLxcgiiyu91h
         LRmSLf9z2j63TMKyjZMEORJS+aoirlqQ5GJ4gVQ3xEuNGTX1e+36P1EXGPOT8nEpozPe
         Chs/WVgo6F6NUlkcTji4OFJCHtcPWe7Oh7/kK8P7do38ITCc1pBf9xlX4H0nEgtojJlY
         BZBNGCQyuzi+SMlFt1VhgHMIbexpc6ACDJHmX1LjCXnxABXbDbwII1ws2ioq33NK1Uiy
         gl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690545154; x=1691149954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uH9ascag3hCYRu/BXQyOaYFN0XTaBKhDKrOIAGkCAeg=;
        b=jP4BnViUMyi9ZvR2yq4ChNRYqlqgAC9wdk+Zu46PDGctU/BqjOYV5UlMH79EOGwVZP
         ytXRY7Nrqw/DoBDcDP8+y7hx7JLHtFnLF1iVzoShEkSmqJXhYcvme65pTAZJNV7kS7hs
         r2dWCGNU79nd93rMWvLKCmj2BRnwr0rmzlC7qpQ01qxMm3LH1bTShvZl1odV/rElagEW
         YDGFX9RSTZ9fwQcr6QrfBAil+cImrMfdocPYo/oYFSQT189eW4Fh93B2WNvghiBGcWQo
         YKwHSplqky4iYf7WkQMkAKzs4aI4qeANhAn9T3RACG7R3d5ar/F9nf+93dqt9K6WmfO1
         w9Dw==
X-Gm-Message-State: ABy/qLbW2Ejq0/S65zGUZMCTDvdH9fdYVMdkLDlyUC0IJa7U9gxb25W6
	Eq3fmjtOF2rWuBgNHyOHL5LoRi0ViAH0s1ia16Q=
X-Google-Smtp-Source: APBJJlEKIPLfaERcHOpXWVP4t3Ap2T9bttAzGZNmTiMoti48b/zUIeUDKCZ4gg86RmsEoY5Y4h9ilPFxn6zr1XNT90Q=
X-Received: by 2002:a17:90b:46d5:b0:262:ebb9:dd59 with SMTP id
 jx21-20020a17090b46d500b00262ebb9dd59mr1418281pjb.20.1690545154528; Fri, 28
 Jul 2023 04:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230620131223.431281-1-omosnace@redhat.com> <87edkseqf8.fsf@mail.lhotse>
 <CAFqZXNtsCKsr0YHPCSJJQ5An=RoMhf0dufgr7P_SnAAv7CrLjw@mail.gmail.com>
In-Reply-To: <CAFqZXNtsCKsr0YHPCSJJQ5An=RoMhf0dufgr7P_SnAAv7CrLjw@mail.gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Fri, 28 Jul 2023 07:52:23 -0400
Message-ID: <CAEjxPJ643nmW6HZOmQGNFDj-cQGf-x3jzZcrO8BHVN9thM23Dw@mail.gmail.com>
Subject: Re: Login broken with old userspace (was Re: [PATCH v2] selinux:
 introduce an initial SID for early boot processes)
To: Ondrej Mosnacek <omosnace@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 28 Jul 2023 23:01:37 +1000
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
Cc: Paul Moore <paul@paul-moore.com>, selinux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 28, 2023 at 7:36=E2=80=AFAM Ondrej Mosnacek <omosnace@redhat.co=
m> wrote:
>
> On Fri, Jul 28, 2023 at 4:12=E2=80=AFAM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
> >
> > Ondrej Mosnacek <omosnace@redhat.com> writes:
> > > Currently, SELinux doesn't allow distinguishing between kernel thread=
s
> > > and userspace processes that are started before the policy is first
> > > loaded - both get the label corresponding to the kernel SID. The only
> > > way a process that persists from early boot can get a meaningful labe=
l
> > > is by doing a voluntary dyntransition or re-executing itself.
> >
> > Hi,
> >
> > This commit breaks login for me when booting linux-next kernels with ol=
d
> > userspace, specifically Ubuntu 16.04 on ppc64le. 18.04 is OK.
> >
> > The symptom is that login never accepts the root password, it just
> > always says "Login incorrect".
> >
> > Bisect points to this commit.
> >
> > Reverting this commit on top of next-20230726, fixes the problem
> > (ie. login works again).
> >
> > Booting with selinux=3D0 also fixes the problem.
> >
> > Is this expected? The change log below suggests backward compatibility
> > was considered, is 16.04 just too old?
>
> Hi Michael,
>
> I can reproduce it on Fedora 38 when I boot with SELINUX=3Ddisabled in
> /etc/selinux/config (+ a kernel including that commit), so it likely
> isn't caused by the userspace being old. Can you check what you have
> in /etc/selinux/config (or if it exists at all)?
>
> We have deprecated and removed the "runtime disable" functionality in
> SELinux recently [1], which was used to implement "disabling" SELinux
> via the /etc/selinux/config file, so now the situation (selinux=3D0 +
> SELINUX=3Ddisabled in /etc/selinux/config) leads to a state where
> SELinux is enabled, but no policy is loaded (and no enforcement is
> done). Such a state mostly behaves as if SElinux was truly disabled
> (via kernel command line), but there are some subtle differences and I
> believe we don't officially support it (Paul might clarify). With
> latest kernels it is recommended to either disable SELinux via the
> kernel command line (or Kconfig[2]) or to boot it in Enforcing or
> Permissive mode with a valid/usable policy installed.
>
> So I wonder if Ubuntu ships by default with the bad configuration or
> if it's just a result of using the custom-built linux-next kernel (or
> some changes on your part). If Ubuntu's stock kernel is configured to
> boot with SELinux enabled by default, they should also by default ship
> a usable policy and SELINUX=3Dpermissive/enforcing in
> /etc/selinux/config (or configure the kernel[2] or bootloader to boot
> with SELinux disabled by default). (Although if they ship a pre-[1]
> kernel, they may continue to rely on the runtime disable
> functionality, but it means people will have to be careful when
> booting newer or custom kernels.)
>
> That said, I'd like to get to the bottom of why the commit causes the
> login to fail and fix it somehow. I presume something in PAM chokes on
> the fact that userspace tasks now have "init" instead of "kernel" as
> the pre-policy-load security context, but so far I haven't been able
> to pinpoint the problem. I'll keep digging...
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3Df22f9aaf6c3d92ebd5ad9e67acc03afebaaeb289
> [2] via CONFIG_LSM (or CONFIG_SECURITY_SELINUX_BOOTPARAM_VALUE on older k=
ernels)

Prior to selinux userspace commit
685f4aeeadc0b60f3770404d4f149610d656e3c8 ("libselinux:
is_selinux_enabled(): drop no-policy-loaded test.") libselinux was
checking the result of reading /proc/self/attr/current to see if it
returned the "kernel" string as a means of detecting a system with
SELinux enabled but no policy loaded, and treated that as if SELinux
were disabled. Hence, this does break old userspace. Not sure though
why you'd see the same behavior with modern libselinux.
