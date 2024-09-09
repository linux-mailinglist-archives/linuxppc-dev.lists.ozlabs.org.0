Return-Path: <linuxppc-dev+bounces-1183-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D691971C61
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 16:22:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2TZ13kWvz2yNf;
	Tue, 10 Sep 2024 00:22:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725891753;
	cv=none; b=LnoCvcGEFqWShRN3BD2TbyhGS40LbxebJE4w8ZJwFsKLbCKQNDhfYwEvcRuSl9rtRimvtg+kNa+W8qYLhALVGEkq/J6l4uhcg6zGli3ypM4RptBYwgldAUdHrMQs626iU+liefOZK0fC7MxrBcLv7BEDI/ywTipooYwcpkh/xg+vR5zoL0BeJMVPXak04f2ah5h/U9SjfCLx3E4QqUKMY0Ix8tQbH4mpsgYjRXq4678Ko9r8dr7rIw1ttCnWu6PxJ/iVYCoRo5esB95gSflEeFlXwK6xqvROrZ1reYfJerPwNvHQDNACBtypF4lcfoQuVZB5GBlUQ0ssg0CruZzheQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725891753; c=relaxed/relaxed;
	bh=rqBKo/Ibd6OKVcaG/a5zJzoAaeSjy+OGOBgvfET/77s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LjjAao5KRojsK8MRTqfV3XmipBsNouLhLUC7YJg/D894sM7oqM9pm4oEskQ++P1jC/B58ZI50VSv0UwK2icGfvKDciV70S8On+a1qRDDiNYZhXMG41pABDotz11un/ejftG8jj/gcBX3tua0fty7okFTgMP10Tpi0gKD3TOk2I0LV3F94CHR+c2RE6a5HSBdsxdmnT2T++csNPGjGzq/V4wZVvMQuAC1tIUznw+Lu/5jN/kMvvveqZNPOx7xTpizbNOMtjc4v70+I1IBmqLpo2iXWVpNZ3PVco2HGFV9317M9aTJqueYg/ETMj6vjtyxHZ+xZ7QeNbuFLX3flIJl6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2TZ11MKQz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 00:22:31 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X2TYt61ytz9sPd;
	Mon,  9 Sep 2024 16:22:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBxw1cb5WhtA; Mon,  9 Sep 2024 16:22:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X2TYt5JYvz9rvV;
	Mon,  9 Sep 2024 16:22:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A64368B770;
	Mon,  9 Sep 2024 16:22:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4Dyb09wuLbf3; Mon,  9 Sep 2024 16:22:26 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C3AB8B76E;
	Mon,  9 Sep 2024 16:22:26 +0200 (CEST)
Message-ID: <afa6f06a-8d92-4ac1-b5fe-d5b6ade3f740@csgroup.eu>
Date: Mon, 9 Sep 2024 16:22:26 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the powerpc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada
 <masahiroy@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240909200948.70087f49@canb.auug.org.au>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240909200948.70087f49@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/09/2024 à 12:09, Stephen Rothwell a écrit :
> Hi all,
> 
> After merging the powerpc tree, today's linux-next build (powerpc
> ppc44x_defconfig) failed like this:
> 
> make[3]: *** No rule to make target 'arch/powerpc/boot/treeImage.ebony', needed by 'arch/powerpc/boot/zImage'.  Stop.
> make[2]: *** [/home/sfr/next/next/arch/powerpc/Makefile:236: zImage] Error 2
> make[1]: *** [/home/sfr/next/next/Makefile:224: __sub-make] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
> 
> It is not obvious to me what change caused this, so I have just left
> the build  broken for today.
> 

Bisected to commit e6abfb536d16 ("kbuild: split device tree build rules 
into scripts/Makefile.dtbs")

Christophe

