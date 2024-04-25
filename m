Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C34D8B1AFF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 08:27:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=It1Mo04d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQ5WD5Lx5z3dwr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 16:27:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=It1Mo04d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=lists.ozlabs.org)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQ5VS1k1pz3ckg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Apr 2024 16:26:54 +1000 (AEST)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4FB983FE53
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Apr 2024 06:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714026409;
	bh=vEKVDSHMK5F/yU8ggTZJjhUhsGYpK1yP0OK1ux8Mb5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=It1Mo04dCe+tCH/jmCiuKboCxyCyJewDkfXOsZxlIcIJgDWz3L2+e/JmFgf95Kp79
	 sPRwnGaSsKl04ZTW3HkIbsleNZr+U1Fm5wKTIfw93/mruc2JFGVht9crfbHhMSIUuv
	 uZYmgfzEWiQDuxWlEa/Y+KHVQYESAJVrJvypzKPOsYvwLGdARG7bGZETE3BiBDNwTN
	 SoPHGUqkMv0g1e4XrXRR14YNCdKR+XOK07PC8lZeGyG4eAewyIevNAu/fDVG/EMk2O
	 6BL4cFAzNvYTGFvHBaWhFh2XadCubnoxcIKZLWoqWNidGIxd9DvaVbSEIAaRb2a0Ko
	 hBuzf84lnzJwQ==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2a4f59746f7so827736a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Apr 2024 23:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714026407; x=1714631207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEKVDSHMK5F/yU8ggTZJjhUhsGYpK1yP0OK1ux8Mb5o=;
        b=ardimjYS1u2zmzx1w2rwac4GlyR+XQsDmFzyK3herZ2lH7NKKQyrkDP8pNW9X3dIx0
         O5n0KA/HJrY3vTNJiDZT2lMYAqEt6QOz3IaAFJ5iaEvRKn2+RB1l6vDuJpa/JrxrLgsv
         KPFjZLFSpgOX+JWt7BdEWx2xxi3WIPRNsDYqFR+Fwnj7vyeVQSgkSzZNpi3W/X4cdAPc
         g+NIIYpi6VeLhv2kK1L2DT0d4AgNnoVfn5nc7ACnMnnhFURp9HrgrOwnLVfzrd9eVfA8
         JAOkhd5LO1GbUCQNVFFQshT0vU9qSjKtIYs4rIEMxrYHJQCg8XRDSqjNd+sTBWFgmqDX
         +RSg==
X-Forwarded-Encrypted: i=1; AJvYcCXZFBPi3YpbbH+vGcsxOeY9pwnJww/ylJtSVQ2QsU7xSIKUcjuFoQg071yzn5CVje02OCccP6Ym1tR5/WYs0KtnCwriQp0cfc7sYqhk1A==
X-Gm-Message-State: AOJu0YwFyF5X+Vj26wXkGrSbSw64IB8/HFtU8lSsbL+mvLGEyQTmVx+Y
	WMUFZoiyyImd3Mn5m3v0gVMEpUqMIPxPPBY+VV77K2cevFQZG4mno+ka+7jFaqLGASoRaS9IajD
	fAfZKfrwXg37JZqycT+AwXEEjidETTHCfDb2M4Nl5L5nBQZW2keVH6CUrM5ska+liZLnf3BqlX2
	jrS3FtT7CeB/hgQahCvEbs5OSJ0m/rszSKwV8XI2kw6xD0NIX2dfptJw==
X-Received: by 2002:a17:90a:4485:b0:2a6:ff2e:dce0 with SMTP id t5-20020a17090a448500b002a6ff2edce0mr5440127pjg.5.1714026406794;
        Wed, 24 Apr 2024 23:26:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLNR3SuwzJ2NqCuDu7XgA6QzggBx2sXnYGhGItyhdXG9zOH57lKQGVFKFleuFQOUiHqsV2LTxk6EPDijTfycg=
X-Received: by 2002:a17:90a:4485:b0:2a6:ff2e:dce0 with SMTP id
 t5-20020a17090a448500b002a6ff2edce0mr5440111pjg.5.1714026406400; Wed, 24 Apr
 2024 23:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240416043225.1462548-1-kai.heng.feng@canonical.com> <2aff18aa-32b7-4092-8235-aead9b708ea0@linux.intel.com>
In-Reply-To: <2aff18aa-32b7-4092-8235-aead9b708ea0@linux.intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 25 Apr 2024 14:26:34 +0800
Message-ID: <CAAd53p7e5dWEsSdrvpZ_5b9LLrhVwQEChUkFityN_nOuT2K=zQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] PCI: Add helper to check if any of ancestor device
 support D3cold
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
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
Cc: kch@nvidia.com, regressions@lists.linux.dev, linux-pci@vger.kernel.org, mahesh@linux.ibm.com, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, kbusch@kernel.org, oohall@gmail.com, hare@suse.de, bagasdotme@gmail.com, bhelgaas@google.com, gloriouseggroll@gmail.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de, sagi@grimberg.me
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 18, 2024 at 9:15=E2=80=AFAM Kuppuswamy Sathyanarayanan
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
>
> On 4/15/24 9:32 PM, Kai-Heng Feng wrote:
> > In addition to nearest upstream bridge, driver may want to know if the
> > entire hierarchy can be powered off to perform different action.
> >
> > So walk higher up the hierarchy to find out if any device has valid
> > _PR3.
> >
> > The user will be introduced in next patch.
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
>
> Since it has been a while, I was not sure what this series is about.
>
> IMO, it is better to include a cover letter with the summary of your
> changes.

OK, will do in next revision.

>
>
> > v8:
> >  - No change.
> >
> >  drivers/pci/pci.c   | 16 ++++++++++++++++
> >  include/linux/pci.h |  2 ++
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index e5f243dd4288..7a5662f116b8 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -6225,6 +6225,22 @@ bool pci_pr3_present(struct pci_dev *pdev)
> >               acpi_has_method(adev->handle, "_PR3");
> >  }
> >  EXPORT_SYMBOL_GPL(pci_pr3_present);
> > +
> > +bool pci_ancestor_pr3_present(struct pci_dev *pdev)
> > +{
> > +     struct pci_dev *parent =3D pdev;
> > +
> > +     if (acpi_disabled)
> > +             return false;
> > +
> > +     while ((parent =3D pci_upstream_bridge(parent))) {
> > +             if (pci_pr3_present(pdev))
>
> I think it should be "parent" here?

Thanks for catching this.

But this patch will be dropped in next version for better simplicity.

Kai-Heng

>
> > +                     return true;
> > +     }
> > +
> > +     return false;
> > +}
> > +EXPORT_SYMBOL_GPL(pci_ancestor_pr3_present);
> >  #endif
> >
> >  /**
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index 16493426a04f..cd71ebfd0f89 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -2620,10 +2620,12 @@ struct irq_domain *pci_host_bridge_acpi_msi_dom=
ain(struct pci_bus *bus);
> >  void
> >  pci_msi_register_fwnode_provider(struct fwnode_handle *(*fn)(struct de=
vice *));
> >  bool pci_pr3_present(struct pci_dev *pdev);
> > +bool pci_ancestor_pr3_present(struct pci_dev *pdev);
> >  #else
> >  static inline struct irq_domain *
> >  pci_host_bridge_acpi_msi_domain(struct pci_bus *bus) { return NULL; }
> >  static inline bool pci_pr3_present(struct pci_dev *pdev) { return fals=
e; }
> > +static inline bool pci_ancestor_pr3_present(struct pci_dev *pdev) { re=
turn false; }
> >  #endif
> >
> >  #ifdef CONFIG_EEH
>
> --
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
>
