Return-Path: <linuxppc-dev+bounces-8624-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A088ABA9E8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 May 2025 13:50:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b02MN3TNwz2yx8;
	Sat, 17 May 2025 21:50:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747482640;
	cv=none; b=mbBHCQ2YDtl9RObVy+PyX5Z90WTo+7+0C6Vto5gikqvxWXcOeFU7FS35gnKNmaxS2pqWeRLeb0IbuE3OflDGsm1ZtVRKWqC0vQqeGNgJ1fnpW/FaRB6tZ524xZxsZCd2eVjsScAi4Z5dd09udVLKjIJbY7xtYTPjq7Rpol7PHQihJgXkNKreuVJIB7DBUK85WxK5aHUo3vS1CBC+7f1+0/a9QypP3+riJ9OxwdonOMmO56ETMMyFuJymQuAwu7rUu8qNrgjqWHycLMrm/qGFaCX1N1eM/bwWD9pZ5Z97kYZWAJFqs0z+efYH5N3QUWdeoS/wNk2wPIx6iEbWu5L5Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747482640; c=relaxed/relaxed;
	bh=kJN0Me0zKGyMXcfLxKRBaF9LkdPtX7XjIP8QeOFlWb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lXtPdOQR7spF9pm+SMabwWCv264M+QtJo2W/sWLYFBXe5aNiTut0E3DTMadY5a1LFeIMlujctaBuEAuz+ti+IIsklfNFBIiUZ9kJxTo+z9gDHIpEZdYVbKJrgVj5MpA7taf1OnswOC5yTD0TvNbrKOrMz/HCM24ptDtm3U861aJdFUyxheeGX4F9thU2GPk5A7kU39OYlZZpbTT3TAprpBZijFW2zaUNQqZY+xDAQpraAZDyvIKuoslHeA2716VunedPbZNixIUCU0Wcp9tdOQQjzEpHtGm6A5ZEVj51UdyuPR1T5EF4wEdyti32DZQw8qJb11pEmRCYrtOGgingjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b02MM5bgZz2ysb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 21:50:38 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4b00M92B0Wz9sbr;
	Sat, 17 May 2025 12:20:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id klZbKNPdRbl2; Sat, 17 May 2025 12:20:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4b00M91Vfwz9sbF;
	Sat, 17 May 2025 12:20:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E90A8B767;
	Sat, 17 May 2025 12:20:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id lRU_1UESIp_b; Sat, 17 May 2025 12:20:21 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 010048B763;
	Sat, 17 May 2025 12:20:20 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 54HAKDeU013328
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 17 May 2025 12:20:13 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 54HAKCZa013327;
	Sat, 17 May 2025 12:20:12 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: joro@8bytes.org, will@kernel.org, Ioana Ciornei <ioana.ciornei@nxp.com>,
        Robin Murphy <robin.murphy@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Will McVicker <willmcvicker@google.com>
Subject: Re: [PATCH] bus: fsl_mc: Fix driver_managed_dma check
Date: Sat, 17 May 2025 12:19:38 +0200
Message-ID: <174747706458.12970.14926241943300392052.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250425133929.646493-3-robin.murphy@arm.com>
References: <20250425133929.646493-3-robin.murphy@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747477178; l=776; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=qVOoIrTsoZcWCm+U3VKSICm/zw2sUZWZNpODf/MkZBk=; b=hcgFMiXEXjwpytNmOoTfd2InNdVfJslU9f4biTG/D/UIE0NQCxLGxC3d2He2BGQXZaIvjCHZj F/2J+wZIwSHCm2cWa3rAdnSdYIVe9HqSD/LwdqJGijLc21KbUBD+RyQ
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Fri, 25 Apr 2025 14:39:28 +0100, Robin Murphy wrote:
> Since it's not currently safe to take device_lock() in the IOMMU probe
> path, that can race against really_probe() setting dev->driver before
> attempting to bind. The race itself isn't so bad, since we're only
> concerned with dereferencing dev->driver itself anyway, but sadly my
> attempt to implement the check with minimal churn leads to a kind of
> TOCTOU issue, where dev->driver becomes valid after to_fsl_mc_driver(NULL)
> is already computed, and thus the check fails to work as intended.
> 
> [...]

Applied, thanks!

[1/1] bus: fsl_mc: Fix driver_managed_dma check
      commit: 152f33ee30ee6a7f4c15bedd7529dc5945315547

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

