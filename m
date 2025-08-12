Return-Path: <linuxppc-dev+bounces-10861-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF49B227D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 15:10:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1X0r5t1bz3dRb;
	Tue, 12 Aug 2025 23:10:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755004204;
	cv=none; b=hCBh6O0Pm+3ARyWyDIewGe3hOT9R2wfWT+3eVzASRBskp614RTFPRd7pvQU+cc6kFey0bNjcKw2fe2vGrTSyToHNd0fvVT4BCfq+MLJ+eZPKzBVBFec6iiTdeDZ+UkDkmnJuY+dPKmnPntFIbgnvVBtyO5EROMXlfn7ZUHmQGPXmqOU5L82GdPbZP1r2uRXcdqS7PEd/u0BjokL6/XY/5EYvRgk9Qjrbeb6pUhcHqBrrsVChDscX+rY7yyppRkI+n7+ZzPz3nXR4vfaSwTEFp9jJ6ar+8LDbw2+e0yRkpVJ7ltKcDR6Ln31JIjsq8Dz0Laonsmxnl0eNI2TF2GbSVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755004204; c=relaxed/relaxed;
	bh=/cuxRnTF/+sbokXrks651YRr5s4tLHJAN7bhV7Yv7fM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=cYy71zHm7qk7NCBhLcuaFtza/Gn8INrlHP6OOeRr/WptqvDriI416Enxh1BVgEY294oNITZlWvdLO8zvtY+5YsCiR+DQHSfiQesELZZW/Nlb41fl3BWd50VtebdCUaRvnR/78hiJmscU4qZTKIFNvFivztj5VwHcg9bD7RhrIRmHXxxcP8XAReu53NwXorjxvG8H+1vs3VJXfcd0OOORiKe1xNDFaKL0YRybGl216TQcHd6wBbLXciXLJNw4S3jhLvVhyiE8qwMlztELGGAVeXhEeXQqIsNdY90DdR3SNbLdGbfWsPadJ6w4iipCSNpW/aMbJ9QUIg8rJJWhI+OZig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FI4H7F/C; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FI4H7F/C; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FI4H7F/C;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FI4H7F/C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1X0q4qqWz3dRY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 23:10:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755004195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/cuxRnTF/+sbokXrks651YRr5s4tLHJAN7bhV7Yv7fM=;
	b=FI4H7F/CAR29cyBJxMXRA3e9PZKQhk8cnaAppHl3K3h4SBk/XcveNqZEDyiquxjamRYhfj
	KjRh6ORF2idEVKd1clvTRchVg0p38lUyMAEsO4Fo70sZ56y5zIhy+jKGgP2aftQNLY5yKU
	rqMAtttX0q4YNbyzuQJ+edFAXOnJKhw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755004195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/cuxRnTF/+sbokXrks651YRr5s4tLHJAN7bhV7Yv7fM=;
	b=FI4H7F/CAR29cyBJxMXRA3e9PZKQhk8cnaAppHl3K3h4SBk/XcveNqZEDyiquxjamRYhfj
	KjRh6ORF2idEVKd1clvTRchVg0p38lUyMAEsO4Fo70sZ56y5zIhy+jKGgP2aftQNLY5yKU
	rqMAtttX0q4YNbyzuQJ+edFAXOnJKhw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-524-SArAZdPZOtigwjx2dT9jhA-1; Tue,
 12 Aug 2025 09:09:49 -0400
X-MC-Unique: SArAZdPZOtigwjx2dT9jhA-1
X-Mimecast-MFC-AGG-ID: SArAZdPZOtigwjx2dT9jhA_1755004186
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 87D20180036F;
	Tue, 12 Aug 2025 13:09:45 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.156])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7BEA8195608F;
	Tue, 12 Aug 2025 13:09:36 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: snovitoll@gmail.com,
	ryabinin.a.a@gmail.com,
	christophe.leroy@csgroup.eu,
	hca@linux.ibm.com,
	andreyknvl@gmail.com,
	akpm@linux-foundation.org,
	chenhuacai@loongson.cn,
	davidgow@google.com,
	glider@google.com,
	dvyukov@google.com,
	alexghiti@rivosinc.com,
	kasan-dev@googlegroups.com,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	agordeev@linux.ibm.com,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 0/4] mm/kasan: remove kasan_arch_is_ready()
Date: Tue, 12 Aug 2025 21:09:29 +0800
Message-ID: <20250812130933.71593-1-bhe@redhat.com>
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
Precedence: list
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

These are made on top of below patchset in which all functional functions
will be skipped if kasan is disabled by checking kasan_enabled(). With
the changes, kasan_arch_is_ready() can be easily cleaned up to simplify
code.

[PATCH v2 00/12] mm/kasan: make kasan=on|off work for all three modes
https://lore.kernel.org/all/20250812124941.69508-1-bhe@redhat.com/T/#u

The 1st three patches are from Sabyrzhan Tasbolatov's patchset. After
clean up the kasan_arch_is_ready() definition in loongarch, power and UM, 
we can simply remove kasan_arch_is_ready() checking in mm/kasan since
all the checking has been covered by kasan_enabled().

[PATCH v6 0/2] kasan: unify kasan_enabled() and remove arch-specific implementations
https://lore.kernel.org/all/20250810125746.1105476-1-snovitoll@gmail.com/T/#u

Test:
======
I have tested the effect of this patchset on loongarch, power and UM.
Will try to find machine to do testing.

Baoquan He (1):
  mm/kasan: remove kasan_arch_is_ready()

Sabyrzhan Tasbolatov (3):
  arch/loongarch: remove kasan_arch_is_ready()
  arch/powerpc: remove kasan_arch_is_ready()
  arch/um: remove kasan_arch_is_ready()

 arch/loongarch/include/asm/kasan.h     |  7 -------
 arch/loongarch/mm/kasan_init.c         | 10 +++-------
 arch/powerpc/include/asm/kasan.h       | 13 -------------
 arch/powerpc/mm/kasan/init_book3s_64.c |  4 ----
 arch/um/include/asm/kasan.h            |  5 ++---
 arch/um/kernel/mem.c                   |  6 +++++-
 mm/kasan/common.c                      |  9 +++------
 mm/kasan/generic.c                     |  9 ---------
 mm/kasan/kasan.h                       |  6 ------
 mm/kasan/shadow.c                      | 18 ------------------
 10 files changed, 13 insertions(+), 74 deletions(-)

-- 
2.41.0


