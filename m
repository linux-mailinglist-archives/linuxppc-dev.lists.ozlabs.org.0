Return-Path: <linuxppc-dev+bounces-15922-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BBCD37ABA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 18:51:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt6bg49jSz2xnj;
	Sat, 17 Jan 2026 04:41:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768571672;
	cv=none; b=aeF/SVTxC9QZA6lVeuT+yKqpUiiLf3VqRKLRyNI0vnVsuDNCYqIePb5aVlTBKzs/iE8jqhrSjureZNC+Hs0jDX07lI6TIWaCaYyCGYwIN6SwCX7WG4gPAZU7tAdC4u6gjsnSPPMatCO342fg4NqMwMyIHuTwmmgDqSy6zwn3VQ7XwV+n/xpUYXF8Mz6R6hCvP+oQE8ma3jsWBP09OdRpzVrT/pGAbgVhy+8EQ/FldZVv6WW/JPpmDm7wzfBrAzhqk3uI5XIHz3g4MndWqciCfZJipSXICZVFxhtTN3xVqgrvs9xKguEqsEofyPHq4NXC+Qyu04IbYucm0uxNdkuxDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768571672; c=relaxed/relaxed;
	bh=2Jyc4vjPWHQ8N29GFPPd4QPUxfDxmdAZddY3K56YrUM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VEpJY5DL2WrHmQY7VIeYHySzbKFVoNePNe64p7PCt8A+QgzMoO2/vmFK2SE6svcn4hH+eYAi7/FUoBXHw46PIptBfAsmkWVhPQg0nXHI874j1fzPC6Wm8qcuoYurrtjDVNtZOgTebr0TeVEAaT5WjHcxBfyuG/nDNgygmVcIUjRAaap+oJR/hMVAtbbU/9g0CnuLXn8Q4DRLwvz4UP6DRC6B2YN/p6R2rE9cU9Y+cDZX9oa5xPYboHR7qGbX1YiAWUqnSj03LLqR/1LtjZNSHFE3QFmsbAh3DN4LXz0WAK4jkEJqhJz991UxSpBTqxjy6OdbsXsKgwTt5k7nkgydkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=C073zvxJ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=C073zvxJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt1Yg3WCbz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 00:54:30 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so1644011f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 05:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768571667; x=1769176467; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Jyc4vjPWHQ8N29GFPPd4QPUxfDxmdAZddY3K56YrUM=;
        b=C073zvxJfB+UEHfIRsxi6ra/S4Bg6G6gVO+VCmmunhwMzOe5KOvGMrCk5/scYc2//Q
         wMZUIOx1nsHkcjzQj0Gfyca59w1yzNAEIGCbA8eh+T/CutL9Rj9sY7GUK6sP9LpbTkLz
         XtxuB4Iv82zO5s3/u4yMa33Ui7v63jMuedgN0MQqU4ZtEf49ppghRdf/es6wQkDKS9eC
         3IuF6QBGdRMKSu0nZA17FQRoW0GWD3O/SfGovpthPIYetIlrjld35WUA6amiwV6QD1LI
         sGfWNWC/yclJtLXPaogviGthBMwcmN5A0pds8YTl/ZzGrfQCRMpM3ss+r3wE8aB/zm3f
         He0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768571667; x=1769176467;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Jyc4vjPWHQ8N29GFPPd4QPUxfDxmdAZddY3K56YrUM=;
        b=VidAjiXz7kdNJXoPze1VXXcAVMVNZHcjgnTiBzly6seThb0i+/ke9eDDOUNyPcJV56
         i5V8R++ITlKGvy/qkD/zh0tnpDTJY5T/zgQtsG/Eli7Zw05A2LntpVXzSwcYSpm0F2iQ
         4ljz9W4YqptINcqWAwDX1HekmXBUd+N+QtPaFp3WGq5ViJdgxLBlWgfSTIPY8CJAx306
         BAeEdLFLgq+uhZlgr80RBRZ2ZIxgPlzjn1OD87YRPGf9o5+/OHw27gHvL4DLZ7tZ/zpV
         dOZZnxecfh09nsewxV+rb1hf2ifyiM76WsbY1JCFdWJSAX1fae9ST+02FppL+G+egDY2
         weGA==
X-Forwarded-Encrypted: i=1; AJvYcCVUODKRDWmHJ6pP/MVNm9E6ChKPlob6NcaEJUZzyW3jR3K81TvphJ97fETGFX2e+b+O2Z1wEHgBO1ti0QE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyhCDLlGZI2qhoIilb78uSjIZRck/YGS/v9sDJCN3MVnY7Rkl1X
	haUwFrylhcpCX1PKjuSKv+y7c62va9wVEE8lyYpNSCIaH0l/y8Ho5MWcyF7ZQB+ufJY=
X-Gm-Gg: AY/fxX6vS388XZ/97bEI1nGTIXLQ7Av/fRpXkt6CGxFPezRN2vP5+pfJE0TbUHVIW0U
	T1ADxH1tOAfTRp1MUkh5aHxSPZoTDhq7Thl/6bXA9+8brYaA2JTMeP1QMPaewJjNJCLuo89Uvr2
	RH9S8UguCijD3FQI4RchCGm1uGguOSY7QR3DjZN5jkeUZlT5W/mc19/z/rXyumi8GNAQmdakz0e
	2tS928mbCXfxu/u8LaYobFdil6h/IUejPGZMmWLdAij1F4A1st5SmVIt3bRzfy/f1vtMCjfFh72
	hlHUortROXH/fj91Wj/1j/kxlXg5MITqweAZSQk4yS/2HkYSUytf280JalmiwhPDWceKgvEulsb
	SECBYGz52XPcdLzb+0MVHd0/+5THQIwnpMfb3RJhrVvSmVtWip4Fk1bgTMAcbLrzNMJnyP3H/MV
	qWEI+8dMx6Y0knfS3DgD3xxGqiyZl6W4ugLuUEiQA=
X-Received: by 2002:a05:6000:4387:b0:431:1ae:a3d0 with SMTP id ffacd0b85a97d-435699810a1mr3695386f8f.25.1768571667158;
        Fri, 16 Jan 2026 05:54:27 -0800 (PST)
Received: from [192.168.3.33] (97.36.160.45.gramnet.com.br. [45.160.36.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435696fbea8sm5433542f8f.0.2026.01.16.05.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:54:26 -0800 (PST)
Message-ID: <6168099632390068c8544b48f2e81bf737aa10d7.camel@suse.com>
Subject: Re: [PATCH 14/19] drivers: hwtracing: stm: console.c: Migrate to
 register_console_force helper
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Richard
 Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg	
 <johannes@sipsolutions.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson	
 <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, Steven Rostedt	
 <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Jiri Slaby <jirislaby@kernel.org>,
 Breno Leitao <leitao@debian.org>,  Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet	
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni	
 <pabeni@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook	
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"	
 <gpiccoli@igalia.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy	 <christophe.leroy@csgroup.eu>, Andreas Larsson
 <andreas@gaisler.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jacky Huang	
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Laurentiu
 Tudor	 <laurentiu.tudor@nxp.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org, 
	netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Date: Fri, 16 Jan 2026 10:54:14 -0300
In-Reply-To: <83zf6daetu.fsf@black.igk.intel.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
	 <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
	 <83zf6daetu.fsf@black.igk.intel.com>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (by Flathub.org) 
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
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [2a00:1450:4864:20:0:0:0:42b listed in]
	[list.dnswl.org]
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [45.160.36.97 listed in zen.spamhaus.org]
	* -0.0 SPF_PASS SPF: sender matches SPF record
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 2026-01-16 at 14:04 +0100, Alexander Shishkin wrote:
> Marcos Paulo de Souza <mpdesouza@suse.com> writes:
>=20
> > The register_console_force function was introduced to register
> > consoles
> > even on the presence of default consoles, replacing the CON_ENABLE
> > flag
> > that was forcing the same behavior.
> >=20
> > No functional changes.
> >=20
> > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
>=20
> Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>

Thanks Alexander!

>=20
> Should I pick this up or will you send this with the rest of the
> series?

I'll need a v2, since some things will also change in other parts of
the patchset, so I would wait for the next version.

>=20
> Cheers,
> --
> Alex

