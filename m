Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 434712CDC30
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 18:16:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cn2Yk6X3czDrBs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 04:16:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=aRJu1HO4; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cn2WT0RxrzDqB3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 04:14:27 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id b12so1495999pjl.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Dec 2020 09:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=jpxIDRJby02bDSmzqib9oh8ZXDBqI+2pH5k0P2lzdWM=;
 b=aRJu1HO4xnNzb8jocw95sh/+CjsELYLpn2jhaJctdiBvV0Fo/IKe2d9DUjnFTVLurX
 Zz5jY6puhccVi4/XYJcF7M1WWjBZ/WYrYvOH0BlxpJnlRQ5Gv20I5Qa54qDavxIpMqu7
 46YMj6QXtaEh429/CwE53Heyk8rCED0kC2GVSiksY3g51x/NcNUwhV8nC9XoV+cO/mxt
 4h3T5yaHfoFjomEoJs048LrdfUJhUseSC4iy7RdIuoRUVb60jBp4vPTph+8LXJR4h17K
 q4oZzEwHYNz5a1MVWTTRm26Dfo5pZpVJIp2icQJRZ7CVgm0Yy3vM/31Kuj9RXfgsUNyL
 FvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=jpxIDRJby02bDSmzqib9oh8ZXDBqI+2pH5k0P2lzdWM=;
 b=BWf0TzLhGgXXB7sCdmeLN3NKhEELFj4yGn7jxioa1yOQaScruJE/fcLwwE7wJVGLbQ
 xODBBoBQ/1GWXOL6E98dQAke+2azaIF4Xqdc960zTsXmm2FaAEp3/OMA6Jhtx6iGLoa7
 8XA38yYVWa5AmDFEEHc90YIZFL77c5M8/QDB+z00dCyxfSlVXjo9nuVF2sGWXEXxDMar
 ZbXTog6tRVmwuaGRmW6oalPMWk4H24wiQ8Amn0sudFOsLlTnQizX5bqvJLEVxpbVLe8D
 uZVEZ0V40JHwpJFrSVH9dCnO5k01+fhYsKLrmtq3cftAzfiUzP1lYMwGxGvzZgnK7x4e
 dzlA==
X-Gm-Message-State: AOAM53246E+deQSV8Rq7mjasySz+0zaEhujbBs/jIGvcNVQZ3xD/bh3v
 UGntPH2K/siViYIcvyH1MDMdpg==
X-Google-Smtp-Source: ABdhPJwE4etOoyGMx9UOKs7yAhw7hgOhsifHtas0tGfE12clfk9l2UH+s+JZSLZnFMT+6hGUVEc2Aw==
X-Received: by 2002:a17:90a:5988:: with SMTP id l8mr120805pji.82.1607015664612; 
 Thu, 03 Dec 2020 09:14:24 -0800 (PST)
Received: from ?IPv6:2600:1010:b02c:6432:59d6:b4ed:32aa:4315?
 ([2600:1010:b02c:6432:59d6:b4ed:32aa:4315])
 by smtp.gmail.com with ESMTPSA id t9sm30146pjq.46.2020.12.03.09.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 09:14:23 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 6/8] lazy tlb: shoot lazies,
 a non-refcounting lazy tlb option
Date: Thu, 3 Dec 2020 09:14:22 -0800
Message-Id: <E6BC2596-6087-49F2-8758-CA5598998BBE@amacapital.net>
References: <20201203170332.GA27195@oc3871087118.ibm.com>
In-Reply-To: <20201203170332.GA27195@oc3871087118.ibm.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
X-Mailer: iPhone Mail (18B121)
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Dave Hansen <dave.hansen@intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Dec 3, 2020, at 9:09 AM, Alexander Gordeev <agordeev@linux.ibm.com> wro=
te:
>=20
> =EF=BB=BFOn Mon, Nov 30, 2020 at 10:31:51AM -0800, Andy Lutomirski wrote:
>> other arch folk: there's some background here:

>=20
>>=20
>> power: Ridiculously complicated, seems to vary by system and kernel confi=
g.
>>=20
>> So, Nick, your unconditional IPI scheme is apparently a big
>> improvement for power, and it should be an improvement and have low
>> cost for x86.  On arm64 and s390x it will add more IPIs on process
>> exit but reduce contention on context switching depending on how lazy
>=20
> s390 does not invalidate TLBs per-CPU explicitly - we have special
> instructions for that. Those in turn initiate signalling to other
> CPUs, completely transparent to OS.

Just to make sure I understand: this means that you broadcast flushes to all=
 CPUs, not just a subset?

>=20
> Apart from mm_count, I am struggling to realize how the suggested
> scheme could change the the contention on s390 in connection with
> TLB. Could you clarify a bit here, please?

I=E2=80=99m just talking about mm_count. Maintaining mm_count is quite expen=
sive on some workloads.

>=20
>> TLB works.  I suppose we could try it for all architectures without
>> any further optimizations.  Or we could try one of the perhaps
>> excessively clever improvements I linked above.  arm64, s390x people,
>> what do you think?
>=20
> I do not immediately see anything in the series that would harm
> performance on s390.
>=20
> We however use mm_cpumask to distinguish between local and global TLB
> flushes. With this series it looks like mm_cpumask is *required* to
> be consistent with lazy users. And that is something quite diffucult
> for us to adhere (at least in the foreseeable future).

You don=E2=80=99t actually need to maintain mm_cpumask =E2=80=94 we could sc=
an all CPUs instead.

>=20
> But actually keeping track of lazy users in a cpumask is something
> the generic code would rather do AFAICT.

The problem is that arches don=E2=80=99t agree on what the contents of mm_cp=
umask should be.  Tracking a mask of exactly what the arch wants in generic c=
ode is a nontrivial operation.
