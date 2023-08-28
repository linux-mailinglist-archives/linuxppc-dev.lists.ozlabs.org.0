Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9366078BB52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 01:04:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eitMDGH3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eitMDGH3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZR2j3mRwz3c39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 09:04:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eitMDGH3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eitMDGH3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aubaker@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZN9P3wXmz2yW1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:55:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693256103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c4c200N53gZrjEvaNsh614tfBnADKQSF/1JCCxHNMoQ=;
	b=eitMDGH3zH1E9errEeYZIn/+ybgbu6UZiwVJbq2Rn6rrdPiGcAf2wc9pSKtNHbjqQnweEq
	mrTrhM12gi+kroMJgyDSwgKs98bHuI+ecbfQGBSs6DnR1q4HNLig/ENcFTaTbVJ5ZNdVNX
	Ssh+QC3nBDr2sup2NasGN60TC0D3RCE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693256103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c4c200N53gZrjEvaNsh614tfBnADKQSF/1JCCxHNMoQ=;
	b=eitMDGH3zH1E9errEeYZIn/+ybgbu6UZiwVJbq2Rn6rrdPiGcAf2wc9pSKtNHbjqQnweEq
	mrTrhM12gi+kroMJgyDSwgKs98bHuI+ecbfQGBSs6DnR1q4HNLig/ENcFTaTbVJ5ZNdVNX
	Ssh+QC3nBDr2sup2NasGN60TC0D3RCE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-W5c_rQVkOPmkKBsNiAZuDQ-1; Mon, 28 Aug 2023 16:54:59 -0400
X-MC-Unique: W5c_rQVkOPmkKBsNiAZuDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C06D8D40A9;
	Mon, 28 Aug 2023 20:54:59 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.17.39])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D01AC40C6F4C;
	Mon, 28 Aug 2023 20:54:58 +0000 (UTC)
From: Audra Mitchell <aubaker@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] Update creation of flash_block_cache to accout for potential panic
Date: Mon, 28 Aug 2023 16:54:53 -0400
Message-Id: <20230828205453.307962-1-aubaker@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Tue, 29 Aug 2023 09:03:46 +1000
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
Cc: aubaker@redhat.com, nathanl@linux.ibm.com, keescook@chromium.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With PPC builds enabling CONFIG_HARDENED_USERCOPY, interacting with the RunTime
Abstraction Services (RTAS) firmware by writing to
/proc/powerpc/rtas/firmware_flash will end up triggering the mm/usercopy.c:101
assertion:

[   38.647148] rw /proc/powerpc/rtas/firmware_flash
[   38.650254] usercopy: Kernel memory overwrite attempt detected to SLUB object 'rtas_flash_cache' (offset 0, size 34)!
[   38.650264] ------------[ cut here ]------------
[   38.650264] kernel BUG at mm/usercopy.c:101!
[   38.650267] Oops: Exception in kernel mode, sig: 5 [#1]
[   38.650283] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
[   38.650287] Modules linked in: binfmt_misc loop rfkill bonding tls sunrpc pseries_rng drm fuse drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi sg ibmveth ibmvscsi scsi_transport_srp vmx_crypto
[   38.650306] CPU: 0 PID: 12898 Comm: echo Kdump: loaded Not tainted 5.14.0-299.el9.ppc64le #1
[   38.650311] NIP:  c00000000056d870 LR: c00000000056d86c CTR: c000000000886090
[   38.650314] REGS: c0000000ba6e78c0 TRAP: 0700   Not tainted  (5.14.0-299.el9.ppc64le)
[   38.650318] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28002203  XER: 20040000
[   38.650326] CFAR: c0000000001f76fc IRQMASK: 0
[   38.650326] GPR00: c00000000056d86c c0000000ba6e7b60 c000000002b15a00 0000000000000069
[   38.650326] GPR04: c000000fff447f90 c000000fff4ccd00 000000000000000f 0000000000000027
[   38.650326] GPR08: 0000000000000000 c000000fff44adc0 0000000ffd2f0000 0000000000002000
[   38.650326] GPR12: 6174722720746365 c000000002ea0000 0000000000000000 0000000000000000
[   38.650326] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[   38.650326] GPR20: 0000000000000000 0000000000000000 0000000000000002 0000000000000001
[   38.650326] GPR24: 0000000000000000 000000012eef55a0 c0000000025f39e0 c0000000b988d000
[   38.650326] GPR28: c0000000b988d022 0000000000000022 0000000000000000 c00000000134d6e8
[   38.650366] NIP [c00000000056d870] usercopy_abort+0xb0/0xc0
[   38.650373] LR [c00000000056d86c] usercopy_abort+0xac/0xc0
[   38.650377] Call Trace:
[   38.650379] [c0000000ba6e7b60] [c00000000056d86c] usercopy_abort+0xac/0xc0 (unreliable)
[   38.650384] [c0000000ba6e7be0] [c0000000005178f0] __check_heap_object+0xf0/0x120
[   38.650389] [c0000000ba6e7c00] [c00000000056d5e0] check_heap_object+0x1f0/0x220
[   38.650394] [c0000000ba6e7c40] [c00000000056d6a0] __check_object_size+0x90/0x1b0
[   38.650399] [c0000000ba6e7c80] [c0000000000462fc] rtas_flash_write+0x11c/0x2b0
[   38.650404] [c0000000ba6e7ce0] [c00000000064d2ec] proc_reg_write+0xfc/0x160
[   38.650409] [c0000000ba6e7d10] [c000000000579e64] vfs_write+0xe4/0x390
[   38.650413] [c0000000ba6e7d60] [c00000000057a414] ksys_write+0x84/0x140
[   38.650417] [c0000000ba6e7db0] [c00000000002f314] system_call_exception+0x164/0x310
[   38.650421] [c0000000ba6e7e10] [c00000000000bfe8] system_call_vectored_common+0xe8/0x278
[   38.650426] --- interrupt: 3000 at 0x7fff87f3aa34
[   38.650430] NIP:  00007fff87f3aa34 LR: 0000000000000000 CTR: 0000000000000000
[   38.650433] REGS: c0000000ba6e7e80 TRAP: 3000   Not tainted  (5.14.0-299.el9.ppc64le)
[   38.650436] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 42002408  XER: 00000000
[   38.650446] IRQMASK: 0

This used to be caught with a warning in __check_heap_object to allow impacted
drivers time to update to kmem_cache_create_usercopy, but commit 53944f171a89d
("mm: remove HARDENED_USERCOPY_FALLBACK") removed that check. To resolve this
issue, update the creation of the flash_block_cache to use
kmem_cache_create_usercopy with a default size of RTAS_BLK_SIZE.

Signed-off-by: Audra Mitchell <aubaker@redhat.com>
---
 arch/powerpc/kernel/rtas_flash.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/rtas_flash.c b/arch/powerpc/kernel/rtas_flash.c
index a99179d83538..0a156a600f31 100644
--- a/arch/powerpc/kernel/rtas_flash.c
+++ b/arch/powerpc/kernel/rtas_flash.c
@@ -710,9 +710,9 @@ static int __init rtas_flash_init(void)
 	if (!rtas_validate_flash_data.buf)
 		return -ENOMEM;
 
-	flash_block_cache = kmem_cache_create("rtas_flash_cache",
+	flash_block_cache = kmem_cache_create_usercopy("rtas_flash_cache",
 					      RTAS_BLK_SIZE, RTAS_BLK_SIZE, 0,
-					      NULL);
+					      0, RTAS_BLK_SIZE, NULL);
 	if (!flash_block_cache) {
 		printk(KERN_ERR "%s: failed to create block cache\n",
 				__func__);
-- 
2.40.1

