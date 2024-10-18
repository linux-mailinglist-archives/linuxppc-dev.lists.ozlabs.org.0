Return-Path: <linuxppc-dev+bounces-2368-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA039A38CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 10:40:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVJ7H5F6cz3bmY;
	Fri, 18 Oct 2024 19:40:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729240117;
	cv=none; b=jIx2kyPdyaoxnDxXVBEMKvPtxrtLn99lIODe6TB0l9SXZuk9S0jqyMFyqaLGjiPlPQzywQfYgKpAwLqbEhUyj963cQy/Do7zaYqeANg/uy1c9ZP29EyIxBOeJrbOx4z42XLTHz6WFfTK3tsQJZcNh6ozW49M8Gw+0RHflh5MdiSN9A4ZPmIfC8d3rDU9mZtNd1w30SmrGXBku6/zuoSThRFvC6fmJF6LJV6Sltms2XnGuoippJZxB0TMnTfcpluaO6uOCBOxNShmr3gbPEXb7e8g0RZjBMiTdlY7iDgodfcsLKf9G+PdcLtGGpUXwRyFz/Ly9dCblPAeHWfaVRp1vA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729240117; c=relaxed/relaxed;
	bh=w3R+DG0W9j/rrWWMMX7Q5Mr3+2LO1x036RhMhClSpMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d1j2nCOANzIxbAm5rUpfkwsR4Fk3XZhkPt5iXLnSBsh8vGgfQ5AzxawOxpHl2sfDuPV0fdS2/KMb69F+iPGVVX7MEouvyrt6cEkByBdxiUX9WEhqj40VcwCAJwFmgy6yOhSku2A/R33R6iJLgfuke58zkseEmka7hC4z8ctxISYHt3lrOZza+S22JFowcbvcMYsqb8etYg7aenDZ0Ktyco/f6wSRkPfxD4p4M/3P98cIz0paoWxI82BFVfwSlFBccuKOvnZ4Crhkf+RuzzyLcU8PNhjd6F/Yi4C2D1D7LF8pENpw0hSfRfjxl4ZvQL3PR5A1YdTyfPA3b6YWqpF7ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A4NJep0p; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=paulo.miguel.almeida.rodenas@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A4NJep0p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=paulo.miguel.almeida.rodenas@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVHsX6xXQz3bmH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 19:28:31 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20cdb889222so19266755ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 01:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729240108; x=1729844908; darn=lists.ozlabs.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w3R+DG0W9j/rrWWMMX7Q5Mr3+2LO1x036RhMhClSpMc=;
        b=A4NJep0pj5E9rpTZY5sZew4+l/HUZad++KR8RmEpf7dbkRkCVL9th9tmbjfNQebTEd
         8YXt8R23fUg3XsMw8Xd84+nq/Uuzu+JjaxJl5K6/9/71g3Swa34nl3+oU7K9XaZYVTYu
         XOecYPN4wHYO1AcmDwGuwvuDnVydEEnLGiREMHoycS9enr0r1i4sNY8BbnnVXEY4MWPy
         YSJsvfa8IJ2jyCHP76Fn5asZ3EUrclOIQ/o3Qi+gEsWK1VVh6RLII4evj1vKSPWxtsbp
         Nn5qlcoBUW0Bnw8ky3UOJJNr7NGq/lJZgUrA5hpv5DXKfgefrznucN632wfKEVwH8Xcc
         0Hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729240108; x=1729844908;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w3R+DG0W9j/rrWWMMX7Q5Mr3+2LO1x036RhMhClSpMc=;
        b=PrlQ75Z7b+uwCQWv/9itv7MTXyx4LP/12cRFGP8N+IMuTp4O3z3y5ZQ4lRQ/0CMmyl
         MKhhJfdPHnPbTv079vVf9ejG9dl5UABUiRwXjPQx7I7vR3fXPQ92vwlG6nPCmdTDsDyY
         8iOCqU1OOmGf0xmZQkxpptsCLbtT1ZfcAocq13HY7bHctUcW2U/ifS1vZEMmWWGHhhSG
         DmdbLQKM3JLkO8qpeNk9KDupiw0/kN0abhn3Xn8U3wVXw/TWvvtavBtg40u+00XzQ+F5
         VrhJz38Kk5HLVq+xn5zkOtqanKSDuKVQ2ABdiRbdWK2+lve3jMv+zenveKKmD4HooCW3
         YfWA==
X-Forwarded-Encrypted: i=1; AJvYcCVxIMbuxCMEYiy92498Gq/D7CfTDqrKmuNpR6pYxe2RoD6UET2J1e4B6CAzDgdz/lBkGn3DZpOf4Fhx2d4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz+lR1UBn9VoaNPmZ1hpfzPtrntMf/6WHVwsU3kteh63DkqOzQg
	CLRYoVVHvNnQ5toBnU13lTLxtbFM3wghYh+uXqCXIfrhPDWqJBCi
X-Google-Smtp-Source: AGHT+IG6iaZBZPpJWzw7Y9WwIiStxX0vWeUl7cQ3qA8msS64tetUPmBTp8/tEJ+3U+xyeA10M9cozw==
X-Received: by 2002:a17:903:990:b0:20c:d428:adf4 with SMTP id d9443c01a7336-20e5a8f3e51mr25219225ad.38.1729240107661;
        Fri, 18 Oct 2024 01:28:27 -0700 (PDT)
Received: from mail.google.com (125-239-144-11-fibre.sparkbb.co.nz. [125.239.144.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a8f75dbsm7976085ad.195.2024.10.18.01.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 01:28:27 -0700 (PDT)
Date: Fri, 18 Oct 2024 21:28:19 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	naveen@kernel.org, maddy@linux.ibm.com, arnd@arndb.de,
	chentao@kylinos.cn, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: paulo.miguel.almeida.rodenas@gmail.com, linux-hardening@vger.kernel.com
Subject: [PATCH][next] powerpc/spufs: Replace snprintf() with the safer
 scnprintf() variant
Message-ID: <ZxIcI0QRFGZLCNRl@mail.google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The C99 standard specifies that {v}snprintf() returns the length of the
data that *would have been* written if there were enough space. In some
cases, this misunderstanding led to buffer-overruns in the past. It's
generally considered better/safer to use the {v}scnprintf() variants in
their place.

While at it, fix some style issues pointed out by checkpatch.pl

Link: https://lwn.net/Articles/69419/
Link: https://github.com/KSPP/linux/issues/105
Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 arch/powerpc/platforms/cell/spufs/file.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/cell/spufs/file.c b/arch/powerpc/platforms/cell/spufs/file.c
index d5a2c77bc908..f766821fe3bf 100644
--- a/arch/powerpc/platforms/cell/spufs/file.c
+++ b/arch/powerpc/platforms/cell/spufs/file.c
@@ -2320,13 +2320,13 @@ static int switch_log_sprint(struct spu_context *ctx, char *tbuf, int n)
 
 	p = ctx->switch_log->log + ctx->switch_log->tail % SWITCH_LOG_BUFSIZE;
 
-	return snprintf(tbuf, n, "%llu.%09u %d %u %u %llu\n",
-			(unsigned long long) p->tstamp.tv_sec,
-			(unsigned int) p->tstamp.tv_nsec,
-			p->spu_id,
-			(unsigned int) p->type,
-			(unsigned int) p->val,
-			(unsigned long long) p->timebase);
+	return scnprintf(tbuf, n, "%llu.%09u %d %u %u %llu\n",
+			 (unsigned long long)p->tstamp.tv_sec,
+			 (unsigned int)p->tstamp.tv_nsec,
+			 p->spu_id,
+			 (unsigned int)p->type,
+			 (unsigned int)p->val,
+			 (unsigned long long)p->timebase);
 }
 
 static ssize_t spufs_switch_log_read(struct file *file, char __user *buf,
-- 
2.47.0


