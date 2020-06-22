Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADF6203C44
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 18:11:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rDtM1YmnzDqXf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 02:11:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=212.227.15.14; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=FPuGjfk1; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.14])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rDpM0qFQzDqWL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 02:07:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1592842025;
 bh=euiTs9Vlme+/DBX3W6t9oQp+oD5eiCyynyHj9yaGmUc=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=FPuGjfk1nmdT1AozUfprjwsqHojo8YqKpaEbckNH1v+EJpRtqX9p0M7a/MX0ORO1J
 xjFzBkiHYvxbilLvcuO7Kcl5X+Lx5HWKiodMid3GnThu4SdDksS34oAzigO3YSWZ/G
 fRp3hpTrwP9EXifGIXS9drteNbdyCpn0OfQVmEGo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.69.81]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MVtmK-1jKlEX1pyi-00X4kv; Mon, 22
 Jun 2020 18:07:05 +0200
To: Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] ASoC: fsl_mqs: Fix unchecked return value for
 clk_prepare_enable
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <3eab889e-75b6-6287-a668-a2eaa509834c@web.de>
Date: Mon, 22 Jun 2020 18:07:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
X-Provags-ID: V03:K1:mdhL/0f5+V25v2dpHQoNdD4QBj3iePUzzgiygJmbHDdjOrwPGcI
 kHTnyh9jUR+losoXxnS0TgyX5vM/TPwlq3Y3yhRHyo+IhPmnp5BpcgBfiB8KTjx/8bBWSGq
 UM2ptugSwHEsLOxknu6YaslnfyID0Ep1k+r58vqjXZQqiO0j/8MacCFjpdccu6ueRiwwkEi
 k1BS5uQGMGcQg5HIruhMw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iCN0J44QwF4=:QKf8Vt6Nzuj4jfABJLLAuy
 ZXFXgVdDs687hmyUEIVzFKdqIefl3ah5lIHYrhAMQy+tKCTjiztRBSco1wLgy7aiBKwkzCkwI
 NSh723weY9q9uphmL8yuXIIyMLpK0w2havy1PCA5CSxsUed8/9n0dG1TXOVGYhO2jCj0ZY4R8
 q6LJ1MDb6EBWFOGpIbenY3R2lGs4J8zxzIoP7vmaDRCF8FmTQUN9F1lXXIJWtbhMChECsa42O
 S6WYIFMWQoeec9aF7xHLvNABP2DW/8yTjWnAiJY6f/NYpIs3zC/QQqB8klmkX17zI1HvWQyI/
 keDFLuShMEtCGf70oKBCvMlC9CKA2cSXeix5sD9yC5YOBIJMpqmlohHv6l1TuQY0xqAfLz120
 q0QgPgTW5u9fyMTCN4Nx6Os9otb3qnRRF9Br8mAQgnVX1POMpYfm5WY1pjjzuuZFX55e9oCjf
 3JIP4NhxMGu/waTg8Ywdu24C4kHdcCOTcsyZKcLqXvOQZiXz5fBee+HO0OMXycGIgQ+FPD5oh
 gL/9mgJys9eli3WVOgvqDc5d2ng0S62Y3DLvvlC+9sKlEHdwPr9jKmm2fbbMupuLBVrfQXOqk
 KPAjnOf2fa+gWWYKwD1RiRiD9TH/Wqlc39cJ7FZPpFhVhE8Pxv8NUTYNp73iaybsf+wn66syy
 FPx1ngZ3itf899NkYviotpQh5nNY5UZHHves1v9S0v9PG8qlBq/ftBHSMRA/zP/LGLeOg6nNH
 awH+RfAIq8qKxSzj+FQXEiBBcGt00lPpRA+n+JHMxM+Z3mCXMrCl+GGqymBwVaISAhwv+saqs
 s/wHI+TnyyckJY7R5iUzYQZLisgrqaqTonzTS2VRvY4vOq2ZOtgGB75si3OEDRSNkada8PAQ6
 0RHomGUJUUtMM3WGeKuoAnwTWW3RYYH0D/NN2RQRHw85g++dPRTI4btmxDv/zPQQ7dQVPfZeQ
 /PFddQ5FzwFK/M9wN2qaokTUe8faeY0huAjyPqeakiYB4Js2ZPOY9sFxcnCjTiwWcQZjBcY54
 05r/xK5oYYa6zPGmpvrlwGDDr3yV9rLQPVBRk6zF38/mXuzlUp4FXwomvvDBbYFJuhlMsIMW3
 jXrcIpgSlRzzmvIgkdxltKy9CWgtyx6UV2b9vwNHcWYOtOG4uE+Kj114TCpjIDylrBh3UYqF1
 F4JIGt4XJmDQZ2pc/HjFaRvRQ6UckROGNjP10Ffh7zO36S1RsHALD6jYYTge08wx+IUYjluJB
 PJIsqZk9PiJx5y4Xg
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
Cc: Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Fix unchecked return value for clk_prepare_enable.
>
> And because clk_prepare_enable and clk_disable_unprepare should
> check input clock parameter is NULL or not, then we don't need
> to check it before calling the function.

I propose to split the adjustment of two function implementations
into separate update steps for a small patch series.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=625d3449788f85569096780592549d0340e9c0c7#n138

I suggest to improve the change descriptions accordingly.

Regards,
Markus
