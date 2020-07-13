Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4325821D362
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 12:05:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4zly67qSzDqRp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 20:05:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4zjN4Mf0zDqRq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 20:02:48 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06DA2Wp9122637; Mon, 13 Jul 2020 06:02:40 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3278qs71bk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 06:02:40 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06DA2afa122862;
 Mon, 13 Jul 2020 06:02:36 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3278qs7149-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 06:02:36 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06D9ko3R032061;
 Mon, 13 Jul 2020 10:02:17 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 327p0vrnsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 10:02:17 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06DA2EDL1835312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jul 2020 10:02:14 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 834AE42047;
 Mon, 13 Jul 2020 10:02:14 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE56642041;
 Mon, 13 Jul 2020 10:02:12 +0000 (GMT)
Received: from [9.85.82.10] (unknown [9.85.82.10])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jul 2020 10:02:12 +0000 (GMT)
Subject: Re: [PATCH v2 0/3] Power10 basic energy management
To: Nicholas Piggin <npiggin@gmail.com>, benh@kernel.crashing.org,
 ego@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, mikey@neuling.org, mpe@ellerman.id.au,
 paulus@samba.org, pratik.r.sampat@gmail.com,
 ravi.bangoria@linux.ibm.com, svaidy@linux.ibm.com
References: <20200710052207.12003-1-psampat@linux.ibm.com>
 <1594617564.57k8bsyfd0.astroid@bobo.none>
From: Pratik Sampat <psampat@linux.ibm.com>
Message-ID: <bc6494c0-9a17-2416-c6cc-15612020f497@linux.ibm.com>
Date: Mon, 13 Jul 2020 15:32:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1594617564.57k8bsyfd0.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_07:2020-07-10,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007130072
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thank you for your comments,

On 13/07/20 10:53 am, Nicholas Piggin wrote:
> Excerpts from Pratik Rajesh Sampat's message of July 10, 2020 3:22 pm:
>> Changelog v1 --> v2:
>> 1. Save-restore DAWR and DAWRX unconditionally as they are lost in
>> shallow idle states too
>> 2. Rename pnv_first_spr_loss_level to pnv_first_fullstate_loss_level to
>> correct naming terminology
>>
>> Pratik Rajesh Sampat (3):
>>    powerpc/powernv/idle: Exclude mfspr on HID1,4,5 on P9 and above
>>    powerpc/powernv/idle: save-restore DAWR0,DAWRX0 for P10
>>    powerpc/powernv/idle: Rename pnv_first_spr_loss_level variable
>>
>>   arch/powerpc/platforms/powernv/idle.c | 34 +++++++++++++++++----------
>>   1 file changed, 22 insertions(+), 12 deletions(-)
> These look okay to me, but the CPU_FTR_ARCH_300 test for
> pnv_power9_idle_init() is actually wrong, it should be a PVR test
> because idle is not completely architected (not even shallow stop
> states, unfortunately).
>
> It doesn't look like we support POWER10 idle correctly yet, and on older
> kernels it wouldn't work even if we fixed newer, so ideally the PVR
> check would be backported as a fix in the front of the series.
>
> Sadly, we have no OPAL idle driver yet. Hopefully we will before the
> next processor shows up :P
>
> Thanks,
> Nick

So if I understand this correctly, in powernv/idle.c where we check for
CPU_FTR_ARCH_300, we should rather be making a pvr_version_is(PVR_POWER9)
check instead?

Of course, the P10 PVR and its relevant checks will have to be added then too.

Thanks
Pratik

  

