Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 019ADB546C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 19:41:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Xr543BFbzF48s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 03:41:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=linuxram@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Xr0W0Dx2zF46N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 03:37:27 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HHWW72055274
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 13:37:23 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v33s20sse-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 13:37:23 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Tue, 17 Sep 2019 18:37:21 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 18:37:17 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8HHapkK38732062
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 17:36:51 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4C8752052;
 Tue, 17 Sep 2019 17:37:16 +0000 (GMT)
Received: from ram.ibm.com (unknown [9.80.213.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 70BAC5204E;
 Tue, 17 Sep 2019 17:37:15 +0000 (GMT)
Date: Tue, 17 Sep 2019 10:37:12 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Qian Cai <cai@lca.pw>
References: <1568733750-14580-1-git-send-email-cai@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568733750-14580-1-git-send-email-cai@lca.pw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19091717-0008-0000-0000-000003179135
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091717-0009-0000-0000-00004A36101A
Message-Id: <20190917173712.GA5176@ram.ibm.com>
Subject: Re:  [PATCH] powerpc/pkeys: remove unused pkey_allows_readwrite
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=27 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=979 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170168
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 17, 2019 at 11:22:30AM -0400, Qian Cai wrote:
> pkey_allows_readwrite() was first introduced in the commit 5586cf61e108
> ("powerpc: introduce execute-only pkey"), but the usage was removed
> entirely in the commit a4fcc877d4e1 ("powerpc/pkeys: Preallocate
> execute-only key").
> 
> Found by the "-Wunused-function" compiler warning flag.
> 
> Fixes: a4fcc877d4e1 ("powerpc/pkeys: Preallocate execute-only key")
> Signed-off-by: Qian Cai <cai@lca.pw>
> ---
>  arch/powerpc/mm/book3s64/pkeys.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
> index ae7fca40e5b3..59e0ebbd8036 100644
> --- a/arch/powerpc/mm/book3s64/pkeys.c
> +++ b/arch/powerpc/mm/book3s64/pkeys.c
> @@ -307,16 +307,6 @@ void thread_pkey_regs_init(struct thread_struct *thread)
>  	write_iamr(pkey_iamr_mask);
>  }
> 
> -static inline bool pkey_allows_readwrite(int pkey)
> -{
> -	int pkey_shift = pkeyshift(pkey);
> -
> -	if (!is_pkey_enabled(pkey))
> -		return true;
> -
> -	return !(read_amr() & ((AMR_RD_BIT|AMR_WR_BIT) << pkey_shift));
> -}
> -
>  int __execute_only_pkey(struct mm_struct *mm)
>  {
>  	return mm->context.execute_only_pkey;

The function was initially used by __execute_only_pkey(), but ones we
changed the implementation of __execute_only_pkey(), the need for 
pkey_allows_readwrite() disappeared.

Acked-by: Ram Pai <linuxram@us.ibm.com>

-- 
Ram Pai

