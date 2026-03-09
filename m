Return-Path: <linuxppc-dev+bounces-17921-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePYnACYOr2njNAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17921-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:15:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E26823E6CA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:15:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV4t64Y0Mz3cCh;
	Tue, 10 Mar 2026 05:14:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773080094;
	cv=none; b=nLVCBFEPlOv6WZcOBIJq3fl5BDoSsh6sYvoNlmxY1y4eVhfqQdK95sYig2FYRSUyfUXT5BYdihJH1/8+nBOPB9972RQVdBLY4y2XjOy1Q3CPizo1h/KpTkQINKKh+2/ZBBTTeUXQ0DPqsSWyFVVgi457T9MvIcIddOY6CVaEzOnYseOYX3s9qhSiEYz3TMp3PVpQgsm/uL076UcZ3yQZPLgeOUvSz7wd34hu6Y9StBDhoW9FzpdvEaPgAaQx+pI/D1IL5R/lDMKdP+tZ8Qej+F3favZqurCMRTeq80AdSqOeiGOZHwQnoR8npTJkwELXj1hwrtPFcnm4IO8H0IoQ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773080094; c=relaxed/relaxed;
	bh=3MBax5iE+Q4wtvNgOLJBXJe7HKlSHH0ur1TR2F8EkWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oU9EiLh64GYW3Wk7PCYLq+Ps2yfJ6wvB0mNcGYvTGFqJijHWWvXW055vXOYJlIZfiic0jPhuNX8I9U0pAenOXAgsjkQOqljdhuJLkI++hO6VBpEBzDRgi85A+gw/zv4BIlKC9M4GjkbszeQ16O+f2JSQgtCu9wHsNS3udcAxMR6KSaCWh1CXAEBTXlGBH3QOK7DwX7GqdGBijvgpivTNE0Gp2vxzypvxdLZE6uZQrD6C39hJlraNsmUvWewwZgTJvGmHuGYSHEJoeljc5vAvRDlclXlWVoEFikSlR9qPSqDibhqcs6e4i1fsgNUpzYC24MKFUArVD2PYrweiv1plTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VYannn4w; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VYannn4w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV4t56D80z3c8h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 05:14:53 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8296d553142so2720740b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 11:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773080091; x=1773684891; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MBax5iE+Q4wtvNgOLJBXJe7HKlSHH0ur1TR2F8EkWc=;
        b=VYannn4w3Hk+VwFG67QGx3wVjgZkOPNR/QZohgJEO4pME1z+D6fuR87ShQacbGr70Z
         yX04gwp5wZr4MSnr7YNWHLPjjAsec8G6QsdAw+YhyngGENlb0s3ILzWPKURhNVUNI9E5
         8vY4shDBrSgTZE758XTF5W/qY/FDBIoFZRuLUVqNZCZdyA9rBjJS/ofSAh4YG3OQ9ESb
         A/9PLKlH3EDJEIvh+DrzVFk0ff2ibamck6wo+ZrBz2w56mSZc7G1hDJBAJ1YdcGJRF35
         vgoE/FnbDeCL62AHqd4PHubjLPMUa/mqv1rSnc7GNz0Yo3chzniOKKJotYC9d/C6eyyp
         md6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080091; x=1773684891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3MBax5iE+Q4wtvNgOLJBXJe7HKlSHH0ur1TR2F8EkWc=;
        b=YB6iTiNLfLJXG6eHzI7jMiSue3Sybii4d3Q22bo++0LhQlPDYJFeDQmC4tGjSZMwEE
         MkmStvrKr+7kEaK3Gsf/DaXfmPKy7ut2tHJTnuP01qHvWtGPzaFPHOtNFW8mCrzRWxL5
         N1Pdp2pJhihUY/w0Y/0uLEC2Xdl6auYP7f7TqiO+wi8gTGw2+2ipNbKgFRy4QJx3msXc
         zgWGg9CjmoV6bhMoyksDEVT0OMw+8brYhnZuVj7waBqzsk4QXViJj7OKsY+W8SZvm+Jf
         +wa1UznQYXClZrjFeyhXznzK0ksWAin1oJL2+L7/GIgO9SGp8mHlKJ/ScFTNt4S14upv
         mIHA==
X-Gm-Message-State: AOJu0YyHoEb9tWG4W++E8oBc7BU70i+RxRD1RnA3tIicUC1fwnUNgJCD
	uKA6Da/6MI7vcc2xon8rmNsw6XxhjMqgAVIDuzdN9YJC/3Fq+FV+EFAxj8WtLuty
X-Gm-Gg: ATEYQzxJe0cRYO00i5cnpiN6Q0EkWPZENxyZjAd/fdRSGnOjOkRQu7Xu5lRATfXegk/
	zoRdBbALFj5XcW91DJTPAUOTbfYY4aS5UbiUTxS6SRwf6rhr5euFsYdfqkRobjVroYm/z3DQE6C
	YcaZi8tGjNHEHIRsSeE96eDnc6uCvdSXw4+nE+2K1O21HGp2EZAykZUFwaFK7QvcbkjJSSUXDno
	cFHbDSuLAgsHCCxTrEKhQDzBfb+qP+MBZDNxXHRcR1vMemDDFrY0KtFpVAc8hpK/SyPKpDsp5w/
	yPPltzip+B1fANKprlYkuDQvX4VR/eoTD7uH/uOTRP25gXWA1VwxwAfnvxwVMwPHXuce5RsDSog
	1CAtgw+C9FP9tyNUA3gQ4nxeDLGJYEVLHjGlOYHa+TEHiBtxpGf7MN7/qfkI+pBgIXzMnu7wzUL
	3PrhqBe6z8mqUnxrU/tjuT2ubic67rmKlPJAZYnJSyoZ4WfYSxb6Tzsj5zXBATyvub
X-Received: by 2002:a05:6a00:1f10:b0:81f:852b:a925 with SMTP id d2e1a72fcca58-829a2d86e1fmr10763933b3a.1.1773080091290;
        Mon, 09 Mar 2026 11:14:51 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f29:53c8:742c:4036:d7c6:9024])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm10775477b3a.29.2026.03.09.11.14.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Mar 2026 11:14:50 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sayali Patil <sayalip@linux.ibm.com>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 01/10] powerpc/pgtable-frag: Fix bad page state in pte_frag_destroy
Date: Mon,  9 Mar 2026 23:44:24 +0530
Message-ID: <ee13e7f99b8f258019da2b37655b998e73e5ef8b.1773078178.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1773078178.git.ritesh.list@gmail.com>
References: <cover.1773078178.git.ritesh.list@gmail.com>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 2E26823E6CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17921-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

powerpc uses pt_frag_refcount as a reference counter for tracking it's
pte and pmd page table fragments. For PTE table, in case of Hash with
64K pagesize, we have 16 fragments of 4K size in one 64K page.

Patch series [1] "mm: free retracted page table by RCU"
added pte_free_defer() to defer the freeing of PTE tables when
retract_page_tables() is called for madvise MADV_COLLAPSE on shmem
range.
[1]: https://lore.kernel.org/all/7cd843a9-aa80-14f-5eb2-33427363c20@google.com/

pte_free_defer() sets the active flag on the corresponding fragment's
folio & calls pte_fragment_free(), which reduces the pt_frag_refcount.
When pt_frag_refcount reaches 0 (no active fragment using the folio), it
checks if the folio active flag is set, if set, it calls call_rcu to
free the folio, it the active flag is unset then it calls pte_free_now().

Now, this can lead to following problem in a corner case...

[  265.351553][  T183] BUG: Bad page state in process a.out  pfn:20d62
[  265.353555][  T183] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x20d62
[  265.355457][  T183] flags: 0x3ffff800000100(active|node=0|zone=0|lastcpupid=0x7ffff)
[  265.358719][  T183] raw: 003ffff800000100 0000000000000000 5deadbeef0000122 0000000000000000
[  265.360177][  T183] raw: 0000000000000000 c0000000119caf58 00000000ffffffff 0000000000000000
[  265.361438][  T183] page dumped because: PAGE_FLAGS_CHECK_AT_FREE flag(s) set
[  265.362572][  T183] Modules linked in:
[  265.364622][  T183] CPU: 0 UID: 0 PID: 183 Comm: a.out Not tainted 6.18.0-rc3-00141-g1ddeaaace7ff-dirty #53 VOLUNTARY
[  265.364785][  T183] Hardware name: IBM pSeries (emulated by qemu) POWER10 (architected) 0x801200 0xf000006 of:SLOF,git-ee03ae pSeries
[  265.364908][  T183] Call Trace:
[  265.364955][  T183] [c000000011e6f7c0] [c000000001cfaa18] dump_stack_lvl+0x130/0x148 (unreliable)
[  265.365202][  T183] [c000000011e6f7f0] [c000000000794758] bad_page+0xb4/0x1c8
[  265.365384][  T183] [c000000011e6f890] [c00000000079c020] __free_frozen_pages+0x838/0xd08
[  265.365554][  T183] [c000000011e6f980] [c0000000000a70ac] pte_frag_destroy+0x298/0x310
[  265.365729][  T183] [c000000011e6fa30] [c0000000000aa764] arch_exit_mmap+0x34/0x218
[  265.365912][  T183] [c000000011e6fa80] [c000000000751698] exit_mmap+0xb8/0x820
[  265.366080][  T183] [c000000011e6fc30] [c0000000001b1258] __mmput+0x98/0x300
[  265.366244][  T183] [c000000011e6fc80] [c0000000001c81f8] do_exit+0x470/0x1508
[  265.366421][  T183] [c000000011e6fd70] [c0000000001c95e4] do_group_exit+0x88/0x148
[  265.366602][  T183] [c000000011e6fdc0] [c0000000001c96ec] pid_child_should_wake+0x0/0x178
[  265.366780][  T183] [c000000011e6fdf0] [c00000000003a270] system_call_exception+0x1b0/0x4e0
[  265.366958][  T183] [c000000011e6fe50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec

The bad page state error occurs when such a folio gets freed (with
active flag set), from do_exit() path in parallel.

... this can happen when the pte fragment was allocated from this folio,
but when all the fragments get freed, the pte_frag_refcount still had some
unused fragments. Now, if this process exits, with such folio as it's cached
pte_frag in mm->context, then during pte_frag_destroy(), we simply call
pagetable_dtor() and pagetable_free(), meaning it doesn't clear the
active flag. This, can lead to the above bug. Since we are anyway in
do_exit() path, then if the refcount is 0, then I guess it should be
ok to simply clear the folio active flag before calling pagetable_dtor()
& pagetable_free().

Fixes: 32cc0b7c9d50 ("powerpc: add pte_free_defer() for pgtables sharing page")
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/pgtable-frag.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
index 77e55eac16e4..ae742564a3d5 100644
--- a/arch/powerpc/mm/pgtable-frag.c
+++ b/arch/powerpc/mm/pgtable-frag.c
@@ -25,6 +25,7 @@ void pte_frag_destroy(void *pte_frag)
 	count = ((unsigned long)pte_frag & ~PAGE_MASK) >> PTE_FRAG_SIZE_SHIFT;
 	/* We allow PTE_FRAG_NR fragments from a PTE page */
 	if (atomic_sub_and_test(PTE_FRAG_NR - count, &ptdesc->pt_frag_refcount)) {
+		folio_clear_active(ptdesc_folio(ptdesc));
 		pagetable_dtor(ptdesc);
 		pagetable_free(ptdesc);
 	}
-- 
2.50.1 (Apple Git-155)


