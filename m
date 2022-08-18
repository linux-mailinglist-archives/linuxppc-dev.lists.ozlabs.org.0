Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267875981C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 12:56:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7hdv72Jtz3drP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 20:56:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OdRrNuh/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OdRrNuh/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7hdD2D9yz2xjl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 20:55:59 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IAqApa027599;
	Thu, 18 Aug 2022 10:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=V05XG+furiG9o1tKinGyILRRe6fuw2NRAwO08YRhd1k=;
 b=OdRrNuh/H2W2ZEql5pYGNwC8dXU1ZNx0FCRMVSNpkh7uUkW3rsexveaTYx3D63vdM1Ji
 qt/0GyAxJPcFmSNaeVVevmlaWYs4WsXvnXyGT6URZcvNpaw6WVHN5axXIpwxHnMnj0uC
 rcsgFWm8S4rq1XU8g4U3IC40KiFDPx9MpqGEy9FCVOt6MkcP0TIbqObe4GtGffZEVIBK
 01URvVFngksIFbTIssyylZAtlKMirW8sv8/ldjon4dPR02wfyCiHY40OdQE0JwWf4RO3
 gosg7/P1GlcwgYcfafZ6NVpqcGGs2XGhoeQTfg+koFed/Hsll+/ra9JMylsUJH11jDTC dw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1m2502cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 10:55:38 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27IArAw5030058;
	Thu, 18 Aug 2022 10:55:37 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1m2502c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 10:55:36 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27IAp604021172;
	Thu, 18 Aug 2022 10:55:34 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma05fra.de.ibm.com with ESMTP id 3hyp8sjsne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 10:55:34 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27IAqiGs25887032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Aug 2022 10:52:44 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 03CA111C058;
	Thu, 18 Aug 2022 10:55:32 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFF3111C04A;
	Thu, 18 Aug 2022 10:55:28 +0000 (GMT)
Received: from [9.109.198.207] (unknown [9.109.198.207])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 18 Aug 2022 10:55:28 +0000 (GMT)
Message-ID: <c429f624-a25b-fe80-56c8-01cb733c3909@linux.vnet.ibm.com>
Date: Thu, 18 Aug 2022 16:25:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/16] powerpc: Fix objtool unannotated intra-function
 call warnings
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220808114908.240813-1-sv@linux.ibm.com>
 <20220808114908.240813-4-sv@linux.ibm.com>
 <d3022c04-8fd5-d357-e22d-041e8f70aac8@csgroup.eu>
From: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
In-Reply-To: <d3022c04-8fd5-d357-e22d-041e8f70aac8@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jqRNJPAX4DlREWWVQ1vT6jfLohQ0xeE7
X-Proofpoint-GUID: rsguQs3nhjwFX_kXC3uhLfeUHQcvVBRD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_11,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180036
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 10/08/22 14:02, Christophe Leroy wrote:
>
> Le 08/08/2022 à 13:48, Sathvika Vasireddy a écrit :
>> objtool throws unannotated intra-function call warnings
>> in the following assembly files.
>>
>> arch/powerpc/kernel/vector.o: warning: objtool: .text+0x53c: unannotated intra-function call
>>
>> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x60: unannotated intra-function call
>> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x124: unannotated intra-function call
>> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x5d4: unannotated intra-function call
>> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x5dc: unannotated intra-function call
>> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xcb8: unannotated intra-function call
>> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xd0c: unannotated intra-function call
>> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x1030: unannotated intra-function call
>>
>> arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x358: unannotated intra-function call
>> arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x728: unannotated intra-function call
>> arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x4d94: unannotated intra-function call
>> arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x4ec4: unannotated intra-function call
>>
>> arch/powerpc/kvm/book3s_hv_interrupts.o: warning: objtool: .text+0x6c: unannotated intra-function call
>> arch/powerpc/kernel/misc_64.o: warning: objtool: .text+0x64: unannotated intra-function call
>>
> Before explaining how you fix it, can you explain why we get it ?
Sure.

objtool does not add STT_NOTYPE symbols with size 0 to the rbtree, which 
is why find_call_destination()
function is not able to find the destination symbol for 'bl' 
instruction. For such symbols, objtool is throwing
unannotated intra-function call warnings in assembly files. Fix these 
warnings by adding
SYM_FUNC_START_LOCAL() and SYM_FUNC_END() annotations to those symbols 
to be able to set symbol
type to STT_FUNC and set size of these symbols accordingly.

I'll add this explanation to the commit message.

Thanks for reviewing.

- Sathvika
