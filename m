Return-Path: <linuxppc-dev+bounces-8588-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF642AB72E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 19:35:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyL8Q0DRFz2yyx;
	Thu, 15 May 2025 03:35:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::541"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747244117;
	cv=none; b=XpfE0GuhyA19JKT1+vhEPA5ptk3LY/N47YF6eZcFKvzBmWSLASaXA9Il7i/jnatviT61xFvt36MZufUVTFG5PV/jFEY3+0Gh0MnT69hmZIPQi+8RAJjyGCFG3bR/oBC89wthGEk3kXKvhYdq8G0m3YF4DUYZTegFrmyyVJz8g0CDZHBbhOiKAaosrtyVdAmqhHoq4tiWQeeuwWlV8CZvHRcoqqSq2aURB02V6T+u8LnsZE72HBrPnPus/P1rWOU+7ZLJaiLxceeXzde5Q3ToU56ZC6FNeaT4hecccXovKChc7DfcZ8Oq+xnReTQt6M1PGH+R4J3Qonieqd2pZF8azQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747244117; c=relaxed/relaxed;
	bh=EFdlJ6N6MHe++MwGWkILbc9+cPIo/XiWxbVEpXS+OnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g1txdJXExWpPgpk/WeTzgcbAPvzNdUfJyLrY7Xvv5eznSTeEdbtul64Aju0ewxOQ0rW+piycY/e455k2vg59IzQUZWc066AEhyYnSxZsCD1xNe+MAHg0Oi3zmrCkFEUR1hru7s48EV+M0DOt/YbTq/rC7/L2qPnUdJrp3eUBGcvmUYAUAor1NGNzVPmsm5eV8WB2Mm3hOYIwhYIeYY3xe/K+WGDfiUQvlowoza+Xf6hy6T9np8fMQjKfRnGLrThZ3TqBbxM+5g6iSwEcJsjAw7212QfkGypghFL5T3sLbL6WRnN6e/49yM2mcftXsHKe0ml86gZtDZLUt7twwVqfQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YxaDlsHG; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YxaDlsHG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyL8N2TD2z2yrp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 03:35:15 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-5fd1f7f8b25so186292a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 10:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747244109; x=1747848909; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EFdlJ6N6MHe++MwGWkILbc9+cPIo/XiWxbVEpXS+OnQ=;
        b=YxaDlsHGeAVPCYXA/E/axNq4Q4crZJG1wJOe6bM9xcteijPDrkXg4wRiLxqtnkT/TS
         7E+wKU/+k+XP+4NO8FzslFZbTZTA21EqEHCMuQ/spSrEPCaj8b7o9NUT5WBCu4QJ1v+J
         3xUG5uUBIfchmejPyTpDKV6C8LTlq1DcWoCCbfcZMD6YH1Eh1Va9Hfx8iXnSuvThoCFv
         HbO9xd7h1MEKoR1eR/y6ngcBAW+aeC3drWoGojCzVA97EeAyuDo2Eka3Pvba8SnyTvFj
         b4LYQJlQCHRhZ9P2g05Dcv0yekkYAUbrcoQsCWnLNZjX9BkUy7pRMM1ewXoPPS88EbwL
         E7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747244109; x=1747848909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EFdlJ6N6MHe++MwGWkILbc9+cPIo/XiWxbVEpXS+OnQ=;
        b=Jex+ghkDEX0GGGEbuPbDz4oC2y/DQZZSwZ0yrtqblQEhIV95+rJTwl1FVbFAF8gkwD
         YImMI/z00L0rhYEIbyQ1ufBy2aI+3zfcYwD1GNDROWaIpfr01bhw1jfa4XwPMdluRf3X
         a8dCnw3DS/6D6JDm6NhYz9MSLjdK9eq77eHQ9X1zl+mwhNQszIJV+vJFx8yASlX20EFM
         bFMqpUV3uT9blrndvCsQDvCDS4U3jdJ0BgpJYTzxjdkxPOkznG/bDPODwq3itS6hpzbq
         0YmsyujqlzcYaknXiXMFO1hzE32DqinJMNnjlUbalMYLwDnTv/sBR4qPdFVST7jffCFo
         9rCw==
X-Forwarded-Encrypted: i=1; AJvYcCX2g5q6bY11zb2KEUVE5Il9tva0vBHExlzd4xx2uiMGMvbUOC/eH2ozM9ORJEe2wycRZNapYfFMmddtlzU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy3TbG0OjCClUfo1Y7Odg3Hd9yTTvY61oo6p73S75YyQM9jS/Mk
	0Pfncn3fwnFYlknrcIODhlCW8Ygg9ADpsB0g8Hm/1BMENdWbziHbvy1gEESPf8qU5ri6EvYDEuC
	7ofIRvBp57GWvFcG4kNt0fxPskHM=
X-Gm-Gg: ASbGncsmBI0TKkSwHiwb3QLl06U9hA+wERsTT97/25ymXfhkm4bid5AOlSovA/zTM5Z
	BQM8bsj9H/IZFgzqki10ei3u+iJjD3vE3NMGOPS2JOanqdQqnEQ/rz42Z00L1d490G9rM0rLAY7
	ktS5lbZ6EF5R0H6hFol0R/z4LanJn/QhjxS6xZFV7HKFMJNF7w
X-Google-Smtp-Source: AGHT+IE+VwudLGlVqV7MTPJNv/2IatRwQ5fmgPNY2cQCAUPG/OX3YqdyDUfjFCe1H9Ew0BhHDSRLrN8kqa+WikFcqEc=
X-Received: by 2002:a17:907:8747:b0:ad2:4787:f1f4 with SMTP id
 a640c23a62f3a-ad4f7114433mr410241466b.15.1747244109100; Wed, 14 May 2025
 10:35:09 -0700 (PDT)
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
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
 <20250501073603.1402960-12-luis.gerhorst@fau.de> <CAP01T76jeSg3W-OyfBfSbAjpEhBr_h8rbS-Hubk6gDdrkeEj_Q@mail.gmail.com>
 <87ecwr14mt.fsf@fau.de>
In-Reply-To: <87ecwr14mt.fsf@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Wed, 14 May 2025 13:34:32 -0400
X-Gm-Features: AX0GCFtOVfH8muGhMGHBFxUVlaXx-8L6TgNxC77DPS2kBNNOVj7O1t8HiDkeHPo
Message-ID: <CAP01T75xiWn56dtpS06Vm9sMRfCBv+uHNe47Fh5hqu+4xCxOiw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 11/11] bpf: Fall back to nospec for sanitization-failures
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Henriette Herzog <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
	Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen <mrpre@163.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 14 May 2025 at 13:30, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> Kumar Kartikeya Dwivedi <memxor@gmail.com> writes:
>
> (including relevant part from other message)
>
> > On Thu, 1 May 2025 at 04:00, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
> >
> >> +static bool error_recoverable_with_nospec(int err)
> >> +{
> >> +       /* Should only return true for non-fatal errors that are allowed to
> >> +        * occur during speculative verification. For these we can insert a
> >> +        * nospec and the program might still be accepted. Do not include
> >> +        * something like ENOMEM because it is likely to re-occur for the next
> >> +        * architectural path once it has been recovered-from in all speculative
> >> +        * paths.
> >> +        */
> >> +       return err == -EPERM || err == -EACCES || err == -EINVAL;
> >> +}
> >
> > Why can't we unconditionally do this? So the path with speculation
> > that encounters an error (even if EFAULT) is not explored for the
> > remaining pushed speculative states. If the error remains regardless
> > of speculation normal symbolic execution will encounter it. The
> > instructions only explored as part of speculative execution are not
> > marked as seen (see: sanitize_mark_insn_seen), so they'll be dead code
> > eliminated and the code doesn't reach the JIT, so no "unsafe gadget"
> > remains in the program where execution can be steered.
> >
> > So the simplest thing (without having to reason about these three
> > error codes, I'm sure things will get out of sync or we'll miss
> > potential candidates) is probably to just unconditionally mark
> > cur_aux(env)->nospec.
>
> [...]
>
> > Hm, now looking at this and thinking more about this, I think
> > recoverable error logic is probably ok as is.
> > Scratch my earlier suggestion about unconditional handling. I guess
> > what would be better would be
> > handling everything except fatal ones. In case of fatal ones we should
> > really quit verification and return.
> > We may make partial changes to verifier state / env and try to bail
> > out using -ENOMEM and -EFAULT.
> > So unconditional continuation would be problematic as we'd act in a
> > partial state never meant to be seen.
> >
> > The logic otherwise looks ok, so:
> >
> > Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> Thank you very much for having a look, so then I will leave it as is if
> I understand you correctly.
>
> Please let me know if "what would be better would be handling everything
> except fatal ones" was meant literally. Such a deny-list approach would
> likely be:
>
>   return err != -ENOMEM && err != -EFAULT;
>
> I initially decided to limit it to -EPERM, -EACCES, and -EINVAL as I was
> relatively confident all their cases were safe to "catch" and because it
> already had the desired effect for most real-world programs. However, if
> you find the deny-list approach easier to reason about, I can also do
> that. In that case, I will review the remaining errors (besides -EPERM,
> -EACCES, and -EINVAL) and make sure they can be caught.
>
> Also, thanks for the pointer regarding sanitize_check_bounds() (sorry
> for the delay; the message is still on my to-do list). I will address it
> in v4 if it is safe or send a separate fix if it is indeed a bug.

Yeahl, that's correct.

My only concern was if things shift around we return -EBUSY or whatever
(even though it's unlikely, but you get the idea) it will be missed
and we may break use cases we were permitting? Definitely need to be
careful either way, but I guess the surface of interaction for unpriv programs
is relatively set in stone so it won't matter too much.

It's probably better since you've audited paths returning that error
which do not leave things in a partial state. So I guess we should be
conservative and stick to the three you have right now.

