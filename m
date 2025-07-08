Return-Path: <linuxppc-dev+bounces-10149-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EE4AFBF51
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jul 2025 02:43:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbj5w5knWz30VV;
	Tue,  8 Jul 2025 10:43:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751935428;
	cv=none; b=EC64Ji43d3XuYqCxIAz0iq3OBZ18B54MgJnWHWJoGoNtXDb3FNYjNQgjn+uSKa3e4CQXZnk/HPe6kT4pkB37tPjJmxUaLGJILGBJm6PRSWCbD4QErbfJxSVSifnmwTJisjnsjEk71Xp6Yy+X5dc6AV6rg5JACbe8+/6aVbM1huVCld7NraD7YPt4PXtqUmfbH+xOrhc+kMcR/IiBlYX2j5lSB9RuhRL8Ne4F0mPV8z7XC2TSR19iSUJth7P0uG2NWCdPhFbTuV6Y9fgMd/qveqleXTyadfiYja81HnXAPom9ISkUUOexbnVn4VkHEHQANttLlVrSywdtKbHp+GFTHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751935428; c=relaxed/relaxed;
	bh=80QJ0/Ue2d8FrJNLQszWtMH6jtF7MtGxYGsWhmuyfGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqCEP1E14aGXuWf+KZ+LZNvOuMXkneT1h0rUMeO25e1MLAz6fplKJ/SQ4rTT5eY+C9sdd04KFZn1fTlYeIsUuMLL/vs8pXZqSAM9+0yJORVl8+O2ReVY3vMW2C3sg2hCy4XTzbf06h56hCAoAqMnVyIeJkPoCsbab61bnvgJqi5rFIahh+5l7lHym5nI8/jjn8eXDx7MBEGQpH14gRCeGs0myADX7QdK4ytMNDBsCL2DxW4nQwbzaax6xIEH8fFVUx+6gMTA2eL0thkfGo8DRocTyYOlC1ehDwgUaxiql4tK8f9XH4t2ARbogXWx2/MgauWL8pDl7Q/Y1em8CFln3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iCjLH0j2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iCjLH0j2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbj5v1251z2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jul 2025 10:43:46 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3141b84bf65so3628979a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Jul 2025 17:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751935421; x=1752540221; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80QJ0/Ue2d8FrJNLQszWtMH6jtF7MtGxYGsWhmuyfGY=;
        b=iCjLH0j2UfoeRsG98NZCrYzzrBFCJK3Q+rLRN3dio81ll1KJhDw/HBT1ZRRcUVarPm
         PnmLtKSCvngYb31beiRS1u1hLC89HFAwPu5P/PvI1RtBR03aCtb/dzI7TafV0+8tSadp
         QOj9N2+2Bo8B/CUY17xNMfre6qNVlB3eKRwIaijbfiDRZnqcgAY8sm33R9ob31dJK5l2
         wSCQSIkMwHqPL09feaRPItIXFix7BQlLmaEoJZBhYuQc68xr5Kmzas9MYnGgB25DeeGG
         ZKsdHpj2VteD6aduCFD2VqVCxbS8xa3My8e+R50szCRFZIHxfZlmBuogqhz/tR9azYzs
         Kdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751935421; x=1752540221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80QJ0/Ue2d8FrJNLQszWtMH6jtF7MtGxYGsWhmuyfGY=;
        b=MAEGzzQOB4/rSRCqJQBFmGH+ajkflE9l0DoSYN4oBIstaY0G9/loEmVoGms6iiGcVf
         kl8klYEJtVtKx2mzKuCVh46Cs/HEE565ObvyimesS5zVcrJNajb9wjXV9B8DNmK4T/5B
         RPLccAxOK28AWXM4xzM7GNlxi75/jxIO79d0J1rvbChMbsF3Pn+DGfoSZtE9WJ8PIaYN
         9Vv353zL98e26fUdz8gUwApjUvUPRcgDFFPwgPBfJ1g3fjli0ikDNEbd94fcygMXLAW2
         mP/ivUmiedI/k4rrMj4/ASdR8isSgBrtCSbw95/KIKAhBh3Ill9iQL6dYfvZTjzjkQW2
         lSmw==
X-Forwarded-Encrypted: i=1; AJvYcCXy3UvloY6g+J80NWZMvCmHznqbtMy9yRqvV9T20vxyLTixFFZgVDZG8a7fDroKs1IExQBCh14wXXAXsZI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxI4tpWLx4Sz4DsQ+SIcqhHuAfOtTBAybwJtQypx/kf2bfk+JXf
	2nR3QUAZgpjRhlzSY4rNNfMC8aD4kuodDnzyiAcQUnlq7mvP7jfQejnZ
X-Gm-Gg: ASbGncswVkqfKzhnPl914At2iDzMgnKYEVTp2pAOHXdraFocVvi39YA69brrsplifsC
	afDRKbu4B3NKZP8khl4FUFV+3dhY7WnT/uezFkQPpWGruHekXtgekNFee4i9DOUnJQraKr/fE0y
	j5OIj8QCNl/j1f+8vcOEMw7gzSX8BmWoGQuvyOOcFylR4/Bwr2IdGUkamBBifsva0ZBxZv+SvAY
	9MugAXRsVi37hBwx2N0INpUE26+Az52J61RMH064HQbGYY4B4Sq984lPQhijsbAdICkcfzV9EYA
	fN7gkA4AQlpGtg9I8+ftHpim6slT46EfD3/VGbS5xNj5Q4n+L+d8LsY/PzpHRQ==
X-Google-Smtp-Source: AGHT+IFe8F/6MhIOc4/g/1xKDc2RRUCNzZnJaHFCn/n9+RvFT2IEQBV1yqq8tbNy5BKpH8Penv1AkQ==
X-Received: by 2002:a17:90a:da86:b0:313:176b:3d4b with SMTP id 98e67ed59e1d1-31c21d8aab8mr1047884a91.22.1751935420944;
        Mon, 07 Jul 2025 17:43:40 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c21d67987sm571774a91.13.2025.07.07.17.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 17:43:40 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 61B0D42805E7; Tue, 08 Jul 2025 07:43:37 +0700 (WIB)
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
Subject: [PATCH RESEND 1/3] Documentation: ioctl-number: Fix linuxppc-dev mailto link
Date: Tue,  8 Jul 2025 07:43:31 +0700
Message-ID: <20250708004334.15861-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708004334.15861-1-bagasdotme@gmail.com>
References: <20250708004334.15861-1-bagasdotme@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2982; i=bagasdotme@gmail.com; h=from:subject; bh=4mUddNyIZMoc0+/EWYdyRKVhOzlpPdSiJd4VHdNAkZg=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBk5mbpHNA3+/mDxjXz8o3Svz5zMw3uSFfZYp1RZZ52LP r1+XsWyjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEwk9hgjw5bLinlFofrnLBWT 3M/mP5N+ulbi+MG93cvi41qqn/a9ncjwT+/A+3vr9825K3Mm7ZrZLslEBVa5BK2Vk3ddrjD7Kma +nhUA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Spell out full Linux PPC mailing list address like other subsystem
mailing lists listed in the table.

Fixes: 43d869ac25f1 ("powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls")
Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver for dump retrieval")
Fixes: 86900ab620a4 ("powerpc/pseries: Add a char driver for physical-attestation RTAS")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index bc91756bde733b..a4782e566392c7 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -362,15 +362,15 @@ Code  Seq#    Include File                                           Comments
 0xB1  00-1F                                                          PPPoX
                                                                      <mailto:mostrows@styx.uwaterloo.ca>
 0xB2  00     arch/powerpc/include/uapi/asm/papr-vpd.h                powerpc/pseries VPD API
-                                                                     <mailto:linuxppc-dev>
+                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB2  01-02  arch/powerpc/include/uapi/asm/papr-sysparm.h            powerpc/pseries system parameter API
-                                                                     <mailto:linuxppc-dev>
+                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB2  03-05  arch/powerpc/include/uapi/asm/papr-indices.h            powerpc/pseries indices API
-                                                                     <mailto:linuxppc-dev>
+                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-dump.h      powerpc/pseries Platform Dump API
-                                                                     <mailto:linuxppc-dev>
+                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB2  08     powerpc/include/uapi/asm/papr-physical-attestation.h    powerpc/pseries Physical Attestation API
-                                                                     <mailto:linuxppc-dev>
+                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB3  00     linux/mmc/ioctl.h
 0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
 0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
-- 
An old man doll... just what I always wanted! - Clara


