Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BA0AC8BB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 20:17:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46QjM61wFrzDqfK
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Sep 2019 04:17:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=amacapital.net
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=luto@amacapital.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.b="gPB2S/s2"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46QjJj4ySyzDqWK
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Sep 2019 04:15:15 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id 205so6631590pfw.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Sep 2019 11:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yCXO2IUW/xP5rGitFpbGKrkQxCFizP24AMzmcKYJo+k=;
 b=gPB2S/s21fOdrhZkZvzaMRRbkTHlbc79vLkQ8L7Cpmmu8hvbAG6eoC0Dm32QXRGYMY
 +1LPES8i+LJBkfY/p1yzpRzMMv2odDchTO0YHOkxwFiie7OsEOHDwtOH8zJJ6F9AZyk5
 MkZFVhvuxPxeMIKfq+G9obcmbfsQBob0Nc70jrYQVbX0W8tNU0vMgyrejbOLHj/PJBII
 8jO1EQn6kWKOgkBib76U4yxHBzWI3KaSO/lLhJIPi5x1WrjQ3kHOZysmKhg2Dv2MsCh4
 N/OxZH40a7P6xhJ/lAgfa+dSsRZSJmy+02UKql6Xb3VKWtRKJq/2ht+J5tBxXcxSYFTB
 1GhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yCXO2IUW/xP5rGitFpbGKrkQxCFizP24AMzmcKYJo+k=;
 b=ssnSwbLsMVGQ/VIQYRwS9YvW3lhv66UZ23x+G+G2dlAl74wbCzqFPztT9FfTg8CMR8
 gj/HVW+V5h0s0WC4+XLdv2qsqHJl3Ed5FI3FeNVaLhQtjX1ClUjxE9ua6YkDsj2SEN1a
 S0xYVyPQg36xsQre+qJqJoqAzqVBbiCXqPBJtd+S+OiM3/rOUv+Ft6anRyR1erY4FhT3
 SoVX6+N3lXNiq3RKn0DdKDsC3RmcPtfdKB4jWOhB6+jXruyggSODxSo+WOrlvapBLLdK
 /EAxMgIQ5Sp213S6X5imVRZKlT3Y0TzOvT8CgEM84SCCiZVUKQDQQUEvxc/WHr9Wn7eo
 ji4Q==
X-Gm-Message-State: APjAAAWIySu0rh41PSLsOk7fDGXaPCf6+JAv4fQWi/4zYtd5d/35ZvPe
 BuV2p8ywbGXalhglNBuwyB3T0g==
X-Google-Smtp-Source: APXvYqwtLHTxDBZPI4nj5nW8UmB/sRAqU0rGQe5gnm9Rg561yB9Atb14l/OoZSzCcZVB4Qk4BIIw8Q==
X-Received: by 2002:aa7:8b09:: with SMTP id f9mr13154710pfd.23.1567880111917; 
 Sat, 07 Sep 2019 11:15:11 -0700 (PDT)
Received: from ?IPv6:2600:100f:b121:da37:bc66:d4de:83c7:e0cd?
 ([2600:100f:b121:da37:bc66:d4de:83c7:e0cd])
 by smtp.gmail.com with ESMTPSA id x5sm10495873pfn.149.2019.09.07.11.15.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 Sep 2019 11:15:11 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v12 11/12] open: openat2(2) syscall
From: Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <CAHk-=whe90Ec_RRrMRLE0=bJOHNS9YmVwcytVxmrfK3oCuZF6A@mail.gmail.com>
Date: Sat, 7 Sep 2019 11:15:09 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <EE7399FD-7587-407B-B628-1D92CFD6B120@amacapital.net>
References: <20190904201933.10736-1-cyphar@cyphar.com>
 <20190904201933.10736-12-cyphar@cyphar.com>
 <7236f382d72130f2afbbe8940e72cc67e5c6dce0.camel@kernel.org>
 <CAHk-=whZx97Nm-gUK0ppofj2RA2LLz2vmaDUTKSSV-+yYB9q_Q@mail.gmail.com>
 <C81D6D29-F6BF-48E6-A15E-3ABCB2C992E5@amacapital.net>
 <CAHk-=whe90Ec_RRrMRLE0=bJOHNS9YmVwcytVxmrfK3oCuZF6A@mail.gmail.com>
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


> On Sep 7, 2019, at 10:45 AM, Linus Torvalds <torvalds@linux-foundation.org=
> wrote:
>=20
>> On Sat, Sep 7, 2019 at 10:42 AM Andy Lutomirski <luto@amacapital.net> wro=
te:
>>=20
>> Linus, you rejected resolveat() because you wanted a *nice* API
>=20
> No. I rejected resoveat() because it was a completely broken garbage
> API that couldn't do even basic stuff right (like O_CREAT).
>=20
> We have a ton of flag space in the new openat2() model, we might as
> well leave the old flags alone that people are (a) used to and (b) we
> have code to support _anyway_.
>=20
> Making up a new flag namespace is only going to cause us - and users -
> more work, and more confusion. For no actual advantage. It's not going
> to be "cleaner". It's just going to be worse.
>=20
>=20

If we keep all the flag bits in the same mask with the same values, then we=E2=
=80=99re stuck with O_RDONLY=3D0 and everything that implies.  We=E2=80=99ll=
 have UPGRADE_READ that works differently from the missing plain-old-READ bi=
t, and we can=E2=80=99t express execute-only-no-read-or-write. This sucks.

Can we at least split the permission bits into their own mask and make bits 0=
 and 1 illegal in the main set of flags in openat2?

There=E2=80=99s another thread going on right now about adding a bit along t=
he lines of =E2=80=9CMAYEXEC=E2=80=9D, and one of the conclusions was that i=
t should wait for openat2 so that it can have same semantics. If we=E2=80=99=
re stuck with O_RDONLY and friends, then MAYEXEC is doomed to being at least=
 a bit nonsensical.

As an analogy, AMD64 introduced bigger PTEs but kept the same nonsense encod=
ing of read and write permission. And then we got NX, and now we=E2=80=99re g=
etting little holes in the encoding stolen by CET to mean new silly things. =
 I don=E2=80=99t know if you=E2=80=99ve been following the various rounds of=
 patches, but it is truly horrible. The mapping from meaning to the actual b=
its is *shit*, and AMD64 should have made a clean break instead.

open()=E2=80=99s permission bits are basically the same situation. And the k=
ernel *already* has a non-type-safe translation layer. Please, please let op=
enat2() at least get rid of the turd in open()=E2=80=99s bits 0 and 1.

