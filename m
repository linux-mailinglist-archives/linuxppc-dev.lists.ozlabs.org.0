Return-Path: <linuxppc-dev+bounces-16627-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0INEDeHbhGkV6AMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16627-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 19:05:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 772BCF64DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 19:05:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6Q9m6lV4z30FD;
	Fri, 06 Feb 2026 05:05:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770287047;
	cv=none; b=njAVbUnmzaA/H0/P4bHi68Bx9hF/ZaqxrNjB+qputiULFxpZ0x0ra/wjOxcUqX6mUvSCxKlvpSI8K7G//n1E0mm743prP23Fp5DnM0vcsl60RbAi9BZPKWTOUvubOEZdkVZBxvwo268YiZFptLUgqnlQAIMWbfr3SIp3p/pVmrLAoH5/SvqlXMjNRgY0C0Ww9haK9pqPyNaAM72szi78l5h5gJj8jlVOz89/7lWAxksfJF6fquj3sQYLYeCXq4pWdf9RQIeRhlYs/51EeaFWIfeBfKGmB0IMS+OYSBkxcbsTQzGXoQm+qPAwi5p+NwcutvdkyirO0GEz42i5dCxRAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770287047; c=relaxed/relaxed;
	bh=+0bnrjD1Vt8hf7jyTJXY+6HGtA8bkKy60Hegi1EeXzE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qwr4SFBWX2ilGD7ohx5kI297nDDN5o/tA1BRfxkZGZloV3wfjj2oglMBLJhQ2l+sF+cqltIqjQmQqJj+jbTp5D7vDnmf+6IUpN58OB67yHyqijXsZrEwfTJIyK1agBRqdEhWtPdauq9zF5Zo9mF06Gekoz5VewrQvg4SgBCfLWjR+g2Tir+pfwm8V+SlswhRzegYbX89Lih3gBGij0/ap3yHLzs3v89zTs3ypgu0gDobjdC1yYnUYktR+L2eQUA+AhOLyeMzWg5acVKyxUpHlh+5zV7h0Pr/z1HOn4jqfkNIKfSVWu0JGHZSQy4MSZyT1KoxsqYPk/K/cyzSAg2Hbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=KErAzQSu; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=KErAzQSu; dkim-atps=neutral; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=xieyuanbin1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=KErAzQSu;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=KErAzQSu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=xieyuanbin1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6Cxb0TJ2z2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 21:24:01 +1100 (AEDT)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+0bnrjD1Vt8hf7jyTJXY+6HGtA8bkKy60Hegi1EeXzE=;
	b=KErAzQSuu70Kg2tunAhFZO3MBpPC7k3h5KGOAK7Yth1CwoXzqszVQ/V27rlWwZjlEuJIUlQhx
	CKQQDOlzJUQN+kjKkoOLhfLv55oAw9AARbsQL1EQcQ71tK+rikghI2bJ+0r3wYKiEWTDYlmzRSj
	qGRAkW3QKz6zi0Nss37jJuQ=
Received: from canpmsgout02.his.huawei.com (unknown [172.19.92.185])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f6CWR0B9hz1BG52
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Feb 2026 18:04:51 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+0bnrjD1Vt8hf7jyTJXY+6HGtA8bkKy60Hegi1EeXzE=;
	b=KErAzQSuu70Kg2tunAhFZO3MBpPC7k3h5KGOAK7Yth1CwoXzqszVQ/V27rlWwZjlEuJIUlQhx
	CKQQDOlzJUQN+kjKkoOLhfLv55oAw9AARbsQL1EQcQ71tK+rikghI2bJ+0r3wYKiEWTDYlmzRSj
	qGRAkW3QKz6zi0Nss37jJuQ=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4f6CQz5HsSzcZym;
	Thu,  5 Feb 2026 18:00:59 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 2777840561;
	Thu,  5 Feb 2026 18:05:24 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 5 Feb 2026 18:05:23 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <kees@kernel.org>, <andy@kernel.org>
CC: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-hardening@vger.kernel.org>, <lilinjie8@huawei.com>,
	<liaohua4@huawei.com>, <xieyuanbin1@huawei.com>
Subject: [PATCH 1/2] string: move __compiletime_strlen() to string.h
Date: Thu, 5 Feb 2026 18:05:16 +0800
Message-ID: <20260205100517.292858-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
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
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-Spam-Status: No, score=-1.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:kees@kernel.org,m:andy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lilinjie8@huawei.com,m:liaohua4@huawei.com,m:xieyuanbin1@huawei.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16627-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[xieyuanbin1@huawei.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[xieyuanbin1@huawei.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,huawei.com:dkim,huawei.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 772BCF64DF
X-Rspamd-Action: no action

Move __compiletime_strlen() to string.h, so that others can use.

Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
---
 include/linux/fortify-string.h | 15 ---------------
 include/linux/string.h         | 15 +++++++++++++++
 lib/tests/fortify_kunit.c      |  3 ++-
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
index 171982e53c9a..c181dac26353 100644
--- a/include/linux/fortify-string.h
+++ b/include/linux/fortify-string.h
@@ -58,21 +58,6 @@ void __read_overflow2_field(size_t avail, size_t wanted) __compiletime_warning("
 void __write_overflow(void) __compiletime_error("detected write beyond size of object (1st parameter)");
 void __write_overflow_field(size_t avail, size_t wanted) __compiletime_warning("detected write beyond size of field (1st parameter); maybe use struct_group()?");
 
-#define __compiletime_strlen(p)					\
-({								\
-	char *__p = (char *)(p);				\
-	size_t __ret = SIZE_MAX;				\
-	const size_t __p_size = __member_size(p);		\
-	if (__p_size != SIZE_MAX &&				\
-	    __builtin_constant_p(*__p)) {			\
-		size_t __p_len = __p_size - 1;			\
-		if (__builtin_constant_p(__p[__p_len]) &&	\
-		    __p[__p_len] == '\0')			\
-			__ret = __builtin_strlen(__p);		\
-	}							\
-	__ret;							\
-})
-
 #if defined(__SANITIZE_ADDRESS__)
 
 #if !defined(CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX) && !defined(CONFIG_GENERIC_ENTRY)
diff --git a/include/linux/string.h b/include/linux/string.h
index 1b564c36d721..fbae7d99bb6f 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -19,6 +19,21 @@ extern void *memdup_user(const void __user *, size_t) __realloc_size(2);
 extern void *vmemdup_user(const void __user *, size_t) __realloc_size(2);
 extern void *memdup_user_nul(const void __user *, size_t);
 
+#define __compiletime_strlen(p)					\
+({								\
+	char *__p = (char *)(p);				\
+	size_t __ret = SIZE_MAX;				\
+	const size_t __p_size = __member_size(p);		\
+	if (__p_size != SIZE_MAX &&				\
+	    __builtin_constant_p(*__p)) {			\
+		size_t __p_len = __p_size - 1;			\
+		if (__builtin_constant_p(__p[__p_len]) &&	\
+		    __p[__p_len] == '\0')			\
+			__ret = __builtin_strlen(__p);		\
+	}							\
+	__ret;							\
+})
+
 /**
  * memdup_array_user - duplicate array from user space
  * @src: source address in user space
diff --git a/lib/tests/fortify_kunit.c b/lib/tests/fortify_kunit.c
index fc9c76f026d6..86181e3bd994 100644
--- a/lib/tests/fortify_kunit.c
+++ b/lib/tests/fortify_kunit.c
@@ -49,7 +49,8 @@ void fortify_add_kunit_error(int write);
 #include <linux/vmalloc.h>
 
 /* Handle being built without CONFIG_FORTIFY_SOURCE */
-#ifndef __compiletime_strlen
+#if defined(__NO_FORTIFY) || !defined(__OPTIMIZE__) || !defined(CONFIG_FORTIFY_SOURCE)
+# undef __compiletime_strlen
 # define __compiletime_strlen __builtin_strlen
 #endif
 
-- 
2.51.0


