Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3999DAC84E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 19:44:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Qhd13dtYzDqdm
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Sep 2019 03:44:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=amacapital.net
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=luto@amacapital.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.b="Ahrc72PG"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Qhb26SPCzDqT9
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Sep 2019 03:42:32 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id w11so4684794plp.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Sep 2019 10:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zOxFxXxkeAXBLA4hmpQx5p2K1SwU8yRrMWsF/vzne4c=;
 b=Ahrc72PGzKNYWoLbwpqpkb4sblxxhLeem6jebRPHiC48yikyu8YdaM5Oje1cRKpGrE
 B1aFxjVmVluxNvScD9M4WSgd+3044EW5n5U/PFuuVmQG4Hbymvgt22zE94vbhcs9R725
 YmVhBFQvI6AY2jzBjl65iE1N91bXW5n21nVFyaplmtDp+2SiGPjY7BdJbCgTW6FOdyps
 WzpWqeuBT7oibyk4x8aGykU8dzYGBQ3SiApw6VGFkEO8SPi7/aZ892rQXq+Pb+3b5ZeC
 PbzZzd392k2TpO4uq92p9v5vThdZeJX5HF5wKk1rRbCSaXdBoZUNJaEVn/U3I0P9Ilwr
 6irw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zOxFxXxkeAXBLA4hmpQx5p2K1SwU8yRrMWsF/vzne4c=;
 b=l4s6Prrc6iaIkmsj5GiuqICC7HRafJrwOcTQvtUDwNTTRHOyfc+zcmtT5Cm1Gu6caw
 nZXuhSfE0oQirM549zZ8R3p3oZfTzHmP2/zZOYVCr086KBYYS+QzVdBuhkLppgHfxWGW
 Kg/CQL2fEbBqBUCqiqpsNg2IIalLU/VHIDZ9Q6POoYBfYjeI8AUwHsgRzbQbt4lsCQZP
 5bcYLwCRBVX1oBve3Ny3ZP9EJIdfK0O1WpLcmKie7nRp/ouh1fnEBtV0V5wleV9OZ0XG
 vKlPl1SXkIaSX0Ce4JiPEt8HatI5p/t0o6cpASGt4tkP+3iPL07Ua/uJMVRzTjy9TWTi
 d3qg==
X-Gm-Message-State: APjAAAUOtRaLHZ/zetOXuC1WF+Ji3z3FC222k/snxiBEPgO5QOEdf+LG
 XA7aYpX5u1ynz17ikFKNN1a2Fw==
X-Google-Smtp-Source: APXvYqy9Whfn7uTg3BOXXtKo+Xb13mslF8Px0gcix7JC2yC4OfYP4K4dJzWw76A+9fC6aflAwbUnzg==
X-Received: by 2002:a17:902:421:: with SMTP id
 30mr16087280ple.105.1567878146356; 
 Sat, 07 Sep 2019 10:42:26 -0700 (PDT)
Received: from ?IPv6:2600:100f:b121:da37:bc66:d4de:83c7:e0cd?
 ([2600:100f:b121:da37:bc66:d4de:83c7:e0cd])
 by smtp.gmail.com with ESMTPSA id h11sm8785567pgv.5.2019.09.07.10.42.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 Sep 2019 10:42:25 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v12 11/12] open: openat2(2) syscall
From: Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <CAHk-=whZx97Nm-gUK0ppofj2RA2LLz2vmaDUTKSSV-+yYB9q_Q@mail.gmail.com>
Date: Sat, 7 Sep 2019 10:42:23 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <C81D6D29-F6BF-48E6-A15E-3ABCB2C992E5@amacapital.net>
References: <20190904201933.10736-1-cyphar@cyphar.com>
 <20190904201933.10736-12-cyphar@cyphar.com>
 <7236f382d72130f2afbbe8940e72cc67e5c6dce0.camel@kernel.org>
 <CAHk-=whZx97Nm-gUK0ppofj2RA2LLz2vmaDUTKSSV-+yYB9q_Q@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>,
 Aleksa Sarai <asarai@suse.de>, Jiri Olsa <jolsa@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Namhyung Kim <namhyung@kernel.org>, David Drysdale <drysdale@google.com>,
 Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, linux-parisc@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux API <linux-api@vger.kernel.org>, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, alpha <linux-alpha@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Linux Containers <containers@lists.linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Sep 7, 2019, at 9:58 AM, Linus Torvalds <torvalds@linux-foundation.org>=
 wrote:
>=20
>> On Sat, Sep 7, 2019 at 5:40 AM Jeff Layton <jlayton@kernel.org> wrote:
>>=20
>> After thinking about this a bit, I wonder if we might be better served
>> with a new set of OA2_* flags instead of repurposing the O_* flags?
>=20
> I'd hate to have yet _another_ set of translation functions, and
> another chance of people just getting it wrong either in user space or
> the kernel.
>=20
> So no. Let's not make another set of flags that has no sane way to
> have type-safety to avoid more confusion.
>=20
> The new flags that _only_ work with openat2() might be named with a
> prefix/suffix to mark that, but I'm not sure it's a huge deal.
>=20
>           =20

I agree with the philosophy, but I think it doesn=E2=80=99t apply in this ca=
se.  Here are the flags:

O_RDONLY, O_WRONLY, O_RDWR: not even a proper bitmask. The kernel already ha=
s the FMODE_ bits to make this make sense. How about we make the openat2 per=
mission bits consistent with the internal representation and let the O_ perm=
ission bits remain as an awful translation.  The kernel already translates l=
ike this, and it already sucks.

O_CREAT, O_TMPFILE, O_NOCTTY, O_TRUNC: not modes on the fd at all.  These af=
fect the meaning of open().  Heck, for openat2, NOCTTY should be this defaul=
t.

O_EXCL: hopelessly overloaded.

O_APPEND, O_DIRECT, O_SYNC, O_DSYNC, O_LARGEFILE, O_NOATIME, O_PATH, O_NONBL=
OCK: genuine mode bits

O_CLOEXEC: special because it affects the fd, not the struct file.

Linus, you rejected resolveat() because you wanted a *nice* API that people w=
ould use and that might even be adopted by other OSes. Let=E2=80=99s please n=
ot make openat2() be a giant pile of crap in the name of consistency with op=
en().  open(), frankly, is horrible.

