Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA324129DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 02:19:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HD29k0P2bz2yHq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 10:19:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DXpmrRVT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DXpmrRVT; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HD28z3FZ7z2xtv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 10:18:57 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id r1so3095609qta.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 17:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oCWOCXYGgsypx9sXOpPbyUQrHWDjgDTaeWqfc0jiapg=;
 b=DXpmrRVTNnD/laPru+VuA9glQwFBdgzeLQkH+Nd4bun8JHKQbaLnJn5JDhLnC0Z3l2
 ha9AiRkGn2mT14s4iO+FYWtbZWb7JLmzs61oopmKaJ6a2wMz+qztbwRoNTb6k32RrbJ2
 6iPkXr3o4L+TVHFBLftSjzfoao3oUFiOxjVNpFmcfVy4If6iZksaUaCRU6ejimooHX7j
 cbTDUW5OvuYZGxXXtvuxBMs7xsOP3naAYkp+fXgvWrI3pMWAacat3MXDHEtEwC8yH6BN
 gojtzQlSAMGv/NaAQ0DNSEWry8dQPv4LaUbQD0oTS9Jt4HiBWGXuIdbanVcBMTTJXLs1
 6C2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oCWOCXYGgsypx9sXOpPbyUQrHWDjgDTaeWqfc0jiapg=;
 b=iWGu2G90zHsZo9jWDwwpZUZ9UeyN+PiFlGVUwl5jn/m7OTQXAgLDD6s6GxDs+WouIb
 EGMocG2humvaB4Tz31ocwSzU2y2TWJ2x6xQaLD6gMBVqi1iJ3HA/OykccUcev8IlCnkE
 RvGyKLGgSBia2DemBGLUJaRlqarlr7pZwAIqqypp8DLywuXXncS6D+gt/6BAZTZvTjGU
 laRIbKMRI62bmueyYU7W+izzt3tlDy8/3ve4WjcCKKtvU1xKGfDMWolMZavA5mQP1DeE
 2zFJse9eLIniTwnFF5I7e5/QkIjgS5NMPz3enTlSLQw67f/k67IG6oI5X1JX8AAVXsMZ
 j8xw==
X-Gm-Message-State: AOAM530EAfSLQ17R/0P2YgGNJGiiM/8VDdh0q+Ru4DGVN/OC/4/p+For
 OPzlAWRgm4C7U9tWloVCeRc=
X-Google-Smtp-Source: ABdhPJyThjaFidI+ysDxZeFgm4ghgJUQhW5ZWvfcTWznYjANgwczpibpG5qsse/iXIdpvwwin8L0Jg==
X-Received: by 2002:a05:622a:18c:: with SMTP id
 s12mr22373771qtw.62.1632183534223; 
 Mon, 20 Sep 2021 17:18:54 -0700 (PDT)
Received: from [192.168.10.222] ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id y12sm9758433qtj.3.2021.09.20.17.18.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 17:18:54 -0700 (PDT)
Message-ID: <19c1f412-ef08-f1ea-8c6b-45921bd1f627@gmail.com>
Date: Mon, 20 Sep 2021 21:18:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/3] powerpc/pseries/cpuhp: delete add/remove_by_count code
Content-Language: en-US
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210920135504.1792219-1-nathanl@linux.ibm.com>
 <20210920135504.1792219-4-nathanl@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20210920135504.1792219-4-nathanl@linux.ibm.com>
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
> The core DLPAR code supports two actions (add and remove) and three
> subtypes of action:
> 
> * By DRC index: the action is attempted on a single specified resource.
>    This is the usual case for processors.
> * By indexed count: the action is attempted on a range of resources
>    beginning at the specified index. This is implemented only by the memory
>    DLPAR code.
> * By count: the lower layer (CPU or memory) is responsible for locating the
>    specified number of resources to which the action can be applied.
> 
> I cannot find any evidence of the "by count" subtype being used by drmgr or
> qemu for processors. And when I try to exercise this code, the add case
> does not work:


Just to clarify: did you check both CPU and memory cases and found out that the
'by count' subtype isn't used with CPUs, but drmgr has some cases in which
'by count' is used with LMBs?

I'm asking because I worked with a part of the LMB removal code a few months ago,
and got stuck in a situation in which the 'by count' and 'by indexed count' are
similar enough to feel repetitive, but distinct enough to not be easily reduced
into a single function. If drmgr wasn't using the 'by count' subtypes for LMBs
that would be a good chance for more code redux.


> 
>    $ ppc64_cpu --smt ; nproc
>    SMT=8
>    24
>    $ printf "cpu remove count 2" > /sys/kernel/dlpar
>    $ nproc
>    8
>    $ printf "cpu add count 2" > /sys/kernel/dlpar
>    -bash: printf: write error: Invalid argument
>    $ dmesg | tail -2
>    pseries-hotplug-cpu: Failed to find enough CPUs (1 of 2) to add
>    dlpar: Could not handle DLPAR request "cpu add count 2"
>    $ nproc
>    8
>    $ drmgr -c cpu -a -q 2         # this uses the by-index method
>    Validating CPU DLPAR capability...yes.
>    CPU 1
>    CPU 17
>    $ nproc
>    24
> 
> This is because find_drc_info_cpus_to_add() does not increment drc_index
> appropriately during its search.
> 
> This is not hard to fix. But the _by_count() functions also have the
> property that they attempt to roll back all prior operations if the entire
> request cannot be satisfied, even though the rollback itself can encounter
> errors. It's not possible to provide transaction-like behavior at this
> level, and it's undesirable to have code that can only pretend to do that.
> Any users of these functions cannot know what the state of the system is in
> the error case. And the error paths are, to my knowledge, impossible to
> test without adding custom error injection code.
> 
> Summary:
> 
> * This code has not worked reliably since its introduction.
> * There is no evidence that it is used.
> * It contains questionable rollback behaviors in error paths which are
>    difficult to test.
> 
> So let's remove it.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Fixes: ac71380071d1 ("powerpc/pseries: Add CPU dlpar remove functionality")
> Fixes: 90edf184b9b7 ("powerpc/pseries: Add CPU dlpar add functionality")
> Fixes: b015f6bc9547 ("powerpc/pseries: Add cpu DLPAR support for drc-info property")
> ---

Tested with a QEMU pseries guest, no issues found.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>



>   arch/powerpc/platforms/pseries/hotplug-cpu.c | 218 +------------------
>   1 file changed, 2 insertions(+), 216 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index 87a0fbe9cf12..768997261ce8 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -741,216 +741,6 @@ static int dlpar_cpu_remove_by_index(u32 drc_index)
>   	return rc;
>   }
>   
> -static int find_dlpar_cpus_to_remove(u32 *cpu_drcs, int cpus_to_remove)
> -{
> -	struct device_node *dn;
> -	int cpus_found = 0;
> -	int rc;
> -
> -	/* We want to find cpus_to_remove + 1 CPUs to ensure we do not
> -	 * remove the last CPU.
> -	 */
> -	for_each_node_by_type(dn, "cpu") {
> -		cpus_found++;
> -
> -		if (cpus_found > cpus_to_remove) {
> -			of_node_put(dn);
> -			break;
> -		}
> -
> -		/* Note that cpus_found is always 1 ahead of the index
> -		 * into the cpu_drcs array, so we use cpus_found - 1
> -		 */
> -		rc = of_property_read_u32(dn, "ibm,my-drc-index",
> -					  &cpu_drcs[cpus_found - 1]);
> -		if (rc) {
> -			pr_warn("Error occurred getting drc-index for %pOFn\n",
> -				dn);
> -			of_node_put(dn);
> -			return -1;
> -		}
> -	}
> -
> -	if (cpus_found < cpus_to_remove) {
> -		pr_warn("Failed to find enough CPUs (%d of %d) to remove\n",
> -			cpus_found, cpus_to_remove);
> -	} else if (cpus_found == cpus_to_remove) {
> -		pr_warn("Cannot remove all CPUs\n");
> -	}
> -
> -	return cpus_found;
> -}
> -
> -static int dlpar_cpu_remove_by_count(u32 cpus_to_remove)
> -{
> -	u32 *cpu_drcs;
> -	int cpus_found;
> -	int cpus_removed = 0;
> -	int i, rc;
> -
> -	pr_debug("Attempting to hot-remove %d CPUs\n", cpus_to_remove);
> -
> -	cpu_drcs = kcalloc(cpus_to_remove, sizeof(*cpu_drcs), GFP_KERNEL);
> -	if (!cpu_drcs)
> -		return -EINVAL;
> -
> -	cpus_found = find_dlpar_cpus_to_remove(cpu_drcs, cpus_to_remove);
> -	if (cpus_found <= cpus_to_remove) {
> -		kfree(cpu_drcs);
> -		return -EINVAL;
> -	}
> -
> -	for (i = 0; i < cpus_to_remove; i++) {
> -		rc = dlpar_cpu_remove_by_index(cpu_drcs[i]);
> -		if (rc)
> -			break;
> -
> -		cpus_removed++;
> -	}
> -
> -	if (cpus_removed != cpus_to_remove) {
> -		pr_warn("CPU hot-remove failed, adding back removed CPUs\n");
> -
> -		for (i = 0; i < cpus_removed; i++)
> -			dlpar_cpu_add(cpu_drcs[i]);
> -
> -		rc = -EINVAL;
> -	} else {
> -		rc = 0;
> -	}
> -
> -	kfree(cpu_drcs);
> -	return rc;
> -}
> -
> -static int find_drc_info_cpus_to_add(struct device_node *cpus,
> -				     struct property *info,
> -				     u32 *cpu_drcs, u32 cpus_to_add)
> -{
> -	struct of_drc_info drc;
> -	const __be32 *value;
> -	u32 count, drc_index;
> -	int cpus_found = 0;
> -	int i, j;
> -
> -	if (!info)
> -		return -1;
> -
> -	value = of_prop_next_u32(info, NULL, &count);
> -	if (value)
> -		value++;
> -
> -	for (i = 0; i < count; i++) {
> -		of_read_drc_info_cell(&info, &value, &drc);
> -		if (strncmp(drc.drc_type, "CPU", 3))
> -			break;
> -
> -		drc_index = drc.drc_index_start;
> -		for (j = 0; j < drc.num_sequential_elems; j++) {
> -			if (dlpar_cpu_exists(cpus, drc_index))
> -				continue;
> -
> -			cpu_drcs[cpus_found++] = drc_index;
> -
> -			if (cpus_found == cpus_to_add)
> -				return cpus_found;
> -
> -			drc_index += drc.sequential_inc;
> -		}
> -	}
> -
> -	return cpus_found;
> -}
> -
> -static int find_drc_index_cpus_to_add(struct device_node *cpus,
> -				      u32 *cpu_drcs, u32 cpus_to_add)
> -{
> -	int cpus_found = 0;
> -	int index, rc;
> -	u32 drc_index;
> -
> -	/* Search the ibm,drc-indexes array for possible CPU drcs to
> -	 * add. Note that the format of the ibm,drc-indexes array is
> -	 * the number of entries in the array followed by the array
> -	 * of drc values so we start looking at index = 1.
> -	 */
> -	index = 1;
> -	while (cpus_found < cpus_to_add) {
> -		rc = of_property_read_u32_index(cpus, "ibm,drc-indexes",
> -						index++, &drc_index);
> -
> -		if (rc)
> -			break;
> -
> -		if (dlpar_cpu_exists(cpus, drc_index))
> -			continue;
> -
> -		cpu_drcs[cpus_found++] = drc_index;
> -	}
> -
> -	return cpus_found;
> -}
> -
> -static int dlpar_cpu_add_by_count(u32 cpus_to_add)
> -{
> -	struct device_node *parent;
> -	struct property *info;
> -	u32 *cpu_drcs;
> -	int cpus_added = 0;
> -	int cpus_found;
> -	int i, rc;
> -
> -	pr_debug("Attempting to hot-add %d CPUs\n", cpus_to_add);
> -
> -	cpu_drcs = kcalloc(cpus_to_add, sizeof(*cpu_drcs), GFP_KERNEL);
> -	if (!cpu_drcs)
> -		return -EINVAL;
> -
> -	parent = of_find_node_by_path("/cpus");
> -	if (!parent) {
> -		pr_warn("Could not find CPU root node in device tree\n");
> -		kfree(cpu_drcs);
> -		return -1;
> -	}
> -
> -	info = of_find_property(parent, "ibm,drc-info", NULL);
> -	if (info)
> -		cpus_found = find_drc_info_cpus_to_add(parent, info, cpu_drcs, cpus_to_add);
> -	else
> -		cpus_found = find_drc_index_cpus_to_add(parent, cpu_drcs, cpus_to_add);
> -
> -	of_node_put(parent);
> -
> -	if (cpus_found < cpus_to_add) {
> -		pr_warn("Failed to find enough CPUs (%d of %d) to add\n",
> -			cpus_found, cpus_to_add);
> -		kfree(cpu_drcs);
> -		return -EINVAL;
> -	}
> -
> -	for (i = 0; i < cpus_to_add; i++) {
> -		rc = dlpar_cpu_add(cpu_drcs[i]);
> -		if (rc)
> -			break;
> -
> -		cpus_added++;
> -	}
> -
> -	if (cpus_added < cpus_to_add) {
> -		pr_warn("CPU hot-add failed, removing any added CPUs\n");
> -
> -		for (i = 0; i < cpus_added; i++)
> -			dlpar_cpu_remove_by_index(cpu_drcs[i]);
> -
> -		rc = -EINVAL;
> -	} else {
> -		rc = 0;
> -	}
> -
> -	kfree(cpu_drcs);
> -	return rc;
> -}
> -
>   int dlpar_cpu(struct pseries_hp_errorlog *hp_elog)
>   {
>   	u32 count, drc_index;
> @@ -963,9 +753,7 @@ int dlpar_cpu(struct pseries_hp_errorlog *hp_elog)
>   
>   	switch (hp_elog->action) {
>   	case PSERIES_HP_ELOG_ACTION_REMOVE:
> -		if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_COUNT)
> -			rc = dlpar_cpu_remove_by_count(count);
> -		else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX) {
> +		if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX) {
>   			rc = dlpar_cpu_remove_by_index(drc_index);
>   			/*
>   			 * Setting the isolation state of an UNISOLATED/CONFIGURED
> @@ -979,9 +767,7 @@ int dlpar_cpu(struct pseries_hp_errorlog *hp_elog)
>   			rc = -EINVAL;
>   		break;
>   	case PSERIES_HP_ELOG_ACTION_ADD:
> -		if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_COUNT)
> -			rc = dlpar_cpu_add_by_count(count);
> -		else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX)
> +		if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX)
>   			rc = dlpar_cpu_add(drc_index);
>   		else
>   			rc = -EINVAL;
> 
