Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 350D7B1FD1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 15:45:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VH2j4sSczF3S4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 23:45:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="LWRfw0Gl"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VGkc1cLbzF5GD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 23:31:35 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id n4so15288649pgv.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=9ddMFiJu/sWzXjkexotIn9umjnAL30uzzTUAh4FEKTA=;
 b=LWRfw0GlPqtpTJMS8Lh6Tuv8esJSSzpd8D1rEOlAg3Bp085NgI1H/9zflEueRBXSuh
 NMaP+hDWL6zan6LOFFZljAeNOH9tFgC2x2/OpZciITy6ZRwgpAxIdC2uPzk0PydrnoKP
 m8tQ/OHGNKeJPSwUDMA8dQ4eqNPKSJBNqIGtvUYtcouOjTwFYdnRVCCHW0QeA3i+7HWP
 fzUCaXstUbBPtHUww/+vGG7bRbLAUHSiZvTGQhRB720lnW1DrZMDzE7QIO1qKGzcVfTi
 AnziJ3LVkMpclxhOv6qH76MhvuOa3aVcUXRFZyU3bf7iRvW7hgbWT7Paq6b7PR2E2Erf
 cU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=9ddMFiJu/sWzXjkexotIn9umjnAL30uzzTUAh4FEKTA=;
 b=gGKuKA3XUYgQeEDa7hRToC4b1RRlJuebjiJlPwCvGwB+ek5ciy55giG/oN6DOIuPew
 ne3c+wey/iDXw0j7l9fAARTn0U2jajm9hp5GICwq8bdq8imlYVE2t57bx8fae3P/O7P1
 U5JQx2x+3XK+wdlQDRecGmfWqc6UP+hYlHmB/OK2xDWrTxjX1ab5fzEdy0XbUZMtD+aV
 pC0LZV1HZ5jSyTFqziFInaFQzfRy+xWkct1wY0HL1cFxXfnYP445fQ7opvP0yZdNjGg1
 ViMB7gfLbFgN7jYoFBCQfLw2EOozlqykcCi2ztqyTjcCgz0/19W/OljUMlhPuEBJqlwy
 xK6A==
X-Gm-Message-State: APjAAAVYSjN05eYuoD/C+rQ0HDatLuJfNmFAWaE/6u+h+oRi/oetr5ie
 hqsJH6/YGa/1EGtGKwZlCIDZkw==
X-Google-Smtp-Source: APXvYqweIKhJb64CFwQ0oERfJ9vPY2uyZJ1J4wrn4HgzGDyKTvZYRQWNVsqferrXgB82OV4RKcLYsA==
X-Received: by 2002:a63:6947:: with SMTP id e68mr43615810pgc.60.1568381491040; 
 Fri, 13 Sep 2019 06:31:31 -0700 (PDT)
Received: from localhost ([49.207.57.15])
 by smtp.gmail.com with ESMTPSA id 127sm56901669pfw.6.2019.09.13.06.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 06:31:30 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 4/8] powerpc/vdso32: inline __get_datapage()
In-Reply-To: <a95c4a58-bc59-3e75-46db-414f6d0f1412@c-s.fr>
References: <cover.1566491310.git.christophe.leroy@c-s.fr>
 <194fb7bc973ef2ce43016c97dd32f2b2dcbae4e7.1566491310.git.christophe.leroy@c-s.fr>
 <87h864iiq9.fsf@santosiv.in.ibm.com>
 <a95c4a58-bc59-3e75-46db-414f6d0f1412@c-s.fr>
Date: Fri, 13 Sep 2019 19:01:28 +0530
Message-ID: <87blvonwzz.fsf@santosiv.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:

> Hi Santosh,
>
> Le 26/08/2019 =C3=A0 07:44, Santosh Sivaraj a =C3=A9crit=C2=A0:
>> Hi Christophe,
>>=20
>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>=20
>>> __get_datapage() is only a few instructions to retrieve the
>>> address of the page where the kernel stores data to the VDSO.
>>>
>>> By inlining this function into its users, a bl/blr pair and
>>> a mflr/mtlr pair is avoided, plus a few reg moves.
>>>
>>> The improvement is noticeable (about 55 nsec/call on an 8xx)
>>>
>>> vdsotest before the patch:
>>> gettimeofday:    vdso: 731 nsec/call
>>> clock-gettime-realtime-coarse:    vdso: 668 nsec/call
>>> clock-gettime-monotonic-coarse:    vdso: 745 nsec/call
>>>
>>> vdsotest after the patch:
>>> gettimeofday:    vdso: 677 nsec/call
>>> clock-gettime-realtime-coarse:    vdso: 613 nsec/call
>>> clock-gettime-monotonic-coarse:    vdso: 690 nsec/call
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>> ---
>>>   arch/powerpc/kernel/vdso32/cacheflush.S   | 10 +++++-----
>>>   arch/powerpc/kernel/vdso32/datapage.S     | 29 ++++------------------=
-------
>>>   arch/powerpc/kernel/vdso32/datapage.h     | 11 +++++++++++
>>>   arch/powerpc/kernel/vdso32/gettimeofday.S | 13 ++++++-------
>>>   4 files changed, 26 insertions(+), 37 deletions(-)
>>>   create mode 100644 arch/powerpc/kernel/vdso32/datapage.h
>>=20
>> The datapage.h file should ideally be moved under include/asm, then we c=
an use
>> the same for powerpc64 too.
>
> I have a more ambitious project indeed.
>
> Most of the VDSO code is duplicated between vdso32 and vdso64. I'm=20
> aiming at merging everything into a single source code.
>
> This means we would have to generate vdso32.so and vdso64.so out of the=20
> same source files. Any idea on how to do that ? I'm not too good at=20
> creating Makefiles. I guess we would have everything in=20
> arch/powerpc/kernel/vdso/ and would have to build the objects twice,=20
> once in arch/powerpc/kernel/vdso32/ and once in arch/powerpc/kernel/vdso6=
4/

Should we need to build the objects twice? For 64 bit config it is going to=
 be
a 64 bit build else a 32 bit build. It should suffice to get the single sou=
rce
code compile for both, maybe with macros or (!)CONFIG_PPC64 conditional
compilation. Am I missing something when you say build twice?

Thanks,
Santosh
