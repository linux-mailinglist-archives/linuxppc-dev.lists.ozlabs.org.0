Return-Path: <linuxppc-dev+bounces-8606-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4994AB9B86
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 May 2025 13:54:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzQVY0TJVz2yK9;
	Fri, 16 May 2025 21:54:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=143.55.146.78
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747396484;
	cv=none; b=kxW/O2ixY/aMPCdPZNMRi/KRjLrFGF+3v2OOAhoqYV2N7+hPHPwNAUaL7rpgqQQv/PoMMeNCVGtA37APaFulGP3Ih8lfMAe9LFfo/n2oQX6x3yWNnhffTM0TfO0Ykt9/3NUk+kZ1WJpPF/Z665WKSpYSMiafuLbB7DATtmES5/GKpuaaHhfkFW8WK+04t/QnTdIbtnST9JX/Bx3qCueHfMtOhBR66Dv80ieJL5ssjLRRQCTP/ozvOAuqrqETT5I6kTb0zi2vkUkI4rcbPqIyV/7NBelitvB1FEStRzVZqhhtmMGuzjgFOcp/F67Jvv+giuK+/RtgPDonHi+u0DeCFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747396484; c=relaxed/relaxed;
	bh=bAYUGQc7Hv5rKaaMRmows/SqSVf4K8fqsjT9i6Qc9Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJXxZQQo8q//vJe9cqVAmJcdSqv7eKecmoJc6VMgvlcBD07R8dTlPSEdLYTN5X8g7QDOsse+jtWnncxjzs9WtUQfVqTRMwenLG4oeRnYfjXxHbA6iQIyrNhnobbsqa7wxjCxH4SWt/ATtKSwhpbFx8z5JT19ZzQfRX9Z6h7OFC66NhzsxKp+xDW3aa9t833yMnpz9Z87iA/yHeZM/HcMD2IoC0OCYcGc3+8ldxDWPGTnVm5hP2C9cNlgZoQ84+jdRaoWVqjzaiZCdt/rfrwE/I+oHVDwtj4Q9hSEVfLbJmi9qzR8UvQ6iadDPEXIEruH9ITxzsGXeNWcz4ZUkK9U3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=iram.es; dkim=pass (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=dkim3 header.b=rV4MaNF3; dkim-atps=neutral; spf=pass (client-ip=143.55.146.78; helo=mx07-006a4e02.pphosted.com; envelope-from=paubert@iram.es; receiver=lists.ozlabs.org) smtp.mailfrom=iram.es
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=iram.es
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=dkim3 header.b=rV4MaNF3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iram.es (client-ip=143.55.146.78; helo=mx07-006a4e02.pphosted.com; envelope-from=paubert@iram.es; receiver=lists.ozlabs.org)
X-Greylist: delayed 2756 seconds by postgrey-1.37 at boromir; Fri, 16 May 2025 21:54:42 AEST
Received: from mx07-006a4e02.pphosted.com (mx07-006a4e02.pphosted.com [143.55.146.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZzQVV1VjBz2yGy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 May 2025 21:54:40 +1000 (AEST)
Received: from pps.filterd (m0316687.ppops.net [127.0.0.1])
	by m0316687.ppops.net (8.18.1.2/8.18.1.2) with ESMTP id 54G9xZ29008804;
	Fri, 16 May 2025 13:06:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iram.es; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=dkim3; bh=bAYUGQc7Hv5rKaaMRmows/SqSVf4
	K8fqsjT9i6Qc9Mc=; b=rV4MaNF34s8G27C5bOSrMOefpzbnwgynEvS6vcjxBy1i
	Mq+s4gKZkkLyil0gXiDBo0yYmYIfDW/bFZuwRaB5EhWmWGdmtApMGh/Z/ROFrs2M
	KuzZ2+VjjZvyjKfPt/9g6vw7GCNsvl7WQ7Ps0Tm51un0GvjGdyEYE/rS1ibfChUk
	F8ub0lMfbasg+cSLngx5oFK03GvmcqC+PWojhrY1UkyJsxv3zmb7uZAHT2b8ZVzh
	7CQmgVe7hSNIPfkh33qf9EW4IrSUgipP1wcfNBwDb+Qe9hk7qZ0hvw07HPce+b7x
	4xET90GnlLho/Ijpa+/13LP6PFZOgAxWvMpPleJ5YA==
Received: from sim.rediris.es (mta-out04.sim.rediris.es [130.206.24.46])
	by m0316687.ppops.net (PPS) with ESMTPS id 46p0mfm9qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 13:06:57 +0200 (MEST)
Received: from sim.rediris.es (localhost.localdomain [127.0.0.1])
	by sim.rediris.es (Postfix) with ESMTPS id C5065181FA5;
	Fri, 16 May 2025 13:06:56 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by sim.rediris.es (Postfix) with ESMTP id A8707181FAB;
	Fri, 16 May 2025 13:06:56 +0200 (CEST)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out04.sim.rediris.es
Received: from sim.rediris.es ([127.0.0.1])
 by localhost (mta-out04.sim.rediris.es [127.0.0.1]) (amavis, port 10026)
 with ESMTP id IkzjQ4rBb6FP; Fri, 16 May 2025 13:06:56 +0200 (CEST)
Received: from lt-gp.iram.es (haproxy01.sim.rediris.es [130.206.24.69])
	by sim.rediris.es (Postfix) with ESMTPA id E3CE4181FA5;
	Fri, 16 May 2025 13:06:55 +0200 (CEST)
Date: Fri, 16 May 2025 13:06:54 +0200
From: Gabriel Paubert <paubert@iram.es>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Danny Tsen <dtsen@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Add gcc 128-bit shift helpers
Message-ID: <aCccToR_71ETmPd-@lt-gp.iram.es>
References: <202505152053.FrKekjCe-lkp@intel.com>
 <aCb7WW2gRrtEmgqD@gondor.apana.org.au>
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
In-Reply-To: <aCb7WW2gRrtEmgqD@gondor.apana.org.au>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEwNSBTYWx0ZWRfX7CsnzgdvuQVa
 Hc0cXDxfh9yA4+m/JqkPrYv58GcaKF2gqvrkHtx4ktpgF+qchKBAmO1vfHLNXItrxaNVEmmS5yA
 iQ5B0ELhcz8FOhNRnOfb++zNkj5qRa44Bdxqjz9WyKxw1Fkqk7eHk92A/qc675NjLSAYuI+0szR
 ve5FtbhAH+qplRVNcdyhzkKqJJf8mQg+pncjyCpBWQKSeKOjA0FbBvuJrcxES4u6kycmPs28fDz
 R6+Wk8hrNqdnWD/ofZ/P2fwtxJ92VlL6/NdE/C/j7DYd/UChPGvNdibzZNOWJuKjK6liRb3pks5
 EB64UGcBZCabpVQrWY839k5+3fsfT+/36RHAmhB6b+++0oB13dY9s2aIezsZ7kX0PQla7Ejbeo9
 XVSPThMtUaR7gPt/oCEHfgFOOf+h0QI0jvps/AhgmqsZwQxddlKBu+vixOL25xlnfTGh4RNX
X-Proofpoint-GUID: H_SYM61NNgWlRx99XEkaczkpNMGGkLti
X-Proofpoint-ORIG-GUID: H_SYM61NNgWlRx99XEkaczkpNMGGkLti
X-Authority-Analysis: v=2.4 cv=EtzSrTcA c=1 sm=1 tr=0 ts=68271c51 cx=c_pps
 a=Kke4r4mcy+kRAsMtzpf9hg==:117 a=Kke4r4mcy+kRAsMtzpf9hg==:17
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=FNyBlpCuAAAA:8 a=LpSzYAz8VI8wa4E5YnoA:9 a=CjuIK1q_8ugA:10
 a=mmqRlSCDY2ywfjPLJ4af:22 a=RlW-AWeGUCXs_Nkyno-6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=salida_notspam policy=salida score=0
 mlxscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160105
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 16, 2025 at 04:46:17PM +0800, Herbert Xu wrote:
> On Thu, May 15, 2025 at 08:06:09PM +0800, kernel test robot wrote:
> > tree:   https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git__;!!D9dNQwwGXtA!TSuOAutxjuD3Hp-RC0Fw9dTNuagdCKeNLTN71tv_OmhUxyAPLfIfwwpZop5pKFXgS4Jfkt830_tEMkbHT4vfog$  master
> > head:   484803582c77061b470ac64a634f25f89715be3f
> > commit: c66d7ebbe2fa14e41913adb421090a7426f59786 [10914/11408] crypto: powerpc/poly1305 - Add SIMD fallback
> > config: powerpc64-randconfig-002-20250515 (https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20250515/202505152053.FrKekjCe-lkp@intel.com/config__;!!D9dNQwwGXtA!TSuOAutxjuD3Hp-RC0Fw9dTNuagdCKeNLTN71tv_OmhUxyAPLfIfwwpZop5pKFXgS4Jfkt830_tEMkaPDLMaoA$ )
> > compiler: powerpc64-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build): (https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20250515/202505152053.FrKekjCe-lkp@intel.com/reproduce__;!!D9dNQwwGXtA!TSuOAutxjuD3Hp-RC0Fw9dTNuagdCKeNLTN71tv_OmhUxyAPLfIfwwpZop5pKFXgS4Jfkt830_tEMkbNYWK3LQ$ )
> 
> Thanks for the report.  This patch should fix the problem.

It won't work for big endian, nor for 32 bit obviously.

Besides that, in arch/power/kernel/misc_32.S, you'll find a branchless
version of these functions. It's for 64 bit shifts on 32 bit big-endian
but it can easily be adapted to 128 bit shifts on 64 bit processors
(swapping r3 and r4 depending on endianness).

Several functions of kernel/misc_32.S should arguably be moved to lib/.

Cheers,
Gabriel


> 
> ---8<---
> When optimising for size, gcc generates out-of-line calls for 128-bit
> integer shifts.  Add these functions to avoid build errors.
> 
> Fixes: c66d7ebbe2fa ("crypto: powerpc/poly1305 - Add SIMD fallback")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202505152053.FrKekjCe-lkp@intel.com/__;!!D9dNQwwGXtA!TSuOAutxjuD3Hp-RC0Fw9dTNuagdCKeNLTN71tv_OmhUxyAPLfIfwwpZop5pKFXgS4Jfkt830_tEMkbo7rsvYg$ 
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> 
> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> index 1cd74673cbf7..a41c071c1652 100644
> --- a/arch/powerpc/lib/Makefile
> +++ b/arch/powerpc/lib/Makefile
> @@ -87,3 +87,5 @@ obj-$(CONFIG_CRC_T10DIF_ARCH) += crc-t10dif-powerpc.o
>  crc-t10dif-powerpc-y := crc-t10dif-glue.o crct10dif-vpmsum_asm.o
>  
>  obj-$(CONFIG_PPC64) += $(obj64-y)
> +
> +obj-$(CONFIG_ARCH_SUPPORTS_INT128) += tishift.o
> diff --git a/arch/powerpc/lib/tishift.S b/arch/powerpc/lib/tishift.S
> new file mode 100644
> index 000000000000..79afef2d8d54
> --- /dev/null
> +++ b/arch/powerpc/lib/tishift.S
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2025 Herbert Xu <herbert@gondor.apana.org.au>
> + */
> +#include <asm/ppc_asm.h>
> +#include <linux/export.h>
> +
> +_GLOBAL(__lshrti3)
> +	cmplwi	r5,63
> +	ble	1f
> +	addi	r5,r5,-64
> +	srd	r3,r4,r5
> +	li	r4,0
> +	blr
> +1:
> +	subfic	r7,r5,64
> +	srd	r3,r3,r5
> +	sld	r6,r4,r7
> +	srd	r4,r4,r5
> +	or	r3,r3,r6
> +	blr
> +EXPORT_SYMBOL(__lshrti3)
> +
> +_GLOBAL(__ashrti3)
> +	cmplwi	r5,63
> +	ble	1f
> +	addi	r5,r5,-64
> +	srad	r3,r4,r5
> +	sradi	r4,r4,63
> +	blr
> +1:
> +	subfic	r7,r5,64
> +	srd	r3,r3,r5
> +	sld	r6,r4,r7
> +	srad	r4,r4,r5
> +	or	r3,r3,r6
> +	blr
> +EXPORT_SYMBOL(__ashrti3)
> +
> +_GLOBAL(__ashlti3)
> +	cmplwi	r5,63
> +	ble	1f
> +	addi	r5,r5,-64
> +	sld	r4,r3,r5
> +	li	r3,0
> +	blr
> +1:
> +	subfic	r7,r5,64
> +	sld	r4,r4,r5
> +	srd	r6,r3,r7
> +	sld	r3,r3,r5
> +	or	r4,r4,r6
> +	blr
> +EXPORT_SYMBOL(__ashlti3)
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: https://urldefense.com/v3/__http://gondor.apana.org.au/*herbert/__;fg!!D9dNQwwGXtA!TSuOAutxjuD3Hp-RC0Fw9dTNuagdCKeNLTN71tv_OmhUxyAPLfIfwwpZop5pKFXgS4Jfkt830_tEMkbwt6bO1g$ 
> PGP Key: https://urldefense.com/v3/__http://gondor.apana.org.au/*herbert/pubkey.txt__;fg!!D9dNQwwGXtA!TSuOAutxjuD3Hp-RC0Fw9dTNuagdCKeNLTN71tv_OmhUxyAPLfIfwwpZop5pKFXgS4Jfkt830_tEMkam0aoZDQ$ 
> 
 


