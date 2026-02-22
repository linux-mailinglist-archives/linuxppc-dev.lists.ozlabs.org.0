Return-Path: <linuxppc-dev+bounces-17012-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OFjOOpUm2kVyQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17012-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 20:11:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E87FB170240
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 20:11:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fJtrQ6vwMz30T8;
	Mon, 23 Feb 2026 06:11:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::122a" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771787494;
	cv=pass; b=WourWjli8nvcSxc7xh2FCysftmKCYfgj2Wym/E4qfsZ+Zm4BWjAMzBqxQipZWgxnJYJWDi91qiMVcraxG7cff7dScVhbxMTzjEHQ0WmAhE7rZZ0ty9iyHKbfftx+zFzLk0WP+PEkZVpgjUQXO/8qWlsKpJ6gZTdqgm9LB7mem6AHfEm4TqWcGOK7B7FcuUPDUrt6wiC+tFTfD3734ZXiG4+WrM+yZVlH9SKroUaHqcEzXh10IGNrgLRi2+L2V5MjdqOF4Q2fBFj7EmxjFpe/Skl1+oc4TocyvZK5OPDbq047/qhYM/roSThfDoWw5fKbNc90LCidVLpbJfJTVGWvBg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771787494; c=relaxed/relaxed;
	bh=YEfRoAIWjupjNUOZFtJHLhbd771aYMAh/CpJMSay5VU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RSyxDXV6DRdhN2KkW0egWGkGJTL1AE3nlKsiDTyT6kzKHStBRebNY2BP29NMGRFqI53Z+UxnVEwp5M/Hc2DA02DNqeWbepG3an3d+kgg+tM3UOeqVZdOMUaDaucOhg7g0LWhTrFsYyoCi83aSRmCVf+meg1ebyfTaTG4wqy7igbgT1qWJ3KKFXJRhbZhBQGXZ3oSAqlOA8qoSqq8hbujyzRsRO/fT07uJZR8eovSX/mPvcebQASY/PAzwnNxJ3wrqGEjyxsq8EqL+6YpeeBlzYm/p1hUAsuJxfYMRGxUExD9VsM7NRRsJw1Tfd47QduFp/tUlXLkTMSnL91Aax2j5w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TPgIvruP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::122a; helo=mail-dl1-x122a.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TPgIvruP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::122a; helo=mail-dl1-x122a.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x122a.google.com (mail-dl1-x122a.google.com [IPv6:2607:f8b0:4864:20::122a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fJtrP32rRz2xnj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 06:11:32 +1100 (AEDT)
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-124b07e5fe4so292977c88.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Feb 2026 11:11:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771787489; cv=none;
        d=google.com; s=arc-20240605;
        b=lOMhKb9cLQPLOqLCoqHugzMbdZSBbXfEPErRq/JoUP1OmDDQocZYRHuOD26EMFk5Jd
         McQqQK8Cndsi7Lszhn32fvn4iiuTfQiyR30MQG4Xr4nGSjIPd26gOVEUd/ktuPvf9uRK
         hplX38xrFQp/8AmLz1KzNBC01YwCVN987pThY/YE7g8ktcXwmBJIYEuK2PYBNcbtTuQx
         tL8smEv2hzmdpJTJXuIlv5MFf3VKrkZMxH3r7JYSVSX2RM3gBQ35ETCHOplcae6ee6gi
         VBMF7qUfcwmxypXIWTJW9SJLuKQ+9zxNKFKVnxYShvT7eweh4Z8CI2wdfg+EI1aLOgSc
         yc2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YEfRoAIWjupjNUOZFtJHLhbd771aYMAh/CpJMSay5VU=;
        fh=e7GL9rfM+q3+H425cAf+R0nX3MCb5Tk+3eVDOEDvT1o=;
        b=Ncd6NWw2R1kL9Ac8lj76Gv0dwCVDxyJ0resfsWTPvIKfCYDvGNbbAzqN4oalaA847P
         ROm8IYbUZZucLcI0hmhqt1aRIfbXktdPYyzZS1gqtJmsXeqVBgvEI3X5OBWQ+SEsBitY
         M/8Y//Phx9ZqozONdv60MQFd25+n8Pgu0XoPPbD96dzvSmXmkDa5jtNQjvkVyP1gmnL3
         YW0LqSxuMr7Juq8X8SPqmXXh4PL5TziCCgZE6jM8vktecE5CVIWHd58PAvU8GLvq9SRb
         HOd7TRnVtWrnKoNNdE8JqNWLRLsB99HF1wuyHK8K+qJI6Q4sughz+p5aFNz4Q1Hbj9yo
         PqQg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771787489; x=1772392289; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEfRoAIWjupjNUOZFtJHLhbd771aYMAh/CpJMSay5VU=;
        b=TPgIvruPD14U2bgM4l8vL7vS4z2QCaVmP/psYgOeoUkrhkL9iJRHxdwUj5whJSox7o
         AbF+1/NmWU24mc2SKIUCzB0rUHhMYr6sDduMWOcOARjBuWh/yHNNoUYyZ3vQ2+XWpA2a
         Yr3T21mH2QQXDnKdT880fpyxAP723gGGPApu06HgTHyfODdkk5IpuDl1JcPRt7oveTL6
         WsEdHI6ONUM2idXttOKm4erxT4KfiWlJSoD72h6msz/qEj2BLQZTfRJ0E6FQ0NNWzG39
         5O4Fqanx5qqeo8jRWmRxvkpgbYms64W0icWI08osjqPRet1GsXBarp3UFjMfzUyW8jOe
         fEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771787489; x=1772392289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YEfRoAIWjupjNUOZFtJHLhbd771aYMAh/CpJMSay5VU=;
        b=NqLLarSuLCn4u0Kwz+lAhkQT1KQGOtgwa9We/YoF439EAaExZ4Y5xSFDk/1NhYJxU+
         +PFhAH3H3IlPM/JPiUl00JIeDC1IIV908SppUBXAGrOoz3ndX6T52NW2OmSfaeBuqE4M
         e35ss2ZbgoIH7hGEEkFbu0lTACiGS4lyNCAZNHzm96lT+cz4ck9OIacQN6jC242bKK2X
         H18Nrk5mC6f3IP64hiCLwMCpMd1OFUCI5reNOkgNTSRDXxbM2OBZHmRk/q86I4tZsvbG
         IZbyUVz8dVQ9LhAgRVWoBDPb06FOuubTGyybDWnoaqa4heFyLw1f0jFbWtJ0UiAl2igq
         6HlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaDXmM3drJvj6F6W9/cNCXPeU3XhgPCR+xLoymUBWN5PmMSIi3Oo92G7aieC/X9fNVRUQRNsBijeWqm+Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyWoIxRN8sAbDyBqGYCyCR6fFdBOsdqiuOrCYp0eAoRrkDx63c8
	qb/FbMfNI9eoBcYqEQ1VXBuNQQRg9gtRMYXQb7E7wvg4sBZnn4Q0lzGMa3Qv+wvI8pZwTwfsh0d
	SPBrj3zoNxylKJQGsEGyoMg8Z3tzSY2g=
X-Gm-Gg: AZuq6aLy4QtFho39pzTwXSWFu24NljkkvRdo6/miEf8u122f9xnhtTNdMmQRRcJvcBZ
	qECh3iKPam0yMoi8Hl0X3WvESUIMnXbgfuRer5LmUNjfvzEm8iwL1YsH7WXXmiCALCZhi68YLNJ
	9lMNdYlDC51wsuVqz5zLC9kiX0Jdi/aNlkcUiSv5mNdpivQahFZzj/KynOJoFVG8tBuZHChxEFC
	aaN1y+Hl8kZMpGc2ml/ctk2G5luBxyhiKhEABMSFTyj32XXmwa0oICG0ZHrAXMYqWrx8SKIaLQQ
	hEYkX6zoIwavu+acsHdpgLDQuxfjvL+eK0fr66ywBZB1lqSwzjhgi9rS1OPMIT6P0/9t3I6MtN/
	rsivX33/hA/Ba3WiGNk828bgVi+dka69hsTk=
X-Received: by 2002:a05:693c:25c7:b0:2b7:f145:a70 with SMTP id
 5a478bee46e88-2bd7b9ed182mr1491522eec.1.1771787489452; Sun, 22 Feb 2026
 11:11:29 -0800 (PST)
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
References: <20260210090023.2587534-1-mkchauras@gmail.com> <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com> <aZtT4MH0Q8Ic9ZiM@luna>
In-Reply-To: <aZtT4MH0Q8Ic9ZiM@luna>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Feb 2026 20:11:17 +0100
X-Gm-Features: AaiRm53bLm8BaSMJ6yUOF3BzlMMZn0BBot3u7XXipnBmPLeFtS2Lh6iTAtxhJHc
Message-ID: <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Alice Ryhl <aliceryhl@google.com>, 
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17012-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:aliceryhl@google.com,m:mkchauras@gmail.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[google.com,gmail.com,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E87FB170240
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 8:07=E2=80=AFPM Link Mauve <linkmauve@linkmauve.fr>=
 wrote:
>
> Should we come back to describing the target like I did in my first
> patch[1] in scripts/generate_rust_target.rs, or should I bring that to
> Rust to create a powerpc-unknown-unknown-softfloat target upstream?  Or
> is there a better third solution I=E2=80=99m not thinking of?

We are trying to stop using the custom target specs, so we should ask
upstream to give you a built-in target you can use (or equivalently, a
flag to do what you need, but I think the idea is to not have such a
flag).

i.e. even if you used the custom target JSON, we would still need to
ask, since the goal is to remove that script entirely.

Thanks!

Cheers,
Miguel

