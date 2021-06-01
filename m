Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73590397F20
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 04:33:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvtPj5vlYz3bvD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 12:33:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YBGZ231c;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YBGZ231c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=YBGZ231c; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=YBGZ231c; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvhNl5SFmz2xfY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 05:02:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622574128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OzyeX92287pCSCdjXYXY+AZCrTaKpCfaTR9pXZCLBvE=;
 b=YBGZ231cPAgNcjMXSBpwU2ukZ3wylZUbTLsePiFwe7CArwEYAqR5YSl5Aw2lEtk3dhks3K
 LsNSDRacTB5+gzZr/US1PGmucqjYRGW/3tWZzBGRd0OrSUf0af+6dDcCDa9PpcIOr0rSuY
 iY89UVCYpSkfGlY7ExkOXqjlBWHhCM0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622574128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OzyeX92287pCSCdjXYXY+AZCrTaKpCfaTR9pXZCLBvE=;
 b=YBGZ231cPAgNcjMXSBpwU2ukZ3wylZUbTLsePiFwe7CArwEYAqR5YSl5Aw2lEtk3dhks3K
 LsNSDRacTB5+gzZr/US1PGmucqjYRGW/3tWZzBGRd0OrSUf0af+6dDcCDa9PpcIOr0rSuY
 iY89UVCYpSkfGlY7ExkOXqjlBWHhCM0=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-4fDY0R_cNfiI3PlMYMxWKw-1; Tue, 01 Jun 2021 15:02:06 -0400
X-MC-Unique: 4fDY0R_cNfiI3PlMYMxWKw-1
Received: by mail-oi1-f200.google.com with SMTP id
 x10-20020a54400a0000b02901e9af7e39cbso180221oie.22
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jun 2021 12:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OzyeX92287pCSCdjXYXY+AZCrTaKpCfaTR9pXZCLBvE=;
 b=gp4lqPSQ9YhA1GbokhSSy/Ca2dEMbsFPXZrcLHAu52ak7UkjbpROiupjt+RKz+b8+p
 ekMju3PeqpP8xP70dWQcDDWmZllR5pSRObZCY9P1EklFezweXPTXJWkcEbH4iFzB07Wm
 9hQpfcUzlUNJzSYj/EtTKrgKExzvrf9RzI4nBN6MN71XQfGF6A9dFLr2CqJhK8uIWcL8
 NABq2ct2N14pgMqPrRBRArrp/esGjw8gL8huae3TSpQBo533qgn96Kcz4QBTdiL4rhXO
 9PTYRzjSho3I1R22JYy9HafnonDvbMU6siDbsC+gs9Or7tqyhW1F9Pok5PGW6F/GO+Vg
 vJdA==
X-Gm-Message-State: AOAM531NlxjEl80nk4Pq7WbQdrxDvo06QYcr9+fugs8BMiQEEJo3lGqe
 /RFBRJ+I4bVaB/Bm5C6Oss/tCgonMsn0VNiWt2ETuBRrkIlPZwICPaqjsGDdw91w9tYkV8mKmZD
 M1y7GoUlLzsMTSdv9Tbo9kZRdfA==
X-Received: by 2002:a05:6830:19e5:: with SMTP id
 t5mr13680757ott.351.1622574125359; 
 Tue, 01 Jun 2021 12:02:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi1ijfArl6bJbOz+7gNbhwV8tt07NknMgOzP4eKM1GaXrNnLxFMcaBmzP/yXtHCkypQslZIg==
X-Received: by 2002:a05:6830:19e5:: with SMTP id
 t5mr13680730ott.351.1622574125169; 
 Tue, 01 Jun 2021 12:02:05 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id d1sm3974430otu.9.2021.06.01.12.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 12:02:04 -0700 (PDT)
From: trix@redhat.com
To: agust@denx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
Subject: [PATCH] powerpc: 52xx: add fallthrough in mpc52xx_wdt_ioctl()
Date: Tue,  1 Jun 2021 12:02:00 -0700
Message-Id: <20210601190200.2637776-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-Mailman-Approved-At: Wed, 02 Jun 2021 12:32:57 +1000
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
Cc: Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Tom Rix <trix@redhat.com>

With gcc 10.3, there is this compiler error
compiler.h:56:26: error: this statement may
  fall through [-Werror=implicit-fallthrough=]

mpc52xx_gpt.c:586:2: note: here
  586 |  case WDIOC_GETTIMEOUT:
      |  ^~~~

So add the fallthrough pseudo keyword.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index 8c0d324f657e..3823df235f25 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -582,6 +582,7 @@ static long mpc52xx_wdt_ioctl(struct file *file, unsigned int cmd,
 		if (ret)
 			break;
 		/* fall through and return the timeout */
+		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
 		/* we need to round here as to avoid e.g. the following
-- 
2.26.3

