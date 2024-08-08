Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9059B94B990
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 11:18:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ec0Z4NIN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfhLF3lG7z2xmh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 19:18:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ec0Z4NIN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfhKZ02Z1z2xcq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 19:18:09 +1000 (AEST)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-39834949f27so3130805ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723108685; x=1723713485; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REVFtsd7kP8SZQgw0r+/fGQwfeWNPXAh6Qw7M45oeOc=;
        b=ec0Z4NIN4GrQsJrZmfjX7fB9IpwOKPTyCgOeCUqZeK0UjnapyPUk0sOMugrYPjwh7y
         +J1P9V0dK40IlNJfT/QoGksBqlnufNChpo7pDyLADrwAuqxILtJkL7GVBOlJHR8i63xE
         T3qbhzOjxEuU4YPCPpake5Ojg89rfyBpnNzfThU/19Ky1ElkXyI1oLosDqKXjQtZj2q1
         TKzJ31H+aXs7S9s05rNd6IAq3rYHRSu3R338b9ZjN02Rf2BtZXeX4NLOq/hHn2TEh9V+
         7RW+uW6rMKYt+NaBQchG23ekyMwTCc3lweSOrf9fs5S0VMlIaS1ZM05b08vPpcnXcnMo
         MhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723108685; x=1723713485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REVFtsd7kP8SZQgw0r+/fGQwfeWNPXAh6Qw7M45oeOc=;
        b=Im2jSkJNJB+155R+hQ4Sm1oIDBkVUd5uzDiXFEFjDtemxHsSLlBQ6zMsJof2yu1GdI
         pv9RSm3ritohovdlCetg3KCUCE47TE7FdvA7uHpchwDSuS3sGlpTPbvttWxCSdfyiPNs
         yyr8U0R5sdF3SZ8DtHAZKs/cg+zkI7xAtK8hcLO2Jqy5gpFFXyLB2ER0nyJ0d8TtUdVD
         9UTTiRMEuM148rYCfj5avXLAsedPRGBK+tGUjVJQlm0dDvXbdtCw3pTLVPoFC1lfFS+/
         uZY7MtiL2m9wBQqsUNa/ddc5mQ5Bl5MJEACfqHqzbPCMIp8YQFYf6gRciLIPJadOtq6p
         f9tw==
X-Forwarded-Encrypted: i=1; AJvYcCUWqgINtd3LqK9r+YL+InIf7fFoh/pb3A/00wyseHuzuQfO/1adRuNvNcwIwjI3oHz1YKIynRrZftBTZ0Glml0PzzpUzlLzjDP70fprIQ==
X-Gm-Message-State: AOJu0YzEZ3ThwFcHfEwQX+0Z2Z9Adf84SCVIca12A07BHhOkAZCYhQSS
	bwuVQQKhUOhYb1ZBIRRaHSJvcah5fFN6xQ6Ml3lxCyu4B/agKA/1hNqigHc+XcIMt4CAiEWiCK+
	+xyZ6kOmOqV61awZPotkrbT1rxkk=
X-Google-Smtp-Source: AGHT+IEjn7a01cBmdtTZmS2Jngj4iwhQXD0sAvy+xjfVRnfVk+u+mV1GNclk46ZWlpryZJLGRifYGzNADxyjfJHrItA=
X-Received: by 2002:a05:6e02:154c:b0:397:2918:6f52 with SMTP id
 e9e14a558f8ab-39b5ed4a0e4mr12415825ab.25.1723108684958; Thu, 08 Aug 2024
 02:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com> <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
In-Reply-To: <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 8 Aug 2024 17:17:53 +0800
Message-ID: <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, linux-sound@vger.kernel.org, perex@perex.cz, nicoleotsuka@gmail.com, vkoul@kernel.org, broonie@kernel.org, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 6, 2024 at 7:25=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 8/6/24 12:26, Shengjiu Wang wrote:
> > Add Sample Rate Converter(SRC) codec support, define the output
> > format and rate for SRC.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  include/uapi/sound/compress_offload.h | 2 ++
> >  include/uapi/sound/compress_params.h  | 9 ++++++++-
> >  2 files changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound=
/compress_offload.h
> > index 98772b0cbcb7..8b2b72f94e26 100644
> > --- a/include/uapi/sound/compress_offload.h
> > +++ b/include/uapi/sound/compress_offload.h
> > @@ -112,10 +112,12 @@ struct snd_compr_codec_caps {
> >   * end of the track
> >   * @SNDRV_COMPRESS_ENCODER_DELAY: no of samples inserted by the encode=
r at the
> >   * beginning of the track
> > + * @SNDRV_COMPRESS_SRC_RATIO_MOD: Resampling Ratio Modifier for sample=
 rate converter
> >   */
> >  enum sndrv_compress_encoder {
> >       SNDRV_COMPRESS_ENCODER_PADDING =3D 1,
> >       SNDRV_COMPRESS_ENCODER_DELAY =3D 2,
> > +     SNDRV_COMPRESS_SRC_RATIO_MOD =3D 3,
> >  };
>
> this sounds wrong to me. The sample rate converter is not an "encoder",
> and the properties for padding/delay are totally specific to an encoder
> function.

There is only decoder and encoder definition for compress,  I know
it is difficult to add SRC to encoder or decoder classification,
SRC is a Post Processing.  I hope you can have a recommandation.

Thanks.

Best regards
Shengjiu Wang

>
> The other point is that I am not sure how standard this ratio_mod
> parameter is. This could be totally specific to a specific
> implementation, and another ASRC might have different parameters.
>
> >
> >  /**
> > diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/=
compress_params.h
> > index ddc77322d571..0843773ea6b4 100644
> > --- a/include/uapi/sound/compress_params.h
> > +++ b/include/uapi/sound/compress_params.h
> > @@ -43,7 +43,8 @@
> >  #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
> >  #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
> >  #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
> > -#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
> > +#define SND_AUDIOCODEC_SRC                   ((__u32) 0x00000011)
> > +#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_SRC
>
> I am not sure this is wise to change such definitions?
> >
> >  /*
> >   * Profile and modes are listed with bit masks. This allows for a
> > @@ -324,6 +325,11 @@ struct snd_dec_ape {
> >       __u32 seek_table_present;
> >  } __attribute__((packed, aligned(4)));
> >
> > +struct snd_dec_src {
> > +     __u32 format_out;
> > +     __u32 rate_out;
> > +} __attribute__((packed, aligned(4)));
>
> Again I am not sure how standard those parameters are, and even if they
> were if their representation is reusable.
>
> And the compressed API has a good split between encoders and decoders, I
> am not sure how an SRC can be classified as either.
>
> >  union snd_codec_options {
> >       struct snd_enc_wma wma;
> >       struct snd_enc_vorbis vorbis;
> > @@ -334,6 +340,7 @@ union snd_codec_options {
> >       struct snd_dec_wma wma_d;
> >       struct snd_dec_alac alac_d;
> >       struct snd_dec_ape ape_d;
> > +     struct snd_dec_src src;
> >  } __attribute__((packed, aligned(4)));
> >
> >  /** struct snd_codec_desc - description of codec capabilities
>
