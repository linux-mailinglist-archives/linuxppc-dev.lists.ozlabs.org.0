Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 747827BD9E1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 13:31:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QZ/1bsGU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KgFqb5C/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3xh42DVmz3cX7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 22:31:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QZ/1bsGU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KgFqb5C/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3xg726Dyz3c76
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 22:30:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696851053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AucLLdvUakuzR+OKAnMghovN188k9ydHfEOSC44ux8U=;
	b=QZ/1bsGUqm8BeFiZrMGi0gTSKq6bPEC3BLgZ2DzgmD1HDBF4t67rjVFViEd4/9iEiIxo2u
	E3qY3Akw5tJE69l9CDTLtIP3lls2mR1M6DZNcrq8jM21xIfzmU/wFIZc+bb9wyW/85Ajh0
	QHQzlTOx/ajKwOLA9iV1Zlv6wzuHm+U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696851054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AucLLdvUakuzR+OKAnMghovN188k9ydHfEOSC44ux8U=;
	b=KgFqb5C/DzuE7MS09qXqNlVi4FHm++Yj6dulEPjhdAfUYlNHD5jkVmH11x+TlI4i16fFw3
	N1a6KLGU67yl4/eL2uDhHHXRSDrpAvtWi5ZFPTNJbZkFsCFGMJxgu6PxqHRm8AUp4vRM1J
	AyTXujmn2M6I//EqSHYiyVTXLYsIEk0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-RNfrfiIBOGC17ZfULLohZg-1; Mon, 09 Oct 2023 07:30:51 -0400
X-MC-Unique: RNfrfiIBOGC17ZfULLohZg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6737F85A5BD;
	Mon,  9 Oct 2023 11:30:50 +0000 (UTC)
Received: from piliu.users.ipa.redhat.com (unknown [10.72.120.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 188092156711;
	Mon,  9 Oct 2023 11:30:45 +0000 (UTC)
From: Pingfan Liu <piliu@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv8 0/5] enable nr_cpus for powerpc
Date: Mon,  9 Oct 2023 19:30:31 +0800
Message-Id: <20231009113036.45988-1-piliu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Baoquan He <bhe@redhat.com>, Pingfan Liu <piliu@redhat.com>, Mahesh Salgaonkar <mahesh@us.ibm.com>, kexec@lists.infradead.org, Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since my last v4 [1], the code has undergone great changes. The paca[]
array has been reorganized and indexed by paca_ptrs[], which
dramatically decreases the memory consumption even if there are many
unpresent cpus in the middle.

However, reordering the logical cpu numbers can further decrease the
size of paca_ptrs[] in the kdump case. So I keep [1-2/5], which
rotate-shifts the cpu's sequence number in the device tree to obtain the
logical cpu id.


Patch [3-5/5] make further efforts to decrease the nr_cpus to be less
than or equal to two.

[1]: https://lore.kernel.org/linuxppc-dev/1520829790-14029-1-git-send-email-kernelfans@gmail.com/
---
v7 -> v8
  Fix bug when turning on DEBUG macro
  Introducing [PATCHv7 4/5] powerpc/cpu: Skip impossible cpu during iteration on
a core, which avoid access to unpopulated pcpu data.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Mahesh Salgaonkar <mahesh@us.ibm.com>
Cc: Wen Xiong <wenxiong@us.ibm.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: kexec@lists.infradead.org
To: linuxppc-dev@lists.ozlabs.org


Pingfan Liu (5):
  powerpc/setup : Enable boot_cpu_hwid for PPC32
  powerpc/setup: Loosen the mapping between cpu logical id and its seq
    in dt
  powerpc/setup: Handle the case when boot_cpuid greater than nr_cpus
  powerpc/cpu: Skip impossible cpu during iteration on a core
  powerpc/setup: alloc extra paca_ptrs to hold boot_cpuid

 arch/powerpc/include/asm/cputhreads.h    |   6 ++
 arch/powerpc/include/asm/smp.h           |   2 +-
 arch/powerpc/kernel/paca.c               |  10 ++-
 arch/powerpc/kernel/prom.c               |  29 +++---
 arch/powerpc/kernel/setup-common.c       | 108 ++++++++++++++++++-----
 arch/powerpc/kernel/smp.c                |   2 +-
 arch/powerpc/kvm/book3s_hv.c             |   7 +-
 arch/powerpc/platforms/powernv/idle.c    |  32 +++----
 arch/powerpc/platforms/powernv/subcore.c |   5 +-
 9 files changed, 143 insertions(+), 58 deletions(-)

-- 
2.31.1

