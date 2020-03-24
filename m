Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D9F19054E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 06:45:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mgG94KdLzDqdv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 16:45:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g9lQJ7yQ; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mgD96RLGzDqTy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 16:44:09 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id g6so6966808plt.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 22:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=BukWmLTZHXf4Ozol6M0yS6iSNddiQFnzKQv942fSrMY=;
 b=g9lQJ7yQRbQwAg7RagwvvfKtwfUfKxYcGSmxnBFcKnIG0nhzsrigLXqcU3M39H21XQ
 tQXnKceGFyvrMllp3NIYjlIia/+dGT4hRxOIoGJQp/WyEPUhkWCeN4DK/Sge9ZjLGAp7
 G/Kv//7ZPmrX/HjGvrDzWkrN2GSr/dJdTK1mx3dfivRb9s/h6Q8npmvGTXJc7hH6rOO6
 ySzw649zTRGIXyAqaFnRCJm5W3cm/10OKQ2OBY2uL7ZtSRE6AIpVdI3X9ZLrmVRJdGGL
 BAqUBjwExlrgdgGHyfAk4U/vTlVqaHMu2dsU8hTpqJMhbby4hgxCdZjRzhi3nUI8dDzz
 yaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=BukWmLTZHXf4Ozol6M0yS6iSNddiQFnzKQv942fSrMY=;
 b=kB2mfHvx4SEs4LEiHg/9EEATpCm2TYQ/0vombNi5MhSwEo8ArftWcgy+RSpbw+qCNv
 9lMzxFqDVojamsMbGRkw6te+U4st1vBDMBvjmFBv6vgVbVJEpSqt7xI7ZWvhuBwJOB/z
 4xdng2jOgssGF1jLsWk1ok8mpR0w57u8WZ8/+Wkp5tQwIVXL29NXtSPJjWKsANv8v3fi
 J1BFb3hHjK/OCqwdQXHuLZ++NJ7/ylRmTmitEBiZdRQkjLUuvmvT/squy8x1BC4hEfQu
 bMVtJSIgwRz7MXjE0D6Wc8NYPnmJ7tXmXRj5CBUHfmCcVZ+yozp1zNG9ZA5ifV+T+zMV
 ffLw==
X-Gm-Message-State: ANhLgQ2fsVpsI3Z7ArypiJHGPApxapMlwIO4DnkInPTmIr1Vu/nOJ+fu
 mH9/qSJT48cUPbLiSZkpiYY=
X-Google-Smtp-Source: ADFU+vvCjHlln/Wevcw7yw9Fe/w3WNnfMfdv7LaxUwT0pr/GXdodHoUEiaBWq7FCenP9WkypVWXLZg==
X-Received: by 2002:a17:90a:ba17:: with SMTP id
 s23mr3225058pjr.162.1585028646737; 
 Mon, 23 Mar 2020 22:44:06 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id i4sm14909291pfq.82.2020.03.23.22.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 22:44:06 -0700 (PDT)
Date: Tue, 24 Mar 2020 15:44:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 00/16] Initial Prefixed Instruction support
To: Jordan Niethe <jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <1584944279.gvl0lg5dde.astroid@bobo.none>
 <CACzsE9r5uvL-zp34VrCqO_RTEsXPbLrt2iu+MHL-apapydOugA@mail.gmail.com>
 <1584957138.lj5a68bk6x.astroid@bobo.none>
 <CACzsE9qrNpfvoLKfdeXths4rKJ8jQcUic3=dFZ57ntogdeaMug@mail.gmail.com>
In-Reply-To: <CACzsE9qrNpfvoLKfdeXths4rKJ8jQcUic3=dFZ57ntogdeaMug@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1585028462.t27rstc2uf.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Balamuruhan S <bala24@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on March 24, 2020 12:54 pm:
> On Mon, Mar 23, 2020 at 9:21 PM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> Jordan Niethe's on March 23, 2020 7:25 pm:
>> > On Mon, Mar 23, 2020 at 5:22 PM Nicholas Piggin <npiggin@gmail.com> wr=
ote:
>> >>
>> >> Jordan Niethe's on March 20, 2020 3:17 pm:
>> >> > A future revision of the ISA will introduce prefixed instructions. =
A
>> >> > prefixed instruction is composed of a 4-byte prefix followed by a
>> >> > 4-byte suffix.
>> >> >
>> >> > All prefixes have the major opcode 1. A prefix will never be a vali=
d
>> >> > word instruction. A suffix may be an existing word instruction or a
>> >> > new instruction.
>> >> >
>> >> > This series enables prefixed instructions and extends the instructi=
on
>> >> > emulation to support them. Then the places where prefixed instructi=
ons
>> >> > might need to be emulated are updated.
>> >> >
>> >> > The series is based on top of:
>> >> > https://patchwork.ozlabs.org/patch/1232619/ as this will effect
>> >> > kprobes.
>> >> >
>> >> > v4 is based on feedback from Nick Piggins, Christophe Leroy and Dan=
iel Axtens.
>> >> > The major changes:
>> >> >     - Move xmon breakpoints from data section to text section
>> >> >     - Introduce a data type for instructions on powerpc
>> >>
>> >> Thanks for doing this, looks like a lot of work, I hope it works out =
:)
>> >>
>> > Yes it did end up touching a lot of places. I started thinking that
>> > that maybe it would be simpler to just use a u64 instead of the struct
>> > for  instructions.
>> > If we always keep the word instruction / prefix in the lower bytes,
>> > all of the current masking should still work and we can use operators
>> > again instead of ppc_inst_equal(), etc.
>>
>> Yeah.. I think now that you've done it, I prefer it this way.
> Sorry, just to be clear which way do you mean?

With the struct, not u64 scalar. mpe's preferred way is fine by me.

>> We'll want to adopt some convention for displaying prefixed
>> instruction bytes, but I don't know what what works best. I wonder
>> if binutils or any userspace tools have a convention.
> binutils-gdb upstream has supports disassembling prefixed instructions.
> Here is what objdump looks like:
>   44:    00 00 00 60     nop
>   48:    00 00 00 07     pnop
>   4c:    00 00 00 00
>   50:    01 00 20 39     li      r9,1
>   54:    00 00 00 06     paddi   r4,r9,3
>   58:    03 00 89 38
>   5c:    00 00 62 3c     addis   r3,r2,0
>>
>> Which reminds me, you might have missed show_instructions()?
>> Although maybe you don't need that until we start using them in
>> the kernel.
> You are right I missed that here.

So binutils doesn't do anything special, I guess you can make something
up.

Thanks,
Nick
=
