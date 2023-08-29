Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BBF78C272
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 12:41:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AyFXxjMV;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HhTkwVFq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZkWG3Pqdz3bjc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 20:41:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AyFXxjMV;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HhTkwVFq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZkVL5t6Hz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 20:40:58 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 5168F1F45F;
	Tue, 29 Aug 2023 10:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1693305654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=boLPT8o1QF6Jm6UzBrYuJYuMB2bVuNiI0g7yzi9m94M=;
	b=AyFXxjMVNjn6gp6ULns0IM/sCnoDFhgAN2NqdIKakNDCwnjfplssIN5+ITt3rlqqAaV2RZ
	TYmWECro/G+XqySEepxPl55GGdLR+wefgGGEZV9ju21TyCbIGxE1yJbRXNT/chyx4ZCsh1
	Tkjk4TTTWp9Ci1dMLd/0JqF1rtCAKMI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693305654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=boLPT8o1QF6Jm6UzBrYuJYuMB2bVuNiI0g7yzi9m94M=;
	b=HhTkwVFqbsvvOSAdzWJ4prBV7PP+oBRQcAqBxf3n9H0qidx6s3DXN9qs3/74hZixyMjPt7
	y9eYl6pxifCNcwAA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	by relay2.suse.de (Postfix) with ESMTP id 74A502C145;
	Tue, 29 Aug 2023 10:40:53 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] kbuild: dummy-tools: -mprofile-kernel is not limited to little endian
Date: Tue, 29 Aug 2023 12:40:44 +0200
Message-ID: <20230829104047.20841-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.41.0
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes: aec0ba7472a7 ("powerpc/64: Use -mprofile-kernel for big endian ELFv2 kernels")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 scripts/dummy-tools/gcc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/dummy-tools/gcc b/scripts/dummy-tools/gcc
index 1db1889f6d81..ebb34d016e5f 100755
--- a/scripts/dummy-tools/gcc
+++ b/scripts/dummy-tools/gcc
@@ -85,7 +85,7 @@ if arg_contain -S "$@"; then
 	fi
 
 	# For arch/powerpc/tools/gcc-check-mprofile-kernel.sh
-	if arg_contain -m64 "$@" && arg_contain -mlittle-endian "$@" &&
+	if arg_contain -m64 "$@" &&
 		arg_contain -mprofile-kernel "$@"; then
 		if ! test -t 0 && ! grep -q notrace; then
 			echo "_mcount"
-- 
2.41.0

