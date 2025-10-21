Return-Path: <linuxppc-dev+bounces-13104-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DDCBF69EE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 15:01:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crXTB5hkHz3dWb;
	Wed, 22 Oct 2025 00:00:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761051614;
	cv=none; b=mNU/exG8dRdxmcleffwlcgM5FMSUulBMkTFLFVqjcfi21vGKIjBEURcOuDKtNB2UkAW8M5Z7d/xODrAcPdTV/fyO7ERJoVtJVuUofnMkJZ8rPDC97RVQol2FOlPOxmAO8aU97aYHrDZ8acbTJJ10WXgA3jwnGIsYni5WHThYTjVnwbbwJ7DgSrDutDwRxSBLWkG+jPftyn49HmW4JCoxR4Qjn10vy1S5FBP42+Loecf78JcQfGLkk4wvA71yNtriLOgfrhlWoGjs3MBRQzrVQ8KotrFSzlgLLXd3PyMnJ4YQWUuz8R45ZaFPmQigVTL9oG1wZF/4ZbEwq+fsnQ1ThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761051614; c=relaxed/relaxed;
	bh=9Pfle03AoZbMZzwKNT9cqn8RCz4Fl59OlkWq00/g7dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=a3z23snlq+x9ujhgqSr8wT/0JGvp70NAg0wjHRZGCoJo7JZt+0UXizKuzdHJw3clLyDMsJBEHdor8q3N760tcgM/UvUo0Y9nN5Z21ugPkM0oQMbN6mHM6JbqK4D26AUeABHY00cbxPqPEQ5JEld5dUFWe2htvnHbG1UXQfLFQQX7V0gcSC2asSgt1JkMUAR9mBaWJ9FB2Jm7BO60ITK5uioMiU/s0s6zoqnRzHSxaScCK3OMeUHN7Bq6naphvvrLbDeiYr1K9G7nP9HKkDdj1WLznJf1lluV3FR+DKkIVVcbg6shqi1UA+Qm0yOTbRdzEPacoKSwAWBcfI1HgU8xAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XNH737iv; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XNH737iv; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XNH737iv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XNH737iv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crXTB0X0lz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 00:00:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Pfle03AoZbMZzwKNT9cqn8RCz4Fl59OlkWq00/g7dM=;
	b=XNH737ivJLyY279nXf6078U0LCKbbnePWbY5JXKXJAb0iHQIVrxbCp/xgD2zUF6jvNzpQD
	OkDYtkf1lj5pJTNyMN0cTByIBDgAPWroAS2c3D6jiwUpPn+pI6SKGuAc8B7FNk+lzYj1aM
	MU13+um8JMKPnDpFrxJM2EvtgzTppAc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Pfle03AoZbMZzwKNT9cqn8RCz4Fl59OlkWq00/g7dM=;
	b=XNH737ivJLyY279nXf6078U0LCKbbnePWbY5JXKXJAb0iHQIVrxbCp/xgD2zUF6jvNzpQD
	OkDYtkf1lj5pJTNyMN0cTByIBDgAPWroAS2c3D6jiwUpPn+pI6SKGuAc8B7FNk+lzYj1aM
	MU13+um8JMKPnDpFrxJM2EvtgzTppAc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-iPHVdeFePoWynHqc8dB-QA-1; Tue, 21 Oct 2025 09:00:10 -0400
X-MC-Unique: iPHVdeFePoWynHqc8dB-QA-1
X-Mimecast-MFC-AGG-ID: iPHVdeFePoWynHqc8dB-QA_1761051609
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4721b4f3afbso14059745e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 06:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051609; x=1761656409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Pfle03AoZbMZzwKNT9cqn8RCz4Fl59OlkWq00/g7dM=;
        b=omoqaZqL6goSg88Lxen8nHUvscG1I/Vt/Ll1muRTPSOKJB5OMV1ORGlpk0UcQ8TSyT
         z6SeNxbkW8QL52nLf7zmBbTFUBGucXsPswEAr/tzOMLw7FCpnSxmrL5aSWPNhDPPgalz
         JZyjSVl5at6B48KyT0o9CHan1z3lCYpg3TkykYMo0llUzFaFJ0Vvn0N2X/fHS+KSu0EK
         UynSI6gLhX1uGzCiAo2bJ1Rg5pXJIPMZjWQ3J/f+3KcFspZjwZ6ogiuTYwQ+u5o/xywz
         HhLfPvdwT6OZO2ieh7K3xwoAR97YRXqCURiQFix3NrI4VNqv67NRvI4pJyDLpoECFW1M
         hN7g==
X-Forwarded-Encrypted: i=1; AJvYcCUc4ku2koujEVwE3LxPCSa4XwYIlKdPqBO+eNGA0LIWKyfuP6NSYw3YjRaU5RAI+2IOj4qDzqccIrn8T4M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwbiDJFAvN9tBFRjalAhJP7c7N6Q6ihkyXb1Md/8yNirqk9YXT2
	1ftxsH1RHNxJz/nHa+2eZkuZ5zUBfgpt1tQFd9XNKNhyxzNLcOcm0cl7Z2RhbuYQ00KoA/fwfZK
	PgI+cqkweS1PC1dXZ1oIfn8jBdxigg5YKopzciyQsmc63EdDFMI6T41Lw2uyHhkId0r4=
X-Gm-Gg: ASbGncsskgfrLeIG+W7Gq54JA4jRoXBZ1ERBsYsVNTHXzSwxdicP+p/zwUBHbrPMnPG
	h08AtCFkHYOqumZ0FNPm69SFZH1okG/hwQlhcsI82sWwqKDGaN284XpfXPASlUrTEnrw7IXe02E
	iH6u1IroP42aV2mtrhOK0OcWoA8qhmm7vKmf9XaJsQDTox8On7joyqbsVkKDX7OKT+iPa+ScqLU
	wxDSe5c4O6TKV71mmZ192LtcC+ENrXa1Qw8A4uELlIPmZKqJTnok78nK+jzqYeWAkRQ+qimwXo7
	7TNM3TdJe9WfHs2l5Q/ajwKuCBQR3FNSTwuWJpOP/tWbX5XQgeK+aEJkslroc9VZu2uSIxpaBfo
	MKiCPXAjE1K2yOKU5b6EHRS/cphcgCDKbyVS5k0qTIvrlC83wGkjItkPUGLRU
X-Received: by 2002:a05:600c:3544:b0:471:c72:c80b with SMTP id 5b1f17b1804b1-471178ad7b3mr117596205e9.18.1761051608652;
        Tue, 21 Oct 2025 06:00:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYkNMmF6KwTjIi+haTZNa/bZuoGNP9fBOncPRUCNa1fBr3A4oaQbG8grM5Ui4vLJ4xvDadAQ==
X-Received: by 2002:a05:600c:3544:b0:471:c72:c80b with SMTP id 5b1f17b1804b1-471178ad7b3mr117595585e9.18.1761051608200;
        Tue, 21 Oct 2025 06:00:08 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471143663afsm278506055e9.0.2025.10.21.06.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:00:07 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v1 16/23] mm/balloon_compaction: mark remaining functions for having proper kerneldoc
Date: Tue, 21 Oct 2025 14:59:21 +0200
Message-ID: <20251021125929.377194-17-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021125929.377194-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: X5sJW0RZSGoYdSm0EC4gn1i0NjqTmGAWkNwPoKfHJPc_1761051609
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Looks like all we are missing for proper kerneldoc is another "*".

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/balloon_compaction.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index f6e0582bd7ffe..f41e4a179a431 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -22,7 +22,7 @@ static inline struct balloon_dev_info *balloon_page_device(struct page *page)
 	return (struct balloon_dev_info *)page_private(page);
 }
 
-/*
+/**
  * balloon_page_insert - insert a page into the balloon's page list and make
  *			 the page->private assignment accordingly.
  * @balloon : pointer to balloon device
@@ -42,7 +42,7 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 	list_add(&page->lru, &balloon->pages);
 }
 
-/*
+/**
  * balloon_page_finalize - prepare a balloon page that was removed from the
  *			   balloon list for release to the page allocator
  * @page: page to be released to the page allocator
@@ -140,7 +140,7 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 }
 EXPORT_SYMBOL_GPL(balloon_page_list_dequeue);
 
-/*
+/**
  * balloon_page_alloc - allocates a new page for insertion into the balloon
  *			page list.
  *
@@ -163,7 +163,7 @@ struct page *balloon_page_alloc(void)
 }
 EXPORT_SYMBOL_GPL(balloon_page_alloc);
 
-/*
+/**
  * balloon_page_enqueue - inserts a new page into the balloon page list.
  *
  * @b_dev_info: balloon device descriptor where we will insert a new page
@@ -186,7 +186,7 @@ void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
 }
 EXPORT_SYMBOL_GPL(balloon_page_enqueue);
 
-/*
+/**
  * balloon_page_dequeue - removes a page from balloon's page list and returns
  *			  its address to allow the driver to release the page.
  * @b_dev_info: balloon device descriptor where we will grab a page from.
-- 
2.51.0


