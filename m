Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B318EAB0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 08:41:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473chC1YpTzDqRL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 18:41:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="V6fRNYMg"; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473cdj14zkzF5Y0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 18:39:04 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id v2so5523506lji.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 00:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XYiEiAeXhzSNlTeZVtybpT8lclKkW3XtSx+iKVkW34s=;
 b=V6fRNYMgoB8Pzl1XrdHlLWkDp21wb/ZAO1KlZ7rzpLCgOKB+cLTIKkhzxBjKnpaTRq
 wg/s5Fs8T97v4nps20HK5RGnMMQyCoRPJTQ1WSk7qZGXAWoSpTN1wt/mdQcRW0iqvpyg
 dx5JXOcfg8IV2iczVB2WVlj1Lz68hY/phZ2co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XYiEiAeXhzSNlTeZVtybpT8lclKkW3XtSx+iKVkW34s=;
 b=ZbI2fzcVpu3yuD07M2DEEeXUTvjIzElJLBJbTNgt8Lk7kwuLe4gY1bVFPbjU+gbd5S
 5C2OTEz/liGOWR2DlIYWbhLgKTPmKLBEsLfkxassPEwbptK0OldoeBEE+XpuMGLC99d6
 bXNl4f6cp/u99fj9MR9Udw9bpuekiSHAEaRAn4jA86XZ1KAln17xzJN3L7yMj5EDBX8j
 dreFAcYYHu2kpw9u8VNdd4xgu8sBY5rTPtdTJjgx1S8heRt9frEWDSiCgho6ia9m5/Ya
 i7pOTVN3WsuHh+Phy3eKf8ARlOmwuxwhfzSPy7hzdB7zGOxN4mcqyQf08M+Ow2sDktny
 D0ug==
X-Gm-Message-State: APjAAAWuc7jNZ9dBZKEmStm+ClsqlZuBhSmnu/kFCcUp4KGWJGf7afyS
 69KFVGEPKUNmCKrpbAfAVPqxpA==
X-Google-Smtp-Source: APXvYqxT3T6cYOhnMq3nmTYG/Ls910R5ah/jwnD3vDOz9VZu/fzXJoKKzY8NQwSmVmS5/uHcXqfAmA==
X-Received: by 2002:a2e:7815:: with SMTP id t21mr2927502ljc.149.1572507537180; 
 Thu, 31 Oct 2019 00:38:57 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id n11sm1422892lfd.88.2019.10.31.00.38.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Oct 2019 00:38:56 -0700 (PDT)
Subject: Re: [RFC PATCH 0/5] powerpc: make iowrite32be etc. inline
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20191031003154.21969-1-linux@rasmusvillemoes.dk>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <04799503-b423-6bc8-71cd-bee54e45883e@rasmusvillemoes.dk>
Date: Thu, 31 Oct 2019 08:38:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191031003154.21969-1-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31/10/2019 01.31, Rasmus Villemoes wrote:

> At first I tried something that wouldn't need to touch anything
> outside arch/powerpc/, but I ended up with conditional inclusion of
> asm-generic headers and/or duplicating a lot of their contents.

Urrgh, this is much worse than I feared. Already 1/5 is broken because
asm-generic.h includes asm-generic/iomap.h conditionally, but
asm-generic/pci_iomap.h unconditionally, so now users of io.h with
CONFIG_PCI and !CONFIG_GENERIC_IOMAP get an external declaration of
pci_iounmap they didn't use to, in addition to the static inline defined
in io.h.

And I didn't think 2/5 could break anything - on the premise that if
somebody already have a non-trivial define of ioread16, they couldn't
possibly also include asm-generic/iomap.h. alpha proves me wrong; as
long as one doesn't define ioread16 until after iomap.h has been parsed,
there's no problem (well, except of course if some static inline that
uses ioread16 got parsed between the compiler seeing the extern
declaration and alpha then defining the ioread16 macro, but apparently
that doesn't happen).

So sorry for the noise. Maybe I'll just have to bite the bullet and
introduce private qe_iowrite32be etc. and define them based on $ARCH.
Any better ideas would be much appreciated.

Thanks,
Rasmus
