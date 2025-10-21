Return-Path: <linuxppc-dev+bounces-13114-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3030BF7393
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 17:01:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crb8d21Mrz3dBZ;
	Wed, 22 Oct 2025 02:01:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761058865;
	cv=none; b=HR/cUd69jKC7632v9X3BiTY8wXPqJ2VQqEEkAgyHOC4cAq1mocsAl6bhKNFjZH40rBqZDoqmGBTf/rvu6gJAeuN0S0iK9zvb4BzoAxjfpuBf6A1bnIHD4rNIr6+OnDAJ46mKtlOsNibj1eCeBvuAnqiz/s2YwwTkO7VixLDbZPC89G5D9C5aGQ4mvcIrigVX3pbGveJDG8Z1FCQSW9v1Ec7BXgtMD/lTRoD5eUy9F3+AjNL3uXA3ZXoZqLXvlCtnsgdm4Je54bcgB1q/8ewnIGtNW1GCtNvbwHY7yLOZL0w26TfFlk69IQtc2oFOv+ZGJPchw+7U9Xin5XIXW588IA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761058865; c=relaxed/relaxed;
	bh=lRubUKoIKZa05nEVw7UJ7l9fUFkh873Slwn5354MkBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=hIUzIkdUZXQXqtsTV6YTKQeiqRVX3bOWiizaBwby4nk9DnouP5PhY3yz0hTuklIP14UXkVxEv/5/XcLT2crF1AKuCgfXwidZ4TzSRXJ7xqZAWiGa6F4LagXOl3zh78atm2KfJWNLYuFdTC59rcYqGEixgyY+eCjc5FVUqPsySA4CH6lwnY7eVMCiP10a1Mtcb5V7YpHtf17rlamvqc8YF1oZCuSe8dCemU8D0TRtYNVRhM4LUCj1nt4n/L/N32E3jdNIwv4o7p1+m2hgN8uAPEiXosvcgXFsTETzRSKJ2fWDVtV1JlC5BiBiLbq7wx/7VxWRun/6BaFLnOWNabGWpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CTWVRKgd; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GvkPHv95; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CTWVRKgd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GvkPHv95;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crb8b69TYz3cZh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 02:01:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lRubUKoIKZa05nEVw7UJ7l9fUFkh873Slwn5354MkBU=;
	b=CTWVRKgdtlEUmEaXoaSO9zkAUZ3tEd8NzCAYy09BVjymoqXCglke1u+KXp9ry/TdQX+a7V
	A8r6evZE81V56oayjuN+YibKUCIt21AfOIjsrrAezrcF/tQbACIKHAjezgqJrIk622LZ+t
	ohQ7Rg/Fn4Y2wQuX23syoM2c6+GUT9A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lRubUKoIKZa05nEVw7UJ7l9fUFkh873Slwn5354MkBU=;
	b=GvkPHv95sT7hHJJC1zvMnpcuBfgw+pimEzXSakWKqs4Qv+B/4zdiejnyh5urDJKftUv0eb
	bJpFk4A9kqNBiBTg6JYZZfWm1Eil94Ddw5Pi2xmWFI9QTpapbPDB1Hzw1TQwooN1c0NcIe
	tbN7XG7HsHQZGMNaCNOadg0l0tAqI/w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-_jBPFjYFNfaCGeenwU6BFg-1; Tue, 21 Oct 2025 11:00:58 -0400
X-MC-Unique: _jBPFjYFNfaCGeenwU6BFg-1
X-Mimecast-MFC-AGG-ID: _jBPFjYFNfaCGeenwU6BFg_1761058857
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4270848ceffso5759681f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 08:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058857; x=1761663657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRubUKoIKZa05nEVw7UJ7l9fUFkh873Slwn5354MkBU=;
        b=SdudAQaVNbzotDA1vhi0AGYTal6wBdXTxeLqSQsVFDnPsHXbO4sKlOOBxIQebemTnP
         1d4Hu5GB1PvjCYJmYo1YUvwP2C39HIOWl0CNxkHD/mAoHT57vyReui798CgmgednsRRe
         TL7D4mEm9ec72DDVzy7W5bgHTvX2U9/e5Meybkwrf6eob19LJqjpYLw3gs1RKOOEQSpn
         19OT9NhDYFT/aP9cl2no0WtdiRXh5A5FsGPNr9hIh60xnBdXS280dlRAuWKmw838LBve
         WBLupmdUHhoCZnfWVnAEPNtbZ3U7S5wbTvYVLGfH0EmhC64pqYCrhPdY4Jrx7Dm49h5U
         P21g==
X-Forwarded-Encrypted: i=1; AJvYcCXWHJiQ2dgKF6kiepfXpvk/4MGNW66N33UrffI16fuL7BIREEPy4B+VViQa/J6rmR+HnP5HWwt0AFGBREM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxNYDMWEOViyAPzkGmqG99J0JJv34/vkiDOeFAUdwykF61ZGpTS
	15AEvF7VvPvXISqUZBeHUzGxSD02ESbiLiPbAsluJvPtJcsyaFfMxIwSVcl5HJu2W8BkWpOBlll
	ELAiwJ4wMFx76XSZWUJeGkMppy9fh+utmnT2/PxKQ1mvivmBHXoOcIR6spx7RK/SMeQ0=
X-Gm-Gg: ASbGncvipTn/aAG9YnSlz8NbMIwuARadgvIFEbFTRXCm+KWfeEpNAnxxguUjr6DH/Sv
	B1UyNGdQKoauFGodeTS7kpD1goq1+j7cUzjoFL2yM2d1LPd0PEHoez8boBQq6SZautoagEYbG+f
	couafykL3s4G6b4m5DG3OVCFJ2tf3WUFTn+xmzmBTx8lCywE5LGAS49jBe1iSS5qYHPYnyCghXX
	le2LIDcRJRCVT47EXaSpUlcv4EH1rjIihjUbVxOh6lIYr0/P19Zz4YGLISswh67PANWbots9Btp
	uYUoZcNvZSJYw1G1+w5qCi076TRTowhbBZZPOfZ9qII18MJ/N9zkEE1WlzMwWYXeMmYX0jIIW7m
	017pvrDNtlEdOm+t59Fde1FqJUjoh+oECda9hevjMBHQ2/CargmsGOPdQhsja
X-Received: by 2002:a5d:5d05:0:b0:427:809:eff5 with SMTP id ffacd0b85a97d-4270809f252mr11795580f8f.53.1761058857364;
        Tue, 21 Oct 2025 08:00:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuNdQq7IEo7xmxPaMqWMcC8QeroaNoRnXCBpBegLE0FB0KNfhJhInOomIlaVikmeTIuzyODg==
X-Received: by 2002:a5d:5d05:0:b0:427:809:eff5 with SMTP id ffacd0b85a97d-4270809f252mr11795534f8f.53.1761058856848;
        Tue, 21 Oct 2025 08:00:56 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f009a78csm20793541f8f.26.2025.10.21.08.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:00:56 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
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
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v1 23/23] MAINTAINERS: move memory balloon infrastructure to "MEMORY MANAGEMENT - BALLOON"
Date: Tue, 21 Oct 2025 17:00:40 +0200
Message-ID: <20251021150040.498160-7-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021150040.498160-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021150040.498160-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: nFMrYb5zSPI8jqUVFmMCJHzJx-zmiJQNdlBgV8l4M3c_1761058857
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Nowadays, there is nothing virtio-balloon special anymore about these
files, the basic infrastructure is used by multiple memory balloon
drivers.

For now we'll route it through Andrew's tree, maybe in some future it
makes sense to route this through a separate tree.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 MAINTAINERS | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 878e53d0f65ed..17fbf5c1ea2fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16225,6 +16225,16 @@ T:	quilt git://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new
 F:	mm/
 F:	tools/mm/
 
+MEMORY MANAGEMENT - BALLOON
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	David Hildenbrand <david@redhat.com>
+L:	linux-mm@kvack.org
+S:	Maintained
+W:	http://www.linux-mm.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	include/linux/balloon.h
+F:	mm/balloon.c
+
 MEMORY MANAGEMENT - CORE
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	David Hildenbrand <david@redhat.com>
@@ -27062,9 +27072,7 @@ M:	David Hildenbrand <david@redhat.com>
 L:	virtualization@lists.linux.dev
 S:	Maintained
 F:	drivers/virtio/virtio_balloon.c
-F:	include/linux/balloon.h
 F:	include/uapi/linux/virtio_balloon.h
-F:	mm/balloon.c
 
 VIRTIO BLOCK AND SCSI DRIVERS
 M:	"Michael S. Tsirkin" <mst@redhat.com>
-- 
2.51.0


