Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E12271150
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 00:55:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bv5dS2d6xzDqdD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 08:55:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=JqRJRr8p; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bv5bb4XBzzDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 08:53:45 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id v14so4938829pjd.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 15:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:subject:mime-version:from:in-reply-to:cc
 :date:message-id:references:to;
 bh=OiG9AhNV/aYytBLvfrNKs+OEikcE/xFc3qwTD8LXQak=;
 b=JqRJRr8pAqbUpB6Z8cyMrJ9xHdq76J9quA0nLvKh3ZCmreRApMtVEKJrUh1+iYF6JM
 j7I4CbitDi/hbJxI3A0yUx65zzxj+9OuhhpvKck/wUnRBF7EuGclsOL0nDYDl8Jf5W94
 LKjbYdiN8NQkyPDzWNzRWKhhUpI5BiYKfIYVYjgQr06v6tspjh4Kfljk2gKaOIdeu1AS
 kmjSb7FfVExI6FATCE4tuWlmlbDYHr+Rf4lm9eioaoVVJRTCo1VHPqqwu78Yo7heUEN2
 jwKtRhH+4KJ2y45vqwGsl3R+5jHCVoZnWHE5+MXw1OCY8mxZ6/yyA8kWQtdSX7UdFXP9
 eHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:subject:mime-version
 :from:in-reply-to:cc:date:message-id:references:to;
 bh=OiG9AhNV/aYytBLvfrNKs+OEikcE/xFc3qwTD8LXQak=;
 b=Ca8jshxpUFl2xiDtJKYptR2P4CxTKV90P7UTPBUxgt8jPxRJzuU1IjMomjAv0+3ROy
 JInVDrnTGE4SuKMtxHmLLrHMf0xfFASCnrDeOD4nx4omJV6fSwJSiMG7anrQJQJnGGyi
 kQfEAXM8iHsOQ46EUDSHtpjKYH9RN/fngz5xQCkaPMWwbUhFZj7iAwxXb/G/1FI+ezUP
 xsVogTuDlD7iS/WSYLBtuJRttg0eY95v3W+dYUPIQLfqHBzCPfppI7e9MymEA6k+9LLj
 MSvSrgL3mtvNuwDjAljRDtbzqMOjdmUZksfeyxV68VCl29JNEnSgXqNP4uAkAobhKW1Z
 Z5Gg==
X-Gm-Message-State: AOAM5303QKzZN+ksCAYuoeOW3SBOIYrJ5x/E5pRs2qaz5suhYjgf3VM/
 mCGFJvF8KlETkPf3UL8huL2ulA==
X-Google-Smtp-Source: ABdhPJz6oUPJzoZ809X6It3WeC+2ZvOV1G+Wm8aqeVVuTi4tgGB6DMhswwyVupUYmjfKPmBsWvoOLQ==
X-Received: by 2002:a17:90b:4ac2:: with SMTP id
 mh2mr17372330pjb.210.1600556023735; 
 Sat, 19 Sep 2020 15:53:43 -0700 (PDT)
Received: from localhost.localdomain ([2600:1010:b017:20a:100a:bebe:fad7:f7f9])
 by smtp.gmail.com with ESMTPSA id n9sm7688488pfu.163.2020.09.19.15.53.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Sep 2020 15:53:43 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
Mime-Version: 1.0 (1.0)
X-Apple-Notify-Thread: NO
X-Universally-Unique-Identifier: E3EC9A91-0DBF-46AE-A57B-AC669BA7C6D0
From: Andy Lutomirski <luto@amacapital.net>
In-Reply-To: <20200919224122.GJ3421308@ZenIV.linux.org.uk>
Date: Sat, 19 Sep 2020 15:53:40 -0700
X-Apple-Message-Smime-Encrypt: NO
Message-Id: <36CF3DE7-7B4B-41FD-9818-FDF8A5B440FB@amacapital.net>
References: <20200919224122.GJ3421308@ZenIV.linux.org.uk>
To: Al Viro <viro@zeniv.linux.org.uk>
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
Cc: linux-aio@kvack.org, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, sparclinux@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-block@vger.kernel.org,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Sep 19, 2020, at 3:41 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
>=20
> =EF=BB=BFOn Sat, Sep 19, 2020 at 03:23:54PM -0700, Andy Lutomirski wrote:
>>=20
>>>> On Sep 19, 2020, at 3:09 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
>>>=20
>>> =EF=BB=BFOn Fri, Sep 18, 2020 at 05:16:15PM +0200, Christoph Hellwig wro=
te:
>>>>> On Fri, Sep 18, 2020 at 02:58:22PM +0100, Al Viro wrote:
>>>>> Said that, why not provide a variant that would take an explicit
>>>>> "is it compat" argument and use it there?  And have the normal
>>>>> one pass in_compat_syscall() to that...
>>>>=20
>>>> That would help to not introduce a regression with this series yes.
>>>> But it wouldn't fix existing bugs when io_uring is used to access
>>>> read or write methods that use in_compat_syscall().  One example that
>>>> I recently ran into is drivers/scsi/sg.c.
>>>=20
>>> So screw such read/write methods - don't use them with io_uring.
>>> That, BTW, is one of the reasons I'm sceptical about burying the
>>> decisions deep into the callchain - we don't _want_ different
>>> data layouts on read/write depending upon the 32bit vs. 64bit
>>> caller, let alone the pointer-chasing garbage that is /dev/sg.
>>=20
>> Well, we could remove in_compat_syscall(), etc and instead have an implic=
it parameter in DEFINE_SYSCALL.  Then everything would have to be explicit. =
 This would probably be a win, although it could be quite a bit of work.
>=20
> It would not be a win - most of the syscalls don't give a damn
> about 32bit vs. 64bit...

Any reasonable implementation would optimize it out for syscalls that don=E2=
=80=99t care.  Or it could be explicit:

DEFINE_MULTIARCH_SYSCALL(...)=
