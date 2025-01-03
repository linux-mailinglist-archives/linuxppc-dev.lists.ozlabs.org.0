Return-Path: <linuxppc-dev+bounces-4649-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 629DEA00CD7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 18:37:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPrP85M4Vz30WP;
	Sat,  4 Jan 2025 04:37:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735925836;
	cv=none; b=e9rrI1ZDdtFH8dYay/ikgkmL54IFITVZUi1tjhVfjN4k/vDAKchBNBhuPhXAbs4LsmO5VNXZcDfSU+tf+xsCEsPUyIzpqoYAfF4v8tmLEYi7ADvdz52uo++tpDznIKZVu2A1qHUv3WX7FfCrWSFjLnot3aBDdAgE9tIumq0YA6xr2TKmfDzF3wrg7b9mmPSMnzOGLHuUIFBSui3d6mp3hcP/7fatkYI0cuFYd6IG8Wag27Feuush49OEFbm45SzxZtWxzJgPPemj1b+Hwh40Vx1RbHAKlNhRSP0+l4vPZSu8+Qmqpa5NZGc7TxPqKFYbb+iefgbWqxQGAOcKRk7EPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735925836; c=relaxed/relaxed;
	bh=Vj7WTgvEC5PveVDeiSHDuXxxtWMFpPRYSD2aMV1KZG0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VD32uR7R2zCZ3CZYK64+t1FWZOldVpixAmT9ATB5U90ALu0GCC4OV7r/TerAS/rqUDfUbxBteEw43bzH87aXYMxe1SUGUOL3bIVxzGHnzYDyyqQdjjhlY3VZCstikDM3BIrde3zS20y9uCF+9wFo4Y4tc9UOK9/NTXz2xolyi+Vltn633XUd2MY5QVjNYCqTafB1nwvN5hwWBdY3L1fzvaoW6RYa3q7KUGukPiH83Lr58LMV+xeeOQiTMKFBonwUeeeyH//pkqZT1H11lLZWiJjcfh4r6yOpFUtpQjCO5uouYgdgvREX/+3bKoQFjeDHB4NAUqXW75vx8depwi8oOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZbZ43sm8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3ryb4zwckdkowwkebobqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZbZ43sm8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3ryb4zwckdkowwkebobqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPrP63BjBz30Vm
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 04:37:14 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2166f9f52fbso268698495ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 09:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735925831; x=1736530631; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj7WTgvEC5PveVDeiSHDuXxxtWMFpPRYSD2aMV1KZG0=;
        b=ZbZ43sm8+pCYRjREKVTNjnbJRCRzlcR7vb+bRvu7YnnAwtg1ez0Dm/L1eM9jtoUEEO
         mHEfvwis1UIwfMxi5+8KtuhTCEimBuKve/TexNauijWkwJ0MZPHToel7yNSyJ6YPTJCt
         ByNUPOthFg2s5qv4pdYs+5mZGpApCNxfG6cF/h6XZDJOdAI+YKpgR+jXe17xCEreRgKs
         d3ANS2S7QyJNvV0QF5E2z1bxQ2qW6zRo2qoVg4hsl8kE8WCyeUwi6Dw5re8VWBmTyj2i
         +RqiLg0NQgThU/IkY6jOGXk1lqDYFaIdNFNbJqBfqQ9v/clkMu1R5k6Nk5SxFVKn2d1R
         NoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735925831; x=1736530631;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj7WTgvEC5PveVDeiSHDuXxxtWMFpPRYSD2aMV1KZG0=;
        b=NCuN5GY6Kk/cMaueKVxWSpDRXajkJASOw89Bz3EWwZEFzbfjeyBuXs2KyEa9HL38EW
         mUm/oM7jI2cyRARvHmj5oyBtZqbCzLuZTmtB89T66Zl8ScyNAgo0Bkb8CKapLKDm+h/q
         N3PkIB94S8/gXJ4SWYO4avsfFLclPB8T7b4JBjnWRQTgJrsy/8BxL9fVFOaFacFoF4A8
         xQR/De/EZjK5du6pcSEmn0aLDFYusuOLbzoM6ZFsi5HoBNSmf5fBOyUZWDkLJYkh6t54
         e1rdI/Lr03lPuerOQUgVMjD1oDSTs4XGg7SszQ1vp0FkNHQ3lXOnqPnAo4807jiPuZo2
         btsQ==
X-Gm-Message-State: AOJu0Yz4keDh1hyIG4gF9cfCzReElZW/NupyX6z7a7U6kpIJQzwPJHmy
	EY8RtogTJFheSIfKdDZqK7AqxQ8lr0AWO/vRort5KUnxVtaeqjvpggKOqHLmqmjioPLq0ph3QQE
	e+4UXRA==
X-Google-Smtp-Source: AGHT+IHZ0twC4s/yHrcsEsKNA74OoGtTi2fcBYqyj1/Wzm1McUmOCRGVGCQFvoFNk5F/mHcfXJF/k0Zi/OaA
X-Received: from pgbda10.prod.google.com ([2002:a05:6a02:238a:b0:7fd:558c:c660])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:dace:b0:216:3732:ade3
 with SMTP id d9443c01a7336-219e6f25fd1mr698436625ad.35.1735925831330; Fri, 03
 Jan 2025 09:37:11 -0800 (PST)
Date: Fri, 03 Jan 2025 17:37:04 +0000
In-Reply-To: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
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
Mime-Version: 1.0
References: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250103-extended-modversions-v13-4-35d87c65ee04@google.com>
Subject: [PATCH v13 4/5] Documentation/kbuild: Document storage of symbol information
From: Matthew Maurer <mmaurer@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Document where exported and imported symbols are kept, format options,
and limitations.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 Documentation/kbuild/modules.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index 101de236cd0c9abe1f5684d80063ff3f9a7fc673..a42f00d8cb90ff6ee44677c1278287ef25a84c89 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -423,6 +423,26 @@ Symbols From the Kernel (vmlinux + modules)
 	1) It lists all exported symbols from vmlinux and all modules.
 	2) It lists the CRC if CONFIG_MODVERSIONS is enabled.
 
+Version Information Formats
+---------------------------
+
+	Exported symbols have information stored in __ksymtab or __ksymtab_gpl
+	sections. Symbol names and namespaces are stored in __ksymtab_strings,
+	using a format similar to the string table used for ELF. If
+	CONFIG_MODVERSIONS is enabled, the CRCs corresponding to exported
+	symbols will be added to the __kcrctab or __kcrctab_gpl.
+
+	If CONFIG_BASIC_MODVERSIONS is enabled (default with
+	CONFIG_MODVERSIONS), imported symbols will have their symbol name and
+	CRC stored in the __versions section of the importing module. This
+	mode only supports symbols of length up to 64 bytes.
+
+	If CONFIG_EXTENDED_MODVERSIONS is enabled (required to enable both
+	CONFIG_MODVERSIONS and CONFIG_RUST at the same time), imported symbols
+	will have their symbol name recorded in the __version_ext_names
+	section as a series of concatenated, null-terminated strings. CRCs for
+	these symbols will be recorded in the __version_ext_crcs section.
+
 Symbols and External Modules
 ----------------------------
 

-- 
2.47.1.613.gc27f4b7a9f-goog


