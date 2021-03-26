Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0C434A977
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 15:20:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6PJY1rWGz3c3f
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 01:20:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=r7Fh6TMM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830;
 helo=mail-qt1-x830.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r7Fh6TMM; dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6PJ810yJz3bcb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 01:20:06 +1100 (AEDT)
Received: by mail-qt1-x830.google.com with SMTP id x9so4287465qto.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 07:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BN/R2grtJjh7I6O/dO8Ts4jEMqaIzWtzPaPY5/MFM2U=;
 b=r7Fh6TMMyJMZoBbB735ZWmPYk3L0xkk8IKLDfdIs4Cc57QPEoJUwmQXxJOswicrX+O
 K4h42ZwFedZuyuOlUtMKy2rHdQNTwDZ/Fu8EvQ/2PtkZFcE1o0VGwWFDw7cNVhStUHzf
 Xqus4+TFc4+4QqEA1NLBj2sS2dkgsCl08+HRO1jUWziFp5c+f1KtFUst/1AKKbrUwQ07
 Lf00qkduMEbpgDD4W32iRIaTaubX4jlmuTZ9rDGYMkvgKrI/cuAef8ap6IAsfis4jW3n
 UKk1E4pzDsV5LKs1xkYb6mOOi9mRQrP/da6rxdzM896q2mXNqbie/nWU/hKCYMwt8S9b
 tQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BN/R2grtJjh7I6O/dO8Ts4jEMqaIzWtzPaPY5/MFM2U=;
 b=bpxfqkKNkucf7MhdxIFd2QgyEJRYQp7QvFEHWoXKpdoalh7yu8GLve4CYecbsLWxHj
 9CBgCBIrN+gJ/haV7AT2DqPULHWukmIJvSlMCIIwWUzYNP7v1fQ8sz6hTz2GtDP7Pr5o
 jpJxxJIHyXekFkgihkh1f3VWyZ9c7V3uNpf/Ot+3Y59MVu/PY+afbKoAZUidg8z4yzYA
 XeL2qVyAOW7zBGfjuFEn6s6kKyjTbmDUDj+eQgSmImmq0aqAX38diCk3O5AhNT9EGYHU
 klrx5Y+3WL6M4ZLr7uKyXQOmwxm2eT3f6vagtNVPKjJNl748vkpfOUzUeGlfv1IH8zwJ
 Cuuw==
X-Gm-Message-State: AOAM533ktnrPmdbg68qMIv70VSQgxtR6VlqMcxmy+IFGo3c87CuFUsBo
 0fS3bjNEvY2kWmC+8a2IhiHS+iOjX/o=
X-Google-Smtp-Source: ABdhPJxpj7OeuKAEDP+eLYGLYDPezpaunkWaOhCAqvc8KH/kr6c50UK3eejOlXyP4+lyqOrH9AdqAg==
X-Received: by 2002:ac8:688c:: with SMTP id m12mr12562428qtq.74.1616768403059; 
 Fri, 26 Mar 2021 07:20:03 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:3fd7:65e0:e5c6:f4fc:733c])
 by smtp.gmail.com with ESMTPSA id a10sm6689930qkh.122.2021.03.26.07.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:20:02 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/1] show 'last online CPU' error in dlpar_cpu_offline()
Date: Fri, 26 Mar 2021 11:19:53 -0300
Message-Id: <20210326141954.236323-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

changes in v3 after Daniel Axtens review:
- fixed typo in commit mgs
- fixed block comment format to make checkpatch happy
v2 link:
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210323205056.52768-2-danielhb413@gmail.com/

changes in v2 after Michael Ellerman review:
- moved the verification code from dlpar_cpu_remove() to
  dlpar_cpu_offline(), while holding cpu_add_remove_lock
- reworded the commit message and code comment
v1 link: 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210305173845.451158-1-danielhb413@gmail.com/


Daniel Henrique Barboza (1):
  hotplug-cpu.c: show 'last online CPU' error in dlpar_cpu_offline()

 arch/powerpc/platforms/pseries/hotplug-cpu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.30.2

