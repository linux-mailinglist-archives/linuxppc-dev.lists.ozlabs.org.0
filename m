Return-Path: <linuxppc-dev+bounces-13086-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B523FBF5AF8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 12:06:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crScX6T16z3069;
	Tue, 21 Oct 2025 21:06:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761041180;
	cv=none; b=EwFRVi2/YtKqnauuZlXhMjCqazRNsfqBTlYABXHuLD9R3/4+Ioi1dHb3priLYjgccUrkLyJEEAv6ZpGvg8D3+mGwlaCAj5aUjgsCWQ5a6bs0dD4Om86nB1+UMXF1KZIPpO04fDcsVICU4pLbyAwOEWoc4gemfAGmNBC0VnY6lygPkMfIujAOvXikTq5pXFvxSEnk852RDN0BaExvsEBxM+pgZo2g+DaR3/F/e7JulZH1PZskfrypd/AZZIWEtpMjVucx4O+bQ1FOB/GWzN57EaLLCbnxptZgsE1WQMqMJWvNsYY/cS0emkTlJMDiV7UU3JRF6kV9K/RAQPDcigTWQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761041180; c=relaxed/relaxed;
	bh=5tRHSKB378wUj6DIWLwa+5I8dp/1qlo2CfW43riSIf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=WfUn4LLeAHtJrmIB5wkjy5l9BRVLHrhG41/hiDZQ3IkB9X8s9w30s7zuv1T3i1IyAd70StmTiCdPYm+p6K2jAwOnMki9R8sh1MEultsMe1GKluc8ipGpKfAhU5f0na3wqWW7U1qptNtZvK2aRPELOHQ+pPl/MLzWNuwTUF/eow5j6jev21e485Fa1c0pkxyswcBNyTbK+JG2TZLqsVof9WoHjosnIKhQWxq5udhvPahawMHvQ3NWQIf1hOnTj3+dwrsp/VFyS5psY5pldQBE1gGbrn4aauCenIvjThfOZByHQf7z/l9VdHKnvKoh3W60owuujW7Zz5RKpo36K0LdQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YJN7q5nN; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YJN7q5nN; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YJN7q5nN;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YJN7q5nN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crScW2bmfz2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 21:06:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761041173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5tRHSKB378wUj6DIWLwa+5I8dp/1qlo2CfW43riSIf8=;
	b=YJN7q5nND6CZfUE2sW1OmYOp2aEU1X9FZqLY6f6At3/3ZofIMwFx/X+9b6pKbF95TjlX5x
	3qrh42a333aK5VZjZoCS6RYtp11Iga88npAm4lag6xLjBmYXA6HgWrc0mf5EjKSvcRv7l5
	SpRuSVmUs/MmFjAd3Ix9r5PiGUkDhGU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761041173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5tRHSKB378wUj6DIWLwa+5I8dp/1qlo2CfW43riSIf8=;
	b=YJN7q5nND6CZfUE2sW1OmYOp2aEU1X9FZqLY6f6At3/3ZofIMwFx/X+9b6pKbF95TjlX5x
	3qrh42a333aK5VZjZoCS6RYtp11Iga88npAm4lag6xLjBmYXA6HgWrc0mf5EjKSvcRv7l5
	SpRuSVmUs/MmFjAd3Ix9r5PiGUkDhGU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-5NaL-aUwMtivS5tSdGEZ3Q-1; Tue, 21 Oct 2025 06:06:09 -0400
X-MC-Unique: 5NaL-aUwMtivS5tSdGEZ3Q-1
X-Mimecast-MFC-AGG-ID: 5NaL-aUwMtivS5tSdGEZ3Q_1761041169
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42851b6a659so157706f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 03:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761041169; x=1761645969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tRHSKB378wUj6DIWLwa+5I8dp/1qlo2CfW43riSIf8=;
        b=Z0WsYf231872Vle9/gTcazG4qbt+/NvFPTs3hJtJ6mmiaUo5LCbBsZ8n6hq1oPiYY4
         K8uFEmwMflP1sj0UVmiFFX0mrvlpiZmDRhk2d+Ag3K/9U4GVzWmILsDbBzuFXYlhHQQt
         9Rz1T96o2wurpR8lquJPl0sx6gwyJjkonE1e2329nB9ue3XookT0FEGl7p03hA0St4bD
         qzJJeZ0hWpsJiQgMq4xQccoYXi/Yt1U76PUZ2vgwvpKiZJz0pCOIJhuBEmLlIqkzWVnr
         ZGaorQwiCIm/rwwiQV0pXpRgBexBydLZCuNexfp7g0gPg4kG6jzIkVIac+SYeEpYLTJS
         pLJA==
X-Forwarded-Encrypted: i=1; AJvYcCVlrr7UYxyNavrCYMLz2wMa0UorTSENNwLv/SlEDQXNtDHNiYBNO+ftm+ZVAfqFDsu+vjy9i5qeOoMkrv4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxqkgS52i0SvdKzCW+9zUAtppY0pDFmy0/D3CeWc8RpJAbPQPHI
	Q4pBF627GcyFL12OliK+swYyzsjYPNMpoF7xaT1O5grENg/I40zdi0tSMexlvyALE8awZfBSCeh
	VB86MdX+I58aB9lPghXMpQMfdySvbZ/XNXMDL5vKNKOWhqmNGqX0E0esSGfUZzca+Jt0=
X-Gm-Gg: ASbGnctbE7WI9MVQ9XSedSy8xMrR1sqNl/z39QkfUt6aqbrPY88dyNkSjH0zQrU1kzR
	Oy8/1iqRQIAaseLbBXuOT4HTGa6HNJjZFb4QP2oTncwksbNK0FnPl5t0yGQI2AfcEHSNKQ7R1sg
	nXViVywKPTlkotFkpenH65bGJ19KP0EgB6Fm9fcPl0SLXU/EwsRNv8VGCCC0konhx++pLbf3OYV
	ygHCoCGtfy7t/baHbU1UlR9u+xLb2CDM2dI+/WktjzJi2+x4AaaPhDtNonMzkc0DzSF1Q1Y/wM+
	osgJQ7D/mIhbuyepcaqcEwdCsgZWhipYe6fot+2P4DD/EFx3CXukDn4Uw1pu+0agLPBhhUfznwR
	kh18+oZ+nKbc0USGpf9gbvSeISigLzqNUjUIJcvTHponyxBkTh/Szk5ahHfKJ
X-Received: by 2002:a05:6000:25ee:b0:427:697:c2db with SMTP id ffacd0b85a97d-4270697c302mr9342475f8f.20.1761041168631;
        Tue, 21 Oct 2025 03:06:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEInIXj3wBV2ru8CJ8e9i4dsSkU7c375jECkW1lOIjIo9JaHXcLWvinfDrHj+KGluxpyRnWdg==
X-Received: by 2002:a05:6000:25ee:b0:427:697:c2db with SMTP id ffacd0b85a97d-4270697c302mr9342440f8f.20.1761041168078;
        Tue, 21 Oct 2025 03:06:08 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471144b5c91sm272072255e9.11.2025.10.21.03.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 03:06:07 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 0/2] powerpc/pseries/cmm: two smaller fixes
Date: Tue, 21 Oct 2025 12:06:04 +0200
Message-ID: <20251021100606.148294-1-david@redhat.com>
X-Mailer: git-send-email 2.51.0
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
X-Mimecast-MFC-PROC-ID: 3Y2SfhkyS7OEuyndrcUWni5wOXP3SA6i0YE-s7r5aio_1761041169
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Two smaller fixes identified while doing a bigger rework.

Compile-tested only as I don't have an easy way to test right now.

I would prefer for these patches to go through the MM tree as I will
be sending out a bigger version soon that is based on this series --
I split of the fixes from the other stuff.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>

David Hildenbrand (2):
  powerpc/pseries/cmm: call balloon_devinfo_init() also without
    CONFIG_BALLOON_COMPACTION
  powerpc/pseries/cmm: adjust BALLOON_MIGRATE when migrating pages

 arch/powerpc/platforms/pseries/cmm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)


base-commit: 8841ba63f874d5dc05fc4beb47788406be96fd5c
-- 
2.51.0


