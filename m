Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECE939E933
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 23:51:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzRsK70wyz2yyC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 07:51:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GmFN+sxE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GmFN+sxE; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzRrn5vtfz2yX3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 07:51:04 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 157LX6vw083402; Mon, 7 Jun 2021 17:50:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Qs2BPbVRmHgMseBsmKfGjaUkszNrDYybcdtUnRphkW8=;
 b=GmFN+sxEqsP/LrIJyRY0H5KSsIOC7Ue4NL+lTMdEE3QPyBXbZsRLwTt1ZEj+TJ0gRz3B
 zai3+6oKk/FArmZ//HK5pK/KuY1lmu0xqKnYvrzc+bJCLU2ytIjDOIlZIBleqLcZ4wgL
 3ADTwahkavRWRk89EnI8jlUB7C0LvlWaajg2Jr7kjaKPMuqS8lWcWrajmC0tteLrXqzz
 KxYAfwDZtmdOKNdnV7LtO3vM9e5LOznA/QuJKbBxjPnR6lXU2rtTJFHqiRP7hMh1aZ+j
 VPPLKBgVLZ3K3OeBNvPmYFZUgc+LE7dmvDCMgj6MerLLQGOgqYyKESVOClmcSW+naKMI lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 391u6jgq6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 17:50:46 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 157LXHrx083794;
 Mon, 7 Jun 2021 17:50:46 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 391u6jgq65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 17:50:46 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 157LlutH012332;
 Mon, 7 Jun 2021 21:50:45 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 3900w9ae5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 21:50:45 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 157LojWc6357610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Jun 2021 21:50:45 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1812328060;
 Mon,  7 Jun 2021 21:50:45 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D756728058;
 Mon,  7 Jun 2021 21:50:44 +0000 (GMT)
Received: from localhost (unknown [9.211.151.133])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Jun 2021 21:50:44 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/stacktrace: fix raise_backtrace_ipi() logic
In-Reply-To: <878s3rh5po.fsf@mpe.ellerman.id.au>
References: <20210527011550.235443-1-nathanl@linux.ibm.com>
 <87eedkh6cb.fsf@mpe.ellerman.id.au> <871r9kyrtk.fsf@linux.ibm.com>
 <878s3rh5po.fsf@mpe.ellerman.id.au>
Date: Mon, 07 Jun 2021 16:50:44 -0500
Message-ID: <87y2blxs23.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G1l-t4MEFFctuDAgzhY6d3l_JA3ty3y4
X-Proofpoint-ORIG-GUID: fBwReJZp6wlzq3AA6GrBOChpO0TErBGF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-07_15:2021-06-04,
 2021-06-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106070144
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
Cc: npiggin@gmail.com, paulus@samba.org, clg@kaod.org, ldufour@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> Hi Michael,
>>
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>>> When smp_send_safe_nmi_ipi() indicates that the target CPU has
>>>> responded to the IPI, skip the remote paca inspection
>>>> fallback. Otherwise both the sending and target CPUs attempt the
>>>> backtrace, usually creating a misleading ("didn't respond to backtrace
>>>> IPI" is wrong) and interleaved mess:
>>>
>>> Thanks for fixing my bugs for me :)
>>>
>>
>> Thanks for your review! I was beginning to think I had missed some
>> subtletly here, thanks for illustrating it.
>>
>> I'll run with your proposed change below for the problem I'm working.
>
> Thanks. I did test it a bit with the test_lockup module, but some real
> world testing would be good too.

Been running with this to work some LPM issues and can confirm it waits
the intended amount of time before falling back to a remote stack walk,
avoiding interleaved traces from source and target CPUs. You can add my
tested-by, thanks.
