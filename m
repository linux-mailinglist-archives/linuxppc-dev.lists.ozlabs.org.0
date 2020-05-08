Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5E51CBAB4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 00:26:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JlL43WM3zDr7G
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 08:26:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=bb6H3noL; 
 dkim-atps=neutral
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JlHn1pPMzDr8p
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 08:24:36 +1000 (AEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 048MHrOh185785;
 Fri, 8 May 2020 22:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=301Crul+nU3gSji5hSdljROXFIONJpvv32f+FfnQMcY=;
 b=bb6H3noLPeAZHjR/7hyTxoDJH6VG9hCOVX5QCqiYi1+KDlvnL27ZkNF912WPqANn2fYc
 CSJNNHPQb48mLyxlqO9fH8AbYFL2lZt4x5fVI4k1EOWAqN5PSQU+GL0e1e1eCwdX8w+3
 ETRC6ae/Wo3e+5jfu0OYCi+R4INWjI3qMJNjdwp/n6rlVGMZ6Br44EU/75cHKFlW9Syk
 S9iVN6OU253mMA+xTN+dQ52gifkTNpKtCG73hhismPvUksNyKhizuEA0J7A696jWW5SN
 2lOi2N6Fcol7v6T3v/Nf/E7q/50Sz9BlZYfYwJ1tbPUkc1GmOe9V43C1Cs5tYP+UVXkL EA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 30vtewwfg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 May 2020 22:23:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 048MLlag183500;
 Fri, 8 May 2020 22:23:19 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 30vtehnftv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 May 2020 22:23:19 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 048MMcC2014403;
 Fri, 8 May 2020 22:22:39 GMT
Received: from [192.168.2.157] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 08 May 2020 15:22:38 -0700
Subject: Re: [PATCH V3 2/3] mm/hugetlb: Define a generic fallback for
 is_hugepage_only_range()
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <1588907271-11920-1-git-send-email-anshuman.khandual@arm.com>
 <1588907271-11920-3-git-send-email-anshuman.khandual@arm.com>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <9fc622e1-45ff-b79f-ebe0-35614837456c@oracle.com>
Date: Fri, 8 May 2020 15:22:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588907271-11920-3-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9615
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005080188
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9615
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1011 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005080188
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/7/20 8:07 PM, Anshuman Khandual wrote:
> There are multiple similar definitions for is_hugepage_only_range() on
> various platforms. Lets just add it's generic fallback definition for
> platforms that do not override. This help reduce code duplication.
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Fenghua Yu <fenghua.yu@intel.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: x86@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm/include/asm/hugetlb.h     | 6 ------
>  arch/arm64/include/asm/hugetlb.h   | 6 ------
>  arch/ia64/include/asm/hugetlb.h    | 1 +
>  arch/mips/include/asm/hugetlb.h    | 7 -------
>  arch/parisc/include/asm/hugetlb.h  | 6 ------
>  arch/powerpc/include/asm/hugetlb.h | 1 +
>  arch/riscv/include/asm/hugetlb.h   | 6 ------
>  arch/s390/include/asm/hugetlb.h    | 7 -------
>  arch/sh/include/asm/hugetlb.h      | 6 ------
>  arch/sparc/include/asm/hugetlb.h   | 6 ------
>  arch/x86/include/asm/hugetlb.h     | 6 ------
>  include/linux/hugetlb.h            | 9 +++++++++
>  12 files changed, 11 insertions(+), 56 deletions(-)
> 
<snip>
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 43a1cef8f0f1..c01c0c6f7fd4 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -591,6 +591,15 @@ static inline unsigned int blocks_per_huge_page(struct hstate *h)
>  
>  #include <asm/hugetlb.h>
>  
> +#ifndef is_hugepage_only_range
> +static inline int is_hugepage_only_range(struct mm_struct *mm,
> +					unsigned long addr, unsigned long len)
> +{
> +	return 0;
> +}
> +#define is_hugepage_only_range is_hugepage_only_range
> +#endif
> +
>  #ifndef arch_make_huge_pte
>  static inline pte_t arch_make_huge_pte(pte_t entry, struct vm_area_struct *vma,
>  				       struct page *page, int writable)
> 

Did you try building without CONFIG_HUGETLB_PAGE defined?  I'm guessing
that you need a stub for is_hugepage_only_range().  Or, perhaps add this
to asm-generic/hugetlb.h?

-- 
Mike Kravetz
