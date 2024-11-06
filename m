Return-Path: <linuxppc-dev+bounces-2909-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A74E09BEA8E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 13:47:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk4k13GFxz2yRD;
	Wed,  6 Nov 2024 23:47:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730897273;
	cv=none; b=XoICiJipJ2gcopNCyxn6cFBDTrzDMibijSlZGoeflC6KdutSJMVYFCxZZgaKOeXenk2JgrlNer4Eo0HjlFPqJ0iJhOJEbV33x/5tIEEz/newbZ6p1TGMt8WBY2WI/v+b7mHwldmsVpvz3UYDzcajvCez696QbO/YMO2s6NBZeaW3ptbksYwHmmOisSa7nHkfg/Dci5xktrmcCdmmwq/A7/rmH/c9axVHAWhbeM7a7iTIrbM6bmRubnlcGT8GVcRhGIkjZt708atGfL7Hft0tfYWxICBnSObfCy1Y5bmcvZZAAwrrEB/UA/S4/8aoT895+5dLFBz8RF6MyhPIgcUqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730897273; c=relaxed/relaxed;
	bh=KaOyQ0C4hIjkB+fA1jHuDTauRfGbneabx4L3UBFxt6Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JrJKeVm+4BwopnRPyAntVY5fS43AaXpW8NODqkUF4DGTPcYCr9cwq2qox6dvZ1dZqusZ1bs4Hrr6srXTmsxvHnj/IbkdnZs2qjP1xDXjp5fqxDL/9cmvIAKJv96+h3qFZCk5W6hs+1+dWPDFjoSexUFiv0rgY8sNZ3gJQ9k/vRCKu9tcT0f0ZpeOyZaGxgRktoqbue37cWlO880w/3u9WACZpblX4JtB57llStp6E2NC/k+PoPwlEGP0DhbgJJNy7eiE1+M/33r3Smhanz/nczyRECaNAj10IeRklYkofy+TDtzTi3cwSYfLqiTskU/aqbB8mJVyxFuXNnaH0pjmrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Mpd5GGl6; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Mpd5GGl6;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk4jy3xtSz2yKD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 23:47:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730897266;
	bh=KaOyQ0C4hIjkB+fA1jHuDTauRfGbneabx4L3UBFxt6Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Mpd5GGl6RtPsXNNiXI4HEMbNdahUrqL/89ft95jp8odhuLfVTYFPGkFBuTWUCDdb5
	 fbHtlwpzoSC1yPWX9nYUs+xGdbvWjpvNmq739KKog08P6ooDyVwQHMK/F+qp+xUT5x
	 M4Vax74nYlJ9YTfgtsgDWOz8TEJXUdBj7WCFY6rLZ2sccLhp2NBMpSvvD7tzKTgmtU
	 I6j5kDS23EhYFEBOhmIspGrNGgv5Yw8la6SkDtsDw3lPiOIyllmOlu7cy+SslEa5Bw
	 j2VUzD/hLDxVg42lADGIRkqnQX/esoCT09ylzBL8Uu0K7wPxcOoCOwdJ/0+vjS9AHx
	 j9cjRevhU4itA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xk4js6wVbz4wyh;
	Wed,  6 Nov 2024 23:47:45 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Naveen N
 Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Kees Cook
 <kees@kernel.org>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] powerpc: Add __must_check to set_memory_...()
In-Reply-To: <8dcc739a-3fd4-434c-995c-1dce33cefe6f@csgroup.eu>
References: <775dae48064a661554802ed24ed5bdffe1784724.1725723351.git.christophe.leroy@csgroup.eu>
 <8dcc739a-3fd4-434c-995c-1dce33cefe6f@csgroup.eu>
Date: Wed, 06 Nov 2024 23:47:44 +1100
Message-ID: <874j4klea7.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Hi Michael,
>
> Le 07/09/2024 =C3=A0 17:40, Christophe Leroy a =C3=A9crit=C2=A0:
>> After the following powerpc commits, all calls to set_memory_...()
>> functions check returned value.
>> - Commit 8f17bd2f4196 ("powerpc: Handle error in mark_rodata_ro() and
>> mark_initmem_nx()")
>> - Commit f7f18e30b468 ("powerpc/kprobes: Handle error returned by
>> set_memory_rox()")
>> - Commit 009cf11d4aab ("powerpc: Don't ignore errors from
>> set_memory_{n}p() in __kernel_map_pages()")
>> - Commit 9cbacb834b4a ("powerpc: Don't ignore errors from
>> set_memory_{n}p() in __kernel_map_pages()")
>> - Commit 78cb0945f714 ("powerpc: Handle error in mark_rodata_ro() and
>> mark_initmem_nx()")
>>=20
>> All calls in core parts of the kernel also always check returned value,
>> can be looked at with following query:
>>=20
>>    $ git grep -w -e set_memory_ro -e set_memory_rw -e set_memory_x -e se=
t_memory_nx -e set_memory_rox `find . -maxdepth 1 -type d | grep -v arch | =
grep /`
>>=20
>> It is now possible to flag those functions with __must_check to make
>> sure no new unchecked call it added.
>>=20
>> Link: https://github.com/KSPP/linux/issues/7
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>
> Do you plan to take this patch anytime soon ?
>
> The generic part of the same was already applied in previous cycle, see=20
> https://github.com/torvalds/linux/commit/82ce8e2f31a1eb05b1527c3d807bea40=
031df913

I was waiting for the generic part to land, sorry I missed it.

Will put this in next now.

cheers

