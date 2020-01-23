Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B61614725E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 21:07:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483YG81YGNzDqZC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 07:07:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=eQxTZQW0; 
 dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483YDB1Nh8zDqY5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 07:05:28 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id r19so5108514ljg.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 12:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8DVtOQwrFkEAE5or+ctC9NfF/UngBhO5F9zvyg/cwIE=;
 b=eQxTZQW0N74htNr8ZIoBTg2RQDPW3OjTEHCMc4sFe5oYhaOUGSJvrl6o1eL0CZRoF6
 x82sJpEoaWzhBeyAQr4AJVLWbXFgY8LgUhy1SsB1ddXX6DI1lqW3atZTfWsWptXew+SX
 fwPcf1xNLR3ZLFeVh0I0M9xVVUDiWrMIvhW4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8DVtOQwrFkEAE5or+ctC9NfF/UngBhO5F9zvyg/cwIE=;
 b=EcKBUi4J85H/iLiEe7+U4BxwwKjjYiWMMJ9tID0JCK/RJN09yBVHgOe1GuJNk+nZvp
 qNWsKrIXnxrXm8IIanrMJNnLHyaPIXQSnKQtXQoJPfiyGtUfqO1xsUcP/tG+cvQ+QbN7
 RO9Bf1TxtFXZovGTKYSeLAmDbhIQx3SksIBQcVn+fBkyLprrsd5jSiUKobLDN09/LkH+
 3fgO/FT3MSvL/jF77Fh29NVCJTDLxtvf8Nk3yzbEqnZjXFBa4riqLSDY7zeMFkePoOd1
 MM58RuLPENJsM5TU/11x/fnvCMnhm9EMqMeUAv1C1q0ePRzoeaRkRSiidIf2vP+0Bj2N
 iaVQ==
X-Gm-Message-State: APjAAAUrPo2PfjqweCKYIQKlvH4Y4izo4zc9sqGOXVf8NFztWzI2P0Sl
 l+o6rsG1vPW9GSrWfDwbvM6yhSkUSwA=
X-Google-Smtp-Source: APXvYqza7NoCbDcYKi+Se0BNGSVWG21e7l1mLNvVLcXw4LQT9LYxvmS0Fn596uIBMviR8q5gC49GXQ==
X-Received: by 2002:a05:651c:1b0:: with SMTP id
 c16mr41807ljn.236.1579809922344; 
 Thu, 23 Jan 2020 12:05:22 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id s12sm2048952ljo.9.2020.01.23.12.05.21
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 12:05:22 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id y6so5136753lji.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 12:05:21 -0800 (PST)
X-Received: by 2002:a2e:88c5:: with SMTP id a5mr3682ljk.201.1579809493632;
 Thu, 23 Jan 2020 11:58:13 -0800 (PST)
MIME-Version: 1.0
References: <fed4f49349913cb6739dac647ba6a61d56b989d2.1579783936.git.christophe.leroy@c-s.fr>
 <e11a8f0670251267f87e3114e0bdbacb1eb72980.1579783936.git.christophe.leroy@c-s.fr>
 <CAHk-=wg4HEABOZdjxMzbembNmxs1zYfrNAEc2L+JS9FBSnM8JA@mail.gmail.com>
 <fc5c94a2-5a25-0715-5240-5ba3cbe0f2b2@c-s.fr>
In-Reply-To: <fc5c94a2-5a25-0715-5240-5ba3cbe0f2b2@c-s.fr>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Jan 2020 11:57:57 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi8FvaeRv6PpisQ+L_Cv52yE6jCxZzUHQPZ_K7HzFkaBQ@mail.gmail.com>
Message-ID: <CAHk-=wi8FvaeRv6PpisQ+L_Cv52yE6jCxZzUHQPZ_K7HzFkaBQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] uaccess: Tell user_access_begin() if it's for a
 write or not
To: christophe leroy <christophe.leroy@c-s.fr>
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
Cc: the arch/x86 maintainers <x86@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Linux-MM <linux-mm@kvack.org>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 23, 2020 at 11:47 AM christophe leroy
<christophe.leroy@c-s.fr> wrote:
>
> I'm going to leave it aside, at least for the time being, and do it as a
> second step later after evaluating the real performance impact. I'll
> respin tomorrow in that way.

Ok, good.

From a "narrow the access window type" standpoint it does seem to be a
good idea to specify what kind of user accesses will be done, so I
don't hate the idea, it's more that I'm not convinced it matters
enough.

On x86, we have made the rule that user_access_begin/end() can contain
_very_ few operations, and objtool really does enforce that. With
objtool and KASAN, you really end up with very small ranges of
user_access_begin/end().

And since we actually verify it statically on x86-64, I would say that
the added benefit of narrowing by access type is fairly small. We're
not going to have complicated code in that user access region, at
least in generic code.

> > Also, it shouldn't be a "is this a write". What if it's a read _and_ a
> > write? Only a write? Only a read?
>
> Indeed that was more: does it includes a write. It's either RO or RW

I would expect that most actual users would be RO or WO, so it's a bit
odd to have those choices.

Of course, often writing ends up requiring read permissions anyway if
the architecture has problems with alignment handling or similar, but
still... The real RW case does exist conceptually (we have
"copy_in_user()", after all), but still feels like it shouldn't be
seen as the only _interface_ choice.

IOW, an architecture may decide to turn WO into RW because of
architecture limitations (or, like x86 and arm, ignore the whole
RO/RW/WO _entirely_ because there's just a single "allow user space
accesses" flag), but on an interface layer if we add this flag, I
really think it should be an explicit "read or write or both".

So thus my "let's try to avoid doing it in the first place, but if we
_do_ do this, then do it right" plea.

                 Linus
