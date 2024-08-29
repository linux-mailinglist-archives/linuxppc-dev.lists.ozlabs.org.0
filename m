Return-Path: <linuxppc-dev+bounces-724-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C33AB963C74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 09:16:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvXdR394pz2ysh;
	Thu, 29 Aug 2024 17:16:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724915787;
	cv=none; b=nkEN/QOLMs3+8+cYnl9QRAFUseWvETeXRL7KN8jRLBzYObY1rB0la6T/aQYl7yCMpdAKhji8NDG+AXBJHlGLbmHAUUR5Z8tUS4Mo8EFUJHT0DJ04ZnA5JeJo1GmIADS24vLACfABv6hovXJNbmeRqMuS/Z3ci51arsAqZ3Jm0N6kw9fyKbV9MWedOEB6obuO7ncYVkbrXquckprrIJHrLSKSYeYD3NLErCplT5VGIm9ZeGaClZgSEWE1uHz5Vg7Hb3YVBRRwvGgrvEX5cdWFtqwH5k6lSFhlUtMhxjeYN1V/xECc/UDcuu8PG6JIsfOr3dKbffn+pw4bHTDJgG6X8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724915787; c=relaxed/relaxed;
	bh=eRZz0v4roamBPZuEY8lRo6reatKDFS+11+O4EIK+5eU=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=aANleNjL5F2l23xh2QF/306ajB+Y0VNycnDIepsl9Xl40RjwN44kJXKpn4LkatUeV4sLpUKte0X7gG8IVBy5Q8mw206MuAKL0gWwO2+LhfRkwsgIo5abHrcWrghTBC3xHehQ6GOwcd79QevGbZx6c2snOtbvdaKQ8LiAAS1sKLvA27Lb5dqDGuWNb/ShHom8E3vRQFgxt2CR+QmzWpQVGBBJ56MdD8ZIUQGQrBypq3sLCJ/4OxjWYArlHuo+VtumELQma7119plj+d7/V62W2K61uZ4gt915UyMh/5HHpXP7aFdwsp9JE7+DVrPDzcBu6JxWscRxciHwryE5BHOsKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WKJ9GDrV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WKJ9GDrV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvXdQ4s0Hz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 17:16:26 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71423704ef3so259604b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 00:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724915783; x=1725520583; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRZz0v4roamBPZuEY8lRo6reatKDFS+11+O4EIK+5eU=;
        b=WKJ9GDrVvIJa8A7GtByJz2VgYL57aMXxAkE1BIjCxwqqpeI5TZZPOhWbQ/Za0vScLq
         O3NlGudOYOJ24Xq2MYR3/xFHfRbIwoFUIb8aJAD1rR2wF2X+q+DLX9aUNMvVNdSN2GBW
         WwX884ACkNXz9w0sdleIZUos20yeuzaTBU7Dmm8inxhYCpOj7nfeEYuB8Z73xj/lUpEM
         6PS/lQyyU6nTa+2vCMioZHRWEnWS3zL1Hq2WidLf8i/m0sHPgiHyqa2fcgSyurKVc2+t
         c/AVvuG4eRERS1Tw2tdp9is6qK14/XBe+S6p4Fz48wdBuS+VPoPGnfzFihDUty18PK1T
         pnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724915783; x=1725520583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRZz0v4roamBPZuEY8lRo6reatKDFS+11+O4EIK+5eU=;
        b=oFrsVNSfrd0I5F+Jq7i73zP/X+KWhCtJppgfunxk6AIucXd/6LhA1UUdWr0VLhvhkX
         O/pdT9rH/d1maBiawIHW6lCytTjcb2beWqcD1VMi2tEpLbqKKs9brpHAUrvrVyO2sYW4
         dpiwp4pxvl54uE8cej/6efQ+uB+zFs+5nt0CRpkBIXIgcJCx4lnO+rQ9tRb6Gb9OkG1s
         mvS15oNmEua/74xFj7x1a4BsdZK0zGX+iP1lt9ewpHgtcDXc+rOfu4nrVP5hJ7ZLE3sW
         hRIXAgGp9CAocTG7PqEsD+oka99BYoel5AKJaj4TwZHskI+S98rnld3szRzXj47vKQF7
         c+dg==
X-Forwarded-Encrypted: i=1; AJvYcCUzOclJGvPDuWCzU7dYr1LjtZCOGz+JoK5lZWd3WqVdg2pZuA0d1TkFEEqCh7n6o9rJaj5HnD2wM4DCiy0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzmBs8msAT30jXPMnDpc88zIXfc2MgeliGXS3sFYjzaAnm6AUAC
	LSP5mIHyUzci8aOEfzbSRe0a5H4z94jMW1DuqveY4Bfbf97oE3vDNmEAqBqfLsk=
X-Google-Smtp-Source: AGHT+IESlo3+HNMz8Vyf9gnK2kr34iORO0t8ZckMgQQJOrmm4rJ0EngcQswLax6rU2xQbGZPh7/0eg==
X-Received: by 2002:a05:6a20:6f88:b0:1c4:7dbc:d21a with SMTP id adf61e73a8af0-1cce104dce4mr1887803637.32.1724915783368;
        Thu, 29 Aug 2024 00:16:23 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9bef08sm581976a12.58.2024.08.29.00.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 00:16:22 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 29 Aug 2024 00:16:00 -0700
Subject: [PATCH RFC v2 3/4] mm: Support MAP_BELOW_HINT in
 vm_unmapped_area()
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
Message-Id: <20240829-patches-below_hint_mmap-v2-3-638a28d9eae0@rivosinc.com>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
In-Reply-To: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=991; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=awlA0FQ8vwXq3Nn6i3BedGsUxTSd4n1W8+rk6Ti/shY=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9oFBUtNRaX7W4IPbnI+Ms3hivNnCcHEiLSn/wN2Mfr8Y
 bUwSP3TUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwES8tjMyvNn0V3yhfGTAnNVL
 rI6JakxSy1zhtaNTK7Nm7eOzb9jnWDIy3NjktX5Wn9/XRXLVu44d2/Xri3n+zz1GZcf0P1w88Pv
 nEX4A
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

To ensure that all memory allocations comply with the new MAP_BELOW_HINT
flag, set the high_limit in vm_unmapped_area() to the hint address +
length at most. All callers to this function set the high_limit to
something reasonable, usually with space for a random offset and a gap
for the stack. To respect the provided high_limit, take the minimum of
hint+length and the given high_limit.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 mm/mmap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index 34ba0db23678..459ad380c673 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1766,6 +1766,9 @@ unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
 {
 	unsigned long addr;
 
+	if (info->hint != 0 && info->mmap_flags & MAP_BELOW_HINT)
+		info->high_limit = MIN(info->high_limit, info->hint + info->length);
+
 	if (info->flags & VM_UNMAPPED_AREA_TOPDOWN)
 		addr = unmapped_area_topdown(info);
 	else

-- 
2.45.0


