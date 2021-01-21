Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 136702FE6F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 11:01:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLybj22rXzDrP5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 21:01:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLyYL5zpJzDqNk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 20:59:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DLyYG3QtFz9v6LB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 10:59:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id I0XrV7X-HrtA for <linuxppc-dev@lists.ozlabs.org>;
 Thu, 21 Jan 2021 10:59:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DLyYG2d5Nz9v6L9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 10:59:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B75A8B7F9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 10:59:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lqP7a_NL8FEy for <linuxppc-dev@lists.ozlabs.org>;
 Thu, 21 Jan 2021 10:59:47 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 56DF98B771
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 10:59:47 +0100 (CET)
Subject: Re: [PATCH 02/13] module: add a module_loaded helper
To: linuxppc-dev@lists.ozlabs.org
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-3-hch@lst.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9052b54a-e05a-1534-9e0f-c73c8b3509bd@csgroup.eu>
Date: Thu, 21 Jan 2021 10:59:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121074959.313333-3-hch@lst.de>
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



Le 21/01/2021 à 08:49, Christoph Hellwig a écrit :
> Add a helper that takes modules_mutex and uses find_module to check if a
> given module is loaded.  This provides a better abstraction for the two
> callers, and allows to unexport modules_mutex and find_module.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/gpu/drm/drm_fb_helper.c |  7 +------
>   include/linux/module.h          |  3 +++
>   kernel/module.c                 | 14 ++++++++++++--
>   kernel/trace/trace_kprobe.c     |  4 +---
>   4 files changed, 17 insertions(+), 11 deletions(-)
> 

> diff --git a/include/linux/module.h b/include/linux/module.h
> index 7a0bcb5b1ffccd..b4654f8a408134 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -589,6 +589,9 @@ static inline bool within_module(unsigned long addr, const struct module *mod)
>   /* Search for module by name: must hold module_mutex. */
>   struct module *find_module(const char *name);
>   
> +/* Check if a module is loaded. */
> +bool module_loaded(const char *name);

Maybe module_is_loaded() would be a better name.
