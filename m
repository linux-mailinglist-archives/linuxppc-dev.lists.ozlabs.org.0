Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1D9F03CE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 18:07:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476x110ZBkzF50g
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 04:07:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476wyb1DKkzF4yF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 04:05:10 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA5Gwcoe146817
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 5 Nov 2019 12:05:08 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w3csx0r07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2019 12:05:06 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xA5H0rRs016998
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 5 Nov 2019 17:03:43 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 2w11e7yae8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2019 17:03:43 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA5H3gGl53870866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 5 Nov 2019 17:03:42 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4281AE05C
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 17:03:42 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C87BAE060
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 17:03:42 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.85.144.27])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 17:03:42 +0000 (GMT)
Subject: Re: [PATCH 0/9] Fixes and Enablement of ibm,drc-info property
To: linuxppc-dev@lists.ozlabs.org
References: <1572967453-9586-1-git-send-email-tyreld@linux.ibm.com>
From: Thomas Falcon <tlfalcon@linux.ibm.com>
Message-ID: <6958da5b-c518-64c2-50e3-db3f169d2337@linux.ibm.com>
Date: Tue, 5 Nov 2019 11:03:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572967453-9586-1-git-send-email-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-05_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911050140
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/5/19 9:24 AM, Tyrel Datwyler wrote:

Hi, just pointing out a few typos...
> There was a previous effort to add support for the PAPR
> architected ibm,drc-info property. This property provides a more
> memory compact representation of a paritions Dynamic Reconfig
s/paritions/partition's
> Connectors (DRC). These can otherwise be thought of as currently
> partitioned, or available but yet to be partitioned system resources
> such as cpus, memory, and physical/logical IOA devices.
>
> The initial implementation proved buggy and was fully turned of by

s/turned of/turned off

> disabling the bit in the appropriate CAS support vector. We now have
> PowerVM firmware in the field that supports this new property, and
> further to suppport partitions with 24TB+ of possible memory this
s/suppport/support
> property is required to perform platform migration.
>
> This serious fixs the short comings of the previous submission

Either "seriously fixes the shortcomings", or "fixes the serious 
shortcomings?"

Thanks,

Tom

> in the areas of general implementation, cpu hotplug, and IOA hotplug.
>
> Tyrel Datwyler (9):
>    powerpc/pseries: Fix bad drc_index_start value parsing of drc-info
>      entry
>    powerpc/pseries: Fix drc-info mappings of logical cpus to drc-index
>    powerpc/pseries: Add cpu DLPAR support for drc-info property
>    PCI: rpaphp: Fix up pointer to first drc-info entry
>    PCI: rpaphp: Don't rely on firmware feature to imply drc-info support
>    PCI: rpaphp: Add drc-info support for hotplug slot registration
>    PCI: rpaphp: annotate and correctly byte swap DRC properties
>    PCI: rpaphp: Correctly match ibm,my-drc-index to drc-name when using
>      drc-info
>    powerpc/pseries: Enable support for ibm,drc-info property
>
>   arch/powerpc/kernel/prom_init.c                 |   2 +-
>   arch/powerpc/platforms/pseries/hotplug-cpu.c    | 101 ++++++++++++++++---
>   arch/powerpc/platforms/pseries/of_helpers.c     |   8 +-
>   arch/powerpc/platforms/pseries/pseries_energy.c |  23 ++---
>   drivers/pci/hotplug/rpaphp_core.c               | 124 +++++++++++++++++-------
>   5 files changed, 187 insertions(+), 71 deletions(-)
>
