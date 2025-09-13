Return-Path: <linuxppc-dev+bounces-12113-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D64B55DFA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:15:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxJP6v4Jz3cYr;
	Sat, 13 Sep 2025 13:15:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757725578;
	cv=none; b=QDYQI1sNk7KTMxQz7+Qu7fnkKSlxEqwQrHqKfqzSIbg6EDgL5qha+17KSKA+Br6boJxPAdVPn/RDpVDBx/jvtsh5TwzIx7Tx8HUOzi8aUzyFQF1JuaUyh3ILdPRlyl8kdl+1OpS1u/ZgZnWQiBIrnZkGRzQahkh71pMly6MpysaxUXxqqi3sCnaohjUE60p2/YhO59G5EGr1G4AmGZe+U/NOJBIQTlwHRiffivjtGyJe+oYBK232tprurJiPuERzRYDl67t/qYUWw2OwxVla9zq/6b2funCQ3BF4CJJKtf+499gGIK0HCOPcirbNZywDlGHUBoIvogUg9MLhvHGvhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757725578; c=relaxed/relaxed;
	bh=hRKyxFwRI2Qz0k3ZoQpZ3VLrtZiB303jicB3H5rLu1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gu++H0fh8c1OcpsZnhSYH0xpUp435F7I4M1qTUGZd/88NszKhjx+Q6o06NxheRsZA/AzGERfwqVCPqw/P954Hn+ROqF6zF7/lAUNWQkq2AHdKtNbCRIWXh9uLT/g6pfVMLRCVpyCtl8f3UFvJqt5rjUSX6vuVr0BaroxdR8qSS4oIU8zPScRnO/4vciIPf1qd1Aaj9EVb4RygmFYzt8DbfxE4OCX9ywCtGRYZsp5j39s7vm3X96+PVjQkhRvRcCHNTT1JfzoYEuCY5sRkvSdP8r2iDdRftic6dhC++6r3GI/AwrqjJ4MYnDP1nXW+QGA1RIRuqvDGxlb1C/9K967CQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IcN4R6ug; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IcN4R6ug;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtQx552pz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 11:06:17 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-625e1dfc43dso4278902a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725575; x=1758330375; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRKyxFwRI2Qz0k3ZoQpZ3VLrtZiB303jicB3H5rLu1o=;
        b=IcN4R6ugNqdOd5+/WhDSZu3Bzv3Bbh4LT1gdv7wDTvH7V5Vl/kEXmicLrIjEQ9s2KK
         caIQo7JhSBVMDCo9asKPovHD0os2yKUDYRcKH5Rg7eJVSHdQ1uu55cMyK9KNEtEPt+Xj
         yEEzZRmGssxcs0wgiCO9xB1bXJm70UXs7vFpudzNGyTSk/dmbfjnyUb7KbCdxSGADL+L
         b5S9qMToqUU3jrZtL7vIvCGfqKJt9SKF+CWre1opabkZGcaVHz6b7mvOHSP/t69k72l+
         5AaX4ACpilEXWmDnbdnKc/kbvU2lsadu9kufTIkF+KK4R9FmXKoW8x1FO+iPHVfew/bA
         JbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725575; x=1758330375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRKyxFwRI2Qz0k3ZoQpZ3VLrtZiB303jicB3H5rLu1o=;
        b=uh11dRHSxhBOwP/aKANaMBlZYGYp0cn0WgyAgB+0QOkP5gOMXQyYZM7Frb/Ee9Oy6q
         +GnAR1iQMBxMzO6RNgmymNu6h0j74ePEhekTdobIS5sOcWsIAnNQ9QY63G13xNert/Tg
         t27njlTE0BuS0OrIPH82E3rQ2w9OlHAyR1buTvb4GwpwnKyS2E0seIi9iFHOa+bDXaQA
         S/nGtlOA523adtEQlc3GlLgCoMLvjrLIEsx1HmJad+XPJZe3u/KAnLEDFkaKq7P/+ZSR
         dHACBOQJbFoutbJAHo54iZUETx3E0vABnF6Cl4H6qNBfHizYSR0HLsbuittr61yXdxSi
         vUMw==
X-Forwarded-Encrypted: i=1; AJvYcCWmd7m2o00caUPIgLp0EsmT07axQp5JuA++SRSZz1uDBHdBTEEczLtesEx951wjkVc2tqrS0vQ809ScWz0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwyTJvyR86Lu87RZZ32vjsedD4m7CNrKgv+H+xETu27rlgnC9A3
	7jaCeFTSsOB9CR65MaLF1foydvqBibgl2y9M1EMe+Nl0+jtQsE+aymMO
X-Gm-Gg: ASbGnct2T+kPRlImlJkFnGVYDFPGPMeaUn53VH1Hsu3liOfESa8Wynj+bSjKQdKJv6A
	XjHHEDlpGxdu+QlWfU/9XuKNynZaaqni9YBEVKgg7c2YYNwIpnKHshMB5EQ4J9Oa9KVWw89CsgH
	I0CQ3POwdlwJZ62FVwS5P8uSPrG8a9udTuCAhPG4rs/b2UHsvUpsqiUvlMlB0JMezFj1fjR3Imj
	kpaYxsNJR4HXmH36YUqPp3jDlNxtzzmN+yTVr5G+IJZ+Y5OQrFIf2zRCESilST+E4uPvkEMWkP4
	bNw3dFbY9XrYfkPMp+SmYKJrRzgcqSMVqFUF9mSS6exbem6niQGTi0cMIIxlpqweh0bQdSj8Lj5
	116WgSYaIsWgAfO0z9v6BThHad4B1LQ==
X-Google-Smtp-Source: AGHT+IFUls6LXsrCLze7uCxm9gIrKR+0qjIy+VauG9zkpfPwn7RwHzjJtZF9/Fq3L/RMfRZn925KxQ==
X-Received: by 2002:a17:907:c09:b0:b04:35c3:40b3 with SMTP id a640c23a62f3a-b07c384b024mr492655366b.15.1757725574734;
        Fri, 12 Sep 2025 18:06:14 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07d9e18c24sm112553466b.61.2025.09.12.18.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:06:14 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 24/62] init: remove wrong comment
Date: Sat, 13 Sep 2025 00:38:03 +0000
Message-ID: <20250913003842.41944-25-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This comment is wrong. free_initrd_mem may be called
with crashk_end and initrd_end as arguments

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 include/linux/initrd.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index e49c7166dbb3..4080ba82d4c9 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -6,7 +6,6 @@
 /* 1 if it is not an error if initrd_start < memory_start */
 extern int initrd_below_start_ok;
 
-/* free_initrd_mem always gets called with the next two as arguments.. */
 extern unsigned long initrd_start, initrd_end;
 extern void free_initrd_mem(unsigned long, unsigned long);
 
-- 
2.47.2


