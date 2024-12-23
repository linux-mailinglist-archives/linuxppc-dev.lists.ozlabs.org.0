Return-Path: <linuxppc-dev+bounces-4463-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1346C9FB4F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 21:14:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YH8Nl42Znz303B;
	Tue, 24 Dec 2024 07:13:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734984823;
	cv=none; b=khGju+wcFJTHN98lZEdxiCJrbzrN41uE8vKH8sqOC/6iVCN4LL49OI8hrcWlIV7L4j5QLOeYi4EFRB1bSkdQ52WkcAF2iyOMtiFvBX4lTfRFY2HshAeaLp8Ekj6qjejRQmiIdEPPxaY0sAjFkPofRU3JLV1vZXi2hreHZR80DEr6ikAMaRC9/k8zU2HpVX0CKM6kt72IfjV9e/pS8qUdq+V+hZa3LCH7neek4N4FT1eRmvYErc5KHk1VsYkuWIWVi/KHw9AGj4T0IiWm4EWkMFctbmJFKflrCQHRnlB5OPmvxeDFmkrF2Op1yku17IymlATTY8oJUR+hZc1Orp9+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734984823; c=relaxed/relaxed;
	bh=Vj7WTgvEC5PveVDeiSHDuXxxtWMFpPRYSD2aMV1KZG0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AXXzq+HXWrKGpD7SnBqBmcojHJ1KYc+0U422gtJcrsXbNe6kRzoCNCkR7toVd+fk/x4T5pivbEE4+0LOxsIC4U5N1DdYIlYXheWha5w5Wrx+OeoKvr4n0fOh7XM1wdlhztlZYcigzP+b//G0jo0N6PtWS9ElfVDx5aA9OXW/Gn14QLWJDagmDW0y9UTHqC22/wCWMBjxYfMYzd4k0DHZbKK6q3pu+IIUrmmx1WjbODCAdc5B5DdNyFGkQKLCoQ8bL8Rlq3OcLpZnt7JNEEVSYtXvsjRy29Uem2fEYyH8Tt7WlkpPvslyMuytvqFimIYNeRYdVawWRPskXIZ3DmMbGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=UGqMaL6e; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3dmrpzwckdoutthbylynvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=UGqMaL6e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3dmrpzwckdoutthbylynvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YH8Nk4Yz6z2xbL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 07:13:42 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2eedd15c29eso4105109a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 12:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734984821; x=1735589621; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj7WTgvEC5PveVDeiSHDuXxxtWMFpPRYSD2aMV1KZG0=;
        b=UGqMaL6ebWucDvMius2q1lVZg6PiPT0cdB3yR9Q0Xy5/fFzqePs02hTBD0qmtqvLro
         S25nORMOEumYNVWD6bK5LB5Lp6F9ri26/4AwSFfHRzqa71OXqVAOi8gPgBiK7RXILCkl
         UcbtpxwLL55tbwXIRKC96KkW0cLkTEDm12ao2Ge20RrPC4rYYFRIiq3foaRTAGiN86h8
         5MXWKkiThBOSbKRp3iqMEv4SkNT+Tu/bDJ32D3A1BjAkzJmeFX4ULw41frLtRMFAGLfy
         bi7ZyfgzU45YCCv4RE/9djkcb+Wf+sg+fmlpt8JYAxzyloy3JL3+W220LOSxv84iYMzI
         f2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734984821; x=1735589621;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj7WTgvEC5PveVDeiSHDuXxxtWMFpPRYSD2aMV1KZG0=;
        b=JV6rrbqw7v2oHHADpYr7fS7EpqdWfjBFgZC8aUbnOX/dNOPFtkaOuTz8+LhLOq49Xw
         uqU/oC7ORNTDXZT804ReYbqkl2wXViRMh91Ftj2R8MixKT8OVnd5ZWXvmOc1qD7jgqW2
         +sfPf01ziylXJo2uj4FEjrv3K0HBVtp7VXKYyLYgSHLhsJ+XzH0OPpNPTV5g8zhtoE9F
         zlRFqbiS81BSzIUbU4ho1wGQF6Juri6U292Bb5anJCJu3s3SycRgVkMa82KbIILLDtZl
         o9zkVQZEFE69Tpv5nBgrQZSQMGKjlLb62M1NZ4XWZ06X3OJHC7Dd40+TIh6ZTwnC8HFy
         86vw==
X-Gm-Message-State: AOJu0YxnD3R481cDICGO9G7EnnVsE2xPCXqrq7CdEPFFjD9ayWDpblnq
	Ald0LMFuHFp2YfXWVqBZYzsDI996aB+BZ0K3KQ9DPbDf0quyfXGAcMqlwcoJ9ahc+Qj/tKZ+xV1
	sGgZ1IA==
X-Google-Smtp-Source: AGHT+IGkxGexGuNywu/k0KXqccYrQixwE39uyONt1ZNVUe9UCqKHxNa+Ck9RutuRSHwTduJeB9GIxlgPxMZP
X-Received: from pgcl19.prod.google.com ([2002:a63:7013:0:b0:7fd:53c0:aac])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:670b:b0:1e0:d32f:24e2
 with SMTP id adf61e73a8af0-1e5e081edf3mr24885139637.38.1734984820770; Mon, 23
 Dec 2024 12:13:40 -0800 (PST)
Date: Mon, 23 Dec 2024 20:13:33 +0000
In-Reply-To: <20241223-extended-modversions-v11-0-221d184ee9a7@google.com>
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
References: <20241223-extended-modversions-v11-0-221d184ee9a7@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241223-extended-modversions-v11-4-221d184ee9a7@google.com>
Subject: [PATCH v11 4/5] Documentation/kbuild: Document storage of symbol information
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


