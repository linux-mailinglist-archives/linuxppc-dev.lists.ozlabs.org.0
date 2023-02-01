Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1681683AE4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 01:02:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P62Cy5j3dz3chQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 11:02:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Rk9+8STv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=32kvzywykdlstvsfochpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Rk9+8STv;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P62C04FsLz2ynx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 11:01:31 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id w70-20020a25df49000000b00803e799d7b1so18178466ybg.10
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 16:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bxtFPzszSwirgU1/0J+PiMZRXMSQgSBrsapRb9QUY2A=;
        b=Rk9+8STvrqcbQlKiAZtMBFXlHokjI0hFJPEVyGKrBrbMfUwZG8qeTJEuvgsTMPrddh
         QBvNTohEnVdpbnlrXIgz3Ikz6D2cz4x6un8ohdjcDpAfu7gZ17WU+drJlhJu9Qtc4X1w
         EN1waKUDwB0WD09JdlRGgqA2ctv2OIzWCDINQo+peotxUMRoWPkFgEen/RotX4SxEykY
         LuacT9neZvFmURFR16w8DaONfwFwVOcr03mG+PjT2JsZXXZmxD4X3lmTqKTBd5FY/kIG
         JWR8f0Sx+Z/NFa0Ne873ZtAwDgad97njkhjjwAf7i14upKxsl5EruUIt4SUZYeig/N3q
         ro2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bxtFPzszSwirgU1/0J+PiMZRXMSQgSBrsapRb9QUY2A=;
        b=wWt3lS8hyrOo5CW7CRI8fejSaUXMoXfAJ0vdwLvsDaM1HBsLggdJkfEMQsKfry57XQ
         rC/ItPNdJd7Eoa76TYOgAges+SYMSK43RbA1X+OQc7KEMPStwyXI1n0nxlva2K4DeJ2r
         b46WZagqb2xFFPC5o0Us3vmE+a3edROkwrZeEalQkZlCGpd1lBLflQnV0lqVZCGs7V0L
         WTVS8GJs4VfLHTkj2dzAj4L1gt7lX4jJ21gRYTwpImSlwahvO/BbLmTt/3Ca7eVCA7yJ
         oOF4NcUOwjehOKNuSRUzL50TbBHfPv1Yp7l2WTXPlhoPS1VwSr1gQpzCH3t5DvqFGgpc
         97Aw==
X-Gm-Message-State: AO0yUKWzIJbzCu2lg/B70Qo1weDP+fcZMd7KzJH6ir+gVHg/P0fbNLNV
	4Zp1+wX4G8KK5E3XeCnQVtcGP2CI8EM=
X-Google-Smtp-Source: AK7set8qCAXBbF1QMD7keC0/SZMMktYNysM7vnt2K6tJydZhJP2e/r9qdYRWK1+YTYhm0sm9RG76XRb3Zl4=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:3d02:e79b:d9e3:ddd3])
 (user=surenb job=sendgmr) by 2002:a81:204:0:b0:4db:df79:a7c7 with SMTP id
 4-20020a810204000000b004dbdf79a7c7mr21711ywc.515.1675209688185; Tue, 31 Jan
 2023 16:01:28 -0800 (PST)
Date: Tue, 31 Jan 2023 16:01:16 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230201000116.1333160-1-surenb@google.com>
Subject: [PATCH 1/1] mm: introduce vm_flags_reset_once to replace WRITE_ONCE
 vm_flags updates
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, 42.hyeyoo@gmail.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@te
 chsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Provide vm_flags_reset_once() and replace the vm_flags updates which used
WRITE_ONCE() to prevent compiler optimizations.

Fixes: 0cce31a0aa0e ("mm: replace vma->vm_flags direct modifications with modifier calls")
Reported-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
Notes:
- The patch applies cleanly over mm-unstable
- The SHA in Fixes: line is from mm-unstable, so is... unstable

 include/linux/mm.h | 7 +++++++
 mm/mlock.c         | 4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5bf0ad48faaa..23ce04f6e91e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -648,6 +648,13 @@ static inline void vm_flags_reset(struct vm_area_struct *vma,
 	vm_flags_init(vma, flags);
 }
 
+static inline void vm_flags_reset_once(struct vm_area_struct *vma,
+				       vm_flags_t flags)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	WRITE_ONCE(ACCESS_PRIVATE(vma, __vm_flags), flags);
+}
+
 static inline void vm_flags_set(struct vm_area_struct *vma,
 				vm_flags_t flags)
 {
diff --git a/mm/mlock.c b/mm/mlock.c
index ed49459e343e..617469fce96d 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -380,7 +380,7 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
 	 */
 	if (newflags & VM_LOCKED)
 		newflags |= VM_IO;
-	vm_flags_reset(vma, newflags);
+	vm_flags_reset_once(vma, newflags);
 
 	lru_add_drain();
 	walk_page_range(vma->vm_mm, start, end, &mlock_walk_ops, NULL);
@@ -388,7 +388,7 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
 
 	if (newflags & VM_IO) {
 		newflags &= ~VM_IO;
-		vm_flags_reset(vma, newflags);
+		vm_flags_reset_once(vma, newflags);
 	}
 }
 
-- 
2.39.1.456.gfc5497dd1b-goog

