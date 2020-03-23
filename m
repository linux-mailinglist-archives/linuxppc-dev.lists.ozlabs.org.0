Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBBB18F29F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 11:23:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m9SY6lnSzDr27
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 21:23:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f/mFVXVs; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m9Qs23LLzDqty
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 21:21:41 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id x7so6979501pgh.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=7AfBLGS2WQW210POMbfei8GaVTgCmo8uOAWJJUNUEU8=;
 b=f/mFVXVs0kGUOXjvrKfSDD8/8NqIU4oVtyGLSqLe0EFK0TQmhdgVLA/hCPVpwq6kWF
 lONQhgOG5BVgkW1KpDxMNnp1OrwRQU3p11Ko5lsHTkRHQguj/aQRJSgjOOxtrr7yCRtK
 muMyqCSBxLWLsBaA1KPh/nqz4f/RTMlseN3rGT7NxlZe8UZcl1Yl+sSUCEtcuWeq9hDK
 iDf7U3UhAbwNFEZWa2H7NsXB9WOz879PNryhjh2T6LxFWDZ/vN421KnnVgvioYxmh/Km
 7jRr0jO5gZplwrLRr3jlCoKrKPqm05gKYdtZ8E5KZonVdIfUzoCmgBlpb/mjScazsXs6
 5K7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=7AfBLGS2WQW210POMbfei8GaVTgCmo8uOAWJJUNUEU8=;
 b=U27sntfp/i73/eNAQxEHwJ0KvdEPNsP1wmGS/UDu/QMhIN4tRY1GDPSn+3QtXY8t8B
 dZyQre9qAPuAMlC5czmwNijA2HqMl0k7hjILSVq2XV7TNXnOJ7N+zzjL2ASn2QNdkW08
 I/zhxQPOviG/q5Rbi6wVwgz8t/dRSZF7W9Z3RmznABBKf37hbzP0KUT6LtPwDXt5kp5U
 /a/ZmUr1C3CjvAqbymBoD0dhBfzlNy2jjD+/LXpdSxkBsRg5aB90TvK0MJQF+pk5Y1nX
 tBbObKxyCzV8xesBPD+O2/6gEEC/kK2tzTNTNhK1Q+WXeh5l9NUMIq0EpvkP4a0Ra2BJ
 Tajw==
X-Gm-Message-State: ANhLgQ0VCH3SlJ1VWGvAqr+XUPI9zHiAg+kLb/Dda39ulf6a5/LZXeqr
 /ldJy9aqxjJCi7eE5rB4Cqg=
X-Google-Smtp-Source: ADFU+vtjDtOAW//AxrlEtUTLu6VQIH1xZCifz3VmDaf+HClbrkOt2rRc4md/vE4ACjKODkMHBpqulg==
X-Received: by 2002:aa7:92da:: with SMTP id k26mr23335231pfa.139.1584958898219; 
 Mon, 23 Mar 2020 03:21:38 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id n22sm11838727pjq.36.2020.03.23.03.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 03:21:37 -0700 (PDT)
Date: Mon, 23 Mar 2020 20:17:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 00/16] Initial Prefixed Instruction support
To: Jordan Niethe <jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <1584944279.gvl0lg5dde.astroid@bobo.none>
 <CACzsE9r5uvL-zp34VrCqO_RTEsXPbLrt2iu+MHL-apapydOugA@mail.gmail.com>
In-Reply-To: <CACzsE9r5uvL-zp34VrCqO_RTEsXPbLrt2iu+MHL-apapydOugA@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584957138.lj5a68bk6x.astroid@bobo.none>
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

Jordan Niethe's on March 23, 2020 7:25 pm:
> On Mon, Mar 23, 2020 at 5:22 PM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> Jordan Niethe's on March 20, 2020 3:17 pm:
>> > A future revision of the ISA will introduce prefixed instructions. A
>> > prefixed instruction is composed of a 4-byte prefix followed by a
>> > 4-byte suffix.
>> >
>> > All prefixes have the major opcode 1. A prefix will never be a valid
>> > word instruction. A suffix may be an existing word instruction or a
>> > new instruction.
>> >
>> > This series enables prefixed instructions and extends the instruction
>> > emulation to support them. Then the places where prefixed instructions
>> > might need to be emulated are updated.
>> >
>> > The series is based on top of:
>> > https://patchwork.ozlabs.org/patch/1232619/ as this will effect
>> > kprobes.
>> >
>> > v4 is based on feedback from Nick Piggins, Christophe Leroy and Daniel=
 Axtens.
>> > The major changes:
>> >     - Move xmon breakpoints from data section to text section
>> >     - Introduce a data type for instructions on powerpc
>>
>> Thanks for doing this, looks like a lot of work, I hope it works out :)
>>
> Yes it did end up touching a lot of places. I started thinking that
> that maybe it would be simpler to just use a u64 instead of the struct
> for  instructions.
> If we always keep the word instruction / prefix in the lower bytes,
> all of the current masking should still work and we can use operators
> again instead of ppc_inst_equal(), etc.

Yeah.. I think now that you've done it, I prefer it this way.

> It also makes printing easier. We could just #define INST_FMT %llx or
> #define INST_FMT %x on powerpc32 and use that for printing out
> instructions.

Well, not sure about that. Would it make endian concerns more
complicated? Print format for prefix might be '%016llx', but we
don't want that for all instructions only prefixed ones, and I
don't know if that is the way to go either.

We'll want to adopt some convention for displaying prefixed
instruction bytes, but I don't know what what works best. I wonder
if binutils or any userspace tools have a convention.

Which reminds me, you might have missed show_instructions()?
Although maybe you don't need that until we start using them in
the kernel.

Thanks,
Nick
=
