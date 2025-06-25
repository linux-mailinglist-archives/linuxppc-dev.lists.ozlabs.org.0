Return-Path: <linuxppc-dev+bounces-9780-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5DDAE8A2B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 18:43:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS70W2kjFz30MY;
	Thu, 26 Jun 2025 02:42:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750869771;
	cv=none; b=THa0WmQW6p+pe9pCN+rbkd8kx1XwzXySUAZUiQKNPeXnHTNzLbsui2TKAFDr0+Bfqnk7BVRmQjMTs13RKQjorngFz6dVavMibR06YVuySAzlDQRnd31jVwMRQMj1M9d2h/CZpE3uESQdIU+udp/LqjFmv22oEZktFAWpybZgem5eEb+MnFNY8yPUqlGBPOYznnCC5BeNrfqI+b/siABLK6VDcz6gQICyqJr+FPHmPPnIresxIYvwVdX30cAxseMlkCY54HqMQrDm/4qOMmOtlJ0U2zrJ48kwXaC0sUAfo+qx0awYsHt6zu5hTvOr0nLioUOGEi+ez/a4dwtu/uFMZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750869771; c=relaxed/relaxed;
	bh=Nlfl0HvL6p5C9wiWXuv3ZyT8srkPY79gCbVcPY25wgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nprpnxd3tbfgAKPDrptCgtHtLxhwSng6KnQBbpuEJo7fy02cX5N0TJ+kiTA7Y35TJ69vCjqMyHQa39SLjk0NVH5Rx3/vaxPUrgFyJ8OUfmdSxttSrCybYQjd9Il64k3a1COWuTICbhGNyqHXNr5gI2IzBKzlIwNQSRAvCiACfh8ALD/Ew2TJBrxlnlHAy8E6P0BIGCrOsfLaHDjoDF1kkuhS5JG82QLfOVXzVDk8NznI93Z1y6ZYQZubPN7nt9Dqig7mDqRnBt4fiP2Ck3zN+SjmvwxxGE2HHb9kwZKMxx6RjQZPoYodGy2g5U1nhCkVmXiWS/2k+ypxycouKJIQCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YkTaL1mu; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KEAxUpn4; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YkTaL1mu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KEAxUpn4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bS70V0p1Xz30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 02:42:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750869762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nlfl0HvL6p5C9wiWXuv3ZyT8srkPY79gCbVcPY25wgE=;
	b=YkTaL1muQkscOMq/yYdhIlqoTzEznbiGIef6upiEu0ZjC5jNPUmta/33QbaWmdBOvaaBa1
	DWRvmf+sBoPqhWOQ+JTzBaXzNvGegyJa5BjHP+GLiDEpmZFxHCSv+6kSHJ3LTBnc5uOcO3
	1xJU7MCLlkUj3Huw7W6flPiQYv/krG4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750869763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nlfl0HvL6p5C9wiWXuv3ZyT8srkPY79gCbVcPY25wgE=;
	b=KEAxUpn4sI+pd+NIXAq5e6m5rSa+z1/vgh3OVVllUjaIxVgbTnaGygBt+sSjrlG8I1iSP0
	WTo87YmMVOb63Mm/brnwRmfUGt4TOOpQLhOVeTL79FI5vXZmWmfF6WTqKjRmMXL6MYvtRo
	xyjvaW/BLtNIoPpUknMHk4myyzCS4h0=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-WrKK6V80PGiXPsHl_uRzwA-1; Wed, 25 Jun 2025 12:42:39 -0400
X-MC-Unique: WrKK6V80PGiXPsHl_uRzwA-1
X-Mimecast-MFC-AGG-ID: WrKK6V80PGiXPsHl_uRzwA_1750869759
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-714052e5103so1090307b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 09:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869759; x=1751474559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nlfl0HvL6p5C9wiWXuv3ZyT8srkPY79gCbVcPY25wgE=;
        b=wNU/g837Py/vPPaHVcT1b+9/RxFORQwhg53UnYb8rHjmtMwAR/ErCd5lIgdmBCRFsJ
         gAieWPy7+2n/ea1A8n9AMgGZkcWFW7XAwl2ysZta87ztW1FNP//TpNmX08kF3vP1AFOO
         JDWCS/a5vdnO1jwF0V6e+w/v37KEdw5NOO7Y0U2/NGE6vqWNE0/GfiAHO3b3f4rzYWTO
         b/bqKQ6vaAvbPNfPmPG5KZPHhEGcHihirNkGw1U5l/TVxzN/1UBjigVyLFpuMStArfz9
         445p+mVKK0jzJ0w63swBjJ2HLQU2GIEYitEjm4uM+0XKS/nd7FKo+cn8GWk1+hi8r2v6
         uKpg==
X-Forwarded-Encrypted: i=1; AJvYcCVkedipaNKrg60R4TNzxe990fWOnJIjlDwcSQyazWqbf3mF9yn8sL7ArJmqAYZzCTWUP5lUo8S/rHYS49k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxkF2J7Mi23xWNyXknfsSUBkPHVb+EUp5aFjXWEtakuh/1vYKua
	jezNj0OFA+ppmf6UptN3Mv3WqkEtQolkQgzlaqvDLXphOk7ySkg35D+fHZSeczRk+dYxq+5VDYr
	6G3IrM8FlP/xv1Nz+AMZJOFZg8DiDMPSgaKqR67J80wwzHsUqIj9XjhGgUwk3vo6OPj8A6IxiDo
	e7u7f/MoLnWZRasZ74eubqsPAPzbmkiBPmUBaVEu353Q==
X-Gm-Gg: ASbGncs2wyLyUA8L9Zls17HtnYk6Q9ayeDaEHK5ye9BYTL1/x7VwXlVAUCRa9dZIPCw
	cESk68da6LqKtVsC1jVfbzuFz0xonSzv/N6MGkS79/9Y2d7R0d84NIO7jSPsBeiVh9MRLhsd6mp
	4soi10pg==
X-Received: by 2002:a05:690c:6b0c:b0:70f:8913:ed66 with SMTP id 00721157ae682-715087c70bdmr10121957b3.38.1750869759008;
        Wed, 25 Jun 2025 09:42:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFieNmTUGgh1wCgADlrPL5JDmEvLuKpDHJRUgQ2djJiYYhZb7UVT6EWDckb5lNTgx4pKSPLhXjmzcMJTZ3XZMc=
X-Received: by 2002:a05:690c:6b0c:b0:70f:8913:ed66 with SMTP id
 00721157ae682-715087c70bdmr10121207b3.38.1750869758423; Wed, 25 Jun 2025
 09:42:38 -0700 (PDT)
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
References: <20250620130810.99069-1-sgarzare@redhat.com> <20250620130810.99069-5-sgarzare@redhat.com>
 <aFvlaY0BNjaGxU1D@kernel.org> <aFwQ129i_HYzG3aY@kernel.org>
In-Reply-To: <aFwQ129i_HYzG3aY@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 25 Jun 2025 18:42:26 +0200
X-Gm-Features: Ac12FXxEB7j1Pqu364HQDxXaTieTzsNMquFeCJO9Pw5PNZpgUTeipi1JP5Ohhks
Message-ID: <CAGxU2F4q_UyBiNqWfQMVAXqsWQbtu5ety9MTpg35eRcE=eVqjg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Naveen N Rao <naveen@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	linux-integrity@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>, 
	Jens Wiklander <jens.wiklander@linaro.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Michael Ellerman <mpe@ellerman.id.au>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JhqGREWGA4FKC5u0KJX4j01L8-s8lR8ATQcMxyjaznM_1750869759
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 25 Jun 2025 at 17:08, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Wed, Jun 25, 2025 at 03:02:54PM +0300, Jarkko Sakkinen wrote:
> > On Fri, Jun 20, 2025 at 03:08:10PM +0200, Stefano Garzarella wrote:
> > > From: Stefano Garzarella <sgarzare@redhat.com>
> > >
> > > This driver does not support interrupts, and receiving the response is
> > > synchronous with sending the command.
> > >
> > > Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
> > > ->send() already fills the provided buffer with a response, and ->recv()
> > > is not implemented.
> > >
> > > Keep using the same pre-allocated buffer to avoid having to allocate
> > > it for each command. We need the buffer to have the header required by
> > > the SVSM protocol and the command contiguous in memory.
> > >
> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > ---
> > > v5:
> > > - changed order and parameter names to match tpm_try_transmit() [Jarkko]
> > > v4:
> > > - reworked commit description [Jarkko]
> > > ---
> > >  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
> > >  1 file changed, 11 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
> > > index 0847cbf450b4..f5ba0f64850b 100644
> > > --- a/drivers/char/tpm/tpm_svsm.c
> > > +++ b/drivers/char/tpm/tpm_svsm.c
> > > @@ -26,37 +26,31 @@ struct tpm_svsm_priv {
> > >  };
> > >
> > >  static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
> > > -                    size_t len)
> > > +                    size_t cmd_len)
> > >  {
> > >     struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> > >     int ret;
> > >
> > > -   ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
> > > +   ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, cmd_len);
> > >     if (ret)
> > >             return ret;
> > >
> > >     /*
> > >      * The SVSM call uses the same buffer for the command and for the
> > > -    * response, so after this call, the buffer will contain the response
> > > -    * that can be used by .recv() op.
> > > +    * response, so after this call, the buffer will contain the response.
> > > +    *
> > > +    * Note: we have to use an internal buffer because the device in SVSM
> > > +    * expects the svsm_vtpm header + data to be physically contiguous.
> > >      */
> > > -   return snp_svsm_vtpm_send_command(priv->buffer);
> > > -}
> > > -
> > > -static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
> > > -{
> > > -   struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> > > +   ret = snp_svsm_vtpm_send_command(priv->buffer);
> > > +   if (ret)
> > > +           return ret;
> > >
> > > -   /*
> > > -    * The internal buffer contains the response after we send the command
> > > -    * to SVSM.
> > > -    */
> > > -   return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
> > > +   return svsm_vtpm_cmd_response_parse(priv->buffer, buf, bufsiz);
> > >  }
> > >
> > >  static struct tpm_class_ops tpm_chip_ops = {
> > >     .flags = TPM_OPS_AUTO_STARTUP,
> > > -   .recv = tpm_svsm_recv,
> > >     .send = tpm_svsm_send,
> > >  };
> > >
> > > @@ -85,6 +79,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
> > >
> > >     dev_set_drvdata(&chip->dev, priv);
> > >
> > > +   chip->flags |= TPM_CHIP_FLAG_SYNC;
> > >     err = tpm2_probe(chip);
> > >     if (err)
> > >             return err;
> > > --
> > > 2.49.0
> > >
> >
> > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>
> Applied.

Great, thanks!
Stefano


