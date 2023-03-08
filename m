Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6906B128D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 21:01:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PX39s2S5pz3cfj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 07:01:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NNrfEUVm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com; envelope-from=grundler@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NNrfEUVm;
	dkim-atps=neutral
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PX38w3nJdz3c3N
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Mar 2023 07:01:04 +1100 (AEDT)
Received: by mail-vs1-xe2b.google.com with SMTP id f13so16472672vsg.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Mar 2023 12:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678305660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiNCWoLz3c/503W2sfojq25rl/kZxCOdrOLAup4Rmwo=;
        b=NNrfEUVmR+mZeQysb05W4Sj5tC7LtLoMf313pV2A76V9DHpNFR0yY3m0+NBt2DXCru
         vwlgz6pd+RNPc9BngfiJXNgY1bl1A3Yyo7faNSGIrZoymKE7i65kiUdOPo0UAPeLpBWz
         J04olGSVimHV1DyP5hJVA3ap5WCvm3irq+hG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678305660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiNCWoLz3c/503W2sfojq25rl/kZxCOdrOLAup4Rmwo=;
        b=kRUPPXe81e8Qerm1U1ToYpzdaewt8ITDqe0s+sWuqgxo/dM+LE0PJss3LOgH/JEIMX
         I/FCF41iEdjSmErcn+9JejFifDlU6U5zoWntVRjLDDOA2RBjnEFzF5kTEH4nOUqn/Jeg
         4NDI8dN3C4GbRO1tLNTdUTR7fMAizlU1g2enCMroGLL0hOYvCUvmogQKUbMr1JYQ0hjl
         9JoYeOfQBF6mhsTUJL3hU7XSfiNC/9FEQIbgJv16iYkN/PgVqQR8bxacjqORNYTNS10H
         pSjAfOrTSQr92Hb9flTb4bgMCWRL38yiKXYwoRcM2l0HOI/ExwKsCKTMtfEIfryRgIZ0
         8CkA==
X-Gm-Message-State: AO0yUKW+CAkOx44Jy7X2PkNVXtEnEczdSZC6aaI2oz8nC1m/XNBMTAfh
	Vwwua/bSMCxpfxOW+uiI3etfqT6cKHRfbEjWaEvZ7A==
X-Google-Smtp-Source: AK7set85JyXeUavfBPCvXk86419F+WXZZSMRecR5Kl2iJ+RcOKGb5j+7JEgJUz86ywX7sr11eiBykb7yxQ1Tpb+1MEc=
X-Received: by 2002:a67:fe14:0:b0:412:ba5:8002 with SMTP id
 l20-20020a67fe14000000b004120ba58002mr18964498vsr.1.1678305659793; Wed, 08
 Mar 2023 12:00:59 -0800 (PST)
MIME-Version: 1.0
References: <20230301060453.4031503-1-grundler@chromium.org>
In-Reply-To: <20230301060453.4031503-1-grundler@chromium.org>
From: Grant Grundler <grundler@chromium.org>
Date: Wed, 8 Mar 2023 12:00:48 -0800
Message-ID: <CANEJEGvB0+XTgUwJi80BRFpNYWrbtiz17baSoxcR_OpSdnzahg@mail.gmail.com>
Subject: Re: [PATCH] PCI/AER: correctable error message as KERN_INFO
To: Grant Grundler <grundler@chromium.org>
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
Cc: Rajat Jain <rajatja@chromium.org>, Rajat Khandelwal <rajat.khandelwal@linux.intel.com>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O 'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ping? Did I miss an email or other work that this patch collides with?

cheers,
grant

On Tue, Feb 28, 2023 at 10:05=E2=80=AFPM Grant Grundler <grundler@chromium.=
org> wrote:
>
> Since correctable errors have been corrected (and counted), the dmesg out=
put
> should not be reported as a warning, but rather as "informational".
>
> Otherwise, using a certain well known vendor's PCIe parts in a USB4 docki=
ng
> station, the dmesg buffer can be spammed with correctable errors, 717 byt=
es
> per instance, potentially many MB per day.
>
> Given the "WARN" priority, these messages have already confused the typic=
al
> user that stumbles across them, support staff (triaging feedback reports)=
,
> and more than a few linux kernel devs. Changing to INFO will hide these
> messages from most audiences.
>
> Signed-off-by: Grant Grundler <grundler@chromium.org>
> ---
> This patch will likely conflict with:
>   https://lore.kernel.org/all/20230103165548.570377-1-rajat.khandelwal@li=
nux.intel.com/
>
> which I'd also like to see upstream. Please let me know to resubmit mine =
if Rajat's patch lands first. Or feel free to fix up this one.
>
>  drivers/pci/pcie/aer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index f6c24ded134c..e4cf3ec40d66 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -692,7 +692,7 @@ static void __aer_print_error(struct pci_dev *dev,
>
>         if (info->severity =3D=3D AER_CORRECTABLE) {
>                 strings =3D aer_correctable_error_string;
> -               level =3D KERN_WARNING;
> +               level =3D KERN_INFO;
>         } else {
>                 strings =3D aer_uncorrectable_error_string;
>                 level =3D KERN_ERR;
> @@ -724,7 +724,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_=
err_info *info)
>         layer =3D AER_GET_LAYER_ERROR(info->severity, info->status);
>         agent =3D AER_GET_AGENT(info->severity, info->status);
>
> -       level =3D (info->severity =3D=3D AER_CORRECTABLE) ? KERN_WARNING =
: KERN_ERR;
> +       level =3D (info->severity =3D=3D AER_CORRECTABLE) ? KERN_INFO : K=
ERN_ERR;
>
>         pci_printk(level, dev, "PCIe Bus Error: severity=3D%s, type=3D%s,=
 (%s)\n",
>                    aer_error_severity_string[info->severity],
> --
> 2.39.2.722.g9855ee24e9-goog
>
