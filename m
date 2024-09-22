Return-Path: <linuxppc-dev+bounces-1519-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C925B97E19B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Sep 2024 14:46:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBQqS604Gz2y8n;
	Sun, 22 Sep 2024 22:46:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727009204;
	cv=none; b=f3ThMqgxaWH81i0l4xrmIxAx11fbNKkJRBgVrTpxMv9gCwXVapL/OFL8vSG7rGv69G98hi/QmZAu0RJApliN8Y4z6IQG6UNPpNpTguNJkyAqa4h3ETDdPGwj0yEGVp10SMIr3OUrUJ1JOVpWW5wRhaYt82/ZEpNkoNws210zGjkgjxUr1ha4/CjMcbUdkxEfDAWGuvTc1jYe+DfUcUVGYrv25mh3dV7CsbPLAaVPNnoQSKzuMe0jBB41rAiDKH21NhmBtrTK/8z2cjkgnxOcA86vYvKdKqh/Pjy/0wlrFjU9olekiSAnhz2YHIaCD+sCUdEyXqolVmagwAs3t/UJGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727009204; c=relaxed/relaxed;
	bh=1d6ErifsnrSsT38T4JJA8Y82xn33h3c3g8IFMCA75zg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m5ZGJ8B01mVVxkJDjMoG2fyeZz0pScwXgZUbO874mQ8+nav81dYyC2j0CDRAeN83ZjKx54LeoqqRB9LTEki/AzGNrG3S4I2uPfgxQHaLxF4XpYD5lx6gBpYx0ho9omBuZbx+GzND600GMv0YU/0buRaXHvNEr0LNUPcvNdhtLJBfMcn5qzIM/kbQp+P4EzOCi/ehGknf1WZOOfyn5Ioh68qhT9RbgwsZc0li66GrYk2qY6bGbkqJ5uGymIYYXh3H2r1nk1dF8AB5SVEQldVtRhQ8MR/vVuAwjQ72dkuFMbLIqJmpKO/RkU+KiZUW6xyw+QAaT+RmtI3k9q15HfY0Tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nEJrZ1y1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nEJrZ1y1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBQqS0Kwsz2xfT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Sep 2024 22:46:42 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2054feabfc3so31216035ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Sep 2024 05:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727009199; x=1727613999; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1d6ErifsnrSsT38T4JJA8Y82xn33h3c3g8IFMCA75zg=;
        b=nEJrZ1y1FpAViYl0ws49WbrBB0eun5eqgwroqOZaKMrD3MotvFpHzGZDzqU57LFGwW
         lonxnKv6VjbsZfsjUqkcBC29VZ6RYMyKeFptYXCybiWWoVgMEpRn/+D60kls21k0Me4E
         NBYWdzTHvd5VMZX+spgQvUifKbMnvLpKrVfOgskADm4TJAI7m10hb8kPZKsZ9F7LX+8+
         Iu/trp/RPu3lFjnoz0rFo//kDWaBC71c7kNBJRbz9FoogfgWX33kI34Es+P5RYo9w3UG
         k7GVp8o9afxT/TRng28Fu3jHMibOLMRQQQmyNWZMhRvm1ltbnLIVbdsO28Fmi5gAJMGU
         lGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727009199; x=1727613999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1d6ErifsnrSsT38T4JJA8Y82xn33h3c3g8IFMCA75zg=;
        b=Yu6pLFuhAwSVHztnQETYSRS02n4l5NTi1iUiKlUlMlceE7psWlQbIQCznDuVKYVqI3
         m6BjQ7djMC7PavbRvsdXdICXQr3XqkoRXbxZGnk3knsU1B65fwoFjNYtOFouTlQo414m
         i4X9uZSz1U8dW1UZHve4nghFQPtTwvt9sSQyvH4S9Nu1ELasHeDY/qKkfVLp3vQX8tnv
         cCwdQf+psydwimT/q1iPF2WHQRrqpfxbFbKZR1gtcXkJBrtMwnC4a2X6cHTbD6gnwsBm
         szCZnccOxWfybVdesPK1BvkKl51Mjt98zuO5zI/K/ttUKwEloUuaCOC/k6vV88ZFW2jB
         q8/w==
X-Gm-Message-State: AOJu0Ywnt6DXmwuTMc2C1vcQerhsFZpznd235xZf5XAROqViyR0tkF3v
	VV+ianG+aVgWlEv/7sespoj7UrBKDp3uSzf/N/Kp6hbOC/1kYN+KYzxA0g==
X-Google-Smtp-Source: AGHT+IEErnc4kiN4jb2LvbdfB67R2vqvkV0zBOBcvy8te6zsBl9Cd9Yo6sEVpe89ph9ouy1i+Tc59Q==
X-Received: by 2002:a17:902:e5cd:b0:206:9caf:1e09 with SMTP id d9443c01a7336-208d98bd28cmr89162375ad.61.1727009198583;
        Sun, 22 Sep 2024 05:46:38 -0700 (PDT)
Received: from dw-tp.. ([171.76.87.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d19aasm119420975ad.127.2024.09.22.05.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 05:46:36 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC / PoC v1 0/1] powerpc: Add support for batched unmap TLB flush
Date: Sun, 22 Sep 2024 18:16:23 +0530
Message-ID: <cover.1727001426.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
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

Hello All,

This is a quick PoC to add ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH support to
powerpc for book3s64. The ISA in 6.10 of "Translation Table Update
Synchronization Requirements" says that the architecture allows for optimizing
the translation cache invalidation by doing it in bulk later after the PTE
change has been done.
That means if we can add ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH support, it will be
possible to utilize optimizations in reclaim and migrate pages path which can
defer the tlb invalidations to be done in bulk after all the page unmap
operations has been completed.

This a quick PoC for the same. Note that this may not be a complete patch yet,
TLB on Power is already complex from the hardware side :) and then many
optimizations done in the software (e.g. exit_lazy_flush_tlb to avoid tlbies).
But since the current patch looked somewhat sane to me, I wanted to share to get
an early feedback from people who are well versed with this side of code.

Meanwhile I have many TODOs to look into which I am working in parallel for this
work. Later will also get some benchmarks w.r.t promotion / demotion.

I ran a micro-benchmark which was shared in other commits that adds this
support on other archs. I can see some good initial improvements.

without patch (perf report showing 7% in radix__flush_tlb_page_psize, even with
single thread)
==================
root# time ./a.out
real    0m23.538s
user    0m0.191s
sys     0m5.270s

# Overhead  Command  Shared Object               Symbol
# ........  .......  ..........................  .............................................
#
     7.19%  a.out    [kernel.vmlinux]            [k] radix__flush_tlb_page_psize
     5.63%  a.out    [kernel.vmlinux]            [k] _raw_spin_lock
     3.21%  a.out    a.out                       [.] main
     2.93%  a.out    [kernel.vmlinux]            [k] page_counter_cancel
     2.58%  a.out    [kernel.vmlinux]            [k] page_counter_try_charge
     2.56%  a.out    [kernel.vmlinux]            [k] _raw_spin_lock_irq
     2.30%  a.out    [kernel.vmlinux]            [k] try_to_unmap_one

with patch
============
root# time ./a.out
real    0m8.593s
user    0m0.064s
sys     0m1.610s

# Overhead  Command  Shared Object               Symbol
# ........  .......  ..........................  .............................................
#
     5.10%  a.out    [kernel.vmlinux]            [k] _raw_spin_lock
     3.55%  a.out    [kernel.vmlinux]            [k] __mod_memcg_lruvec_state
     3.13%  a.out    a.out                       [.] main
     3.00%  a.out    [kernel.vmlinux]            [k] page_counter_try_charge
     2.62%  a.out    [kernel.vmlinux]            [k] _raw_spin_lock_irq
     2.58%  a.out    [kernel.vmlinux]            [k] page_counter_cancel
     2.22%  a.out    [kernel.vmlinux]            [k] try_to_unmap_one


<micro-benchmark>
====================
#define PAGESIZE 65536
#define SIZE (1 * 1024 * 1024 * 10)
int main()
{
        volatile unsigned char *p = mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
                                         MAP_SHARED | MAP_ANONYMOUS, -1, 0);

        memset(p, 0x88, SIZE);

        for (int k = 0; k < 10000; k++) {
                /* swap in */
                for (int i = 0; i < SIZE; i += PAGESIZE) {
                        (void)p[i];
                }

                /* swap out */
                madvise(p, SIZE, MADV_PAGEOUT);
        }
}



Ritesh Harjani (IBM) (1):
  powerpc: Add support for batched unmap TLB flush

 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/include/asm/book3s/64/tlbflush.h |  5 +++
 arch/powerpc/include/asm/tlbbatch.h           | 14 ++++++++
 arch/powerpc/mm/book3s64/radix_tlb.c          | 32 +++++++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 arch/powerpc/include/asm/tlbbatch.h

--
2.46.0


