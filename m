Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 236D12552E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 04:07:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bd2zw1h01zDqlp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 12:07:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm2 header.b=FhnqN1yQ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=vB6ZKne0; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bd2y65j92zDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 12:06:00 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 262C7906;
 Thu, 27 Aug 2020 22:05:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 27 Aug 2020 22:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=IQ+wkRzWbXfTOH7bCORRONMvkU
 j/OoWeT1i4dKNtbgg=; b=FhnqN1yQVSR77ukz87YEy4Ngv7Hdk5RqfTmteLp1Dl
 ZkREQ82iLcjWfxVU7kNI3JdDHIL8QXBvKrt7AXY2N7IhP2t3phXd3h0W7Rff1UCz
 M/Eqo9i22wZ069ViMGZHxbmXhVaKSD1C0WaK9qk4V80ESnWU/ZjKqxnu76rL7m/5
 0NOabQKNJp7iOemfotHR/Dzq4u8QEs9jNTYgb73jvj3EoxhLZpbPX8rnm6Vf1jX+
 0C84m4UcuBDl0ROXumVFDHWb7Bu/1DhZ3CPzkKkVd8P3VdO/hLJd0x8cF0G3UCO9
 UEf6cLP1o+PY4EaAixdfINVfykHO24fJMypqeXRviQkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=IQ+wkRzWbXfTOH7bC
 ORRONMvkUj/OoWeT1i4dKNtbgg=; b=vB6ZKne0HzgEO8L4LGRvR9lX1yHUBFym9
 QH/dtkt2bA1Bal0IVKVf3wMkpzy5Gd8S4CNs4PAT3VmY+8kzXlp/w3urkJgjljvI
 qvZIJGevcnH84hivN29YdaXNEfPVXyw/gZxnTiKDzIIpzbf6SoY6xmYjfMAxhhgs
 4mc1PxwW0rGvnCjwDo2lj2oMxKdE7iVHix3jO4MEAR6FR8TnTEAAdZg92chsXGT/
 0oo5If9v41F6EJXElOZJ+KkObfY8dZbZnTQfIuFHcMd2E0hJ6MF2GKiBbwui81Cc
 L2Qlzrbrv9N5wiKjnw4rWjHPTDOFxjt1TWsPQqwImNb0HuxgidrAA==
X-ME-Sender: <xms:g2ZIX5O2NRs8mGLoy0hGe-_Df73Yz8tToAYBHCJasjLJiYeR8kjHDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddviedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
 fufffkofgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhrvgih
 uceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepleegle
 efvdffkeegveefleevfedtieelgfdugeekueehhfevgfffkeeugfffkeefnecukfhppedu
 jedvrdduleefrdegiedrheejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:g2ZIX7_qYOndRgvglNaGLf9saBWiwfPqOKk4eWqXnj6A6rYdjn9nog>
 <xmx:g2ZIX4Tln3JscYRB3SEWr8yqlUfDJsJCmriOhjrQyiQ_XpZZbNzmEg>
 <xmx:g2ZIX1u93Mh3u2fCB-bqdUeP5y56A4yIBnroIiyw_Eb0N8o9Www0fQ>
 <xmx:g2ZIX7pA4RqCA3_W7pgfq5phGmmwxN18L_JTJgoeh-npsNID3HmpJA>
Received: from crackle.ozlabs.ibm.com.com (cpe-172-193-46-57.qld.foxtel.net.au
 [172.193.46.57])
 by mail.messagingengine.com (Postfix) with ESMTPA id B0AD7328005D;
 Thu, 27 Aug 2020 22:05:54 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/tools: Remove 90 line limit in checkpatch script
Date: Fri, 28 Aug 2020 12:05:42 +1000
Message-Id: <20200828020542.393022-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.28.0
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

As of commit bdc48fa11e46, scripts/checkpatch.pl now has a default line
length warning of 100 characters.  The powerpc wrapper script was using
a length of 90 instead of 80 in order to make checkpatch less
restrictive, but now it's making it more restrictive instead.

I think it makes sense to just use the default value now.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/tools/checkpatch.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/tools/checkpatch.sh b/arch/powerpc/tools/checkpatch.sh
index 3ce5c093b19d..91c04802ec31 100755
--- a/arch/powerpc/tools/checkpatch.sh
+++ b/arch/powerpc/tools/checkpatch.sh
@@ -9,7 +9,6 @@ script_base=$(realpath $(dirname $0))
 exec $script_base/../../../scripts/checkpatch.pl \
 	--subjective \
 	--no-summary \
-	--max-line-length=90 \
 	--show-types \
 	--ignore ARCH_INCLUDE_LINUX \
 	--ignore BIT_MACRO \
-- 
2.28.0

