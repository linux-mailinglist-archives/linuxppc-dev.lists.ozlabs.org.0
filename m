Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FE07A174E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 09:26:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lxTpMv/M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn5My50CQz3d85
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 17:26:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lxTpMv/M;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn5M352ysz3bwX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 17:25:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1694762734;
	bh=AaT+Zd5A+u64/jZniFM2Hfp9z5ZX8DVUs5Jk9m7d9J8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lxTpMv/MD/jC11s2upB8FzLsS7hAoDNJTH9BYMPSJhnRvlKts1RGzbHXQ4+14yaNA
	 3/7vXyisYcev6W7Xy9vcVG6BM+rn3Qhof1+JUWTZFmDTAHGhxV/mDjSxM+89aSTOne
	 ctESIfeqCXLrqzlOvrXJOKS87qAkU0SDUzkz6eyKcd36wBLiU1fmLxW41G8Tp9/jzq
	 nBTYFoGZyeILYg3MWKI76aD/DYMu5NX4b3YUlHEqbmSc07sF4EvHPMl9HjR1lzdJxF
	 nsVLzUxJA/ro8VVQte2SmLQNb5QMjV30mDKeCmIJbMRlm7onvDMzIG0Q7XmPu3tXsO
	 qga/WMC5Xv9oQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rn5M22HYpz4wxg;
	Fri, 15 Sep 2023 17:25:32 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/82xx: Select FSL_SOC
In-Reply-To: <c481fa91-0cfb-1c19-2da7-cf768bc56aea@csgroup.eu>
References: <7ab513546148ebe33ddd4b0ea92c7bfd3cce3ad7.1694705016.git.christophe.leroy@csgroup.eu>
 <87led86zaq.fsf@mail.lhotse>
 <c481fa91-0cfb-1c19-2da7-cf768bc56aea@csgroup.eu>
Date: Fri, 15 Sep 2023 17:25:27 +1000
Message-ID: <875y4b7va0.fsf@mail.lhotse>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 15/09/2023 =C3=A0 02:43, Michael Ellerman a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> It used to be impossible to select CONFIG_CPM2 without selecting
>>> CONFIG_FSL_SOC at the same time because CONFIG_CPM2 was dependent
>>> on CONFIG_8260 and CONFIG_8260 was selecting CONFIG_FSL_SOC.
>>>
>>> But after commit eb5aa2137275 ("powerpc/82xx: Remove CONFIG_8260
>>> and CONFIG_8272") CONFIG_CPM2 depends on CONFIG_MPC82xx instead
>>                                             ^
>>                                             CONFIG_PPC_82xx
>>=20
>> All the references to CONFIG_MPC82xx should be CONFIG_PPC_82xx right?
>> I can update when applying.
>
> Ah right, I mixed things up. This is CONFIG_PPC_82xx, CONFIG_PPC_8xx,=20
> CONFIG_PPC_83xx and CONFIG_PPC_MPC512x

Thanks.

cheers
