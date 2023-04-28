Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6284E6F20BB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 00:13:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7RhN1Xpmz3fRT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 08:13:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IETAsgpW;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EsFu/1f9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IETAsgpW;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EsFu/1f9;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q7RgR3jr3z30QD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Apr 2023 08:12:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682719965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4SoSIPzR5rKJuvsqRvAsre6hhkg4OyDHoRlHAIoohdY=;
	b=IETAsgpWt902qgl4MEjuSFWKoFnSn1mQTbiooLFPsOQijzcO7nB7Kh/7C+wZDygCoo17ge
	pCg5AYecnnitlXkrgtD27wdomLNVmTUHPIOKSnjMK+8cwYoztCGihY83vyiAcH/0m3X2IP
	jCMym4ShFPHS4v22Aja/g6LSthGFK/I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682719966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4SoSIPzR5rKJuvsqRvAsre6hhkg4OyDHoRlHAIoohdY=;
	b=EsFu/1f9QJrsTemTaej5xC/ru95P4z4c6vjhwBWRVD7L0LKrY3GLA7PJM4pVmJvvWuKAlS
	C/7uDrysMjOOGQCo2LLmFjxm+SzgSKu4Rjg+GyzzCCw4yMQ8rPgzzRU0wMdkLf51B0+8jk
	8+m5ZrmUu2fwSNJzKJdQiRv4cZyLRqU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-h401uzWkNrisT7x64W65RA-1; Fri, 28 Apr 2023 18:12:44 -0400
X-MC-Unique: h401uzWkNrisT7x64W65RA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-5efd8b1643bso6635696d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Apr 2023 15:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682719963; x=1685311963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SoSIPzR5rKJuvsqRvAsre6hhkg4OyDHoRlHAIoohdY=;
        b=WmXPpXv3x+i9i1AV9PBqZC1Qmqx8jMNzHJvAJfdTfPhHGujNRX3xdYpoDJodv3iJ1D
         XPCbTWxNdSYeGBJRKfhR0JnUnanNBU8DS6FcZzuQX0+bXc4aYuzj4ZyY61U4xfGq88Si
         JEgQ80Ka0tVGRyFRacgwiInQ0K0sFF8iko/BHYOY0GjoS7SLZbp2ORkYgfcaSo2/7o3Z
         DjISVFNnxC56HhGv1choWOb4eeXGUJvYR5VQiUITn9YfL5oDFSRSQ7vNYlMEVQ3jA6Bo
         g46REMug+RaihPP8TaTD9+EHh0tD308lWLnCNZmOUyhyyzqQ0xb0GMN1MARw5lDdZGH9
         fXFA==
X-Gm-Message-State: AC+VfDyQcmLEqHleHAxXNEvVxPJwWFfIL9RoSzxK+CHYnvlpURaMy2bh
	vhSkyhiob7FX+rZIuOBYkVb698MbA3a9nfpFqtYvixf4tZ/qWdv09QdWTD8BNxCaO7GUSMhTZ5r
	zFS5l6RD6h3psSmYwzW0LKEibXg==
X-Received: by 2002:a05:6214:5015:b0:5f1:5cf1:b4c0 with SMTP id jo21-20020a056214501500b005f15cf1b4c0mr11992740qvb.38.1682719963545;
        Fri, 28 Apr 2023 15:12:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ68wQ60YLfWK41nYriImzutStd+XuFNGZ3TB+rrfiw7k7lQMX+A0ewHmTHgEP7TF2v1ef0Bwg==
X-Received: by 2002:a05:6214:5015:b0:5f1:5cf1:b4c0 with SMTP id jo21-20020a056214501500b005f15cf1b4c0mr11992721qvb.38.1682719963287;
        Fri, 28 Apr 2023 15:12:43 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id j13-20020a0cf50d000000b005eee5c22f30sm6731089qvm.139.2023.04.28.15.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 15:12:42 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: arnd@arndb.de,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc: remove unneeded if-checks
Date: Fri, 28 Apr 2023 18:12:40 -0400
Message-Id: <20230428221240.2679194-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For ppc64, gcc with W=1 reports
arch/powerpc/platforms/cell/spu_base.c:330:17: error:
  suggest braces around empty body in an 'if' statement [-Werror=empty-body]
  330 |                 ;
      |                 ^
arch/powerpc/platforms/cell/spu_base.c:333:17: error:
  suggest braces around empty body in an 'if' statement [-Werror=empty-body]
  333 |                 ;
      |                 ^

These if-checks do not do anything so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 arch/powerpc/platforms/cell/spu_base.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/platforms/cell/spu_base.c b/arch/powerpc/platforms/cell/spu_base.c
index 7bd0b563e163..dea6f0f25897 100644
--- a/arch/powerpc/platforms/cell/spu_base.c
+++ b/arch/powerpc/platforms/cell/spu_base.c
@@ -326,12 +326,6 @@ spu_irq_class_1(int irq, void *data)
 	if (stat & CLASS1_STORAGE_FAULT_INTR)
 		__spu_trap_data_map(spu, dar, dsisr);
 
-	if (stat & CLASS1_LS_COMPARE_SUSPEND_ON_GET_INTR)
-		;
-
-	if (stat & CLASS1_LS_COMPARE_SUSPEND_ON_PUT_INTR)
-		;
-
 	spu->class_1_dsisr = 0;
 	spu->class_1_dar = 0;
 
-- 
2.27.0

