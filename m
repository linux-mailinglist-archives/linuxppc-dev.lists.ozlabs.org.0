Return-Path: <linuxppc-dev+bounces-977-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDAE96B928
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 12:50:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzK602lTzz2ydQ;
	Wed,  4 Sep 2024 20:50:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.181
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725447048;
	cv=none; b=VMo4pDa30qI5toP9rrD5aH4/dyaHEESj4GKSDwNGR3xRgzbAM7MwLY9q1kDzN+tquR/CJyAKkjQJdfJsDxOpSVt18Gb8lSWXv5VN5Rkog8TNIECYVprs93fWSFfxaAe1ftFsmJxvyKUrmAgmAezqDqbpjnmPaQ4NkHF1agioboXaLNILfQv4gVA96LADkfUZkH0v3YEgRsNNR4sHULqy7PGiyTNoLVQLKhO9nOBhZpSgdqT3r4ZZgpSBlPDOJ5V40XorglwTcuLIzJm9WTSfSFo5p+GwjbYS6K2teFD0WOHcqO16RYP2qMoRJxgVFatBKLSBtXsmEHZcevi/ks9scw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725447048; c=relaxed/relaxed;
	bh=1Myu9U8IEbrxLCMMi6SGb7S+yIVucaaKwRIVAbRfcI4=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=daegdhOog5fk6jdsxLauYjaV+6GtQANYFi52ya7Njc/MOpl0ffnO/J4wIlmrGXd8AIbvZa9AqEfoDBasi9gOOAlkGX6xETdEfriNmkTnQeqC/QvWWj9ew+EyhzrK/sjdPIEsBlsyCGAy5yXeaD/5hjXO4NdcoKy05vGBjlauW4mr17ztC1mM6asQG7YNf+JGrwJr3LXsLYl64GQx+axQ27y7FWzMYZWg2/BzB9Tbqecm12bFlDVxqIB3TNYHup1sNbV+nbtUeRuZiEoSGhZEcRqe2ObOp+2weZI395qcoYfd3/irCzYpSO4I4CGBmc8bQme1U7VeaGnmchDhLK+Ljw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HHF2H9yX; dkim-atps=neutral; spf=pass (client-ip=95.215.58.181; helo=out-181.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HHF2H9yX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.181; helo=out-181.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzK600GyMz2yWy
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 20:50:47 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725447029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Myu9U8IEbrxLCMMi6SGb7S+yIVucaaKwRIVAbRfcI4=;
	b=HHF2H9yXkjxJiYAPY3icEMi+j2QRE1ZCsM+RJp4sNwAXeNrVZM2TGzSxwZ0eOKf2tcQ5/d
	zRSsTShl3LGbta5Efi5TVD3aVX7fEV3W1Xz91D8WaM+UnLqEqQ+0eVVTLG93W3QyOHFggR
	VkeMJay9znbhrKvHgqJQFKS5p/aE14I=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com,
	thuth@redhat.com,
	lvivier@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com,
	atishp@rivosinc.com,
	cade.richard@berkeley.edu,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH v2 2/4] Makefile: Prepare for clang EFI builds
Date: Wed,  4 Sep 2024 12:50:23 +0200
Message-ID: <20240904105020.1179006-8-andrew.jones@linux.dev>
In-Reply-To: <20240904105020.1179006-6-andrew.jones@linux.dev>
References: <20240904105020.1179006-6-andrew.jones@linux.dev>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

clang complains about GNU extensions such as variable sized types not
being at the end of structs unless -Wno-gnu is used. We may
eventually want -Wno-gnu, but for now let's just handle the warnings
as they come. Add -Wno-gnu-variable-sized-type-not-at-end to avoid
the warning issued for the initrd_dev_path struct.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 3d51cb726120..7471f7285b78 100644
--- a/Makefile
+++ b/Makefile
@@ -50,6 +50,8 @@ EFI_CFLAGS += -fshort-wchar
 # EFI applications use PIC as they are loaded to dynamic addresses, not a fixed
 # starting address
 EFI_CFLAGS += -fPIC
+# Avoid error with the initrd_dev_path struct
+EFI_CFLAGS += -Wno-gnu-variable-sized-type-not-at-end
 # Create shared library
 EFI_LDFLAGS := -Bsymbolic -shared -nostdlib
 endif
-- 
2.46.0


