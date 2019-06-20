Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D26954CD9C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 14:21:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45V1CR4hPFzDrJp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 22:21:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="So/APhDB"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45V1820BNSzDrFj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 22:18:56 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id f21so1516168pgi.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 05:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=YoTiXuUhP7MILD5fnaoAlkgFg2nR8TYJrJEF6s4RZXw=;
 b=So/APhDByNH5ZTnsyLPXFkassmIa6Ov5z4dUXPiq3BcI+/tBJroH1OYfD+D/LPx2Kz
 Z2iebLBARMIonYTJViKAMNqX6T9DWFpGX4f7lEU40XE6jdwOBAKSb7px2/VVG1NdMZUV
 DGEi2tUgpJk8ahufrxePUMdf1fVMSMqTEhNaXDKRGi+y/W5OIH7OvaZjkf2vDypfXqxI
 TD2ewroIsXlnf4E6gOQtkllshj947AFSuqcZtKArd6jeI++QOwML2r0B7G5wvAqJD4UD
 xWsias8CY08OAi7pp0ZZm2YUI8zBDfNLVjsK8N1PIHm6HWAHq05Ev5F7HsEKLa/T1vLU
 uiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=YoTiXuUhP7MILD5fnaoAlkgFg2nR8TYJrJEF6s4RZXw=;
 b=kOxERck77YRp6VmO0b1NnUFRqETwSyENhxTZUlqFdMWjkeaagYtJ2XH4WDHODdnxXf
 opRdch9YMgLWwZHPzQZ3w5gEgxKJZIAqkGAQeVTWE8Y/kchldCC6n7ke/XuKVb4ltlK3
 tYtyZE83DHCVNMsbF6skOhvM9n63XJJwt8OFyXQPq+hzTUggIgClwIOcRzkFmmRNwyIC
 /vW7ZwaEWW3jn1vuZ5cbMsSU85NgIbnZwGiWSf2sBG3x8eC+mHtYi5+m6Z7bs8iO+2zT
 x5ZOSPEFRxJIVvr8faViaed5mz9tr0lHaEEVeyfWajBg7mph6loINIb0LlPX0HIp2FLF
 ezFw==
X-Gm-Message-State: APjAAAUC6tvuC+cgMaToa545ZV2LG7QIO2d+QeviYy6L16kA3SMvNezI
 4SE36OBNDbhNN3l4jZTv90Q=
X-Google-Smtp-Source: APXvYqx1eSkhbrnX9j+XXPf1ijevNCfi95aQ4yuFnnSZCNNzh3FuAkFtzgkNfUYJBeEqzMwN6uhd9g==
X-Received: by 2002:a62:e815:: with SMTP id c21mr90025668pfi.244.1561033133807; 
 Thu, 20 Jun 2019 05:18:53 -0700 (PDT)
Received: from localhost ([203.220.63.126])
 by smtp.gmail.com with ESMTPSA id i133sm24389358pfe.75.2019.06.20.05.18.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 05:18:52 -0700 (PDT)
Date: Thu, 20 Jun 2019 22:18:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 16/16] mm: pass get_user_pages_fast iterator arguments in
 a structure
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-17-hch@lst.de>
 <1560300464.nijubslu3h.astroid@bobo.none>
 <CAHk-=wjSo+TzkvYnAqrp=eFgzzc058DhSMTPr4-2quZTbGLfnw@mail.gmail.com>
In-Reply-To: <CAHk-=wjSo+TzkvYnAqrp=eFgzzc058DhSMTPr4-2quZTbGLfnw@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1561032202.0qfct43s2c.astroid@bobo.none>
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
Cc: Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-sh list <linux-sh@vger.kernel.org>, James Hogan <jhogan@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Linux-MM <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>, Paul Burton <paul.burton@mips.com>,
 Andrey Konovalov <andreyknvl@google.com>, sparclinux@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds's on June 12, 2019 11:09 am:
> On Tue, Jun 11, 2019 at 2:55 PM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> What does this do for performance? I've found this pattern can be
>> bad for store aliasing detection.
>=20
> I wouldn't expect it to be noticeable, and the lack of argument
> reloading etc should make up for it. Plus inlining makes it a
> non-issue when that happens.

Maybe in isolation. Just seems like a strange pattern to sprinkle
around randomly, I wouldn't like it to proliferate.

I understand in some cases where a big set of parameters or
basically state gets sent around through a lot of interfaces.
Within one file to make lines a bit shorter or save a few bytes
isn't such a strong case.

>=20
> But I guess we could also at least look at using "restrict", if that
> ends up helping. Unlike the completely bogus type-based aliasing rules
> (that we disable because I think the C people were on some bad bad
> drugs when they came up with them), restricted pointers are a real
> thing that makes sense.
>=20
> That said, we haven't traditionally used it, and I don't know how much
> it helps gcc. Maybe gcc ignores it entirely? S

Ahh, it's not compiler store alias analysis I'm talking about, but
processor (but you raise an interesting point about compiler too,
would be nice if we could improve that in general).

The processor aliasing problem happens because the struct will
be initialised with stores using one base register (e.g., stack
register), and then same memory is loaded using a different
register (e.g., parameter register). Processor's static heuristics
for determining a load doesn't alias with an earlier store doesn't
do so well in that case.

Just about everywhere I've seen those kind of misspeculation and
flushes in the kernel has been this pattern, so I'm wary of it in
performance critical code.

Thanks,
Nick
=
