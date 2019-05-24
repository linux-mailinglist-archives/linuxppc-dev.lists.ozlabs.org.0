Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A74F52A1E2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 01:55:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459jsp6mRGzDqfy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 09:55:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=joelfernandes.org
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=joel@joelfernandes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=joelfernandes.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org
 header.b="h1Yfyhrm"; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459jlt18jszDqMG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2019 09:50:02 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id w7so4751763plz.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 16:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T411oidtPZE/SyBXnA5xe/v4182CyfqCsIw7xcrtw7w=;
 b=h1Yfyhrm1FED0jxfY2I/NspMxRT5TIJwzEmWWjpN49QToxU9ZGZbpFbhec3ZLORRCd
 jpV/RHW2DQVuQ6REsHLluVgcp8J/8f7MfNBg8yuFJKeM4vTFRi3l37IN4VY1lkR3I9qd
 ZWKxvmGD+ntgFm02ZtggbTrE3nvbMGZd9Jwq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T411oidtPZE/SyBXnA5xe/v4182CyfqCsIw7xcrtw7w=;
 b=n5B2EUE+TvTJPGd2mcwaN7Kq00efATj0fMlJA00VD66V3ZD5dHro57GElcaX0CGae+
 XIBy2NVLexOrG2VJsMH/uhph4WuH6Q1ZDcODPj8O2yuTaVV3pk9t82xyULluMp6+a4WS
 dryCJP50IMM36tMrMUzjV/NCf/XazPML7Qu9eR2VgfFCFHdrVkhInJCUTnOCOePGyWLH
 Gm9gkTh7/6hGwcpS3yn2OYrmuxh43Mu8qKqL2flM453hTILmXucYRLL/rW/yffK8qU1s
 a82WsJ0qmV3j+Ff5I3bJdkTYXheJA3+zghaJpq56TVbavrXSi0k4NkIe2zr0cbsuJuhq
 69fg==
X-Gm-Message-State: APjAAAXPtgpSgCn/qI7vr8EPK8sHEgKQVatXXmlCn7zbHHcwCpNb2/QA
 66oKG62deN49kxl1+JOIXCfcEQ==
X-Google-Smtp-Source: APXvYqxwZl/5ewT5nmPHvDNF3PVcRdSTyjHQUf1i/UtDMZkPW0EhWp82Y0t5mSMFBjTrA/fFj21Rqg==
X-Received: by 2002:a17:902:4181:: with SMTP id
 f1mr87153377pld.22.1558741799771; 
 Fri, 24 May 2019 16:49:59 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id q4sm3297595pgb.39.2019.05.24.16.49.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 24 May 2019 16:49:59 -0700 (PDT)
From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 3/5] hashtable: Use the regular hlist_for_each_entry_rcu
 API
Date: Fri, 24 May 2019 19:49:31 -0400
Message-Id: <20190524234933.5133-4-joel@joelfernandes.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190524234933.5133-1-joel@joelfernandes.org>
References: <20190524234933.5133-1-joel@joelfernandes.org>
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
Cc: rcu@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, kvm-ppc@vger.kernel.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

hlist_for_each_entry_rcu already does not do any tracing. This series
removes the notrace variant of it, so let us just use the regular API.

In a future patch, we can also remove the
hash_for_each_possible_rcu_notrace API that this patch touches.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 include/linux/hashtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hashtable.h b/include/linux/hashtable.h
index 417d2c4bc60d..47fa7b673c1b 100644
--- a/include/linux/hashtable.h
+++ b/include/linux/hashtable.h
@@ -189,7 +189,7 @@ static inline void hash_del_rcu(struct hlist_node *node)
  * not do any RCU debugging or tracing.
  */
 #define hash_for_each_possible_rcu_notrace(name, obj, member, key) \
-	hlist_for_each_entry_rcu_notrace(obj, \
+	hlist_for_each_entry_rcu(obj, \
 		&name[hash_min(key, HASH_BITS(name))], member)
 
 /**
-- 
2.22.0.rc1.257.g3120a18244-goog

