Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0311E74249A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 13:00:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IJJG70VR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsFqX6Sl4z3bmm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 21:00:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IJJG70VR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsFpf5dJPz307V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 21:00:09 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-66d6a9851f3so144182b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 04:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688036403; x=1690628403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNuvCv0VFWJ1T/BA1jgFsWK/sbewukgBLN8NThITlGY=;
        b=IJJG70VRTfv6SzZDiw5KgcGaeym0vz6jCVdSX8aL1AtgKYxIKxEz+FbieZyrRKMKt6
         XCNCfb6e0kP4qrLVYCOdleUjQ0iPjzq7WtSDVVd1E/SnYE0lqHji5iXyEH54McdjI3Q6
         aGP09g3gRxxOG3bTuanQqLSGUYvKcsHm5AbgJBGY2+BeZSDjm6FHWKrH5NokTFFFcK4n
         5M0DelgYVruwm87q4YsvLXl0PCpvA7mJRxPfLrw0EJJgh1S2hE6eMETfer+m2znDNGz+
         rx7t9Pn79B0zCEhWoBBcJnDez2ncEfQAzyDnYf6kYmZsBkPiLUqjN+/nFgPhNsy3lsLQ
         N82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688036403; x=1690628403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNuvCv0VFWJ1T/BA1jgFsWK/sbewukgBLN8NThITlGY=;
        b=YR4ZPOtdwqimwvq5hHdoNzXEhuu5bF2E7FhNbuekEQzXPPTgOWJ938nIephra+I4o7
         OVdltWvCQlHmxZNFeeCUeRTdT7oQcdWz/imMdphnQ6MwVcPDUHNrBcCOmoDvPc1rCQVw
         FlGrKKZ2KvcmUDUoulBV9CvhTtsGcveQ4UqMnk66GwQfBwPHWOBBo09iJyNuCbmREnJd
         eVjPAXa8g7WZIf00aFihS/9Iv/m2AS1T5ADxN7B6Hp9cwyStPIt3Ov4RSJnQszPoLfjC
         zxrpRqtLgFQ56APNMc2b2EeMOOyEl2q4UCK1rGE3r7K4enkJcIEP68OadfvMNWEVacPj
         Ft4w==
X-Gm-Message-State: AC+VfDxOa9ZvTajnR8sewX+PCckmjUgM669C45wjWzdST97aPlluXmWe
	5ixZ+04eOiEcymhRBm5IMMR08uFYWh9sB0zG7qQ=
X-Google-Smtp-Source: ACHHUZ4241Q0Xok00mtSesZ0ScAf8EpY8gqClpDPFmqvjMGqm+Sl0vzMI5IyImuqQIvVL0JNHSy7d4g+Mx22zwDE2r4=
X-Received: by 2002:a05:6a20:7295:b0:111:fba0:bd3b with SMTP id
 o21-20020a056a20729500b00111fba0bd3bmr45440823pzk.1.1688036403198; Thu, 29
 Jun 2023 04:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com> <1688002673-28493-4-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1688002673-28493-4-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 29 Jun 2023 07:59:53 -0300
Message-ID: <CAOMZO5DPHmm7YuHBfYHpx2-g4R6t1BQ93GBAZvyyb_rBz7+hFg@mail.gmail.com>
Subject: Re: [PATCH 3/6] ASoC: fsl_easrc: define functions for memory to
 memory usage
To: Shengjiu Wang <shengjiu.wang@nxp.com>
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-media@vger.kernel.org, Xiubo.Lee@gmail.com, lgirdwood@gmail.com, tiwai@suse.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, broonie@kernel.org, perex@perex.cz, mchehab@kernel.org, shengjiu.wang@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shengjiu,

On Wed, Jun 28, 2023 at 11:10=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> ASRC can be used on memory to memory case, define several
> functions for m2m usage and export them as function pointer.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Could you please explain what is the benefit of using M2M in the EASRC driv=
er?

A few weeks ago, an imx8mn user reported that the EASRC with the
mainline kernel introduces huge delays.

Does M2M help with this aspect?

Thanks
