Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A312871F6E9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 01:55:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXNLN28Qwz3dsQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 09:55:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hQ0RCKA9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=nadav.amit@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hQ0RCKA9;
	dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXNKT421Hz3cG1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 09:54:53 +1000 (AEST)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-39a3f165ac5so1236797b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 16:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685663690; x=1688255690;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq+xoVGoOBMASX6Qo6F/Chq5PaVghrBgpVyIfFrv3Do=;
        b=hQ0RCKA9jRCKnGCyO2kN3QTLC3yb+Mdefo52tmuodc7Rt84YU9NlyduoNwqz+Q967d
         V7uBGj6VWFgr8YM6btVxO0XdtNVoooAp04klqJfE2ZmBUTlaUrv5ESo1tluojxtb/P0b
         IXsvFxgfg/85GYZ9MIdxPzQ2yHr/de4bqkKek71QIfTGQZKS+sL+6FNopqB/1pl5gZdM
         9SlKfIAzGLZNhvxUgWL+XEi7FhwDSsySWQZgNcWM1R6l7k6VA58bq3RnIGKXMDknOFde
         ITMFH1EZ3IUbIVWsPaSYfWLIZRF8wgeqkPJHfjZqlj6I94YsQOh8SKgp5f7sF92n6NGq
         pQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685663690; x=1688255690;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uq+xoVGoOBMASX6Qo6F/Chq5PaVghrBgpVyIfFrv3Do=;
        b=ORUG8U3ohAT8fvx2JJI+vSGGJ0soPnrMDL+7PWYecPEoxUFYLYwTIpARnbj0JP7BDJ
         N4ngN28Hv+anMnSzyLrraBY1ntvCppc5IQaOzu+yUp3ROf0qy3RHdSJk1mM/HrmtOaJS
         rRJ45FTzzl3yRx6QW+jqHcRFyFCs8jrp8ZT7+OXi25pVM6n4FUJovtdqbZ89dvw4+ytQ
         QBi1IzDVEAh9oE8ilOJp7YMB5PE6ZNnW0pnZBqVIjKVvSdixR9ccHIvmTUhkN+glwCYo
         B1jq6Lqaz68kHQPy8GYe31QXgLXCA8lFEG/35iTGYX9LdAJj1fOXz5RNd+/Z5uqRSvR/
         3Xjw==
X-Gm-Message-State: AC+VfDxwwFfPwHtJh0me2YgjzB36b1GZZdtZuXWQ6Zd0xYtkzQJU9cjd
	6zpWsICvAONe0roQ6K7DkH4=
X-Google-Smtp-Source: ACHHUZ6FGoT9AAhqdl4GKiokh7jtAU2ufEnyUr4RvYWwArHNvXyiDuy+wWqdSoxg1oPDBs7mS6RMxw==
X-Received: by 2002:a54:4604:0:b0:399:55c9:6f20 with SMTP id p4-20020a544604000000b0039955c96f20mr610729oip.52.1685663689890;
        Thu, 01 Jun 2023 16:54:49 -0700 (PDT)
Received: from smtpclient.apple ([66.170.99.95])
        by smtp.gmail.com with ESMTPSA id e2-20020a170902d38200b001aafa2e212esm4074977pld.52.2023.06.01.16.54.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Jun 2023 16:54:49 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH 12/13] x86/jitalloc: prepare to allocate exectuatble
 memory as ROX
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <68b8160454518387c53508717ba5ed5545ff0283.camel@intel.com>
Date: Thu, 1 Jun 2023 16:54:36 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <50D768D7-15BF-43B8-A5FD-220B25595336@gmail.com>
References: <20230601101257.530867-1-rppt@kernel.org>
 <20230601101257.530867-13-rppt@kernel.org>
 <0f50ac52a5280d924beeb131e6e4717b6ad9fdf7.camel@intel.com>
 <ZHjcr26YskTm+0EF@moria.home.lan>
 <a51c041b61e2916d2b91c990349aabc6cb9836aa.camel@intel.com>
 <ZHjljJfQjhVV/jNS@moria.home.lan>
 <68b8160454518387c53508717ba5ed5545ff0283.camel@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
X-Mailer: Apple Mail (2.3731.600.7)
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
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "song@kernel.org" <song@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "deller@gmx.de" <deller@gmx.de>, "x86@kernel.org" <x86@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "tsbogend@alpha.fran
 ken.de" <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "davem@davemloft.net" <davem@davemloft.net>, "rppt@kernel.org" <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Jun 1, 2023, at 1:50 PM, Edgecombe, Rick P =
<rick.p.edgecombe@intel.com> wrote:
>=20
> On Thu, 2023-06-01 at 14:38 -0400, Kent Overstreet wrote:
>> On Thu, Jun 01, 2023 at 06:13:44PM +0000, Edgecombe, Rick P wrote:
>>>> text_poke() _does_ create a separate RW mapping.
>>>=20
>>> Sorry, I meant a separate RW allocation.
>>=20
>> Ah yes, that makes sense
>>=20
>>=20
>>>=20
>>>>=20
>>>> The thing that sucks about text_poke() is that it always does a
>>>> full
>>>> TLB
>>>> flush, and AFAICT that's not remotely needed. What it really
>>>> wants to
>>>> be
>>>> doing is conceptually just
>>>>=20
>>>> kmap_local()
>>>> mempcy()
>>>> kunmap_loca()
>>>> flush_icache();
>>>>=20
>>>> ...except that kmap_local() won't actually create a new mapping
>>>> on
>>>> non-highmem architectures, so text_poke() open codes it.
>>>=20
>>> Text poke creates only a local CPU RW mapping. It's more secure
>>> because
>>> other threads can't write to it.
>>=20
>> *nod*, same as kmap_local
>=20
> It's only used and flushed locally, but it is accessible to all CPU's,
> right?
>=20
>>=20
>>> It also only needs to flush the local core when it's done since
>>> it's
>>> not using a shared MM.
>> =20
>> Ahh! Thanks for that; perhaps the comment in text_poke() about IPIs
>> could be a bit clearer.
>>=20
>> What is it (if anything) you don't like about text_poke() then? It
>> looks
>> like it's doing broadly similar things to kmap_local(), so should be
>> in the same ballpark from a performance POV?
>=20
> The way text_poke() is used here, it is creating a new writable alias
> and flushing it for *each* write to the module (like for each write of
> an individual relocation, etc). I was just thinking it might warrant
> some batching or something.

I am not advocating to do so, but if you want to have many efficient
writes, perhaps you can just disable CR0.WP. Just saying that if you
are about to write all over the memory, text_poke() does not provide
too much security for the poking thread.

