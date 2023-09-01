Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1F078FBE5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 12:48:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcZX11FDSz3cCM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 20:48:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=astralinux.ru (client-ip=217.74.38.119; helo=mail.astralinux.ru; envelope-from=adiupina@astralinux.ru; receiver=lists.ozlabs.org)
Received: from mail.astralinux.ru (mail.astralinux.ru [217.74.38.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcZWS530gz3bV7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 20:48:19 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 7074F1865E55;
	Fri,  1 Sep 2023 13:48:12 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Zwt2zFeoCraw; Fri,  1 Sep 2023 13:48:12 +0300 (MSK)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 1997618661F0;
	Fri,  1 Sep 2023 13:48:12 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Degb1gD8dMne; Fri,  1 Sep 2023 13:48:12 +0300 (MSK)
Received: from new-mail.astralinux.ru (unknown [10.177.185.103])
	by mail.astralinux.ru (Postfix) with ESMTPS id 020881865797;
	Fri,  1 Sep 2023 13:48:10 +0300 (MSK)
Received: from [10.177.232.93] (unknown [10.177.232.93])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4RcZWG2WbbzgYRv;
	Fri,  1 Sep 2023 13:48:10 +0300 (MSK)
Message-ID: <977826f0-3289-53bd-b3f6-90977a4e0ca0@astralinux.ru>
Date: Fri, 1 Sep 2023 13:48:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH v3] fsl_ucc_hdlc: process the result of hold_open()
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Zhao Qiang <qiang.zhao@nxp.com>
References: <896acfac-fadb-016b-20ff-a06e18edb4d9@csgroup.eu>
 <20230828121235.13953-1-adiupina@astralinux.ru>
 <20230828123849.69466f0a@kernel.org>
From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGA0LAg0JTRjtC/0LjQvdCw?=
 <adiupina@astralinux.ru>
In-Reply-To: <20230828123849.69466f0a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: lvc-project@linuxtesting.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for the review!

28.08.2023 22:38, Jakub Kicinski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Don't you have to undo all the things done prior to hdlc_open()?
Yes, it looks like I really need to undo everything that was done before=20
hdlc_open().
But the question arose - would it be enough to call the uhdlc_close(dev)=20
function?
In addition, it seems to me and my colleagues that a call to=20
hdlc_close(dev) should be added to the uhdlc_close() function, similar=20
to the following functions:
1. drivers/net/wan/n2.c (n2_close function)
2. drivers/net/wan/pc300too.c (pc300_close function)
3. drivers/net/wan/pci200syn.c (pci200_close function)
4. drivers/net/wan/wanxl.c (wanxl_close function)
Tell me, please, are we wrong?
