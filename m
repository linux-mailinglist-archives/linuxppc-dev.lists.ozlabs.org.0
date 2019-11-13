Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6287FAAF4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 08:29:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Cbp70mhhzF5LC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 18:29:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="infkLwQ4"; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Cblp2ST5zF7Nk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 18:27:00 +1100 (AEDT)
Received: by mail-lf1-x144.google.com with SMTP id j14so1064562lfk.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 23:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yDdws34Rq5JH8sQUN0hdqQY10XjPq06N8OEfJVtJ98w=;
 b=infkLwQ4ols/YljFrq0q1EHDCTxYJ9I6JW1B0gxtlldWOg+TTabbxbwjRBtaQx+wQK
 WgBpqpmqIY9DCHqrgHhKGWBPwnCfKNIVeo+5v4472CqqXWDGbGJ3UTn3X2r1Tynkubkm
 V6o1wD5j1C3CiafXqbCSeWYKylOFg+1sPKmz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yDdws34Rq5JH8sQUN0hdqQY10XjPq06N8OEfJVtJ98w=;
 b=jZ+qNE0CrwSZ+TWlOOE/VEPq2ZFGYe0CppIxZXCMM7R/WwgQSmbm+whIeYGalmVFCM
 8vKcDK4yI5W1DfCvoMu5yypVbCfVRyAnLKPWRoMTw5doiS6+k+C+g0oBTXdmubRhQWZv
 R3G78jsvdtVQedaMR8YdyCOmgVJnvSufKiXrWo2KIUtfQROQiDdtgWSYzfCKYoUP5nuK
 fPKNlPhygtpqRxTIViQEKbOoOENV1ews7hb1VQ8EphHoYAXnT9cHzXywjkjdx+Ley/T/
 PtOlJghnerFd7QYi26VNwJaRmV0bF7KuOhCAF6jpfOkpbiJnXegylcTpxi6HVdJJvMfO
 xZSw==
X-Gm-Message-State: APjAAAUXe6gRd+hX5F2wsfSGZhrPRF1WpniX2SSyJuNQjhBgHfiITmSq
 sjAtkYiiG3fTs4VlITg4FIu7fw==
X-Google-Smtp-Source: APXvYqzFLTMfk5U2wuTAqB0pvxbh8egdOKI3L4BeWtTxYDFWuldchErNN4wBbpobHrBl+QXZvWrohg==
X-Received: by 2002:a19:41d7:: with SMTP id o206mr1526891lfa.188.1573630016296; 
 Tue, 12 Nov 2019 23:26:56 -0800 (PST)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id 7sm553587lfr.70.2019.11.12.23.26.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Nov 2019 23:26:55 -0800 (PST)
Subject: Re: [PATCH v4 00/47] QUICC Engine support on ARM and ARM64
To: Li Yang <leoyang.li@nxp.com>, David Miller <davem@davemloft.net>,
 Scott Wood <oss@buserror.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Timur Tabi <timur@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <CADRPPNSeEvFnVzGeZW6RPo_LP8mq14G2ZmmDAuwNdC3hT8Ekcg@mail.gmail.com>
 <CADRPPNQFiPMvRcSkVgM8p2_AxhqBOVFus=cX5UC-8NYYUvf+0A@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <3d6abdfd-b180-d382-ff8c-9777cab21e70@rasmusvillemoes.dk>
Date: Wed, 13 Nov 2019 08:26:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADRPPNQFiPMvRcSkVgM8p2_AxhqBOVFus=cX5UC-8NYYUvf+0A@mail.gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/11/2019 21.45, Li Yang wrote:
> On Mon, Nov 11, 2019 at 5:39 PM Li Yang <leoyang.li@nxp.com> wrote:
>>
>> On Fri, Nov 8, 2019 at 7:05 AM Rasmus Villemoes
>> <linux@rasmusvillemoes.dk> wrote:
>>>
>>
>> I'm generally ok with these enhencements and cleanups.  But as the
>> whole patch series touched multiple subsystems, I would like to
>> collect the Acked-by from Scott, Greg and David if we want the whole
>> series to go through the fsl/soc tree.
> 
> Rasmus,
> 
> Since the patches also touched net and serial subsystem.  Can you also
> repost these patches(maybe just related ones) onto netdev and
> linux-serial mailing list?

They were sent to those lists already. For example, according to
<https://lore.kernel.org/lkml/20191108130123.6839-29-linux@rasmusvillemoes.dk/>,
the recipients for 28/47 were

To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
	Christophe Leroy <christophe.leroy@c-s.fr>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-serial@vger.kernel.org

same for 29-33, and 43-46 was cc'ed to netdev@.

Rasmus
