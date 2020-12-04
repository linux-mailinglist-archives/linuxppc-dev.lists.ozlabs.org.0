Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4C42CF190
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 17:08:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cnd0G0ylwzDrhY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 03:07:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iy/3yERI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CncxF4Z0VzDrTC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 03:05:21 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4G4PtK022937; Fri, 4 Dec 2020 11:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=73yxG1wOzCR+BbDAqlCxjT/J17fSsaJNBt7fE4Bk320=;
 b=iy/3yERI84v3zvqgZuJhCW2KKT6t1J/RE07NC2bTjDVro9unj0pFVKHo+6vmWWdSFl1W
 yyrOWvYk6uxMj3anB6RBjphGFnIBeOykPPxlZec6NkCHIr9msHVOOvmyHyN0JQ3A6DMz
 wzsIszi3vjQDj8w9yYQcl4X4rFwdStrUNKorltLO9ynOcjI7p9HlwJ1p0TUBrlIQWowa
 ofHaGu/271cIied8qLP2AOglgi5Cpj7Cl/dYcqavCYLZcCfjBnpI8NNYQY+dhA9Ywh6+
 GGWidsNvD02CfZWIoUpAUL0A8khZCPDOoPtA+gApfIwuB/F0ifP+RT18DdP0bnz0Ltz6 /g== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 357prxtvn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 11:05:06 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4G2mfR011560;
 Fri, 4 Dec 2020 16:04:58 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 353e6a6vv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 16:04:58 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4G4v3W9831132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 16:04:57 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44381AC066;
 Fri,  4 Dec 2020 16:04:57 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16E5DAC05B;
 Fri,  4 Dec 2020 16:04:57 +0000 (GMT)
Received: from localhost (unknown [9.65.194.14])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 16:04:56 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 16/29] powerpc/rtas: dispatch partition migration
 requests to pseries
In-Reply-To: <874kl1vilh.fsf@mpe.ellerman.id.au>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
 <20201030011805.1224603-17-nathanl@linux.ibm.com>
 <874kl1vilh.fsf@mpe.ellerman.id.au>
Date: Fri, 04 Dec 2020 10:04:56 -0600
Message-ID: <87tut11rrr.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_05:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=1 mlxscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040090
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> sys_rtas() cannot call ibm,suspend-me directly in the same way it
>> handles other inputs. Instead it must dispatch the request to code
>> that can first perform the H_JOIN sequence before any call to
>> ibm,suspend-me can succeed. Over time kernel/rtas.c has accreted a fair
>> amount of platform-specific code to implement this.
>>
>> Since a different, more robust implementation of the suspend sequence
>> is now in the pseries platform code, we want to dispatch the request
>> there while minimizing additional dependence on pseries.
>>
>> Use a weak function that only pseries overrides.
>
> Over the years weak functions have caused their fair share of problems.
>
> There are cases where they are the cleanest option, but for intra-arch
> code like this I think and ifdef is much simpler.

Fair enough, I wasn't all that confident about this anyway.


>> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
>> index fdefe6a974eb..be0fc2536673 100644
>> --- a/arch/powerpc/include/asm/rtas.h
>> +++ b/arch/powerpc/include/asm/rtas.h
>> @@ -260,6 +260,7 @@ extern int rtas_suspend_cpu(struct rtas_suspend_me_data *data);
>>  extern int rtas_suspend_last_cpu(struct rtas_suspend_me_data *data);
>>  int rtas_ibm_suspend_me_unsafe(u64 handle);
>>  int rtas_ibm_suspend_me(int *fw_status);
>> +int rtas_syscall_dispatch_ibm_suspend_me(u64 handle);
>
> ie. we'd just do:
>
> #ifdef CONFIG_PPC_PSERIES
> int rtas_syscall_dispatch_ibm_suspend_me(u64 handle);
> #else
> int rtas_syscall_dispatch_ibm_suspend_me(u64 handle)
> {
> 	return -EINVAL;
> }
> #endif

Yep will do.
