Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5B21CCCE5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 20:28:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ksxq6VX8zDqnT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 04:27:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=212.227.17.11; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=SNeKABVU; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Ksw474yVzDqkD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 04:26:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1589135158;
 bh=sxzMtL7guMndw1WIStOvdk6GLCOWD5cwPF+nRXge9Ho=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=SNeKABVU0Dc8WAoVsbObnS6bZn+m2rtSp4wGN7BKPZmLYTf2uiyE/y7FSzgFofLO3
 K9HQEk96uPWH0DPTQGejZT2O+Mrn6sXnBeiTtqbhX5+3wrCJcCUDPb+dBza/4zbQko
 vsY9YrkeabvKxPDJGl+kf6u8EJuVCSva+xTLgSGo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.31.72]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LnB1F-1itaHL2wW5-00hM76; Sun, 10
 May 2020 20:25:58 +0200
Subject: Re: [PATCH v2 5/9] net/ps3_gelic_net: Remove duplicate error message
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman
 <mpe@ellerman.id.au>, "David S. Miller" <davem@davemloft.net>,
 linuxppc-dev@lists.ozlabs.org
References: <cover.1589049250.git.geoff@infradead.org>
 <ba4bea4da97308c804fd3a0fae3773dde27b20ce.1589049250.git.geoff@infradead.org>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <1b7a1261-5dd9-b636-e81a-137950571de3@web.de>
Date: Sun, 10 May 2020 20:25:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ba4bea4da97308c804fd3a0fae3773dde27b20ce.1589049250.git.geoff@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
X-Provags-ID: V03:K1:ASmdjQfbLpAnCpocleSd4txlBglWh33x7znxkl/X++4upih8KZd
 /hSDWOmrthQkzo0fJ2yPV8VWSYPsyTKBpKRez8KLddRdQXWmn60PmT99rwV2lLvL/Eyg5kB
 0Gg4kFzOBRtgcBgrH0eZ+So/xBOwhXL9NDRFmKx/rXnwxXbjYrLPjSU9D4tYF31lLqrf0XQ
 Lrk22c8HFXADoxUvbKvyw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:l+N9UcaD0iU=:hz1cRaIUIA1pmMVw3fTYnu
 KS7aiRKmBftSeV3R6fWhc1H3q5OTh/AmJsw5RAp0YqR3xKLJiOMS451Aj09jlAsZuxFfOOOY3
 5ZCiawSKMgtNQdQEItfwTKJBt5khQ2g8DbkTuqZyTETyPs2ITWCvWXGaIf+XdNYrAqhOveQu2
 xNQv6T74kNdHfKE5LJHXLBCZNDMYF4eopHjYov4fYoEASbHwaLE+dzT8cqisZwNCaztmvuyVG
 kPCOMztgYZ+wvRcKZYnBn2x/yf/MQx6XvEht1mu/M/mBCtRBUqzAF3rPOnzg7zqapyN1SIbTw
 z1Amtti6OTojX1dJIHTN3lK4iEyGUEEBB8Yud60i1ro/FUyGCwpbVh2YMQvKJ7h4MpuJit6Ib
 7zhdlvVw08359Doz9EaVRtNY8b4dQX5TyxC5SZz9rYFOQR4iQCSSce5pWyCAF2pig3iLTKW6z
 hwD3hKgILBe4jWStEiqt+Q7vZ1l8rnV7wC6Ezdg8WH6gaZkNWSUF4038Zd7QG3nslXuczmt/3
 RvPFimzQmJ4qC6HUDGpt2m1dsRQMLkjfFRWcBVjvivHmo5vxFvpAW23GRL1CzS5Yr8d7cNEPb
 A27Slf76GRjnqeBjBdCn4c3fwwfTgRKTbtqzDWXV+NrkPf3iEXcBAuXZaiHy9+/1hKxDaRbt6
 RzG4BzLdhDylk92CxkATQnwC8yWFcGFjtccR5X2iVb9pgCoCE8GCARX4zmLJ0sRMwxF9R6t8B
 kazVcmsDu+W8atvAvNOsB8xaiYlhQcVuaC2bqHCeM7DazJ5nEE77spOEnBQY0TqZ+mYU9Vocg
 Fz65a3wWpw4ahKPbhMOBLl67inNzeehMSZ4VO0GfjMOJE3F4NKM3SYEk39GUHihxuh5D9ed39
 tE5UdQxaHQvZ2ndpN2/dY/T1OzmbX+J2XF4RQQBKcZRnX72eSHGo65FG8v1mZTBazWZuBPxQM
 BLcUD8TgLfYKmgdorz5ph2vsy3WYknv/VQtBPicMzW5OMM2Dy86MXavs12BF1hHaNdAhxaUh6
 NJt81NDYatiiX5YsqYZNXeYuBPYR6Wzq2yvtuGyer4OrXJSoe6JeWJC3HrPs0z9l6cG/TZfGJ
 0Rfs+SlEmrkOiN7ageFNiPVHFzO5EWHp3aHoxqc18iXlgJ2aEv5ZtiVO6tBCX6bEHxjs6CE6J
 fqE6SkRNCAryZE9I7Yh3h6rcQ/tLWUKUWqr9u9pfFTOmzAKb7ijr5HbShjosL+ORK2F+eewJc
 2KaekfdN4+nd1CfyV
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Remove an extra message for a memory allocation failure in
> function gelic_descr_prepare_rx().

Will another background information be relevant for the final commit message?

ps3_gelic_net: Delete an error message for a failed memory allocation in gelic_descr_prepare_rx()
https://lore.kernel.org/linuxppc-dev/9613bfbf-11cc-1e66-484a-84fcda022861@users.sourceforge.net/
https://lore.kernel.org/patchwork/patch/869518/
https://lkml.org/lkml/2018/1/3/365

Regards,
Markus
