Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB5E3EF5B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 00:21:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gq59R4TlWz3cSK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 08:21:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kt426Vh6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kt426Vh6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gq58f4FlNz2yR4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 08:21:05 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17HM2wau191455; Tue, 17 Aug 2021 18:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=vvFO4lOBX4sDfEhnNEZVfUYefoksHhEC8JsUilIfQLY=;
 b=kt426Vh6MhKxFh/aWFIWcXhk/ETMf9uZICj6yABwT/t9+7Ia+Z+3yyxABD3d1xJk2ogM
 KyU7y1QVx/7Mh+fJWCv3z9uIU2Zo6tJxIq5LCgk/UlxWFYiFlN4w/fuu3CbPyRGgumyL
 NjW/huV3nDHrEoJVmMf0stWK9YFzXXkk/BTYCnig+mEZ+YVTDrWTIti+6EMvYtHvtTtK
 aEOXqz7hqQ5JIgOUBwLdOYWZw7VmQ22CKMS8nrxUK4w+WGC1zot9nlXotYFhcs7xSPW0
 Ko17MyPFGucxT2aylMxcItyqZQTuFwLnc5AuSmIDrdY9/YjMtl8CmKiBFtUjupXXx1Xb 1Q== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ag7bsauju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 18:21:02 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17HMD5B9031872;
 Tue, 17 Aug 2021 22:21:02 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 3ae5fdjqbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 22:21:02 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17HML1T951183988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Aug 2021 22:21:01 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A70EAE064;
 Tue, 17 Aug 2021 22:21:01 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4550BAE067;
 Tue, 17 Aug 2021 22:21:00 +0000 (GMT)
Received: from localhost (unknown [9.211.107.102])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 17 Aug 2021 22:20:59 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH kernel] KVM: PPC: Book3S HV: Make unique debugfs nodename
In-Reply-To: <be02290c-60a0-48af-0491-61e8a6d5b7b7@ozlabs.ru>
References: <20210707041344.3803554-1-aik@ozlabs.ru>
 <be02290c-60a0-48af-0491-61e8a6d5b7b7@ozlabs.ru>
Date: Tue, 17 Aug 2021 19:20:57 -0300
Message-ID: <87pmubu306.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 627C7QllL2CLBbF8ps1glfa4cOcUce_J
X-Proofpoint-GUID: 627C7QllL2CLBbF8ps1glfa4cOcUce_J
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-17_08:2021-08-17,
 2021-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108170139
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> On 07/07/2021 14:13, Alexey Kardashevskiy wrote:

> alternatively move this debugfs stuff under the platform-independent
> directory, how about that?

That's a good idea. I only now realized we have two separate directories
for the same guest:

$ ls /sys/kernel/debug/kvm/ | grep $pid
19062-11
vm19062               

Looks like we would have to implement kvm_arch_create_vcpu_debugfs for
the vcpu information and add a similar hook for the vm.

>> ---
>>   arch/powerpc/kvm/book3s_hv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 1d1fcc290fca..0223ddc0eed0 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -5227,7 +5227,7 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
>>   	/*
>>   	 * Create a debugfs directory for the VM
>>   	 */
>> -	snprintf(buf, sizeof(buf), "vm%d", current->pid);
>> +	snprintf(buf, sizeof(buf), "vm%d-lp%ld", current->pid, lpid);
>>   	kvm->arch.debugfs_dir = debugfs_create_dir(buf, kvm_debugfs_dir);
>>   	kvmppc_mmu_debugfs_init(kvm);
>>   	if (radix_enabled())
>> 
