Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9D380B83A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Dec 2023 01:30:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SI5E4Xnr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Snm4733p5z3cTF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Dec 2023 11:30:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SI5E4Xnr;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Snm3H1fshz30h0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Dec 2023 11:29:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1702168166;
	bh=JSsA0xeMBTfbUG5iyWB2yjJpJSqD6ERcemGdGQRU9xs=;
	h=From:To:Cc:Subject:Date:From;
	b=SI5E4XnriUeSgKGPopMp2U47vFshZT1/PlPsCoBQ5IhZZTiVugPenPVu98w7+vAZb
	 EuSw2cRjA0mLTBDIr7hRoDl1+ltIDsWC52iN3e/8b7qjvtXKrVJd9KZfnu7Hm8T4NK
	 pazCl9i10yG18eLat1tgUvwWF4kWxcLdoYpmoTUwSa5EWaZCj4x0Jbzm7SBA0P8AX3
	 Is++hmbtc4polTkbS0Iq1X0awtk2ZNcet4y1PkjoVeiyKy1u3GHPIyFhhwzl02xz3K
	 IyrCIXbqvGX/Gch+shgQOv7HZzrkr8LEUf41ANfDrVJCklZuI92x84iONsLEG4ZMso
	 xADK7W/KzDnZw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Snm3B1YQxz4xCg;
	Sun, 10 Dec 2023 11:29:26 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.7-4 tag
Date: Sun, 10 Dec 2023 11:29:22 +1100
Message-ID: <87sf4aew7x.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, naveen@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.7:

The following changes since commit dc158d23b33df9033bcc8e7117e8591dd2f9d125:

  KVM: PPC: Book3S HV: Fix KVM_RUN clobbering FP/VEC user registers (2023-11-29 22:24:21 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.7-4

for you to fetch changes up to 4b3338aaa74d7d4ec5b6734dc298f0db94ec83d2:

  powerpc/ftrace: Fix stack teardown in ftrace_no_trace (2023-12-05 14:14:12 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.7 #4

 - Fix stack teardown in ftrace_no_trace, seen as crashes doing CPU hotplug
   while ftrace is active.

Thanks to: Naveen N Rao

- ------------------------------------------------------------------
Naveen N Rao (1):
      powerpc/ftrace: Fix stack teardown in ftrace_no_trace


 arch/powerpc/kernel/trace/ftrace_entry.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmV1BNYACgkQUevqPMjh
pYAI2RAAhz0DW42CARKjsiQ/iyDVphkYwuXMMlX6DCSFPBPFZMPkI+wPzwbQDASg
ZW9p3NfxGa68szbKKSqK7RSYjHUAVlff8S4QyqNlnJzEwmErz6dhKa27vgGmE+k/
bgMTJO5qKFIt2WQ/xdvHlFUCzVxa7exxhLvR1fGkYnpENSgZrroq7pI0SuM92pnK
UDpoUeadXNKtwrP4yowdYTrGd0ciMdV2lQDXjG25Z9neW3eX4cT/D6FZLckS61wt
8eVmOlhoElmgLNnz7tsUCrfM02z3/nsU/dRx/jGYMIzlSIc7CNDSC6vVlIjGqoHu
4a/jhTL7OHQcamGo38GsmWenetqvJe+IJj6y5wcykA8z9Y231sUAdbAKbzw73t2k
Gb6wys82twpf8YbakGdzR0rM3aT5oE52ZRsMcoXDWFK7Q12H/euh/h32TmLISknK
tbsIROx/fLB8j8b+6R7Y1+7Kh5bvhckyoJqqjkGzUZMSI8QufEGOwfAnHJhD058x
HYSFJmqioCtwOk5gTe0HRQzTsHU8xQfN+HiLlOO4e7NhJAP3LBGVcx9e4Gbr9j/1
emq4hjB7cO1kBJdjpM0sQt2M2dgAuNzcUimkLqewy/swcR9KQV2NyjnU+teAJK0+
FEqMVVnGd24PdMTjr9fAzC6p0995vxFgWYzXJlwDVPY22AyAjfE=
=VOa0
-----END PGP SIGNATURE-----
