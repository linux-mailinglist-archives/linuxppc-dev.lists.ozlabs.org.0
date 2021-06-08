Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 922C63A05F5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 23:26:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G03Fv6z8yz3cL1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 07:26:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U/oU1FS8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U/oU1FS8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=U/oU1FS8; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=U/oU1FS8; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G03CP2g1Tz304R
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 07:24:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623187453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wp596HvsXKCpAwusArsHwfjreuet0FT2ap8ASM9VttM=;
 b=U/oU1FS8HY3mTPbGyWwRCLUUDciwQuW0+fCKG6nwOLeQBUUfF2TUJM1Et8qaRnnARWYp/X
 Sxyd0YAXwK7y2KaLsU+QPOgLsZT+GHrhUEfVJiOYGTcbWdylsC+IBoS1RQUfeRPeaA+848
 GNYPasWlLbdYV9goaEhJ/NRX9789JNU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623187453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wp596HvsXKCpAwusArsHwfjreuet0FT2ap8ASM9VttM=;
 b=U/oU1FS8HY3mTPbGyWwRCLUUDciwQuW0+fCKG6nwOLeQBUUfF2TUJM1Et8qaRnnARWYp/X
 Sxyd0YAXwK7y2KaLsU+QPOgLsZT+GHrhUEfVJiOYGTcbWdylsC+IBoS1RQUfeRPeaA+848
 GNYPasWlLbdYV9goaEhJ/NRX9789JNU=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-2S94bg5OP9KcqvUZfKZwUg-1; Tue, 08 Jun 2021 17:24:12 -0400
X-MC-Unique: 2S94bg5OP9KcqvUZfKZwUg-1
Received: by mail-oi1-f199.google.com with SMTP id
 19-20020aca12130000b02901f43fbf2170so2375919ois.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 14:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wp596HvsXKCpAwusArsHwfjreuet0FT2ap8ASM9VttM=;
 b=O3YUEUWgvDnTTEkM35HweD+TqoRdQLV/KvnC2CSMEnFXh6fporTo8p+tnasovAo6li
 PCaUbDcz1B6/uz7ryinilcQtOIXjGZ4ye7MsMejnHEX/b7FnRDHHz9M6ne77oFnVKB+Q
 u03OcemhLbkEDoZLcSiUU/Fxt96oaLcSfmcEeHkcUiwK5Lj0XxbA9mZe9OdnCcGfnTW1
 ZMxj3rhnKwb0hYJy1l7fKFu9h+4YqSojbsyDBesEIZUq6dMNgfu5dhJly5JuwPRbyyqX
 lEpWh94tGscm5L6LFsy79hR99JctQQubjhualJ9aIQNj4VGVrU1iQfmXc6wyMWuNCQ55
 6MhQ==
X-Gm-Message-State: AOAM5337b0PxHETBzIkZM950Z3F0jsUkq5jwhZ6lvYmu8YLzNoY/n8pf
 3rU78zBaGdss3eh21uAQ11aeeBf4wsaqcLX2TwFPfORTp8lEixLqq3O6Wvhp58F3dKEam/OBbq1
 sNDBgPRxpZNz1DaFSvmQP6ldofA==
X-Received: by 2002:a05:6830:161a:: with SMTP id
 g26mr12732187otr.62.1623187451520; 
 Tue, 08 Jun 2021 14:24:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLOwO0hiMF+KA6dMHmw2cY7cTlxB9WKoQb/W2MRs5OG0rKOt4HtiG8bWLvQUw/6wISGO0yyQ==
X-Received: by 2002:a05:6830:161a:: with SMTP id
 g26mr12732164otr.62.1623187451344; 
 Tue, 08 Jun 2021 14:24:11 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 14:24:11 -0700 (PDT)
From: trix@redhat.com
To: mdf@kernel.org, robh+dt@kernel.org, hao.wu@intel.com, corbet@lwn.net,
 fbarrat@linux.ibm.com, ajd@linux.ibm.com, bbrezillon@kernel.org,
 arno@natisbad.org, schalla@marvell.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, gregkh@linuxfoundation.org, Sven.Auhagen@voleatech.de,
 grandmaster@al2klimov.de
Subject: [PATCH 04/11] crypto: marvell: cesa: change FPGA indirect article to
 an
Date: Tue,  8 Jun 2021 14:23:43 -0700
Message-Id: <20210608212350.3029742-6-trix@redhat.com>
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
 drivers/crypto/marvell/cesa/cesa.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/marvell/cesa/cesa.h b/drivers/crypto/marvell/cesa/cesa.h
index c1007f2ba79c8..d215a6bed6bc7 100644
--- a/drivers/crypto/marvell/cesa/cesa.h
+++ b/drivers/crypto/marvell/cesa/cesa.h
@@ -66,7 +66,7 @@
 #define CESA_SA_ST_ACT_1			BIT(1)
 
 /*
- * CESA_SA_FPGA_INT_STATUS looks like a FPGA leftover and is documented only
+ * CESA_SA_FPGA_INT_STATUS looks like an FPGA leftover and is documented only
  * in Errata 4.12. It looks like that it was part of an IRQ-controller in FPGA
  * and someone forgot to remove  it while switching to the core and moving to
  * CESA_SA_INT_STATUS.
-- 
2.26.3

