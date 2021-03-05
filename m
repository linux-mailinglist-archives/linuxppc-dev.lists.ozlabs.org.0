Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D62C832E34F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 09:05:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsKzl69nfz3dCJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 19:05:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BRvj/LUR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BRvj/LUR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsKzK1dtmz30Nj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 19:05:16 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12584V5K125028; Fri, 5 Mar 2021 03:05:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ojgh08nhkBozW5mZ5COh3+R5k4wHeCmdvIA4CCCBqwU=;
 b=BRvj/LURCy5hzUub6nHFOdbDnAsdNtDXa2F5lNFNFQ5Ru3Yg1FidPVOFIr0FdcvynzI6
 pyX0/LR37J7oC6X7Mx+UfkPywnAzok0TCizOJZE4xOKCPJTOOOhi9juLtJ1Zg+dKVEBs
 MNMSNb3K8Fs+4pPfoCMnIQgdazR2L9YQXFpt6B/b1gRBcRLw8jFVDHLZYZnB/IwIz1UO
 kNE12QlolR0QOxU5zdthmKj/BlBqarGnccmc9IXanrQwrMAb+E1P+5gBN8Uqim3EIPMK
 WO4ZDBSX5XmPU2m/hIIOlcdRd39C+XsRx5nFppoO1V0lATZ9GgMNvK9XLzI21Oq4tUPG LQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 373dh6nd8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 03:05:06 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 12581jWw030752;
 Fri, 5 Mar 2021 08:04:24 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3713s9stma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 08:04:24 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12584LAE53346648
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Mar 2021 08:04:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A467442047;
 Fri,  5 Mar 2021 08:04:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5902D42041;
 Fri,  5 Mar 2021 08:04:21 +0000 (GMT)
Received: from pomme.local (unknown [9.145.58.197])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Mar 2021 08:04:21 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: export LPAR security flavor in lparcfg
To: Michael Ellerman <mpe@ellerman.id.au>, benh@kernel.crashing.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
References: <20210304114240.54112-1-ldufour@linux.ibm.com>
 <871rcuruee.fsf@mpe.ellerman.id.au>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <2c67c119-c1ec-b079-da54-0bf2f316c734@linux.ibm.com>
Date: Fri, 5 Mar 2021 09:04:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <871rcuruee.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-05_04:2021-03-03,
 2021-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050038
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
Cc: nathanl@linux.ibm.com, cheloha@linux.ibm.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 05/03/2021 à 07:23, Michael Ellerman a écrit :
> Laurent Dufour <ldufour@linux.ibm.com> writes:
>> This is helpful to read the security flavor from inside the LPAR.
> 
> We already have /sys/kernel/debug/powerpc/security_features.
> 
> Is that not sufficient?

Not really, it only reports that security mitigation are on or off but not the 
level set through the ASMI menu. Furthermore, reporting it through
/proc/powerpc/lparcfg allows an easy processing by the lparstat command (see below).

> 
>> Export it like this in /proc/powerpc/lparcfg:
>>
>> $ grep security_flavor /proc/powerpc/lparcfg
>> security_flavor=1
>>
>> Value means:
>> 0 Speculative execution fully enabled
>> 1 Speculative execution controls to mitigate user-to-kernel attacks
>> 2 Speculative execution controls to mitigate user-to-kernel and
>>    user-to-user side-channel attacks
> 
> Those strings come from the FSP help, but we have no guarantee it won't
> mean something different in future.

I think this is nailed down, those strings came from:
https://www.ibm.com/support/pages/node/715841

Where it is written (regarding AIX):

On an LPAR, one can use lparstat -x to display the current mitigation mode:
0 = Speculative execution fully enabled
1 = Speculative execution controls to mitigate user-to-kernel side-channel attacks
2 = Speculative execution controls to mitigate user-to-kernel and user-to-user 
side-channel attacks

We have been requested to provide almost the same, which I proposed in 
powerpc-utils:
https://groups.google.com/g/powerpc-utils-devel/c/NaKXvdyl_UI/m/wa2stpIDAQAJ

Thanks,
Laurent.
