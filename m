Return-Path: <linuxppc-dev+bounces-13351-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CEEC11321
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 20:41:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwP4x4fwXz2yyx;
	Tue, 28 Oct 2025 06:41:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761594065;
	cv=none; b=OW6jj37lSwuQ/DMgpy8hu19RB0429JVG9D18eGrZR7pBFXaNUgVl5eyYMt9FeeQUMEgdtO2GkBe23iEi6gz5R4omPqc4El3WGSfBwEVfjSO1ltomGdqNT25ugFstecBvePJU9roqQMlV/ongBDO28BkZg2GW1wsaoy71ko0G8y4ZUgH6j63ySgqUY7XAlVpleLjOocLbwuHa/6tHh6aPUmCdd4yF5k3qL0x0JC/RxZqq1KrUAptOnfm0K4pCgwumPk0xN/0qG/w45TcIO5ApJFN3fp3TR4WctsL76RrJXo9TEyOwj4+o+/pL/9nJXTpD3JVcJq+YJ41MgnqfiYUp7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761594065; c=relaxed/relaxed;
	bh=kJymAyuSxiwLUZBRkZ3seoYcxkCvV/OM7JzxkrrDiNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4O+/gELTSV7MLVkCjBXXK6aaUhjru6whZfVETeZ+kaF11zfRioiQ7XI+J89EM+qQZd1Po5PC9wv9JxJpGeHBJPM8dxGXhSftVSV4KGQLVphXY5C9Ko+/wVAmNa2JVM7OOWFxz44kcn63YBWLVm6AzizSzyXY2qJ5ArdI8moHY1hP5SFz43o6zLimNmFVHZdp5tsIfgGZMFNYw73hbk18sI9K0MFIkVpGSXJfLeKfauba4d3vGbL4MQMFgxOUOnPN48tMAVuiQ4n2aF1DspYw1V/5kOy4dnsegnF+iN3sSkbCC5VqcM39+GHFGdOmf9WQfzFKxeSkOMaFYLAkUW8lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o7AIzOWP; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o7AIzOWP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwP4w4RWxz2yhX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 06:41:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1239A48BA5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 19:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE56C116D0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 19:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761594062;
	bh=MDpco140EYHJnzIZmyl84zfrZwv8MADjK5W7/0qLrKE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o7AIzOWPKf56FcLwUzL3Nvz6/mf+gSJZpTM41Zh5hRGx8HJjPQETapS53QtptxlbD
	 Ap8CP2fFC/1V+kgIDgfodxjrd/rS5afdJvMHs56Xv1pclr40SXAbiUMpw6//oFQJMp
	 WAvi3LD7A9xlqxvJQ7w6LYxLbUrnOj92v0B6F5CxfoeSzswRRq3J58W3RkWfsseFTa
	 hlxANrj0JHYAugTKqAu0SG/ZwyyBH552bXLkcjn25WLio7iKN85XXTRMMm/BLTkvGy
	 aql6EpnsQy/m/F98BThlg6YHZHZLJBX+4M5Zd0ZWe4swuJZarQ3gQ6zgNIannuXddT
	 BSDrknRiFu2BQ==
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7c531b42dbeso1672239a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 12:41:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYE6G83lho5eJ3ECTyC1wmnd/BmVsv+T92ipEOCnmi5t+ORWj/t+WWo0QdF4pjwRYjZj4WfmY9mExspWM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzHINFlEw+LsdkCA3GU8fX25/rBqa23PXQBxeP1ftQ0b0C80gKL
	cf0kv2mzMxr758wDbPU0QKyAJcgFGcnvMns8ZM9QDhQvSgjhqB96O8ErzKoflySwCih7q137fVq
	8a2gLc2B1OCkAvUr+YHlxCH7/pKdX0Hw=
X-Google-Smtp-Source: AGHT+IEBgYaGMef3W1iGMJpqdA0ZG8CMABKhFKsCxja1XTApdIIjx+hlUQbv+lCioaXAiOzYpoDeh9fqTixQ61UktBo=
X-Received: by 2002:a05:6808:1986:b0:43f:1c5d:8db with SMTP id
 5614622812f47-44f6b9c8228mr477987b6e.6.1761594060621; Mon, 27 Oct 2025
 12:41:00 -0700 (PDT)
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
References: <20251023122612.1326748-1-fabio.m.de.francesco@linux.intel.com>
In-Reply-To: <20251023122612.1326748-1-fabio.m.de.francesco@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 27 Oct 2025 20:40:49 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0h22pPnwPnkbd5HfP02aTbiK22nHCGtGKn1eR2KDM4Yhw@mail.gmail.com>
X-Gm-Features: AWmQ_blpJP4rFQ3BH0tPZYsDJPnselHHXgoaG2rNNVBgBQ9UQYhzqXwIRJ0dTXw
Message-ID: <CAJZ5v0h22pPnwPnkbd5HfP02aTbiK22nHCGtGKn1eR2KDM4Yhw@mail.gmail.com>
Subject: Re: [PATCH 0/6 v6] Make ELOG and GHES log and trace consistently
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>, Tony Luck <tony.luck@intel.com>
Cc: linux-cxl@vger.kernel.org, Len Brown <lenb@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Sunil V L <sunilvl@ventanamicro.com>, Xiaofei Tan <tanxiaofei@huawei.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Arnd Bergmann <arnd@arndb.de>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Guo Weikang <guoweikang.kernel@gmail.com>, Xin Li <xin@zytor.com>, 
	Will Deacon <will@kernel.org>, Huang Yiwei <quic_hyiwei@quicinc.com>, Gavin Shan <gshan@redhat.com>, 
	Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Li Ming <ming.li@zohomail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Karolina Stolarek <karolina.stolarek@oracle.com>, Jon Pan-Doh <pandoh@google.com>, 
	Lukas Wunner <lukas@wunner.de>, Shiju Jose <shiju.jose@huawei.com>, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 23, 2025 at 2:26=E2=80=AFPM Fabio M. De Francesco
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
>
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
> Fabio M. De Francesco (6):
>   ACPI: extlog: Trace CPER Non-standard Section Body
>   ACPI: extlog: Trace CPER PCI Express Error Section
>   acpi/ghes: Make GHES select ACPI_APEI_PCIEAER
>   acpi/ghes: Add helper for CPER CXL protocol errors validity checks
>   acpi/ghes: Add helper to copy CPER CXL protocol error information to
>     work struct
>   ACPI: extlog: Trace CPER CXL Protocol Error Section
>
>  drivers/acpi/Kconfig       |  1 +
>  drivers/acpi/acpi_extlog.c | 60 ++++++++++++++++++++++++++++++++++++
>  drivers/acpi/apei/Kconfig  |  1 +
>  drivers/acpi/apei/ghes.c   | 62 +++++++++++++++++++++++++-------------
>  drivers/cxl/core/ras.c     |  6 ++++
>  drivers/pci/pcie/aer.c     |  2 +-
>  include/cxl/event.h        | 22 ++++++++++++++
>  7 files changed, 132 insertions(+), 22 deletions(-)
>
>
> base-commit: 552c50713f273b494ac6c77052032a49bc9255e2
> --

I need ACKs or equivalent for patches [3-5/6] from the designated APEI
reviewers.  Tony?

