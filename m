Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AD968979A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 12:18:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7Y6v5Pvxz3f68
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 22:18:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AqSNHPUZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AqSNHPUZ;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Y606HqDz3bjc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 22:17:26 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id cl23-20020a17090af69700b0022c745bfdc3so4643947pjb.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 03:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MkAnl8y1IKR0vGcK6sJatB0kxycanS+Gom6rKj1BoG4=;
        b=AqSNHPUZTqeMuiChFyp8zxplfiefGqBGuaLmhJ6Jyhf/nX3i8yc6V3TkTCs8p523IN
         jVGw5mrC9jVmXHI8SlE9dUrkxQhl6yZtc7MicRtgD2tY8sEkDkw/Rgd8oIWlUtMdZqvu
         qtoHI7ruTFmL5ITZxLWAon7KyHBXQwL5nKvBIgGw0dhdrV2SGrIpZCs+f/0zi0CT15Ta
         QyArokocYpRqNrXQ49IfPugFhYlI1obpQBhUP8mZ7meUtZ7SB4l85RNIfsBH9V6bjthU
         JCi1VCZ+Oswp+TjvmK42Sq1j1zBc0hX1Jlgrv4fasODODPAhFVaZRWO3AyPGCKRGjsF8
         OHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkAnl8y1IKR0vGcK6sJatB0kxycanS+Gom6rKj1BoG4=;
        b=Bk/2iFoOaVcl8KuATM4MH4SG1wti5ds9NYCzPZLQCaQOkAVnrPM0cVc9SuJ/UUj2Xb
         pCETvqFfpS1aSLweyqXdJxBUe440Ys3wq+36JR4U8LYom3rZ65VNEekYiWBiRc3Rltep
         K8dNmMTIr+dy/O+tCcIPZ81YbRcdxKbI8rR1iW1a+qawhFigbLn5cJT5CKHgFU+7sKG/
         GEKR+/DU3MrynV5igcf+m0jzOP2MuegAd9PeRCgkIbuWBZ5HYAD7Q6MES/OrMlGgYFTs
         +I/NhvnBFtyizU46leEYelkvAwoOr5iP1FIwLiuXBImbrY0ggbvlJDjo6N6hvlfZ6YDM
         K6dQ==
X-Gm-Message-State: AO0yUKXYvGbTK/9PgmBwgT0hazC4IMoHPEy3j+zzhJousTpLIauhgyIE
	rx+KQcgsBQxBahs3DJcrplz0CLIJaA8=
X-Google-Smtp-Source: AK7set+TpzXOyH0t5RhWtScbqHxo+2woLqAzZLMLhS+Hc6wDblQDax5bgzr4y7z9T8kroc/gi8H7eg==
X-Received: by 2002:a05:6a21:9012:b0:bf:254f:7115 with SMTP id tq18-20020a056a21901200b000bf254f7115mr8763055pzb.25.1675423044273;
        Fri, 03 Feb 2023 03:17:24 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-117-77.tpgi.com.au. [193.116.117.77])
        by smtp.gmail.com with ESMTPSA id i15-20020a63bf4f000000b004f2c088328bsm1285151pgo.43.2023.02.03.03.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 03:17:23 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/3] powerpc/64s/radix: misc tidying
Date: Fri,  3 Feb 2023 21:17:15 +1000
Message-Id: <20230203111718.1149852-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Here's a few things I wanted to tidy before doing the lazy tlb mm
shootdown / exit TLB flush IPI optimisation. There is no hard
dependency just slight code rearrangement but since we're waiting
for the shootdown patches to go via the -mm tree we could do these
now.

It basically just removing a bunch of dead code, or replacing them
with WARN so we can remove them entirely in a release or two.

Thanks,
Nick

Nicholas Piggin (3):
  powerpc/64s/radix: Remove need_flush_all test from radix__tlb_flush
  powerpc/64s/radix: mm->context.id should always be valid
  powerpc/64s/radix: Remove TLB_FLUSH_ALL test from range flushes

 arch/powerpc/mm/book3s64/radix_tlb.c | 62 ++++++++++++++--------------
 1 file changed, 32 insertions(+), 30 deletions(-)

-- 
2.37.2

