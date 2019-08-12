Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A440489F25
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 15:05:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466bg44lf9zDqg8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 23:05:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466bcj5D6czDqcH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 23:03:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 466bcj1tK1z9sN6;
 Mon, 12 Aug 2019 23:03:17 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 11/16] powerpc/pseries/svm: Export guest SVM status to
 user space via sysfs
In-Reply-To: <20190806052237.12525-12-bauerman@linux.ibm.com>
References: <20190806052237.12525-1-bauerman@linux.ibm.com>
 <20190806052237.12525-12-bauerman@linux.ibm.com>
Date: Mon, 12 Aug 2019 23:03:16 +1000
Message-ID: <8736i6sfhn.fsf@concordia.ellerman.id.au>
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Ryan Grimm <grimm@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:
> From: Ryan Grimm <grimm@linux.vnet.ibm.com>
>
> User space might want to know it's running in a secure VM.  It can't do
> a mfmsr because mfmsr is a privileged instruction.
>
> The solution here is to create a cpu attribute:
>
> /sys/devices/system/cpu/svm
>
> which will read 0 or 1 based on the S bit of the guest's CPU 0.

Why CPU 0?

If we have different CPUs running with different MSR_S then something
has gone badly wrong, no?

So can't we just read the MSR on whatever CPU the sysfs code happens to
run on.

cheers

> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index e2147d7c9e72..f7100ab77d29 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -19,6 +19,7 @@
>  #include <asm/smp.h>
>  #include <asm/pmc.h>
>  #include <asm/firmware.h>
> +#include <asm/svm.h>
>  
>  #include "cacheinfo.h"
>  #include "setup.h"
> @@ -715,6 +716,32 @@ static struct device_attribute pa6t_attrs[] = {
>  #endif /* HAS_PPC_PMC_PA6T */
>  #endif /* HAS_PPC_PMC_CLASSIC */
>  
> +#ifdef CONFIG_PPC_SVM
> +static void get_svm(void *val)
> +{
> +	u32 *value = val;
> +
> +	*value = is_secure_guest();
> +}
> +
> +static ssize_t show_svm(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	u32 val;
> +	smp_call_function_single(0, get_svm, &val, 1);
> +	return sprintf(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR(svm, 0444, show_svm, NULL);
> +
> +static void create_svm_file(void)
> +{
> +	device_create_file(cpu_subsys.dev_root, &dev_attr_svm);
> +}
> +#else
> +static void create_svm_file(void)
> +{
> +}
> +#endif /* CONFIG_PPC_SVM */
> +
>  static int register_cpu_online(unsigned int cpu)
>  {
>  	struct cpu *c = &per_cpu(cpu_devices, cpu);
> @@ -1058,6 +1085,8 @@ static int __init topology_init(void)
>  	sysfs_create_dscr_default();
>  #endif /* CONFIG_PPC64 */
>  
> +	create_svm_file();
> +
>  	return 0;
>  }
>  subsys_initcall(topology_init);
