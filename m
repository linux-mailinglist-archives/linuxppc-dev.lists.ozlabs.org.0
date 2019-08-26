Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9B59CCFA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 12:02:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H6x16GMKzDqg5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 20:01:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H6tv0rw0zDqdq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 20:00:06 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7Q9xE7c070558
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 06:00:01 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2umctx12n6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 06:00:01 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <hbathini@linux.ibm.com>;
 Mon, 26 Aug 2019 10:59:59 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 26 Aug 2019 10:59:55 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7Q9xXT334931192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 09:59:33 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92AEAAE04D;
 Mon, 26 Aug 2019 09:59:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10DE5AE045;
 Mon, 26 Aug 2019 09:59:53 +0000 (GMT)
Received: from [9.109.217.45] (unknown [9.109.217.45])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 26 Aug 2019 09:59:52 +0000 (GMT)
Subject: Re: [PATCH v3] powerpc/fadump: sysfs for fadump memory reservation
To: Sourabh Jain <sourabhjain@linux.ibm.com>, mpe@ellerman.id.au
References: <20190810175905.7761-1-sourabhjain@linux.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Mon, 26 Aug 2019 15:29:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190810175905.7761-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082609-0012-0000-0000-000003430F79
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082609-0013-0000-0000-0000217D4383
Message-Id: <53311fa4-2cce-1eb6-1aae-0c835e06eb24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908260110
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
Cc: mahesh@linux.vnet.ibm.com, corbet@lwn.net, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/08/19 11:29 PM, Sourabh Jain wrote:
> Add a sys interface to allow querying the memory reserved by
> fadump for saving the crash dump.
> 
> Add an ABI doc entry for new sysfs interface.
>    - /sys/kernel/fadump_mem_reserved
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
> Changelog:
> v1 -> v2:
>   - Added ABI doc for new sysfs interface.
> 
> v2 -> v3:
>   - Updated the ABI documentation.
> ---
> 
>  Documentation/ABI/testing/sysfs-kernel-fadump    |  6 ++++++

Shouldn't this be Documentation/ABI/testing/sysfs-kernel-fadump_mem_reserved?

> +++ b/Documentation/ABI/testing/sysfs-kernel-fadump
> @@ -0,0 +1,6 @@
> +What:		/sys/kernel/fadump_mem_reserved
> +Date:		August 2019
> +Contact:	linuxppc-dev@lists.ozlabs.org
> +Description:	read only
> +		Provide information about the amount of memory
> +		reserved by fadump to save the crash dump.

Split this up into a separate patch and have ABI documentation for
fadump_reserved & fadump_registered as well..

Thanks
Hari

