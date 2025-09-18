Return-Path: <linuxppc-dev+bounces-12375-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D45CAB8565F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 16:58:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSJgF5lYLz30RJ;
	Fri, 19 Sep 2025 00:58:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758188201;
	cv=none; b=nWFJEfOjxHsHmdr0iGI04DUmmshDtBDbjTxeBhnExPQgGkDVKHyxTB5bhRlqNf2TWRUL/F57R6fjsa/7UrwlE5ZYqqzjvuQWx+mJtGXPyPvjPLxt8/oCV7f62p+/gx3pO63Cfc4e+oPFggJsjqRNZcfacqNTTTO0gk12U5tBMXjHQNy2G8ekhZ4uvbIvz3rB4C/HXWThxCLE/nihfhfcGlSi1GnpjZMf1Zew0IStpObcGDsNxR4HRH4wHeaM5elzM3Fzw2yEEqBA7fIHTqhoR7UuM1SQIrMz3vLGHgL34zxAnyW3aafYfZLiU8BMNQe/TNGBVy2VxEUs+liny3sORA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758188201; c=relaxed/relaxed;
	bh=SdBtG29DuxWk0x1+vO/vrZiCN7poYWKo12KFNkdCIPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kbnX/zge+bP4sa27RgRVLrOnrMgVlm6RZCYi9QOt2FWjdTiQBPjnaPoGmsEKup4qotV6qlGewCMHGKTCl9TB27LsngImfLmMV9zY6onyL1UYUyHBGqQAkUemypYU+vnN7T3/zYEAlePZEACP0icEEE5shzDKOLyg86A/3g5y4A7zNKcrDyryMZm433ClY0oqEeo/txJVOgq7Q/C8a/nD5w58LGpSr9Ni5IlboF/ZchiZHCZpFqb4iAQo8GlxEcmt91iC8xzelx/vpEmW4ZE6Bkj3MC7bN9SKaNc+wVz2bM7Cphha8lWhRj4bXudDI/p1Guw/wiD4xiZqfCtwTgG2uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M7y0JuK1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=lgs201920130244@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M7y0JuK1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=lgs201920130244@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cS9WX26zYz30Pg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 19:36:39 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2681660d604so7037515ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 02:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758188195; x=1758792995; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SdBtG29DuxWk0x1+vO/vrZiCN7poYWKo12KFNkdCIPk=;
        b=M7y0JuK1i1t7h6vW1uF63kUDZzQTUhZsY7jxNLk/LEupY0l0IZPxkGxpiOboeVp5fc
         k25OK/GojSpnYWmG+BXca1RH69bS3BQflbDBnNkzZcPDw0sccoDESH+LOl2DLmrV7RfN
         LYNVy/LGhRY0nY2YiR8NpM/hqciYXdpgmrVbMfbU/ujv6RS+pN2PAVUDuwq2muEev4NT
         ZuuAR43LytKVFoAKNBnc2N5RzuJ045guCWIpcsNQ98hvs6x7rTDKWvH5gWuiwSciEMmp
         7b9+LLzEJixaVrzKANVyWjfsUCcj0or47EfJXgbRvU4G2d9l6oLe4G+1XrXjhS3uW3+6
         UWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758188195; x=1758792995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdBtG29DuxWk0x1+vO/vrZiCN7poYWKo12KFNkdCIPk=;
        b=hpJaT9AeEyMldcJ5A50H1FZdPRVFJQnJTL+Y4A5+wefkT6U3KfnIlVQ+XavUy29bJg
         0xxSSH+25s2wdBp16Wb9UVq8dvyzCHTWBJQXU/qWVuCdJ/+vqixvtrOLi+oMGKkLVsMc
         zcUdB3jzg+Ir58vkygQDGLIPObkeOqTel5i+h4HDlu8Sl/pa5JCPZ55aYr5AxNnJ8vdy
         PCs8GZGtabwaWrjFYZQTG2G4ipArH7RbS1jGJuDKT8mivgxqnuCzgWl75HWB8FgmR4SL
         CdL2O2BlRzB6EH6KG1P9hP6+SCRYS+iiholW2pYBkF5EBYdSS35wKHKwUq8qRWwUcj5f
         yS6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMtf0ZosZYwr14Tcd0FsSHLzagY8scL0UhdOIH+R7X57NJ6/lC7JqJTL/DvXzqWhwxUghxLv1H2YUUuwc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YypB25UnfIstTmbcUg2ZPUWDCZncvTk7ViuASEt9m7EYrUcf+vp
	2ppoU8pytN86tAjvSvLp8vruWgNxpBc+bJDQcj0NESyZknYA8FJ+9gGi
X-Gm-Gg: ASbGncs0dTV6zE8agj7JaqFW5p5Batv2mO1fQf0EiV4V2TV6GrwLJuc6sEBOkZK0UY9
	oV+HuyDgRFlgcS4SLyv/AJbWhHkOq2FTsF7ljzUKebZ3PLN+SUc6+ApN+jYA+7P4FdGC4aIoYtv
	43HJ5sbvaJITwQDtD09q+ASs423xNR/zy++AsaWWBfCU46UEKzd6fyzFdS/jmUuEnlYmIgKuE0H
	2LaSv7ZBp/M2k48vy5OUd+O53+q60BLslgMdXZE5IPsWXwovOIxD0DVC72UR7TOqfiCY1brwqM/
	KJ9kCnjMnvJVmjwtOtTUfifY8xe833b7vokiQmyCnvs9wyWZxPjXNTLr+YtZxR9NME+8LHyH28o
	G1mVgOQSxTg/aQ+lNJjww94qoMQVrAEEIse5mEB5nTqIkwHNFWwE=
X-Google-Smtp-Source: AGHT+IHPVQDk6Ab2pQFcVltfSjSsGNPhsS0OloAUxOVgDrV9vtF9WjkL/knZUEDWVPGNTRaOkCpGOA==
X-Received: by 2002:a17:902:f548:b0:267:4b80:29c4 with SMTP id d9443c01a7336-26813ef9f5emr69353095ad.59.1758188195347;
        Thu, 18 Sep 2025 02:36:35 -0700 (PDT)
Received: from lgs.. ([112.224.155.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698030d8casm20015275ad.97.2025.09.18.02.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:36:34 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] powerpc/smp: Add check for kcalloc() in parse_thread_groups()
Date: Thu, 18 Sep 2025 17:34:15 +0800
Message-ID: <20250918093415.3441741-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

As kcalloc() may fail, check its return value to avoid a NULL pointer
dereference when passing it to of_property_read_u32_array().

Fixes: 790a1662d3a26 ("powerpc/smp: Parse ibm,thread-groups with multiple properties")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 arch/powerpc/kernel/smp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index dac45694a9c9..34de27d75b1b 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -822,9 +822,9 @@ static int parse_thread_groups(struct device_node *dn,
 
 	count = of_property_count_u32_elems(dn, "ibm,thread-groups");
 	thread_group_array = kcalloc(count, sizeof(u32), GFP_KERNEL);
-	if (!thread_group_array) {
-	ret = -ENOMEM;
-	goto out_free;
+	if (!thread_group_array) {	/* check kcalloc() to avoid NULL deref */
+		ret = -ENOMEM;
+		goto out_free;
 	}
 	ret = of_property_read_u32_array(dn, "ibm,thread-groups",
 					 thread_group_array, count);
-- 
2.43.0


