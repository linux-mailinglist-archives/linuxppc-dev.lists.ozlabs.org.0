Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2DF6CA477
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:47:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXdc5VNtz3chQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:47:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IkbW1MPv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IkbW1MPv;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlXbk2SM3z3bTG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:45:38 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id kq3so8278341plb.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 05:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679921136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpTzbMH90nuCbMjFAXk2bMe3gXvv0QmXPsT0AcaRz3s=;
        b=IkbW1MPv6KEm1msEzQrCWRtsPTtcnIqtTNS/thWCQE6gia8r2dLwjR5rD/AduQGs5M
         sI48rtq8QvmU9ZDUpU/mxsIN4ypu/WtyjWI+d+uxhE2pZkFpAy5yaoDXTf/lAmq3LOFD
         MNW85UQq0meg7a2JbyluKGSGO+682E928NcSBfRxJw23lglCL8DiP4aaCxw3gHjZGbBz
         sLlIubqjzTzWzLCPN5RlG3Vp8IrKY9lzhznQn8AZ3hRWV5eZtAALNwtl/aSN3SEaouCj
         YZuYGrnlD5wonITvJQommGEcNECDBDCzPwvx7XdSmlwzuCPbt8HXlsV1N5FyminnSMnX
         9pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpTzbMH90nuCbMjFAXk2bMe3gXvv0QmXPsT0AcaRz3s=;
        b=Bs1ZoUJ3pN4LM+lQOYAJEmDIjCSNP/0LPheO5D1INwD7+T/X6cqjSXkAw9cuE/GDPz
         2dNpbFLRYPXqWD1FvO4OgHAkzRESyZyTrPzMwKQNqpd9kUL4q8LyUTSnkjywd++jeYJf
         T8CtGvJ5cjjCWF6grjooFBKW3H/6BAy1orRx16i7kIGto6h7rLgXxIBJZ91UFcArVYgZ
         qDaG+DkMYR2xQu7sBSm4ty7QZq3IV7llR+VDff4SDZ1++msDafDZcUNy+PEOmj6D5C5h
         sVMjI2ldRuoGiJOcajfXwR+b8/O3hJfiKkCiCcb190ry23R16ChWwadCAKDBGdJ8qIcG
         r3+Q==
X-Gm-Message-State: AAQBX9cgUzYlOLCYgh4nYrkwt400PON+QStZUrrNKz2qHH6GJiaH81ed
	13tUF6meNWx3gvzYvGt5cWoY+AM8WUw=
X-Google-Smtp-Source: AKy350Ys9+sy3qay/A4osnxqbLBpaOg7QfgIQGCXXJVLpDbyCI8IS4fJ1/iP285iIlTJ8KQSQGdOdg==
X-Received: by 2002:a17:902:c9d2:b0:1a1:a9a4:ba26 with SMTP id q18-20020a170902c9d200b001a1a9a4ba26mr9222927pld.8.1679921136153;
        Mon, 27 Mar 2023 05:45:36 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id ay6-20020a1709028b8600b0019a997bca5csm19053965plb.121.2023.03.27.05.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:45:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v3 01/13] MAINTAINERS: Update powerpc list
Date: Mon, 27 Mar 2023 22:45:08 +1000
Message-Id: <20230327124520.2707537-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327124520.2707537-1-npiggin@gmail.com>
References: <20230327124520.2707537-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KVM development on powerpc has moved to the Linux on Power mailing list,
as per linux.git commit 19b27f37ca97d ("MAINTAINERS: Update powerpc KVM
entry").

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 649de50..b545a45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -79,7 +79,7 @@ M: Laurent Vivier <lvivier@redhat.com>
 M: Thomas Huth <thuth@redhat.com>
 S: Maintained
 L: kvm@vger.kernel.org
-L: kvm-ppc@vger.kernel.org
+L: linuxppc-dev@lists.ozlabs.org
 F: powerpc/
 F: lib/powerpc/
 F: lib/ppc64/
-- 
2.37.2

