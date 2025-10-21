Return-Path: <linuxppc-dev+bounces-13087-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68127BF5AF9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 12:06:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crScY0Q6Zz30D3;
	Tue, 21 Oct 2025 21:06:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761041180;
	cv=none; b=aJgTURX0SDkLtjmwpTsuSR2dTSHD6+DD978vDMBTJGUu3RzZ5dop06t7y6ArxWxXbsxmsBu5an8aybMTJ8ILQiPfw8JIvFoadUY6miR1FLFYt1Fz/p/amy8/h+lHkrqNDnnpH4xCv2MVWmkq6dlFhfd063acLvw9I8yI2Glptk5m24EinJS14iDBL3c3MXXQb4/1PUDwmZcFzAcskD/kT6eAea0Eg7bD3NVWuBOxEN6ko9LUAlU2KCdFCb4ZRG3aaiP9AJM0WDiGQUc1om9lkVfeBVD6S0UKGJFL/Yfl+DYoSGd+gSY55U5DSaGtR/EF7gPI4+l1yhQX7pH+nOxs3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761041180; c=relaxed/relaxed;
	bh=/5MqLTGooWfwQQt8bVLn3RBEegrtdNGSt5bbFt4WvjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=l3I0688r+PzgI1le1ohS4CXkAfnh2b1dDKzW15TnkkLqpb3ig8QYz5noFSAe6xUEyB+PIUy2QIy3AH0OrfbIsNKV7m1mS853ZAX6B4iUVCeur7HKL+r8yQunL+F9xtx5MDS/nHQVi4X45TYA2ajWnKDg9Tz6CdYAj2NIzsYMxwr+/9+nPURcRbKS+N4IzrF5OPg0iEhKPdqIafvYz4Bax0Zl6Mg+wJ60nXSFlBgjTWtg2ENc4hXX1fzYQ4ZRmTH05vlTf//IsyCKT0SGZ8k3I9W1lDmJoFQHvubaE5ztzOEbI6GpGLOGbagfU2mKdzyQdT/nHCzlYwg3ZaDPYE+n2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T5V41uSV; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NBpuNzea; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T5V41uSV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NBpuNzea;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crScW2Xtqz2yFq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 21:06:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761041172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/5MqLTGooWfwQQt8bVLn3RBEegrtdNGSt5bbFt4WvjM=;
	b=T5V41uSVUjCNM5NfdiTeDLnSkUHL4YNRE3Kd93WMpdVQmBQk3VsWdbQ/bd6VdzvwfyxqeE
	coiwI4MMgEDcR8xXaSfvG88GlEladG4A4R2iOpuwa4rjlOu+wUyXt7ZP79JKP1PinoCfXr
	jqBm4bWz5PZyn/jEe7d0B2agHLX3mrA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761041173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/5MqLTGooWfwQQt8bVLn3RBEegrtdNGSt5bbFt4WvjM=;
	b=NBpuNzeaHvBxKpARhmCvj5XjrBuzuUfbquoHZmxzmrs+/re6u10wa51UquV3WNPmL0pRMy
	3ZmXpwxudOzDWEblqOaEBASZ2HzyTlccq862Y9+voUqs4ifFF5osswDlE+c2KI4zGhzhtp
	9LMznDR/eedBphjyRD2O+nLdhsaaNZw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-p-Z0QnmfOz6txgJ2F0DWIw-1; Tue, 21 Oct 2025 06:06:11 -0400
X-MC-Unique: p-Z0QnmfOz6txgJ2F0DWIw-1
X-Mimecast-MFC-AGG-ID: p-Z0QnmfOz6txgJ2F0DWIw_1761041170
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-426d3ee72f5so3874200f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 03:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761041170; x=1761645970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5MqLTGooWfwQQt8bVLn3RBEegrtdNGSt5bbFt4WvjM=;
        b=ErPo0LjqwHHngg1+g2I0e8rOxXVmGo/K6UqZz1VwYGAOLS3PFjJfv76usFcPFbSEgM
         XZ1A0BpNq9HHA0QHAZx+Z9qy4p4JE/t8glDsYKaXsIrnjz3lLx9DS5sicoHzYziuEgzi
         wmr4Z+gD94oqk9DeX86wlqJHkKU7/KAQw5yBIsf0R++DZsbRz2KRSxYgbYFqYrIqK5At
         XcHW+LkNS2fE4JVkt/r0SyQXcGEjjznFPx7uPmaXLR5iMeaiKskiIO+5ipJPZuAZm3uL
         iblBsHj76F2VlRzuBuL6kxAH2n8IoLVUXHs5LWEmElEEVjin/ZRTcuvbFi0+Aqejd/Bk
         W6/A==
X-Forwarded-Encrypted: i=1; AJvYcCW/i9MBQPV+Z1ZmKlxmVXLoiXa5gyfxEvxEu3FXRQCQmjsxs1sr1eleG8F5EQNd/f4dK1YwmzISkDzLtp4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyuJytcAFtp/z97mrFgf0Y8sGNvPwLywZgNcpk0OQRcR9o2dqaE
	DrEC/wJfxykBjpo4EG1Si0MEh0+eKI9tJCbNwgETPzTdyubLVYOJaR+OTZv+8OoU6skQVWG6jjC
	T4vhTZm8SN9Yo8Sw2DkC2iQMEA7jAxaC2Sshycu9xMqf0MlD5hmvLHzMWqMkb5bglRjo=
X-Gm-Gg: ASbGncsz86iwe9Lc1ijtVKKlTO39mC4F27r306m266nvbbvNQti+IpkVLMNNcCRj70g
	LSbb60mQhatWMoXLMyY1ReHit54eY0TeK1wQoeOOMPK8DPZ4+sZIRo5Ypaj6Jr4w5b/oxMRcERU
	9NO65vLyIod9Q9N2ZQdfSzs/WQjW0fBl27rs1RgXlZSRToAqBKcUx4Ar3O3D8pLb7IlMo24dboQ
	SGgiI4nFbYgD91yKlnFxNebGDeoMwI3PaaAQwxiPSb1gh5n336UI4VVLpzrLB9FAX73dm4l3wES
	/E76Y16tPQWu29GnESkuGm+FDBRHVoc660qkEL8kakcIvb0FlMr/qMWz1CaA/L56InQE9MtzDiB
	4WJJ6RyOkWM8ZgFNw7cVTVhQiiv9hGSTWzOxpvz9VJwlb/s82cZxA+dRR0gNv
X-Received: by 2002:a05:6000:4b08:b0:427:526:16a3 with SMTP id ffacd0b85a97d-4270526183emr13034327f8f.29.1761041170162;
        Tue, 21 Oct 2025 03:06:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdWAfWri+zwLuauv8PrjZF1aMCEwE+dY3BrO7HzQ43FnWYZr7+OQSBPRdaLGioAsiSvfA5Zg==
X-Received: by 2002:a05:6000:4b08:b0:427:526:16a3 with SMTP id ffacd0b85a97d-4270526183emr13034300f8f.29.1761041169744;
        Tue, 21 Oct 2025 03:06:09 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5a1505sm19854508f8f.8.2025.10.21.03.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 03:06:09 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	stable@vger.kernel.org
Subject: [PATCH v1 1/2] powerpc/pseries/cmm: call balloon_devinfo_init() also without CONFIG_BALLOON_COMPACTION
Date: Tue, 21 Oct 2025 12:06:05 +0200
Message-ID: <20251021100606.148294-2-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021100606.148294-1-david@redhat.com>
References: <20251021100606.148294-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 4GzIo9WNi2WaUANVCc00ZTVJubZ-JWEEK8a8DFDWEG8_1761041170
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

We always have to initialize the balloon_dev_info, even when compaction
is not configured in: otherwise the containing list and the lock are
left uninitialized.

Likely not many such configs exist in practice, but let's CC stable to
be sure.

This was found by code inspection.

Fixes: fe030c9b85e6 ("powerpc/pseries/cmm: Implement balloon compaction")
Cc: <stable@vger.kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/pseries/cmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 0823fa2da1516..688f5fa1c7245 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -550,7 +550,6 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
 
 static void cmm_balloon_compaction_init(void)
 {
-	balloon_devinfo_init(&b_dev_info);
 	b_dev_info.migratepage = cmm_migratepage;
 }
 #else /* CONFIG_BALLOON_COMPACTION */
@@ -572,6 +571,7 @@ static int cmm_init(void)
 	if (!firmware_has_feature(FW_FEATURE_CMO) && !simulate)
 		return -EOPNOTSUPP;
 
+	balloon_devinfo_init(&b_dev_info);
 	cmm_balloon_compaction_init();
 
 	rc = register_oom_notifier(&cmm_oom_nb);
-- 
2.51.0


