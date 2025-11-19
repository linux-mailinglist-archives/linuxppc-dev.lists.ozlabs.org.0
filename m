Return-Path: <linuxppc-dev+bounces-14333-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF028C6D63B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 09:23:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBDz02dZGz3bdD;
	Wed, 19 Nov 2025 19:23:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763540636;
	cv=none; b=VYI9H2hMV8I8uSaFBZ5oCuoIZua1zO43HLUyjJ1Td5kdC+i8ZgTQ0d2KqzpbNMT7GUzpdsYzey4eZyQ2ouHQ8kTo9hy+r+agBsJyyTAslLApz2nbFCSY7YGjZw6PNDJH/zGpPjUaauJr4bTAirestbwPLWUNmbPFTiNW3pCSenIDCgpboBjiPaKf5MAR1LQzF5XyWytIqKVR8bqK2ktwpTCdBZ31dd52lFeyefZLSJkwM53sv8gOLPxRex8LGCCuCGBvE34nrdRE9xb3QubfU3sAQgaaYuetSid8Qb284UsY9aV0EyuVm4/CKFaio4hZ1dy7ex/yVQWMMLohGvrj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763540636; c=relaxed/relaxed;
	bh=NeCnF09mLCo4VZhXQUkdbJRq5RJm9OkQ6nrK2L6wHYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTKCU+HxdfH7BCv9BVYLTF9LuTBwUdtoDSwoGejjNalRdhrTjyZFKdm3Ozh3ZzR3iEsXJFUqvMIsG86oDX0oyWfSOgDGv9T55cfYaT4txAOethTcZ4QNJphiuJdBJO42mobIakbPzBXUh2e4SWWG1JNkinRVLQTn7lTflOGKu7gJXXCr/yrISbB2iaHChpsXz9bYTH6eMu6UC9BtfA+cEEXPyQUqOb46JAdxeeiZWu7uQShqzNbkxIThg0cxMQ91ioN1PY3OLWZVwRthN3OopmkXLKTI6p+hVTYbn/eYZiPYhIY88XqP+ppjsLnb29w8Wyu/lID0KiVPz6Ug1SXVgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=WevjYV48; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=WevjYV48;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBDyz0zKTz3bTj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 19:23:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EACF43B5C;
	Wed, 19 Nov 2025 08:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75687C4AF54;
	Wed, 19 Nov 2025 08:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763540592;
	bh=2XFxTX3R/SSaIKy6SawOXV3VX98LHo9U1Pt6il2BMvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WevjYV48tPFu/e619UmGFn7KAG2RMojgv/TQ/mt1OPI7Bx1xGd7pCXxx7/2DuJSXy
	 eGd8MepB9O2LCIYa0SvrsiYcNAWjhNpsoKvgh/tCzY2YB+TSApo6dhP/dvIrtKSLwy
	 HGoZKdlWIvZ5TKmdl9BACDyW7lpfqmvfMGUX99Es=
Date: Wed, 19 Nov 2025 03:23:08 -0500
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
Message-ID: <2025111959-gumminess-rely-6f95@gregkh>
References: <20251119062100.1112520-1-sshegde@linux.ibm.com>
 <20251119062100.1112520-17-sshegde@linux.ibm.com>
 <2025111922-rearrange-manned-8a47@gregkh>
 <dadeeb85-779e-44e8-83b7-4c53ad338493@linux.ibm.com>
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
In-Reply-To: <dadeeb85-779e-44e8-83b7-4c53ad338493@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 19, 2025 at 01:38:24PM +0530, Shrikanth Hegde wrote:
> Hi Greg.
> 
> On 11/19/25 1:12 PM, Greg KH wrote:
> > On Wed, Nov 19, 2025 at 11:50:59AM +0530, Shrikanth Hegde wrote:
> > > This is helper patch which could be used to set the range of CPUs as
> > > paravirt. One could make use of this for quick testing of this infra
> > > instead of writing arch specific code.
> > > 
> > > This is currently not meant be merged, since paravirt sysfs file is meant
> > > to be Read-Only.
> > > 
> > > echo 100-200,600-700 >  /sys/devices/system/cpu/paravirt
> > > cat /sys/devices/system/cpu/paravirt
> > > 100-200,600-700
> > > 
> > > echo > /sys/devices/system/cpu/paravirt
> > > cat /sys/devices/system/cpu/paravirt
> > > 
> > > Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> > > ---
> > >   drivers/base/cpu.c | 48 ++++++++++++++++++++++++++++++++++++++++++++--
> > >   1 file changed, 46 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> > > index 59ceae217b22..043e4f4ce1a9 100644
> > > --- a/drivers/base/cpu.c
> > > +++ b/drivers/base/cpu.c
> > > @@ -375,12 +375,57 @@ static int cpu_uevent(const struct device *dev, struct kobj_uevent_env *env)
> > >   #endif
> > >   #ifdef CONFIG_PARAVIRT
> > > +static ssize_t store_paravirt_cpus(struct device *dev,
> > > +				   struct device_attribute *attr,
> > > +				   const char *buf, size_t count)
> > > +{
> > > +	cpumask_var_t temp_mask;
> > > +	int retval = 0;
> > > +
> > > +	if (!alloc_cpumask_var(&temp_mask, GFP_KERNEL))
> > > +		return -ENOMEM;
> > > +
> > > +	retval = cpulist_parse(buf, temp_mask);
> > > +	if (retval)
> > > +		goto free_mask;
> > > +
> > > +	/* ALL cpus can't be marked as paravirt */
> > > +	if (cpumask_equal(temp_mask, cpu_online_mask)) {
> > > +		retval = -EINVAL;
> > > +		goto free_mask;
> > > +	}
> > > +	if (cpumask_weight(temp_mask) > num_online_cpus()) {
> > > +		retval = -EINVAL;
> > > +		goto free_mask;
> > > +	}
> > > +
> > > +	/* No more paravirt cpus */
> > > +	if (cpumask_empty(temp_mask)) {
> > > +		cpumask_copy((struct cpumask *)&__cpu_paravirt_mask, temp_mask);
> > > +	} else {
> > > +		cpumask_copy((struct cpumask *)&__cpu_paravirt_mask, temp_mask);
> > > +
> > > +		/* Enable tick on nohz_full cpu */
> > > +		int cpu;
> > > +		for_each_cpu(cpu, temp_mask) {
> > > +			if (tick_nohz_full_cpu(cpu))
> > > +				tick_nohz_dep_set_cpu(cpu, TICK_DEP_BIT_SCHED);
> > > +		}
> > > +	}
> > > +
> > > +	retval = count;
> > > +
> > > +free_mask:
> > > +	free_cpumask_var(temp_mask);
> > > +	return retval;
> > > +}
> > > +
> > >   static ssize_t print_paravirt_cpus(struct device *dev,
> > >   				   struct device_attribute *attr, char *buf)
> > >   {
> > >   	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_paravirt_mask));
> > >   }
> > > -static DEVICE_ATTR(paravirt, 0444, print_paravirt_cpus, NULL);
> > > +static DEVICE_ATTR(paravirt, 0644, print_paravirt_cpus, store_paravirt_cpus);
> > 
> > DEVICE_ATTR_RW()?
> 
> ok.
> 
> > 
> > And where is the documentation update for this sysfs file change?
> > 
> 
> [RFC PATCH v4 11/17] has the documentation of this sysfs file.
> https://lore.kernel.org/all/20251119062100.1112520-12-sshegde@linux.ibm.com/

So a rfc patch has the documentation for a change that you don't want to
have applied?  This is an odd series, how are we supposed to review
this?

> This is a helper patch. This helps to verify functionality of any combination
> of CPUs being marked as paravirt which helped me to test some corner cases.

I don't think I have ever seen a "helper patch" to know what to do with
it :(

thanks,

greg k-h

