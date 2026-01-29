Return-Path: <linuxppc-dev+bounces-16389-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFDIBncqe2kyCAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16389-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 10:37:59 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39722AE331
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 10:37:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1vFX5wNbz2ydj;
	Thu, 29 Jan 2026 20:37:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::530" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769679472;
	cv=pass; b=GlSCpP/Vidbmo3aWFY284r/eAGhxhi1fGL/fDvEj0r4lQvGqXXyAjjGXj2j+jwUHb+oSBv/6hPm9Lk65+/0l0MY/12BiQabXUoSCUsgwkstitih56Hp09h2BLkdXI1JlIwQX0M+sZ1ROjI4LOyPf2UQz7F7pLCnB1KMKEgS2DN5n0sBgMCbIzHO82uUT1nNqJNGhsnSQONqPhUBD9G+bgP4QWiu0vm/JZXMrntgKlSgynLoEyMvI3MucCnQA1S877YDzheEtzlVbzxx53dpgjFN1zaYqe7H/KeykGcUqsIANu2DvQe2RtqddBnCIDNbR3t/pwi1iHnFbrwhpksGW+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769679472; c=relaxed/relaxed;
	bh=4lU8GWlv78rS676V94HHH4zs90Fwj2GtCQjzXirgDFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iMMZDMrlTFmjmMbuwQgrzwQhEQSxrqYrl3+0Vbc0DUddAFK8jrsEKfsu/89ryCpjLjFo+EY1gPtYraRH06W80FDFKqDW+MOn6bYU3P8Kt0oCPtpnaGxB0+0TaWfGWFqr1trYslDU5gZrzTQ158vpicKNbBAta683WrLllK60d4r5KWEoLo0sQ50zd1TwLzqUoqM4gwah0QuChkPEGvBd9NaOxWzKyygcViO16N1ARVoptcB5jFGVl6/AGz6g7pYFaIjKKFZlauZrcEI1/kJcOyIWqgfaNgwxEwbiIMHzbgfK+voyLRk6IfSZKNI6MPITM3D678bGZd/54Nkxvm5knA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZYDYehbe; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZYDYehbe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1vFW1Rfgz2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 20:37:50 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso297762a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 01:37:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769679467; cv=none;
        d=google.com; s=arc-20240605;
        b=HB6VyaSxbiMw16i6ToBpu+mZMJL8y30xYnS7RRMCfiSbND7BtlET1EmthZM5ULsGR0
         1AqN806RqUx7XLe+lNIGqs6ytNN94hmw/46om5osXQF0XNCnnqCK/Kzay5GXxUCpQTgP
         nronLVMmQ5HabajWzhi84is3lvLOW230ogdJ0e6lEMq4k7mBxWjMasPs9tKQOw+XHqzu
         p3XqNqKeY86NjDzg8V4k0UjdtbHR+sKYwNtgKEN5J2e1LGDEP+af12g5zzj9RLzVDahH
         BcGzcQbhzo0TSYhSLqipzD8T8sSzor0MRclK1iN5YF44wmyzSJ+W3x2x35WA/R5fHVwf
         Gi5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4lU8GWlv78rS676V94HHH4zs90Fwj2GtCQjzXirgDFE=;
        fh=T0uAWuN9qkTqSy85zLxSDftCktfYx66VI0uNhLZ/HPI=;
        b=T+P98UuP6HIsIgw1yniDQeQ250U6o1kRmZeFOW6tZaKIFev6CJ8sBATAApqkj5YCHr
         ffJRjGjGIqVgEP5R+aZy39Gm5k3DKKoh9762eDr0/Yp5mWFsukVsxA57t8EnRMR2THbQ
         oKlHSsFwUsPw4eNsodPB11IEyZO0HAKvI/D2iKzoLeX9U0Tb6VTgIGXlgMVfMFhNf8TP
         zXKvI1IZlRVWGC4/caKY+1iUbi7feMw7jF6hi3lc1hMmk0S4CLo3GBD57EAqfLMthHmK
         CSDwhTwTJ9IIOwmkM0+Rrlp8cTrJaNmVIRIShcS0fIXnhQkGAYs1GKjOwpFgOXHawcZd
         KbvA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769679467; x=1770284267; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lU8GWlv78rS676V94HHH4zs90Fwj2GtCQjzXirgDFE=;
        b=ZYDYehbeai5dtSXwqDgGq1IuRa+pRFNBxJiw1qm1JtqeXTZYEEASdGjNMliS9pB/KL
         6uDvSHuovgNxcoHcNHcyCxk1Uynv5AoIFKsvXm6LmfCrxIboYQX6ycUWPL7Z1F3Fy3dO
         eKVhkm51cRqabea5ORlyFZ7pD6Lw8AvIAgkw1vYE9BUxvFs751WozMrsG01hLG7XunKz
         0o4O44OrZ/i/ifesR4AjjhSXreKG+xGCoBkuyBB2DL114Vk77ZLjQY1z4xQxjE1O4SJ6
         u2oOvazxWltYavVIS7f1lSm9S/59iAHoKU4o053tJsN8T7Eqob5edvIvftwrJW3NujTi
         S6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769679467; x=1770284267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4lU8GWlv78rS676V94HHH4zs90Fwj2GtCQjzXirgDFE=;
        b=JQBldXMrxOsmItxcCmfaVZbMPLlIp3lfDsPiZjUKfdlcC7/7i0Rfnw9Z/bXSCZYgKU
         BlycUD4J7GJf2z5WzYpjJCc6jdoXgyWnrjEY2LS+DfOIzah3HJ6OOFr3vdYLZtr15tQV
         wUu2UPOx7GoVJUHZm0NNljPqrqXeYrZuUjmTdMTpgH48Wk8UNfE7MoBmOobd32/Gr0P9
         h9az5EZc4xXmbbfb/QTOQToZdgfnJRHYwFlW1g1yFqb/KBgQd/i1rnKobO34qdhPRm6z
         fZQrJdbOaq93JEo6FdAR8G8T+D1xVwQgjrIwrL/69zvvf3m4U3ycFnRGbF9jwe58O8mZ
         ASAg==
X-Forwarded-Encrypted: i=1; AJvYcCWItd4Xmz3qV5nUAFGfoCtmDxiyJ/v90tx4wLO9XIx5PR5JAvY+SEQls6t0Tby9FYX6RDeJTpFMchJlLeU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1KQc7W/b3uhXoteVHnGbxL/2QR+dFomS9YLbg8LTcvdFvB4Gx
	pMuin8oFgi5mfdxPkPVSxLwXfyJ6Knj3F9j20Yvfk5FLadPLHhzx1lnmI8zBYV95x0JdqNOP5zS
	ZalbPJ+5u0tT0oEnX0gsrjN5ix2pR9PA=
X-Gm-Gg: AZuq6aIjpvJ3o5sPuC8vMsaWQMUKozb/PO4OMAe+p47Q5ZqyxJsSrODjRLP5796zA6q
	ItRsxGelG0CM0o5yYtoNx2vtau3lW3lPO3LXBN7QsD4YcUMj4wUafk5jxn5e4OAiy4BL2bpJpVI
	xGCjOAPmNnhoXlyO60ot32MBn7tXeddTVftPbg7BU85jBKhG9wYc901hb/b2dcrx7KqcvTJ2q3K
	k7NXpouWBQzXGf4ZaHC7iNx5GvKmCAqzdOzPZ4AW7i3kuMiEpszh4qR4FLLh8ZileKRYTg=
X-Received: by 2002:a17:90b:1f8b:b0:352:c9c9:75b8 with SMTP id
 98e67ed59e1d1-353feda27ddmr6746159a91.36.1769679466914; Thu, 29 Jan 2026
 01:37:46 -0800 (PST)
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
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-4-shengjiu.wang@nxp.com> <7e34b098-bdab-448e-a34a-02bdc643f700@oss.nxp.com>
In-Reply-To: <7e34b098-bdab-448e-a34a-02bdc643f700@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 29 Jan 2026 17:37:35 +0800
X-Gm-Features: AZwV_QjhsaT3WGqHFWhY63rZWE_xfRO_5posf7-8hnrbY9543Mu3MY60Z30GXKk
Message-ID: <CAA+D8APbzGCSHOwGyBZjf1TYqo2K0s0dvoLjHS+FsT_RLGrb2w@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_asrc_dma: allocate memory from dma device
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16389-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:daniel.baluta@oss.nxp.com,m:shengjiu.wang@nxp.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: 39722AE331
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 5:22=E2=80=AFPM Daniel Baluta <daniel.baluta@oss.nx=
p.com> wrote:
>
> On 1/28/26 09:18, Shengjiu Wang wrote:
> > As the dma device may support dma-coherent property on the i.MX952,
> > allocate memory from dma device to make asrc driver to be compatible wi=
th
> > such a case.
>
>
> This commit message refers to imx952 but the change in the code apply to =
all supported platforms
>
> So in not really clear what is the intention of it.

The dma-coherent property is used to indicate a device is capable of
coherent DMA operations.
Which is applied to the EDMA device on i.MX952,  in order to support
such EDMA device,
the memory is need to allocated from DMA device,

The code change is compatible for non dma-coherent and dma-coherent dma dev=
ices.

>
> Also, it is not clear why do you allocate a pair only to free it at the e=
nd of the function.

As the comment in the code says,  it is to get the dma device handler
for memory allocation
. After that, it is freed.

best regards
Shengjiu wang
>
>

