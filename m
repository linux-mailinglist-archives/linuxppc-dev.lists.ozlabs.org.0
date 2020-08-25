Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6767B251043
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 05:55:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbFWr1BVkzDqP6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 13:55:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vZec5tN2; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbFSj2ftHzDqP1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 13:52:51 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id j13so511390pjd.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Aug 2020 20:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=e09MB67Ij7GsK9jRbGZwoJdiBoqFzfp9PKD2Zog3R8M=;
 b=vZec5tN2jjngTZWDP9CG0zdp25kL7tlVMG3C0agKPBihT9o/78kJy9N0gHjRLSuT7M
 Y1TeNkJioUDvDycdHvp8ogQUoTG4V6wSsKw86mwtScB6csvLxhP34fLD2iLlqI1NDhVt
 wGaauu+dz8cLhnZGqX4ysAV8/CFLlopXiQh57jALY48iNQ+E+aL3rDVdoBooseAsT07U
 TyXNRCOalewtRjpA/FgrhzvmDWWMkRUL87hjqbQjpmSl8666ZvkCv+EFjMfe4S5OMUnk
 +Yvmz8oDYltqntV6ZQ/B9GEw3MooFnkWmdUlFsWW3Vy5Tzq3ZyhbVlO9r8kBREKS+tC9
 R9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=e09MB67Ij7GsK9jRbGZwoJdiBoqFzfp9PKD2Zog3R8M=;
 b=O0eVh4ctkMq3INpbUB6+ZI/MdhMdKGDcuia0eoH8XOhqfCdiD2mE1dwnxRuK5K4VP+
 b3i520QFSYnDmKmGJZfcY+Tvk1FdyIi6Hp2r7MY2dvsnFViPswQ3gUfk8qlAWulwZ3mJ
 2vaz+Jb+sJclR1TFQ64ZA0glAegV/mfboqrf+vIu6YqYmkHBD8qb1B2atny8dkOz6pm7
 n2FecWSJWPzPAk4w8VCuKCxOZlkFzqIUzxrY/p8ovPydcnkpI8eo9Cg8lpDkb2DS8QPJ
 8jwhjJfV0XjWoNjisEEli90Cs3EDwvg1L6eGnA/xdtnpS7vExvGiGPPmiufmsB1agjMW
 5AUw==
X-Gm-Message-State: AOAM530Gne+asxsXgGbl4kupAXxNTrK5UnmIdNSIl3naNGSNeYl2W5FK
 kPskygCvOpn4OTYkwDP/vf5dgq5Pnzw=
X-Google-Smtp-Source: ABdhPJw48rU0BoXOqpxHczQupUOB92Dfnrn7W5hFjnMEzybCl5AZlrCV2KmL6QAmcNuy8Sr7DOf7cA==
X-Received: by 2002:a17:90a:740e:: with SMTP id
 a14mr1928199pjg.165.1598327569027; 
 Mon, 24 Aug 2020 20:52:49 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id my8sm898162pjb.11.2020.08.24.20.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 20:52:48 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/boot: Update Makefile comment for 64bit wrapper
Date: Tue, 25 Aug 2020 13:51:47 +1000
Message-Id: <20200825035147.3239-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As of commit 147c05168fc8 ("powerpc/boot: Add support for 64bit little
endian wrapper") the comment in the Makefile is misleading. The wrapper
packaging 64bit kernel may built as a 32 or 64 bit elf. Update the
comment to reflect this.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/boot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index b88fd27a45f0..f8ce6d2dde7b 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -7,7 +7,7 @@
 # Based on coffboot by Paul Mackerras
 # Simplified for ppc64 by Todd Inglett
 #
-# NOTE:	this code is built for 32 bit in ELF32 format even though
+# NOTE:	this code may be built for 32 bit in ELF32 format even though
 #	it packages a 64 bit kernel.  We do this to simplify the
 #	bootloader and increase compatibility with OpenFirmware.
 #
-- 
2.17.1

