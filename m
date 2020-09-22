Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CAC273752
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 02:26:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwMZ85jwmzDqlD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 10:26:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=asml.silence@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M5tY9xMB; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwMWf1xrrzDqwp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 10:24:45 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id e16so15131006wrm.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 17:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wIBgQDjMpBc9eHjG5ciq3jUVwixS2wtL8ramLW/UpOw=;
 b=M5tY9xMBgtGvsKK8eOdWQQO+KsgbPJMemCZI3/tNiSm0Xz8lHCWZiojHACMAPByoT9
 fDtG5zLCnZIDOtKK8b16UFbyYByfWbTV38xOXLLFiAP10gXbgQGEUrEDTlEwpVhM0raj
 4Nd+GwlczLaTF7LKsbHBxvfbn/eqYFWZLe1rolh+WVg1RiyjEy1OWSgn0CeNqD8jJkc9
 RHkXhrdrFAkiW9zCDxyHUXBz9Yzdyok+t1h/kOLmYW6TlgWckxF0AZ+meRtK6o958jEC
 5pLBkJic1D38s2HAN3IBQX2BgG54RrQOLjDWDs4lSk0nnlJ0q+CFqRilSh8iEpB+yABx
 dKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wIBgQDjMpBc9eHjG5ciq3jUVwixS2wtL8ramLW/UpOw=;
 b=eOeMx8beyFqYa3RmQsVKG6wWG9MYJouK2vOrZnrmN2sGfrld6lnzZpB+djggjeiWBN
 jumf/BGNhw21eXkiDYA342jSjE8I8+KSOvUkwvt/7D6JVFCNhetRhDQtq1kFcVS2/VyM
 RBOaeKHyqvlVkXSWaSJN4R1/lKoZiTuAYMvdszfDKcysTaP8A/CT0ogM5kOk9qJdmxmX
 XVHY/mSoweucs5t1LggI341wRKqGJXwQrSuRemJ36oHMsKL8TFJHqsyiy5tq3Gf1ufIk
 0o7AdLalWH1shydX1VuSEtk1UlnpmEpegvx2ENHeqQfCstV65XKCJ5nXCBWvCdv/XkI+
 ejFw==
X-Gm-Message-State: AOAM533WZnIV6rKmL6XYKRwP8BW8zSmBIvgJLMYV/+ipCQzMglfNMH9X
 EY1HjEaWQW/5vv0Fdr7jeFI=
X-Google-Smtp-Source: ABdhPJxmzXm3LMafAJlajJw6mEDB155mO9zJr+xZSy1GQzleX1BLBZK0Un+mf22JCYogMfkbFJ92Wg==
X-Received: by 2002:adf:fed1:: with SMTP id q17mr2217863wrs.85.1600734278437; 
 Mon, 21 Sep 2020 17:24:38 -0700 (PDT)
Received: from [192.168.43.240] ([5.100.192.97])
 by smtp.gmail.com with ESMTPSA id 91sm25208848wrq.9.2020.09.21.17.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 17:24:37 -0700 (PDT)
To: Andy Lutomirski <luto@kernel.org>
References: <CAK8P3a2Mi+1yttyGk4k7HxRVrMtmFqJewouVhynqUL0PJycmog@mail.gmail.com>
 <D0791499-1190-4C3F-A984-0A313ECA81C7@amacapital.net>
 <563138b5-7073-74bc-f0c5-b2bad6277e87@gmail.com>
 <486c92d0-0f2e-bd61-1ab8-302524af5e08@gmail.com>
 <CALCETrW3rwGsgfLNnu_0JAcL5jvrPVTLTWM3JpbB5P9Hye6Fdw@mail.gmail.com>
From: Pavel Begunkov <asml.silence@gmail.com>
Autocrypt: addr=asml.silence@gmail.com; prefer-encrypt=mutual; keydata=
 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 bA==
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
Message-ID: <d5c6736a-2cb4-4e22-78da-a667bda5c05a@gmail.com>
Date: Tue, 22 Sep 2020 03:22:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CALCETrW3rwGsgfLNnu_0JAcL5jvrPVTLTWM3JpbB5P9Hye6Fdw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 Arnd Bergmann <arnd@arndb.de>, linux-block <linux-block@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
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



On 22/09/2020 02:51, Andy Lutomirski wrote:
> On Mon, Sep 21, 2020 at 9:15 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>
>> On 21/09/2020 19:10, Pavel Begunkov wrote:
>>> On 20/09/2020 01:22, Andy Lutomirski wrote:
>>>>
>>>>> On Sep 19, 2020, at 2:16 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>>>>>
>>>>> ﻿On Sat, Sep 19, 2020 at 6:21 PM Andy Lutomirski <luto@kernel.org> wrote:
>>>>>>> On Fri, Sep 18, 2020 at 8:16 AM Christoph Hellwig <hch@lst.de> wrote:
>>>>>>> On Fri, Sep 18, 2020 at 02:58:22PM +0100, Al Viro wrote:
>>>>>>>> Said that, why not provide a variant that would take an explicit
>>>>>>>> "is it compat" argument and use it there?  And have the normal
>>>>>>>> one pass in_compat_syscall() to that...
>>>>>>>
>>>>>>> That would help to not introduce a regression with this series yes.
>>>>>>> But it wouldn't fix existing bugs when io_uring is used to access
>>>>>>> read or write methods that use in_compat_syscall().  One example that
>>>>>>> I recently ran into is drivers/scsi/sg.c.
>>>>>
>>>>> Ah, so reading /dev/input/event* would suffer from the same issue,
>>>>> and that one would in fact be broken by your patch in the hypothetical
>>>>> case that someone tried to use io_uring to read /dev/input/event on x32...
>>>>>
>>>>> For reference, I checked the socket timestamp handling that has a
>>>>> number of corner cases with time32/time64 formats in compat mode,
>>>>> but none of those appear to be affected by the problem.
>>>>>
>>>>>> Aside from the potentially nasty use of per-task variables, one thing
>>>>>> I don't like about PF_FORCE_COMPAT is that it's one-way.  If we're
>>>>>> going to have a generic mechanism for this, shouldn't we allow a full
>>>>>> override of the syscall arch instead of just allowing forcing compat
>>>>>> so that a compat syscall can do a non-compat operation?
>>>>>
>>>>> The only reason it's needed here is that the caller is in a kernel
>>>>> thread rather than a system call. Are there any possible scenarios
>>>>> where one would actually need the opposite?
>>>>>
>>>>
>>>> I can certainly imagine needing to force x32 mode from a kernel thread.
>>>>
>>>> As for the other direction: what exactly are the desired bitness/arch semantics of io_uring?  Is the operation bitness chosen by the io_uring creation or by the io_uring_enter() bitness?
>>>
>>> It's rather the second one. Even though AFAIR it wasn't discussed
>>> specifically, that how it works now (_partially_).
>>
>> Double checked -- I'm wrong, that's the former one. Most of it is based
>> on a flag that was set an creation.
>>
> 
> Could we get away with making io_uring_enter() return -EINVAL (or
> maybe -ENOTTY?) if you try to do it with bitness that doesn't match
> the io_uring?  And disable SQPOLL in compat mode?

Something like below. If PF_FORCE_COMPAT or any other solution
doesn't lend by the time, I'll take a look whether other io_uring's
syscalls need similar checks, etc.


diff --git a/fs/io_uring.c b/fs/io_uring.c
index 0458f02d4ca8..aab20785fa9a 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -8671,6 +8671,10 @@ SYSCALL_DEFINE6(io_uring_enter, unsigned int, fd, u32, to_submit,
 	if (ctx->flags & IORING_SETUP_R_DISABLED)
 		goto out;
 
+	ret = -EINVAl;
+	if (ctx->compat != in_compat_syscall())
+		goto out;
+
 	/*
 	 * For SQ polling, the thread will do all submissions and completions.
 	 * Just return the requested submit count, and wake the thread if
@@ -9006,6 +9010,10 @@ static int io_uring_create(unsigned entries, struct io_uring_params *p,
 	if (ret)
 		goto err;
 
+	ret = -EINVAL;
+	if (ctx->compat)
+		goto err;
+
 	/* Only gets the ring fd, doesn't install it in the file table */
 	fd = io_uring_get_fd(ctx, &file);
 	if (fd < 0) {
-- 
Pavel Begunkov
