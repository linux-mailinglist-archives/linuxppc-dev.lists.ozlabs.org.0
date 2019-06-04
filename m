Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E129B345E1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 13:48:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J9DV3DcvzDqKb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 21:48:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=andreyknvl@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="l/j965oT"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J9Bt6wBVzDqRq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 21:47:10 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id bh12so2171572plb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2019 04:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dqp69e2uVFEsGCK8JhiQUI0eIhdoGk5h13T4mTC3vdY=;
 b=l/j965oTYVXJlxTYWvckE8VTMI089RUFBuoqrrqtaXuZS/XGL2imWUR4Yj62ofLJ5B
 DgxG1n0xNvR+Z1Q2WKLjXP4Ic6bW7ST7vC/dzKmyj0IUR6vTT0z9AontN1QI8ObMfrqT
 YfQOny7N2gMtvrAIhPa+UYF2M069gzxKv7PwiRWZjJ1iI6LDinGjOYSS+sjqs5grnF0B
 e9aJoVfdsnL4PaWC5CyQ3SVTmBWLITUXFdUA/VEb4rquThulv4tr3tFv4LY7s8DA7Ygg
 QJSsuhRnspRaLycykpAiwScHW5uSOeCZARUrOt7CO58SxO5d7ZxzOztZ8o9JgluM7fHh
 Jptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dqp69e2uVFEsGCK8JhiQUI0eIhdoGk5h13T4mTC3vdY=;
 b=QOgdj+iMD/HN+pZcSQ+ReHDW0tXPrw9jjp+FM5t7ayho8P8iw3OG6nGfObD34tNBNU
 DoS2U77dGjlGidS713TEd7ZFEKjYmy5AP9LPxBWS/1Urtg6we3PO0xJgBKhNlDb+RGxe
 FqZCMwaeGOf3r3ccZGAGhwjZN0sLPOCvgRySb6p9RufIbJZJ4eRVHqBnUzH8aOg58kCi
 Gt7vppJkLyWIPO4eSo3bIr9Q4N8Cjy5OoajEqEX1BBkQ1IcGPkKKNiCNVA8HSQzH/bZv
 h9Yi0zqxxllxNSyXzhHwDGGdAFoalZsGVaDtQ/R0p9IoyaGtQn9umTTGen8ev2OUP2JV
 KQlA==
X-Gm-Message-State: APjAAAUWVeeHmhwzzRdeTVCjOQq/m9YXWGhI7hkEKxeQXEog+6pC7X9k
 cFVD/Zt8Y26yrtvo3ObAeCfZ8KualqcW4htUaQqung==
X-Google-Smtp-Source: APXvYqxxKCotfIzPUp2KWeKyy9ei43iIKcJ+7sjPmxGSimbHW7NgNBX2aQnmBFtOckHX4w3Dtt0BdqhA9Y8aOzwYWxs=
X-Received: by 2002:a17:902:1566:: with SMTP id
 b35mr36931113plh.147.1559648827583; 
 Tue, 04 Jun 2019 04:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190601074959.14036-1-hch@lst.de>
 <20190601074959.14036-2-hch@lst.de>
 <431c7395-2327-2f7c-cc8f-b01412b74e10@oracle.com>
 <20190604072706.GF15680@lst.de>
In-Reply-To: <20190604072706.GF15680@lst.de>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Tue, 4 Jun 2019 13:46:56 +0200
Message-ID: <CAAeHK+xtFwY+S0VY-yyb+i_+GnSjYHfgYHB9Ss=r9xxZZvsKFw@mail.gmail.com>
Subject: Re: [PATCH 01/16] uaccess: add untagged_addr definition for other
 arches
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
Cc: the arch/x86 maintainers <x86@kernel.org>, Rich Felker <dalias@libc.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Paul Burton <paul.burton@mips.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-mips@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 4, 2019 at 9:27 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Jun 03, 2019 at 09:16:08AM -0600, Khalid Aziz wrote:
> > Could you reword above sentence? We are already starting off with
> > untagged_addr() not being no-op for arm64 and sparc64. It will expand
> > further potentially. So something more along the lines of "Define it as
> > noop for architectures that do not support memory tagging". The first
> > paragraph in the log can also be rewritten to be not specific to arm64.
>
> Well, as of this patch this actually is a no-op for everyone.
>
> Linus, what do you think of applying this patch (maybe with a slightly
> fixed up commit log) to 5.2-rc so that we remove a cross dependency
> between the series?

(I have adjusted the patch description and have just sent it out
separately from the series).
