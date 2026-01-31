Return-Path: <linuxppc-dev+bounces-16476-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLsmNqtWfWn9RQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16476-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 02:11:07 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB13BFE45
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 02:11:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2vvr2CS7z30FD;
	Sat, 31 Jan 2026 12:11:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::62c" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769821551;
	cv=pass; b=LtI5QqgCheTCRf3uEUOHmpXnAhujUaFXP9aB1QoDDprC5uG+dPmF5SM8fLi8QQgqo5wNX/IG7Kt43H9QcoanWttc80YfxEfhQFmH/AfIA8cZDFkmYqVAzmv00KVm5cZgKib+rcDiEIakWfDxwpXseOGhvHNrKr4Imoh76Eo0n5QgYAXYo3+LTkdQVhDMnUr08nArb1uJZuWeYHxUlFkHM+a9R7gCmGnnBWxDfkuiwohS5gk0UV0d2GW8NV6S/b6OIRCt3hLRXcql3Ciuk7EyNrDRZq64my700kTMl+JtpKpBr3/xCWH0L2qmzYTlXxd7dfNMP5/9NU+du4OdFSVl5A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769821551; c=relaxed/relaxed;
	bh=WR8rpY2KGV4n5Wdzx9LxUGbuZ8iHOgSWcj67TDHRUAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCLDUvkqM4lABX3gbjY02QQDSYc8XVFg4fVhVB2fLpAN1Tj5EcUR9/peIxVvgOhk5xg3ZEKW+Ji063yhN0MBNJSUNtmtv/LweZNgzXMv+32BVC5SODOMIeMEtZJ0ib3MLwiTy7i8saps9QJnj1AO4jGoeblbl4wVYomyFmkaiFkWpYhW0+R3pF8jnBff4gfEo0CQwou9dLK9hDtyNWDlmm7b53xe0SWTeunlgVojXhm7F+tsIerXzJMukVr7BLnPQmdxhmLnH0Y0DbJ610QJ4dMiqvNf3pN8Tg9ll3gPHeuaV/dxTuZgZQ1YOqqR5/FdbFnHQbFHl1y3wMRD4eGsbA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VG9OO57m; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=wusamuel@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VG9OO57m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=wusamuel@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2vnp015sz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 12:05:49 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b8849dc12f6so402784566b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 17:05:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769821546; cv=none;
        d=google.com; s=arc-20240605;
        b=fwrhGbvW95XkFvwv1aDX9UkcloBDaeGvujOdUJGKDrxpXkfM4qAxu2JnnLZR7ebt1i
         +z5kHcTmcRBFpf4RnR2HZ/qEk13xfuCIZQXa50ysPiGD8lKFcPYl9DTPaBXVNRCtv7UL
         xPPdakklfo4JSi4lg6BwN+p641VBCq2HOg3btQSValpgn3CkzqyfSWGB+sUop4uwKdQ0
         dii39SKSr1XnxofZ7GRrBqR6aq1dnqOdlw4IvjhKn3t4d+fMD2zQdOA6sChmn/v70rvv
         krA/skC9pwmtTjPweNZ9+P43i58d4vM8r1qYR8wvZU7Ehhd43ZXkk4lwyEQGNyAO9bP/
         rz0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WR8rpY2KGV4n5Wdzx9LxUGbuZ8iHOgSWcj67TDHRUAg=;
        fh=WryaSqqT0OUC9s6rQPtKGG9dYHT0/BTCIeSQ01ZLFiA=;
        b=TR7cUPjo1+Agb5T00IM4ZnsDoV7nt8QEW0ovJnvx2DvJIkLGs3+wPcNMkGTeaiISim
         iZ7zJdpECvjveiMChy+KMpQNO0mLnt6iF7W6nIWAgHVEsWPG9xXG1wMejuN2Wj/m2yWc
         SFjAJ8+uHEKGIshn5p3bI8Pas8wXLqco2FN0sIeBG02Pw21ArQYHcO9KN0TsvBSFgZnQ
         u8RCx5gDpEBguV/E5d7TfjP0E4m4FSBB2aKElNx1vjJlzutmJhZT9V20COlg8706uW69
         r5yyfBcQtCpEM31nd0S8SYOkE62NHRww3CQPMSNDcZF7iAYP9gqQWBfPUpNUyNM8EsxN
         T9mg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769821546; x=1770426346; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WR8rpY2KGV4n5Wdzx9LxUGbuZ8iHOgSWcj67TDHRUAg=;
        b=VG9OO57m16+4p4q8MfAxPw9QlTFDmOJDZ9GbbQ6+cowP/QlKDkKco0zHdhskDrAEjq
         Nz8flODNWpvhVVi4Me5rqM23y6WwwW/9fUahGsTis+D+OlxY5XhMCz2dnCJp71B6GfAd
         hDLPE77p2/eOpioaOx69T6nNsF6rqhKc1ybNPP+t3O9hZ+nNZS+bA1vJxSor2rZ7IDGW
         jGjSG3UGtMnrdzV2FY7gpSOVGsPu6dcs3GkKqGz5f86VO5TuasTzq8n92UUwc08DW/ID
         OxlmgfhSDyyn8KvBbm0gCWzDaN0lBVBkMdwwGvHAq0qYqHbO5nod0K8wdEyN9rmSyhN2
         lCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769821546; x=1770426346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WR8rpY2KGV4n5Wdzx9LxUGbuZ8iHOgSWcj67TDHRUAg=;
        b=Bp/2pahh9iFbp5xecGuKGa06erurLjHbS02KRL5LA/jnHZFgYdI19s3mEdWrwVU7Zx
         XTuj+yc7AmSp8WzgL6B1usliVMN/gLusqVpFtEu4c8gKxZVtYDLyhF30KlO30IMaGZhr
         YLbRQcxHLmaUwmVksJ0vf6OxvJT6QUFylEBctCnsMOXeWnPOD5ZkkMcZ+KVPcXyqN6Gc
         96ykq1XTpyHnxKToH+oG4C83GTQpSA6MnECV35oK7fscKaiN0kthfqyCJ4eH8NwczYwn
         JBwOZ7e0GDiRMf7EMht2pL0K31986YViFOywWIoUaqidAek8E452kHyTJ3aYrx/PajPd
         TJWw==
X-Forwarded-Encrypted: i=1; AJvYcCWkVpDZJ2NhJtvtEEuOM00B3lPRNF6EBDO4QsL4CuqkfruDUeZDlcp0OUznd4RDWMs0UncRYDN3E/dLHw8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwAuiQUrYxSIznLzxEIZzpJIylFl7gUw5DorzirgCWRwf10+M1t
	3K+n1LQfuIFTHIYirzqxmx7IEzxVlOZpC2cxCuOGaoAMziy71Q/tMY5k+DWBOTVqm2dpr3xCsvb
	HSDJdAU9YS825z/ycJ6urOGX9KcqKKqaMWFKhLoVN
X-Gm-Gg: AZuq6aLEXI+VMA5uzq0O0kZ4Q6+/QB8da5IiBUGQAnd53zvwFm2FbpmfSp0GCp2l7+/
	O/q0eK8vvwiq8639CIWvVfd9IarUq/1wzlNpvM70CsKYXvE/sS3/zf7GS2l7smzdmpfSriWbBh4
	E8K7ha8McnddGlM43auNJWjyEeVHTXWuFmjMxBAfcXtGnRF9I7CNsq6gztvSrBuZj0jUmyqrtej
	+g1EBLEkUXVQUBY8rMH9OvH1O7SCGbKWIUwI/GZCDG1u4qSR78QvfCv2ng7UxaYrDpetXTr4hck
	h9o=
X-Received: by 2002:a17:907:3e0d:b0:b87:322d:a8bc with SMTP id
 a640c23a62f3a-b8dff696c0fmr254282166b.31.1769821545900; Fri, 30 Jan 2026
 17:05:45 -0800 (PST)
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
References: <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com>
 <2026012715-mantra-pope-9431@gregkh> <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV> <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
 <20260129032335.GT3183987@ZenIV> <20260129225433.GU3183987@ZenIV>
 <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
 <20260130070424.GV3183987@ZenIV> <CAG2Kctoqja9R1bBzdEAV15_yt=sBGkcub6C2nGE6VHMJh13=FQ@mail.gmail.com>
 <20260130235743.GW3183987@ZenIV>
In-Reply-To: <20260130235743.GW3183987@ZenIV>
From: Samuel Wu <wusamuel@google.com>
Date: Fri, 30 Jan 2026 17:05:34 -0800
X-Gm-Features: AZwV_Qi-TVApb-UR_yhUuzDZcqy8acCYfKVdTsorIhJOL99wmGwpM0Som40uK5A
Message-ID: <CAG2KctotL+tpHQMWWAFOQEy=3NX-7fa9YroqsjnxKmTuunJ2AQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org, 
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org, clm@meta.com, 
	android-kernel-team <android-kernel-team@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:gregkh@linuxfoundation.org,m:linux-fsdevel@vger.kernel.org,m:torvalds@linux-foundation.org,m:brauner@kernel.org,m:jack@suse.cz,m:raven@themaw.net,m:miklos@szeredi.hu,m:neil@brown.name,m:a.hindborg@kernel.org,m:linux-mm@kvack.org,m:linux-efi@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:kees@kernel.org,m:rostedt@goodmis.org,m:linux-usb@vger.kernel.org,m:paul@paul-moore.com,m:casey@schaufler-ca.com,m:linuxppc-dev@lists.ozlabs.org,m:john.johansen@canonical.com,m:selinux@vger.kernel.org,m:borntraeger@linux.ibm.com,m:bpf@vger.kernel.org,m:clm@meta.com,m:android-kernel-team@google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wusamuel@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-16476-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wusamuel@google.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.org.uk:email]
X-Rspamd-Queue-Id: EBB13BFE45
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 3:55=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:

> So we have something that does O_NDELAY opens of ep0 *and* does not retry=
 on
> EAGAIN?
>
> How lovely...  Could you slap
>         WARN_ON(ret =3D=3D -EAGAIN);
> right before that
>         if (ret < 0)
>                 return ret;

Surprisingly ret =3D=3D 0 every time, so no difference in dmesg logs with
this addition.

> in there and see which process is doing that?  Regression is a regression=
,
> odd userland or not, but I would like to see what is that userland actual=
ly
> trying to do there.
>
> *grumble*
>
> IMO at that point we have two problems - one is how to avoid a revert of =
the
> tail of tree-in-dcache series, another is how to deal with quite real
> preexisting bugs in functionfs.
>
> Another thing to try (not as a suggestion of a fix, just an attempt to fi=
gure
> out how badly would the things break): in current mainline replace that
>         ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK)
> in ffs_ep0_open() with
>         ffs_mutex_lock(&ffs->mutex, false)
> and see how badly do the things regress for userland.  Again, I'm not say=
ing
> that this is a fix - just trying to get some sense of what's the userland
> is doing.

Ergo this didn't make a difference either.

