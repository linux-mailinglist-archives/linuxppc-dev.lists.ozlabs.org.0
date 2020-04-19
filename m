Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B07691AF799
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 08:44:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494gKl0MZDzDr6b
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 16:44:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=jagdsh.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HAi5FK5+; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494gHh36b6zDqSs
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 16:42:36 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id 2so3408011pgp.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 23:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mamiKfjGVqNB2lfZ9Vc1boeJO9yD6maYEt+Wkruvbx0=;
 b=HAi5FK5+6tSpBWtktFE7tJjwjNJ/l7KTz84EfFiGsGZQu6umzwT2Ab2JtfW5vE5nIF
 ErpFUHivh2/8s2AmUrxGOQumvxsVGY9zmITc/cugTi5o4l6FWNww1/2JrPrEklJbIPJP
 EEnL3cYgNCZTTomIwZguIqasaFF+FqQL+y84zIIjOZ0G/XeyBoTmEXMD7v+z+62bvWLW
 QuUsOruD7/XNk5BhL+Q/xaCs5SokShC5IOkcR99Jf77ecyPPaITw4AjolaP5v87F5WkQ
 l4SruuywUJ3x2htgpXrWSOu0jQZYG7snUjU7YNrl5saHruSNDfhucB1yopvaP10tHOPV
 46Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mamiKfjGVqNB2lfZ9Vc1boeJO9yD6maYEt+Wkruvbx0=;
 b=SuEE3kzz4uLWz0sxXmJgxeT+oKlCGQYoDSjd9z4kn2k0OEPdWSedHxKa8rBNaHlfam
 uaSVn/PLES+w4V/r7grGh7OGfRUe7x2vpFbzPZRV3rNGkO7F2fIYoWixaG0qWW/ehC/r
 8uJ50gB0L7QFzhYH8tKHKFT9ptx1jcqe7XoZ0E1MakSEaDFHKqHGNx/Mapr9Pjurx4Uz
 tiui4kH3ryFmMY0XDNHuewivA1s4nV4Ju7qq70Sz0V0HRnJk2KK4EGzjDS7ClveopO0m
 EbA3uJvsQoc82M7CwRyxhqRZO3+Gxf+ZoXfahVylZvT37BUEla7rbvHxgXuMRWXN4xSe
 e7KQ==
X-Gm-Message-State: AGi0Pubokdo2urHc29coey/I4zpbA005DjAa4d4qwj8ytg8Ts5vSogS6
 pCDVrsVhg3eVP290QdPiZPU=
X-Google-Smtp-Source: APiQypJh+Xo3EBWavapqrON4K7tyi4De+eQBWskRiR9Gf+W43SbsEFYnBV4coJXmwOBZiVLFAXwFbw==
X-Received: by 2002:aa7:850f:: with SMTP id v15mr10747842pfn.204.1587278553656; 
 Sat, 18 Apr 2020 23:42:33 -0700 (PDT)
Received: from CentOS76.localdomain.localdomain ([27.59.158.48])
 by smtp.gmail.com with ESMTPSA id o18sm3285399pjw.15.2020.04.18.23.42.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 18 Apr 2020 23:42:33 -0700 (PDT)
From: jagdsh.linux@gmail.com
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 shuah@kernel.org, aneesh.kumar@linux.ibm.com, desnesn@linux.ibm.com
Subject: [PATCH] tools/testing/selftests/powerpc/mm: Remove duplicate headers
Date: Sun, 19 Apr 2020 12:11:30 +0530
Message-Id: <1587278490-18426-1-git-send-email-jagdsh.linux@gmail.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: Jagadeesh Pagadala <jagdsh.linux@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jagadeesh Pagadala <jagdsh.linux@gmail.com>

Code cleanup: Remove duplicate headers which are included twice.

Signed-off-by: Jagadeesh Pagadala <jagdsh.linux@gmail.com>
---
 tools/testing/selftests/powerpc/mm/tlbie_test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/mm/tlbie_test.c b/tools/testing/selftests/powerpc/mm/tlbie_test.c
index f85a093..48344a7 100644
--- a/tools/testing/selftests/powerpc/mm/tlbie_test.c
+++ b/tools/testing/selftests/powerpc/mm/tlbie_test.c
@@ -33,7 +33,6 @@
 #include <sched.h>
 #include <time.h>
 #include <stdarg.h>
-#include <sched.h>
 #include <pthread.h>
 #include <signal.h>
 #include <sys/prctl.h>
-- 
1.8.3.1

