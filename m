Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D6C58376F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 05:18:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtbTF3Dp0z2xjS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 13:18:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=a48R+Va3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtbSf5GVHz2xHc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 13:18:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=a48R+Va3;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LtbSf4JbGz4x1V;
	Thu, 28 Jul 2022 13:18:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658978290;
	bh=0a1SfDZjYD0OjVyntTUgHptnneGyXdJhKfGnfOBAcAk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=a48R+Va3VM2n7bEBvtkDWOplWR6rP69PNaK3OuAIn8INxiKx7288pkLbBWhnRs16G
	 iYTj9nx+eF16wfWB51OkE0Le6h1HYKKmqagmGUL/GeuTdOGjdAl+CwvP+0EPhmznMS
	 pmXU69swH3Pi1WD7yCK9FCG2/G471to6MX9Lut3Pu2VaMkBJOpdzdrYekLYkzuzrA6
	 yspLWaTi3ljnnWDvHlwbL/hDkdnZ2Bd+5blK8aqa/TSfOBYfQnOO4/WadyGmYFedqC
	 emdvFN3PhdFum3waxqwwJSesFdnHrzFOVo5phJ40S/lewFI1hMBJGYTB3zPD9jro3a
	 cplF1dyD6Rf+w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH] watchdog: Fix build error when
 CONFIG_SOFTLOCKUP_DETECTOR is not set
In-Reply-To: <4dd9afa4-ddc1-c6c9-1205-bca28a858022@linux.ibm.com>
References: <20220727092109.31362-1-ldufour@linux.ibm.com>
 <87sfmmaipn.fsf@mpe.ellerman.id.au>
 <4dd9afa4-ddc1-c6c9-1205-bca28a858022@linux.ibm.com>
Date: Thu, 28 Jul 2022 13:18:06 +1000
Message-ID: <87ilni9b81.fsf@mpe.ellerman.id.au>
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> Le 27/07/2022 =C3=A0 13:38, Michael Ellerman a =C3=A9crit=C2=A0:
>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>> Sachin reported the following build error when CONFIG_SOFTLOCKUP_DETECT=
OR
>>> is not set:
>>>
>>> kernel/watchdog.c:597:20: error: static declaration of 'lockup_detector=
_reconfigure' follows non-static declaration
>>>  static inline void lockup_detector_reconfigure(void)
>>>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> In file included from kernel/watchdog.c:17:
>>> ./include/linux/nmi.h:125:6: note: previous declaration of 'lockup_dete=
ctor_reconfigure' was here
>>>  void lockup_detector_reconfigure(void);
>>>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> The definition of lockup_detector_reconfigure should be exported even in
>>> that case, and __lockup_detector_reconfigure should remain static.
>>>
>>> Fixes: 24a1260705b7 ("watchdog: export lockup_detector_reconfigure")
>>> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
>>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>>> ---
>>>  kernel/watchdog.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> Thanks.
>>=20
>> I'll squash that in to the original commit.
>
> Thanks Michael,
>
> I was thinking this is too late for such a squash.

It usually would be, if I was organised, so sending a follow-up was the
correct thing for you to do :)

cheers
