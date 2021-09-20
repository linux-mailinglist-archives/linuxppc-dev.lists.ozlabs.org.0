Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 214CC4129AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 02:00:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HD1l3011yz2ywQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 09:59:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=J6xRV59f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=J6xRV59f; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HD1kK6bXfz2xtv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 09:59:20 +1000 (AEST)
Received: by mail-qk1-x733.google.com with SMTP id 194so23714302qkj.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 16:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PJwjX73JYKV9t9f8SoLKn1biPMZfh2t94QAGweKOUQ8=;
 b=J6xRV59fdPXwnzcGWk7GOhxdG9h79Tij8ZcKGnBr0jnkLNSt6L5v+aLaScNAJeSywb
 Blp6zwyDb8eTZtaq0ZTQfGWGHHGJwPxrdIBnf2lA1fQEWANH/p3BVcjwgaD1+QUmue0y
 THVgJBRMzrzQkdFseht1oquuIEJPNzQx/KMHV3BxroH+u0p3bJb21hHmKuGWzYyaqbAH
 kk+z3WQd03u511iBNBXJh0g1U4UxaKvZFyyKuhVNKtqR+uBsnKyPkjJm8S5FT1LKsluq
 srarfqNaXZEYaJPdRdISuHNpxtOzH72qsCm/eXV+j1aaqZledjb3lfcL3730pZfaeXKK
 2o+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PJwjX73JYKV9t9f8SoLKn1biPMZfh2t94QAGweKOUQ8=;
 b=j4hLeedn/wwISTK1mY/hnP/ZkLwzrOgVW8Wc8/XOiFasH34ZnpWoze9b8TkP9OAX1B
 /wHCxFVjA8w4OXI5/WKj1Sy/TF+GD5pjzPbroio8QIFMiMTPiQbEjjCCB40CCBtjHTn6
 3llw0L5wCT8Peeo4dvsTJ5OO176vjuRchpPfF12u1b2m3ak7zrWHW4Sk3uB5cwc6P9kI
 4CsaNmmG4m6WsX7PYmBy6Sf/htTOZKjqbbk10DnSMpvJ+pYhy9wfwtdS6H0cjITc1y3s
 0ZviOW5Oi9RBc8OuaSNn47iSHlJBfzYGyBHKAImJLfYPf2I0abwdHoA3G/sECokWdYN4
 RpDw==
X-Gm-Message-State: AOAM5305PsE5CAHqNwtA3G80nj5sYndYeC9IsBW6iCcg1daSAYzq4b+I
 n/8hH7iEDFkI4Xt0726qvng=
X-Google-Smtp-Source: ABdhPJwlvxyoI6n7vVrps5ghW/rtjuASaByIsYqRvElpb302FsCHuvbQECmPaJ7/6sJKN4RjPj9tpQ==
X-Received: by 2002:a05:620a:2a07:: with SMTP id
 o7mr27112420qkp.213.1632182357316; 
 Mon, 20 Sep 2021 16:59:17 -0700 (PDT)
Received: from [192.168.10.222] ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id l7sm10028716qth.19.2021.09.20.16.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 16:59:17 -0700 (PDT)
Message-ID: <cda485ea-9cc8-754d-30ec-3ed9e2befb6a@gmail.com>
Date: Mon, 20 Sep 2021 20:59:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/3] powerpc/pseries/cpuhp: cache node corrections
Content-Language: en-US
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210920135504.1792219-1-nathanl@linux.ibm.com>
 <20210920135504.1792219-2-nathanl@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20210920135504.1792219-2-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: tyreld@linux.ibm.com, ldufour@linux.ibm.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/20/21 10:55, Nathan Lynch wrote:
> On pseries, cache nodes in the device tree can be added and removed by the
> CPU DLPAR code as well as the partition migration (mobility) code. PowerVM
> partitions in dedicated processor mode typically have L2 and L3 cache
> nodes.
> 
> The CPU DLPAR code has the following shortcomings:
> 
> * Cache nodes returned as siblings of a new CPU node by
>    ibm,configure-connector are silently discarded; only the CPU node is
>    added to the device tree.
> 
> * Cache nodes which become unreferenced in the processor removal path are
>    not removed from the device tree. This can lead to duplicate nodes when
>    the post-migration device tree update code replaces cache nodes.
> 
> This is long-standing behavior. Presumably it has gone mostly unnoticed
> because the two bugs have the property of obscuring each other in common
> simple scenarios (e.g. remove a CPU and add it back). Likely you'd notice
> only if you cared to inspect the device tree or the sysfs cacheinfo
> information.
> 
> Booted with two processors:
> 
>    $ pwd
>    /sys/firmware/devicetree/base/cpus
>    $ ls -1d */
>    l2-cache@2010/
>    l2-cache@2011/
>    l3-cache@3110/
>    l3-cache@3111/
>    PowerPC,POWER9@0/
>    PowerPC,POWER9@8/
>    $ lsprop */l2-cache
>    l2-cache@2010/l2-cache
>                   00003110 (12560)
>    l2-cache@2011/l2-cache
>                   00003111 (12561)
>    PowerPC,POWER9@0/l2-cache
>                   00002010 (8208)
>    PowerPC,POWER9@8/l2-cache
>                   00002011 (8209)
>    $ ls /sys/devices/system/cpu/cpu0/cache/
>    index0  index1  index2  index3
> 
> After DLPAR-adding PowerPC,POWER9@10, we see that its associated cache
> nodes are absent, its threads' L2+L3 cacheinfo is unpopulated, and it is
> missing a cache level in its sched domain hierarchy:
> 
>    $ ls -1d */
>    l2-cache@2010/
>    l2-cache@2011/
>    l3-cache@3110/
>    l3-cache@3111/
>    PowerPC,POWER9@0/
>    PowerPC,POWER9@10/
>    PowerPC,POWER9@8/
>    $ lsprop PowerPC\,POWER9@10/l2-cache
>    PowerPC,POWER9@10/l2-cache
>                   00002012 (8210)
>    $ ls /sys/devices/system/cpu/cpu16/cache/
>    index0  index1
>    $ grep . /sys/kernel/debug/sched/domains/cpu{0,8,16}/domain*/name
>    /sys/kernel/debug/sched/domains/cpu0/domain0/name:SMT
>    /sys/kernel/debug/sched/domains/cpu0/domain1/name:CACHE
>    /sys/kernel/debug/sched/domains/cpu0/domain2/name:DIE
>    /sys/kernel/debug/sched/domains/cpu8/domain0/name:SMT
>    /sys/kernel/debug/sched/domains/cpu8/domain1/name:CACHE
>    /sys/kernel/debug/sched/domains/cpu8/domain2/name:DIE
>    /sys/kernel/debug/sched/domains/cpu16/domain0/name:SMT
>    /sys/kernel/debug/sched/domains/cpu16/domain1/name:DIE
> 
> When removing PowerPC,POWER9@8, we see that its cache nodes are left
> behind:
> 
>    $ ls -1d */
>    l2-cache@2010/
>    l2-cache@2011/
>    l3-cache@3110/
>    l3-cache@3111/
>    PowerPC,POWER9@0/
> 
> When DLPAR is combined with VM migration, we can get duplicate nodes. E.g.
> removing one processor, then migrating, adding a processor, and then
> migrating again can result in warnings from the OF core during
> post-migration device tree updates:
> 
>    Duplicate name in cpus, renamed to "l2-cache@2011#1"
>    Duplicate name in cpus, renamed to "l3-cache@3111#1"
> 
> and nodes with duplicated phandles in the tree, making lookup behavior
> unpredictable:
> 
>    $ lsprop l[23]-cache@*/ibm,phandle
>    l2-cache@2010/ibm,phandle
>                     00002010 (8208)
>    l2-cache@2011#1/ibm,phandle
>                     00002011 (8209)
>    l2-cache@2011/ibm,phandle
>                     00002011 (8209)
>    l3-cache@3110/ibm,phandle
>                     00003110 (12560)
>    l3-cache@3111#1/ibm,phandle
>                     00003111 (12561)
>    l3-cache@3111/ibm,phandle
>                     00003111 (12561)
> 
> Address these issues by:
> 
> * Correctly processing siblings of the node returned from
>    dlpar_configure_connector().
> * Removing cache nodes in the CPU remove path when it can be determined
>    that they are not associated with other CPUs or caches.
> 
> Use the of_changeset API in both cases, which allows us to keep the error
> handling in this code from becoming more complex while ensuring that the
> device tree cannot become inconsistent.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Fixes: ac71380 ("powerpc/pseries: Add CPU dlpar remove functionality")
> Fixes: 90edf18 ("powerpc/pseries: Add CPU dlpar add functionality")
> ---
>   arch/powerpc/platforms/pseries/hotplug-cpu.c | 72 +++++++++++++++++++-
>   1 file changed, 70 insertions(+), 2 deletions(-)

Tested with a QEMU pseries guest, multiple CPU add/removals of the same CPU,
and no issues found with these new pseries_cpuhp* functions.

Code LGTM as well.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>




> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index d646c22e94ab..87a0fbe9cf12 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -521,6 +521,27 @@ static bool valid_cpu_drc_index(struct device_node *parent, u32 drc_index)
>   	return found;
>   }
>   
> +static int pseries_cpuhp_attach_nodes(struct device_node *dn)
> +{
> +	struct of_changeset cs;
> +	int ret;
> +
> +	/*
> +	 * This device node is unattached but may have siblings; open-code the
> +	 * traversal.
> +	 */
> +	for (of_changeset_init(&cs); dn != NULL; dn = dn->sibling) {
> +		ret = of_changeset_attach_node(&cs, dn);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	ret = of_changeset_apply(&cs);
> +out:
> +	of_changeset_destroy(&cs);
> +	return ret;
> +}
> +
>   static ssize_t dlpar_cpu_add(u32 drc_index)
>   {
>   	struct device_node *dn, *parent;
> @@ -563,7 +584,7 @@ static ssize_t dlpar_cpu_add(u32 drc_index)
>   		return -EINVAL;
>   	}
>   
> -	rc = dlpar_attach_node(dn, parent);
> +	rc = pseries_cpuhp_attach_nodes(dn);
>   
>   	/* Regardless we are done with parent now */
>   	of_node_put(parent);
> @@ -600,6 +621,53 @@ static ssize_t dlpar_cpu_add(u32 drc_index)
>   	return rc;
>   }
>   
> +static unsigned int pseries_cpuhp_cache_use_count(const struct device_node *cachedn)
> +{
> +	unsigned int use_count = 0;
> +	struct device_node *dn;
> +
> +	WARN_ON(!of_node_is_type(cachedn, "cache"));
> +
> +	for_each_of_cpu_node(dn) {
> +		if (of_find_next_cache_node(dn) == cachedn)
> +			use_count++;
> +	}
> +
> +	for_each_node_by_type(dn, "cache") {
> +		if (of_find_next_cache_node(dn) == cachedn)
> +			use_count++;
> +	}
> +
> +	return use_count;
> +}
> +
> +static int pseries_cpuhp_detach_nodes(struct device_node *cpudn)
> +{
> +	struct device_node *dn;
> +	struct of_changeset cs;
> +	int ret = 0;
> +
> +	of_changeset_init(&cs);
> +	ret = of_changeset_detach_node(&cs, cpudn);
> +	if (ret)
> +		goto out;
> +
> +	dn = cpudn;
> +	while ((dn = of_find_next_cache_node(dn))) {
> +		if (pseries_cpuhp_cache_use_count(dn) > 1)
> +			break;
> +
> +		ret = of_changeset_detach_node(&cs, dn);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	ret = of_changeset_apply(&cs);
> +out:
> +	of_changeset_destroy(&cs);
> +	return ret;
> +}
> +
>   static ssize_t dlpar_cpu_remove(struct device_node *dn, u32 drc_index)
>   {
>   	int rc;
> @@ -621,7 +689,7 @@ static ssize_t dlpar_cpu_remove(struct device_node *dn, u32 drc_index)
>   		return rc;
>   	}
>   
> -	rc = dlpar_detach_node(dn);
> +	rc = pseries_cpuhp_detach_nodes(dn);
>   	if (rc) {
>   		int saved_rc = rc;
>   
> 
