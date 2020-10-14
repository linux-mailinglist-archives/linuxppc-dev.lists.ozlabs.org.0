Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB1028DA88
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 09:36:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB43r2RqDzDqcJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 18:36:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pbEPhi53; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB41f0stNzDqXr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 18:34:45 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E7VtW2087159; Wed, 14 Oct 2020 03:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ycEfLdIs7qRQfk9TQpYl7n57rc19pXpR0lhZc6+HJqU=;
 b=pbEPhi538fnnSeFJMkdbVPBXZhOKI24j/NZFX5mrlCNRADffNPNx9N/RmrRAglKM8gVA
 j8kQR+0SyzjEtAwPzGE1I19/Yn/+XZOMIdG+E+40iTZOzCKtIVRho6Wp/yGYW5P98iSA
 r6d7glwA8mvUyKIGV8h0b16zIBtRUzX+Z9/6zrmC1mi+MwsVUjP7QY7qqSvD/WX8POkx
 9YKpl7/5aFeVTqPyd7l8LIZXoJwaZQoWSt/DBvkPp2Zhq5FT7CDxG16N24vOQSkEvlR0
 WEWeFE5Zct221IrwaXqPi4RpR2531S1Ir2TYQkIX0WZ3UErc3JMmI0nkskzbhdA+YTo1 xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 345vsn0es8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 03:34:27 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09E7WF81088493;
 Wed, 14 Oct 2020 03:34:26 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 345vsn0eqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 03:34:26 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09E7Rovd027363;
 Wed, 14 Oct 2020 07:34:25 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3434k7uvsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 07:34:24 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09E7YMSU24707488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Oct 2020 07:34:22 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 084074C050;
 Wed, 14 Oct 2020 07:34:22 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05FF04C044;
 Wed, 14 Oct 2020 07:34:20 +0000 (GMT)
Received: from [9.199.41.128] (unknown [9.199.41.128])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Oct 2020 07:34:19 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v5 1/5] powerpc/sstep: Emulate prefixed instructions only
 when CPU_FTR_ARCH_31 is set
To: Daniel Axtens <dja@axtens.net>
References: <20201011050908.72173-1-ravi.bangoria@linux.ibm.com>
 <20201011050908.72173-2-ravi.bangoria@linux.ibm.com>
 <877drvwocx.fsf@dja-thinkpad.axtens.net>
Message-ID: <11209037-6031-6908-a521-f73182ad5300@linux.ibm.com>
Date: Wed, 14 Oct 2020 13:04:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <877drvwocx.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_03:2020-10-14,
 2020-10-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010140048
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, bala24@linux.ibm.com,
 paulus@samba.org, sandipan@linux.ibm.com, jniethe5@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Daniel,

On 10/12/20 7:14 PM, Daniel Axtens wrote:
> Hi,
> 
> To review this, I looked through the supported instructions to see if
> there were any that I thought might have been missed.
> 
> I didn't find any other v3.1 ones, although I don't have a v3.1 ISA to
> hand so I was basically looking for instructions I didn't recognise.
> 
> I did, however, find a number of instructions that are new in ISA 3.0
> that aren't guarded:
> 
>   - addpcis
>   - lxvl/stxvl
>   - lxvll/stxvll
>   - lxvwsx
>   - stxvx
>   - lxsipzx
>   - lxvh8x
>   - lxsihzx
>   - lxvb16x/stxvb16x
>   - stxsibx
>   - stxsihx
>   - lxvb16x
>   - lxsd/stxsd
>   - lxssp/stxssp
>   - lxv/stxv
>   
> Also, I don't know how bothered we are about P7, but if I'm reading the
> ISA correctly, lqarx/stqcx. are not supported before ISA 2.07. Likewise
> a number of the vector instructions like lxsiwzx and lxsiwax (and the
> companion stores).
> 
> I realise it's not really the point of this particular patch, so I don't
> think this should block acceptance. What I would like to know - and
> maybe this is something where we need mpe to weigh in - is whether we
> need consistent guards for 2.07 and 3.0. We have some 3.0 guards already
> but clearly not everywhere.

Yes, those needs to be handled properly. Otherwise they can be harmful
when emulated on a non-supporting platform. Will work on it when I get
some time. Thanks for reporting it.

> 
> With all that said - the patch does what it says it does, and looks good
> to me:
> 
> Reviewed-by: Daniel Axtens <dja@axtens.net>

Thanks!
Ravi
