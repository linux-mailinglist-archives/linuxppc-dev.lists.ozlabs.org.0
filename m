Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4885275DCA1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 14:41:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=W8fcx9Ka;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R7QzQ1N9Gz3cCt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 22:41:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=W8fcx9Ka;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R7QyS62kzz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 22:41:03 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-265c94064b8so376443a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 05:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690029660; x=1690634460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yi63nkdWEyg5JwW9Rp8ZnJaJZCtE++qAWqrDJGDd/lI=;
        b=W8fcx9Kauon7u1tfJGaqXbkNF4ma27irNc0xLsic9TvtlRXW7YqoPak9NK+KNyn9EW
         VW5QQUOI8VWljMHyE3Ayfi/srm/r7wmd7apwA/ghy/bfgaWlWC7EwWKuKxvlIt9Gk5hN
         6lj0Q+1kc9xERPYNq36rtIkigDopYtMd5/RPAHOL6LdVJxh3KMuQNl4821rvnjzo+Jfv
         7BBaSIeIUSPGHcZ1rTtPrBCpHkeRsubsFb1FFtRI/4WCCALYF7lsycZjwUA1KC4Dpda7
         XxaJDNKMF3Csw8w4qWxqgfYliRhbmiE5USO7G67PJlcHQZWnBDb5gZCdRWLoBqb7voay
         pxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690029660; x=1690634460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yi63nkdWEyg5JwW9Rp8ZnJaJZCtE++qAWqrDJGDd/lI=;
        b=cPGdZfulwCvzrUOAO4D7rDSzaRwUucY48PQlSMOIK9+VVCvIWyVBaWXGB9r2t4uRa0
         a+6m0LQokuP4JYohA8+kn1UNMcPQtD3Hn4m0DWK95RNrT6uZywLlX41E8RZIH297I4R6
         u8+Exw5SRUezEG2QBHEyVyi9xrX3wMhiuL36FM8iL46BbSEdaxe3Y9rhOzhFRoVcL7jU
         rbWMYmR5rUroYDEJPmhKJvAz67z3GQVIiBdUKRQR7dloPRTgM+pMLJ7cVn1isiI/wekS
         +mGpEqEdmHD9U9YtDoY+lQg4gdRQLsTGXKsakKrms8Zj97eJKm8x4wM3vUS65qD8IO9R
         ySFQ==
X-Gm-Message-State: ABy/qLazvTutQe5J83T7R/o6ZQ0uw6EuN0kKOMjgHU7fgAAKEEDasMZ+
	SVFerr5BHoJOUeN1m9sqoDH/kym/D+q6hRwBE5Y=
X-Google-Smtp-Source: APBJJlHDJwm1Gdh/SrlkFWDGs0nHM85oDjl3b/YvrjxKpekorxgmRlDCqBsg6UQcPXmybfu+3/BuGsUHZkhz1JFeaug=
X-Received: by 2002:a17:90a:b81:b0:25c:1ad3:a4a1 with SMTP id
 1-20020a17090a0b8100b0025c1ad3a4a1mr4159849pjr.1.1690029659665; Sat, 22 Jul
 2023 05:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAA+D8AP-3SWJe21qfMVz0j3umvS9bzDkeuQtab4OFrc2Ur+eVw@mail.gmail.com>
 <20230722123635.26623-1-ruc_gongyuanjun@163.com>
In-Reply-To: <20230722123635.26623-1-ruc_gongyuanjun@163.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 22 Jul 2023 09:40:48 -0300
Message-ID: <CAOMZO5AXY7ThO0dTLc47xE7a61k9QEXMTbgSAx2Dqy_3RJxoTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ASoC: imx-audmux: fix return value checks of clk_prepare_enable()
To: Yuanjun Gong <ruc_gongyuanjun@163.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 22, 2023 at 9:38=E2=80=AFAM Yuanjun Gong <ruc_gongyuanjun@163.c=
om> wrote:
>
> check the return value of clk_prepare_enable(), and if
> clk_prepare_enable() gets an unexpected return value,
> imx_audmux_suspend() and imx_audmux_resume() should return
> the error value.
>
> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
> ---
>  sound/soc/fsl/imx-audmux.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
> index be003a117b39..9791e56158ef 100644
> --- a/sound/soc/fsl/imx-audmux.c
> +++ b/sound/soc/fsl/imx-audmux.c
> @@ -325,8 +325,11 @@ static void imx_audmux_remove(struct platform_device=
 *pdev)
>  static int imx_audmux_suspend(struct device *dev)
>  {
>         int i;
> +       ssize_t ret;

Why not simply "int ret" instead?
