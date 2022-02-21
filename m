Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DFB4BD9C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 14:00:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2MqN2qqJz3cPp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 00:00:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H3p6X9GG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=H3p6X9GG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2Mpc16rKz2xsY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 00:00:07 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21LCmEvD019897
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 13:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=sLG05mZLeaokp+Qe37JaO76vjQUrjYhYKeuz0FqgArk=;
 b=H3p6X9GGp03GtHqEAZ3v52PWTf5w/0gLEAezTNWBcd4mdVSNm+H0JcNk0rE5CIk+G5yK
 cH3ZVfgI9TiFNRSXtC6rESkreVLWS/XkK2cCTO/wIS6l/4bTQw04BkPWpA3aXxy/Gz1D
 uETUlTw6Hn2fi0y0UkOvKg81giJvpoEqEuLej7XOL1SCKXGwAEfcpDEojG1l49zl7m6n
 r3W/pEPhCbNauQcldMHcKqoplR5mb4Nb59w0HVTzdjpG1kht3O3HRcO+U1Op9rTm/KBa
 mbthr4PonoBmYt6gN5VfyuOWerbBFTdVoUwcC0PEnnaewnwx0vnM2wgrW77wDgdS2wri Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ecb28r652-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 13:00:04 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21LCmKJd019958
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 13:00:03 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ecb28r64c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 13:00:03 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21LCwru9002947;
 Mon, 21 Feb 2022 13:00:03 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 3ear697xe9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 13:00:03 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21LD02BR19333490
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 13:00:02 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E4DCC606C;
 Mon, 21 Feb 2022 13:00:02 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6500CC6065;
 Mon, 21 Feb 2022 13:00:01 +0000 (GMT)
Received: from localhost (unknown [9.211.62.223])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 21 Feb 2022 13:00:01 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 3/3] KVM: PPC: Add KVM_CAP_PPC_AIL_MODE_3
In-Reply-To: <20220221072353.2219034-4-npiggin@gmail.com>
References: <20220221072353.2219034-1-npiggin@gmail.com>
 <20220221072353.2219034-4-npiggin@gmail.com>
Date: Mon, 21 Feb 2022 09:59:59 -0300
Message-ID: <87fsoce5o0.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: h86sWPWHuL7vBYydjNJts7J091tcNIH5
X-Proofpoint-GUID: I4dRDjUxVe9u6qWAZJa-rZK9eW_9-JS9
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_06,2022-02-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202210075
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Add KVM_CAP_PPC_AIL_MODE_3 to advertise the capability to set the AIL
> resource mode to 3 with the H_SET_MODE hypercall. This capability
> differs between processor types and KVM types (PR, HV, Nested HV), and
> affects guest-visible behaviour.
>
> QEMU will implement a cap-ail-mode-3 to control this behaviour[1], and
> use the KVM CAP if available to determine KVM support[2].
>
> [1] https://lists.nongnu.org/archive/html/qemu-ppc/2022-02/msg00437.html
> [2] https://lists.nongnu.org/archive/html/qemu-ppc/2022-02/msg00439.html
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  Documentation/virt/kvm/api.rst         | 14 ++++++++++++++
>  arch/powerpc/include/asm/setup.h       |  2 ++
>  arch/powerpc/kvm/powerpc.c             | 20 ++++++++++++++++++++
>  arch/powerpc/platforms/pseries/setup.c | 12 +++++++++++-
>  include/uapi/linux/kvm.h               |  1 +
>  tools/include/uapi/linux/kvm.h         |  1 +
>  6 files changed, 49 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index bb8cfddbb22d..404056a9a35a 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6995,6 +6995,20 @@ indicated by the fd to the VM this is called on.
>  This is intended to support intra-host migration of VMs between userspace VMMs,
>  upgrading the VMM process without interrupting the guest.
>
> +7.30 KVM_CAP_PPC_AIL_MODE_3
> +-------------------------------
> +
> +:Capability: KVM_CAP_PPC_AIL_MODE_3
> +:Architectures: ppc
> +:Type: vm
> +
> +This capability indicates that the kernel supports the mode 3 setting for the
> +"Address Translation Mode on Interrupt" aka "Alternate Interrupt Location"
> +resource that is controlled with the H_SET_MODE hypercall.
> +
> +This capability allows a guest kernel to use a better-performance mode for
> +handling interrupts and system calls.
> +
>  8. Other capabilities.
>  ======================
>
> diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
> index d0d3dd531c7f..a555fb77258a 100644
> --- a/arch/powerpc/include/asm/setup.h
> +++ b/arch/powerpc/include/asm/setup.h
> @@ -28,11 +28,13 @@ void setup_panic(void);
>  #define ARCH_PANIC_TIMEOUT 180
>
>  #ifdef CONFIG_PPC_PSERIES
> +extern bool pseries_reloc_on_exception(void);
>  extern bool pseries_enable_reloc_on_exc(void);
>  extern void pseries_disable_reloc_on_exc(void);
>  extern void pseries_big_endian_exceptions(void);
>  void __init pseries_little_endian_exceptions(void);
>  #else
> +static inline bool pseries_reloc_on_exception(void) { return false; }
>  static inline bool pseries_enable_reloc_on_exc(void) { return false; }
>  static inline void pseries_disable_reloc_on_exc(void) {}
>  static inline void pseries_big_endian_exceptions(void) {}
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 2ad0ccd202d5..7dc101ea778c 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -678,6 +678,26 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  		r = 1;
>  		break;
>  #endif
> +	case KVM_CAP_PPC_AIL_MODE_3:
> +		/*
> +		 * KVM PR, POWER7, and some POWER9s don't support AIL=3 mode.
> +		 * The POWER9s can support it if the guest runs in hash mode,
> +		 * but QEMU doesn't necessarily query the capability in time.
> +		 */
> +		if (hv_enabled) {
> +			if (kvmhv_on_pseries()) {
> +				if (pseries_reloc_on_exception())
> +					r = 1;
> +			} else if (cpu_has_feature(CPU_FTR_ARCH_207S) &&
> +				  !cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
> +				r = 1;
> +			} else {
> +				r = 0;
> +			}
> +		} else {
> +			r = 0;
> +		}
> +		break;
>  	default:
>  		r = 0;
>  		break;
> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
> index 83a04d967a59..182525c2abd5 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -353,6 +353,13 @@ static void pseries_lpar_idle(void)
>  	pseries_idle_epilog();
>  }
>
> +static bool pseries_reloc_on_exception_enabled;
> +
> +bool pseries_reloc_on_exception(void)
> +{
> +	return pseries_reloc_on_exception_enabled;
> +}
> +
>  /*
>   * Enable relocation on during exceptions. This has partition wide scope and
>   * may take a while to complete, if it takes longer than one second we will
> @@ -377,6 +384,7 @@ bool pseries_enable_reloc_on_exc(void)
>  					" on exceptions: %ld\n", rc);
>  				return false;
>  			}
> +			pseries_reloc_on_exception_enabled = true;
>  			return true;
>  		}
>
> @@ -404,7 +412,9 @@ void pseries_disable_reloc_on_exc(void)
>  			break;
>  		mdelay(get_longbusy_msecs(rc));
>  	}
> -	if (rc != H_SUCCESS)
> +	if (rc == H_SUCCESS)
> +		pseries_reloc_on_exception_enabled = false;
> +	else
>  		pr_warn("Warning: Failed to disable relocation on exceptions: %ld\n",
>  			rc);
>  }
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 9563d294f181..65f231d048a8 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1133,6 +1133,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM 206
>  #define KVM_CAP_VM_GPA_BITS 207
>  #define KVM_CAP_XSAVE2 208
> +#define KVM_CAP_PPC_AIL_MODE_3 209
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>
> diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
> index 9563d294f181..65f231d048a8 100644
> --- a/tools/include/uapi/linux/kvm.h
> +++ b/tools/include/uapi/linux/kvm.h
> @@ -1133,6 +1133,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM 206
>  #define KVM_CAP_VM_GPA_BITS 207
>  #define KVM_CAP_XSAVE2 208
> +#define KVM_CAP_PPC_AIL_MODE_3 209
>
>  #ifdef KVM_CAP_IRQ_ROUTING
