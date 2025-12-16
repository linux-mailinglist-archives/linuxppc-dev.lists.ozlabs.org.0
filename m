Return-Path: <linuxppc-dev+bounces-14809-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFDDCC34AD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 14:41:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVyky4Drdz2yDY;
	Wed, 17 Dec 2025 00:41:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765892490;
	cv=none; b=ZCc5Vwbl52GTWj7VM2LR98TcgDkeDYzWOm5S2trJV2ZvJOoFNmp2V2YzgfCXuZgqFaDVb/YAGvtNFu95rn8txBp0fVpJyCP3+TyKR0Thg8bLZmwthHWp9PaMu+/7xrFMNLGtth/+CKkkaWynvhw/tQmT53+Rf8d8D2rT9/jTXzDIVdyWk38M5Hx2ar8papHd43FFs0aQrCtIYPPry3v6GK3sKGLIgnhkuE6Ef0YPvC03f+jVpYwjdwMpoxYTiN80Afm7MQDuauFyBxR/atK8xEZZVRQF7mP0YmSAQATMQ2FsbVuy36hiXRRWslhVBFEWQHdgPCjQm2TAgi1r47e0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765892490; c=relaxed/relaxed;
	bh=5ee4Zz0D9ytcS7H682D9wvk4H4KdC+3KAMY2EuDrq4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UcK/ZabIcdSh5iIHHE/sf7f86xkW6tYGv5ux3t+TwYezZJ9cTnY3Kp0CLp9PSEifu+mJtoYO1eQLOllBUQedVpHEJ5qzDPj4uSjv+HOImwq2oSw8igSnrR4OPk+NPlmXaj3G0hRFpVP1QPkoOKoKJxJXZY/xi+GKlNLwr8mGG72HAtB66TtrXO6m1QAYsWjpgMYl83KhEZcElvtETnLYhwieTcxh0NrkYOUHCJL7MvaUcEfr2WvK7RzMZMN6+cEUzW0iSW+gzT7vEyrQHwcoXXtCUX2mYQfift3JNWIcnop+D5ZnVDJ9rzhkiksBB1aVq/TuHA52BrtVGXvtguTNTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QWUWvuE+; dkim-atps=neutral; spf=pass (client-ip=209.85.167.46; helo=mail-lf1-f46.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QWUWvuE+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.46; helo=mail-lf1-f46.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVykw67r8z2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 00:41:27 +1100 (AEDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5943d20f352so5849527e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 05:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765892424; x=1766497224; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ee4Zz0D9ytcS7H682D9wvk4H4KdC+3KAMY2EuDrq4c=;
        b=QWUWvuE+0n3Q8OaYXd1ECu84vlO3GIOQpKf3mLFBEOMpAffbqtryGwGqqiea9y52KZ
         LofRSgYGsUhDH6U0LHC3EO7BfsSlG/2gcBcg0gcmP2TKQEdGAvWxrHcH8xtHZ0+Ulq7l
         oJsqJQVWUzTiyf6wqHIa7tkERjZ+qSzEXEbuT2EkB38NKWzCTZnBbuRZFJAM8TFhDl3h
         y028VM69/wGR10roChiuCnPzCXGDlg5Y/GYq5nx1JfHSvvsIXS0gUCudGzL6aNSstF8K
         7KBmIm+jIvVK5EFW3TLO2jvOh8SryBtdcoX37PoEx3CVen8T9wa+CAejSUiruvHNedIE
         wwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765892424; x=1766497224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ee4Zz0D9ytcS7H682D9wvk4H4KdC+3KAMY2EuDrq4c=;
        b=lHOx5okw1pZ7mGUx06nqIu6rn2aCf1zNSCJ5BLnpD1aiG9HD+knGQf7Ng/YIbbtD47
         ZMu/7Fs7+uLCKrnNfw5UmkXCmQnqZLswzrTfwo54i8oOg45yNblJVfMUDxyIgX9Hr6zw
         ct5HoK+NBw0ukYKItT6ZRWmlab+wkAqzVlppAKi7aZOUYGxbtQgGvwV0uZWOcfQugDcO
         NSG82C0KU2Tn2r8g91DTYlf10Cd+vqRF2ZvaUz5PGvOE8xKYUBNFsoVP6it9NE5GgOW3
         a2cK0BdueGFFgSMbtZK9qsQBGIcmCxkClLzzwl4QDyLUwb6hdTlOeDXLJrLy+9e4rT4i
         bEtg==
X-Forwarded-Encrypted: i=1; AJvYcCWNOFA6Hy0I597rTVqkV92fHqnrCKuNgUKt2+5A41v0AVgZlwOh+McH0WQSVclnan79JZGMye64ZgsmmYk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzkjh04ixuzD1aPQQONbXl+s6cDeOWcZSj+wNbH0eGX2sRe/3s8
	5uFEsnlRKy9Cebo6MuFSlg6YYi/PmKnz888ZDfwjzRmVKpP6asTTQmLXJsZ10wnVbBFyMR68c36
	sSAp3/jBSLTqCj/EPqImS3JFNKPIh5oY=
X-Gm-Gg: AY/fxX5tqk3AOc3goIpEPRFNT1HV6ojIjPuUbcZtu47ayqf7Ai/EiZSD8CA3O1Ao6C+
	sRHtQkPrEj6dTkAJQXVj1MoONcSjAl0Xr5iPeyVmBkdym8b+7z5FIMriAlKLnxYB7Hrvi8KCm5t
	LlQMBxU0GrnOPrNs/WqRncvV5gF+Hkrh7ri/ALIl69RC/v7H8bvuOIvQdqegCt4mjTVMPy0+4rs
	mbxZKQoh6SdORrsI1GGQUlLG1rlF7IWn5N6UwcsLN4XzlTk38q9+KYuh0kHIgSEuAz3JB5+Sd+h
	N2EVKkS6/Ziju7B990SbvnidFA==
X-Google-Smtp-Source: AGHT+IG6PHKV93VLlDgo3F9ExLDBvuvEH2IBl9c0XAav+v5vKoNk/HgkxZLxn472r/mSjzFUQm2ILxTteHPp2+/RnlM=
X-Received: by 2002:a05:6512:2207:b0:594:2ff7:9d29 with SMTP id
 2adb3069b0e04-598faa33bd2mr4880294e87.13.1765892423460; Tue, 16 Dec 2025
 05:40:23 -0800 (PST)
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
References: <20251216094045.623184-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251216094045.623184-1-alexander.stein@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 16 Dec 2025 10:40:12 -0300
X-Gm-Features: AQt7F2qZF3f-L8eLmpiAwAAP8lHE9tMfxenOhSlQvdf4WCcx_Deg76JxdUu8eKI
Message-ID: <CAOMZO5B1Wf0zmOA23VNLrNW5rsB1at_qHoMk3ytj8aU8eM26Sg@mail.gmail.com>
Subject: Re: [PATCH 0/2] ASoC: fsl_easrc: Fix duplicate debufs entries
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Alexander,

On Tue, Dec 16, 2025 at 6:41=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> this series fixes the error regarding duplicate debugfs directory creatio=
n on
> TQMa8MPxL (imx8mp) when easrc is enabled:
>   debugfs: '30c90000.easrc' already exists in 'tqm-tlv320aic32'
>
> This is caused because fsl_easrc adds two components which use the device=
 name
> as component name. Debugfs directories for each component is created, res=
ulting
> on name conflict. Fix this by adding the debugfs_prefix for both componen=
t
> drivers.
>
> Before:
> $ ls /sys/kernel/debug/asoc/tqm-tlv320aic32/
> 30c30000.sai  30c90000.easrc  HiFi-ASRC-FE  dapm  dapm_pop_time
> dma:30c30000.sai  tlv320aic32x4.1-0018
>
> After:
> $ ls /sys/kernel/debug/asoc/tqm-tlv320aic32/
> 30c30000.sai  HiFi-ASRC-FE  asrc:30c90000.easrc  dapm  dapm_pop_time
> dma:30c30000.sai  easrc:30c90000.easrc  tlv320aic32x4.1-0018

Thanks for fixing these error messages.

For the series:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

