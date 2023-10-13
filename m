Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA1E7C7D84
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 08:11:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GTHEL/fK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6GN94SWZz3vX0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 17:11:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GTHEL/fK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=m.muzzammilashraf@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6FVb6lK8z30gn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 16:31:34 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6b20577ef7bso330266b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 22:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697175089; x=1697779889; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jy7TboT1tjJJztCz7Esa81WmhMy+A2tzF01Kh4RO/iQ=;
        b=GTHEL/fKDVwyTUA8UfY7a2z6lNwvJXK6Y+vIYPIRSNHAJwrJ7O8biiRttto5WVYZhc
         JwLvTLERuaapcBBkL01YTY3PZDqHyWs0ha1b8vpngPZOZI9jT9HkgZbWICXWC57Hozl+
         oYRGVoNKXV/YqdqiBjPlDktMqvj2ccCTq2Aw1JsXOKcfFA3SQpdjdLGfUf9cgxtuWBwn
         ++iZF4xPVfZkMQ9G9WjOz1cIbD1ShHoRlmWTfYOu0WWH9zRa2FYjrDWc31iYlxGg0Zau
         yiqQ5vdUkm0QAdSpj2JBBymKIFNU0Jx6X3y2rqP82Ve1LOG581bJNMM1xCd7p+9chGF9
         Uy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697175089; x=1697779889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jy7TboT1tjJJztCz7Esa81WmhMy+A2tzF01Kh4RO/iQ=;
        b=qepUJbVkXqWIP5evQ9iD3avoqpHyzbvo4VnonHMGVm1DYg0dvcRIXezJ14WuUnJFVC
         8w3CIipzQD8FtbFEpXZvHQJn2cWmqnu1DImj3/M0ViMrgycKCaXqdVGXUp2wrbcPpqmp
         8kTj2AjYOFnB69bgvsatb3ilsrUbtYMYXpR9QtWHsCUSKIn5xLr59FW/1rV3u+0SlnVm
         eepZ2jx0Z4SFEl83uO2vJaqVJ1IrcTXcFYqlm4pNv5zzUlIsLjatMMGmGVwiBVx0eQym
         5jGENQfIxRkvPja1HHjKnom5kmg0UTXAnJYZDJCawY/hUwf2Z4YhGMHjyvq6QQoFPS3Y
         7FUg==
X-Gm-Message-State: AOJu0YyHb7V0mXZUrRyclKU/P9yxbq46SVCda6evqFkcjEbpMbBYZvmP
	Xl6Hi02MS+9KSv8U80POrlo=
X-Google-Smtp-Source: AGHT+IHySDr3oEw1qDXbIuzEx4XcRygIfCFWDj/u4f5YrKZqXJ1e1m2fIFG1DX9JEnpa3d6n1wKU4w==
X-Received: by 2002:a05:6a20:729c:b0:15e:bcd:57f5 with SMTP id o28-20020a056a20729c00b0015e0bcd57f5mr26569539pzk.3.1697175089434;
        Thu, 12 Oct 2023 22:31:29 -0700 (PDT)
Received: from dreambig.dreambig.corp ([58.27.187.115])
        by smtp.gmail.com with ESMTPSA id d16-20020a17090ad99000b00274bbfc34c8sm2764917pjv.16.2023.10.12.22.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 22:31:29 -0700 (PDT)
From: Muhammad Muzammil <m.muzzammilashraf@gmail.com>
To: martin.lau@linux.dev,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com
Subject: [PATCH] arch: powerpc: net: bpf_jit_comp32.c: Fixed 'instead' typo
Date: Fri, 13 Oct 2023 10:31:18 +0500
Message-Id: <20231013053118.11221-1-m.muzzammilashraf@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Oct 2023 17:10:23 +1100
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Muhammad Muzammil <m.muzzammilashraf@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixed 'instead' typo

Signed-off-by: Muhammad Muzammil <m.muzzammilashraf@gmail.com>
---
 arch/powerpc/net/bpf_jit_comp32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 7f91ea064c08..bc7f92ec7f2d 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -940,7 +940,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				 * !fp->aux->verifier_zext. Emit NOP otherwise.
 				 *
 				 * Note that "li reg_h,0" is emitted for BPF_B/H/W case,
-				 * if necessary. So, jump there insted of emitting an
+				 * if necessary. So, jump there instead of emitting an
 				 * additional "li reg_h,0" instruction.
 				 */
 				if (size == BPF_DW && !fp->aux->verifier_zext)
-- 
2.27.0

