Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 453D09E748
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 14:03:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HnZc1GpGzDqcg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 22:03:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HnWr2GNTzDqWw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 22:00:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46HnWr1RQWz8sxb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 22:00:56 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46HnWr17fsz9sML; Tue, 27 Aug 2019 22:00:56 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46HnWq50WSz9sDQ
 for <linuxppc-dev@ozlabs.org>; Tue, 27 Aug 2019 22:00:54 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7RBvgRl057761
 for <linuxppc-dev@ozlabs.org>; Tue, 27 Aug 2019 08:00:52 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2un21en9xc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 27 Aug 2019 08:00:50 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 27 Aug 2019 13:00:47 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 27 Aug 2019 13:00:44 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7RC0gYX46334220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 12:00:42 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3272442057;
 Tue, 27 Aug 2019 12:00:42 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFB5C4204C;
 Tue, 27 Aug 2019 12:00:39 +0000 (GMT)
Received: from [9.109.217.45] (unknown [9.109.217.45])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 27 Aug 2019 12:00:39 +0000 (GMT)
Subject: Re: [PATCH v5 13/31] powernv/fadump: reset metadata address during
 clean up
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630274313.8896.17475124195648859586.stgit@hbathini.in.ibm.com>
Date: Tue, 27 Aug 2019 17:30:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156630274313.8896.17475124195648859586.stgit@hbathini.in.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082712-0020-0000-0000-0000036476F7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082712-0021-0000-0000-000021B9C398
Message-Id: <a360907f-a2e0-fde7-0aac-82d57cb9ebe1@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-27_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908270135
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Oliver <oohall@gmail.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 20/08/19 5:35 PM, Hari Bathini wrote:
> During kexec boot, metadata address needs to be reset to avoid running
> into errors interpreting stale metadata address, in case the kexec'ed
> kernel crashes before metadata address could be setup again.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/kernel/fadump-common.h          |    1 +
>  arch/powerpc/kernel/fadump.c                 |    2 ++
>  arch/powerpc/platforms/powernv/opal-fadump.c |   10 ++++++++++
>  arch/powerpc/platforms/pseries/rtas-fadump.c |    3 +++
>  4 files changed, 16 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
> index 0acf412..d2dd117 100644
> --- a/arch/powerpc/kernel/fadump-common.h
> +++ b/arch/powerpc/kernel/fadump-common.h
> @@ -120,6 +120,7 @@ struct fadump_ops {
>  	int	(*fadump_register)(struct fw_dump *fadump_config);
>  	int	(*fadump_unregister)(struct fw_dump *fadump_config);
>  	int	(*fadump_invalidate)(struct fw_dump *fadump_config);
> +	void	(*fadump_cleanup)(struct fw_dump *fadump_config);
>  	int	(*fadump_process)(struct fw_dump *fadump_config);
>  	void	(*fadump_region_show)(struct fw_dump *fadump_config,
>  				      struct seq_file *m);
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index a086a09..b2d5ca6 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -830,6 +830,8 @@ void fadump_cleanup(void)
>  		fw_dump.ops->fadump_unregister(&fw_dump);
>  		free_crash_memory_ranges();
>  	}
> +
> +	fw_dump.ops->fadump_cleanup(&fw_dump);

Actually, need to check if FADump is supported before proceeding with cleanup callbacks
as fadump_cleanup() can be called outside FADump code in shutdown and kexec paths which
could crash the system on machines that do not support FADump. Re-sent the patch adding
the check in fadump_cleanup() function:

    https://patchwork.ozlabs.org/patch/1153806/
    ("[RESEND,v5,13/31] powernv/fadump: reset metadata address during clean up")

- Hari

