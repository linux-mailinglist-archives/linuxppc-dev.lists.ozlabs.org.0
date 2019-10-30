Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E09E9C23
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 14:17:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4738Bk6BrczF49M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 00:17:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="UeZxmXcP"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4737f20dgQzF3xV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 23:52:40 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id m9so2520483ljh.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 05:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5erIfBzA/jd7EXBaSVGi4HXOCmx41ZkwEb2QQHCHgvk=;
 b=UeZxmXcP45HajlZCYTH/fPyfVK7l1VzXklUgS+JvhBfli6XupBaZ6oybuR4B0/An4o
 YkfSu1jEro5BttaiBUCjD3BKKyuvn3uZaxqZvJrbOX821We5YHsTMZVt1W/Tg2CnC0N3
 Ilvs/BDd2vCMKXhzz00VdbdI1YVn0PGO0dv04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5erIfBzA/jd7EXBaSVGi4HXOCmx41ZkwEb2QQHCHgvk=;
 b=dzy7ylMGJvSy2r/eq+5P892GH5WktMgkXxiheAQSGD2/EAGYnMX4IyugSz0fIWide3
 05MPaP8XRjwIeU5h9wLOZ7jHgtkwa5wTHemmHCips9qRmiWPUvsQpEmx3iZ4EZbNBTwR
 lz8ZwDO4Ng/gJV1xzfUYr85VDZ6/YBgDwyWa4A+myMFRrVv2abUAMcWb1fR+8/ceci1J
 pJ/KE1AuGfKCjNFaZ44RNzy3D2wdw+wbUQCVFvce4H7fHrWEoR9S+/qi6oQp55SckxH/
 KNS4CNALYOC4NF1tv+2kkIbISBWCRaA9SZaD0DsCwXt5CafilFRvxN5Qvm8jCGCtXnSF
 zi7w==
X-Gm-Message-State: APjAAAWdHCw3m9+n7+8WQqqnNaN6DA+ZYtK55NhMcCwuBQfk/1T31EVR
 TnhWi+mq46x+5QTjCiedFbVx9A==
X-Google-Smtp-Source: APXvYqwUzQtilkzjwaBLHyLTKEW/yG9aPJtXBPBUOwPOr4CS6DkX1KalmlTNN88bUG4+HgjaXpR6Eg==
X-Received: by 2002:a05:651c:28a:: with SMTP id
 b10mr475136ljo.124.1572439956073; 
 Wed, 30 Oct 2019 05:52:36 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d9sm1426980lfj.81.2019.10.30.05.52.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Oct 2019 05:52:34 -0700 (PDT)
Subject: Re: [PATCH v2 17/23] soc: fsl: qe: make qe_ic_cascade_* static
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-18-linux@rasmusvillemoes.dk>
 <1d12e0d1-a873-d841-6e73-22ec1d09c268@c-s.fr>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <bb00fda2-7d20-b1a1-e2e8-22702842548e@rasmusvillemoes.dk>
Date: Wed, 30 Oct 2019 13:52:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1d12e0d1-a873-d841-6e73-22ec1d09c268@c-s.fr>
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
Cc: Scott Wood <oss@buserror.net>,
 Valentin Longchamp <valentin.longchamp@keymile.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 30/10/2019 11.50, Christophe Leroy wrote:
> 
> 
> Le 25/10/2019 à 14:40, Rasmus Villemoes a écrit :
>> Now that the references from arch/powerpc/ are gone, these are only
>> referenced from inside qe_ic.c, so make them static.
> 
> Why do that in two steps ?
> I think patch 9 could remain until here, and then you could squash patch
> 9 and patch 17 together here.

Agreed, I should rearrange stuff to avoid touching the same lines again
and again.

Thanks,
Rasmus
