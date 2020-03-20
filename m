Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6988918C73B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 06:50:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kCY33HbXzDsx9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:50:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kByK0ZfNzDrTY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 16:23:30 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02K52sbR073476
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 01:23:27 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yu98v7w8g-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 01:23:27 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <mahesh@linux.ibm.com>;
 Fri, 20 Mar 2020 05:23:26 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 20 Mar 2020 05:23:23 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02K5NMqM44368314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 05:23:22 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AB3F11C04A;
 Fri, 20 Mar 2020 05:23:22 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AAAD11C04C;
 Fri, 20 Mar 2020 05:23:21 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.93.29])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 20 Mar 2020 05:23:20 +0000 (GMT)
Date: Fri, 20 Mar 2020 10:53:18 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Handle UE event for memcpy_mcsafe
References: <20200313140612.8112-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313140612.8112-1-ganeshgr@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20032005-0008-0000-0000-0000036069E1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032005-0009-0000-0000-00004A81C9FC
Message-Id: <20200320052318.cdxdadfyadsofovd@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-19_10:2020-03-19,
 2020-03-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 adultscore=0 mlxlogscore=999 suspectscore=1 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003200019
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
Reply-To: mahesh@linux.ibm.com
Cc: santosh@fossix.org, linuxppc-dev@lists.ozlabs.org,
 aneesh.kumar@linux.ibm.com, mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-03-13 19:36:12 Fri, Ganesh Goudar wrote:
> If we hit UE at an instruction with a fixup entry, flag to
> ignore the event and set nip to continue execution at the
> fixup entry.
> For powernv this changes are already made by commit
> 895e3dceeb97 ("powerpc/mce: Handle UE event for memcpy_mcsafe")
> 
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>

Thanks for working on this. Looks good.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.

> ---
>  arch/powerpc/platforms/pseries/ras.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
> index 5d49d9d711da..6dc3074a34c5 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -10,6 +10,7 @@
>  #include <linux/fs.h>
>  #include <linux/reboot.h>
>  #include <linux/irq_work.h>
> +#include <linux/extable.h>
> 
>  #include <asm/machdep.h>
>  #include <asm/rtas.h>
> @@ -505,6 +506,7 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>  	int initiator = rtas_error_initiator(errp);
>  	int severity = rtas_error_severity(errp);
>  	u8 error_type, err_sub_type;
> +	const struct exception_table_entry *entry;
> 
>  	if (initiator == RTAS_INITIATOR_UNKNOWN)
>  		mce_err.initiator = MCE_INITIATOR_UNKNOWN;
> @@ -558,6 +560,12 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>  	switch (mce_log->error_type) {
>  	case MC_ERROR_TYPE_UE:
>  		mce_err.error_type = MCE_ERROR_TYPE_UE;
> +		entry = search_kernel_exception_table(regs->nip);
> +		if (entry) {
> +			mce_err.ignore_event = true;
> +			regs->nip = extable_fixup(entry);
> +			disposition = RTAS_DISP_FULLY_RECOVERED;
> +		}
>  		switch (err_sub_type) {
>  		case MC_ERROR_UE_IFETCH:
>  			mce_err.u.ue_error_type = MCE_UE_ERROR_IFETCH;
> -- 
> 2.17.2
> 

-- 
Mahesh J Salgaonkar

