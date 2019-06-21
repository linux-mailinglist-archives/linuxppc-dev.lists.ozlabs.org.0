Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 518694E1EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 10:31:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VX2q5d6mzDqf8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 18:31:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fbj3ryUA"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VX111QdjzDqd1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 18:29:40 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id z19so54612pgl.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 01:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=yxfaAKL36iRBk7i3lJUt2q8lAl7GH2S2sjM2Bw2uPJs=;
 b=fbj3ryUASSI5WTeqBy+Hc5OEHWiPYdV7sIZyNqgV+qzFiANsZYBHP3eTFrdbgDPMqz
 +NZAYlBR+Dfy7yY9SJaByfth0oz38I9M0oFx0/PjpOVh4PwNfZ6TM2OYoTtOR9SENi8J
 c4JwUKiwqGhPWDDJTo19f+iyU8hDWG4ED1a79bBPnMbmzbrs+wX6NcAW3qliBAqn2Cz9
 cNxxEV7yL4Cgwr2k23ZRaqddTXmW7jlpNEyLek6w+pt1gX1BPnCgoRUSFo9HYLeo65pM
 jcwVL8KYaA8GxmgazJGRjU9ifPR/K7V+tvyC4gxu12oOVP2g9/tx3yANOSmbk/9lW3n7
 hoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=yxfaAKL36iRBk7i3lJUt2q8lAl7GH2S2sjM2Bw2uPJs=;
 b=i2Dcb46WQjq8JQruM6jXWKQEwvJk/lEPaheU9LWRndbAb8P14WTAeGPc47PvMZspyk
 rnEqGXMLemwr37iLNnAyQvCx+B9noi8tQZUWHfjL4SWT6K5k2itgJnWpMvUxJNrY+Tqk
 /JB1Ax9Kv52gh2UgUuxDxE4hgQYO99AM1VsmQrrysQOQSg29WWh6liYjclLIaIwbRGjh
 4NTIXEfE3r9/tuuZ/cfv/82dWreKg9g7VnBb8Y7f+zcZVS7Wb3Xt9Dok43uUAxPimHaA
 BgXb+wc4Ec1XpgAZy/btsKIkdDfGMWEgbBMjee2Rb+I+mYpUzLlwfVF2EtW1GXBtde0H
 7IgQ==
X-Gm-Message-State: APjAAAVVYBott9ngrjvfOZffMj3UUKtlV2DCbY1+/KKvYWz44kFQRh9U
 es7SNqjk4Tosgj9U3mJ2uG4=
X-Google-Smtp-Source: APXvYqw0+FZM5x3iJhEGb07mnJPrmGs4w362V6gxLaKrkfdj/o0PM7u+3QQXzswzUEdHsggmQOj3Bw==
X-Received: by 2002:a17:90a:cb15:: with SMTP id
 z21mr5012050pjt.87.1561105777693; 
 Fri, 21 Jun 2019 01:29:37 -0700 (PDT)
Received: from localhost ([1.144.138.41])
 by smtp.gmail.com with ESMTPSA id v185sm2443015pfb.14.2019.06.21.01.29.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 01:29:36 -0700 (PDT)
Date: Fri, 21 Jun 2019 18:29:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 16/16] mm: pass get_user_pages_fast iterator arguments in
 a structure
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-17-hch@lst.de>
 <1560300464.nijubslu3h.astroid@bobo.none>
 <CAHk-=wjSo+TzkvYnAqrp=eFgzzc058DhSMTPr4-2quZTbGLfnw@mail.gmail.com>
 <1561032202.0qfct43s2c.astroid@bobo.none>
 <CAHk-=wh46y3x5O0HkR=R4ETh6e5pDCrEsJ94CtC0fyQiYYAf6A@mail.gmail.com>
In-Reply-To: <CAHk-=wh46y3x5O0HkR=R4ETh6e5pDCrEsJ94CtC0fyQiYYAf6A@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1561104674.cxm7sn77rx.astroid@bobo.none>
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

Linus Torvalds's on June 21, 2019 3:21 am:
> On Thu, Jun 20, 2019 at 5:19 AM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> The processor aliasing problem happens because the struct will
>> be initialised with stores using one base register (e.g., stack
>> register), and then same memory is loaded using a different
>> register (e.g., parameter register).
>=20
> Hmm. Honestly, I've never seen anything like that in any kernel profiles.
>=20
> Compared to the problems I _do_ see (which is usually the obvious
> cache misses, and locking), it must either be in the noise or it's
> some problem specific to whatever CPU you are doing performance work
> on?

No you're right, the performance hit from these flushes is not a
big hit that stands out in cycle counts. I just look at kernel code
for various flushes. Branches not surprisingly are usually the main
culprit, but they're normally not so interesting.

Static alias prediction seems to work well outside this case. It's
interesting, you need both a store ; load sequence that does not
predict well (e.g., using a different base register), and you also
need that load to be executed ahead of the store.

The small stack structure for arguments is the perfect case. Bad
pattern, and load executed right after store. Even then you also need
a reason to delay the store (e.g., source not ready or store queue
full), but those hazards do show up.

Now, even when all that goes wrong, there are dynamic heuristics that
can take over. So if you run a repetitive microbenchmark you won't
see it.

Some CPUs seem to be quite aggressive about giving up and turning off
the alias prediction globally if you take misses (Intel x86 used to do
that IIRC, not sure if they still do). So in that case you wouldn't
even see it show up in one place, everything will just run slightly
slower.

What I worry about is high rate direct IO workloads that see single
flushes in these paths as significant. Or if this thing creeps in to
the kernel too much and just slightly raises global misses enough,
then it will cause disambiguation to be significantly shut down.

Thanks,
Nick

=
