Return-Path: <linuxppc-dev+bounces-8632-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C745ABABBA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 May 2025 19:50:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0BLr5rBlz2yrL;
	Sun, 18 May 2025 03:50:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747504244;
	cv=none; b=UolMCAYiNp+yUKA5JX2lMqAKAMDm/F8Muzx62MNwemAchPCNb0QQ787h+RvNAZvxU+6YF9OpWP8SOvM8B6f7RsI+svla30p+U6iPKyWL3kz7Bom7TuZ/OIPRT3KGqYUufA58qyJvR6U8WaOUIAnEZ7M/6KtIH8mfuqu7Fqum0L8qFA3jQ8y6i0rkWmX4B6eBM0aEjdQv3ycAJH/LMkmF+n/zUCTY04Rh4jZnQCDGYIxpcYYgBc2Y9gq/cw+vflYsHAJxjzXpGdRtM/GLoEmlAeibacQSJRgbphX4vliAvNkSG8HhTvu4OCBvSYZwkxIbugDIppmV0FSnOp+EE8AKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747504244; c=relaxed/relaxed;
	bh=u4g0ClcGYGehbDjnnBfwOtaEybi5RmldRzHIBnnmK+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UNPt+zHOjZ/7GzCYjmE5UByf5KILhDvERFwABqqHpc2KfOSjrgdXTE282gnlyHnE1jQZrYgtjk/WpxGSOcleHisqQnqpi842IU4eN+L/t7smCtFCcRyeegchW2HepzzreEVVv1rVhct2wgaALg4SILPuwP+R/eGEu1po9MT9lGgYr0tnvO6izXX8h+ImX6/PrwTH6qaOcd+ecFDpPFo54U/4cIFZxgt4sJcxmiq01KEKBRmnXsvazA66B0SCauohrZKMslP5SBmAiQGlg2J+GlgwEZVo1VGvmtB/FuJvD52Dqn9owSuqOqB2NNX5HTJrl0cSVZ33unmwesmVc6UdTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0BLr12P1z2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 03:50:44 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4b00M63T1Xz9sWb;
	Sat, 17 May 2025 12:20:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5WR6SaDXKDR; Sat, 17 May 2025 12:20:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4b00M54MKVz9sYQ;
	Sat, 17 May 2025 12:20:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 916848B767;
	Sat, 17 May 2025 12:20:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5a4ytmCj7k7m; Sat, 17 May 2025 12:20:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 57FEF8B763;
	Sat, 17 May 2025 12:20:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 54HAKChm013324
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 17 May 2025 12:20:12 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 54HAKAOe013321;
	Sat, 17 May 2025 12:20:10 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: qiang.zhao@nxp.com, Chen Ni <nichen@iscas.ac.cn>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: qe: Consolidate chained IRQ handler install/remove
Date: Sat, 17 May 2025 12:19:37 +0200
Message-ID: <174747706462.12970.7308015211348240691.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250515083919.3811473-1-nichen@iscas.ac.cn>
References: <20250515083919.3811473-1-nichen@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747477178; l=445; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=QUgzluer8yWbklILpqvTZIvYWxJlUPH1isJ6Z8FhIEk=; b=pQs8UzFywkxRkHAAXzbabVgBKt/zw2mtRTUaXgdw12fvhe2X4vMySzp+cMmb138Tt1mFER2xv olckTPdFsd7AAjDltcPnWmf4f1zbly0PskqxLmQR0TaVjig+zSlZPAu
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 15 May 2025 16:39:19 +0800, Chen Ni wrote:
> Chained irq handlers usually set up handler data as well.
> irq_set_chained_handler_and_data() can set both under irq_desc->lock.
> Replace the two calls with one.
> 
> 

Applied, thanks!

[1/1] soc: fsl: qe: Consolidate chained IRQ handler install/remove
      commit: 695d702f42bf4bd335e30f542ca710af081ee2a3

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

