Return-Path: <linuxppc-dev+bounces-17364-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2B9nKABVoWk+sQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17364-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 09:25:36 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D79A1B4828
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 09:25:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMhGh1g3Dz2xMt;
	Fri, 27 Feb 2026 19:25:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772180732;
	cv=none; b=NLhBGerACqFs4wYM5N6eIsRCcMycyyLKB8s1O3kdF+oWGQ1hvrXo9ZtfO1gO57YiCpe4nVELGUrYSwyhUfCiHG27DEj3p9x/E6HwdouhCGdAPDKut/aQmXgTLVpZK2EmmvnVPx++u/Q3FlOth+6P0AkwcyK+6Errvg3X60vIcyDIc3pfzIoTuFXJEgQarQsRT7yhjv1I+92y8P7ID/YyAdXPdMelfHNoXaW3U8ulyow3oTX0hKCeM/UW/Ao5Did6ExyfTCneQjAwvg8vSewTr/F+Fw5XogIzEOWtsmBPGP3qFDgTu+IaFMwvrF20t74Ag0+8Kjp1z8so5mrzOzuNkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772180732; c=relaxed/relaxed;
	bh=/Fh2/7Q0VX79mlypXDHnI3a7+14V5syTjjpTGCvuVa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=lbJRLe7t2JhezH6cBnToCL35zljhJx3WNfAAJqSQBo1/dkQDqotNpzk2VeDpE/q8jKks0QsRcHTAIRJQ9j2RVPPC4n2PBgbgARcWfmje28fPPqxc0BZdVHTHXTT4Uapm5UZ+WfM7uIwiumZ+bwgiXz1REj9lYseyMHr7Tc9RFdt/o2N2VoUYQYnqpbN4lC0P54C3smYkiZfz7I1YsShlydSh5IvpjhmsO2/hl2F9N6aBRxbnQRRJAQ9U/Vq/qusq+99RtOGUbmC2SC2A4+BCuPjh171NcT3QJUTbgIIEo2MRex0gB7ip5U85Yqk5Iq9OmDTzYJhnxEwXJSj1wC4a+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I71OL5Hj; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I71OL5Hj; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vmalik@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I71OL5Hj;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I71OL5Hj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vmalik@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMhGf62H5z2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 19:25:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772180725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/Fh2/7Q0VX79mlypXDHnI3a7+14V5syTjjpTGCvuVa4=;
	b=I71OL5Hj9cJZJXLkzIulM3pXOcDK4O6+t/fOeA3yUHacscQuRnfqnj/bDTRuHgPVQJ3ATW
	/JrhUzqMoquBJBoEjRzT0k2e1NjVr6xOUUb8pP9iFDY6DJDd1SRHcaRSHRYaQ4y2ZgY3LK
	eSY1URbIwhJB+4ekTHHLoAW6dzxUewU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772180725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/Fh2/7Q0VX79mlypXDHnI3a7+14V5syTjjpTGCvuVa4=;
	b=I71OL5Hj9cJZJXLkzIulM3pXOcDK4O6+t/fOeA3yUHacscQuRnfqnj/bDTRuHgPVQJ3ATW
	/JrhUzqMoquBJBoEjRzT0k2e1NjVr6xOUUb8pP9iFDY6DJDd1SRHcaRSHRYaQ4y2ZgY3LK
	eSY1URbIwhJB+4ekTHHLoAW6dzxUewU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-482-U7gNmmNNO8W1zaIhia_HBQ-1; Fri,
 27 Feb 2026 03:25:21 -0500
X-MC-Unique: U7gNmmNNO8W1zaIhia_HBQ-1
X-Mimecast-MFC-AGG-ID: U7gNmmNNO8W1zaIhia_HBQ_1772180719
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E402018002C3;
	Fri, 27 Feb 2026 08:25:18 +0000 (UTC)
Received: from vmalik-fedora.redhat.com (unknown [10.44.32.91])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 652701800370;
	Fri, 27 Feb 2026 08:25:13 +0000 (UTC)
From: Viktor Malik <vmalik@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Joe Perches <joe@perches.com>,
	Viktor Malik <vmalik@redhat.com>,
	Paul Mackerras <paulus@ozlabs.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH] powerpc, perf: Check that current->mm is alive before getting user callchain
Date: Fri, 27 Feb 2026 09:25:02 +0100
Message-ID: <20260227082502.1882395-1-vmalik@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: f6JnTT6j4sOZ8rbmNqjH0jqniQEAxBvzQNuIty_ulJ0_1772180719
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,perches.com,redhat.com,ozlabs.org,kernel.crashing.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17364-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[vmalik@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0D79A1B4828
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

Fixes: 20002ded4d93 ("perf_counter: powerpc: Add callchain support")
Signed-off-by: Viktor Malik <vmalik@redhat.com>
---
 arch/powerpc/perf/callchain_32.c | 3 +++
 arch/powerpc/perf/callchain_64.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
index ddcc2d8aa64a..b46e21679566 100644
--- a/arch/powerpc/perf/callchain_32.c
+++ b/arch/powerpc/perf/callchain_32.c
@@ -144,6 +144,9 @@ void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
 	sp = regs->gpr[1];
 	perf_callchain_store(entry, next_ip);
 
+	if (!current->mm)
+		return;
+
 	while (entry->nr < entry->max_stack) {
 		fp = (unsigned int __user *) (unsigned long) sp;
 		if (invalid_user_sp(sp) || read_user_stack_32(fp, &next_sp))
diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
index 115d1c105e8a..eaaadd6fa81b 100644
--- a/arch/powerpc/perf/callchain_64.c
+++ b/arch/powerpc/perf/callchain_64.c
@@ -79,6 +79,9 @@ void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
 	sp = regs->gpr[1];
 	perf_callchain_store(entry, next_ip);
 
+	if (!current->mm)
+		return;
+
 	while (entry->nr < entry->max_stack) {
 		fp = (unsigned long __user *) sp;
 		if (invalid_user_sp(sp) || read_user_stack_64(fp, &next_sp))
-- 
2.53.0


