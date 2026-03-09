Return-Path: <linuxppc-dev+bounces-17874-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPHULC9BrmnaBAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17874-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 04:40:31 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E412338DF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 04:40:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTjT52fgzz3c9M;
	Mon, 09 Mar 2026 14:40:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::102b" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773027625;
	cv=pass; b=hqYpZ+oFyAw4nkDm+KH+08pJ7NSR/EeiR1jxdzbL7UqcL+SElF7S+tn7xN/iLRzPcEMgm4R0knXZhltLXMQozzyuD+k1X219wbbO2N2mVkz1mTqJnx6pir03MejRc3jq1TqyatMNy/GBBwEtJmF+zHPRfjcwTU8xCcQIPzxbbMQ51kIfQ3y58PMAmfNLRXKA1cGdiseAb/aqnXFps4Aa+fIcGb7VSd0AjcKwXCiDqQsYCsfPdh73rE3AvzHDnToYf9NL1rydHwk4C44QtXmpyqmJTRywGIV36FwNnFHEprRDGrMGdGR0s3qcSkO7OKwQ3AH5MxlCFT640ESa/bM5gA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773027625; c=relaxed/relaxed;
	bh=FKiYlaBVKzKkQ0fFD3dOHjGBjZMlXmQaDGVeIVxSCw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m51C6itlpqTIdL+C8pHiUbp0USDuck7d3FO9iUFuGJMZwN9hI49LuG9+SH94dXn3NoxgVuTqYneKK2ctsyH2HPMzOWZozf9d6qE8d1SCVSJghu/5AJyv+TG4paJo7QpkWni09KOLLzSXejnlAbUpJct0x66fMBYHSlSetR8SfbPb+VbYHqU1nqsR76Y/TVdhDnYp+JBWQc20jkxey3u41zcnIcKCzjGUFtzI4fOiezGdh/Rqh+4MMxZyQCuRIPDItcvFs/4uWJYsXnUGEBS5dTRB5F1iqkRP9VLWtGIJ90nw4fE+2W9zi8zKw58WVUmY6z/0d0EpH+RhERPEiUEllg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JApr0713; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JApr0713;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTjT34z6Yz2xdL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 14:40:22 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3597fea200dso5926414a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Mar 2026 20:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773027621; cv=none;
        d=google.com; s=arc-20240605;
        b=KuggvjOuoVfQrv9O+nUxF5fWI+tXOxMW1owTCLY4zOFzIkRHsT1xH/V6LP5liAgiUC
         Z61XP8wZh1Th4qPRJuRzwpfF54TXQVuQrvgXWTNb7fAcVYCywDDg7uG51Q6oEcnrzl4W
         ulgQFjKTm9RKNB5rAKOYk0r5UgugyLLxzqWCBWcN4KBGq9ZpeEuH2aBcj0eYRSePsQae
         kTBah2JkW+fDMNKjJWNUiEGsc+sjV4IJGMnnQdI0N3xmtR6OTBBbat9CDYuvxxVU4+9S
         XTfVGWGP1RE9PNLISHh2nIZEg8HYnNcFVbyHY5eufJqUZyh795PZPMNv5c9nn16NZXUo
         d/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FKiYlaBVKzKkQ0fFD3dOHjGBjZMlXmQaDGVeIVxSCw8=;
        fh=DZTLy9PGqDBvv9t0zCgBlwmn1MVCsAxRDkBduH6ZFMk=;
        b=R7VclAtn2TZ9REMhrH5nd4ZEL5iB5rrh7Sit7yHm8K3h+ODGtGD9Aj8in7P4Icofgq
         nnIimnEpGLcOvZBTNMSAqTjEEJfLe3RldvJkrEBxkjpGQxl71/G7A0kcUt7wh6RqbmCr
         sq3Vre3RdCbYcnYKGS72O0NoHpdnLbjLHryFyBz4riBITTcIFVxJ5+W4p+D3U+/qCEAA
         J3yvZgcUJrDadHkna6BiN92TcsXLbcRgR++AOeJRvsx5CN9ZUAy2zlOYqYAwmlkAVPRJ
         Xn2LDQVQu+8QnWTotPUfyhwsuN3I2f1x0mlb/xK3xkg4b+vOaFaiWVvN0jBJw2hDC6cr
         yh4A==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773027621; x=1773632421; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKiYlaBVKzKkQ0fFD3dOHjGBjZMlXmQaDGVeIVxSCw8=;
        b=JApr0713lTCKZ6L5+bWAvFBkdrZJ+JLQO0NW0rpIRCvWAJYYBmBe+dIQiDwZQyobSk
         OEubyQlauzjUw6GSjABu6618to+71jZhZZPzbdqmLTD7l6r7Fk4bWU/E2alU9yVE+qqB
         kteOsxUTdmOLJw/uva8U6WR75ImLa7uFk1h6lMH+ZBQXhIc4TKHtr4c8LfQOSD7VSGxR
         cLljESoYLt88mRHjnbJoTfPSqb5jHoxs3RJtlciLOK2y0ndc3GJ1IizOf/6FuEbkfaX1
         mN5+y6BEQffjG5Kas+MIXBcNCa8TwJGDjuOK+ejzoBcEP+Y2Ul0VI0/3CcRz+DrFsgbq
         uK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773027621; x=1773632421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FKiYlaBVKzKkQ0fFD3dOHjGBjZMlXmQaDGVeIVxSCw8=;
        b=BZq5ZKbJPqu+TTzsLN7m7FXZLqUeuUyYX+vZRvux7KOFkPcQY+gxX+B1/nDDIiwRq4
         6MZfHF4p/qlesYcFqY0/mSpqp2qyO5q7GTu1hO/C5OJzJsTnfKMlj7/MKkwRqTJl4Jkf
         V8c7DdfHfa04cyq04Dl4u9C40DOUI4AkXIAEcKXZhy8us17zFRHnd6fT7NnNbsN3TBKn
         fpa5HNeIs0dQHonIJg5mHDNdqT1K2C2UcVlUQ/jdEU5kaY3JKAdrUODiNkvZ5hD4OS4V
         Cnb+Qxy6OzWs2kxHU6Qz66aOM0YAQrAi5rlVLmiff/ZuFa0YZ4bKt8qKRiWwCJT+NgPW
         XUEg==
X-Forwarded-Encrypted: i=1; AJvYcCVquU5YeBj7j2o8g+Zh51IiZsNMWXmHyOmj021eGF/3D6xr7em5fT09pP3DGrHbnQ+7JsXt2QNkA8dl3Hs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1w2/AcJxGSUgJmQS1kw3Azsfglvqn6H+osJ2KomS2jWgKdekM
	orHSdrSEtnne25dTKFHL4EGs2SyTksJz8ph3W6DejtE03QDEL6spMv13A3S1ttsv9galVUEalF+
	cOuKTCaIdPjnVnu5lYX7fS9Dp9DBco58=
X-Gm-Gg: ATEYQzzV5ZIDoQ9tgZGHrzMnjk8Fzmz8XfQxvawFJWzpaeIy9w+xdExGm2YIaDEK8ta
	jK20gXIy42Db+zD1Gm6D2AmduNN5NGcHIsJ6D+Y2feulVcQl2/Nepatc51pGmBFyNq5/BTo5fbO
	ozBd1J4enxRH58cdoeRJTqeWdvhXxuwFZbYC/4dDgwmhljtKEf4aNfbxFb03dMyiso0tcoxQlI+
	ZyHcQEsSlwhCOfHOkCOtxIOx4YO+NERJFnBa/LrPfqhPZyC3M6Z3Cf6cf5clkZw/0VD7VYuMl4D
	CR58lJE=
X-Received: by 2002:a17:90b:3f46:b0:354:c602:a573 with SMTP id
 98e67ed59e1d1-359be31e12amr7562851a91.27.1773027620836; Sun, 08 Mar 2026
 20:40:20 -0700 (PDT)
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
References: <20260306093949.1647452-1-shengjiu.wang@nxp.com>
 <20260306093949.1647452-2-shengjiu.wang@nxp.com> <0b110f10-dcc0-4573-803c-4dcf21643c3b@sirena.org.uk>
In-Reply-To: <0b110f10-dcc0-4573-803c-4dcf21643c3b@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Mar 2026 11:40:06 +0800
X-Gm-Features: AaiRm52wW7uO2soGEpfwj9NXlS5UrI1EZUcVw7BAu75E0A6zzAyAyjbuUGgZVeU
Message-ID: <CAA+D8APr18xrX2ftRH_evVby5n1VQ1MSzqAref2bA9GnJUveeQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] ASoC: fsl_utils: Add snd_kcontrol functions for
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
X-Rspamd-Queue-Id: 37E412338DF
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
	TAGGED_FROM(0.00)[bounces-17874-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 8:04=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Fri, Mar 06, 2026 at 05:39:47PM +0800, Shengjiu Wang wrote:
> > There are some registers which are volatile, at pm runtime suspend stat=
e,
> > the regmap cache only is enabled, regmap will return -EBUSY when trying=
 to
> > access these registers.
>
> > +EXPORT_SYMBOL(fsl_asoc_get_xr_sx);
>
> Please make anything that exports ASoC or regmap functionality _GPL, the
> underlying APIs are _GPL.

Ok.  I will update to use  EXPORT_SYMBOL_GPL.
Thanks.

Best regards
Shengjiu Wang

