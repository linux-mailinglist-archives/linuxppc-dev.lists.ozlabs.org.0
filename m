Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E78B8586EC4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 18:40:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxP5260Dzz3c3B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 02:40:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mtK1BOJQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mtK1BOJQ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxP4J1g69z2xmk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 02:40:15 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 271FGjYl029058
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 1 Aug 2022 16:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : cc : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=hAcgI4fqG9VG0bnpmxmX2VIwMaMweBbglLGKg4DsLGI=;
 b=mtK1BOJQlDOkq8rC8CRJyLW8baMIKx1uhavMjaisP8gg9sGMWUXhzUXcB+LVIHQRsaVo
 IN5mhFuoCZzLwCrqmQjnMymEnjaTlQG43KXyTElzBFwRkMPJVLyugXFlS1wUctfxrAhg
 R8iK9GbY4ejEI28os3OQSGaioCVWCyONWIx9c8VsGGTuxtRMJmdaBlUpScLOaAaZRBv1
 s6n8u4J/hGXkGskNkKiSXSLGnaRLu5AE3BoQXv0A551Y9W64/a7/SRXKmBIfRWgVuhgS
 zB/nCeU4EGRXWC3MhMdvBhl79rO9NVUM0cwadB+q1oQW/+MgSDl0mk/Vqb4j+wC1Zpz6 5Q== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hphb6trww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Aug 2022 16:40:11 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 271GZULh015808
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 1 Aug 2022 16:40:10 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma01fra.de.ibm.com with ESMTP id 3hmv98thqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Aug 2022 16:40:10 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 271Ge6Pe29491586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Aug 2022 16:40:06 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8CBE4204B;
	Mon,  1 Aug 2022 16:40:06 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 865F842045;
	Mon,  1 Aug 2022 16:40:06 +0000 (GMT)
Received: from [9.145.167.195] (unknown [9.145.167.195])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  1 Aug 2022 16:40:06 +0000 (GMT)
Message-ID: <0ead0cd1-f6f6-ecf0-65d9-f3d9366e258c@linux.ibm.com>
Date: Mon, 1 Aug 2022 18:40:06 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [PATCH] powerpc/pseries: add lparctl driver for platform-specific
 functions
Content-Language: fr
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20220730000458.130938-1-nathanl@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220730000458.130938-1-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YvZC9QeJjZcZU_TYb1wn3Dpwv41q0i5_
X-Proofpoint-GUID: YvZC9QeJjZcZU_TYb1wn3Dpwv41q0i5_
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_07,2022-08-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 mlxscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208010084
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 30/07/2022 à 02:04, Nathan Lynch a écrit :
> This adds a chardev+ioctl-based interface for user space to access pseries
> platform-specific functions which don't easily fit elsewhere.
> 
> The immediate motivation is to unbreak librtas[1] with kernel lockdown
> enabled. librtas provides a thin root-only user-space API, allowing nearly
> direct access to RTAS functions. Since its inception, some of librtas's
> APIs have used /dev/mem to allocate buffers that are addressable by RTAS
> for use with the powerpc-specific rtas() syscall. This design likely would
> not be our first choice today, but it has served adequately for about two
> decades without much change, and librtas has a non-negligible number of
> existing users, including powerpc-utils, ppc64-diag, lsvpd, lscpu
> (util-linux), and several non-OSS programs. With lockdown enabled, /dev/mem
> access is prohibited, preventing communication with the management console
> and breaking associated functions such as DLPAR and partition migration.
> 
> So the task is to provide new lockdown-compatible interfaces for librtas to
> prefer over the legacy /dev/mem+sys_rtas(), allowing it to maintain its own
> user-facing ABIs as much as possible. This means that we make different
> interface choices than we would were we writing everything from scratch. In
> the ioctl commands added here, we do not map RTAS error statuses to Linux
> errno values, because the existing users of librtas's system parameter APIs
> expect the RTAS status codes. Instead, the ioctl succeeds if the kernel
> manages to call the RTAS function at all, and passes the RTAS status back
> to user space in the argument buffer.
> 
> Add the ability to retrieve and change system parameters as defined by
> PAPR. Along with proposed implementation changes to librtas[2], this
> effectively fixes librtas's rtas_get_sysparm() and rtas_set_sysparm() APIs
> for existing users with lockdown. This is enough to get HMC communication
> working via the proprietary RSCT stack, enabling LPM, processor DLPAR,
> memory DLPAR, and various other use cases.
> 
> While this starts with RTAS-implemented functions, there's no reason it
> couldn't host facilities that rely on hcalls or other PAPR-specified
> interfaces. It could be an alternative to adding more key=value lines to
> /proc/powrpc/lparcfg. Hence the generic name 'lparctl'.
> 
> Utilities tested (ppc64le kernel and user space):
> * ppc64_cpu --run-mode (powerpc-utils, gets/sets processor diag run mode)
> * serv_config (powerpc-utils, gets/sets various system and LPAR policies)
> * lscpu (util-linux, retrieves processor topology)
> * RSCT (proprietary, retrieves HMC connection details)
> 
> Future work to unbreak more librtas APIs may include:
> * VPD retrieval via ibm,get-vpd
> * RTAS error injection
> * indicator query/manipulation for diagnostics
> 
> [1] https://github.com/ibm-power-utilities/librtas
> [2] https://github.com/ibm-power-utilities/librtas/pull/26
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  .../userspace-api/ioctl/ioctl-number.rst      |   1 +
>  arch/powerpc/include/uapi/asm/lparctl.h       |  63 +++++++
>  arch/powerpc/platforms/pseries/Makefile       |   2 +-
>  arch/powerpc/platforms/pseries/lparctl.c      | 171 ++++++++++++++++++
>  4 files changed, 236 insertions(+), 1 deletion(-)
>  create mode 100644 arch/powerpc/include/uapi/asm/lparctl.h
>  create mode 100644 arch/powerpc/platforms/pseries/lparctl.c
> 
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index fcab013e47c9..029de1b7ebdb 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -349,6 +349,7 @@ Code  Seq#    Include File                                           Comments
>                                                                       <mailto:vgo@ratio.de>
>  0xB1  00-1F                                                          PPPoX
>                                                                       <mailto:mostrows@styx.uwaterloo.ca>
> +0xB2  01-02  arch/powerpc/include/uapi/asm/lparctl.h                 powerpc/pseries lparctl API
>  0xB3  00     linux/mmc/ioctl.h
>  0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
>  0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
> diff --git a/arch/powerpc/include/uapi/asm/lparctl.h b/arch/powerpc/include/uapi/asm/lparctl.h
> new file mode 100644
> index 000000000000..42e1ee5fe3c8
> --- /dev/null
> +++ b/arch/powerpc/include/uapi/asm/lparctl.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef POWERPC_UAPI_LPARCTL_H
> +#define POWERPC_UAPI_LPARCTL_H
> +
> +#include <linux/ioctl.h>
> +#include <linux/types.h>
> +
> +#define LPARCTL_IOCTL_BASE 0xb2
> +
> +#define LPARCTL_IO(nr)         _IO(LPARCTL_IOCTL_BASE, nr)
> +#define LPARCTL_IOR(nr, type)  _IOR(LPARCTL_IOCTL_BASE, nr, type)
> +#define LPARCTL_IOW(nr, type)  _IOW(LPARCTL_IOCTL_BASE, nr, type)
> +#define LPARCTL_IOWR(nr, type) _IOWR(LPARCTL_IOCTL_BASE, nr, type)
> +
> +/**
> + * struct lparctl_get_system_parameter - System parameter retrieval.
> + *
> + * @rtas_status: (output) The result of the ibm,get-system-parameter RTAS
> + *               call attempted by the kernel.
> + * @token: (input) System parameter token as specified in PAPR+ 7.3.16
> + *         "System Parameters Option".
> + * @data: (input and output) If applicable, any required input data ("OS
> + *        Service Entitlement Status" appears to be the only system
> + *        parameter that requires this). If @rtas_status is zero on return
> + *        from ioctl(), contains the value of the specified parameter. The
> + *        first two bytes contain the (big-endian) length of valid data in
> + *        both cases. If @rtas_status is not zero the contents are
> + *        indeterminate.
> + */
> +struct lparctl_get_system_parameter {
> +	__s32 rtas_status;
> +	__u16 token;
> +	union {
> +		__be16 length;
> +		__u8   data[4002];
> +	};
> +};
> +
> +#define LPARCTL_GET_SYSPARM LPARCTL_IOWR(0x01, struct lparctl_get_system_parameter)
> +
> +/**
> + * struct lparctl_set_system_parameter - System parameter update.
> + *
> + * @rtas_status: (output) The result of the ibm,get-system-parameter RTAS
> + *               call attempted by the kernel.
> + * @token: (input) System parameter token as specified in PAPR+ 7.3.16
> + *         "System Parameters Option".
> + * @data: (input) The desired value for the parameter corresponding to
> + *        @token. The first two bytes contain the (big-endian) length of
> + *        valid data.
> + */
> +struct lparctl_set_system_parameter {
> +	__s32 rtas_status;
> +	__u16 token;
> +	union {
> +		__be16 length;
> +		__u8   data[1026];
> +	};
> +};
> +
> +#define LPARCTL_SET_SYSPARM LPARCTL_IOWR(0x02, struct lparctl_set_system_parameter)
> +
> +#endif /* POWERPC_UAPI_LPARCTL_H */
> diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
> index 14e143b946a3..8fff7ed10d7c 100644
> --- a/arch/powerpc/platforms/pseries/Makefile
> +++ b/arch/powerpc/platforms/pseries/Makefile
> @@ -3,7 +3,7 @@ ccflags-$(CONFIG_PPC64)			:= $(NO_MINIMAL_TOC)
>  ccflags-$(CONFIG_PPC_PSERIES_DEBUG)	+= -DDEBUG
>  
>  obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
> -			   of_helpers.o \
> +			   of_helpers.o lparctl.o \
>  			   setup.o iommu.o event_sources.o ras.o \
>  			   firmware.o power.o dlpar.o mobility.o rng.o \
>  			   pci.o pci_dlpar.o eeh_pseries.o msi.o \
> diff --git a/arch/powerpc/platforms/pseries/lparctl.c b/arch/powerpc/platforms/pseries/lparctl.c
> new file mode 100644
> index 000000000000..11a33b8d9234
> --- /dev/null
> +++ b/arch/powerpc/platforms/pseries/lparctl.c
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Character device for accessing pseries/PAPR platform-specific
> + * facilities.
> + */
> +#define pr_fmt(fmt) "lparctl: " fmt
> +
> +#include <linux/build_bug.h>
> +#include <linux/fs.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/miscdevice.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <asm/lparctl.h>
> +#include <asm/machdep.h>
> +#include <asm/rtas.h>
> +
> +/**
> + * lparctl_get_sysparm() - Query a PAPR system parameter.
> + *
> + * Retrieve the value of the parameter indicated by the @token member of
> + * the &struct lparctl_get_system_parameter at @arg. If available and
> + * accessible, the value of the parameter is copied to the @data member of
> + * the &struct lparctl_get_system_parameter at @arg, and its @rtas_status
> + * field is set to zero. Otherwise, the @rtas_status member reflects the
> + * most recent RTAS call status, and the contents of @data are
> + * indeterminate.
> + *
> + * Non-zero RTAS call statuses are not translated to conventional errno
> + * values. Only kernel issues or API misuse result in an error at the
> + * syscall level. This is to serve the needs of legacy software which
> + * historically has accessed system parameters via the rtas() syscall,
> + * which has similar behavior.
> + *
> + * Return:
> + * * 0 - OK. Caller must examine the @rtas_status member of the returned
> + *       &struct lparctl_get_system_parameter to determine whether a parameter
> + *       value was copied out.
> + * * -EINVAL - The copied-in &struct lparctl_get_system_parameter.rtas_status
> + *             is non-zero.
> + * * -EFAULT - The supplied @arg is a bad address.
> + * * -ENOMEM - Allocation failure.
> + */
> +static long lparctl_get_sysparm(struct lparctl_get_system_parameter __user *argp)
> +{
> +	struct lparctl_get_system_parameter *gsp;
> +	long ret;
> +	int fwrc;
> +
> +	/*
> +	 * Special case to allow user space to probe the command.
> +	 */
> +	if (argp == NULL)
> +		return 0;
> +
> +	gsp = memdup_user(argp, sizeof(*gsp));
> +	if (IS_ERR(gsp)) {
> +		ret = PTR_ERR(gsp);
> +		goto err_return;
> +	}
> +
> +	ret = -EINVAL;
> +	if (gsp->rtas_status != 0)
> +		goto err_free;
> +
> +	do {
> +		static_assert(sizeof(gsp->data) <= sizeof(rtas_data_buf));
> +
> +		spin_lock(&rtas_data_buf_lock);
> +		memset(rtas_data_buf, 0, sizeof(rtas_data_buf));
> +		memcpy(rtas_data_buf, gsp->data, sizeof(gsp->data));
> +		fwrc = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
> +				 NULL, gsp->token, __pa(rtas_data_buf),
> +				 sizeof(gsp->data));
> +		if (fwrc == 0)
> +			memcpy(gsp->data, rtas_data_buf, sizeof(gsp->data));

May be the amount of data copied out to the user space could be
gsp->length. This would prevent copying 4K bytes all the time.

In a more general way, the size of the RTAS buffer is quite big, and I'm
wondering if all the data need to be copied back and forth to the kernel.

Unless there are a high frequency of calls this doesn't make sense, and
keeping the code simple might be the best way. Otherwise limiting the bytes
copied could help a bit.

> +		spin_unlock(&rtas_data_buf_lock);
> +	} while (rtas_busy_delay(fwrc));
> +
> +	gsp->rtas_status = fwrc;
> +	ret = 0;
> +	if (copy_to_user(argp, gsp, sizeof(*gsp)))
> +		ret = -EFAULT;
> +err_free:
> +	kfree(gsp);
> +err_return:
> +	return ret;
> +}
> +
> +static long lparctl_set_sysparm(struct lparctl_set_system_parameter __user *argp)
> +{
> +	struct lparctl_set_system_parameter *ssp;
> +	long ret;
> +	int fwrc;
> +
> +	/*
> +	 * Special case to allow user space to probe the command.
> +	 */
> +	if (argp == NULL)
> +		return 0;
> +
> +	ssp = memdup_user(argp, sizeof(*ssp));

As for the get case, would it be nice to limit the amount of bytes copied
to the interesting "length" ?

> +	if (IS_ERR(ssp)) {
> +		ret = PTR_ERR(ssp);
> +		goto err_return;
> +	}
> +
> +	ret = -EINVAL;
> +	if (ssp->rtas_status != 0)
> +		goto err_free;
> +
> +	do {
> +		static_assert(sizeof(ssp->data) <= sizeof(rtas_data_buf));
> +
> +		spin_lock(&rtas_data_buf_lock);
> +		memset(rtas_data_buf, 0, sizeof(rtas_data_buf));
> +		memcpy(rtas_data_buf, ssp->data, sizeof(ssp->data));
> +		fwrc = rtas_call(rtas_token("ibm,set-system-parameter"), 2, 1,
> +				 NULL, ssp->token, __pa(rtas_data_buf));
> +		spin_unlock(&rtas_data_buf_lock);
> +	} while (rtas_busy_delay(fwrc));
> +
> +	ret = 0;
> +	if (copy_to_user(&argp->rtas_status, &fwrc, sizeof(argp->rtas_status)))
> +		ret = -EFAULT;
> +err_free:
> +	kfree(ssp);
> +err_return:
> +	return ret;
> +}
> +
> +static long lparctl_dev_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
> +{
> +	void __user *argp = (void __user *)arg;
> +	long ret;
> +
> +	switch (ioctl) {
> +	case LPARCTL_GET_SYSPARM:
> +		ret = lparctl_get_sysparm(argp);
> +		break;
> +	case LPARCTL_SET_SYSPARM:
> +		ret = lparctl_set_sysparm(argp);
> +		break;
> +	default:
> +		ret = -ENOIOCTLCMD;
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static const struct file_operations lparctl_ops = {
> +	.unlocked_ioctl = lparctl_dev_ioctl,
> +	.llseek		= noop_llseek,
> +};
> +
> +static struct miscdevice lparctl_dev = {
> +	MISC_DYNAMIC_MINOR,
> +	"lparctl",
> +	&lparctl_ops,
> +};
> +
> +static __init int lparctl_init(void)
> +{
> +	int ret;
> +
> +	ret = misc_register(&lparctl_dev);
> +
> +	return ret;
> +}
> +machine_device_initcall(pseries, lparctl_init);

