Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C78766DE4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 15:14:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ere88gkm;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ere88gkm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RC7Q01LRPz3d8M
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 23:14:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ere88gkm;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ere88gkm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=omosnace@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RC7P46FSmz2ygj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 23:13:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690550003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSfTQKibmae4BhoaMP33vHySs6u+SsBNyYuCmTTcvXg=;
	b=ere88gkm40PyRuZAMWB7pLo8ctswOEvoYFuv17EildV52frcwswwcuDe6Ivp9zumQR/Ym6
	VDrg61uGerRG1Jn2/wasve+DX9ZTkqeqnhs8RXXxGGcDhR5uwAXarD9lukpFlBghspw/Ca
	HPGOvfcIaLyueXf8fjGEhE5YL8G2UfA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690550003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSfTQKibmae4BhoaMP33vHySs6u+SsBNyYuCmTTcvXg=;
	b=ere88gkm40PyRuZAMWB7pLo8ctswOEvoYFuv17EildV52frcwswwcuDe6Ivp9zumQR/Ym6
	VDrg61uGerRG1Jn2/wasve+DX9ZTkqeqnhs8RXXxGGcDhR5uwAXarD9lukpFlBghspw/Ca
	HPGOvfcIaLyueXf8fjGEhE5YL8G2UfA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-5z7e2FGmO1Kt7H8N08opXA-1; Fri, 28 Jul 2023 09:13:18 -0400
X-MC-Unique: 5z7e2FGmO1Kt7H8N08opXA-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-267f00f6876so1386093a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 06:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690549998; x=1691154798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSfTQKibmae4BhoaMP33vHySs6u+SsBNyYuCmTTcvXg=;
        b=YTT4V4hXBZefEY6OCaVYAGdRfUjiuEq3ysdyyAao4Ohyby6WzgKXqGOv7AXp8/UAFq
         bhXgaBUyQq4yJuwFzLyQR2OW0PslwrNd2vE8HFyURAvjxhbXMa1ZJy0N7XTUdGEsEWnv
         0zZO890nAznV+gSjtOXA4S4BB5G5/4B31C6bpO27wvB66zMMKix7xUywbepxk/SkcWJo
         8K8VUFLZV46bP1V8INZ0i55e4pLitJksKvoHyz+NZIetFY9QCLeNeL/jh9pkwAl7bwKE
         njtYk+FftBSmvZhiA2xAjKgm1uNEgLofHcHe/bC4C1iVyl6RqjfflLNZDNFSVqAnm2qO
         0T8A==
X-Gm-Message-State: ABy/qLaOAMsY7ec9tGcWO5+GRAFxWd7HXGypfsOKJhmMngRQ+EScmid2
	g8QGbWgEx6C3vf/dyaz/kit2+yu4mAw+gWTx2iV7Co7tYYI9tsd9wu15E2PDoSDsf0J+/rcxQfU
	GheldED937yALw/AUeXjr4Pz7v7BzDSWjaA+qEo63eA==
X-Received: by 2002:a17:90a:410f:b0:268:dd0:3497 with SMTP id u15-20020a17090a410f00b002680dd03497mr1369815pjf.7.1690549997710;
        Fri, 28 Jul 2023 06:13:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE5y8wFNdiLqc3ETlKLPa+cfJmG8GRCRBtKGldFGO/sJezVu4H1NQVwj6+DjFFGt2eUfFGCSlMorGpLCIOQyOY=
X-Received: by 2002:a17:90a:410f:b0:268:dd0:3497 with SMTP id
 u15-20020a17090a410f00b002680dd03497mr1369793pjf.7.1690549997418; Fri, 28 Jul
 2023 06:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230620131223.431281-1-omosnace@redhat.com> <87edkseqf8.fsf@mail.lhotse>
 <CAFqZXNtsCKsr0YHPCSJJQ5An=RoMhf0dufgr7P_SnAAv7CrLjw@mail.gmail.com> <CAEjxPJ643nmW6HZOmQGNFDj-cQGf-x3jzZcrO8BHVN9thM23Dw@mail.gmail.com>
In-Reply-To: <CAEjxPJ643nmW6HZOmQGNFDj-cQGf-x3jzZcrO8BHVN9thM23Dw@mail.gmail.com>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Fri, 28 Jul 2023 15:13:06 +0200
Message-ID: <CAFqZXNuM-807tmT84rZ25xwh078BxvSfav88AozH=tt=J+dCrA@mail.gmail.com>
Subject: Re: Login broken with old userspace (was Re: [PATCH v2] selinux:
 introduce an initial SID for early boot processes)
To: Stephen Smalley <stephen.smalley.work@gmail.com>
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
Cc: Paul Moore <paul@paul-moore.com>, selinux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 28, 2023 at 1:52=E2=80=AFPM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On Fri, Jul 28, 2023 at 7:36=E2=80=AFAM Ondrej Mosnacek <omosnace@redhat.=
com> wrote:
> >
> > On Fri, Jul 28, 2023 at 4:12=E2=80=AFAM Michael Ellerman <mpe@ellerman.=
id.au> wrote:
> > >
> > > Ondrej Mosnacek <omosnace@redhat.com> writes:
> > > > Currently, SELinux doesn't allow distinguishing between kernel thre=
ads
> > > > and userspace processes that are started before the policy is first
> > > > loaded - both get the label corresponding to the kernel SID. The on=
ly
> > > > way a process that persists from early boot can get a meaningful la=
bel
> > > > is by doing a voluntary dyntransition or re-executing itself.
> > >
> > > Hi,
> > >
> > > This commit breaks login for me when booting linux-next kernels with =
old
> > > userspace, specifically Ubuntu 16.04 on ppc64le. 18.04 is OK.
> > >
> > > The symptom is that login never accepts the root password, it just
> > > always says "Login incorrect".
> > >
> > > Bisect points to this commit.
> > >
> > > Reverting this commit on top of next-20230726, fixes the problem
> > > (ie. login works again).
> > >
> > > Booting with selinux=3D0 also fixes the problem.
> > >
> > > Is this expected? The change log below suggests backward compatibilit=
y
> > > was considered, is 16.04 just too old?
> >
> > Hi Michael,
> >
> > I can reproduce it on Fedora 38 when I boot with SELINUX=3Ddisabled in
> > /etc/selinux/config (+ a kernel including that commit), so it likely
> > isn't caused by the userspace being old. Can you check what you have
> > in /etc/selinux/config (or if it exists at all)?
> >
> > We have deprecated and removed the "runtime disable" functionality in
> > SELinux recently [1], which was used to implement "disabling" SELinux
> > via the /etc/selinux/config file, so now the situation (selinux=3D0 +
> > SELINUX=3Ddisabled in /etc/selinux/config) leads to a state where
> > SELinux is enabled, but no policy is loaded (and no enforcement is
> > done). Such a state mostly behaves as if SElinux was truly disabled
> > (via kernel command line), but there are some subtle differences and I
> > believe we don't officially support it (Paul might clarify). With
> > latest kernels it is recommended to either disable SELinux via the
> > kernel command line (or Kconfig[2]) or to boot it in Enforcing or
> > Permissive mode with a valid/usable policy installed.
> >
> > So I wonder if Ubuntu ships by default with the bad configuration or
> > if it's just a result of using the custom-built linux-next kernel (or
> > some changes on your part). If Ubuntu's stock kernel is configured to
> > boot with SELinux enabled by default, they should also by default ship
> > a usable policy and SELINUX=3Dpermissive/enforcing in
> > /etc/selinux/config (or configure the kernel[2] or bootloader to boot
> > with SELinux disabled by default). (Although if they ship a pre-[1]
> > kernel, they may continue to rely on the runtime disable
> > functionality, but it means people will have to be careful when
> > booting newer or custom kernels.)
> >
> > That said, I'd like to get to the bottom of why the commit causes the
> > login to fail and fix it somehow. I presume something in PAM chokes on
> > the fact that userspace tasks now have "init" instead of "kernel" as
> > the pre-policy-load security context, but so far I haven't been able
> > to pinpoint the problem. I'll keep digging...
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/?id=3Df22f9aaf6c3d92ebd5ad9e67acc03afebaaeb289
> > [2] via CONFIG_LSM (or CONFIG_SECURITY_SELINUX_BOOTPARAM_VALUE on older=
 kernels)
>
> Prior to selinux userspace commit
> 685f4aeeadc0b60f3770404d4f149610d656e3c8 ("libselinux:
> is_selinux_enabled(): drop no-policy-loaded test.") libselinux was
> checking the result of reading /proc/self/attr/current to see if it
> returned the "kernel" string as a means of detecting a system with
> SELinux enabled but no policy loaded, and treated that as if SELinux
> were disabled. Hence, this does break old userspace. Not sure though
> why you'd see the same behavior with modern libselinux.

Hm... now I tried booting the stock Fedora kernel (without the early
boot initial SID commit) and I got the same failure to login as with
the new kernel. So if Ubuntu 16.04 ships with pre-685f4aeeadc0
libselinux (quite possible), then it seems that the scenario with
terminal login + SELinux enabled + policy not loaded only works with
pre-685f4aeeadc0 libselinux and pre-5b0eea835d4e kernel, the other
combinations are broken. With pre-685f4aeeadc0 libselinux +
post-5b0eea835d4e kernel it is expected as you say (and probably
inevitable barring some hack on the kernel side), but it's not clear
why also only updating libselinux seems to break it... /sys/fs/selinux
is not mounted in my scenario, so there must be something else coming
into play.


--
Ondrej Mosnacek
Senior Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

