Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF76889BA84
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 10:43:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j+qi3BU/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCjKQ4g3Yz3vYw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 18:43:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j+qi3BU/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCjJh5Nynz3cJW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 18:42:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6283BCE0E6F
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 08:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63ABCC43394
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712565745;
	bh=x5uAG/ltu+aXdeMkNcec1QhqHWClHSds/cSLz1O5N+g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j+qi3BU/XayOJEtk+zUWGNNXQZwmsfv+7aRrjOixLWr9b8aDnkabQa9KH3L/LY6DI
	 m+NUPCrWQD+jJhcuDStJoFGhTxPISCbmLKbIMwc1bFdbxldPGeFotZRP6XX6Yyd1Sw
	 8wW/P/+K3Tm/krPTPGekFenbgHv7BnAJwy+LJocFCu1wAm/93oF6WXorKLzFVtb796
	 5Q/i+69eFIPDnCr0eBPH58O33gEBpxh53m0HOGjCTGWk4+u1OXRHXOZLCw5h7+TNm8
	 xz7Or05SIZ89ACo+2Vey5KDI9TxFEUmkyU6UxNShLs+ZjjGIyqQbPR5Gy+6aw56pgm
	 UQ1Y0TfhTn4wg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d88a869ce6so12429791fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Apr 2024 01:42:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXjmfrtEC3fsV9Ww+VsxFqyzTFUs5xXOEJL+lejfYsNn9gqwSN93gWH+HNJpAP87rhEGsVZk/ckl6i+bqz2xiX5K8zEXsyA0LC+FoML7Q==
X-Gm-Message-State: AOJu0YyShjwEGaJSlX3IE5kwdhL6POsHg0wh79kmwQotfSFugEbxKmr/
	ZzdV+u/fzdYbn6wQS+B/ILXtS5SZ5gRiTz/JV1uuOh4Ad5xAZNaJrzg/vHPslKFa8KDBNIqr50d
	+W5jObHo0ICzbKkS6oAA/ijMYT0Q=
X-Google-Smtp-Source: AGHT+IEEZZz1BlhQIx5HBD9lAq9n0KDHPwdJDpGGUfNMfpXy5a9hhWu2MwVcoReA5TtUW0Y7LCD+C38a7qls1lB/zag=
X-Received: by 2002:a2e:8911:0:b0:2d8:713f:817b with SMTP id
 d17-20020a2e8911000000b002d8713f817bmr4768893lji.26.1712565743595; Mon, 08
 Apr 2024 01:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712410202.git.lukas@wunner.de>
In-Reply-To: <cover.1712410202.git.lukas@wunner.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 8 Apr 2024 10:42:12 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHsRLqdXZmRddVUZswCmiJqy8-ncgDF-ooTM2Wdi9q0Qw@mail.gmail.com>
Message-ID: <CAMj1kXHsRLqdXZmRddVUZswCmiJqy8-ncgDF-ooTM2Wdi9q0Qw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Deduplicate bin_attribute simple read() callbacks
To: Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: intel-gvt-dev@lists.freedesktop.org, Jean Delvare <jdelvare@suse.com>, Zhi Wang <zhi.wang.linux@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>, linux-acpi@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, linux-efi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 6 Apr 2024 at 15:52, Lukas Wunner <lukas@wunner.de> wrote:
>
> For my upcoming PCI device authentication v2 patches, I have the need
> to expose a simple buffer in virtual memory as a bin_attribute.
>
> It turns out we've duplicated the ->read() callback for such simple
> buffers a fair number of times across the tree.
>
> So instead of reinventing the wheel, I decided to introduce a common
> helper and eliminate all duplications I could find.
>
> I'm open to a bikeshedding discussion on the sysfs_bin_attr_simple_read()
> name. ;)
>
> Lukas Wunner (2):
>   sysfs: Add sysfs_bin_attr_simple_read() helper
>   treewide: Use sysfs_bin_attr_simple_read() helper
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

>  arch/powerpc/platforms/powernv/opal.c              | 10 +-------
>  drivers/acpi/bgrt.c                                |  9 +-------
>  drivers/firmware/dmi_scan.c                        | 12 ++--------
>  drivers/firmware/efi/rci2-table.c                  | 10 +-------
>  drivers/gpu/drm/i915/gvt/firmware.c                | 26 +++++----------------
>  .../intel/int340x_thermal/int3400_thermal.c        |  9 +-------
>  fs/sysfs/file.c                                    | 27 ++++++++++++++++++++++
>  include/linux/sysfs.h                              | 15 ++++++++++++
>  init/initramfs.c                                   | 10 +-------
>  kernel/module/sysfs.c                              | 13 +----------
>  10 files changed, 56 insertions(+), 85 deletions(-)
>
> --
> 2.43.0
>
