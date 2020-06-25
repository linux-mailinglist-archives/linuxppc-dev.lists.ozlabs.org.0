Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A23209B73
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 10:41:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49stlv5JWBzDqlZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 18:41:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=movOQeaG; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49stjZ6ny7zDqkX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 18:39:30 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id t21so3518728edr.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 01:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=knPtliwcot5N5At1mGwZ9m1E+XwC5jbJSjbHxedMECg=;
 b=movOQeaGutOa6q9thMN8ZraO6v4VdyA9FM8pu+UtoU1mi8sXZ9l+nEY09G4OhYBeG8
 o2I8o/PMvdFbCBkMwCAs0AEXndwzuD/HYNOLykRsnJ4Fc58u49SmCPmlpuC+piylSthN
 Ar8b5NwI4DMivCEBUb6vfjgA5mRDuYgBiBBo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=knPtliwcot5N5At1mGwZ9m1E+XwC5jbJSjbHxedMECg=;
 b=YxqpgAivzE3fWQP/O3WSwSK257yHSYxaFbvfOeracRgXYP2y2kxRzZUhS0qZH8XbTS
 5ImFIIn9IdVDIwbi2akZ3jKpdqQ0nAmkEFVEZ0rXmSfl6spafDY7Fnh41rL0v370tRdR
 HM5mbJZFtXbqxObFPxGxs8MlN1nRJ+S/aa7TyrbX8HP1GlTvncdLkdxGizbAe0LKo/H6
 qS74kD5cKVhBo3xrH+mr1zsNcI2gj6Q217zEzfdBvjh3ey/vq1Yq17w1u6JuWu46DOTn
 dNlXeB0woSVER2k4rvbeIy0J50Ssj6Qoke5O8if/X4j8F+WRSqKV/MleYArYN9utDHGG
 YJqQ==
X-Gm-Message-State: AOAM532MlZC6toClPMA5KWIR/48n4luY53LPD6OoHDKHGrj2T59sioTJ
 5Gbpbaybfi4Z5NKiH9p+swveQ8eVB6H4skpWk7Q=
X-Google-Smtp-Source: ABdhPJyPQLpgHxd5w/+/WdO1Rr6K2x3LcdgiLXQsrbeM0k1gT2/a5db0/ecTK/5NhZr7XOPQKXjb6AnduT6s+asA66w=
X-Received: by 2002:a05:6402:459:: with SMTP id
 p25mr30314307edw.383.1593074364477; 
 Thu, 25 Jun 2020 01:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590079968.git.christophe.leroy@csgroup.eu>
 <8c593895e2cb57d232d85ce4d8c3a1aa7f0869cc.1590079968.git.christophe.leroy@csgroup.eu>
 <20200616002720.GA1307277@ubuntu-n2-xlarge-x86>
 <68503e5e-7456-b81c-e43d-27cb331a4b72@xilinx.com>
 <20200616181630.GA3403678@ubuntu-n2-xlarge-x86>
 <50fb2dd6-4e8f-a550-6eda-073beb86f2ff@xilinx.com>
 <87bllidmk4.fsf@mpe.ellerman.id.au> <878sgmdmcv.fsf@mpe.ellerman.id.au>
 <CAKwvOdnkcjLGay0jdQ77kHTmKhE56F9jvzh01XWwEE8rjbhLAA@mail.gmail.com>
 <87tuz9ci7e.fsf@mpe.ellerman.id.au>
 <20200618031622.GA195@Ryzen-9-3900X.localdomain>
 <87eeqbco82.fsf@mpe.ellerman.id.au>
In-Reply-To: <87eeqbco82.fsf@mpe.ellerman.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 25 Jun 2020 08:39:12 +0000
Message-ID: <CACPK8XdCmDgHuJ=rvHzdr9Agu=2dGNoNh_WfVH=52mchffA2=w@mail.gmail.com>
Subject: Re: [PATCH v5 01/13] powerpc: Remove Xilinx PPC405/PPC440 support
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>,
 Michal Simek <michal.simek@xilinx.com>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Jun 2020 at 11:02, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Nathan Chancellor <natechancellor@gmail.com> writes:
> >> It's kind of nuts that the zImage points to some arbitrary image
> >> depending on what's configured and the order of things in the Makefile.
> >> But I'm not sure how we make it less nuts without risking breaking
> >> people's existing setups.
> >
> > Hi Michael,
> >
> > For what it's worth, this is squared this away in terms of our CI by
> > just building and booting the uImage directly, rather than implicitly
> > using the zImage:
> >
> > https://github.com/ClangBuiltLinux/continuous-integration/pull/282
> > https://github.com/ClangBuiltLinux/boot-utils/pull/22
>
> Great.
>
> > We were only using the zImage because that is what Joel Stanley intially
> > set us up with when PowerPC 32-bit was added to our CI:
> >
> > https://github.com/ClangBuiltLinux/continuous-integration/pull/100
>
> Ah, so Joel owes us all beers then ;)

Hey, you owe me beers for finding broken machines!

This machine was picked from a vague discussion on an internal chat.
The two requirements were that it would build, and boot in qemu.

If there's a better supported 32 bit machine then we should switch the
CI over. We don't want the Clang CI to be the only user and give the
false impression that someone out there is still booting upstream
kernels on it.

> > Admittedly, we really do not have many PowerPC experts in our
> > organization so we are supporting it on a "best effort" basis, which
> > often involves using whatever knowledge is floating around or can be
> > gained from interactions such as this :) so thank you for that!
>
> No worries. I definitely don't expect you folks to invest much effort in
> powerpc, especially the old 32-bit stuff, so always happy to help debug
> things, and really appreciate the testing you do.

+1

Cheers,

Joel
