Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A026C1258
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 13:53:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgF5S66lkz3cgR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 23:53:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AmR2DPsQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AmR2DPsQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AmR2DPsQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AmR2DPsQ;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgF4X6yT9z3cFw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 23:52:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679316729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j7ASg0gkUTJq52inUxEUZw0nsEnRgkwG95p6EniSL+I=;
	b=AmR2DPsQiNwHVJ+95i8agla137nPMdzo9uxf2GfhZbjNaQpTF57Qqvz3GesvIDCQXCuumm
	TNAaDsMCwvJhigGUDDcAMnKZCzdwkf3ZtZIY2lYuCxZPGYAF8XmaYUG6pN7Ac/gIhxc9r4
	P7d35PxCw2X2/n6EOOBHszub/BhAiac=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679316729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j7ASg0gkUTJq52inUxEUZw0nsEnRgkwG95p6EniSL+I=;
	b=AmR2DPsQiNwHVJ+95i8agla137nPMdzo9uxf2GfhZbjNaQpTF57Qqvz3GesvIDCQXCuumm
	TNAaDsMCwvJhigGUDDcAMnKZCzdwkf3ZtZIY2lYuCxZPGYAF8XmaYUG6pN7Ac/gIhxc9r4
	P7d35PxCw2X2/n6EOOBHszub/BhAiac=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-xfm-IuN3OE2cDHP8OLNnSQ-1; Mon, 20 Mar 2023 08:52:05 -0400
X-MC-Unique: xfm-IuN3OE2cDHP8OLNnSQ-1
Received: by mail-qt1-f197.google.com with SMTP id u1-20020a05622a198100b003e12a0467easo1758024qtc.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 05:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679316725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7ASg0gkUTJq52inUxEUZw0nsEnRgkwG95p6EniSL+I=;
        b=JvIrcR74RYudKiVLjPERYcnevyaCO0H4Sf2KnmwRscYe+vgds776Qb4DJPXxQcY6So
         ozYcqi5R+DvUvj9KgqH3H5eqeQffMZMxC/wSpmaL7FmoU630uYsVcQS9XwoG+ZqyOJtB
         GfQzGduyJ0kN0EpMCMoN2lR5SSzzbyGrF4HuCmt+Py9qzlj8uMtvxj8dY781MzXb4zhd
         6Y9PxOCkyg4WdDsHJq1NKi6Cg+BPoMAZYJG7qvg999lYil4o8Twg0Zg1ytkElfhESDo9
         Zeix1lcUQ0jX1J2AAnqH9FsYSskjK/Jgd6V0DKEV+KIL5S2iz+bbEzwsfFnyvedK7n7s
         erYg==
X-Gm-Message-State: AO0yUKXaP/SM+yUBpVfjfGRgVpYEVe6k3AUb1JoVv1EDJdZEDt4FpxG0
	t6GeRd9Zzz0IPajcOOtZzKF0Wv3Y26Mo1Yq6744WMrp7AtR72HfcZ3PlU+Y0j2cFjn7XUkk7PQS
	/ijK6pMfWkY8Z3pN5QQivzhO1eg==
X-Received: by 2002:a05:6214:29c1:b0:5ac:239a:9200 with SMTP id gh1-20020a05621429c100b005ac239a9200mr36792341qvb.9.1679316725187;
        Mon, 20 Mar 2023 05:52:05 -0700 (PDT)
X-Google-Smtp-Source: AK7set/mIgQ9WLkpN/lX38TAKIMzAXzxhdDQGgmTFJDrdCZybZKyAGo36og/nqUn3oQNrEhjhBPFaw==
X-Received: by 2002:a05:6214:29c1:b0:5ac:239a:9200 with SMTP id gh1-20020a05621429c100b005ac239a9200mr36792313qvb.9.1679316724937;
        Mon, 20 Mar 2023 05:52:04 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id r132-20020a37448a000000b007466432a559sm5038056qka.86.2023.03.20.05.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 05:52:04 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: qiang.zhao@nxp.com,
	leoyang.li@nxp.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Subject: [PATCH v2] soc: fsl: qe: remove unused qe_ic_from_irq function
Date: Mon, 20 Mar 2023 08:52:02 -0400
Message-Id: <20230320125202.1721775-1-trix@redhat.com>
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

clang with W=1 reports
drivers/soc/fsl/qe/qe_ic.c:235:29: error: unused function
  'qe_ic_from_irq' [-Werror,-Wunused-function]
static inline struct qe_ic *qe_ic_from_irq(unsigned int virq)
                            ^
The use of this function was removed with
commit d7c2878cfcfa ("soc: fsl: qe: remove unused qe_ic_set_* functions")

This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: Add to commit log when the use was removed.

---
 drivers/soc/fsl/qe/qe_ic.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index bbae3d39c7be..c0b4f865fba9 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -232,11 +232,6 @@ static inline void qe_ic_write(__be32  __iomem *base, unsigned int reg,
 	iowrite32be(value, base + (reg >> 2));
 }
 
-static inline struct qe_ic *qe_ic_from_irq(unsigned int virq)
-{
-	return irq_get_chip_data(virq);
-}
-
 static inline struct qe_ic *qe_ic_from_irq_data(struct irq_data *d)
 {
 	return irq_data_get_irq_chip_data(d);
-- 
2.27.0

