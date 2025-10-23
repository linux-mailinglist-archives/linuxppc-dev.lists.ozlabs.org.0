Return-Path: <linuxppc-dev+bounces-13195-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A872C0005A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 10:51:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csfsk0Fd0z3bf8;
	Thu, 23 Oct 2025 19:51:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761209513;
	cv=none; b=K4w0FVBCPXvmjfG1D8lDG4KYlqNNNDXpyfZIPYKf1ObuZ4I0pl+2MBxWELe725EKcR1DfA2wQmLJVViyubSzLpcflrWAohkB9JOfs+XxO3IXZu0GvDXDQpeL+4zjawcyEt/DME6/N8HH9e6d5ELSuyFjfYUknMu2FCmgbmUkDBvSweBYFJ2OhH+kTk3bBHYrFJfYb3vhieffETBod9IuYbyy/meCtEVtEt1MBR11AXPAL89VyI8powRjroci8/Wcp/ob9hEy1K7nVPMzbWOwb/gUwMaBuZ5QlRaf2j1aqe3tzlY9G2QJFcReuIp/whuj8sedTxOCsBWFgxiUZYEkfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761209513; c=relaxed/relaxed;
	bh=Lia0EGpI9PV6Wa7Mt+zwkxVNwILAbw34cO4vX/DEgGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NN++TtlF/2Z8oLv7P1Aw6PdDgtksXNlZN6go1IJSt/YCpNnbxt8IT2nC6sNjJbL06seCtHn5zXqzh8S9G7SWSb/SSLVdJmIV5hS4vfkAXdAEkf2wcMFTO7TwFEbLJqyrPkqiCdXOVfjUWHFCPgmSpWoAaIW9RaPOCAQm/SspIV6PH6/mswEDRtAQRk55oBstOOJERclHx557W6jAoYv0YQ1Mf3VA1xxV5lsB2RAk0yUl3im35wO4gRBKLeT3A1IyCV/m7zgJIYoGQbqvbRfWqB6Owk+0h6V5N4Lv+V2/SlILMzTZheqkZuy3QEvQF/k/ot7pX4OIWSAsuFjjKQNmZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NPY9L9Wm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NPY9L9Wm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csfsj19jSz3bW7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 19:51:52 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-290ab379d48so5456025ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 01:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761209510; x=1761814310; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lia0EGpI9PV6Wa7Mt+zwkxVNwILAbw34cO4vX/DEgGU=;
        b=NPY9L9WmSsrMfYnKorZCQKLGrZF6hovhNQzVCxn63kNwSnhF6vPWrgz9NMCelAxzF6
         jQhMfoID7dShYSrZ3h8nQDhdT6D61varetex+09oxVHBeDaEvkbh9omK3+ZbwI1LnqoZ
         B2DZdmTyo2UVoka0yo4d74DuSP3KeZt/c5xxmuqiwoEGGnG9fwFV57JV/aYCxSYgvjEg
         6CRWy8jQL8AIhzI0O4tYknV4imHzi18HocnEWCeMh8LOJoBA+JOpdjIG8n8kFCiN6+UN
         JmhvH6lcODbzRInXj8jGPpGdRiTiUes6Uf6LrsncbwVMbNCQLrCeqe7rzY0PKAPsFwHv
         pLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761209510; x=1761814310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lia0EGpI9PV6Wa7Mt+zwkxVNwILAbw34cO4vX/DEgGU=;
        b=Gn+gtqdzViXgLK1Q3844cELFPMGRbfmPIbBkcqPnSmn5PfDx6NsdSwcRSBfvqL72di
         Ae4e3wjCPPa2iuFlO3/2r2OjR16pvZWgGc4OLDu7AFppkWgER4Dn41ilugtrppL/G0FK
         WPTobzkbyf3xWuMU82RW24tCbQbrqR/IHE3dzznK5c/LyYctsWhlavEmbIiikcINKVWg
         /sTv+mjd5fvopnY8ujVHXVDMYIygLKs4dCVTIJnHKa8Pa1j1+uu6cfudwM/VzNBmoDSl
         1wiHPA3Oi3e0ea1ufJgCmjIATvGvbduaLqOyTd+XmfCGS21e4WkYD36jaLAqiFVfg7u3
         mPuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRNqchmW8qL2GZsh64sWP+x5u8fzvljsbMT6fpzBUeZMEPtRWs2sRUIHF1XECtM1ucQC+CIJp/7rRRkjQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwUE6F3QheyMn3lmMytgAJ0SF7Ab+sXvKabq2ojd5QB/cNbDn+U
	TS2bhptPogceVBTaVkxDpoFdMZ1Geqj74eaDNHn4JLCz5HGYd+gxwCG5CmwplVaIsxyBSiWhcWP
	h75f/CmvXS/W9wf73RwhqV1MdONYG8CM=
X-Gm-Gg: ASbGncuze0wowLYjq8o1tB4iYu53tgDXcxN5sxPjswzJurofQoYQg/c/jI73vQZUuyb
	9w6EBny5rPJOpMeV3fgvymF84CL8PMjHSzjlLiZ/Bje9ZV5gmFpHYIrX9+7CEHkOIt95LJKMhxH
	n6XXefqYTRtQaCYXqgoTuJatuhXpEoeFkoXZkVksUl3jc0PPWxAV8MSP7qViwrUG7eyFmNsvk97
	3Iii4a8w5GXHxM86vZUFkNrdfGl33gK5t188svw2bK05KePTauB3Beg3fIPqiS1WBNL2VjQ4Z/V
	KWgbLBpkq7TG1Q==
X-Google-Smtp-Source: AGHT+IGVhcbDEMKuw//0lICyRubANBw5BQL/FcN59AYvKRLUM4Q47l9Dc82sfAc3l7GBs+Aq9SlV2iNwhGdQYMKgAJA=
X-Received: by 2002:a17:903:2b0c:b0:27e:f06b:ae31 with SMTP id
 d9443c01a7336-290cba52787mr296045245ad.61.1761209509923; Thu, 23 Oct 2025
 01:51:49 -0700 (PDT)
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
References: <20251023064538.368850-1-shengjiu.wang@nxp.com>
 <20251023064538.368850-3-shengjiu.wang@nxp.com> <CAEnQRZB+rFudpHB7TKFOCumh4Ni9q-421X3jRL2y8UbV74e-xQ@mail.gmail.com>
 <CAA+D8AP4t+vS_n=VvRR5YYYrp0DGdWvqSN+4U0ZWMaGHmmt9ug@mail.gmail.com>
In-Reply-To: <CAA+D8AP4t+vS_n=VvRR5YYYrp0DGdWvqSN+4U0ZWMaGHmmt9ug@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 23 Oct 2025 11:54:08 +0300
X-Gm-Features: AS18NWBXVYcg4iSh2cxYMtB5rD3rArP78fbSE0SD0ku2-r_FGbA2hH__QJQSJT8
Message-ID: <CAEnQRZBiUu+45Kwe8dy=NsVULj3j=+zmgUEtg1SjZyP8KBpjTw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_micfil: correct the endian format for DSD
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 23, 2025 at 10:52=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gmail=
.com> wrote:
>
> On Thu, Oct 23, 2025 at 3:10=E2=80=AFPM Daniel Baluta <daniel.baluta@gmai=
l.com> wrote:
> >
> > oldest - > most significant bit.
>
> 'oldest' is from the time perspective, which is aligned with the descript=
ion in
> https://github.com/alsa-project/alsa-lib/blob/master/src/pcm/pcm.c#L2050

Make sense. Thanks Shengjiu for the explanation.

Then this is fine:
> > Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

