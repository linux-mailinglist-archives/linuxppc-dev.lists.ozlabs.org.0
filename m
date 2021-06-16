Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 854A13A8E80
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 03:45:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4SgJ0z1Nz3bx8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 11:45:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Vx2bn0N7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Vx2bn0N7; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4Sfp47WYz303t
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 11:44:49 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id e7so292856plj.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 18:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=TpIUj9zzJp3O+R+hnlzPnVLyN1UCjgkgvbAbYiOrQrQ=;
 b=Vx2bn0N7/db7jozAm3EYAv7B7psRP+Alq14c0ivPnBAnI4FV845ZMuHhvSTVZOZdGY
 nOtjEi+FH/ZlgSfK0Vlt9jawHxb6gdVb32t1zQt3UI6ERDHffJ4YemO+wYQlHgOaiCDU
 RaWj2/TRnK0JQPue9FiWK/e4rudBniWm3rEB8bfcYQFsjjKHC6RmqWjoa/Uq9z7fzo3l
 gPcd626OqIOxpPOUEkXdwAl5RvTrbiZ1fuL4zJ/PezUraWyYrw8wFKxz+DP5o8phy87V
 wYomhizARJiyMFDW5i0nLOcYWduaPWJfnJ9H9oeXBSOmhsxFmD+v3Cg6G6zCmqDQJsRm
 vufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=TpIUj9zzJp3O+R+hnlzPnVLyN1UCjgkgvbAbYiOrQrQ=;
 b=QsVPMELJCW1sMag1AJf+ZV3kuAsNZ/fvApnyWnrUmZPkqkz4536Kbp4qGiC5mNjdOX
 BmmhRhxsjiyGbHxYXKs91RI5KdiQzVgY0i/+TArmHwN6IZz5efV/yOF9nIbFFG9jfdj2
 e4iMyEH64xS0TzOSEY0ZrAetVeBfYu95DacYkH2jmG7naB4/ZE/DVaQbI+E9wXaUBUD4
 Os6OCUpDgczyNrWRCZnuMrLA0Gwsa62dJ7Z/3fwcaM/h4ySCjHgkv359srGKlRwBnXZf
 lWmpiWjfgVSBH1NM0NrLZYXHnSUlj38BllKSGMZFk/n8lFIn5zTyrTISj0KlOMUbP0PA
 Jz/g==
X-Gm-Message-State: AOAM532rGtymYwqoj8e1FbPn05SU22Otqfmb3LlEKV4xvyhtgqCBAQl6
 dWDRTiSJQBPsArVwc4GGQj2CLh9uuIc=
X-Google-Smtp-Source: ABdhPJyAUH1iXxuTsXJ/r4ttmSWAL7RYaBZcECjkbOhfCiMh+t98rJ5umSi1bhoOr2+pzNY9QlIW/A==
X-Received: by 2002:a17:90a:bf11:: with SMTP id
 c17mr2248477pjs.165.1623807885931; 
 Tue, 15 Jun 2021 18:44:45 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id p24sm349875pfh.17.2021.06.15.18.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:44:45 -0700 (PDT)
Date: Wed, 16 Jun 2021 11:44:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v7 00/11] Speedup mremap on ppc64
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
 <CAPa8GCAmgUyqqAcuLC7KxDvDepkqhhvVcwgSGJh92PT+LoMQcw@mail.gmail.com>
 <CAHk-=wipa02d8tN-fCYJ=iH915yHtFr6wEDBcOeFtawVVF4niQ@mail.gmail.com>
In-Reply-To: <CAHk-=wipa02d8tN-fCYJ=iH915yHtFr6wEDBcOeFtawVVF4niQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1623807215.t2mo6ahd0q.astroid@bobo.none>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "kaleshsingh@google.com" <kaleshsingh@google.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Linus Torvalds's message of June 9, 2021 3:10 am:
> On Mon, Jun 7, 2021 at 3:10 AM Nick Piggin <npiggin@gmail.com> wrote:
>>
>> I'd really rather not do this, I'm not sure if micro benchmark captures =
everything.
>=20
> I don't much care what powerpc code does _itnernally_ for this
> architecture-specific mis-design issue, but I really don't want to see
> more complex generic interfaces unless you have better hard numbers
> for them.
>=20
> So far the numbers are: "no observable difference".
>=20
> It would have to be not just observable, but actually meaningful for
> me to go "ok, we'll add this crazy flag that nobody else cares about".

Fair enough, will have to try get more numbers then I suppose.

>=20
> And honestly, from everything I've seen on page table walker caches:
> they are great, but once you start remapping big ranges and
> invallidating megabytes of TLB's, the walker caches just aren't going
> to be your issue.

Remapping big ranges is going to have to invalidate intermediate caches
(aka PWC), so is unmapping. So we're stuck with the big hammer PWC=20
invalidate there anyway.

It's mprotect and friends that would care here, possibly some THP thing...
but I guess those are probably down the list a little way.

I'm a bit less concerned about the PWCs that might be caching the regions
of the big mprotect() we just did, and more concerned about the effect=20
of flushing all unrelated caches. Including on all other CPUs a threaded
program is running on. HANA, Java, are threaded and do mremaps,=20
unfortunately.


>=20
> But: numbers talk.  I'd take the sane generic interfaces as a first
> cut. If somebody then has really compelling numbers, we can _then_
> look at that "optimize for odd page table walker cache situation"
> case.

Yep okay. It's not the end of the world (or if it is we'd be able to get
numbers presumably).

> And in the meantime, maybe you can talk to the hardware people and
> tell them that you want the "flush range" capability to work right,
> and that if the walker cache is <i>so</i> important they shouldn't
> have made it a all-or-nothing flush.

I have, more than once :(

Fixing that would fix munmap etc cases as well, so yeah.

Thanks,
Nick
