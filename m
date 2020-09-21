Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B00AB271CA8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 10:01:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvxjG5yxpzDqCF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 18:01:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LxMRd0ux; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvxfC1QhPzDq63
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 17:58:58 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08L7XDJH114862; Mon, 21 Sep 2020 03:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Czy5IBsuKiL63vGY+kb5VPoSw3OgpqoynUddwtmiVVk=;
 b=LxMRd0uxg+OdPFZVq40IpVSGbeUGGd61o4PllGcPo1MWLStTxphpPgNqAgFXBoFmC6n3
 pahcHEg/pzTCbhyBpISm7h7RTjU0kPendhi/dqxaQGi+uCbi/hP7ML0gc1bgdNogJIw/
 KrLtKvZjxg35/xmLtqaYCL9W4fvspIgAvyrbbMXcAZZ4DrAUJQ+E06vGnMQXdoO1lgxS
 8wbUIu/y1TASrZqq5wyacuxqTRnI/AucHoTnq1n3N05pQyWyzzbHDanPVzv0NoBl2AUF
 UrToXtClOI8WWDC2JKFR+seGIlD6ARI2zGTXXNI4X+emt44kLsOySQKgQuguxerS65nj Eg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33pqnbrxbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 03:58:49 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08L7vln8027027;
 Mon, 21 Sep 2020 07:58:47 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 33n98grx0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 07:58:47 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08L7wjtB17105312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Sep 2020 07:58:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 077785205A;
 Mon, 21 Sep 2020 07:58:45 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.187.68])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id CE65952050;
 Mon, 21 Sep 2020 07:58:44 +0000 (GMT)
Subject: Re: [PATCH AUTOSEL 5.4 101/330] powerpc/powernv/ioda: Fix ref count
 for devices with their own PE
To: Sasha Levin <sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
 <20200918020110.2063155-101-sashal@kernel.org>
 <52532d8a-8e90-8a68-07bd-5a3e08c58475@linux.ibm.com>
 <20200919181029.GI2431@sasha-vm>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <8eaefe77-8cdf-1da5-f573-633713598eb6@linux.ibm.com>
Date: Mon, 21 Sep 2020 09:58:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200919181029.GI2431@sasha-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-21_01:2020-09-21,
 2020-09-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1031 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009210054
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/09/2020 à 20:10, Sasha Levin a écrit :
> On Fri, Sep 18, 2020 at 08:35:06AM +0200, Frederic Barrat wrote:
>>
>>
>> Le 18/09/2020 à 03:57, Sasha Levin a écrit :
>>> From: Frederic Barrat <fbarrat@linux.ibm.com>
>>>
>>> [ Upstream commit 05dd7da76986937fb288b4213b1fa10dbe0d1b33 ]
>>>
>>
>> This patch is not desirable for stable, for 5.4 and 4.19 (it was 
>> already flagged by autosel back in April. Not sure why it's showing 
>> again now)
> 
> Hey Fred,
> 
> This was a bit of a "lie", it wasn't a run of AUTOSEL, but rather an
> audit of patches that went into distro/vendor trees but not into the
> upstream stable trees.
> 
> I can see that this patch was pulled into Ubuntu's 5.4 tree, is it not
> needed in the upstream stable tree?


That patch in itself is useless (it replaces a ref counter leak by 
another one). It was part of a longer series that we backported to 
Ubuntu's 5.4 tree.
So it's really not needed on the stable trees. It likely wouldn't hurt 
or break anything, but there's really no point.

   Fred

