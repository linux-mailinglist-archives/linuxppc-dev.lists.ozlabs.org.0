Return-Path: <linuxppc-dev+bounces-11689-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A47FAB42948
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 21:00:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHBkF57ZRz3bk1;
	Thu,  4 Sep 2025 04:59:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::532"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756925989;
	cv=none; b=HHt3PhPyYrZGYon8oWYlNioIyMITGN6gUVsh1gy45dB5OKngfbJS6xLiOokiRTKw13ScUZjn0XIqLPYKOL+h1yq1MAYf57AjVTg60iGurCIoufSLQMWLDBNkSueTIFSSaMmGFZE/YHcMnHCtlLx5pynl5BZyfCxDAG88aAn327rbvNTDwB/PdBXG1/Op1ExiJu5IkEQrGzj4TNsIPLqX4odUI3DCqjUyMlcqkF/RCyAf7ReUwjEcJM/9wEAxRd/SG/GN5zZoz5Hs8rTZ32PfESuk1D3X0zpEPEkG2ZnN/W1IkgUd0gRs9bpIC8kb9YZ7bNxczpHILqfoPIF3WFShgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756925989; c=relaxed/relaxed;
	bh=4xP13CUGWmP4Epf7561SmRsYIMeFmCIW416h7MJfMP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P77CCuoCuFxVRklYG3buTuXy6Oj1Q9AHb4sVEoRbw97Lamb7gWoKCMMjUBOi/BEF/zPPMyqqkn9ZdFpRTTENQzz52+B9Zsl/ncMlQ4InV187PbSTusR4NzcJj1oQgrdIxOuaoTwzZ2FOpxcyW/Vw0+UkGhITKAOoOAbw7x9cari8zv2dTqez8GYemGS3b9JS9xd2BT7x80iN0hrjv53X5NQyZb5eEoD5lDwqGBVAhdLMFvRxVE5h88pCbSi7ZhD59s7kQpN0YHj3w0u+sb3wvF+wug/KL2OU642D4b8tAjtb3b+Pbiw4YF4i1L3OJ0nOr6YzsMmvq0GASIpBFMuW7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YT3DIUBq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YT3DIUBq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHBkF0hDsz30WF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 04:59:48 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b49cf21320aso162836a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Sep 2025 11:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756925987; x=1757530787; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xP13CUGWmP4Epf7561SmRsYIMeFmCIW416h7MJfMP4=;
        b=YT3DIUBqm2GCkMOes9QD3SpNZWUIJg0/Nz/lPpmTo6EtwPEbuAviTVLzTxObNiivZs
         zZ+KbmCiIsRX+0Dgp019FwG/UoloQFeAimLj5I9SwH0o7ytqPN8GRpF2+Ula2fAeFTaY
         GUfPQsfPDqebUPsOMGThf6cSZBHsPVq52xCqPvM1ErhcIAn3DUoxXAZRGyRQ4gCeRa87
         eXBMSeMfHl0YI2Ko6koT3dtySZTe/0WpZ6QFOD1gmlRM0wOP+Wp80sRnEW+rAf0WEzH7
         kNftAA9y64W2kYb3uVookFW20xNesiisuTXK4YDlECiuJBHsNJ9+EXWLmCkc2CWgSe08
         M7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925987; x=1757530787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xP13CUGWmP4Epf7561SmRsYIMeFmCIW416h7MJfMP4=;
        b=r/Wba/YpkTnaGpLpThF20NVnQ7fPH4dFO8qYc+03qphkqMGJoWlh9A6cR31VEX80rD
         W1fLP34hZQisce8x7RmTW2deIc1OIz22SGlGSKBCJdwRbNTJ9URk3m2W4MuKlHUjc5sz
         NcrpdbLlzYOG/9qcK5RTGZp96nhkYEtu+xNRNlawoGZS3tr6fWWzucGhmzEn5dABKEOh
         voD3beZDz3c65OkAN3R4vJwnWGH7QXCUK1EVF/ZBMMs1woSvMC98rzcdKjYX+vDDmATz
         hxctW+PxxdYSmnDbVMuioI+MpkK/KulDnIL9CCg+qEr/Ba9rLYlGb8ZPK0GWQONPWgUS
         u5fw==
X-Forwarded-Encrypted: i=1; AJvYcCUgDBhiEyqxC1b0mVepaH0Y14Gd6uLDiq0W4+OQt/j86/Ukr3kIjo75lpNILPNfagSB5UYv08xAbI85P1E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzDJRjYqJfqiqvOPH5Qrsi/RpoWgc36ovhSSVTNc4iSYFHSVLfc
	uWHl2oV7GPbzJ6pgd0nyLCzzFAlArpiASGoLqFsGWbuv6rhGZrixvHgg
X-Gm-Gg: ASbGncuqtJuXcXivoWlS5E8GSTAA5+VaXDmMjhMjYqP1XPaHmOgZce/xWkCuc57Nhc7
	b2xZ5/IhRPgZMhBAFnfYD1v4ML/XD0GM8OuaATEH+ps2Rn3wDNBUGGZS/t2Irre7WNiqhvwsA0C
	8xLX0t8GXQLAxRRL3FCvrJ46P3fdHORcyBpze17aPl4p7a4+W2vQmmQ2QxIqvlJVBYcKJ/hgnAe
	g66HEJI0284/GFPYR5zodqIMQrKxFfFYBXLgAOPSZMmpBu0pC/dVo+W5dUrL3uOmqCaINHwUhtj
	hAASvVWwlvxersLuktP64VileB46kTU6ENsGqyWdVH/hQeZWMNwL3b5eu6enGHMFOQO/R8WkDgr
	J2hISBqQ9D8BfdzUhDHj+5O/DvicBQ30N7SlH+5/OyPyr65AxyZDm/bTjBaBoHqbD
X-Google-Smtp-Source: AGHT+IGWl2NVhEd4Mf3PXgbO9PNmoIZrvx3puV/+d96WnhVgMh+tacbQQZaHLdVwJGJAzq5ejH+5QQ==
X-Received: by 2002:a17:902:e5d0:b0:24b:1766:cc70 with SMTP id d9443c01a7336-24b1766d2d6mr89341175ad.39.1756925986861;
        Wed, 03 Sep 2025 11:59:46 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249065ab343sm169403475ad.126.2025.09.03.11.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:59:46 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	virtualization@lists.linux.dev,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v3 7/7] virtio_balloon: Stop calling page_address() in free_pages()
Date: Wed,  3 Sep 2025 11:59:21 -0700
Message-ID: <20250903185921.1785167-8-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903185921.1785167-1-vishal.moola@gmail.com>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

free_pages() should be used when we only have a virtual address. We
should call __free_pages() directly on our page instead.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 drivers/virtio/virtio_balloon.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index eae65136cdfb..7f3fd72678eb 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -488,8 +488,7 @@ static unsigned long return_free_pages_to_mm(struct virtio_balloon *vb,
 		page = balloon_page_pop(&vb->free_page_list);
 		if (!page)
 			break;
-		free_pages((unsigned long)page_address(page),
-			   VIRTIO_BALLOON_HINT_BLOCK_ORDER);
+		__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
 	}
 	vb->num_free_page_blocks -= num_returned;
 	spin_unlock_irq(&vb->free_page_list_lock);
@@ -719,8 +718,7 @@ static int get_free_page_and_send(struct virtio_balloon *vb)
 	if (vq->num_free > 1) {
 		err = virtqueue_add_inbuf(vq, &sg, 1, p, GFP_KERNEL);
 		if (unlikely(err)) {
-			free_pages((unsigned long)p,
-				   VIRTIO_BALLOON_HINT_BLOCK_ORDER);
+			__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
 			return err;
 		}
 		virtqueue_kick(vq);
@@ -733,7 +731,7 @@ static int get_free_page_and_send(struct virtio_balloon *vb)
 		 * The vq has no available entry to add this page block, so
 		 * just free it.
 		 */
-		free_pages((unsigned long)p, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
+		__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
 	}
 
 	return 0;
-- 
2.51.0


