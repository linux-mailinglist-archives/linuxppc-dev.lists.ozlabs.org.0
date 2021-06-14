Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8EC3A5C60
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 07:22:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3KZw6PQnz308Z
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 15:22:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=R2OCkvoG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R2OCkvoG; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3KZQ17rPz2yYQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 15:22:03 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso9797329pjx.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 22:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=zXRwTbrh/K3eS4GeqF5tVOMDaKs8/nf83b4xU6oNDJA=;
 b=R2OCkvoGtONFbDWj/RF+6QX43RfS6j4nm7n5RT3xRzDDAF2m6hDiPv4AyQibcGScq7
 WKbfsN4ndiaVDGbhPcbc2JjDee3uVX1kzdmoid5CLtIyI8FVKDLonxjG1zpdD3LeEFj+
 UiYGxa7/qCkBm8o7nJ9v9yv+8ZAt1ESH/o9zQEf6FxLyjoa5l3HWVAyk+P97wrQSvT4f
 dUwgZRPfPci9MmR18ygF7fr5mUYtFw2PmOddequIKZdLG1y8Pad2Js1Q4ujLYkZ6AjZO
 ZFtt1SjycSMLUIHILcZibC/u+I2Muyp958VC4YnlLBTsmqzX8wl24hU8zEd0CDx19DhG
 wtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=zXRwTbrh/K3eS4GeqF5tVOMDaKs8/nf83b4xU6oNDJA=;
 b=CwVqjm7pCC+sZHd9FArnBDmw3MvtjroN4ODzD6WUb+2asCrH91fCs1+6BQpGJk57Ru
 LiGC7HMMAVPgb/chjsxIz0OiLE/kZbsPCdQhUgv1oEANSQLcA4Z+zYAkusix7Unn0XQk
 WJO7JYLze9iLIRBr4DdhvmXkV33RcHPsRfxMXNqevDKCP3oJdLXHmCg/pYkZycqFiTAC
 bgK8njY4rkoKUsiHjl5OeaYDP9Qf5eHaQ8I7s75rNeE4ht2iKgYrUDCxitJy1tVQzkcj
 hUqjOxfKfgn13OI6+z/Mhut18ktwFcl59cmeT58b5474kXVgGdSR3R61m2QHrkDtJ4N8
 PM2w==
X-Gm-Message-State: AOAM533Ve6wqxX5v0+JSDNJoIDLs5XxIsm8PaASKDlSEpJaG9LzCJiJ1
 9hIlu9T2AW5g3ZDD4YN0SlQ=
X-Google-Smtp-Source: ABdhPJysfNmaZR6IzSqs8m/23zdxZolw4jBNOHlHsh5k2TYE2GTWU8+taYxJ1rdglkacUW+L7AVXJA==
X-Received: by 2002:a17:90a:65c8:: with SMTP id
 i8mr21750401pjs.207.1623648121056; 
 Sun, 13 Jun 2021 22:22:01 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id t5sm10919034pfe.116.2021.06.13.22.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 22:22:00 -0700 (PDT)
Date: Mon, 14 Jun 2021 15:21:55 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 2/4] lazy tlb: allow lazy tlb mm refcounting to be
 configurable
To: Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski
 <luto@kernel.org>
References: <20210605014216.446867-1-npiggin@gmail.com>
 <20210605014216.446867-3-npiggin@gmail.com>
 <8ac1d420-b861-f586-bacf-8c3949e9b5c4@kernel.org>
 <1623629185.fxzl5xdab6.astroid@bobo.none>
 <02e16a2f-2f58-b4f2-d335-065e007bcea2@kernel.org>
 <1623643443.b9twp3txmw.astroid@bobo.none>
 <1623645385.u2cqbcn3co.astroid@bobo.none>
In-Reply-To: <1623645385.u2cqbcn3co.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1623647326.0np4yc0lo0.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of June 14, 2021 2:47 pm:
> Excerpts from Nicholas Piggin's message of June 14, 2021 2:14 pm:
>> Excerpts from Andy Lutomirski's message of June 14, 2021 1:52 pm:
>>> On 6/13/21 5:45 PM, Nicholas Piggin wrote:
>>>> Excerpts from Andy Lutomirski's message of June 9, 2021 2:20 am:
>>>>> On 6/4/21 6:42 PM, Nicholas Piggin wrote:
>>>>>> Add CONFIG_MMU_TLB_REFCOUNT which enables refcounting of the lazy tl=
b mm
>>>>>> when it is context switched. This can be disabled by architectures t=
hat
>>>>>> don't require this refcounting if they clean up lazy tlb mms when th=
e
>>>>>> last refcount is dropped. Currently this is always enabled, which is
>>>>>> what existing code does, so the patch is effectively a no-op.
>>>>>>
>>>>>> Rename rq->prev_mm to rq->prev_lazy_mm, because that's what it is.
>>>>>
>>>>> I am in favor of this approach, but I would be a lot more comfortable
>>>>> with the resulting code if task->active_mm were at least better
>>>>> documented and possibly even guarded by ifdefs.
>>>>=20
>>>> active_mm is fairly well documented in Documentation/active_mm.rst IMO=
.
>>>> I don't think anything has changed in 20 years, I don't know what more
>>>> is needed, but if you can add to documentation that would be nice. May=
be
>>>> moving a bit of that into .c and .h files?
>>>>=20
>>>=20
>>> Quoting from that file:
>>>=20
>>>   - however, we obviously need to keep track of which address space we
>>>     "stole" for such an anonymous user. For that, we have "tsk->active_=
mm",
>>>     which shows what the currently active address space is.
>>>=20
>>> This isn't even true right now on x86.
>>=20
>> From the perspective of core code, it is. x86 might do something crazy=20
>> with it, but it has to make it appear this way to non-arch code that
>> uses active_mm.
>>=20
>> Is x86's scheme documented?
>>=20
>>> With your patch applied:
>>>=20
>>>  To support all that, the "struct mm_struct" now has two counters: a
>>>  "mm_users" counter that is how many "real address space users" there a=
re,
>>>  and a "mm_count" counter that is the number of "lazy" users (ie anonym=
ous
>>>  users) plus one if there are any real users.
>>>=20
>>> isn't even true any more.
>>=20
>> Well yeah but the active_mm concept hasn't changed. The refcounting=20
>> change is hopefully reasonably documented?
>>=20
>>>=20
>>>=20
>>>>> x86 bare metal currently does not need the core lazy mm refcounting, =
and
>>>>> x86 bare metal *also* does not need ->active_mm.  Under the x86 schem=
e,
>>>>> if lazy mm refcounting were configured out, ->active_mm could become =
a
>>>>> dangling pointer, and this makes me extremely uncomfortable.
>>>>>
>>>>> So I tend to think that, depending on config, the core code should
>>>>> either keep ->active_mm [1] alive or get rid of it entirely.
>>>>=20
>>>> I don't actually know what you mean.
>>>>=20
>>>> core code needs the concept of an "active_mm". This is the mm that you=
r=20
>>>> kernel threads are using, even in the unmerged CONFIG_LAZY_TLB=3Dn pat=
ch,
>>>> active_mm still points to init_mm for kernel threads.
>>>=20
>>> Core code does *not* need this concept.  First, it's wrong on x86 since
>>> at least 4.15.  Any core code that actually assumes that ->active_mm is
>>> "active" for any sensible definition of the word active is wrong.
>>> Fortunately there is no such code.
>>>=20
>>> I looked through all active_mm references in core code.  We have:
>>>=20
>>> kernel/sched/core.c: it's all refcounting, although it's a bit tangled
>>> with membarrier.
>>>=20
>>> kernel/kthread.c: same.  refcounting and membarrier stuff.
>>>=20
>>> kernel/exit.c: exit_mm() a BUG_ON().
>>>=20
>>> kernel/fork.c: initialization code and a warning.
>>>=20
>>> kernel/cpu.c: cpu offline stuff.  wouldn't be needed if active_mm went =
away.
>>>=20
>>> fs/exec.c: nothing of interest
>>=20
>> I might not have been clear. Core code doesn't need active_mm if=20
>> active_mm somehow goes away. I'm saying active_mm can't go away because
>> it's needed to support (most) archs that do lazy tlb mm switching.
>>=20
>> The part I don't understand is when you say it can just go away. How?=20
>>=20
>>> I didn't go through drivers, but I maintain my point.  active_mm is
>>> there for refcounting.  So please don't just make it even more confusin=
g
>>> -- do your performance improvement, but improve the code at the same
>>> time: get rid of active_mm, at least on architectures that opt out of
>>> the refcounting.
>>=20
>> powerpc opts out of the refcounting and can not "get rid of active_mm".
>> Not even in theory.
>=20
> That is to say, it does do a type of reference management that requires=20
> active_mm so you can argue it has not entirely opted out of refcounting.
> But we're not just doing refcounting for the sake of refcounting! That
> would make no sense.
>=20
> active_mm is required because that's the mm that we have switched to=20
> (from core code's perspective), and it is integral to know when to=20
> switch to a different mm. See how active_mm is a fundamental concept
> in core code? It's part of the contract between core code and the
> arch mm context management calls. reference counting follows from there
> but it's not the _reason_ for this code.
>=20
> Pretend the reference problem does not exit (whether by refcounting or=20
> shootdown or garbage collection or whatever). We still can't remove=20
> active_mm! We need it to know how to call into arch functions like=20
> switch_mm.
>=20
> I don't know if you just forgot that critical requirement in your above=20
> list, or you actually are entirely using x86's mental model for this=20
> code which is doing something entirely different that does not need it=20
> at all. If that is the case I really don't mind some cleanup or wrapper=20
> functions for x86 do entirely do its own thing, but if that's the case
> you can't criticize core code's use of active_mm due to the current
> state of x86. It's x86 that needs documentation and cleaning up.

Ah, that must be where your confusion is coming from: x86's switch_mm=20
doesn't use prev anywhere, and the reference scheme it is using appears=20
to be under-documented, although vague references in changelogs suggest=20
it has not actually "opted out" of active_mm refcounting.

That's understandable, but please redirect your objections to the proper=20
place. git blame suggests 3d28ebceaffab.

Thanks,
Nick
