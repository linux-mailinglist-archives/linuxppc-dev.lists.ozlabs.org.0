Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C41860B8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 13:19:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4645Vf0k56zDql2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 21:19:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4645T500gszDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 21:17:59 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x78BERJS011656
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 8 Aug 2019 07:17:55 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u8hxxj23b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2019 07:17:55 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <hbathini@linux.ibm.com>;
 Thu, 8 Aug 2019 12:17:53 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 8 Aug 2019 12:17:51 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x78BHoge42729704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Aug 2019 11:17:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CB8EAE045;
 Thu,  8 Aug 2019 11:17:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26202AE04D;
 Thu,  8 Aug 2019 11:17:49 +0000 (GMT)
Received: from [9.184.183.117] (unknown [9.184.183.117])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  8 Aug 2019 11:17:48 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/fadump: sysfs for fadump memory reservation
To: Sourabh Jain <sourabhjain@linux.ibm.com>, mpe@ellerman.id.au
References: <20190808100833.30367-1-sourabhjain@linux.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Thu, 8 Aug 2019 16:47:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808100833.30367-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19080811-0012-0000-0000-0000033C3CA4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080811-0013-0000-0000-000021763EBA
Message-Id: <3f2a8648-066e-3639-0328-dd34da759f30@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-08_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908080122
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
Cc: mahesh@linux.vnet.ibm.com, linux-doc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, corbet@lwn.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/08/19 3:38 PM, Sourabh Jain wrote:
> Add a sys interface to allow querying the memory reserved by
> fadump for saving the crash dump.
> 
> Add an ABI doc entry for new sysfs interface.
>    - /sys/kernel/fadump_mem_reserved
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
> v1 -> v2:
>   - Added ABI doc for new sysfs interface.
> ---
> 
>  Documentation/ABI/testing/sysfs-kernel-fadump    |  6 ++++++
>  Documentation/powerpc/firmware-assisted-dump.rst |  5 +++++
>  arch/powerpc/kernel/fadump.c                     | 14 ++++++++++++++
>  3 files changed, 25 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-kernel-fadump
> 
> diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
> new file mode 100644
> index 000000000000..003e2f025dcb
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-kernel-fadump
> @@ -0,0 +1,6 @@
> +What:		/sys/kernel/fadump_mem_reserved
> +Date:		August 2019
> +Contact:	linuxppc-dev@lists.ozlabs.org
> +Description:	read only
> +		Provide information about the amount of memory
> +		reserved by fadump to saving the crash dump.

s/to saving/to save/

Rest looks good..

Thanks
Hari

