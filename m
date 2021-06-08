Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9773A060C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 23:29:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G03Kv71xzz3dpS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 07:29:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PkVwxgn2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PkVwxgn2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=PkVwxgn2; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=PkVwxgn2; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G03Ck38gPz3bvC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 07:24:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623187471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jeq8qRfoRfsbx4uL9oOz0deeKscRGraAzU6rnmI4bDk=;
 b=PkVwxgn2c0ptfZauBCQqbbnhC0LPYLonso1zytmUouFLduUF5tOaOM8uNa0as9EklrgxYG
 rF6Qhd0gOpCnjx3g1t6hndcuuo7rXCu7/AikY88GnUjlft2oufHlK3QaKjmGtn4c2SYV8v
 +6qGhET4KFsxXi3c/gwmsudlKN7MFPE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623187471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jeq8qRfoRfsbx4uL9oOz0deeKscRGraAzU6rnmI4bDk=;
 b=PkVwxgn2c0ptfZauBCQqbbnhC0LPYLonso1zytmUouFLduUF5tOaOM8uNa0as9EklrgxYG
 rF6Qhd0gOpCnjx3g1t6hndcuuo7rXCu7/AikY88GnUjlft2oufHlK3QaKjmGtn4c2SYV8v
 +6qGhET4KFsxXi3c/gwmsudlKN7MFPE=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-GFoaDubeNrWw2xzcJ2E89Q-1; Tue, 08 Jun 2021 17:24:28 -0400
X-MC-Unique: GFoaDubeNrWw2xzcJ2E89Q-1
Received: by mail-oo1-f72.google.com with SMTP id
 v8-20020a0568200048b0290249f46c70eeso3659292oob.22
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 14:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jeq8qRfoRfsbx4uL9oOz0deeKscRGraAzU6rnmI4bDk=;
 b=gweazc9iZF2/qjMwmXo1pQr84bgMnqY6Kh+Y2Z7uc/jb2JT9YIvZ6pRO92hGhCwcmF
 0qEzoAIyEWUBqhFMx0jygLzJPxr0qhWocivhrFO90T1kb3q/gZ6Q9ey6FmeQkvK4SsGX
 796SEyIv2k98hVXg3tgF0gxnr2yy1reUelrMzCVZfe8Hk5B8hFQyosK3ByFW3+OYA/dT
 9WDSVk9jM+J6UbXCJPFjl3j8Zn7p3r8W9KWjzWmLlT6dHuxLRzFxgXVyIYgoX74tJb1f
 clzVYR6XNBmM6FEAVHbJOlLTe02nKhTwEx3kuAJMxYMgGyMPf3oFLkR+tQky3Bd+7kHC
 Otjg==
X-Gm-Message-State: AOAM533frgIB89I3Wz3W5egE1ZHTkQ+4V2maPp9th9FKzA/9s9RDzyQ0
 6Ny+m65DCfHqnGwavSwcHRlyd4rJwxIlA4UgPZoHAEMG4A+ryTkbzCGL8+6pogHKTmbcibFgkG0
 u86SBK/SbOyERDWkfZnrpW+muSA==
X-Received: by 2002:a05:6830:1309:: with SMTP id
 p9mr12963270otq.209.1623187468231; 
 Tue, 08 Jun 2021 14:24:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKsGI5o2pAZuxgtMx6UsQ5GpgFuru3G9QqB8VKcT3CwJSpYN5gRSP28hE4xYJAJAJCEsUFOQ==
X-Received: by 2002:a05:6830:1309:: with SMTP id
 p9mr12963250otq.209.1623187468089; 
 Tue, 08 Jun 2021 14:24:28 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 14:24:27 -0700 (PDT)
From: trix@redhat.com
To: mdf@kernel.org, robh+dt@kernel.org, hao.wu@intel.com, corbet@lwn.net,
 fbarrat@linux.ibm.com, ajd@linux.ibm.com, bbrezillon@kernel.org,
 arno@natisbad.org, schalla@marvell.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, gregkh@linuxfoundation.org, Sven.Auhagen@voleatech.de,
 grandmaster@al2klimov.de
Subject: [PATCH 11/11] staging: fpgaboot: change FPGA indirect article to an
Date: Tue,  8 Jun 2021 14:23:50 -0700
Message-Id: <20210608212350.3029742-13-trix@redhat.com>
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
 drivers/staging/gs_fpgaboot/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gs_fpgaboot/README b/drivers/staging/gs_fpgaboot/README
index b85a76849fc4a..ec1235a21bcc1 100644
--- a/drivers/staging/gs_fpgaboot/README
+++ b/drivers/staging/gs_fpgaboot/README
@@ -39,7 +39,7 @@ TABLE OF CONTENTS.
 
 5. USE CASE (from a mailing list discussion with Greg)
 
-	a. As a FPGA development support tool,
+	a. As an FPGA development support tool,
 	During FPGA firmware development, you need to download a new FPGA
 	image frequently.
 	You would do that with a dedicated JTAG, which usually a limited
-- 
2.26.3

