Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DEC19BD1A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 09:53:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tFfd6v90zDrHY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 18:52:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=tZ0wb+ZQ; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tFFC181LzDrR6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 18:34:22 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48tFF60bQTz9txL3;
 Thu,  2 Apr 2020 09:34:18 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tZ0wb+ZQ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 1R7pAmPi39BZ; Thu,  2 Apr 2020 09:34:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48tFF56cN2z9txKx;
 Thu,  2 Apr 2020 09:34:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585812857; bh=EnNUuGCMz6bk/dO3z5czXXoQkB26spC2D2RLTxDm6dY=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=tZ0wb+ZQyHLgTmXLJ8FEgt5OJA8l60TUwfuw0HeK4TWsAXbQmXnkOlCa+kpFC9Klt
 NGXGC8Pk+7k0DQXtb+4XaAVRQI695aXjOuMwdoZ0SbOOfqW/+Q2GgVmGIz5YfDYSWL
 XXGnecRWKOpfUpkooAxHdeT5W8Eysdj0Vc9+feqY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D4D578B76E;
 Thu,  2 Apr 2020 09:34:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id krpMluquUZLm; Thu,  2 Apr 2020 09:34:18 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 985C88B75E;
 Thu,  2 Apr 2020 09:34:18 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 68681656BF; Thu,  2 Apr 2020 07:34:18 +0000 (UTC)
Message-Id: <6da6fa391c0d6344cc9ff99a69fcaa65666f3947.1585811416.git.christophe.leroy@c-s.fr>
In-Reply-To: <27106d62fdbd4ffb47796236050e418131cb837f.1585811416.git.christophe.leroy@c-s.fr>
References: <27106d62fdbd4ffb47796236050e418131cb837f.1585811416.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH RESEND 3/4] drm/i915/gem: Replace user_access_begin by
 user_write_access_begin
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 airlied@linux.ie, daniel@ffwll.ch, torvalds@linux-foundation.org,
 viro@zeniv.linux.org.uk, akpm@linux-foundation.org, keescook@chromium.org,
 hpa@zytor.com
Date: Thu,  2 Apr 2020 07:34:18 +0000 (UTC)
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
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When i915_gem_execbuffer2_ioctl() is using user_access_begin(),
that's only to perform unsafe_put_user() so use
user_write_access_begin() in order to only open write access.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 7643a30ba4cd..4be8205a70b6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1611,14 +1611,14 @@ static int eb_copy_relocations(const struct i915_execbuffer *eb)
 		 * happened we would make the mistake of assuming that the
 		 * relocations were valid.
 		 */
-		if (!user_access_begin(urelocs, size))
+		if (!user_write_access_begin(urelocs, size))
 			goto end;
 
 		for (copied = 0; copied < nreloc; copied++)
 			unsafe_put_user(-1,
 					&urelocs[copied].presumed_offset,
 					end_user);
-		user_access_end();
+		user_write_access_end();
 
 		eb->exec[i].relocs_ptr = (uintptr_t)relocs;
 	}
@@ -1626,7 +1626,7 @@ static int eb_copy_relocations(const struct i915_execbuffer *eb)
 	return 0;
 
 end_user:
-	user_access_end();
+	user_write_access_end();
 end:
 	kvfree(relocs);
 	err = -EFAULT;
@@ -2991,7 +2991,8 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 		 * And this range already got effectively checked earlier
 		 * when we did the "copy_from_user()" above.
 		 */
-		if (!user_access_begin(user_exec_list, count * sizeof(*user_exec_list)))
+		if (!user_write_access_begin(user_exec_list,
+					     count * sizeof(*user_exec_list)))
 			goto end;
 
 		for (i = 0; i < args->buffer_count; i++) {
@@ -3005,7 +3006,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 					end_user);
 		}
 end_user:
-		user_access_end();
+		user_write_access_end();
 end:;
 	}
 
-- 
2.25.0

