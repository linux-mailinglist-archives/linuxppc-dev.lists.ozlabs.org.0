Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C19E3F6C07
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 01:02:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvPlW39Vhz2ynr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 09:02:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=Yl6fMWXf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20150623.gappssmtp.com
 header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Yl6fMWXf; dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvPkm59krz2xy4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 09:02:07 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id d11so47490412eja.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 16:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BqR285zA8y29+qvWRSLYagKArtLa82Wb9hRGFBtEPV4=;
 b=Yl6fMWXf1gCAPL9EsDg0PzNaP008s/cd+vwKdcaHRsgteyHGM2tuvZJI64BFo8bSsk
 77Eli3S9jcCOpw+vJDtEaUX3vjHiluZm+o3H/vrLeB0mjy24nXtPrDDH8E4E34chnlSl
 OSkOP0rxAapOFRKn0xIq2MPaX+KkHFqcDvz2p08NUOgBXbKyRogVJG2e2mAw+W/2DK1k
 kvGZq9p0j9UHOZJ6hf2T6mR6ZjlvJ+mshTFaozHSfDYTyh9Fo47Cxk6t2AEBB/LWSkH9
 YQRH7CrFNlHF65lgLJXytuEgY1A35jqf8dbwdHsj0Y00ihEri75Yqz6NLYqYbzt+ilbd
 DPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BqR285zA8y29+qvWRSLYagKArtLa82Wb9hRGFBtEPV4=;
 b=etgD1iD/PxtrWyczdypwCs363d3Z1dEKsWCy2SFNN4H9mK2ZJ18e6jiu3q7cOZCgRM
 RK7WAHv7k/WoA3wLE96lGc1KsOVAV5FTdZZq+R1hfIb8PkfXMtmsWdSfNW6TPxG6AZRY
 TuXqef09srQWQZev9k2o1NBpUaPbG1pa6tHQKPaifScsnvy0uHTZZz9Br7dMGrpqe3/7
 /dtXhYuKB4kijoJivXOvw+SiQZcgqRy/hoJGQcOSk0dRNt3rS/6s+Crf2WyzkWQp3G1O
 FlkzyNBIwVHUvOwUFFQiQLMfT5rIXHzKF6hAbpv+SEM3Qsv5H2odpFv7fjiJMiH/12/t
 R8TA==
X-Gm-Message-State: AOAM530698ixg+NGDmGuG/s//JduAwiYyT0Q6Qbf3enMa02qu6GHzaQk
 wj2dxYmbYVKy1gkcSn7TpcNZjN4QD+2/BClu73Pa
X-Google-Smtp-Source: ABdhPJynazijutOBUCcImE0zFY6OYKC4Zg6RSKVEULjGJXYqNDJiooPUg8XT4Ekv4timM9PXihaHhxWd3KUesXGBzew=
X-Received: by 2002:a17:906:b845:: with SMTP id
 ga5mr1107720ejb.106.1629846119190; 
 Tue, 24 Aug 2021 16:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <a4b3951d1191d4183d92a07a6097566bde60d00a.1629812058.git.christophe.leroy@csgroup.eu>
 <CAHC9VhR3E6=5HmRaWMWbp4WHsua02niwnzaRGM3tLqd4Y4LA6w@mail.gmail.com>
 <5a2692b6-5077-21b4-8ebf-73b1c2b83a40@csgroup.eu>
In-Reply-To: <5a2692b6-5077-21b4-8ebf-73b1c2b83a40@csgroup.eu>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 24 Aug 2021 19:01:48 -0400
Message-ID: <CAHC9VhSG8tPAkAAz5Z77HDMKXLAiaEOanxR+oY5c1E_Xoiso9Q@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] powerpc/audit: Convert powerpc to
 AUDIT_ARCH_COMPAT_GENERIC
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>,
 linux-audit@redhat.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 24, 2021 at 1:11 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 24/08/2021 =C3=A0 16:47, Paul Moore a =C3=A9crit :
> > On Tue, Aug 24, 2021 at 9:36 AM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >> Commit e65e1fc2d24b ("[PATCH] syscall class hookup for all normal
> >> targets") added generic support for AUDIT but that didn't include
> >> support for bi-arch like powerpc.
> >>
> >> Commit 4b58841149dc ("audit: Add generic compat syscall support")
> >> added generic support for bi-arch.
> >>
> >> Convert powerpc to that bi-arch generic audit support.
> >>
> >> Cc: Paul Moore <paul@paul-moore.com>
> >> Cc: Eric Paris <eparis@redhat.com>
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> ---
> >> Resending v2 with Audit people in Cc
> >>
> >> v2:
> >> - Missing 'git add' for arch/powerpc/include/asm/unistd32.h
> >> - Finalised commit description
> >> ---
> >>   arch/powerpc/Kconfig                |  5 +-
> >>   arch/powerpc/include/asm/unistd32.h |  7 +++
> >>   arch/powerpc/kernel/Makefile        |  3 --
> >>   arch/powerpc/kernel/audit.c         | 84 ---------------------------=
--
> >>   arch/powerpc/kernel/compat_audit.c  | 44 ---------------
> >>   5 files changed, 8 insertions(+), 135 deletions(-)
> >>   create mode 100644 arch/powerpc/include/asm/unistd32.h
> >>   delete mode 100644 arch/powerpc/kernel/audit.c
> >>   delete mode 100644 arch/powerpc/kernel/compat_audit.c
> >
> > Can you explain, in detail please, the testing you have done to verify
> > this patch?
> >
>
> I built ppc64_defconfig and checked that the generated code is functionna=
ly equivalent.
>
> ppc32_classify_syscall() is exactly the same as audit_classify_compat_sys=
call() except that the
> later takes the syscall as second argument (ie in r4) whereas the former =
takes it as first argument
> (ie in r3).
>
> audit_classify_arch() and powerpc audit_classify_syscall() are slightly d=
ifferent between the
> powerpc version and the generic version because the powerpc version check=
s whether it is
> AUDIT_ARCH_PPC or not (ie value 20), while the generic one checks whether=
 it has bit
> __AUDIT_ARCH_64BIT set or not (__AUDIT_ARCH_64BIT is the sign bit of a wo=
rd), but taking into
> account that the abi is either AUDIT_ARCH_PPC, AUDIT_ARCH_PPC64 or AUDIT_=
ARCH_PPC64LE, the result is
> the same.
>
> If you are asking I guess you saw something wrong ?

I was asking because I didn't see any mention of testing, and when you
are enabling something significant like this it is nice to see that it
has been verified to work :)

While binary dumps and comparisons are nice, it is always good to see
verification from a test suite.  I don't have access to the necessary
hardware to test this, but could you verify that the audit-testsuite
passes on your test system with your patches applied?

 * https://github.com/linux-audit/audit-testsuite

--=20
paul moore
www.paul-moore.com
