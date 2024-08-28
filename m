Return-Path: <linuxppc-dev+bounces-642-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB77E96207A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:16:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtwh12mwKz2ydW;
	Wed, 28 Aug 2024 17:16:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724824172;
	cv=none; b=BqJyb9Tt5ztk+C5U4Dqwo5zQUABXiMjuZQ/2KZPukdl4tU4j/Uhal537LriqOeJMu2MbZGg3wjGnY4EDkoNdQiUd3tq45HPHvgR31yM996wXq/dyHKSrbtDVFfOrgjDNkqvtBr69yYflvWxr55ngNNNyVcDc5VHG6fnp7CQ5mQpmi1/glmn8aslZ8u4FxLov9Cep2Yd+T8hKm7nLtNWNx0vonJsOVwojBMdDmp3Xq9w8RD3FzHJthI3YP7OIBGEfEB2INv7v2QL+Fjxt5q7ul4mbAbIV3+a9XU+kvdouUSonO2UwMxRNDDhCQtVyhljrqLbMk9v2rMZtNAX3YooHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724824172; c=relaxed/relaxed;
	bh=s842qMNTVJPdnaHjTgUH53HGzrqC8L35w1DIbWpmxjE=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=G/CqX89a/kHY3G6R/7k28cehvjEoUEMH8NTRKI7Nl9dm2vNloj1nb6b5MFB7ksf8w61KmDvuM+yjDmMfmoA7632kPc/f2wepFraziDJOsL1nOEpGjGXBYGDKpidDTmlumS0ilNMKHk82keXnC3hYqkNxvVwe/osSa6d4lCAp/tqux1vk79CH0oAilSB8yEIlYS5NQfvHAMhay+rjtIWR8lzyD7uHFFFhCwAxLZvVkz5YwhyMnGt7lZ+85CBK30Y1ViZKMTzZ6Cee8dFwNDBTrQItPUQQTxrNlIkVSHAkjrS2+buJT89fMvgrR3C8KUZgqb31GNQgsPwJbb4Cy9xSDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=mR0iZWHO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=mR0iZWHO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wttlc15GDz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:49:32 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-201fbd0d7c2so52360485ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824169; x=1725428969; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s842qMNTVJPdnaHjTgUH53HGzrqC8L35w1DIbWpmxjE=;
        b=mR0iZWHO4flXnMF3dNX6lTSbTu8KWPO3eeMrw/PzBGPMOiM/4PM1RE2dQMuVsMsMNA
         5YjfLyCbh5qRtT5XrDnoyRVQ/zmgCA2mFh48S/6wY+3jzvQ5tas2Vz9xdDwuaGt/gOOB
         ehx3lCNgGgVGOb6Jc5Hu3EOe9j8m9tuldXdVtLtZd2ZEYFg8I2vXug9NFsEbNKFC2y9j
         eM3qnZvJ9zsKjwFi6HR+1fG5+HxayxY544lxqxVusPA1Tm/x0sqR9msZGn6PwgMWGxMx
         Hz07cK9Eyb4x6h5tEE71xbWF250ZuJpxl78mYZlwlUUlwWlxdJxIEC9ZkWuqc4mOUIHc
         owMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824169; x=1725428969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s842qMNTVJPdnaHjTgUH53HGzrqC8L35w1DIbWpmxjE=;
        b=o5ykw2lGfsywtgO2oF0UziWvRFNIz9bBg96BLLunuO1nNYC4lQEgyON1fLCExlIIve
         /YTRu4VoXGtiD/H+YNc4wGI2RfyBHd7hnRE13JydT+pnmjc7Rx8kL7joSW3Alzv5/hyW
         QfZSvQRHnAHav3XAhckU5XJvognOKO76E3oPC0ydRxUENCafBi0OYAa5qhxFwC1Y55VH
         CgjVevBvRVWbNWLqOjYxImTRvFUy/wz1UQgYQc1ILbnIgdsiz3RVyWDaKzPSDVqgy9Gh
         M2FOrBcKglgP926psoGXFzTjrBpIijdFE1/TrTLdb36kBZiiVbDKEBB3GfMkMuB+WScN
         OLJw==
X-Forwarded-Encrypted: i=1; AJvYcCWpw0fyntA7kDHOI4aQrDN4/H0c294nIlkNExYiGerHgHLH6oNpGq7I5UHnOwKTVzEUMh36GRdw+H6RjH8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxhrHefgVs5lyhETOURcXwU3n34xbqa7Lp9KIrTPEHVjY5TbWYa
	vE6ZNBJHW9Ph2e4Zx2leN0wTjXLbDdvUQB0dHNaH7J6AsDyF+MhHrUJhf0uFcfY=
X-Google-Smtp-Source: AGHT+IE7iBIF/ncsUM+UTT7p6QlENkfnsLUglL71vzMDiTXQo3W/0gxhDidIM3IPRiHs8W/EU5lCPQ==
X-Received: by 2002:a17:902:ce83:b0:1fd:92a7:6ccc with SMTP id d9443c01a7336-204f9ba22b4mr11347335ad.30.1724824169192;
        Tue, 27 Aug 2024 22:49:29 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:28 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:07 -0700
Subject: [PATCH 01/16] mm: Add MAP_BELOW_HINT
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-patches-below_hint_mmap-v1-1-46ff2eb9022d@rivosinc.com>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
In-Reply-To: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Shuah Khan <shuah@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1656; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=tmMz4K99F0U2eFjTmXZPsRyQ5BJlKhVYtlPfqgJsjxI=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XbFSzP1yPpXBlYea467kRPvaspyLaj1+ty58k+rfy
 b+vtHB1lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMBGZFoa/UreElT5ecG2dxnH1
 4+SJG05OW30u9uBl4X2J5vXXMs59v8LIcOvZs96dRZxGwS//rJlxOfEru+W5B7X39RYcjRI4YV7
 3gA8A
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Some applications rely on placing data in free bits addresses allocated
by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
address returned by mmap to be less than the maximum address space,
unless the hint address is greater than this value.

To make this behavior explicit and more versatile across all
architectures, define a mmap flag that allows users to define an
arbitrary upper limit on addresses returned by mmap.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 include/uapi/asm-generic/mman-common.h       | 1 +
 tools/include/uapi/asm-generic/mman-common.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
index 6ce1f1ceb432..03ac13d9aa37 100644
--- a/include/uapi/asm-generic/mman-common.h
+++ b/include/uapi/asm-generic/mman-common.h
@@ -32,6 +32,7 @@
 
 #define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
 					 * uninitialized */
+#define MAP_BELOW_HINT	  0x8000000	/* give out address that is below (inclusive) hint address */
 
 /*
  * Flags for mlock
diff --git a/tools/include/uapi/asm-generic/mman-common.h b/tools/include/uapi/asm-generic/mman-common.h
index 6ce1f1ceb432..03ac13d9aa37 100644
--- a/tools/include/uapi/asm-generic/mman-common.h
+++ b/tools/include/uapi/asm-generic/mman-common.h
@@ -32,6 +32,7 @@
 
 #define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
 					 * uninitialized */
+#define MAP_BELOW_HINT	  0x8000000	/* give out address that is below (inclusive) hint address */
 
 /*
  * Flags for mlock

-- 
2.45.0


