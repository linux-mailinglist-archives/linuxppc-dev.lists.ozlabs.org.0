Return-Path: <linuxppc-dev+bounces-3511-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D809D66C4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2024 01:19:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XwCJc1l0Zz2yZ4;
	Sat, 23 Nov 2024 11:19:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732321168;
	cv=none; b=H/Nr0t5dlIPdAtgbvA6NTI5dQIfgl4POlyJ197HAn21MqqwQmIWF8mLf4WNIDNGajS5GZmLsGBZ5DaF8HRQ/kmb73skEpropKevdy/1YZaGJKm+bsBlnyXxXuSdk2z/UbIP5bN38q/CE3PsjnjfwMcD4DgNbyOM4N2P76SnfXI94/CQOLJXfYBL9YVBCydwEH4GnSm4Jp8/RpFkv1VK9H0eUZHY9oQRcwmTOIsp74gPkLJ7Obz5bxr0E3AbS1xuf9Jj7ZGGoDbbDNH3bdhUzNG0liKH9gvPWZMeJRKKB/mbpMh9WEUsKxMnk+9SFMrCxOtQMTli/fudXeGuVoCu68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732321168; c=relaxed/relaxed;
	bh=kii4UoP5f1YtphOdoxMErS859kUztR72G7iPiVSrt7I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Gl2Uen7E+3Ig1A6Xe2yqrYPlHbeL4ATR5asq9HcykD/97UdXHcpL/GEDPL3dbQ7ZTBWz9gm1pviermyYb1+nQ1SPJ0jn+sMKsiTfGtSODpGcb/EtVL5/8nT+dPPnWgXQ9g6Tsm+SIQbftQxs4Gp/Oa+HQMJBdpKaLsDHwnEJljfu5AlOFHrhDf8Vx1rQHNh6RJeKRU+B+U54/hwKrG8Yt7wyXDjZuN6A2KVylcojRF4V8fPzSXokmEIXAZXQDLxKcSPHums92Gy+qFA4vb48kqp95Bhglj9qBSSP8BWR1CYMCUBWipkjA1/PxgnG0Foh4CQsQMB+aI5ZapqdGMOKQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=x15qXyGn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3jb9bzwckdbe33rb8v8x55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=x15qXyGn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3jb9bzwckdbe33rb8v8x55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XwCJb1nGDz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2024 11:19:27 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6eeeb850458so11800517b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 16:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732321164; x=1732925964; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kii4UoP5f1YtphOdoxMErS859kUztR72G7iPiVSrt7I=;
        b=x15qXyGndCr8++C9N9iaQiGWpQm5uPb5q7HONFDdyXsomiQNxXIO1pw5UyPVplC6+v
         AZuyLBAyZKQYY73Mg/GXFJlHEg1UYBF1vjpXF2B70AYR13RP3aSfAopChDCfEL3VJxgH
         hg4W/NKYW3sdYUemh0k8hz+50SQmAZa8jbICOQ4MX5tlP3X73O4PrezJzUACxNMsPqw/
         caa6RtcVHkSXgitt5/dh5jIbyDdsj37XCemDSUL1ixwNl81T30coH90eV8d2+xQDJCH+
         pEXxcU9//jfq3TFKKbl7P3006gljw7S9xejXaDshwZpxaNM3eIvM5EilUWEnMe7Cig6R
         nmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732321164; x=1732925964;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kii4UoP5f1YtphOdoxMErS859kUztR72G7iPiVSrt7I=;
        b=GZ0uUhU/yHZfiDHIHq/Zpsie2aWCEz2vhDEpfeOAaO3juqSiDv8OPhXuCFB51T9sWq
         BFhFoKRobgaD0UQHWn8zT+9GbhyMEUUdyGHtnr+z0ARHPKl8FLsNmTQ7FBGw3lC9twm5
         wQsvQ0/KJ4EvPYhMnMMN43I+DGsovUKY2NRyWqMV9p/ubAkQCOjG0pfAQDLHRK8DZ3WU
         oapW6RjN1FuuDfwVnGZeVFQrtMjUt9w7vi63BdgTso7ezi+Ij2n7WkOqpCBiKtKPtVY8
         gjSArU3H2cFFVLsF9pAo+5GNkZLrHIaxj9NZwe1FPkp3C1aLuITVZnSASMqNIrtUcjGb
         FChg==
X-Gm-Message-State: AOJu0YwmidHvDTZXNE3T5EcuFS8GtHeMeuN8dJ4T91Hh6JP4Mtx0LVpB
	ThUQDtjkfrVM29IiFxSSQowGafxNCLTGArKFrujUbhOA0YE9R+fhP8ImHRHWDcYzAcsky4xxms5
	gjv4B6Q==
X-Google-Smtp-Source: AGHT+IGb1VGXLdwbi1WBz8V7ppcCesD4JE4rdrLccFX+ao0B2BRxHgYqoB65ydiX9EwBAmycjRCA8My2MJ53
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:408a:b0:6ee:93e6:caac with SMTP
 id 00721157ae682-6eee0b7a491mr26577b3.7.1732321164359; Fri, 22 Nov 2024
 16:19:24 -0800 (PST)
Date: Sat, 23 Nov 2024 00:19:01 +0000
In-Reply-To: <20241123-extended-modversions-v9-0-bc0403f054bf@google.com>
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
References: <20241123-extended-modversions-v9-0-bc0403f054bf@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241123-extended-modversions-v9-4-bc0403f054bf@google.com>
Subject: [PATCH v9 4/5] Documentation/kbuild: Document storage of symbol information
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
index 101de236cd0c9abe1f5684d80063ff3f9a7fc673..c32e3ed67cd26070f6929f6ad98c4308a1ab71f8 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -423,6 +423,26 @@ Symbols From the Kernel (vmlinux + modules)
 	1) It lists all exported symbols from vmlinux and all modules.
 	2) It lists the CRC if CONFIG_MODVERSIONS is enabled.
 
+Version Information Formats
+---------------------------
+
+	Exported symbols have information stored in __ksymtab or __ksymtab_gpl
+	sections. Symbol names and namespaces are stored in __kstrtab and
+	__kstrtabns respectively, using a format similar to the string table
+	used for ELF. If CONFIG_MODVERSIONS is enabled, the CRCs corresponding
+	to exported symbols will be added to the __kcrctab or __kcrctab_gpl.
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
2.47.0.371.ga323438b13-goog


