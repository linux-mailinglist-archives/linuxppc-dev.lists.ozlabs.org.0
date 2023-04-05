Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 779886D865C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 20:54:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsDMV2l4kz3fFM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 04:54:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OMlSV93F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736; helo=mail-qk1-x736.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OMlSV93F;
	dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsDLf4Qykz3cfj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:54:01 +1000 (AEST)
Received: by mail-qk1-x736.google.com with SMTP id n137so12201873qka.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Apr 2023 11:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680720837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRtXFO8p+VJqvb8EGOqoRE2s3RWE1f66fx+Rp1t5D9o=;
        b=OMlSV93FLik5uu6Z8lBQaDkNCKwnSNM3KQNtekolqO7lEAxeuPLjS7vAMwzAzhfHZ9
         iiFaH/lpB9PdL8VEOyRPJ2pWuyf0eRnq8GXT9u4Qo7TmPlJABcbGiYYymYezYDB9VYTc
         xkNWzfRwbvB7nsbQtDV4/jeva/rzwD/SG5iPLBdW1yU5S04rD1O1LmD0uMbkKZ9cGtiw
         +p904lLQLMu8a2ioQfdd0zG/38JialqxNkswfgAIGzhFtqnihwTUUxXK7+i0iOfKFj0n
         RxGvXaOp6UMT9qYlKaIWuENHXQXsbghZYBb+ZiWjtEDaJJlLAe6PZq1h6UR5rPhPq351
         o8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680720837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRtXFO8p+VJqvb8EGOqoRE2s3RWE1f66fx+Rp1t5D9o=;
        b=CkX+1IwNQ+x9xCYPUIj05iSp9roUkShPBG9bgTjdFFeRK3ykpf/000YKVBsnOK2GbU
         Bv2sgwY+9Ko5Km0g3oHUVdEZXPWuW0LdSyhRuu5q20R+0+jFLfCBv0IQSOquv886soC/
         KC2jQSsiT8EvGW5/UPcBe0C3b17ogOGFYMy99EYpXqnbqglgUP/WwSIsG91SW/29X3yn
         lH91DhbNslr8heDJfOazYma/p8gwK+bTZXiRZuBo+3BmcSB4K08Odr0uxFRUgwJOUAiO
         TUBl91cnEwd8bmEk/Limu22hC3Bao7GwHClaGj6hzphXBE8oLcb4ZtpegEN7w33NQj6s
         UVMQ==
X-Gm-Message-State: AAQBX9euW/AUOBziKw0AfhOU+9uvGPUDLh5fYfIo1eIQrFfUAFfha2rT
	om7FLLJ/g3BWaNX/Jem1kcsCB47pLyynPj0uUv4=
X-Google-Smtp-Source: AKy350aArjUI2H96/efNuT4p4Gns0LFchwaT84DgmUSYAPmyhG0Hxnacumi6y7a0qpoFL35F7ev0gS5BSSlbBVcMbIg=
X-Received: by 2002:a05:620a:280a:b0:745:7249:49ed with SMTP id
 f10-20020a05620a280a00b00745724949edmr1345672qkp.6.1680720836842; Wed, 05 Apr
 2023 11:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230405141710.3551-1-ubizjak@gmail.com> <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
In-Reply-To: <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 5 Apr 2023 20:53:45 +0200
Message-ID: <CAFULd4a6u=LB0ivfHtHt=jRxeJeLWuBot=Pync6pbrvKi=CdjA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
To: Dave Hansen <dave.hansen@intel.com>, Steven Rostedt <rostedt@goodmis.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, Jun Yi <yijun@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, loongarch@lists.linux.dev, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, linux-perf-users@vger.ke
 rnel.org, Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 5, 2023 at 6:37=E2=80=AFPM Dave Hansen <dave.hansen@intel.com> =
wrote:
>
> On 4/5/23 07:17, Uros Bizjak wrote:
> > Add generic and target specific support for local{,64}_try_cmpxchg
> > and wire up support for all targets that use local_t infrastructure.
>
> I feel like I'm missing some context.
>
> What are the actual end user visible effects of this series?  Is there a
> measurable decrease in perf overhead?  Why go to all this trouble for
> perf?  Who else will use local_try_cmpxchg()?

This functionality was requested by perf people [1], so perhaps Steven
can give us some concrete examples. In general, apart from the removal
of unneeded compare instruction on x86, usage of try_cmpxchg also
results in slightly better code on non-x86 targets [2], since the code
now correctly identifies fast-path through the cmpxchg loop.

Also important is that try_cmpxchg code reuses the result of cmpxchg
instruction in the loop, so a read from the memory in the loop is
eliminated. When reviewing the cmpxchg usage sites, I found numerous
places where unnecessary read from memory was present in the loop, two
examples can be seen in the last patch of this series.

Also, using try_cmpxchg prevents inconsistencies of the cmpxchg loop,
where the result of the cmpxchg is compared with the wrong "old" value
- one such bug is still lurking in x86 APIC code, please see [3].

Please note that apart from perf subsystem, event subsystem can also
be improved by using local_try_cmpxchg. This is the reason that the
last patch includes a change in events/core.c.

> I'm all for improving things, and perf is an important user.  But, if
> the goal here is improving performance, it would be nice to see at least
> a stab at quantifying the performance delta.

[1] https://lore.kernel.org/lkml/20230301131831.6c8d4ff5@gandalf.local.home=
/
[2] https://lore.kernel.org/lkml/Yo91omfDZtTgXhyn@FVFF77S0Q05N.cambridge.ar=
m.com/
[3] https://lore.kernel.org/lkml/20230227160917.107820-1-ubizjak@gmail.com/

Uros.
