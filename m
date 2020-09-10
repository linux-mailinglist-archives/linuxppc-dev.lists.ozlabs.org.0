Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9B1264D6F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 20:42:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnSRv38J0zDqMr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 04:42:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=KlHKM3kh; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnSPR0ppnzDqM9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 04:40:25 +1000 (AEST)
Received: by mail-lj1-x242.google.com with SMTP id k25so9544076ljk.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 11:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qxUvMosCQmqJOT3+XnukK6QXCPsj7s8SUCtblFuQCtk=;
 b=KlHKM3khaRQUhJpR9UdzFB5LWAQF17Brw1Ft7CKtiriIUBpvA7+djFgchHKossZjUO
 VhqJr4lFUYp9ylSJpdlZ0hFaIz/Ssta/iioJv0jWuQQR7zk9LpCYLPwRfEoZmfrs0FFc
 eJ9cpxyshw+kFNXrIvj9XAnDrbJSgUK0YSwsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qxUvMosCQmqJOT3+XnukK6QXCPsj7s8SUCtblFuQCtk=;
 b=NEPBf2pAnHwaGfH7+WbAed5iFth/fQ3kCTR4JnYeOMKFFANLUv2kX/xZsxWaAressJ
 EF6p3KX90qJ1u75vdWDg4UbR5pPhTqVCFGyiNVSiM+NulCUOedNZHZXkuC7AWB+aXC1b
 iF9eixUyXoOfNXan2YJdSFWn7DlYZkNqcOZs4kb2HNe6BoDK+Sslq+pwyxko9XHzMHpn
 3v/96XpDXL1ecp4e8x7jW+qkaIoxYcR+4mSFHjGAhrnEBLXCmkyhBzi1C6hIITqpQgzM
 x4hGE3ojUVZJF8CXVdklqJLFeiLEWm/M0HdCX5DeV5P55oaJb7RIrPphQLGNLhGCQcjw
 Gn5A==
X-Gm-Message-State: AOAM532QnE77HgK9INLOg7W0zYmiZoxGf1F8tLVeuVq9cHHBrDZikgId
 6B1yF3jRxEvoHpyTspJDJjxosFXGyfftyg==
X-Google-Smtp-Source: ABdhPJxBdzz1KiiK6EuszvR31t5pQiXGEXuOeKH7pXLtTG6f9DrOKJzM85RFG0HwpdFz4rFG4IjHKQ==
X-Received: by 2002:a05:651c:209:: with SMTP id
 y9mr4995420ljn.398.1599763219847; 
 Thu, 10 Sep 2020 11:40:19 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id 25sm1799150lji.130.2020.09.10.11.40.19
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 11:40:19 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id z19so4155818lfr.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 11:40:19 -0700 (PDT)
X-Received: by 2002:a05:651c:104c:: with SMTP id
 x12mr5572300ljm.285.1599762813344; 
 Thu, 10 Sep 2020 11:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-2-gerald.schaefer@linux.ibm.com>
 <0dbc6ec8-45ea-0853-4856-2bc1e661a5a5@intel.com>
 <20200909142904.00b72921@thinkpad>
 <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad> <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com>
 <CAHk-=wh4SuNvThq1nBiqk0N-fW6NsY5w=VawC=rJs7ekmjAhjA@mail.gmail.com>
 <20200910181319.GO87483@ziepe.ca>
In-Reply-To: <20200910181319.GO87483@ziepe.ca>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 10 Sep 2020 11:33:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh3SjOE2r4WCfagL5Zq4Oj4Jsu1=1jTTi2GxGDTxP-J0Q@mail.gmail.com>
Message-ID: <CAHk-=wh3SjOE2r4WCfagL5Zq4Oj4Jsu1=1jTTi2GxGDTxP-J0Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table
 folding
To: Jason Gunthorpe <jgg@ziepe.ca>
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
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
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

On Thu, Sep 10, 2020 at 11:13 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> So.. To change away from the stack option I think we'd have to pass
> the READ_ONCE value to pXX_offset() as an extra argument instead of it
> derefing the pointer internally.

Yeah, but I think that would actually be the better model than passing
an address to a random stack location.

It's also effectively what we do in some other places, eg the whole
logic with "orig" in the regular pte fault handling is basically doing
unlocked loads of the pte, various decisions on that, and then doing a
final "is this still the same pte" after it has gotten the page table
lock.

(And yes, those other pte fault handling cases are different, since
they _do_ hold the mmap lock, so they know the page *tables* are
stable, and it's only the last level that then gets re-checked against
the pte once the pte itself has also been stabilized with the page
table lock).

So I think it would actually be a better conceptual match to make the
page table walking interface be "here, this is the value I read once
carefully, and this is the address, now give me the next address".

The folded case would then just return the address it was given, and
the non-folded case would return the inner page table based on the
value.

I dunno. I don't actually feel all that strongly about this, so
whatever works, I guess.

                Linus
