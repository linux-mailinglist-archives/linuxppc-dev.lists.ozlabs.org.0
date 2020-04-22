Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EEC1B390A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 09:35:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496XKC4rN6zDqxQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 17:35:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hdIN63Os; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496XHC6HZtzDqwn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 17:33:41 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id g6so660457pgs.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 00:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=oGcRKkgkVr4JcI1ibH9gwtLZOypiwzpP4gH9dSaU7iQ=;
 b=hdIN63OsFGxhd5ipGu4ysZTGX8oyPNhB+PjKGiRBkP0qpRbvyu+72iyJRPYJ83m3mL
 zL/BRO1HfL5WuAHmFV6ajhMbSCup8Q/39Am9KyTc5XkhCMCTzmgbrSGqQj/+RBtCxvn0
 glrFXDGBaM1Fhpd3VeIquTcTOTmUkQKDB+Wu7ftzfczaUriHEHRU6PHbgSfbqwuapwhy
 yMZ5Hi8QcV1p+KlumN1chA4AzMzO6R3aTrFrrJECb+blzfTUXUWFedFdHAkYK3TNjinA
 IoAXJzILlpepKL/e84ywiJKQ71QcP6tdYKdKObS+DQ/Swnm7/7B+38zIrHmze4+4KQK0
 4qyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=oGcRKkgkVr4JcI1ibH9gwtLZOypiwzpP4gH9dSaU7iQ=;
 b=qHRfuu7dGhO+zPbL+/DrQJ+lk0FAyc6/eBZsYlfRzlcsccqEd250oSDcHUnWgRkfjq
 E4Hg5L7zwfqzyLjo+ApVl/kGLbagA6RPrxvEiccANLuphsrQ2TMS6QNL4ouTw9yB6zJU
 jPkqdNDY9M2E6rtaxt1DwpksSagmsBqJ9guAFBC0t31OilFldne2CN+TliwjfZ4qXt5X
 xTNfcj9F3Uc9pn3jHFHD9rN6fzPP1/QlpIfQ6USmdolGbzA/7DsPm/APRvgLDMQhtwX/
 ps9B7Eh8cqM1lI/mHrvz3irOo2G3F0yMhqN3JyRrQHYSjEwnfAVI18Edy5I2mpNJr7WC
 Qltw==
X-Gm-Message-State: AGi0PubJv4rKgxKMt3vdGn+avhsHaL8RON/R98GqVWG+F7WdjOf7p81o
 AWkKkFoV3KLIOC8q21va2wCDxgZ2
X-Google-Smtp-Source: APiQypIn1uMRP3SnZ423g+QJntQbuuVv7pdNNC5Eob68blIs9swJ39ifzY1cOI/a2YG9MS0NijIB+g==
X-Received: by 2002:a62:25c6:: with SMTP id l189mr26325614pfl.28.1587540818374; 
 Wed, 22 Apr 2020 00:33:38 -0700 (PDT)
Received: from localhost ([203.185.249.170])
 by smtp.gmail.com with ESMTPSA id d18sm4563910pfq.177.2020.04.22.00.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 00:33:37 -0700 (PDT)
Date: Wed, 22 Apr 2020 17:31:07 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Re: Powerpc Linux 'scv' system call ABI proposal take 2
To: Florian Weimer <fw@deneb.enyo.de>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <c2612908-67f7-cceb-d121-700dea096016@linaro.org>
 <20200416153756.GU11469@brightrain.aerifal.cx>
 <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
 <20200416175932.GZ11469@brightrain.aerifal.cx>
 <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
 <20200416183151.GA11469@brightrain.aerifal.cx>
 <1587344003.daumxvs1kh.astroid@bobo.none>
 <b77fa2dc769d42e1a3e68f5edf90d250@AcuMS.aculab.com>
 <20200421143941.GJ11469@brightrain.aerifal.cx>
 <960127e0-57a0-55b4-f309-ae0a675c7756@linaro.org>
 <1587536988.ivnp421w2w.astroid@bobo.none> <874ktcng8z.fsf@mid.deneb.enyo.de>
In-Reply-To: <874ktcng8z.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
Message-Id: <1587540390.vde84z8edw.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Rich Felker <dalias@libc.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 musl@lists.openwall.com, David Laight <David.Laight@ACULAB.COM>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-dev@lists.llvm.org" <libc-dev@lists.llvm.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Florian Weimer's message of April 22, 2020 5:15 pm:
> * Nicholas Piggin:
>=20
>> Another option would be to use a different signal. I don't see that any=20
>> are more suitable.
>=20
> SIGSYS comes to my mind.  But I don't know how exclusively it is
> associated with seccomp these days.

SIGSYS is entirely seccomp now. There looks like a single obscure MIPS=20
user of it in Linux that's not seccomp, but it would be entirely new for=20
powerpc (or any of the common platforms, arm, x86 etc).

So I would be disinclined to use SIGSYS unless there are no other better=20
signal types, and we don't want to use SIGILL for some good reason -- is=20
there a good reason to add complexity for userspace by differentiating=20
these two situations?

Thanks,
Nick
