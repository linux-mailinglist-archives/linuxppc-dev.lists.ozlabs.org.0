Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E458BCA0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 17:09:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467GMy40v9zDqcg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 01:09:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467GFY58X3zDqbY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 01:04:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 467GFY4Tj6z8tRv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 01:04:01 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 467GFY49rnz9sND; Wed, 14 Aug 2019 01:04:01 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mahesh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 467GFY18rGz9sN1
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 01:04:00 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7DErSkw011612
 for <linuxppc-dev@ozlabs.org>; Tue, 13 Aug 2019 11:03:58 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uby3bscfv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 13 Aug 2019 11:03:58 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Tue, 13 Aug 2019 16:03:56 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 13 Aug 2019 16:03:53 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7DF3pvb26804344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Aug 2019 15:03:51 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7978552051;
 Tue, 13 Aug 2019 15:03:51 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.37.181])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id AA4D852050;
 Tue, 13 Aug 2019 15:03:49 +0000 (GMT)
Date: Tue, 13 Aug 2019 20:33:47 +0530
From: Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v4 13/25] powernv/fadump: support copying multiple kernel
 memory regions
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
 <156327681058.27462.16887222537196117647.stgit@hbathini.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156327681058.27462.16887222537196117647.stgit@hbathini.in.ibm.com>
User-Agent: NeoMutt/20180716
X-TM-AS-GCONF: 00
x-cbid: 19081315-0020-0000-0000-0000035F30E8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081315-0021-0000-0000-000021B4463E
Message-Id: <20190813150347.n4jawlh4jugrxn3c@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-13_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=469 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908130157
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
Reply-To: mahesh@linux.vnet.ibm.com
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Oliver <oohall@gmail.com>, Vasant Hegde <hegdevasant@linux.ibm.com>,
 Stewart Smith <stewart@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-07-16 17:03:30 Tue, Hari Bathini wrote:
> Firmware uses 32-bit field for region size while copying/backing-up
> memory during MPIPL. So, the maximum copy size for a region would
> be a page less than 4GB (aligned to pagesize) but FADump capture
> kernel usually needs more memory than that to be preserved to avoid
> running into out of memory errors.
> 
> So, request firmware to copy multiple kernel memory regions instead
> of just one (which worked fine for pseries as 64-bit field was used
> for size there). With support to copy multiple kernel memory regions,
> also handle holes in the memory area to be preserved. Support as many
> as 128 kernel memory regions. This allows having an adequate FADump
> capture kernel size for different scenarios.

Can you split this patch into 2 ? One for handling holes in boot memory
and other for handling 4Gb region size ? So that it will be easy to
review changes.

Thanks,
-Mahesh.

> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/kernel/fadump-common.c          |   15 ++
>  arch/powerpc/kernel/fadump-common.h          |   16 ++
>  arch/powerpc/kernel/fadump.c                 |  173 ++++++++++++++++++++++----
>  arch/powerpc/platforms/powernv/opal-fadump.c |   25 +++-
>  arch/powerpc/platforms/powernv/opal-fadump.h |    5 -
>  arch/powerpc/platforms/pseries/rtas-fadump.c |   12 ++
>  arch/powerpc/platforms/pseries/rtas-fadump.h |    5 +
>  7 files changed, 211 insertions(+), 40 deletions(-)
> 

