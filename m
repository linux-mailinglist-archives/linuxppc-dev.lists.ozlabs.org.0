Return-Path: <linuxppc-dev+bounces-16383-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAolAvXAemk3+QEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16383-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 03:07:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E60BAAB028
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 03:07:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1jG91nk3z2yFl;
	Thu, 29 Jan 2026 13:07:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::52a" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769652465;
	cv=pass; b=oLZMONbd9lHBeG/4nM2cBEabFZzHZFHL6hNG9dZ67ElnA34h4H/yQC2g9qIaDuEwTGSdqZKdfNllJzss8eKrzfU8hajHSyjEYw+s02eEhtIhlSzH1xMC9yx3ZOXhsOsqTSgJ2FWgYXmTk+uyZXZ/Mlx6xZuk3z/bOEi5EjxY2ipFccIgbwNtMk5cRaHlhlYCF+PyW0ffKpGTrvyzklCwUVCv2ZjsCHcdGpDahV+gjGFulXiB3NihMVLerh2NpYs5a3MEvZrQaUyjC5Ecan8l3tlc/QUSrsxQe7uTyHiq+BLvS27QNpneSMulmPEnfLUnrfGZGwCKVdC99Q8TdUSO1w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769652465; c=relaxed/relaxed;
	bh=/EHsl0dfhwfqP6ryiD+Uuzynxf8kJEamt13Ja96DmZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/ojn3iJ1aXPviZwUoIx+8ZXezE9a7w1CfY+ljBFJ3uYmKJ1nwdiLZS4oCofwhPxBdEtqFFiKZfpGjvb+mBf7Y9RQN+SIFFekxwE8QKjobPKi3JhkOPQTiB8SrysQeNYVT6yyHhPu01aKSmfA9EUJjhBEpbix6AFJ3pyaNgLhCVg1+TuOUE8BvxPJZ+/ftYUhz5A9D1mXu8+sKhg8Vh6xh/9clK2De+jooaAV1oGnig8Gp2QY0TBK5z3+1vdncWzhYSY3HZ6+3nCu1Ybc+HelI3IFfJiLtgr3VjhJQqhuZXA6mY+mf9A9TxaWleor36vIxioueg/IRIaCiBIz0npjw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YuXXYioi; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YuXXYioi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1jG72jsSz2xNT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 13:07:42 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c6541e35fc0so234307a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 18:07:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769652455; cv=none;
        d=google.com; s=arc-20240605;
        b=TeZcK4vVIfVefNoLwoPz49PPl4HmWFmnRCvqL+ajuQ9XXiCe4HyJaUkGIMrp0wa/Hc
         f3we/t5ErqGi/LrcO6WeOcKgN5tzubHn1pvWNwZpmxMhjoZZIlCJpKvqFxtLhONgS2So
         igzs6Sr7SV68fsdeGd0irHMax/5H6jHZfRpQQeaA2WhfOLNqZ9gwnfAZR1BtnHJGLtAR
         9aXAjFf5jdDNhKfj+4LcZT30WeAWusI4D78xf4pGdLBQQzFhuraCevtEHfBYTQ30XzIS
         oD1+AI1CB0QKJWk+zVQgn2QTjp29MmI2JgZmSJu6V7KTfaYvPpwsDOugksMeReyKL62E
         KR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/EHsl0dfhwfqP6ryiD+Uuzynxf8kJEamt13Ja96DmZA=;
        fh=fal/+imKKXioeU5okpW2gIG0AYQIm2ccKL3O8hnQZNA=;
        b=XYuWsVbTPsKy3+hH3cvaNKuso9GMF/a5bVVT/8ZeTmbxNd0Wl/zMYKr60LRaTeHgrI
         CO5JurNquMV8l6S5NQKZUsyCKuvVsnA78+Fpw2M0zZJzFyrpiZBw2BGN8x0k8HCeQd+B
         I5XlocZ5BsApsa/0QoCnutzbAf1f/8N1LRaVfyfzBb38vveswRPHO7kaEPqxLG2qJw9h
         zqZNNDQgwz3P6KwdqEdsv3so5LFsN/Cj0+dfcNB8z4baFnLsbjekmgG4ixARrOxuNsqz
         HfZv1pC9pmIEmnQf3EmGGf5JNWsfMmM2GzQfq694tTGaS+HSmOUQqmr/UbpcvRy7aB1p
         qrbw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769652455; x=1770257255; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EHsl0dfhwfqP6ryiD+Uuzynxf8kJEamt13Ja96DmZA=;
        b=YuXXYioiYKKzWFjH/fY0YLGAzF4zBIoeruqoa7OyNJ24rXTXrY166425hq41sPhgq7
         nQobzcRVeEalnNEiPLa/Fr6lUF2Ichlp+I8kI1T3Qo64Vw4d5TqXIXmTXuSBqmxc5d0Z
         SYb2sY6REN72zqLTX46Sp+yf/pnIYOxKFr9uExRmrOqMJ8w4VZffJ/8w0xHlUHQKQ6ZT
         xNj0g3BbHrP+m0bfqHWReOI/QEzyt+hq8ZdkcnkI9R3Yc/Z6LF5FQNZkrq0Kp10weMTD
         kTXGWYbsS0LYs4NPgTaue5IFLzgjEHpomD18Ri9j2qBwwdmkYSbG72ObjcgD2gqqUOrn
         epMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769652455; x=1770257255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EHsl0dfhwfqP6ryiD+Uuzynxf8kJEamt13Ja96DmZA=;
        b=ml/6y2EXJ4V6W9cZaRECU9KospsbOlCD0gZXUW7/vVcd98Aej0IVoiHIVU8LTeh0Pm
         SZNe3u2WPwsFKm2BlL4A9LJn6o9sBiZDI7N4Ipk3kSi+ib5B6aePtBFzJ2QWZaPFHaN2
         wA1N7ASRH4W0XaqvVc+UyWr6t8yEWRJE+/8wnhvl01ev+BI7KhL9A+GqEa6v6cT4ANyV
         Vv196zDFAWiuoEuFCM4Ue/3PXSZtLXaRx6He2H+NxSaVX61E/bF0fNg+KTw2h/dCGdq+
         sUTJkzPjlY6y2WpHdaTGol/pQZXV5KR/t+UeUljUhIGpqptn5KqZA1XhAalWYUXT5xRI
         V+Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXJWWGoKfXh27Sq0OtNvQ+DglWS/W4gQ2YMtQMp02AH0cg6ufFDR0Xn0vwofA7kfFQ8kloj1ONLeRavDeY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxCZUA7Ed5DmlKmiwJPwqc/mVaxVVqIgN6Le9hG7mo2dKspV82U
	hjjKDLQMQpaGQ+CY5VKitPmX+UkUU9SBnJHZDjEuoCWfcpHc7dRV49sgIqoa0FIi2f+SWHprUHb
	2X07DDHt5qKcwFZ9Qv4hZzPNZlMrfuTc=
X-Gm-Gg: AZuq6aKkw8bqwHFys9Hxkx93wcl66M/NN9elwwvDPHAMowI+FcVWVFCR31bXdRh1i0R
	t/7O4CWyViiYYKhWtvRsLSRu2HAnPnmwAyK0fyzNNv9SfuYN42eoSAuTVuV3+C5CL0MqkMbDazX
	761SzmiTn8MhSPFM3mvKYObDqD8ecXZdSPr7oThIWEls6yELqcoNK0H2ebd/mGtt+AfAaoa8U74
	E9WGye2PiUxM0MEUXdphRFtzHGqzGZJJeyVA/sV7d7cfRLwRY4HdfOF/ma4TUuHWv0bQOQ=
X-Received: by 2002:a05:6a21:9d8e:b0:38b:ec0d:51ed with SMTP id
 adf61e73a8af0-38ec658522amr7340595637.69.1769652454754; Wed, 28 Jan 2026
 18:07:34 -0800 (PST)
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
 <20260128071853.2602784-2-shengjiu.wang@nxp.com> <20260128-daft-rabbit-of-abracadabra-fe3274@quoll>
In-Reply-To: <20260128-daft-rabbit-of-abracadabra-fe3274@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 29 Jan 2026 10:07:22 +0800
X-Gm-Features: AZwV_Qg-rrUV06PleoYM6kICczpC4hfgzfJ0lPzEIvMPV1d9IUOkAJEm-OUeTRw
Message-ID: <CAA+D8AMb-QPuqXfb4RyFo-9WTaH78WrAnCGTaS3DGXBP74DT6Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl,imx-asrc: Add support for
 i.MX952 platform
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16383-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:shengjiu.wang@nxp.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:conor@kernel.org,m:XiuboLee@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E60BAAB028
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 7:46=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jan 28, 2026 at 03:18:51PM +0800, Shengjiu Wang wrote:
> > Add new compatible string 'fsl,imx952-asrc' for i.MX952 platform
>
> We see this from the diff. Say something useful.
>
> Also, why power domains are not required?

Ok, I will add more info.

There is a power domain on i.MX952 for the wakeupmix system that
ASRC is in. But it is enabled by default,  ASRC device don't need to enable
it, so it is optional for i.MX952.

Best regards
Shengjiu Wang
>
>
> Best regards,
> Krzysztof
>

