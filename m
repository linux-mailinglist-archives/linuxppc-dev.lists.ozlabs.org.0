Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C653051140F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 11:07:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpCZ14v0Cz3bZp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 19:07:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=bNqnOxFg;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=KMneS4G1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org;
 envelope-from=srs0=/bup=vf=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256
 header.s=20210105 header.b=bNqnOxFg; 
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.a=rsa-sha256 header.s=20210105 header.b=KMneS4G1; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpCYG2P9bz2xtQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 19:06:42 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 57E1BB82574
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 09:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F64C385A7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 09:06:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bNqnOxFg"; 
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="KMneS4G1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651050393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:resent-to:
 resent-from:resent-message-id:in-reply-to:in-reply-to:
 references:references:list-id:list-unsubscribe:list-subscribe;
 bh=pUHHdLwvu8D+pM4yd5YOrXXNyRmGequZRfMy8dGDcBI=;
 b=bNqnOxFgoZoA1WvebUvvMecBVsBttBje7F8U3IM27TF+RyJiHwweJ+C4Hfab9UXmpmAv77
 puoSrYRfuOXLxTK5TzJtcFHbk3/7VXFSqE2xshAHoorJNroGu2XajT6rNuVs005vospYPH
 LWwpNPINvz6nL1Yyn82GBbKnhMfDtOo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8b6d9f05
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <linuxppc-dev@lists.ozlabs.org>;
 Wed, 27 Apr 2022 09:06:32 +0000 (UTC)
Resent-From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Resent-Date: Wed, 27 Apr 2022 11:06:31 +0200
Resent-Message-ID: <YmkHl/7yQeWnGyj3@zx2c4.com>
Resent-To: linuxppc-dev@lists.ozlabs.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org
 [10.30.226.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D493227
 for <patches@lists.linux.dev>; Sat, 23 Apr 2022 21:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61D3C385A0;
 Sat, 23 Apr 2022 21:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1650749237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pUHHdLwvu8D+pM4yd5YOrXXNyRmGequZRfMy8dGDcBI=;
 b=KMneS4G1fGRHyicCbeubvxDqbeOqFGghuQWW6dymlLTI/13i6ORVrgHXsoIOeAGB3onwXy
 H4fmDoQNvbHpQe+EoWk30cu2unbWqSyIQMlJJrnLsAKdNlkF81gXXYlLJHvhoUOMxmB/3l
 p6j6atC4/e153rf+RRaz8DTANcgrnLg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 25517095
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sat, 23 Apr 2022 21:27:16 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 tglx@linutronix.de, arnd@arndb.de
Subject: [PATCH v6 05/17] powerpc: define get_cycles macro for arch-override
Date: Sat, 23 Apr 2022 23:26:11 +0200
Message-Id: <20220423212623.1957011-6-Jason@zx2c4.com>
In-Reply-To: <20220423212623.1957011-1-Jason@zx2c4.com>
References: <20220423212623.1957011-1-Jason@zx2c4.com>
Precedence: bulk
X-Mailing-List: patches@lists.linux.dev
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerPC defines a get_cycles() function, but it forgot to do the usual
`#define get_cycles get_cycles` dance, making it impossible for generic
code to see if an arch-specific function was defined.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/powerpc/include/asm/timex.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/timex.h b/arch/powerpc/include/asm/timex.h
index fa2e76e4093a..14b4489de52c 100644
--- a/arch/powerpc/include/asm/timex.h
+++ b/arch/powerpc/include/asm/timex.h
@@ -19,6 +19,7 @@ static inline cycles_t get_cycles(void)
 {
 	return mftb();
 }
+#define get_cycles get_cycles
 
 #endif	/* __KERNEL__ */
 #endif	/* _ASM_POWERPC_TIMEX_H */
-- 
2.35.1

