Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 345733AD804
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 08:03:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6QFG4vhhz3c1J
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 16:02:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HqTuCzfR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HqTuCzfR; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6QDp2kvfz301K
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 16:02:33 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id h16so6942498pjv.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 23:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=6wKXgd/ZhGiTUrwlorOP1aKdH3EvNfTZEGLOVoYRfnA=;
 b=HqTuCzfRgtpxdtQsv5eXBAj6MY60ow4aM/DQATcTOrV/s2Z1lom+u5+UgkGJyFUMrR
 sBm4Hw8mpm1b2NWuVNjV5HlFClau9nEewZt/h5Noo7Rxilij1QenUcYn5TMTv2ep4BZh
 dezXiQiqQdwaClkPIiahsQD+wZr7r1cZzkkO94gYiK7GiRmDf84djWdzNhK6Dgtb4qgY
 OFedJiTkHTSjVlGO0m4koiJ3G1Q/py26GcIKMZ7f2d4P4OipQ7ebZz3xK/obxcf2M4EW
 TENafsgnBHGZNkqqvs4TCdkFQy6vdlx6ZMaNPOSS9IhtgLW2s2dztU5ieTx1F7/KHX/y
 Gsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=6wKXgd/ZhGiTUrwlorOP1aKdH3EvNfTZEGLOVoYRfnA=;
 b=W6yKM+93VpDNnDEiQn02Mc320xFczask2U0cQc+CiT/FfGuBW+XJLdJWZAgMhHdcBp
 C4DF6fz/0zS5nveLCQ6vgOSOJpJBSgcDeSzFpqkOJtUDv4Tr6OMDR4UHnpbYwG1FKHIw
 ue1wm6NPrgdNflDiRLGALkLjQq3anvpm93OXYVue7myezSrTJ8feqhxcknCz55vXyWjq
 D1ZoOF/PZh63N6yEmoP5CgAD7X4pK3KJw3UbCx8Xa62k7txSW1Iy4YKCUjiBdqT057QI
 ia1j1/J33BMGH1XenBtqSXZccA70oIs62FkTsEB8zr4g9GdlkEhdQ97NxLCaHa2Qe4l3
 rx+w==
X-Gm-Message-State: AOAM532buf6X2ztmwXLjeXKumEdSEJBgemp76joKyAR4bC8qONcLH6aH
 M3qay+fX85r/pHtfbHAeGrQ=
X-Google-Smtp-Source: ABdhPJyKMGe6svO1edmje4gRVg+O1L9zIRT6wzOtEKvbi1F4rLOfCjfJ9mjTw5mzRepW9QleX5pgcQ==
X-Received: by 2002:a17:902:b218:b029:11a:bf7b:1a80 with SMTP id
 t24-20020a170902b218b029011abf7b1a80mr8106460plr.82.1624082548020; 
 Fri, 18 Jun 2021 23:02:28 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id s123sm9246118pfb.78.2021.06.18.23.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 23:02:27 -0700 (PDT)
Date: Sat, 19 Jun 2021 16:02:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 8/8] membarrier: Rewrite sync_core_before_usermode() and
 improve documentation
To: Andy Lutomirski <luto@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>
References: <cover.1623813516.git.luto@kernel.org>
 <07a8b963002cb955b7516e61bad19514a3acaa82.1623813516.git.luto@kernel.org>
 <827549827.10547.1623941277868.JavaMail.zimbra@efficios.com>
 <26196903-4aee-33c4-bed8-8bf8c7b46793@kernel.org>
 <593983567.12619.1624033908849.JavaMail.zimbra@efficios.com>
 <1d617df2-57fa-4953-9c75-6de3909a6f14@www.fastmail.com>
 <639092151.13266.1624046981084.JavaMail.zimbra@efficios.com>
In-Reply-To: <639092151.13266.1624046981084.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Message-Id: <1624080924.z61zvzi4cq.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Will Deacon <will@kernel.org>, linux-mm <linux-mm@kvack.org>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Paul Mackerras <paulus@samba.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Mathieu Desnoyers's message of June 19, 2021 6:09 am:
> ----- On Jun 18, 2021, at 3:58 PM, Andy Lutomirski luto@kernel.org wrote:
>=20
>> On Fri, Jun 18, 2021, at 9:31 AM, Mathieu Desnoyers wrote:
>>> ----- On Jun 17, 2021, at 8:12 PM, Andy Lutomirski luto@kernel.org wrot=
e:
>>>=20
>>> > On 6/17/21 7:47 AM, Mathieu Desnoyers wrote:
>>> >=20
>>> >> Please change back this #ifndef / #else / #endif within function for
>>> >>=20
>>> >> if (!IS_ENABLED(CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE)) {
>>> >>   ...
>>> >> } else {
>>> >>   ...
>>> >> }
>>> >>=20
>>> >> I don't think mixing up preprocessor and code logic makes it more re=
adable.
>>> >=20
>>> > I agree, but I don't know how to make the result work well.
>>> > membarrier_sync_core_before_usermode() isn't defined in the !IS_ENABL=
ED
>>> > case, so either I need to fake up a definition or use #ifdef.
>>> >=20
>>> > If I faked up a definition, I would want to assert, at build time, th=
at
>>> > it isn't called.  I don't think we can do:
>>> >=20
>>> > static void membarrier_sync_core_before_usermode()
>>> > {
>>> >    BUILD_BUG_IF_REACHABLE();
>>> > }
>>>=20
>>> Let's look at the context here:
>>>=20
>>> static void ipi_sync_core(void *info)
>>> {
>>>     [....]
>>>     membarrier_sync_core_before_usermode()
>>> }
>>>=20
>>> ^ this can be within #ifdef / #endif
>>>=20
>>> static int membarrier_private_expedited(int flags, int cpu_id)
>>> [...]
>>>                if (!IS_ENABLED(CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE))
>>>                         return -EINVAL;
>>>                 if (!(atomic_read(&mm->membarrier_state) &
>>>                       MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE_READ=
Y))
>>>                         return -EPERM;
>>>                 ipi_func =3D ipi_sync_core;
>>>=20
>>> All we need to make the line above work is to define an empty ipi_sync_=
core
>>> function in the #else case after the ipi_sync_core() function definitio=
n.
>>>=20
>>> Or am I missing your point ?
>>=20
>> Maybe?
>>=20
>> My objection is that an empty ipi_sync_core is a lie =E2=80=94 it doesn=
=E2=80=99t sync the core.
>> I would be fine with that if I could have the compiler statically verify=
 that
>> it=E2=80=99s not called, but I=E2=80=99m uncomfortable having it there i=
f the implementation is
>> actively incorrect.
>=20
> I see. Another approach would be to implement a "setter" function to popu=
late
> "ipi_func". That setter function would return -EINVAL in its #ifndef CONF=
IG_ARCH_HAS_MEMBARRIER_SYNC_CORE
> implementation.

I still don't get the problem with my suggestion. Sure the=20
ipi is a "lie", but it doesn't get used. That's how a lot of
ifdef folding works out. E.g.,

diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
index b5add64d9698..54cb32d064af 100644
--- a/kernel/sched/membarrier.c
+++ b/kernel/sched/membarrier.c
@@ -5,6 +5,15 @@
  * membarrier system call
  */
 #include "sched.h"
+#ifdef CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE
+#include <asm/sync_core.h>
+#else
+static inline void membarrier_sync_core_before_usermode(void)
+{
+	compiletime_assert(0, "architecture does not implement membarrier_sync_co=
re_before_usermode");
+}
+
+#endif
=20
 /*
  * For documentation purposes, here are some membarrier ordering
