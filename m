Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 930D83A060B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 23:29:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G03KQ71XQz3dhw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 07:29:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=irpC19/2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ii0ftSW/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=irpC19/2; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ii0ftSW/; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G03Cg1cGyz3bt1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 07:24:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623187467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sgq7YpZfI377cjTuKzZzdMcYM8vZyb+R30zx+84A9yI=;
 b=irpC19/2qQxbqZdApxZCVDqQE8sHLiOJ3Mwo+LHG3a+qgdAKKgYFyc+glvFXKRQa0R7Vae
 6Y0bQ1ix01a9/gUbxhVEF00HgTh6F49e74qkyX4QmJVZKY1oLehtsNY8jqAmBW3YKQeGw1
 km1HcetLWGjNB1SjcFeE6/QFvFvNhw8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623187468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sgq7YpZfI377cjTuKzZzdMcYM8vZyb+R30zx+84A9yI=;
 b=ii0ftSW/GStXy2ydlDYuJ8TexI1UrY9Zp00G7gGI26+8JfFsOygPCKIkXIiCEpaM4jL4mv
 Igblw/cswOLoD7zAvhZcNFQJVV/CM1RPpmYdtE2EKtSEODbkfkjZemf9jPXQpiTw0BrIfu
 5PAD3VJChuaa2KN9Cwh84mz0O4krwMU=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-lMacGJdbO-utQ5-okItN9A-1; Tue, 08 Jun 2021 17:24:26 -0400
X-MC-Unique: lMacGJdbO-utQ5-okItN9A-1
Received: by mail-oo1-f71.google.com with SMTP id
 o2-20020a4ad4820000b0290208a2516d36so14063248oos.16
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 14:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sgq7YpZfI377cjTuKzZzdMcYM8vZyb+R30zx+84A9yI=;
 b=a5iiKEihkER5WJO0V2iO/e5zEMG99KZbrdSHa5RUJI9g1hUa1hCLw+ejmL4MhFIX5k
 nGUqhqwvuiG1kPrsDisi1ScEk8zt4zz9iBGKm/UE5rG9tMhu7rvhXv3eFJijkF7Lp+C1
 M85zoXhPUN2OoYxHXAgua7KdIWK2R/ID5TQICjxaglfUNjwavjhP9/1JgmWZEwad/s6z
 Ra52V5RNKtP2vLhXGaB5Tg6xs5GY4f2pPhXVkOVevT3sTVDVS6Y7/Sa0Ur5euLrm9eOn
 NvcCxRole1iAeEOELfaM4joL8pDIXntZGKvLXWq5QyyQS15Htan2vpBl7nL5bTe6/3/L
 pFfA==
X-Gm-Message-State: AOAM533vkU4ab5cp8sn65qpFsdBxm1eYYUelrqKtRUBDHLealliAhXq9
 eEEYVOTcFG+Sql3+xLnvPAC2+Yv8NsBaMDrFVAgtG7vXGLDK/monjngFWNt+PX2gS46YoLR2hic
 DA7tPRUikylmhbikGRrMyze+rSw==
X-Received: by 2002:aca:33d4:: with SMTP id z203mr4176759oiz.51.1623187465852; 
 Tue, 08 Jun 2021 14:24:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysr+C3bZgIQEZy/8wCr9Q5uLj3VqD8M6xSNa0dsASWBdlkV/63bU+lwSL+xyqD9OEYmwRjzg==
X-Received: by 2002:aca:33d4:: with SMTP id z203mr4176741oiz.51.1623187465720; 
 Tue, 08 Jun 2021 14:24:25 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 14:24:25 -0700 (PDT)
From: trix@redhat.com
To: mdf@kernel.org, robh+dt@kernel.org, hao.wu@intel.com, corbet@lwn.net,
 fbarrat@linux.ibm.com, ajd@linux.ibm.com, bbrezillon@kernel.org,
 arno@natisbad.org, schalla@marvell.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, gregkh@linuxfoundation.org, Sven.Auhagen@voleatech.de,
 grandmaster@al2klimov.de
Subject: [PATCH 10/11] fpga: stratix10-soc: change FPGA indirect article to an
Date: Tue,  8 Jun 2021 14:23:49 -0700
Message-Id: <20210608212350.3029742-12-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608212350.3029742-1-trix@redhat.com>
References: <20210608212350.3029742-1-trix@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Tom Rix <trix@redhat.com>

Change use of 'a fpga' to 'an fpga'

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/fpga/stratix10-soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fpga/stratix10-soc.c b/drivers/fpga/stratix10-soc.c
index 657a70c5fc996..2aeb53f8e9d0f 100644
--- a/drivers/fpga/stratix10-soc.c
+++ b/drivers/fpga/stratix10-soc.c
@@ -271,7 +271,7 @@ static int s10_send_buf(struct fpga_manager *mgr, const char *buf, size_t count)
 }
 
 /*
- * Send a FPGA image to privileged layers to write to the FPGA.  When done
+ * Send an FPGA image to privileged layers to write to the FPGA.  When done
  * sending, free all service layer buffers we allocated in write_init.
  */
 static int s10_ops_write(struct fpga_manager *mgr, const char *buf,
-- 
2.26.3

