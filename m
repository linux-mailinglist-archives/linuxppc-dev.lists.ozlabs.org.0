Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5FE770CC8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 02:50:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XmzIcXyh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHkWr01d8z3cT9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 10:50:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XmzIcXyh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=mjguzik@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHkVt33DSz2y1f
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 10:49:25 +1000 (AEST)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-56d0f4180bbso1817416eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 17:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691196562; x=1691801362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nC9Fhp6TCZrfcsmijl3oHForktkxpl5KZQtthV/moAA=;
        b=XmzIcXyhQzhX0FXd8abVbQ5vr4GQvF4B/upe2YhV2MbIpYJSp3DkmZkY8TECMAlUIO
         WTCgMfn4Q+QmGNgw5cF3/z4UPZZCrjcK06FTQK6nFocskU3E2ESjAZQKAMF8AGg+DMz5
         MO/+48/nM4TtIms6jxkF/nU69cRPi7qCbe3ga4fesKfond5NR6g8vqfG+kg5tKPtkG4B
         scnFviFayDlXJfvqxb8d0Hr78wsFREepRUuFuH3JDcVrM0MMfBKqUb3Wk8RGV6MN/uFC
         SkgBj0Y3rmrQFm+1ZDAKmujRBFq1sNfUlOtaEpuGina78P8a+RZNBnHiTZNuYJF/qawW
         XPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691196562; x=1691801362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nC9Fhp6TCZrfcsmijl3oHForktkxpl5KZQtthV/moAA=;
        b=D9mWK4gL8I9OcC6CV0z2XX/KcSwtQVCqqIBZT/wqfu7YEqeRD39EPnW+sIHCS5rFIV
         N79eAQDFl3N5paXalQZpuFeyVhIN3Ls/lrgCz6c3ISA24SnQgQ5e0Ab+88Zyxnrqr8Yu
         gTeUipnPNhUtH4CY3tlZvwzW/G0fSe0OW1liLGFdlWIucnqjBLPUrZIn5GEp4hNyT/9m
         VDr8fV3ePgM+0ttZg6V749MoAem3EJ1YCZiO4+3H9X9gWS4Q3+wtgwX1xzokgVBlUKOh
         HVAe989WcF0XHfAWe3nb1fB/lRn7QBTRQHQHyTJeN+JXEmKZKou1/taQjDYbWWa2Xwl2
         l7qA==
X-Gm-Message-State: AOJu0Yy0GIt2ZAlpk4zkE897NjhJUiCMj/0A9odK4O1QtnpBFGloArKa
	j+MIqpadAJFckgx/z0g0Qi3M4dayissNHLHWVRA=
X-Google-Smtp-Source: AGHT+IFJ+zkF1c25z6S1/ksUOcukPgYD1oIxbWZwbBc/q6VFA3C2X7rYVDo6kvHYGGGXWhwRyRW6wkXCag6tb5+ZQqw=
X-Received: by 2002:a4a:7651:0:b0:566:ed69:422d with SMTP id
 w17-20020a4a7651000000b00566ed69422dmr3497184ooe.7.1691196562165; Fri, 04 Aug
 2023 17:49:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7b87:0:b0:4f0:1250:dd51 with HTTP; Fri, 4 Aug 2023
 17:49:21 -0700 (PDT)
In-Reply-To: <CAJuCfpG6BBP+fjV9oyBx3SNiKhiafPzM9vV9bx_goO2aZzAptg@mail.gmail.com>
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
 <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com>
 <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com>
 <CAJuCfpGWGsh2BRgwcJ7oVHnqZfrtiesvhzomK0ZmxE_KK=R7FA@mail.gmail.com> <CAJuCfpG6BBP+fjV9oyBx3SNiKhiafPzM9vV9bx_goO2aZzAptg@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Sat, 5 Aug 2023 02:49:21 +0200
Message-ID: <CAGudoHFrDG6-u-XXEmQoPS2CJ2Wpo4ETwhXc2R=jy78RSYw-Zg@mail.gmail.com>
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
> On Fri, Aug 4, 2023 at 5:26=E2=80=AFPM Suren Baghdasaryan <surenb@google.=
com>
> wrote:
>>
>> On Fri, Aug 4, 2023 at 5:15=E2=80=AFPM Linus Torvalds
>> <torvalds@linux-foundation.org> wrote:
>> >
>> > On Fri, 4 Aug 2023 at 16:25, Mateusz Guzik <mjguzik@gmail.com> wrote:
>> > >
>> > > I know of these guys, I think they are excluded as is -- they go
>> > > through access_remote_vm, starting with:
>> > >         if (mmap_read_lock_killable(mm))
>> > >                 return 0;
>> > >
>> > > while dup_mmap already write locks the parent's mm.
>> >
>> > Oh, you're only worried about vma_start_write()?
>> >
>> > That's a non-issue. It doesn't take the lock normally, since it starts
>> > off with
>> >
>> >         if (__is_vma_write_locked(vma, &mm_lock_seq))
>> >                 return;
>> >
>> > which catches on the lock sequence number already being set.
>>
>> That check will prevent re-locking but if vma is not already locked
>> then the call will proceed with obtaining the lock and setting
>> vma->vm_lock_seq to mm->mm_lock_seq.
>
> The optimization Mateusz describes looks valid to me. If there is
> nobody else to fault a page and mm_users is stable (which I think it
> is because we are holding mmap_lock for write) then we can skip vma
> locking, I think.
>

mm_users is definitely *not* stable -- it can be bumped by
get_task_mm, which is only synchronized with task lock.

However, the other users (that I know of ) go through the mmap
semaphore to mess with anything which means they will wait for
dup_mmap to finish (or do their work first). I would be surprised if
there were any cases which don't take the semaphore, given that it was
a requirement prior to the vma patchset (unless you patched some to no
longer need it?). I would guess worst case the semaphore can be added
if missing.

What is guaranteed is that if the forking process is single-threaded,
there will be no threads added out of nowhere -- the only thread which
could do it is busy creating one in dup_mmap. If multithreaded
operation of the forking process was the only problem, that's it.

>>
>> >
>> > So no extra locking there.
>> >
>> > Well, technically there's extra locking because the code stupidly
>> > doesn't initialize new vma allocations to the right sequence number,
>> > but that was talked about here:
>> >
>> >
>> > https://lore.kernel.org/all/CAHk-=3DwiCrWAoEesBuoGoqqufvesicbGp3cX0LyK=
gEvsFaZNpDA@mail.gmail.com/
>> >
>> > and it's a separate issue.
>> >
>> >           Linus
>


--=20
Mateusz Guzik <mjguzik gmail.com>
