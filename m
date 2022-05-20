Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F307752E9FD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 12:34:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4NPt5b1Zz3bsr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 20:34:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PsUQDWCl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4NPF5tVkz30DC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 20:33:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PsUQDWCl; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L4NPB05njz4xD8;
 Fri, 20 May 2022 20:33:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1653042830;
 bh=gh5EUZjLTVaelfDSvEhX92oWmuLejU9toBbSR9P8qD8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PsUQDWClI4L2G0cuBoB08pdGBKw7c/vqO+/K74WPdqFDNdtvjLF0hIvDrKvcsqtil
 MeCuMOOsYHyjre7owcj2S9NBvLAEjPWFRroa1VhfBsoHK1p4u2OTrqDdTtoff8wzvD
 gDOAuq6hHf1cIEvj6Lqr9gePfBJQaatg/HPF6JTu6UqAkjfIdU2IoJKM2GCklTeYDL
 8ZrTy2xZ+mmNSbw1I09y14hRZv8Xj6KFx9hafceXg+4bGmAzN/nz5vwqS3CvnyHWXJ
 yzH3YMNUJq266BF/BW/LxZ8vjGdphsXgOUX4WJpLamUx8gd6pnEVUt1xFu/3Ipn5VZ
 mLAM+Y19vTrnA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH] powerpc/powernv/pci: Drop VF MPS fixup
In-Reply-To: <CAOSf1CEwbpryhv3q4ab9zQVRhu2_GrBe1e8ECELvKYHAxuc97g@mail.gmail.com>
References: <20200902035159.1762596-1-oohall@gmail.com>
 <23fd8d03-965b-a252-020e-4185c2ef5681@csgroup.eu>
 <871qwpofxr.fsf@mpe.ellerman.id.au>
 <CAOSf1CEwbpryhv3q4ab9zQVRhu2_GrBe1e8ECELvKYHAxuc97g@mail.gmail.com>
Date: Fri, 20 May 2022 20:33:45 +1000
Message-ID: <87tu9kmr1y.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Oliver O'Halloran" <oohall@gmail.com> writes:
> On Thu, May 19, 2022 at 10:38 PM Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> > Le 02/09/2020 =C3=A0 05:51, Oliver O'Halloran a =C3=A9crit :
>> >> The MPS field in the VF config space is marked as reserved in current
>> >> versions of the SR-IOV spec. In other words, this fixup doesn't do
>> >> anything.
>> >>
>> >> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
>> >
>> > A lot of cleanup patches from Oliver were merged in Septembre 2020 but
>> > not this one.
>> >
>> > Any reason ?
>>
>> It wasn't clear to me that it's safe to remove. The commit that added it
>> seemed to think it was important.
>>
>> The fact that it's out-of-spec doesn't mean we don't have some hardware
>> somewhere that relies on that.
>
> There is no hardware that depends on it. It was added in response to a
> bug report on the IBM internal bugzilla about virtual functions not
> reporting the same MPS as the physical function in the output of
> lspci. This is by design since MPS is a property that is only relevant
> to the PF. There was a corresponding patch to skiboot to intercept
> writes to the MPS field of VFs which was used to fake a writable MPS
> field in firmware. I removed that hack in 2019
> (https://github.com/open-power/skiboot/commit/22057f868f3b2b1fd02647a738f=
6da0858b5eb6c)
> since it was pointless and was causing other problems. There's no real
> reason to keep this code around IMO.

Thanks for the extra detail, I am persuaded :)

cheers
