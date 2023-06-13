Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AE472E4C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 16:00:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eKpzzlWj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgVZ61vl8z30KG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 00:00:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eKpzzlWj;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgVY43bT6z30KG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 23:59:36 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QgVXz3ttHz4x4K;
	Tue, 13 Jun 2023 23:59:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1686664771;
	bh=qeOcEDnDN945pMMvmrh1wNRFwjAqyAaIZMYoZ0m5sjw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eKpzzlWjiugEtwtDdCn/aKpfRi/PI3eXqv+JJk26mUUbEBpVDC4DEc7F6CKWec45M
	 xJJlIecHH4m3MZM0aQbNuSvOmPWUod2vHg4bGw02jKCADLy68T2CTm54lY/Qeb6nig
	 1wFMndaP7a+m9OG4rwoF0CEmrzRemIq+VYrgs1sOXjrH6Hr4qXvNAFJRjDbexNd84y
	 9eQJBWB0QaTbdpgexg3A5pK5/skVtNMrvVO56SGwtvlVe6zWg4eUtpcvtsIpBoo9gq
	 GsPQHauw5LkzUud2K0i9r0jPXTtYN7ZLzccR5YWRlK/w3DnVBUm//GcoK3GKbdawJo
	 7hlwbrUlWVAXQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/4] powerpc/64s: Use POWER10 stsync barrier for wmb()
In-Reply-To: <20230609100026.8946-4-npiggin@gmail.com>
References: <20230609100026.8946-1-npiggin@gmail.com>
 <20230609100026.8946-4-npiggin@gmail.com>
Date: Tue, 13 Jun 2023 23:59:31 +1000
Message-ID: <87wn07foos.fsf@mail.lhotse>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> The most expensive ordering for hwsync to provide is the store-load
> barrier, because all prior stores have to be drained to the caches
> before subsequent instructions can complete.
>
> stsync just orders stores which means it can just be a barrer that
> goes down the store queue and orders draining, and does not prevent
> completion of subsequent instructions. So it should be faster than
> hwsync.
>
> Use stsync for wmb(). Older processors that don't recognise the SC
> field should treat this as hwsync.

qemu (7.1) emulating ppc64e does not :/

  mpic: Setting up MPIC " OpenPIC  " version 1.2 at fe0040000, max 1 CPUs
  mpic: ISU size: 256, shift: 8, mask: ff
  mpic: Initializing for 256 sources
  Oops: Exception in kernel mode, sig: 4 [#1]

No more output.

(qemu) info registers                                                      =
                                          =E2=94=82
NIP c000000000df4264   LR c0000000000ce49c CTR 0000000000000000 XER 0000000=
020000000 CPU#0                           =E2=94=82
MSR 0000000080001000 HID0 0000000000000000  HF 24020006 iidx 1 didx 1      =
                                          =E2=94=82
...
 SRR0 c0000000000ce7c4  SRR1 0000000080081000    PVR 0000000080240020 VRSAV=
E 0000000000000000

$ objdump -d vmlinux | grep c0000000000ce7c4
c0000000000ce7c4:       7c 03 04 ac     stsync


That's qemu -M ppce500 -cpu e5500 or e6500.

I guess just put it behind an #ifdef 64S.

cheers
