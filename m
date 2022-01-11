Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9182548BADB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 23:41:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYQfD345Rz30FH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 09:41:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dcMRxMEX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=michaele@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dcMRxMEX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYQdQ6hxXz2yM5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 09:40:42 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BLAqHR014944; 
 Tue, 11 Jan 2022 22:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=iPmFBnIs9MX6da3C5UI0onLz2YHAwVOMCfY0PeQVzLQ=;
 b=dcMRxMEXEIxg5+THRiDCC0UbaTirUdP0p1hF/tQnkfwfuEiUiT5b0OZu2lyHHzxpcT6K
 jaWR+uxfyV+TICfSN6h1puexz+Jt4jY+FGKvMSDRsbLGQsNymYuj25cLWPyQwichDYHK
 1dRw7Ofrh81RohoSikgVZr9SXnSHobys/UuXLJHiGTlm3ATd3sCSv4rJQ6a7T14VA+j8
 7VCnxJn288qMNTLwYhLsIkxMxJZImhF/QSvrZt5Y0Z66LJVLSI2BQuJPOiEgikHDW6n9
 TuMEAUolCfH6vBPL9j/112/updre9W2rtX6P/CG/G76WyHFEePGTB4RzGeIBFnbpDL1P Og== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhd08gnjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 22:40:39 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20BMWutC003797;
 Tue, 11 Jan 2022 22:40:37 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3df28944fe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 22:40:37 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20BMeYvc47251964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 22:40:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2E19A405F;
 Tue, 11 Jan 2022 22:40:34 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CC44A4062;
 Tue, 11 Jan 2022 22:40:34 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 11 Jan 2022 22:40:34 +0000 (GMT)
Received: from localhost (unknown [9.43.169.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 23A6D602FC;
 Wed, 12 Jan 2022 09:40:31 +1100 (AEDT)
From: Michael Ellerman <michaele@au1.ibm.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>, Laurent Dufour
 <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] powerpc/pseries: read the lpar name from the firmware
In-Reply-To: <c26f2961-dd19-b888-b601-af5ade74c140@linux.ibm.com>
References: <20220106161339.74656-1-ldufour@linux.ibm.com>
 <c26f2961-dd19-b888-b601-af5ade74c140@linux.ibm.com>
Date: Wed, 12 Jan 2022 09:40:27 +1100
Message-ID: <87zgo128x0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: r5C0L4Qia6dwyufzFNrT2OS_Es33b-yp
X-Proofpoint-GUID: r5C0L4Qia6dwyufzFNrT2OS_Es33b-yp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 clxscore=1011 mlxlogscore=999 adultscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201110118
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> On 1/6/22 8:13 AM, Laurent Dufour wrote:
>> The LPAR name may be changed after the LPAR has been started in the HMC.
>> In that case lparstat command is not reporting the updated value because it
>> reads it from the device tree which is read at boot time.
>> 
>> However this value could be read from RTAS.
>> 
>> Adding this value in the /proc/powerpc/lparcfg output allows to read the
>> updated value.
>> 
>> However the hypervisor, like Qemu/KVM, may not support this RTAS
>> parameter. In that case the value reported in lparcfg is read from the
>> device tree and so is not updated accordingly.
>> 
>> Cc: Nathan Lynch <nathanl@linux.ibm.com>
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>
> My only nit would be that in general for consistency with other function names
> _RTAS_ and _DT_ should be lowercase. Seeing as they are statically scoped within
> lparcfg.c maybe its ok. Otherwise,

Yeah I agree, I changed them to lower case when applying.

cheers
