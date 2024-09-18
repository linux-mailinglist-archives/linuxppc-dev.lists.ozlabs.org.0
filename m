Return-Path: <linuxppc-dev+bounces-1427-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3B697B6F3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2024 04:54:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7jsM2XWQz2xpl;
	Wed, 18 Sep 2024 12:53:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::532"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726628039;
	cv=none; b=nIhDpHvI/IIoBekeWobvMmC1OmTRvHH9YSHWdJhjTHLYo1NcvdR8BCM1L5ldoLPaJQZ27cSPvzMvK0eI6NtKP8c3QJ31uiBaKm46TKABqs8s0GpjbJ+ChFlE+4Y7pWWjdnCklTPd5N3KgItKTEc4nf4I8Euwv/at6pSKu42XeCKlHBUhaacdzJUfmB3J2CUt5uLnwcLNJyWgtw4KY7UPszRJYKx9VUHIF8tghIuxXOJypkeMrv4Dc2kz7bmHlZ+W9AoZ4Bq5UH44XL8dIYuq+WMy9GlGkz8f1jjrZF0gr9r+oTW2jZmuEyCO9CMleSCD5XR75Dx+vmz1Cjd1rqJ4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726628039; c=relaxed/relaxed;
	bh=AWZ3qcTMi/V1RAhpylJg9TiYZi40Z2/VWqsDBDLTX80=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=fcTIkSQsmrPL/i3eqh3OpYyLCYVMwGRYIXzRXbREdgWshAOB03m6ZPS5nMGbbxdUieqNJDp6QBS4C2sXrq1m9OtS09Zfuk00Fs1UTjfrHgolC53izFG9CsrBemuAojUk4vISH3Re/W/ByDpf2tOb1ezg00cJAM9GuMKczg6wKujdI0SDjn2L5bS8A236a0lArTKH2nH2DuDWQt/LUU5R8iAQz56pNQVwFAyHMjyedVraGnGI5/CidAFb4G80PJUjiuaYy4XTGmizdArcjXUVtHNXzWdilN8bvACNPpx5wmI8GLK+Wo875Fmn4m5WKwIkH7U2dec2HeJGpLiJRvK0aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dEEyzpth; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dEEyzpth;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7jsL428Jz2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 12:53:57 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7db1f13b14aso5503483a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2024 19:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726628033; x=1727232833; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWZ3qcTMi/V1RAhpylJg9TiYZi40Z2/VWqsDBDLTX80=;
        b=dEEyzpthvEHA1iMihtr0dWXn7IuyP5VI/1Rn1Kr6GxlIokBYSFl3fKoKTX7G4iODtJ
         ukr4fJ251acEFxWF8RfaTFmcmr58Dx6ASDdDkyXXa5GGhm2Zv3rk1TUzUaw970uGl/xl
         AIbci1e/IEc3SLyq9eLq1b9EmHtjuQfNZzPBeNLwS8IauuMPbivZ2ILBhup1u9PNVv1F
         2gT/2KQ4Ggw7BU0maG/ZSe90FeuY8EBUMyUVUYR7KjOmKdsk9JXoPSJ+X1x0Ndhlz1ye
         omFxkqsUukVk5ejgD1LNkowmba38rE6D+x5xtKnq0E2e14RQaruBFHuTz9YqMwfX3Nuk
         3rMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726628033; x=1727232833;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AWZ3qcTMi/V1RAhpylJg9TiYZi40Z2/VWqsDBDLTX80=;
        b=OLyx9LIelTVj+rMwLZNg67d+HQa7z5GNExLI19orwzQd3AKj/jN2gT04WaM/iOD1V/
         hqXS7dxlXBzz7xy4ElMrSeuWUkZSVpo2xOw4GPMcVUqoJ3L2GBOnZ1DMakdwpZnXBKyb
         GxvtUAsPkFyvNFqQcPV4qGTPzWrtCIL7DpjbFxFnLVZlyALPgV4NxEkXF1YW6xIcDlcs
         VHFjizsstv/W9LZjVpavE2mSTnOFFJVp9bvqE/72tsmRl4fxhux7LFQNi78bI/e/yySK
         RQoL4BCLYGOo5qBaqh41yUmSAfqFzpsB6dWD3i5WTt8u11U1eND/WukzLPuRNZ0ISPVz
         e8cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeFg8VYvDPf9gAVKb85+92HmWsSYp28MlehoMNzdUB3q9+8nQnludzqhsRBsnd/xYElBp9UOg16EJL6lY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwlDMkdOzgWbvgp5VwNex74hhdFbdNFX7yHi/IfWgZ/+7LRuMCo
	oS8tEPzqCQhrtBIB+0JGHU2ZRm62327bMk+efv/FopYUB9+gmRtH
X-Google-Smtp-Source: AGHT+IGKGWYruuAC6rL2FMLKK+SZlN2gY4arKU4qgCeD621ynurim1YEbscPsFKq5JQECLbkqScxkQ==
X-Received: by 2002:a17:903:2304:b0:202:4cd2:d6e4 with SMTP id d9443c01a7336-2076e36157emr331090675ad.24.1726628033104;
        Tue, 17 Sep 2024 19:53:53 -0700 (PDT)
Received: from dw-tp ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207945da788sm56252145ad.18.2024.09.17.19.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 19:53:52 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, linux-kernel@vger.kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, vaibhav@linux.ibm.com, ganeshgr@linux.ibm.com, sbhat@linux.ibm.com
Subject: Re: [PATCH] powerpc/pseries/eeh: move pseries_eeh_err_inject() outside CONFIG_DEBUG_FS block
In-Reply-To: <20240917132445.3868016-1-nnmlinux@linux.ibm.com>
Date: Wed, 18 Sep 2024 08:03:56 +0530
Message-ID: <871q1hbsh7.fsf@gmail.com>
References: <20240917132445.3868016-1-nnmlinux@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Narayana Murty N <nnmlinux@linux.ibm.com> writes:

> Makes pseries_eeh_err_inject() available even when debugfs
> is disabled (CONFIG_DEBUG_FS=n). It moves eeh_debugfs_break_device()
> and eeh_pe_inject_mmio_error() out of the CONFIG_DEBUG_FS block
> and renames it as eeh_break_device().
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409170509.VWC6jadC-lkp@intel.com/
> Fixes: b0e2b828dfca ("powerpc/pseries/eeh: Fix pseries_eeh_err_inject")
> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
> ---
>  arch/powerpc/kernel/eeh.c | 198 +++++++++++++++++++-------------------
>  1 file changed, 99 insertions(+), 99 deletions(-)

Ok, so in your original patch you implemented eeh_inject ops for pseries
using mmio based eeh error injection (eeh_pe_inject_mmio_error()), which
uses the functions defined under debugfs -> eeh_debugfs_break_device(). 

This was failing when CONFIG_DEBUGFS is not defined, thus referring to
undefined function definition. 

Minor nit below.

>
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 49ab11a287a3..0fe25e907ea6 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1574,6 +1574,104 @@ static int proc_eeh_show(struct seq_file *m, void *v)
>  }
>  #endif /* CONFIG_PROC_FS */
>  
> +static int eeh_break_device(struct pci_dev *pdev)
> +{
> +	struct resource *bar = NULL;
> +	void __iomem *mapped;
> +	u16 old, bit;
> +	int i, pos;
> +
> +	/* Do we have an MMIO BAR to disable? */
> +	for (i = 0; i <= PCI_STD_RESOURCE_END; i++) {
> +		struct resource *r = &pdev->resource[i];
> +
> +		if (!r->flags || !r->start)
> +			continue;
> +		if (r->flags & IORESOURCE_IO)
> +			continue;
> +		if (r->flags & IORESOURCE_UNSET)
> +			continue;
> +
> +		bar = r;
> +		break;
> +	}
> +
> +	if (!bar) {
> +		pci_err(pdev, "Unable to find Memory BAR to cause EEH with\n");
> +		return -ENXIO;
> +	}
> +
> +	pci_err(pdev, "Going to break: %pR\n", bar);
> +
> +	if (pdev->is_virtfn) {
> +#ifndef CONFIG_PCI_IOV
> +		return -ENXIO;
> +#else
> +		/*
> +		 * VFs don't have a per-function COMMAND register, so the best
> +		 * we can do is clear the Memory Space Enable bit in the PF's
> +		 * SRIOV control reg.
> +		 *
> +		 * Unfortunately, this requires that we have a PF (i.e doesn't
> +		 * work for a passed-through VF) and it has the potential side
> +		 * effect of also causing an EEH on every other VF under the
> +		 * PF. Oh well.
> +		 */
> +		pdev = pdev->physfn;
> +		if (!pdev)
> +			return -ENXIO; /* passed through VFs have no PF */
> +
> +		pos  = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
> +		pos += PCI_SRIOV_CTRL;
> +		bit  = PCI_SRIOV_CTRL_MSE;
> +#endif /* !CONFIG_PCI_IOV */
> +	} else {
> +		bit = PCI_COMMAND_MEMORY;
> +		pos = PCI_COMMAND;
> +	}
> +
> +	/*
> +	 * Process here is:
> +	 *
> +	 * 1. Disable Memory space.
> +	 *
> +	 * 2. Perform an MMIO to the device. This should result in an error
> +	 *    (CA  / UR) being raised by the device which results in an EEH
> +	 *    PE freeze. Using the in_8() accessor skips the eeh detection hook
> +	 *    so the freeze hook so the EEH Detection machinery won't be
> +	 *    triggered here. This is to match the usual behaviour of EEH
> +	 *    where the HW will asynchronously freeze a PE and it's up to
> +	 *    the kernel to notice and deal with it.
> +	 *
> +	 * 3. Turn Memory space back on. This is more important for VFs
> +	 *    since recovery will probably fail if we don't. For normal
> +	 *    the COMMAND register is reset as a part of re-initialising
> +	 *    the device.
> +	 *
> +	 * Breaking stuff is the point so who cares if it's racy ;)
> +	 */
> +	pci_read_config_word(pdev, pos, &old);
> +
> +	mapped = ioremap(bar->start, PAGE_SIZE);
> +	if (!mapped) {
> +		pci_err(pdev, "Unable to map MMIO BAR %pR\n", bar);
> +		return -ENXIO;
> +	}
> +
> +	pci_write_config_word(pdev, pos, old & ~bit);
> +	in_8(mapped);
> +	pci_write_config_word(pdev, pos, old);
> +
> +	iounmap(mapped);
> +
> +	return 0;
> +}
> +
> +int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
> +{
> +	return eeh_break_device(pdev);
> +}
> +

Why have an extra eeh_pe_inject_mmio_error() function which only calls
eeh_break_device()?

Maybe we can rename eeh_break_device() to eeh_mmio_break_device() and use
this function itself at both call sites?

-ritesh

