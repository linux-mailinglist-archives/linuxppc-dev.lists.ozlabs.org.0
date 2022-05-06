Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4103F51D90E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 15:26:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvrtM1NTqz3cB3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 23:26:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MVXErASy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kvrsm3qkNz2xvL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 23:25:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=MVXErASy; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Kvrsm2yF9z4yT3;
 Fri,  6 May 2022 23:25:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651843532;
 bh=PQvoFtMhfScJRqpiyFdA7AaJjkNUWCIcMh/KMMfORlU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=MVXErASy1piQfgoSKGYN+Fisu1+SKxCjKyjmJ8UTRkv7HqJtfOZ/PPHbidsf6TeIt
 Id5FWZYGK9sfwtwxvvlG29VGBsq8JCwDLzA7kQDnhDcs6tydnP6b3tteLd834RgWuc
 rSUldD3FaMU9eMLjkbq/2lEnr5vcIlS96sKdQmhYGV4ekFCv1HXatcq25wz0NFlfkB
 JjL+vf0bde125vzPAdZ7LZU2RM8m1cRCKcgGbf6wy4FExg8JVOuz5OdagD9C9hyNVK
 6VJDMbum4m8a5E6B9N17JEOsxSzYubV3sH7/gK1RHJ0HdaDkb/eLXKyPk8wDAMQ5B6
 ynzlDPhrA6ORw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/perf: Add support for caps under sysfs in powerpc
In-Reply-To: <20220428054937.28006-1-atrajeev@linux.vnet.ibm.com>
References: <20220428054937.28006-1-atrajeev@linux.vnet.ibm.com>
Date: Fri, 06 May 2022 23:25:25 +1000
Message-ID: <87leveu722.fsf@mpe.ellerman.id.au>
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Athira,

Some comments below :)

Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
> Add caps support under "/sys/bus/event_source/devices/<pmu>/"
> for powerpc. This directory can be used to expose some of the
> specific features that powerpc PMU supports to the user.
> Example: pmu_name. The name of PMU registered will depend on
> platform, say power9 or power10 or it could be Generic Compat
> PMU.

Is there precedent for adding a "caps" directory? ie. do other PMUs on
other architectures already do that?

Is there precedent for adding "pmu_name"?

I don't see any mention of them in Documentation/ABI anywhere.

If we're the first to do that we should add it to the documentation.

As this would set a precedent for other PMUs, please Cc the perf
maintainers on v2.

> Currently the only way to know which is the registered
> PMU is from the dmesg logs. But clearing the dmesg will make it
> difficult to know exact PMU backend used. And even extracting
> from dmesg will be complicated, as we need  to parse the dmesg
> logs and add filters for pmu name. Whereas by exposing it via
> caps will make it easy as we just need to directly read it from
> the sysfs.
>
> Add a caps directory to /sys/bus/event_source/devices/cpu/
> for power8, power9, power10 and generic compat PMU.
>
> The information exposed currently:
>  - pmu_name : Underlying PMU name from the driver
>
> Example result with power9 pmu:
>
>  # ls /sys/bus/event_source/devices/cpu/caps
> pmu_name
>
>  # cat /sys/bus/event_source/devices/cpu/caps/pmu_name
> power9
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>  arch/powerpc/perf/generic-compat-pmu.c | 20 ++++++++++++++++++++
>  arch/powerpc/perf/power10-pmu.c        | 20 ++++++++++++++++++++
>  arch/powerpc/perf/power8-pmu.c         | 20 ++++++++++++++++++++
>  arch/powerpc/perf/power9-pmu.c         | 20 ++++++++++++++++++++
>  4 files changed, 80 insertions(+)
>
> diff --git a/arch/powerpc/perf/generic-compat-pmu.c b/arch/powerpc/perf/generic-compat-pmu.c
> index f3db88aee4dd..7b5fe2d89007 100644
> --- a/arch/powerpc/perf/generic-compat-pmu.c
> +++ b/arch/powerpc/perf/generic-compat-pmu.c
> @@ -151,9 +151,29 @@ static const struct attribute_group generic_compat_pmu_format_group = {
>  	.attrs = generic_compat_pmu_format_attr,
>  };
>
> +static ssize_t pmu_name_show(struct device *cdev,
> +		struct device_attribute *attr,
> +		char *buf)
> +{
> +	return snprintf(buf, PAGE_SIZE, "generic_compat_pmu");
> +}

That's not a great name, now that it's exposed to userspace.

For starters it's only generic on Book3S, and if you look at
init_generic_compat_pmu() it's really a "ISA >= v3.0 fallback PMU" - or
something like that.

> +static DEVICE_ATTR_RO(pmu_name);
> +
> +static struct attribute *generic_compat_pmu_caps_attrs[] = {
> +	&dev_attr_pmu_name.attr,
> +	NULL
> +};
> +
> +static struct attribute_group generic_compat_pmu_caps_group = {
> +	.name  = "caps",
> +	.attrs = generic_compat_pmu_caps_attrs,
> +};
> +
>  static const struct attribute_group *generic_compat_pmu_attr_groups[] = {
>  	&generic_compat_pmu_format_group,
>  	&generic_compat_pmu_events_group,
> +	&generic_compat_pmu_caps_group,
>  	NULL,
>  };
>
> diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
> index d3398100a60f..a622ff783719 100644
> --- a/arch/powerpc/perf/power10-pmu.c
> +++ b/arch/powerpc/perf/power10-pmu.c
> @@ -258,6 +258,25 @@ static const struct attribute_group power10_pmu_format_group = {
>  	.attrs = power10_pmu_format_attr,
>  };
>
> +static ssize_t pmu_name_show(struct device *cdev,
> +		struct device_attribute *attr,
> +		char *buf)
> +{
> +	return snprintf(buf, PAGE_SIZE, "power10");

I believe that should use sysfs_emit().

> +}
> +
> +static DEVICE_ATTR_RO(pmu_name);
> +
> +static struct attribute *power10_pmu_caps_attrs[] = {
> +	&dev_attr_pmu_name.attr,
> +	NULL
> +};
> +
> +static struct attribute_group power10_pmu_caps_group = {
> +	.name  = "caps",
> +	.attrs = power10_pmu_caps_attrs,
> +};
> +
>  static const struct attribute_group *power10_pmu_attr_groups_dd1[] = {
>  	&power10_pmu_format_group,
>  	&power10_pmu_events_group_dd1,
> @@ -267,6 +286,7 @@ static const struct attribute_group *power10_pmu_attr_groups_dd1[] = {
>  static const struct attribute_group *power10_pmu_attr_groups[] = {
>  	&power10_pmu_format_group,
>  	&power10_pmu_events_group,
> +	&power10_pmu_caps_group,
>  	NULL,
>  };

There's a lot of boiler plate repeated for each PMU.

We already have power_pmu->name, can we use that and make the show
function generic at least in core-book3s.c ?

cheers
