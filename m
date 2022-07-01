Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C795562C1A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 08:58:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZ5d15PWSz3dtW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 16:58:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iUnAEzAc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iUnAEzAc;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZ5cF2TNwz3c8s
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 16:57:32 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261637KB006173;
	Fri, 1 Jul 2022 06:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6290l+NgHjrty8aLnZBrt0cioXD/e+jyaJB8M2OYygk=;
 b=iUnAEzAc54CKZZxBjehi/edXAAhkMJyibtFxGnWodpZFzpPrcnoOQamdDsDNk0nxQogB
 H885kaJ9jcl1m/kJG8nqARS6FPrnBfme3wEP6VB4+z5E/IzzJkbA9ABRQc0P0x6VbQop
 eACPA2YKfJaRBQ6g+SYX9oIRfemEvyJJEuJo7c6M1+LUokPyYwk8i9YL6I6WwbSBs+9o
 ue15Q8Bs9Ca0XBJtGhrCFctT705feopuo4tbM30uzJ5vyWTh8jjYlBRk1rQ9SQRoZtdH
 TXqzahnCimPs6tJgMpysyATpFisyRKiXn2fcXvbOtbhdae55aJgefes3M5icTbCMJ8kA nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h1uan98nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Jul 2022 06:57:00 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2616AQgC034287;
	Fri, 1 Jul 2022 06:57:00 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h1uan98mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Jul 2022 06:57:00 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2616ZM9g007665;
	Fri, 1 Jul 2022 06:56:58 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06ams.nl.ibm.com with ESMTP id 3gwsmj9b46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Jul 2022 06:56:57 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2616utpI22675730
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Jul 2022 06:56:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AB9511C05B;
	Fri,  1 Jul 2022 06:56:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5234811C04A;
	Fri,  1 Jul 2022 06:56:50 +0000 (GMT)
Received: from [9.43.39.55] (unknown [9.43.39.55])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  1 Jul 2022 06:56:50 +0000 (GMT)
Message-ID: <8787a12a-e84c-cb0e-abe0-6bd6093e359a@linux.vnet.ibm.com>
Date: Fri, 1 Jul 2022 12:26:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from WARN_ON()
Content-Language: en-US
To: Chen Zhongjin <chenzhongjin@huawei.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-12-sv@linux.ibm.com>
 <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
 <92eae2ef-f9b6-019a-5a8e-728cdd9bbbc0@linux.vnet.ibm.com>
 <cce19b1c-449a-f306-533a-9edc855049aa@csgroup.eu>
 <1656572413.pbaqjnrrcl.naveen@linux.ibm.com>
 <dcbc25df-ce0c-45bf-35af-4d694e09ad37@huawei.com>
From: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
In-Reply-To: <dcbc25df-ce0c-45bf-35af-4d694e09ad37@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yIinsZUEGvAFPMHkW16uRukE1xSVo4Pn
X-Proofpoint-GUID: Aa-yPuWDFO0zzrnYi-bgtt-sr8lCNW3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-01_04,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1011 phishscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207010023
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "paulus@samba.org" <paulus@samba.org>, Marc Zyngier <maz@kernel.org>, "mbenes@suse.cz" <mbenes@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Chen,

Thanks for pitching in and providing your inputs :-)

On 01/07/22 07:43, Chen Zhongjin wrote:
> Hi everyone,
>
> Hope I'm not too late for this discussion.
>
> I'm not familiar with ppc so it spent me some time to reproduce this. 
> But at last I didn't make it.
>
> What I did:
>
> 1 checkout to tip/objtool/core
>
> 2 apply this patch
>
> 3 recover the unreachable() after WARN_ENTRY(..
>
> 4 compile on defconfig/allyesconfig
>
> If anyone can point out which file will generate this problem it will 
> be perfect.

To reproduce this problem, you may want to apply this patch series on 
top of objtool/core branch of the tip tree, and compile on 
ppc64le_defconfig.

There are a couple of C files that are generating these warnings. One 
such file is: arch/powerpc/kvm/../../../virt/kvm/kvm_main.o which gives
*arch/powerpc/kvm/../../../virt/kvm/kvm_main.o: warning: objtool: 
kvm_mmu_notifier_release+0x6c: unannotated intra-function call* warning.

With unreachable() in __WARN_FLAGS(), we get unannotated intra-function 
call warnings, but without unreachable() like in patch 11/12 or with 
just the builtin variant of unreachable (__builtin_unreachable()) 
instead of unreachable(), we do not get those warnings.


- Sathvika

