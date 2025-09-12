Return-Path: <linuxppc-dev+bounces-12079-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3630CB54E52
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 14:46:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNZ1q0Vttz3dBw;
	Fri, 12 Sep 2025 22:46:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::236"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757681214;
	cv=none; b=YFRG8zQfPE1klfVrcDZ4D4qHicTjcFAL4t50uIaSdLvgh73uomcBTeKfjKtTEn6cbwYTO5BDB3eIsHkRr5qPNWX+nxlhW+LtKzpE1AweGKGqS+95k7s1Bksg9fJoc8TKQ5NoBKoEux0e3GAjGazhdBOKdTzDc5dwrJWpM3EadKWbniuk0UycUDrCRPb8gt3spBLA35QjhmERm0tXUf9syRxp5SR+BBSVLUXkRziU5I7TAJBPkkicgAysAUStsLXrRprRdiSGmxO215uH7WbOyDn4K3QVK6Fl+eGpRYD6MAGeePMgQ/Hlr3T3fM95oYj5e7yUXNwcS1F5SONicIkSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757681214; c=relaxed/relaxed;
	bh=4J5UZwv7Uo2rH+o6sSlfGyt4PnQotdtpRnvjkNoAGSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GM88JmY4gpZZlUaoZSouRg6LB0VsLsAZuYIjjlVoN2ml4nmylFh7PveeQfw/ODyJELVXMcxFpCxVJ2/CGAJ1AC7QsnpNocUFOOEaEK/x3aHxTzMPuRH6H+aRe1L/qwBaq5yHSixPmPlB7/mUhsQ3Qe11LLi5m4paWFM4x0OFXDB2ONmwSgtDBNSNbeVWQMO/Rj5p3CKCwbOkpguddCesDGBMbFla79E2gOUgs5FEF3MkQ1r4LI9d6/B9IVOLLNKBYhy8VNDLYpZ6FE4u4Fr+B6s6k05aTDV/ufw3FQdknMQs7KnJwbr9LhxViZukTDENse8ULGX2cGm3VqgZAgyyjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uKWSSxDb; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uKWSSxDb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNZ1m6VjFz3dBs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 22:46:51 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-336b071e806so17101251fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 05:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757681205; x=1758286005; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4J5UZwv7Uo2rH+o6sSlfGyt4PnQotdtpRnvjkNoAGSQ=;
        b=uKWSSxDblrUIy9EibfXEqYdfLKkKc3S6B8q79q9eUJLkgOc/llvQbZkiUN9Piq08LS
         qGf/wu+ZIDvfg8rH4Fz1wcYislPY42IrqIhwIXTzBxf/lxQ6tgD/PsID41jYRB2DHRYF
         pYo85zekwzavx0v2GjKRYY7Uixf/iSaUnfafH3kwq4Sgbc2aLfe46hT8VirdU+9/+Hku
         zLi/Fn91PNf/6CalfC2UnTqOU88PsrL0wEJvn9wHBSa2EbjOk15pzynt+7AdOP+lCKQJ
         ZQLUWhyz8pVYpORcJF+F7IN52kIuVDGLYdY5KAIkx0JIWBEEFlIANtdt096xFU2AqZ+g
         NMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757681205; x=1758286005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4J5UZwv7Uo2rH+o6sSlfGyt4PnQotdtpRnvjkNoAGSQ=;
        b=i6M36jOK9JdSQqT3EEITFOTJlHnNOTmDnj9EF2TyZHEgDYS7Zk7TrXhinxlwR/1eq9
         810AT/zxudl/SLS4YBZae17L1jGg6JR8/gjpaCtkjRZNVACONDPjWIGzAB/PH0QX3O3k
         en5rtm6HpQtK/4vErpeJbwFAUt0c5Lx0h3dDVtG7VoqFpVv9oV1Oa8DfSLm+/rfHsj55
         jiNrtK8a4OtIyixN+HGJQAG/eSCiqXNr5E4EZbYf7LB0cK66zQA1xO5O9UgI0lR79nG/
         jJvhyebySppFU9UqjNmAo/heYo0JuwjI/WLAhro+0nCl46UfZTFvcauzAxhXeckNTilq
         WSSA==
X-Forwarded-Encrypted: i=1; AJvYcCUC3Nm2Vi4fKvCEJBGMT89faICZhMF1m+fdXCBcuJR91ybM5Jl38Fzei3knHwyi+1p8AnA/MZ3QIuzinqM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy3f9DhnsW/DG+65msuzrQVOu587VgPEfo2sA4YCoBwYC04ohG3
	eDYpkzDWoWTngi/6w7agX2EWqX+AHw2PorXYWT4kWiFDGuqR2039X2EPq2eaYtDkijmJfLeHsZl
	ynzjdaEptjUKBpyqocf5SG4zvBvIgJ//IZeM+XkvBLw==
X-Gm-Gg: ASbGnct3ph1Wxk+kcLf3wBsv7Vhy5l/tW+o+IHG4dzSvaNfHn2txYGV/ytDk0jLcgR+
	g2/ozG21XkjuPqFLXjtbEC5stcdkQZBtyWqfgqMvYgbIj8HKD5CN3KSBYWiE9y9UqfDq+2Qn5+r
	QHES5fDkbpTUAYMfcdnDIn02EoorWiMgqI+dQHLLaJreYTR9YOykT4H9WR+b6+ojGun9H7I1eta
	MIVTek=
X-Google-Smtp-Source: AGHT+IFceSrS+iukkr/XkXsYJuXAC3/mzUt2kTyPUu5TFhzIuaRO7o+4f66lybawSyOyyY1O0N/R5wKHhfBQZAMqWCU=
X-Received: by 2002:a05:651c:23c5:20b0:339:1b54:b367 with SMTP id
 38308e7fff4ca-3513b296a39mr5927901fa.18.1757681205355; Fri, 12 Sep 2025
 05:46:45 -0700 (PDT)
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
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <497308537.21756.1757513073548.JavaMail.zimbra@nod.at> <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net>
 <640041197.22387.1757536385810.JavaMail.zimbra@nod.at> <4fcd272f-81e3-4729-922b-588ad144e39b@app.fastmail.com>
In-Reply-To: <4fcd272f-81e3-4729-922b-588ad144e39b@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 14:46:31 +0200
X-Gm-Features: Ac12FXysdXrp8ARxlqs--JPKzGSESzQlXQvRlkFB3ZYER3az5tDF4P1ySurKojc
Message-ID: <CACRpkdY9VS1H642wSUsLvwi91YOwXGkiePdq+JktDSeiWTon8w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Weinberger <richard@nod.at>, Dave Hansen <dave@sr71.net>, ksummit <ksummit@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mips <linux-mips@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, imx <imx@lists.linux.dev>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Lucas Stach <l.stach@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 12, 2025 at 12:31=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Wed, Sep 10, 2025, at 22:33, Richard Weinberger wrote:
> > ----- Urspr=C3=BCngliche Mail -----
> >> Von: "Dave Hansen" <dave@sr71.net>
> >>> Even with a new memory split, which could utilize most of the
> >>> available memory, I expect there to be issues with various
> >>> applications and FPGA device drivers.
>
> I also remember driver problems on older Marvell NAS systems, which
> we never fully figured out, my best guess in retrospect is that these
> had devices with DMA address restrictions, and if lowmem is small
> enough it would always work, but any lowmem allocation above the
> hardware DMA address limit would cause data corruption.

This kind of mess is often also driver problems, in the Kirkwood MMC
driver there is some dated code traversing sglists iteratively
instead of using sg_miter() on !DMA which I think is not entirely
safe either.

I wanted to fix that driver but the hardware is in my NAS and
all the time someone is watching a movie from it :D

Yours,
Linus Walleij

