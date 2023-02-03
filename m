Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DAB689424
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 10:43:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7W1s6p5Fz3f8X
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 20:43:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SI0YOiE9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J3UAB5RH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SI0YOiE9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J3UAB5RH;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7W0v4Wmtz3f5s
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 20:42:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675417368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gq4Yn/0owA9XdbDg6QuVgQFBldHRzwq+OimRCX/v9mI=;
	b=SI0YOiE9FtQ4wIWa24MqtWAotg/WJWCLun4MZdiq8vXo/8knE3Hsb19ci6jrFpzk2x+hNO
	KNIojM4urywr4+o4EjslUkUMbp2kvRSdemma1HdG4L74FBD8Mp1Y1TUJ6LSYXRToVO++Cq
	ro3Ryslo11UTPNNRyM8wnxEx6eltedA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675417369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gq4Yn/0owA9XdbDg6QuVgQFBldHRzwq+OimRCX/v9mI=;
	b=J3UAB5RHJLp2wjy/A+5CbBe2urqttnowFaXwPYam5r1F9pScOl6uiKWHoXWUhALzZReWCD
	3ZdqoiSPd+9YFLv7AW3xK+LPQoZuWiOm/0RMhhTJpPK8zI2QGdMGtWhB7VwbryHUF6UW1n
	U2E4wWuHU8fgnCaUqag5OIgy9EnsmR0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-Z2JZTNm2PaWxScDI7rs6hw-1; Fri, 03 Feb 2023 04:42:41 -0500
X-MC-Unique: Z2JZTNm2PaWxScDI7rs6hw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70D9329AB3FA;
	Fri,  3 Feb 2023 09:42:40 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.204])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 70E31404CD80;
	Fri,  3 Feb 2023 09:42:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Subject: [PATCH 0/7] KVM: Standardize on "int" return types instead of "long"
Date: Fri,  3 Feb 2023 10:42:23 +0100
Message-Id: <20230203094230.266952-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Christian Borntraeger <borntraeger@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series is a follow-up from one of my patches in 2022 and
Sean's reply here:

 https://lore.kernel.org/kvm/YpZu6%2Fk+8EydfBKf@google.com/

KVM functions use "long" return values for functions that are wired up
to "struct file_operations", but otherwise use "int" return values for
functions that can return 0/-errno in order to avoid unintentional
divergences between 32-bit and 64-bit kernels. Some related functions
that are not part of a "struct file_operations" still use "long", though,
which can cause confusion or even subtle problems (see second patch).
Thus let's standardize on using "int" for return values in these functions
to avoid such problems in the future.

Thomas Huth (7):
  KVM: Standardize on "int" return types instead of "long" in kvm_main.c
  KVM: x86: Improve return type handling in
    kvm_vm_ioctl_get_nr_mmu_pages()
  KVM: Move KVM_GET_NR_MMU_PAGES into the deprecation section
  KVM: PPC: Standardize on "int" return types in the powerpc KVM code
  KVM: s390: Use "int" as return type for kvm_s390_get/set_skeys()
  KVM: arm64: Change return type of kvm_vm_ioctl_mte_copy_tags() to
    "int"
  KVM: Change return type of kvm_arch_vm_ioctl() to "int"

 arch/arm64/include/asm/kvm_host.h   |  4 ++--
 arch/arm64/kvm/arm.c                |  3 +--
 arch/arm64/kvm/guest.c              |  4 ++--
 arch/mips/kvm/mips.c                |  4 ++--
 arch/powerpc/include/asm/kvm_ppc.h  | 14 +++++++-------
 arch/powerpc/kvm/book3s_64_mmu_hv.c | 14 +++++++-------
 arch/powerpc/kvm/book3s_64_vio.c    |  4 ++--
 arch/powerpc/kvm/book3s_hv.c        |  6 +++---
 arch/powerpc/kvm/book3s_pr.c        |  4 ++--
 arch/powerpc/kvm/powerpc.c          |  5 ++---
 arch/riscv/kvm/vm.c                 |  3 +--
 arch/s390/kvm/kvm-s390.c            |  7 +++----
 arch/x86/kvm/x86.c                  |  8 +++++---
 include/linux/kvm_host.h            |  3 +--
 include/uapi/linux/kvm.h            |  3 ++-
 virt/kvm/kvm_main.c                 |  4 ++--
 16 files changed, 44 insertions(+), 46 deletions(-)

-- 
2.31.1

