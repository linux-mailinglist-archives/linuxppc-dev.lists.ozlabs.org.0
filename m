Return-Path: <linuxppc-dev+bounces-14463-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C746C82173
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 19:23:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFZ2q2RGKz2xS2;
	Tue, 25 Nov 2025 05:23:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764008627;
	cv=none; b=i6gbbGiJEDRaCMXXssTKLNWLk0dyb3QSOK+B7NHDeA6afDv7nHHNnmFRKPvDtBmMjWYICT6n+RezyYoAS0E2aTFMxIqzcm1BKjD3vQBHanbpi3yINE5gif5P04FRt/z5EtSntUntzh8+ZXGT0jHnPig4ZNhXYHeR5wGnBhavE+g7aKABf1IZvjqSlb0QOCtYgIbMi7a6LMYZIsab4hvwgnClGQXXi3O4pkhBLj5ItAuqQJAWU04hYiI/NOotOCMwCFYRNd4n9uEJQ9ZV4J+DWXG4lXgBPLia4twaCDqt3KGE84w+o2kwnewTMSrCISwGx5OLs308yBMQl0kHMpbs+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764008627; c=relaxed/relaxed;
	bh=SBOz8Rtkn+byh//l52OHao8V7CqSa1HP0EcLiw6p6CE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TH5fwHxXc+24+d42jHvyj3ADuikCkzWNOXwqjeRXeBk2JMTTRS1uwUhj7xqvXGH59/NGS1643tl6mm6RGWhQEmbNtdjwmnY8GMl8iWtvnpBikl2eg8tUstrC5ayd3LmbRq2FYWN9wnSWYzFEHbDwb9k9L0t6jN4/AnPDdAdPRJ2rXRFV2DPDWinEawLLgh5At/cUF9E0E8bxFfkuoVShZZ8O37CdOsck7OgwZ7RKTB2XNIpvzs5aURqERlsUH9BzTmSgoFRmrGDgr0bqbIht0H9NZM1c0i8zd5vZnjJxryPEFuibgHZscogHwiW6uszkXM9z9d93CZeLFEsCxdFJ5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pcW16dNa; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pcW16dNa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFZ2p2DDVz2xQq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 05:23:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7CCE60176
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Nov 2025 18:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0A7C19425
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Nov 2025 18:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764008623;
	bh=2FX7rZXKca4g/J0UloZ6GYe00mJx2wV1IHK1gF3C2SY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pcW16dNaGiF6s5vT4XTzPkGay8JLppf19s8pSJ047d+L+LgCwIxWzqt6YMH7lQcM2
	 GIWpqDETt2LsAaYcskOBlzfsLmu/C3Hm9y9x1aWsF4oWaIfFEB3A1qzdfIlN5Psimc
	 S96qMPVKWDujYE+s8zYqlh52jOUE3gaE2oLQnb7O/soEHrcVO5nUm3ohI7NmzoGblr
	 sNcWD3kJM1nxUSp+d/dybSKfbD6qyoRQcD1LL+NaGpCs2PYIs+/M5Nbv4EDHAsg03V
	 XlFDgO1CaErFZccsvMXUsF8HE0U0qK2y56k9mUjb4AhAZHBcmOz5n4SdiejBtkMEhs
	 oVR5hk/OF7EnA==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-3ebd1b07919so1075172fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Nov 2025 10:23:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjzHpvmJuQ2sWMg4Bbs7mQPbBAEAtwF4v3nCeautghEP+DtBjqbSvryuxaSaTferRaxppHOLWKVTrs6uA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyrwVgCXLWjQXJYD8bTCRjTXayjmYLm57vjqu9MOaJqE/06Rut0
	WyJl3/KuZRliM94LDxmiROccZwHnG9eV8USPhMLwEO721WEasdxzJmbUs3EfJua2DdQRomjRIrZ
	Uv+Jwehata4c9a6WI+mwpfXAeYhREErY=
X-Google-Smtp-Source: AGHT+IE8USfY1TlzVhoxR68d6+kuU+3Zqd4gD73B+rh8Fu3seOp2TD6CFzvqRKbzETbK58xBjN4YE3uILspEa5NgttU=
X-Received: by 2002:a05:6808:f8e:b0:450:ca65:ef63 with SMTP id
 5614622812f47-45115981923mr3951804b6e.24.1764008622715; Mon, 24 Nov 2025
 10:23:42 -0800 (PST)
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
References: <077596ba70202be0e43fdad3bb9b93d356cbe4ec.1763746079.git.lukas@wunner.de>
In-Reply-To: <077596ba70202be0e43fdad3bb9b93d356cbe4ec.1763746079.git.lukas@wunner.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 24 Nov 2025 19:23:29 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iSokgFwYLrXd-ZMYO8PABZwvfZBO-p5gKbETTcURp-oQ@mail.gmail.com>
X-Gm-Features: AWmQ_blp4g0-S_IAjsDssU-F-OFcJ2Imj6eg_vHajqJ-TUa2ZdlupXjD1KnDNJw
Message-ID: <CAJZ5v0iSokgFwYLrXd-ZMYO8PABZwvfZBO-p5gKbETTcURp-oQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: PCI: Amend error recovery doc with
 pci_save_state() rules
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Farhan Ali <alifm@linux.ibm.com>, 
	Benjamin Block <bblock@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	Linas Vepstas <linasvepstas@gmail.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 21, 2025 at 6:31=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wrot=
e:
>
> After recovering from a PCI error through reset, affected devices are in
> D0_uninitialized state and need to be brought into D0_active state by
> re-initializing their Config Space registers (PCIe r7.0 sec 5.3.1.1).
>
> To facilitate that, the PCI core provides pci_restore_state() and
> pci_save_state() helpers.  Document rules governing their usage.
>
> As Bjorn notes, so far no file in "Documentation/ includes anything about
> the idea of a driver using pci_save_state() to capture the state it wants
> to restore after an error", even though it is a common pattern in drivers=
.
> So that's obviously a gap that should be closed.
>
> Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> Closes: https://lore.kernel.org/r/20251113161556.GA2284238@bhelgaas/
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

It looks good to me, so

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  Documentation/PCI/pci-error-recovery.rst | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI=
/pci-error-recovery.rst
> index 5df481a..43bc4e3 100644
> --- a/Documentation/PCI/pci-error-recovery.rst
> +++ b/Documentation/PCI/pci-error-recovery.rst
> @@ -326,6 +326,21 @@ be recovered, there is nothing more that can be done=
;  the platform
>  will typically report a "permanent failure" in such a case.  The
>  device will be considered "dead" in this case.
>
> +Drivers typically need to call pci_restore_state() after reset to
> +re-initialize the device's config space registers and thereby
> +bring it from D0\ :sub:`uninitialized` into D0\ :sub:`active` state
> +(PCIe r7.0 sec 5.3.1.1).  The PCI core invokes pci_save_state()
> +on enumeration after initializing config space to ensure that a
> +saved state is available for subsequent error recovery.
> +Drivers which modify config space on probe may need to invoke
> +pci_save_state() afterwards to record those changes for later
> +error recovery.  When going into system suspend, pci_save_state()
> +is called for every PCI device and that state will be restored
> +not only on resume, but also on any subsequent error recovery.
> +In the unlikely event that the saved state recorded on suspend
> +is unsuitable for error recovery, drivers should call
> +pci_save_state() on resume.
> +
>  Drivers for multi-function cards will need to coordinate among
>  themselves as to which driver instance will perform any "one-shot"
>  or global device initialization. For example, the Symbios sym53cxx2
> --
> 2.51.0
>

