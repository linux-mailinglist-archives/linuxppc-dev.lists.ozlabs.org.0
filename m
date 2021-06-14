Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 290233A5BF1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 06:15:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3J565cMcz307H
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 14:15:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NojfaKJj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NojfaKJj; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3J4b0MYcz2xtt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 14:14:38 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id p13so9616161pfw.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 21:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=v/XuIpHevb/aG8jpf/7Tm8j/ZOeYAcDGTVZ1vzayZjU=;
 b=NojfaKJjF7I+vmtv4AudrQr4fZ31clBSdSoSrNhvRiaaoRjP0hcOq5zjoUqwZfbem6
 kiqEbm/fR8rhUyje5JHyzQowYnBent1WxnPR87dcUzIvCwZiD5vPzkd8Y1HFHXFjQw+S
 PDIObhwXt0GSqqdRKsNV0ystEt1Xgewa502VdNSoGsz+8RvP4NNke5pqdEPKG61sIjR9
 zrIprtfx8A/XGEVyRokS+9xX13juCsdGYHKt1AYCpjqn3m/4XDWT8RsXoQc9O8NDy0aO
 cNW0omXvFEDHnNBcHnspbapQhp1VZDoduxDuIp9R0Z/xkjjWDccti8eSd/3aTu6yL0ET
 +9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=v/XuIpHevb/aG8jpf/7Tm8j/ZOeYAcDGTVZ1vzayZjU=;
 b=tin/QLtI1J0sW8uymb0UvY8THRnASgH0Dok/s8EGK6zgfmXIMu0uJ5rD2dy2xVcnoO
 +XPeoeKpd9YX8DK6bKj5J0MabjVYOar4Yb2iwoli8NSW7h/bKOQilLvc24b4QNfy+ScQ
 8fPS6xamgzedKo8JOg9BuV3qabMnIYd6vvgTMRF2DmpEA65tGyuSkmW69018ezLey2sZ
 KKQq3Uy2TF+dozhRYiyiIUtgV1Tf9L999sgXdyak+sIa9VXNXBildoqK2orCj26CdOoc
 zN4dglizOPglfffRFzvT5JVmJDsnOgb0s9OCiorAhH0XZdib3wirSL8dmQuD6Vef809h
 prhQ==
X-Gm-Message-State: AOAM533CLEoYmJlBv/I04T8u6/4jhiUzewkfA/HCWsI2Th5RHpbfzmG/
 Sv1CakcVImcPCYlUa5ggN18=
X-Google-Smtp-Source: ABdhPJzZ9wnEZy27inqEptZjfCkLwrs5I5k1jE6HA2lgrlXlaM2wxjhHPW1eMgPD2Ba7RIpvdKtaWA==
X-Received: by 2002:a65:584c:: with SMTP id s12mr2898768pgr.309.1623644072944; 
 Sun, 13 Jun 2021 21:14:32 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id fw16sm15749448pjb.30.2021.06.13.21.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 21:14:32 -0700 (PDT)
Date: Mon, 14 Jun 2021 14:14:27 +1000
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
In-Reply-To: <02e16a2f-2f58-b4f2-d335-065e007bcea2@kernel.org>
MIME-Version: 1.0
Message-Id: <1623643443.b9twp3txmw.astroid@bobo.none>
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

Excerpts from Andy Lutomirski's message of June 14, 2021 1:52 pm:
> On 6/13/21 5:45 PM, Nicholas Piggin wrote:
>> Excerpts from Andy Lutomirski's message of June 9, 2021 2:20 am:
>>> On 6/4/21 6:42 PM, Nicholas Piggin wrote:
>>>> Add CONFIG_MMU_TLB_REFCOUNT which enables refcounting of the lazy tlb =
mm
>>>> when it is context switched. This can be disabled by architectures tha=
t
>>>> don't require this refcounting if they clean up lazy tlb mms when the
>>>> last refcount is dropped. Currently this is always enabled, which is
>>>> what existing code does, so the patch is effectively a no-op.
>>>>
>>>> Rename rq->prev_mm to rq->prev_lazy_mm, because that's what it is.
>>>
>>> I am in favor of this approach, but I would be a lot more comfortable
>>> with the resulting code if task->active_mm were at least better
>>> documented and possibly even guarded by ifdefs.
>>=20
>> active_mm is fairly well documented in Documentation/active_mm.rst IMO.
>> I don't think anything has changed in 20 years, I don't know what more
>> is needed, but if you can add to documentation that would be nice. Maybe
>> moving a bit of that into .c and .h files?
>>=20
>=20
> Quoting from that file:
>=20
>   - however, we obviously need to keep track of which address space we
>     "stole" for such an anonymous user. For that, we have "tsk->active_mm=
",
>     which shows what the currently active address space is.
>=20
> This isn't even true right now on x86.

From the perspective of core code, it is. x86 might do something crazy=20
with it, but it has to make it appear this way to non-arch code that
uses active_mm.

Is x86's scheme documented?

> With your patch applied:
>=20
>  To support all that, the "struct mm_struct" now has two counters: a
>  "mm_users" counter that is how many "real address space users" there are=
,
>  and a "mm_count" counter that is the number of "lazy" users (ie anonymou=
s
>  users) plus one if there are any real users.
>=20
> isn't even true any more.

Well yeah but the active_mm concept hasn't changed. The refcounting=20
change is hopefully reasonably documented?

>=20
>=20
>>> x86 bare metal currently does not need the core lazy mm refcounting, an=
d
>>> x86 bare metal *also* does not need ->active_mm.  Under the x86 scheme,
>>> if lazy mm refcounting were configured out, ->active_mm could become a
>>> dangling pointer, and this makes me extremely uncomfortable.
>>>
>>> So I tend to think that, depending on config, the core code should
>>> either keep ->active_mm [1] alive or get rid of it entirely.
>>=20
>> I don't actually know what you mean.
>>=20
>> core code needs the concept of an "active_mm". This is the mm that your=20
>> kernel threads are using, even in the unmerged CONFIG_LAZY_TLB=3Dn patch=
,
>> active_mm still points to init_mm for kernel threads.
>=20
> Core code does *not* need this concept.  First, it's wrong on x86 since
> at least 4.15.  Any core code that actually assumes that ->active_mm is
> "active" for any sensible definition of the word active is wrong.
> Fortunately there is no such code.
>=20
> I looked through all active_mm references in core code.  We have:
>=20
> kernel/sched/core.c: it's all refcounting, although it's a bit tangled
> with membarrier.
>=20
> kernel/kthread.c: same.  refcounting and membarrier stuff.
>=20
> kernel/exit.c: exit_mm() a BUG_ON().
>=20
> kernel/fork.c: initialization code and a warning.
>=20
> kernel/cpu.c: cpu offline stuff.  wouldn't be needed if active_mm went aw=
ay.
>=20
> fs/exec.c: nothing of interest

I might not have been clear. Core code doesn't need active_mm if=20
active_mm somehow goes away. I'm saying active_mm can't go away because
it's needed to support (most) archs that do lazy tlb mm switching.

The part I don't understand is when you say it can just go away. How?=20

> I didn't go through drivers, but I maintain my point.  active_mm is
> there for refcounting.  So please don't just make it even more confusing
> -- do your performance improvement, but improve the code at the same
> time: get rid of active_mm, at least on architectures that opt out of
> the refcounting.

powerpc opts out of the refcounting and can not "get rid of active_mm".
Not even in theory.

Thanks,
Nick
