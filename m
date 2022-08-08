Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB9D58C203
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 05:25:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1M5r2Nhtz3bqv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 13:25:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hHhAESbF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hHhAESbF;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1M575QZdz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 13:24:43 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2780rxvR004983
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Aug 2022 03:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=kmtO20KHhqnslcTQSZ5mU67tJLBFXo001RHTzPWvhOo=;
 b=hHhAESbFv5ZFOf35J/Xo784VjC9puXnzg7t8Y1CpEK+pGRMsUXIp/wGkCKytuJ5iVTHU
 TiWiYN5Y5ivAEq8HNKg/Ef7b9cf599lpgSK0kG133FnKRTg+LtGm/XL3PrcBxplFpNXr
 kTNYNIMCW6cnFq9sp1eUF8TUGtJE+rCL3qmMg6VThlvZBgXPp9G0tVNIdJm6pXbFNJnE
 2uPrlC8mjZR5rQX5N41G8KRFypvZPyB480cgSXj3Fv4RcMJc7rdCdAnbo4K1fisOQ1tM
 6CQkB10fdJneFHKeQv743mQ8pwghW99G3c5C400Uehvl8KxlWOtphPc60oMCQWnqfv8B eg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3htrbrtfqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Aug 2022 03:24:37 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2782nvb6004951
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Aug 2022 03:24:36 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3htrbrtfqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 03:24:36 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2783KAUU022971;
	Mon, 8 Aug 2022 03:24:34 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3hsfx8sktu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 03:24:34 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2783OW3s23789884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Aug 2022 03:24:32 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34BC642042;
	Mon,  8 Aug 2022 03:24:32 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D2F6142041;
	Mon,  8 Aug 2022 03:24:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  8 Aug 2022 03:24:31 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5E9486012E;
	Mon,  8 Aug 2022 13:24:26 +1000 (AEST)
Message-ID: <e3e58df6fbc801ff53c3e5f5134f974412e27743.camel@linux.ibm.com>
Subject: Re: [PATCH v2 03/14] powerpc: Remove direct call to mmap2 syscall
 handlers
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 Aug 2022 13:24:19 +1000
In-Reply-To: <20220725062558.118793-1-rmclure@linux.ibm.com>
References: <20220725062558.118793-1-rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: I_9KoFsUSB43UMsUsIwAUpS0y632nDi4
X-Proofpoint-GUID: pKTj6FaxwuEiQDYRTBBcxkAEEaP4R4vT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_01,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxlogscore=636
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080014
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-07-25 at 16:25 +1000, Rohan McLure wrote:
> 
> diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> index 54bb5834785f..437066f5c4b2 100644
> --- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> +++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> @@ -243,7 +243,7 @@
>  189    nospu   vfork                           sys_vfork
>  190    common  ugetrlimit                      sys_getrlimit        
>            compat_sys_getrlimit
>  191    common  readahead                       sys_readahead        
>            compat_sys_ppc_readahead
> -
> 192    32      mmap2                           sys_mmap2              
>          compat_sys_ppc_mmap2
> +192    32      mmap2                           sys_mmap2            
>            compat_sys_mmap2
>  193    32      truncate64                      sys_truncate64       
>            compat_sys_ppc_truncate64
>  194    32      ftruncate64                     sys_ftruncate64      
>            compat_sys_ppc_ftruncate64
>  195    32      stat64                          sys_stat64
> @@ -391,7 +391,7 @@
>  306    common  timerfd_create                  sys_timerfd_create
>  307    common  eventfd                         sys_eventfd
>  308    common  sync_file_range2                sys_sync_file_range2 
>            compat_sys_ppc_sync_file_range2
> -
> 309    nospu   fallocate                       sys_fallocate          
>          compat_sys_ppc_fallocate
> +309    nospu   fallocate                       sys_fallocate        
>            compat_sys_fallocate

This should be in patch 5?

>  310    nospu   subpage_prot                    sys_subpage_prot
>  311    32      timerfd_settime                 sys_timerfd_settime32
>  311    64      timerfd_settime                 sys_timerfd_settime

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

