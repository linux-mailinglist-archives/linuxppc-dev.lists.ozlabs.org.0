Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC71F1470F0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 19:40:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483WLH5CXpzDqYY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 05:40:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=CO5Rx/d/; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483WJG19gyzDqXB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 05:38:54 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id y19so3087603lfl.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 10:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dQ25OTOBjFwniHXaIhyRIPei9koK1Vea3aQMS9ddWaY=;
 b=CO5Rx/d/+juGBR+FFLJo0Qdw3RYFgTLIf+Mnl29p0mNIytugs2NcVQlE2/w2WUc19a
 r7ybFhTMI9YigwXFyviyqQt0NfnDBfayvOxgRYe2KBPKF1sYRQ5QUo2wzCyUmR6GFB8N
 XlNGtwTb4WQwbGi39oResI6dOVY+bDpk8CA2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dQ25OTOBjFwniHXaIhyRIPei9koK1Vea3aQMS9ddWaY=;
 b=I+A1BQO/7qJRZOazyepmp1G1Dcmrk390rPMwDp5Yaloh2e5/jMiQjvKOdhnjlkqX3e
 Rwi4LKMtp90iFuVD8H/icR7OhPlJ3VMmvXKFKskmnhkPaCS5Y/mtSVDHHYIGS4Gt/qbw
 9+ZDKKECsQ9oIU5U2SiGz/LzamAQ/NaDfQhHrl+vpMntsNotFVXH7/3SDbqfjNZBr5zY
 fGXc0n1vWcaj61imeeNi+wZNjJzsSkRQapEXRvfOKDWXpirrjV5BsbuecXlkX6fvr/Wd
 TfdYR4wPV+Lkm5XBsjqnzwqLx4LFJjhQgMSTEg0r7cZ81zHzuMl/v2Fzk/OvZ5vICEnG
 303g==
X-Gm-Message-State: APjAAAX3gArn9vjOG3ZpRjNMalBXcdCuj/sArrmHkyywpIvxzX92AL8z
 e8xSOGB0Icgc3oAPBdTvKc9rJ3d1jvY=
X-Google-Smtp-Source: APXvYqyIvJ3iaENuf2GECc0p6yP2mSLDv9YyIJ87D+/tPalYp8BdMn5lGlIEv7Lxp53m1VqCWgt/fA==
X-Received: by 2002:ac2:5922:: with SMTP id v2mr5434387lfi.106.1579804727325; 
 Thu, 23 Jan 2020 10:38:47 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id a11sm1478131lfb.34.2020.01.23.10.38.46
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 10:38:46 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id y4so4720312ljj.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 10:38:46 -0800 (PST)
X-Received: by 2002:a2e:990e:: with SMTP id v14mr22668549lji.23.1579804725767; 
 Thu, 23 Jan 2020 10:38:45 -0800 (PST)
MIME-Version: 1.0
References: <12a4be679e43de1eca6e5e2173163f27e2f25236.1579715466.git.christophe.leroy@c-s.fr>
 <87muaeidyc.fsf@mpe.ellerman.id.au> <87k15iidrq.fsf@mpe.ellerman.id.au>
In-Reply-To: <87k15iidrq.fsf@mpe.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Jan 2020 10:38:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=whCk8z2_kggSCoAGMne8PNSvcT2T4bBH62ngoFrsTyV6w@mail.gmail.com>
Message-ID: <CAHk-=whCk8z2_kggSCoAGMne8PNSvcT2T4bBH62ngoFrsTyV6w@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] fs/readdir: Fix filldir() and filldir64() use of
 user_access_begin()
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 23, 2020 at 4:00 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> So I guess I'll wait and see what happens with patch 1.

I've committed my fixes to filldir[64]() directly - they really were
fixing me being lazy about the range, and the name length checking
really is a theoretical "access wrong user space pointer" issue with
corrupted filesystems regardless (even though I suspect it's entirely
theoretical - even a corrupt filesystem hopefully won't be passing in
negative directory entry lengths or something like that).

The "pass in read/write" part I'm not entirely convinced about.
Honestly, if this is just for ppc32 and nobody else really needs it,
make the ppc32s thing always just enable both user space reads and
writes. That's the semantics for x86 and arm as is, I'm not convinced
that we should complicate this for a legacy platform.

                Linus
