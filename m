Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 013BD42B11A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 02:49:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTYnP4ktmz2yfn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 11:48:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fGfVx6FR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTYml47Dbz2xfJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 11:48:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fGfVx6FR; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HTYmh52HYz4xbG;
 Wed, 13 Oct 2021 11:48:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1634086101;
 bh=0MAC1u3ATdxVjyD5EZoT+QRVzUt/R1FkYBNmkt5DGd0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fGfVx6FRe6q9AL6bIxKEFSRpZA6dRKPC8cL7lvPyM5n4SayPEXkfOTraMGb3foyPm
 NqyiEKc5l2dhffhCj6L6Qln2ZmtYOwy1VMgh13Ad7aIebskCayASa1PkTQTOi3Ntb6
 epHqWjUnZz4YiqaayoW1b09Z02R+zJLGXSwCqSZSemhF18x2ScJX1CuLUqkUp4O5ye
 epcyAZVKVHkB/K/mxqG1qhKOwui2+fGhbEpzy8MdzvEus6D7IljelO/YILBv4veWog
 kOcoKLikSTAyYKW9R1MdVXh8dHRmyTlsWdcR4Gu6QRCuPM5kIdZMTAIeZZD+sZStNu
 DIWRiTBoTLPoA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Liu Shixin
 <liushixin2@huawei.com>, Marco Elver <elver@google.com>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc: don't select KFENCE on platform PPC_FSL_BOOK3E
In-Reply-To: <9c1ee778-b38b-3d41-37f3-5ea22dca063b@csgroup.eu>
References: <20210924063927.1341241-1-liushixin2@huawei.com>
 <77ce95e4-1af1-6536-5f0c-a573c648801a@huawei.com>
 <87bl3u7oay.fsf@mpe.ellerman.id.au>
 <9c1ee778-b38b-3d41-37f3-5ea22dca063b@csgroup.eu>
Date: Wed, 13 Oct 2021 11:48:20 +1100
Message-ID: <8735p57nsb.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 12/10/2021 =C3=A0 08:24, Michael Ellerman a =C3=A9crit=C2=A0:
>> Liu Shixin <liushixin2@huawei.com> writes:
>>> kindly ping.
>>=20
>> I was under the impression you were trying to debug why it wasn't
>> working with Christophe.
>
> The investigation was a bit dormant to be honest since Liu confirmed=20
> that neither KFENCE not DEBUG_PAGEALLOC works.

No worries. Sorry it fell to you to do the investigation.

> I now looked at the effort to make it work, and it is not trivial.
> At the time being, all linear space is mapped with pinned TLBs and=20
> everything is setup for space 0, with space 1 being used temporarily=20
> when doing heavy changes to space 0.
>
> We can't use standard pages for linear space on space 0 because we need=20
> memory mapped at all time for exceptions (on booke exception run with=20
> MMU on in space 0).
>
> In order to use standard pages, we'd need to reorganise the kernel to=20
> have it run mostly in space 1 (for data at least) where we would map=20
> almost everything with standard pages, and keep pinned TLB to map linear=
=20
> space on space 0 for TLB miss exceptions. Then we'd do more or less like=
=20
> book3s/32 and switch back into space 1 into other exceptions prolog.
>
> That could be good to do it as we could maybe have more code in common=20
> with non booke 32 bits, but it is not a trivial job.
>
> So I suggest that for now, we just make KFENCE and DEBUG_PAGEALLOC=20
> unselectable for booke/32 (e500 and 44x).

Yep seems reasonable.

cheers
