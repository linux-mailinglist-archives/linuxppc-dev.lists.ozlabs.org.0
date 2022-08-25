Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (unknown [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 807C55A0974
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 09:05:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCv9X69zWz3bqx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 17:05:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cjfRXYwq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cjfRXYwq;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCv8p4tChz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 17:04:25 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27P6ikse015190
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 07:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : date : in-reply-to : references : content-type : mime-version
 : content-transfer-encoding; s=pp1;
 bh=5+Xfu2sqB0t+oiekHiRmmVCX7rGczCCqolNbd+asQmw=;
 b=cjfRXYwq2geBYTo3t23jOuaXMltayXXnpWswaXKnF+M8Gq9+pvw9RE6a7nB0ganmyAj7
 G/IDYBohCqGHs3kK8CjLPhCCTthLKXiQ3NR76pvV2CkCBxmhyP4uQuwhsqC95U0kxRPk
 gBwa2nm41rGgf74qRgmJDvDRKZM05pv5SoKhCzdV8nhC0DIkcAm6pXFUB2acjLUnFzKJ
 Mh7L1Wv22rmca1O4exYllLlR2DSQu+A6r5imGL8kRv5gNWaerqu0TH0yTRt4ghOZh/Gj
 dDfjQENgYCJygK5lnvs4gHWUhIVykMYkmFdgaiWmSH8+8LiO4JUv4Ci4/uTVM8w2uhZU qg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j6434gtt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 07:04:21 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27P6p7Sm023397
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 07:04:20 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma01fra.de.ibm.com with ESMTP id 3j2q88vevy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 07:04:19 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27P74Hbx19530114
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 07:04:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB72CA404D
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 07:04:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A3D4A4040
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 07:04:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 07:04:16 +0000 (GMT)
Received: from [9.43.185.18] (unknown [9.43.185.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BA71B60151;
	Thu, 25 Aug 2022 17:04:14 +1000 (AEST)
Message-ID: <93da4237b16e49b1f34659ac1bf930569f6756b7.camel@linux.ibm.com>
Subject: Re: [PATCH v4 01/20] powerpc: Remove asmlinkage from syscall
 handler definitions
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 25 Aug 2022 17:04:11 +1000
In-Reply-To: <20220824020548.62625-2-rmclure@linux.ibm.com>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
	 <20220824020548.62625-2-rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fnTqe00cV7lZGcKpQ1VUAagAKFf_QwV3
X-Proofpoint-ORIG-GUID: fnTqe00cV7lZGcKpQ1VUAagAKFf_QwV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_03,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 mlxscore=0 mlxlogscore=643
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208250024
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-08-24 at 12:05 +1000, Rohan McLure wrote:
> The asmlinkage macro has no special meaning in powerpc, and prior to
> this patch is used sporadically on some syscall handler definitions.
> On
> architectures that do not define asmlinkage, it resolves to extern
> "C"
> for C++ compilers and a nop otherwise. The current invocations of
> asmlinkage provide far from complete support for C++ toolchains, and
> so
> the macro serves no purpose in powerpc.
> 
> Remove all invocations of asmlinkage in arch/powerpc. These
> incidentally
> only occur in syscall definitions and prototypes.
> 
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

This does indeed get rid of every reference to asmlinkage in
arch/powerpc.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> V2 -> V3: new patch
> ---
>  arch/powerpc/include/asm/syscalls.h | 16 ++++++++--------
>  arch/powerpc/kernel/sys_ppc32.c     |  8 ++++----
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/syscalls.h
> b/arch/powerpc/include/asm/syscalls.h
> index a2b13e55254f..21c2faaa2957 100644
> --- a/arch/powerpc/include/asm/syscalls.h
> +++ b/arch/powerpc/include/asm/syscalls.h
> @@ -10,14 +10,14 @@
>  
>  struct rtas_args;
>  
> -asmlinkage long sys_mmap(unsigned long addr, size_t len,
> -               unsigned long prot, unsigned long flags,
> -               unsigned long fd, off_t offset);
> -asmlinkage long sys_mmap2(unsigned long addr, size_t len,
> -               unsigned long prot, unsigned long flags,
> -               unsigned long fd, unsigned long pgoff);
> -asmlinkage long ppc64_personality(unsigned long personality);
> -asmlinkage long sys_rtas(struct rtas_args __user *uargs);
> +long sys_mmap(unsigned long addr, size_t len,
> +             unsigned long prot, unsigned long flags,
> +             unsigned long fd, off_t offset);
> +long sys_mmap2(unsigned long addr, size_t len,
> +              unsigned long prot, unsigned long flags,
> +              unsigned long fd, unsigned long pgoff);
> +long ppc64_personality(unsigned long personality);
> +long sys_rtas(struct rtas_args __user *uargs);
>  int ppc_select(int n, fd_set __user *inp, fd_set __user *outp,
>                fd_set __user *exp, struct __kernel_old_timeval __user
> *tvp);
>  long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32
> offset_low,
> diff --git a/arch/powerpc/kernel/sys_ppc32.c
> b/arch/powerpc/kernel/sys_ppc32.c
> index 16ff0399a257..f4edcc9489fb 100644
> --- a/arch/powerpc/kernel/sys_ppc32.c
> +++ b/arch/powerpc/kernel/sys_ppc32.c
> @@ -85,20 +85,20 @@ compat_ssize_t compat_sys_readahead(int fd, u32
> r4, u32 offset1, u32 offset2, u3
>         return ksys_readahead(fd, merge_64(offset1, offset2), count);
>  }
>  
> -asmlinkage int compat_sys_truncate64(const char __user * path, u32
> reg4,
> +int compat_sys_truncate64(const char __user * path, u32 reg4,
>                                 unsigned long len1, unsigned long
> len2)
>  {
>         return ksys_truncate(path, merge_64(len1, len2));
>  }
>  
> -asmlinkage long compat_sys_fallocate(int fd, int mode, u32 offset1,
> u32 offset2,
> +long compat_sys_fallocate(int fd, int mode, u32 offset1, u32
> offset2,
>                                      u32 len1, u32 len2)
>  {
>         return ksys_fallocate(fd, mode, ((loff_t)offset1 << 32) |
> offset2,
>                              merge_64(len1, len2));
>  }
>  
> -asmlinkage int compat_sys_ftruncate64(unsigned int fd, u32 reg4,
> unsigned long len1,
> +int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long
> len1,
>                                  unsigned long len2)
>  {
>         return ksys_ftruncate(fd, merge_64(len1, len2));
> @@ -111,7 +111,7 @@ long ppc32_fadvise64(int fd, u32 unused, u32
> offset1, u32 offset2,
>                                  advice);
>  }
>  
> -asmlinkage long compat_sys_sync_file_range2(int fd, unsigned int
> flags,
> +long compat_sys_sync_file_range2(int fd, unsigned int flags,
>                                    unsigned offset1, unsigned
> offset2,
>                                    unsigned nbytes1, unsigned
> nbytes2)
>  {

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

