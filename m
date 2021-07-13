Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C03F83C6892
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 04:35:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP4Vr67Lzz3bX1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 12:35:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=hAqQVpiv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20150623.gappssmtp.com
 header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=hAqQVpiv; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP4VL2cF3z2yNX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 12:35:04 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id hc15so34858ejc.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 19:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RBPu6xYIBS0viB5UZS492p6zHqYEhcALtpbidr1sCrU=;
 b=hAqQVpiv52aQMiILfGaILA7UZ3Vb7hpAEZl5MSyT4Y9giLdF8ZWBqgareVlSQUHWpR
 ZUrim0on5dre3bqN5EGAiRzVWG6nVeaiF+s6JaGu2Q+54HjtAgU1AvqcqlU5GALyqPc8
 J59ZdfyvvWc0CNOaKSGrAuHZon7DtT9jG9x1ueo2PbGCXBvXV9LCEYmPz0NJvuwLKCb4
 e5swfb54jlYSJ49YcMdOKdIhN3CYIP2f7H6ObIehgsT00rpoEugEWTcwjWsk6Ijx/OB+
 sziXashjbhIgbQwAsqKXq8JHPkE9kbOMVO58+jj4MNa7U/Fp8vQxUrXCiR8DuABY3fmZ
 DToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RBPu6xYIBS0viB5UZS492p6zHqYEhcALtpbidr1sCrU=;
 b=ojgzT33srNHOtC+6k5TsgrzL+C25F7ASqShEOazbBy4HiNcbUGTz+KXq4gJxSn50vy
 7VYDVs/f6V6vVDIsYYeIrj2qcJ7jIbJmmW4wjXuAoK8+vlkaAxALccP8Mo37UVyD1Tau
 PrMOQDfMaXHPfrKKt2sVvNI3svx8RjcbDvDdGkMGiotxr/8DIJfb08VIY0eI95yS1eyl
 Zf8ssn0HdeEPklfnmFWkRQbEYIBOid6+7+cbn+Mb6yswcCgozEwXdmVJp4UwdaW8P8p+
 Mx+5vJTrHJnRLvewDunhyATm9CrKulaiqhesi4ooN+vN+w/62jkzcnHN25t7mOWL1lE3
 nLAg==
X-Gm-Message-State: AOAM533WwldWaBxxFCByqLulNK/bAvMFmxRgz4X3L2bSra75wLdIXyyR
 uNFYm35VsY8lIt0luzlZ2Ce/KsyzLNUKvA8HNNEJ
X-Google-Smtp-Source: ABdhPJyytdq/CE/wkitIkFTYSvvbb5T4D4KC4bniBQLIKEAC15BXF2YMkUTZuWQQktrfljWaz21U9sH3mGdCEuV7T/M=
X-Received: by 2002:a17:907:10d8:: with SMTP id
 rv24mr2673354ejb.542.1626143695922; 
 Mon, 12 Jul 2021 19:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210616085118.1141101-1-omosnace@redhat.com>
 <8735tdiyc1.ffs@nanos.tec.linutronix.de>
In-Reply-To: <8735tdiyc1.ffs@nanos.tec.linutronix.de>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 12 Jul 2021 22:34:45 -0400
Message-ID: <CAHC9VhRAN4RS2c3cwpr=DQ_45MDqn2QV7nL4J3ZWXKfUNLcjdQ@mail.gmail.com>
Subject: Re: [PATCH v3] lockdown,selinux: fix wrong subject in some SELinux
 lockdown checks
To: Thomas Gleixner <tglx@linutronix.de>
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
Cc: linux-efi@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
 James Morris <jmorris@namei.org>, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, selinux@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Casey Schaufler <casey@schaufler-ca.com>,
 netdev@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>,
 kexec@lists.infradead.org, Ondrej Mosnacek <omosnace@redhat.com>,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 19, 2021 at 1:00 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> On Wed, Jun 16 2021 at 10:51, Ondrej Mosnacek wrote:
> > diff --git a/arch/x86/mm/testmmiotrace.c b/arch/x86/mm/testmmiotrace.c
> > index bda73cb7a044..c43a13241ae8 100644
> > --- a/arch/x86/mm/testmmiotrace.c
> > +++ b/arch/x86/mm/testmmiotrace.c
> > @@ -116,7 +116,7 @@ static void do_test_bulk_ioremapping(void)
> >  static int __init init(void)
> >  {
> >       unsigned long size = (read_far) ? (8 << 20) : (16 << 10);
> > -     int ret = security_locked_down(LOCKDOWN_MMIOTRACE);
> > +     int ret = security_locked_down(current_cred(), LOCKDOWN_MMIOTRACE);
>
> I have no real objection to those patches, but it strikes me odd that
> out of the 62 changed places 58 have 'current_cred()' and 4 have NULL as
> argument.
>
> I can't see why this would ever end up with anything else than
> current_cred() or NULL and NULL being the 'special' case. So why not
> having security_locked_down_no_cred() and make current_cred() implicit
> for security_locked_down() which avoids most of the churn and just makes
> the special cases special. I might be missing something though.

Unfortunately it is not uncommon for kernel subsystems to add, move,
or otherwise play around with LSM hooks without checking with the LSM
folks; generally this is okay, but there have been a few problems in
the past and I try to keep that in mind when we are introducing new
hooks or modifying existing ones.  If we have two LSM hooks for
roughly the same control point it has the potential to cause
confusion, e.g. do I use the "normal" or the "no_cred" version?  What
if I don't want to pass a credential, can I just use "no_cred"?  My
thinking with the single, always-pass-a-cred function is that callers
don't have to worry about choosing from multiple, similar hooks and
they know they need to pass a cred which hopefully gets them thinking
about what cred is appropriate.  It's not foolproof, but I believe the
single hook approach will be less prone to accidents ... or so I hope
:)

-- 
paul moore
www.paul-moore.com
