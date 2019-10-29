Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B29E9335
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 23:52:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472n0r0L6NzF3dJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 09:52:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="IpOq05N4"; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472myh2X3SzF346
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 09:50:50 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id g24so73529wmh.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 15:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=btcO2kbQzjWCRPlDPp2ih4Wwes8/F4qc3tgqqhv/xx8=;
 b=IpOq05N4KjE4zg1oC5O7H20w97yojnP1buo5WYqtlFfYFF3MNAXbfZtKUaRR23Hev5
 MfdWZAUKaGTCTo5ws7T0XlnPU1wZZYu25+voj37P/E9iHJQjeESf9QY7McgoJIrMwVSn
 +V5iqH6DXsiTXkyN/6pPQ5/cnKEegZm2BKZzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=btcO2kbQzjWCRPlDPp2ih4Wwes8/F4qc3tgqqhv/xx8=;
 b=XP1dDAtauc9usZImYIAJw1QVwam1OnbOPneAbYjbMSl7kD712Y0spQnzPpjr/qnEJx
 z+FMhBWHn6ynhKlgLr7i7X6XC5CJ0HlqMlMsWi8Mw6Pqy/Ox4Y1122lb92EZRCK/5zmC
 4HBYZhtesu+TBgdRkmG17cRrQBg0/n9vvksY1JFTThzjpM3FsvbnRqCwrUD85nvCjaX6
 QI69bz+sJEhfY9Zn0Gx4HUKV8C23JTuG+bU4A/qpEQPzcmhcs4vgwfOBdblEYDSoUFQd
 H0z3ZxrY4+TVQ+VpgzCAwluwA6LMraO6GxmDtOMMuhsDIylRi8djp+6TF1+9OcIjiMwC
 PaYA==
X-Gm-Message-State: APjAAAXwtVYa/exBVg/93xQ5GQjgbnK5PbcoQRXzC5H0CcfG/s8Sd8oE
 d8lm3lvw7NxTVmKdP81NHhV0pw==
X-Google-Smtp-Source: APXvYqwvFUOZBquoDvuOipQqVhVeJTxzpP1yQP9WQ69QCPwyrvLFWnlerZKyvn/QDEJrMiW4edqnQA==
X-Received: by 2002:a05:600c:350:: with SMTP id
 u16mr5802601wmd.160.1572389444332; 
 Tue, 29 Oct 2019 15:50:44 -0700 (PDT)
Received: from [192.168.1.149] (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id x7sm903106wrg.63.2019.10.29.15.50.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Oct 2019 15:50:43 -0700 (PDT)
Subject: Re: [PATCH v2 20/23] serial: make SERIAL_QE depend on PPC32
To: Leo Li <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-21-linux@rasmusvillemoes.dk>
 <VE1PR04MB6687CA599C89D46076C9B3518F610@VE1PR04MB6687.eurprd04.prod.outlook.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <42d151c0-bbf9-62a5-5930-70d62418bb84@rasmusvillemoes.dk>
Date: Tue, 29 Oct 2019 23:50:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <VE1PR04MB6687CA599C89D46076C9B3518F610@VE1PR04MB6687.eurprd04.prod.outlook.com>
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
Cc: Valentin Longchamp <valentin.longchamp@keymile.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29/10/2019 23.44, Leo Li wrote:
> 
> 
>> -----Original Message-----
>> From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
>> Sent: Friday, October 25, 2019 7:41 AM
>> To: Qiang Zhao <qiang.zhao@nxp.com>; Leo Li <leoyang.li@nxp.com>;
>> Christophe Leroy <christophe.leroy@c-s.fr>
>> Cc: linuxppc-dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
>> linux-kernel@vger.kernel.org; Scott Wood <oss@buserror.net>; Valentin
>> Longchamp <valentin.longchamp@keymile.com>; Rasmus Villemoes
>> <linux@rasmusvillemoes.dk>; linux-serial@vger.kernel.org
>> Subject: [PATCH v2 20/23] serial: make SERIAL_QE depend on PPC32
>>
>> Currently SERIAL_QE depends on QUICC_ENGINE, which in turn depends on
>> PPC32, so this doesn't add any extra dependency. However, the QUICC
>> Engine IP block also exists on some arm boards, so this serves as preparation
>> for removing the PPC32 dependency from QUICC_ENGINE and build the QE
>> support in drivers/soc/fsl/qe, while preventing allmodconfig/randconfig
>> failures due to SERIAL_QE not being supported yet.
>>
>> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> 
> I think your purpose of this series is to make the QE UART not depending on PPC32.  If it does accomplish that then we don't need this change.

Yeah, as I've said in private, I now have the patches to make this work,
so this patch (and the later one removing it again) are both gone from
my current dev branch. I'll still wait a day or two to allow the ppc
people to respond to the inline/OOL iowrite32be issue, but after that
I'll resend the whole series.

Rasmus
