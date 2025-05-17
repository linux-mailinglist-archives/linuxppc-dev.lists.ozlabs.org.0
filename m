Return-Path: <linuxppc-dev+bounces-8627-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BEDABAA86
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 May 2025 15:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b051p0sVpz2xjN;
	Sat, 17 May 2025 23:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747489838;
	cv=none; b=iJ8pRe7uC7tRWpie1mb+8hsJJT98f1IMEDdM+bFFLqHVkZFAlZPyF6QEzBpApRC8wxpz4X93EDb4EVShw5FvueMggKAbf3r7HO7rkSo2dZwRwxWn9PDkWQjGEsXOE725empKcFexlSaRE8z2xbXDKxrjzkBNt8B8Xs2HiwOGpycF2JAoQE94Q/G53o/mkujz0zq00JGG+hsa1UkKbNAmYlyC6xk+s302KQr3KC7CV5rK03s/mqMxc26E8IPh5pjNHUqKvesDdFjLXbnjbw+CSprpWh8fD9+xmsNxPQWlOyHB91UuosL12ME9xU9qB2RDflS0P52RyGTwTYbkYNrFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747489838; c=relaxed/relaxed;
	bh=ltSNRqJbHJHvDIYPt2f31b6DVOgk39MSUXgtcMsqOmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RSVEbPJOm/+vKqkcB7S8GQK3XeQ+0j2bAupHjK9Rk+ag1FrRFlmomvxFMnUhPXfth3WD51EmPTk8c/qas6xxDpQcQrkJ8G/xLqQ+XvzrCDsdSL2r8z9tB3KgGEADL5iDulRIbtvVNAAOQiGSTQqOEU2OfNCqJp+920pLyEoXLyzZUQ9XBGuuS9KSAK60wEdgBz7KJcbcIUT1tADXDZcrDgnoG87eDCC13RAyR9YLZCxB+WU5dUaiVj9TS+fn1jY3jdk8b7sWJkHb1RE0c2uhhDDve5iCC4XjDIq+aIFBMJQDpmY7O8Eihpt31rJVgOptaBjuAwlCL7QuUkPRRL+ZAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b051n1ptCz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 23:50:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4b00MM1Ymxz9sfF;
	Sat, 17 May 2025 12:20:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qaMkn7WQlifr; Sat, 17 May 2025 12:20:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4b00ML1XfBz9scZ;
	Sat, 17 May 2025 12:20:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2EBC68B76C;
	Sat, 17 May 2025 12:20:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ur7_JVTsya3r; Sat, 17 May 2025 12:20:30 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CD3D48B763;
	Sat, 17 May 2025 12:20:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 54HAKLOs013339
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 17 May 2025 12:20:21 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 54HAKLmp013331;
	Sat, 17 May 2025 12:20:21 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: Use strscpy() instead of strscpy_pad()
Date: Sat, 17 May 2025 12:19:39 +0200
Message-ID: <174747706457.12970.10789323479369256227.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250413172948.207258-4-thorsten.blum@linux.dev>
References: <20250413172948.207258-4-thorsten.blum@linux.dev>
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
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747477178; l=671; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=VmrCr8zAKzCrNd4nSn70Xr3yRrgBBAD2cxmoPGRn2MI=; b=f9EywaNmsT39/TksgCisYQ8rPpDUmzbx9bsDdzJM8n5LxfMw7dq3tAyrFnvPm1fgLd3WDYTqo lKbpkeEhrptDHJxNX+fazynnjNOQRmTnc+rocMJm3cBmvi5366zBolY
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Sun, 13 Apr 2025 19:29:50 +0200, Thorsten Blum wrote:
> Both destination buffers are already zero-initialized, making strscpy()
> sufficient for safely copying 'obj_type'. The additional NUL-padding
> performed by strscpy_pad() is unnecessary.
> 
> If the destination buffer has a fixed length, strscpy() automatically
> determines its size using sizeof() when the argument is omitted. This
> makes the explicit size arguments unnecessary.
> 
> [...]

Applied, thanks!

[1/1] bus: fsl-mc: Use strscpy() instead of strscpy_pad()
      commit: 61ddf5faa7cc091b409936d571ec1af34ce487a1

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

