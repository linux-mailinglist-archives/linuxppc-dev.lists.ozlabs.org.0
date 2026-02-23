Return-Path: <linuxppc-dev+bounces-17017-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id m5chMt25m2m15QMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17017-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 03:22:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C53FB171615
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 03:22:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fK4PN1WgFz3bTf;
	Mon, 23 Feb 2026 13:22:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1035" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771813336;
	cv=pass; b=TK+CoCvH99aWje39E4+kDtzAhOt0A7gcWimEOgA/5bGs1NK9mGn/DLfvMwWiZ30z6be+amGQwD5VCtxJfRehJ4YdnGyUbxz+gzrDtCRWoSbRJ/O3QeCiJ4uS2/kdwkAYzGbdtMoqDy1INFbrq8t3maPW3xAD69wk4x6K7MkY0iDJP24nL6CqqQNbSbEEnblmyzrJfDSZlueyonUuAlZ+hIgTQ+SoNUQj+aDxsx9QKlVGm+5UcvqesQ8NJRnEz7gRS8ie0iPSCaky7gV/FPlpQObWHlAc00ZMwqUen+ZND85K5ZdrWgTL5O6LrLzznQrmC6tt+5yVDnUukWdTIiNMzw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771813336; c=relaxed/relaxed;
	bh=UzCLfgI62EWxyd8OJwVppi4ZTsi4+JnjreLDSubbnys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kn1PgL96LSD2UGqGVAOfgmqBhsL0Y0SCmIyTDn6gO8gWMJ1g2YUBrvnTKjPxFhg46ynaUwAMQ5Y8YMuN7wj6M6uugZM/vb9OxASYnlkrD4WnPXDCLhpJE653KHFm54PQXHI1c5NlaIBrGXOZRIpnEktNL5D/8w/+2t/ZLAqx1OjFCnorKmFxtklEKYtqE0EGhgkMD7McDFeglssF+yRzdJ2n9KV/7K10gmtiiKNCFhsVXngoi2UIyRRMMLOX09PQC4uI2L2ZQGDvMc0LTcRtYDoQohEHyt4sd+mv1/Lb7W1xeL+UbSTM9BfV++WzzfGmTeM2D9PEiPjW98WflPWKvQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CZtrHROQ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CZtrHROQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fK4PL4X7cz2xSG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:22:13 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so2333997a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Feb 2026 18:22:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771813330; cv=none;
        d=google.com; s=arc-20240605;
        b=fu1AnL9ON+GFuA1Ex7Ym/q731F4wVNsrfq3bQQXGm3ZKJKaSiUOD8bW/FSz8XGxZVh
         /7zN9rgCVPoCMTw3eiOlyqTtPRKRfBMJatUzT44H+SykXmZSModAE7kjnFOZdC5nDMkb
         USbkq1ldhcku6GhjBqmctoO3Y4o3dXc0KP4XTAF9cwO8EMI9yoXkDwGLQQLR3NdJVaoq
         YCXt40GB+c0cKTTDTjirPuBYhCaSAD+dIm+7zn9szgNHbF41e6oT6BQK1JBNrx7UXs6t
         byoa5u/8KYNOFZhKFekUns2g6GrSKf4dP+bkGI0C/dZAnkgrEw2o63z/BVx22h5jHzHT
         fP2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UzCLfgI62EWxyd8OJwVppi4ZTsi4+JnjreLDSubbnys=;
        fh=J36WUQ9JTw0vzH9WNBWkIcVETdxS+5284OwqhNdLlAQ=;
        b=RmNHpSKNusD/PcEWfC7LhnLzj1eFGWubzAXRbgm+V030/hOtl7fWs3FBcCBAfJldKb
         lG/oOQt2Jydo6/IkVwYP3LqUmM9z3lsxFBYa5iJZqIS9E/B6ozo97HNeJEZe3x6MQ0+m
         VghBHz9QJW4HVE0EPSkRBL8LsiokUt8G0olxrMsd3wI9L/n3GJ6flrUGPjaeoheT3hyu
         adzE0VE6YJ+kdMlV8laQy3ZOKgyIvgFC9N9HrbLgxVepuqBCTJLIILltWlss0ko92HUF
         +ney9+4pxfokiebPmzY+NbQXdLOFTcN9a7BsAPvEMB1px9950iIFh+vmBHb1DXqXuHJQ
         mAgQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771813330; x=1772418130; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UzCLfgI62EWxyd8OJwVppi4ZTsi4+JnjreLDSubbnys=;
        b=CZtrHROQpTm55TFrBtj89fY+my46MFny1hmE7CwA8Di3EmLuFUolDY9J/3SGBRgFSR
         czPCvxEaoVOWuFbNdwSjfuMt6Bxv4kqY5Xqnc43g+K8J1nOpJR2vXksUASLJB8QIoVco
         p5CH2a5ufXuvy0zFoimrNGcRssN29kzyp8oBzjaC6XJaomGe4Lck4gX2+kiSpLiGQ03m
         kIbuQA3YZobWqNOX5ZanDJGrz7HDhjSBK6laHH+KS4pK0pVqsjUQbLtKg9R66JkhMZYK
         cN/SLySRLOHBocmQ5mDWCWThr3M996D7Eb7ZVNjhmh8qgIQMQ33PBW1fvgYo4lKUr8wy
         NOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771813330; x=1772418130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzCLfgI62EWxyd8OJwVppi4ZTsi4+JnjreLDSubbnys=;
        b=kHxVHDyCe5KQatrlgkl9ZyijBI41YqhoCdzwKF62Pfy63RLHBkqReMYW3jxg+MJi/R
         0/jEuabCsjYYvbW+Ld4nd9qoore3NTjzux00ly31S16UnkBAZlrStWTGk0iuaIyK4viO
         Z3lY0vDyM1mT8rlKeiZbwE0XRaze7eevBJTDFcvmagqx4O0AV5qfF6vOE6yDZ40TtRZP
         mMAz2ZgvQo34kg+3On54nT/24WB6Lha9JOoK0Pb/blPcx8S2Zw53teAnHkTUs3zjKhNZ
         HOypp5n8iPHfwxqvcbAEJn+m+spMqY4ZoVU4z+fM2B7XsVAm5NALDBD/R6gcu3j6FGz9
         gflw==
X-Forwarded-Encrypted: i=1; AJvYcCWqxOk41RAQSlEU+06bKb/SppslR5ij8maP6sxAm20O1+sYipj+3LpvwWadcdANgJZw6wvcAWTuFxiVkjk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxlo3JMmJruuml2RHa/TGRXhqQxjXN1zZZqxpxzBBGtfOhV+Wl6
	0hr4PjixNxkM+PgWNJZtv1MgiXxz1iDBV62vID/3S0wOFl4qrdRS8YoCBakG5ez2PRlxUCYYtih
	xbcBw5Fppu6Avoiequn7UdLw7trsXArk=
X-Gm-Gg: AZuq6aKCnQmZtmcDIWQHRn6WtfsMaD3Xm8PPPoVDO9607klcF7K9zlo3WWHH+3W+wEN
	iWPLhO0fjamRB0mr84UBKoMfTsDbyD7iUsfEYMDGGPhb/e6vFVwefXGfr0T2q5z+IwlkWMfIASy
	pfCNoK59VbUnssLJ/T3Vk0ZwmeNbfkjsujJZ82Ou+/9Vd9TpqEIjLeSji5xPuR3khILncnA9CeS
	sluKOHqjc0t/ftWAafU0zf0DTLwbj8PJnaQNq+o/3qBXeIvLu11CbIE+F/i0LIdXr5sHkPKD3VT
	lwpVR5w=
X-Received: by 2002:a17:90b:520f:b0:349:162d:ae0c with SMTP id
 98e67ed59e1d1-358aeab3c07mr5644111a91.4.1771813330084; Sun, 22 Feb 2026
 18:22:10 -0800 (PST)
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
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna> <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
In-Reply-To: <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Date: Mon, 23 Feb 2026 07:51:59 +0530
X-Gm-Features: AaiRm504U3Muw5evIl-2Vgyofu2jyUf7dFrzGLayd-dr3Syw-q2o8l0ArbCg8fM
Message-ID: <CALqNnYn-kZiS1zRK78ra18d9GYe4jKcTtBA+WdkVvNOs2Jj_Ow@mail.gmail.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, Alice Ryhl <aliceryhl@google.com>, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000025e61b064b74709f"
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:linkmauve@linkmauve.fr,m:aliceryhl@google.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:miguelojedasandonis@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-17017-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linkmauve.fr,google.com,kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	NEURAL_SPAM(0.00)[0.676];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C53FB171615
X-Rspamd-Action: no action

--00000000000025e61b064b74709f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Feb 2026 at 00:41, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com=
>
wrote:

> On Sun, Feb 22, 2026 at 8:07=E2=80=AFPM Link Mauve <linkmauve@linkmauve.f=
r> wrote:
> >
> > Should we come back to describing the target like I did in my first
> > patch[1] in scripts/generate_rust_target.rs, or should I bring that to
> > Rust to create a powerpc-unknown-unknown-softfloat target upstream?  Or
> > is there a better third solution I=E2=80=99m not thinking of?
>
> We are trying to stop using the custom target specs, so we should ask
> upstream to give you a built-in target you can use (or equivalently, a
> flag to do what you need, but I think the idea is to not have such a
> flag).
>
> i.e. even if you used the custom target JSON, we would still need to
> ask, since the goal is to remove that script entirely.
>
> Thanks!
>
> Cheers,
> Miguel


I think disabling altivec, fp and vsx  with compiler flag will work.

What is your opinion on this?

Regards,
Mukesh

>
>

--00000000000025e61b064b74709f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, 23 Feb 2026 at 00:41, Miguel Oj=
eda &lt;<a href=3D"mailto:miguel.ojeda.sandonis@gmail.com">miguel.ojeda.san=
donis@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:so=
lid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Sun, Feb 22, 20=
26 at 8:07=E2=80=AFPM Link Mauve &lt;<a href=3D"mailto:linkmauve@linkmauve.=
fr" target=3D"_blank">linkmauve@linkmauve.fr</a>&gt; wrote:<br>
&gt;<br>
&gt; Should we come back to describing the target like I did in my first<br=
>
&gt; patch[1] in scripts/generate_rust_target.rs, or should I bring that to=
<br>
&gt; Rust to create a powerpc-unknown-unknown-softfloat target upstream?=C2=
=A0 Or<br>
&gt; is there a better third solution I=E2=80=99m not thinking of?<br>
<br>
We are trying to stop using the custom target specs, so we should ask<br>
upstream to give you a built-in target you can use (or equivalently, a<br>
flag to do what you need, but I think the idea is to not have such a<br>
flag).<br>
<br>
i.e. even if you used the custom target JSON, we would still need to<br>
ask, since the goal is to remove that script entirely.<br>
<br>
Thanks!<br>
<br>
Cheers,<br>
Miguel</blockquote><div dir=3D"auto"><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-s=
tyle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto=
"></blockquote><div dir=3D"auto">I think disabling altivec, fp and vsx =C2=
=A0with compiler flag will work.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">What is your opinion on this?</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Regards,</div><div dir=3D"auto">Mukesh</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)=
" dir=3D"auto"><br>
</blockquote></div></div>

--00000000000025e61b064b74709f--

