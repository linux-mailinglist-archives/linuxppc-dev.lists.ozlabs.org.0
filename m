Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA792E8378
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 09:46:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472QD44nprzDqV7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 19:46:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="RB8kpGeg"; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472Q945PJMzF1MD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 19:43:35 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id v2so44955lji.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 01:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HGXd6rlxFLbtpjrAQ8G1Qtj9aAnpBTx6NO8SjG7PtjI=;
 b=RB8kpGegZFDbX4ehO3+DnkUXso3PSM4ypigva4bxla2UhzbfYW3VFanbaz6VAqTIp9
 vC4VW/N/DNc5sYKbDVzBAZWHMwSNqKbSozM7z9NZGI9mkDa0OXo0Om0mCpyDwNoaV8lk
 b3mRrhW7uAmiDR3MvGYepqftbS6Qixnz1xrt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HGXd6rlxFLbtpjrAQ8G1Qtj9aAnpBTx6NO8SjG7PtjI=;
 b=OXF86vzbvk2FLqbyHm6II8Syr2fpg19zxbk6qMqOQXGyf2SYGNJ2/be6XhIkOEI42Q
 2XpQvVVZQnOkt6izoGcZf1O7GlQ5W9wpijNyH9zREQJ/bjAGMsYxN/CKA79obUD5rjph
 CC/8gy2BbKqBoSXC70Sn+YP2xXjGPwRV9EVoq5WMwexMF5roZWrMYlbKtha+UWDz2kUh
 rMoP4a39oOVx+ROo1B+hvBbNdgmyFmQPumLWFOJ/GzMDPZvbR4Yk1/CPw3L5CRoU3qTY
 bI9wCpSQIypYQb4qwTDf4AGQpq5pFOjaKpe22s5gZAO0Ob8oXp5w18Z3u0hhzehGewJn
 hmPQ==
X-Gm-Message-State: APjAAAXjM8QaAnFZ+JrXMqncWganbQbZvUKGXsEMOKJAaQKXEeGMTSuN
 cotJtsppsMzRDn7XhtlePfM3cg==
X-Google-Smtp-Source: APXvYqzEDMxdj01ErGn8mE4rCnBBCxTZ6HkGNRiI9Uh8UyBsOyPj0DTCwoKDupc4z5w1cSudjzX3Qg==
X-Received: by 2002:a2e:4751:: with SMTP id u78mr1617787lja.210.1572338611332; 
 Tue, 29 Oct 2019 01:43:31 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id 77sm13198495lfj.41.2019.10.29.01.43.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Oct 2019 01:43:30 -0700 (PDT)
Subject: ppc: inlining iowrite32be and friends (was: Re: [PATCH v2 03/23] soc:
 fsl: qe: avoid ppc-specific io accessors)
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-4-linux@rasmusvillemoes.dk>
 <886d5218-6d6b-824c-3ab9-63aafe41ff40@c-s.fr>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <02a8a449-e421-f70f-4bf9-50a94324834b@rasmusvillemoes.dk>
Date: Tue, 29 Oct 2019 09:43:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <886d5218-6d6b-824c-3ab9-63aafe41ff40@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29/10/2019 08.43, Christophe Leroy wrote:
> 
> 
> Le 25/10/2019 à 14:40, Rasmus Villemoes a écrit :
>> In preparation for allowing to build QE support for architectures
>> other than PPC, replace the ppc-specific io accessors. Done via
>>
>> $ spatch --sp-file io.cocci --in-place drivers/soc/fsl/qe/
>>

> As discussed already, this patch changes io accesors from inline to
> outline, this has a performance impact on powerpc32 like 83xx.
> 
> Could you please include in your series before this patch a patch to
> change generic io accessors to inline on powerpc ?

Well, it's complicated. I was hoping someone could explain why those are
OOL in the first place. The history of arch/powerpc/kernel/iomap.c and
the makefile fragment including it is a bit messy - first of all, the
file itself talks about "ppc64 implementation" but is obviously used for
all ppc32 (while the ppc64 platforms that set PPC_INDIRECT_PIO also get
GENERIC_IOMAP, i.e. lib/iomap.c).

So, what I wanted to do was to make the accessors inline when
!PPC_INDIRECT_PIO && !PPC_INDIRECT_MMIO. But then I need to avoid
including asm-generic/iomap.h, because that declares these as extern.
OTOH, I think I do need some of the declarations from that file, e.g. at
least pci_iounmap, and perhaps also the *_rep versions, unless they
should also be inlined.

I'm happy to give it a try, but I think that belongs in a separate
series. The first few attempts are almost certain to generate some 0day
reports.

Question for powerpc maintainers: Is there a fundamental reason
iowrite32be and friends are out-of-line on PPC32 (more generally, the
PPC platforms that set neither PPC_INDIRECT_PIO or PPC_INDIRECT_MMIO)?
If so, there's no point trying to make them inline, and I'd have to
address Christophe's concern by introducing private qe_iowrite32be()
etc. wrappers.

Thanks,
Rasmus
