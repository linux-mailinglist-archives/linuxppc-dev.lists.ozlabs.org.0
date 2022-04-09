Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BB94FA7BF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 14:46:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbFGt1j2xz3bbp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 22:46:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Vwvh/UKD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbFGG0xcLz2xnF
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 22:45:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Vwvh/UKD; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KbFGC70JLz4xXS;
 Sat,  9 Apr 2022 22:45:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649508340;
 bh=dzSSI05vJdRsELqLVcyOWZYjZ1aa5BhxOpYnMRaD7sw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Vwvh/UKDZl/zxJK8ITlEY2gh1W8gFhv+/Ql0lAnG2Hq+6GtgCGM0SFN4v0/KayFoW
 Bobo1s+iAtJ916Z/aNDJsH86GM7vKuHi1CK+Su1ymzQP1Q40XGJF65XgTVnDBvtsKp
 CW5RTOsPkZOS9tgUnv14IWSoN9bpxC/q94tM8S86vdtt4spBPOCDNRdFaOYvGRTMxy
 SbMV82F8NoA4JjmZmobDYMUq0qRBbKBmGclZ52ApHZr2NvFhbsxNDbWzWQu/u8XdmZ
 V622UhqtAvsYFW0CdYwY7RygVCVZ2Rg7ZjmgD0DD2qiMWJHZHT2ZqTzNKc+ksf9kmD
 Ygun8PVjefMsA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH v9 0/4] mm: Enable conversion of powerpc to default
 topdown mmap layout
In-Reply-To: <8f1f194f-6b54-a382-b46e-5221cb82c80f@csgroup.eu>
References: <cover.1649401201.git.christophe.leroy@csgroup.eu>
 <20220408202516.254e22a8293a57324650bd3f@linux-foundation.org>
 <8f1f194f-6b54-a382-b46e-5221cb82c80f@csgroup.eu>
Date: Sat, 09 Apr 2022 22:45:35 +1000
Message-ID: <87h77277dc.fsf@mpe.ellerman.id.au>
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 09/04/2022 =C3=A0 05:25, Andrew Morton a =C3=A9crit=C2=A0:
>> On Fri,  8 Apr 2022 09:24:58 +0200 Christophe Leroy <christophe.leroy@cs=
group.eu> wrote:
>>=20
>>> Rebased on top of Linux 5.18-rc1
>>>
>>> This is the mm part of the series that converts powerpc to default
>>> topdown mmap layout, for merge into v5.18
>>=20
>> We're at 5.18-rc1.  The 5.18 merge window has closed and we're in
>> fixes-only mode.
>
> Umm ... There must have been a misunderstanding then.

That's probably my fault for not getting back to Andrew.

> Le 11/03/2022 =C3=A0 05:26, Michael Ellerman a =C3=A9crit :
>  >
>  > Yeah I didn't pick it up because the mm changes don't have many acks a=
nd
>  > I'm always nervous about carrying generic mm changes.
>  >
>  > It would be my preference if Andrew could take 2-5 through mm for v5.1=
8,
>  > but it is quite late, so I'm not sure how he will feel about that.
>  >
>  > Arguably 2, 3, 4 do very little. It's only patch 5 that has much effec=
t,
>  > and it has a reviewed-by from Catalin at least.
>
> Michael, is it now ok for you to merge it via powerpc tree with Andrew's=
=20
> Ack ?

Yes.

>> Also, [4/4] has a cc:stable.  This is a bit odd because -stable
>> candidates should be standalone patches, staged ahead of all
>> for-next-merge-window material, so we can get them merged up quickly.
>>=20
>> More oddly, [4/4]'s changelog provides no explanation for why the patch
>> should be considered for backporting.
=20
Yeah it's just a bit too politely worded :)

It says it's "a complement of f6795053dac8", but it's actually a fix for
a bug in that commit, that commit should have updated hugetlb behaviour.

> That was a request from Catalin from ARM64:
>
> Le 04/01/2022 =C3=A0 17:21, Catalin Marinas a =C3=A9crit :
>  > I wonder whether we should add a fixes tag (or at least the cc stable):
>  >
>  > Fixes: f6795053dac8 ("mm: mmap: Allow for "high" userspace addresses")
>  > Cc: <stable@vger.kernel.org> # 5.0.x
>  >
>  > I think the original commit should have changed
>  > hugetlb_get_unmapped_area() to have the same behaviour as
>  > arch_get_unmapped_area(). Steve, any thoughts?
>  >
>  > FWIW,
>  >
>  > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>
>  From=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/db238c1ca2d46e33c=
57328f8d450f2563e92f8c2.1639736449.git.christophe.leroy@csgroup.eu/
>
> I can try and see whether this can be moved in front of the other patches.

Thanks, that would be preferable.

cheers
