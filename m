Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422C352D2A9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 14:39:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3qDP1x2bz3bl6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 22:39:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ixEjEQjW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3qCm3h32z2yV6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 22:38:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ixEjEQjW; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L3qCk1prqz4xD8;
 Thu, 19 May 2022 22:38:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652963922;
 bh=0TLro0SA/18NlSBFMn34S0cBax5+uzY+PqBTBfpLaa8=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=ixEjEQjW69Mx2eWMN4fzDXSXawcYVEirqaPxB7v9sgT6QIHXCbcjAdsivobDJaLJK
 UMzbL6sTifdgbTHOOU6oKJVvTm0q04bc7PJM2wS/IWMAjcMjnIeXOZQpqLtYU92GFX
 SrXMtaKo/xULjAoQGw5uO6Is+G13WPNSOWVP3ID7nn3udbbjz6e8cpPnPBBE8JpuVL
 cpgiui4vGw9cjSf1tHpfU7DUQrV7bG4FZ+xAYAwqIdXpMH2pnwc/ij+5+YbHvh86Er
 OZQikVMlCJGVfunRptq97E9fGMR1sPk5PwxVo7qhrfZqYCvOBD3sPbStq7Nj55e1GY
 HLeMXjObQxQUw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Oliver O'Halloran
 <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/powernv/pci: Drop VF MPS fixup
In-Reply-To: <23fd8d03-965b-a252-020e-4185c2ef5681@csgroup.eu>
References: <20200902035159.1762596-1-oohall@gmail.com>
 <23fd8d03-965b-a252-020e-4185c2ef5681@csgroup.eu>
Date: Thu, 19 May 2022 22:38:40 +1000
Message-ID: <871qwpofxr.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 02/09/2020 =C3=A0 05:51, Oliver O'Halloran a =C3=A9crit=C2=A0:
>> The MPS field in the VF config space is marked as reserved in current
>> versions of the SR-IOV spec. In other words, this fixup doesn't do
>> anything.
>>=20
>> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
>
> A lot of cleanup patches from Oliver were merged in Septembre 2020 but=20
> not this one.
>
> Any reason ?

It wasn't clear to me that it's safe to remove. The commit that added it
seemed to think it was important.

The fact that it's out-of-spec doesn't mean we don't have some hardware
somewhere that relies on that.

cheers
