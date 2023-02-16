Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 198AC698C2B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:38:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNyH6Nyvz3fbm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:37:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Hd3NZlon;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3tbztywykdaw463qzns00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Hd3NZlon;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNX61c2Pz3f3R
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:46 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id t13-20020a056902018d00b0074747131938so855921ybh.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zeEKIs6RouZ3NeHI7ZJ8m5Jmv1yLdTyFBRJo2pt5tCE=;
        b=Hd3NZlonbpCzy5K7Z5feVeMneevLupNr2wIBk8xrF2F0FeVHuTW7v0p8Iwz465OudO
         Kz/cwziHnFST/NwsyYv9H1NpjXxfHSGLxO5ukc+3xsoPYXaSl8+RA3RdmvmM4fbLpXN9
         gimJ3OxJZ4Ep64JmtioAuz7PGMRMavPtJuthlMhEIfRvRDzYwwXEt+kIY/UhQ/1ohnXV
         Mp7Yg73p6F/OdwNe1qmUkwSe8yYAoyBy/8c1r/0Zsdj45B+B6DEhDKlW7MvfqHG54uOt
         TWogzsTy9UemTUaeFAzTdpALJEgq+fwHHnoe+QVimQT+Dp4bg9S2kMJXbPj9+Gb2VnGT
         o48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zeEKIs6RouZ3NeHI7ZJ8m5Jmv1yLdTyFBRJo2pt5tCE=;
        b=h04fyKlxA5IAmNP5sxRDDIDWme22/++eZHGhH/8s+tdQ96b8w8lq2IIeF7/I59J+JX
         Kd/jlTVT2115HgGr3OeujOvZYhzn8PuAL3YDJoSCpOnT/Q8etbko/yC2Rk6smGkt9b9V
         /umy1IynjeHkG6oX54fO59/MrzqzKYqVuPVUlwino5wnUpxaWvE9Ih4AxWiQPs7FQZZo
         gr1bR7KelMw29iW7RErx+95Tj1E3MfP1KA+KgTUCt2JKoZRCjSGg8m+bBnLBS7l+GUff
         p34sPaiLS82aEihdU2lCD6QdqBl8FAnv75a0KwpquENB37RQx2coglKi2lulmbpWRBMA
         yT8g==
X-Gm-Message-State: AO0yUKWifMjsE61QWtvbtLb8EZHeA1R1wgnVsiDXU7RKC3FT+d5UJLH3
	rd5N3I0Ulu4zW6HYaj6VzmbvW56rqTk=
X-Google-Smtp-Source: AK7set9EG6pwKD6Qe8/WGqDgk7Um8RE2RvPxkguhsK1CKP8nzrHSAEE/Znnb7/ves5IDs/PTEla86+djibg=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a5b:604:0:b0:859:2acc:deb6 with SMTP id
 d4-20020a5b0604000000b008592accdeb6mr561571ybq.79.1676524725671; Wed, 15 Feb
 2023 21:18:45 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:36 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-22-surenb@google.com>
Subject: [PATCH v3 21/35] mm/mmap: write-lock adjacent VMAs if they can grow
 into unmapped area
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
  hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While unmapping VMAs, adjacent VMAs might be able to grow into the area
being unmapped. In such cases write-lock adjacent VMAs to prevent this
growth.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index 118b2246bba9..00f8c5798936 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2399,11 +2399,13 @@ do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	 * down_read(mmap_lock) and collide with the VMA we are about to unmap.
 	 */
 	if (downgrade) {
-		if (next && (next->vm_flags & VM_GROWSDOWN))
+		if (next && (next->vm_flags & VM_GROWSDOWN)) {
+			vma_start_write(next);
 			downgrade = false;
-		else if (prev && (prev->vm_flags & VM_GROWSUP))
+		} else if (prev && (prev->vm_flags & VM_GROWSUP)) {
+			vma_start_write(prev);
 			downgrade = false;
-		else
+		} else
 			mmap_write_downgrade(mm);
 	}
 
-- 
2.39.1

