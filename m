Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA76527110C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 00:23:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bv4wq0JvVzDqwH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 08:23:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=EY9RaFhK; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bv4vF38Q0zDqXW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 08:22:11 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id y6so4879827plt.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 15:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=25gVfK2bGDr534LWfZ/pQ4shMLoyA8XjkGlFCfd9UIQ=;
 b=EY9RaFhKJvXZJRe9JFZEmj/lrRJqtPj6jNB3uuL8Asw+3z3hL8ojgYDOBxgCTI3nk9
 /mXxtqUMYM7Lwl0JgYFAozO/o74Ybc5I1+WhDC3iRbQpOEwdgChJfXvUy9LaiX/RnQRf
 p/J0xsjYVG4oqNtf24952lDJD0ziSd0wiVT/i0R8ihNenTSwy/mXNvVIx+wshhqobcUy
 5EicG48utPjw3drDSP4fcvdYEf263LYbKCqq5wRH96dLaukxQtxTbM+CqP9ZHn/W3xRY
 8AFACdo1jBBh0ZpNH8dhEU0zBCFGmtnY/LeHs/0y17jDB1ByiLtkNkIHMFbVGhXPT7kd
 OVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=25gVfK2bGDr534LWfZ/pQ4shMLoyA8XjkGlFCfd9UIQ=;
 b=mP7HZ2a+NsMuJDsVRap5tpG9LDlU1qBk7R4RmU8trAcrHAsJfitwWAtlGbPBl/79rE
 AYL/bUAwQASjmXIAgbS58pUPCFY3isI1FaWwTST6o2NCCzXXrO6yUhlC4py2xjNAhVbz
 nP1nJEFiJL7Evlr/IKaZDzUvyBnzvh0BtJVYJgPl55/kEBdzAJNBDnbV38lWo0QErJSy
 IewyjFYWrVcc6bHAmfdu4QGQF+pXieOd6IosH9lj4eUUN3Kxy0HM4EhJzzWIc8FcRS7t
 Rhn5xyr2uWcPukPmkmDpz5Wbb6TPuLX5m3BLg9K7GDtEsoI7EeJZbUQYoeEtJm7xHd0S
 sr2A==
X-Gm-Message-State: AOAM533YaVUraomWCwJHTHv/iMBkQcaqlIu5+etV8qyzb3sK+Kg2xgTo
 Ml/abGUOErddRIGStCZQGWyZmg==
X-Google-Smtp-Source: ABdhPJziI+9RTM4Q+0EM9+8+2xFKIE2ZrEYxvbFrrOPerUdpGlrHlMuO11hqWffBHcUb5BpNHvdsyg==
X-Received: by 2002:a17:902:ac97:b029:d1:f367:b51a with SMTP id
 h23-20020a170902ac97b02900d1f367b51amr16629268plr.20.1600554127472; 
 Sat, 19 Sep 2020 15:22:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:c200:1ef2:e9da:b923:b529:3349])
 by smtp.gmail.com with ESMTPSA id p4sm6588471pju.29.2020.09.19.15.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Sep 2020 15:22:06 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
Date: Sat, 19 Sep 2020 15:22:04 -0700
Message-Id: <D0791499-1190-4C3F-A984-0A313ECA81C7@amacapital.net>
References: <CAK8P3a2Mi+1yttyGk4k7HxRVrMtmFqJewouVhynqUL0PJycmog@mail.gmail.com>
In-Reply-To: <CAK8P3a2Mi+1yttyGk4k7HxRVrMtmFqJewouVhynqUL0PJycmog@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
X-Mailer: iPhone Mail (18A373)
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
Cc: linux-aio <linux-aio@kvack.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 keyrings@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux SCSI List <linux-scsi@vger.kernel.org>, X86 ML <x86@kernel.org>,
 linux-block <linux-block@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, io-uring@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, Parisc List <linux-parisc@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On Sep 19, 2020, at 2:16 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>=20
> =EF=BB=BFOn Sat, Sep 19, 2020 at 6:21 PM Andy Lutomirski <luto@kernel.org>=
 wrote:
>>> On Fri, Sep 18, 2020 at 8:16 AM Christoph Hellwig <hch@lst.de> wrote:
>>> On Fri, Sep 18, 2020 at 02:58:22PM +0100, Al Viro wrote:
>>>> Said that, why not provide a variant that would take an explicit
>>>> "is it compat" argument and use it there?  And have the normal
>>>> one pass in_compat_syscall() to that...
>>>=20
>>> That would help to not introduce a regression with this series yes.
>>> But it wouldn't fix existing bugs when io_uring is used to access
>>> read or write methods that use in_compat_syscall().  One example that
>>> I recently ran into is drivers/scsi/sg.c.
>=20
> Ah, so reading /dev/input/event* would suffer from the same issue,
> and that one would in fact be broken by your patch in the hypothetical
> case that someone tried to use io_uring to read /dev/input/event on x32...=

>=20
> For reference, I checked the socket timestamp handling that has a
> number of corner cases with time32/time64 formats in compat mode,
> but none of those appear to be affected by the problem.
>=20
>> Aside from the potentially nasty use of per-task variables, one thing
>> I don't like about PF_FORCE_COMPAT is that it's one-way.  If we're
>> going to have a generic mechanism for this, shouldn't we allow a full
>> override of the syscall arch instead of just allowing forcing compat
>> so that a compat syscall can do a non-compat operation?
>=20
> The only reason it's needed here is that the caller is in a kernel
> thread rather than a system call. Are there any possible scenarios
> where one would actually need the opposite?
>=20

I can certainly imagine needing to force x32 mode from a kernel thread.

As for the other direction: what exactly are the desired bitness/arch semant=
ics of io_uring?  Is the operation bitness chosen by the io_uring creation o=
r by the io_uring_enter() bitness?=
