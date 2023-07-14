Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DF37534D2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 10:15:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=pPULnrhl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2PRz5Mbjz3cTM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 18:15:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=pPULnrhl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=lists.ozlabs.org)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2PR16WN1z309D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 18:14:52 +1000 (AEST)
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 713693F18B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 08:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689322485;
	bh=3orHT4JM0Iv/tV5GPFY3h6ErKAXsnmT8WOqTtcRm+2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=pPULnrhluQ6I1pvUTo9pzd9hVmFL2eYQnIHwU90v36zXdhlFhUu6PsvI0oJ56CZ+I
	 vJaZqT5fqvtz/RhK+ACDyAMRPbuUUbc2g3U1aa28KAopBKcIQHMsgeGLvC9vM2THZW
	 xRfsNxABIFc118BDwUVEomGVRi6KW1jAUSWUnTtbITHbB+yxmIGLESb4h+72aHIEH0
	 OJb2OWowLuA/KNSgOuXEAU4XmuHI828RbroQpIKYuxTfYism1LJSZ25iHmEwXfBMOD
	 NGXpoOOkUohZPpRjvWzr8dQOf1rIMNm17yzzLLZbuvns7NLkRam1totJDlJtlR7oo3
	 f1ok9PhDLMDdA==
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-5649d12abe1so2376197eaf.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 01:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689322484; x=1691914484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3orHT4JM0Iv/tV5GPFY3h6ErKAXsnmT8WOqTtcRm+2w=;
        b=dqMov531CU2pmPlKaEhmH7jUA7AIae+WvWbomkAABljL6HzdtW+a7I0ikWK0ZM08Ki
         5WA7yrNGQSwP46SGdZIIHTRfOYdmOm82/okPLwSVwtFNZgEB6d7d1icb3ONNHQNFIpWx
         Scpy4kl5JY+6khnWs6vg6mMLip77Md7W+8m93WSuSdhzv28boEcBIdMo7VjsrvQHt1kl
         CoDu0V4onwLF+KYm6brFT40mDMz1dU9CBrnLXa2K1yshDfIyPjWm/20rhXG9HMviqCnn
         ine+7pEHjwQp6n//ERWAj2OtDXMCKsJlOQNU4A0ZTDToOMwzHfKWsjyVkk5myWrg5bWY
         jVow==
X-Gm-Message-State: ABy/qLZb7XRsC96qKEtM/kMLLaZHWQbgvfS35LZ2dwog5rQqm355JTrZ
	aRt8xN+aP4mI7lkCq4VU00VhxR7P981JwYaE051zNquGSm5RTWe/0o4QY1PSrDODOmIyxbyc+Gx
	cOjrqsaTEYKwg3AxKA0CXX4maqfuFVFAeesW84xdT2v+pfGyyq2Ozrz6MtC0=
X-Received: by 2002:a05:6358:5e0c:b0:134:ddad:2b51 with SMTP id q12-20020a0563585e0c00b00134ddad2b51mr4160621rwn.14.1689322484240;
        Fri, 14 Jul 2023 01:14:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHUGLglEJ2G95ivnaP/bf04GjYDd7FiIIQuh2B1oRfEBSPuFJkdc0euxQBZvVLKwTeqwDaQ+Vo90vDAhQelD+8=
X-Received: by 2002:a05:6358:5e0c:b0:134:ddad:2b51 with SMTP id
 q12-20020a0563585e0c00b00134ddad2b51mr4160605rwn.14.1689322483950; Fri, 14
 Jul 2023 01:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230512000014.118942-1-kai.heng.feng@canonical.com> <20230512000014.118942-2-kai.heng.feng@canonical.com>
In-Reply-To: <20230512000014.118942-2-kai.heng.feng@canonical.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 14 Jul 2023 16:14:32 +0800
Message-ID: <CAAd53p6KEMJzraFn5GWGfEWQQ6WJmKGxtuGRuP2esAib+6s+Lw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] PCI/AER: Disable AER interrupt on suspend
To: bhelgaas@google.com
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, mika.westerberg@linux.intel.com, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 12, 2023 at 8:01=E2=80=AFAM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> PCIe services that share an IRQ with PME, such as AER or DPC, may cause a
> spurious wakeup on system suspend. To prevent this, disable the AER inter=
rupt
> notification during the system suspend process.
>
> As Per PCIe Base Spec 5.0, section 5.2, titled "Link State Power Manageme=
nt",
> TLP and DLLP transmission are disabled for a Link in L2/L3 Ready (D3hot),=
 L2
> (D3cold with aux power) and L3 (D3cold) states. So disabling the AER
> notification during suspend and re-enabling them during the resume proces=
s
> should not affect the basic functionality.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D216295
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

A gentle ping...

> ---
> v6:
> v5:
>  - Wording.
>
> v4:
> v3:
>  - No change.
>
> v2:
>  - Only disable AER IRQ.
>  - No more check on PME IRQ#.
>  - Use helper.
>
>  drivers/pci/pcie/aer.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 1420e1f27105..9c07fdbeb52d 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1356,6 +1356,26 @@ static int aer_probe(struct pcie_device *dev)
>         return 0;
>  }
>
> +static int aer_suspend(struct pcie_device *dev)
> +{
> +       struct aer_rpc *rpc =3D get_service_data(dev);
> +       struct pci_dev *pdev =3D rpc->rpd;
> +
> +       aer_disable_irq(pdev);
> +
> +       return 0;
> +}
> +
> +static int aer_resume(struct pcie_device *dev)
> +{
> +       struct aer_rpc *rpc =3D get_service_data(dev);
> +       struct pci_dev *pdev =3D rpc->rpd;
> +
> +       aer_enable_irq(pdev);
> +
> +       return 0;
> +}
> +
>  /**
>   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
>   * @dev: pointer to Root Port, RCEC, or RCiEP
> @@ -1420,6 +1440,8 @@ static struct pcie_port_service_driver aerdriver =
=3D {
>         .service        =3D PCIE_PORT_SERVICE_AER,
>
>         .probe          =3D aer_probe,
> +       .suspend        =3D aer_suspend,
> +       .resume         =3D aer_resume,
>         .remove         =3D aer_remove,
>  };
>
> --
> 2.34.1
>
