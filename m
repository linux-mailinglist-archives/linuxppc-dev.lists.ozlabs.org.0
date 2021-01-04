Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 137DA2E9F2B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 22:00:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8p1m3y8DzDqPT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 08:00:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=smDa0LCh; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8nyD0JlZzDqRM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 07:57:39 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id f26so24795712qka.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jan 2021 12:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JKcn5FmVjtdLgYOASDjA00unBiKKTt/1fSkBmrjqn/k=;
 b=smDa0LCh0CtK3FPXBCvVYU5au0IgoTV9ZqbIsKji2U3SNxrn/aj0vutIcewQymx3Mb
 W9v07PzwjXozdxnqRC/vzLotXbn7UpdWsAlqyVWaOsad7bTyrpZF6EaqaPtH13HQ/edC
 zA3oqeTdKchms0BLPbxq3o16nenTLV1mtSUsTBMFfl/MCNyFz+UU5aIt2h4SFQfg0ngU
 LULvahbuuDaEQcgSbcKa2nVE8iksNlze9whsRw0u8g5Wr1SVh4Uel31twcrB0Eeyis4r
 x93YTs/JwUzelq1tFE1g/cGEkMJhaZU/K0p/J9qAbw6nVnznpJDLUk6n1SPnh6aYX9Rd
 t7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JKcn5FmVjtdLgYOASDjA00unBiKKTt/1fSkBmrjqn/k=;
 b=cG50VKXiteMhkAFIejb8TGedUY6N3oNNKeIz6+w7gtcgEhfAlM+nOVDEugiUjRrXu6
 WAz9Bz9vG83hkneooAlTyOgb/mZY+844GuGLnpnxNJ640YhR/D+4MJWIoKgFrDJkCLmb
 M4u0h9Gpe/x+1r1j89Q+J5OPIuCdIdstYCkxzuXCldeL2L+VGjbzaPEGM9ztMqkZZLrf
 8OdHHhVLAnuIw9BE5wViz1dQITTYlxF40VtlKJjam1DdsBlNHh7tIpIKPOyx2xjRUzZl
 XzYXkuv2tkvYNQjK7dbWRUw5EaeXpzQ9vbBe4aATWFWX11H/deQMA11EGjFNraWphPP6
 dNhQ==
X-Gm-Message-State: AOAM5320f8y1ZfqOQbkshII6OEaGdH43PBXJ4GAULs//1T25ZBWvlAPJ
 9KuGGfpwUAyDj5fvMlyghfc=
X-Google-Smtp-Source: ABdhPJxIId7YInUzi9s1MpexjtDdKWYEXgaBPVTOj1ys7xu3LTGaj1flIjv6myZeew4CJ1r0mdSuhA==
X-Received: by 2002:a05:620a:4db:: with SMTP id
 27mr74435319qks.431.1609793854321; 
 Mon, 04 Jan 2021 12:57:34 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id a22sm37490512qkl.121.2021.01.04.12.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 12:57:33 -0800 (PST)
Date: Mon, 4 Jan 2021 13:57:32 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH] powerpc: Handle .text.{hot,unlikely}.* in linker script
Message-ID: <20210104205732.GA1398664@ubuntu-m3-large-x86>
References: <20210104204850.990966-1-natechancellor@gmail.com>
 <CA+icZUVe4AJoLWMqS3MEx700jcwDaJhw78tUgg8iD0dJvEmmYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUVe4AJoLWMqS3MEx700jcwDaJhw78tUgg8iD0dJvEmmYg@mail.gmail.com>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 04, 2021 at 09:55:20PM +0100, Sedat Dilek wrote:
> On Mon, Jan 4, 2021 at 9:49 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > Commit eff8728fe698 ("vmlinux.lds.h: Add PGO and AutoFDO input
> > sections") added ".text.unlikely.*" and ".text.hot.*" due to an LLVM
> > change [1].
> >
> > After another LLVM change [2], these sections are seen in some PowerPC
> > builds, where there is a orphan section warning then build failure:
> >
> 
> Looks like you forgot to add your references/links to [1] and [2].

Indeed, thank you for pointing that out! v2 coming shortly.

> Might be good to mention...?
> 
> With CONFIG_LD_ORPHAN_WARN=y is enabled

Since this symbol is not user selectable, I do not really think it is
worth mentioning, plus PowerPC has had this enabled for a while :)

Cheers,
Nathan
