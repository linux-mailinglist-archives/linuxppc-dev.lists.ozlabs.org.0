Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 938A0174FEF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 22:35:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VxQl53FFzDqvn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 08:35:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=apcGvjA2; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VxP32YZrzDqvP
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 08:34:11 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id d27so3198597lfq.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2020 13:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MG3T/bBKuDUDeti/Rm+y4RgArjtBEYGQp1e9CzWemF0=;
 b=apcGvjA2u0cCo4C+VwBU1Sw2XH7N23BHVkkkrwPxPkkLpwgWEXMy8mpoRYhJoe/OwW
 RBhZVTwyblCqHaOrJTdKlZx65NbvjknGHtyp34sPZrAw2qZMOvsnJkebTADHFDIkes4L
 iqhdCg9qQtF1WKTcpzzg+2KH8XViHFCpx2BGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MG3T/bBKuDUDeti/Rm+y4RgArjtBEYGQp1e9CzWemF0=;
 b=Wfh02pEu2gcZT0lGYZ6z/iSMBYUZ2OMsTm/vpJWaYWeUdPR9S5ilQdNHUOvMfrcIxT
 mk4bxiBcgfa3fm3UMGXZntlRIO3P3wNyhMczsB6y1GAqyVUt76oKw8nuHP21Y2lP4yRQ
 1X8iOvObKHAayuqXeqjATeWbazUWuqR8if3C9FaIs77RawBjmHqxGNA6piNBCcWNsqpo
 XWHOuqpYpjZtHldJcMWarLzVCJsi4XBLiMFbvSEuIejSQsqukJB5yXAjC1gIk+bNESDM
 mGq9anXV1WgXPyyJReUYJajScUyLtc8VFVOq8HB6U1nkz9I0o114IQfF+Nu+0jIhdij7
 VJQg==
X-Gm-Message-State: ANhLgQ2M0sDhOQUaAaTI/Qa9BOwL+vU4UukEpqHUJ+wGvnH1CC+wTqRF
 sEl4/sC+nQkI19zrWmQi/Ykal/Tk2/Kh6w==
X-Google-Smtp-Source: ADFU+vu84i/wfLloLkxWwRpu/+x8OIRHI8xHjdOgYbMloYMl2UVqUox7crJCQHtjqhWRtxMClrwZyQ==
X-Received: by 2002:a05:6512:3136:: with SMTP id
 p22mr8478305lfd.120.1583098446074; 
 Sun, 01 Mar 2020 13:34:06 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41])
 by smtp.gmail.com with ESMTPSA id y20sm7026737lfh.20.2020.03.01.13.34.04
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Mar 2020 13:34:05 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id c20so1681576lfb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2020 13:34:04 -0800 (PST)
X-Received: by 2002:a05:6512:10cf:: with SMTP id
 k15mr1918456lfg.142.1583098444431; 
 Sun, 01 Mar 2020 13:34:04 -0800 (PST)
MIME-Version: 1.0
References: <1583089390-36084-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1583089390-36084-1-git-send-email-pbonzini@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 1 Mar 2020 15:33:48 -0600
X-Gmail-Original-Message-ID: <CAHk-=wiin_LkqP2Cm5iPc5snUXYqZVoMFawZ-rjhZnawven8SA@mail.gmail.com>
Message-ID: <CAHk-=wiin_LkqP2Cm5iPc5snUXYqZVoMFawZ-rjhZnawven8SA@mail.gmail.com>
Subject: Re: [GIT PULL] Second batch of KVM changes for Linux 5.6-rc4 (or rc5)
To: Paolo Bonzini <pbonzini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 1, 2020 at 1:03 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Paolo Bonzini (4):
>       KVM: allow disabling -Werror

Honestly, this is just badly done.

You've basically made it enable -Werror only for very random
configurations - and apparently the one you test.

Doing things like COMPILE_TEST disables it, but so does not having
EXPERT enabled.

So it looks entirely ad-hoc and makes very little sense. At least the
"with KASAN, disable this" part makes sense, since that's a known
source or warnings. But everything else looks very random.

I've merged this, but I wonder why you couldn't just do what I
suggested originally?

Seriously, if you script your build tests, and don't even look at the
results, then you might as well use

   make KCFLAGS=-Werror

instead of having this kind of completely random option that has
almost no logic to it at all.

And if you depend entirely on random build infrastructure like the
0day bot etc, this likely _is_ going to break when it starts using a
new gcc version, or when it starts testing using clang, or whatever.
So then we end up with another odd random situation where now kvm (and
only kvm) will fail those builds just because they are automated.

Yes, as I said in that original thread, I'd love to do -Werror in
general, at which point it wouldn't be some random ad-hoc kvm special
case for some random option. But the "now it causes problems for
random compiler versions" is a real issue again - but at least it
wouldn't be a random kernel subsystem that happens to trigger it, it
would be a _generic_ issue, and we'd have everybody involved when a
compiler change introduces a new warning.

I've pulled this for now, but I really think it's a horrible hack, and
it's just done entirely wrong.

Adding the powerpc people, since they have more history with their
somewhat less hacky one. Except that one automatically gets disabled
by "make allmodconfig" and friends, which is also kind of pointless.

Michael, what tends to be the triggers for people using
PPC_DISABLE_WERROR? Do you have reports for it? Could we have a
_generic_ option that just gets enabled by default, except it gets
disabled by _known_ issues (like KASAN).

Being disabled for "make allmodconfig" is kind of against one of the
_points_ of "the build should be warning-free".

               Linus
