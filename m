Return-Path: <linuxppc-dev+bounces-8760-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09420ABDFF7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 18:07:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1zw34PZ4z3055;
	Wed, 21 May 2025 02:07:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747757235;
	cv=none; b=bszXA1Cj38rurWYYoIVdHGhQwRxqwPD+CUSHT5WT1Y4yVujssWRMIcWZympiqGOJcE9bMdBpGB7Xp41OuW1qPfGxs9HpBYNAkPSSWluevxQICWUZP+RPIBZfou2GIDY0WlUO53NlJWhHpBZMJ2/wzmat1MzeF4T09kZhcmM4Rrat86mazY+aYcl2is6CxE3Y4SezK6wC3qZF/5+KCxZYJnVTFIlQcCWYyXMcuYRob44Ny321T0xDEQ/XzsoNwGjoi/Qzc4CsP2FsRwhQWmAoK4+8y9Db5A/PS0LUkBjXE6/EfP9H6YR3dft87fomsEFEztDLIEMB/OBjas4DOzNduA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747757235; c=relaxed/relaxed;
	bh=ybC/xEWalGJ0RhCZjvyrvjbHro7QE2FQq7vzTeEzDcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JLGEp4kBFhGIvi8BCW9oOvUjHb1+MvjNRx8wx8WbsNPZ5deojgWTT9xuPFiTbIKQqmZi+LXYHnZZ3Q6JBETyZdXR2O0UaXWeWr4bhaKhGDt+zn5QDPiOgDsevH+/43btnVv1+5gkWgJ34R2Tm5hQbkvdrY9YB5OBckhJyz9UzPz+mfJzv33pGZHOkvHhs13OlqgsD2PgiD0wo47CgdFMiAO/pyP1HDLRdyWDuLgJ7/HqHTQi8bnfVBlf4rjFh1Uzc1NtGeI9WNRkFpWv7uxrikzmj4hNxekmndNbIqbPBVr/Jk4r5JVOezRyrVHzmMI2PZPSYwUqON0pnZiEPhZG3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M4xobwN8; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WeM/tAHv; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M4xobwN8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WeM/tAHv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1zw23GFKz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 02:07:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747757227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ybC/xEWalGJ0RhCZjvyrvjbHro7QE2FQq7vzTeEzDcM=;
	b=M4xobwN8EuRcfFeQ5UVKsTD6JaOXwYxS1yvgtwOiFHNPMeGIOrRU7nq8OmjqicAlcGptZc
	ppVRjienqtJs9d20P6Sk7VZPrbkEHclmpTR+7mcFNXiZEm4gFZwImy7uiCUJu3Nf+O3lpS
	TMo4iER2L6ByfEbzZALdvIpP0ewK7D8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747757228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ybC/xEWalGJ0RhCZjvyrvjbHro7QE2FQq7vzTeEzDcM=;
	b=WeM/tAHvDZssArTESU1weD60Qx/kGnqsC3CNNMzSS6pWRQdFeOjBsjYBqRFaPXLpVbJQG0
	26VzLiGcVJsz06L4oo4OPpDZ7pmV0wWkm9i57aO18ThZlFSkiNrPOhLVEyXq8E9KM0h9A1
	A71kjU4MdPi+w15IBAivZxuKzJ8THpg=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-0vAaRpc5PsWFmvsSJ41Gjg-1; Tue, 20 May 2025 12:07:03 -0400
X-MC-Unique: 0vAaRpc5PsWFmvsSJ41Gjg-1
X-Mimecast-MFC-AGG-ID: 0vAaRpc5PsWFmvsSJ41Gjg_1747757223
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-72c40592a9aso3908684a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 09:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747757222; x=1748362022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ybC/xEWalGJ0RhCZjvyrvjbHro7QE2FQq7vzTeEzDcM=;
        b=VrWTRJDF5RlGOO6RWQ5x3GZddUQxqJml3sPbqz4N2iB3Og3cm7kfETMwscHWvlmAHP
         KxbBtAhIPNcFKQcgd8nZ5hpT/eNn9Li5kQIzKovuxfhodADjFN368T0rOYoKSMFjdaR5
         tFXcCf/umB5h58SKbAxhFWBE+Nh6fdXlN6346sETxtu+2j5XYDUkdrePBX9Kl105THBo
         G3i4iAtwerS2hPMQdt8y/P848+Fi69TJJ/DwUGzFMUgKVxAGgLkMdxhYzj7XZKF4txlQ
         8vD3nvfCBZjIL7rXL3fRYMakO9P4UYDloDvxTxfxer+KQmx4yjSxNaj0LW/B/q7Dc9z9
         pN9Q==
X-Gm-Message-State: AOJu0YwV6dItnE6UbLUaw03Wuo2+8lpoHstbmKloAWIiVaZ+EiwUnnyq
	dAdaHe0lIZ5CX0MHPnzz1vPyryLcBlrBLa0uCZf5TeIHCNHc1/yc458bwrV8O/+evKDC1P/uh6d
	qe+HZU04h5h/XILYVI0z68WKGnqgriTr8QA2k6zFOzEfYm+LFdpjDYmhOx4soXDwfbt7C35NH55
	a9THy3Q9x3BAYlbvvHuqVHurRjkNfo7WZX1UXd5zhPew==
X-Gm-Gg: ASbGnct367Mc4xSmRWOd+THtjjNHPupZjEGNU8Wl1+E6fOTIAIDXfXblYXTYI7pFdK0
	bptmWs6Elza/p2dFK8VJ4Phqb/fzNUQxxjRi54jx5bqLzITvkkRILBwjJvome9LEislU=
X-Received: by 2002:a05:6830:658c:b0:727:372e:600e with SMTP id 46e09a7af769-734f6b1a0cdmr10030113a34.14.1747757222600;
        Tue, 20 May 2025 09:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1ly9i72+pYbDKe5Sks+06FCcNtf9xBC0iJ/paWfH1AFYyUe0Qn2IrAf+QY1o3hDZlmKZQmCGNGBhAxWj1dLY=
X-Received: by 2002:a05:6830:658c:b0:727:372e:600e with SMTP id
 46e09a7af769-734f6b1a0cdmr10030067a34.14.1747757222132; Tue, 20 May 2025
 09:07:02 -0700 (PDT)
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
References: <20250514134630.137621-1-sgarzare@redhat.com> <20250514134630.137621-5-sgarzare@redhat.com>
 <aCVHQ-LRqHeEVEAW@kernel.org>
In-Reply-To: <aCVHQ-LRqHeEVEAW@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 20 May 2025 18:06:50 +0200
X-Gm-Features: AX0GCFsTmlbq93tR0wE4C3RUpx9Z1D4kjkNOv4wLeycQRtYZ5zeOxDpm0iB8eVA
Message-ID: <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Peter Huewe <peterhuewe@gmx.de>, 
	Jens Wiklander <jens.wiklander@linaro.org>, linux-integrity@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Sumit Garg <sumit.garg@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kgEYkMCk0rJynV8dtX7IxOKI2Nh4nXJUBeuGjHLZUqY_1747757223
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 15 May 2025 at 03:45, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Wed, May 14, 2025 at 03:46:30PM +0200, Stefano Garzarella wrote:
> > From: Stefano Garzarella <sgarzare@redhat.com>
> >
> > This driver does not support interrupts, and receiving the response is
> > synchronous with sending the command.
> >
> > Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
> > ->send() already fills the provided buffer with a response, and ->recv()
> > is not implemented.
> >
> > Keep using the same pre-allocated buffer to avoid having to allocate
> > it for each command. We need the buffer to have the header required by
> > the SVSM protocol and the command contiguous in memory.
> >
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> > v5:
> > - changed order and parameter names to match tpm_try_transmit() [Jarkko]
> > v4:
> > - reworked commit description [Jarkko]
> > ---
> >  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
> >  1 file changed, 11 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
> > index 0847cbf450b4..f5ba0f64850b 100644
> > --- a/drivers/char/tpm/tpm_svsm.c
> > +++ b/drivers/char/tpm/tpm_svsm.c
> > @@ -26,37 +26,31 @@ struct tpm_svsm_priv {
> >  };
> >
> >  static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
> > -                      size_t len)
> > +                      size_t cmd_len)
> >  {
> >       struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> >       int ret;
> >
> > -     ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
> > +     ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, cmd_len);
> >       if (ret)
> >               return ret;
> >
> >       /*
> >        * The SVSM call uses the same buffer for the command and for the
> > -      * response, so after this call, the buffer will contain the response
> > -      * that can be used by .recv() op.
> > +      * response, so after this call, the buffer will contain the response.
> > +      *
> > +      * Note: we have to use an internal buffer because the device in SVSM
> > +      * expects the svsm_vtpm header + data to be physically contiguous.
> >        */
> > -     return snp_svsm_vtpm_send_command(priv->buffer);
> > -}
> > -
> > -static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
> > -{
> > -     struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> > +     ret = snp_svsm_vtpm_send_command(priv->buffer);
> > +     if (ret)
> > +             return ret;
> >
> > -     /*
> > -      * The internal buffer contains the response after we send the command
> > -      * to SVSM.
> > -      */
> > -     return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
> > +     return svsm_vtpm_cmd_response_parse(priv->buffer, buf, bufsiz);
> >  }
> >
> >  static struct tpm_class_ops tpm_chip_ops = {
> >       .flags = TPM_OPS_AUTO_STARTUP,
> > -     .recv = tpm_svsm_recv,
> >       .send = tpm_svsm_send,
> >  };
> >
> > @@ -85,6 +79,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
> >
> >       dev_set_drvdata(&chip->dev, priv);
> >
> > +     chip->flags |= TPM_CHIP_FLAG_SYNC;
> >       err = tpm2_probe(chip);
> >       if (err)
> >               return err;
> > --
> > 2.49.0
> >
> >
>
> I can pick this for 6.16.

Great, thanks!

Stefano


