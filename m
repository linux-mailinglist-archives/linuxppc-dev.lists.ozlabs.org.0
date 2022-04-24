Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3351E50D437
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 20:41:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KmcRJ0pTBz3bdB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 04:41:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bUZfYeZf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2e;
 helo=mail-io1-xd2e.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bUZfYeZf; dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KmcQf2jy7z2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Apr 2022 04:40:25 +1000 (AEST)
Received: by mail-io1-xd2e.google.com with SMTP id e194so13686992iof.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Apr 2022 11:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ysq6r/KGEWvs3JKm+7GsajBhnC1rqVgQKhxLMm/5600=;
 b=bUZfYeZfZWfa6hk+J6GAlHPPJFwphY+7fWPaBSwJpdBtX5M1te6iI9zhHvbzPqrcDv
 zPyViDP7AnKsZjxb9ErLTH7eC1OQeX6rqBbpQwF23l5zEuVOsXp9fKqu2Coj9jedISIM
 HEgrv654jM8khYCmokvsmJsBmU11xda+NJHCAs3b03fflbQQCypZgOYW0S7ymvDXwqaO
 rpN3Pv2GPQImHdzTrblpzkQBOg1VXIAUqlUMR5tWKQVxpULRbV1PvRn2SmLTVNmjCJT8
 ysQV2Of2e6oIvnX7OCP2d6dQ/anWxgFc5o1/cuXXdMA/inTaG0vkljDSYULAGRXhM2Xw
 CP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ysq6r/KGEWvs3JKm+7GsajBhnC1rqVgQKhxLMm/5600=;
 b=LonGnfuwm4WfeHMLbf1RRJcCRnmVawdwiZ1NZHgEJJziGB3QAk3eKJWcjSLUz3+xFK
 do3CxlEdkS2mtmTeabcjLt3SIu1FYNAFhwK9ICiu6j3AaydgUVA5+sCmfvBtAfs0dByo
 OOzfCXb+KkdvUlcb4M84ZGTu67/dyxkl4n/Fibjjt8f5siMwmCiIj/RTbI3Shh45IXOO
 48L2vm/p5jmITfjO85P1iUt0dvmax1DHkgX2JHfnY+fTq+c9Kqd26qfhnA/2rvlW83te
 hjviOHexcV7rzgMhcFZZGFWT9ANiC5e1W/BGFACTalGwdXK6kRduWtAVaYANQxF/Hdpn
 DEYA==
X-Gm-Message-State: AOAM533f0iTSeCBdAR0tUL9l4yUTEyX1YzMqriVBuf98qbh4z3cslWG8
 7RPQ6x4db7z4EltDwIByq1M=
X-Google-Smtp-Source: ABdhPJzrLitNERpkOJd/1LPHq0rM//0XPtdGApNYOedaZW7ozTM8UiimVn2OEGDIOcP2Cl86SRf8/A==
X-Received: by 2002:a05:6602:2dc4:b0:648:adac:bae8 with SMTP id
 l4-20020a0566022dc400b00648adacbae8mr5951706iow.9.1650825621787; 
 Sun, 24 Apr 2022 11:40:21 -0700 (PDT)
Received: from xps8900.attlocal.net ([2600:1700:2442:6db0:a0fc:5934:6989:31dd])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a92db07000000b002cbee0fdb4bsm5064735iln.70.2022.04.24.11.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 11:40:21 -0700 (PDT)
From: frowand.list@gmail.com
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH 1/1] powerpc/boot: remove unused function
 find_node_by_linuxphandle()
Date: Sun, 24 Apr 2022 13:40:14 -0500
Message-Id: <20220424184014.968274-1-frowand.list@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Rob Herring <robh+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Frank Rowand <frank.rowand@sony.com>

The last user of find_node_by_linuxphandle() was removed in v4.18-rc1
by commit 30f4bbe0472a ("powerpc/boot: Remove support for Marvell MPSC serial controller")
four years ago.  This function is no longer needed.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 arch/powerpc/boot/ops.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/boot/ops.h b/arch/powerpc/boot/ops.h
index 6455fc9a244f..8334bc3cbe49 100644
--- a/arch/powerpc/boot/ops.h
+++ b/arch/powerpc/boot/ops.h
@@ -200,12 +200,6 @@ void __dt_fixup_mac_addresses(u32 startindex, ...);
 	__dt_fixup_mac_addresses(0, __VA_ARGS__, NULL)
 
 
-static inline void *find_node_by_linuxphandle(const u32 linuxphandle)
-{
-	return find_node_by_prop_value(NULL, "linux,phandle",
-			(char *)&linuxphandle, sizeof(u32));
-}
-
 static inline char *get_path(const void *phandle, char *buf, int len)
 {
 	if (dt_ops.get_path)
-- 
Frank Rowand <frank.rowand@sony.com>

