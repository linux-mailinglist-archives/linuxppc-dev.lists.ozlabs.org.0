Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD977562D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 14:32:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=adSle6S4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4M152sSrz2yWD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 22:32:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=adSle6S4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4M0D24y0z2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 22:31:55 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-55b5a37acb6so455838a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 05:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689597110; x=1690201910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhtKDGLkYdLlMzTZE+T1BryE5vukkd/SRUwBcJXGkYE=;
        b=adSle6S4qsLISaMws72/D7IY0mwUp/nesW94VNVtbmdc6XDZ7TC6TFQwBCdStwhr3F
         07xlBBvutoTmqDWX/XDMJluLs4bdCB/ow17FqmqN8vaCWz5n7bVCbbsZXfk8EPuCXVwT
         nd1uhYhy2sZin05dMd8A3na86l/KiYqagH6mb/T15SOtsl/FXwRH1E9HSbj31BkFexdX
         WvoQ6LdhwlRT1N3j9KU+98wympgjOrdQ0P0Atno/H2W2OOVjQMKTWy1PF3g5cpOs1pVw
         HUZjoxHjy7yTb5SJf4JvtptbWgVGyLBWKLu0TARWVQ7GwUkoe0YsPdoDm+f1qudH2c3H
         iquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689597110; x=1690201910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhtKDGLkYdLlMzTZE+T1BryE5vukkd/SRUwBcJXGkYE=;
        b=f1qbF5yE0Yok//q+nr05M4pzpY/azqlNXE8dXFy0p6JxQTP9nd9NQDyhJ1kWfskp3/
         8lHpXAMnrH9X2Sf9d6uVufPGTMwyeu8qgUU1/GzsWMKJ/kP9B23SOYK2CLt1R+12T4C1
         SqSFJM16xv3PYwBe6okEKFCHi5kiJy7VT7xLdZ0K7Dk2ZPQqVP60ql+0Tl2Zh05NKzVW
         vQB+G/Nd5GS518Fv/Gqhd07dcxwk6H8W4FgOIC6RZ+DIEPN1Y6NWp+B6tkgeR/bXsJV9
         a0VEa1rC/xNA81tgNWUat7ENry8pSTscpm3hB0LEYqD7PQdqr+clgmmxkXFyPiBmokaQ
         st3A==
X-Gm-Message-State: ABy/qLYVHbpLKZXCJaq0YRqHOHR+t73TUtFIRfujrsoeYmsz6QbigDMB
	tNgS6kENEvWEKgWT/xIcJrGhLjNlmP54AqqTqiQ=
X-Google-Smtp-Source: APBJJlE88ZKilmPeyPMniQza3GQ3pBQrLfygkPj1jJXbn1/AdXpYoB4MvfL+s0Esgs/EA1CzPEUZ7pYqEn2WGR3dgH4=
X-Received: by 2002:a17:90b:3c43:b0:263:484c:f173 with SMTP id
 pm3-20020a17090b3c4300b00263484cf173mr11550745pjb.2.1689597110032; Mon, 17
 Jul 2023 05:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230712124934.32232-1-matuszpd@gmail.com>
In-Reply-To: <20230712124934.32232-1-matuszpd@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 17 Jul 2023 09:31:38 -0300
Message-ID: <CAOMZO5ATTK7UsTRPTF_7r86WbNmAhtpEphO2u896QqARTk2kpA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Disable bit clock with transmitter
To: Matus Gajdos <matuszpd@gmail.com>
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 12, 2023 at 9:53=E2=80=AFAM Matus Gajdos <matuszpd@gmail.com> w=
rote:
>
> Otherwise bit clock remains running writing invalid data to the DAC.
>
> Signed-off-by: Matus Gajdos <matuszpd@gmail.com>

Should this contain a Fixes tag so that it could be backported to
stable kernels?
