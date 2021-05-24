Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0009F38F471
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 22:34:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fpppg5xhSz306T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 06:34:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gzA11SQ/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msc@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gzA11SQ/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fppp75Xqcz2yhF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 06:33:51 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14OK3nfj185241; Mon, 24 May 2021 16:33:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=FZyIYp++kLFd7+FZB7WEKrumdZ2aEQqCESOGbyT5Kxg=;
 b=gzA11SQ/YmnbE/fTjFn3zFl6e4vEnPt3lXbRRoYCVuYBcdi6mi3FYoUOLGIL3LQaVTlO
 MZ8ZBOV6Ku6HNxyalbBbGi1F5QVVAYJ5T8LN5AWOVAjrr0dXiElnI/OBa8fEFf+rzKQZ
 JgmyOdUyvrWc8UaTObizkwtGwemhCKutQVf6oUj3u+gEp0QQ6TbJWeeU0nf2g+rjP29M
 i8/T0hr5RsrAgO1+qUM/0xyRjIzR1cRluaiUYFUgwHpL+niwB/VkFKfDqzrL1sbk3iPK
 p6iZfxNVMMQW2Rw4QB0xoBS0CE57L2QBcMq28SnKQWrMajB5iDt5/0cqP6Sn3DriDBIg yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38rjjp0yqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 16:33:32 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14OK3ohP185380;
 Mon, 24 May 2021 16:33:31 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38rjjp0yqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 16:33:31 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14OKHPkF018856;
 Mon, 24 May 2021 20:33:30 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 38psk99ta7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 20:33:30 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14OKXTHR21496212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 20:33:29 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8741CBE053;
 Mon, 24 May 2021 20:33:29 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 743DFBE058;
 Mon, 24 May 2021 20:33:26 +0000 (GMT)
Received: from TP480.linux.ibm.com (unknown [9.65.94.141])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 24 May 2021 20:33:26 +0000 (GMT)
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <1621385544.nttlk5qugb.astroid@bobo.none>
 <1621400263.gf0mbqhkrf.astroid@bobo.none> <87a6oo4312.fsf@linux.ibm.com>
 <87k0nr6ezw.fsf@oldenburg.str.redhat.com> <87eedz3li3.fsf@linux.ibm.com>
 <20210521205204.GA24309@altlinux.org> <87a6ok2uxx.fsf@linux.ibm.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Matheus Castanho <msc@linux.ibm.com>
To: Matheus Castanho <msc@linux.ibm.com>
Subject: Re: Linux powerpc new system call instruction and ABI
In-reply-to: <87a6ok2uxx.fsf@linux.ibm.com>
Date: Mon, 24 May 2021 17:33:24 -0300
Message-ID: <87im3727or.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ER5I-gxskURqA0q20yF-IAm9RBLnInl_
X-Proofpoint-ORIG-GUID: eAxo70sIvYvIrIANrjlNpsJk6RtF1TSC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-24_09:2021-05-24,
 2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105240118
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
Cc: Florian Weimer <fweimer@redhat.com>,
 Matheus Castanho via Libc-alpha <libc-alpha@sourceware.org>,
 linux-api@vger.kernel.org, musl@lists.openwall.com,
 Nicholas Piggin <npiggin@gmail.com>, "Dmitry V. Levin" <ldv@altlinux.org>,
 libc-dev@lists.llvm.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Matheus Castanho <msc@linux.ibm.com> writes:

> Dmitry V. Levin <ldv@altlinux.org> writes:
>
>> On Fri, May 21, 2021 at 05:00:36PM -0300, Matheus Castanho wrote:
>>> Florian Weimer <fweimer@redhat.com> writes:
>>> > * Matheus Castanho via Libc-alpha:
>>> >> From: Nicholas Piggin <npiggin@gmail.com>
>>> >> Subject: [PATCH 1/1] powerpc: Fix handling of scv return error codes
>>> >>
>>> >> When using scv on templated ASM syscalls, current code interprets any
>>> >> negative return value as error, but the only valid error codes are in
>>> >> the range -4095..-1 according to the ABI.
>>> >>
>>> >> Reviewed-by: Matheus Castanho <msc@linux.ibm.com>
>>> >
>>> > Please reference bug 27892 in the commit message.  I'd also appreciate a
>>> > backport to the 2.33 release branch (where you need to add NEWS manually
>>> > to add the bug reference).
>>>
>>> No problem. [BZ #27892] appended to the commit title. I'll make sure to
>>> backport to 2.33 as well.
>>
>> Could you also mention in the commit message that the change fixes
>> 'signal.gen.test' strace test where it was observed initially?
>
> Sure, no problem. I'll commit it later today.

Since the patch falls into the less-than-15-LOC category and this is
Nick's first contribution to glibc, looks like he doesn't need a
copyright assignment.

Pushed to master as 7de36744ee1325f35d3fe0ca079dd33c40b12267

Backported to 2.33 via commit 0ef0e6de7fdfa18328b09ba2afb4f0112d4bdab4

Thanks,
Matheus Castanho
