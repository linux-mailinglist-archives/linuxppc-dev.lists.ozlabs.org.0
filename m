Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE7741D226
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 06:19:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKg4P1tK6z2xfJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 14:19:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BYDEpv9+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BYDEpv9+; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKg3f60tfz2ynS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 14:18:53 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id s64so7193438yba.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 21:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BM3+YuEPCCFf8tnVNn41FpirshNfW0x9wEl2P7HQvXo=;
 b=BYDEpv9+qB5pI+2ZbITPdpCaidM0xuiXrlS/vk8ZE+e9VsLS6ubwW0ac2bu48KuvP0
 cUKCPv5ncs5Iw/f9M4IRMQPuQRMkX0+elSxZMPWM15rwRBwn9V8zjuIzI8YWuaD0PKBM
 dWTjGkLLds3Vh+xf5N/mxUctiZxAxEqBCuqriiWdmF4yU1/kvTR3y0LWBEAk65ZSAWIO
 Hs9quGpVfZ3YOhy+9fnOse40ScFdFRmMMBaiQwkISuxjvNhSWSLD/Z6/0kZwoJ/Wa6G6
 SVvRodICbq8NWb4/SRBs3wUhAv7JG5A7Z4yFq/7sRY90QdkRC+bTtqQz5qv0yR6m1HBM
 oZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BM3+YuEPCCFf8tnVNn41FpirshNfW0x9wEl2P7HQvXo=;
 b=1aYHELplNYAX3127yohDD4p+rZy5kydBogjl/g3d17gIa6ncPhl7yXwTnq9eWc/G77
 67HVPkxqfJENbgXBxP9qpBbmiDZ0ARDrSz/JIulQ3giLqh6azfuKlq7kveSGNCgxf30L
 VXOQfrUpA7vKyDOxyG9nmu/1FhBwM2YR49cScen9od+s/oTu5TPtZok0tFHrBM3zytWf
 uM4TuOnqA4GgR2AVc5+TObdyCmXORLtyJZ9Cq1YJ4kqUjvWfrsnygy59U+68zx7+4/ag
 w+LLsjnu/YkJWr1JHon+Z0O6QtuAxZiqYP6Je1cJW4a2H/XRtrSO/N16Oc99rUFYllG4
 v8sg==
X-Gm-Message-State: AOAM531XgTG901oZsPFAxp1jqyh2turnwqjxCLCTyJ4zFUh+1Rss2iwe
 wPZKHBe7AY2lqvur9LQIep93fVI1WF/RBcXDqRY=
X-Google-Smtp-Source: ABdhPJxG9/V7h+JBx/vEOn0pfzD+Ov8bHsUw3MTd1M/mwB81H3w/MY0nqdiSQwYQshUykI5r2CPfec288HVjabf6hHM=
X-Received: by 2002:a25:5402:: with SMTP id i2mr4240704ybb.312.1632975530282; 
 Wed, 29 Sep 2021 21:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210929111855.50254-1-hbathini@linux.ibm.com>
 <20210929111855.50254-6-hbathini@linux.ibm.com>
 <9628c18d-001e-9777-e800-486a83844ac1@csgroup.eu>
In-Reply-To: <9628c18d-001e-9777-e800-486a83844ac1@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 30 Sep 2021 14:18:38 +1000
Message-ID: <CACzsE9oNCaXoizCt-KzKS48A1L7v4_em-nLVfVLeeuWky1mrTA@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] bpf ppc64: Add BPF_PROBE_MEM support for JIT
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, songliubraving@fb.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, ast@kernel.org,
 andrii@kernel.org, Paul Mackerras <paulus@samba.org>, netdev@vger.kernel.org,
 naveen.n.rao@linux.ibm.com, yhs@fb.com, bpf@vger.kernel.org,
 kpsingh@kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kafai@fb.com,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 29, 2021 at 9:50 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 29/09/2021 =C3=A0 13:18, Hari Bathini a =C3=A9crit :
> > From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> >
> > BPF load instruction with BPF_PROBE_MEM mode can cause a fault
> > inside kernel. Append exception table for such instructions
> > within BPF program.
> >
> > Unlike other archs which uses extable 'fixup' field to pass dest_reg
> > and nip, BPF exception table on PowerPC follows the generic PowerPC
>
>
> For my curiosity, can you explain why we don't want and can't do the
> same on powerpc as on other archs ?

The main thing is on x86, the extable has another field , handler:
struct exception_table_entry { int insn, fixup, handler; };
handler can be used to perform other things before continuing on to fixup.
So for bpf the handler is used to clear the dest register (which is
encoded in the low byte of fixup).
More detail in 3dec541b2e63 ("bpf: Add support for BTF pointers to x86 JIT"=
).

arm64 is an example of an arch that doesn't have a handler field in the ext=
able.
They did something along the lines of this rather than adding a
handler field to the extable.
See 800834285361 ("bpf, arm64: Add BPF exception tables")

>
>
> > exception table design, where it populates both fixup and extable
> > sections within BPF program. fixup section contains two instructions,
> > first instruction clears dest_reg and 2nd jumps to next instruction
> > in the BPF code. extable 'insn' field contains relative offset of
> > the instruction and 'fixup' field contains relative offset of the
> > fixup entry. Example layout of BPF program with extable present:
> >
> >               +------------------+
> >               |                  |
> >               |                  |
> >     0x4020 -->| ld   r27,4(r3)   |
> >               |                  |
> >               |                  |
> >     0x40ac -->| lwz  r3,0(r4)    |
> >               |                  |
> >               |                  |
> >               |------------------|
> >     0x4280 -->| li  r27,0        |  \ fixup entry
> >               | b   0x4024       |  /
> >     0x4288 -->| li  r3,0         |
> >               | b   0x40b0       |
> >               |------------------|
> >     0x4290 -->| insn=3D0xfffffd90  |  \ extable entry
> >               | fixup=3D0xffffffec |  /
> >     0x4298 -->| insn=3D0xfffffe14  |
> >               | fixup=3D0xffffffec |
> >               +------------------+
> >
> >     (Addresses shown here are chosen random, not real)
> >
