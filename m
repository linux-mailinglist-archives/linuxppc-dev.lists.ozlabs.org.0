Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D46AA18E5F4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Mar 2020 03:21:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lLq50QC2zDrhY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Mar 2020 13:21:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=joelfernandes.org (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel@joelfernandes.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=joelfernandes.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org
 header.a=rsa-sha256 header.s=google header.b=wuN8YhHs; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48lLnN5Q25zDrWR
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 13:19:51 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id y24so8669512qtv.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 19:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g7SHC7AQfO9TwwpN/x0z3E15F8GnLYestCEz0TtL0YM=;
 b=wuN8YhHsGNS+KBnGqTssJtfUY56E0cibB4sykRbRaY8Uzc+i5+w1tUbC+QacGhjerF
 2FKP+0tqFKpl5j6mvSpNhHrzHI2RBcE9nKKbqsXo8WPFNcaSf55ZHe0L5o66KwwNiwSk
 6vmBzdMEzCYwgRzBV91lIxRvfLKdELWAHnRdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g7SHC7AQfO9TwwpN/x0z3E15F8GnLYestCEz0TtL0YM=;
 b=msmX0ddkGU5pfiag96pTxpefiZymjWY38bvmqMR/AYwpiBnS22nR2OiGsFhIVD7PxJ
 Q9oGBGjfp3olQdatTOkJd3CqBvozJ4k/ck6y7JEq1Rxvu25Js0tqoclQ2/6bh1yHL8vG
 z1Ga08Nfn5ce87Bt8TTZXsTjB8WhMDBXdZk75P5yuWpxP5UjSmvcPVD4XySHeu1hoVkR
 rKh0Q7oDkfagM+LdKHQjD8WA0I73QUt45wlvLk0REjQnacKPKS/mfSfu2u/UDZYp2SZw
 aZAF93Tysn6EqGfS3GqibjwJGGScBcwCUySgcL3iMsDO+ZQFyJJbKZQRl4E3YGtI5ZHa
 M90g==
X-Gm-Message-State: ANhLgQ2Gbb/RHvUaygsUsWrqBxPYo30EcD3xEu5KJK2K9MUJsf2GpocA
 dT8AoOkhni29Akbpfu6loeB/ow==
X-Google-Smtp-Source: ADFU+vuZl6DL/jFqnNj4u0sNih/73JNqy/GIOCoxZp/XGx+R2DvQ+abdhYVPGYbeEZYzc7Sq2kUaBg==
X-Received: by 2002:ac8:748e:: with SMTP id v14mr15603731qtq.82.1584843588059; 
 Sat, 21 Mar 2020 19:19:48 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id h138sm8150819qke.86.2020.03.21.19.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 19:19:47 -0700 (PDT)
From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: Clarify better about the rwsem non-owner
 release issue
Date: Sat, 21 Mar 2020 22:19:38 -0400
Message-Id: <20200322021938.175736-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
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
Cc: linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, netdev@vger.kernel.org,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, "Paul E . McKenney" <paulmck@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 "linux-usb@vger.kernel.org Kalle Valo" <kvalo@codeaurora.org>,
 "linux-pci@vger.kernel.org Felipe Balbi" <balbi@kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-wireless@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reword and clarify better about the rwsem non-owner release issue.

Link: https://lore.kernel.org/linux-pci/20200321212144.GA6475@google.com/

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 Documentation/locking/locktypes.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/locking/locktypes.rst b/Documentation/locking/locktypes.rst
index 6f2c0f5b041e..656dce72f11f 100644
--- a/Documentation/locking/locktypes.rst
+++ b/Documentation/locking/locktypes.rst
@@ -292,7 +292,7 @@ implementations to provide priority inheritance for all lock types except
 the truly spinning ones. Priority inheritance on ownerless locks is
 obviously impossible.
 
-For now the rwsem non-owner release excludes code which utilizes it from
-being used on PREEMPT_RT enabled kernels. In same cases this can be
-mitigated by disabling portions of the code, in other cases the complete
-functionality has to be disabled until a workable solution has been found.
+For now, a PREEMPT_RT kernel just disables code sections that perform a
+non-owner release of an rwsem. In some cases, parts of the code are disabled.
+In other cases, the complete functionality has to be disabled until a workable
+solution has been found.
-- 
2.25.1.696.g5e7596f4ac-goog

