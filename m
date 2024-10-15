Return-Path: <linuxppc-dev+bounces-2247-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F3D99DB90
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 03:34:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSGpc3pTQz2xCd;
	Tue, 15 Oct 2024 12:34:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728956040;
	cv=none; b=iD75uVf+uBRmVVnq2RaHpAc45p2m7jtBUMvNKs0Hl13asnDcY8q2ER9C17/o6gWSFccaPyYq8R/87DCIVR+07GrAwnoto3U1j8a9Z2yyu9nSexTfqbEd9KnirJOWw84fu7qYbFzeEfMyx7+dBwoiwK2ljY1SV3YaRR5sm3rGbCMenu5PMjlpEHdHIl5UaUEx32aW35oC5urY6KAX0lgLFh0gJuy6eFkq9fvcBjUrtMdGYuHiN/s5I+IPj+TRHThillRWayMTF9olYgZ0oLqMfma9TjI+AlxCutd3xMB4VlZ4VBuXACTN+jJUAXjPYDEUF7sUnk/l6S9DD2+hzsZInQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728956040; c=relaxed/relaxed;
	bh=2IOurK7ENej5lHHiP4d73lr8yQG82cdevQPBO00m0fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MC6TGThHp0a7dGqcx02Kq+Ca9pYnvd/W7qhNxdH0YZ6NyClo+E+pLmLcFTI7yLRLHR+8vrOQ89dDc1MhG8itcyUrYviMSEObe8FVjvrJEV6gzN8a980X1fY4iTx2pBbsacrkzXFColWDY3pVsQn/j8sUdFFbHPjEDynLuK4qnFu1wFTxGGro2d2w0qjcOAQhAwvvS5g+fMdAMv+Jn7/ryIxtRoPi/sfDCNw31evtVfXFG+6fwpI4qcRwzotTFZXWTqMl5RTa2KpURzMTeeKJKQQQgazj34lh7o9IFFuo9mzN3Gw/O5DdZWqJmSzUaD9XzAKbWTogOgObwVdPG5uyCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OVosT30T; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OVosT30T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSGpb4Zvlz2xCC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 12:33:59 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71e52582cf8so1557227b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 18:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728956037; x=1729560837; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IOurK7ENej5lHHiP4d73lr8yQG82cdevQPBO00m0fo=;
        b=OVosT30Tl8MTxylLp91E53f0JVa2L/1RvZHme2ZLUnJUeMHKZV4vPomVnP/Hkxe5tL
         WAMh8YLmBoJo+CY8/7mc0oCom36rVl8jN5SXyIzCKWRu727H6YmeXlGImzSfeodzTjLd
         CWbMBBWMwQd9FsZMvQfPio+xVRVMyefmMGt6VsuKDF929vsYA9pwk6rBpDyqXBLvQDgt
         AUi9OSSfAF+kvRPB6fh1RWYUIGGzSn4j8hZGBzCMIbwUY7fSaNoCUiHGj//JySngTcaG
         kQcunbK6YTT8XFOvETQEdTVeYyZyAVvPjCoMAx+2/d9kg9vttIPHZ9T8vyAi7ZjJsXZW
         8EQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728956037; x=1729560837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IOurK7ENej5lHHiP4d73lr8yQG82cdevQPBO00m0fo=;
        b=PIuNqPJOku+sy0FPtmF1+LnPBPtfg1UTKBmlEQN6g8gSY7Pgj2PhGf7uJClcx5pLf1
         EJxQV9IaK/E2hBMPYmyq1VDgdXWKRhWDo1vQlsfU83LZ//EY3zhPfwy20V1mQNkKlGGY
         nEz0a4sBqFs06ehG6wpOKiPtOmyRLZhbkIwezRxWrcRhNBIgJA65/LzdUBk4gwz8tl68
         zrbl9QFmD4Rn94CTF6qsh1fin2KzKT40Rl7IHa4ZBcNeOBB7VpcdZxC37RBJsWr0tjuf
         GWSblvoTHJDCWSJigHDp48Vsjs3nbqIJ6EXJHL4dPJZcCMIY8slyE6FHFJnomdGVOwYf
         l3oQ==
X-Gm-Message-State: AOJu0Yz2n+Pdy3xEXXDZWseZoBDFrgd+cP+fepZIjgiuwx5ugyKyWWJ1
	k6twlSA1SUsKwKCwieLw5JSognXPDk8DntmjKGvgTJtkspkmWcqmIS1png==
X-Google-Smtp-Source: AGHT+IE+s7PAXjF3lV5jJ2AuCaaz/0o7aAW2i8sfMGGFqoeg6aQJcAwijtM1PaQhSx1fjTwLZ36lFg==
X-Received: by 2002:a05:6a00:174b:b0:71e:148c:4611 with SMTP id d2e1a72fcca58-71e4c13a1d0mr15707237b3a.6.1728956036726;
        Mon, 14 Oct 2024 18:33:56 -0700 (PDT)
Received: from dw-tp.. ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77508562sm189349b3a.186.2024.10.14.18.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 18:33:56 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Disha Goel <disgoel@linux.ibm.com>
Subject: [RFC RESEND v2 02/13] powerpc: mm: Fix kfence page fault reporting
Date: Tue, 15 Oct 2024 07:03:25 +0530
Message-ID: <6bf523aa03e72d701d24aca49b51864331eed2d5.1728954719.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1728954719.git.ritesh.list@gmail.com>
References: <cover.1728954719.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

copy_from_kernel_nofault() can be called when doing read of /proc/kcore.
/proc/kcore can have some unmapped kfence objects which when read via
copy_from_kernel_nofault() can cause page faults. Since *_nofault()
functions define their own fixup table for handling fault, use that
instead of asking kfence to handle such faults.

Hence we search the exception tables for the nip which generated the
fault. If there is an entry then we let the fixup table handler handle the
page fault by returning an error from within ___do_page_fault().

This can be easily triggered if someone tries to do dd from /proc/kcore.
dd if=/proc/kcore of=/dev/null bs=1M

<some example false negatives>
===============================
BUG: KFENCE: invalid read in copy_from_kernel_nofault+0xb0/0x1c8
Invalid read at 0x000000004f749d2e:
 copy_from_kernel_nofault+0xb0/0x1c8
 0xc0000000057f7950
 read_kcore_iter+0x41c/0x9ac
 proc_reg_read_iter+0xe4/0x16c
 vfs_read+0x2e4/0x3b0
 ksys_read+0x88/0x154
 system_call_exception+0x124/0x340
 system_call_common+0x160/0x2c4

BUG: KFENCE: use-after-free read in copy_from_kernel_nofault+0xb0/0x1c8
Use-after-free read at 0x000000008fbb08ad (in kfence-#0):
 copy_from_kernel_nofault+0xb0/0x1c8
 0xc0000000057f7950
 read_kcore_iter+0x41c/0x9ac
 proc_reg_read_iter+0xe4/0x16c
 vfs_read+0x2e4/0x3b0
 ksys_read+0x88/0x154
 system_call_exception+0x124/0x340
 system_call_common+0x160/0x2c4

Guessing the fix should go back to when we first got kfence on PPC32.

Fixes: 90cbac0e995d ("powerpc: Enable KFENCE for PPC32")
Reported-by: Disha Goel <disgoel@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/fault.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 81c77ddce2e3..fa825198f29f 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -439,9 +439,17 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	/*
 	 * The kernel should never take an execute fault nor should it
 	 * take a page fault to a kernel address or a page fault to a user
-	 * address outside of dedicated places
+	 * address outside of dedicated places.
+	 *
+	 * Rather than kfence reporting false negatives, let the fixup table
+	 * handler handle the page fault by returning SIGSEGV, if the fault
+	 * has come from functions like copy_from_kernel_nofault().
 	 */
 	if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address, is_write))) {
+
+		if (search_exception_tables(instruction_pointer(regs)))
+			return SIGSEGV;
+
 		if (kfence_handle_page_fault(address, is_write, regs))
 			return 0;
 
-- 
2.46.0


