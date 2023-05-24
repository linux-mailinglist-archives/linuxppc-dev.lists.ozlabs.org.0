Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE02570ED32
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 07:41:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QR0R14bPRz3f7L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 15:41:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=uX/ikWSg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=uX/ikWSg;
	dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QR0Q95m8dz3bcT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 15:40:15 +1000 (AEST)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A09673F10A
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 05:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1684906808;
	bh=mkqBjgsXEnqUgI19bHhjtHZnSln537X6UG+qVPFXPi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=uX/ikWSgrAPklaLmqjS23/NHaK94mmu5yXY5b7iUXJ2OR9UUhbSEgooTs08sV0TEC
	 xaGV5nsgTfeC5LXSd5NqprVfmFC36lagtuX22zd4+r4sC2WWR1sCYfVdsxBeafhhqu
	 eHSgvtAfVspyq91XCSGvP6tuBDFaJrypRzZBZcomQRL61qXMuR6wS/D1As2GmK4J6G
	 TFcWCS8VcHz+C58cQkWt6CNIBreyq/9OBmyLM0vMwmDXCoLY5Dr467BVvIr1lt3Onc
	 jwq9VsTCwkn6fbw2M4uypsAX3J+vApsw3yz40PM5oD6A4J9eiudBg0YmjxO20eJZLT
	 Jhj2u3TtGsJSw==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2533d8f48b5so296946a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 22:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684906807; x=1687498807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkqBjgsXEnqUgI19bHhjtHZnSln537X6UG+qVPFXPi4=;
        b=DkBIPlUeQTsDd450fOE0C0Jg4oFXTyQ7KD2vCmhEfiJ4eP3BVN2pa6vgbHf03RUP6k
         0Na0c9iolxzDddQksaz61+xibJKt+W9Ik3Zbb7EhTFLGJc5jczU06I3vpqttfVZ9gft+
         uIDIlceMaYGQi5lO7F9jHTwfUJmGYJ6qX8qlNNHk21hU8uG3BXZeeBGcHqT+6uCiRAHT
         RtnaGTwgXyVzTsAwwAqAQ9mNSh60axqephpRQxZasZBt1n4ZVWZDNPT82QskBTYebe22
         j4DSOa/o0upIEx0dulZ2U45IolQaP2HP77e0aPry+OtINh0dC+TSSpCy7OVy8B1TTYRF
         WLxg==
X-Gm-Message-State: AC+VfDwlc/KGJ4zX+T5Bl462Qnr/Eo8Evb55eSbhJ9TuFtMe94O4rhYb
	8uU4bcwq+HHbBjRg8K0tw0n993HT0GVzwWOoUxoI0MF2EXKBgZIQ0ihM/X3WeGtpL82JNNicECd
	aXjZnCk8tx0COcvnDcev9kvFJl0dlHpUzCLlqx+L+t76TRFhNNupLx/fkayI=
X-Received: by 2002:a17:90b:1112:b0:255:a7ed:94a1 with SMTP id gi18-20020a17090b111200b00255a7ed94a1mr4546978pjb.41.1684906806756;
        Tue, 23 May 2023 22:40:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ66a/YFsioQJzWAMMZm6QJ/C879R0FzI+s++JhPPfkNt8VQQ1tqNYRy6IyOtPNMdQv+p+ljCuVHYDzlbNGYqV8=
X-Received: by 2002:a17:90b:1112:b0:255:a7ed:94a1 with SMTP id
 gi18-20020a17090b111200b00255a7ed94a1mr4546954pjb.41.1684906806415; Tue, 23
 May 2023 22:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230512000014.118942-1-kai.heng.feng@canonical.com>
In-Reply-To: <20230512000014.118942-1-kai.heng.feng@canonical.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 24 May 2023 13:39:54 +0800
Message-ID: <CAAd53p5QS3c0P3K3LOt1pJRmrLZtK-z7+vbUk2GqEypQuvRz9Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] PCI/AER: Factor out interrupt toggling into helpers
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, mika.westerberg@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Bjorn,

On Fri, May 12, 2023 at 8:01=E2=80=AFAM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> There are many places that enable and disable AER interrupt, so move
> them into helpers.

Do you think the series is good to be be merged now?

Kai-Heng

>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux=
.intel.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v6:
>  - No change.
>
> v5:
>  - Fix misspelling.
>
> v4:
>  - No change.
>
> v3:
>  - Correct subject.
>
> v2:
>  - New patch.
>
>  drivers/pci/pcie/aer.c | 45 +++++++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index f6c24ded134c..1420e1f27105 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1227,6 +1227,28 @@ static irqreturn_t aer_irq(int irq, void *context)
>         return IRQ_WAKE_THREAD;
>  }
>
> +static void aer_enable_irq(struct pci_dev *pdev)
> +{
> +       int aer =3D pdev->aer_cap;
> +       u32 reg32;
> +
> +       /* Enable Root Port's interrupt in response to error messages */
> +       pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> +       reg32 |=3D ROOT_PORT_INTR_ON_MESG_MASK;
> +       pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> +}
> +
> +static void aer_disable_irq(struct pci_dev *pdev)
> +{
> +       int aer =3D pdev->aer_cap;
> +       u32 reg32;
> +
> +       /* Disable Root's interrupt in response to error messages */
> +       pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> +       reg32 &=3D ~ROOT_PORT_INTR_ON_MESG_MASK;
> +       pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> +}
> +
>  /**
>   * aer_enable_rootport - enable Root Port's interrupts when receiving me=
ssages
>   * @rpc: pointer to a Root Port data structure
> @@ -1256,10 +1278,7 @@ static void aer_enable_rootport(struct aer_rpc *rp=
c)
>         pci_read_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, &reg32);
>         pci_write_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, reg32);
>
> -       /* Enable Root Port's interrupt in response to error messages */
> -       pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> -       reg32 |=3D ROOT_PORT_INTR_ON_MESG_MASK;
> -       pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> +       aer_enable_irq(pdev);
>  }
>
>  /**
> @@ -1274,10 +1293,7 @@ static void aer_disable_rootport(struct aer_rpc *r=
pc)
>         int aer =3D pdev->aer_cap;
>         u32 reg32;
>
> -       /* Disable Root's interrupt in response to error messages */
> -       pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> -       reg32 &=3D ~ROOT_PORT_INTR_ON_MESG_MASK;
> -       pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> +       aer_disable_irq(pdev);
>
>         /* Clear Root's error status reg */
>         pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, &reg32);
> @@ -1372,12 +1388,8 @@ static pci_ers_result_t aer_root_reset(struct pci_=
dev *dev)
>          */
>         aer =3D root ? root->aer_cap : 0;
>
> -       if ((host->native_aer || pcie_ports_native) && aer) {
> -               /* Disable Root's interrupt in response to error messages=
 */
> -               pci_read_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, &=
reg32);
> -               reg32 &=3D ~ROOT_PORT_INTR_ON_MESG_MASK;
> -               pci_write_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, =
reg32);
> -       }
> +       if ((host->native_aer || pcie_ports_native) && aer)
> +               aer_disable_irq(root);
>
>         if (type =3D=3D PCI_EXP_TYPE_RC_EC || type =3D=3D PCI_EXP_TYPE_RC=
_END) {
>                 rc =3D pcie_reset_flr(dev, PCI_RESET_DO_RESET);
> @@ -1396,10 +1408,7 @@ static pci_ers_result_t aer_root_reset(struct pci_=
dev *dev)
>                 pci_read_config_dword(root, aer + PCI_ERR_ROOT_STATUS, &r=
eg32);
>                 pci_write_config_dword(root, aer + PCI_ERR_ROOT_STATUS, r=
eg32);
>
> -               /* Enable Root Port's interrupt in response to error mess=
ages */
> -               pci_read_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, &=
reg32);
> -               reg32 |=3D ROOT_PORT_INTR_ON_MESG_MASK;
> -               pci_write_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, =
reg32);
> +               aer_enable_irq(root);
>         }
>
>         return rc ? PCI_ERS_RESULT_DISCONNECT : PCI_ERS_RESULT_RECOVERED;
> --
> 2.34.1
>
