Return-Path: <linuxppc-dev+bounces-16817-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJJ0J2QBjWnAwwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16817-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 23:23:32 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E2612819D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 23:23:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBCcx0ngpz2xnZ;
	Thu, 12 Feb 2026 09:23:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1329" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770848608;
	cv=pass; b=oR0nUBO3JAQKEVXU+byw2ne3x+nJBxCzMphSXdCgoe50UxJhhcSfG671fVXajGBHAps7KrD48ZQoal/4UI3cJSSWI+7vQi8Yxpcn/UdCnAqfaoiMhImskncjp61hTH3315bxBtJe6PiJqpgAI4K3odyoCFG2ENea+ukLv/z92+ezouwsX9ZR5d029pZe7pioeeKhVFyKQVgBEUJZmxtEiNv79+WHjB8XY7ZuM/vQXVIFuH5c8sbxw9Z8nk5LSyyF2VLnphGzCy4hqQgyLM/gK6CGoo8PoJRKzAuOv7NCc3YYAeolNzDOo7ZHn4B39ChXir3adBHyy0B94GjVGvtLcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770848608; c=relaxed/relaxed;
	bh=RfH/ZJAACI/swH2C3a/IoB6OapnQajyNzXEzxpMU19Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B9xiz0asHpUTRZTQ1OPtKuVh6GTy3I9eHA99idETBcyn8NKKoj4IiU2ADd6nYaMTXUbpRhsVFR5IVQropfPLxxYIr8uISY3Gv5j2XzZKdUVwVcIlcX6ot1TdpPOcDEyxP7XoxqxCzfUysqFWxIto+l8+xQDW0DVKBtKQOGuF64NaMpqNZH5QM1036uvElqwJ4QFmEoR8g6f8LfEny8tbgqblFxp0Nz/rSVEl3wDeB1HADC2V4/9YO9mvIRGmIAStq2+7stRcniWpfPA7E5fBQajmbaYiq9yWBDAbbxTcC3Nm7QR1QFYpBcjP/fgQh6A6bl6/mDa2LPL7qzZ5BTAo1Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AEl5dRMU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1329; helo=mail-dy1-x1329.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AEl5dRMU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1329; helo=mail-dy1-x1329.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x1329.google.com (mail-dy1-x1329.google.com [IPv6:2607:f8b0:4864:20::1329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBCcv4rX1z2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Feb 2026 09:23:26 +1100 (AEDT)
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2ba76d64d14so154774eec.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 14:23:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770848603; cv=none;
        d=google.com; s=arc-20240605;
        b=ZWmcEt8LSNN0c436JibiZejbZROuAVmQ+ZyazNZVTzsG/jyGRtCr6qVbeM2LG0NbeG
         hn7telx7fqBpAsJJCQweEvnxB0zTlRf8c689mkbxmWGzEmFZ2eO00cDGA287gvGG6Pf6
         iQd9Ju+Fu5bc7qdnYXJhRk0HGwiYWp53tWxBeeI5u9MVoR3z9vb6cPnxtsqhQQxhRko6
         6OtZ/9IkaCkwnzl3nyw+ClhdCsByOPCR3LGGL0vvTA0ZlV4w8Yik9hVcWdJMZA2jumlo
         /U/O02/5lOOn7+hLhJiR329p3BmvJcRaX9Rv26/PeF5+4E7BgSrVwXSuUtjiezVrEzXz
         ZXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RfH/ZJAACI/swH2C3a/IoB6OapnQajyNzXEzxpMU19Q=;
        fh=kl4/Tb+MYLeTthImi+hzxxDHOkGvJuTmW8YqamMcnyk=;
        b=GV1EznakRcdi9UikXOfdL/hJeuL2dt+DcyqntAD3rMa1Q8DP9bueiBQzyw2ICHbjOM
         iY1/52BqsPGjABiFCCXWLtIr8sfTUf+VOqmT9qx6KzZFI1ojSeXB4A0wl/fc9J1KG1nQ
         BPwYOBF1lL1ID/LCdpqF4lr7WoOECESZJ2pe35mSJuBcen5ZGYl69pS+cjxVo/vaqJp8
         HiV78jaY0VnFOThIb5hk4oX0iYDSxi1jP0RHKqPRgFW6Ak5Bc6vcmHpbkBb0tYilqscL
         y80rRu8Ks3v3EzkhW/y1c36y13bt8eG4BDCzuObxGBOEJoaPUkLRCpEh7ZOzzvOnLSGK
         4Z1g==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770848603; x=1771453403; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfH/ZJAACI/swH2C3a/IoB6OapnQajyNzXEzxpMU19Q=;
        b=AEl5dRMUV0AaRXjRnQaM/+15qEl8eheR3L/QLZsrGu9IOt4PPvxHKt9EueIAlu94j1
         +B86H4Ncdq8vE/6NZ8b5PxSTju8/Ja/IyrCIXDPpWi9YpKKFE+1FDL50CwC33WW9Witp
         /SWjJA0phn/JZqC+mRlPafHnzGSp1zM4z+NYZmyoIYA/AjZbaZwzmli1b4gD/LY3PnGQ
         DHhu5mr0qkSqvFIk0IhVRzBh2CwDoAt9Wr3YFXORKx8jFDoLtcD7nuKaTL/YFXUrLBEX
         8TbWTPTKe3wRzNgb0Fzfds8Uf46A3IBg/rm/vFb0JURpBN4bqwGoqmj9TD5iXRirxvJH
         fSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770848603; x=1771453403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RfH/ZJAACI/swH2C3a/IoB6OapnQajyNzXEzxpMU19Q=;
        b=terzU0lBv/ySHgYklA6vCK7tKj+2weg9Kz+L1nOEIi38oSn43BO+7yAYf458oBOuBG
         BguQqukoiYZkEoDU663u42XYIdIK95DZWYxbk8ox/ZJ8h2ftjoSG7gic7hRyTLiPn9Nz
         g688rJquGrDXnahLjOL8o3OC4cGgTwAmSsHPYefK/oT5iK4Asfq6mNkKailxc0V5rKrz
         9Sis3bMg1rkNdSi+I8EKxoEebYR2tH4EPSjtAaaPMko2j6/UXsZ1EuSLfiZbYVczteWo
         TBlBNdxHPRMyssVtSXZLY0fN3yvjM2Qt2tq2YjiDSYA9LGudcFRgYJbK0CVvUITkMbk5
         yfnA==
X-Forwarded-Encrypted: i=1; AJvYcCU9pSlaGtGxy6E0jtL9FtS0ZGBP81BADNR3FdCjL/HiK0Rjjdjj+sP3eJOk0JgIZYwR55p/LTpxc6MJlYE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwAnubzYLmerUeL9quubQ53o3PeMtEDpR8cYOskcFkrqZxWPckz
	GGyU2N25n8SgzU2/ZECSQZpPED/h0GvW28SjZAV/bKgUhe2Zs8ebAcVoZzWIbz7bgqnXnwcYTQx
	WIyQmBFq8/k10MiAiFxfQZSVkufRAB+8=
X-Gm-Gg: AZuq6aIdoq2aej74P9kMgr4sAMrW5nGubYtZJ2uegFZw/oF0htaIjptQA1SOBidXFda
	Ej5NieAQGqf86MxMHvjUuOJq4gkgf2V7VrSMYEPGAQRxciYQJhcjLAOakNxuQC3rA6pnApGLHza
	oWU078/R0TYzlwsGD8U0p2g2zeP2J9I75O0uQWo8L40wRCco9JVq1KvZzfESJSb3JX4G9PDAUT7
	WRDVNnR95VFUBD0xY0KmbiBAs1QfVXku7VUEGLmYGxZjsmYP+GQA2ZAz7edaeESEHnpUsRqNBQS
	qvmsy7YSt5etUO7VK+hhPCHpBr1s714gv2K3VvEiFRJ3HgTw5PiC04NJMSz0fb2w1QWnDl808LA
	PL8RET2u3vQufBPtggDguiQmX
X-Received: by 2002:a05:7300:cb0f:b0:2ba:7d5a:a816 with SMTP id
 5a478bee46e88-2baa8079874mr215051eec.4.1770848603104; Wed, 11 Feb 2026
 14:23:23 -0800 (PST)
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
References: <20260204210125.613350-1-mkchauras@gmail.com> <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna> <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>
 <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mi-V_SF+JErMJu1wZEd27HPHqhsxE8dELtd5e3ZEaA4w@mail.gmail.com> <20260205200222.GA1298159@ax162>
In-Reply-To: <20260205200222.GA1298159@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Feb 2026 23:23:08 +0100
X-Gm-Features: AZwV_QiUruFZTWSfo62Op58oUYH2ayIoiaQzk5z1Tco-BdUXIDPQzuMLaoXlnas
Message-ID: <CANiq72=-8urJufUuZLnRtm6qKCUhsSd=kPF=_a3ga=nk-iMV5A@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Jubilee Young <workingjubilee@gmail.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	clang-built-linux <llvm@lists.linux.dev>
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
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:mkchauras@gmail.com,m:workingjubilee@gmail.com,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:venkat88@linux.ibm.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-16817-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,google.com,linux.ibm.com,linkmauve.fr,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 64E2612819D
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 9:02=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Thanks for the CC, I had not seen that issue. LLVM 22 is currently in
> the -rc phase and I see that the fix has been merged into the
> release/22.x branch as of yesterday so it should be in LLVM 21.1.0-rc3
> when it get released on February 10. LLVM 21.1.8 was the last release of
> the 21.x series (hard to keep up with all the numbers...) and it sounds
> like this is only a regression from the LLVM 22 development cycle.

Fixed as well for Rust 1.95.0 (expected 2026-04-16) when using the
LLVM they provide.

  https://github.com/rust-lang/rust/pull/152428

Cheers,
Miguel

