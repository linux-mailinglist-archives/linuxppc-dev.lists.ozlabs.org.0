Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF64548AFD4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 15:44:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYD3f6mztz305F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 01:44:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DEEvhsXe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DEEvhsXe; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYD2v56tNz2yPL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 01:43:35 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BDum6F017216; 
 Tue, 11 Jan 2022 14:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=d8ILAjSbesi3amD5U9O04dfeyldX70RVHm/l2IgXLOQ=;
 b=DEEvhsXedW+k9lAlnQz0pi2v6Q5u8gtiQldeEIkIF2kAYRKw5l9/tYzBSk1i7/r6AXtf
 ylzpSwmKf0ZXloV2MU+c31lVnZw0kuJ683sVm94iD4HBqBLoWH+I6Sz67wqYtMUIvj/F
 oVj3xtgY0hdmuSryM+WRAE92MMze1RBleLLZYPhocJneDprF0jgq8xH++P1GxU0KyaK7
 c4n6nrk63vVgw/NbLht5T4HtZXU/VX8PbLCfehzoQ7Nd9q470QaxmyLd4iaE0ks317hM
 5G7rM5HyrsKRVDeP8nmLNmpCU1vYgF3Twf7YaOGJxKnNz49/YwgOBayIZthH82wvjbjZ 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dh9fwkpkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 14:43:31 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20BEhEOG007459;
 Tue, 11 Jan 2022 14:43:30 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dh9fwkpjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 14:43:30 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20BEMFCM019895;
 Tue, 11 Jan 2022 14:43:29 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 3df28a5k9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 14:43:29 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20BEhSfr34210120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 14:43:28 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5275AE064;
 Tue, 11 Jan 2022 14:43:27 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1BB8AE05C;
 Tue, 11 Jan 2022 14:43:26 +0000 (GMT)
Received: from localhost (unknown [9.163.2.124])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 11 Jan 2022 14:43:26 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH 2/3] KVM: PPC: Book3S HV: Delay setting of kvm ops
In-Reply-To: <1640427464.ji8lnut0io.astroid@bobo.none>
References: <20211223211931.3560887-1-farosas@linux.ibm.com>
 <20211223211931.3560887-3-farosas@linux.ibm.com>
 <1640427464.ji8lnut0io.astroid@bobo.none>
Date: Tue, 11 Jan 2022 11:43:23 -0300
Message-ID: <87lezm8h9w.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: M5cG839kDZ2Sw_Wn4kgQa333XdkTghsc
X-Proofpoint-ORIG-GUID: 2AVbSl-aweDPYL9zdhNQFuPgQuhCG_Qv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201110087
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

> Excerpts from Fabiano Rosas's message of December 24, 2021 7:19 am:
>> Delay the setting of kvm_hv_ops until after all init code has
>> completed. This avoids leaving the ops still accessible if the init
>> fails.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv.c | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>> 
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 9f4765951733..53400932f5d8 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -6087,9 +6087,6 @@ static int kvmppc_book3s_init_hv(void)
>>  	}
>>  #endif
>>  
>> -	kvm_ops_hv.owner = THIS_MODULE;
>> -	kvmppc_hv_ops = &kvm_ops_hv;
>> -
>>  	init_default_hcalls();
>>  
>>  	init_vcore_lists();
>> @@ -6105,10 +6102,15 @@ static int kvmppc_book3s_init_hv(void)
>>  	}
>>  
>>  	r = kvmppc_uvmem_init();
>> -	if (r < 0)
>> +	if (r < 0) {
>>  		pr_err("KVM-HV: kvmppc_uvmem_init failed %d\n", r);
>> +		return r;
>> +	}
>>  
>> -	return r;
>> +	kvm_ops_hv.owner = THIS_MODULE;
>> +	kvmppc_hv_ops = &kvm_ops_hv;
>> +
>> +	return 0;
>>  }
>>  
>>  static void kvmppc_book3s_exit_hv(void)
>> -- 
>> 2.33.1
>> 
>> 
>
> Also looks okay to me but KVM init has lots of details. IIRC Alexey may 
> have run into a related issue with ops being set too early (or was it 
> cleared too late?)
>
> Thanks,
> Nick
>

CC Alexey



