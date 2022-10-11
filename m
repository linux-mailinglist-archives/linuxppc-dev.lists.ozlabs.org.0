Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9222B5FA8E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 02:02:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmbYs3k5Zz3dww
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 11:02:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nUvkvxmJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nUvkvxmJ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmbXt1NZWz3cB6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 11:01:17 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29AMVA2B022603;
	Tue, 11 Oct 2022 00:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=MUav98Gqd8+jnPeoXL3mH1XPkjFXSCLleskfAKiCeP0=;
 b=nUvkvxmJSWQzRAcDKpK9n3/z4s7vmVQJxV4/k8z07b7LnWl0gbSJMVZP6E6un2y731hZ
 dULr2wD58tYfAXP78lLZTxvc9U4bjDa+kq4Fgsqq7y1ktA7APwmFoYdMQwfNJj2gkCKU
 2VZc/bLGK/KG8k5GeCKainf1RMy34l6vbCyprdPsckLeN03qKiXvP5KttjvbdrLBWa5y
 q0nZe0lagWTo9MjobPBbKIEnc0VdIx2XuQX6/oT5Ns/r1qywbNGTeuPbNBMkQrOyyXHu
 untFZCJOxOcRQ3Dr/TcRBkJ0fLWe/NbhKPyLVSEx3Zw20OrfYJpmfg0GmreTBU4bgiIL MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3k7vx7j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 00:00:37 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29B007R9013158;
	Tue, 11 Oct 2022 00:00:36 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3k7vx7h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 00:00:36 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29ANodQl023738;
	Tue, 11 Oct 2022 00:00:34 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 3k30u9bdw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 00:00:34 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29ANtoIK25755940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Oct 2022 23:55:50 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A59A52052;
	Tue, 11 Oct 2022 00:00:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5EA555204F;
	Tue, 11 Oct 2022 00:00:31 +0000 (GMT)
Received: from [9.43.172.4] (unknown [9.43.172.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1A07A602EB;
	Tue, 11 Oct 2022 11:00:18 +1100 (AEDT)
Message-ID: <d402a6a0a11d84906ecba3909f4c8f880298dc0f.camel@linux.ibm.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
From: Andrew Donnellan <ajd@linux.ibm.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Michael Ellerman
	 <mpe@ellerman.id.au>, rmclure@linux.ibm.com
Date: Tue, 11 Oct 2022 11:00:15 +1100
In-Reply-To: <Y0ScAhqysKK6Hrks@zx2c4.com>
References: <87edvhntv0.fsf@mpe.ellerman.id.au> <Y0RxpSFyn9m68zIb@zx2c4.com>
	 <Y0R6fcvgGA858TQA@zx2c4.com> <Y0ScAhqysKK6Hrks@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 36w4YCAQ4nTGdgqjFxiN2AM5kFcUeosw
X-Proofpoint-GUID: IdWhmLj7iNQ56oqIgH1w5wqO-vj6xDLc
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-10_12,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=905
 mlxscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210100139
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
Cc: david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, linux@roeck-us.net, nathanl@linux.ibm.com, ye.xingchen@zte.com.cn, npiggin@gmail.com, nathan@kernel.org, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-10-10 at 16:26 -0600, Jason A. Donenfeld wrote:
> 
> Bisected:
> 
> 7e92e01b724526b98cbc7f03dd4afa0295780d56 is the first bad commit
> commit 7e92e01b724526b98cbc7f03dd4afa0295780d56
> Author: Rohan McLure <rmclure@linux.ibm.com>
> Date:   Wed Sep 21 16:56:01 2022 +1000
> 
>     powerpc: Provide syscall wrapper
> 
>     Implement syscall wrapper as per s390, x86, arm64. When enabled
>     cause handlers to accept parameters from a stack frame rather
> than
>     from user scratch register state. This allows for user registers
> to be
>     safely cleared in order to reduce caller influence on speculation
>     within syscall routine. The wrapper is a macro that emits syscall
>     handler symbols that call into the target handler, obtaining its
>     parameters from a struct pt_regs on the stack.
> 
>     As registers are already saved to the stack prior to calling
>     system_call_exception, it appears that this function is executed
> more
>     efficiently with the new stack-pointer convention than with
> parameters
>     passed by registers, avoiding the allocation of a stack frame for
> this
>     method. On a 32-bit system, we see >20% performance increases on
> the
>     null_syscall microbenchmark, and on a Power 8 the performance
> gains
>     amortise the cost of clearing and restoring registers which is
>     implemented at the end of this series, seeing final result of
> ~5.6%
>     performance improvement on null_syscall.
> 
>     Syscalls are wrapped in this fashion on all platforms except for
> the
>     Cell processor as this commit does not provide SPU support. This
> can be
>     quickly fixed in a successive patch, but requires
> spu_sys_callback to
>     allocate a pt_regs structure to satisfy the wrapped calling
> convention.
> 
>     Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
>     Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
>     Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>     Reviewed-by: Nicholas Piggin <npiggin@gmai.com>
>     [mpe: Make incompatible with COMPAT to retain clearing of high
> bits of args]
>     Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>     Link:
> https://lore.kernel.org/r/20220921065605.1051927-22-rmclure@linux.ibm.com

Thanks for bisecting, this is interesting! Could you provide your
.config and the environment you're running in? Your reproducer doesn't
seem to trigger it on my baremetal POWER8 pseries_le_defconfig.

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

