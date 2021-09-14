Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF7740A322
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 04:13:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7n1z11bTz2ynQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 12:13:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=a8etmcMm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=a8etmcMm; 
 dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7n1F6vF7z2yHg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 12:12:33 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id y28so1027783lfb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 19:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iTZ+eFGbCDolHBudnZBl3uwTbCyuUnDDlNjR7YoJlN8=;
 b=a8etmcMmxUvXlsF8SSWc/UbOYHx7MrB6jf8XzEcL+zzyCDw6Kat7Q5QwvXdHdsuFVl
 tZyCY2YvkPFPJTWsENvKQB8encBX0h2+ti3zl4D14UnnVtEr1ME5aaiD3w/D1plemf+X
 MJaYSKqDIGmy52Iro7ivbir9UMYjn+0QhvsAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iTZ+eFGbCDolHBudnZBl3uwTbCyuUnDDlNjR7YoJlN8=;
 b=qdHQWowAm4sg2yiOCzQmB9sAzOHIeox8fnc/wv89AP6ZMAOzKxd1rRXUc+3q1xeNrV
 YN2Anbyh5dLXsU0BbgOETyle2aG6z0XQtw8YNFC8DFHnBzq8SICOYuHj7E67Sar4r5CS
 9bpW0WpV+agZR6rL0C7A/dJ7evW5WBWGvTrVV3ta+Ovzp+Yp+oroz04I+LSoqssHOvfW
 Hw7qA/G9J8khMNJYEMMGS4n56QyzH+K1QPxsnMiPmtNM0P/ukdm6HVza4kuplb4Yvfh9
 1QhEJid8DzBQHINCpHYbRe1GE7I98t/LjOeXvSc9R0qlJLTuNB4fNA1UTR/Am7fWUJxM
 FZyw==
X-Gm-Message-State: AOAM533fSxDCvnVCoo81i22YDwYoYqujdrUJ3V/+BpTHh+iw7HKlfnlZ
 tL9WKKAq73gs0Qy2P3QpVqh2G1I7VXQOCFeRrkM=
X-Google-Smtp-Source: ABdhPJy3IMtTBjol8m7PnwOGnP1yher6buumvqcJ2FQDfzyedRJMuIkrK5nk3NZpz/KzHJJKeDq/Zg==
X-Received: by 2002:a05:6512:3192:: with SMTP id
 i18mr10934396lfe.209.1631585549360; 
 Mon, 13 Sep 2021 19:12:29 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49])
 by smtp.gmail.com with ESMTPSA id 10sm1151628ljp.12.2021.09.13.19.12.28
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 19:12:28 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id a4so25264099lfg.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 19:12:28 -0700 (PDT)
X-Received: by 2002:a05:6512:3984:: with SMTP id
 j4mr1498523lfu.280.1631585548512; 
 Mon, 13 Sep 2021 19:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210914100853.3f502bc9@canb.auug.org.au>
 <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
 <CAHk-=whGuEkYmQcJx8WfZ7MFhbKGJDcA6NUZWtrnM6Y6xFqATw@mail.gmail.com>
 <20210914105359.5c651d55@canb.auug.org.au>
 <CAHk-=whyWUdJDeOBN1hRWYSkQkvzYiQ5RbSW5rJjExgnbSNX9Q@mail.gmail.com>
 <20210914120818.4a102b46@canb.auug.org.au>
In-Reply-To: <20210914120818.4a102b46@canb.auug.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 13 Sep 2021 19:12:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wieb251-L9D-v3BeF-Cna8r5kLz2MeyXDS3mrNUmXNYrg@mail.gmail.com>
Message-ID: <CAHk-=wieb251-L9D-v3BeF-Cna8r5kLz2MeyXDS3mrNUmXNYrg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the origin tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 13, 2021 at 7:08 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> That patch works for me - for the ppc64_defconfig build at least.

Yeah, I just tested the allmodconfig case too, although I suspect it's
essentially the same wrt the boot *.S files, so it probably doesn't
matter.

I'd like to have Michael or somebody who can actually run some tests
on the end result ack that patch (or - even better - come up with
something cleaner) before committing it.

Because yeah, the build failure is annoying and I apologize, but I'd
rather have the build fail overnight than commit something that builds
but then is subtle buggy for some reason.

But if I don't get any other comments by the time I'm up again
tomorrow, I'll just commit it as "fixes the build".

                  Linus
