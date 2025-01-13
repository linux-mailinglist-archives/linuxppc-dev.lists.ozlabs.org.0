Return-Path: <linuxppc-dev+bounces-5148-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B61AA0B632
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 12:59:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWrR35TBkz3057;
	Mon, 13 Jan 2025 22:59:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736769583;
	cv=none; b=nlGb6gc0nTBRSBgJkHiYbkWu9903rZZR+cvwUYw/z9WKjlmdlGznbdsRqFvIaTvttxfWCIKJhVLXHosl7gIM68nTE3ciOPZhsvxlXb4VlCZQMA5KA30/e3JQxEoWrXbilYG4bJh6sgjg5jPfxdli9q4T6BZ1QuCj5jViCXzRjE4KCySpdd+wrKOFcuWZW8840hOwNRuGhUvlpaCeZIkOUk34D+uTDygCiPA0zhFBOMQ77iWWnaWoZPa0dTQ4F/PqsXVZNmaLNKVkzkD0sz47oNe1my4mftVpiNieEC2qOSB14TOk2KHMd/uMqsHmxgMLM8056cyZEkJHprmmLYiVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736769583; c=relaxed/relaxed;
	bh=4BZHmOiaKjZIN7/i2N/P/VavWYL8MUkbjD/7u3MK1MA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZ4FL6vNgKuBvlb8haaHO9S6mCiQWGRwKvdbKx54wH7UOfBxNI5albgzPniQbcZpfVwHqEoKY3tidthX/cnMVIxOnnhzjbMmOHLGfgXtUIExEgUiwNR4sYkRJ4SyVzwZjFIE23og8obZCOp9OeURgQgzC8T5/3vpIz51h2vHzan/ThbMFRohR+X6xCTWcAl4bAAWU1DFqmhTGamGnHkNarNOAAE0IHIOZ0KgjFNEu+yrtc9GPxchz6qeRoW6JoyEhlW8LwUIVvWdHy9xqaEOQCe+KZo0j/yZSCzAVXB0zG/qq1cCSRUX3pXQQlam34wXOEzWgcAx3BdLZNWfnPb2Bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RTEgTBmh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RTEgTBmh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWrR167VGz300g
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 22:59:39 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso5236963a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 03:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736769574; x=1737374374; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BZHmOiaKjZIN7/i2N/P/VavWYL8MUkbjD/7u3MK1MA=;
        b=RTEgTBmhaoHnNpMrGgvar0DA13QXBiBzgFWjpmdt5A6a5OYOywSa+Rr9kF5EcU7POf
         km1gAkgiE7EXMBhmotOeiyNSFLU602ReSlozXDKBLfKO3cbBZXjNTk3Ph4CwjxgqNo8t
         cA3k8kaVW0xZaTvLDQ9mraUy3E5RPWj4J5HkHp7ZFXc4e6JVGiLoHBgn49kzMO941naN
         6oxI+ofI56hXlKuO2ZlABcjKg8LncsedHVwh7+Tk0VMzOpwE6ifTa2ynkNcaD1ifQnvF
         fjEh49akAkjhXueNCH5Kl3RCdz2YNcdCntuBcLf4sH84cHNLAQmhurfMZi/iTar7qWKg
         o7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736769574; x=1737374374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BZHmOiaKjZIN7/i2N/P/VavWYL8MUkbjD/7u3MK1MA=;
        b=Fxdazhqn7t+mji/b+pPruHa9gzGaZkL0vS5515lSqGYre9wt5qBpXZTz65pGv+TaDq
         Xdea3wBFUQuZYSxXZxm8HSc5SJjqDaJlAqpb9cDkOknMoNOUQqRJoMtoP/uFk9UfFtgE
         0Obuc70PqGuq950/NutLMLv2AAu7qYvnrd+ExrUjKTDalUcOu4uQoqWfGapPtG86ImXJ
         p9/mAEaVavnrVmJDS9EXC+nJKdoAzq0EpmEMIKUpQqSOh9R7stU9X98Z9aV/eDeCdYkT
         NrHGGIjOzUBHyuLZLF+bmFUZcr2KJvMivmWpHPdfpB6dC8xPOf7UxvSj1IZAuhls+U3Q
         zScw==
X-Forwarded-Encrypted: i=1; AJvYcCU4DsBbaKi4MDNOwyVDr+U4BPsSqtVFbId1yMr/16MR6J6m8+q5AK1EwsJgmy+ENojRs4UYH8ZsXDk2c+g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/b1xKc/Mkpj8WKuoOrjcccDtpzpuDpdtPFUaMfP4eDrz/1+m9
	RojK2NYs+I6EAEiuiDDBLwO9sX3oxiAvy/uCLzP/sfHkotrBBAhqf0l6Ywo4ZbrVfOveA7jnCz7
	76iLi09PmNIbn0nZpj+1iQst2uIU=
X-Gm-Gg: ASbGncu63URmmNF8HESlfqSxm2/2m+J9iDKma6zF65vJ5mez8Ti9xDIwMjVlXmN/cwu
	GvZgGLboIOXdv7uCWLuIrrid9MQvaCvnDYA==
X-Google-Smtp-Source: AGHT+IFFtFvwWjMl/5EMpK2S7nSEZ6pgoPxNoo69HRCpuXIwKyRJxcrGj6mncXjqy6XcaiA0mXO/qFfFeO0UEvjFYlo=
X-Received: by 2002:a17:90b:2c8e:b0:2f6:539:3cd8 with SMTP id
 98e67ed59e1d1-2f6060edd49mr13264006a91.18.1736769573984; Mon, 13 Jan 2025
 03:59:33 -0800 (PST)
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
References: <20250113090321.3193464-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250113090321.3193464-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 13 Jan 2025 14:01:00 +0200
X-Gm-Features: AbW1kvZExglXQIlMfF2a_bl5zrshwSuduhxAp_KYgu9q4zErtaUNw0cuP3BKxhQ
Message-ID: <CAEnQRZCz5Okdy1RPh-Cs3+E8zJdmC7XeQtU1H-8F5oGu2madaA@mail.gmail.com>
Subject: Re: [PATCH 0/2] ASoC: fsl: Support MQS on i.MX943
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 13, 2025 at 11:04=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> There are two MQS instances on the i.MX943 platform.
> The definition of bit positions in the control register are
> different. In order to support these MQS modules, define
> two compatible strings to distinguish them.
>
> Shengjiu Wang (2):
>   ASoC: fsl_mqs: Add i.MX943 platform support
>   ASoC: dt-bindings: fsl,mqs: Add compatible string for i.MX943 platform


For entire patchseries:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

