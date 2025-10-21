Return-Path: <linuxppc-dev+bounces-13088-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A28CBF5AFE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 12:06:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crScY1vY9z30Pl;
	Tue, 21 Oct 2025 21:06:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761041181;
	cv=none; b=EKnGFMN/kLk59bmOMb+n1KXz2TU3qPbYDbx5h+unbnnGugC9KhsXpow99/IGcy+Tahrg71Npr2wYd7FB1g6heEXSuxB+ZsxTQngMcUFrw4BXjBKWGre4B/4oT6OU+Fti4zmiwP6yk1Rbs6xgQoIQFxLd9Pw48hmMXZQt+86QhTvKGTwPDXTEhRn4BTXp8ObBk3c8GKGplKg0hBXncQSqiMIUGLSj1AVl7dSQTXZSY0/HvnYDhhc5eQt3zOn4/qUc0CmpL31SoWS4EykGOX4GcJ9khd68PIMN2A21Xx9Hbqvj+4jaHLTmH25mwBN00QZUosXMzQOKxDozJX2kKLyNRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761041181; c=relaxed/relaxed;
	bh=AcIk1u1LFpf3b4C6lDAgUzkv/HVOGHxfz0isd+tTMcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=LcnRUtCVluLK7LSULcDZDjS5AXUCRgy2uLiC7z74zrlBUq+Fw92HzlKgEwB6Av/LzEazhCHCvcAcjs28WZsLplUrOtOBbaVtbwbuhFgbL+fa+hHQsa5fxamLN8MhVx1dHsOXgmaOTn4p7jqm+vdH4dURt0nR7rBdD7mJBmJH2dBfW7KplqewxuNa8ldMJ4gw8e31s5zAg7YJ3Dw4PtHPLkP3JK+Jh0+YA2yv1i2YqA8ixdi3jcf1JlVDC9MXoLWsL+IOVYIPTPEXSgocoBljXQ3Ibf8n5u1LQ93jdoetFauyIQsOTsQCogkq7PJETeHk/X3idrPWce5OnZAlGjUmUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ETbsfPDD; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ETbsfPDD; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ETbsfPDD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ETbsfPDD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crScW2flFz3020
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 21:06:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761041175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AcIk1u1LFpf3b4C6lDAgUzkv/HVOGHxfz0isd+tTMcE=;
	b=ETbsfPDDHRYvKiAxTsNVBJl89Knf/iioUfKfOUxZmKU4+KjtbmjLChGjG5SKCc2GNoS+aJ
	dv2PsEV0bEwbPeWbG5i3sDdB9jdP4fpkqoqDvAuQ4SoMG+8ZY3Oc9LfSOQ6ESyuMfhsNUP
	6rjOXcAvBiuHYWIvTMrKnordDBNRGDU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761041175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AcIk1u1LFpf3b4C6lDAgUzkv/HVOGHxfz0isd+tTMcE=;
	b=ETbsfPDDHRYvKiAxTsNVBJl89Knf/iioUfKfOUxZmKU4+KjtbmjLChGjG5SKCc2GNoS+aJ
	dv2PsEV0bEwbPeWbG5i3sDdB9jdP4fpkqoqDvAuQ4SoMG+8ZY3Oc9LfSOQ6ESyuMfhsNUP
	6rjOXcAvBiuHYWIvTMrKnordDBNRGDU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-SSSY6WgJPHaFKa7XZaLXSg-1; Tue, 21 Oct 2025 06:06:13 -0400
X-MC-Unique: SSSY6WgJPHaFKa7XZaLXSg-1
X-Mimecast-MFC-AGG-ID: SSSY6WgJPHaFKa7XZaLXSg_1761041172
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47111dc7c35so37341955e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 03:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761041172; x=1761645972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcIk1u1LFpf3b4C6lDAgUzkv/HVOGHxfz0isd+tTMcE=;
        b=OanxHGfdfV09IbrDwfkpVXd3J14AMWPerejVXQZi8Lbvpkv6ED/5oy9rdVF0Y70kt+
         0StRMkM/Hj67XacOg5aHqxuvIp6x528dnbJ8OanF+6CDfDBg/OqpDNvGh4oSRHk3dTBj
         HpPBMNwv3UaYX358UHIQKb0TMlkZSkTbJxf1eheytR3u+cTlkkSvlm/bEtwuD+GTmiaq
         QrUKMYWYgedN4IpFJTdtTXTdIyWulie1cWyCOB5VygqMqyE8yk3GlzBpT7KArBj17RXN
         3bPcA5sRlSv07SSymn2Ib0TvK+hhEm+vP5by/olboLp5L1UetR5weiao0uzjwgMIv0Mv
         l8Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWYn9Rv+qruHXc98GqlV9NMXfxDIONkH8iOxiGYyidvVtJMk8j4XEQ6612GNLb2/m2DgDtT1LPXnppP5fU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxSmMlphhw2GqiZJobnSTyQwpek2ZxNENrscFV0Xzufs+FDpwRr
	nqWLYKW08oy0EWw7S/zwt8lerrsJMR2gC06l1Yg5BlX/11tEawUn2DXOp5okuhZ/2DYR5Jf3F5Y
	VYe/ZGF73Bm2eg3cnUVxWnFM6ETp9vbT47aTOj95hCtd4i6emEHpfIDEg4yFQK5O2GJM=
X-Gm-Gg: ASbGncub+LzPPhFttdG536iDBFxiidYwKJttmnd5QHsKDj2y9HEC8m2XVTfzgeK7YxJ
	kWUZxu9rxFcUxhbHKd0G4/z9Gr8BeHyt5i3DOFbWuopCugyOeVKRvqXlizKoa/4DFRWzjNHQM++
	HZIajuIvtS6vI3STAX68kiHqn2ShAVW9YMSoeJvA7x1rcYtoq5tPuL45bp91TZN3agSCuBFLoYF
	b7JJ4sgGmCS9hZBTnPrFnS3wUA0jLRKFOLFXKXWUbt0CIRhBYrdDaAgo5zI1B+HH1EN3sbl+G+a
	YDDvWMZqcOKdcPSuUUD1Q7kuDSNOlHt0OoKMfT9Wlkgkdh0Sf5Y3mEhfK2vD50GyPwaXiM+2ZSC
	9KkMITxqYic6wL8RsZBZkHwGI7KRBIHsiwPJgtb3nK9hDAJjGN3Uc+Fx3xaYJ
X-Received: by 2002:a05:600c:8214:b0:46e:2d8a:d1a1 with SMTP id 5b1f17b1804b1-4711787c09fmr119127915e9.10.1761041171939;
        Tue, 21 Oct 2025 03:06:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF73SD0i6hnV9Jjn1RH+PBFk3w9kuXlrYaFhYZPnbx3J0Nn0xcYgxIdbLFvh84woZnc9xYOlQ==
X-Received: by 2002:a05:600c:8214:b0:46e:2d8a:d1a1 with SMTP id 5b1f17b1804b1-4711787c09fmr119127665e9.10.1761041171514;
        Tue, 21 Oct 2025 03:06:11 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47496c2c9dasm13567195e9.4.2025.10.21.03.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 03:06:11 -0700 (PDT)
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
Subject: [PATCH v1 2/2] powerpc/pseries/cmm: adjust BALLOON_MIGRATE when migrating pages
Date: Tue, 21 Oct 2025 12:06:06 +0200
Message-ID: <20251021100606.148294-3-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: GXbEcUco8QcHxZwvcMePysu62Kgj4ql8OLWynSUN4So_1761041172
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's properly adjust BALLOON_MIGRATE like the other drivers.

Note that the INFLATE/DEFLATE events are triggered from the core when
enqueueing/dequeueing pages.

Not completely sure whether really is stable material, but the fix is
trivial so let's just CC stable.

This was found by code inspection.

Fixes: fe030c9b85e6 ("powerpc/pseries/cmm: Implement balloon compaction")
Cc: <stable@vger.kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/pseries/cmm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 688f5fa1c7245..310dab4bc8679 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -532,6 +532,7 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
 
 	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
 	balloon_page_insert(b_dev_info, newpage);
+	__count_vm_event(BALLOON_MIGRATE);
 	b_dev_info->isolated_pages--;
 	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
 
-- 
2.51.0


