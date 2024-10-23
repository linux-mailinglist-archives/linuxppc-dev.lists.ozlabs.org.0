Return-Path: <linuxppc-dev+bounces-2490-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA0A9ABB2C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 03:53:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYBsw5hqjz2xpn;
	Wed, 23 Oct 2024 12:53:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729648436;
	cv=none; b=TxaPLwwgVLo9whXQp9xhc1WPlS+Fo/LI3gmotX1yGkMt/cn5B/GCoPIZQH7+mTofREeKyXrhwPuwIlWHj+lK+DNh5tZmUzEaO1Xwb6IvtjB24yoOmdl8/PmJFVhYWROappNYWFqyT5xhINdzv6W3OKFHUbtinwrfUR7ecz0cTJP3K2JpwvGNXd4HFHRYPgHtml0l+EUG57UPDZA6L3yVp4k0mjztObJcYDYgkEbRyWHJQd+se/021q1WEiROu1GcKR9Mx/lkjYi4IKqxJORwJ+Hw7uBTFx2A6Nbw+mkH48yceK8k6z3ZZZFYR5SE1bl7EJon9MqsLrjhwpdUYJ9WcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729648436; c=relaxed/relaxed;
	bh=Prey1zqDyFSBZaOzoYCxWeGlOrbQcMsbN15eTVtd0ew=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a02HY7sAsL7h+BSDZ1qhbrG7qry7aihA4UCrmBgteDwVPnJ+GiBsRnG6GsxPa5i4W2I9JHmR3MIkiFdUCyvBRtZwV1NVRi2uBarZLGJPYK9dvyeSrdo3eBct70+CqcIwVRIvzRL+HYTsH57cpUUo4QL6PEIx6ftfFyZMx0uqdsAnPFJJHtNd6jj6rcH98dP1gsXG0M9T/OytQg9BYo+5JbUVHTlarDuxyE24zkKc24Lap/sCfo78k3KYX5YadW4MTNY223HdURubHCWMV/ZJOe3lWP4ZvumdouLb7V4Rw3s+YbTMnyDOFhSAF+srQ5w5cM9dL0SGF88GZ+ggaSGybw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pXRHKFR7; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pXRHKFR7;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYBsv1KTGz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 12:53:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1729648429;
	bh=Prey1zqDyFSBZaOzoYCxWeGlOrbQcMsbN15eTVtd0ew=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=pXRHKFR7ntVrXNcEIMLtFDlIuYC9/RRWyeq7NWNa6x0JqBjVbSKPksqvhtzlWDrI5
	 6sl05Gembdrue4GMcW+S/PYRMYqWnuqa5R9VOeFddEAY6+2aU25e9TMjrTAqrVqIbq
	 bY3rjKC+5yw00HVLBA8Pf6D4osB6TZYKsCYEyGG9rZfw+NN8s1X7kyAoFSIVogJYSn
	 qSYYsg2o3pN4gB9q9sMmAV+Dqk4WnVfA6JYJk/vzv1biDHWVfye8FzXNL4u7X4yaid
	 vdjCHF46WPEz89qMqOZQtPmc/GiXQ9/mH1ACbu5v77mNlh154+rViT4jtnrKSJCNNd
	 IGl6gkj4uucFA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYBsn65Fxz4wb1;
	Wed, 23 Oct 2024 12:53:49 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?B?6Jme6ZmG6ZOt?= <luming.yu@shingroup.cn>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, npiggin <npiggin@gmail.com>,
 "jialong.yang" <jialong.yang@shingroup.cn>, "luming.yu"
 <luming.yu@gmail.com>
Subject: Re: [PATCH 1/7] powerpc/entry: convert to common and generic entry
In-Reply-To: <tencent_381ACB160B890CC46678170E@qq.com>
References: <88E2581B1D024E9A+20241012035621.1245-3-luming.yu@shingroup.cn>
 <e9595d8b-d1e2-4c6a-b097-6f4f08d29866@csgroup.eu>
 <tencent_381ACB160B890CC46678170E@qq.com>
Date: Wed, 23 Oct 2024 12:53:47 +1100
Message-ID: <87o73b37pw.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

"=E8=99=9E=E9=99=86=E9=93=AD" <luming.yu@shingroup.cn> writes:
>>Le 12/10/2024 =C3=A0 05:56, Luming Yu a =C3=A9crit :
>>> convert powerpc entry code in syscall and fault to use syscall_work
>>> and irqentry_state as well as common calls implemented in generic
>>> entry infrastructure.
>>>=20
>>> Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
>>> ---
>>>   arch/powerpc/Kconfig                   | 1 +
>>>   arch/powerpc/include/asm/hw_irq.h      | 5 +++++
>>>   arch/powerpc/include/asm/processor.h   | 6 ++++++
>>>   arch/powerpc/include/asm/syscall.h     | 5 +++++
>>>   arch/powerpc/include/asm/thread_info.h | 1 +
>>>   arch/powerpc/kernel/syscall.c          | 5 ++++-
>>>   arch/powerpc/mm/fault.c                | 3 +++
>>>   7 files changed, 25 insertions(+), 1 deletion(-)
>>>=20
>>
>>...
>>
>>> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscal=
l.c
>>> index 77fedb190c93..e0338bd8d383 100644
>>> --- a/arch/powerpc/kernel/syscall.c
>>> +++ b/arch/powerpc/kernel/syscall.c
>>> @@ -3,6 +3,7 @@
>>>   #include <linux/compat.h>
>>>   #include <linux/context_tracking.h>
>>>   #include <linux/randomize_kstack.h>
>>> +#include <linux/entry-common.h>
>>>=20=20=20
>>>   #include <asm/interrupt.h>
>>>   #include <asm/kup.h>
>>> @@ -131,7 +132,7 @@ notrace long system_call_exception(struct pt_regs *=
regs, unsigned long r0)
>>>   		 * and the test against NR_syscalls will fail and the return
>>>   		 * value to be used is in regs->gpr[3].
>>>   		 */
>>> -		r0 =3D do_syscall_trace_enter(regs);
>>> +		r0 =3D syscall_enter_from_user_mode(regs, r0);
>>
>>Can you provide details on how this works ?
> I assume the common entry would take over th details.
> So I just made the switch from the high level call.
>
> As you said as the subtle ABI requirement about regs->r3 needs to
> be restored, I'm wondering which test can capture the lost
> ABI feature. As simple Boot test is insufficient, what is the test set
> that can capture it?

The seccomp selftest did exercise it back when I originally wrote that
code. I don't know for sure that it still does, but that would be a good
start.

It's in tools/testing/selftests/seccomp/

cheers

