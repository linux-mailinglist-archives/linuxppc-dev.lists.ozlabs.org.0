Return-Path: <linuxppc-dev+bounces-6372-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CA1A3E84B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2025 00:22:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YzTmm1YbXz2yG9;
	Fri, 21 Feb 2025 10:22:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b9"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740093720;
	cv=none; b=g1uHWx0gmhtDx5WrcGbxLPsgNkbTBZoEXbrkBFxTrhYSildxXp6SmEobHwPVVb0x7cKMkTUZFrZkgooPPep+so7Hmi+Ge+V4Wkd53CPbJnOU2fvFE1sXRqOMmp6BY3+dwWVhuJgVLBUaBJBSro99GR8tI+FtqTCnlrJ6pO6U3+I2IjYfh0sfkRKtcJBFliTd9vC75rCU17ncSasngsBiXoibIoDOtc9+/al9dckjqdckN5e697s/sV8OnbtL+1EKXpWXXMvxvpnonx/554UGwqTHem/bQhVL2ZzSbWgHSH7nxXCr/U6ZhWg8EX55ZVinjjpY6QPHqcpx8EuHRfoHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740093720; c=relaxed/relaxed;
	bh=Zm+fIkprFMzXqFqejHYGRIWeMskyoEAHZq3W3dz6AW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ORZM2rpKR28I2OJVvdcINFufUjvACqltiGfj7A79im+tZWDUOUVUtWQvgHvCpRN8x7DCotaNywpTCUfyGJso3iOa6yjxr3BwSViwHlfvbAQr1iTeK3ekVuliiOjTfyJy7758n+iBSDjgWFfDnTbDIyE2rJGMewKB0fzzGiqzBTbzbXgLkLiysCvJV2H+W0rlCiA+GA+coaofbpaRUdtQ139RBJe+AxP7Cp+4v4kzOc+S8BqlWsnnPmNXSpE7y/V3oy+kShL/sYRqZHbIKEiIUwMtdhXXDeJ9sComcPlFsQAKS8FSijcyKg133WRp/WWLsrkXPtisw4uSfouuTRXS+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DaDqapGV; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b9; helo=out-185.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DaDqapGV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b9; helo=out-185.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YzTmh5W31z2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2025 10:21:55 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740093693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zm+fIkprFMzXqFqejHYGRIWeMskyoEAHZq3W3dz6AW8=;
	b=DaDqapGVqZFoote3oBKSCfSKz8yS3GCvcGZZqbYcYUwKdoqKz0rQJKvHfDRiZCcemyw4t+
	NZhSovbH+/jvLHTC1QmuLClo52pUGEZ9FmtOEQxjvaiCFVc4gViczGxcNs07W4Ni8k+5Pm
	+Ns0G4E0mXgF15jk5D4WaRNg2Oc3hTc=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: powerpc: Enable commented out BUILD_BUG_ON() assertion
Date: Fri, 21 Feb 2025 00:20:19 +0100
Message-ID: <20250220232019.196380-2-thorsten.blum@linux.dev>
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
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The BUILD_BUG_ON() assertion was commented out in commit 38634e676992
("powerpc/kvm: Remove problematic BUILD_BUG_ON statement") and fixed in
commit c0a187e12d48 ("KVM: powerpc: Fix BUILD_BUG_ON condition"), but
not enabled. Enable it now that this no longer breaks and remove the
comment.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/kvm/timing.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/kvm/timing.h b/arch/powerpc/kvm/timing.h
index 45817ab82bb4..14b0e23f601f 100644
--- a/arch/powerpc/kvm/timing.h
+++ b/arch/powerpc/kvm/timing.h
@@ -38,11 +38,7 @@ static inline void kvmppc_set_exit_type(struct kvm_vcpu *vcpu, int type) {}
 static inline void kvmppc_account_exit_stat(struct kvm_vcpu *vcpu, int type)
 {
 	/* type has to be known at build time for optimization */
-
-	/* The BUILD_BUG_ON below breaks in funny ways, commented out
-	 * for now ... -BenH
 	BUILD_BUG_ON(!__builtin_constant_p(type));
-	*/
 	switch (type) {
 	case EXT_INTR_EXITS:
 		vcpu->stat.ext_intr_exits++;
-- 
2.48.1


