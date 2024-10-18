Return-Path: <linuxppc-dev+bounces-2381-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3079A44A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:30:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVWtr49P9z3bqq;
	Sat, 19 Oct 2024 04:30:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729272628;
	cv=none; b=Omy+sYFkVsr5mG5quQvxGBii8jth/Wqwzh8wK6eYJGH6Qog0gqRtEUYjG8PJ/iBFR1cUOihiM4supkYgM3fRGWZLoxgM0VSyVnFpbtxlejvbJmgGj4/qN+c6gMoQi+EpGuNPu81kYkfqaSS3wevw0odnwtbAF+CQdFYOBJCH7veYqPqwVGVB7YaBQLJSMOSUXUKCi3JxIQayywNyA5EzD62jV9B4PBhiT4pFj+UjrcrtHOHE1vsaYCFIpxYJWZoROb/u1diB9Kc+QOEGc27i35cl3D5gUzEePhgbdHNmQTJ9/Iz9Eb8z8Nl1P09RucfFRZqDx2A5b2gxCins4rqC9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729272628; c=relaxed/relaxed;
	bh=ZFpXrhpElIx5U0caqw8WXCQdQvrJMpAq6qiRpCPXwmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KXVoiwZyFan5gbllYQqLy04NRIRpzIIoxLGwoZ9j9Pj/OxPU4sD0dBuzUHShQgrpxUFT7hf93Il0ypiVrJySj+7BbFy6BGBrndXncu09fFzqQEnSCi7xT6Xc6P8S48uT5JTlWXj2jEfmVlIN0b2NzKTrqqiE7MfYM/UUtCbQUg6oMakpVTbJwOeUBLOl9v6n6qrcyG0Ovat32hPObKS1bQ6gb6ugcLjUC2O6q87rkMwGCJMKWjeL/AOGfzPBPKNJnbUf1pekMq5Drv8ErwCEfXrnvFu3loY5PvWj0lQqZDV0CJkGnZVFP3XB6JkLGbTt8LALlbHbpnSIIdGKo7sVFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IxlT4Tro; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IxlT4Tro;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVWtq4qSvz2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:30:27 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso1564987b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 10:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729272624; x=1729877424; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFpXrhpElIx5U0caqw8WXCQdQvrJMpAq6qiRpCPXwmQ=;
        b=IxlT4TrobW5zsAW/RQ8zF/ECxIUWNpGTCr+O02+pEniwLqZ3JySjZ3dVWhnW39V5IE
         j6wl0KDrvmXBe91BDmdqw53uDycBUvcrkGswJWEvydny+5LlC974Y8qDUZip0YaGppBY
         IDB5zWMNhMUXaINYNvUdCP/FWUow0TgKKwqyAaF/+T4JyLHeIf0y8fh29/apJgUa6Hxp
         JHIMJyGaGXGm2fDTkxFhNEDg8l6Ut0RYv1jb7p+CwEQS3i9ugOr/RnIL98QL6szE6Vo2
         z8sTMvGZYB7nHgzW2ZJJ2MjYS15y/M2Jwe4e7sHSuTJbu3x+5l4HUQjKss9yTuOrdQpR
         h0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729272624; x=1729877424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFpXrhpElIx5U0caqw8WXCQdQvrJMpAq6qiRpCPXwmQ=;
        b=cVOpsdJvCB8fuPGpCdmCMInu/ZPs8Eq+9m7bUriQrY2YMG/jZpcPpn1ZpKOlRdQNPu
         t6rcbaXB9iQ/3io5WEsK6jBOYlmiTTc7V+aWn7feWiMEdhT4uwsGshGEm3Ga2riEKyxY
         43PXJj9ObDAZ8XR4D+gENz9Fiz5zrk55t7DBl8AAscIkKnFGcHZlI9ndbUVlxbZ6lUix
         Jl9phJANQg7vC/8kAxtW/pkGe9wfNkRIADnY1z1WiaREp+OcGBkmgcR6+OOQ0c6YU/pv
         CDzuIElo2rELlQamjcLvT468VAHqMBfVc+YoqU9TjVYI9GOMMVRnD4YpoDaSy1xv8i1b
         1YAg==
X-Gm-Message-State: AOJu0Yw6UlURUNBYqyOc1AwKZRmAVbtgCFukc8/p0Pt4JMi3xLMsYd2y
	jWk6Tnbj1Uzz5r43GjxxeJtg+D2LiCsyZIWUYmxA6o0bbpaWXBlBmMDNaZ/w
X-Google-Smtp-Source: AGHT+IFcGGMjhgZmKijPwzMX2TIIKyjbIB1NxgoXGiQqvtxq79BYQZAFUknM7+tFqktbTIEQT/2tPA==
X-Received: by 2002:a05:6a00:1390:b0:71e:148c:4611 with SMTP id d2e1a72fcca58-71ea3124252mr4810440b3a.6.1729272624262;
        Fri, 18 Oct 2024 10:30:24 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea3311f51sm1725242b3a.36.2024.10.18.10.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 10:30:23 -0700 (PDT)
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
Subject: [PATCH v3 01/12] powerpc: mm/fault: Fix kfence page fault reporting
Date: Fri, 18 Oct 2024 22:59:42 +0530
Message-ID: <a411788081d50e3b136c6270471e35aba3dfafa3.1729271995.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1729271995.git.ritesh.list@gmail.com>
References: <cover.1729271995.git.ritesh.list@gmail.com>
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

Fixes: 90cbac0e995d ("powerpc: Enable KFENCE for PPC32")
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reported-by: Disha Goel <disgoel@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/fault.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 81c77ddce2e3..316f5162ffc4 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -439,10 +439,17 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	/*
 	 * The kernel should never take an execute fault nor should it
 	 * take a page fault to a kernel address or a page fault to a user
-	 * address outside of dedicated places
+	 * address outside of dedicated places.
+	 *
+	 * Rather than kfence directly reporting false negatives, search whether
+	 * the NIP belongs to the fixup table for cases where fault could come
+	 * from functions like copy_from_kernel_nofault().
 	 */
 	if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address, is_write))) {
-		if (kfence_handle_page_fault(address, is_write, regs))
+
+		if (is_kfence_address((void *)address) &&
+		    !search_exception_tables(instruction_pointer(regs)) &&
+		    kfence_handle_page_fault(address, is_write, regs))
 			return 0;

 		return SIGSEGV;
--
2.46.0


