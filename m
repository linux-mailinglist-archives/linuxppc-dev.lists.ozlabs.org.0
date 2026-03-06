Return-Path: <linuxppc-dev+bounces-17790-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIzAKjdjqmmYQgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17790-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 06:16:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E532321BAAA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 06:16:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRvlR19sZz3c8x;
	Fri, 06 Mar 2026 16:16:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::42e" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772774195;
	cv=pass; b=WsPkvO6n4nrri+aME4NpJk8XX68ab+SLUzhAkwZvndnYJdpdKLJwyjyAj8xvgKpPi0Dg1huBe70PkpJKAjey+E1da9rplQ/oWD0v1qB0uqyuQIQxk7qBU3wXMWExlgesWPkVmQCDM5HC+1wO6oCo9YI3lGmvIbaGWbl2g0dLCzdbcW1bg6NYArxA/HI/vYzKwKsD/hwls3opgZpLKD58FHOLQPLPVomTOUSKqg+eSJwWLTsjSj0EQakho0RSgfAtg7Ca3VR0UngWX+jourWSOfWNo6J3C2/mxLVa6c+xbk7XP/OQ8SQLPnHPFUnmU+2BI8qIz2EPulQpBuPX9hMGow==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772774195; c=relaxed/relaxed;
	bh=i4bJ53LWAF7Dgbm3MaLrGdxoClqcQbF8GzZ/FzZGtDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPItcx96NEBEDMlZE+8WI+VYRO2nC2JnUhaQT8G9yL0BU+q9bQiHSP9FVk6bhze9j1n1RlnH1oUucYr5temS+6L3sVD1T7S79R0PsFCl5OT4HJOjizwgZGB70UIzxMuD0YysswzZNId8ClDtFe6R6pn9sXmY84k30mN5jOgP10ItTvY5ksdNii030DOHI6hHIWp7LWA3tnalwPlQyPS85K+P9k8uR3AtPa8cJChg5Gx60eqJ4ydCIBEwj7CWKokA1Fb6LADoYkPeJFZ5X304Cq368L/xGEd/nErOGzrM4rtvsUozoAIB1j/tSeZb3+34OT/qiTtkNmKNEmclbEO/Lg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J6AG1V2n; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J6AG1V2n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRvlP247zz3bn7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 16:16:32 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82976220e97so1464865b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 21:16:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772774189; cv=none;
        d=google.com; s=arc-20240605;
        b=HULBW3riSTGa1YrdKixOwmPPDjth9h8Nty2fO8DiWHbaSHtg8hH+YX88jzaVi8uPED
         QybTlojcb7qm/uRGdK/kyG/hIaxJiSZuGDkrmdT8VLlsRP3CpUlJ9ImnRhG3eXqWgUlx
         9cMXiJ+hlt8sIgzQIJM6UJgPAaY0z/Mv+pmGv/zVlY121Tm7pguZHP+xavrIEZQvZ2a+
         SHsJOax5ZhX7AwAGlBDy3ApxKuY0OwmieKDmcZHB0+7bHgllzb1ufN94wjTKvXROONmm
         r1vDOgB+pjWxhgh2bsVpxFVSY66x8rtyrHvg1R2RGgCrW2yT5HcYc/bKTNncW2UoZH5M
         M5LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i4bJ53LWAF7Dgbm3MaLrGdxoClqcQbF8GzZ/FzZGtDA=;
        fh=fnT/9wagLbwK5ZDL1ClBJJhXgqdG9m9tVfL1+T4PT0o=;
        b=dXxb2mfUzQry0x6JQlJnquw24bkHVowe4fj6m5sIbm25soY9VU3i4BwHpH6OhTuXMZ
         uzee6SdzVVUsffxhlJQQtSrBRzNREfcUpVI2tNoyGJlIV17ccadcUERAuUvdz2CwakE0
         FiuQLqkOdRIeMZ+/HTsNs4uKG5GTt5ScoIuqMWxqtSmTCfEkjy3W8gob9CFDwsylprSy
         NkQ45kgzBk0l3u7U3uzIYoOkAdJH+TAP9Nx2AlSE21eUF7mb/FKhKAzbVl4KA3rwSFmU
         e0Cw1QzVR8DC1uA9YyvaOB2GRhtuxByuTIJNOf6iE6W8RyCzvavo20edYVt+6xjmBr6v
         HcnQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772774189; x=1773378989; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4bJ53LWAF7Dgbm3MaLrGdxoClqcQbF8GzZ/FzZGtDA=;
        b=J6AG1V2nZTvVrkkQ5KYqLl9ZPRniJk6K8gwhh0XRZ65s7y5kjS0QnqQg47RlfxHEyd
         5MaQCGodoKDKqM8H8z32LM7powTN01LBqpo2EVpvsnKlbYFjaZqZwSLzET60IVxa4AMY
         TpBTm4aqRcjx170W4rj175JpjLu+P7v18zmeboaGAWVVuHihkmHC+CewuWKnDPcJXwrZ
         7xVmick4GZV1Km9TD7JpyZEdYjsgzWnkCfF/XUZogEA7XzBOzP2J6MyKcSiILf6xWB3t
         XHz+08K6gSJlCOXa6yhoIFm+UYjK6euCpD5EyfNcB+BLnApVf62LpDAUvBpbSFAPctkE
         YRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772774189; x=1773378989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i4bJ53LWAF7Dgbm3MaLrGdxoClqcQbF8GzZ/FzZGtDA=;
        b=Gtzs5SDPhF67MJPDG2uWambXc6oEsYjvFJ8O+NCBESIv3Jzsm+2EOFdatwBU9ciQ05
         rO8e8q+DCFrNg59+ZcjPjWDSnHVpGKH/HpqRX1m8GRUDMq9jStBsp6J9F3RHZzDeUFyq
         poPMD9HfZ0liqdl6ZxO8bF4ghCN1xZl4xn22U3y0AoKB/X1BWA4a7jxKrJUOIb5Yeq5m
         g9EOZZECTqBY7sWNHKqZNder14kEE8szY4x60IiXIX4NTcQjeko/eDvghHNJg2bbr140
         W8S+umDYINXnvrviZSnMyjNzUJ1jWd8PcP3X9fiEXqMt9izQ1qLLpOQA+sWDQNI7mw+G
         oi7w==
X-Forwarded-Encrypted: i=1; AJvYcCXi16T0Pnh/ynKPyey0mJVfM0pNghozCF+Iz5ljNqmHGSOr1VexaqUa3U4fuYioNn+bmNrSD2MujcsI9TY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyud4uBpPzuVRkOZZB1AiJja4WY2WxOYqeN+yugc7m9KWKEmfhE
	Re/nLf6kVbDhL6FYe1NrVdhjY/9srQ1t5MgepaOAPQSVzOUxwt7p9W82xRIkwOjwhOr8/nGmKwZ
	TYLB5wFJX3GH9gjE/au160AerfIIZyOc=
X-Gm-Gg: ATEYQzz7T9P50y3RiAufS3g32CgGp9R0Xrdt5yxQQir+j+ABXU6EQfARJ6r8GjLfrCG
	jNs779H7dppkOV9XzdPvOXVYLVGC7Y4AKMm9XVE0OdHnUVc33vRpu0u/0ZLqqDi1ZfDez1g8rw5
	SWNzRS45g9fT3QTlpPxPUSkVDucy27Eb6gbs8g7YlsAHuqArEG+5LaMnygPLEXyLncuV0DQLRla
	S/AoDemkVOZypU+XJ0xxuHdu0KLOoENJaquCvKwq6n7SB83+CSx1nyXGeHpFtrvc7NiCHjfjus2
	0/GR0Go=
X-Received: by 2002:a05:6a21:7484:b0:38b:de3d:d530 with SMTP id
 adf61e73a8af0-398590ff0femr1031916637.72.1772774189507; Thu, 05 Mar 2026
 21:16:29 -0800 (PST)
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
References: <20260305031031.3808182-1-shengjiu.wang@nxp.com>
 <20260305031031.3808182-2-shengjiu.wang@nxp.com> <7665641b-1cad-4a65-94a1-771701363bf2@sirena.org.uk>
In-Reply-To: <7665641b-1cad-4a65-94a1-771701363bf2@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 6 Mar 2026 13:16:06 +0800
X-Gm-Features: AaiRm51kMa-O1sAC39Dn2vCk8cWF4P1mitNEX2s0U2KmBk3uO7t_JP-YBfFrl0o
Message-ID: <CAA+D8AO71d6mYi9YmTnzKy6hXXF0qLhFdCH_eQ5kGqOoDuBCsA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] ASoC: fsl_utils: Add snd_kcontrol functions for
 specific cases
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: E532321BAAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17790-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:shengjiu.wang@nxp.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,freescale.com:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 11:12=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Mar 05, 2026 at 11:10:29AM +0800, Shengjiu Wang wrote:
>
> > +int fsl_asoc_get_xr_sx(struct snd_kcontrol *kcontrol,
> > +                    struct snd_ctl_elem_value *ucontrol)
> > +{
> > +     struct snd_soc_component *component =3D snd_kcontrol_chip(kcontro=
l);
> > +     bool pm_active =3D pm_runtime_active(component->dev);
> > +
> > +     if (!pm_active) {
> > +             ucontrol->value.integer.value[0] =3D 0;
> > +             return 0;
> > +     }
> > +
> > +     return snd_soc_get_xr_sx(kcontrol, ucontrol);
> > +}
>
> This is racy, what happens if we race with runtime PM disabling the
> device so it gets powered off between the check and the call to the
> generic function?  I think we need to take a runtime reference here,
> this is annoying but I can't see how else to do things robustly and
> probably in practice there's not much performance impact.

Ok, let me try this.
Thanks.

Best regards
Shengjiu Wang

>
> > +EXPORT_SYMBOL(fsl_asoc_get_xr_sx);
> > +
> > +int fsl_asoc_put_xr_sx(struct snd_kcontrol *kcontrol,
> > +                    struct snd_ctl_elem_value *ucontrol)
> > +{
> > +     struct snd_soc_component *component =3D snd_kcontrol_chip(kcontro=
l);
> > +     bool pm_active =3D pm_runtime_active(component->dev);
> > +
> > +     if (!pm_active)
> > +             return 0;
> > +
> > +     return snd_soc_put_xr_sx(kcontrol, ucontrol);
> > +}
> > +EXPORT_SYMBOL(fsl_asoc_put_xr_sx);
> > +
> > +int fsl_asoc_get_enum_double(struct snd_kcontrol *kcontrol,
> > +                          struct snd_ctl_elem_value *ucontrol)
> > +{
> > +     struct snd_soc_component *component =3D snd_kcontrol_chip(kcontro=
l);
> > +     bool pm_active =3D pm_runtime_active(component->dev);
> > +
> > +     if (!pm_active) {
> > +             ucontrol->value.enumerated.item[0] =3D 0;
> > +             return 0;
> > +     }
> > +
> > +     return snd_soc_get_enum_double(kcontrol, ucontrol);
> > +}
> > +EXPORT_SYMBOL(fsl_asoc_get_enum_double);
> > +
> > +int fsl_asoc_put_enum_double(struct snd_kcontrol *kcontrol,
> > +                          struct snd_ctl_elem_value *ucontrol)
> > +{
> > +     struct snd_soc_component *component =3D snd_kcontrol_chip(kcontro=
l);
> > +     bool pm_active =3D pm_runtime_active(component->dev);
> > +
> > +     if (!pm_active)
> > +             return 0;
> > +
> > +     return snd_soc_put_enum_double(kcontrol, ucontrol);
> > +}
> > +EXPORT_SYMBOL(fsl_asoc_put_enum_double);
> > +
> > +int fsl_asoc_get_volsw(struct snd_kcontrol *kcontrol,
> > +                    struct snd_ctl_elem_value *ucontrol)
> > +{
> > +     struct snd_soc_component *component =3D snd_kcontrol_chip(kcontro=
l);
> > +     bool pm_active =3D pm_runtime_active(component->dev);
> > +
> > +     if (!pm_active) {
> > +             ucontrol->value.integer.value[0] =3D 0;
> > +             return 0;
> > +     }
> > +
> > +     return snd_soc_get_volsw(kcontrol, ucontrol);
> > +}
> > +EXPORT_SYMBOL(fsl_asoc_get_volsw);
> > +
> > +int fsl_asoc_put_volsw(struct snd_kcontrol *kcontrol,
> > +                    struct snd_ctl_elem_value *ucontrol)
> > +{
> > +     struct snd_soc_component *component =3D snd_kcontrol_chip(kcontro=
l);
> > +     bool pm_active =3D pm_runtime_active(component->dev);
> > +
> > +     if (!pm_active)
> > +             return 0;
> > +
> > +     return snd_soc_put_volsw(kcontrol, ucontrol);
> > +}
> > +EXPORT_SYMBOL(fsl_asoc_put_volsw);
> > +
> >  MODULE_AUTHOR("Timur Tabi <timur@freescale.com>");
> >  MODULE_DESCRIPTION("Freescale ASoC utility code");
> >  MODULE_LICENSE("GPL v2");
> > diff --git a/sound/soc/fsl/fsl_utils.h b/sound/soc/fsl/fsl_utils.h
> > index 21b25a11ecda..0cf9d1e7fb14 100644
> > --- a/sound/soc/fsl/fsl_utils.h
> > +++ b/sound/soc/fsl/fsl_utils.h
> > @@ -31,4 +31,34 @@ void fsl_asoc_constrain_rates(struct snd_pcm_hw_cons=
traint_list *target_constr,
> >                             const struct snd_pcm_hw_constraint_list *or=
iginal_constr,
> >                             struct clk *pll8k_clk, struct clk *pll11k_c=
lk,
> >                             struct clk *ext_clk, int *target_rates);
> > +
> > +/* Similar to SOC_SINGLE_XR_SX, but it is for read only registers. */
> > +#define FSL_ASOC_SINGLE_XR_SX_EXT_RO(xname, xregbase, xregcount, xnbit=
s, \
> > +                             xmin, xmax, xinvert, xhandler_get) \
> > +{    .iface =3D SNDRV_CTL_ELEM_IFACE_MIXER, .name =3D (xname), \
> > +     .access =3D SNDRV_CTL_ELEM_ACCESS_READ |          \
> > +             SNDRV_CTL_ELEM_ACCESS_VOLATILE,         \
> > +     .info =3D snd_soc_info_xr_sx, .get =3D xhandler_get, \
> > +     .private_value =3D (unsigned long)&(struct soc_mreg_control) \
> > +             {.regbase =3D xregbase, .regcount =3D xregcount, .nbits =
=3D xnbits, \
> > +             .invert =3D xinvert, .min =3D xmin, .max =3D xmax} }
> > +
> > +int fsl_asoc_get_xr_sx(struct snd_kcontrol *kcontrol,
> > +                    struct snd_ctl_elem_value *ucontrol);
> > +
> > +int fsl_asoc_put_xr_sx(struct snd_kcontrol *kcontrol,
> > +                    struct snd_ctl_elem_value *ucontrol);
> > +
> > +int fsl_asoc_get_enum_double(struct snd_kcontrol *kcontrol,
> > +                          struct snd_ctl_elem_value *ucontrol);
> > +
> > +int fsl_asoc_put_enum_double(struct snd_kcontrol *kcontrol,
> > +                          struct snd_ctl_elem_value *ucontrol);
> > +
> > +int fsl_asoc_get_volsw(struct snd_kcontrol *kcontrol,
> > +                    struct snd_ctl_elem_value *ucontrol);
> > +
> > +int fsl_asoc_put_volsw(struct snd_kcontrol *kcontrol,
> > +                    struct snd_ctl_elem_value *ucontrol);
> > +
> >  #endif /* _FSL_UTILS_H */
> > --
> > 2.34.1
> >

