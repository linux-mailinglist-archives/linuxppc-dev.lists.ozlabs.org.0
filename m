Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F715B3AA7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 16:27:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPJGd2FVdz3bxC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 00:27:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qcsRFBHQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qcsRFBHQ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPJFx2THjz309f
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 00:26:29 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289EGpfi012448;
	Fri, 9 Sep 2022 14:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/p4T01kD0OTG1gC/PF0f6mf+lGHJ3kS+SSBEsdXBouY=;
 b=qcsRFBHQ6FmOrYYBSNkZJ6rQYLdMVXX3cq7WouNJ8+tuck1Xv5k6CAcXwf65t/g0NtYS
 KMPFoTThxkClWPf++mhJoVdBYs2oV5Dbv0UkBfkWpam/MLYm4lrU0SRTwTQ31JGoQtQ6
 c+jmMy783Ax0s+4p2nOii1OriNihs0qHZK79tDyY4fceJYWmCYWWyws2SA4ui896krFu
 EXZOBLZ2Oc7lrw3jtsv56iCQMNRKc5GLB1d4l2IPCf8EaJm42QZxR8bBMMLJulIWtupd
 S6ol6r2bFkUudbVs4SUxKxYuyw3DgMgRGGclB+TuwJcvCMZix17QF7w43s8xsiuGJWl1 pw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg4jqwk6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 14:26:10 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 289Cx9oi004031;
	Fri, 9 Sep 2022 14:26:10 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg4jqwk4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 14:26:09 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 289EMFdW030670;
	Fri, 9 Sep 2022 14:26:07 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma02fra.de.ibm.com with ESMTP id 3jbxj8x0pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 14:26:07 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 289EQ5vM42664310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Sep 2022 14:26:05 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 317AA42041;
	Fri,  9 Sep 2022 14:26:05 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 222954203F;
	Fri,  9 Sep 2022 14:26:04 +0000 (GMT)
Received: from [9.145.83.17] (unknown [9.145.83.17])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  9 Sep 2022 14:26:04 +0000 (GMT)
Message-ID: <3e9f22f9-c23b-777c-6c38-0d6f990ee409@linux.ibm.com>
Date: Fri, 9 Sep 2022 16:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [RFC PATCH RESEND 18/28] mm: add FAULT_FLAG_VMA_LOCK flag
Content-Language: fr
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-19-surenb@google.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220901173516.702122-19-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OzUS1M1bFkL8OXdxMOYgYHEuTx-2ypfC
X-Proofpoint-GUID: ldwaHz9NQE4Aw6273ZmA2QjBw8t7HNkD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_08,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=699
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209090049
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 01/09/2022 à 19:35, Suren Baghdasaryan a écrit :
> Add a new flag to distinguish page faults handled under protection of
> per-vma lock.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

FWIW,

Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>

> ---
>  include/linux/mm.h       | 3 ++-
>  include/linux/mm_types.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 0d9c1563c354..7c3190eaabd7 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -466,7 +466,8 @@ static inline bool fault_flag_allow_retry_first(enum fault_flag flags)
>  	{ FAULT_FLAG_USER,		"USER" }, \
>  	{ FAULT_FLAG_REMOTE,		"REMOTE" }, \
>  	{ FAULT_FLAG_INSTRUCTION,	"INSTRUCTION" }, \
> -	{ FAULT_FLAG_INTERRUPTIBLE,	"INTERRUPTIBLE" }
> +	{ FAULT_FLAG_INTERRUPTIBLE,	"INTERRUPTIBLE" }, \
> +	{ FAULT_FLAG_VMA_LOCK,		"VMA_LOCK" }
>  
>  /*
>   * vm_fault is filled by the pagefault handler and passed to the vma's
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 6a03f59c1e78..36562e702baf 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -886,6 +886,7 @@ enum fault_flag {
>  	FAULT_FLAG_INTERRUPTIBLE =	1 << 9,
>  	FAULT_FLAG_UNSHARE =		1 << 10,
>  	FAULT_FLAG_ORIG_PTE_VALID =	1 << 11,
> +	FAULT_FLAG_VMA_LOCK =		1 << 12,
>  };
>  
>  typedef unsigned int __bitwise zap_flags_t;

