Return-Path: <linuxppc-dev+bounces-3519-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7769D6748
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2024 03:42:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XwGTZ5Mypz2yxY;
	Sat, 23 Nov 2024 13:42:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732329746;
	cv=none; b=WRTIzlbCVedsjvWQ1D62S5B0knw+CWzYrbmdk7X6CBXWLoM7/biC7pZc9K4f1l0SmmmkkJjAORGXz/4hIF71WDr41bw2qk0iMuy3ATKwwA3ko3ruTVKP3mdHt4cbRFX8Dfk42xE0sEHSySC73BpfxYMIyLbjFMYcgQjc0lN0iHuwi9q8+6LGNsLJGU43YU1BgGaCIdJYe2Dr+KHZjv5cOhniWBRyfLkm2Gr29HN0fiIoEAgWRR99kRXceaSYhF9/0F2XO65mjxoiN61SYr5GzPvl+WW6utrIcfxxrpiq+mgMBO1Pwy0oP1m6g78Unf8mmQosgZBvsQUKkr7X0N3ugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732329746; c=relaxed/relaxed;
	bh=kii4UoP5f1YtphOdoxMErS859kUztR72G7iPiVSrt7I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WdeowEyAWRSioiwBASz7YaEFwfp9CxDOgHgcAHuGjO8fbA2ifdi+fR3NGGueiHxhpgmPW5NNK9JnvAIAKO3qTg4l72mB3r6QFa/wGWxVGOiSGdztT20HR2/NsoI8hpu+x9nROEkLJCLXqw5C0LOogQ8TASJTDco5YoZA4oYBcsQn3Ock4xJp0owA0PD7TrRK3W9Pfs4X39BBieQz5Ow8s6YraTQF37rERkhbFEChWOu5asRliTRdQCA+3ZcnmHywWk74insj7j7NzfI6XHetdhCJXefTif1bctYNSgd0l2JjK72mZHH75un+ow0NwTkuitR0xQFSZQSFmUAKyx5YvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=n2BzlFap; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3d0fbzwckdnyee2mj6j8gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=n2BzlFap;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3d0fbzwckdnyee2mj6j8gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XwGTZ00nZz2yKD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2024 13:42:25 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea863ecfe9so52872047b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 18:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732329744; x=1732934544; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kii4UoP5f1YtphOdoxMErS859kUztR72G7iPiVSrt7I=;
        b=n2BzlFapSezsILzPmATAccjLcsL3To4XK0rDxMkaCV+ZHCECu1v2aGonwWvu2ADPfz
         Sy7T+sW7+qB72ZCvbhmAkoNbtzbWPj0kaGdO8QaEmE+TKZsGTZrY4EGAkvrnIkZkY/70
         HDWrXex/YrwYJwUO7AP61XLHdMI9/ISqjavFY/q/vIdL9pyC58WHSioDrfffQ6/BTtIA
         qgSt/iyplgor+cqw2nrYZ6WWY9TVfcBwmmAdDazMUA8JzbatBjRKUqIda3bj4S0RspAJ
         GN/8g43UU/qGwlOJfdp58t6xXlPL1651NuIyUpjz3iHbXufBsDKpMNVW8aasleXjGvpM
         8zRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732329744; x=1732934544;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kii4UoP5f1YtphOdoxMErS859kUztR72G7iPiVSrt7I=;
        b=R2Ge8fpeu6xzGgI+kmg0LpFLjB5CPBwvcpUz0JgAcvOP6GvkLqevhpWebiQt0SJVn8
         2I2csxSGktRe2FGxmwkOQKgKe0BU+J0HG1d92Sn5ZhFSD8z9X6HmlPWuCgWJR8+awjcP
         sYfhU0eMaQTV8SoSjNtmXTGdZWa7rlA/Qp9XHSkMA3DDIfhJnSaq1kKbVPNI/ybJJWZl
         HmpFnwM9UjcpFHGhx3V+imTe92UN6cCpt7EiTgIgs/1KnRSR0HP/7msgo9xDiuSUW+l7
         amiYIykw65QDRhMVOmSjU7h0/+YqELOC8vRqu5UvGksKYm7eqddlm9OiDvytvYai3Cve
         MsLw==
X-Gm-Message-State: AOJu0YwFh35TR+a36TmPLiK6muJMCcZk0NEWBaQ/eyl8ntuTeMArD0++
	13cbYCyUmMvxPXEP6ggT/fDuZppU0CSWhrRMR+UMSQDb5CnMNRzuZQTCVZQUxJAo3MxtvDx5M/z
	hnlLemg==
X-Google-Smtp-Source: AGHT+IG+H4NW7tyyIrvwq7W3DAn+ppP0DFvvL1CqE8PbvAp+Z5WdI4+9TjnoY/n2Aojqm2QXy8sSu+gLuVEg
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:988:b0:6e2:1b8c:39bf with SMTP id
 00721157ae682-6eee0874b31mr48797b3.2.1732329743988; Fri, 22 Nov 2024 18:42:23
 -0800 (PST)
Date: Sat, 23 Nov 2024 02:42:18 +0000
In-Reply-To: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
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
References: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241123-extended-modversions-v10-4-0fa754ffdee3@google.com>
Subject: [PATCH v10 4/5] Documentation/kbuild: Document storage of symbol information
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


