Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6087C81EB8E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 03:40:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KBNtt4Jj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0G8p1Pmyz3c4v
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 13:40:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KBNtt4Jj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=kernelfans@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0G7x5Rwcz2xcn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 13:39:55 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-28bc7155755so1807875a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Dec 2023 18:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703644791; x=1704249591; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SboSrGqWOteY4UZlaqkB5wcdrVV7EfEGe2NbvHZ/6A8=;
        b=KBNtt4JjJdvQLB2sUfzzfkVsIa22h7A5wpJJh6FFvB05I11wXJWAWueTvIExTHnJGX
         7gbHw20hkDUBNg1vyhNJ9fUbXwWdnHbm07LHZonLVoM9ypDY1vygTeh7+uJI9sCQDUHC
         PbwePcEd/3LUgEh2qtW8nFuO9f+M8RYTa9r/PSVgpzKjNQ1ie/0ygFaaXGa3dwMsQ1Mg
         U8OjnfhvZmmVUU2RGh7GenH6qAgvMJk6acW2JUoegDHZL4K10QR0K4E5L8zdYp/xAYBK
         2rHiujf4Kwa59oLPS6gIm18JLHI4S94Jq71nOZakYzE1na7NGXWkADrA3EP+2gO8o3Ei
         nMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703644791; x=1704249591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SboSrGqWOteY4UZlaqkB5wcdrVV7EfEGe2NbvHZ/6A8=;
        b=EJe2DpG/zQGpCoqFb84wv+nEDgkeKm8W4I/SIjeXkeSTIkTBldoQIW7tS6xFM5h1U6
         vHGIZrH23Z+duIAlcP+P2wJCM3ySfwg7teuprjgCDMgjxby7t6HBvEUjYsNbVMRsaYIv
         f4J3q5qmSne+n8c34mJ1JhNZAWwrHkJ9ONogVrB/PPKWjZXc9y1PBbiOCTAmKwqZns7V
         aOWEIpegJ/T5+/w1TNIlvve4PvxrKW9BAhPy7IsjQ/UOoHcm1u+XVEDAZ1Fl8cv9hBBd
         HoB7nMpk4akVyBrkHQrb4CUVelSzGSa/XSa0cVSQOUEFfMLYgn9lmX59dl07krPyEElD
         StzQ==
X-Gm-Message-State: AOJu0YzWON2mbLL+l/l/kzjk8nw9q5K1UAh3M5zW/QxjlELprGOC3BcN
	/1xIyn/tayvsZV2c3Oqok2f61YaSrnlX
X-Google-Smtp-Source: AGHT+IGIJgWT0l1nDA1jwD7Vix95y08PvJIxQUcIwxmsrqnGgX8x1c3u48LdYJvTfJlj/5kiAXGKFw==
X-Received: by 2002:a17:90b:3849:b0:28b:ef08:2673 with SMTP id nl9-20020a17090b384900b0028bef082673mr2177529pjb.64.1703644791505;
        Tue, 26 Dec 2023 18:39:51 -0800 (PST)
Received: from piliu.users.ipa.redhat.com ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id y8-20020a17090a134800b0028c387b2528sm6727454pjf.8.2023.12.26.18.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 18:39:51 -0800 (PST)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv10 0/3] enable nr_cpus for powerpc without re-ordering cpu number
Date: Wed, 27 Dec 2023 10:39:31 +0800
Message-Id: <20231227023934.12299-1-kernelfans@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Baoquan He <bhe@redhat.com>, Pingfan Liu <piliu@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Pingfan Liu <piliu@redhat.com>

This series addresses the nr_cpus issue for PowerPC without re-ordering
cpu number. To save the memory used by percpu area, it also limits the
possible cpu numbers by allowing hole in cpu_possible_mask.

Because the last cpu number will bigger than nr_cpu_ids in this way,
some pointer arrays indexed by cpu should be extended to hold the
pointer, e.g. paca_ptrs.

Please notice that this series still has some issue (some cpu can not be
brought up), but before I resolve it. Please share your thoughts about
it.

Thanks


Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Wen Xiong <wenxiong@us.ibm.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: kexec@lists.infradead.org
To: linuxppc-dev@lists.ozlabs.org

Pingfan Liu (3):
  powerpc/kernel: Remove check on paca_ptrs_size
  powerpc/kernel: Extend arrays' size to make room for a hole in
    cpu_possible_mask
  powerpc/smp: Allow hole in paca_ptrs to accommodate boot_cpu

 arch/powerpc/include/asm/paca.h    |  2 ++
 arch/powerpc/include/asm/smp.h     |  1 +
 arch/powerpc/kernel/paca.c         | 24 +++++++-----------------
 arch/powerpc/kernel/prom.c         |  6 ++++++
 arch/powerpc/kernel/setup-common.c | 26 +++++++++++++++++++++-----
 arch/powerpc/kernel/smp.c          |  3 ++-
 6 files changed, 39 insertions(+), 23 deletions(-)

-- 
2.31.1

