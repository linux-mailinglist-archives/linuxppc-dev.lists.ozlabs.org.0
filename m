Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 369AB698BCB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:22:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNcV0CNZz3chb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:22:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WNV0WuL9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3i7ztywykdoauwtgpdiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WNV0WuL9;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNWL3Kz4z3cNb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:06 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id a4-20020a5b0004000000b006fdc6aaec4fso842331ybp.20
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bYTu7nw04Y/eGAN3i9eCzY/Ke38OAVixcrHXlu+jNFw=;
        b=WNV0WuL9vmXLIvOmuVEVNJHnS2Qfi+AtiXnEC8qLvBZk4nQfRysiQv+n6V2TYm/oOI
         8PVrbtoCrNJAR827RYRUq+srgPH7ettT9CkewSYs2c20qjx3DSR6OCNLU8I9VtlWJ1vK
         BTnTnTmkn3I2d2LJu6019qpcNY3Rtyhwbcu+BTERQU4CpKL9XQ+m6KDQOlEen5oxaVLd
         mpn44+vsVlTTH8ejjgOPKl/5T26Yr75D1Q+Pk5P8P+e6MTdUqg4koF2LdV4PYx+3j32Q
         lvmdVkZra/AZy5zB6Ynbz9xE0KdiJ+yp/dRpPvAGFlnQDPvuVze/cOT0f1MBvOftG1xW
         MgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bYTu7nw04Y/eGAN3i9eCzY/Ke38OAVixcrHXlu+jNFw=;
        b=EhzorO9ScthCoqCUmfn+cqnFPdLwDDYP/pm5yJJS2+RhHh2gcQY6SPZLnKAEhy3R1r
         cfLwE6qzHmc3P2snFov8aitZPLwqFMb5aaesLsJqs6jw4lubbs5SRMbIxJybuIx08kPy
         WpS2RvybHE/346Kuk3EcEdT2VLYizO2ETdf4cPp45zDq37ItbliGJpfAzaxODcPOxny3
         64OWfCy+zo2Dq9hveNWzqgCGyaCvcrBgj8FEIAmSo6ZQAbZhXL5lcO6i9/YsMXnkhrvB
         zT3RcHWjWcsJLES/PxVkWQ1UUeOgzQn05rIHHnunR/CeE4h/YWvnOhQ759fm15z67uIV
         AR9Q==
X-Gm-Message-State: AO0yUKWRgGcVCdFQFexmJD/goJPLOKcVvnOKWbPgpJtZ075voB28nJss
	B18Y/efajQ11y9+7zLk5T2tfSj6Yg2I=
X-Google-Smtp-Source: AK7set+6hui8S8GzrNNsQxXJRqNjwGdwQ7uNZMDuv5k3QQ7TT5mar5i4p4eV6/CeDDFvXWED43V4tYaI94g=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a05:6902:1024:b0:8fc:686c:cf87 with SMTP id
 x4-20020a056902102400b008fc686ccf87mr15ybt.4.1676524683783; Wed, 15 Feb 2023
 21:18:03 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:19 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-5-surenb@google.com>
Subject: [PATCH v3 04/35] maple_tree: remove extra smp_wmb() from mas_dead_leaves()
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, Liam Howlett <Liam.Howlett@oracle.com>, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@v
 ger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Liam Howlett <Liam.Howlett@oracle.com>

The call to mte_set_dead_node() before the smp_wmb() already calls
smp_wmb() so this is not needed.  This is an optimization for the RCU
mode of the maple tree.

Fixes: 54a611b60590 ("Maple Tree: add new data structure")
Signed-off-by: Liam Howlett <Liam.Howlett@oracle.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 lib/maple_tree.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 44d6ce30b28e..3d5ab02f981a 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -5517,7 +5517,6 @@ unsigned char mas_dead_leaves(struct ma_state *mas, void __rcu **slots,
 			break;
 
 		mte_set_node_dead(entry);
-		smp_wmb(); /* Needed for RCU */
 		node->type = type;
 		rcu_assign_pointer(slots[offset], node);
 	}
-- 
2.39.1

