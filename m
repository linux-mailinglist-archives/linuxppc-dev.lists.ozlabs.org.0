Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3DE815993
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:50:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WLC8aTFF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsnXs3DDLz3dXN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 00:50:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WLC8aTFF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnP50jKtz3cPt
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:43:52 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6d411636a95so121375b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734231; x=1703339031; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9vi9A8BnmxecfXccnjGMyaVEwAoVGuHqLljFDxu3Rs=;
        b=WLC8aTFFUocm2yU1CGOXeJNF+ocYUwmRdqWIkAqcJ9V0SSVJBin+606QdWE9XMyYah
         QPBGFbdmrK3Nqtqhgb3LsAx9ZWlCnDV1gtXqz6HFaLvWH5hSUJU7SlI6mimWnz5XsPcv
         daiQomBQV9HmgtQE3QeV690j/h/jrJYiP/7hEDPp9DEIaZBvnrhjGg7Lt4xxySanykHB
         j8tXFLdXVy7y3qBTpuoMXr+0+vYYc73VWXJ4DzJ+YRe3oC31eMGFo5fFfMA8jYRHG2Ey
         BJbZXQdcN466i0BAk4TLlmBpiBcxAHSs0JrWCiGc+QnPOAD8JGbQ/0PRyMtg9BIjjz/G
         0UGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734231; x=1703339031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9vi9A8BnmxecfXccnjGMyaVEwAoVGuHqLljFDxu3Rs=;
        b=xAJcB60zwLB1zPaSIfDk/TOEp+GBSTrSAqWYBfy+cHmDJoTL81u7KnOhlKMDvP2cPx
         jewWpYVQUfbjnDSQ54yyQRVMyplBz/64rDaIIi5Swr/gENnGe3UQVoUrO545QnlZNREL
         4Cd39tAMssL2pQe/UFt4mJMcruiYYL0uv/KjSG2SkA1ATI+wS4FOzJGvecDczbnENp1m
         rRlx1gqBj3c7O71uzGqGyV+Y2LZ4DukSreqvOEGCTyFY4SX+1OP5RHa7QMMMFQDov/PR
         IICwLbWTEW3x4Atycu68EMnLjWmqOPH29+p6k30aRexgRd01Rq2QaxesuUsKl+KqS47o
         cFSQ==
X-Gm-Message-State: AOJu0YxCAajCLagdodpyrTfFPa3Z2z39ucrWb3Js+SIeK88NguItR4Eb
	W2uC5ctGnZkdtbb/v5iSQiE=
X-Google-Smtp-Source: AGHT+IGdwNSCwOhDAOfpfhtW+4neqd5nq+yI9WKHRC7yWx21sjisF8bpQUbPNR4+zqj564R8RiVGwQ==
X-Received: by 2002:a05:6a20:6a03:b0:18b:1f82:7d74 with SMTP id p3-20020a056a206a0300b0018b1f827d74mr18984224pzk.2.1702734230843;
        Sat, 16 Dec 2023 05:43:50 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:43:50 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 08/29] powerpc: Require KVM for the TM test
Date: Sat, 16 Dec 2023 23:42:35 +1000
Message-ID: <20231216134257.1743345-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231216134257.1743345-1-npiggin@gmail.com>
References: <20231216134257.1743345-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

QEMU TCG does not support TM. Skip this test gracefully when not on KVM.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/unittests.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index dd5f361c..e71140aa 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -65,6 +65,7 @@ file = emulator.elf
 
 [h_cede_tm]
 file = tm.elf
+accel = kvm
 smp = 2,threads=2
 extra_params = -machine cap-htm=on -append "h_cede_tm"
 groups = h_cede_tm
-- 
2.42.0

