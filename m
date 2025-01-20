Return-Path: <linuxppc-dev+bounces-5387-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB33FA16896
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 10:01:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc47m2ZRGz3013;
	Mon, 20 Jan 2025 20:01:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737363668;
	cv=none; b=U0D1BkMREh0y0REGVlU3jnS6TZB58ak4+2TlV479sDbevNz7QYccsumuGlpS+V6pB/3NBPzOP0VSoZcsKNa/XhdUKkQwdyn51E2c8h1T2FCGo0ZlW/KhgMZrKRK60kWhWTU+azh06nrLOKHBnImIirrVZ3XjyXO5Dztq0CefGMjkFCaO9kxA4luuJb492zmpC637pUweJ2HaHsjWJ+JyjKLgg4GKLQkejANpWJywE+YHeuHHf2UuQI1a/1dqNt+4xEiLsiAsFAYPtuCNOJcg27tR5adS+bs8LysHpjMlArcyPBkKK6EJqwQP+8Z9ABUY2EhKLst7jwWuknY7lquJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737363668; c=relaxed/relaxed;
	bh=i3RzSbSAFOYRz+LjJB/UoK23R8utNhUgP3eFyaBi6Ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgWrIWDyC+pwKCWKVPwVNxHj4x/BzgAsAq18QZFZDEkzEdyr41HqKjwBRxM/guRK0w6L3zFH8mpAPfLu2lKjPuUa7ClqyHUMpk6hpa5/FD3CjOQ9Kc2yy95CLlv+hgHgzKqaILv0v1mFg/HJ6XrTxIyIUg/rfMb2HhZiPXLC8GPZMUj3H6pHNpgc5mcFM+tKpsla4hJp3sT8f3kki4AVZIWPkHD/MlNwcxywEK47R7YGXs4m4Cng79XAdFi7ONqt9GsKCTOaQCOXLHOA9L1EevJKg4SBC5Nb1W8WmDeR8h3/Y1hISyICIpOOyoz5MewAAVv/rxA8Slu5GsFdsOVJXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=c2mtRpDV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=c2mtRpDV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yc47g14Bxz300B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 20:01:02 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so6468130a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 01:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737363659; x=1737968459; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3RzSbSAFOYRz+LjJB/UoK23R8utNhUgP3eFyaBi6Ck=;
        b=c2mtRpDV1jB0i6gEHYyTcbHyDoXUlssW7WkSxjNAPaZN0asjW1Hi6ZxF41PGFqm3fx
         JO/pCtn74dX3/hrsMU+exs0aOuko3cuzVsIBfsb2jxsTLf0A0cMWKkITafcaXU5ZpyRz
         PpEBJ5HqVeHrSURZkEFOSi/EVDQr0bJJHYV4aGINgqJL46sAaEaJyxY2DC6QO11plHk3
         n7u+cIv+kOqTkZr3+PBmJfkidVJSfwuDIso3i9ZMlpnIoIlwLuTdaqtANe/LwGtRCYmV
         kl00eAVCVPk7k9N0UABEWQUJ3AgapVb/4MTpKjhtYWOv/gUsC3EIIed9in7oEiDYbdAt
         Ca8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363659; x=1737968459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3RzSbSAFOYRz+LjJB/UoK23R8utNhUgP3eFyaBi6Ck=;
        b=pnV0XZxjVztdkH8PJ9BcekoF9KntY4enoubDfp7yyiMvnKbwUVkwtbxajpn5FL+P3S
         lLhBAlcN/Tw6WAzMOq1nd/mNKRX9Aok97pCIOte9xruvASeohaXiYNZq3CwYpze7Djk7
         qBfWpfVlfMGSlWNU9dUCV89o71m7UlahntDI1DfQzkvPQG7gpaDlaHxuXzA+jYnVb5jk
         hmJktpqLBiyp9I+8dfujS38jMJUYSLxyAuBfy+gnZz/djhRPRrP87j8pYo1xyh0Eb7t/
         tbJtcYg2hUB90wl8wXx5ahFWtfvclXOCaxB6KMIVe3Vh4jy9Dv/A5vSm+6wDD9+t3q0/
         Ksow==
X-Forwarded-Encrypted: i=1; AJvYcCUOHt7AghZG2y/b/OeL91NQuPZoqAlAxFTLPoxPvD2u3yt06vcT1K/DyV+1f7QT2lwBgjt+kEFze5B8ACQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzGXfQcBTI+tsS1HlrgTZ1KIdAXzo5ESjPMymDAiQCncZPH9C8B
	sftIWSWJkVR2rJMpLjIAMXpMxjjO6pBs9TpeuMeW1Cj98honlRfodffISXvaDS22JUbCSEGZUbn
	U507O7RUqglWaXHZKRDyM0eP8/AE=
X-Gm-Gg: ASbGncsuE5jG6sDaawlpL0L68UBtVbLozRV5vLmUykYH07Mj29R1dWT2jy+hYEQ2D9Z
	1YCedDjuG5seqUADIQ5q/k03S8+q/8T8ZOJF3eIOntRc/5Sc=
X-Google-Smtp-Source: AGHT+IFUYMhX3+/BM1JggYJVuxRQGX3UytTr863qz814gKz04w2DqWjUwnCs2EQ+xU4dxaucEWZmaBFGqnFIKfgZ0YI=
X-Received: by 2002:a17:90b:4c48:b0:2f7:b149:538f with SMTP id
 98e67ed59e1d1-2f7b14955a9mr9005351a91.4.1737363659451; Mon, 20 Jan 2025
 01:00:59 -0800 (PST)
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
References: <20250120081938.2501554-1-shengjiu.wang@nxp.com> <20250120081938.2501554-3-shengjiu.wang@nxp.com>
In-Reply-To: <20250120081938.2501554-3-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 20 Jan 2025 11:02:24 +0200
X-Gm-Features: AbW1kvbnaZpaZSDxHIyyEvAxF7UNYIhVPRDimqJRR0qSr95In6qztij86mg0ndM
Message-ID: <CAEnQRZDVTX2ARLy-5xRQtBQJ=nkknNQgq98zRDLqaHcDhiQEDA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_asrc_m2m: return error value in asrc_m2m_device_run()
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 10:20=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> The asrc_m2m_device_run() function is the main process function
> of converting, the error need to be returned to user, that user
> can handle error case properly.
>
> Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

