Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5F66A4913
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 19:00:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSwB62Khz3fBB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 05:00:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oVVsUrq9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3yur8ywykdfebdax6uz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oVVsUrq9;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSPb1Z6Gz3chJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:37:39 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-536cb268ab8so154457617b3.17
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u/Oe5vIeahqwi5sYk+6bCjyqP36jyrRz0eAbwTkYv10=;
        b=oVVsUrq9J7ftO0x2n5rOfx5Vuu5nhzvFsm0M1/orxQW1l03nlBX1oBt9Z3PeMUwxB8
         EXB0rSNNqcp6UVy0odo1Y2qU2vLsCHExXTtZRuAA28OmedCWSwEPwJ/vb5UPfrQv5PJW
         ecTpj0oKN79TWuriZXNGVkql1JYRLuNigyKob+qED9T9sBsRaNyBmXPE+YrDxEJo7iH1
         ubKjcF24jylzmHXYDSJCXBFRNZiczfW6Yvvr4W8sLGpkz89otOdurivgyE6QG9AxV0ch
         vbIsOJhdZ8Z0YDKh5k0bAgyDf+j5LXFUYUSVRKs5nZ5bUnBRVL57+VXMgXm8R+LTRb+i
         YnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/Oe5vIeahqwi5sYk+6bCjyqP36jyrRz0eAbwTkYv10=;
        b=uoptHQ/+nsw8vegxmAeU3LDED0F6e7tyQeGXr83niyH+gdqoVc+3tAutl4tTPmXJe1
         BuIbMe6GN+UM8aZ6mZS76FWEeSjgEZmjUO3W4qQbqgkMKBDO+IkiW59KXRcmtj7oY85O
         HlScg4DzIHnmu8oORFF4PkG5XglluDoddwSpRm8Gf7zNKQLsa5XzUdsKw+CwUPpKCF2s
         dQgDC0b4Xu/pFcEy7QruPqVaN/9FsWy3/G5JnpSxBVxn7y7EhH8cR5+NSLqOVkMlzT0G
         Y34p6RhBBwKuR2xYmn+ihih1zPygXLTA0cBy4pF8i89Hlp6Dc1EJ/9YGG6smLQgntDkv
         rwPw==
X-Gm-Message-State: AO0yUKWli0Yo9jgQMB4RxMxUkkVbZqNs8NhR2GAnW3vsh4jsZerOq6aN
	Av0fMfpNHxtv0xSqBsoKbvraaUnHokM=
X-Google-Smtp-Source: AK7set+K4/t0896rH5imu1aS5MRSoxg+vS9UwsZogQaAvLfU1/2OHkdV+UAhVM9dEQWx1b4yJz5LZ0tC6/0=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a81:3e21:0:b0:533:cf4e:9a80 with SMTP id
 l33-20020a813e21000000b00533cf4e9a80mr10559241ywa.6.1677519458641; Mon, 27
 Feb 2023 09:37:38 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:25 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-27-surenb@google.com>
Subject: [PATCH v4 26/33] mm: prevent do_swap_page from handling page faults
 under VMA lock
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, Laurent Dufour <laurent.dufour@fr.ibm.com>, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstr
 eet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Due to the possibility of do_swap_page dropping mmap_lock, abort fault
handling under VMA lock and retry holding mmap_lock. This can be handled
more gracefully in the future.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>
---
 mm/memory.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 8855846a361b..af3c2c59cd11 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3689,6 +3689,11 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	if (!pte_unmap_same(vmf))
 		goto out;
 
+	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
+		ret = VM_FAULT_RETRY;
+		goto out;
+	}
+
 	entry = pte_to_swp_entry(vmf->orig_pte);
 	if (unlikely(non_swap_entry(entry))) {
 		if (is_migration_entry(entry)) {
-- 
2.39.2.722.g9855ee24e9-goog

