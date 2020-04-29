Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3777C1BDAC5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 13:36:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BxKm4Kz1zDqTn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 21:36:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BxFY0mjYzDr3F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 21:32:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Fk/JXW1A; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49BxFX3QbLz9sRY;
 Wed, 29 Apr 2020 21:32:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588159952;
 bh=9WJyl7TzlpUJJ77xgJTGXm5d4bIn+t+37IVcvRQx2Wc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Fk/JXW1AknDtIzQlIYpqL0cT4Z11ewUnpCXFx8Pv57jJ0+4Pned5T8leSD8qk6Wgm
 zpkwT63cjgLakihdmIExgODIgSxT44zz9hCPGUQExcl254PaZ60mIdl4Gn4BE6Ahyh
 p/gEIaEoujkyFHSsdVUK+e5mC2lR1AlukdDgS5+SN6qr7QSqUJyaD3YHG0KSeBKD+Y
 r9S0JhL26dlFTG1KzF3Na8JMo8lrDPTQ93tRpaQwilMzYnsgLWDhtpz9oFDdLJwIwk
 3HG9ZWeZfwy4Ld7gDXX94d0MZpnal5Z0fd78D4siSTUgihZM6ztryJlHOCVwiHEUUY
 dkgn92FB3zNCw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>, acme@kernel.org,
 linuxppc-dev@lists.ozlabs.org, sukadev@linux.vnet.ibm.com
Subject: Re: [PATCH v7 3/5] powerpc/hv-24x7: Add sysfs files inside hv-24x7
 device to show processor details
In-Reply-To: <20200327063642.26175-4-kjain@linux.ibm.com>
References: <20200327063642.26175-1-kjain@linux.ibm.com>
 <20200327063642.26175-4-kjain@linux.ibm.com>
Date: Wed, 29 Apr 2020 21:32:48 +1000
Message-ID: <87d07qfrxb.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 ravi.bangoria@linux.ibm.com, kjain@linux.ibm.com, jmario@redhat.com,
 namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kajol Jain <kjain@linux.ibm.com> writes:
> To expose the system dependent parameter like total number of
> sockets and numbers of chips per socket, patch adds two sysfs files.
> "sockets" and "chips" are added to /sys/devices/hv_24x7/interface/
> of the "hv_24x7" pmu.
>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  arch/powerpc/perf/hv-24x7.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

This should also add documentation under Documentation/ABI.

cheers

> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index 9ae00f29bd21..a31bd5b88f7a 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -454,6 +454,20 @@ static ssize_t device_show_string(struct device *dev,
>  	return sprintf(buf, "%s\n", (char *)d->var);
>  }
>  
> +#ifdef CONFIG_PPC_RTAS
> +static ssize_t sockets_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	return sprintf(buf, "%d\n", physsockets);
> +}
> +
> +static ssize_t chips_show(struct device *dev, struct device_attribute *attr,
> +			  char *buf)
> +{
> +	return sprintf(buf, "%d\n", physchips);
> +}
> +#endif
> +
>  static struct attribute *device_str_attr_create_(char *name, char *str)
>  {
>  	struct dev_ext_attribute *attr = kzalloc(sizeof(*attr), GFP_KERNEL);
> @@ -1100,6 +1114,10 @@ PAGE_0_ATTR(catalog_len, "%lld\n",
>  		(unsigned long long)be32_to_cpu(page_0->length) * 4096);
>  static BIN_ATTR_RO(catalog, 0/* real length varies */);
>  static DEVICE_ATTR_RO(domains);
> +#ifdef CONFIG_PPC_RTAS
> +static DEVICE_ATTR_RO(sockets);
> +static DEVICE_ATTR_RO(chips);
> +#endif
>  
>  static struct bin_attribute *if_bin_attrs[] = {
>  	&bin_attr_catalog,
> @@ -1110,6 +1128,10 @@ static struct attribute *if_attrs[] = {
>  	&dev_attr_catalog_len.attr,
>  	&dev_attr_catalog_version.attr,
>  	&dev_attr_domains.attr,
> +#ifdef CONFIG_PPC_RTAS
> +	&dev_attr_sockets.attr,
> +	&dev_attr_chips.attr,
> +#endif
>  	NULL,
>  };
>  
> -- 
> 2.18.1
