Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F2B58E6CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 07:44:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2f5m4D3zz3bgC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 15:44:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=gEmV35uM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=a38ircJ9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=gEmV35uM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=a38ircJ9;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2f516Hfcz2xHr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 15:44:03 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 5744C5C0220;
	Wed, 10 Aug 2022 01:43:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 10 Aug 2022 01:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1660110238; x=1660196638; bh=dKI86wOVzs/tjiXKhyncqqc01
	JaVIJMCTSR1z2nhVTo=; b=gEmV35uMO74/1XeBY/76CuFaFB66TmgaOcl/2DS/u
	6p0H2E581jnW46SV/Ve//edMvbuq6olEBeAWZZy8XSamLClygaImf+I+oWpPFycd
	cK43KnR0yuXBzUZE0Vg3sHCO4YblIQ9N4+McOQNnlcnXImko+0IT3ju8Srzq1NLU
	Sk1Ew18o68Xt9lSU4qVLRh0IfgVzLnY6BgczbtGl16vWLlJgn14zh4o1E0AHFr14
	5DH57eq81J3fRSBMsbAyWi4w9ACACyZSXq07+wt6gtQZpq56soy5N2exm/LNjDVl
	UHTOLN2zEZhxKrpZw4xLS8zDsvRwpWojb+XXjGG2KHPiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1660110238; x=1660196638; bh=dKI86wOVzs/tjiXKhyncqqc01JaVIJMCTSR
	1z2nhVTo=; b=a38ircJ94Fjl5u+LSggfgI/Y1amxyBJ5sDAhuMIA6QNuteqGdKM
	yTLpAm0nlwXvrCAXKvVjpqRNTnoum6+LQ1XMlLdEO+si4A/NhJnqO5IkKmL9M0E3
	DVJKxgyzLGaFCDLCCxH0scrzJI6IzqSUPNrCCv3dAJzD4oi7VFIoRHtaFpIvSWJc
	Vcc46BwaU6snjpgEO1/F5LrpyxZ2ZN1uUQbj7WoyAOfbB4r5PleWHY5AAgJfVNaJ
	43IfTg0UzDiavnn0nQ3LbBXK8gIKxaMbiiJ7rDWH9gg5pZp4srYQxZqDDL/a6nBH
	orbHkhJtdzOIschKRd9cWJPd2H0ZVGeAm0Q==
X-ME-Sender: <xms:nUXzYnLQ1CTc-IkphAEtPyM27cSD_Tw4Wu4fqr6gPgM4SxTKvwvzbQ>
    <xme:nUXzYrJI8S5yidvPOi0Rlo3ejpHDTrb-4ie-79qjoScm6-RjsOs8-wgQonitg4X0p
    v5C8uhRAwynWA8dQw>
X-ME-Received: <xmr:nUXzYvs3hBuhl1l7EpHAnhGsp39AUrx3eDViQNZLGG5Ixj4RjHx-ejilpgB7l_93yeOKktOBCqZxNgnqZWM6VQpEYqEoNaA6RmPRHWmzdwYwEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeguddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdduhedmnecujfgurhephf
    fvvefufffkofgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
    vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepvd
    egudetjefgveevvedutdeigeelueffvefhfeeuheeuffekhfffheegheejhfdtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrse
    hruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:nUXzYgbE3gtPzqfKsWrRYk_1UOrv3P8k6WyD5vp0cMHeug9W7fBBTA>
    <xmx:nUXzYuaewlcXvVWSo7_CWVgD1sgGPJ20S1WIGMVVxV5-_lIIElK7GA>
    <xmx:nUXzYkDojqmFM0eMM0WYuNvoUihylPWfz_9LBFVOzY1ZR4QxGLCoRQ>
    <xmx:nkXzYlUWtbDgRu900DGLiTRCyFYdCNQmGTcxcTTYso4OWQJ_M1G08A>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Aug 2022 01:43:55 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org,
	aik@ozlabs.ru
Subject: [PATCH v2] powerpc/kexec: Fix build failure from uninitialised variable
Date: Wed, 10 Aug 2022 15:43:31 +1000
Message-Id: <20220810054331.373761-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.37.1
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
Cc: nathan@kernel.org, Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

clang 14 won't build because ret is uninitialised and can be returned if
both prop and fdtprop are NULL.  Drop the ret variable and return an
error in that failure case.

Fixes: b1fc44eaa9ba ("pseries/iommu/ddw: Fix kdump to work in absence of ibm,dma-window")
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
v2: adopt Christophe's suggestion, which is better

 arch/powerpc/kexec/file_load_64.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 683462e4556b..349a781cea0b 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -1043,17 +1043,17 @@ static int copy_property(void *fdt, int node_offset, const struct device_node *d
 			 const char *propname)
 {
 	const void *prop, *fdtprop;
-	int len = 0, fdtlen = 0, ret;
+	int len = 0, fdtlen = 0;
 
 	prop = of_get_property(dn, propname, &len);
 	fdtprop = fdt_getprop(fdt, node_offset, propname, &fdtlen);
 
 	if (fdtprop && !prop)
-		ret = fdt_delprop(fdt, node_offset, propname);
+		return fdt_delprop(fdt, node_offset, propname);
 	else if (prop)
-		ret = fdt_setprop(fdt, node_offset, propname, prop, len);
-
-	return ret;
+		return fdt_setprop(fdt, node_offset, propname, prop, len);
+	else
+		return -FDT_ERR_NOTFOUND;
 }
 
 static int update_pci_dma_nodes(void *fdt, const char *dmapropname)
-- 
2.37.1

