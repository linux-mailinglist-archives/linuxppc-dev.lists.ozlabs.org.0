Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6463F32000
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 18:31:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45GRfX5V87zDqbm
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2019 02:31:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.b="Fa5BzECD"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45GRbf6ksnzDqbX
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jun 2019 02:29:17 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id o13so12450596lji.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Jun 2019 09:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WbBlTtzN8zF5Iqk8bw1nVflVKcbi7cIeUDGHN5Yot1E=;
 b=Fa5BzECDkVJJVil3Feep0HbYjDwApJFYj92zZCD6f4aYCxc2Als39M3w9fuXET3xGS
 3dJFRH9YhqCQxcCzt7i+R2DDortv76Hw0c0yls+ilBPK12ky3bwefHhCdXxs096uQvMr
 JNZz4F8UnUXJp5G999kMQlHK92/csNz/XzzF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WbBlTtzN8zF5Iqk8bw1nVflVKcbi7cIeUDGHN5Yot1E=;
 b=NY+jI7dmImIrOPQxmhYDuFtzCED9HISabk+8ozNiQ3JUXvp266rm44tqLGePOEcrs+
 B8pvXHbQfCiOwicCqNoKwjdMfCaNtoz7TC1PzTh4jj5s+wBEdERo33QMztZBujYe9ljj
 +8hslQxsn6OxbzTVNIz14REPiHdZGt46YXWUsltR7uu5eSbJkowa+k5kmpnX/0JthRmx
 HvIy1R6U+4RqroVJ8LBGhfjisCWHURWGd5RWYQIu+VBzKXKBNDdaT7/Sp8YWlSTuHztz
 SeYjbUYgjbxah3K6z6anbUIAWdJ5YIVuBTe521dH70tZ3g6w78GAr8mGnz/JEK/K41FQ
 oINA==
X-Gm-Message-State: APjAAAX3IwjFUvZhgdl4CnQ5pffSUK9GfFIDZ0TDCaUxxY5BLjLnCy4r
 C1VSS19W4HYPS0MKlt23ncu/4AEHD+Y=
X-Google-Smtp-Source: APXvYqwXJewPmW01z9OibdGwez/3lGh4G/wz852Wk0d2rrmsNpgdcn/3BvWO6kYHNqk3JPSAMyh5eQ==
X-Received: by 2002:a2e:9e07:: with SMTP id e7mr2063037ljk.55.1559406553675;
 Sat, 01 Jun 2019 09:29:13 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id x29sm1847058lfg.58.2019.06.01.09.29.10
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 01 Jun 2019 09:29:10 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id j24so12490757ljg.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Jun 2019 09:29:10 -0700 (PDT)
X-Received: by 2002:a2e:9ad1:: with SMTP id p17mr9481496ljj.147.1559406549964; 
 Sat, 01 Jun 2019 09:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190601074959.14036-1-hch@lst.de>
 <20190601074959.14036-9-hch@lst.de>
In-Reply-To: <20190601074959.14036-9-hch@lst.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 1 Jun 2019 09:28:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj9w5NxTcJsqpvYUiL3OBOH-J3=4-vXcc3GaG_U8H-gJw@mail.gmail.com>
Message-ID: <CAHk-=wj9w5NxTcJsqpvYUiL3OBOH-J3=4-vXcc3GaG_U8H-gJw@mail.gmail.com>
Subject: Re: [PATCH 08/16] sparc64: add the missing pgd_page definition
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

Both sparc64 and sh had this pattern, but now that I look at it more
closely, I think your version is wrong, or at least nonoptimal.

On Sat, Jun 1, 2019 at 12:50 AM Christoph Hellwig <hch@lst.de> wrote:
>
> +#define pgd_page(pgd)                  virt_to_page(__va(pgd_val(pgd)))

Going through the virtual address is potentially very inefficient, and
might in some cases just be wrong (ie it's definitely wrong for
HIGHMEM style setups).

It would likely be much better to go through the physical address and
use "pfn_to_page()". I realize that we don't have a "pgd to physical",
but neither do we really have a "pgd to virtual", and your
"__va(pgd_val(x))" thing is not at allguaranteed to work. You're
basically assuming that "pgd_val(x)" is the physical address, which is
likely not entirely incorrect, but it should be checked by the
architecture people.

The pgd value could easily have high bits with meaning, which would
also potentially screw up the __va(x) model.

So I thgink this would be better done with

     #define pgd_page(pgd)    pfn_to_page(pgd_pfn(pgd))

where that "pgd_pfn()" would need to be a new (but likely very
trivial) function. That's what we do for pte_pfn().

IOW, it would likely end up something like

  #define pgd_to_pfn(pgd) (pgd_val(x) >> PFN_PGD_SHIFT)

David?

                  Linus
