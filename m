Return-Path: <linuxppc-dev+bounces-17665-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NRSI8/Xp2kRkQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17665-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 07:57:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC3F1FB552
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 07:57:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQk4W5b9bz30hq;
	Wed, 04 Mar 2026 17:57:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::102f" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772607435;
	cv=pass; b=AuR4Ecl9LgsHb0APGYNSEUO4o5AqDczqImnkrJTxnMizZjurCIGDE5J+Xa0thpGx2xmXnC9iIW1XShpUUGz6QfNldwnNkUkAM0Z8tZg7r19I+fte30yNQufqFEyU1X6OHBwsrfmOim/119rM6XqmU/hFuV52eomoWa1bdOvDEbl0amrZtquDtpPAY1kyx7zu+6660QEVMbn0NMexfc0SJNs2KSa5Pqimk9LcUk9Kz9GDO//IFT14t8UsI3wRTdg+iXM2U14KghC/7GR7bk5kIqkjKcFxv3rusE5tUyw82KpUCllGqJNo2GgqW772OxOuftLyHJxzBxSswPhQ1g7ptA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772607435; c=relaxed/relaxed;
	bh=zyusLvJCkkWzcJR88zYJ+rt6lxear+OrQKoL1DsRYO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROzB/OORt64hs1vfZrtGRygvHz6MKQnVcHoObZ4dViCdNZ1gvHkX/P1kTYkbxE+RIv31oiEi9kFYPKczzNqX1ED9KIgRDUcGEE+wg+rZdBDEnU28b41Sj1jATra8kQoviDySODVECA8WjSDkUx3FCSslBLiNO3igeRg6m5uOFijMOQo+T/xMUJE0JH+snELsll7ibls//PTFFHNvd4O2RgyyrQknrrgaLsTcz2QEQxsBw0hkQGhKDRSFzQEEo0SkCj2oqGDJf52Dq3Ug1r9q0A6rknQzjJOoFUHu+NH5G6ODkXcUtA+KuHyx85+LkiSxNIecEb25rZtfOGdIdFmypQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D6QJ2PR2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D6QJ2PR2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQk4V0SYNz2xT4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 17:57:13 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3591cc98871so2846021a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 22:57:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772607430; cv=none;
        d=google.com; s=arc-20240605;
        b=MIwoRrI1O0Vkm3cLMx3HlkZACwwlvUqRPdFwcgSB13NUCp773xrj247RfM2pAQrg15
         HUuTVWW9SEt4Cco2dCuGYNB51TJ4PgQBxDh79vLcuP8iPo1Gcpoc28OVpIBupgJ58eS0
         PIuIHP3Y7rRBBBm7aWD3n8/8g/nh2eOAemyxQpJEHVixN49ZEkkoXPLESQlr+N8gqs2q
         8aUtmQroRsWxeFSMIB3Mc+iI1h/2DQuYnRbY1w53eDn5AZ5axS9s+xD3z3WO4UcwZ9u3
         lXyX217xcDEjW9bFTfHxp2HWFXDnLR/238eEelPLq9MXTh8YnUbFG1vClz4fHKdtHXYg
         7ELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zyusLvJCkkWzcJR88zYJ+rt6lxear+OrQKoL1DsRYO4=;
        fh=+665MZ71LyWABKPaIfcoVZamlM0PtEpJ6YTVqr0FFmc=;
        b=JESnNJ032JaVza3AiAA4DnsR/jVTeqpBLdSTH7znUD0sNHTbz1TGmXKclkf90CZ61Q
         7AtqNGeg7TK/n/kmLVD9ZH3eYtKkuG2riHhf33pImPrcswBoUuigFJM48rMze+UzEnlC
         DGwTmrwIAJlnyGxev+ICyiM8pVwVCZiLHTn80SA+uH+9PcI9abE9hb8oH6Uud6fnHeMi
         2zVFdHOsPvVVlDmU0hRDffBSPKATnUvZlg5CBvTzZ4y5b64mOoDCe7pugPhMLgwow2Hi
         iN8donOd6oj4FVZuAEOc72flBqnsd8U7ATAFeV9zoBr9q1xRyANy/si0BSgcsI6HxIKe
         L3xQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772607430; x=1773212230; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyusLvJCkkWzcJR88zYJ+rt6lxear+OrQKoL1DsRYO4=;
        b=D6QJ2PR2fXSVFf7pB3G20zyQER5GGyAdt4p1VqEIdDFU/Pob1zNgjUlWcEVXS8mnBu
         tJi4SpJotB9+EgDyMWSZAvlcKmg+lQeSF4KBZwCaF2Ku1SDiV9NyORmugeKbgbeiK4WY
         HqtOPQPz1DbUfBscvQ43wKAdNEuaH5SJM787ABCxVegUOKcg/bNoC6Vweins21ay+n9V
         WS6p26xhdG2tceMeMPLF0J/9fVU1TQ6T0DYmq8++ANLpLc9vTGgd9PIpqLJNySsnklo/
         9xhaW9evGtZ3ExzrHEoBcw6yJ8nAFVsPoPSwq6dqzhtcpla5fA2J6PdEJH6ZaoiDPubw
         BKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772607430; x=1773212230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zyusLvJCkkWzcJR88zYJ+rt6lxear+OrQKoL1DsRYO4=;
        b=waFRIecHlpNOBkYietu+OQBx9DYJU53rafkFvtbwLxVtO/Ng5wEEdgQaAVNU+jtP4l
         h0bXV03HY7XlSIWvkBQsDt+eFd+A4QXBKgLRBrBz/7zKyj9nZvbolgfxBHlAjBAv6slm
         A471wyYCqhjYI5ficXSfwWbmAYnQiNw70xZZmFK/3pN7lj/QzamTFh2wnhENhtrb8pYJ
         JeOuciIsK+MCkrVgBSL40CJZRyCMNSQMnDHabaMpMAAqFkeEUHpAQb1GfDEUarVKH+GO
         5IaS1BgtF/kTmgW5cwlyhXCOAwZVf/9UkzjMOFeFqdpNjRfXR2qAeyRkEqutKyKLQ/zj
         XlkA==
X-Forwarded-Encrypted: i=1; AJvYcCUMMNtlBQMU9O6WPuMUUomIXZEgjSdbOs/pnkOCz+c89ygT/uWPvKi9NC6bOFYmfToenP20/BpKvdehO+A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzomeOILpsszewIiihv5OCGDrejRsk7jdWg4A4CTLD6wVd9ZRmg
	aEOELJ/pzhD4QXbQUJOMUqJ03Q8VUUWBCMD8OrpbQTfbB6Sw62ejV1TuARuFtxD0G024lRzmgR7
	hRGWP7EqH1kHnXyvaBcP0vYhPxRNN4Sg=
X-Gm-Gg: ATEYQzyXKYyoJv3z23dwctJ9D8IeQgS6v7Vm3REd58S/a5qtVYyIa8wBNxEwOxnamj3
	XzbASfTacGrYZLu6FJugud2e0bMFvw51SG7zK8AVgyJHSphvWGhcOB2SSHcOCToLlNfUpYND3Rz
	cnY0fIDUaNMAo8jDBG7Ndkm4EjeyxeOvPCYfTeee2y0zWDFFPbJpae3Zn9r4Tzlo/VoZBKiu2q9
	LDZ7xH2Pktaa8d0zdoiIF5XzObzAmIxD4za1ba5cJAfQcP/bN/5eR8BKk6RCqM7JY1jp1LT5XzN
	zqCLJqW2n6cGr25Anw==
X-Received: by 2002:a17:90b:1d51:b0:359:8d2e:6f79 with SMTP id
 98e67ed59e1d1-359a69e4ceamr1142608a91.14.1772607430572; Tue, 03 Mar 2026
 22:57:10 -0800 (PST)
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
References: <20260212072229.3247604-1-shengjiu.wang@nxp.com>
 <20260212072229.3247604-2-shengjiu.wang@nxp.com> <d823ad90-c62e-4960-b012-5e7ba1f1b0d2@sirena.org.uk>
In-Reply-To: <d823ad90-c62e-4960-b012-5e7ba1f1b0d2@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 4 Mar 2026 14:56:50 +0800
X-Gm-Features: AaiRm53fl0cJUERzYVac_QaueGqI1pQblBfTQEc26hH-1qPCv-Mn0sM8TTWiYJI
Message-ID: <CAA+D8ANdF0vodObzWA678cTex+y=7zerkQV9AY23KQnzwji-=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: fsl_sai: add bitcount and timestamp controls
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
X-Rspamd-Queue-Id: 8DC3F1FB552
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17665-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:shengjiu.wang@nxp.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,msgid.link:url]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 8:25=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Feb 12, 2026 at 03:22:28PM +0800, Shengjiu Wang wrote:
> > The transmitter and receiver implement separate timestamp counters and
> > bit counters. The bit counter increments at the end of each bit in a
> > frame whenever the transmitter or receiver is enabled. The bit counter
> > can be reset by software. The timestamp counter increments on the bus
> > interface clock whenever it is enabled. The current value of the
> > timestamp counter is latched whenever the bit counter increments.
> > Reading the bit counter register will cause the latched timestamp
> > value to be saved in the bit counter timestamp register. The timestamp
> > counter can be reset by software, this also resets the latched timestam=
p
> > value and the bit counter timestamp register.
>
> It seems this makes mixer-test deeply unhappy, spamming lots of:
>
> [   56.466460] fsl-sai 30c10000.sai: ASoC error (-16): at soc_component_r=
ead_no_lock() on 30c10000.sai for register: [0x000000fc]
> [   56.466469] fsl-sai 30c10000.sai: ASoC error (-16): at snd_soc_compone=
nt_update_bits() on 30c10000.sai for register: [0x000000fc]
>

Thanks for pointing it out.

The registers are volatile, at pm suspend state, the cache_only is enabled.
Then regmap will return -EBUSY error when amixer tries to access these
registers.

Looks like for this case, I can't not use the common functions
snd_soc_put_xr_sx(),
snd_soc_get_enum_double(), soc_get_volsw().

I need to define my own functions to check the pm runtime status, to
avoid accessing
these registers when at pm suspend state.

best regards
Shengjiu Wang

> into dmesg on the Toradax Verdin:
>
>   https://lava.sirena.org.uk/scheduler/job/2518775#L2238
>
> I don't have results for i.MX8MP-EVK since I didn't test it with the
> fixes from:
>
>   https://patch.msgid.link/20260205-asoc-fsl-easrc-fix-events-v1-2-39d4c7=
66918b@kernel.org
>
> applied so the test ran out of time due to the time taken to log those
> issues but I'm guessing this new issue should be reproducible there too.

