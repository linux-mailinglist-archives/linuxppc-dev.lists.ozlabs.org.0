Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E59278F547
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 00:07:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=X53Tl6y2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcFdl6ytZz3c5b
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 08:07:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=X53Tl6y2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ndufresne.ca (client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com; envelope-from=nicolas@ndufresne.ca; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcCkp1HT2z2xVR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 06:41:53 +1000 (AEST)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-64b98479a66so6742806d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 13:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1693514508; x=1694119308; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MGb8UE4K7J1/tZAx27Ih4ZHLsp9ZwY6jXWa1wmWSSW0=;
        b=X53Tl6y20zRnSOCNXb7ZwC4rwnm75IWt34QwaGmGVZ2BYZ4uDEGGnfXYddJ0EG+lPD
         Mj+RSyetcR54VnXErOV8PfGFhIqRQ8j1sycJHd4oks/52y4ItRB5Pi5hvDfVlUOXYcMB
         Ay0gaioxFZTkT802mKzFhmyLXakXnGDG61DgIoJvDz++34PBW1rARhLTLJZGRGafh0TX
         TIQa2zjiXPGOY/BW/sm6quAxnPB/DpgC6jGreEO4RRVQaV/+N28GeiNo2gQurmQqIfb8
         ofiBKgYAW4GnOYHG92vhALhifkwv6iDDeJ4zTvoLAerCsZZxnxj7y5GetMTt0rgnk4a6
         8feA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693514508; x=1694119308;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MGb8UE4K7J1/tZAx27Ih4ZHLsp9ZwY6jXWa1wmWSSW0=;
        b=LMbUe+q5w9iO5tKuAiKw2HdDYtPllJIBFFyq2at6/tRNafb6mrC+24KmWTufZnLheH
         SvlLZtA8EbcjdqmDwRpVEcpQvRZJn0f4BpcTXHseguXex1pewO/4Rq+sT7PRaX+xiLg2
         UVFfBYBWRKIwdUDllWHsVNAxhKEFX2u5P3ju9Lr68ah8sNpZHGIby0NJtcmwKL7z0Vur
         VyLnJsW6T7eE2USJozvLfBCEu2yyFMMrkSijf5UKLz2lPQSZqx/ZvVM640tuxKNzdGLn
         FwXJldQVgE51wUqXkFhA0rwbZAvl84X05DtNqiMP5RwbPDxDjbUqbJoO+7Qzutbel+j9
         8A4g==
X-Gm-Message-State: AOJu0Yz4aq6rMsAytLWe8DXykIBlUXfMD2LCPfk7lf4coeV5r26/FtWN
	cNRtqusWPf+F3DyMte7/JUm2fw==
X-Google-Smtp-Source: AGHT+IFU9aOd57XMHkjUfgCesvQh4jI8dOaEF345CS48c+uA4Ci+ij/CalBUYdApLt8nWIG9HHvAmA==
X-Received: by 2002:a0c:8c8e:0:b0:641:8df1:79e3 with SMTP id p14-20020a0c8c8e000000b006418df179e3mr358262qvb.29.1693514508451;
        Thu, 31 Aug 2023 13:41:48 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:bae9::7a9])
        by smtp.gmail.com with ESMTPSA id u11-20020a0c8dcb000000b0064f45b8c02bsm899553qvb.49.2023.08.31.13.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 13:41:47 -0700 (PDT)
Message-ID: <fea0cb4a94ab9ba757f32ad5539d075089dc63e7.camel@ndufresne.ca>
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Takashi Iwai <tiwai@suse.de>, Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 31 Aug 2023 16:41:46 -0400
In-Reply-To: <87wmxk8jaq.wl-tiwai@suse.de>
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
	 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
	 <87il9xu1ro.wl-tiwai@suse.de>
	 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
	 <87il9xoddo.wl-tiwai@suse.de>
	 <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
	 <844ef9b6-d5e2-46a9-b7a5-7ee86a2e449c@sirena.org.uk>
	 <CAA+D8AOnsx+7t3MrWm42waxtetL07nbKURLsh1hBx39LUDm+Zg@mail.gmail.com>
	 <CAA+D8AMriHO60SD2OqQSDMmi7wm=0MkoW6faR5nyve-j2Q5AEQ@mail.gmail.com>
	 <CAA+D8AN34-NVrgksRAG014PuHGUssTm0p-KR-HYGe+Pt8Yejxg@mail.gmail.com>
	 <87wmxk8jaq.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 01 Sep 2023 08:06:06 +1000
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le jeudi 24 ao=C3=BBt 2023 =C3=A0 19:03 +0200, Takashi Iwai a =C3=A9crit=C2=
=A0:
> > 3. How to handle the xrun issue. pause or resume. which are brought by =
ALSA.
>=20
> Doesn't V4L2 handle the overrun/underrun at all?=C2=A0 Also, no resume
> support?

just a 2 cents comment. All our video m2m are job based. When there is no j=
ob
available they stop and resume when there is more work in queues. As there =
is no
time constraints coming from the hardware, there is also no API to know tha=
t
there has been a period of time without anything being executed (under
utilization). Only overrun can be detected by application, each chunk of wo=
rk is
in its own v4l2_buffer and the application will run out of buffer in that c=
ase,
and will have to wait for free space in the queue. Understand though that t=
he
larger the queue, the large the latency. There is currently no way to submi=
t job
ahead of the data (unlike DRM subsystem).

I have slight impression that all this seems rather inefficient for high ra=
te /
small buffer. I'd suggest creating a dummy benchmark driver to verify that =
the
overhead isn't just too much for an audio use case.

Nicolas
