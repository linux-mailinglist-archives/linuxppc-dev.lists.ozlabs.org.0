Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7613CA3EFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 22:29:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KrgY06vPzDr7s
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 06:29:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="rbZ8hJa3"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KrXV0vZ0zDr7b
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 06:23:38 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46KrXQ3nFMz9v7DV;
 Fri, 30 Aug 2019 22:23:34 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=rbZ8hJa3; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ODbiOs4J1zxq; Fri, 30 Aug 2019 22:23:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46KrXQ2gp9z9v7DT;
 Fri, 30 Aug 2019 22:23:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567196614; bh=UgwxLUs4u6Sh8OD5zo6PgM/AnxALlgnMTsxPNdaKZsE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rbZ8hJa3TCltezr70eDq6/qwUbFCM8AK3bY2SuvEWI4wK9lP77fPooJZaZxT2KKDx
 0gMwAF3PWE/rYyBJrQOrvFHTYKnOPh97G6xw1ZlCuKcIIOiyhldYQMbgxmol4+vsCd
 6Hk7l+gR/dRuXk+WrEJ9W5qc2ub3Thc4AE/vi+Gc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A639E8B911;
 Fri, 30 Aug 2019 22:23:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Nb9esVOMa_TC; Fri, 30 Aug 2019 22:23:34 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 746798B90B;
 Fri, 30 Aug 2019 22:23:33 +0200 (CEST)
Subject: Re: [PATCH v6 5/6] powerpc/64: Make COMPAT user-selectable disabled
 on littleendian by default.
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
References: <cover.1567188299.git.msuchanek@suse.de>
 <a4704404cccb801457aab577781001b28c495233.1567188299.git.msuchanek@suse.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <6e362534-e764-0290-c868-30e4ae542678@c-s.fr>
Date: Fri, 30 Aug 2019 22:23:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a4704404cccb801457aab577781001b28c495233.1567188299.git.msuchanek@suse.de>
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
Cc: David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Nicolai Stange <nstange@suse.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Allison Randal <allison@lohutok.net>, Firoz Khan <firoz.khan@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Christian Brauner <christian@brauner.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/08/2019 à 20:57, Michal Suchanek a écrit :
> On bigendian ppc64 it is common to have 32bit legacy binaries but much
> less so on littleendian.
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>


> ---
> v3: make configurable
> ---
>   arch/powerpc/Kconfig | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 5bab0bb6b833..b0339e892329 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -264,8 +264,9 @@ config PANIC_TIMEOUT
>   	default 180
>   
>   config COMPAT
> -	bool
> -	default y if PPC64
> +	bool "Enable support for 32bit binaries"
> +	depends on PPC64
> +	default y if !CPU_LITTLE_ENDIAN
>   	select COMPAT_BINFMT_ELF
>   	select ARCH_WANT_OLD_COMPAT_IPC
>   	select COMPAT_OLD_SIGACTION
> 
