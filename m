Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 516C43EBC55
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 21:00:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmXtl1jmLz3cWs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 05:00:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=RLK3xUK3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=RLK3xUK3; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmXt36z4fz3bjK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Aug 2021 04:59:37 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id r9so12140210lfn.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 11:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IkdhgNopT40xrLBIwsMwp7xot6YqUnlD6M0VTKI4Un8=;
 b=RLK3xUK3bEGpxgGuy1zLolLiG174+veKzBMATo6QlHmzBHc4J7r7zCAZaKUOnlyT3o
 VhYwJ3Dx9F5/D/0a7GzWt9jrGNDOoZ8bho0cljj00lDq96HAG+bvY8CiNZzDH16DBggV
 ETTzc+DhoDUeqllck8NFAwJ3jcXzaKpEEY2xzibqOz5w65AVE2C+smEKwXifwitKkWTO
 HkW00sUVzMhd3rB6NawIR1ih56hnF7xc8LfK28j4eXhMl1zoxI9RY5dFb3t9RAsXtOBg
 bxbshxVCu038Y8Z2Mm1wI29mVQo4QZ4gAk1o0x21UliOhLVHA3NV09KWJFkC7Td3wn8D
 LUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IkdhgNopT40xrLBIwsMwp7xot6YqUnlD6M0VTKI4Un8=;
 b=GvRXCL+0oh1Cy6OZtD7yREueX8s7w5N2beHgsRNyC8uuP/KfJMhdDP2jC/wLUoFTeD
 CasG1xICxGlde7ng1nL35OlkSkWVzOn/PBGYN0WE6Mo8A5POXZaZ3pVNBfqZsXhGL4to
 E9VfVY+XArb97Ur9SFobPbRL5kcFJXmFvdZZmb9EoIuV60Wtgev9kqbsSgr9+XN08gxT
 0ItNf/zCnk/larQRPTH6nrVDVgT7J9JYk06cgcKRvmO48ffZ3eiqLC2d1zqBwzZfggV5
 +Fl5CtQ5lcXa9BqLZhTP9YNPqn+viEzbm1R8QxoIOlOyuRqDlwycKRbsjtlLMxF5KOme
 MpyQ==
X-Gm-Message-State: AOAM53171ZAYykYs1gh+RyaF5nhSMAglFRd2TA8q5UfgZyyOFnrwHEO+
 d69bqHju7q661C7BqMWHL+6507qIPw5ovAPgSW+Tiw==
X-Google-Smtp-Source: ABdhPJwsIOeMmC9VnBS83ZxAW4s1cMc3L/OGiW0XzMjYW2gzyzggGU/mQ9BcfuNqon7n/4/vbP5xAEnVWftjqmyMi4I=
X-Received: by 2002:a05:6512:3041:: with SMTP id
 b1mr2588473lfb.122.1628881172555; 
 Fri, 13 Aug 2021 11:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210812204951.1551782-1-morbo@google.com>
 <87sfzde8lk.fsf@linkitivity.dja.id.au>
 <CAGG=3QUz2LNgC8Hn6rU68ejjv4=J9Uidef0oH9A7=sKTs+vf7g@mail.gmail.com>
In-Reply-To: <CAGG=3QUz2LNgC8Hn6rU68ejjv4=J9Uidef0oH9A7=sKTs+vf7g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 13 Aug 2021 11:59:21 -0700
Message-ID: <CAKwvOd=rN9s5YBtt-AMnaqXhYCsAT=6yp29_oomRvTaev6Q6zw@mail.gmail.com>
Subject: Re: [PATCH] ppc: add "-z notext" flag to disable diagnostic
To: Bill Wendling <morbo@google.com>
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
Cc: Fangrui Song <maskray@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 13, 2021 at 11:24 AM Bill Wendling <morbo@google.com> wrote:
>
> BTW, this patch should more properly be attributed to Fangrui Song. I
> can send a follow-up patch that reflects this and adds more context to
> the commit message.

Sounds good to me. The TL;DR is that LLD has a different implicit
default for `-z text` vs `-z notext` than BFD.  We can emulate the
behavior or BFD by simply being explicit about `-z notext` always.

Or we can dig through why there are relocations in read only sections,
fix those, then enable `-z text` for all linkers.  My recommendation
would be get the thing building, then go digging time permitting.
-- 
Thanks,
~Nick Desaulniers
