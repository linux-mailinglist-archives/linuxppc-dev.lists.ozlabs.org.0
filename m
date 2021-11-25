Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEA045DD02
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 16:12:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0LvK6rQmz3bnq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 02:11:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ozbn7aVr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ozbn7aVr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0LtW5ZJ2z2yRf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 02:11:14 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1APDvbSP007074; 
 Thu, 25 Nov 2021 15:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=3mReLVFsQF/i7Fje+DteTHSU2RYroWXG7H3JjClCMf8=;
 b=Ozbn7aVrPKU6IFxmPadRTS73NEvn4LFBW3WRQ/HTCkUmWdwygmDmQmBrMNsZGXCSIalD
 y/deoIGHI9vimEpAuaY5RM3MmUdP5S1m0GH7IsQ798pY5oY/CepTHQ9rwtMoizBj7gWh
 9x1PLD7gYZ72Jt//rFsiwPElBZJWFJVqCk7Lm7+u6FweI1bD+f7YH0qOf4X9mPaKkBHZ
 JJsNLO25tK8mN9rid4PTs/snlbuVng0WpnmQrWC3RQ2HKz6y8h34Tf1BXMtJt21uPa3L
 XpzTYefhWv2pRpbREyb8hiuNW0ctKyvsTEVh4zSPryux2rgaLqZn+wHYX+sBVxIoLvLG +w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cj91e56vx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 15:11:08 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1APEqb0W005807;
 Thu, 25 Nov 2021 15:11:08 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cj91e56vf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 15:11:08 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1APF7Df3012564;
 Thu, 25 Nov 2021 15:11:06 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3cernat85g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 15:11:06 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1APFB4qI26739024
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 15:11:04 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F86E11C05E;
 Thu, 25 Nov 2021 15:11:04 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 099C211C05C;
 Thu, 25 Nov 2021 15:11:04 +0000 (GMT)
Received: from [9.145.31.81] (unknown [9.145.31.81])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 25 Nov 2021 15:11:03 +0000 (GMT)
Message-ID: <0f848698-91b1-6881-b584-8134ceecc696@linux.ibm.com>
Date: Thu, 25 Nov 2021 16:11:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v3 0/4] powerpc: watchdog fixes
Content-Language: en-US
To: Michael Ellerman <patch-notifications@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211110025056.2084347-1-npiggin@gmail.com>
 <163783300386.1228879.11827829331246737742.b4-ty@ellerman.id.au>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <163783300386.1228879.11827829331246737742.b4-ty@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uRSmvpDqgaFCJ0t3KPIwam01SHXUFRxx
X-Proofpoint-ORIG-GUID: Pydcm8edd_QtI3bT9mZv_TgCMLvfNZU4
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_06,2021-11-25_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111250083
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

On 25/11/2021, 10:36:43, Michael Ellerman wrote:
> On Wed, 10 Nov 2021 12:50:52 +1000, Nicholas Piggin wrote:
>> These are some watchdog fixes and improvements, in particular a
>> deadlock between the wd_smp_lock and console lock when the watchdog
>> fires, found by Laurent.
>>
>> Thanks,
>> Nick
>>
>> [...]
> 
> Applied to powerpc/next.
> 
> [1/4] powerpc/watchdog: Fix missed watchdog reset due to memory ordering race
>       https://git.kernel.org/powerpc/c/5dad4ba68a2483fc80d70b9dc90bbe16e1f27263
> [2/4] powerpc/watchdog: tighten non-atomic read-modify-write access
>       https://git.kernel.org/powerpc/c/858c93c31504ac1507084493d7eafbe7e2302dc2
> [3/4] powerpc/watchdog: Avoid holding wd_smp_lock over printk and smp_send_nmi_ipi
>       https://git.kernel.org/powerpc/c/76521c4b0291ad25723638ade5a0ff4d5f659771
> [4/4] powerpc/watchdog: read TB close to where it is used
>       https://git.kernel.org/powerpc/c/1f01bf90765fa5f88fbae452c131c1edf5cda7ba
> 
> cheers
> 

Hi Michael,

This series has been superseded by this series (v4)
http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=272865

Do you plan to apply that v4?

Thanks,
Laurent.
