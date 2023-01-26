Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8FC67D574
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 20:38:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2rcF2pj2z3fDf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 06:38:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fpC9OxtB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3ltbsywykdlmlnkxguzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fpC9OxtB;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2rbH22gzz3fDP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 06:38:01 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-509ab88f98fso22187657b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 11:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aLjaaxPJUorXnCMktZtzjKFOG8Xxelv9KGA9flqeCpQ=;
        b=fpC9OxtByMrsgeuCLlTqjq7ljheyeUGFByxdovFvi/BEZbaqTBtYfqbw7mV85n35vh
         nsJw1tLg82ZBRg3RV9Utdbg2g8s0Gs6HglMnvLMVN1RCTr4mkBoD2v2oZh4Mjh9w/Usr
         DL7mn5GFR4iC1hBs+0CvTUhQnmsv06W09b6suBaVdlve2NmFj/hGVpWM4xqWu44vFGv+
         cln+RN7Rzpw5J9WfB/zYjO6KEwxRe8QhOmkLvUNBVLba9roo72RSbcTHiolp9Ji6xuqA
         dACq72jx3kgKLuzmXwAspaoItebJfeBLbx4oDjP1Exnk9IXVYclbAW1J4WBLbHjzpPE8
         Y+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLjaaxPJUorXnCMktZtzjKFOG8Xxelv9KGA9flqeCpQ=;
        b=5uomfBWySnH6HOiec7dp8ocn0dTpjCj+E81hQDFUbYg9dfa4TCq3+UHtk63MVTLcDA
         IOYqTErMctbiVNMVnXwvjSXJbvLAkh1FobgSg1FxegTYEg5Zl8sfCe/gGTtTokVf1YKB
         xFdoYSxkarqBjDQqP6vlYjW2xNAVqzPeUarapsw3AhAE8Yz3GgpLWC/vhe1PPNybSHHJ
         pie3jc6IGdYPjpzm4SPZjl8Fz79BF/nm+3fy+WtjB3W0IM/r6XBUW8eZtXjLpQIBLoT7
         ja9jPzlJjx+mpFMvMKB4GJCYd1UP1X55S/vVCVcMzd5ayth2EWUluCM5jNNrAMtu2iiJ
         Wv9g==
X-Gm-Message-State: AFqh2krSrNoLFYg0YQOfnF+GaNnyoqrIf/zOswOwKQhp3yPa+03TtNyL
	HTl8Chm4mrenTYg4WGh8BoZehBakZtg=
X-Google-Smtp-Source: AMrXdXvThl7i+LdwZ0FvFdLYZXBmPQfzv8R5JgH5MisJqIZuH2YNlDhICDf5h1c+oIs087t+N+fAgYzZdrs=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:d774:88af:bab3:648d])
 (user=surenb job=sendgmr) by 2002:a0d:da83:0:b0:3c3:8b8e:13ee with SMTP id
 c125-20020a0dda83000000b003c38b8e13eemr4101612ywe.77.1674761878986; Thu, 26
 Jan 2023 11:37:58 -0800 (PST)
Date: Thu, 26 Jan 2023 11:37:46 -0800
In-Reply-To: <20230126193752.297968-1-surenb@google.com>
Mime-Version: 1.0
References: <20230126193752.297968-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230126193752.297968-2-surenb@google.com>
Subject: [PATCH v4 1/7] kernel/fork: convert vma assignment to a memcpy
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rp
 pt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert vma assignment in vm_area_dup() to a memcpy() to prevent compiler
errors when we add a const modifier to vma->vm_flags.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Acked-by: Mel Gorman <mgorman@techsingularity.net>
---
 kernel/fork.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 441dcec60aae..9260f975b8f4 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -472,7 +472,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 		 * orig->shared.rb may be modified concurrently, but the clone
 		 * will be reinitialized.
 		 */
-		*new = data_race(*orig);
+		data_race(memcpy(new, orig, sizeof(*new)));
 		INIT_LIST_HEAD(&new->anon_vma_chain);
 		dup_anon_vma_name(orig, new);
 	}
-- 
2.39.1

