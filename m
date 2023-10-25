Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8FD7D785F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 01:08:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KpLMDOIa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SG4Nt3jhXz3cPk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 10:08:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KpLMDOIa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=philipp.g.hortmann@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SG3xX06lpz30gF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 09:48:29 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9cc6c92d1e9so7577766b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Oct 2023 15:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698274101; x=1698878901; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h1Wtmp4jaolI15oZgo//tqFOl12QGRnI6l3LLvFOdIo=;
        b=KpLMDOIaD4eRBqk2wJU76JM+ETyJzz9GRUjDQpZGq2Yd2jmXbJXP9lOksOg8EdAvyx
         fa0+it89cmq+MNQaacVeVfv/fmyGzytVBXgv72IKdfooFRo+M4grXFq7i4T1AVshO1yK
         UqI5gWTH0ZGJpJ+zIWSNSd77e8QD4M9JuWkg9Q2p2/Qe+hpNpPD3EDWo3+O0MmH/8+s6
         aX3tWHPUjgj+/4wF46qCCwtIBF6CcERTeAbXidu7j7OG8uR/iNCP5KGVUyaLVnFSCrDo
         mFIuSnTAMxNEXYhZyK7/652z1qcm1QUUY/QJOEyCFy3FVCkj4nV89rdB2SS9rU2y0FSW
         kHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698274101; x=1698878901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h1Wtmp4jaolI15oZgo//tqFOl12QGRnI6l3LLvFOdIo=;
        b=p2EQHiEDoCYN44JvzCG+3t3yvD7hQFYzn+mFY6MWsECZBb1Vk5A8Bu2v6TfwZNCogI
         ra+uxuHTdflM745EDzzFkaTF8BS8faY9Joc3fIZ6ZbKVZ2jxsDKc5MWFaZQWtNPRp8k5
         qQOjxzbIxUZy6qHaHcesFKSMXtfcABB2iUGBBqaa/knBXmyX1JM6WC6kE4NW7Xl1Dc9E
         kYgd29XhBXMsSa76sRYNg/Zuy0Hcxxq1l4PtxPxFZVReHcvylH3smER9WYyLLS17S9kn
         TuVWQ8NbBGOwDHFYh0ByKy15bXjZPE4jJcfT7r6Q8Y4PfPq7+6DIIQfeEN2eKdZn5tlY
         p5uA==
X-Gm-Message-State: AOJu0Yxf8HrHaO4YAlA4lzb+ZB9vPsrqIOCARu1d6eVROZqMem21/LLn
	k7T9+1QwCPWkRcDpd3NyxkI=
X-Google-Smtp-Source: AGHT+IGZysA7t84XKVRzSA8XE25oFrQWSh3/UAeHsseDmefuOjgMHv8S1Go5CrpHtdDA4m4jNf1AlA==
X-Received: by 2002:a17:906:21b:b0:9ce:c4f4:5f97 with SMTP id 27-20020a170906021b00b009cec4f45f97mr243735ejd.1.1698274100762;
        Wed, 25 Oct 2023 15:48:20 -0700 (PDT)
Received: from [192.168.0.103] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id 26-20020a170906011a00b009ae69c303aasm10545728eje.137.2023.10.25.15.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 15:48:20 -0700 (PDT)
Message-ID: <c608f328-387e-431b-b3c2-4b8fa0c4f11f@gmail.com>
Date: Thu, 26 Oct 2023 00:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] [RFC] wifi: remove ipw2100/ipw2200 drivers
Content-Language: en-US
To: Witold Baryluk <witold.baryluk@gmail.com>, arnd@kernel.org
References: <CAEGMnwo6RFqADPO5FRkRUNL=GfV6DY8UuwgsypEYOD3LTnXdJg@mail.gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <CAEGMnwo6RFqADPO5FRkRUNL=GfV6DY8UuwgsypEYOD3LTnXdJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 26 Oct 2023 10:07:16 +1100
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
Cc: alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, pavel@ucw.cz, gregory.greenman@intel.com, stf_xl@wp.pl, linux-staging@lists.linux.dev, ilw@linux.intel.com, geert@linux-m68k.org, kuba@kernel.org, stas.yakovlev@gmail.com, arnd@arndb.de, kvalo@kernel.org, nicolas.ferre@microchip.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, geoff@infradead.org, gregkh@linuxfoundation.org, linux-wireless@vger.kernel.org, claudiu.beznea@tuxon.dev, johannes@sipsolutions.net, quic_jjohnson@quicinc.com, davem@davemloft.net, Larry.Finger@lwfinger.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/26/23 00:27, Witold Baryluk wrote:
> I might be interested in modernizing the driver, but I have no idea how 
> much effort it would be (in terms of changed fraction of code). 20k LOC 
> is neither small or big, and not obvious (a lot of it would be 
> unchanged), if it is a week of work, or months of work.

Hi Witold,

I am trying to do this with rtl8192e.
One possibility is to take the following patch series as a starting point:
https://yhbt.net/lore/all/1414604649-9105-1-git-send-email-tvboxspy@gmail.com/

For me as a beginner and hobbyist this is a huge task. I am happy when I 
can finish it until next summer.

In case of questions feel free to ask.

Bye Philipp

