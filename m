Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 439155BE5B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 14:26:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MX13s6RhNz3f5x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 22:26:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A4lsNk7/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A4lsNk7/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A4lsNk7/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A4lsNk7/;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MX10r2MXxz3c1c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 22:23:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663676601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bJLXUbRPoBL46dcO0XZc1HhT2Y45lUQGJ1HmTGP+Pj8=;
	b=A4lsNk7/iQZB89KjB+ZiQ8dxr3i5MEwR0WRHy9U+ucpmWxz0tjwmf0HXgsw7AYzCKaANpE
	6H0mNfmOpA+/3dNJj4WCIrAosWS3j6YohxpkXuKOgwOLaNrs+KRvOjpvEiJrrhM6POkPQZ
	gMVccIHAcSMZzSmtlpbaR71CzyWzn5Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663676601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bJLXUbRPoBL46dcO0XZc1HhT2Y45lUQGJ1HmTGP+Pj8=;
	b=A4lsNk7/iQZB89KjB+ZiQ8dxr3i5MEwR0WRHy9U+ucpmWxz0tjwmf0HXgsw7AYzCKaANpE
	6H0mNfmOpA+/3dNJj4WCIrAosWS3j6YohxpkXuKOgwOLaNrs+KRvOjpvEiJrrhM6POkPQZ
	gMVccIHAcSMZzSmtlpbaR71CzyWzn5Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-Emjs82K7M7iPfvk_Mfu3Eg-1; Tue, 20 Sep 2022 08:23:18 -0400
X-MC-Unique: Emjs82K7M7iPfvk_Mfu3Eg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F8F4862FE2;
	Tue, 20 Sep 2022 12:23:17 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E4ED6C15BB5;
	Tue, 20 Sep 2022 12:23:13 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] powerpc/prom_init: drop PROM_BUG()
Date: Tue, 20 Sep 2022 14:23:01 +0200
Message-Id: <20220920122302.99195-3-david@redhat.com>
In-Reply-To: <20220920122302.99195-1-david@redhat.com>
References: <20220920122302.99195-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Baoquan He <bhe@redhat.com>, David Hildenbrand <david@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, Dave Young <dyoung@redhat.com>, linux-doc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-mm@kvack.org, David Laight <David.Laight@ACULAB.COM>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Unused, let's drop it.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/kernel/prom_init.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index a6669c40c1db..d464ba412084 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -96,12 +96,6 @@ static int of_workarounds __prombss;
 #define OF_WA_CLAIM	1	/* do phys/virt claim separately, then map */
 #define OF_WA_LONGTRAIL	2	/* work around longtrail bugs */
 
-#define PROM_BUG() do {						\
-        prom_printf("kernel BUG at %s line 0x%x!\n",		\
-		    __FILE__, __LINE__);			\
-	__builtin_trap();					\
-} while (0)
-
 #ifdef DEBUG_PROM
 #define prom_debug(x...)	prom_printf(x)
 #else
-- 
2.37.3

