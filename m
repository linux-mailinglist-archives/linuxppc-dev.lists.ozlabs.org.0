Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFBF419DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 03:11:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Npjg3ZZzzDqvN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 11:11:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=2a00:1450:4864:20::244; helo=mail-lj1-x244.google.com;
 envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.b="gAjfSlHu"; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Npgj4V5fzDqkw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 11:09:52 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id t28so13485324lje.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 18:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SZXVeOYEeW/t6moRL6yl166/GZV1HqW8qo9aOqBVN+Q=;
 b=gAjfSlHuLsIpxvb8lF0RyxQXzEhYSHQJnAZ4as99A8GBRPKGt8LtILDEijhajNv2fV
 FXhIx40OUX4WPq1W1eQvis0UNqIoFt7tkihxVZ4QyREYOfVPuleZ/0Zq1i4TWCfQY/NA
 AhmvmJi02EHwj98eCflp9T4F3Jku2HpzQgXkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SZXVeOYEeW/t6moRL6yl166/GZV1HqW8qo9aOqBVN+Q=;
 b=pUrwPeMQp9C4+hwwEQCxlnbqVS8WJCB6z/7qgZDWn/3fwuZffGqFIcSm+8yIIv4iDI
 PGHHBEb/pshOUp0KAh40GiAPHQbBjHSmkVa+2rvPXK/Q6fxiDRtAtxn9w7PUqW8X7BKx
 JC+5IWaZloNUBsR7xflOASuOR19iBYPrjsmSxaKsqEJcK/EVxqKhLYiMMSezRkk8UvJe
 HmFijYKt0esrzkMIQGJh7kNwPOTH0QC/8d+7GEdip8GhfQCMqzQ6GlGecl6HtnWCkTSO
 I/XPrJm+daFhVArx+6L5Dx8J87uVRSPpux4f/6/q85ky2L710ZbjINZK6dzRqs+VPawd
 8N3Q==
X-Gm-Message-State: APjAAAWBnZaD5NvwMIIMOdW6lQ6PK+jgwFNjh+2NHeZ9d1ftvhTZMMSm
 UlzqnzKuH5DLh5cs6TQZngY4ctkAX8k=
X-Google-Smtp-Source: APXvYqyTi4PNCQcVTQ5T114bu0LvOMCEPjj1n8ASdxkr0QpEpsgjRfpqcrSIUzlDxaspdEehNMfNeQ==
X-Received: by 2002:a2e:9209:: with SMTP id k9mr8944976ljg.96.1560301782275;
 Tue, 11 Jun 2019 18:09:42 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id h10sm2793289lfj.10.2019.06.11.18.09.40
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 18:09:41 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 136so10700238lfa.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 18:09:40 -0700 (PDT)
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr26185312lfm.61.1560301780325; 
 Tue, 11 Jun 2019 18:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-17-hch@lst.de>
 <1560300464.nijubslu3h.astroid@bobo.none>
In-Reply-To: <1560300464.nijubslu3h.astroid@bobo.none>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 11 Jun 2019 15:09:24 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjSo+TzkvYnAqrp=eFgzzc058DhSMTPr4-2quZTbGLfnw@mail.gmail.com>
Message-ID: <CAHk-=wjSo+TzkvYnAqrp=eFgzzc058DhSMTPr4-2quZTbGLfnw@mail.gmail.com>
Subject: Re: [PATCH 16/16] mm: pass get_user_pages_fast iterator arguments in
 a structure
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-sh list <linux-sh@vger.kernel.org>, James Hogan <jhogan@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Khalid Aziz <khalid.aziz@oracle.com>, Christoph Hellwig <hch@lst.de>,
 Linux-MM <linux-mm@kvack.org>, Paul Burton <paul.burton@mips.com>,
 Paul Mackerras <paulus@samba.org>, Andrey Konovalov <andreyknvl@google.com>,
 sparclinux@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2019 at 2:55 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> What does this do for performance? I've found this pattern can be
> bad for store aliasing detection.

I wouldn't expect it to be noticeable, and the lack of argument
reloading etc should make up for it. Plus inlining makes it a
non-issue when that happens.

But I guess we could also at least look at using "restrict", if that
ends up helping. Unlike the completely bogus type-based aliasing rules
(that we disable because I think the C people were on some bad bad
drugs when they came up with them), restricted pointers are a real
thing that makes sense.

That said, we haven't traditionally used it, and I don't know how much
it helps gcc. Maybe gcc ignores it entirely? S

               Linus
