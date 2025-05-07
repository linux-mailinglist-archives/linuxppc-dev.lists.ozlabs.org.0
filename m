Return-Path: <linuxppc-dev+bounces-8369-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D3BAAD5C0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 08:14:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZslMW6jR7z2ydN;
	Wed,  7 May 2025 16:13:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746598439;
	cv=none; b=LovaXDTfCe51htyRf0bHXOsbGba4W2PSBEyI3X24MlL8zCxGH0x06DAaqzBLUqWvp6WbDZi0Py3NPECZM/TlaRrCpi/4LJ/QwE+pzdYvcxKDgeu4xZcZA8n1nagLRbiK7P2hckyITvdfFDhvYrecNdbqbYKZdVGEZUM+x+re+SELUX1EOtUB6ROD6wVorD7NuYO6pY0Snfz3tqj2RSMbdjsa5UJWEcGfiagQnTyQxsPdzRTO3vgPTmseem3jpzZBSTZ7l8Nurt+e3wVk/6oxFe/i8qcESurX7CgRiP0RRFS3TBJY4oSsL1qAA1ckI8efp8bQQrGIVFIWerpN14kjoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746598439; c=relaxed/relaxed;
	bh=Rozxfw15XCGd2H6xaiwn51c9kWvMu98WF+4nRevjr28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnUrHwIjpj+yf58f4SxH2dZZcMraxaoOk3wCwzWNqDO0MeNQsqL/ATMINp2JWBsPXopCwEqdINl4UuoMm4rrow+v4qv5/yT5QLkYBT8E7gUKQgQwQQ5894fzDUpXRv4mmVMo6Accz0A6m5KO6dbNyDXOBtlpZoj6EfW37rDt4l/Xx+fZU/XSrUjXEvyF6GdbTUdQk01lqQjHkqvB6uINpUuSH3QtoWEyJW6fvi34kCRgYE2RM2+eLDeNEz34MaB+ujZrIoOImdmu1WoYsW6/NtG3Qzk9OgKktlNfdr5QFF39Y2+THTTpQ9mZy1q3lUV5gY9lqXnfL+WUG7hOq/wQhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TGi51ZfE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TGi51ZfE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZslMV26lDz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 16:13:57 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22e15aea506so59972815ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 May 2025 23:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746598435; x=1747203235; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rozxfw15XCGd2H6xaiwn51c9kWvMu98WF+4nRevjr28=;
        b=TGi51ZfE+027a0uFljTZ6RR2z6g0iazomxupbHgbuU2/YvTcZNq9W2utWK9qsgFfy6
         eXh+2phFeOCa2bDJkgN93Ec1ic3PMTzsee4RNe/eqzdTmdVNhz2lNdIriXIEFMFdNB/c
         k48BaypOuqaDOraa656j/31AfbPsnEujOKD87cQw/AX4MsYbccPj1uJJAkfNrz8X8BY0
         tuo88Va1X4BP1qGuDULWwHy4/eQX3fpKCWmZcxbAvEdWOLauOBZSpUGlOMG11qHl5V2I
         1IMoBr9n2BxofqABo/d7zY+nMcPzKc5iLkfGNleqXIOoUU4kxuXJzb9lsjJ2/C+g+SVK
         RVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746598435; x=1747203235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rozxfw15XCGd2H6xaiwn51c9kWvMu98WF+4nRevjr28=;
        b=lqDw67X4jWTlbpDSTKyuQdA/p+5D5H7Ae7pZUl7vV6ppFuTGy9zOKjhX+8XA6mjUmH
         zA818w2WkzJm/yBAAWGnmOUqLztW+J6F7N+rALETLutW2+hXiyJsDC/Z6B+Zh1DkDuxo
         TgXChy/YW2fM5X3B8rKh8X7zefYSAt4OWqKi64OLRyPyilpDwZ89SgYMPikMAHZgL1hu
         zspYOc72Z1OmuJsASDo6+Acs6KodJKg4Z0vyKh7YDVExb/jmMpNUQe2G+djqstKdoGkD
         EM591VKaO1cjo2LSG4uvZG3wPXJ7h1RNgL2/Zcp0/+isBbUg4EVx3InJhd2S0XBeG161
         3RDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrBIse71xMbBU42RG80mctTlbbfCJnb/d/kxuJJ7YByU+Z8Dv2PETzjiQJvajU7XfXGlSzjTqW2Ybqxac=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxsDn/FO95zeZtmNL1V3j4P4U+emsDAh4T5hYzM9ZVBidQ47lVd
	Wf5JTD4FjaPBvGjktzagVQyWVa8UOOrgoTETY7eCyOB5eY+chu0P
X-Gm-Gg: ASbGncsMY41PVjjo8LgAtZdLwRlRpm3ANoUw8Vwh731YmOrHVJQkh4pbQO9eu66sP2K
	sEwLw/AC9/5JPgsZGkiJwO66kYokWJLhSDdBB/u1nuG1Aei9SLArqWo5z69yyn3D6UcjFYIAl+n
	AsL1qomx+lq8MBfFHJqtFBEhGEl5yHwOl5nT6LBr/oYdTdeWkXZnzKG+xPddJek69aBbm8UmFnQ
	aSHuXl6bMCRDAL4U1FZKaCOwXww1kl5OTPZ0D743HNrIBLwuaf2fy0dN/rf+hPl6DlBr1uaO1rW
	pA8QzAtQJAabN4pPN3SjFKEwiODzhR8t+Ah2mPdi
X-Google-Smtp-Source: AGHT+IHn1JoIwnOddTfG6PRyqZCpjAnehF1wYY+TV7xyiH9zs9UIjbHMUdyCMMVyIeRgK6aA0NFoqA==
X-Received: by 2002:a17:903:478d:b0:223:f7ec:f834 with SMTP id d9443c01a7336-22e5ecc2c09mr32036665ad.31.1746598434443;
        Tue, 06 May 2025 23:13:54 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522ef9bsm86224765ad.217.2025.05.06.23.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:13:53 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 289E642A3183; Wed, 07 May 2025 13:13:52 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Richard Cochran <richardcochran@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Subject: [PATCH 3/3] Documentation: ioctl-number: Correct full path to papr-physical-attestation.h
Date: Wed,  7 May 2025 13:13:03 +0700
Message-ID: <20250507061302.25219-5-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507061302.25219-2-bagasdotme@gmail.com>
References: <20250507061302.25219-2-bagasdotme@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1833; i=bagasdotme@gmail.com; h=from:subject; bh=xfAfj1klcleSKHXLxNAOO+8ONspPBsJHamkZ5reirUg=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlSP9hFHpo7Bmol7VRe578uf3OIuf12U978h+pvVje05 O9TWni8o5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABMxvcnI8Jb1kPtfpaOCbBst Vhsy8YS0H08O6Y7c6iDOHM+tm9zBzchwboEoa+Qny9+5K9u92ANb0vkrs3s21r3Sa9jFcy6hdgs bAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit 03c9d1a5a30d93 ("Documentation: Fix description format for
powerpc RTAS ioctls") fixes Sphinx warning by chopping arch/ path
component of papr-physical-attestation.h to fit existing "Include File"
column. Now that the column has been widened just enough for that
header file, add back its arch/ path component.

Fixes: 03c9d1a5a30d ("Documentation: Fix description format for powerpc RTAS ioctls")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 3864c8416627e0..855139f3bc0e48 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -370,7 +370,7 @@ Code  Seq#    Include File                                             Comments
                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-dump.h        powerpc/pseries Platform Dump API
                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
-0xB2  08     powerpc/include/uapi/asm/papr-physical-attestation.h      powerpc/pseries Physical Attestation API
+0xB2  08     arch/powerpc/include/uapi/asm/papr-physical-attestation.h powerpc/pseries Physical Attestation API
                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB3  00     linux/mmc/ioctl.h
 0xB4  00-0F  linux/gpio.h                                              <mailto:linux-gpio@vger.kernel.org>
-- 
An old man doll... just what I always wanted! - Clara


