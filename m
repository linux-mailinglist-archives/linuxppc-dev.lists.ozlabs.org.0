Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39989253CFF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 06:55:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcVlv5jTnzDqcc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 14:55:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcVdb1g7MzDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 14:49:52 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BcVdQ0gZNz9vCxb;
 Thu, 27 Aug 2020 06:49:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id cV7Z_-qMgMQP; Thu, 27 Aug 2020 06:49:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BcVdP6JY3z9vCxZ;
 Thu, 27 Aug 2020 06:49:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C1CA8B77D;
 Thu, 27 Aug 2020 06:49:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UbmWUCfPH9KB; Thu, 27 Aug 2020 06:49:46 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C91088B75F;
 Thu, 27 Aug 2020 06:49:45 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc: Update documentation of ISA versions for
 Power10
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200827040556.1783-1-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d71a27b8-f12d-7485-23ec-99d36ff1b0ea@csgroup.eu>
Date: Thu, 27 Aug 2020 06:49:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827040556.1783-1-jniethe5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/08/2020 à 06:05, Jordan Niethe a écrit :
> Update the CPU to ISA Version Mapping document to include Power10 and
> ISA v3.1.

Maybe Documentation/powerpc/cpu_families.rst should be updated as well.

Christophe



> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v2: Transactional Memory = No
> ---
>   Documentation/powerpc/isa-versions.rst | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/powerpc/isa-versions.rst b/Documentation/powerpc/isa-versions.rst
> index a363d8c1603c..3873bbba183a 100644
> --- a/Documentation/powerpc/isa-versions.rst
> +++ b/Documentation/powerpc/isa-versions.rst
> @@ -7,6 +7,7 @@ Mapping of some CPU versions to relevant ISA versions.
>   ========= ====================================================================
>   CPU       Architecture version
>   ========= ====================================================================
> +Power10   Power ISA v3.1
>   Power9    Power ISA v3.0B
>   Power8    Power ISA v2.07
>   Power7    Power ISA v2.06
> @@ -32,6 +33,7 @@ Key Features
>   ========== ==================
>   CPU        VMX (aka. Altivec)
>   ========== ==================
> +Power10    Yes
>   Power9     Yes
>   Power8     Yes
>   Power7     Yes
> @@ -47,6 +49,7 @@ PPC970     Yes
>   ========== ====
>   CPU        VSX
>   ========== ====
> +Power10    Yes
>   Power9     Yes
>   Power8     Yes
>   Power7     Yes
> @@ -62,6 +65,7 @@ PPC970     No
>   ========== ====================================
>   CPU        Transactional Memory
>   ========== ====================================
> +Power10    No  (* see Power ISA v3.1 Appendix A.)
>   Power9     Yes (* see transactional_memory.txt)
>   Power8     Yes
>   Power7     No
> 
