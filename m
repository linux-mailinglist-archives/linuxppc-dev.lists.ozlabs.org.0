Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 940595B289C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 23:37:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNssT3R1Tz3c6B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 07:37:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=datazap-net.20210112.gappssmtp.com header.i=@datazap-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=jCXamfp9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=datazap.net (client-ip=2607:f8b0:4864:20::661; helo=mail-pl1-x661.google.com; envelope-from=al@datazap.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=datazap-net.20210112.gappssmtp.com header.i=@datazap-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=jCXamfp9;
	dkim-atps=neutral
Received: from mail-pl1-x661.google.com (mail-pl1-x661.google.com [IPv6:2607:f8b0:4864:20::661])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNsrn2BMgz2yQH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 07:36:40 +1000 (AEST)
Received: by mail-pl1-x661.google.com with SMTP id d12so19183830plr.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 14:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=datazap-net.20210112.gappssmtp.com; s=20210112;
        h=content-language:content-transfer-encoding:mime-version:user-agent
         :date:message-id:subject:from:to:from:to:cc:subject:date;
        bh=necEDBETSaSr9/l7G4QumyIT6nB6UPhHzVoURQAI9PE=;
        b=jCXamfp9eQI79/PZllM0K7mv/XVZliBEcItkJYlOEyXti5yurLd+XwPZC2VTXOGeWi
         RlW1oHqw9nT9aHZvYdn/My4BzwzowoRSKOK2ueQXIPwIya7E5z+ru4z6vTWuM3gF4FQ5
         tttLwiQBXljiKtsO5ThSmtiT1dA0pLfoGCgziM7wH75CBOUBagLccx0dBwovPrxcBvvX
         zywygvOQoBwZN1LOMZ+eDC8xHkj+mYiYJn7xkslvPJU/XQhqwwkGQS+2F62HSvo1SiPa
         HM3+W9OTz1Llisw7QfF9VQDiE7Hc7PKYaRX/uBWQLgpAI3yobkDBKWeGK4fvBB4mamEh
         nS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:content-transfer-encoding:mime-version:user-agent
         :date:message-id:subject:from:to:x-gm-message-state:from:to:cc
         :subject:date;
        bh=necEDBETSaSr9/l7G4QumyIT6nB6UPhHzVoURQAI9PE=;
        b=NbKw0aaEgUdvgrDh2BG0+j1DqZcIagFcErh35Xsouer/mz3qCyK5kQk6uENmFD6s4U
         yPQ9bMyaLAQE3zJQuMN/RXJxxbXMCOJjjSyNe990FJfJRA+bDzyQXiwxvQbMqcX8y0S/
         8fSlPjAQNS096l0lhRVknF+VLIotYZc3g7GoBACYXzZH3n+/R+NIKQxt64JwHz93dMnz
         Cwk9qtI7p/93hHxs9ntrSzgooLMTIr1RnKDql4Tz90XMEFuU3dzXEDd9DHppk5JUBTNP
         Z/2EbAGBqFqYULe77LzwIAtEIiRNTUjHm9G8iw8P0fgTMVuX7FeuIkbRueo03AIXTpIz
         91Uw==
X-Gm-Message-State: ACgBeo09Ak1+z3nZHM9VlnC6X/0EL0pCvdOwxInhbEugsaebXUW1ceEX
	XTeMLnBJk0mKLwTn56hV22ggsTA9TfPWVWJLKa2+GaQ5uf7RLg==
X-Google-Smtp-Source: AA6agR53yMPiShAxEqkBbyNmIBH2FJbyQWqajurD0bD+/47R0uBi7AJBP8vS0IzjJhObQaDJ/Sk0d01shNB7
X-Received: by 2002:a17:90b:4b8f:b0:1fb:10e2:5c99 with SMTP id lr15-20020a17090b4b8f00b001fb10e25c99mr6174660pjb.194.1662672997646;
        Thu, 08 Sep 2022 14:36:37 -0700 (PDT)
Received: from agnus.datazap.net (agnus.datazap.net. [209.160.40.35])
        by smtp-relay.gmail.com with ESMTP id b5-20020a170902d40500b001713e8cceecsm680640ple.121.2022.09.08.14.36.37
        for <linuxppc-dev@lists.ozlabs.org>;
        Thu, 08 Sep 2022 14:36:37 -0700 (PDT)
X-Relaying-Domain: datazap.net
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by agnus.datazap.net (Postfix) with ESMTP id 2CAD5B794B
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 17:36:32 -0400 (EDT)
To: linuxppc-dev@lists.ozlabs.org
From: Al <al@datazap.net>
Subject: OT: LSI mps driver on Big Endian Linux
Message-ID: <46f27c59-8561-ebc2-444c-78edb2e24d5c@datazap.net>
Date: Thu, 8 Sep 2022 16:36:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:60.9) Goanna/4.1
 SpiderMail/52.9.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

I am not sure if this is off topic for this list, but I am not sure 
where else to ask. I google this and could not find anything. Googled 
Big Endian Linux and it took me to link that lead me to this list.

I am looking for an LSI driver that was rewritten for big endian Linux. 
I have trying to get working an LSI 9211-4i card because it is one of 
the only cards that I can find that is PCIe 4x that I can find(most 
cards require an 8x slot). I was using the Ubuntu remix, but have 
recently switched to Fienix. What is interesting is that with the LSI 
9211-4i installed the Ubuntu remix boots fine, but Fienix doesn't see 
any of the other cards after the LSI card. I think there must be a 
solution. I am not 100% sure what is the best big endian Linux to use. I 
am running on an X5000.

Kind Regards,
Al

