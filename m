Return-Path: <linuxppc-dev+bounces-17096-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LJLDn1nnWlgPQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17096-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 09:55:25 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2737A184106
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 09:55:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKs492LRrz3cMG;
	Tue, 24 Feb 2026 19:55:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771923304;
	cv=none; b=CJ+PvgiYg8G8jR2xV4ptZiy8RXKVTjNbMWFGx1hdHlBkoDYMnZPte6MfUUgctYHj+QlQE3UmU35PWBxT2bAZYcTv7bTqTjteEFOcSXHxQSPPwBygoBWjnHh6ICALdROH0vze9GH/JOnLJrBULcbgw/38XiT6MZataY2O67PJ7JGavdSHM/kdUGTsmACoOq18lfy8GluzFVhIY902lfmF2p69/yeO/Ub6Fedx/6HgYbhZxFMyUNZZAgY4rE0dGkcC2QMmxXOT2w77sdecgJujberLestZfIckkG0GLGI5v7LqkR+pdCb/VK/BDOicBUSNtwviu2WW6pgFHAUmx+REjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771923304; c=relaxed/relaxed;
	bh=6EKEX5cWoMUi78yruWbUk4GEWE72jsbf2ZDSPCHmqfQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fzCq09yqz/l+WGR/l2MtH/KMnS93hYxorfjNAQdF5Wx4BJ3tDByOEnhjIqffQYct+Bdm6q4IDqCnNQTSGRMeR3xOJm3LmaPagPah5jKPAuwxMd4PnPxdqc+qr81GJJetpSMQPjxFT55a2NlNussLfr2cxW6cEVM5vgGqC3kw/Iqcp40hccsGHgujYzp/bYTO4Vd0x+o6w3tWAhawjitrYcoakoQw74FdyiphYVN/x1OaETGhSBByLk9eh0XD1tamWb6DZX+QpmSpUhBoKHZAs3HuR1a3H22j8KbHsgqMhRFBjb+lWdedTO0IaRL1tvOJ63jK+rDI760PtzIvJAQBYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=UYA0vF1b; dkim-atps=neutral; spf=pass (client-ip=113.46.200.222; helo=canpmsgout07.his.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=UYA0vF1b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=113.46.200.222; helo=canpmsgout07.his.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKs444F08z3cJy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 19:55:00 +1100 (AEDT)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6EKEX5cWoMUi78yruWbUk4GEWE72jsbf2ZDSPCHmqfQ=;
	b=UYA0vF1b0mXLDUTW3rtdkRA/JAvC5/9oQCGZSEQyi1ecxE8viedTHtzsRMsXx+bsvg59qmIKO
	w5hAbIi/WH6s5/ykzcIaYEkQKG2xTwkEcaS1YiIng1JY5AeOfF28F4PGi1HP7FXMr1yCbWepVso
	mSN98Ddm5YuLnrpH93kkgsc=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fKryV3bNvzLlVb;
	Tue, 24 Feb 2026 16:50:10 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 90C9640565;
	Tue, 24 Feb 2026 16:54:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Feb
 2026 16:54:53 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <bhe@redhat.com>,
	<vgoyal@redhat.com>, <dyoung@redhat.com>, <rdunlap@infradead.org>,
	<pmladek@suse.com>, <dapeng1.mi@linux.intel.com>, <kees@kernel.org>,
	<paulmck@kernel.org>, <lirongqing@baidu.com>, <arnd@arndb.de>,
	<ardb@kernel.org>, <leitao@debian.org>, <rppt@kernel.org>,
	<cfsworks@gmail.com>, <ryan.roberts@arm.com>, <sourabhjain@linux.ibm.com>,
	<tangyouling@kylinos.cn>, <eajames@linux.ibm.com>, <hbathini@linux.ibm.com>,
	<ritesh.list@gmail.com>, <songshuaishuai@tinylab.org>,
	<samuel.holland@sifive.com>, <kevin.brodsky@arm.com>,
	<vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>, <coxu@redhat.com>,
	<liaoyuanhong@vivo.com>, <fuqiang.wang@easystack.cn>, <jbohac@suse.cz>,
	<brgerst@gmail.com>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v6 3/5] crash: Use crash_exclude_core_ranges() on powerpc
Date: Tue, 24 Feb 2026 16:53:40 +0800
Message-ID: <20260224085342.387996-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224085342.387996-1-ruanjinjie@huawei.com>
References: <20260224085342.387996-1-ruanjinjie@huawei.com>
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-17096-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:vgoyal@redhat.com,m:dyoung@redhat.com,m:rdunlap@infradead.org,m:pmladek@suse.com,m:dapeng1.mi@linux.intel.com,m:kees@kernel.org,m:paulmck@kernel.org,m:lirongqing@baidu.com,m:arnd@arndb.de,m:ardb@kernel.org,m:leitao@debian.org,m:rppt@kernel.org,m:cfsworks@gmail.com,m:ryan.roberts@arm.com,m:sourabhjain@linux.ibm.com,m:tangyouling@kylinos.cn,m:eajames@linux.ibm.com,m:hbathini@linux.ibm.com,m:ritesh.list@gmail.com,m:songshuaishuai@tinylab.org,m:samuel.holland@sifive.com,m:kevin.brodsky@arm.com,m:vishal.moola@gmail.com,m:junhui.liu@
 pigmoral.tech,m:coxu@redhat.com,m:liaoyuanhong@vivo.com,m:fuqiang.wang@easystack.cn,m:jbohac@suse.cz,m:brgerst@gmail.com,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:kexec@lists.infradead.org,m:ruanjinjie@huawei.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,suse.com,baidu.com,arndb.de,debian.org,kylinos.cn,tinylab.org,sifive.com,pigmoral.tech,vivo.com,easystack.cn,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[59];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:mid,huawei.com:dkim,huawei.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 2737A184106
X-Rspamd-Action: no action

The crash memory exclude of crashk_res and crashk_cma memory on powerpc
are almost identical to the generic crash_exclude_core_ranges().

By introducing the architecture-specific arch_crash_exclude_mem_range()
function with a default implementation of crash_exclude_mem_range(),
and using crash_exclude_mem_range_guarded as powerpc's separate
implementation, the generic crash_exclude_core_ranges() helper function
can be reused.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/powerpc/kexec/ranges.c | 16 ++++------------
 include/linux/crash_core.h  |  4 ++++
 kernel/crash_core.c         | 19 +++++++++++++------
 3 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
index 6c58bcc3e130..e5fea23b191b 100644
--- a/arch/powerpc/kexec/ranges.c
+++ b/arch/powerpc/kexec/ranges.c
@@ -553,9 +553,9 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
 #endif /* CONFIG_KEXEC_FILE */
 
 #ifdef CONFIG_CRASH_DUMP
-int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
-					   unsigned long long mstart,
-					   unsigned long long mend)
+int arch_crash_exclude_mem_range(struct crash_mem **mem_ranges,
+				 unsigned long long mstart,
+				 unsigned long long mend)
 {
 	struct crash_mem *tmem = *mem_ranges;
 
@@ -604,18 +604,10 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
 			sort_memory_ranges(*mem_ranges, true);
 	}
 
-	/* Exclude crashkernel region */
-	ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_res.start, crashk_res.end);
+	ret = crash_exclude_core_ranges(mem_ranges);
 	if (ret)
 		goto out;
 
-	for (i = 0; i < crashk_cma_cnt; ++i) {
-		ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_cma_ranges[i].start,
-					      crashk_cma_ranges[i].end);
-		if (ret)
-			goto out;
-	}
-
 	/*
 	 * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
 	 *        regions are exported to save their context at the time of
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index 033b20204aca..dbec826dc53b 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -68,6 +68,7 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
 				       void **addr, unsigned long *sz);
 extern int crash_prepare_headers(int need_kernel_map, void **addr,
 				 unsigned long *sz, unsigned long *nr_mem_ranges);
+extern int crash_exclude_core_ranges(struct crash_mem **cmem);
 
 struct kimage;
 struct kexec_segment;
@@ -88,6 +89,9 @@ extern int kimage_crash_copy_vmcoreinfo(struct kimage *image);
 extern unsigned int arch_get_system_nr_ranges(void);
 extern int arch_crash_populate_cmem(struct crash_mem *cmem);
 extern int arch_crash_exclude_ranges(struct crash_mem *cmem);
+extern int arch_crash_exclude_mem_range(struct crash_mem **mem,
+					unsigned long long mstart,
+					unsigned long long mend);
 
 #else /* !CONFIG_CRASH_DUMP*/
 struct pt_regs;
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 96a96e511f5a..300d44ad5471 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -287,24 +287,31 @@ unsigned int __weak arch_get_system_nr_ranges(void) { return 0; }
 int __weak arch_crash_populate_cmem(struct crash_mem *cmem) { return -1; }
 int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) { return 0; }
 
-static int crash_exclude_core_ranges(struct crash_mem *cmem)
+int __weak arch_crash_exclude_mem_range(struct crash_mem **mem,
+					unsigned long long mstart,
+					unsigned long long mend)
+{
+	return crash_exclude_mem_range(*mem, mstart, mend);
+}
+
+int crash_exclude_core_ranges(struct crash_mem **cmem)
 {
 	int ret, i;
 
 	/* Exclude crashkernel region */
-	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
+	ret = arch_crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
 	if (ret)
 		return ret;
 
 	if (crashk_low_res.end) {
-		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
+		ret = arch_crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
 		if (ret)
 			return ret;
 	}
 
 	for (i = 0; i < crashk_cma_cnt; ++i) {
-		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
-					      crashk_cma_ranges[i].end);
+		ret = arch_crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
+						   crashk_cma_ranges[i].end);
 		if (ret)
 			return ret;
 	}
@@ -331,7 +338,7 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
 	if (ret)
 		goto out;
 
-	ret = crash_exclude_core_ranges(cmem);
+	ret = crash_exclude_core_ranges(&cmem);
 	if (ret)
 		goto out;
 
-- 
2.34.1


