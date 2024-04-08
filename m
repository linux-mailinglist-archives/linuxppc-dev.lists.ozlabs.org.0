Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C50D89C7B8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 17:02:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iPVzIBvT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCskq5c0qz3vZb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 01:02:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iPVzIBvT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCsk82rK9z3cM4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 01:01:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0391DCE1414
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 15:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC553C433B2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 15:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712588493;
	bh=EITVdlJtkrnylLXhed9Pr1DfYAyVTQ3XvaUDh63E534=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iPVzIBvT/iSK03mJ74WyCdtfwrYQ0FIvhL5K8YMXOWzUcxtAW1X9DNCrqtBiFjfyi
	 tl90sPwPpZ5rbnlWkWlrmucbJbApIpssRcLEk4bwAVt6FxwLnhmycj60p3s5ZulGuY
	 Oi6kb5XzN6oeZLDaCEoYGMUGaCwA36s9aVa2vFCs+0r3L2ACNZZS6RJMIMK7lmGxXl
	 LZaKWREq5eaTZ8dEmqubeluPfq1pepZhLI9FVjpANsP8XqyeISOYtrQC8gZ/KN/t0I
	 J4RLdMza2ntow+e8CC8hAcBjXsrybDusTaZepo397svH4xSl9ToXUzq+mYubuhRT/b
	 17pKAxdggeVsA==
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6ea1572136eso453454a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Apr 2024 08:01:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzBv+3I2ybb7nVgiiJ5/HBJktM1gHKyTdmcCYfoycXuTMU5sdNLyQKknGqvDEyxDkaBS0NuZwBJNiK/jM15fNFfQSe/7YFT5S1+I3CRA==
X-Gm-Message-State: AOJu0YxV9lRc8aEsvpQDKmkyoZqk5aF32so0NZOrbJGLh1qaLtDBMbAY
	Lwrp1vt0gAbM8oLdmRxBuaVZRZe1j2pR9d3OOkpT48R9gKYbLzZUKNTpD6a9z6rULBJYj6NA9EI
	DOvLb1AOWgm7WlTDvDfggN+1dpAg=
X-Google-Smtp-Source: AGHT+IE7BjvtTOsOgPqYkXR1Qq+KOOG/nJtiEyKbfNUuvRcPpCIK8D3B6ZYbWXxS6qJ87RK9Jxd6UH195uv+p6a4TTw=
X-Received: by 2002:a05:6808:603:b0:3c5:f534:e2c7 with SMTP id
 y3-20020a056808060300b003c5f534e2c7mr2839026oih.1.1712588493105; Mon, 08 Apr
 2024 08:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712410202.git.lukas@wunner.de>
In-Reply-To: <cover.1712410202.git.lukas@wunner.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Apr 2024 17:01:22 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hOHCSp8-8EZjuGAOR0QSH3CcvokG3uBGAKFFpTrkqQRA@mail.gmail.com>
Message-ID: <CAJZ5v0hOHCSp8-8EZjuGAOR0QSH3CcvokG3uBGAKFFpTrkqQRA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Deduplicate bin_attribute simple read() callbacks
To: Lukas Wunner <lukas@wunner.de>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Jean Delvare <jdelvare@suse.com>, Zhi Wang <zhi.wang.linux@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>, linux-acpi@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, linux-efi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 6, 2024 at 3:52=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wrote=
:
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
>  arch/powerpc/platforms/powernv/opal.c              | 10 +-------
>  drivers/acpi/bgrt.c                                |  9 +-------
>  drivers/firmware/dmi_scan.c                        | 12 ++--------
>  drivers/firmware/efi/rci2-table.c                  | 10 +-------
>  drivers/gpu/drm/i915/gvt/firmware.c                | 26 +++++-----------=
-----
>  .../intel/int340x_thermal/int3400_thermal.c        |  9 +-------
>  fs/sysfs/file.c                                    | 27 ++++++++++++++++=
++++++
>  include/linux/sysfs.h                              | 15 ++++++++++++
>  init/initramfs.c                                   | 10 +-------
>  kernel/module/sysfs.c                              | 13 +----------
>  10 files changed, 56 insertions(+), 85 deletions(-)
>
> --

For the series

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
