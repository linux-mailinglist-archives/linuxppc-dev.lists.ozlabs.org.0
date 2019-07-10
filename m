Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFFC646F2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 15:26:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kKh93F6mzDqXt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 23:26:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=janani@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kKcH2FRnzDqbG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 23:22:37 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6ADI9jh118415
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 09:22:31 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tne92eqb8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 09:22:31 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <janani@linux.ibm.com>;
 Wed, 10 Jul 2019 14:22:30 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 10 Jul 2019 14:22:28 +0100
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6ADMQHe37355980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jul 2019 13:22:26 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9DA06A047;
 Wed, 10 Jul 2019 13:22:26 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F6FF6A057;
 Wed, 10 Jul 2019 13:22:26 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jul 2019 13:22:26 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 10 Jul 2019 08:24:56 -0500
From: janani <janani@linux.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v5 7/7] KVM: PPC: Ultravisor: Add PPC_UV config option
Organization: IBM
Mail-Reply-To: janani@linux.ibm.com
In-Reply-To: <20190709102545.9187-8-bharata@linux.ibm.com>
References: <20190709102545.9187-1-bharata@linux.ibm.com>
 <20190709102545.9187-8-bharata@linux.ibm.com>
X-Sender: janani@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19071013-0036-0000-0000-00000AD591AA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011404; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01230167; UDB=6.00647931; IPR=6.01011436; 
 MB=3.00027665; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-10 13:22:30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071013-0037-0000-0000-00004C890942
Message-Id: <6759c8a79b2962d07ed99f2b1cd05637@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-10_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907100155
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
Reply-To: janani@linux.ibm.com
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 Linuxppc-dev <linuxppc-dev-bounces+janani=linux.ibm.com@lists.ozlabs.org>,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-07-09 05:25, Bharata B Rao wrote:
> From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
> 
> CONFIG_PPC_UV adds support for ultravisor.
> 
> Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> [ Update config help and commit message ]
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
  Reviewed-by: Janani Janakiraman <janani@linux.ibm.com>
> ---
>  arch/powerpc/Kconfig | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index f0e5b38d52e8..20c6c213d2be 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -440,6 +440,26 @@ config PPC_TRANSACTIONAL_MEM
>         ---help---
>           Support user-mode Transactional Memory on POWERPC.
> 
> +config PPC_UV
> +	bool "Ultravisor support"
> +	depends on KVM_BOOK3S_HV_POSSIBLE
> +	select HMM_MIRROR
> +	select HMM
> +	select ZONE_DEVICE
> +	select MIGRATE_VMA_HELPER
> +	select DEV_PAGEMAP_OPS
> +	select DEVICE_PRIVATE
> +	select MEMORY_HOTPLUG
> +	select MEMORY_HOTREMOVE
> +	default n
> +	help
> +	  This option paravirtualizes the kernel to run in POWER platforms 
> that
> +	  supports the Protected Execution Facility (PEF). In such platforms,
> +	  the ultravisor firmware runs at a privilege level above the
> +	  hypervisor.
> +
> +	  If unsure, say "N".
> +
>  config LD_HEAD_STUB_CATCH
>  	bool "Reserve 256 bytes to cope with linker stubs in HEAD text" if 
> EXPERT
>  	depends on PPC64

