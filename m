Return-Path: <linuxppc-dev+bounces-3656-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 673C59DF87B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 02:22:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1mGB6XCWz2yjR;
	Mon,  2 Dec 2024 12:21:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733102498;
	cv=none; b=IsKcjw2s2Yf1wWJraPoHECByIUQ71zDHhnDeA1lilMZT6+ZmgB7F4qFL5i9FH1aRF5OKjYyoMy7f/8sS84LkXYc0DLgufCU85GgCPOaS99yP/d3Zc966LCE59rxVW557ObeHGH/VmCTJgmnuGKulSYWBycZLcu1BTF9B9M7Jinvy2SAgQstdq2DVw/rTlvbVMyIFjyU9hjww66qQzpN7PxVobbtzYz2HvLSMU3lK5Qr3Q5lEk0utMR/rzUa42mU0USWepuTAFi/mC6iBvjX+R2UnI3LEVxq55v1Zej2ZikHIYX1Wypxx5mUQuZ6f9Js3bDIQMC4HrhF6gut75BcyYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733102498; c=relaxed/relaxed;
	bh=rbngkL2AAfbiqCWERdYqPYAG3kAI2Wm0NyNCB9YfUCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T/eF0OINy6kvXN99yKPK5edLcBT35RKK3ZNW3BdqipPCO+XdOybdPWyH9xko2bgEoCVoE6Pq6l6YMiL5uj/+v5Lp4Yk8qsFNl1o7omsMVaMWbE+YZwORrLac6pTSiiYFRUZmiE6eFyy6JAnwZENWaAJR0TOV30KvoX+8Tmq+kNxmZH7uSs4dXLC2GMZ3s9YZD0g4M/GQx+ruaK/fuYmVJFDnLi74S8KjH65pquhp1tC96htCm86Yb5yV8C3VSOkDPztPRIDzOzDY6cyxIrF29+yb/OFDiJZdnw9gHOgPdnRvPWGJRB8XwsvtX4k8HxlezMxAmAbp8MdmhiDndptZAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mhYadkzk; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mhYadkzk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1mG90y5Sz2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 12:21:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47C0BA40C19;
	Mon,  2 Dec 2024 01:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496B3C4CEE1;
	Mon,  2 Dec 2024 01:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733102493;
	bh=tOkBM9OKj+QnnDmg3KXsNuWzGOUW1YaMaa8G27/37Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mhYadkzk8Wpm1ITszh4LwCoo6RCymijkaws9sU9g/KGsy9DSpWRmbKngnVBniKYZv
	 ErPb16+qEvaUkykp4VtBfrvOfVTPr64cYgZw2glt62J0whPQAGvPo9CTqugNtHLf7c
	 bR6tfEyyt9k48DlViebHmXiT/K8l+bd6vLUVwdrY6vcmczq5K5kKDEUS4ny5en5mgQ
	 j5i62pwZxIzqgUh0vTPC6/rv0sbFcxGUkXFPlAfdlelqDdzIhTSlk643ODVxFPEpTW
	 UOUjKNwH5bTSyGAWLP2m00SXeKqdb65SxhRJUtEBjn+EfI5V1uAWfpK3gMgnUe3no5
	 t8LBK7cKrA3RA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v2 12/12] MAINTAINERS: add entry for CRC library
Date: Sun,  1 Dec 2024 17:20:56 -0800
Message-ID: <20241202012056.209768-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202012056.209768-1-ebiggers@kernel.org>
References: <20241202012056.209768-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

I am volunteering to maintain the kernel's CRC library code.

Ard has volunteered to be a reviewer.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..b7eb0c0a9c1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6054,10 +6054,21 @@ CRAMFS FILESYSTEM
 M:	Nicolas Pitre <nico@fluxnic.net>
 S:	Maintained
 F:	Documentation/filesystems/cramfs.rst
 F:	fs/cramfs/
 
+CRC LIBRARY
+M:	Eric Biggers <ebiggers@kernel.org>
+R:	Ard Biesheuvel <ardb@kernel.org>
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-next
+F:	Documentation/staging/crc*
+F:	arch/*/lib/crc*
+F:	include/linux/crc*
+F:	lib/crc*
+
 CREATIVE SB0540
 M:	Bastien Nocera <hadess@hadess.net>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-creative-sb0540.c
-- 
2.47.1


