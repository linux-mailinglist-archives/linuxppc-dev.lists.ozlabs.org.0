Return-Path: <linuxppc-dev+bounces-14330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 546CBC6D33A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 08:42:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBD2t2PBFz30Yb;
	Wed, 19 Nov 2025 18:42:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763538134;
	cv=none; b=Qv31ziHLLjMVwFwrNYDVkXMSAgIJoLLftgb46N9bkWHijB/sNOkBF2Hf+wSEiEEflAgUepwUwYoJk6jhAimLWx6rS3DRlowQp2RtIrS8O2sz+p3yc4jkk1JCy5yar1j6wVHlXhotWwbPkqD9zgOcRVIcS99VQw/LAI8QD51E8fDxVUpnC7/tD2hje8ULrG3vmQIw694RLOx9ZkwnVci3xLepPBPZvVtdVVOJT5MVQg0FqrB1086irKvUBYqODEmzLCB5gczEQEK+seNLIIXstYBVe4pZIvgaPHkI2zDTdTKmRoTKe5cP1skITYLggnib3wiJIr9g4sXp7hF6LGljfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763538134; c=relaxed/relaxed;
	bh=zhf0j34nun2AJvPASs/K8u4weTYuPDamoRVsXODvBCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CogGYflPdG2qbuGoX/6bQS+1ouD7PjHsFvRrPJDR/V28i7oUBpRs5HwW+1YVHWjG85S41o/JsI2TfZCaVmlHsYVSbhy5vedZJQ3KqZqbVMDc6p7jMWawcs/Jp6698XVS7iBEzzupa+BldJmAkr8MjuyhnKsCFDomvpEzlQnpZ/WNW3O3w19imE7lbsfktKv1cbbi81NwfA3YMW5l/x3LbCJ5jU8iQpXxXz78akm1qeYsbXRQGxU12fFxl90qsGOWw6AKMYO0bLVxspZzq2PNChGKK1qzIigUkPe4NBuFnDRi+K7U2o6oCAtI6AlsQiUsuaNrzqOrgN+FxNmsG/4Hbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Pzrj82C7; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Pzrj82C7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBD2r6ycgz30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 18:42:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 391F343DC5;
	Wed, 19 Nov 2025 07:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15290C2BCB0;
	Wed, 19 Nov 2025 07:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763538128;
	bh=7cB8uFRCrG5HUsJDbdxDpfhsh/1Z3AaZOu4oAcvYFQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pzrj82C7wkiz1kqBbHUw+6bAKHKJXK62Hiw+cael3AHr3NVwXYle8HDQpHVIlpyXr
	 R3ATLL+WV8Dv7S1SCLfebQcXSWEHB3wkR/lzYg2tv/0nC7u6dDhgqOU5kdso6DhEjc
	 0/Upt80G+eSNiAUOer21/O2i2vnGf9cGVUjz4/g4=
Date: Wed, 19 Nov 2025 02:42:03 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de,
	yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
	pbonzini@redhat.com, seanjc@google.com, kprateek.nayak@amd.com,
	vschneid@redhat.com, iii@linux.ibm.com, huschle@linux.ibm.com,
	rostedt@goodmis.org, dietmar.eggemann@arm.com,
	christophe.leroy@csgroup.eu
Subject: Re: [HELPER PATCH 1] sysfs: Provide write method for paravirt
Message-ID: <2025111922-rearrange-manned-8a47@gregkh>
References: <20251119062100.1112520-1-sshegde@linux.ibm.com>
 <20251119062100.1112520-17-sshegde@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119062100.1112520-17-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 19, 2025 at 11:50:59AM +0530, Shrikanth Hegde wrote:
> This is helper patch which could be used to set the range of CPUs as
> paravirt. One could make use of this for quick testing of this infra
> instead of writing arch specific code.
> 
> This is currently not meant be merged, since paravirt sysfs file is meant
> to be Read-Only.
> 
> echo 100-200,600-700 >  /sys/devices/system/cpu/paravirt
> cat /sys/devices/system/cpu/paravirt
> 100-200,600-700
> 
> echo > /sys/devices/system/cpu/paravirt
> cat /sys/devices/system/cpu/paravirt
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  drivers/base/cpu.c | 48 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> index 59ceae217b22..043e4f4ce1a9 100644
> --- a/drivers/base/cpu.c
> +++ b/drivers/base/cpu.c
> @@ -375,12 +375,57 @@ static int cpu_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  #endif
>  
>  #ifdef CONFIG_PARAVIRT
> +static ssize_t store_paravirt_cpus(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	cpumask_var_t temp_mask;
> +	int retval = 0;
> +
> +	if (!alloc_cpumask_var(&temp_mask, GFP_KERNEL))
> +		return -ENOMEM;
> +
> +	retval = cpulist_parse(buf, temp_mask);
> +	if (retval)
> +		goto free_mask;
> +
> +	/* ALL cpus can't be marked as paravirt */
> +	if (cpumask_equal(temp_mask, cpu_online_mask)) {
> +		retval = -EINVAL;
> +		goto free_mask;
> +	}
> +	if (cpumask_weight(temp_mask) > num_online_cpus()) {
> +		retval = -EINVAL;
> +		goto free_mask;
> +	}
> +
> +	/* No more paravirt cpus */
> +	if (cpumask_empty(temp_mask)) {
> +		cpumask_copy((struct cpumask *)&__cpu_paravirt_mask, temp_mask);
> +	} else {
> +		cpumask_copy((struct cpumask *)&__cpu_paravirt_mask, temp_mask);
> +
> +		/* Enable tick on nohz_full cpu */
> +		int cpu;
> +		for_each_cpu(cpu, temp_mask) {
> +			if (tick_nohz_full_cpu(cpu))
> +				tick_nohz_dep_set_cpu(cpu, TICK_DEP_BIT_SCHED);
> +		}
> +	}
> +
> +	retval = count;
> +
> +free_mask:
> +	free_cpumask_var(temp_mask);
> +	return retval;
> +}
> +
>  static ssize_t print_paravirt_cpus(struct device *dev,
>  				   struct device_attribute *attr, char *buf)
>  {
>  	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_paravirt_mask));
>  }
> -static DEVICE_ATTR(paravirt, 0444, print_paravirt_cpus, NULL);
> +static DEVICE_ATTR(paravirt, 0644, print_paravirt_cpus, store_paravirt_cpus);

DEVICE_ATTR_RW()?

And where is the documentation update for this sysfs file change?

>  #endif
>  
>  const struct bus_type cpu_subsys = {
> @@ -675,7 +720,6 @@ static void __init cpu_register_vulnerabilities(void)
>  		put_device(dev);
>  	}
>  }
> -
>  #else

Why is this change needed?

thanks,

greg k-h

