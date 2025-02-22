Return-Path: <linuxppc-dev+bounces-6386-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D24E4A40430
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2025 01:34:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z07Kg0G0mz30V7;
	Sat, 22 Feb 2025 11:34:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740184454;
	cv=none; b=gn5rKb2JHQ/9FmIpATbVxOPGzecDGl0Te+1dg1z835iIm4soybRNnPe27mPeZAR4KT8dAqnftrf+GXn5gUjra7yyqO1BBfIpS/vLFt0ZTJx3U3xIsPgMionytCUC1SzDaViGuMBao253g1iG5DXuOoyGc2fzAUf2G1Ag/Nm0nMAsz4j5jCMXxsYS+kKzbfiY49uBOxZ1KONV9A8Hat1taOraBShTbVprainIbmMWnZXtVJfC/95+/ahbVccCII4iBojEeHq0afscBb/zjwl2nMIa2+FLZlbVhkCz8cgf5rH8vMiEs43q+vVb2eqSn7x4iPkAgfM5tAEH69eVKr92VA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740184454; c=relaxed/relaxed;
	bh=vwm1CmURc5ve7fRU7CIVjr3XJe8XTIamKjt5b8I2oxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dzvw6kOdw6Ztq5S0wXdWcyypaj6xwWdtgFWIp/oXcFQaslKNvmcx7XiP/8yroVteir9gLzsKEifojQD6TsBIYVES/1hlDH0u/EaYn7Kqwo27jSI/dq/ctjfRFT5iNLZrT2O3sIa4eHn2pXWihHkJIPZclrzNFk3hrOh2DfgSaJP7FZRZns5qR6kOnGOPf+C5BD6fqPhrALwWqwWO6HYyrHwRj3dnZNqNPTN1rEL+Qz3hw5TE1X+dYvNVTlfXVunbIZtitjzgSwdgc+E/FgRzcmx/H4fVhj4GmqskHTLxLg9m4hp/Bs+Ca19Wk8YR9PMqTv5aLEFyuXy3EqYEM/xJ4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=QaoiYUHm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org) smtp.mailfrom=paul-moore.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=QaoiYUHm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z07Kd6MvVz2yRD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2025 11:34:12 +1100 (AEDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-6f666c94285so24600237b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2025 16:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1740184450; x=1740789250; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwm1CmURc5ve7fRU7CIVjr3XJe8XTIamKjt5b8I2oxA=;
        b=QaoiYUHmq2jFN59m7jQpf1CZ6IqvcW+zuUMjC4B7XHGD3C5feBiM09rojBbnkQHZXY
         9oxQNkeQjgGKnaMWV8fR5jpZrrxo8Iup20JqpY1eVtpc3NgTJioRiKhtE0NmcXzqhmj3
         3XDe9REWlimQ9P+XPJizxmiunJHQYl/fk2g9O1HdtrCrW8Xe5UqvhvQ26FVQIp/zmYeg
         Ju+Q43/VdUzHaU8rMWX0r4wVDlVioHD/IPrSmEy2HXYTr0sY1NjCiGTfZP7zI/rF7hpZ
         hvMLMlbqm04hsx3jrjSCbmaAdKlfr/+XZPN02zGV/E8/NgzV6pCmEYqpLIV4u2J4MWe1
         cbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740184450; x=1740789250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwm1CmURc5ve7fRU7CIVjr3XJe8XTIamKjt5b8I2oxA=;
        b=B1xgsQNMpo1ZtigSDJ950hqYTADuFfsugHuBHzQl5S4acFtW8eCJtdFuCM97nojqfq
         4O9c6SjqDYU6BrAVUGG9evhWNUTT1mADKYZsisekkNMDEVkNB/swoWcoJy3Nu+f3C0sZ
         WfemsKrnnfVvGoSa8rbpAxPYH0hLrDdnWXlpcwMFR7nCRzT306Pwj2aHUsMspxLpJ63x
         0Bq/67BuCD285jWvIYWQoBYPNSUux3dZuD9YMNk0+MTA7lxPfv9GklXv1tWhGm/eMcO+
         51L3YEFiDgRAOPWPIQSGMaeMkLTsbmVClmuOV4Lf5hk3tovLXezXV7ArWqXD8GuqB7Cg
         lHgA==
X-Forwarded-Encrypted: i=1; AJvYcCUKFbt6bFBYuyOAmtK5+Ir1nFvD1tXmcJI46aZ6/xdPEIysT6uiGul1EN5T1nV1Yk76Lz1SaSEzs9t+Neg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyhPXl18C1o68zSPzEsjg4hsT0RAJgUR/2cWBSVXQE8oYyTje6W
	WVLs25zfpW4933ynExNGuMQZl5Fp8dYmWLw1r5VqEy7oNoIJTVdQhL2RUO/wqSLmnxFA20ak9L+
	YLvTkdg/uqF86zUGq76QCUjdPvNY9zaRbk898
X-Gm-Gg: ASbGncvnKvEGAiu5J9N/ucsSBuQPncryVIR0fBnapzkkLurSotlG5kkXM8mFZs9vfLX
	bxUX1apGSFqHwCFhvgYuL0ayM4R9QPbKfOfz8mdCsK+2yOE1FIqAdJmDzIz5Dnnikz+BW5YHTTu
	7ZHpPYFf8=
X-Google-Smtp-Source: AGHT+IHU8mqrXQveakYlLhZ7AQnDt8Huldya+naR0jPDiYuZo2FksnUyR3yBLKwefOB052PduAKRpiO/vKqO0ObiYCs=
X-Received: by 2002:a05:690c:3506:b0:6f6:c937:2cf4 with SMTP id
 00721157ae682-6fbcc81835dmr37934927b3.23.1740184450404; Fri, 21 Feb 2025
 16:34:10 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250211-xattrat-syscall-v3-1-a07d15f898b2@kernel.org> <20250221.ahB8jei2Chie@digikod.net>
In-Reply-To: <20250221.ahB8jei2Chie@digikod.net>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 21 Feb 2025 19:33:59 -0500
X-Gm-Features: AWEUYZkJvdf7eQZPTJrwhKnqZP-Y8wnVSUpipQ3Me6WvrrB1wQej040Y9lsHrww
Message-ID: <CAHC9VhSnP=j_T30ctVmzQ8TwhD6YFcrWhLbqa_oG3WSAPUPOaA@mail.gmail.com>
Subject: Re: [PATCH v3] fs: introduce getfsxattrat and setfsxattrat syscalls
To: Andrey Albershteyn <aalbersh@redhat.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 21, 2025 at 10:08=E2=80=AFAM Micka=C3=ABl Sala=C3=BCn <mic@digi=
kod.net> wrote:
>
> It looks security checks are missing.  With IOCTL commands, file
> permissions are checked at open time, but with these syscalls the path
> is only resolved but no specific access seems to be checked (except
> inode_owner_or_capable via vfs_fileattr_set).

Thanks for reviewing the patch and catching this Micka=C3=ABl.  I agree
with the hooks identified and their placement; it should be fairly
straightforward with only a few lines added in each case.

--=20
paul-moore.com

