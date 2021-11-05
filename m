Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FAE445ECC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 04:41:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlmWN32vFz2yZ2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 14:41:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hSe8Xulv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hSe8Xulv; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlmVf0S4Sz2xY8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 14:40:23 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id h14so6157090qtb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Nov 2021 20:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tJfLJtH3UXJVM1N+KsS5NvQISO9g/+LT6C94n+yKqUw=;
 b=hSe8XulvDaGNBCo+IkavWu5YWutCjT40QeBhwTvMG+NefVs6/8vcRFhPFalkMq0iJX
 plyzIuQ/8p10xamsYMmV1qtNLc65OGro+Om6a6B0O6IAwHMEF7NxiZJgG90JtZp1AlYD
 r++2Fql4D/I27c+ZLk80pYWG7r/ZeifAzbz3ZYjHW573pAeZXFcp/+LYMQ3+bI42+XPf
 KUe9zWB3KGnPBRDq8Z8cDwLNIpzyWorZoBUGFX4hDS2PtwRX5J2zYIgper4PFwCCnMSW
 NN9Yizy8+Isvm/a6u9idoHv2aPQPxulukZtZL8Q5q1wsMidRwDVygCOiCBO99ZznRypj
 vDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tJfLJtH3UXJVM1N+KsS5NvQISO9g/+LT6C94n+yKqUw=;
 b=8QuCZJLYudQ/X3tGfJvxRVfrZhnqXB6aeiyUVKcHjyErW6s+hFWC5Gh0Tq1EPCTnDZ
 M8XeDhp2XUMHN9eCvi7FBua563HYNSGX46uMHFW2KjC54hLgk0GkGn0xNp+xF4LMo5ia
 SLKrZ7SqaIH//k3CiZdDouHhiCLuHBG/5KtnBtzJzBhu7LO9emFCQw7TcI55X4aKXSpS
 rN9BKIRoQZjc2miMice17CmGheC5oXi+8qrWAulXE3JmSljZIAKdVP99OJG3BLLGFnfF
 9AfQbqHe7uslx6DaqxuOQNTvD+567peQk6ExSv7Gamwyu5icd3BWliBwYjd6WkILmivD
 ED5w==
X-Gm-Message-State: AOAM531dG2GfThnxBBEHR88jpxJe/17MVbFtjYoraKqTCYurlH5HQyCE
 CVyoYYLKXUOTj87MfRiUBSTONu5eOf4=
X-Google-Smtp-Source: ABdhPJyyCLzj/slZiDgoAbXxqXvP8R6QKFX4FCP+MTr8+4vPEUMNjN0k2oWRhHeBGu+rZGHxGACW+Q==
X-Received: by 2002:ac8:5c14:: with SMTP id i20mr60383542qti.47.1636083620303; 
 Thu, 04 Nov 2021 20:40:20 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id bs34sm4937571qkb.97.2021.11.04.20.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:40:19 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.guojin@zte.com.cn
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc: xmon: remove the duplicated operand of the bitwise
 operator
Date: Fri,  5 Nov 2021 03:40:11 +0000
Message-Id: <20211105034011.76008-1-ye.guojin@zte.com.cn>
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
Cc: Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 paulus@samba.org, ye.guojin@zte.com.cn, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ye Guojin <ye.guojin@zte.com.cn>

The operands of the bitwise OR operator are duplicated, remove one of
them.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>
---
 arch/powerpc/xmon/ppc-opc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/xmon/ppc-opc.c b/arch/powerpc/xmon/ppc-opc.c
index dfb80810b16c..2cab0ec0d162 100644
--- a/arch/powerpc/xmon/ppc-opc.c
+++ b/arch/powerpc/xmon/ppc-opc.c
@@ -6731,9 +6731,9 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"fre.",	A(63,24,1),   AFRALFRC_MASK, POWER5,	POWER7|PPCVLE,	{FRT, FRB, A_L}},
 
 {"fmul",	A(63,25,0),	AFRB_MASK,   PPCCOM,	PPCEFS|PPCVLE,	{FRT, FRA, FRC}},
-{"fm",		A(63,25,0),	AFRB_MASK,   PWRCOM,	PPCVLE|PPCVLE,	{FRT, FRA, FRC}},
+{"fm",		A(63, 25, 0),	AFRB_MASK,   PWRCOM,	PPCVLE,	{FRT, FRA, FRC}},
 {"fmul.",	A(63,25,1),	AFRB_MASK,   PPCCOM,	PPCEFS|PPCVLE,	{FRT, FRA, FRC}},
-{"fm.",		A(63,25,1),	AFRB_MASK,   PWRCOM,	PPCVLE|PPCVLE,	{FRT, FRA, FRC}},
+{"fm.",		A(63, 25, 1),	AFRB_MASK,   PWRCOM,	PPCVLE,	{FRT, FRA, FRC}},
 
 {"frsqrte",	A(63,26,0),   AFRAFRC_MASK,  POWER7,	PPCVLE,		{FRT, FRB}},
 {"frsqrte",	A(63,26,0),   AFRALFRC_MASK, PPC,	POWER7|PPCVLE,	{FRT, FRB, A_L}},
-- 
2.25.1

