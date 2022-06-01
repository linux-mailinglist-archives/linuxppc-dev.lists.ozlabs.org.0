Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 848C353ACA0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 20:21:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCyCW3JzXz3cd4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 04:21:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=xTkhr0bx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.74; helo=conuserg-07.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=xTkhr0bx;
	dkim-atps=neutral
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCyBP65lRz3bpy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 04:20:45 +1000 (AEST)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
	by conuserg-07.nifty.com with ESMTP id 251IJkAQ014364;
	Thu, 2 Jun 2022 03:19:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 251IJkAQ014364
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1654107588;
	bh=1RpBGGftTVY4f1Th6jTQ5+KvJS9jZPLe7SVIWfT+mGI=;
	h=From:To:Cc:Subject:Date:From;
	b=xTkhr0bxDTEhtAk049KwrvCmJ8PmfLMOvfNqYQv6N1GGs+1JIoRe9bq32+GbKo7xo
	 6xLmO4yTpuIDczaOmrBiVYnxsQX9ze7wx8Xihc/Tcx23X8J3wMoBdOJCUFP9eFDmhC
	 FLqI2bfsMUORfZV3101r6VtWVpZsDX8rnIxwYLBvY03REIrUkBZWLcQCswwMBRrxRd
	 Xlh6JNyLIDBImFMen49QIfM1KpjSpV3QeKr+FWvAAUiMgafbPC1fcdl62ZM7GFbGW1
	 Z9hnHTrCa+k2Ll6r9C5vBROZCNUUBwBNzl0fbSRa81NuSX4cPQOeHO//MqIg9pzNBW
	 5PwU3IW5gfyUQ==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/3] asm-generic: fix misconversion of {uid,gid}_t
Date: Thu,  2 Jun 2022 03:19:38 +0900
Message-Id: <20220601181941.3706832-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Todd Kjos <tkjos@android.com>, Masahiro Yamada <masahiroy@kernel.org>, Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Christopher Ferris <cferris@google.com>, sparclinux@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I accidentally broke android binder.h:
  https://lore.kernel.org/all/20220601010017.2639048-1-cmllamas@google.com/

I checked my previous conversions, and found some more.
(at least, the sparc one seems fatal.)



Masahiro Yamada (3):
  mips: use __kernel_{uid,gid}32_t in uapi/asm/stat.h
  powerpc: use __kernel_{uid,gid}32_t in uapi/asm/stat.h
  sparc: fix mis-use of __kernel_{uid,gid}_t in uapi/asm/stat.h

 arch/mips/include/uapi/asm/stat.h    | 12 ++++++------
 arch/powerpc/include/uapi/asm/stat.h |  4 ++--
 arch/sparc/include/uapi/asm/stat.h   |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.32.0

