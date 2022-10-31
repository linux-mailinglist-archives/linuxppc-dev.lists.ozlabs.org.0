Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA82613005
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 06:55:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12SZ5sk0z2ygC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 16:55:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AQfG0Zav;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AQfG0Zav;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12Rd3rTGz3bjj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:54:52 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id k22so9824645pfd.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VENAdKjEzGpRrZXrowBGNJwY7kBSqfqcx4l5RfKHG50=;
        b=AQfG0ZavveKPxwqC53nfpvm0GC1Utj7v5jNUOcCD2PhpLUMg/7+ENm9vcpP7j7zL7n
         hLdod8RMWJ1ZYTw05175yWlP/ebz539K5D9cGpuL7du4l0dDRDdbHRCfrpLcj4pBms/+
         bDXCeCRr3PAB0gRVQxfUN4FxqWf5JE9OkrV9x7AXSeKlW2Xv9uopAPIdJzinlcI4jAQV
         82TN2z/plXmYsTtMXwdnWzgvlwR1bggqLFzXQT9TbUzl+a/qv5aKdrwVS39tfyyzHej1
         Wjg1F6rTvyM3s8EEArQuurzeWjtTYWzdwPY8bqsdgBbAEwIDZNQ6fxAgU+cb3LgRajvk
         AiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VENAdKjEzGpRrZXrowBGNJwY7kBSqfqcx4l5RfKHG50=;
        b=o5s8E/c7LPq6IlF46i1rQNeqeb1AGPPqa8eivjd17azVTlCgU04vhlWnPxKbKUuZA5
         zBM67mR6qQIpXiPcMAk8hututxLtLFW0tKUKFwBDeztLNgkagA6JIb9I0hY0sDjAZGMS
         xNl6JvKqLpNJUhaJzxF/AxywIcBctgDabhb8Gxe87QlKFy1MdnSDcf36n8tTTUwxamn9
         M9hSqJg3XVIxPQ4+G7Mferpfil0Db4PidwTElfKI2xGUnvQhVuQVwnaif4eor35QMvWp
         UDPQ2ItKQ0p7g1O4MiQ0jmBZxGigdK4ZQOgSIUFYxMgewQsxTL8go3GsYrDZGlbWxR/n
         Pugw==
X-Gm-Message-State: ACrzQf1+hKMHulR6Cb2vZwpNfVzJ44Q+l+M8/UZlPKSlPqJeXUubNaFW
	c2c6v9453sH0r/ed3VUZ0UB1txKrRD8=
X-Google-Smtp-Source: AMsMyM4NvQjqxAmd1wVW1ssGQO0tkeN8eeckqbiAhVLpT+Q4z/U1JXom4CTQ/vW2RvJ6ioLfqMH3iw==
X-Received: by 2002:a05:6a00:2382:b0:56c:b4d3:9057 with SMTP id f2-20020a056a00238200b0056cb4d39057mr12859542pfc.40.1667195690231;
        Sun, 30 Oct 2022 22:54:50 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:54:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 01/19] powerpc/perf: callchain validate kernel stack pointer bounds
Date: Mon, 31 Oct 2022 15:54:22 +1000
Message-Id: <20221031055440.3594315-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221031055440.3594315-1-npiggin@gmail.com>
References: <20221031055440.3594315-1-npiggin@gmail.com>
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

The interrupt frame detection and loads from the hypothetical pt_regs
are not bounds-checked. The next-frame validation only bounds-checks
STACK_FRAME_OVERHEAD, which does not include the pt_regs. Add another
test for this.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

Could the user set r1 to be equal to the address matching the first
interrupt frame - STACK_INT_FRAME_SIZE, which is in the previous page
due to the kernel redzone, and induce the kernel to load the marker from
there? Possibly it could cause a crash at least.

It also seems a bit rude to put a fancy next-frame-validation out in
perf/ rather than with the rest of the frame validation code.

Thanks,
Nick

 arch/powerpc/perf/callchain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 082f6d0308a4..8718289c051d 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -61,6 +61,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 		next_sp = fp[0];
 
 		if (next_sp == sp + STACK_INT_FRAME_SIZE &&
+		    validate_sp(sp, current, STACK_INT_FRAME_SIZE) &&
 		    fp[STACK_FRAME_MARKER] == STACK_FRAME_REGS_MARKER) {
 			/*
 			 * This looks like an interrupt frame for an
-- 
2.37.2

