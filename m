Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6B590E8B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 12:53:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u3uSaA84;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W40pg74wQz3cf8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 20:53:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u3uSaA84;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W40nz4Y2mz3cXC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 20:52:55 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F3D9861D44
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 10:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE91C4AF54
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 10:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718794372;
	bh=x6rRWvFLspQevsB2WpDwXMeeTixJq93OzwM4BU6/jhU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u3uSaA84l5gVLsWmwxrOtJWM7MF0Vu51G0CMA1IUhuxDqK7DR2yRzGOKrg5XZfJyp
	 gc1uZ0BFFh/wA26oymxl7R1SluIcT5SJ5t1Ag6XbCE5Xkm7ygActqF/NpHFUki9mlL
	 JbLwuS31tzqYMGiroNPmsUu+jF8Vggo/jU2YswgPzfH0OUyJKD3lw6P18dgkFZl/0Y
	 n5dvVHipC+NvVTsEaLa4yR6Z2kvQMtMEiStK1cuhhGDOlvFIk45u6nd3IWZNz0xwwZ
	 4TMCjh7s4W1TjzGlDdladzFqHv7/kFYAVMXWKntAeSqEk/WhLSN/siYOf+znixzC+C
	 tKhqZbYVCrBQQ==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5bad112b623so156820eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 03:52:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVk7Thv7K+e6ROiDuCNfShfNMn0agFe1DPH4GmTZ3e8dP1GgCXfxrQTnqR8rYs/Lc8fuVYl09yC83ZFBE+FxWpK0mAmYIVgqLGZw89R2A==
X-Gm-Message-State: AOJu0Yx4WMSHLAIw1lLfjZYEn9SGIy83DndLbAVLAFxeM3V/ItiNUGGB
	HsdlLhWdlefmlGkomgGD0kXnHxI+2hrxF3xDker+ZW36O/NigeMt41GhcUx3E2tIgQH7PbOgLjh
	FLIJ0fKvtd0TT4cM7kOPypAF9hOM=
X-Google-Smtp-Source: AGHT+IHkfbPpplMOo0+AZF3Oi/SLUmBNejk3LQsh8tt80LEVbwbJ0RTdOmOkrR69Re/mAWO5+pPtyJBD56qHP10v7uQ=
X-Received: by 2002:a05:6820:2210:b0:5ba:ead2:c742 with SMTP id
 006d021491bc7-5c1ad8a198cmr2995209eaf.0.1718794371598; Wed, 19 Jun 2024
 03:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240618204946.1271042-1-helgaas@kernel.org>
In-Reply-To: <20240618204946.1271042-1-helgaas@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 19 Jun 2024 12:52:39 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hZHnMbTLs3KK3ORQey=-u8SEm5H4X-eDSVzdk8s9Rn5A@mail.gmail.com>
Message-ID: <CAJZ5v0hZHnMbTLs3KK3ORQey=-u8SEm5H4X-eDSVzdk8s9Rn5A@mail.gmail.com>
Subject: Re: [PATCH v9 0/2] PCI: Disable AER & DPC on suspend
To: Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Hannes Reinecke <hare@suse.com>, Chaitanya Kulkarni <kch@nvidia.com>, Sagi Grimberg <sagi@grimberg.me>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Oliver O'Halloran <oohall@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Keith Busch <kbusch@kernel.org>, Thomas Crider <gloriouseggroll@gmail.com>, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, regressions@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 18, 2024 at 10:49=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
>
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> This is an old series from Kai-Heng that I didn't handle soon enough.  Th=
e
> intent is to fix several suspend/resume issues:
>
>   - Spurious wakeup from s2idle
>     (https://bugzilla.kernel.org/show_bug.cgi?id=3D216295)
>
>   - Steam Deck doesn't resume after suspend
>     (https://bugzilla.kernel.org/show_bug.cgi?id=3D218090)
>
>   - Unexpected ACS error and DPC event when resuming after suspend
>     (https://bugzilla.kernel.org/show_bug.cgi?id=3D209149)
>
> It seems that a glitch when the link is powered down during suspend cause=
s
> errors to be logged by AER.  When AER is enabled, this causes an AER
> interrupt, and if that IRQ is shared with PME, it may cause a spurious
> wakeup.
>
> Also, errors logged during link power-down and power-up seem to cause
> unwanted error reporting during resume.
>
> This series disables AER interrupts, DPC triggering, and DPC interrupts
> during suspend.  On resume, it clears AER and DPC error status before
> re-enabling their interrupts.
>
> I added a couple cosmetic changes for the v9, but this is essentially all
> Kai-Heng's work.  I'm just posting it as a v9 because I failed to act on
> this earlier.
>
> Bjorn
>
> v9:
>  - Drop pci_ancestor_pr3_present() and pm_suspend_via_firmware; do it
>    unconditionally
>  - Clear DPC status before re-enabling DPC interrupt
>
> v8: https://lore.kernel.org/r/20240416043225.1462548-1-kai.heng.feng@cano=
nical.com
>  - Wording.
>  - Add more bug reports.
>
> v7:
>  - Wording.
>  - Disable AER completely (again) if power will be turned off
>  - Disable DPC completely (again) if power will be turned off
>
> v6: https://lore.kernel.org/r/20230512000014.118942-1-kai.heng.feng@canon=
ical.com
>
> v5: https://lore.kernel.org/r/20230511133610.99759-1-kai.heng.feng@canoni=
cal.com
>  - Wording.
>
> v4: https://lore.kernel.org/r/20230424055249.460381-1-kai.heng.feng@canon=
ical.com
> v3: https://lore.kernel.org/r/20230420125941.333675-1-kai.heng.feng@canon=
ical.com
>  - Correct subject.
>
> v2: https://lore.kernel.org/r/20230420015830.309845-1-kai.heng.feng@canon=
ical.com
>  - Only disable AER IRQ.
>  - No more AER check on PME IRQ#.
>  - Use AER helper.
>  - Only disable DPC IRQ.
>  - No more DPC check on PME IRQ#.
>
> v1: https://lore.kernel.org/r/20220727013255.269815-1-kai.heng.feng@canon=
ical.com
>
> Kai-Heng Feng (2):
>   PCI/AER: Disable AER service on suspend
>   PCI/DPC: Disable DPC service on suspend
>
>  drivers/pci/pcie/aer.c | 18 +++++++++++++
>  drivers/pci/pcie/dpc.c | 60 +++++++++++++++++++++++++++++++++---------
>  2 files changed, 66 insertions(+), 12 deletions(-)
>
> --

Please feel free to add

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

to both patches in the series.

Thanks!
