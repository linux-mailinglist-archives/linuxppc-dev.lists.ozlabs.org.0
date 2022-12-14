Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C9264C412
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 07:52:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NX5dk63Djz3cKW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 17:52:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=wangyufen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NX5d74g22z3bbD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 17:51:52 +1100 (AEDT)
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NX5bp5qdCz16LbB;
	Wed, 14 Dec 2022 14:50:46 +0800 (CST)
Received: from [10.174.179.191] (10.174.179.191) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 14 Dec 2022 14:51:44 +0800
Message-ID: <7f64282d-b749-f2f6-0027-822aab83c9c8@huawei.com>
Date: Wed, 14 Dec 2022 14:51:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] powerpc/pseries: fix potential memory leak in
 init_cpu_associativity()
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
	<christophe.leroy@csgroup.eu>, <mpe@ellerman.id.au>, <npiggin@gmail.com>
References: <1670463165-20589-1-git-send-email-wangyufen@huawei.com>
 <1670911471.bu7q0e91m2.naveen@linux.ibm.com>
From: wangyufen <wangyufen@huawei.com>
In-Reply-To: <1670911471.bu7q0e91m2.naveen@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.191]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2022/12/13 14:06, Naveen N. Rao 写道:
> Wang Yufen wrote:
>> If the vcpu_associativity alloc memory successfully but the
>> pcpu_associativity fails to alloc memory, the vcpu_associativity
>> memory leaks.
>>
>> Fixes: d62c8deeb6e6 ("powerpc/pseries: Provide vcpu dispatch statistics")
>> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
>> ---
>>  arch/powerpc/platforms/pseries/lpar.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/powerpc/platforms/pseries/lpar.c 
>> b/arch/powerpc/platforms/pseries/lpar.c
>> index 97ef649..501ee6c 100644
>> --- a/arch/powerpc/platforms/pseries/lpar.c
>> +++ b/arch/powerpc/platforms/pseries/lpar.c
>> @@ -211,6 +211,7 @@ static int init_cpu_associativity(void)
>>
>>      if (!vcpu_associativity || !pcpu_associativity) {
>>          pr_err("error allocating memory for associativity 
>> information\n");
>> +        kfree(vcpu_associativity);
> 
> I think we should call destroy_cpu_associativity() here instead. We 
> don't know which allocation failed, so it is better to try and free 
> both, and also to reset the pointers to 0.

Hi,

Okay, I'll send a v2 with the following modifications:

--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -524,8 +524,10 @@ static ssize_t vcpudispatch_stats_write(struct file 
*file, const char __user *p,

  	if (cmd) {
  		rc = init_cpu_associativity();
-		if (rc)
+		if (rc) {
+			destroy_cpu_associativity();
  			goto out;
+		}

  		for_each_possible_cpu(cpu) {
  			disp = per_cpu_ptr(&vcpu_disp_data, cpu);

Thanks,
Wang

> 
> 
> - Naveen
> 
> 
