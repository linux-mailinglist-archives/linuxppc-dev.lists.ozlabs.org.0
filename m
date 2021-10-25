Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A45024393C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 12:33:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdB9w43dpz2ymr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 21:33:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=yL9PvYco;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=gGAl0Rug;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm3 header.b=yL9PvYco; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=gGAl0Rug; 
 dkim-atps=neutral
X-Greylist: delayed 446 seconds by postgrey-1.36 at boromir;
 Mon, 25 Oct 2021 21:32:27 AEDT
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdB972q7bz2xRq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 21:32:27 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 619B15C015B;
 Mon, 25 Oct 2021 06:24:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 06:24:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=xIB7YiLKZ9FcfAdGjaDCq1/ll3
 +RJoG2srq5m4FT1VI=; b=yL9PvYcoQPAlnqmsGE8Lq726c349cCcGX7yt9x3fgF
 3zp7qFvwE7dP6CaO4/B4Afx1rJWS73e9tODOGXcTTx4WK53tfdzWiTHREKnoXCip
 ZZJTC7LCWudkkAtn1PfrMHncDJ8sDV6VagQW5qBj04CuKK6EQ8IXhCUJ7l23+pyd
 pmKTZhN0xG6P2CVs4v8Jjf9xh4He/FKg5+tdT1Qv4//aGFloSBZEpqVNeRkwlxiY
 UzorWVroAFiiBa94BkxlEtPI+X3rmav8CPymnbEgflARcg1nkQ5LMWcmBYYSBls8
 4FS45QOjAUjlR+D+k1V695C1cdd+s8guwEyliA2p2E9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xIB7YiLKZ9FcfAdGj
 aDCq1/ll3+RJoG2srq5m4FT1VI=; b=gGAl0RugRLSBXEujS+yWMwwRotYpR/zBx
 B050xC0xS6OveBc+WdGfL3xdyh5qIVZnQWQp21IcBkMNnqp4O5K/xc7c6p0l3LA7
 Z/tbLUd7iswUVO3Dsgr7ginMns/yC7IhX8Bs1Kj4nREvPyK3rk5ml/FRuhoTG+pA
 FMu6xvNeZfqqPS8/agigyUyAUiEWB+i1lfaX+kt1F081oMSK5MjPwqaSAB8s1t8h
 wJFjgdj37plfF598qPANjqj+1wKnBFiRvkEdc5FDIrXMgVw55W33uholzMn0ptNs
 2hs2aajhpBk28pT8FlA95uDHUp0zGue2vPT3EPj5lb1ZxOq3hxQlw==
X-ME-Sender: <xms:-IV2YULZ7IL_s_NWAFlxlIX10yIfZgrJr_chpSDskpnVMURUKHR9yA>
 <xme:-IV2YULp11blKT4FTvkx4Fnue49lzust0FJWEUFOwpap00pj2AM5iInYL8F91mC75
 c1RBS-oqs8tb5Ki4w>
X-ME-Received: <xmr:-IV2YUv1tzFRwnQSM5z38QpA5mk1Uv9RB4XNkw0Fm1vo4kQ4dbRv_jCTTuh_0gJJEuacBODOzjfeVPCwJoLIK1nS4-Z2Lf4mJDunmxIeIdLX_Uyk6vDtjfZwfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
 fufffkofgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhrvgih
 uceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepleegle
 efvdffkeegveefleevfedtieelgfdugeekueehhfevgfffkeeugfffkeefnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruh
 hsshgvlhhlrdgttg
X-ME-Proxy: <xmx:-IV2YRY_vOFfVv6dDDl-W3K51QmWcJECHts91njOw8BYXywZq_k8Nw>
 <xmx:-IV2YbZkYLa-SVGgoDVnWPJ6LkImB99plwBUyifGtpBk0omDipJPmA>
 <xmx:-IV2YdABNW4DmM2WJ4Q8QHgWiPmuCkCKu_OblIGQKrC5tvNvEt0RcA>
 <xmx:-YV2YcBQNNvsKHEoILjiC6I46Nyd51Kw5Q5IvOMbijk1m0rfKpwaxw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 06:24:55 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: Use date instead of EPOCHSECONDS in
 mitigation-patching.sh
Date: Mon, 25 Oct 2021 20:24:36 +1000
Message-Id: <20211025102436.19177-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.33.1
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
Cc: Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The EPOCHSECONDS environment variable was added in bash 5.0 (released
2019).  Some distributions of the "stable" and "long-term" variety ship
older versions of bash than this, so swap to using the date command
instead.

"%s" was added to coreutils `date` in 1993 so we should be good, but who
knows, it is a GNU extension and not part of the POSIX spec for `date`.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 .../testing/selftests/powerpc/security/mitigation-patching.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/security/mitigation-patching.sh b/tools/testing/selftests/powerpc/security/mitigation-patching.sh
index 00197acb7ff1..b0b20e0b4e30 100755
--- a/tools/testing/selftests/powerpc/security/mitigation-patching.sh
+++ b/tools/testing/selftests/powerpc/security/mitigation-patching.sh
@@ -13,7 +13,7 @@ function do_one
 
     orig=$(cat "$mitigation")
 
-    start=$EPOCHSECONDS
+    start=$(date +%s)
     now=$start
 
     while [[ $((now-start)) -lt "$TIMEOUT" ]]
@@ -21,7 +21,7 @@ function do_one
         echo 0 > "$mitigation"
         echo 1 > "$mitigation"
 
-        now=$EPOCHSECONDS
+        now=$(date +%s)
     done
 
     echo "$orig" > "$mitigation"
-- 
2.33.1

