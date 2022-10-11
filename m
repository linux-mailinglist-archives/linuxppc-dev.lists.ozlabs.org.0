Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8F95FAB80
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 06:00:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mmhrd4Xj6z3dqp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 15:00:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G1tO9Ksu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G1tO9Ksu;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mmhqj0g9wz2xsD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 14:59:26 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id c24so12061940pls.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 20:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BzF3pkNEv1+03fuosxVKj67lIfjQVhGyuOEn4DRET40=;
        b=G1tO9KsumdDARN2GSofintmNCiAX4vPFr2kloIGNBOsTddcjVgzhjvaapqHEfhoMvp
         W+ClxtcFWMNC+zYq7WH0c5F6VeHtKG6hqpZqdgDUj6IHEPo8m+L5F4uPGkc31S1VLEqx
         MXI2+foBj4FEIMYUF6sVjw1XseVLtuSEgQUZxZIKlydJq0Z8OHG+c76a3HOj24kI6OO3
         LPKwQ4KFwpcjBbUHA7kJNTvoc5gXPox5Rn16XAobJLLfGx48SB+p75TLxXi+HPgn19mM
         ZksrrQdDIVNJsPZqbguNO5wsh2X9nk4MFB+5CtepgrQuTXpqefazxl9WctP03nPQlmNp
         DXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzF3pkNEv1+03fuosxVKj67lIfjQVhGyuOEn4DRET40=;
        b=z+58xssHRrfwuqMm47scRYz/cp6rgPeLrNiRKGtJFQQMnZJCtRdYTd7NE9OGUrDsHA
         PljmYQ7z+gNL4+zo6FymWLeT6MacR7fttUyZtcULvVsFkSCkWkGfZRQP3Dpfnkkstaa7
         IDq/x2kyuuvXtr1OHuAbvW4H55a7/mir7TUWkKPdw3IGRwFK8bY2CkR5dTugtCSB3mnE
         GypgAUBfbq/sDJB73OUAomNb4lwhfqrLZZK1S1NXW+HoNON9Yxrfgs0a7h5NIjkZu28s
         /fCNfA67YG1mXOzZJXubb7WKwAF8E2IzyKQBDJZFmrmWN/0bz8YKYO8D8ioFOJO5y5vy
         t6Ag==
X-Gm-Message-State: ACrzQf0YWoMugEzeAWeD74EGd7d6ECsUAFLKRbCGbykbWGExtZaya3lf
	oPUM50cyloK6p4chWxmlz0Y=
X-Google-Smtp-Source: AMsMyM5Beqm7XN5MRIm8zBrCT6j5n7TIr4ItXPsT1tlkZqqvcNkwD+YObJbMHZdfXJ/NMTjaJLM2Ew==
X-Received: by 2002:a17:90b:4a84:b0:20a:f497:6f5d with SMTP id lp4-20020a17090b4a8400b0020af4976f5dmr24122223pjb.213.1665460762286;
        Mon, 10 Oct 2022 20:59:22 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id w187-20020a6282c4000000b0053e42167a33sm7758244pfd.53.2022.10.10.20.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 20:59:21 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] powerpc: Fix 85xx build
Date: Tue, 11 Oct 2022 14:29:10 +1030
Message-Id: <20221011035910.39171-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The merge of the kbuild tree dropped the renaming of the FSL_BOOKE
kconfig option.

Fixes: 8afc66e8d43b ("Merge tag 'kbuild-v6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 68ea30fb373e..ee2d76cb3187 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -121,7 +121,7 @@ obj-$(CONFIG_PPC_BOOK3S_32)	+= head_book3s_32.o
 obj-$(CONFIG_40x)		+= head_40x.o
 obj-$(CONFIG_44x)		+= head_44x.o
 obj-$(CONFIG_PPC_8xx)		+= head_8xx.o
-obj-$(CONFIG_FSL_BOOKE)		+= head_85xx.o
+obj-$(CONFIG_PPC_85xx)		+= head_85xx.o
 extra-y				+= vmlinux.lds
 
 obj-$(CONFIG_RELOCATABLE)	+= reloc_$(BITS).o
-- 
2.35.1

