Return-Path: <linuxppc-dev+bounces-17842-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LGpEuwMq2nCZgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17842-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 18:20:44 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC14225E92
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 18:20:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSCpv2GZ7z3bfV;
	Sat, 07 Mar 2026 04:20:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772817639;
	cv=none; b=HWXykkOb3SpzMlLs7xzIEpEvq2CWK/NgvzhsB6bO7ig0qElJCihK8cYOw+Y0qFaD3EU+ilWgUIGVRgm2VfpFmn/zA4c8eHDnzsm3pTDJJCYQLUlrsiPzsJMPc6fhDBpgCqUrLGzrhvf1oq0oMhp7HU08JPu1riYBEMWI45odqbz4aWNcsZVrGIbppaoEiMwBDKT7f8zZITBKRz7QmIAyDPHTzh8townFTUZNq007XF0rFAtgWWE6EBCmdMylDspg+OrEeKnNG/LJc9fAsYD8ISp9RItQDPd2GFi3NiClS0rwtqawbhB0E1DCaUkW/e4O/667t8bpdcpdCogucIP5oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772817639; c=relaxed/relaxed;
	bh=GhclToYLpG+7UMFBLf2ZmC1LGWDj2lllBQ5Rm1+HHeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwa1o5Esc7MChAHwkNF/IE5HfNnQ1j5jUn9IBgcEgXLtgvKDcMqd99h+WTx2wLLXe074bgNI2AYXOxsDWz5a5JneioMre45DR4VONFcSq5IDktfVtQe7I7Pp3epcx0FSmcdNcdfd834NNAF2hdaLaxcKgmROx8rPb051lCL/3rSLf7ZCKkW5awBTUzRNWYo37CW6liV2lizGnwHXakvae6zIuV/mW6TkWz2mZHMbenEzXaW9sSMYk/M2DgZCzg7u6BflU9X2GTcxWfz1PXYKXi9wpK8DS+RuHrCuQr2LeB16t0fDh+xJ3DslHdhUtO51eUnqTvDMHOTjGG2TMT3FWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X0QuKWwI; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X0QuKWwI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSCpt1KVdz2xT4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 04:20:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CC89436E9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2026 17:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 410C3C2BCB1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2026 17:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772817635;
	bh=GhclToYLpG+7UMFBLf2ZmC1LGWDj2lllBQ5Rm1+HHeQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X0QuKWwIKsmDcGnlrpUm6yB2pihXgA6QnYd8IUEibiHrSNuEYsufpgaFky3ft/E3x
	 +k8gLScehB45uN8ll2nCrg5MFVG5cOFzng7aczmmuJ5UPzAPDrkBxJMFeNJSdAx519
	 4glCNghhsAObrjBqFZypUFPzqllh7KiwB+xoPuJkuzsdgnjT1nsaoASrVs8OgX7q1U
	 n9Uro5kGEi84Fod/pkVvc1TpFDLWICaWPjxCVGLbe85A1jY0tzAQCdn8i50MQZeObX
	 apByZC9DaB8qvVYwrGuaci2xaYMI0+UVEcIcRptuZD0LUK7vw+EgyePqCRkDzbPKQA
	 BCoheQn++AkqA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38a4234f91dso5501361fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 09:20:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVG37WKekKz2t6jI0Hor5bu8CZ0/BbFEAgz8WhKj9bQU2mNL18X+moySlVrV+3n/dIWF1E5L7FqdmAcBtw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzAe3vQakhtIhbqcRtXpB2Z3OkJCsKTSZcETKXQ/2VJQSMKnUhP
	cY8foIVx1mK16JdfTSlTEOeTkAK86gw6uQkr5e8SgL/tWAFvaTUw7ROK5eA2exi1q8RsDr3rrH+
	emhiz2DbMarYlgJ9AL8SIXmdiIZ2Z5lSb42Q2JBduHg==
X-Received: by 2002:a2e:8a96:0:b0:386:8f97:d0b8 with SMTP id
 38308e7fff4ca-38a40d909b6mr9281811fa.20.1772817633825; Fri, 06 Mar 2026
 09:20:33 -0800 (PST)
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
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaFcs1miP88QWmtH@hovoldconsulting.com> <aaFfEsfh0xTh0b1y@shikoro>
 <aaFsZbiLYSz_YEjw@hovoldconsulting.com> <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
 <aaHI_VavZugXjVoL@hovoldconsulting.com> <CAMRc=MdKF29McBJ9U=qELkzf9GYV1CQpRF7U6OweDNtVzMXo7A@mail.gmail.com>
 <aacE-27iaYneKCJi@hovoldconsulting.com> <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
 <aagSewpM88KAZDcJ@shikoro> <aar3rj7Db6NmTVS_@hovoldconsulting.com>
In-Reply-To: <aar3rj7Db6NmTVS_@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 6 Mar 2026 18:20:21 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf5Ydt1JmaC63B-3wGXdLdYvE4jHhzD36t=PUTzuWfw2g@mail.gmail.com>
X-Gm-Features: AaiRm53pekvMkksI4fYGSCWmOvo94JFARCgE7Q2uLvo1sVDayAaQxKa6carQHj8
Message-ID: <CAMRc=Mf5Ydt1JmaC63B-3wGXdLdYvE4jHhzD36t=PUTzuWfw2g@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Johan Hovold <johan@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-actions@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 7EC14225E92
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17842-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:wsa+renesas@sang-engineering.com,m:bartosz.golaszewski@oss.qualcomm.com,m:andi.shyti@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:kblaiech@nvidia.com,m:asmaa@nvidia.com,m:jdelvare@suse.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:afaerber@suse.de,m:mani@kernel.org,m:mchehab@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-actions@lists.infradead.org,m:linux-media@vger.kernel.org,m:wsa@sang-engineering.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 4:50=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
>
> Bartosz seems to agree that my suggestion to decouple the driver data
> from the i2c_adapter would be better, and I'm willing to do the job.
>

Fair enough, I'll leave this for a couple of months then.

Bartosz

