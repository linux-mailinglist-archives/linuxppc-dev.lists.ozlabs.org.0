Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E741ECD23
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 12:05:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cPgK1txBzDqV6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 20:05:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cPcs01V1zDqV6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 20:03:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KoA2pXZI; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49cPcq6WP6z9sTK;
 Wed,  3 Jun 2020 20:03:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591178620;
 bh=+tIstlXPrES0K82dOfQBGtH8J5rOTemXGe1SApntEBM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KoA2pXZIjGpMNpYW0K1cDO5TC6I4mRAn4yiN9onrDEluLyh+SdZxjTxdeFHOnxC1r
 3khNJd3oguW2gkFGU9+sZRhgJcCQgOZuC0fkd7mW5wnmfzlKWIibrak0a2RaK1a2LN
 D2extDCJQZY77r1BLtM7VTDvjCT+HAthHBg4qzSBfP2lx57Mcqgg5L1oKZOw89c4WG
 77Sq5FfLAQvyUoSyyenHYF7ocujUdq0FXmka/P0zTqcklUhajrm60ExP/zYuIC8kVL
 9nPgGMkgbNGa1O2rUMOAW17MP/z8zKBO1yjH1CT5CmBuAKOa4myeX2qp17PvgEs3mq
 nR7Af5BwxCyow==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, nathanl@linux.ibm.com
Subject: Re: [PATCH v8 0/8] powerpc: switch VDSO to C implementation
In-Reply-To: <438ce3d7-aa0f-0284-7518-6c6339742aab@csgroup.eu>
References: <cover.1588079622.git.christophe.leroy@c-s.fr>
 <438ce3d7-aa0f-0284-7518-6c6339742aab@csgroup.eu>
Date: Wed, 03 Jun 2020 20:04:02 +1000
Message-ID: <87zh9kh3e5.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Hi Michael,
>
> Le 28/04/2020 =C3=A0 15:16, Christophe Leroy a =C3=A9crit=C2=A0:
>> This is the seventh version of a series to switch powerpc VDSO to
>> generic C implementation.
>>=20
>> Main changes since v7 are:
>> - Added gettime64 on PPC32
>>=20
>> This series applies on today's powerpc/merge branch.
>>=20
>> See the last patches for details on changes and performance.
>
> Do you have any plans for this series ?

Review it and merge it one day :/

> Even if you don't feel like merging it this cycle, I think patches 1 to=20
> 3 are worth it.

I'd rather take the whole series for v5.9.

Sorry it missed this window, I just didn't get time to look at it.

cheers
