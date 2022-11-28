Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E246C63A09F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 05:37:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLCPG5WZDz3cLJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 15:37:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=N5bjqbL8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=N5bjqbL8;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLCNM3rJfz2xGH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 15:36:33 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id w129so9320384pfb.5
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 20:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fyzonERo/7/wMELyl/DX6MsqH35hQ9y/qycz4oXh9TQ=;
        b=N5bjqbL8Tkh4AItJ7rnh7XgPxzcWmKQL30xnr5mg1OUA1oOcOExclkC1mLeYPq/F6J
         vnvv4sgJEcrcjmddWme2dyNWZHU3fzar8HnVMfcQwC4lMRi4wlIUSp8sibLkUk7TJz8W
         xTpuNHfgugP4E7xIkKMrmBknRqHGvHFRehFYK/M7wOeB65FrhOzcyWuuLfbs3EbYridr
         R31GltrBEuYeHLVEyIJYWrgMYaY4aFdd6nGzXdPwa3ImFwcxAxDYcz8BhJLJ9mndeLAN
         WrN4U8853R6+g6SNLW+jnSlDEmOk7v78Aryq/Y5fO02bgAXsBQQPiXbLtnEWc+rl2k5i
         TulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fyzonERo/7/wMELyl/DX6MsqH35hQ9y/qycz4oXh9TQ=;
        b=n60MiEfLIpj6dqmPQnRztHENxQxzfxFutyupZXP62Yhd9rGmk/d98ljw/+u/ot6j5L
         PR/MlrZBIsUpMbvriPJEIri+1RGlqtUeBjW0tyBQClbXH8sIriV2M2orAKnBv0yM1LkA
         YJu0EXumKRMbvPu2hMy+thfKWqHg0TgKQF0LpJjLli+SyPkapaUZKwvwW8HZoTtAF4H3
         y579IRjwaLbKongM5+dtntkrZ4MOPkKxCWYpb3lUo01fXK+NYp/NqjELw4kOfrkqD/aC
         26I0K2Ho6P3MVaQbIJLh1UmnxSC6zLqeV9hq3CF/ZYb125Ie/P/b7RDl59KwO74aQm86
         cT9A==
X-Gm-Message-State: ANoB5pnSaNoDU7S7MQ75IvUWPY3ZVtgosWlp2tAocYMd1SiCnSA5fxjE
	kuxbAUYyeUcvaEmIR62gcX+BeoSMxt0=
X-Google-Smtp-Source: AA0mqf4HZJ5tRF12wOlEXnlQozfyhUKL3WWEhFLBsulVXx20JA/vD3au6ugfB6jWOfNjlgFKDsByWw==
X-Received: by 2002:a05:6a00:4c0b:b0:562:ebc8:6195 with SMTP id ea11-20020a056a004c0b00b00562ebc86195mr30129816pfb.38.1669610191040;
        Sun, 27 Nov 2022 20:36:31 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-39.tpgi.com.au. [193.116.97.39])
        by smtp.gmail.com with ESMTPSA id p1-20020a17090a348100b002132f3e71c6sm4886486pjb.52.2022.11.27.20.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 20:36:30 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] Disable Book-E KVM support?
Date: Mon, 28 Nov 2022 14:36:23 +1000
Message-Id: <20221128043623.1745708-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

BookE KVM is in a deep maintenance state, I'm not sure how much testing
it gets. I don't have a test setup, and it does not look like QEMU has
any HV architecture enabled. It hasn't been too painful but there are
some cases where it causes a bit of problem not being able to test, e.g.,

https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-November/251452.html

Time to begin removal process, or are there still people using it? I'm
happy to to keep making occasional patches to try keep it going if
there are people testing upstream. Getting HV support into QEMU would
help with long term support, not sure how big of a job that would be.

Thanks,
Nick
---
 arch/powerpc/kvm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index a9f57dad6d91..6c9458741cb3 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -191,6 +191,7 @@ config KVM_EXIT_TIMING
 
 config KVM_E500V2
 	bool "KVM support for PowerPC E500v2 processors"
+	depends on false
 	depends on PPC_E500 && !PPC_E500MC
 	depends on !CONTEXT_TRACKING_USER
 	select KVM
@@ -207,6 +208,7 @@ config KVM_E500V2
 
 config KVM_E500MC
 	bool "KVM support for PowerPC E500MC/E5500/E6500 processors"
+	depends on false
 	depends on PPC_E500MC
 	depends on !CONTEXT_TRACKING_USER
 	select KVM
-- 
2.37.2

