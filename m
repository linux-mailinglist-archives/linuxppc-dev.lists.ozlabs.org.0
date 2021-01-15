Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8662F82C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:44:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHT8374zQzDsmY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 04:44:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=niMNj9r4; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRzK3TrHzDshk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:51:41 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id u4so5519557pjn.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l5iFJn/kfkQSpg1w/GiE1Co8mx7fCauj/LpwyjzRdTQ=;
 b=niMNj9r4ptYlvObPJZu6NrBkBxoDO4OuM7mjcgfHPqwm+0mG6xtMA8qM1j9g2yvvu5
 Ms4cgaRb20SjdMslnBtZgZu7hI8Bi4uAu83Q0UC8LZ9OnV7lRm1xAjHquScFPqD9ofPq
 4lfH7NmJOnZedM7SoOHZr7A9aQALrPTHy2EB+wvI6cI4oTlpbkXITTQ+ej1A+6lmGE9C
 q3Rwgcl6PpMUhnycXdsrCqNTqjcRSFkLtceaBB4XjP7h/dsmVLdV2xYHQwPvyzXc6axh
 2VR9LIZzhusU8Q5g0qaTkyDKCRTGUWE4EG50Gu7C0pnk3JqN8P8ds5JWAn3s1ukRBGyF
 TLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l5iFJn/kfkQSpg1w/GiE1Co8mx7fCauj/LpwyjzRdTQ=;
 b=Tex6bolYqyUH0j7RqQ23ZXBJ7yJCEZqb5OYaaLw7Ep0HQ46cywmTOMU8kWppViYOYv
 6EIFioBuIOAwclAcRiibxOqyJtyCePXQpwqbSsBuutfHvGvt2Y38xrMsoN7JALCK86gj
 ztoqHpUeLL78XHtxTUvDbWQ0w9Bga6FjAZ8jGdAVmUFFCaV1kY6RJnVcDRvJxHKI8fAE
 8oNlRzZ/1imjf3Qm1COHxHl7AHNEOjnT93WpzVlFPI9yfnQ7BaHshKedrXhavA/0sLK4
 oH5rDiB/tvouzIEr51xkzieFn0cEIv4jnc5ycw23y8zS8+DpTU/qGCS3fsF8Xbw1nmWI
 mzRw==
X-Gm-Message-State: AOAM533hUHsQkM3mIvcHBYV1OIQCcDBBY+Sl3QBmCy9FU/TSV1YOwAzz
 F3zOyNWUm3ABC3EflO5ziCOvP1t7WWk=
X-Google-Smtp-Source: ABdhPJx/huXR747ZPPjUna0Wxm4NPkWwk7ih6OtbtRnKv35NrjbLfjTUwCBpQZJXcdkjKYzlpg+n/w==
X-Received: by 2002:a17:902:b7cc:b029:de:4450:ef9e with SMTP id
 v12-20020a170902b7ccb02900de4450ef9emr10708828plz.23.1610729499505; 
 Fri, 15 Jan 2021 08:51:39 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:51:39 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 21/39] powerpc/mce: ensure machine check handler always
 tests RI
Date: Sat, 16 Jan 2021 02:49:54 +1000
Message-Id: <20210115165012.1260253-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A machine check that is handled must still check MSR[RI] for
recoverability of the interrupted context. Without this patch
it's possible for a handled machine check to return to a
context where it has clobbered live registers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index f9ef183a5454..3a8699995a77 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -846,11 +846,11 @@ void machine_check_exception(struct pt_regs *regs)
 
 	die_mce("Machine check", regs, SIGBUS);
 
+bail:
 	/* Must die if the interrupt is not recoverable */
 	if (!(regs->msr & MSR_RI))
 		die_mce("Unrecoverable Machine check", regs, SIGBUS);
 
-bail:
 	if (nmi) nmi_exit();
 }
 NOKPROBE_SYMBOL(machine_check_exception);
-- 
2.23.0

