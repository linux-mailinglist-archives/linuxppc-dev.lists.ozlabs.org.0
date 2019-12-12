Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E72DD11D81B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 21:52:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YmFc0CLCzDr95
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 07:52:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.b="bkVtv5h8"; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YmCY6DZrzDr7g
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 07:50:25 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id r19so189772ljg.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 12:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=udrNHrYblR3sF99SQEkYkwez4FCarU/iIh5v4su3FS8=;
 b=bkVtv5h8m32kLkiXM0qzlbz+nqjHfWFk9/qgPuPRhcgkiw0ZGyA729E8BGkFqzS3Dp
 q+Wa3RFyS+SBMMZulr9ppWHo8LKoN71JFOrHQs6VbNoqHdluxrgUNcjbxTHasQy97nOf
 M7t7yc8gf4qDYxsmtgtXGgGLWzQC2DeoAcm+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=udrNHrYblR3sF99SQEkYkwez4FCarU/iIh5v4su3FS8=;
 b=L+st97seJdgaT5ehcOwz9ilbBwzJ6+oTR6wftOuqr0iDho/vpP9xA4vfE7xECrkhnr
 ZgqG4tyuMMTZpp9zXTEa9sE9r/cyq7/BQXx2u/RJouAzAcl92Tk7AUKZBAuh5KMWWglp
 Y2qC50K+YYXDFFksJ1Guu5STSVScU09JMepAOQ0y0YgjVcQqXXLDmziqoaeuU4y2HqHP
 1XLsinVY6W0IsSnR9qpV5GJaszBiUS7O9e7T4bTHYBsbgwYLsZ8vmnlFJcDFKDMAR24p
 SSs2jpvIsdB29UVi8nxNOdR/wkdEkQ7fNRjXrmuFSZgkg0Oy78jIqXA+mAgHsw6UkuW0
 dX3Q==
X-Gm-Message-State: APjAAAXgMjvExyT71c0vTuXPOK7WqOU1HbSEXjQbzIrqnAoo0Xfz99jN
 zAVRIClER+6kmEzvRQuAfYxF+uQ3udc=
X-Google-Smtp-Source: APXvYqxSynnEJG356z+FsiPYBNWkwKXbG7q+F45BS4Oz0QqslCUIXkbhKMNKqg3IIMDxc4Kmvx1uMw==
X-Received: by 2002:a05:651c:321:: with SMTP id
 b1mr7404604ljp.62.1576183810743; 
 Thu, 12 Dec 2019 12:50:10 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id a11sm3599893ljp.50.2019.12.12.12.50.08
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2019 12:50:09 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id b15so298966lfc.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 12:50:08 -0800 (PST)
X-Received: by 2002:a19:23cb:: with SMTP id j194mr6971490lfj.79.1576183808614; 
 Thu, 12 Dec 2019 12:50:08 -0800 (PST)
MIME-Version: 1.0
References: <87blslei5o.fsf@mpe.ellerman.id.au>
 <20191206131650.GM2827@hirez.programming.kicks-ass.net>
 <875zimp0ay.fsf@mpe.ellerman.id.au>
 <20191212080105.GV2844@hirez.programming.kicks-ass.net>
 <20191212100756.GA11317@willie-the-truck>
 <20191212104610.GW2827@hirez.programming.kicks-ass.net>
 <CAHk-=wjUBsH0BYDBv=q36482G-U7c=9bC89L_BViSciTfb8fhA@mail.gmail.com>
 <20191212180634.GA19020@willie-the-truck>
 <CAHk-=whRxB0adkz+V7SQC8Ac_rr_YfaPY8M2mFDfJP2FFBNz8A@mail.gmail.com>
 <20191212193401.GB19020@willie-the-truck>
In-Reply-To: <20191212193401.GB19020@willie-the-truck>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Dec 2019 12:49:52 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiMuHmWzQ7-CRQB6o+SHtA-u-Rp6VZwPcqDbjAaug80rQ@mail.gmail.com>
Message-ID: <CAHk-=wiMuHmWzQ7-CRQB6o+SHtA-u-Rp6VZwPcqDbjAaug80rQ@mail.gmail.com>
Subject: Re: READ_ONCE() + STACKPROTECTOR_STRONG == :/ (was Re: [GIT PULL]
 Please pull powerpc/linux.git powerpc-5.5-2 tag (topic/kasan-bitops))
To: Will Deacon <will@kernel.org>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Mark Rutland <mark.rutland@arm.com>, linuxppc-dev@lists.ozlabs.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 12, 2019 at 11:34 AM Will Deacon <will@kernel.org> wrote:
>
> The root of my concern in all of this, and what started me looking at it in
> the first place, is the interaction with 'typeof()'. Inheriting 'volatile'
> for a pointer means that local variables in macros declared using typeof()
> suddenly start generating *hideous* code, particularly when pointless stack
> spills get stackprotector all excited.

Yeah, removing volatile can be a bit annoying.

For the particular case of the bitops, though, it's not an issue.
Since you know the type there, you can just cast it.

And if we had the rule that READ_ONCE() was an arithmetic type, you could do

    typeof(0+(*p)) __var;

since you might as well get the integer promotion anyway (on the
non-volatile result).

But that doesn't work with structures or unions, of course.

I'm not entirely sure we have READ_ONCE() with a struct. I do know we
have it with 64-bit entities on 32-bit machines, but that's ok with
the "0+" trick.

               Linus
