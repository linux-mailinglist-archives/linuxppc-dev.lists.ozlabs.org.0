Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D2167EEA8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:45:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3Sjp4h7gz3fTW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:45:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rnpUdmPc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=34yjuywykdkoceboxlqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rnpUdmPc;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Sck1dmDz3fGx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:41:25 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-4fa63c84621so66277967b3.20
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DF9zqRO1prEDm4IKfYXh+Z69pFj8RdYSRvmvJpFQZKM=;
        b=rnpUdmPcBnY7plbcdmS2pwvwnctQIRIqHumfjs2guCuPsY+Dw6YQ2tfutal8HnrgXz
         edy5Yrgey9QhoRSbyw/SmRVhoDEfIcnSP0t0LCmLUom2gJSxBSb6RoRoQ6R6E1A4+8T0
         XcTb3Fhtcz5YcundAJZb+WYoiQCLWWkiPl+/L7XZyu1tWh8b/ENfJXXDc0COCB4H0HVg
         yuAJnUBiF1z/T9ta5KOn1AHf3cQZUH/oUuoUg6oOo5mcl+MifhrO/XwhHeojlZjv/4Mm
         lccC2wtCBVxTksQLP5lorO6u35MCkxakWEmMvAgnG98JEeGI6fsdBcznmI1LtXlDE24U
         yV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DF9zqRO1prEDm4IKfYXh+Z69pFj8RdYSRvmvJpFQZKM=;
        b=AcZ4yCuputnb6OIoqds6Cj1xxxwuJUk+ZRkyo8O0dw78CsYYJv5nGuxOr3jhG1447+
         2YoNSPQy4/EdrD7WNrQZltAAx+QRxAlBa+rm9oaztdy/aMSYqq7VJMWyt26VYK4iaoNp
         ZRitCe8GmmHFGn0iOMUuDv6PIqIEz/AXHThHNUXSPVOLixdXQzRu1yQWhpx5pOZKQyzo
         2S5PRg/gGXSj+ijhh2EnTdQNEkaManJ3xUgd9SW5jXPyt05qE/WcNN17A/f3TuB5VnsH
         pFKnwiXGvABASL6m5hEpxsVgJPsjwVrm2luXI6b7M3pfgI69xiLiBkcxzQMlpm5mJ2sz
         wniQ==
X-Gm-Message-State: AFqh2krSZqYYXTNL7/hqDfQRHGgLn8i2KQLWZnEWB555JY5FEP348p44
	i7JA69u24+Dqv39Rj8N25pH0lNPmtq8=
X-Google-Smtp-Source: AMrXdXs3xZaVcR3p65iqnfy8qe0w+PmLMIhbeI9n6IEvkAzMLp6jSQOzi5T/oBy2kRvdJXFWY9xcFs4GkSg=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a0d:c8c5:0:b0:4f3:10b1:1351 with SMTP id
 k188-20020a0dc8c5000000b004f310b11351mr5009568ywd.516.1674848483749; Fri, 27
 Jan 2023 11:41:23 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:41 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-5-surenb@google.com>
Subject: [PATCH v2 04/33] maple_tree: remove extra smp_wmb() from mas_dead_leaves()
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, Liam Howlett <Liam.Howlett@oracle.com>, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsing
 ularity.net, rppt@kernel.org
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
index 73917dd2c608..75cce2d4d5da 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -5510,7 +5510,6 @@ unsigned char mas_dead_leaves(struct ma_state *mas, void __rcu **slots,
 			break;
 
 		mte_set_node_dead(entry);
-		smp_wmb(); /* Needed for RCU */
 		node->type = type;
 		rcu_assign_pointer(slots[offset], node);
 	}
-- 
2.39.1

