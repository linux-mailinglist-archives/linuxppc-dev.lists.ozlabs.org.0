Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FD93D8E18
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 14:44:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZYJ64S9kz3bXP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 22:44:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UQ/8qIYa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UQ/8qIYa; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZYHf4Vlwz308L
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 22:43:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GZYHZ1ybVz9sSs;
 Wed, 28 Jul 2021 22:43:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1627476219;
 bh=Ua9l0fbwYf9DXxQijm/D7Oz8UlSCL9oNqn7tF7luSvs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=UQ/8qIYaJRScflx9AwVVfU8McpeRUkUYefqiEfaOVkRXs/DxN86r+qHS+ZTAjrn1D
 lF7JC95nT+52+/MF0/mRtVAwfDY0dzHfTq1ignDIu/4vW+BMSqjBUhlVojjtuDc/DL
 hwdeIQKdlPyRjwuXKGhfLtMpibnFjTF3k3B3hsyqwhvm6e0ZS8Qqvy65eZhR7Si7ln
 NkSd1NITOy6wBYJy7EHTVwFenb+JvprNMuqPQ+svLhxIwsGG4vH6kPNPOn1lK3OhYg
 Pi1AfR1tzasUVFm7Kg3A9FcnwgCfm2cTC4Z0uMwCM4R7GZ5+fcT8h9Kza/UTTrIY6Y
 31aMlFhFzs40w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Menzel <pmenzel@molgen.mpg.de>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Christophe
 Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Possible regression by ab037dd87a2f (powerpc/vdso: Switch VDSO
 to generic C implementation.)
In-Reply-To: <4f037af0-5066-ebb9-53a6-733b3bd8eeac@molgen.mpg.de>
References: <a273c619-9258-e29a-24c3-ea47a13c4817@molgen.mpg.de>
 <3661999754da1a5e5c810fa669654cc7db95b059.camel@kernel.crashing.org>
 <4f037af0-5066-ebb9-53a6-733b3bd8eeac@molgen.mpg.de>
Date: Wed, 28 Jul 2021 22:43:36 +1000
Message-ID: <878s1q1udj.fsf@mpe.ellerman.id.au>
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
Cc: Derek Parker <parkerderek86@gmail.com>, Dmitrii Okunev <xaionaro@gmail.com>,
 murp@ibm.com, linuxppc-dev@lists.ozlabs.org, laboger@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paul Menzel <pmenzel@molgen.mpg.de> writes:
> Am 28.07.21 um 01:14 schrieb Benjamin Herrenschmidt:
>> On Tue, 2021-07-27 at 10:45 +0200, Paul Menzel wrote:
>
>>> On ppc64le Go 1.16.2 from Ubuntu 21.04 terminates with a segmentation
>>> fault [1], and it might be related to *[release-branch.go1.16] runtime:
>>> fix crash during VDSO calls on PowerPC* [2], conjecturing that commit
>>> ab037dd87a2f (powerpc/vdso: Switch VDSO to generic C implementation.)
>>> added in Linux 5.11 causes this.
>>>
>>> If this is indeed the case, this would be a regression in userspace. Is
>>> there a generic fix or should the change be reverted?
>>=20
>> From the look at the links you posted, this appears to be completely
>> broken assumptions by Go that some registers don't change while calling
>> what essentially are external library functions *while inside those
>> functions* (ie in this case from a signal handler).
>>=20
>> I suppose it would be possible to build the VDSO with gcc arguments to
>> make it not use r30, but that's just gross...
>
> Thank you for looking into this. No idea, if it falls under Linux=E2=80=
=99 no=20
> regression policy or not.

Reluctantly yes, I think it does. Though it would have been good if it
had been reported to us sooner.

It looks like that Go fix is only committed to master, and neither of
the latest Go 1.16 or 1.15 releases contain the fix? ie. there's no way
for a user to get a working version of Go other than building master?

I'll see if we can work around it in the kernel. Are you able to test a
kernel patch if I send you one?

cheers
