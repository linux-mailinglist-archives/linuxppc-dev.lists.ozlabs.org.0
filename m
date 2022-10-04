Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1145F3C1D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 06:32:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhPv824rWz3c2L
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:32:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=POh0p9Vf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=POh0p9Vf;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhPt86c6Hz2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 15:31:43 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id n7so11678546plp.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Oct 2022 21:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=eLXvoktMuKWZTHa5Ml0l03diCBrnXS0M4yz3u2C5Q5o=;
        b=POh0p9VfUL3hst2Z7p5iCKi5YB44u0sdAaPV/J4e5V97MMG7J/6zmXTO8/A1MAwwtU
         Jrzr3dALVlXSLWu1Ezsj++DJbdUONdl7ZcYQXQD9K81lrcXRQB9jCHS4pUVj19JQvJg+
         PwT1RI3lTjgEpPT9Pp9gUg4rQq8tHzV/3WZFAO/Vbz2Y2ynuddA1HhlYmZrRnvziG43k
         RnFOUA5J9CKQXmBnCD7GlikG+yLoXfMtGA7uWSVGN2USGIPY11TR7WYD1ZFjBCdCGH81
         0LxIXqr5ICaPMLSQWakuSbEYtXZf9VcrOJ7mQNOHDq2lSMdL4xoLnd4Wr8fd9yxYHlMy
         fNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=eLXvoktMuKWZTHa5Ml0l03diCBrnXS0M4yz3u2C5Q5o=;
        b=NF6p9IrTEipcrMSZgnB2o5d05nEIqfrFrAmCmfETCkDa4WdALnwaWXRIWJ5fysR+Rm
         ZMzuK0jFKVO8upSdPSL7HkcFkPC/hzCrxcO+ZmKWuVGNt5TNTveurRNkLfnsRWC5GND9
         /hsVGZJX6M+i/OvpjjrxIgyOOqPHoJNmUpixqGr5JUDN46paz+Ifqh1h8RW/HG+/cvcI
         bCZg8QJANpvOtvFuTAYb1H93wXEl+5G30zIYm+DuvZxrO7XBuLXyiwbekPfwc2l0k7bg
         UtLt5L6F+gOUezfN2VEpaklkiDaAbIHGitPr+6x8C78Z+tZfjULl0qwk1JUuKDBA8Prv
         8AXg==
X-Gm-Message-State: ACrzQf1LBop0Tk+4qEMJ9RCqqFpFrkLZvPHrVsEfOCwDZd860qEpA7Jb
	V3EFsvB3cAhTRtZtRSs7nJA=
X-Google-Smtp-Source: AMsMyM6MbMDwGXVw8IMQAky8UGIgj+1E3fuCS4Xi/0ePdFbIhySG3eruzcRhnrYHRsRjqrhhUZn2pg==
X-Received: by 2002:a17:902:b194:b0:17a:ccae:4ceb with SMTP id s20-20020a170902b19400b0017accae4cebmr25807542plr.36.1664857900245;
        Mon, 03 Oct 2022 21:31:40 -0700 (PDT)
Received: from localhost (123-243-1-173.tpgi.com.au. [123.243.1.173])
        by smtp.gmail.com with ESMTPSA id o2-20020a625a02000000b0054cd16c9f6bsm8188112pfb.200.2022.10.03.21.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 21:31:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Oct 2022 14:31:35 +1000
Message-Id: <CNCUVAN99A8Y.8TAMANLUUGOQ@bobo>
Subject: Re: [RFC PATCH 2/2] powerpc: nop trap instruction after WARN_ONCE
 fires
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220923154143.1115645-1-npiggin@gmail.com>
 <20220923154143.1115645-2-npiggin@gmail.com>
 <264df1e7-ad54-0fa3-c658-dff76dec8a97@csgroup.eu>
In-Reply-To: <264df1e7-ad54-0fa3-c658-dff76dec8a97@csgroup.eu>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Sep 24, 2022 at 2:47 AM AEST, Christophe Leroy wrote:
>
>
> Le 23/09/2022 =C3=A0 17:41, Nicholas Piggin a =C3=A9crit=C2=A0:
> > WARN_ONCE and similar are often used in frequently executed code, and
> > should not crash the system. The program check interrupt caused by
> > WARN_ON_ONCE can be a significant overhead even when nothing is being
> > printed. This can cause performance to become unacceptable, having the
> > same effective impact to the user as a BUG_ON().
> >=20
> > Avoid this overhead by patching the trap with a nop instruction after a
> > "once" trap fires. Conditional warnings that return a result must have
> > equivalent compare and branch instructions after the trap, so when it i=
s
> > nopped the statement will behave the same way. It's possible the asm
> > goto should be removed entirely and this comparison just done in C now.
>
> You mean, just like PPC32 ? (Since db87a7199229 ("powerpc/bug: Remove=20
> specific powerpc BUG_ON() and WARN_ON() on PPC32"))
>
> But I'm having hard time with your change.
>
> You change only WARN_ON()
> But WARN_ON_ONCE() calls __WARN_FLAGS()
> And WARN_ONCE() calls WARN() via DO_ONCE_LITE_IF()
>
> So I don't see any ..._ONCE something going with WARN_ON().
>
> Am I missing something ?

Hmm, no I must have missed something. I guess it is the EMIT_WARN_ENTRY
in asm which is the main problem I've seen. Although we could remove the
DO_ONCE_LITE_IF code generation from our WARN_ON_ONCE as well if we did
this patching.

Thanks,
Nick

