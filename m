Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0151082EE03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 12:43:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QtFxrYYq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDnFM1jBcz30YL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 22:43:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QtFxrYYq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDnDT5vkFz2xPd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 22:42:15 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a2c375d2430so669774666b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 03:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705405328; x=1706010128; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ETa/IB76FnSUzUMCNIjO0OPtMyIpkffhHAQmKw0f14=;
        b=QtFxrYYqfnGff/xOe3R0KAHpirJBEsOmGrW7TqV2RlZozklE1xnHi7DVxq0HAI3vE+
         K7NcFtw5MnGREM25iW3015NV3pxVuupBxKgJ5BIUVqPF0tCkGRlBJsYLbQ8fopIplmUs
         3Ke44KmX3v2+h8H7J7dj1N++8rbJiERTEhz+28M8+FqZ745V0kq4Y0rWBeblbn0oidNn
         XND+Y0iwzJlzr++3Joy+GIBt3Gb/+aTuuQfq6qAEgBFUDWZGbaZ36M+Fc6gHHgX+w7n2
         WHbyrM1cO1BZlxfDmj7hOQraNfurl4/3y+nRf4mtBP4YRqTfKZIa2yNimlc/X5/fsq0Q
         rAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705405328; x=1706010128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ETa/IB76FnSUzUMCNIjO0OPtMyIpkffhHAQmKw0f14=;
        b=mriqUaUgUrG3pGkiMxy25taWmeZwzN7X2PIc2nHqlOrShCufJ5IZ7oNUBZq6Tf1M1c
         dyOqpu0cObuBcAMTIdM3a6eG/+jrRzwp1Ud0xEsTX07cbzB/C2HFrbtZJbGYeB5Mk2Pf
         sNotIckl0czCo1lyiomY041DrypZbjpJvTCj+kDQY+pvrWAZ7NKgOYWpAb7ARbJunhQY
         ollDHr09YWOEtIqIs5Rc8S4F45/f9V/xLWaq6V23uKusODOxCRgL02/CtypqL6ppY8ZQ
         9wOfB6Zc0tTOPbq7rZnqVSltSsEjTBJZcjUKeO1jlAm4nZUeRoq/W/Zgooy9WBAnnL1x
         P6BA==
X-Gm-Message-State: AOJu0Yx5JOvnEhjn7k2aDPUYY9Q9vUhg2aOf90YQEZgKeWJFktyqDGqF
	l25BMhumBeY5FCAR2vSIYXl9ZIRlfRnW7SJ0TV4=
X-Google-Smtp-Source: AGHT+IFIdXVTOsU0yGpd1l5hqqYw5SvEntjk0/FMvYbowcSgHq4IbAXkUksATwXJ85XfgfUxAQrwrtF3G0v3Xv8URCg=
X-Received: by 2002:a17:907:8b93:b0:a23:4e3f:a2fd with SMTP id
 tb19-20020a1709078b9300b00a234e3fa2fdmr4050086ejc.5.1705405327664; Tue, 16
 Jan 2024 03:42:07 -0800 (PST)
MIME-Version: 1.0
References: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
 <CAEnQRZAwk-USZqXwLOVuN3iTn7r-55BJH=Sqq5+2Od+DhrK0iw@mail.gmail.com>
 <347346270.284192.1702989565367.JavaMail.zimbra@savoirfairelinux.com> <361044647.7067.1703857544284.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <361044647.7067.1703857544284.JavaMail.zimbra@savoirfairelinux.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 16 Jan 2024 13:41:55 +0200
Message-ID: <CAEnQRZDaGazi8j4LYEoWmSTORET89DVjEwD+2EdTizKGFp0CAg@mail.gmail.com>
Subject: Re: [PATCHv3 RESEND 00/10] ASoC: fsl-asoc-card: compatibility
 integration of a generic codec use case for use with S/PDIF controller
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, alsa-devel <alsa-devel@alsa-project.org>, Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, linux-sound <linux-sound@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, shengjiu wang <shengjiu.wang@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 29, 2023 at 3:45=E2=80=AFPM Elinor Montmasson
<elinor.montmasson@savoirfairelinux.com> wrote:
>
> Hello
>
> On Monday, 18 December, 2023 14:54:03, Daniel Baluta wrote
> > I know this is extra-work but we would greatly appreciate if you first
> > convert fsl-asoc-card.txt
> > to yml format and then add your new properties.
>
> DT schema must have at least one maintainer in the "maintainers" field.
> Who should I put for fsl-asoc-card.yaml ?

I think it should be Shengjiu Wang, if he is OK with that.
