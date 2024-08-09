Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C0394CE63
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 12:15:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f4QlNIvr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgKY93dKjz2ysb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 20:15:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f4QlNIvr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgKXS5bgCz2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 20:14:47 +1000 (AEST)
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-39b51ba15dbso7089815ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Aug 2024 03:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723198484; x=1723803284; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfsf46z9wf1GW1rvhufmjrriglyClBeG24vWvW2wbYg=;
        b=f4QlNIvrwAxGAgTO8QnReCLln1zDKjoKuU6bZKYb+hw1d+HE168bWcciQcluVt7AIJ
         4/WVSRgZecI8BjvFziO0LdkjPEWredBoLRRiKC1WVPYpxgGNAS9/HzBt19CcUBCSt1xb
         YC/KoX+7nIPjQHMcMnzC8+ujEZs661hoZSTAFy/ehWfFQ8KJ3ooV6wYWlkLgqPUI1SYs
         7+8RCGM4WoE2P5HhFb4JbTgm9aJ9qKRkX2HpMwws50fD9WBx9Y6ITJINEqmp3IIYCpOT
         rnK+G+F5I/ajB2d9vT3budZ74zq422rKKQqbPoRx/1M3dA4eu7kKRNq7p8oEapySN/fu
         VSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723198484; x=1723803284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfsf46z9wf1GW1rvhufmjrriglyClBeG24vWvW2wbYg=;
        b=m9n4uYWxP15M4p3UD3ARIRwPXPkaapj/+SbBbkIrR3BCDZM3/K9AzewijLHlNli6A+
         ZI5bAQ/gV/4u5QqEMz6kggyET0Ujg1u3lU/8Rw/LWbHHGeFmXpeyN8QsN4V5N3xSXuxT
         d8hjBog1gkYyVInfP9RDWChQYtOWISgNqJ/vjLnjx9yo0D9lshdz26i8o4ftpyXBGB43
         Qhblo/QOmQ3Fh4sCb4e/GaCjrO0wHymzEW3qMmpBIhTahONKDg39MQ3Er68WJpwtKKNX
         BV63puC8tcrmhtEKZzZpNECw2gBtyQK5MiPzsPq2qRgklmoRCrdD2ef80Q8AyduB4t//
         j3Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVm4MnKPEzuqqTpsloSG1cdUF+b41WHOIcDV7z4hnjYYbaZDhMje/IlrNK6A4AvmyktEhWi41yPy6X33l5qMJmlSTwiXk3gVsY/w2Kzpg==
X-Gm-Message-State: AOJu0Yy1j3wrjoQL5nZPAzPwGXD9LcVYFUq5by2z3l6TtLMH/zgm4VI9
	UyIK4OxZioH4ccqXwn4KGIJJ3oyveCdpwWvliNbx4q8k3CnBv+Ihy6mbpamVBNuremlcrxIm9i1
	5s2GjYGPFQMV3N1WIhP97JtEeI3I=
X-Google-Smtp-Source: AGHT+IFFfg/JrZPkYtkwOZLbKVpyn11ErpaZHgtBuGGv7zwTVNOInIB98snU98XMHtncdjjRq9qFib8e3L29raeRvWE=
X-Received: by 2002:a05:6e02:156d:b0:375:c394:568b with SMTP id
 e9e14a558f8ab-39b7a472925mr11954185ab.21.1723198483575; Fri, 09 Aug 2024
 03:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com> <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
 <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
 <ffa85004-8d86-4168-b278-afd24d79f9d8@linux.intel.com> <116041ee-7139-4b77-89be-3a68f699c01b@perex.cz>
 <930bb152-860a-4ec5-9ef0-1c96f554f365@linux.intel.com> <c9039808-cd04-452d-9f6c-f91811088456@perex.cz>
 <ed1192e0-00e7-4739-a687-c96dc2d62898@linux.intel.com>
In-Reply-To: <ed1192e0-00e7-4739-a687-c96dc2d62898@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 9 Aug 2024 18:14:32 +0800
Message-ID: <CAA+D8AMOh=G7W5-dYw_=Xx-s0PqEu2suKYorscoWku86Rn-=+A@mail.gmail.com>
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, nicoleotsuka@gmail.com, vkoul@kernel.org, broonie@kernel.org, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 9, 2024 at 3:25=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> >>>> Then there's the issue of parameters, we chose to only add parameter=
s
> >>>> for standard encoders/decoders. Post-processing is highly specific a=
nd
> >>>> the parameter definitions varies from one implementation to another =
-
> >>>> and usually parameters are handled in an opaque way with binary
> >>>> controls. This is best handled with a UUID that needs to be known on=
ly
> >>>> to applications and low-level firmware/hardware, the kernel code sho=
uld
> >>>> not have to be modified for each and every processing and to add new
> >>>> parameters. It just does not scale and it's unmaintainable.
> >>>>
> >>>> At the very least if you really want to use this compress API,
> >>>> extend it
> >>>> to use a non-descript "UUID-defined" type and an opaque set of
> >>>> parameters with this UUID passed in a header.
> >>>
> >>> We don't need to use UUID-defined scheme for simple (A)SRC
> >>> implementation. As I noted, the specific runtime controls may use
> >>> existing ALSA control API.
> >>
> >> "Simple (A)SRC" is an oxymoron. There are multiple ways to define the
> >> performance, and how the drift estimator is handled. There's nothing
> >> simple if you look under the hood. The SOF implementation has for
> >> example those parameters:
> >>
> >> uint32_t source_rate;           /**< Define fixed source rate or */
> >>                 /**< use 0 to indicate need to get */
> >>                 /**< the rate from stream */
> >> uint32_t sink_rate;             /**< Define fixed sink rate or */
> >>                 /**< use 0 to indicate need to get */
> >>                 /**< the rate from stream */
> >> uint32_t asynchronous_mode;     /**< synchronous 0, asynchronous 1 */
> >>                 /**< When 1 the ASRC tracks and */
> >>                 /**< compensates for drift. */
> >> uint32_t operation_mode;        /**< push 0, pull 1, In push mode the =
*/
> >>                 /**< ASRC consumes a defined number */
> >>                 /**< of frames at input, with varying */
> >>                 /**< number of frames at output. */
> >>                 /**< In pull mode the ASRC outputs */
> >>                 /**< a defined number of frames while */
> >>                 /**< number of input frames varies. */
> >>
> >> They are clearly different from what is suggested above with a 'ratio-
> >> mod'.
> >
> > I don't think so. The proposed (A)SRC for compress-accel is just one
> > case for the above configs where the input is known and output is
> > controlled by the requested rate. The I/O mechanism is abstracted enoug=
h
> > in this case and the driver/hardware/firmware must follow it.
>
> ASRC is usually added when the nominal rates are known but the clock
> sources differ and the drift needs to be estimated at run-time and the
> coefficients or interpolation modified dynamically
>
> If the ratio is known exactly and there's no clock drift, then it's a
> different problem where the filter coefficients are constant.
>
> >> Same if you have a 'simple EQ'. there are dozens of ways to implement
> >> the functionality with FIR, IIR or a combination of the two, and
> >> multiple bands.
> >>
> >> The point is that you have to think upfront about a generic way to pas=
s
> >> parameters. We didn't have to do it for encoders/decoders because we
> >> only catered to well-documented standard solutions only. By choosing t=
o
> >> support PCM processing, a new can of worms is now open.
> >>
> >> I repeat: please do not make the mistake of listing all processing wit=
h
> >> an enum and a new structure for parameters every time someone needs a
> >> specific transform in their pipeline. We made that mistake with SOF an=
d
> >> had to backtrack rather quickly. The only way to scale is an identifie=
r
> >> that is NOT included in the kernel code but is known to higher and
> >> lower-levels only.
> >
> > There are two ways - black box (UUID - as you suggested) - or well
> > defined purpose (abstraction). For your example 'simple EQ', the
> > parameters should be the band (frequency range) volume values. It's
> > abstract and the real filters (resp. implementation) used behind may
> > depend on the hardware/driver capabilities.
>
> Indeed there is a possibility that the parameters are high-level, but
> that would require firmware or hardware to be able to generate actual
> coefficients from those parameters. That usually requires some advanced
> math which isn't necessarily obvious to implement with fixed-point hardwa=
re.
>
> > From my view, the really special cases may be handled as black box, but
> > others like (A)SRC should follow some well-defined abstraction IMHO to
> > not force user space to handle all special cases.
>
> I am not against the high-level abstractions, e.g. along the lines of
> what Android defined:
> https://developer.android.com/reference/android/media/audiofx/AudioEffect
>
> That's not sufficient however, we also need to make sure there's an
> ability to provide pre-computed coefficients in an opaque manner for
> processing that doesn't fit in the well-defined cases. In practice there
> are very few 3rd party IP that fits in well-defined cases, everyone has
> secret-sauce parameters and options.

Appreciate the discussion.

Let me explain the reason for the change:

Why I use the metadata ioctl is because the ALSA controls are binding
to the sound card.  What I want is the controls can be bound to
snd_compr_stream, because the ASRC compress sound card can
support multi instances ( the ASRC can support multi conversion in
parallel).   The ALSA controls can't be used for this case,  the only
choice in current compress API is metadata ioctl. And metadata
ioctl can be called many times which can meet the ratio modifier
requirement (ratio may be drift on the fly)

And compress API uses codec as the unit for capability query and
parameter setting,  So I think need to define "SND_AUDIOCODEC_SRC'
and 'struct snd_dec_src',  for the 'snd_dec_src' just defined output
format and output rate, channels definition just reuse the snd_codec.ch_in.

I understand your concern, but there seems no better option.
If you have, please guide me. Thanks.

Best regards
Shengjiu Wang
