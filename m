Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E0B57FDA5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 12:36:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrxKV42qbz3c4Y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 20:36:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hyKiJ+Cv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrxJx3kW0z3bfC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 20:35:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hyKiJ+Cv;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LrxJt751Fz4x1V;
	Mon, 25 Jul 2022 20:35:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658745343;
	bh=0lCaavWzTEZHOsWuEv+IyLlCXiBw3fnmcQUsCDoTEz0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hyKiJ+CvxWjTeFH0JhJenCdhUYGHkDfBTRDkIc1X4zHDAv1/FORSiBRgQZB8PGbR5
	 Ldq6Btgt1i2zTlEr8ad8HFzqPXb/+gAdWOAweGIzyste/CmE/GPFpKKhVepo/o7PMo
	 qcv/NfGcS3nH4QJxf0T2hElvPY+KR0jUTkUReVyEY4BQ0vhi0Y8WC5TNfwdlFCSiPB
	 hkwx+cQ+V/GdxacJ/9pGduOp1MLDyWSTNZwtogKMwaoHm+NYNN7nwvNo+7f28rnRgG
	 Pw+8J41ddH3Jw1FevbnYJkIOkTIuEhkjoH2TUnRbPWqJ59NslgXeD1L/xOyPUXtePH
	 uk6gSM1mTppzA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] powerpc/kvm: fix repeated words in comments Delete the
 redundant word 'that'.
In-Reply-To: <alpine.DEB.2.22.394.2207250913290.2424@hadrien>
References: <20220724062920.1551-1-wangjianli@cdjrlc.com>
 <87bktdd6s8.fsf@mpe.ellerman.id.au>
 <alpine.DEB.2.22.394.2207250913290.2424@hadrien>
Date: Mon, 25 Jul 2022 20:35:40 +1000
Message-ID: <87zggxbhtv.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-kernel@vger.kernel.org, Julia.Lawall@inria.fr, paulus@samba.org, liubo03@inspur.com, wangjianli <wangjianli@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Julia Lawall <julia.lawall@inria.fr> writes:
> On Mon, 25 Jul 2022, Michael Ellerman wrote:
>> wangjianli <wangjianli@cdjrlc.com> writes:
>> > diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
>> > index 514fd45c1994..73c6db20cd8a 100644
>> > --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
>> > +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
>> > @@ -1601,7 +1601,7 @@ long kvm_vm_ioctl_resize_hpt_commit(struct kvm *kvm,
>> >   * is valid, it is written to the HPT as if an H_ENTER with the
>> >   * exact flag set was done.  When the invalid count is non-zero
>> >   * in the header written to the stream, the kernel will make
>> > - * sure that that many HPTEs are invalid, and invalidate them
>> > + * sure that many HPTEs are invalid, and invalidate them
>> >   * if not.
>>
>> The existing wording is correct:
>>
>>  "the kernel will make sure that ... that many HPTEs are invalid"
>
> Maybe it would be better as "that the number of invalid HPTEs is the same
> as the invalid count"?

That doesn't read quite right, I think because if the number of invalid
HPTEs doesn't match the invalid count, the code will invalidate HPTEs so
that the number matches.

So maybe:

  When the invalid count is non-zero in the header written to the stream,
  the kernel will make sure that number of HPTEs are invalid, or
  invalidate them if not.

cheers
