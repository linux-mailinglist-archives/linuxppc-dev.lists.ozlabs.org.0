Return-Path: <linuxppc-dev+bounces-1324-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D83A977F8E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 14:15:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4tYw2c2fz2yDY;
	Fri, 13 Sep 2024 22:15:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726229748;
	cv=none; b=bAZviUgwFhG2QUlK0EkHgdt4foBkFd1V0BzHsWd7JBw/1iAC4fDK/iDOxuVKbVRqOrZVk42MNPCUXYC/xTvWxTLdIshzVMag/nFTzsM1nSqRbBhZ+I5sgSFkrluRm5M9T8JZnG0tJ+erThH2d3Aa8GoCsaH3BxhXjG1J6wcsm6ShcVWGmVGcKL5Y1AknFma7L8j+1o2FzJJ3ekwSA8iqpwI2J/l0pebmomokqFys9XmFc4kd3CDmgtRo/JzYLSgBcNsK8By0X7/qFcz8d0xXidyBW7Ji19uO2v0QhTIyDpgUM2gccPY2A+hMVi3LHMPxol5fOGEsnroAUWwa7oGaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726229748; c=relaxed/relaxed;
	bh=667BaxmWMRWun1O3zPLNmlp5WA0pO1e3WCB3fWFv07c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HEEap67osYoF7mfvxUGY4aHXDQ/pE5hX8geLlIfk65TaKikuNXJlV9mdlJ4tfjpPEnhOmNP6jUHX10h0ysvDSy9F23sGWLDtwC+5OMluPS4sJgiS0QjBX8Cl0JbGUeiUMzAVu5pQe+x3mh2w3gKm2q4WE2jC7BCRhiyYTSOd5XWDoHqJevPTAdDGMWoRqkMKwPel10mOxb43xzusgOzb0CsgeyXfrGiTnT8rlz0UMV2L0CG5oIUw4GY7D0gbqqCmS/tKjrig0mmy1N5HvRIBB5tV2bBTDUmU3pJOjs9EPs0m+a6KpZe9I0YNUSpVwIbWAte3CFTtehd4O+crERvwcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4tYw0Db7z2xdw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 22:15:47 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X4tYm6ccqz9sfV;
	Fri, 13 Sep 2024 14:15:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XiImRg9SP39k; Fri, 13 Sep 2024 14:15:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X4tYm5mBbz9sZX;
	Fri, 13 Sep 2024 14:15:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B657B8B77A;
	Fri, 13 Sep 2024 14:15:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id lNQyLDOf4yiZ; Fri, 13 Sep 2024 14:15:40 +0200 (CEST)
Received: from [192.168.233.70] (unknown [192.168.233.70])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5D3688B766;
	Fri, 13 Sep 2024 14:15:40 +0200 (CEST)
Message-ID: <81200b50-eaec-4cfd-9121-f661f3065572@csgroup.eu>
Date: Fri, 13 Sep 2024 14:15:40 +0200
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
Subject: Re: [PATCH 1/2] powerpc/entry: convert to common and generic entry
To: Luming Yu <luming.yu@shingroup.cn>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, npiggin@gmail.com, jialong.yang@shingroup.cn,
 luming.yu@gmail.com
References: <B4ABABEA5F13B86A+20240912082500.1469-1-luming.yu@shingroup.cn>
 <fc509bcd-5ca0-4dc2-962e-766a01cbe4fb@csgroup.eu>
 <153FD6B5CE4F97D9+ZuOYDQ-iHIIwJjbh@HX09040029.powercore.com.cn>
 <95ced963-b584-4ccf-ba34-8f2ba99172f4@csgroup.eu>
 <0332BAE1905768B6+ZuPsBvgv0nwmFAjW@HX09040029.powercore.com.cn>
 <854eef54-4779-4233-a958-0c98ae5fcb7e@csgroup.eu>
 <F81D1486B7B82141+ZuQp4YQkAA2cB9Rw@HX09040029.powercore.com.cn>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <F81D1486B7B82141+ZuQp4YQkAA2cB9Rw@HX09040029.powercore.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 13/09/2024 à 14:02, Luming Yu a écrit :

>> ...
>> nothing happens after that.
> reproduced with ppc64_defconfig
> [    0.818972][    T1] Run /init as init process
> [    5.851684][  T240] request_module: modprobe binfmt-4c46 cannot be processed, kmod busy with 50 threads for more than 5 seconds now
> [    5.851742][  T240] kworker/u33:18 (240) used greatest stack depth: 13584 bytes left
> [    5.860081][  T232] kworker/u33:16 (232) used greatest stack depth: 13072 bytes left
> [    5.863145][  T210] kworker/u35:13 (210) used greatest stack depth: 12928 bytes left
> [    5.865000][    T1] Failed to execute /init (error -8)
> [    5.868897][    T1] Run /sbin/init as init process
> [   10.891673][  T315] request_module: modprobe binfmt-4c46 cannot be processed, kmod busy with 50 threads for more than 5 seconds now
> [   10.894036][    T1] Starting init: /sbin/init exists but couldn't execute it (error -8)
> [   10.901455][    T1] Run /etc/init as init process
> [   10.903154][    T1] Run /bin/init as init process
> [   10.904747][    T1] Run /bin/sh as init process
> [   15.931679][  T367] request_module: modprobe binfmt-4c46 cannot be processed, kmod busy with 50 threads for more than 5 seconds now
> [   15.934689][    T1] Starting init: /bin/sh exists but couldn't execute it (error -8)

That's something different, this is because you built a big-endian 
kernel and you are trying to run a little-endian userspace.

Does it work with ppc64le_defconfig ?

On my side there is absolutely nothing happening after the last line, 
the screen remains steady.


Christophe

