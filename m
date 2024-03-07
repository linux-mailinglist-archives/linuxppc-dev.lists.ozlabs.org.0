Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABAF874F20
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 13:32:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lBx1+QuJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tr7xJ1BVkz3vYc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 23:32:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lBx1+QuJ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tr7wc5Blpz3btQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 23:32:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709814736;
	bh=CnKV7YkmwKVN45OVgq9HMp191oP0lkB4cDHb6peK+T4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lBx1+QuJTEVHApTpCCDU+EV1Aykxe0USdn1M5qeFxUu86nOmkjduBDq8dT3o7qXpm
	 oS8/qBbiILsQJC5KQx/qJRP/+1Rtwj+Mvna+PmMaQHKiOOUzj3K4BfsAnCXpYBeO5i
	 sIHi1sZKR2G1jRkcILr1PE7EJZw85kHZ0/HyQZD5Je+4MUjufb3f6fIkyubjPbz8re
	 /xYRYrDhHsNlHZi8hwJ5D8xkg2qXwM8ii3IePd37e1Jh7QAPge7a0+jwCSZNdI+ZOe
	 Y4f3knEgXbFr14hWz3pvmzLU64Pzxk2jZ5fbpD4Fd7BcqwRmHFTOSol/RnqeVlE3F0
	 mpc6I8Pch7Hkg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tr7wZ6z4Xz4wc8;
	Thu,  7 Mar 2024 23:32:14 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Dawei Li <set_pte_at@outlook.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3] powerpc: macio: Make remove callback of macio driver
 void returned
In-Reply-To: <TYTP286MB356472357994D5EA49E2F5E3CA212@TYTP286MB3564.JPNP286.PROD.OUTLOOK.COM>
References: <TYCP286MB232391520CB471E7C8D6EA84CAD19@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
 <3dc29701-239f-4a3b-b571-b9732975bd73@csgroup.eu>
 <TYTP286MB356472357994D5EA49E2F5E3CA212@TYTP286MB3564.JPNP286.PROD.OUTLOOK.COM>
Date: Thu, 07 Mar 2024 23:32:14 +1100
Message-ID: <87bk7qnrxt.fsf@mail.lhotse>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dawei Li <set_pte_at@outlook.com> writes:
> Hi Christophe,
>
> On Tue, Feb 20, 2024 at 04:12:17PM +0000, Christophe Leroy wrote:
>> Hi Michael,
>>=20
>> ping ?
>>=20
>> Le 01/02/2023 =C3=A0 15:36, Dawei Li a =C3=A9crit=C2=A0:
>> > Commit fc7a6209d571 ("bus: Make remove callback return void") forces
>> > bus_type::remove be void-returned, it doesn't make much sense for any
>> > bus based driver implementing remove callbalk to return non-void to
>> > its caller.
>> >=20
>> > This change is for macio bus based drivers.
>> >=20
>> > Signed-off-by: Dawei Li <set_pte_at@outlook.com>
>>=20
>> This patch is Acked , any special reason for not applying it ?
>>=20
>> Note that it now conflicts with commit 1535d5962d79 ("wifi: remove=20
>> orphaned orinoco driver") but resolution is trivial, just drop the=20
>> changes to that file.
>
> Thanks for picking it up, hardly believe that it's been one year.
>
> Michael,
>
> I will respin V4 if it's needed.

No that's fine, I'll sort it out.

cheers
