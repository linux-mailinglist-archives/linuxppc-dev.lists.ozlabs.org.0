Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E74ECE2C4E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 10:37:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zLFx25cGzDqSt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 19:37:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="gClEFeCU"; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zL9D2Nv9zDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 19:33:02 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id x4so12099472lfn.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 01:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+75bXYmJLWTFE3320pYIpgc0DqJcYlwjBZB7EAmPS10=;
 b=gClEFeCU+g0DoMciGkXeW9Z7OGI79blTyZ9lLfcjrBKqg5p80UlmyeFFLuXc5KT5hH
 Q3wWVhydm7bwX2DiG3ftfR8cTTAs24mFH15R4Q4mAz2paRSJ//b3ENgS7RgbKaBPM+Ji
 khtnY1Yt0+YLyd0ZBxlay/rj9Am64z/A1bYGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+75bXYmJLWTFE3320pYIpgc0DqJcYlwjBZB7EAmPS10=;
 b=eKcc0g9JJCPWgPcHxWd001p2kBVXftz/YRALeabqzq7JeyQARPPVMmnlCWi2b9s/mB
 LHQfy3iaKm+AGfvgQ9onPh/44LKMVRWm0sCQckRs/T7xV/NnZ9R9/GkrU6SglLmRwsVn
 kSq8S9UPkXqdiVCeEgnWU9TETkaFjCRE/gMk28Dsil7TLg8P/pK+lCV7TqUK+l/zPp5C
 dd5Dw9RQmTOjTJ7fipiwZH/t1UnIo6OrAv6AJP6GU9AqKIRwleyLeW0MO2WTYCOgP2In
 qRzmEPBFv1Q+jVFSLMWyJnD/gKTImkGJObYWs29kChK7MYI/mJy3BvoLNrQ9/hlGT3Kz
 W6KQ==
X-Gm-Message-State: APjAAAXvxPmlZChQUVI/QSketwVuA87VtvCTuhYwSrQEiomcJJz5GsMp
 zsjBviZQnkUvUfcgTPQU9OxuzQ==
X-Google-Smtp-Source: APXvYqzGW/Z8ZcO24MLlZ7Q5TGMTH80egPpH3CSH8TEMirFgblCVOGKAPMvCu448esyNvmcxQil8nA==
X-Received: by 2002:ac2:5f0a:: with SMTP id 10mr1989441lfq.57.1571905977834;
 Thu, 24 Oct 2019 01:32:57 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id p18sm12995854lfh.24.2019.10.24.01.32.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Oct 2019 01:32:57 -0700 (PDT)
Subject: Re: [PATCH 4/7] soc: fsl: qe: replace spin_event_timeout by
 readx_poll_timeout_atomic
To: Christoph Hellwig <hch@infradead.org>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191018125234.21825-5-linux@rasmusvillemoes.dk>
 <20191018160852.GA13036@infradead.org>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <a11aaeaa-7075-4ad0-aa26-d8d7eafa72f5@rasmusvillemoes.dk>
Date: Thu, 24 Oct 2019 10:32:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018160852.GA13036@infradead.org>
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
Cc: Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18/10/2019 18.08, Christoph Hellwig wrote:
> On Fri, Oct 18, 2019 at 02:52:31PM +0200, Rasmus Villemoes wrote:
>>  	/* wait for the QE_CR_FLG to clear */
>> -	ret = spin_event_timeout((ioread32be(&qe_immr->cp.cecr) & QE_CR_FLG) == 0,
>> -				 100, 0);
>> -	/* On timeout (e.g. failure), the expression will be false (ret == 0),
>> -	   otherwise it will be true (ret == 1). */
>> +	ret = readx_poll_timeout_atomic(ioread32be, &qe_immr->cp.cecr, val, (val & QE_CR_FLG) == 0,
> 
> This creates an overly long line.

Yeah, readx_poll_timeout_atomic is a mouthful, and then one also has to
put in the name of the accessor... I'll wrap it when I respin the
series, thanks.

> Btw, given how few users of spin_event_timeout we have it might be good
> idea to just kill it entirely.

Maybe. That's for the ppc folks to comment on; the iopoll.h helpers are
not completely equivalent (because obviously they don't read tbl
directly). Maybe the generic versions should be taught
spin_begin/spin_end/spin_cpu_relax so at least that part would be
drop-in replacement.

Rasmus


