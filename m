Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3CF59D178
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 08:49:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBfwZ2wtfz3cDh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 16:49:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Qg1DpWCq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Qg1DpWCq;
	dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBXPc0RfRz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 11:55:46 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id n24so10199452ljc.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 18:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=19O0gorXp5J+0lL6JXxlboEo85fJNaFBCpEqkfyC7tc=;
        b=Qg1DpWCqaEzaeo/HW0ekS2Acj0o2kbP0huD/yNFfi0tVwJDdS6MT5B2vcEzWPu5JXt
         B1xEiDT2IMkLha4zqHXnkZAC/rb5+IMD7FxEOyPWr+UBSlKlqe/xM/L8XqGqUNWRFZxf
         KTIoA1fzJY3gASghQlIlvkK2vU6zmbiCg66aiMyA/i7FNTWEWkjrdfdpccUSgkNSC5HU
         ekxMU6SJy1k6BtXHRjz9eQic6idx5wWJV6UvRP2mz/GyEGPsTxFk+GfPSJmuWmfNhouI
         TFfV4UYJOV68AoeRPXx8+M8P2hbjkRLbGTotIX3AnE+SlAmMiXeMptE6KPAX0AXdpclg
         tAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=19O0gorXp5J+0lL6JXxlboEo85fJNaFBCpEqkfyC7tc=;
        b=rxBHQHWFSgh92i/9U2Ifqzvwoq+Zt+7+UeHCprShS/J39yemJBv0RJ17KZ8HKJKktk
         YS6zpYJKSNHvi53fBdVio8Ih90KA2lMx8uqgnrUAFUtY1wWWR5YzNsM+/fhsWVaY0xG+
         rvtHxCi5XAoaJON57S1A4+UWXheBIrJCrCtMInp9GFm088ldHMqJCCWiJWkg3A50YmEH
         Y8wBIDLPoRl2xxzUeDpZmbbHbVWQq70ho7Zss87croCaP1h0PiDBhFxEfOtvb4KxjmI9
         2LeXosubfdtu4NX04TmjQOZDMDlRfZQ+ifRcOI92MknOVxJlj4CObUb8yE7NIoHkxEId
         xM0A==
X-Gm-Message-State: ACgBeo3yaNtbG1TIb6fUl8If3WHsyX8da20VF89pkncvz7xFr9OJ0UQ0
	yXP9WcDiedbbOFf4GgqRvh+KM0D6cHe8qEeSLys=
X-Google-Smtp-Source: AA6agR5xph1tzBIvmf0WnRK50M+0ev6Xrl6l9HvcKqYlcwtbrMGULNr3K/wHYleoNCS8LPjsRwfSQYin9P0eQED4NW4=
X-Received: by 2002:a2e:b809:0:b0:261:be83:a2b0 with SMTP id
 u9-20020a2eb809000000b00261be83a2b0mr5027207ljo.219.1661219741257; Mon, 22
 Aug 2022 18:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220822184239.169757-1-pierre-louis.bossart@linux.intel.com> <20220822184239.169757-5-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220822184239.169757-5-pierre-louis.bossart@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 23 Aug 2022 09:55:29 +0800
Message-ID: <CAA+D8AOZoJesUw=xMGwJ+Pth2-9DoxaQbr82tsCQbBjnJfuotQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] ASoC: fsl: fsl-utils: remove useless assignment
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000092562605e6dedc69"
X-Mailman-Approved-At: Tue, 23 Aug 2022 16:49:03 +1000
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
Cc: alsa-devel@alsa-project.org, "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.de>, Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Chao Song <chao.song@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000092562605e6dedc69
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 23, 2022 at 2:43 AM Pierre-Louis Bossart <
pierre-louis.bossart@linux.intel.com> wrote:

> cppcheck warning:
>
> sound/soc/fsl/fsl_utils.c:127:10: style: Variable 'ret' is assigned a
> value that is never used. [unreadVariable]
>  int ret = 0;
>          ^
>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Chao Song <chao.song@intel.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_utils.c b/sound/soc/fsl/fsl_utils.c
> index d0fc430f7033d..a5ab27c2f711c 100644
> --- a/sound/soc/fsl/fsl_utils.c
> +++ b/sound/soc/fsl/fsl_utils.c
> @@ -124,7 +124,7 @@ void fsl_asoc_reparent_pll_clocks(struct device *dev,
> struct clk *clk,
>  {
>         struct clk *p, *pll = NULL, *npll = NULL;
>         bool reparent = false;
> -       int ret = 0;
> +       int ret;
>
>         if (!clk || !pll8k_clk || !pll11k_clk)
>                 return;
> --
> 2.34.1
>
>

--00000000000092562605e6dedc69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 23, 2022 at 2:43 AM Pierr=
e-Louis Bossart &lt;<a href=3D"mailto:pierre-louis.bossart@linux.intel.com"=
>pierre-louis.bossart@linux.intel.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">cppcheck warning:<br>
<br>
sound/soc/fsl/fsl_utils.c:127:10: style: Variable &#39;ret&#39; is assigned=
 a<br>
value that is never used. [unreadVariable]<br>
=C2=A0int ret =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
<br>
Signed-off-by: Pierre-Louis Bossart &lt;<a href=3D"mailto:pierre-louis.boss=
art@linux.intel.com" target=3D"_blank">pierre-louis.bossart@linux.intel.com=
</a>&gt;<br>
Reviewed-by: Bard Liao &lt;<a href=3D"mailto:yung-chuan.liao@linux.intel.co=
m" target=3D"_blank">yung-chuan.liao@linux.intel.com</a>&gt;<br>
Reviewed-by: Kai Vehmanen &lt;<a href=3D"mailto:kai.vehmanen@linux.intel.co=
m" target=3D"_blank">kai.vehmanen@linux.intel.com</a>&gt;<br>
Reviewed-by: Chao Song &lt;<a href=3D"mailto:chao.song@intel.com" target=3D=
"_blank">chao.song@intel.com</a>&gt;<br></blockquote><div><br></div><div>Ac=
ked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">shengj=
iu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regards</div><div>W=
ang Shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0sound/soc/fsl/fsl_utils.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_utils.c b/sound/soc/fsl/fsl_utils.c<br>
index d0fc430f7033d..a5ab27c2f711c 100644<br>
--- a/sound/soc/fsl/fsl_utils.c<br>
+++ b/sound/soc/fsl/fsl_utils.c<br>
@@ -124,7 +124,7 @@ void fsl_asoc_reparent_pll_clocks(struct device *dev, s=
truct clk *clk,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct clk *p, *pll =3D NULL, *npll =3D NULL;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool reparent =3D false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!clk || !pll8k_clk || !pll11k_clk)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--00000000000092562605e6dedc69--
