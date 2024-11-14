Return-Path: <linuxppc-dev+bounces-3166-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A7A9C83F8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 08:29:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpsGp0hVvz2yR9;
	Thu, 14 Nov 2024 18:29:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731569362;
	cv=none; b=Jy8njzwaF4Q+1UUEb+929wrbYWjfj85qbSWHPNUrjbbKuZcp0xcvB2/eu3FNFbREQnIhr483OiYY0F8BoKZBXP/7wSobdQU4/wXCsOgToqYZTxjpNd0bLnsNXA3F0TeCZeHkk8hvf+UbG059LoJSuIXLi5e7z/NymzKeYhxQiqcf6OaFnCgBlwr3d+OxxhjS/jbibisU8ckEyXIxdNSzSc9VkuBDPp40+oquxpZ7S7rF0LVUE0i8hlSEGVbP/Gsn0Vy2Q6JEMX3ThFAAjkmYA810gdHrifzZjkx4Br+61qJ4WHrGrmvK/h5k8XSjq0uQidB/9E65rDAg79Qgu3VF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731569362; c=relaxed/relaxed;
	bh=VR74TYei98bSrQK7/WvmE/DuuvG0ys+DGJBbItqBNzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNDo7n7TtpOi6+s9+AiLyqAP7YOoR+88S4PRf9WzYtHbNfbmnu/9l1GwCaq47gOCVwgZq5JPWU4PZjySd8+bk1MsD/X/yjsF1mnMHgzmkuKr6At4SxX7fvxujjQxYjpPgAf8J9uCzreDlZJfy/Q5TfYZZuwMpOCfKG27xM7fQqWieO8ikuGXwhnfX/F/xKnRHxNgL8SpCPMAGdZaCL/wOxsE1DDaxxSypiZOjssFOp3j6uYuchCQ2wmTVdIJZwNVln43uD4+2REHTCxieGNSSuBJTwm9mw6aYyz/zvCl4yURtBTX22OxBKtj0ck9AMgcXA+wCLru87w1qtq6SSA7qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpsGm56fhz2yNB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 18:29:20 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XpsGg3m17z9sSX;
	Thu, 14 Nov 2024 08:29:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DKtl2EFFjzFE; Thu, 14 Nov 2024 08:29:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XpsGg2z42z9sSV;
	Thu, 14 Nov 2024 08:29:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5380E8B7A0;
	Thu, 14 Nov 2024 08:29:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MT9lDctwMwhg; Thu, 14 Nov 2024 08:29:15 +0100 (CET)
Received: from [192.168.232.55] (unknown [192.168.232.55])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E816A8B763;
	Thu, 14 Nov 2024 08:29:14 +0100 (CET)
Message-ID: <bc119f7b-13cd-4f2b-a896-5b8d29b38b05@csgroup.eu>
Date: Thu, 14 Nov 2024 08:29:13 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: Add missing of_node_put() after using
 device_node
To: Zhang Zekun <zhangzekun11@huawei.com>, biwen.li@nxp.com,
 leoyang.li@nxp.com, ran.wang_1@nxp.com, linuxppc-dev@lists.ozlabs.org
Cc: chenjun102@huawei.com, liuyongqiang13@huawei.com,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
References: <20241106071123.49678-1-zhangzekun11@huawei.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241106071123.49678-1-zhangzekun11@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

Le 06/11/2024 à 08:11, Zhang Zekun a écrit :
> of_find_compatible_node() will increase the refcount of the device_node.
> Decrease the refcount once finish using it.
> 
> Fixes: e95f287deed2 ("soc: fsl: handle RCPM errata A-008646 on SoC LS1021A")
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>

Your patch is redundant with 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20241013-rcpm-of_node_put-v1-1-9a8e55a01eae@gmail.com/

Christophe

