Return-Path: <linuxppc-dev+bounces-6187-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD03A35D3F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 13:02:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvVzx2qZSz2yvq;
	Fri, 14 Feb 2025 23:02:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1035"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739534573;
	cv=none; b=ZpjKn0WqIboyTz4heSAV2XUKOKiy1o0d2S8Phk7lsCshGHHIpx8nS7pMOXTbT+rirTiS1GHCVPbW8eznbg8gHaHuYOGsd5wlndePqb88TuL+2LCEb2wFFIUEBdCf1SPg+AGtcei2BYZTgsNpaaryRx2YknKfP5G0Gs0x6OPZC3DJYZTYwWfggC05QIFsiDg5AQdjRJB0nFG1mTEoPrCyAK4MxU+4pLsqi/5nyeAcYiOnTnUyrWXEbCbUvIYihu2VmMqC55RhKunnpxiPoaEj6qMiS8DibE5v1RiKlQKjNrzblC1g82epLfObY7o3fJb/8WcVdFJ3+o3t0pkqnwWQEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739534573; c=relaxed/relaxed;
	bh=l+3CPNeqoZCzZqNRxUO54Y3vCSBLp9p1u471MLmZ1I8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhysZAivWIGhlmekwgPjzaWtD0oVlHDG63cNb6v+QKhWHuhV6amEQBSOOKseFLQiWWJLBnt7Ot2CzdXPp/FIPvW+BvvGImTzPsU8YxhCQnrqYYSidhjat338AWyTAkcqstBBa/GvwgPwP+Dv5YDDvCKQR9XXgJU3U9w6YI0rwjIP7VJsEyHKIC641apBeWnFF7rvFTvnc3aosBds0/7YTtkXhNfFp46Q0VPQ/sFZSFSENaTF8eQ9lIIaUosUbBNz/pk/+7yz4PHqMpdafpdk1gvD2k/uzprOld1rJBCNalWEnSMga1NymZkyL8S+jvKlYN4Y5Kb92070VfAZHTCNNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZHZwQJpr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZHZwQJpr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvVzw5stnz2yDr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 23:02:52 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2fa8ac56891so2871170a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 04:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739534571; x=1740139371; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+3CPNeqoZCzZqNRxUO54Y3vCSBLp9p1u471MLmZ1I8=;
        b=ZHZwQJprpxUCwTz3cCj528beq5I+/5a74r1rQT/Zw8ISMiLTWcZ8Pi0graH5Mkk6FM
         qrNNJkG3oiANjSiAdi5y5e/rV4LePs8EPqqJJjVq8Gw0JqG938LUoI4g4R7oH+TfQ6tl
         RD0VBZk14OxGtUmcHr7gPUfyBLsd9SFyekW1kMUkSJt2etKKp2QzI1Ycdzcck4higt/5
         HN9osdJBaiRX6J0ejvc2q8aqCNwMZffseI973sgVSFhPtLOMzIy2yCW0pvjXoWbbmNu6
         RwF+9WOTdeGhUXdGzDNs9lrFZUgFUL1J+iiFn6+gkFv7V2wjW7SGbpqCJAnzyw8wZCE3
         CARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739534571; x=1740139371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+3CPNeqoZCzZqNRxUO54Y3vCSBLp9p1u471MLmZ1I8=;
        b=wrZyftQ1/JvuKaBh/Rrpug1bWibVKpIjAHRCwNVZ06rkYhOYugbYuI4qdHIPTyUzsE
         MxgWGasPq0hI7H+3cGxQ68Q58V1umnOp/xxiWXTkqfG2UehDO5PQr7ZyLNV9jZwhWQEM
         qegm3C/fHexCerf4mGfJlJmP3sMAXB7MMFaYdyHgBLwHVmTxUjlsC8VZHKs/nlZSWgNw
         ljZrUd3xn56Xra/zZkOIJjHi9NqA6MWRurpONHVQc7pbYrcOU2MTlbAk+K6Ev6FNeZFT
         3Df/yNBLx3WExxTeW0grnheqzNTA0aCf+SIfcHq9sgaTSKyCFp8uX+oBdFrmlt1FrKxo
         pGEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnAaxO8kflMQLbcVfP28dgualVFgGPIUmqHgRheSh5aQlreiqDEvooVxR2Gyc2elPaDNRZfi7jwC8oOvg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwCRHpoTho0ioim+osx+jCPbBC2hwkWoZZr8MEAI/xO73th7YPR
	kPc2d1hV58XwUT5oNjMST2Lz89/aWC/6y+Ob00cLB1dnVMtvhh/PIUnBdi7Suw7mKYPEOkCOh8t
	tDZpkzI2VtlFjd9MreJqK94xPAGc=
X-Gm-Gg: ASbGncv8x9uED+j0TwjeIGM4+2T00fZujGr0j/piDZcZBj8/D4RRRrx65eBHJQZvuQw
	RSjqoc9oCQTjqnv4MhSW4jXwyalc3TpjCGRwmQWQK7H2Vw8wJ8rRRw56aPFEKUJ3Ew3AzuQ==
X-Google-Smtp-Source: AGHT+IGvWztfKlUGJ2WLRtNHFcChcht1iG1Pz9xgqQDdN9VXIRR7a8jyDsGxC3J/ad+Hwz78GM0iN/i5RDbRohXNQfo=
X-Received: by 2002:a17:90b:3a89:b0:2f4:423a:8fb2 with SMTP id
 98e67ed59e1d1-2fc0e98dd17mr10159553a91.20.1739534570753; Fri, 14 Feb 2025
 04:02:50 -0800 (PST)
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
MIME-Version: 1.0
References: <20250214081458.296948-1-chancel.liu@nxp.com> <20250214081458.296948-2-chancel.liu@nxp.com>
In-Reply-To: <20250214081458.296948-2-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 14 Feb 2025 14:04:23 +0200
X-Gm-Features: AWEUYZnUV8h3wyE_Qz0Ok8Jj-T8MZQVUBOK-aG4pwrrdiSsACc9urHDHo1Xwv1I
Message-ID: <CAEnQRZDBE7foG5qB2qeDP9GmaHybMJNj28MMW-VZLqe6tiu_bg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: imx-audmix: Update correct dai names
To: Chancel Liu <chancel.liu@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Chancel,

This change should be squashed together with patch 1/2 otherwise you
break bisectability


On Fri, Feb 14, 2025 at 10:15=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> =
wrote:
>
> Update correct dai names which are changed in CPU dai.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  sound/soc/fsl/imx-audmix.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
> index 50ecc5f51100..dac5d4ddacd6 100644
> --- a/sound/soc/fsl/imx-audmix.c
> +++ b/sound/soc/fsl/imx-audmix.c
> @@ -119,8 +119,8 @@ static const struct snd_soc_ops imx_audmix_be_ops =3D=
 {
>  static const char *name[][3] =3D {
>         {"HiFi-AUDMIX-FE-0", "HiFi-AUDMIX-FE-1", "HiFi-AUDMIX-FE-2"},
>         {"sai-tx", "sai-tx", "sai-rx"},
> -       {"AUDMIX-Playback-0", "AUDMIX-Playback-1", "CPU-Capture"},
> -       {"CPU-Playback", "CPU-Playback", "AUDMIX-Capture-0"},
> +       {"AUDMIX-Playback-0", "AUDMIX-Playback-1", "SAI-Capture"},
> +       {"SAI-Playback", "SAI-Playback", "AUDMIX-Capture-0"},
>  };
>
>  static int imx_audmix_probe(struct platform_device *pdev)
> --
> 2.47.1
>
>

