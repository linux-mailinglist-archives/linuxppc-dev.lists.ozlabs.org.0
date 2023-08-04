Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C13B770C61
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 01:26:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KN5ZYHb0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHhgS27Xqz3cVW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 09:26:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KN5ZYHb0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=mjguzik@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHhfS4pwKz2yW6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 09:25:52 +1000 (AEST)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3a5a7e7cd61so1779196b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 16:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691191549; x=1691796349;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2ECpGsVgScrXWZOLp4MGlhJInQlqSJK5uh2ufnsxsdQ=;
        b=KN5ZYHb0WcW1urRTacMTcHcK1iJfsyKLuTL34dGK3epmEymYUfmkINYqz6aEbdMp+W
         zP3dEKtnz6JUtoqVZ1SnahfZCc5VVKFxGx/8h93CY/AxPITLLZOB6+xETO/sMYVRHySA
         TaMiFlxxDsv7HIJe00SxpQVu9Hn7GKNHwBxbOGtO1AXBFT+BEswiulBLKt6bP6OMt4wd
         12MBsdSJMyXvBwCe6D2ym2yxWn3SVy+r1EJz04/d6QPozmfj9tn6XaE+A3eVha3VW8Bw
         HsxwAfYJFsWa+JNVAHCA2y3A6DqjGG47Z5jkfZegfqiTqVqo78ji96xRiH5TdjogMFji
         HGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691191549; x=1691796349;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ECpGsVgScrXWZOLp4MGlhJInQlqSJK5uh2ufnsxsdQ=;
        b=lsNtQM35T+CLklBpdjqA7Il4Nc24paK785aFo0GfsrbIommuk+ctzs48LhEz5qUXSe
         5vPRXhJOG4zhZUMSTu8TByTnDB7USsZxr1oiNspk71ISeHwbUxU+IuINz9sOUmMYFp0V
         HOhL736/BOnJISPNK/0GWJRGp3O2plUd0cefIrWOGmVBZ2c/eZo16l/QlvRmPVE7pKfP
         VZNKL2+930nZGc+Ev1XwF5EPU+JmgIYzX0Oa3fBIExY08zh8EbhLv36z6BMBAc+7ahA1
         PS6jtjXUpSRPJZJ5Rx+aJWG22e83Gdi6FgI7p025vkdlsIFrRma+4j2oEPovtOUZT0zs
         rKqg==
X-Gm-Message-State: AOJu0YzmdK2Vq3n4HMIxhJjVpM4MzZnNhAHht0yNBho5Zj3Pwt2GNiW9
	nv/rn/vPHRUAapoKmfiJfkAMt+6kR2nW/l9cZDkDgrWwYaI=
X-Google-Smtp-Source: AGHT+IGtBQglFMOFnETZZ/fmovN1PMvk23bCpNKojUYy5iXfJ0+vg0zUB8AJgZ4V2vFlc91Ap5FBtffJGXGc3wkjEE8=
X-Received: by 2002:a05:6808:3a7:b0:39c:7d50:ab86 with SMTP id
 n7-20020a05680803a700b0039c7d50ab86mr778649oie.29.1691191548939; Fri, 04 Aug
 2023 16:25:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7b87:0:b0:4f0:1250:dd51 with HTTP; Fri, 4 Aug 2023
 16:25:48 -0700 (PDT)
In-Reply-To: <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Sat, 5 Aug 2023 01:25:48 +0200
Message-ID: <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: jacobly.alt@gmail.com, regressions@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>, david@redhat.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, liam.howlett@oracle.com, bagasdotme@gmail.com, gregkh@linuxfoundation.org, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/5/23, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> On Fri, 4 Aug 2023 at 14:46, Mateusz Guzik <mjguzik@gmail.com> wrote:
>>
>> I don't see it mentioned in the discussion, so at a risk of ruffling
>> feathers or looking really bad I'm going to ask: is the locking of any
>> use if the forking process is single-threaded? T
>
> Sadly, we've always been able to access the mm from other processes,
> so the locking is - I think - unavoidable.
>
> And some of those "access from other processes" aren't even uncommon
> or special. It's things like "ps" etc, that do it just to see the
> process name and arguments.
>

I know of these guys, I think they are excluded as is -- they go
through access_remote_vm, starting with:
        if (mmap_read_lock_killable(mm))
                return 0;

while dup_mmap already write locks the parent's mm.

I don't see any surprise relocks of the semaphore.

Granted, should someone *bypass* this mechanism the above would be moot.

-- 
Mateusz Guzik <mjguzik gmail.com>
