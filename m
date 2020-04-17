Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7DC1ADC74
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 13:50:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493ZCl67SgzDrh8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 21:50:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493Z9t04dRzDrft
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 21:48:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ezJOnc/a; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 493Z9s1CRmz9sR4;
 Fri, 17 Apr 2020 21:48:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1587124129;
 bh=u64JoNPznSk/s1wlkLsaK0ZwwAoV7umGq+/7aZC3G2M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ezJOnc/a+90kryN6h6AM6TUNXUbbAPB0090CGjSNgXlVDKaVnrwEU4ms7K3FQnEv2
 xBCXhBhgbKC5ZttvDuEXsfnDXVQMj4hJYWzqGzwXi8IfvQUQZ8SRu2qSVe3pZpm/U8
 DY2XUD/dTpuY2OPFuDfIddGRnrmpsoz84XN9RlX9BOuH2vh+/0yw3ZqZh97lO/dQ7Z
 M23e9CVphFDqBnlx3eZxPdYR86H67rk/BLT9vovU1EKWioQ3NegzDCMgJRA/sl0A0p
 qLmLNOTwqRvUN77YxPk3DDqa02YgTZ8h/TuklFX1Y+QKmnWF4Kf2uPMBWV6O9+/nbf
 WtEd9hppX7Zsg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Russell Currey <ruscur@russell.cc>
Subject: Re: POWER9 crash due to STRICT_KERNEL_RWX (WAS: Re: Linux-next POWER9
 NULL pointer NIP...)
In-Reply-To: <1587106774.1oa2whm69m.naveen@linux.ibm.com>
References: <15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw>
 <87eeszlb6u.fsf@mpe.ellerman.id.au>
 <0675B22E-8F32-432C-9378-FDE159DD1729@lca.pw>
 <20200407093054.3eb23e45@gandalf.local.home>
 <EA9F9A54-87BC-477A-BE8A-7D53F80C5223@lca.pw>
 <20200409101413.35d9c72d@gandalf.local.home>
 <06A2EA93-B730-4DB1-819F-D27E7032F0B3@lca.pw>
 <161662E3-5D9C-4C15-919C-CFEFE4CC35CB@lca.pw>
 <69F0448F-CA5B-497D-B8AF-2848175B9477@lca.pw>
 <1587106774.1oa2whm69m.naveen@linux.ibm.com>
Date: Fri, 17 Apr 2020 21:49:02 +1000
Message-ID: <87blnqib81.fsf@mpe.ellerman.id.au>
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
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:
> Hi Qian,
>
> Qian Cai wrote:
>> OK, reverted the commit,
>>=20
>> c55d7b5e6426 (=E2=80=9Cpowerpc: Remove STRICT_KERNEL_RWX incompatibility=
 with RELOCATABLE=E2=80=9D)
>>=20
>> or set STRICT_KERNEL_RWX=3Dn fixed the crash below and also mentioned in=
 this thread,
>>=20
>> https://lore.kernel.org/lkml/15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw/
>
> Do you see any errors logged in dmesg when you see the crash?=20=20
> STRICT_KERNEL_RWX changes how patch_instruction() works, so it would be=20
> interesting to see if there are any ftrace-related errors thrown before=20
> the crash.

I've been able to reproduce with STRICT_KERNEL_RWX=3Dy and concurrently
running:

# while true; do echo function > /sys/kernel/debug/tracing/current_tracer ;=
 echo nop > /sys/kernel/debug/tracing/current_tracer ; done

and:

# while true; do find /lib/modules/$(uname -r) -name '*.ko' -printf "%f\n" =
| sed -e "s/\.ko//" | xargs -i modprobe -va {}; lsmod | awk '{print $1}' | =
xargs -i modprobe -vr {}; done

ie. stressing module loading/unloading and ftrace at the same time.


It's not 100% but it usually reproduces within 10-20 minutes.

It looks like sometimes our __patch_instruction() fails, and then that
somehow leads to things getting further messed up. Presumably we have
some bad error handling somewhere.

cheers
