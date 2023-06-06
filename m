Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F33FA724453
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 15:25:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbB7C5KgSz3dyR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 23:25:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Hwnq5YHb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Hwnq5YHb;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbB6N5YCzz3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 23:24:59 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b0236ee816so44674905ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 06:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686057897; x=1688649897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PpctcjZMY73dKJnop/zxkl4cg/JBYjbgIH95aEOxBZ4=;
        b=Hwnq5YHb+d+1fAZPv6sHLKMVfSRi43xEhuypTP3MQIQdgtonYeL8uccBYzp0LbmDR3
         kyK2FCKnJJ9E8N7FTpf3xNu4Izf2Woa/KefFYpq3qU+uZ+nDWLAkrHDo+uLANBx5n5CA
         +AxZ/DFVcz88nma6L5xOJ1XDOBImUreDSxdKsNYUly6W4Y3gMqwLwF+0k+FZ0vZ3n5fX
         tBh1QnIY9HFw3Pt5msvIefAXMtfLtr0c7SsnFxT9I+uoiILEE+NZVa/xAz10EO1BsW3/
         G3m1YiRLwTiZx6FczDH/4FiU6WYvQUx5SurKcvIYi+SxZHDtlr8ze1qX4PEo+teZDIDx
         MhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686057897; x=1688649897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpctcjZMY73dKJnop/zxkl4cg/JBYjbgIH95aEOxBZ4=;
        b=W9CWOzn4dcZ+lNttAOrKgCi1zyRLKYv0daT4A+COCZhDcOHRr/TTQE4KIVCdPDuRpY
         Q0/JZmp6suj63CpqKI+NBk2doQFNEPlCoPWJarQuPr73NvgHqlKTLIQjo1mhI6vH91l6
         r91mxlflDgKm8X3aAJt9Eh/esMIpYuC4jvH33rLCC65l5U8d9U8pw+2VFzXU5j41/FXm
         CttN1DhmhyDY36tIiyqSIZOoz+QeIYaZ613ggthICx9P7Kgff+8xPlFxYGGY9PMaJNML
         4CovIKowrxT1ZhefLbTwvUiKsO6bJeC1c4e/44J6pWU+Nl+yfjxRihm+pCWcFxqPAPCj
         lxEw==
X-Gm-Message-State: AC+VfDwTvlj/f33vPBtHABlb2sBySKKg6z9gMhMp8Bxb477LPBkR63PU
	ZVlkkWS9gBnCVD0CE91BPZ70s7IMPCw=
X-Google-Smtp-Source: ACHHUZ6SdI+645dMiP8KLlKZhOXD7vwkm2MP1ERZmLRg0gsHv2eJwx5EAs3s7uV9wBxH1MlMZkvDjg==
X-Received: by 2002:a17:902:ab59:b0:1aa:d235:6dd4 with SMTP id ij25-20020a170902ab5900b001aad2356dd4mr11136905plb.19.1686057897337;
        Tue, 06 Jun 2023 06:24:57 -0700 (PDT)
Received: from wheely.local0.net (58-6-230-127.tpgi.com.au. [58.6.230.127])
        by smtp.gmail.com with ESMTPSA id jd18-20020a170903261200b001ac2c3e54adsm8522132plb.118.2023.06.06.06.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:24:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/6] powerpc: merge _switch in 32/64
Date: Tue,  6 Jun 2023 23:24:41 +1000
Message-Id: <20230606132447.315714-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since v2:
- Add PPC_CREATE_STACK_FRAME() to abstract prologue differences.
- Build fix.
- Makefile tidy [Christophe]
- Fix a missing SOB.

Since v1:
- Don't re-order 32-bit prologue.
- Improve Kconfig conditional includes.
- Break out code changes into their own patches before merging,
  so merge patch leaves generated code unchanged.
- Change prom_entry.S to prom_entry_64.S.


Nicholas Piggin (6):
  powerpc/64s: move stack SLB pinning out of line from _switch
  powerpc/64: Rearrange 64-bit _switch to prepare for 32/64 merge
  powerpc/32: Remove sync from _switch
  powerpc/32: Rearrange _switch to prepare for 32/64 merge
  powerpc: merge 32-bit and 64-bit _switch implementation
  powerpc/64: Rename entry_64.S to prom_entry_64.S

 arch/powerpc/include/asm/ppc_asm.h           |  14 +
 arch/powerpc/kernel/Makefile                 |  14 +-
 arch/powerpc/kernel/entry_32.S               |  58 ----
 arch/powerpc/kernel/prom_entry_64.S          |  87 +++++
 arch/powerpc/kernel/{entry_64.S => switch.S} | 331 ++++++++-----------
 scripts/head-object-list.txt                 |   2 +-
 6 files changed, 238 insertions(+), 268 deletions(-)
 create mode 100644 arch/powerpc/kernel/prom_entry_64.S
 rename arch/powerpc/kernel/{entry_64.S => switch.S} (59%)

-- 
2.40.1

