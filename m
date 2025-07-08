Return-Path: <linuxppc-dev+bounces-10150-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FADCAFBF52
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jul 2025 02:44:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbj5x49pfz30WY;
	Tue,  8 Jul 2025 10:43:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751935429;
	cv=none; b=Ap01XO+WD6jCNisD17cszKsO58T2o8mNFmcw739l4D2IuNlPsjSD7DFflw+G4e74Zzvtea9mmYVNS0su9S+z9wyK01vQZmNae4awrP0yK8NjwjrADXRZZ/lJbwPObeg/ru6Woroa9j3nZKA5Z9UciVbVQkfT7L7rtl67fp9XRBrOFkPe61sRPJqAiLs+tYq3ItSeC+bBpd39ykdhMeINFeFiXgaKNX9vTbF6hxuF21tB+0BV5+XmCyUcg9rAJ/Lt/xdEIpySstxVObsDsleQ7v/HyYHll4okbRitLs5HavQGJo3RT4z2fyymyGM2IyWaTVVDMXWqexc70pWycavdOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751935429; c=relaxed/relaxed;
	bh=ouZMOhhlyASDz5O/Y7YPKPFa5Hyx6ZziwKAHXGx5Bxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Di2ssBZQDX2jrfJpb85CfcaSOX6L3SqVTkQJb+4AfdXll1B/7M2DB2vCW6kKtlYeC4J2AheA1GWwgVhOvZW0ClbPL0QyC8Zim6q0MzS/NvRlvzRs3MIqRFbP+Pmb9V5bv3SyjMp3u22l4FyrlWauJxsdproW5eox6TfUBj9SQiHJvIaMuTJyfbEeHeMad1KtG4FnSL8O+z5GvRdlvn+nWxTcBxLFXo3MAe1YEAx+2gfOyQNyQjc4wKX7Y0USstaU793MnAusSrp21vMzuUsyvIFztWeuowHaA1oHOstRWTxQGWyDsquBw9g23der2W32GaEYCm+a2CCnMUDv84ZRlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EVWJZQUn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EVWJZQUn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbj5v2pKhz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jul 2025 10:43:47 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2350b1b9129so25313055ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Jul 2025 17:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751935423; x=1752540223; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ouZMOhhlyASDz5O/Y7YPKPFa5Hyx6ZziwKAHXGx5Bxs=;
        b=EVWJZQUn/YkWUcCq1mAJDUoZwEkhineAdvpBUERUtwzjwQizyJu55wWolYytsv9ZLp
         v0n+1Tg6hxqSXIrN2zPDbmm5Cx/v7TWXjjZsKgAo/21d3YRwLxgUCModgqKtAnX2w57y
         pMyk7y1NxYKVbIQjcjFaKx55u0eyU3LzRxSY47ZkVS2ZcQU3/JiYNkl8VRV6urPSaztc
         6NUHp0lG2m6Ey7uxAF3koFURgBUCDaJjrbE5XChH8r4+t1KtHqg5BhAafqpaB+Z/cqoE
         tw1S9h+LI93hqTbxM7CaBU7UzdOU/R8eZIrdQyKqj7F5RcRiY1rWW5RrZ1X73r+smGFJ
         LBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751935423; x=1752540223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ouZMOhhlyASDz5O/Y7YPKPFa5Hyx6ZziwKAHXGx5Bxs=;
        b=NMObOFP6stlKYr9SbZOt4HiCfBBdV5Rxp/97wOF22vTd9S+nu3nCtFU3X8vCJFomLd
         6TF/G1Hg08/JOtPQ5Nk7GN4QQJxc6N6LjZJUPoV7ymUwLjtR05427ib5q6x3txpkkJH8
         +8TiGm5TJQopggF2Y1bOAjfVpX1HiNQSdvFFzxNBCFfMSGLXyAkT+8W1Z8lW7QofSM7P
         kUcLaYtK1GHBXnbfZd0Av4HkFzoA3IUXujoiY/dOJvOisFOIZZeByNI/FEAOqxV1zaO+
         MGw69fl9GyHWm782DwRBmgksbKP+EJk4PpOtcp8xTyZMqRyQjDGzDdXg7T7KJ9cU1Af5
         uClQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY3kxaGzVIBZe5OLVjjdloL0gHMQHN0lxDoNruR6aKos6ZC8zXpt2Z5QiIC4x4ZmmV1uGq0iXnXhX3ebw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyeByJnilbLofbdrCdtQA7qMkVV5AdDlWB0TP00jeeVGjAClwok
	PtODmlntkyq5LIg1K/H2NW7ZoofDR2q45frGbjWYv6FfEoaN/hNEeWpo
X-Gm-Gg: ASbGncvgkpZ7TGEigM1iMEYA5a+jC5Sq/Nocz/tNF4y68Q6CKegkrSvT4M1OZBMaZBm
	ajiRDTJokZlnzIIKtcBnhCgewHK95N9yaPhx7Xph2y/JLUQYapVNqS0ceQyfYGBsfWgH7Qltn4j
	oyfoX0WRP7hZe+C2DONAPTRfQTwU324uLhL/8Zz/Gj6GWHoVuACJFN1SSY3VmTN5xS+5Iz6PlRm
	IaAh0gQp3yqRrt6tAKqMDrCzOohcHK14gf6M7xSG6otF1METdbmQ+zTxR0jOOkPWuHMi0rEwgbv
	LnJ6Ru6fwmwYGsEv0fj2ule7aLKO6D1ptf8ya7HA/YmYbMSmtA0uHKB8fzn5cQ==
X-Google-Smtp-Source: AGHT+IHk89CExQ3LHPfjBWIFyfa1uHO/tpnz/5cBiYKZ08wHHtegzaba85gjefd9AA6cN8etf16unA==
X-Received: by 2002:a17:902:da8a:b0:235:c9a7:d5f5 with SMTP id d9443c01a7336-23c85de400emr207626165ad.13.1751935423163;
        Mon, 07 Jul 2025 17:43:43 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8457e15fsm97155675ad.154.2025.07.07.17.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 17:43:41 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 21CF14241829; Tue, 08 Jul 2025 07:43:37 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Richard Cochran <richardcochran@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Haren Myneni <haren@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>
Subject: [PATCH RESEND 0/3] ioctl numbers list cleanup for papr-physical-attestation.h
Date: Tue,  8 Jul 2025 07:43:30 +0700
Message-ID: <20250708004334.15861-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1004; i=bagasdotme@gmail.com; h=from:subject; bh=El8HNLBnBPZTccV52jWXgoNBWzmmb8HHjXi+IlnYSpQ=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBk5mZpXV3LJNP6c4P9pl/NXkY5/kwIf3d3G/XHD23sVi TvtL3g97yhlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBEvp5n+Gex6tZ8rzlirrN+ Xj4sELNRc8IyFiG1Cxlrdh3jbp7RZ/WEkWHi9cbFh+w3Mj5eKr8w5YLznD+GhybvcLR77Bi8WYH zHwMPAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

Sorry if my original series [1] didn't get reviewed at all (and merged), so I'm
resending it here.

This is the cleanup series following up from 03c9d1a5a30d93 ("Documentation:
Fix description format for powerpc RTAS ioctls"), now based on docs-next tree.
The end result should be the same as my previous fixup patch [2].

Enjoy!

[1]: https://lore.kernel.org/linux-doc/20250507061302.25219-2-bagasdotme@gmail.com/
[2]: https://lore.kernel.org/linuxppc-dev/20250429130524.33587-2-bagasdotme@gmail.com/

Bagas Sanjaya (3):
  Documentation: ioctl-number: Fix linuxppc-dev mailto link
  Documentation: ioctl-number: Extend "Include File" column width
  Documentation: ioctl-number: Correct full path to
    papr-physical-attestation.h

 .../userspace-api/ioctl/ioctl-number.rst      | 516 +++++++++---------
 1 file changed, 258 insertions(+), 258 deletions(-)


base-commit: 38d573a624a54ccde1384ead8af0780fe4005c2b
-- 
An old man doll... just what I always wanted! - Clara


