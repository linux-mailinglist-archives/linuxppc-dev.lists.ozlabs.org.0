Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D4831FE6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 18:17:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45GRKj2GqvzDqVv
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2019 02:17:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=2a00:1450:4864:20::142; helo=mail-lf1-x142.google.com;
 envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.b="RdmXCPI1"; dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45GRGr1TVlzDqZw
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jun 2019 02:14:42 +1000 (AEST)
Received: by mail-lf1-x142.google.com with SMTP id r15so10335881lfm.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Jun 2019 09:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TKTAJ8E7sNy2vEZhocfTI/IVyiugHenGqfHPAGmTqUU=;
 b=RdmXCPI1V+CWEuQQLIpoDnZHvNbMKl90LuqFIcI1YnEKXhPCSK5AUEFPNd650/ERUV
 Qh10sm7MSlB6HnOBHykL5KhchRGHirJ9ssAdIkVcDYKPumYo1Zi2YYM6BhTRVFDVSg7U
 Nczzjs9o+pp1b0tTsgtO9YPvDZ1uwi7oKCdAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TKTAJ8E7sNy2vEZhocfTI/IVyiugHenGqfHPAGmTqUU=;
 b=CGRykCuxqyGwkw2xvJTqm8Viy5VaN+KuQ00nfUCIXMBzX0FZbdDT3UNuVQZ2veCmqq
 8GctZd9014zEc5Hk2nMUYa29S5OQGyBUBR4qVFXWRniNtwEH9wAGm7OEVo3Gqx6qEG4/
 DVccqO7AU0Cdf530cqz71O7xXF2+pZiDFd8qxMWgzb9TwTd6K8sMBmj1OG2m54tLghf8
 9xxpKJShjWmkNyIxkNb67tdD1UzdO1gHIcRPmvU+K9ScFpFZlU/VTfx4LFb7xoVtYcqb
 IjEgwrYLuSFGWPOPnUU4+HkV/HjOGrnA96Hi5SBH4KIXye5K59AWOSj1HKE+EWAdOjZj
 vyQg==
X-Gm-Message-State: APjAAAW99hX5tLq3YTyjM9YjfxZ9GUATalgd2ziMoP/3W7OUXLbYZQnG
 Uk+Wu2QjD9Bc5+8ptg47613UBfuj2RI=
X-Google-Smtp-Source: APXvYqz35kGwYWhIhbDMiaQ+GwjWoXGyaMShO5aj2nRBiosDn+5AZeLPrzzDV5uA0J2CbMg6LWjgfA==
X-Received: by 2002:a19:a20a:: with SMTP id l10mr5114231lfe.81.1559405675855; 
 Sat, 01 Jun 2019 09:14:35 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id n75sm1887611lfn.59.2019.06.01.09.14.33
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 01 Jun 2019 09:14:34 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id v18so10368820lfi.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Jun 2019 09:14:33 -0700 (PDT)
X-Received: by 2002:a19:ae01:: with SMTP id f1mr8899724lfc.29.1559405673566;
 Sat, 01 Jun 2019 09:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190601074959.14036-1-hch@lst.de>
 <20190601074959.14036-4-hch@lst.de>
In-Reply-To: <20190601074959.14036-4-hch@lst.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 1 Jun 2019 09:14:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=whusWKhS=SYoC9f9HjVmPvR5uP51Mq=ZCtktqTBT2qiBw@mail.gmail.com>
Message-ID: <CAHk-=whusWKhS=SYoC9f9HjVmPvR5uP51Mq=ZCtktqTBT2qiBw@mail.gmail.com>
Subject: Re: [PATCH 03/16] mm: simplify gup_fast_permitted
To: Christoph Hellwig <hch@lst.de>
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
 Khalid Aziz <khalid.aziz@oracle.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-mips@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
 Paul Burton <paul.burton@mips.com>, Paul Mackerras <paulus@samba.org>,
 Andrey Konovalov <andreyknvl@google.com>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 1, 2019 at 12:50 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Pass in the already calculated end value instead of recomputing it, and
> leave the end > start check in the callers instead of duplicating them
> in the arch code.

Good cleanup, except it's wrong.

> -       if (nr_pages <= 0)
> +       if (end < start)
>                 return 0;

You moved the overflow test to generic code - good.

You removed the sign and zero test on nr_pages - bad.

The zero test in particular is _important_ - the GUP range operators
know and depend on the fact that they are passed a non-empty range.

The sign test it less so, but is definitely appropriate. It might be
even better to check that the "<< PAGE_SHIFT" doesn't overflow in
"long", of course, but with callers being supposed to be trusted, the
sign test at least checks for stupid underflow issues.

So at the very least that "(end < start)" needs to be "(end <=
start)", but honestly, I think the sign of the nr_pages should be
continued to be checked.

                      Linus
