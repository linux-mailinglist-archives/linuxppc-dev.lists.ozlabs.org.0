Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5FD372750
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 10:39:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZCtl2Mg5z2yxl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 18:39:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=heYaieXD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36;
 helo=mail-yb1-xb36.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=heYaieXD; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZCtH1tQLz2xZG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 18:38:47 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 82so11118041yby.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 01:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y8qb2bfAFrI9QM8sR79PgwC4m456KUQvtxQw7QErVO0=;
 b=heYaieXDiOzidFq+kRcjvjjBmYI/4xzMD4IZ1Yw76TNQUNkDgLOIYrp8Bys7niIi+O
 jvSzvlHAX5/hbPR7mdg8Mr3KtVFEXJixdX0zDUsRdWPm2M6sI96KtXYPzM4z98Sk6HbK
 IclA9mcqDUz7trpk3h4rJfxcBfa44/1jzoziaYOQVlXYek/pEzc7jPCbtcmkJIT+9VUH
 WT0HpfKiSiMrkqlHze4lvrBlnkSpkcOokMm27Bo95W5SsjuKtg5kMxCDmKeB7yAkY8kq
 yjjrUt79LeHM1TFBZ+4oGyOBeB8Esqx0U2hDdis4OHVxSJOXEo006EcEEdIvOFlYc3Lc
 5pTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y8qb2bfAFrI9QM8sR79PgwC4m456KUQvtxQw7QErVO0=;
 b=SlQH2FvtYCRX3MG4VIbyiGH/El7kvYBYyN7EVde9AjJNww/fhUSjd7KiD4F3jMtNQh
 muKk+AFBS6oXrYPqxXWVfipDhK0aC6QGwg2eGjIc90zOOGCtQweibz31j0aKxIMdNDEr
 Nc/t4vG1POP3oi6SrjWXUSeDudfcvW/e2/omtfH00dA8eNZaGIuh1hcxly3uJTnstHe0
 X3rCNBeb3mtINgOUghdwkWYAQ6qe0lG24rXOfv7butBTKBZBDyxaXdptGo+e/tF9qcb3
 OJvKV+xsp4mlPjXAMItc1zRVuZfCRA5/dNdIwdzW0zJzNDPUKZ86yiW1vwmydqY7XM3g
 7cdw==
X-Gm-Message-State: AOAM530VHLzjxu/vgWOaNCXPExWpSbTuU7Rm5tMvYifvWqGV4z+zoP6u
 C0hIi53zCnHG9oGqYrUxhMw6jre83wSuLv2F6p8=
X-Google-Smtp-Source: ABdhPJwgJRTy4oD3Q4bEwMIiI0PESgNj4LF3XmVCbNwY/lWmcIYnmds0Q6QwiZMB0/f4EUTpPAx1ux8l25XkeS6oEUM=
X-Received: by 2002:a25:880f:: with SMTP id c15mr31896545ybl.247.1620117523381; 
 Tue, 04 May 2021 01:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <65cda2bb-1b02-6ebc-0ea2-c48927524aa0@codethink.co.uk>
In-Reply-To: <65cda2bb-1b02-6ebc-0ea2-c48927524aa0@codethink.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 May 2021 10:38:32 +0200
Message-ID: <CANiq72mk84uay--BWOLT4zF12-rat9erohKazB8SpTPoVCTX1A@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Ben Dooks <ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Joe Perches <joe@perches.com>,
 Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 4, 2021 at 9:57 AM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> Some of us are a bit stuck as either customer refuses to upgrade
> their build infrastructure or has paid for some old but safety
> blessed version of gcc. These often lag years behind the recent
> gcc releases :(

In those scenarios, why do you need to build mainline? Aren't your
customers using longterm or frozen kernels? If they are paying for
certified GCC images, aren't they already paying for supported kernel
images from some vendor too?

I understand where you are coming from -- I have also dealt with
projects/machines running ancient, unsupported software/toolchains for
various reasons; but nobody expected upstream (and in particular the
mainline kernel source) to support them. In the cases I experienced,
those use cases require not touching anything at all, and when the
time came of doing so, everything would be updated at once,
re-certified/validated as needed and frozen again.

Cheers,
Miguel
