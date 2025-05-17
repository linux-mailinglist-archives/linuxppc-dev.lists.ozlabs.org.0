Return-Path: <linuxppc-dev+bounces-8631-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD2FABABB8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 May 2025 19:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0BLk0BTZz2yLB;
	Sun, 18 May 2025 03:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747504237;
	cv=none; b=Lb0MdB1ZZ3rwLCX5aosxli0MZ/0Ue4n4wfN72oJi8S1FclLeClnVqjgvUDJHdEMS656F0e8Rg9vRKtEZz3YTEN7M3MeKVxSpjwl9KevH6XnLpOzkBhcEtPBX/g9C1Z8CYpWp7PUwJkhsP0JkXQdQqXWjNXgdMMPmihlRwcW5CCpV1r6Is6c6uoTjvV7n2z1DEtKBPDS1Xgjvq2BIa8CnH4hbsEuYqQ5rXaPW48BFF6RXVoQLsJ/FfRPw0TFX3Y5NcsnCezlLRujly4SuSXjTK+V+3DtezqZnoGg9wNHg9knqr4paXJNn/dSa/2DAwPA/OeL1LP01wvCwmJFRFSoktA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747504237; c=relaxed/relaxed;
	bh=/WgKWWBt4OQiVhvgCKMaLx5SM9upPVpTYBiD6cZ4lLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U8dw3IP6r4gXk/BIOYrboYQbMMImMQYiqkuyqntMDW8Lng+PqyNC6SHpvfOSuyYv/S3gUoY1vPVbi3RiQhFhmr18+wy5wJNdeWA1ay1uZyhACW0btORIs2zEQUmYtnnRdLmjWOsp38PTBamu98wTaA6x5xiOhmROTtvcew0fvmHX3TgQ5ulO0mQKG5cGKcXkZU7oRZguZ0AxnhufPHAWb/uADy0PcfxG26PbrOJuiRU4Ve1ithKyDQCNQ92Czv1/4lh6JdYLf/8n0qiiVID7TWEpBBk81njTb3GjlbjpkyIjUb9ShAleDAdc4rPsFp4jtCp21pOXdjQlHk+rEGFCSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0BLj1K3Cz2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 03:50:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4b00M554J3z9sZ2;
	Sat, 17 May 2025 12:20:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G1az-eONSp1z; Sat, 17 May 2025 12:20:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4b00M5472hz9sWb;
	Sat, 17 May 2025 12:20:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 893BC8B768;
	Sat, 17 May 2025 12:20:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id mAuXfhL-4fpr; Sat, 17 May 2025 12:20:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 580218B767;
	Sat, 17 May 2025 12:20:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 54HAKAZE013318
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 17 May 2025 12:20:10 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 54HAK9d0013315;
	Sat, 17 May 2025 12:20:09 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] soc: fsl: Do not enable DPAA2_CONSOLE by default during compile testing
Date: Sat, 17 May 2025 12:19:36 +0200
Message-ID: <174747706455.12970.4304005569552383300.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250404112407.255126-1-krzysztof.kozlowski@linaro.org>
References: <20250404112407.255126-1-krzysztof.kozlowski@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747477178; l=384; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=7GZVofQG8nGnuyZNjXY2JiiuE9YdRIp5MdJCBIR1hGY=; b=EaRBaAVMTN3PcAmBZEz517zwYrr0AHDEUG0krCJsh2Pa7B9aC5uiTYcBlzZTtkGlIYVU43tOv xA12+7+7PX0DZsIXdSHYq8KemAdEUkFJvhz9jcmW+IqgnRcZJp3JgVQ
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Fri, 04 Apr 2025 13:24:07 +0200, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of such
> drivers.
> 
> 

Applied, thanks!

[1/1] soc: fsl: Do not enable DPAA2_CONSOLE by default during compile testing
      commit: 617a7ed073115016e417b518c68c96057f1bf66c

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

