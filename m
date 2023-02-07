Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0DE68D549
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 12:17:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PB0vr3x37z3cGv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 22:17:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PptnMabz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=festevam@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PptnMabz;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PB0tw4h72z30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 22:16:22 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id a5so7493095pfv.10
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Feb 2023 03:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=etY0/5Cy5OAM96hnKpBnFOOWxF+pCw++PRPyw5AllxU=;
        b=PptnMabzoGyydtjb/qQdLmF1Kp9KPvsq5XIRWEj1BgRHyGW71E5i1f+YeK49ClxIQG
         dVJPErOt2EaCRuHgWo9NAAF5c6VCB+5jyPy54HDt40TQ/xPS7vex4nGg8tmfcYVjDeza
         DxifxNvWQDKgbMfLwGXMjC8fn9ky/70wBKhaSuowZxlyeMUNRcskf+WVcJS1dZ9XJ8MT
         //c7kOCo/Id/shwKaVKFEPFFKPlFMCLNcpkYjhkZ0eHKmVfsLCnRdHFeMIfntDoZJnsq
         KhRV8DakSG7psbEk7ryu7eTU+7pjhRvnhBazjSMjeL/bc2uO1ieHGPgfgiR2utqFGnBv
         R0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etY0/5Cy5OAM96hnKpBnFOOWxF+pCw++PRPyw5AllxU=;
        b=YveNWDZ3HcM474TN1nk8OgRKkS33hGYF4XNixmQ/ExcuWY8bAAiCKE0qsodLkNCqPM
         Z4jJ051+9LMpnSNwZD9GbfkdZcGFQ1z/SJbbBR7T3ub4c4yud8Dz2+sajnQoaTXGJ+eI
         WrVfBCFESWOaoiVlOD+62NUi890j4fU72GNVIRuQ88M4J2ZUjKj//O/zLbjlLHFtIN30
         pknGwLTL5PDmq4nBfwt3Ogy7Y9VZ9rdXri4cvKzTmXWAHNX4+vfQO19saUZX+dPWddg6
         8DfAUEUX9xZ++5mNsbCZH2Xj1PkjViA2IdHv62EH13w4dIb53/BEB4LxcMvpBZkFvh8+
         b3mA==
X-Gm-Message-State: AO0yUKXTQa9GXWsCXpPuESyAiHQZEuLGr0W71OUgYDKrxtawjr9tTAlP
	JeZicv6jOce6Azp/eD9DJtPMsan5+P7IWW5dDp0=
X-Google-Smtp-Source: AK7set8cE9lJ0YZsm+aEvy6PWbH+nD9yXsYoy4tI4gSz6pbRzABiojgVlboPR+QUs0q9HrZ3Z2pjlcfMBVkWiBodsBc=
X-Received: by 2002:aa7:9496:0:b0:5a7:22e3:7bb with SMTP id
 z22-20020aa79496000000b005a722e307bbmr572013pfk.24.1675768579645; Tue, 07 Feb
 2023 03:16:19 -0800 (PST)
MIME-Version: 1.0
References: <1675760664-25193-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1675760664-25193-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 7 Feb 2023 08:16:08 -0300
Message-ID: <CAOMZO5Cs_ON6wJHGo4Gskc9sNThKW4bXC_jfMwxkkLkN5syo_A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: fix getting version from VERID
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 7, 2023 at 6:30 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> The version information is at the bit31 ~ bit16 in the VERID
> register, so need to right shift 16bit to get it, otherwise
> the result of comparison "sai->verid.version >= 0x0301" is
> wrong.
>
> Fixes: 99c1e74f25d4 ("ASoC: fsl_sai: store full version instead of major/minor")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
