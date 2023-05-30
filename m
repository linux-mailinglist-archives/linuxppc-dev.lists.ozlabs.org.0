Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 453947168C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 18:10:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVy635dJRz3f8n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 02:10:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hVGRu0pr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=azeemshaikh38@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hVGRu0pr;
	dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVy566hNqz3cL0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 02:09:14 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-30aeee7c8a0so1533645f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 09:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685462949; x=1688054949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oi0/JSrKBypgCtjQEoow24NFxZocncTUaEgKTBeFpRQ=;
        b=hVGRu0prW/3S+Zg8ZJ1Tz6XPV24/xDsOnyP8dFoMgmQfP0JUFuGqzGAcHbka3yAuPQ
         SugcRLOkP9/VXsMnyb5id8VqYhISd6rVqpv+IzZhHwEnPh8gK+cOM9uUUlpuuRsgjaK8
         DDZcZj56JHwrW2bTx31CI2+JAgYVbAo+zEklLQJSU8zRs/rUOUlaJyCRPdHZCMYUuS03
         MzBB6AKo150s/58E822BDtV6WS0NMm+H2VhSceuzQ2kmLspIPTfBrfoJT0Nur10k+2+o
         Jun10e6ds2y8NxmwzAY3mvh31Jc268Dw06p+PXjB9BUe0/Hdk7foKMlXbEm7xzvMo/jo
         9mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685462949; x=1688054949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oi0/JSrKBypgCtjQEoow24NFxZocncTUaEgKTBeFpRQ=;
        b=jhiyuszHILhS6jJTLis0+cTcA5jLhffsaeioMud3v312OcAboqjqETFs0YBARGfpON
         oz2aJooVLNqYWSXFYD+tcM+0BzgHIcpv/JBZ7bTuzkHATHQaulWMG895AxegYyOjp3Yx
         p2miJ0o0/P0EBuYicizdXzk/tAt68BRHqwBeOa+aD0ngPjbt/HjnYIVkj8uXSDiBqBBr
         eRiK9I3FH63Pc8avA26IC3nZLJNRpLTSFqLVo0DpkraJUhNLvoC8s+BCBO3zhHhqxacQ
         lggKjXdQCMI6Ety/bQNQksnUsGZMRG9T04Ct7exgE3hPPzt8LFWGBT8yxLXTvbwZqHyC
         4Y/w==
X-Gm-Message-State: AC+VfDzXuVsY8RNHqw7wCbhriGqM3NAZL3Gn7BoKVvDE7bdNXt5roHsX
	bW7ZornBv+suG3JdA6omW0mLiNDSscvK+U9Tq80=
X-Google-Smtp-Source: ACHHUZ6aXodoM2hGVPxieUQ1l1WXdJrNDTm1QeHOWlvIwTAqEarAHbF9cm8DW7PE6ssRdnEeq4SfiQDwReqkPJLAiTQ=
X-Received: by 2002:adf:f812:0:b0:2f6:661:c03c with SMTP id
 s18-20020adff812000000b002f60661c03cmr2525443wrp.28.1685462948658; Tue, 30
 May 2023 09:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230530160033.411441-1-azeemshaikh38@gmail.com>
In-Reply-To: <20230530160033.411441-1-azeemshaikh38@gmail.com>
From: Azeem Shaikh <azeemshaikh38@gmail.com>
Date: Tue, 30 May 2023 12:08:57 -0400
Message-ID: <CADmuW3Vgraciy__V24wHF0fBstT8odmMm6t1bUxZLeyFi9P6fQ@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: Replace all non-returning strlcpy with strscpy
To: Qiang Zhao <qiang.zhao@nxp.com>
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
Cc: Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Duplicate of https://lore.kernel.org/all/20230523021425.2406309-1-azeemshai=
kh38@gmail.com/.
Sorry about that.

On Tue, May 30, 2023 at 12:00=E2=80=AFPM Azeem Shaikh <azeemshaikh38@gmail.=
com> wrote:
>
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcp=
y
> [2] https://github.com/KSPP/linux/issues/89
>
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
> ---
>  drivers/soc/fsl/qe/qe.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
> index b3c226eb5292..58746e570d14 100644
> --- a/drivers/soc/fsl/qe/qe.c
> +++ b/drivers/soc/fsl/qe/qe.c
> @@ -524,7 +524,7 @@ int qe_upload_firmware(const struct qe_firmware *firm=
ware)
>          * saved microcode information and put in the new.
>          */
>         memset(&qe_firmware_info, 0, sizeof(qe_firmware_info));
> -       strlcpy(qe_firmware_info.id, firmware->id, sizeof(qe_firmware_inf=
o.id));
> +       strscpy(qe_firmware_info.id, firmware->id, sizeof(qe_firmware_inf=
o.id));
>         qe_firmware_info.extended_modes =3D be64_to_cpu(firmware->extende=
d_modes);
>         memcpy(qe_firmware_info.vtraps, firmware->vtraps,
>                 sizeof(firmware->vtraps));
> @@ -599,7 +599,7 @@ struct qe_firmware_info *qe_get_firmware_info(void)
>         /* Copy the data into qe_firmware_info*/
>         sprop =3D of_get_property(fw, "id", NULL);
>         if (sprop)
> -               strlcpy(qe_firmware_info.id, sprop,
> +               strscpy(qe_firmware_info.id, sprop,
>                         sizeof(qe_firmware_info.id));
>
>         of_property_read_u64(fw, "extended-modes",
>
