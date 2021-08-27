Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C2C3F9A44
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:33:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx0zT0nJwz3djp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:33:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QEclL0R3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QEclL0R3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0mb4vBKz3clP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:24:15 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17RD8Ypo171297; Fri, 27 Aug 2021 09:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=JtQ0g9+W4VnvSBDk13XNxPfwVixCzBBzgrfqQ9qpCh0=;
 b=QEclL0R3xnFDXIxdn7IumzNZ7CjlowSYBTv9R8vBQxCE2e68Gu7iATpwsrdm22I2Fb+m
 cIFfxceSJe/zcCEzFz+ZX74jaadTPsOOP7wVI1Wmrnl2OpRC6d4cU2bHlmh7af0JPDVf
 KUXLTvSgSVWPgvZUH4s8WhU3rIZtfrBXYOJKErXE5H/iYn1XzKR82DmuMbbyWBg70uZ3
 RiGvWc9KKLDzMsU8orkgJvOtJNeG1cyy7N10gaKDsZLSefhvRUEIAqCfS96zYNcSSqjE
 eH6yG6FE139edhYq1sn+RWVkT4q0negRWdDuqkLC9G9UFHrAB4dmZQ6xn5pYn0lowvDm ew== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3apxbqv6pv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 09:24:07 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17RDE5Fa023002;
 Fri, 27 Aug 2021 13:24:04 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3ajrrhkkrp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 13:24:04 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17RDO2Bb36897198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 13:24:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60A2752050;
 Fri, 27 Aug 2021 13:24:02 +0000 (GMT)
Received: from pomme.local (unknown [9.145.82.169])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3A06A5204E;
 Fri, 27 Aug 2021 13:24:02 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: Fix build error when NUMA=n
To: Michael Ellerman <patch-notifications@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210816041032.2839343-1-mpe@ellerman.id.au>
 <163007014079.52768.17457843527177515212.b4-ty@ellerman.id.au>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <602725d2-e139-0e7b-c731-bb755105d3fc@linux.ibm.com>
Date: Fri, 27 Aug 2021 15:24:01 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
In-Reply-To: <163007014079.52768.17457843527177515212.b4-ty@ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QJPKdr4hw_mqdAtPmcHRUcbjnjwECARM
X-Proofpoint-GUID: QJPKdr4hw_mqdAtPmcHRUcbjnjwECARM
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-27_04:2021-08-26,
 2021-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108270085
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

Le 27/08/2021 à 15:15, Michael Ellerman a écrit :
> On Mon, 16 Aug 2021 14:10:32 +1000, Michael Ellerman wrote:
>> As reported by lkp, if NUMA=n we see a build error:
>>
>>     arch/powerpc/platforms/pseries/hotplug-cpu.c: In function 'pseries_cpu_hotplug_init':
>>     arch/powerpc/platforms/pseries/hotplug-cpu.c:1022:8: error: 'node_to_cpumask_map' undeclared
>>      1022 |        node_to_cpumask_map[node]);
>>
>> Use cpumask_of_node() which has an empty stub for NUMA=n, and when
>> NUMA=y does a lookup from node_to_cpumask_map[].
>>
>> [...]
> 
> Applied to powerpc/next.
> 
> [1/1] powerpc/pseries: Fix build error when NUMA=n
>        https://git.kernel.org/powerpc/c/8b893ef190b0c440877de04f767efca4bf4d6af8
> 
> cheers
> 

Thanks, Michael, for fixing my bugs !
