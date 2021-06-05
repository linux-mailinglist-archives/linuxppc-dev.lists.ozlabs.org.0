Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 953E339C442
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 02:18:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxgGC0srNz3bry
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 10:18:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ooclrGet;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ooclrGet; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxgFk4Vtmz2xtt
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 10:18:01 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id v14so9119137pgi.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jun 2021 17:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=/jqiL/qTfJjmBNhopBIMzK+jxUaOluXuMLOEamwPvz4=;
 b=ooclrGet83DUu230tf4FqjEw2jni37mOcex/cGUcFjMlNdwwCLSISFDiNRYVGZ9NQA
 B4SgPsfHY6NHGf+Gp66PHRzYG/TuTxaFDmhYJhFKvW/6CFD1XZdBVUoDjbjWjY8FD6oh
 t9nz3xwRWtomGIQkOo8YDeWKAC17Y1UmYvFzpar/5hOKvXSH6R2IfU0ngKebihdFo86X
 VAWza+XExghJ6BtC+oyThvexpU6t7NfhWBExIhZJENY8GlAF6gPpaMAgdHMO2s/qUW5V
 4TnJfwhemtLgA49w4ebjwlJ4GOhiqZDiQUS6bn4D5Y2ZoQBlU7zppo8mkYcZ1Gpiybv0
 dF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=/jqiL/qTfJjmBNhopBIMzK+jxUaOluXuMLOEamwPvz4=;
 b=GbWOT3U1M/9+WVw+UF3vQSa58S63l90aCjGoS8Ef6BHxv50ha/sVR6XzzjzIDrxIDK
 RRc5q5F3SQFMK2CnzReLXlNJz6WQyLLsQEkzzbnyHNPswJcXlCA1puQp4wAu5vz6bkyL
 iarTgCkNivD3uK+ZAFj580jc453V6qXub463TF3ZyVarDw+jBKPL1zUSYLNV2PriIHG6
 IYyYxGmF1MqwTT4o8v4SMaDX4n4+8tDoCUq/sYlIozDhWKcyOtCYPubNNg1s9ARm+861
 2En4txwnDt2NoS8ipiVmBN4Fx556010DTYM3K+S+S53YGDSk+BAxmDBG968LpCnslUHB
 VzZQ==
X-Gm-Message-State: AOAM532i4bB0P8upraGjL/1VID57HtchGsXNwQrRUiC/8+8l/E6HiDf+
 96+jouQ7wsEr7UGiA7Mr9As=
X-Google-Smtp-Source: ABdhPJxX5xGQ+5qD398du3WDmRtK/4PslOYTIhUdOtbETp67cATNtF6hZ89Y4CwdJ6aYpZEVsE0mEw==
X-Received: by 2002:a63:8c09:: with SMTP id m9mr1584275pgd.392.1622852276317; 
 Fri, 04 Jun 2021 17:17:56 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l126sm2665004pfl.16.2021.06.04.17.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 17:17:56 -0700 (PDT)
Date: Sat, 05 Jun 2021 10:17:50 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/4] shoot lazy tlbs
To: Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski
 <luto@kernel.org>
References: <20210601062303.3932513-1-npiggin@gmail.com>
 <603ffd67-3638-4c47-8067-c1bdfdf65f1b@kernel.org>
 <991660c3-c2bf-c303-a55c-7454f0cc45f7@kernel.org>
In-Reply-To: <991660c3-c2bf-c303-a55c-7454f0cc45f7@kernel.org>
MIME-Version: 1.0
Message-Id: <1622851909.wxi3vcx3m8.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andy Lutomirski's message of June 5, 2021 3:05 am:
> On 6/4/21 9:54 AM, Andy Lutomirski wrote:
>> On 5/31/21 11:22 PM, Nicholas Piggin wrote:
>>> There haven't been objections to the series since last posting, this
>>> is just a rebase and tidies up a few comments minor patch rearranging.
>>>
>>=20
>> I continue to object to having too many modes.  I like my more generic
>> improvements better.  Let me try to find some time to email again.
>>=20
>=20
> Specifically, this:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git/commit/?h=
=3Dx86/mm

That's worse than what powerpc does with the shoot lazies code so=20
we wouldn't use it anyway.

The fact is mm-cpumask and lazy mm is very architecture specific, so I=20
don't really see that another "mode" is such a problem, it's for the=20
most part "this is what powerpc does" -> "this is what powerpc does".
The only mode in the context switch is just "take a ref on the lazy mm"
or "don't take a ref". Surely that's not too onerous to add!?

Actually the bigger part of it is actually the no-lazy mmu mode which
is not yet used, I thought it was a neat little demonstrator of how code
works with/without lazy but I will get rid of that for submission.


> I, or someone, needs to dust off my membarrier series before any of
> these kinds of changes get made.  The barrier situation in the scheduler
> is too confusing otherwise.
>=20

I disagree, I've disentangled the changes from membarrier stuff now,=20
they can be done concurrently.

Thanks,
Nick
