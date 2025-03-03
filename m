Return-Path: <linuxppc-dev+bounces-6618-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E22A4BD92
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 12:11:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5x2S46M7z2xdR;
	Mon,  3 Mar 2025 22:11:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741000272;
	cv=none; b=SgJLS0/jne6iQTQ7xYBsxA7pMLfFDTKnKDQ6xUzFktya8cHQyEmvG4b8a4kaRhxFQ4OlpOnIwmJxQkkvKrfULgRxUMfk4JeVRXrmU8Jo7d7M+wIM/dOBNAFNa8o4Zzlf3cp9ySBLCuDu4ZGDzzQwNFJkpCaT9ucvBMaKcAmpnCNjOeH3KMq2JOc1bk7GlE5mzDstRoNJxU8Oa3YBd7aoWFrFNOlK5TjZMwI+aQt+igwcs9AvTRt9r4DmWAJRiWvkWFzu0kiGuQRCLhACnaKj4uFDImwelG3mctobGaZdYcZ/Esu+huuKpXDaaYjlIblwpi8cPYVU5X3X2CwAASQn9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741000272; c=relaxed/relaxed;
	bh=IQ622J09wSnJWNXssDApHCSJm6KRM8/tA7lFNZ5FTck=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DPMbSlbTIGWDCFgnHb3tJCAIcmNr0H11oOjfN4fP/MkVkLHsdEjA1aRx/Ajuae004k1gAqd0pMZ5yXpxAGe6/jWQTr215PihsNSHyveD6BPCpfroHP0jUgNxHJDVkY8nW6NxPGLZCgVvUhTmbNZdIRZRsP3upclrECC1DjLAy9LQm57U3cWdnDEAmhHOjtnYMGpA562VJup9FsfVoTZ5IKONtVVR7PZFEH/riVaQfs3UImCw/zMqEco4/f7rsWApFci9EWejS/Zk50MYBsoig9iwxxcUOaU77mpDicoWxaSS/Lb7H9zMC63owdZqmfca4XfhKbGp82LfjUNC3GZDKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wLmUqqTw; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FEFBlftn; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wLmUqqTw;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FEFBlftn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Z5x2R2mhDz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 22:11:11 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IQ622J09wSnJWNXssDApHCSJm6KRM8/tA7lFNZ5FTck=;
	b=wLmUqqTwTEyy8MN+fvUkhrzIqy6uOM6lVHR4jNdAeed/O8S0iqujK3aI4lGi+I3tqudxPw
	s2kIvGZ/MXyYVsQ2TqmdwnG18vmfKYSXzOhf5Aw9fndCMClBY7UvTjVWEXtE3xS5f7RqVn
	PQf7QcpBStHo1rBnCeWDhILSYYwI7qMGPTS0RviAt1Oy2cNEs180RPDVdtyda8W1ns7Iy9
	F6Vnmc2BDvBIXsbn8MLerHwdRVwBXudM4h3rwx+UXEWi/LSPZEzXXnHpFdlZzAcnAwiUAP
	5Lj2VkmHFVjYjg3fvs/gqFY0Ct2mskGOlUZKpYaitXChC2S6wwZYvOmvbnkzNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IQ622J09wSnJWNXssDApHCSJm6KRM8/tA7lFNZ5FTck=;
	b=FEFBlftntzm1vKKKD24mat2WNu3kCRIaYgAe0BZIAp5Y/dJrf3bIDUHH00UOGa0SCDwvKB
	I30YLz81uY0Z1kDA==
Subject: [PATCH 00/19] vdso: Rework struct vdso_time_data and introduce
 struct vdso_clock
Date: Mon, 03 Mar 2025 12:11:02 +0100
Message-Id: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEaOxWcC/03M0QrCIBTG8VcZ5zpDZdrWVe8Ru1h6bIeGhi5ZD
 N89GwRd/j/4fhskjIQJzs0GETMlCr6GODRgptHfkZGtDZJLxaVsWbYpMDMH82BOcMfFybS3jkM
 9PCM6WnfsOtSeKC0hvnc7i+/6Y9Q/kwXjrNMC+1GrUffqMpN/LTF4Wo8WYSilfAAsE0v1qAAAA
 A==
X-Change-ID: 20250224-vdso-clock-f10f017c4b80
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=2911;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JRTZEJBPOrhvUumVmufXGEQ++pbOss4FsXl+ME7xP/I=;
 b=1QrxVPPkzlKNesg8VwMiDXqZyZeYfZHfZ0peP4IrutVSqOiCMC4+/wyQO3rgzJ5xf+SxSKr84
 +t7EqeEhu9OAio50sRM6KyHRpohlV/LcxVaombILHk3/QzfOiPs5F4E
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

To support multiple PTP clocks, the VDSO data structure needs to be
reworked. All clock specific data will end up in struct vdso_clock and in
struct vdso_time_data there will be an array of it.

This series is based on and intended to be merged through tip/timers/vdso.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Anna-Maria Behnsen (15):
      vdso: Make vdso_time_data cacheline aligned
      vdso/datapage: Define for vdso_data to make rework of vdso possible
      vdso/helpers: Prepare introduction of struct vdso_clock
      vdso/gettimeofday: Prepare introduction of struct vdso_clock
      vdso/gettimeofday: Prepare do_hres() for introduction of struct vdso_clock
      vdso/gettimeofday: Prepare do_hres_timens() for introduction of struct vdso_clock
      vdso/gettimeofday: Prepare do_coarse() for introduction of struct vdso_clock
      vdso/gettimeofday: Prepare do_coarse_timens() for introduction of struct vdso_clock
      vdso/gettimeofday: Prepare helper functions for introduction of struct vdso_clock
      vdso/vsyscall: Prepare introduction of struct vdso_clock
      vdso/namespace: Rename timens_setup_vdso_data() to reflect new vdso_clock struct
      time/namespace: Prepare introduction of struct vdso_clock
      x86/vdso: Prepare introduction of struct vdso_clock
      vdso: Move arch related data before basetime
      vdso: Rework struct vdso_time_data and introduce struct vdso_clock

Nam Cao (2):
      arm64/vdso: Prepare introduction of struct vdso_clock
      powerpc/vdso: Prepare introduction of struct vdso_clock

Thomas Weißschuh (2):
      vdso: Introduce vdso/cache.h
      arm64: Make asm/cache.h compatible with vDSO

 arch/arm64/include/asm/cache.h                    |   4 +-
 arch/arm64/include/asm/vdso/compat_gettimeofday.h |   6 +-
 arch/arm64/include/asm/vdso/vsyscall.h            |   4 +-
 arch/powerpc/include/asm/vdso/gettimeofday.h      |   2 +-
 arch/s390/kernel/time.c                           |  11 +-
 arch/x86/include/asm/vdso/gettimeofday.h          |  16 +--
 include/asm-generic/vdso/vsyscall.h               |   2 +-
 include/linux/cache.h                             |   9 +-
 include/vdso/cache.h                              |  15 +++
 include/vdso/datapage.h                           |  48 ++++---
 include/vdso/helpers.h                            |  20 +--
 kernel/time/namespace.c                           |  20 +--
 kernel/time/vsyscall.c                            |  47 +++----
 lib/vdso/datastore.c                              |   6 +-
 lib/vdso/gettimeofday.c                           | 146 ++++++++++++----------
 15 files changed, 196 insertions(+), 160 deletions(-)
---
base-commit: ac1a42f4e4e296b5ba5fdb39444f65d6e5196240
change-id: 20250224-vdso-clock-f10f017c4b80

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


