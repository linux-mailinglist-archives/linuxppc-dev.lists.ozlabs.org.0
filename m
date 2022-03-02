Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CB64CA9C3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 17:01:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7zQ446GGz3c79
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 03:01:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7zPb1vpgz3bpF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 03:01:20 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K7zPT6j7cz9sSR;
 Wed,  2 Mar 2022 17:01:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5joybHOP63Sd; Wed,  2 Mar 2022 17:01:17 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K7zNw1930z9sSW;
 Wed,  2 Mar 2022 17:00:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 176128B76D;
 Wed,  2 Mar 2022 17:00:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id n6gNmIVrwo7d; Wed,  2 Mar 2022 17:00:48 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C675B8B763;
 Wed,  2 Mar 2022 17:00:47 +0100 (CET)
Message-ID: <b89a2255-fb3c-a834-2565-33303645c51e@csgroup.eu>
Date: Wed, 2 Mar 2022 17:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC 0/2] Add generic FPU api similar to x86
Content-Language: fr-FR
To: Anson Jacob <Anson.Jacob@amd.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 amd-gfx@lists.freedesktop.org
References: <20210719195211.520428-1-Anson.Jacob@amd.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20210719195211.520428-1-Anson.Jacob@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Sunpeng.Li@amd.com, Harry.Wentland@amd.com, qingqing.zhuo@amd.com,
 Rodrigo.Siqueira@amd.com, roman.li@amd.com, Aurabindo.Pillai@amd.com,
 Bhawanpreet.Lakha@amd.com, bindu.r@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/07/2021 à 21:52, Anson Jacob a écrit :
> This is an attempt to have generic FPU enable/disable
> calls similar to x86.
> So that we can simplify gpu/drm/amd/display/dc/os_types.h

Seems like gpu/drm/amd/display/dc/os_types.h has been simplified through 
another way via commit 96ee63730fa3 ("drm/amd/display: Add control 
mechanism for FPU")

Are powerpc changes in patch 1 still relevant ? In that case please rebase.

> 
> Also adds FPU correctness logic seen in x86.
> 
> Anson Jacob (2):
>    ppc/fpu: Add generic FPU api similar to x86
>    drm/amd/display: Use PPC FPU functions
> 
>   arch/powerpc/include/asm/switch_to.h      |  29 ++---
>   arch/powerpc/kernel/process.c             | 130 ++++++++++++++++++++++
>   drivers/gpu/drm/amd/display/dc/os_types.h |  28 +----
>   3 files changed, 139 insertions(+), 48 deletions(-)
> 
