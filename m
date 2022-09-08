Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0825B14E1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 08:43:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNV1l2Dzhz3c6B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 16:43:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNV1L5KkZz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 16:42:44 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MNV1F3G4Zz9shS;
	Thu,  8 Sep 2022 08:42:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZRoIOsfxZ4l; Thu,  8 Sep 2022 08:42:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MNV1F2Fwbz9sfJ;
	Thu,  8 Sep 2022 08:42:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 36F248B78B;
	Thu,  8 Sep 2022 08:42:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 7M4xRQDFRu1Q; Thu,  8 Sep 2022 08:42:41 +0200 (CEST)
Received: from [192.168.232.247] (unknown [192.168.232.247])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D4E0E8B763;
	Thu,  8 Sep 2022 08:42:40 +0200 (CEST)
Message-ID: <65b3c3f4-78ba-8051-b5d9-12fe7081a6ed@csgroup.eu>
Date: Thu, 8 Sep 2022 08:42:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/1] arch/powerpc: Don't assume start_text & head_end
 align
Content-Language: fr-FR
To: Alastair D'Silva <alastair@au1.ibm.com>, Nick Piggin <npiggin@gmail.com>
References: <20190313033852.13028-1-alastair@au1.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20190313033852.13028-1-alastair@au1.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org, Alastair D'Silva <alastair@d-silva.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/03/2019 à 04:38, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> When building LTO kernels, the start_text symbol is not guaranteed to mark
> the end of the head section.
> 
> Instead, look explicitly for __head_end.

Could you please give more details ?

Have you encountered a problem ?

 From commit c494adefef9f ("powerpc/64: Tool to check head sections 
location sanity"), I understand that we want to make sure text_start is 
where it is, not that __head_end is.

Thanks
Christophe


> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>   arch/powerpc/tools/head_check.sh | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/tools/head_check.sh b/arch/powerpc/tools/head_check.sh
> index ad9e57209aa4..1b0f634038c3 100644
> --- a/arch/powerpc/tools/head_check.sh
> +++ b/arch/powerpc/tools/head_check.sh
> @@ -44,7 +44,7 @@ nm="$1"
>   vmlinux="$2"
>   
>   # gcc-4.6-era toolchain make _stext an A (absolute) symbol rather than T
> -$nm "$vmlinux" | grep -e " [TA] _stext$" -e " t start_first_256B$" -e " a text_start$" -e " t start_text$" -m4 > .tmp_symbols.txt
> +$nm "$vmlinux" | grep -e " [TA] _stext$" -e " t start_first_256B$" -e " a text_start$" -e " T __head_end$" -m4 > .tmp_symbols.txt
>   
>   
>   vma=$(cat .tmp_symbols.txt | grep -e " [TA] _stext$" | cut -d' ' -f1)
> @@ -63,12 +63,12 @@ fi
>   
>   top_vma=$(echo $vma | cut -d'0' -f1)
>   
> -expected_start_text_addr=$(cat .tmp_symbols.txt | grep " a text_start$" | cut -d' ' -f1 | sed "s/^0/$top_vma/")
> +expected_head_end_addr=$(cat .tmp_symbols.txt | grep " a text_start$" | cut -d' ' -f1 | sed "s/^0/$top_vma/")
>   
> -start_text_addr=$(cat .tmp_symbols.txt | grep " t start_text$" | cut -d' ' -f1)
> +head_end_addr=$(cat .tmp_symbols.txt | grep " T __head_end$" | cut -d' ' -f1)
>   
> -if [ "$start_text_addr" != "$expected_start_text_addr" ]; then
> -	echo "ERROR: start_text address is $start_text_addr, should be $expected_start_text_addr"
> +if [ "$head_end_addr" != "$expected_head_end_addr" ]; then
> +	echo "ERROR: __head_end address is $head_end_addr, should be $expected_head_end_addr"
>   	echo "ERROR: try to enable LD_HEAD_STUB_CATCH config option"
>   	echo "ERROR: see comments in arch/powerpc/tools/head_check.sh"
>   
