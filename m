Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB7D3D51E8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 05:54:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5db51RQz3dcr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 13:54:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=h/yBtb1l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=h/yBtb1l; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5Z01dFYz30L4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:51:04 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id a20so10252941plm.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=inYRnRg2NKqvIr+mMkG5hJldbNhI6GosEIHyZNPewnI=;
 b=h/yBtb1lxuYcIdeaW8xJeYIeiRd/mC2XLmTXR4L1yqExrTFFrhi1W+pLsi/XEmUSX+
 FeK4TVSsOuHXwKa/LWG5HIiCka/eZ37gzNvSIelcTKY1DRJJOuZKcbSuYykF2GgEuJUv
 qRkUFsjtewgMdAlJcaBmyHvVMVeGpxuM/pXlzH8Nxy9yfHsS7eTRYRfBiftpm/KvsivE
 ZLc/3tjQFYRFhtMRgvWcdTrnUrzrFW2bv5T7mwxRBkgq356eo8FtD8tFkRc8PmOf5DPE
 H1x8HLD8WAnafTXjt0fFxfdaHXkPoHQRQa6juZ0cLYvlKnJHQz20yozSk5l7CSJkvmeA
 FohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=inYRnRg2NKqvIr+mMkG5hJldbNhI6GosEIHyZNPewnI=;
 b=pgucukX2AjaFA/ulCd5Wwv4c0150gGBzXuz9qTN/9VWDtfg38G2Bd9Ju4eeqT4r4Pt
 sdEJAR9vvvQc1aFdARHi0knDGllie9D3pL6DgrdYNyBkGFcpp1KYB23oqJd68xf3Pdiq
 ZULb/Q/K79aVlp16bsrpTRh5VFC8UPEpmqunL0OQliiVi26vAxYPuJKYFHXatmLLCUx8
 r+mGah9o/OH/C3Ol7qhgDtkbyzoDLhApr3CgtRQrIkKHswjsQwjXwOHf/JNqDmunWcKk
 8wBK7s3FbVzSzTQ9oHkm/+v3VNtkAZ26LLNoYPSeKzeUfWHKkDxL+kCqTOEdmo5fgxN6
 +WfA==
X-Gm-Message-State: AOAM531Lln8JMiKjXFFq41oF4fWtZisiAboGiO6AuYJXWgatGKLp8tsd
 tgmffm08Wu3LMLsiuxxouH8=
X-Google-Smtp-Source: ABdhPJwKZUlDXjIvGIVIblAM1sFF3K9m6X/SqDI+cAiv+fYwhbh5Z51Mm+dYXV8beBhKuYVBxJwyXw==
X-Received: by 2002:a63:ed47:: with SMTP id m7mr16427295pgk.194.1627271461747; 
 Sun, 25 Jul 2021 20:51:01 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:51:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 07/55] KMV: PPC: Book3S HV P9: Use set_dec to set
 decrementer to host
Date: Mon, 26 Jul 2021 13:49:48 +1000
Message-Id: <20210726035036.739609-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210726035036.739609-1-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The host Linux timer code arms the decrementer with the value
'decrementers_next_tb - current_tb' using set_dec(), which stores
val - 1 on Book3S-64, which is not quite the same as what KVM does
to re-arm the host decrementer when exiting the guest.

This shouldn't be a significant change, but it makes the logic match
and avoids this small extra change being brought into the next patch.

Suggested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 905bf29940ea..7020cbbf3aa1 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4019,7 +4019,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - mftb());
+	set_dec(local_paca->kvm_hstate.dec_expires - mftb());
 	/* We may have raced with new irq work */
 	if (test_irq_work_pending())
 		set_dec(1);
-- 
2.23.0

