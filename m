Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D637C766B55
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 13:04:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QKRPLJ4s;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QKRPLJ4s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RC4Wk5m5hz3cW8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 21:04:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QKRPLJ4s;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QKRPLJ4s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=omosnace@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RC4Vq3m7Hz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 21:03:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690542191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YRDAIP7TWOWzkcjHET3GgHuSuYBQhkcL+zbEgtv9LlA=;
	b=QKRPLJ4sFeEu+QaHdyAbV0Fw/hpI+vQBNyogVttq4PXc+TCe0ZEEKFRDlwOPJWubs0ZUDC
	wzteGfaQT09cgP+nij66rPPWito0w3PagLIRoVZtjTIx4HTSGlijnNAKEnRTDsltF2KlJ0
	3a07HrBtH0zLzXMJKjDg6uHK3ck0JWE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690542191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YRDAIP7TWOWzkcjHET3GgHuSuYBQhkcL+zbEgtv9LlA=;
	b=QKRPLJ4sFeEu+QaHdyAbV0Fw/hpI+vQBNyogVttq4PXc+TCe0ZEEKFRDlwOPJWubs0ZUDC
	wzteGfaQT09cgP+nij66rPPWito0w3PagLIRoVZtjTIx4HTSGlijnNAKEnRTDsltF2KlJ0
	3a07HrBtH0zLzXMJKjDg6uHK3ck0JWE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-c6XOGJXNOnKYlh9IftGUqA-1; Fri, 28 Jul 2023 07:03:10 -0400
X-MC-Unique: c6XOGJXNOnKYlh9IftGUqA-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-267f666104aso1474757a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 04:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690542189; x=1691146989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YRDAIP7TWOWzkcjHET3GgHuSuYBQhkcL+zbEgtv9LlA=;
        b=VwMf/tGGq/slAVzZmizfAOWwkJlPOBUlqsvH4hcZKdp5BqyeOYl+OB8jkeRBKasP4+
         55DyFLs7vTQmObWYO0QS3UK3Any60xarJdbHw2aH9LHVMcDPX1s3uJHv1dlZ3FEO6jl/
         R9HdtjAXhPC8IPL+xU3KEz/wmrn+X3B4frdthhGosK9T8ztxws/fu8DiA8znejD+yXyI
         f+3vYWAxPdgU5qVABAw7yUbvxjW/P2JuskaiOMRICBRkf2I4noEWFuxMfD1WnEErcu35
         5e/Jzva0YAHIK2fnB+xQavF0xkY0QbcmHc4nYWQ7myTtZ9qQgN9ucO28eZBrO/GHR12N
         qdVQ==
X-Gm-Message-State: ABy/qLYh2MMHPFFCmj6T6MqLhQEnVTW7KCqdfzH5L1p0ycHxGNDEht7R
	JCucgcj7prNC284VrRbRF0aB8w6StD7Z63XLKYn7tffVk71D+zqFHVwhjicz+4rYID4iY1/X97T
	r7SzM5ZUXVLW6JUUv0Z0I9Wr8EFExk1YkkqbPEROkyg==
X-Received: by 2002:a17:90a:c210:b0:267:f8f4:73ab with SMTP id e16-20020a17090ac21000b00267f8f473abmr1972292pjt.16.1690542189379;
        Fri, 28 Jul 2023 04:03:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFpM31f8xiI5XV4XQ4pPKorUiehU8YoIyXepdh/t5x0b+PJODmj9I2IfnV6k11CAK+Fxd67QVKBY4VbC4WYnMo=
X-Received: by 2002:a17:90a:c210:b0:267:f8f4:73ab with SMTP id
 e16-20020a17090ac21000b00267f8f473abmr1972270pjt.16.1690542189073; Fri, 28
 Jul 2023 04:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230620131223.431281-1-omosnace@redhat.com> <87edkseqf8.fsf@mail.lhotse>
In-Reply-To: <87edkseqf8.fsf@mail.lhotse>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Fri, 28 Jul 2023 13:02:58 +0200
Message-ID: <CAFqZXNtsCKsr0YHPCSJJQ5An=RoMhf0dufgr7P_SnAAv7CrLjw@mail.gmail.com>
Subject: Re: Login broken with old userspace (was Re: [PATCH v2] selinux:
 introduce an initial SID for early boot processes)
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: selinux@vger.kernel.org, linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Paul Moore <paul@paul-moore.com>, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 28, 2023 at 4:12=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Ondrej Mosnacek <omosnace@redhat.com> writes:
> > Currently, SELinux doesn't allow distinguishing between kernel threads
> > and userspace processes that are started before the policy is first
> > loaded - both get the label corresponding to the kernel SID. The only
> > way a process that persists from early boot can get a meaningful label
> > is by doing a voluntary dyntransition or re-executing itself.
>
> Hi,
>
> This commit breaks login for me when booting linux-next kernels with old
> userspace, specifically Ubuntu 16.04 on ppc64le. 18.04 is OK.
>
> The symptom is that login never accepts the root password, it just
> always says "Login incorrect".
>
> Bisect points to this commit.
>
> Reverting this commit on top of next-20230726, fixes the problem
> (ie. login works again).
>
> Booting with selinux=3D0 also fixes the problem.
>
> Is this expected? The change log below suggests backward compatibility
> was considered, is 16.04 just too old?

Hi Michael,

I can reproduce it on Fedora 38 when I boot with SELINUX=3Ddisabled in
/etc/selinux/config (+ a kernel including that commit), so it likely
isn't caused by the userspace being old. Can you check what you have
in /etc/selinux/config (or if it exists at all)?

We have deprecated and removed the "runtime disable" functionality in
SELinux recently [1], which was used to implement "disabling" SELinux
via the /etc/selinux/config file, so now the situation (selinux=3D0 +
SELINUX=3Ddisabled in /etc/selinux/config) leads to a state where
SELinux is enabled, but no policy is loaded (and no enforcement is
done). Such a state mostly behaves as if SElinux was truly disabled
(via kernel command line), but there are some subtle differences and I
believe we don't officially support it (Paul might clarify). With
latest kernels it is recommended to either disable SELinux via the
kernel command line (or Kconfig[2]) or to boot it in Enforcing or
Permissive mode with a valid/usable policy installed.

So I wonder if Ubuntu ships by default with the bad configuration or
if it's just a result of using the custom-built linux-next kernel (or
some changes on your part). If Ubuntu's stock kernel is configured to
boot with SELinux enabled by default, they should also by default ship
a usable policy and SELINUX=3Dpermissive/enforcing in
/etc/selinux/config (or configure the kernel[2] or bootloader to boot
with SELinux disabled by default). (Although if they ship a pre-[1]
kernel, they may continue to rely on the runtime disable
functionality, but it means people will have to be careful when
booting newer or custom kernels.)

That said, I'd like to get to the bottom of why the commit causes the
login to fail and fix it somehow. I presume something in PAM chokes on
the fact that userspace tasks now have "init" instead of "kernel" as
the pre-policy-load security context, but so far I haven't been able
to pinpoint the problem. I'll keep digging...

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Df22f9aaf6c3d92ebd5ad9e67acc03afebaaeb289
[2] via CONFIG_LSM (or CONFIG_SECURITY_SELINUX_BOOTPARAM_VALUE on older ker=
nels)

--=20
Ondrej Mosnacek
Senior Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

