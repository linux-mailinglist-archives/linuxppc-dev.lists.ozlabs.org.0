Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D41F445564
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 15:33:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlR326qNqz2yNq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 01:33:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20210112.gappssmtp.com header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=aNkhGBzu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20210112.gappssmtp.com
 header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=aNkhGBzu; dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlR2M56Wjz2xWt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 01:33:13 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id j21so21957136edt.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Nov 2021 07:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lxqQEO/rT8vCYvc8shTb7+5KlfliNzIt+0I9iwl8MAo=;
 b=aNkhGBzuHtE+aKaw13HGw6I6vPq73j+InPfB4QqRZKmnPZtFCRKSA+jaNq1ULgn3py
 ajyp/iY34nquejwde3BsdN+r2yLScSMwq+wWHVYh5M/bCTnOUA9qYkh5Wy2ZSYf97S7I
 UtbM9/9nqGBNqbGcaClLG3ICUvAcakurSnUAawq0yArgjcs8gyx6gDAQ8hgEiSEMDPYy
 s0+RwrrgH1e1PYxZGi0Taqld5gI6htVwEPSq8DqYi/pWW2pbkANtuuoUDWuz63nCdDGQ
 HdFXgrPD92t0zW2rsyezLbggeVi7CAwE08+ZB7CCWizu5/KmyBQYDyjKYT2v4lD7VYf/
 lTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lxqQEO/rT8vCYvc8shTb7+5KlfliNzIt+0I9iwl8MAo=;
 b=DEqBb3psmA0uoyHahh3s6zOf94kJCqQGh/nIoBnc3xidJvo8udgt1BO3OGiUx89Myx
 OC0jDz4qYoUNlFPFnJqVGy7NqTRxW095tqIAZLb4K92n3uqk9Tx4+GBczK2RW/WMjliG
 TUIVk4Bx3MYkULPqUKjCL/MqmJi48No/v9GUzyC206Xwnhpx5ggEk/LMFLlFUtCE1kKG
 gz8DmV1/X5uBu/e11gmH57f2SF4+um/sHae/qx2wnw70Iksu7NNDHNg0YfUYaGzS07JO
 1aXFFbKJipPlhuzqQX/v8pm5dhrURWf/PWME9KOiT+ueirlH4TF/0q9O+D8I8lDX38lV
 aEzg==
X-Gm-Message-State: AOAM532P1e/XkIXPPy6FGl3bO5oARmNfNbyn/+wiQALBB+8lM9M9WXHD
 Iet15LTSXYICDoR5CxFfPxOE7pmobf64aMUV/bYR
X-Google-Smtp-Source: ABdhPJwE13mGNmySljOzUaHZss3NKTk1pkR2BMQqKnkop5Bli+fJLDi2R01BTeWo+lIIwuW3sMwj52Z3kphzbdOTwmc=
X-Received: by 2002:a17:907:868f:: with SMTP id
 qa15mr37133631ejc.187.1636036386968; 
 Thu, 04 Nov 2021 07:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <a4b3951d1191d4183d92a07a6097566bde60d00a.1629812058.git.christophe.leroy@csgroup.eu>
 <163584790624.1845480.1785827913484538939.b4-ty@ellerman.id.au>
 <CAHC9VhROvSQHVQ6Wo8zHND1rGm+r6dGJur69B65sJ9JwNvMDpQ@mail.gmail.com>
 <87a6im87tq.fsf@mpe.ellerman.id.au>
 <20211102235449.rwtbgmddkzdaodhv@meerkat.local>
 <871r3w8msd.fsf@mpe.ellerman.id.au>
In-Reply-To: <871r3w8msd.fsf@mpe.ellerman.id.au>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 4 Nov 2021 10:32:55 -0400
Message-ID: <CAHC9VhSypCHxrAZA6dix1iHj12PPDQHhigPDmPdW59rPekRN-Q@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] powerpc/audit: Convert powerpc to
 AUDIT_ARCH_COMPAT_GENERIC
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: patch-notifications@ellerman.id.au, linux-kernel@vger.kernel.org,
 linux-audit@redhat.com, Paul Mackerras <paulus@samba.org>,
 Eric Paris <eparis@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 4, 2021 at 2:20 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:
> > On Wed, Nov 03, 2021 at 10:18:57AM +1100, Michael Ellerman wrote:
> >> It's not in next, that notification is from the b4 thanks script, which
> >> didn't notice that the commit has since been reverted.
> >
> > Yeah... I'm not sure how to catch that, but I'm open to suggestions.
>
> I think that's probably the first time I've had a commit and a revert of
> the commit in the same batch of thanks mails.
>
> And the notification is not wrong, the commit was applied with that SHA,
> it is in the tree.
>
> So I'm not sure it's very common to have a commit & a revert in the tree
> at the same time.

I know it is not common for the SELinux and audit trees.  I guess
every tree/maintainer is different, but I'm probably more conservative
than most when it comes to merging patches so it's pretty rare that we
need to revert things in those trees.

> On the other hand being able to generate a mail for an arbitrary revert
> would be helpful, ie. independent of any thanks state.
>
> eg, picking a random commit from the past:
>
>   e95ad5f21693 ("powerpc/head_check: Fix shellcheck errors")
>
> If I revert that in my tree today, it'd be cool if I could run something
> that would detect the revert, backtrack to the reverted commit, extract
> the message-id from the Link: tag, and generate a reply to the original
> submission noting that it's now been reverted.

Even if it isn't practical to do the find-the-original-commit logic,
simply getting an email that says "FYI, this revert has been merged
into this tree/branch" would be helpful.  Although I guess that would
require either the revert having the right metadata, e.g. "Cc:", or
that prior mentioned logic to find the original commit so the proper
To/CC lines could be generated.

-- 
paul moore
www.paul-moore.com
