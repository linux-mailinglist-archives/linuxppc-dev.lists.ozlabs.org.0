Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BE23A5B2E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 02:46:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3CRs0DQVz301F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 10:46:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mm2A1acB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mm2A1acB; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3CRK6yRYz2xZk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 10:45:33 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id k15so9310942pfp.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 17:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=XxuG7Ca+3NTnEr0aQpNCozkotiEBll347Hs/ZeeBTEE=;
 b=mm2A1acBjDH7g2IowT4ikVA0PGuvvUKAqKzu0e1WiA7lFyUa/IlSllbZTfUlcwYGgI
 SwY2xIh2GjsYJSZkx8ezsCjaRxCJeKFP0aBwLHlECyiXyLU3CQsShC9mUFO88Jo2GW7j
 jHkGQsMV153/u1T9xp86sMn5EyV+97RBdP+HkwVmjTTcpG7/AwiY6g0VhXL00nWz6Ikz
 E6UhlEfr1QOet/Kb36AM9BRuYqt4j0SORqJJ4Ja0XHE13zOobYtwVo2w1hZS7ifKGRQG
 jrIlNZOrfeETCuB9HlDjdKurGlFn369VV65lIgM1JiNWrQ3vmKG7pG6rg48DFQu3FPjt
 wAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=XxuG7Ca+3NTnEr0aQpNCozkotiEBll347Hs/ZeeBTEE=;
 b=BzMWaLkP3qU8EbyIWwor5nubiaIToaQzpHn8hXnAXlwq7m93N4Ixh6OJ5hY2Teo72+
 fDKODTp3ATyrX1XK6sdLRGEvujWhh5i8cQMXM/GGutxquA52OA39epftclzOYA1Q6mdo
 Jb4x8URQLTyvkAW9wS6h9XWM20gE4U+lUPdlnJzbAsih9k5NAJh0nnWEjlrbkKT0vZNz
 kNSYcwSpu65g3NCQeciE9fqwtyIaTmwzMdB2/ZdJfaOWViTD9weM+/nupFZCtwaLz/ig
 2rKot59Y+m+iOE/g82ou0z7Ohc39c/3X9PIJTUG2/V++/euDQiVwHB7ONkRVxb137zqe
 25aw==
X-Gm-Message-State: AOAM530Dj+nULjP6oU2je8o+xuuSKGZaDuihcEm6aTM9XIKWZsaQd4OJ
 gAvEuqlYkh/yrxUpG+vduqg=
X-Google-Smtp-Source: ABdhPJx0cMBzdEpBTdoXhdRfERuKep5LD+E6eqItgLbvkLf7+nCitT8/U5nRSCNsZiXV0o1/PEHbmw==
X-Received: by 2002:a62:bd14:0:b029:2de:8bf7:2df8 with SMTP id
 a20-20020a62bd140000b02902de8bf72df8mr19268697pff.60.1623631527972; 
 Sun, 13 Jun 2021 17:45:27 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id em22sm2575307pjb.27.2021.06.13.17.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 17:45:27 -0700 (PDT)
Date: Mon, 14 Jun 2021 10:45:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 2/4] lazy tlb: allow lazy tlb mm refcounting to be
 configurable
To: Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski
 <luto@kernel.org>
References: <20210605014216.446867-1-npiggin@gmail.com>
 <20210605014216.446867-3-npiggin@gmail.com>
 <8ac1d420-b861-f586-bacf-8c3949e9b5c4@kernel.org>
In-Reply-To: <8ac1d420-b861-f586-bacf-8c3949e9b5c4@kernel.org>
MIME-Version: 1.0
Message-Id: <1623629185.fxzl5xdab6.astroid@bobo.none>
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

Excerpts from Andy Lutomirski's message of June 9, 2021 2:20 am:
> On 6/4/21 6:42 PM, Nicholas Piggin wrote:
>> Add CONFIG_MMU_TLB_REFCOUNT which enables refcounting of the lazy tlb mm
>> when it is context switched. This can be disabled by architectures that
>> don't require this refcounting if they clean up lazy tlb mms when the
>> last refcount is dropped. Currently this is always enabled, which is
>> what existing code does, so the patch is effectively a no-op.
>>=20
>> Rename rq->prev_mm to rq->prev_lazy_mm, because that's what it is.
>=20
> I am in favor of this approach, but I would be a lot more comfortable
> with the resulting code if task->active_mm were at least better
> documented and possibly even guarded by ifdefs.

active_mm is fairly well documented in Documentation/active_mm.rst IMO.
I don't think anything has changed in 20 years, I don't know what more
is needed, but if you can add to documentation that would be nice. Maybe
moving a bit of that into .c and .h files?

> x86 bare metal currently does not need the core lazy mm refcounting, and
> x86 bare metal *also* does not need ->active_mm.  Under the x86 scheme,
> if lazy mm refcounting were configured out, ->active_mm could become a
> dangling pointer, and this makes me extremely uncomfortable.
>=20
> So I tend to think that, depending on config, the core code should
> either keep ->active_mm [1] alive or get rid of it entirely.

I don't actually know what you mean.

core code needs the concept of an "active_mm". This is the mm that your=20
kernel threads are using, even in the unmerged CONFIG_LAZY_TLB=3Dn patch,
active_mm still points to init_mm for kernel threads.

We could hide that idea behind an active_mm() function that would always=20
return &init_mm if mm=3D=3DNULL, but you still have the concept of an activ=
e
mm and a pointer that callers must not access after free (because some
cases will be CONFIG_LAZY_TLB=3Dy).

> [1] I don't really think it belongs in task_struct at all.  It's not a
> property of the task.  It's the *per-cpu* mm that the core code is
> keeping alive for lazy purposes.  How about consolidating it with the
> copy in rq?

I agree it's conceptually a per-cpu property. I don't know why it was=20
done this way, maybe it was just convenient and works well for mm and=20
active_mm to be adjacent. Linus might have a better insight.

> I guess the short summary of my opinion is that I like making this
> configurable, but I do not like the state of the code.

I don't think I'd object to moving active_mm to rq and converting all
usages to active_mm() while we're there, it would make things a bit
more configurable. But I don't see it making core code fundamentally
less complex... if you're referring to the x86 mm switching monstrosity,
then that's understandable, but I admit I haven't spent enough time
looking at it to make a useful comment. A patch would be enlightening,
I have the leftover CONFIG_LAZY_TLB=3Dn patch if you were thinking of=20
building on that I can send it to you.

Thanks,
Nick
