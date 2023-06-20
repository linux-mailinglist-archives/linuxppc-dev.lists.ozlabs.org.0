Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B647736F44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 16:54:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bygnBfy1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gjT7Rewc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlqRc3nXBz30fM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 00:54:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bygnBfy1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gjT7Rewc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=ypodemsk@redhat.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 88 seconds by postgrey-1.37 at boromir; Wed, 21 Jun 2023 00:54:05 AEST
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlqQj2nkRz2xqH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 00:54:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687272842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=No1ZAzXRenHK6Spay7fCIW5zNaUlPsGtRXWs40EaAkg=;
	b=bygnBfy1LeX3f4pzOSHTkWsrezWYuvz3cNqBsAlx8/tSsLsSuwdV9M+i8lNnGLgyWVvKeK
	urL9G5uvLovWAOKBTF5DIYeJIfaVQOfU0Ym9vEPGCDFLKRgjfQ2mI6CveBlwjQKiC2I7Km
	i/ThAdlCDDXprCvvsGkpH+jjaUEZQos=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687272843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=No1ZAzXRenHK6Spay7fCIW5zNaUlPsGtRXWs40EaAkg=;
	b=gjT7RewcUqyIt6TsTTjkKQALj3o75h1SoJv7DWg57kyVpKaDxllI8YWEUiEywQsvC3rJUK
	eRhTI5oo4mpAg0Ch6V6fO6suSCOYVzNVK6K7JwzT64l4Dpt3ANSVqrJkZsvzLJxjYxI8Pu
	ScJxWfvXI2gqiGAEP3KoA7n+3kx7t4U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-9hW9-9gWM06uUSep_ULxGA-1; Tue, 20 Jun 2023 10:52:31 -0400
X-MC-Unique: 9hW9-9gWM06uUSep_ULxGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4169729DD9A3;
	Tue, 20 Jun 2023 14:46:34 +0000 (UTC)
Received: from ypodemsk.tlv.csb (unknown [10.39.195.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 863679E9C;
	Tue, 20 Jun 2023 14:46:25 +0000 (UTC)
From: Yair Podemsky <ypodemsk@redhat.com>
To: mtosatti@redhat.com,
	ppandit@redhat.com,
	david@redhat.com,
	linux@armlinux.org.uk,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	keescook@chromium.org,
	paulmck@kernel.org,
	frederic@kernel.org,
	will@kernel.org,
	peterz@infradead.org,
	ardb@kernel.org,
	samitolvanen@google.com,
	juerg.haefliger@canonical.com,
	arnd@arndb.de,
	rmk+kernel@armlinux.org.uk,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	akpm@linux-foundation.org,
	sebastian.reichel@collabora.com,
	rppt@kernel.org,
	aneesh.kumar@linux.ibm.com,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] send tlb_remove_table_smp_sync IPI only to necessary CPUs
Date: Tue, 20 Jun 2023 17:46:16 +0300
Message-Id: <20230620144618.125703-1-ypodemsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: ypodemsk@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the tlb_remove_table_smp_sync IPI is sent to all CPUs
indiscriminately, this causes unnecessary work and delays notable in
real-time use-cases and isolated cpus.
By limiting the IPI to only be sent to cpus referencing the effected
mm.
a config to differentiate architectures that support mm_cpumask from
those that don't will allow safe usage of this feature.

changes from -v1:
- Previous version included a patch to only send the IPI to CPU's with
context_tracking in the kernel space, this was removed due to race 
condition concerns.
- for archs that do not maintain mm_cpumask the mask used should be
 cpu_online_mask (Peter Zijlstra).
 
 v1: https://lore.kernel.org/all/20230404134224.137038-1-ypodemsk@redhat.com/

Yair Podemsky (2):
  arch: Introduce ARCH_HAS_CPUMASK_BITS
  mm/mmu_gather: send tlb_remove_table_smp_sync IPI only to MM CPUs

 arch/Kconfig              |  8 ++++++++
 arch/arm/Kconfig          |  1 +
 arch/powerpc/Kconfig      |  1 +
 arch/s390/Kconfig         |  1 +
 arch/sparc/Kconfig        |  1 +
 arch/x86/Kconfig          |  1 +
 include/asm-generic/tlb.h |  4 ++--
 mm/khugepaged.c           |  4 ++--
 mm/mmu_gather.c           | 17 ++++++++++++-----
 9 files changed, 29 insertions(+), 9 deletions(-)

-- 
2.39.3

