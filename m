Return-Path: <linuxppc-dev+bounces-6997-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBFEA601D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 21:01:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDJL36mTKz3cCn;
	Fri, 14 Mar 2025 07:01:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741866301;
	cv=none; b=E0ufjIEqeMUc34i1B6FG0tXk68W8UXdzMFp63cKMY5NIHqHJVO2o5nnnAY3LIcRMqsC2710PXvFPOn2AZMxEsBdk+nS53l/E0px0Nhw8gy3QReyHgx5XWNAvi61buVE2QCdjcVb3bTzkJjJmJjGSBQb3fC2Tq+AAr3MgFVbGugC4S2K9Z5jshFU4crcOdBgiDuyr19fyJPxwmoELRMk/Mv12gZjcBf5CLUCPSV4TwarL9QFQ1qDBhiRfeJTZd1Nu7KjYTmMT6glOg5h2+87J3CPti4HV61bN/bdRqdMb/Z3QkHBf/+Zn50Rbgny2FW7DkocOyZsVS8AvyeEIeBCV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741866301; c=relaxed/relaxed;
	bh=Td98jnkcLGUCy3vrjbMOv35ZA5bivtUA493Q3YOVPt4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=TNqNqaRzxqaI/tT1KMoQKYDj+RulpaN2PfyFRVEP0fEBLKpJOunmLSSva26SJSlb2BCWdnmFodKrb5dhvG4G5JDiM8Kf9ED+svkIUJhZlCEO5FLqrxQt7z3d4vsAft3b+d+D+9aFWbQWWS3svenjZhmtqoBNBz/f7gtritWIzZu4tGQXGZZ+5DQT4RvfWwlsbJJO6165WO02x8NE8HlNTyu7UBy6TT3SINSzSFF6c3gM+jOxTKFtaZ9F4W4AwqIK6lsJUSnyZ/lAVIA3zs0G89fb10IlIMV3SGMa2WOoAlmXgKQeoB+7JXsi2QtaPDyCggZQ6zyqYhfeb50S0NcTtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KMQ9dFVA; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KMQ9dFVA; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KMQ9dFVA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KMQ9dFVA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD5Jr5jhjz2ynL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 22:45:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Td98jnkcLGUCy3vrjbMOv35ZA5bivtUA493Q3YOVPt4=;
	b=KMQ9dFVAw0PY8UoGH2ZnQtv2EV1wkdO5uMIhmgRIISCHv2e6UOaDaVi7LvbwZbNh7n7E4v
	rpZttcOhxtu+k3vFQyVx1b9bXyRJvVjAlEWjpsuJ4piW3btDMboUi+UlsJ7nfie3PM21rl
	iSt6HWBX/qir8+M8pUGYWT8Z2x0h6lo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Td98jnkcLGUCy3vrjbMOv35ZA5bivtUA493Q3YOVPt4=;
	b=KMQ9dFVAw0PY8UoGH2ZnQtv2EV1wkdO5uMIhmgRIISCHv2e6UOaDaVi7LvbwZbNh7n7E4v
	rpZttcOhxtu+k3vFQyVx1b9bXyRJvVjAlEWjpsuJ4piW3btDMboUi+UlsJ7nfie3PM21rl
	iSt6HWBX/qir8+M8pUGYWT8Z2x0h6lo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-nD3mCbnbPkeQOFJuRKt7Kw-1; Thu, 13 Mar 2025 07:44:57 -0400
X-MC-Unique: nD3mCbnbPkeQOFJuRKt7Kw-1
X-Mimecast-MFC-AGG-ID: nD3mCbnbPkeQOFJuRKt7Kw_1741866296
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-391425471d6so306882f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 04:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866296; x=1742471096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Td98jnkcLGUCy3vrjbMOv35ZA5bivtUA493Q3YOVPt4=;
        b=b1OFwONiJYhU7Y6sh5v7rlUVxs/OuNgbtlLyE6qCJfglIwZAz0VMSiwQ4xHyU13bcV
         Q/PWkSxoHy5U5VI9Oh0KTvXPOJ8TuJUj2e5C2pHRRL0z6FpYIkvmntTSyIO1LkHSIEfD
         nqrSz2W09lzXy2Y6MH/OKvK+7WbSLDD7RE/VcMykP3HWkkXfC+FTEgArqTLul/77dtpe
         9E4dzktPLhg91HcuxteV7YfaDhTNIRSl1yb6axUm7JvFtOJAw5efj3IkruNKadWdjw3J
         L81idZ7BYeSE2wJia866Ssu/vhnQ+YAtUxjkxuZOaM3/0nr8P5lbEDtL6HYUr/uFIVOt
         DA2A==
X-Forwarded-Encrypted: i=1; AJvYcCUihxxFsCjyWXJiTDeO55OSdnSvqCbUyJqvz+ff5qGxHHgg7V3rHR+/PFZCyf1oljJ8dJ2+9yDcIuDJYwc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxoytg+I10ODXs2noTPdhyX4AzkHCBtgNAmNxj/g4crwlRv8clk
	sF/zDYqtAmJThlhpPoTclR32QHyA2CmfdzuoNtmg3GckomeXLJn98+9kGIGp5juv3XJNMBeFBW/
	jehsPeMS2AHVDVX+21uDUbaF/YdAFMCUXj79ZEOmkr2E3tOkw3r4nIcZWrVHeEF4=
X-Gm-Gg: ASbGncvzrrLYH5q3edI0lfB+uBrTI2aE0Qn1Udbwf2eJeQ3+C8VcX8hFUhfyV10jeQN
	R0ZXmdEQxdwp6GApQSn5hPAZUaXArcDnfQ7LR2JfGnDldTelrszPXSJIFx2z4dd1GLIYNGPXp37
	i1Xw0e+JsGjud8tBbRFHVJug4oWuJXVt20+mkeEM8iW9lTq2dvEH+GTEi/nKtdZQoo6WsUlinhB
	nShkLUg29MKrpC2meUl+tsEnU1fVxPDrZ3lSHBWEPClNnDv/5loRJH6khzT19jS7CoFxZZCE/gC
	HJhhSf1EtJJAS3qkXiRN
X-Received: by 2002:a5d:64a8:0:b0:391:23e7:968d with SMTP id ffacd0b85a97d-39132db703cmr17836145f8f.47.1741866296144;
        Thu, 13 Mar 2025 04:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyU2ePtAFWyqCZMakOsiK4/iIhrDziNVQawXJEAak4gPJli8tipIq38M0q9zksW0XKC08fAA==
X-Received: by 2002:a5d:64a8:0:b0:391:23e7:968d with SMTP id ffacd0b85a97d-39132db703cmr17836093f8f.47.1741866295677;
        Thu, 13 Mar 2025 04:44:55 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:54 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	loongarch@lists.linux.dev,
	x86@kernel.org,
	Simon Horman <horms@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 12/14] sh: Move defines needed for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:27 +0000
Message-Id: <20250313114329.284104-13-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rdvuO3pD6ZpigQs_-jvJBSHM5M5g0TmKPpM6NjQcZgQ_1741866296
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Guenter Roeck <linux@roeck-us.net>

Declaring the defines needed for suppressing warning inside
'#ifdef CONFIG_DEBUG_BUGVERBOSE' results in a kerneldoc warning.

.../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY().
	Prototype was for HAVE_BUG_FUNCTION() instead

Move the defines above the kerneldoc entry for _EMIT_BUG_ENTRY
to make kerneldoc happy.

Reported-by: Simon Horman <horms@kernel.org>
Cc: Simon Horman <horms@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/sh/include/asm/bug.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 470ce6567d20..bf4947d51d69 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -11,6 +11,15 @@
 #define HAVE_ARCH_BUG
 #define HAVE_ARCH_WARN_ON
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"\t.long %O2\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+#endif /* CONFIG_DEBUG_BUGVERBOSE */
+
 /**
  * _EMIT_BUG_ENTRY
  * %1 - __FILE__
@@ -25,13 +34,6 @@
  */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
-#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
-# define HAVE_BUG_FUNCTION
-# define __BUG_FUNC_PTR	"\t.long %O2\n"
-#else
-# define __BUG_FUNC_PTR
-#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
-
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b, %O1\n"			\
-- 
2.34.1


