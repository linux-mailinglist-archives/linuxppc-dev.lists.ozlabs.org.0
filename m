Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13410212182
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 12:48:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yFFZ1JgyzDqx2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 20:48:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Tsn7QxuQ; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yFCm297nzDqcX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 20:47:14 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id gc9so5783740pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 03:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=7/yp0REosLZos2NH5xismEOcBs6RT4AyW+naEiQaKEQ=;
 b=Tsn7QxuQps6f4KsopBLK/6r7NKPpGUWGpS+e+NrpdDPq41xQyUqMOo+gmEQkN1qI4S
 BHxGxUV5vcdLTX0ajvZOT5Jamg+NLxMN6Yb/BLiPv7A2HCYxQWyzcDfVKcDpDuSeZI2h
 3Q8YwMmLZnrNPs0yIu+sGh20AEHX9gWyfYaMvgUHoffumVOJhg0CiYR38X8RrHCWNf5j
 Md84bVtpBpyovyhHrUoxL6XPgBDUAjA5btaePBVMEdpYH3Nhk118jOknAg9Mx4Y7MhEK
 r/vtbGGjHtUkWLzw78JG/7MLM9d7Vw8hGja8DWr9kQ3IsewCaBztynFRMMH/QNdHLtke
 fVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=7/yp0REosLZos2NH5xismEOcBs6RT4AyW+naEiQaKEQ=;
 b=eW8UrMYSs/JNs8wkvFgTA6d/nkX7+cGI3UZ1Cp97/P26+cE+EDLO+CECKRIQQXrweK
 37csGbHNxZq/8hokcwpV6HUueeCKvdLGjDKScOB9fTMvIIv2iAr1gIlxlbKGiXl11ZDG
 f01u8+rdJCPLxFv1kTOg7BS/W+AU2ka3o4CB19V25IlXBg2vwtZQxu/UaPWwygMkWDCr
 IGLq77cT1gl5lGJMJR2wlsz7Nv64iYSz8vOlbrZqsZETTJG095YDbZOTKV4E7RFcAFp4
 LydQ4tInqYKf2EVgg0qVL5PTVSCYZ49qwWajG3mkW11Ceb/CYo7pawhou3NKqu7bvvow
 KlHg==
X-Gm-Message-State: AOAM533sEi8ocdxi2OljPFVJMGf7nKF76wzCmVpeFbvHBF53nNZlGsnN
 BMvYEKvpJDacOPBisFJj160=
X-Google-Smtp-Source: ABdhPJwoIU+iCSn5Sb/43jebiYHxhFfNdVq9eoVNXNmFOsjzyeH63SOj20Ofhe6NtxmyHaem2+gpVQ==
X-Received: by 2002:a17:90a:a60a:: with SMTP id
 c10mr4463276pjq.117.1593686831628; 
 Thu, 02 Jul 2020 03:47:11 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id y19sm8213367pfc.135.2020.07.02.03.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 03:47:11 -0700 (PDT)
Date: Thu, 02 Jul 2020 20:47:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 5/8] powerpc/64s: implement queued spinlocks and rwlocks
To: Will Deacon <will@kernel.org>
References: <20200702074839.1057733-1-npiggin@gmail.com>
 <20200702074839.1057733-6-npiggin@gmail.com>
 <20200702080219.GB16113@willie-the-truck>
 <1593685459.r2tfxtfdp6.astroid@bobo.none>
 <20200702103506.GA16418@willie-the-truck>
In-Reply-To: <20200702103506.GA16418@willie-the-truck>
MIME-Version: 1.0
Message-Id: <1593686722.w9psaqk7yp.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Will Deacon's message of July 2, 2020 8:35 pm:
> On Thu, Jul 02, 2020 at 08:25:43PM +1000, Nicholas Piggin wrote:
>> Excerpts from Will Deacon's message of July 2, 2020 6:02 pm:
>> > On Thu, Jul 02, 2020 at 05:48:36PM +1000, Nicholas Piggin wrote:
>> >> diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/incl=
ude/asm/qspinlock.h
>> >> new file mode 100644
>> >> index 000000000000..f84da77b6bb7
>> >> --- /dev/null
>> >> +++ b/arch/powerpc/include/asm/qspinlock.h
>> >> @@ -0,0 +1,20 @@
>> >> +/* SPDX-License-Identifier: GPL-2.0 */
>> >> +#ifndef _ASM_POWERPC_QSPINLOCK_H
>> >> +#define _ASM_POWERPC_QSPINLOCK_H
>> >> +
>> >> +#include <asm-generic/qspinlock_types.h>
>> >> +
>> >> +#define _Q_PENDING_LOOPS	(1 << 9) /* not tuned */
>> >> +
>> >> +#define smp_mb__after_spinlock()   smp_mb()
>> >> +
>> >> +static __always_inline int queued_spin_is_locked(struct qspinlock *l=
ock)
>> >> +{
>> >> +	smp_mb();
>> >> +	return atomic_read(&lock->val);
>> >> +}
>> >=20
>> > Why do you need the smp_mb() here?
>>=20
>> A long and sad tale that ends here 51d7d5205d338
>>=20
>> Should probably at least refer to that commit from here, since this one=20
>> is not going to git blame back there. I'll add something.
>=20
> Is this still an issue, though?
>=20
> See 38b850a73034 (where we added a similar barrier on arm64) and then
> c6f5d02b6a0f (where we removed it).
>=20

Oh nice, I didn't know that went away. Thanks for the heads up.

I'm going to say I'm too scared to remove it while changing the
spinlock algorithm, but I'll open an issue and we should look at=20
removing it.

Thanks,
Nick

