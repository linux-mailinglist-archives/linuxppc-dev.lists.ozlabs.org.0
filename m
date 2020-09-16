Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAE326C2A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 14:22:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Brzkv6m7HzDqWG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 22:22:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rU44eXu9; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BryzB70ZqzDqVL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 21:48:19 +1000 (AEST)
Received: by mail-lf1-x144.google.com with SMTP id d15so6603719lfq.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 04:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8EqraEW4q0BQREzcz7DOOl5CowgKAV1RWSkOPCRavNE=;
 b=rU44eXu9IYnr41wxdt6v9T2BK23fXOMiYHbuvJ4fBvbIhQJevbN9DCu7zeoSzO1b7r
 XNnu+btJPV045o+iwfbkQjbyUDrAOjfp6elbTCasVlluLFW5gIHT1X4yyVMsJJSLCNAC
 w19tIW8BZ6o4Laen2U7uJnAps2VyVw0pZtsvyenkUx/e0PJjbGpRc5c+UKkDiRuxNx1Z
 Vy/jgkfhkbKz8hoq4Z7JSgBxGLEoMUrX6gT9NxbIf/7NGcZQYxDnj5nAaqPkHAqpqUgG
 xl042OMDHACLbpwLg253ADTbCnsM8kZMCesIY07WiMgcAcKlZT0dgv668gr+5Rz4V3QD
 N2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8EqraEW4q0BQREzcz7DOOl5CowgKAV1RWSkOPCRavNE=;
 b=IY3oa0f+JHHzRseaZe/9WS/bIMxH5wtEdnZ1L1w7P6JDw804G9l2u/nUOEz5DySRNc
 FWCl3PahUMUE8UTtG5YjJ7wVV3qIO0Rbm7d9GoH6z17RGybWHGDnerrSkZbCl1KCn4SM
 QmH5jG00MJ0EMWtdK94SY75N8he/83bERcB/ePCFUBz6Mz7VBqh6lCUj2mJXccmjiOlF
 DY4QPu7641ai+0TMgrySnrsDN0VU2hILBqebOC01Y1i3Ga8LfId12kUrD7wO0Olhov7K
 m/uTMackGpfwStt1pegcZhcHlV4WVaV7vRr7s/+S7yWmpzKhQJ2ohgJAckGsSvGdJ2qb
 GeqQ==
X-Gm-Message-State: AOAM533/AlEx+mMtEl74TLro0r8pv6iJp199687NKUnkunqjRcIJUeTO
 FJd+bEIYyAQMaCigtBStW/+W/4qttSeKvJEtblo=
X-Google-Smtp-Source: ABdhPJyLQQjbAn1PyXukvYJe9+/3BtvyQn2weWT99qvd4/rq7/DfXmAyofM4kYWfrGNcNfdwXWq2A9YgjXkIDgtp/SM=
X-Received: by 2002:a19:820c:: with SMTP id e12mr7282855lfd.215.1600256894436; 
 Wed, 16 Sep 2020 04:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <1600251387-1863-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1600251387-1863-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 16 Sep 2020 08:47:59 -0300
Message-ID: <CAOMZO5Dyo5J8SRWYLyh3bxwtcuAH=r6pcQg7-vtXfO2H6n4Exg@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: fsl_sai: update the register list
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: multipart/alternative; boundary="000000000000be0d6805af6cd7a1"
X-Mailman-Approved-At: Wed, 16 Sep 2020 22:20:58 +1000
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
 Nicolin Chen <nicoleotsuka@gmail.com>, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000be0d6805af6cd7a1
Content-Type: text/plain; charset="UTF-8"

Knob kmg

On Wed, Sep 16, 2020, 07:23 Shengjiu Wang <shengjiu.wang@nxp.com> wrote:

> As sai ip is upgraded, so update sai register list.
>
> Shengjiu Wang (3):
>   ASoC: fsl_sai: Add new added registers and new bit definition
>   ASoC: fsl_sai: Add fsl_sai_check_version function
>   ASoC: fsl_sai: Set MCLK input or output direction
>
>  sound/soc/fsl/fsl_sai.c | 77 ++++++++++++++++++++++++++++++++++++
>  sound/soc/fsl/fsl_sai.h | 87 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 164 insertions(+)
>
> --
> 2.27.0
>
>

--000000000000be0d6805af6cd7a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Knob kmg</div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Wed, Sep 16, 2020, 07:23 Shengjiu Wang &lt;<a =
href=3D"mailto:shengjiu.wang@nxp.com">shengjiu.wang@nxp.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">As sai ip is upgraded, so update sa=
i register list.<br>
<br>
Shengjiu Wang (3):<br>
=C2=A0 ASoC: fsl_sai: Add new added registers and new bit definition<br>
=C2=A0 ASoC: fsl_sai: Add fsl_sai_check_version function<br>
=C2=A0 ASoC: fsl_sai: Set MCLK input or output direction<br>
<br>
=C2=A0sound/soc/fsl/fsl_sai.c | 77 ++++++++++++++++++++++++++++++++++++<br>
=C2=A0sound/soc/fsl/fsl_sai.h | 87 ++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A02 files changed, 164 insertions(+)<br>
<br>
-- <br>
2.27.0<br>
<br>
</blockquote></div>

--000000000000be0d6805af6cd7a1--
