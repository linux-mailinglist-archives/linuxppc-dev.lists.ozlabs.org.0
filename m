Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0167264BB6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 19:47:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnRCv5dtmzDrPm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 03:47:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnRB00W3bzDr3Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 03:45:21 +1000 (AEST)
Received: by mail-lf1-x144.google.com with SMTP id x77so4082633lfa.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 10:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tV9NvYryEbzez94zd9hdsCWt3FfBuGGawTOfDap0eBk=;
 b=CyoQUM+SKXH6085O6WtByg3nDuki2CTSBORvYvwm25BqShZutFnNs6mSZACayZwSEH
 qcd6gDs3XmrAOcCBysWWLpsCbEXmLRDCQnQxo0ENK46fWC+ppV/l5rSOr47qH79HuDsY
 BAC6cJAHl7u65bYmrM5WLZPBZBfoI7ltEXEKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tV9NvYryEbzez94zd9hdsCWt3FfBuGGawTOfDap0eBk=;
 b=TlIJTDYETDaZAqYGDJTD/0Z4vcLmqlKMi0jQtN+2TvuKeqyhPJd44nU+umtm5nnuHj
 tAQlDwSX7D+ZZWly8Z8ZmfsCtI4+MCKsVuOCAyQIp9wPt8BSuLWfs+mzYWys1xvv1X0Z
 aesEWKm1K1nDX4pLWszEfrhvDXf64R9mV/93UCHAxKPp9O3UCKOSxR6YPbdHrAoJI+K2
 DCxD1giOU1gB4st0gEqahRJ29DdVibAUYd9ALwUZFlefV+KCrd5Ho6RXhtDLtzKIiirq
 hqQiItGzYWbHET/1JH0J50iWBVg6NtWzl0omn1lUaPnCh7phPD7Pik1h4iofs7JrxpD1
 IQFw==
X-Gm-Message-State: AOAM530ec1BR52/VLWyVjVXbRY/TuMgnit8zftmeWwE/5HLTBCmNWsry
 hzBRMtA9AeNBCNFfu+t9Uj/eJx2R2rSPbQ==
X-Google-Smtp-Source: ABdhPJzI1weiuk3tBz4xdPKT+j/5eell5/M8f1ww2pMCo+/4AeirXEOM0FSkTXqaW0KEHAzKb+FAeQ==
X-Received: by 2002:a19:4ad8:: with SMTP id x207mr4722044lfa.73.1599759855566; 
 Thu, 10 Sep 2020 10:44:15 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180])
 by smtp.gmail.com with ESMTPSA id a1sm1764216ljb.64.2020.09.10.10.44.15
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 10:44:15 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id c2so9265226ljj.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 10:44:15 -0700 (PDT)
X-Received: by 2002:a19:7d8b:: with SMTP id y133mr4765702lfc.152.1599759354367; 
 Thu, 10 Sep 2020 10:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-2-gerald.schaefer@linux.ibm.com>
 <0dbc6ec8-45ea-0853-4856-2bc1e661a5a5@intel.com>
 <20200909142904.00b72921@thinkpad>
 <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad> <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com>
In-Reply-To: <20200910093925.GB29166@oc3871087118.ibm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 10 Sep 2020 10:35:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh4SuNvThq1nBiqk0N-fW6NsY5w=VawC=rJs7ekmjAhjA@mail.gmail.com>
Message-ID: <CAHk-=wh4SuNvThq1nBiqk0N-fW6NsY5w=VawC=rJs7ekmjAhjA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table
 folding
To: Alexander Gordeev <agordeev@linux.ibm.com>
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
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
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

On Thu, Sep 10, 2020 at 2:40 AM Alexander Gordeev
<agordeev@linux.ibm.com> wrote:
>
> It is only gup_fast case that exposes the issue. It hits because
> pointers to stack copies are passed to gup_pXd_range iterators, not
> pointers to real page tables itself.

Can we possibly change fast-gup to not do the stack copies?

I'd actually rather do something like that, than the "addr_end" thing.

As you say, none of the other page table walking code does what the
GUP code does, and I don't think it's required.

The GUP code is kind of strange, I'm not quite sure why. Some of it
unusually came from the powerpc code that handled their special odd
hugepage model, and that may be why it's so different.

How painful would it be to just pass the pmd (etc) _pointers_ around,
rather than do the odd "take the address of local copies"?

                  Linus
