Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A05336A1FD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Apr 2021 18:14:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FSGSj3nHJz30Fw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Apr 2021 02:14:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=OBiFt15B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=OBiFt15B; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FSGSG4jLCz2yR7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Apr 2021 02:14:03 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so2783204pjh.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Apr 2021 09:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ehOCyEa8WMG6Db0WeyaEQpqkMdxESpkq3GkVwETZTyE=;
 b=OBiFt15BLpM3JJOqchE/Cl52dFoVBU9iC/uImyHRjHrqeRnZ3Izu3f0T6Sef4g5mqO
 aZuxHcBRIQWZi13LEQQORMcJLak2Yujic/llUvwgl7xZJL97mFnPFWgb0p23eC5XaTf9
 jKNgff16W9FvFjpIRTwDU/FIrCdFmLUISxnCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ehOCyEa8WMG6Db0WeyaEQpqkMdxESpkq3GkVwETZTyE=;
 b=kcf03IgLmaiR7IMTJ83RSjRC4tc7uZwhZvCUrOfelga9mYaSu9dTJmyh6YRHVZTyry
 Nl5Gw81T9Bmp14V6dG4GvMQSXwkzENRh5HLR0QDZ/fQS//9LwirBDOM6TQUKZW45qXSj
 e00zGbBGW1Nc77FBkbmnJQwdLrGjIpmrv0MNBmDwQa/3RpmhLrU3skOrcxKQcbfSkv66
 wMsU9vI729ZqRriuUhD+6e9M7YW/GjOTKKlAKif1B4G9F1gDsYS+1mpfrIsiFT/j0Cn9
 GB0o/oSLSu31fOWgWmVtxLgeM8hWBWqUzE/ai3WrgCv61buHyTzmq4w69skxFficBIKQ
 dL0Q==
X-Gm-Message-State: AOAM532TdCWd40+yAAA3i5wrt2gPuvrCl+jsJYquz8+oPv5q5R4q8rlK
 v4GCCcBx17UavegoUDOv5Wk9CQ==
X-Google-Smtp-Source: ABdhPJwwyP7qwNFsce/OSeLMxrpDuJuBbR4dZcz+FlvrXs1F0TB8w7HdfLRuWF8jcK9GTlUXh89xdA==
X-Received: by 2002:a17:90a:d352:: with SMTP id
 i18mr12495546pjx.19.1619280838607; 
 Sat, 24 Apr 2021 09:13:58 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-7127-7935-12a3-ff68.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:7127:7935:12a3:ff68])
 by smtp.gmail.com with ESMTPSA id pc17sm7641190pjb.19.2021.04.24.09.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 09:13:58 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 1/2] powerpc/sstep: Add emulation support for
 =?utf-8?B?4oCYc2V0YuKAmQ==?= instruction
In-Reply-To: <20210422191334.GE27473@gate.crashing.org>
References: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
 <767e53c4c27da024ca277e21ffcd0cff131f5c73.1618469454.git.sathvika@linux.vnet.ibm.com>
 <875z0mfzbf.fsf@linkitivity.dja.id.au>
 <20210422191334.GE27473@gate.crashing.org>
Date: Sun, 25 Apr 2021 02:13:55 +1000
Message-ID: <87h7jvzmm4.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>,
 naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:

> Hi!
>
> On Fri, Apr 16, 2021 at 05:44:52PM +1000, Daniel Axtens wrote:
>> Sathvika Vasireddy <sathvika@linux.vnet.ibm.com> writes:
>> Ok, if I've understood correctly...
>> 
>> > +			ra = ra & ~0x3;
>> 
>> This masks off the bits of RA that are not part of BTF:
>> 
>> ra is in [0, 31] which is [0b00000, 0b11111]
>> Then ~0x3 = ~0b00011
>> ra = ra & 0b11100
>> 
>> This gives us then,
>> ra = btf << 2; or
>> btf = ra >> 2;
>
> Yes.  In effect, you want the offset in bits of the CR field, which is
> just fine like this.  But a comment would not hurt.
>
>> Let's then check to see if your calculations read the right fields.
>> 
>> > +			if ((regs->ccr) & (1 << (31 - ra)))
>> > +				op->val = -1;
>> > +			else if ((regs->ccr) & (1 << (30 - ra)))
>> > +				op->val = 1;
>> > +			else
>> > +				op->val = 0;
>
> It imo is clearer if written
>
> 			if ((regs->ccr << ra) & 0x80000000)
> 				op->val = -1;
> 			else if ((regs->ccr << ra) & 0x40000000)
> 				op->val = 1;
> 			else
> 				op->val = 0;
>
> but I guess not everyone agrees :-)
>
>> CR field:      7    6    5    4    3    2    1    0
>> bit:          0123 0123 0123 0123 0123 0123 0123 0123
>> normal bit #: 0.....................................31
>> ibm bit #:   31.....................................0
>
> The bit numbers in CR fields are *always* numbered left-to-right.  I
> have never seen anyone use LE for it, anyway.
>
> Also, even people who write LE have the bigger end on the left normally
> (they just write some things right-to-left, and other things
> left-to-right).

Sorry, the numbers in the CR fields weren't meant to be especially
meaningful, I was just trying to convince myself that we referenced the
same bits doing the ISA way vs the way this code did it.

Kind regards,
Daniel
>
>> Checkpatch does have one complaint:
>> 
>> CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'regs->ccr'
>> #30: FILE: arch/powerpc/lib/sstep.c:1971:
>> +			if ((regs->ccr) & (1 << (31 - ra)))
>> 
>> I don't really mind the parenteses: I think you are safe to ignore
>> checkpatch here unless someone else complains :)
>
> I find them annoying.  If there are too many parentheses, it is hard to
> see at a glance what groups where.  Also, a suspicious reader might
> think there is something special going on (with macros for example).
>
> This is simple code of course, but :-)
>
>> If you do end up respinning the patch, I think it would be good to make
>> the maths a bit clearer. I think it works because a left shift of 2 is
>> the same as multiplying by 4, but it would be easier to follow if you
>> used a temporary variable for btf.
>
> It is very simple.  The BFA instruction field is closely related to the
> BI instruction field, which is 5 bits, and selects one of the 32 bits in
> the CR.  If you have "BFA00 BFA01 BFA10 BFA11", that gives the bit
> numbers of all four bits in the selected CR field.  So the "& ~3" does
> all you need.  It is quite pretty :-)
>
>
> Segher
