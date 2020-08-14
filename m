Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEF32444F5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 08:21:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSYHN72XWzDqk5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 16:21:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::533;
 helo=mail-ed1-x533.google.com; envelope-from=hkallweit1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oJREn4cU; dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSYFF52jjzDqfN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 16:19:42 +1000 (AEST)
Received: by mail-ed1-x533.google.com with SMTP id ba10so6002938edb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 23:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UXT1flf+cw02X+05sr2H1r1+otkr90aq0IsOI5+Wa0I=;
 b=oJREn4cU3O1rw40AArW6Z81miwvHWgeTAeOuCZwcGRdzjwbMGlJiJzVMO6kHSg92KQ
 +X3lAjCIy6el5qQZmr/wcM3uyTXrttad09f+difG5wi9uxZl5UZUkeQoS260D+M2ymVJ
 lAwxngVc3XRwsSfDD/5nIAJqN0lkxSRqlO63r0+/7qeshTgU3p3RRj4FzFWhdLJxnqjx
 nKKJfIzbXEqoq3OPg6tfkSG3P0YW0prIvDSDfRW37ayGp+zoEZkCfwK90yCh/lRaZ+og
 ADUpw1j3AwXS147XD7x61UHTIwJDq7A/c9aO2aWzY34veRUFr/Jb4ulLjIfYQStydsYM
 dlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UXT1flf+cw02X+05sr2H1r1+otkr90aq0IsOI5+Wa0I=;
 b=JgU/jJM2pDR+aUOVKng/MVQrayxv11av/7LLnfURWu9loAmzYl3E5sv5NBgIhVMhIk
 YygghYljNiWIz6wxxpk/rWqKH2aQIqRV2Pujq4ERPxRVSS7TAKaDINe7AvNiLDXR8J5e
 z2xydRqmeeeMlyTkpX+Igow6a2GNDmeg0IV9/U+sOyJnGTU8jpUO4l6T0NTrl2SUS2DY
 lK372D+7DkVF0nMrv6A5/DRZnLui5SoTPGlhfKYLERN9aY2YUAcWftWhIgF5KMQKZ+H4
 dfOc58TTTwgC1saPzCimhhc4HY5cX1hfn6qaaaqCCJHcti0+2uyocC2O/SE37XWTYnlX
 cnFg==
X-Gm-Message-State: AOAM533UinPsYeB3h8EECHpNM0REV9PNHnmadCORCYm1ul5Q83nb4rtR
 Vv/iaJ4yJAdFluB3O4jgSq4=
X-Google-Smtp-Source: ABdhPJz5pfQrOZ4FllnHVJ9ZLobKzbFsyza5qcMiYnCr5rzk+hPcTwUMgR05Pc/ScRwSaincGS2+yQ==
X-Received: by 2002:a05:6402:16:: with SMTP id
 d22mr860616edu.175.1597385978107; 
 Thu, 13 Aug 2020 23:19:38 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f23:5700:10c4:47b:9d52:cd78?
 (p200300ea8f23570010c4047b9d52cd78.dip0.t-ipconnect.de.
 [2003:ea:8f23:5700:10c4:47b:9d52:cd78])
 by smtp.googlemail.com with ESMTPSA id d9sm4979917edt.20.2020.08.13.23.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2020 23:19:37 -0700 (PDT)
Subject: Re: fsl_espi errors on v5.7.15
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "paulus@samba.org" <paulus@samba.org>,
 "tiago.brusamarello@datacom.ind.br" <tiago.brusamarello@datacom.ind.br>
References: <3f48e5fb-33c9-8046-0f80-236eed163c16@alliedtelesis.co.nz>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <c43a23bd-33ec-4ef2-2ca5-730342248db3@gmail.com>
Date: Fri, 14 Aug 2020 08:19:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3f48e5fb-33c9-8046-0f80-236eed163c16@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14.08.2020 04:48, Chris Packham wrote:
> Hi,
> 
> I'm seeing a problem with accessing spi-nor after upgrading a T2081 
> based system to linux v5.7.15
> 
> For this board u-boot and the u-boot environment live on spi-nor.
> 
> When I use fw_setenv from userspace I get the following kernel logs
> 
> # fw_setenv foo=1
> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't empty!
> fsl_espi ffe110000.spi: SPIE_RXCNT = 1, SPIE_TXCNT = 32
> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't empty!
> fsl_espi ffe110000.spi: SPIE_RXCNT = 1, SPIE_TXCNT = 32
> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't empty!
> fsl_espi ffe110000.spi: SPIE_RXCNT = 1, SPIE_TXCNT = 32
> ...
> 

This error reporting doesn't exist yet in 4.4. So you may have an issue
under 4.4 too, it's just not reported.
Did you verify that under 4.4 fw_setenv actually has an effect?

> If I run fw_printenv (before getting it into a bad state) it is able to 
> display the content of the boards u-boot environment.
> 

This might indicate an issue with spi being locked. I've seen related
questions, just use the search engine of your choice and check for
fw_setenv and locked.

> If been unsuccessful in producing a setup for bisecting the issue. I do 
> know the issue doesn't occur on the old 4.4.x based kernel but that's 
> probably not much help.
> 
> Any pointers on what the issue (and/or solution) might be.
> 
> Thanks,
> Chris
> 

Heiner
