Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0BC57992A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 13:59:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnHSj16b8z2yMk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 21:59:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XsGGcQhg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=pmorel@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XsGGcQhg;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnHRx5nVyz2xmd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 21:59:09 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JBhBZS010624;
	Tue, 19 Jul 2022 11:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=1bpmIwvLzc5rcXgHQnnpEZ/Q/uGD8Ks+HgDZHU3a1oU=;
 b=XsGGcQhgQqeaBTDby6kBDSnY3UWfeOhcYCvhv1wB6ujJcxJiGxS0MZNEpZpP82C7GxFD
 qy0fOIgAnaZwSxQsme0oU2OpnkxYpE+uDH15E6VZ9FqoTPk7uueHM+xVjuA9H19obp0k
 s6iB/AuopbdOfFuRs3T2itJljC8cZmRau6vqNPrTRTAxzfHZyritEJt69CrO+tr2fYk/
 a5TusVt3iaTwjyfbAiIDSIJqvsZkWlSpdU3F1bDpC3b6TgQn/5VHYn1uIF65z9GqayDx
 YdNoMbE1y4UxcJQu+DMYqVGDiinlaBUTWkz8lq6RHrSk8VDZR7Xjb4CnhDZwmjv11EvB 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hdv01gdw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Jul 2022 11:58:04 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26JBhkdX012906;
	Tue, 19 Jul 2022 11:58:03 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hdv01gduu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Jul 2022 11:58:03 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26JBoeWj007350;
	Tue, 19 Jul 2022 11:58:00 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma01fra.de.ibm.com with ESMTP id 3hbmy8v4fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Jul 2022 11:58:00 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26JBvvjl21299544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 Jul 2022 11:57:57 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2952D4C040;
	Tue, 19 Jul 2022 11:57:57 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3ABB34C044;
	Tue, 19 Jul 2022 11:57:54 +0000 (GMT)
Received: from [9.171.46.191] (unknown [9.171.46.191])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 19 Jul 2022 11:57:54 +0000 (GMT)
Message-ID: <38027ee9-bc70-6a2c-202c-1b4d2c9bdc74@linux.ibm.com>
Date: Tue, 19 Jul 2022 14:02:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 1/2] asm-generic: Remove pci.h copying remaining code
 to x86
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, LKML <linux-kernel@vger.kernel.org>
References: <20220718004114.3925745-1-shorne@gmail.com>
 <20220718004114.3925745-2-shorne@gmail.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <20220718004114.3925745-2-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QgXJydNrlCCOif_CNKu_BbM2Q3VZjQ3W
X-Proofpoint-GUID: cwEMgAD_v6m2Yb1ImP5KSKWCOkQJrtGO
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_22,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 clxscore=1011 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207190048
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
Cc: linux-ia64@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pci@vger.kernel.org, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@lin
 utronix.de>, Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, Nick Child <nick.child@ibm.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/18/22 02:41, Stafford Horne wrote:
> The generic pci.h header now only provides a definition of
> pci_get_legacy_ide_irq which is used by architectures that support PNP.
> Of the architectures that use asm-generic/pci.h this is only x86.
> 
> This patch removes the old pci.h in order to make room for a new
> pci.h to be used by arm64, riscv, openrisc, etc.
> 
> The existing code in pci.h is moved out to x86.  On other architectures
> we clean up any outstanding references.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
> Since v2:
>   - Remove pci_get_legacy_ide_irq in m68k
> Since v1:
>   - Remove pci_get_legacy_ide_irq for most architectures as its not needed.
> 
>   arch/alpha/include/asm/pci.h   |  1 -
>   arch/ia64/include/asm/pci.h    |  1 -
>   arch/m68k/include/asm/pci.h    |  2 --
>   arch/powerpc/include/asm/pci.h |  1 -
>   arch/s390/include/asm/pci.h    |  1 -
>   arch/sparc/include/asm/pci.h   |  9 ---------
>   arch/x86/include/asm/pci.h     |  6 ++++--
>   arch/xtensa/include/asm/pci.h  |  3 ---
>   include/asm-generic/pci.h      | 17 -----------------
>   9 files changed, 4 insertions(+), 37 deletions(-)
>   delete mode 100644 include/asm-generic/pci.h
> 
> diff --git a/arch/alpha/include/asm/pci.h b/arch/alpha/include/asm/pci.h
> index cf6bc1e64d66..8ac5af0fc4da 100644
> --- a/arch/alpha/include/asm/pci.h
> +++ b/arch/alpha/include/asm/pci.h
> @@ -56,7 +56,6 @@ struct pci_controller {
>   
>   /* IOMMU controls.  */
>   
> -/* TODO: integrate with include/asm-generic/pci.h ? */
>   static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
>   {
>   	return channel ? 15 : 14;
> diff --git a/arch/ia64/include/asm/pci.h b/arch/ia64/include/asm/pci.h
> index 8c163d1d0189..218412d963c2 100644
> --- a/arch/ia64/include/asm/pci.h
> +++ b/arch/ia64/include/asm/pci.h
> @@ -63,7 +63,6 @@ static inline int pci_proc_domain(struct pci_bus *bus)
>   	return (pci_domain_nr(bus) != 0);
>   }
>   
> -#define HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
>   static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
>   {
>   	return channel ? isa_irq_to_vector(15) : isa_irq_to_vector(14);
> diff --git a/arch/m68k/include/asm/pci.h b/arch/m68k/include/asm/pci.h
> index 5a4bc223743b..ccdfa0dc8413 100644
> --- a/arch/m68k/include/asm/pci.h
> +++ b/arch/m68k/include/asm/pci.h
> @@ -2,8 +2,6 @@
>   #ifndef _ASM_M68K_PCI_H
>   #define _ASM_M68K_PCI_H
>   
> -#include <asm-generic/pci.h>
> -
>   #define	pcibios_assign_all_busses()	1
>   
>   #define	PCIBIOS_MIN_IO		0x00000100
> diff --git a/arch/powerpc/include/asm/pci.h b/arch/powerpc/include/asm/pci.h
> index 915d6ee4b40a..f9da506751bb 100644
> --- a/arch/powerpc/include/asm/pci.h
> +++ b/arch/powerpc/include/asm/pci.h
> @@ -39,7 +39,6 @@
>   #define pcibios_assign_all_busses() \
>   	(pci_has_flag(PCI_REASSIGN_ALL_BUS))
>   
> -#define HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
>   static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
>   {
>   	if (ppc_md.pci_get_legacy_ide_irq)
> diff --git a/arch/s390/include/asm/pci.h b/arch/s390/include/asm/pci.h
> index fdb9745ee998..5889ddcbc374 100644
> --- a/arch/s390/include/asm/pci.h
> +++ b/arch/s390/include/asm/pci.h
> @@ -6,7 +6,6 @@
>   #include <linux/mutex.h>
>   #include <linux/iommu.h>
>   #include <linux/pci_hotplug.h>
> -#include <asm-generic/pci.h>
>   #include <asm/pci_clp.h>
>   #include <asm/pci_debug.h>
>   #include <asm/sclp.h>

Did not notice any problem for S390.

Acked-by: Pierre Morel <pmorel@linux.ibm.com>



-- 
Pierre Morel
IBM Lab Boeblingen
