Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1431177FE53
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 21:06:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=V/nPTGXx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRZGj5LDNz3cRs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 05:06:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=V/nPTGXx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRZFp1yM3z3c8L
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 05:05:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1692299070; x=1692903870; i=deller@gmx.de;
 bh=R6FahYjMjq3IcNebCctTGPYLvIg8dED0+aUfIoATJT8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=V/nPTGXx4qnZHiHLKJxJ+6MDcixcr6nO88bdvihvvSn61dUJlJrTgmmJG1VUBNu7qXdA2F4
 ocyNUy0Ote/HT7BKAQYx3yhn1zuTDr+03SgnqeHcZZvoJiospwqYiHNUu1+uOd3lwmE2FyG/1
 JdBiKqC5OP6CkazPdGAbr0qLXKpfnJW4oN10A0+bePVhRm7HQdHg6x4lm5jCCkBa6d1/YElU9
 K68porNruNJfBJajKRNnHz+HZgX370VbaDuzUhojW6X/E1eE4BfMQ2l1qsA+7R40ojg4R0HeR
 fvymJiAf85odG8TNMCMcGOvFAkvYYA4YXbXqZAl2uLotUp0kLxfg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.151.122]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxUs7-1pZfYF1qTB-00xqnP; Thu, 17
 Aug 2023 21:04:30 +0200
Message-ID: <133d22a6-5fd2-49a0-50f4-7018397bdcef@gmx.de>
Date: Thu, 17 Aug 2023 21:04:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/9] parisc: Remove <asm/ide.h>
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Russell King <linux@armlinux.org.uk>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Damien Le Moal <dlemoal@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <cover.1692288018.git.geert@linux-m68k.org>
 <5ea78d9c54cf94c6074fde6f277bb7a08bfe8d08.1692288018.git.geert@linux-m68k.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <5ea78d9c54cf94c6074fde6f277bb7a08bfe8d08.1692288018.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4pBi3eR0csmxEpYzr6TBmDopGdzbTBAizNpH1Rem4KR3poYpXQI
 0bdxkebh5IacK/CSmBcrqu4JrCZwQxeaz2/xVLtVO1CNMkstItNM1OsvbKu8n5HO0aU9KdV
 ITzVZMGJOyd8Yn9W2TS+gsJWBkvNbMPQNCpb4JRz39clTnhcHp/Vzt2cToyxJwHnh+OjSkA
 luurJWY1Iwl8wsV+jfp6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:H8A+9oAUqKU=;PMueJpoedjum8wcq5H4m9VrHYDl
 UJH7dvM78TjuIQ0xddxpyrzHvGuUe8Svfmu9hW9LQiBBNDyRctpJvn9jIgaoAcEmCeq1pKdB/
 mjnXH4RAagHgr5Zm1Ti2zoHJy0pe1bcJ/WsfOsjwNTIr7cUnvLCFF4hPdyL0TYOcHlmXnEn19
 isgLeFVo6O1B1MoCivuSY3bKCjnnKH5N+fKOqrQtNxopnptx2gSBBqrPGOS6zMKHizoXDiWj7
 lCqiPNLaJudv09rTK1vaFvtUqhm0GSvU8FV+S53b2LVTv3T6ab/GFjW4PTR0k4vFBlrCFUrfI
 9D0VNcdljK1iN7yw8cqCxYX0p6KJ7FQKeQC4sXT79+NxFhUV17sZ6zCMBgsni0HklD8Wwpg0S
 8qwpJkoovAcmdYPaPtRlRkqVJ3Mn8N6oXjLdAUktx7tsh5sDY9mkOTaeaHH5aGFRtBlNsXXd+
 BxBEPPvLbYlRSJI9JcrN46U2NzdBVM0LTOPvJ7UGMaE/ksWWkSBUEP8Xlvjfj036aWfCeZm7c
 GgH+gwuYyV4cNVhyCjs7b2Hu0PPRjnK9EM91zTAWop5zIbCBf31RpVHc4AAHOpWGN1a6o0VKR
 cdCDHt451NC8sArgYu/rRMdPforNd0eKR91ZR5TbKIYdrmxdZ0lCW5+fVSvRbQJfSzY4E44fD
 hRaX+CsTbuUGgdYkhjOWF/RqFpfQnbcFEEy+Hzs9+cm+2Z/IMzooL3IxTsynZNS8fnQF0bPL3
 BtUjCSxaNvarpYnZmaJdGiFHq8E07rdx/GtKz4mTDJxI0JDHO9znm1Mpgf9TziyrxTQECP3aC
 K/Gm84l8dT25UjjwRgK8hSXDAewvI+QVwktwgPJ/Q/Qk4+o4gSkqAlDp0ctojvIIkv8QZHmRH
 wLOejEMElPdexgLDQPXTpJPh5VdnJ64eICFUjGKXeu1paR2DB7crFIRymHip2kq6tKWHQxZBZ
 sZtImOr5UBCG1Tlwbysh7f93k3k=
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
Cc: linux-arch@vger.kernel.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/17/23 18:07, Geert Uytterhoeven wrote:
> As of commit b7fb14d3ac63117e ("ide: remove the legacy ide driver") in
> v5.14, there are no more generic users of <asm/ide.h>.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Helge Deller <deller@gmx.de>

Thanks!
Helge

> ---
>   arch/parisc/include/asm/ide.h | 54 -----------------------------------
>   1 file changed, 54 deletions(-)
>   delete mode 100644 arch/parisc/include/asm/ide.h
>

