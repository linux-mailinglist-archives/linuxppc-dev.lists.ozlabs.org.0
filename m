Return-Path: <linuxppc-dev+bounces-17152-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAjmB4KvnmlxWwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17152-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 09:14:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D542193FB7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 09:14:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLS7K2mkMz3dRs;
	Wed, 25 Feb 2026 19:14:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772007293;
	cv=none; b=mU0AVt4Xbvqz68z3AkwpUe+rMGIHhuxjmyX5fPHXjDWxUdpMP4bomErwkg+LAndkqIVhXj3gWkyvvI4dBMyHp/glxSFCtPy4mAA/whS4MrhxDW8z1BSrcWYGMN3B+8VWptnmDgu+9te7Yjl2Z3Dan3FcMdRW8jBRHmyRhucuMNbuyqxKvbToXdoWyIuNmKbjnX2oAL/FfoyrwrpN2HxJfD+XUNEqp+PThgXgvym94lvu/z/pnE46xPStBFxmF2/Ka5t2wAFQVdftk/mjll035ioF8SPJM5j/kPzu8upuFaCk9zDj4QiPN0q7IKHOgtofe5LRcXyvG2Xo5CV2NTY0VA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772007293; c=relaxed/relaxed;
	bh=re7E4sxplbVcSJsRUE0dixF3rx550iAmXm+wmG0q1R4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=BtViqfTaObj9F7FTmP2bfaMPbG9kQE5cHJbo2yPAwtPnuErRiTpHCqTAykPuBAYf9DYsHIMe3TGocO5gWsMGU4e0MlE1gVcILe2ak8srui1tnlqPD1DF2n+UxOY2lFpyLNaLtywHh7PRlru3ZyLfhBEEcQSi1xQboBjpshCQICebcPGxdgylgUDpAu/MMAq5O3F4uusCS30+iADfuu9JyzNyysOCDiUAIw0juYTB2nnj2DXBCF1EBLHIB2GyOIMJp9DoB7QcxWSnsV4ekHU2PVCqlzkI/7mldui5mzGF8HY7vkeDYJN6uYINRMGKKrPtQdXCCLjL/q73+UqxZy4Fog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A5QC44Tg; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dhQZ4RdD; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A5QC44Tg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dhQZ4RdD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLS7H431nz3cJN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 19:14:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=re7E4sxplbVcSJsRUE0dixF3rx550iAmXm+wmG0q1R4=;
	b=A5QC44TgvZ84nuJ8Balk6+xYd5gq7uh5bNZYYn3fc3tm3MnAM8hOuZF2yFqcmY4nQCGYwr
	XfOJ1YVqnAEM4SnRbw7HkrixstUVghEx5jQVqArn88HC4AVg6E5pjskIBjJrVMdFZ4orb6
	VaGCzVrCcb9Plv7hLfyyF46l+5V1W00=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=re7E4sxplbVcSJsRUE0dixF3rx550iAmXm+wmG0q1R4=;
	b=dhQZ4RdDUc6e1qsuKt54TZpu1jE4moLNsQfud47fyX2Lo9bozgP5BHfxZgbdkc+jS69GLM
	hblNNd2led9KlqjYuNXdBectVeh216gxgHEJRM1HWEGuZLP5UgjQc658bLNdbXHNjyEn47
	UsEyB8LCOHcRXfYT5WmIWkZAnKCjOKQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-497-8STCbgGpNdSEQd8WeY9I3A-1; Wed,
 25 Feb 2026 03:14:40 -0500
X-MC-Unique: 8STCbgGpNdSEQd8WeY9I3A-1
X-Mimecast-MFC-AGG-ID: 8STCbgGpNdSEQd8WeY9I3A_1772007278
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6A1281956067;
	Wed, 25 Feb 2026 08:14:37 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.55])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7C6291800465;
	Wed, 25 Feb 2026 08:14:26 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org,
	andreyknvl@gmail.com,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	dvyukov@google.com,
	linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	linux-s390@vger.kernel.org,
	hca@linux.ibm.com,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v5 00/15] mm/kasan: make kasan=on|off work for all three modes
Date: Wed, 25 Feb 2026 16:13:57 +0800
Message-ID: <20260225081412.76502-1-bhe@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: a0ZQ7rWYvjTQkziiEHPv0XBh2UtECnAiqRO8yMLWxZo_1772007278
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17152-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kvack.org,gmail.com,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,kernel.org,zankel.net,linux.ibm.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bhe@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:andreyknvl@gmail.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:dvyukov@google.com,m:linux-kernel@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:chris@zankel.net,m:jcmvbkbc@gmail.com,m:linux-s390@vger.kernel.org,m:hca@linux.ibm.com,m:bhe@redhat.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bhe@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.956];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 3D542193FB7
X-Rspamd-Action: no action

Currently only hw_tags mode of kasan can be enabled or disabled with
kernel parameter kasan=on|off for built kernel. For kasan generic and
sw_tags mode, there's no way to disable them once kernel is built.

This is not convenient sometime, e.g in system kdump is configured.
When the 1st kernel has KASAN enabled and crash triggered to switch to
kdump kernel, the generic or sw_tags mode will cost much extra memory
while in fact it's meaningless to have kasan in kdump kernel

There are two parts of big amount of memory requiring for kasan enabed
kernel. One is the direct memory mapping shadow of kasan, which is 1/8
of system RAM in generic mode and 1/16 of system RAM in sw_tags mode;
the other is the shadow meomry for vmalloc which causes big meomry
usage in kdump kernel because of lazy vmap freeing. By introducing
"kasan=off|on", if we specify 'kasan=off', the former is avoided by
skipping the kasan_init(), and the latter is avoided by not building the
vmalloc shadow for vmalloc.

So this patchset moves the kasan=on|off out of hw_tags scope and into
common code to make it visible in generic and sw_tags mode too. Then we
can add kasan=off in kdump kernel to reduce the unneeded meomry cost for
kasan.

Note that this hasn't been supported on s390 since I am not familiar
with s390 code. Hope s390 developer will make it work.

Testing:
========
Testing is done on upstream kernel 6.19.0+:

- For generic mode, testing is taken on below systems and passed.
  - x86_64 baremetal system
  - aarch64 baremetal system
  - ppc64le baremetal system (Model 9183-22X)
  - risc-v kvm guest

- For sw_tags mode, testing is taken on below system and passed.
  - aarch64 baremetal system 

- For hw_tags mode, testing is taken on below system and passed.
  - aarch64 kvm guest with "-machine virt,mte=on -cpu max" qemu command.

Changelog:
====
v4->v5:
- Add helper __kasan_cache_shrink() in mm/kasan/generic.c so that the
  kasan_enabled() checking done in kasan_cache_shrink() which is in
  include/linux/kasan.h. This change is made in patch 1.
- Carve out the change of renaming 'kasan_arg' to 'kasan_arg_disabled'
  into a separate patch from the old patch 2.
- put the old patch 12 to earlier place as patch 4 in this sereis so
  that the ifdeffery scope embracing kasan_flag_enabled definition is
  meaningful and understandable.
- Remove the stale and incorrect comment above kasan_enabled() in the
  old patch 12.
- Add comment 'If KASAN is disabled via command line, don't initialize
  it.' to all places where kasan is initialized and kasan_arg_disabled
  is checked.
- Add document in kernel-parameters.txt to note kasan=on|off.
- Remove unneeded ARCH_DEFER_KASAN and kasan_arch_is_ready().
- All these changes are made according to reviewers' suggestion in v4,
  thanks to Andrey Konovalov, Andrey Ryabinin and Alexander Potapenko.
  

v3->v4:
- Rebase code to the latest linux-next/master to make the whole patchset
  set on top of
  [PATCH 0/2] kasan: cleanups for kasan_enabled() checks
  [PATCH v6 0/2] kasan: unify kasan_enabled() and remove arch-specific implementations

v2->v3:
- Fix a building error on UML ARCH when CONFIG_KASAN is not set. The
  change of fixing is appended into patch patch 11. This is reported
  by LKP, thanks to them.

v1->v2:
- Add __ro_after_init for kasan_arg_disabled, and remove redundant blank
  lines in mm/kasan/common.c. Thanks to Marco.
- Fix a code bug in <linux/kasan-enabled.h> when CONFIG_KASAN is unset,
  this is found out by SeongJae and Lorenzo, and also reported by LKP
  report, thanks to them.
- Add a missing kasan_enabled() checking in kasan_report(). This will
  cause a KASAN report info even though kasan=off is set:
- Add jump_label_init() calling before kasan_init() in setup_arch() in these
  architectures: xtensa, arm. Because they currenly rely on
  jump_label_init() in main() which is a little late. Then the early static
  key kasan_flag_enabled in kasan_init() won't work.
- In UML architecture, change to enable kasan_flag_enabled in arch_mm_preinit()
  because kasan_init() is enabled before main(), there's no chance to operate
  on static key in kasan_init().

Baoquan He (15):
  mm/kasan: add conditional checks in functions to return directly if
    kasan is disabled
  mm/kasan: rename 'kasan_arg' to 'kasan_arg_disabled'
  mm/kasan: mm/kasan: move kasan= code to common place
  mm/kasan: make kasan=on|off take effect for all three modes
  mm/kasan/sw_tags: don't initialize kasan if it's disabled
  arch/arm: don't initialize kasan if it's disabled
  arch/arm64: don't initialize kasan if it's disabled
  arch/loongarch: don't initialize kasan if it's disabled
  arch/powerpc: don't initialize kasan if it's disabled
  arch/riscv: don't initialize kasan if it's disabled
  arch/x86: don't initialize kasan if it's disabled
  arch/xtensa: don't initialize kasan if it's disabled
  arch/um: don't initialize kasan if it's disabled
  mm/kasan: add document into kernel-parameters.txt
  mm/kasan: clean up unneeded ARCH_DEFER_KASAN and kasan_arch_is_ready

 .../admin-guide/kernel-parameters.txt         |  4 +++
 Documentation/dev-tools/kasan.rst             |  2 --
 arch/arm/kernel/setup.c                       |  6 ++++
 arch/arm/mm/kasan_init.c                      |  3 ++
 arch/arm64/mm/kasan_init.c                    |  7 +++++
 arch/loongarch/Kconfig                        |  1 -
 arch/loongarch/mm/kasan_init.c                |  3 ++
 arch/powerpc/Kconfig                          |  1 -
 arch/powerpc/mm/kasan/init_32.c               |  6 +++-
 arch/powerpc/mm/kasan/init_book3e_64.c        |  4 +++
 arch/powerpc/mm/kasan/init_book3s_64.c        |  4 +++
 arch/riscv/mm/kasan_init.c                    |  4 +++
 arch/um/Kconfig                               |  1 -
 arch/um/kernel/mem.c                          |  5 +++-
 arch/x86/mm/kasan_init_64.c                   |  4 +++
 arch/xtensa/kernel/setup.c                    |  1 +
 arch/xtensa/mm/kasan_init.c                   |  4 +++
 include/linux/kasan-enabled.h                 | 10 +++----
 include/linux/kasan.h                         |  7 ++++-
 lib/Kconfig.kasan                             | 12 --------
 mm/kasan/common.c                             | 21 ++++++++++++--
 mm/kasan/generic.c                            | 16 +++++++++--
 mm/kasan/hw_tags.c                            | 28 ++-----------------
 mm/kasan/init.c                               |  6 ++++
 mm/kasan/kasan.h                              |  6 ----
 mm/kasan/quarantine.c                         |  3 ++
 mm/kasan/report.c                             |  4 ++-
 mm/kasan/shadow.c                             | 11 +++++++-
 mm/kasan/sw_tags.c                            |  7 +++++
 29 files changed, 128 insertions(+), 63 deletions(-)

-- 
2.52.0


