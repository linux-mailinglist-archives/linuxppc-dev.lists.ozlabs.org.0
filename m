Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C48C2770CF2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 03:17:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=folnjqF0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHl7m4Cs2z3cRh
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 11:17:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=folnjqF0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com; envelope-from=mjguzik@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHl6m61dzz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 11:17:03 +1000 (AEST)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1bb575a6ed3so2022025fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 18:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691198220; x=1691803020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cu168Y9vRpg+vzxEgSTGxY5n1ZLC+DuEViAjXzgPHZs=;
        b=folnjqF0aKRuew+xhfxHFYWs8LU+t5rP5KIRDLS0LazdBGhH9vtd1rk3BObzT3m5/y
         ukLp+VvYZQ4Ov8BDfr5g28AkAWB4g/hxW1Ssb8KRkKEt5RbkmTW2rc739qTXAxeDDDUE
         iIwn+0jXiPiqotQdwWEEf4v2EV8llX8EjhKSrtIZFTH7mwFarOlyk1wE1w1aDt0GwCX9
         2i9+2hZ2zwdOB7u07/U9V1zz19XN4xpjHrLB6dRkyuWahGPwMFFO19gkHFqsD51e7KcF
         SGCnklBW6xXIGZNAIl9Y7eHS6bVtNiEuidNQcV2Z29dq9T8Xtl8zifCjWsz1/ZOz282N
         Y2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691198220; x=1691803020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cu168Y9vRpg+vzxEgSTGxY5n1ZLC+DuEViAjXzgPHZs=;
        b=gImG02vnvDQXI6IPCV8frI6v/YIxcqGo897D47WE+Op3Iv0BMhSnL8eekINdSpjU+V
         m/XBettZJXuzrT2q8lYv+L11EOfPoRykxBU2dV+T5pg9S/bb9/NUlNo7xtXJ3VD7xvU/
         pfHCxbMqHMYcSDMINg75KgGZYZ/7QmmcQ0rJ9PVKEc/5U1GdLKMt9fYWHL7jjVw5dNsM
         /9OmidSWNuD68R2nAzKiMefbTA+9z61msGxQiPznami1l9sfXak5lzoxJSqDyNnBlPHc
         QmpKCVj8PFyj9vKdlHnA6T4xZeSRsoLmptVA00D7q9DD0/ZZROEgTL31DZItfVntEFIA
         l++Q==
X-Gm-Message-State: AOJu0YwMXBhKkHxqQiDDKNpJMRW1b6DyzmK9qD/nF0FbNEN00JbDvGS1
	ww3et+FJBeA7fW7+7AWbBNMQ9DSbtkwqE+qbOFM=
X-Google-Smtp-Source: AGHT+IEuQ/dvOW7eFSBM63FzAr7WHgJtR9IpCyPZws0vFNx4oFHhozb1cWWML9qeqWJlkUR7TgqFe1XMIHdejPAlQbA=
X-Received: by 2002:a05:6870:ecac:b0:1b7:2edd:df6d with SMTP id
 eo44-20020a056870ecac00b001b72edddf6dmr3872658oab.10.1691198219991; Fri, 04
 Aug 2023 18:16:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7b87:0:b0:4f0:1250:dd51 with HTTP; Fri, 4 Aug 2023
 18:16:59 -0700 (PDT)
In-Reply-To: <CAJuCfpHYBqULvwNELO3Gkc0bkKDV7VJxMjvBru4zaAz4WKQNhw@mail.gmail.com>
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
 <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com>
 <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com>
 <CAJuCfpGWGsh2BRgwcJ7oVHnqZfrtiesvhzomK0ZmxE_KK=R7FA@mail.gmail.com>
 <CAJuCfpG6BBP+fjV9oyBx3SNiKhiafPzM9vV9bx_goO2aZzAptg@mail.gmail.com>
 <CAGudoHFrDG6-u-XXEmQoPS2CJ2Wpo4ETwhXc2R=jy78RSYw-Zg@mail.gmail.com> <CAJuCfpHYBqULvwNELO3Gkc0bkKDV7VJxMjvBru4zaAz4WKQNhw@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Sat, 5 Aug 2023 03:16:59 +0200
Message-ID: <CAGudoHGm2hbjSG-2kJevF=xGpz=4Sd0m5CjVO8Ntsahqz5NcGA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: jacobly.alt@gmail.com, regressions@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>, david@redhat.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, liam.howlett@oracle.com, bagasdotme@gmail.com, gregkh@linuxfoundation.org, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/5/23, Suren Baghdasaryan <surenb@google.com> wrote:
> On Fri, Aug 4, 2023 at 5:49=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> =
wrote:
>> However, the other users (that I know of ) go through the mmap
>> semaphore to mess with anything which means they will wait for
>> dup_mmap to finish (or do their work first). I would be surprised if
>> there were any cases which don't take the semaphore, given that it was
>> a requirement prior to the vma patchset (unless you patched some to no
>> longer need it?). I would guess worst case the semaphore can be added
>> if missing.
>
> No, the only mmap_lock read-lock that is affected is during the page
> fault, which is expected.
>

I have difficulty parsing your statement.

I am saying that any 3rd parties which can trigger page faults already
read lock mmap_lock or can be made to do it (and I don't know any case
which does not already, but I'm not willing to spend time poking
around to make sure). One can consider 3rd parties as not a problem,
modulo the audit.

Past that there does is no known source of trouble? In my original
e-mail I was worried about processes up the chain in ancestry, perhaps
some of the state is shared(?) and the locking at hand neuters any
problems. I'm guessing this is not necessary.

Bottom line though it looks like this will work fine?

That said, I'm not going to submit a patch I can't confidently defend.
As I did not dig into any of the VMA code and can't be arsed to audit
all places which mess with "foreign" mm, I'm definitely not submitting
this myself. You are most welcome to write your own variant at your
leisure. :)

--=20
Mateusz Guzik <mjguzik gmail.com>
