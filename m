Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7373A05F3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 23:25:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G03Dx2lGgz3c6P
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 07:25:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RNSZSMid;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RNSZSMid;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=RNSZSMid; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=RNSZSMid; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G03CM5yfpz2xtr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 07:24:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623187451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V9tvOeij7irPdqtg/4eaarQWu4Ala2EOw38yDUGQMKE=;
 b=RNSZSMidlBewLYOvmvLVyvVDEWbMiEEUdYLZ2o8SovfPd7NzQ0iQcatuqWPcwTts7BRjD6
 yG+Xryd5sxiJyJoELUhzEmvCk2bEJVG7zF6cFZVu01Agem/GkFEoe+fK+vEOVUpGDYlOw6
 yXbULj8OxBZzcr4GlKBRrEI+PpYl4XM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623187451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V9tvOeij7irPdqtg/4eaarQWu4Ala2EOw38yDUGQMKE=;
 b=RNSZSMidlBewLYOvmvLVyvVDEWbMiEEUdYLZ2o8SovfPd7NzQ0iQcatuqWPcwTts7BRjD6
 yG+Xryd5sxiJyJoELUhzEmvCk2bEJVG7zF6cFZVu01Agem/GkFEoe+fK+vEOVUpGDYlOw6
 yXbULj8OxBZzcr4GlKBRrEI+PpYl4XM=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-u9WcaUM6PYCSCBQXdi6BZg-1; Tue, 08 Jun 2021 17:24:09 -0400
X-MC-Unique: u9WcaUM6PYCSCBQXdi6BZg-1
Received: by mail-oi1-f199.google.com with SMTP id
 a24-20020a0568080998b02901ee3e06e6a6so8965614oic.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 14:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V9tvOeij7irPdqtg/4eaarQWu4Ala2EOw38yDUGQMKE=;
 b=Af2NnJmiwnYfJYai3xqr3mcoUxOBnaC4GU5nTm/SgNo6VLOPYsA5EpGvs7S/fHknn9
 FUtpNNnfjrusUsrkcNlUmj/+0vatJMwovm2euYgsEOnmiU203NSFI/UdDu2g3RkmHzP2
 UDgY6rFDjHq4wNBQRokDItPD3YTjGOZ2Kdl2vIIOLiYHw9017PNhLatAciE9ekYoB9Nt
 2ZVasq/4yLzAz4vZETRCukera2LdY6kYHbwyE3vHo9rLtnwD0QKZ//8Zxr0d7iHhC1E0
 icFXMPId8bqgDKiAsM9uRJ2mtrKgsctDwJWrqFIOXUG9yuOZOS4Xn+GBTThl6+mIy5hN
 wo4Q==
X-Gm-Message-State: AOAM530Ovo4VeEFV4rOzPy1JNqgzCYWzrJhaC+H24Zf5ndxFIPCw6gtL
 gZMu5DqAtWeQnlbEGAsGPkKF6HOJqqaSAeb6wmFfm5aJ0hii+AlcZM7JHx/v1dyMtQ2N21rD7+v
 SS8vNh0//7+7xsHl8YTBANxHy1g==
X-Received: by 2002:a4a:ded3:: with SMTP id w19mr5293612oou.46.1623187449155; 
 Tue, 08 Jun 2021 14:24:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUcRpoqPmXEA6scCuFTxzSHKgG4PG3qjyFY5xu7aC63DD0rnFJZyVbbKXaRqPE6V2Ub7Lciw==
X-Received: by 2002:a4a:ded3:: with SMTP id w19mr5293585oou.46.1623187448949; 
 Tue, 08 Jun 2021 14:24:08 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 14:24:08 -0700 (PDT)
From: trix@redhat.com
To: mdf@kernel.org, robh+dt@kernel.org, hao.wu@intel.com, corbet@lwn.net,
 fbarrat@linux.ibm.com, ajd@linux.ibm.com, bbrezillon@kernel.org,
 arno@natisbad.org, schalla@marvell.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, gregkh@linuxfoundation.org, Sven.Auhagen@voleatech.de,
 grandmaster@al2klimov.de
Subject: [PATCH 03/11] Documentation: ocxl.rst: change FPGA indirect article
 to an
Date: Tue,  8 Jun 2021 14:23:42 -0700
Message-Id: <20210608212350.3029742-5-trix@redhat.com>
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
 Documentation/userspace-api/accelerators/ocxl.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/accelerators/ocxl.rst b/Documentation/userspace-api/accelerators/ocxl.rst
index 14cefc020e2d5..db7570d5e50d1 100644
--- a/Documentation/userspace-api/accelerators/ocxl.rst
+++ b/Documentation/userspace-api/accelerators/ocxl.rst
@@ -6,7 +6,7 @@ OpenCAPI is an interface between processors and accelerators. It aims
 at being low-latency and high-bandwidth. The specification is
 developed by the `OpenCAPI Consortium <http://opencapi.org/>`_.
 
-It allows an accelerator (which could be a FPGA, ASICs, ...) to access
+It allows an accelerator (which could be an FPGA, ASICs, ...) to access
 the host memory coherently, using virtual addresses. An OpenCAPI
 device can also host its own memory, that can be accessed from the
 host.
-- 
2.26.3

