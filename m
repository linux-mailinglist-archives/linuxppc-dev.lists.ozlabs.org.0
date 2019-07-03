Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3769C5EA70
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 19:27:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f7Mz6PY7zDqVv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 03:27:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=arbab@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f7Cn1vBRzDqbW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 03:20:21 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x63HGkoF043853
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 3 Jul 2019 13:20:18 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tgyg4asud-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 13:20:18 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <arbab@linux.ibm.com>;
 Wed, 3 Jul 2019 18:20:17 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Jul 2019 18:20:13 +0100
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x63HKCnv59834672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jul 2019 17:20:12 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 245B1136061;
 Wed,  3 Jul 2019 17:20:12 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02CFE13606E;
 Wed,  3 Jul 2019 17:20:11 +0000 (GMT)
Received: from arbab-vm.localdomain (unknown [9.85.182.131])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  3 Jul 2019 17:20:11 +0000 (GMT)
Received: from arbab-vm (localhost [IPv6:::1])
 by arbab-vm.localdomain (Postfix) with ESMTP id 7E197100227;
 Wed,  3 Jul 2019 12:20:09 -0500 (CDT)
Date: Wed, 3 Jul 2019 12:20:09 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [v2 09/12] powerpc/mce: Enable MCE notifiers in external modules
References: <20190702051932.511-1-santosh@fossix.org>
 <20190702051932.511-10-santosh@fossix.org>
 <1562047959.5y756f60wn.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1562047959.5y756f60wn.astroid@bobo.none>
Organization: IBM Linux Technology Center
User-Agent: NeoMutt/20180716
X-TM-AS-GCONF: 00
x-cbid: 19070317-0004-0000-0000-00001523A068
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011372; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01226931; UDB=6.00645967; IPR=6.01008158; 
 MB=3.00027570; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-03 17:20:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070317-0005-0000-0000-00008C514684
Message-Id: <20190703172008.aiyofnhqgbzi6ckw@arbab-vm>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-03_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=6
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=6
 clxscore=1015 lowpriorityscore=0 mlxscore=6 impostorscore=0
 mlxlogscore=119 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907030210
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 02, 2019 at 04:17:11PM +1000, Nicholas Piggin wrote:
>Santosh Sivaraj's on July 2, 2019 3:19 pm:
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -458,6 +458,12 @@ EXC_COMMON_BEGIN(machine_check_handle_early)
>>  	bl	machine_check_early
>>  	std	r3,RESULT(r1)	/* Save result */
>>
>> +	/* Notifiers may be in a module, so enable virtual addressing. */
>> +	mfmsr	r11
>> +	ori	r11,r11,MSR_IR
>> +	ori	r11,r11,MSR_DR
>> +	mtmsr	r11
>
>Can't do this, we could take a machine check somewhere the MMU is
>not sane (in fact the guest early mce handling that was added recently
>should not be enabling virtual mode either, which needs to be fixed).

Rats. So in machine_check_handle_early() there are two options; either 

1. The mc is unhandled/unrecoverable. Stay in real mode, proceed to 
unrecover_mce(), the fatal path of no return (panic, reboot, etc).

2. The mc is handled/recovered. Return from MCE where any further action 
can be done by processing the machine check event workqueue. Am I  
understanding you correctly that this is the absolute earliest we can 
get back to virtual mode?

Since the notifier chain is actually part of the decision between (1) 
and (2), it's a hard limitation then that callbacks be in real address 
space. Is there any way to structure things so that's not the case?

Luckily this patch isn't really necessary for memcpy_mcsafe(), but we 
have a couple of other potential users of the notifier from external 
modules (so their callbacks would require virtual mode).

-- 
Reza Arbab

