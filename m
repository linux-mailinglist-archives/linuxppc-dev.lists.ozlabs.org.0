Return-Path: <linuxppc-dev+bounces-11311-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9E0B35969
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 11:53:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB2zd6LSjz3dRb;
	Tue, 26 Aug 2025 19:53:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756202013;
	cv=none; b=jC4tOLe1neMBPNsRzpkO8hxJab5CBf5JpVU7k5aKhG6bAqDpE49Rgi9UwZbJnJPc7HKwXLc4nSnElG4L2iQe0BSwLG+6fnZiCZcOq3JYM+lLH3uvOW1/jt8BEsy+OHNJXD+/rMrffNKiV6dXQ7BuUQTENyVngVzzhCFPYaNIWMgw6cvfIh4DwHkpv67yuGCDiweDnC6FgJF7kSGUnib0vuH2cJqo8qBQC5AilPgvYp9ox/L/7adHSw85plI/QuxuD0H8UIfZX9kcFzCtRqndYnGaRPTnaKRULasyJNU0+COY2lc0z3bk1Jn+1uop2lPKkwhjh3xsz5uoLota/r4/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756202013; c=relaxed/relaxed;
	bh=+94yg2WMuvOWorZ2H1VXwoA0FOZey/3GaK3Gs0XnqNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=kAjIkTBNE3NKGsBj8hKW/Q5dMkS+o9ZNoI/S4cKe8FaR/mNFgHR5MbzUJUaUK1cLT1XY/apU2fesL9PN29MiTWDNSeXN/poke+Sgt1rAgrQDKhVX2Q5Vu4dRtIuX23DhPsVvXfSDjAvoMKQKLVFQ7YDffUlONLHj/5uSOsrwwIgazNX8eDlG/7DIXkbULJlvWorefD+Tqlkt7tz/mE/v6yjgJ4MN7wJXr8Vg2D/yLzdoXpm6MnuuctwhY/3WeAUGd7W3Aw0Us9qDTQ9EZ0nFt+OdLykPObLdmODdtQ0If9O2sLlPaiuQgAcPl+xgjFiccoy8fo3qGpPuxBs7v4N70w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ea4UpfcX; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JMAV8Hy3; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ea4UpfcX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JMAV8Hy3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cB2zc4zy8z3dJn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 19:53:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756202007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+94yg2WMuvOWorZ2H1VXwoA0FOZey/3GaK3Gs0XnqNw=;
	b=ea4UpfcXKdzH5UzeFrKU6c6UG4aJEB3IM/WN+aWyAJC1Cf6wm/HwisC2d16UHIlg8TJbOg
	J7T1PwvtC5BDrhHtOK36TkUBPdRo2uhsyoJ3UVgd631lhpr7OmHqkZF+ow17voOO48o9Bb
	SNjpX8Mt050CjSAi/GRo2wfmfC1Jag0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756202008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+94yg2WMuvOWorZ2H1VXwoA0FOZey/3GaK3Gs0XnqNw=;
	b=JMAV8Hy3sWwJO8vVKWS2r04brTVCBy+4CzQPtI9EoNfJrlja3f2ZpTiPsm/x0Z1yaCDQgH
	OT5YJGaftJUhfV69nXl9J5q4n99nH6rKGBpMjDCB9/qDi5ttlzZCiez6HDQ0mMU1wKsoUr
	+8Wc3quuMN1wCuB1irUoLn5ewo1yPSo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-106-ppPB3tmSODOKwXTA3zSBPw-1; Tue,
 26 Aug 2025 05:53:25 -0400
X-MC-Unique: ppPB3tmSODOKwXTA3zSBPw-1
X-Mimecast-MFC-AGG-ID: ppPB3tmSODOKwXTA3zSBPw_1756202004
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 686C3180035C;
	Tue, 26 Aug 2025 09:53:23 +0000 (UTC)
Received: from t14ultra.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E0D661955F24;
	Tue, 26 Aug 2025 09:53:19 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	jstancek@redhat.com,
	linux-kernel@vger.kernel.org,
	joe.lawrence@redhat.com
Subject: [PATCH] powerpc/tools: drop `-o pipefail` in gcc check scripts
Date: Tue, 26 Aug 2025 11:54:34 +0200
Message-ID: <e8c743dfb16c6c00fd793d7afa6eed33c49f895f.1756202009.git.jstancek@redhat.com>
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
Precedence: list
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

We've been observing rare non-deterministic kconfig failures during
olddefconfig, where ARCH_USING_PATCHABLE_FUNCTION_ENTRY was getting
disabled and with it number of other config options that depend on it.

The reason is that gcc-check-fpatchable-function-entry.sh can fail
if `grep -q` (or scripts/dummy-tools/gcc) is fast enough to exit while
there is still someone writing on other side of pipe. `pipefail`
propagates that error up to kconfig.

This can be seen for example with:
  # (set -e; set -o pipefail; yes | grep -q y); echo $?
  141

or by running the actual check script in loop extensively:
  ----------------------------- 8< -------------------------------
  function kconfig()
  {
    for i in `seq 1 100`; do
      arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh \
        ./scripts/dummy-tools/gcc -mlittle-endian \
        || { echo "Oops"; exit 1; }
    done
  }

  for ((i=0; i<$(nproc); i++)); do kconfig & done
  wait; echo "Done"
  ----------------------------- >8 -------------------------------

Fixes: 0f71dcfb4aef ("powerpc/ftrace: Add support for -fpatchable-function-entry")
Fixes: b71c9ffb1405 ("powerpc: Add arch/powerpc/tools directory")
Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh | 1 -
 arch/powerpc/tools/gcc-check-mprofile-kernel.sh           | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
index 06706903503b..baed467a016b 100755
--- a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
+++ b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
@@ -2,7 +2,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 set -e
-set -o pipefail
 
 # To debug, uncomment the following line
 # set -x
diff --git a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
index 73e331e7660e..6193b0ed0c77 100755
--- a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
+++ b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
@@ -2,7 +2,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 set -e
-set -o pipefail
 
 # To debug, uncomment the following line
 # set -x
-- 
2.47.1


