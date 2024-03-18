Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 867F887F103
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 21:14:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gzld0Kev;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gzld0Kev;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz5gH1rXNz3vdk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 07:14:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gzld0Kev;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gzld0Kev;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz5RR1jwdz3cL0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 07:04:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RceLUqudgSYtio91tFrZNJeoSc+POoSD4WuQnIajVyw=;
	b=Gzld0KevcuTJ+UoRHOZeboykx4LaMjiz3xBaIXaMA9tXAK7Pt25AjZmmjiLfqMZClqctBZ
	WzELH8nWgLZ7N1Jj8sdG2OwhpOsCwHr5GcE4DC1dMgmtyOF7sRVyL+XafcaLkDyj2PU8oe
	0M1Gm5nUlG2SjIvZEO+hk29YCZ5NHNg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RceLUqudgSYtio91tFrZNJeoSc+POoSD4WuQnIajVyw=;
	b=Gzld0KevcuTJ+UoRHOZeboykx4LaMjiz3xBaIXaMA9tXAK7Pt25AjZmmjiLfqMZClqctBZ
	WzELH8nWgLZ7N1Jj8sdG2OwhpOsCwHr5GcE4DC1dMgmtyOF7sRVyL+XafcaLkDyj2PU8oe
	0M1Gm5nUlG2SjIvZEO+hk29YCZ5NHNg=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-1N7VAoEYPdCb4u2lsLSYUg-1; Mon, 18 Mar 2024 16:04:29 -0400
X-MC-Unique: 1N7VAoEYPdCb4u2lsLSYUg-1
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5a4d25f4795so17496eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 13:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792268; x=1711397068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RceLUqudgSYtio91tFrZNJeoSc+POoSD4WuQnIajVyw=;
        b=QSiRrV/TLfNdy5WGujF4xP6AxfHASX72Ku8OXIlzYW/RXFNyaY16y/6r/qm1CZcMTI
         8VRtzNmH7cYaoYX0b4pn6mj4vWrJKsuB7bvECjnKMWjHNtuyGGwsKGrupuyv/EnuoGas
         fV/w54ZBJ68IpYyGcNIW9FX9F9uJPTUAU5oz/FMnHbbQ4mVIhh7cg9k7NaeQVH+W9TEl
         DsER3OszmoFWnH34FrAN3XJEVMaZOnz6X3Y7k7d3eQyuii3K2fj/75posVVpfbi2UG7Y
         beirxFJb26X6+kuWOp3B5lm3ZBLTmQjzy78VIN58PG1GDUMUgCt5x5baboCm94Hmfk8p
         Z3HA==
X-Forwarded-Encrypted: i=1; AJvYcCWSMmyoN/d6kKjSH77/Z0GQf4UOQvahNUF53eb5HvTUFyMi4mqywflSh6sF7BALCxY3/itYeTcQxjPg9RmEJ5AXbqEclVyndknpX9uQHA==
X-Gm-Message-State: AOJu0Yz98vbQryKls6mxw9APTFx6zOeKSoLOAPKizAoRKPyGzWMN/yS8
	5kzMu5YCnU11mebAYr1hlo+Ys8bpErVAHxiCv4jndDL3K/kFKK3VdsIvEpwOfaA3OSLjuRso8Kg
	VAcYY3KuueBDkji5utq9RUFUD/dXwTB+52KaJYqFBci0OH4IxsuDwRujQ0saXHCI=
X-Received: by 2002:a05:6358:65a5:b0:17e:b905:ae1a with SMTP id x37-20020a05635865a500b0017eb905ae1amr174632rwh.0.1710792268095;
        Mon, 18 Mar 2024 13:04:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGISjMhnC6jpMGGK6QBF7/frbKYlLqkW40smiDqxegPdY+XDqO7mpvYlvBe3yHbKZyIwRsTRA==
X-Received: by 2002:a05:6358:65a5:b0:17e:b905:ae1a with SMTP id x37-20020a05635865a500b0017eb905ae1amr174607rwh.0.1710792267562;
        Mon, 18 Mar 2024 13:04:27 -0700 (PDT)
Received: from x1n.. ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b0042ebbc1196fsm3484491qtb.87.2024.03.18.13.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:04:27 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 14/14] mm: Document pXd_leaf() API
Date: Mon, 18 Mar 2024 16:04:04 -0400
Message-ID: <20240318200404.448346-15-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318200404.448346-1-peterx@redhat.com>
References: <20240318200404.448346-1-peterx@redhat.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Muchun Song <muchun.song@linux.dev>, x86@kernel.org, Matthew Wilcox <willy@infradead.org>, peterx@redhat.com, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

There's one small section already, but since we're going to remove
pXd_huge(), that comment may start to obsolete.

Rewrite that section with more information, hopefully with that the API is
crystal clear on what it implies.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/pgtable.h | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 85fc7554cd52..6b0d222a7fad 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1770,11 +1770,25 @@ typedef unsigned int pgtbl_mod_mask;
 #endif
 
 /*
- * p?d_leaf() - true if this entry is a final mapping to a physical address.
- * This differs from p?d_huge() by the fact that they are always available (if
- * the architecture supports large pages at the appropriate level) even
- * if CONFIG_HUGETLB_PAGE is not defined.
- * Only meaningful when called on a valid entry.
+ * pXd_leaf() is the API to check whether a pgtable entry is a huge page
+ * mapping.  It should work globally across all archs, without any
+ * dependency on CONFIG_* options.  For architectures that do not support
+ * huge mappings on specific levels, below fallbacks will be used.
+ *
+ * A leaf pgtable entry should always imply the following:
+ *
+ * - It is a "present" entry.  IOW, before using this API, please check it
+ *   with pXd_present() first. NOTE: it may not always mean the "present
+ *   bit" is set.  For example, PROT_NONE entries are always "present".
+ *
+ * - It should _never_ be a swap entry of any type.  Above "present" check
+ *   should have guarded this, but let's be crystal clear on this.
+ *
+ * - It should contain a huge PFN, which points to a huge page larger than
+ *   PAGE_SIZE of the platform.  The PFN format isn't important here.
+ *
+ * - It should cover all kinds of huge mappings (e.g., pXd_trans_huge(),
+ *   pXd_devmap(), or hugetlb mappings).
  */
 #ifndef pgd_leaf
 #define pgd_leaf(x)	false
-- 
2.44.0

