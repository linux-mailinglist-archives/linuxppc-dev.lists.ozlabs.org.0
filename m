Return-Path: <linuxppc-dev+bounces-4539-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F8F9FEB58
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 23:30:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YMW5X6b5Nz2yvh;
	Tue, 31 Dec 2024 09:30:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735597840;
	cv=none; b=aau4C0h7dd7EUGlLjC0EHszxn6FNk0KPXWSZ18MZqQ5qAjF7Sek3eR2a3DfCWRROgGIlUAMrqgs5YmbgbBmY5y2slFfvD5nHIf5EM5t+AewbYYraEdEoNTTZ/Yc7+7Flj0qzS+uX4+6VyvkQy9ygwlaiH+HM1xrZs60NnnCSMBnpHAFfXjr5wTBGQYNL3IXb26M0krY312QPS1ayoB5d3WpKWEJ9HHXTTO9HUvA9TXam6aJfrwNCsyyiM8b9KchLXAYZloqCHM6xHe3yKdb8zy+MEelxNgTNM2/aZIKASY6tI47NhTtKAp7rxtRKWLV2wdINyjLIY6l++4TVCc1bWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735597840; c=relaxed/relaxed;
	bh=Vj7WTgvEC5PveVDeiSHDuXxxtWMFpPRYSD2aMV1KZG0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XrYXNk1nn59lMwE2lUX80+NkwoL/cbxLoAE+ztJUoe6F9cio++gaSpuS5NK4pU3hiVG8KOeLDSXNT4CyryxlUOiQ9e9sV6z2qALrrr1ekyzeSh4JwS+jNXvNjL7g/HTmmAPw3tDjqt9UKOLW74c2qp5llJIj41l8umwMji6MQ+t1b5ZLGH3KsMCYdS2ge8ihdvzjNw+ZFjbcpZTno8M+AN8tVN3axJKxKFpwwqLHS1dnJQZ6iKofzEKk+JR2u+60rlVCTId9IvZMbsZFJMdRiQp+LConc577GmH/qLUDNaPGgv2qFKNkqKmxoP2AHs2Z32h6JdK73jJKvBJwStl2hA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=G6ZkRW7r; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3db9zzwckdfkdd1li5i7ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=G6ZkRW7r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3db9zzwckdfkdd1li5i7ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YMW5V4Sv4z2yQJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Dec 2024 09:30:38 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so13000886a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 14:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735597837; x=1736202637; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj7WTgvEC5PveVDeiSHDuXxxtWMFpPRYSD2aMV1KZG0=;
        b=G6ZkRW7rjcrgQWTwv741aqBQ8yRUbiM9SkX5VJK/UMUHnijpmFU+zgkvCr7P2MXUc1
         YUQlrXu0yQYbXNVHGwYGrmwIWUn0VIJiklvivqSv6bgQpDBt3Ic7Xb29eeI80OPk2LCw
         uyj0HbOf3+JlgssWs2xasR71beb3odocWy9NHoA/fWjkzz8xpBTJZPAFGra7C5JXPxP9
         Mcdn3p5O9PUIk4G3VZ7h+vSlaBnTyr8wqwz3f6sP2E28Eoao5lHz8Mi7zg3eMFFhsNff
         k5PR34QrSb8g4ePyNlgSRrclMdLd7vEXCvvpoXuLB41RERP/BIRAiNfD82oY9ledbh+e
         DMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735597837; x=1736202637;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj7WTgvEC5PveVDeiSHDuXxxtWMFpPRYSD2aMV1KZG0=;
        b=rr3aAtureRxsVhq3uAKnOWEOtr+rl50fYR7lJ0Xt6iBg5AfLuzPr8EkLkLpHDlZk10
         nf8AABVvMVwlZMrlPjnuBrGet475ZyouvfLzdWIxuTbgWTjxS0b0vvPKBHH47MQjk1Sw
         pwgkUV65vulCq/rP70Kt+mhXsLwgJ3+dO9KUtcy1smtUbHC04o/FmEbH7CrXerqkTzih
         zBpBnkON0IwKhaNOjhTuMVnmJBFPxw1hQdqlLOyT5MXE0UYR9tXyy7cQ60j3b9yvWPuC
         ed5y07cPMI5mXO6YB4tnZTmUrB7NcDtY2mOcOcYBNwzPCu5rB1srqUwZnmKYnb6++oDc
         fFcw==
X-Gm-Message-State: AOJu0YzuoJ3KUNqUcjXf1WiOYcRx6v9ko4biTeEZ1VotIf/OKv+mKJl/
	+hDM+iQTR+t1cJjrBFhFhM7ts/Hu0WLTkK0d/W9/8xsnryOSIO3t4349/1anELAGWdLUCGAWR2b
	M0Vsf8w==
X-Google-Smtp-Source: AGHT+IH7lc1nyh322CeIPNFTmhSrY+WwroJDc14f4njjj+YFTtVUIi6WYQ2iNzBtq2Ci0HPEKUE6eWlngS24
X-Received: from pjtu11.prod.google.com ([2002:a17:90a:c88b:b0:2f2:e933:8ba6])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d09:b0:2ea:61de:38f7
 with SMTP id 98e67ed59e1d1-2f452ee6340mr56277909a91.29.1735597836920; Mon, 30
 Dec 2024 14:30:36 -0800 (PST)
Date: Mon, 30 Dec 2024 22:30:31 +0000
In-Reply-To: <20241230-extended-modversions-v12-0-296a6a0f5151@google.com>
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
References: <20241230-extended-modversions-v12-0-296a6a0f5151@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241230-extended-modversions-v12-4-296a6a0f5151@google.com>
Subject: [PATCH v12 4/5] Documentation/kbuild: Document storage of symbol information
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


