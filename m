Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4EE48AF9B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 15:33:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYCqB50G3z2ymc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 01:33:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OdT1lgja;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OdT1lgja; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYCpQ1NRVz2yP9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 01:32:45 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BESDDx000572; 
 Tue, 11 Jan 2022 14:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=zO0Hes+/NAVtG3EmAoPEjZ1KFQFpAlZ3V/lj/oihMpU=;
 b=OdT1lgjaJmijlkubGb4sWcqLRIxCbeqFsebA73lVxugI3+Hh0HXQ6OODPs9WNaW+H9iS
 sOTeUAPCzQN4Ru6ZWx9HVplbPU+DyOm368EODs2kaRiNAxnFVtjMGjbMvmp49O4nw6DY
 kIvBB+kpFvlx4otEFbvDOMHvxwP+KLgeFVhFw6KkOEa5sKGgzOF7XYYE1LcootI0DavF
 oGYuQgiaUFGOLT3gAu8qrAvUQBw1s/xkhga6eiOwLTPlPPuzdaW/jaJwqCNa6KB/rbnn
 T1C/hzW3XR0Ylfu5dEAT8TbQJE6WuRdignb1VNSsrnJtYdoLTP/ugCsFDAAlbHSddnIQ iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhbp782dx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 14:32:37 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20BEWNHi013853;
 Tue, 11 Jan 2022 14:32:37 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhbp782d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 14:32:37 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20BEM8Y2002271;
 Tue, 11 Jan 2022 14:32:35 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 3df28ane04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 14:32:35 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20BEWYbD24379698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 14:32:34 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7112BE07F;
 Tue, 11 Jan 2022 14:32:34 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0275BE04F;
 Tue, 11 Jan 2022 14:32:33 +0000 (GMT)
Received: from localhost (unknown [9.163.2.124])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 11 Jan 2022 14:32:33 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v3 6/6] KVM: PPC: mmio: Reject instructions that access
 more than mmio.data size
In-Reply-To: <1641800177.nr6ngd1fot.astroid@bobo.none>
References: <20220107210012.4091153-1-farosas@linux.ibm.com>
 <20220107210012.4091153-7-farosas@linux.ibm.com>
 <1641800177.nr6ngd1fot.astroid@bobo.none>
Date: Tue, 11 Jan 2022 11:32:31 -0300
Message-ID: <87v8yq8hs0.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qq9wb2Q69jG6rN9I2drL6sKIkVGJTIFr
X-Proofpoint-ORIG-GUID: O2UZMGiUcyaDfTh0KUfJC4DEC6_eXF8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201110087
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Excerpts from Fabiano Rosas's message of January 8, 2022 7:00 am:
>> The MMIO interface between the kernel and userspace uses a structure
>> that supports a maximum of 8-bytes of data. Instructions that access
>> more than that need to be emulated in parts.
>> 
>> We currently don't have generic support for splitting the emulation in
>> parts and each set of instructions needs to be explicitly included.
>> 
>> There's already an error message being printed when a load or store
>> exceeds the mmio.data buffer but we don't fail the emulation until
>> later at kvmppc_complete_mmio_load and even then we allow userspace to
>> make a partial copy of the data, which ends up overwriting some fields
>> of the mmio structure.
>> 
>> This patch makes the emulation fail earlier at kvmppc_handle_load|store,
>> which will send a Program interrupt to the guest. This is better than
>> allowing the guest to proceed with partial data.
>> 
>> Note that this was caught in a somewhat artificial scenario using
>> quadword instructions (lq/stq), there's no account of an actual guest
>> in the wild running instructions that are not properly emulated.
>> 
>> (While here, fix the error message to check against 'bytes' and not
>> 'run->mmio.len' which at this point has an old value.)
>
> This looks good to me
>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>  arch/powerpc/kvm/powerpc.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>> index 56b0faab7a5f..a1643ca988e0 100644
>> --- a/arch/powerpc/kvm/powerpc.c
>> +++ b/arch/powerpc/kvm/powerpc.c
>> @@ -1246,7 +1246,8 @@ static int __kvmppc_handle_load(struct kvm_vcpu *vcpu,
>>  
>>  	if (bytes > sizeof(run->mmio.data)) {
>>  		printk(KERN_ERR "%s: bad MMIO length: %d\n", __func__,
>> -		       run->mmio.len);
>> +		       bytes);
>
> I wonder though this should probably be ratelimited, informational (or 
> at least warning because it's a host message), and perhaps a bit more
> explanatory that it's a guest problem (or at least lack of host support
> for particular guest MMIO sizes).

Yes, I'll ratelimit it an try to make it clear that this is something
that happened inside the guest but it lacks support in KVM. Then
hopefully people will tell to us if they ever need that support.
