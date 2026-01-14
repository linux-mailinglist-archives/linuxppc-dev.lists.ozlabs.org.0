Return-Path: <linuxppc-dev+bounces-15740-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8705FD201A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 17:12:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drrjD5M7Wz2xT6;
	Thu, 15 Jan 2026 03:12:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768407120;
	cv=none; b=eE0fofm5QXQK9MAMPP19Ii6lEG67SVMoT7twjyrw/7g6gMLWmHIvM1rAitLgDUi+hL7MKDbHGeAeEyoL84F4qbqJc2mBdLEvleKqPubNERoV0SdXFAZemEJFxoJIPJmtZcUPXME4RulHh2aK4dT4t268r0PYT+Q59H++Ngh3NhenFH53B+ZKAHtxsyyd8PiRl5ZGJ+tzzqXlVWANAvyQH0w7ckEreFB3xMEJmybelrgPisQXUi+F3COJFlgBeJcMX5nTG1W8zwt5jloa2zl40lshBU2JRQzYhl/AmN0eMKH4BZq+vovEGcIFgJX4J7+uukAjvUuXwKJ7Yft04SRC3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768407120; c=relaxed/relaxed;
	bh=q0iijEVWpOa1CaX56XQgSGm1Vv5Wfm3x/KlfzRCaK68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b220GzSuMe+z2w+L8Oeh2q+eDeLy8YkMlJe4AJDJ3wfeWqVFn0UV2KViUsjLsIDRZT43FMf9mLBkhXILC8joldcPkW+6k6WaVeJPq6w/uSY+juYJcMmzH1b9MZ46IlGUClfoHVyotlWzbvNnKW9Z/vVwFHL+AMqrW9eH1StMSQC5234eqa7n8w5kJNke10sQEY5Q9soJOiYGttmvvGpE3IQ2hWtYlCtcZe+0kqTL2C+Pq8IEvIH2bJD+1OlRqmGFJiLc8OKd/7th8jqxwwV01SL021ECRjl2otxC+g7dca5pi6lSXvdkrpGaTdGtNg3tw3WFybqPmH3fytTqYMOrzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P/LskQK+; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P/LskQK+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drrjC6c6Lz2xNT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 03:11:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6B744424A
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 16:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B450C2BC87
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 16:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768407117;
	bh=CjGcWeIbnw3YM0US5tjsJUz4YE5ESf3a+4znRW4sVZg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P/LskQK+X/eiTfNzo6K6Dh3/j7095bmGljh+7hurouMk8iTdWkHHPf5z9Gnf7RQjl
	 /48oxvCUnpEHezC7Mc5Bo+Sjr0dVUI56U+3kntIy4Rib62e20RFDlJTBfgVrjCRrYB
	 YwjwfkoiEfrqSVsNBDNwPuRfz+bGDQ2o59sCyx2Gz05ikwOVhSAQ3/H4ldbNI52PgC
	 WQz0N7idgLULimc7Ux936swpGSpwEyGkQK5QlFynKNmZ8l8X2uY/DXRLSLaMgKWBhh
	 KEJbjy1ZlBmFMAvYZGzfe2vsU1k06WjC4ERZ4ujX8N7ajjDRKvinI2cIuVPDZJzoTC
	 3itB94CuLQHYg==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-65cfb4beabcso5531756eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 08:11:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUR/KkkodEP8z9Rri2cGyOFP9Q1DxZAh1uiJmqrAaSMxjeutT+YYU6EW+4sxAfnuUT8MKc09S2biaE/JfM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzpp4LkmaqQn4bwcxnK2PpbHsLzdEh0LbgUBu7XSR1cuYlNhCUm
	rsTcKPe8DbLvQdV+z65bYdAaSAHijUm7b8e0dIwMu2b13qDgMcya/mtiYrab1beWuxqdS6j3dgQ
	2vhCm1vwhBg9Tm02W3yaqOqmb7ZHkLgg=
X-Received: by 2002:a05:6820:1611:b0:65f:6c0f:fb25 with SMTP id
 006d021491bc7-6610045c234mr2240815eaf.0.1768407116460; Wed, 14 Jan 2026
 08:11:56 -0800 (PST)
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
References: <20260114101543.85926-1-fabio.m.de.francesco@linux.intel.com>
In-Reply-To: <20260114101543.85926-1-fabio.m.de.francesco@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 14 Jan 2026 17:11:45 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g80j4iFMXYDKek8VBYsa0g35avvw+UK6RxutcmxSX+WA@mail.gmail.com>
X-Gm-Features: AZwV_QhOS444bZTklJpN97U-FoqtsZx0kcscnMnkoO7PBldoBVm0mhtxLbbJV4Y
Message-ID: <CAJZ5v0g80j4iFMXYDKek8VBYsa0g35avvw+UK6RxutcmxSX+WA@mail.gmail.com>
Subject: Re: [PATCH 0/5 v9] Make ELOG and GHES log and trace consistently
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Cc: linux-cxl@vger.kernel.org, Rafael J Wysocki <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	Hanjun Guo <guohanjun@huawei.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Shuai Xue <xueshuai@linux.alibaba.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 11:15=E2=80=AFAM Fabio M. De Francesco
<fabio.m.de.francesco@linux.intel.com> wrote:
>
> When Firmware First is enabled, BIOS handles errors first and then it
> makes them available to the kernel via the Common Platform Error Record
> (CPER) sections (UEFI 2.10 Appendix N). Linux parses the CPER sections
> via one of two similar paths, either ELOG or GHES.
>
> Currently, ELOG and GHES show some inconsistencies in how they print to
> the kernel log as well as in how they report to userspace via trace
> events.
>
> Make the two mentioned paths act similarly for what relates to logging
> and tracing.
>
> --- Changes for v9 ---
>
>         - #include linux/printk.h for pr_*_ratelimited() in ghes_helpers.=
c
>           Reported-by: kernel test robot <lkp@intel.com>
>           Closes: https://lore.kernel.org/oe-kbuild-all/202512240711.Iv57=
ik8I-lkp@intel.com/
>
> --- Changes for v8 ---
>
>         - Don't make GHES dependend on PCI and drop patch 3/6 -
>           incidentally it works out the issues that the KTR found with v7
>           (Jonathan, Hanjun)
>         - Don't have EXTLOG dependend on CXL_BUS and move the new helpers
>           to a new file, then link it to ghes.c only if ACPI_APEI_PCIEAER=
 is
>           selected. Placing the new helpers to their own translation unit=
 seems
>           be a more flexible and safer solution than messing with Kconfig=
 or
>           with conditional compilation macros within ghes.c. PCI may not =
be an
>           option in embedded platforms
>
> --- Changes for v7 ---
>
>         - Reference UEFI v2.11 (Sathyanarayanan)
>         - Substitute !(A || B) with !(A && B) in an 'if' statement to
>           convey the intended logic (Jonathan)
>         - Make ACPI_APEI_GHES explicitly select PCIAER because the needed
>           ACPI_APEI_PCIEAER doesn't recursively select that prerequisite =
(Jonathan)
>           Reported-by: kernel test robot <lkp@intel.com>
>           Closes: https://lore.kernel.org/oe-kbuild-all/202510232204.7aYB=
pl7h-lkp@intel.com/
>           Closes: https://lore.kernel.org/oe-kbuild-all/202510232204.XIXg=
PWD7-lkp@intel.com/
>         - Don't add the unnecessary cxl_cper_ras_handle_prot_err() wrappe=
r
>           for cxl_cper_handle_prot_err() (Jonathan)
>         - Make ACPI_EXTLOG explicitly select PCIAER && ACPI_APEI because
>           the needed ACPI_APEI_PCIEAER doesn't recursively select the
>           prerequisites
>         - Make ACPI_EXTLOG select CXL_BUS
>
> --- Changes for v6 ---
>
>         - Rename the helper that copies the CPER CXL protocol error
>           information to work struct (Dave)
>         - Return -EOPNOTSUPP (instead of -EINVAL) from the two helpers if
>           ACPI_APEI_PCIEAER is not defined (Dave)
>
> --- Changes for v5 ---
>
>         - Add 3/6 to select ACPI_APEI_PCIEAER for GHES
>         - Add 4,5/6 to move common code between ELOG and GHES out to new
>           helpers use them in 6/6 (Jonathan).
>
> --- Changes for v4 ---
>
>         - Re-base on top of recent changes of the AER error logging and
>           drop obsoleted 2/4 (Sathyanarayanan)
>         - Log with pr_warn_ratelimited() (Dave)
>         - Collect tags
> --- Changes for v3 ---
>
>     1/4, 2/4:
>         - collect tags; no functional changes
>     3/4:
>         - Invert logic of checks (Yazen)
>         - Select CONFIG_ACPI_APEI_PCIEAER (Yazen)
>     4/4:
>         - Check serial number only for CXL devices (Yazen)
>         - Replace "invalid" with "unknown" in the output of a pr_err()
>           (Yazen)
>
> --- Changes for v2 ---
>
>         - Add a patch to pass log levels to pci_print_aer() (Dan)
>         - Add a patch to trace CPER CXL Protocol Errors
>         - Rework commit messages (Dan)
>         - Use log_non_standard_event() (Bjorn)
>
> --- Changes for v1 ---
>
>         - Drop the RFC prefix and restart from PATCH v1
>         - Drop patch 3/3 because a discussion on it has not yet been
>           settled
>         - Drop namespacing in export of pci_print_aer while() (Dan)
>         - Don't use '#ifdef' in *.c files (Dan)
>         - Drop a reference on pdev after operation is complete (Dan)
>         - Don't log an error message if pdev is NULL (Dan)
>
> Fabio M. De Francesco (5):
>   ACPI: extlog: Trace CPER Non-standard Section Body
>   ACPI: extlog: Trace CPER PCI Express Error Section
>   acpi/ghes: Add helper for CPER CXL protocol errors checks
>   acpi/ghes: Add helper to copy CPER CXL protocol error info to work
>     struct
>   ACPI: extlog: Trace CPER CXL Protocol Error Section
>
>  drivers/acpi/Kconfig             |  2 +
>  drivers/acpi/acpi_extlog.c       | 64 +++++++++++++++++++++++++++++++
>  drivers/acpi/apei/Makefile       |  1 +
>  drivers/acpi/apei/ghes.c         | 40 +------------------
>  drivers/acpi/apei/ghes_helpers.c | 66 ++++++++++++++++++++++++++++++++
>  drivers/cxl/core/ras.c           |  3 +-
>  drivers/pci/pcie/aer.c           |  2 +-
>  include/cxl/event.h              | 22 +++++++++++
>  8 files changed, 160 insertions(+), 40 deletions(-)
>  create mode 100644 drivers/acpi/apei/ghes_helpers.c
>
>
> base-commit: b71e635feefc8
> --

Applied as 6.20 material, thanks!

