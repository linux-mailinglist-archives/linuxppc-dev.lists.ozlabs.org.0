Return-Path: <linuxppc-dev+bounces-17907-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG0NOAfcrmm/JQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17907-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 15:41:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBB523AB7A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 15:41:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV07S02Zsz3bnm;
	Tue, 10 Mar 2026 01:41:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773067267;
	cv=none; b=oK/wEH4PaqKfnMZ3Fw9Ob9FN8WeShlA7GFPhi1ncySBVZQto4t8U5wvii4UTtBZW1LmPx5/uWgZkY5Df9tqLFZPgxxdELVO6zsGeutkoy49UgkpfF1Roi+7/ta63u2cLUXCXQUyJi1bv/UZ3xxKEeJ+3eLf9XqJegfxbvnJSDsF02V9msmN2ZgQewE0p65r7RJIRsTthL3Ymwapi99QtF+Mv32wpwNbcxKGVkNAmx7fBtF8c+ldHWKv6GvRBkj80bFhGeDIuUJRCbr/N9dyr1nY63Z9JSyf83RjFv6rbMZbmPKjlt+ABFfXTwg8hC0k/+kKkPLLUzaiJD2TgwrA4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773067267; c=relaxed/relaxed;
	bh=WMybaLJ1g6OpaWYjNvsRlqGDthhuaVaSCXgy/H4L5M8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=nVnd/lql/RZEe76+0bB16M51UVyYfgMZgM+oD89LhcH62Lcf+lmz1lyWh5B5NwIQDw7bpxFgkfrcKiqeXzK0RsN0TT6l8UCAQV8KvPmoaYpr5oiOmqxFNLPlESKQ7/yBEMab1AkL9Nstbq3W0W0TJOuajAKG8xBj/hw/2W5ZPIoJFOOouR1mekXnThtWAnv0MWvU+Mz+0saLZL3UKUTIQKkz/lJPhSIEVMJy99kjddKgFlNepeHq7G8RsYlD/tEXfosRVgXujOKg0xVsD1Jj5GQk96n0ZFC6N4ZYnjPULuLOrfMOEvZYQwcOM5loy1UXQQgluayxmMUi9+mDTEQ4lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YJV4zGo5; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YJV4zGo5; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vmalik@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YJV4zGo5;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YJV4zGo5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vmalik@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV07Q5clLz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 01:41:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WMybaLJ1g6OpaWYjNvsRlqGDthhuaVaSCXgy/H4L5M8=;
	b=YJV4zGo5lEcrcRBKtliyhJ1ylnkS24ewFJoZ8h29qAslfbYR/v9TfFnO9hfh6nTUQ+M/dl
	1XuZ/1RWhTwO7Y/euIqYhVVM037W+liniJhPu07wMbXlWNKBdemNlWrG6KBX0oTTU6f8Ew
	kLK7Dq4hOXofc8qqGIJ1xJ8ypXUUbHw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WMybaLJ1g6OpaWYjNvsRlqGDthhuaVaSCXgy/H4L5M8=;
	b=YJV4zGo5lEcrcRBKtliyhJ1ylnkS24ewFJoZ8h29qAslfbYR/v9TfFnO9hfh6nTUQ+M/dl
	1XuZ/1RWhTwO7Y/euIqYhVVM037W+liniJhPu07wMbXlWNKBdemNlWrG6KBX0oTTU6f8Ew
	kLK7Dq4hOXofc8qqGIJ1xJ8ypXUUbHw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-V_CeawzUPCSsTTzOUpp3KA-1; Mon,
 09 Mar 2026 10:40:57 -0400
X-MC-Unique: V_CeawzUPCSsTTzOUpp3KA-1
X-Mimecast-MFC-AGG-ID: V_CeawzUPCSsTTzOUpp3KA_1773067256
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 919BE18002C9;
	Mon,  9 Mar 2026 14:40:55 +0000 (UTC)
Received: from vmalik-fedora.redhat.com (unknown [10.45.225.182])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C36D0180035F;
	Mon,  9 Mar 2026 14:40:50 +0000 (UTC)
From: Viktor Malik <vmalik@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Viktor Malik <vmalik@redhat.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@ozlabs.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Saket Kumar Bhaskar <skb99@linux.ibm.com>
Subject: [PATCH v2] powerpc, perf: Check that current->mm is alive before getting user callchain
Date: Mon,  9 Mar 2026 15:40:45 +0100
Message-ID: <20260309144045.169427-1-vmalik@redhat.com>
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
X-Mimecast-MFC-PROC-ID: CaU2MweukjJDzHGeqATAyFXTYBvOfEFv_zA3p4b-q-c_1773067256
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 9BBB523AB7A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17907-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,redhat.com,kernel.crashing.org,ozlabs.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[vmalik@redhat.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

It may happen that mm is already released, which leads to kernel panic.
This adds the NULL check for current->mm, similarly to 20afc60f892d
("x86, perf: Check that current->mm is alive before getting user
callchain").

I was getting this panic when running a profiling BPF program
(profile.py from bcc-tools):

    [26215.051935] Kernel attempted to read user page (588) - exploit attempt? (uid: 0)
    [26215.051950] BUG: Kernel NULL pointer dereference on read at 0x00000588
    [26215.051952] Faulting instruction address: 0xc00000000020fac0
    [26215.051957] Oops: Kernel access of bad area, sig: 11 [#1]
    [...]
    [26215.052049] Call Trace:
    [26215.052050] [c000000061da6d30] [c00000000020fc10] perf_callchain_user_64+0x2d0/0x490 (unreliable)
    [26215.052054] [c000000061da6dc0] [c00000000020f92c] perf_callchain_user+0x1c/0x30
    [26215.052057] [c000000061da6de0] [c0000000005ab2a0] get_perf_callchain+0x100/0x360
    [26215.052063] [c000000061da6e70] [c000000000573bc8] bpf_get_stackid+0x88/0xf0
    [26215.052067] [c000000061da6ea0] [c008000000042258] bpf_prog_16d4ab9ab662f669_do_perf_event+0xf8/0x274
    [...]

In addition, move storing the top-level stack entry to generic
perf_callchain_user to make sure the top-evel entry is always captured,
even if current->mm is NULL.

Fixes: 20002ded4d93 ("perf_counter: powerpc: Add callchain support")
Signed-off-by: Viktor Malik <vmalik@redhat.com>
---
Changes in v2:
- Move call to perf_callchain_store() for the top-level stack entry to
  common perf_callchain_user (Saket)

 arch/powerpc/perf/callchain.c    | 5 +++++
 arch/powerpc/perf/callchain_32.c | 1 -
 arch/powerpc/perf/callchain_64.c | 1 -
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 26aa26482c9a..992cc5c98214 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -103,6 +103,11 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 void
 perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
 {
+	perf_callchain_store(entry, perf_arch_instruction_pointer(regs));
+
+	if (!current->mm)
+		return;
+
 	if (!is_32bit_task())
 		perf_callchain_user_64(entry, regs);
 	else
diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
index ddcc2d8aa64a..0de21c5d272c 100644
--- a/arch/powerpc/perf/callchain_32.c
+++ b/arch/powerpc/perf/callchain_32.c
@@ -142,7 +142,6 @@ void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
 	next_ip = perf_arch_instruction_pointer(regs);
 	lr = regs->link;
 	sp = regs->gpr[1];
-	perf_callchain_store(entry, next_ip);
 
 	while (entry->nr < entry->max_stack) {
 		fp = (unsigned int __user *) (unsigned long) sp;
diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
index 115d1c105e8a..30fb61c5f0cb 100644
--- a/arch/powerpc/perf/callchain_64.c
+++ b/arch/powerpc/perf/callchain_64.c
@@ -77,7 +77,6 @@ void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
 	next_ip = perf_arch_instruction_pointer(regs);
 	lr = regs->link;
 	sp = regs->gpr[1];
-	perf_callchain_store(entry, next_ip);
 
 	while (entry->nr < entry->max_stack) {
 		fp = (unsigned long __user *) sp;
-- 
2.53.0


