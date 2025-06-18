Return-Path: <linuxppc-dev+bounces-9462-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 078F3ADF436
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:41:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrcP6SPFz3bVW;
	Thu, 19 Jun 2025 03:40:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268437;
	cv=none; b=ApmMM3qfUtpS1lZc/aG1eSdd6tlKSg/Lq3jnzjnLGGXrD9XlnEtxiNF6G6ZW3S3MwSP9vkReRccAcTWLw+6LjFQG64iHC5/f1i8hdPue7xRi7/QiSMUx612WP18MdPiPDIqU0junj80HZKLo1mDTnUdY9gIgzj3ZE//pFBl0sjaZ3XNvA280a+LZ85cxK1Y6dLJrR/6ZWfUSscLlr6dBzJvbeLxAb9RkGsELS6a0qChm6zojJH381eWnrEKOQb1eB64+L6GDk+HJ9wvfbMYDvAVi+bDqmHBodgTEwgLn9AiY06KJKVZhw2S7mohm0we6MpKCguslOJpJ3KrjgNzd7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268437; c=relaxed/relaxed;
	bh=fkYbA0acVo3UX9Us91PPuYxLoMCXI95NEZ07wm0hikY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=aHvJ/Gw5dLgEGkNxsw8/Fv1MaBJJ2Nl4oNkAYB0p3hnjm1aHlmCKtzUMC5A4NERL0+HnEX0WViEbwOrTsEpS+U/mnKCIQnfATTbLOUIxS7W+vVMiYVljejEJuY8FZkhfd3SldmJ7v3i2zZ7OuagDO6cumSXNZyedxsOvE6/6Z63Xi3L0uuV08082GN2bKOJS7jxeIx7lftKOazTmiEpExSS+AKbtMLOLCThoIVeAfjlmjS+0aKuvDKXh83Lrr0PXZDbQ3t3FpL5YsE1jE3QGhu7GBeeKTcUBRKUMrRafKY/dS6vcHJIy3bk1Zy4lhkjHQ/Jfe31QDO+9V9KAWEiA6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zr/JJfoD; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zr/JJfoD; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zr/JJfoD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zr/JJfoD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrcN67Zfz30gC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:40:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fkYbA0acVo3UX9Us91PPuYxLoMCXI95NEZ07wm0hikY=;
	b=Zr/JJfoD1OBAhj8YxglxfjiSZoOwl++rKOA43HZAKxqDtdEUPhJ+wln0wBc64jQAsCWOAE
	ne4GYXB5u91/lfyIfi083ZFk8vCsnbW4TBhNNem2akFWdw9yIE98OY8cGxjO2iDoRI0+oA
	gzPkQsRUyl4FUn3WkABahVccyTTNmAc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fkYbA0acVo3UX9Us91PPuYxLoMCXI95NEZ07wm0hikY=;
	b=Zr/JJfoD1OBAhj8YxglxfjiSZoOwl++rKOA43HZAKxqDtdEUPhJ+wln0wBc64jQAsCWOAE
	ne4GYXB5u91/lfyIfi083ZFk8vCsnbW4TBhNNem2akFWdw9yIE98OY8cGxjO2iDoRI0+oA
	gzPkQsRUyl4FUn3WkABahVccyTTNmAc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-FpywrX7YPAKZlh1nPSE9_w-1; Wed, 18 Jun 2025 13:40:31 -0400
X-MC-Unique: FpywrX7YPAKZlh1nPSE9_w-1
X-Mimecast-MFC-AGG-ID: FpywrX7YPAKZlh1nPSE9_w_1750268430
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f8fd1856so3532243f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268430; x=1750873230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkYbA0acVo3UX9Us91PPuYxLoMCXI95NEZ07wm0hikY=;
        b=FNGV1XXh98zc+OX/ArEDpK4MOSowJhYexwef5yWGmO9vfnrHsuAZ6M0iEpuPjb5T03
         L2ZfwOeViy/kqumPPXepTlAIMOx2IVIZ93wLU7iSsOy0nsgxDAfzCSah9YcMdSl8jlcX
         IVU6YlTuQOOPmXnZ+3W4gvHUSYAll/7FcRRwB0prHBnRXiWJAEjPuaW0o5xvavcxwnbg
         R8LwM8d9Fo+Gj6t7B5cY5q5FAvrup3hGt6mG8YMtQ8OdQrFlZYDtM860GsyTDLkL9Tu2
         4rNhBOuzhB32QnKW4CC9ABqPIva09RLu4ysDfI+Ni/l9pjqDtHWdeV3gWo9vXV71cg+F
         Fqjg==
X-Forwarded-Encrypted: i=1; AJvYcCVOX6yP+w/Z/Zo0KgWrtF6tooeBuP3QnkYJ1v/qOkwkUNAFXT/Rh+ZYHGcf/1gq6Gt8/Mwl8YQ0Sq4slAw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyVzvbW/iRgF8u00+dSkvIg4cHkqEw0XSFktyEyJKA0sffbx5DQ
	14JZrSgLIAPzHJMUay9Y8jd9lcC4JTDJ3KmSjBDlGl3Aam1VkPosY3jnAsPzScHU7Awn7C0yhzh
	Rv7svoLeZbax8hAmsJCVNovjQkamxIwbTyByj3A6mVXI1z7WlRua/EK+VHlVPbYYjmRs=
X-Gm-Gg: ASbGnctmFt0bqAwcgVDlllMdPFyCs0AtVbFEfn0/UwtQweM1WTggS1+loV8M0LNrClM
	eqZanMw+bBXPgsR+kCpsqfc/22nyak5vvXgWRuuhuVCLPMpD+JsgoL2QgJgSQeUs/8CVxJybvEL
	1G6cFAG+8aFe4W3DoMxKcQ6KbcjnfPKcTmgSFkIVVRHkyiJ0AkUUGSq8rZGAO9yR8nW7CrsdfFi
	szrCzE973yCPUWpCqDFx1y0iBMB7AjUBqb+q7V1QDLdhxN/Z51JpFg+hdha9w2mU2zqTu0DXKrA
	S9sjvRMfCbABUBLx8O9JvfmaGxwLl1ZX1pwVdq4flouVF2+iz59NZGE+tTVI7IeWbotm9SVQbd4
	fJXm9Mw==
X-Received: by 2002:a05:6000:71c:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3a572367972mr13745226f8f.1.1750268430454;
        Wed, 18 Jun 2025 10:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzzxL/ng01qs/lSRwaNlZPiY9y2+iVmfz3gXJp3VGo7LunL2znQ2yg0q95yDx7nL6kngLoWg==
X-Received: by 2002:a05:6000:71c:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3a572367972mr13745179f8f.1.1750268430076;
        Wed, 18 Jun 2025 10:40:30 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b62ba7sm17864640f8f.91.2025.06.18.10.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:29 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH RFC 05/29] mm/balloon_compaction: make PageOffline sticky
Date: Wed, 18 Jun 2025 19:39:48 +0200
Message-ID: <20250618174014.1168640-6-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618174014.1168640-1-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YVrVTPWc230Gp63LU__oddpqWpVu82vRGlHKU1VYAKA_1750268430
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let the buddy handle clearing the type.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index b9f19da37b089..bfc6e50bd004b 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -140,7 +140,7 @@ static inline void balloon_page_finalize(struct page *page)
 		__ClearPageMovable(page);
 		set_page_private(page, 0);
 	}
-	__ClearPageOffline(page);
+	/* PageOffline is sticky until the page is freed to the buddy. */
 }
 
 /*
-- 
2.49.0


