Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 726566E78B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:34:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1dwX31Zhz3h4X
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:34:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=linuxtx.org header.i=@linuxtx.org header.a=rsa-sha256 header.s=google header.b=aOmHCOip;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxtx.org (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=jmforbes@linuxtx.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=linuxtx.org header.i=@linuxtx.org header.a=rsa-sha256 header.s=google header.b=aOmHCOip;
	dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1dnl0Jvtz3glp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 21:28:09 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id kt6so42584883ejb.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 04:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1681903686; x=1684495686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8N99yfKqkNg/PzVluqPrnuo7/UXaVkUZ4pARZeRWAW0=;
        b=aOmHCOipVssUIFiOoZV/XYVogKVHpAzuiq8VEyTLvA7Yk95r4ytn9vTT8PpUhQnARJ
         WhOkvYx9dTRxFaR/svUxtJL6wEy7ip/MEvOVSUewRhDmjfSeiPs+EqDlwS4WxJ5pxJy2
         ++BQaECiQP+IF3B1SGcbW9EeNZEQfujRcwKyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681903686; x=1684495686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8N99yfKqkNg/PzVluqPrnuo7/UXaVkUZ4pARZeRWAW0=;
        b=U4K9O6lX4uZ4pmfeDZum58FCmOF4a2GyyjCBBlNcp7ycqK+7vrbZ2Tlgz5Pv5sRg+T
         vuQT8CwEclU/Z1GNeQ7GqXNi4Ih9s2OGrEhUs9RABzLAgG2bDQsgUn49vvwFAfx2x/mn
         nPZrhNXfu6k3qKGyh3Fc+gU2f1Mkhew7rk/hDuncGl3BSDtmUHR6EB1kLeh+brYBoGxv
         O2WiRi0WjYBrQx3kEhy9JgJkYos34501N+9hb8mU2u6X72nad+WuSG+2ikWqE4ro54Bi
         qt1Z+reBm1smErEJjgah6pPWjsqAmji9ZS1zubJWsH97caPUox8gxvDYA6jEZvbVF7Do
         T1wg==
X-Gm-Message-State: AAQBX9cJQzUJHVCeZKBBYbtbvcw14+7y/42VEOtWkZmnLFMA2J84ptIC
	ArE+bwgGRJpJi5McrJqSRrPDhst8OBnRwoHoLikVXZL/
X-Google-Smtp-Source: AKy350ZdTbwawLWFsU8rJR9UkzgUMnrT4EJxPXDJ84WiGAAmdjIk3Oh881GoB4hlgMgPm4Ii6ZvaPw==
X-Received: by 2002:a17:907:9090:b0:932:e6d5:bd7c with SMTP id ge16-20020a170907909000b00932e6d5bd7cmr13347808ejb.20.1681903685918;
        Wed, 19 Apr 2023 04:28:05 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id wg9-20020a17090705c900b0094ea48e9052sm9078618ejb.32.2023.04.19.04.28.05
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 04:28:05 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-505934ccc35so5723578a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 04:28:05 -0700 (PDT)
X-Received: by 2002:a2e:7012:0:b0:2a5:fe8f:b314 with SMTP id
 l18-20020a2e7012000000b002a5fe8fb314mr1874851ljc.5.1681903663880; Wed, 19 Apr
 2023 04:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230325060828.2662773-1-rppt@kernel.org> <20230325060828.2662773-3-rppt@kernel.org>
 <CAFxkdAr5C7ggZ+WdvDbsfmwuXujT_z_x3qcUnhnCn-WrAurvgA@mail.gmail.com>
 <ZCvQGJzdED+An8an@kernel.org> <CAFbkSA38eTA_iJ3ttBvQ8G4Rjj8qB12GxY7Z=qmZ8wm+0tZieA@mail.gmail.com>
 <ZDbp7LAHES3YFo30@arm.com> <20230418150557.ea8c87c96ec64c899c88ab08@linux-foundation.org>
 <ZD/K+Mof/Dx5yzjQ@arm.com>
In-Reply-To: <ZD/K+Mof/Dx5yzjQ@arm.com>
From: Justin Forbes <jforbes@fedoraproject.org>
Date: Wed, 19 Apr 2023 06:27:31 -0500
X-Gmail-Original-Message-ID: <CAFbkSA3yn_4Monrnk2u3CzfJ934Hy15rjAJ85AdFU40nV7KTkQ@mail.gmail.com>
Message-ID: <CAFbkSA3yn_4Monrnk2u3CzfJ934Hy15rjAJ85AdFU40nV7KTkQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] arm64: drop ranges in definition of ARCH_FORCE_MAX_ORDER
To: Catalin Marinas <catalin.marinas@arm.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 19, 2023 at 6:12=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Tue, Apr 18, 2023 at 03:05:57PM -0700, Andrew Morton wrote:
> > On Wed, 12 Apr 2023 18:27:08 +0100 Catalin Marinas <catalin.marinas@arm=
.com> wrote:
> > > > It sounds nice in theory. In practice. EXPERT hides too much. When =
you
> > > > flip expert, you expose over a 175ish new config options which are
> > > > hidden behind EXPERT.  You don't have to know what you are doing ju=
st
> > > > with the MAX_ORDER, but a whole bunch more as well.  If everyone we=
re
> > > > already running 10, this might be less of a problem. At least Fedor=
a
> > > > and RHEL are running 13 for 4K pages on aarch64. This was not some
> > > > accidental choice, we had to carry a patch to even allow it for a
> > > > while.  If this does go in as is, we will likely just carry a patch=
 to
> > > > remove the "if EXPERT", but that is a bit of a disservice to users =
who
> > > > might be trying to debug something else upstream, bisecting upstrea=
m
> > > > kernels or testing a patch.  In those cases, people tend to use
> > > > pristine upstream sources without distro patches to verify, and the=
y
> > > > tend to use their existing configs. With this change, their MAX_ORD=
ER
> > > > will drop to 10 from 13 silently.   That can look like a different
> > > > issue enough to ruin a bisect or have them give bad feedback on a
> > > > patch because it introduces a "regression" which is not a regressio=
n
> > > > at all, but a config change they couldn't see.
> > >
> > > If we remove EXPERT (as prior to this patch), I'd rather keep the ran=
ges
> > > and avoid having to explain to people why some random MAX_ORDER doesn=
't
> > > build (keeping the range would also make sense for randconfig, not su=
re
> > > we got to any conclusion there).
> >
> > Well this doesn't seem to have got anywhere.  I think I'll send the
> > patchset into Linus for the next merge window as-is.  Please let's take
> > a look at this Kconfig presentation issue during the following -rc
> > cycle.
>
> That's fine by me. I have a slight preference to drop EXPERT and keep
> the ranges in, especially if it affects current distro kernels. Debian
> seems to enable EXPERT already in their arm64 kernel config but I'm not
> sure about the Fedora or other distro kernels. If they don't, we can
> fix/revert this Kconfig entry once the merging window is closed.

Fedora and RHEL do not enable EXPERT already.

Justin
