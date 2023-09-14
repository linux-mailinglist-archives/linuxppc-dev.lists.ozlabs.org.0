Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A24979F5CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 02:11:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FO1T9tBV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmHmr4Jb3z3cNP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 10:11:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FO1T9tBV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::d9; helo=out-217.mta0.migadu.com; envelope-from=kent.overstreet@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 554 seconds by postgrey-1.37 at boromir; Thu, 14 Sep 2023 10:10:51 AEST
Received: from out-217.mta0.migadu.com (out-217.mta0.migadu.com [IPv6:2001:41d0:1004:224b::d9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmHlv72C2z30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 10:10:51 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1694649682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7V/75YsHRAvFqtDz9Sm5Y3H3QzD8ohISD1gCsWY/c/I=;
	b=FO1T9tBV+zwuOkhm2oCjJDtzcxxobP3syHxI09ioWhJDYonSLAigNZjJNmJJKbYLMWmMCd
	e6+rJrGFIju0jiefWsBhQsAKuST2qn+aoJljYxqNo4cWaoHTnWoSCQulYAEYYfKfG2Ff8j
	6aCIslqCkc4GtC6zQpHOML9tx97E6+Q=
From: Kent Overstreet <kent.overstreet@linux.dev>
To: linux-bcachefs@vger.kernel.org
Subject: [PATCH] powerpc: Export kvm_guest static key, for bcachefs six locks
Date: Wed, 13 Sep 2023 20:01:15 -0400
Message-Id: <20230914000115.1035594-1-kent.overstreet@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Kent Overstreet <kent.overstreet@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

bcachefs's six locks need kvm_guest, via
 ower_on_cpu() ->  vcpu_is_preempted() -> is_kvm_guest()

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/firmware.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/firmware.c b/arch/powerpc/kernel/firmware.c
index 20328f72f9f2..8987eee33dc8 100644
--- a/arch/powerpc/kernel/firmware.c
+++ b/arch/powerpc/kernel/firmware.c
@@ -23,6 +23,8 @@ EXPORT_SYMBOL_GPL(powerpc_firmware_features);
 
 #if defined(CONFIG_PPC_PSERIES) || defined(CONFIG_KVM_GUEST)
 DEFINE_STATIC_KEY_FALSE(kvm_guest);
+EXPORT_SYMBOL_GPL(kvm_guest);
+
 int __init check_kvm_guest(void)
 {
 	struct device_node *hyper_node;
-- 
2.40.1

