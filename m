Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E3B26FBCA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 13:51:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtBxD1jkpzDqkm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 21:50:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rcbu+7as; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtBvP1RmGzDqkJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 21:49:20 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08IBXGKw088822; Fri, 18 Sep 2020 07:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7H6ZipSc3a8/ReZQ6/MCfaS/nOB+ounjxc5BSQMpj5k=;
 b=rcbu+7asbFt8BtUlIAfoEKptS+mRTz+34FyQIGMnAIAVlcP81W+20/wfn3NlFgK/Vocy
 AOWz7Ck6vhmQ4uhWq7ogxnKHEh4uxMg0sEimMwVRdk9r37WS9egP4RNlal7Di70s0n4u
 FanQu022LppWGA6FKEl9Ur/MRb7pLKuF6A3uEq3ZkM9YEeWIr7vz/lquuFpw6Ejcy4sP
 MaPiezrkPjLtKmQ9TAhVFZ2NFbjUlVDT6VG1rrVQMeU1ulKfl8GAt1wHXLTne0bEHyyl
 rCb4fumjeJuNNLTD1D3tQv9txjTKecTQzu1+WKtkv3F0UrKaW3LTvSjWi6m8c6a03u5U zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33mt2quw3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 07:49:13 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08IBXOiO089424;
 Fri, 18 Sep 2020 07:49:12 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33mt2quw1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 07:49:12 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08IBd3fm015918;
 Fri, 18 Sep 2020 11:49:08 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 33k6esk4bv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 11:49:08 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08IBn5rv29294908
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Sep 2020 11:49:05 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B179D5204E;
 Fri, 18 Sep 2020 11:49:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.209.154])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0C79C52050;
 Fri, 18 Sep 2020 11:49:03 +0000 (GMT)
Subject: Re: [PATCH 0/3] powerpc/mce: Fix mce handler and add selftest
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>, npiggin@gmail.com
References: <20200916172228.83271-1-ganeshgr@linux.ibm.com>
 <20200917122920.GR29778@kitsune.suse.cz>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <219931ea-ea22-2979-d447-fd5366bb7d6f@linux.ibm.com>
Date: Fri, 18 Sep 2020 17:19:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917122920.GR29778@kitsune.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_14:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 mlxlogscore=795 mlxscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009180096
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
Cc: linuxppc-dev@lists.ozlabs.org, mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/17/20 5:59 PM, Michal Suchánek wrote:
> Hello,
>
> On Wed, Sep 16, 2020 at 10:52:25PM +0530, Ganesh Goudar wrote:
>> This patch series fixes mce handling for pseries, provides debugfs
>> interface for mce injection and adds selftest to test mce handling
>> on pseries/powernv machines running in hash mmu mode.
>> debugfs interface and sleftest are added only for slb multihit
>> injection, We can add other tests in future if possible.
>>
>> Ganesh Goudar (3):
>>    powerpc/mce: remove nmi_enter/exit from real mode handler
>>    powerpc/mce: Add debugfs interface to inject MCE
>>    selftest/powerpc: Add slb multihit selftest
> Is the below logic sound? It does not agree with what is added here:
>
> void machine_check_exception(struct pt_regs *regs)
> {
> 	int recover = 0;
>
> 	/*
> 	 * BOOK3S_64 does not call this handler as a non-maskable interrupt
> 	 * (it uses its own early real-mode handler to handle the MCE proper
> 	 * and then raises irq_work to call this handler when interrupts are
> 	 * enabled).
> 	 *
> 	 * This is silly. The BOOK3S_64 should just call a different function
> 	 * rather than expecting semantics to magically change. Something
> 	 * like 'non_nmi_machine_check_exception()', perhaps?
> 	 */
> 	const bool nmi = !IS_ENABLED(CONFIG_PPC_BOOK3S_64);
>
> 	if (nmi) nmi_enter();
>
> Thanks
>
> Michal
Looks like Nick Piggin has the Justification for it, Ill leave Nick to 
answer this.
