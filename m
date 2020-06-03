Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF131ED9A6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 01:52:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cm110QlxzDqf1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 09:52:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=R1yFr4XR; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49clz66NvQzDqLM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 09:50:42 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id y18so1391285plr.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jun 2020 16:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qWmO3ZI8i34h9spdSprmL/lLpf4pLXBU0GLhND3KfTg=;
 b=R1yFr4XREkxA1bB2hqYvzIUBtxCs1vZIy0cnBVKz0myX5vr3P/GSYKxW0Xa+sf37mP
 /VuUg1uHwTafwgsP+SQzdx7YT4Oasy7xq0+WRj/wTzjO5VNm15xYHBYvMWzFjE6qvg7a
 aZddWLPKSotja6u3++neDjsDBoONFZbpP6+/521zrL+nnkaedJRdwsTDFtLOE9GEs22y
 xgmhLNIk6lcUHuOsUBBO1osiNcfdV30RaJYnnRYb/TmSO7u47lTSB36ogFSjWrbu+bRp
 ati812L7XCvpZchmNPpYHYkmZ8JNtB1/rSBgRaVMEB3nrqDBlDsDEqf0ZQsD9oc6Ns4z
 2lSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qWmO3ZI8i34h9spdSprmL/lLpf4pLXBU0GLhND3KfTg=;
 b=gan97Q9RheKejb0qsfI57iIY/aEXhzAdcuSHQGWKxhpQ3xPmweeY4IH6kdCk5XA94p
 eMOYIdIq3Z+biJoR+wQ5IRknLOtavjQBE/1l0tFxYEF7dH4jE4OLn7aCeWpSrw3lsiBw
 6Rq1Ob5uyUe3eeLKHdSRqfvnXTe8nl1v08eq1mOK0fFopmyl8BW+ZRD/eGzY6hrjPY1a
 mAi3iRo/stUVtIo2HyGAEbRf6oNfwZthSBu+HCRcFfSXbB0bTyORfAyAeqj8nAYJe0QM
 MXcP6nqNhCXs80oBE5y/K7WJ+JM6Aelm3kRr3b9zbH4brilAELy3akf8sa4wX2X7oWf7
 Adsg==
X-Gm-Message-State: AOAM5300LU1d3iKkI4AhLpBwx/whIrq5yfV55/RoUTfmq9+xEadKwmcD
 qjoH5/xS9Qz87W7mqPX609NY/kAcMNCgrKF2pWCb5w==
X-Google-Smtp-Source: ABdhPJxYMlqmtJr6n44lON3zggDCyc84sr9IzOD/y+VKuFDMECw0ky+AF4mv+pO6Ml+GrQLSEtOgdCnwcZFd1xT+MG0=
X-Received: by 2002:a17:90a:4802:: with SMTP id
 a2mr2479012pjh.25.1591228239667; 
 Wed, 03 Jun 2020 16:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200205005054.k72fuikf6rwrgfe4@google.com>
 <10e3d362-ec29-3816-88ff-8415d5c78e3b@c-s.fr>
 <20200207064210.GA13125@ubuntu-x2-xlarge-x86>
In-Reply-To: <20200207064210.GA13125@ubuntu-x2-xlarge-x86>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 3 Jun 2020 16:50:27 -0700
Message-ID: <CAKwvOd=JYqzJthPqTjRZkE+8dDKDqVig-nb7=iYDS_UEKn3+Qg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/vdso32: mark __kernel_datapage_offset as
 STV_PROTECTED
To: Nathan Chancellor <natechancellor@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, 
 Fangrui Song <maskray@google.com>, Michael Ellerman <mpe@ellerman.id.au>
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 6, 2020 at 10:42 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Wed, Feb 05, 2020 at 07:25:59AM +0100, Christophe Leroy wrote:
> >
> >
> > Le 05/02/2020 =C3=A0 01:50, Fangrui Song a =C3=A9crit :
> > > A PC-relative relocation (R_PPC_REL16_LO in this case) referencing a
> > > preemptible symbol in a -shared link is not allowed.  GNU ld's powerp=
c
> > > port is permissive and allows it [1], but lld will report an error af=
ter
> > > https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/com=
mit/?id=3Dec0895f08f99515194e9fcfe1338becf6f759d38
> >
> > Note that there is a series whose first two patches aim at dropping
> > __kernel_datapage_offset . See
> > https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D156045=
 and
> > especially patches https://patchwork.ozlabs.org/patch/1231467/ and
> > https://patchwork.ozlabs.org/patch/1231461/
> >
> > Those patches can be applied independentely of the rest.
> >
> > Christophe
>
> If that is the case, it would be nice if those could be fast tracked to
> 5.6 because as it stands now, all PowerPC builds that were working with
> ld.lld are now broken. Either that or take this patch and rebase that
> series on this one.

So do we still need Fangrui's patch or is it moot?  I'm doing a scrub
of our bug tracker and this issue is still open:
https://github.com/ClangBuiltLinux/linux/issues/851
but it looks like all of our ppc LE targets are linking with LLD just fine
https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/builds/=
169379039
though it sounds like
https://github.com/ClangBuiltLinux/linux/issues/774
may be a blocker?
Though I don't see Cristophe's
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/5f97f7c921ffc2113ad=
a0f32924e409bccc8277a.1580399657.git.christophe.leroy@c-s.fr/
in mainline or -next.  Was the series not accepted?


>
> Cheers,
> Nathan
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/20200207064210.GA13125%40ubuntu-x2-xlarge-x86.



--
Thanks,
~Nick Desaulniers
