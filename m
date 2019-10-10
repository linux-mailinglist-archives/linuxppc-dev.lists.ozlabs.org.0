Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC468D33FF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 00:36:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q5Xt15YLzDqSM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 09:36:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q5Vy5N8HzDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 09:34:50 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9AMVxN0131903
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 18:34:41 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vj9r1evkb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 18:34:41 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Thu, 10 Oct 2019 23:34:39 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 10 Oct 2019 23:34:36 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9AMY5sd39977334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 22:34:05 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEAD411C064
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 22:34:35 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E85411C069
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 22:34:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 22:34:35 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 97FF2A01C1;
 Fri, 11 Oct 2019 09:34:33 +1100 (AEDT)
Subject: Re: [PATCH 0/2] ocxl: Move SPA and TL definitions
To: christophe lombard <clombard@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com
References: <20191009151109.13752-1-clombard@linux.vnet.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Fri, 11 Oct 2019 09:34:33 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009151109.13752-1-clombard@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19101022-0016-0000-0000-000002B6FA6D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101022-0017-0000-0000-000033180986
Message-Id: <c54128b1-6576-9758-f9ac-eb748cc98de5@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-10_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=893 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910100195
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

On 10/10/19 2:11 am, christophe lombard wrote:
> This series moves the definition and the management of scheduled process area
> (SPA) and of the templates (Transaction Layer) for an ocxl card, using the
> OCAPI interface. The code is now located in the specific arch powerpc platform.
> These patches will help for a futur implementation of the ocxl driver in QEMU.

Could you explain more about this?


Andrew


> 
> The Open Coherently Attached Processor Interface (OCAPI) is used to
> allow an Attached Functional Unit (AFU) to connect to the Processor
> Chip's system bus in a high speed and cache coherent manner.
> 
> It builds on top of the existing ocxl driver.
> 
> It has been tested in a bare-metal environment using the memcpy and
> the AFP AFUs.
> 
> christophe lombard (2):
>    powerpc/powernv: ocxl move SPA definition
>    powerpc/powernv: ocxl move TL definition
> 
>   arch/powerpc/include/asm/pnv-ocxl.h   |  30 +-
>   arch/powerpc/platforms/powernv/ocxl.c | 378 +++++++++++++++++++++++---
>   drivers/misc/ocxl/afu_irq.c           |   1 -
>   drivers/misc/ocxl/config.c            |  89 +-----
>   drivers/misc/ocxl/link.c              | 347 +++++++----------------
>   drivers/misc/ocxl/ocxl_internal.h     |  12 -
>   drivers/misc/ocxl/trace.h             |  34 +--
>   7 files changed, 467 insertions(+), 424 deletions(-)
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

