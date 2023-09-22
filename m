Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A337AACD1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:38:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jAgmSUGb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsQdk1XqNz3hJv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:38:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jAgmSUGb;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsQL81wxpz3hf6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 18:24:48 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RsQL81VX7z4wy0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 18:24:48 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RsQL81FtBz4wxd; Fri, 22 Sep 2023 18:24:48 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jAgmSUGb;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RsQL73Lmtz4wxc;
	Fri, 22 Sep 2023 18:24:47 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38M88s3u011322;
	Fri, 22 Sep 2023 08:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=BCXwk4RDeveyWsOue/VqEz27/VuSn8Fa02EhRNYbGrU=;
 b=jAgmSUGbqTY+yGejsoubii3lGv9O1z41/J2qeFs2bbVW24eWil4JUhJySHvcIKSCcnAE
 PIoGxAjBlT2/0rNcsS0NroNxHUOtrNl+OH/Hd9Lw1jWRFqMkj70RSF3TWBqlQ+JbQXAN
 +0MNuxHiNHiShmkvEo1LHSsu0fNO6UWrn9R1SSPwBDYc37VbaKdhl2NUL5wt500FSkQe
 2zAkDuRpej6IMn79aNh6bwDkG+W4GOkkSwknUxbOJCua6J34+ACoLIBgPK7DIU989sSl
 rmPxN+baOZFV1hqfY5FidGGcVtvk0xfpWcMuub94z5UWhLXDl+oPsCzjvrVRQyEx23cW EA== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t94u5kja2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 08:24:43 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38M7bEXG029422;
	Fri, 22 Sep 2023 08:24:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t8tsnwv9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 08:24:42 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38M8Oa0U18416188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 Sep 2023 08:24:38 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D559820043;
	Fri, 22 Sep 2023 08:24:36 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 709032004E;
	Fri, 22 Sep 2023 08:24:35 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.109.199.72])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 22 Sep 2023 08:24:35 +0000 (GMT)
Date: Fri, 22 Sep 2023 13:54:32 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
Message-ID: <tvtxp64m4o4fuwudywzuqhrpkas3gwhjekd2n4vtzr5gh4aine@rpwuivzqmutj>
References: <20230911091409.415662-1-adityag@linux.ibm.com>
 <169528860032.876432.12152654406988174161.b4-ty@ellerman.id.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169528860032.876432.12152654406988174161.b4-ty@ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MFFunqXvkmGrq75yMqs1LaXPdfqvbfhG
X-Proofpoint-ORIG-GUID: MFFunqXvkmGrq75yMqs1LaXPdfqvbfhG
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_06,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=552 spamscore=0 suspectscore=0 clxscore=1011 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220066
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@ozlabs.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 21, 2023 at 07:30:00PM +1000, Michael Ellerman wrote:
> On Mon, 11 Sep 2023 14:44:09 +0530, Aditya Gupta wrote:
> > Presently, while reading a vmcore, makedumpfile uses
> > `cur_cpu_spec.mmu_features` to decide whether the crashed system had
> > RADIX MMU or not.
> > 
> > Currently, makedumpfile fails to get the `cur_cpu_spec` symbol (unless
> > a vmlinux is passed with the `-x` flag to makedumpfile), and hence
> > assigns offsets and shifts (such as pgd_offset_l4) incorrecly considering
> > MMU to be hash MMU.
> > 
> > [...]
> 
> Applied to powerpc/next.
> 
> [1/1] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
>       https://git.kernel.org/powerpc/c/7135b921b32966d7602ede396b7286d372aee63f
> 
> cheers

Thanks for the update
