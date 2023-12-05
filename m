Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE5E804933
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 06:12:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Xo8WphHl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkpZG28xHz3cYh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 16:12:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Xo8WphHl;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkpYR6Bv4z3c76
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 16:11:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701753114;
	bh=2anY2QdcZbB0B1tISoPHXMFtfB5Mk2f/RoHBqPIh/pc=;
	h=From:To:Cc:Subject:Date:From;
	b=Xo8WphHlrv0Dfbn1TxwQ6oFPLlSjpj4t7DW39/rp8v3ZBM/fb9IANjYOYT8UrK7rb
	 7p6+gy769o6XvpgH7di0z4ljE4VYF7x/nFWoCjLCRavC3uWgoDykGh0A3ikLlRBv2M
	 oa05KZOhCJltd/4VyjhMM/JiDgBcgnIvtZaT+0HIcp0s7FPTv2fVu2aL08cfUnmQaj
	 yqwzl3thzwRAUZMsmL3Y9ccgKqM1I4nMdZ9p9YrIVnZiOVSt3zpWu0jskuk3plSlns
	 BgehYzH8qWSOU7SMziAyzaPBpkriIAze1scn1XIgA7r2UeRjnQ1Y3g3zXcin5GgXuz
	 2In9bguNy/nBQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SkpYP2tqHz4wd6;
	Tue,  5 Dec 2023 16:11:53 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] MAINTAINERS: powerpc: Add Aneesh & Naveen
Date: Tue,  5 Dec 2023 16:11:05 +1100
Message-ID: <20231205051105.736470-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.0
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
Cc: naveen.n.rao@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh and Naveen are helping out with some aspects of upstream
maintenance, add them as reviewers.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea790149af79..562d048863ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12240,6 +12240,8 @@ LINUX FOR POWERPC (32-BIT AND 64-BIT)
 M:	Michael Ellerman <mpe@ellerman.id.au>
 R:	Nicholas Piggin <npiggin@gmail.com>
 R:	Christophe Leroy <christophe.leroy@csgroup.eu>
+R:	Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
+R:	Naveen N. Rao <naveen.n.rao@linux.ibm.com>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Supported
 W:	https://github.com/linuxppc/wiki/wiki
-- 
2.43.0

