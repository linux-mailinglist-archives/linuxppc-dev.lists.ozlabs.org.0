Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F282668A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 21:17:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp59Z6KyfzDqvK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 05:17:22 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=google header.b=Clxn1Qsg; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp57j5ZxYzDqY1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 05:15:45 +1000 (AEST)
Received: by mail-lf1-x143.google.com with SMTP id b22so3366112lfs.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 12:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lUTLfTAHN/JEc/vY2NZSlPv25B0eM9+I2UvpN7fipvE=;
 b=Clxn1QsgKc2lKUePPSN2NAL/bI5bjfBFRul7KsPI2uaRRhC0MOrKjvIFIZdRmVowg5
 Sj/tT1SzRVgDZ+3t3dHFGme2ZZ2AzNzf/iHPNpa3Fuz0WH5hvvP/wmiJL+the/L7uCVO
 8PyXw3Q3ZjkkDqlxpbtvaLMr+QGOuNdWTmuIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lUTLfTAHN/JEc/vY2NZSlPv25B0eM9+I2UvpN7fipvE=;
 b=j0ADHkbii1BkMspl49WZHFgAMj9xRojYyRjyRXIs1dJPxa0+1s1wRpCWQsQj+pbjZJ
 ht5OwSFLiv+PeoCj1kTgdKSLQyTStodCB15xw/eX2W1kzzIQS736lbnBtBgUcvmjCXc1
 Vw1QoGeI11a5sT4PLhwW7BbaTAOHdTNVx2OdHYZdFZ/gspZrvfdvs7YdvMvtLLOIz7Ft
 ZsloniMLU+mrWuWS4V9Kkz960zJmkDwQRDSKxT0VrqrjIYfq1yWOeIav4TuAF9ckOCTt
 cIAk7s4+Nh5GfUondcp0rMgTJSjaftZifX82JUokP5hduQDs/dpbtDkJ8rwkWcP/WgAk
 od2Q==
X-Gm-Message-State: AOAM530VYsdLBNvpQtCS73fe4XluG7eAL7ubq+TxYYvnZ+26thPPAI1E
 SJJRJ0Xb//AfxgX4AYifU7xPsIuyvF00EQ==
X-Google-Smtp-Source: ABdhPJxWnUwFdJbXBfRV7/kF258JBEMOXl6z44VKlns+9LviJjEFdll3lm33n1+yfigoW0nfSxtL+A==
X-Received: by 2002:a19:42c4:: with SMTP id p187mr1238944lfa.149.1599851739553; 
 Fri, 11 Sep 2020 12:15:39 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id w17sm542460lfk.95.2020.09.11.12.15.39
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 12:15:39 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id r24so13396553ljm.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 12:15:39 -0700 (PDT)
X-Received: by 2002:ac2:4ec7:: with SMTP id p7mr651524lfr.352.1599851382451;
 Fri, 11 Sep 2020 12:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200911070939.GB1362448@hirez.programming.kicks-ass.net>
 <patch.git-2c4880212370.your-ad-here.call-01599849957-ext-4686@work.hours>
In-Reply-To: <patch.git-2c4880212370.your-ad-here.call-01599849957-ext-4686@work.hours>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Sep 2020 12:09:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0cqRnqT=pBFx+wk3mQVzuCxQ3ea_nYOTyaCG4Ohkk_Q@mail.gmail.com>
Message-ID: <CAHk-=wg0cqRnqT=pBFx+wk3mQVzuCxQ3ea_nYOTyaCG4Ohkk_Q@mail.gmail.com>
Subject: Re: [PATCH] mm/gup: fix gup_fast with dynamic page table folding
To: Vasily Gorbik <gor@linux.ibm.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um <linux-um@lists.infradead.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-power <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 11, 2020 at 12:04 PM Vasily Gorbik <gor@linux.ibm.com> wrote:
>
> Currently to make sure that every page table entry is read just once
> gup_fast walks perform READ_ONCE and pass pXd value down to the next
> gup_pXd_range function by value e.g.:
[ ... ]

Ack, this looks sane to me.

I was going to ask how horrible it would be to convert all the other
users, but a quick grep convinced me that yeah, it's only GUP that is
this special, and we don't want to make this interface be the real one
for everything else too..

                Linus
