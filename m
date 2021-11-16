Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CABB453182
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 12:55:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtkyT2xcGz3cfn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 22:55:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=PauVriXj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=desiato.srs.infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=batv+ed896c150e16a1be20ce+6659+infradead.org+dwmw2@desiato.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=PauVriXj; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtktZ6wzPz2yns
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 22:51:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=K9T3+TDcwORVgUJnr7I/U5HcSPNAxypqxVWyDlaOhIs=; b=PauVriXjF0kf/5ln8OJHy3K6Yb
 zhr2CeqCavUh90LxalbYafrUtQPa9rnYlsJ6Sof1AtbXjNh1KVEZsCJRSg9TfUY7deRUGTlYQFb1/
 UROrzT4zMprc5KChSpmU30wNdmWUSXGtwqdAzQI1o9BKbZ+WFbFlJzaNS+xJMl43WWXburDll+p45
 dd+jpzDEvDFGDzIZTTYImnab2NhledKuo/awWF3Qo+NZWXThkfQX58UZGQXY9c0M1w2HqVN/Ecu8V
 vCXAzN59Igh4h7nkARabGx9ij8ZpR2mQ5Se0C/kRzRsfPY0DuNpGfMw4s8OpA0vMla06ehDNmKegN
 jXzWT5wQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmwzD-00GJ7A-Ks; Tue, 16 Nov 2021 11:50:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mmwzD-000VDf-9U; Tue, 16 Nov 2021 11:50:51 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	kvm <kvm@vger.kernel.org>
Subject: [PATCH 3/7] KVM: s390: Use Makefile.kvm for common files
Date: Tue, 16 Nov 2021 11:50:47 +0000
Message-Id: <20211116115051.119956-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116115051.119956-1-dwmw2@infradead.org>
References: <5047c2591310e503491850ef683f251395247d50.camel@infradead.org>
 <20211116115051.119956-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Anup Patel <anup.patel@wdc.com>,
 "wanpengli @ tencent . com" <wanpengli@tencent.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "seanjc @ google . com" <seanjc@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, "vkuznets @ redhat . com" <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/s390/kvm/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
index b3aaadc60ead..e4f50453cf7f 100644
--- a/arch/s390/kvm/Makefile
+++ b/arch/s390/kvm/Makefile
@@ -3,13 +3,11 @@
 #
 # Copyright IBM Corp. 2008
 
-KVM := ../../../virt/kvm
-common-objs = $(KVM)/kvm_main.o $(KVM)/eventfd.o  $(KVM)/async_pf.o \
-	      $(KVM)/irqchip.o $(KVM)/vfio.o $(KVM)/binary_stats.o
+include $(srctree)/virt/kvm/Makefile.kvm
 
 ccflags-y := -Ivirt/kvm -Iarch/s390/kvm
 
-kvm-objs := $(common-objs) kvm-s390.o intercept.o interrupt.o priv.o sigp.o
+kvm-objs := kvm-s390.o intercept.o interrupt.o priv.o sigp.o
 kvm-objs += diag.o gaccess.o guestdbg.o vsie.o pv.o
 
 obj-$(CONFIG_KVM) += kvm.o
-- 
2.31.1

