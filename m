Return-Path: <linuxppc-dev+bounces-8723-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06812ABD4BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 12:29:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1rPp6k3Wz30Pl;
	Tue, 20 May 2025 20:29:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747736942;
	cv=none; b=MWiCR01RCq4NsUBIYvB7bc6kxswOpsx/pWsD8YhTbVlmAnhjYWZbMEOE6irYwHrL+8lUbulp+xnyBHA1gAAgmfC6S/gLD6i8lbgt67qG7BKP/h9sePeeKM56xloVHbU/NtChKNSb2wcmLb60OPMwZaXLYMQD5XVoO3DtQ7adEE9FMKdAW2+soMRSrtQKfVPLvs0EsxqrP/LjD+tc+iU/gqXkCJm539roL5uWv3sY34yY4GQ0QWGdDkINjcyYPdOA3MXeBAgxUWlB6MqQ+UJfVwbMz7wYMUCIC+5zL5KNNEuuc9zlmNw3LBXl+1xSYs3mYGmI6h7JUZ7GNuWfu3EOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747736942; c=relaxed/relaxed;
	bh=7jOe1qDYuPcz7q3O2yaxSQ02D4UR7czAnJDhSuRfs6A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cKX6MeuEbM0UMapvVWEi8Ghs7hGljf/vpU20anOSboi1irKUnVym/hjmiaKNZ0A7mAJuiPPpufJCRQqg5+VtALnbCJEvAQ5PsApkTnslPKQ+yQRTikzghM7Vyt8cI1WgQfTdhFjgtP19PEXwkE5YUCBGGj5GMdxnCVu6SvERbjJ5yec/Fq81pBAqesJIueIudqykgL17X6N4SsWCnH/UrzMFDlqM0xiP9RTT5c0giwN8LVQsWn+YeKvRnZ4D1S/gI56J8lXVryuTVrHaUqxUquPZ5SwadVU8czrRgd5QAVrd7GykmPVkicH5t5NncVS5j3zV9uPGyW88z9gqLnyvHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qxN+37x0; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=lists.ozlabs.org) smtp.mailfrom=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qxN+37x0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ellerman.id.au (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1rPn56X2z30N8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 20:29:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1747736939;
	bh=7jOe1qDYuPcz7q3O2yaxSQ02D4UR7czAnJDhSuRfs6A=;
	h=From:To:Subject:Date:From;
	b=qxN+37x0LWPEzCiV/P+gUaZs3P8diJ3DDn/NwGFHhTs68e+obQH2/SymkM4qNiMzz
	 8z7IZP6NhQhTUmcEyG/IxZREPKUHR1HZ2CRyzL8fmhMqP0taAwKlvXzfpDGOSI/Dwl
	 /noxVzrMmYyyadvMQUn6OdRB9GfT1YSgIr0Ge631FmNTQ/Bf20Hq7kZY5PeLM5Tli6
	 lGqMwsSUDAP8Y/epOo2EABgTNqyZq7P1ECs9ujTqHxV6t938eqIpsz6gRVVwc6rBKf
	 ps/U9DUn++Nz0gRzoUm6ZPNUn99Vs8wC3UAqfNfP3TelQcRq4pSzpNTom7uIvCzsh8
	 M0uQ4O1Hskukw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b1rPl6GgLz4wxh;
	Tue, 20 May 2025 20:28:59 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] Documentation: embargoed-hardware-issues.rst: Remove myself
Date: Tue, 20 May 2025 20:28:55 +1000
Message-ID: <8734czh8yg.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

I'm no longer able to perform this role since I left IBM.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 Documentation/process/embargoed-hardware-issues.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
index 0e19d2f0d6bb..da6bf0f6d01e 100644
--- a/Documentation/process/embargoed-hardware-issues.rst
+++ b/Documentation/process/embargoed-hardware-issues.rst
@@ -290,7 +290,6 @@ an involved disclosed party. The current ambassadors list:
   AMD		Tom Lendacky <thomas.lendacky@amd.com>
   Ampere	Darren Hart <darren@os.amperecomputing.com>
   ARM		Catalin Marinas <catalin.marinas@arm.com>
-  IBM Power	Michael Ellerman <ellerman@au.ibm.com>
   IBM Z		Christian Borntraeger <borntraeger@de.ibm.com>
   Intel		Tony Luck <tony.luck@intel.com>
   Qualcomm	Trilok Soni <quic_tsoni@quicinc.com>
-- 
2.47.1


