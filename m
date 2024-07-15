Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B493930E2B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 08:37:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMsvJ1BNfz3dBp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 16:37:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMstv2vF9z30Wl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 16:37:09 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WMstl0Wtcz9sSK;
	Mon, 15 Jul 2024 08:37:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oazn0T8e1H3x; Mon, 15 Jul 2024 08:37:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WMstk6rR7z9sSH;
	Mon, 15 Jul 2024 08:37:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DABB08B76C;
	Mon, 15 Jul 2024 08:37:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id pOSQDiM8HNmP; Mon, 15 Jul 2024 08:37:02 +0200 (CEST)
Received: from [192.168.233.202] (unknown [192.168.233.202])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5EA3A8B763;
	Mon, 15 Jul 2024 08:37:02 +0200 (CEST)
Message-ID: <4cad3dc8-f7b8-4771-ad04-f3524bc03340@csgroup.eu>
Date: Mon, 15 Jul 2024 08:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] MAINTAINERS: Update powerpc BPF JIT maintainers
To: Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org
References: <fb6ef126771c70538067709af69d960da3560ce7.1720944897.git.naveen@kernel.org>
 <24fea21d9d4458973aadd6a02bb1bf558b8bd0b2.1720944897.git.naveen@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <24fea21d9d4458973aadd6a02bb1bf558b8bd0b2.1720944897.git.naveen@kernel.org>
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/07/2024 à 10:34, Naveen N Rao a écrit :
> Hari Bathini has been updating and maintaining the powerpc BPF JIT since
> a while now. Christophe Leroy has been doing the same for 32-bit
> powerpc. Add them as maintainers for the powerpc BPF JIT.
> 
> I am no longer actively looking into the powerpc BPF JIT. Change my role
> to that of a reviewer so that I can help with the odd query.
> 
> Signed-off-by: Naveen N Rao <naveen@kernel.org>

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   MAINTAINERS | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 05f14b67cd74..c7a931ee7a2e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3878,8 +3878,10 @@ S:	Odd Fixes
>   F:	drivers/net/ethernet/netronome/nfp/bpf/
>   
>   BPF JIT for POWERPC (32-BIT AND 64-BIT)
> -M:	Naveen N Rao <naveen@kernel.org>
>   M:	Michael Ellerman <mpe@ellerman.id.au>
> +M:	Hari Bathini <hbathini@linux.ibm.com>
> +M:	Christophe Leroy <christophe.leroy@csgroup.eu>
> +R:	Naveen N Rao <naveen@kernel.org>
>   L:	bpf@vger.kernel.org
>   S:	Supported
>   F:	arch/powerpc/net/
