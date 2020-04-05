Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F54219E81B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 02:42:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48vvy41JbbzDrbt
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 10:42:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48vvwQ3vmMzDrYf
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Apr 2020 10:40:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=FOJ3IBC7; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48vvwG0Lq0z9sP7;
 Sun,  5 Apr 2020 10:40:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1586047237;
 bh=Ecetm/FWyw23pFJR9aYjHEPKZAqW0as9jZfLtutKHZE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FOJ3IBC7mc8ibpgD0O6posipCUoBslj9lRk5uELexERCZFzS7zW9CSUb8ptsk096b
 +lQHDU2ACBxl75V60QihE/lrq5o4dLFUN51Y3pcnaknvfuqfNUkhA53TyO+is2N5P/
 AdZNo2eMg7ctXOPrnOsM0xsZcTRQCldx24KBrG0TodRKbhNJlrXdoyxvJh6C+fTRDm
 J174SpN5e7RaOOFXOIcPKC1agC94ZT8tRlERZ1/pqZ84Wj6qv+A0Y8s6y31ZVZznKP
 hc0MWFUe0Sg5/QOTVHcvh8FPvuV1yoeTNmD9UMUXlx0A0eurI5b0nILo816HxWGSfe
 I1xQhSMZyMSSg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org,
 Michal Suchanek <msuchanek@suse.de>
Subject: Re: [PATCH v11 0/8] Disable compat cruft on ppc64le v11
In-Reply-To: <1585906885.3dbukubyr8.astroid@bobo.none>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584620202.git.msuchanek@suse.de>
 <1585898335.tckaz04a6x.astroid@bobo.none>
 <1e00a725-9710-2b80-4aff-2f284b31d2e5@c-s.fr>
 <1585906885.3dbukubyr8.astroid@bobo.none>
Date: Sun, 05 Apr 2020 10:40:38 +1000
Message-ID: <87k12usr21.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Rob Herring <robh@kernel.org>,
 Michael Neuling <mikey@neuling.org>, Eric Richter <erichte@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Christophe Leroy's on April 3, 2020 5:26 pm:
>> Le 03/04/2020 =C3=A0 09:25, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> Michal Suchanek's on March 19, 2020 10:19 pm:
>>>> Less code means less bugs so add a knob to skip the compat stuff.
>>>>
>>>> Changes in v2: saner CONFIG_COMPAT ifdefs
>>>> Changes in v3:
>>>>   - change llseek to 32bit instead of builing it unconditionally in fs
>>>>   - clanup the makefile conditionals
>>>>   - remove some ifdefs or convert to IS_DEFINED where possible
>>>> Changes in v4:
>>>>   - cleanup is_32bit_task and current_is_64bit
>>>>   - more makefile cleanup
>>>> Changes in v5:
>>>>   - more current_is_64bit cleanup
>>>>   - split off callchain.c 32bit and 64bit parts
>>>> Changes in v6:
>>>>   - cleanup makefile after split
>>>>   - consolidate read_user_stack_32
>>>>   - fix some checkpatch warnings
>>>> Changes in v7:
>>>>   - add back __ARCH_WANT_SYS_LLSEEK to fix build with llseek
>>>>   - remove leftover hunk
>>>>   - add review tags
>>>> Changes in v8:
>>>>   - consolidate valid_user_sp to fix it in the split callchain.c
>>>>   - fix build errors/warnings with PPC64 !COMPAT and PPC32
>>>> Changes in v9:
>>>>   - remove current_is_64bit()
>>>> Chanegs in v10:
>>>>   - rebase, sent together with the syscall cleanup
>>>> Changes in v11:
>>>>   - rebase
>>>>   - add MAINTAINERS pattern for ppc perf
>>>=20
>>> These all look good to me. I had some minor comment about one patch but
>>> not really a big deal and there were more cleanups on top of it, so I
>>> don't mind if it's merged as is.
>>>=20
>>> Actually I think we have a bit of stack reading fixes for 64s radix now
>>> (not a bug fix as such, but we don't need the hash fault logic in radix=
),
>>> so if I get around to that I can propose the changes in that series.
>>>=20
>>=20
>> As far as I can see, there is a v12
>
> For the most part I was looking at the patches in mpe's next-test
> tree on github, if that's the v12 series, same comment applies but
> it's a pretty small nitpick.

Yeah I have v12 in my tree.

This has floated around long enough (our fault), so I'm going to take it
and we can fix anything up later.

cheers
