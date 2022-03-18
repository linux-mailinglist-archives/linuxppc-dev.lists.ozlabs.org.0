Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CAA4DDF9A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 18:07:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKr6s0x8Yz3bfB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 04:07:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKr6Q3lVrz2yh9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Mar 2022 04:07:23 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KKr6G1H8xz9sSK;
 Fri, 18 Mar 2022 18:07:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vOU920Q058wl; Fri, 18 Mar 2022 18:07:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KKr6G0Wssz9sRw;
 Fri, 18 Mar 2022 18:07:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 008608B78D;
 Fri, 18 Mar 2022 18:07:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DroGydVWazWJ; Fri, 18 Mar 2022 18:07:17 +0100 (CET)
Received: from [192.168.202.177] (unknown [192.168.202.177])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 93D838B767;
 Fri, 18 Mar 2022 18:07:17 +0100 (CET)
Message-ID: <0fcfca14-1096-c7fb-b174-b4eabbb18b9f@csgroup.eu>
Date: Fri, 18 Mar 2022 18:07:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] macintosh: windfarm: Use NULL to compare with
 pointer-typed value rather than 0
Content-Language: fr-FR
To: Xu Wang <vulab@iscas.ac.cn>, benh@kernel.crashing.org,
 linuxppc-dev@lists.ozlabs.org
References: <20201113073343.64378-1-vulab@iscas.ac.cn>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20201113073343.64378-1-vulab@iscas.ac.cn>
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/11/2020 à 08:33, Xu Wang a écrit :
> Compare pointer-typed values to NULL rather than 0.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

If we are going to change that, let's do it right at once

Checkpatch says:

CHECK: Comparison to NULL could be written "!hdr"
#25: FILE: drivers/macintosh/windfarm_pm121.c:653:
+	if (hdr == NULL) {

CHECK: Comparison to NULL could be written "hdr"
#34: FILE: drivers/macintosh/windfarm_pm121.c:972:
+	if (hdr != NULL) {

total: 0 errors, 0 warnings, 2 checks, 16 lines checked



> ---
>   drivers/macintosh/windfarm_pm121.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/macintosh/windfarm_pm121.c b/drivers/macintosh/windfarm_pm121.c
> index ab467b9c31be..62826844b584 100644
> --- a/drivers/macintosh/windfarm_pm121.c
> +++ b/drivers/macintosh/windfarm_pm121.c
> @@ -650,7 +650,7 @@ static void pm121_create_cpu_fans(void)
>   
>   	/* First, locate the PID params in SMU SBD */
>   	hdr = smu_get_sdb_partition(SMU_SDB_CPUPIDDATA_ID, NULL);
> -	if (hdr == 0) {
> +	if (hdr == NULL) {
>   		printk(KERN_WARNING "pm121: CPU PID fan config not found.\n");
>   		goto fail;
>   	}
> @@ -969,7 +969,7 @@ static int pm121_init_pm(void)
>   	const struct smu_sdbp_header *hdr;
>   
>   	hdr = smu_get_sdb_partition(SMU_SDB_SENSORTREE_ID, NULL);
> -	if (hdr != 0) {
> +	if (hdr != NULL) {
>   		struct smu_sdbp_sensortree *st =
>   			(struct smu_sdbp_sensortree *)&hdr[1];
>   		pm121_mach_model = st->model_id;
