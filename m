Return-Path: <linuxppc-dev+bounces-16628-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODfaMxHchGkV6AMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16628-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 19:06:09 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5212F64F6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 19:06:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6QBk0kB7z2yFb;
	Fri, 06 Feb 2026 05:06:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770287046;
	cv=none; b=aToeQKMkeEiUkhH0ok6L57b+EVmDB8h/JII1iaELXel4y4RhDJcUXMSJTOVtrsL3hocQGFtvMHtRtjghPnFNpPr170UiYAmwz4OkgUr58vs+9HAWsepVaToiMJWmItZpNSDl7RS+nu2G28YkpFujk/IlH5IAkFSLJKw4ZGPbyd1ABwLYBCwc/EU74YLIVKnod8d4ZRL/ORO9d9BnMKYj95rp9ovhJH+N+7fMMuoeTjw5Dkji4XBpCn8AQPcHlw4GBDKa9lEv1OlojoskQXmMiSZo6tjXkZRSChFHVbB6sFQT7wii/R2nA20sByTmD9cqyRnv3cZQnAsME1qhkSC/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770287046; c=relaxed/relaxed;
	bh=sPoqZUGwj+5Bi5z4vx96eEq6JXWaEqv8vZqoNKhRA4Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kIKmDt4S4O7mPyMpgeCvHOf0W5B5yc735o7KcE3t8HJD0IuzAHj7LbRW24A2DF2+487BdNnDVDMxv2n5K5nsLNwi+E4CIFRky0rbYAJs9s/aSGVGYBdQHtUVmOADKeVClxoNovrnF2cdLXapZG3AMCd4N/1ChctQJ3hCOfCjnRDYY1nxtrRbxxxXuZtUrexQL60TZbf6cBRb8BnngotkZSlJRcX5EdTSoj1EbNwaLEnsm1T0OvNa6MeR07HQC7+aLchbXGjLc41pYw1k2d56uFNSVe7PXr0xGFZi6uT11VwOKrgWoRmMwuuQ5PKMuDWcUmO4nrX3wCub26Wle1XNWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Un6ikFWD; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Un6ikFWD; dkim-atps=neutral; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=xieyuanbin1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Un6ikFWD;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Un6ikFWD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=xieyuanbin1@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1103 seconds by postgrey-1.37 at boromir; Thu, 05 Feb 2026 21:24:02 AEDT
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6CxZ6SFJz2xg9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 21:24:00 +1100 (AEDT)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sPoqZUGwj+5Bi5z4vx96eEq6JXWaEqv8vZqoNKhRA4Y=;
	b=Un6ikFWDy+OL/X35GfoynaKqozTukzBUEGGr1KyzRsUxy14hDXbZGeUF05qp7Wr+4OrPCN5j/
	sk+4SupjtDViXV7t5JI6/60h2z8tGzIRgXGflSdph/KS4ecWy0VbK2nPc/S06OXqrNSFhLQDIeu
	Q3Uv1YOzxYPzfQ+vyM4T6BU=
Received: from canpmsgout10.his.huawei.com (unknown [172.19.92.130])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f6CWM70H7z1BG52
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Feb 2026 18:04:47 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sPoqZUGwj+5Bi5z4vx96eEq6JXWaEqv8vZqoNKhRA4Y=;
	b=Un6ikFWDy+OL/X35GfoynaKqozTukzBUEGGr1KyzRsUxy14hDXbZGeUF05qp7Wr+4OrPCN5j/
	sk+4SupjtDViXV7t5JI6/60h2z8tGzIRgXGflSdph/KS4ecWy0VbK2nPc/S06OXqrNSFhLQDIeu
	Q3Uv1YOzxYPzfQ+vyM4T6BU=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4f6CQs5s8Hz1K9Yq;
	Thu,  5 Feb 2026 18:00:53 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 33E4440565;
	Thu,  5 Feb 2026 18:05:26 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 5 Feb 2026 18:05:25 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <kees@kernel.org>, <andy@kernel.org>
CC: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-hardening@vger.kernel.org>, <lilinjie8@huawei.com>,
	<liaohua4@huawei.com>, <xieyuanbin1@huawei.com>
Subject: [PATCH 2/2] powerpc/text-patching: Fix possible stringop-overread compilation error
Date: Thu, 5 Feb 2026 18:05:17 +0800
Message-ID: <20260205100517.292858-2-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260205100517.292858-1-xieyuanbin1@huawei.com>
References: <20260205100517.292858-1-xieyuanbin1@huawei.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-Spam-Status: No, score=-1.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-16628-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:kees@kernel.org,m:andy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lilinjie8@huawei.com,m:liaohua4@huawei.com,m:xieyuanbin1@huawei.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[xieyuanbin1@huawei.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xieyuanbin1@huawei.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,huawei.com:dkim,huawei.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: A5212F64F6
X-Rspamd-Action: no action

For strnlen(), if the compiler detects that the maxlen argument exceeds
the valid memory size of the input string object, a compilation error may
occur.

For lastest linux-next source, changing ppc_kallsyms_lookup_name() to
__always_inline, using default ppc64_defconfig, and setting
CONFIG_EXPERT=y, CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2=n,
CONFIG_CC_OPTIMIZE_FOR_SIZE=y. Then, when using gcc-15 for compilation,
the following error will be triggered:
```log
  CC      arch/powerpc/kernel/optprobes.o
In file included from ./arch/powerpc/include/asm/kprobes.h:24,
                 from ./include/linux/kprobes.h:31,
                 from arch/powerpc/kernel/optprobes.c:8:
In function ‘ppc_kallsyms_lookup_name’,
    inlined from ‘arch_prepare_optimized_kprobe’ at arch/powerpc/kernel/optprobes.c:209:21:
./arch/powerpc/include/asm/text-patching.h:232:13: error: ‘strnlen’ specified bound 512 exceeds source size 19 [-Werror=stringop-overread]
  232 |         if (strnlen(name, KSYM_NAME_LEN) >= KSYM_NAME_LEN)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function ‘ppc_kallsyms_lookup_name’,
    inlined from ‘arch_prepare_optimized_kprobe’ at arch/powerpc/kernel/optprobes.c:210:22:
./arch/powerpc/include/asm/text-patching.h:232:13: error: ‘strnlen’ specified bound 512 exceeds source size 13 [-Werror=stringop-overread]
  232 |         if (strnlen(name, KSYM_NAME_LEN) >= KSYM_NAME_LEN)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
```

Refer to the implementation of fortify's strnlen(). If the string length
is a compile-time constant, do not call the strnlen() function.

Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
---
 arch/powerpc/include/asm/text-patching.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/text-patching.h b/arch/powerpc/include/asm/text-patching.h
index e7f14720f630..ce1b2131980a 100644
--- a/arch/powerpc/include/asm/text-patching.h
+++ b/arch/powerpc/include/asm/text-patching.h
@@ -228,8 +228,13 @@ static inline unsigned long ppc_kallsyms_lookup_name(const char *name)
 	/* check for dot variant */
 	char dot_name[1 + KSYM_NAME_LEN];
 	bool dot_appended = false;
+	size_t n_len = __compiletime_strlen(name);
+	const size_t n_size = __member_size(name);
 
-	if (strnlen(name, KSYM_NAME_LEN) >= KSYM_NAME_LEN)
+	if (n_len == SIZE_MAX || KSYM_NAME_LEN < n_size)
+		n_len = strnlen(name, KSYM_NAME_LEN);
+	
+	if (n_len >= KSYM_NAME_LEN)
 		return 0;
 
 	if (name[0] != '.') {
-- 
2.51.0


