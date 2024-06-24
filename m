Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFF5915703
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 21:12:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q1Y36HA3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7Hf443xNz3cYB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 05:12:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q1Y36HA3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7HdN1Mj0z3cXw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 05:11:51 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OIULO3016060;
	Mon, 24 Jun 2024 19:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=n
	ehmikWmdM/kJtb5KX//x+xdyw1dPk//cLoVAZPSe2w=; b=q1Y36HA3RW5h/eW7Y
	ZCxpAB3jeZCroqn1RZZ2rKq/rZSxJXc7ipfmCy4dDAGgB8jxpT4MMC1zW8pNxDEN
	uSTGF3NNnhnvzo4djRAdBxGB1hlwH8Y6JdScgGHjqffV9HekGvama6nONDIWn0ki
	E7x6CCiSrXsUzEsD5WpxH+IDgCinJNNTCpMFs8neqQUNlVRAHuw2+upYEmxrHPD6
	IsF8iDyfst+6ZZ8kh1ZutIFNj/8S5MqNHPsyZxdAVab00gYeIABcwdhydR4OsVvr
	6EW1/Ki84r8KwqdJg2kfSggTp8OVQDZiwSS8A3TIHVDApiIbIUEwicpv4fRzuuFZ
	H20JA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yye4402qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 19:11:41 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45OJBeBI011860;
	Mon, 24 Jun 2024 19:11:40 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yye4402qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 19:11:40 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45OIUMNQ018115;
	Mon, 24 Jun 2024 19:11:40 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yx8xu2ncn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 19:11:40 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45OJBZNj26936000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jun 2024 19:11:38 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAA6658055;
	Mon, 24 Jun 2024 19:11:35 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96D4858059;
	Mon, 24 Jun 2024 19:11:32 +0000 (GMT)
Received: from [9.124.215.163] (unknown [9.124.215.163])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Jun 2024 19:11:32 +0000 (GMT)
Message-ID: <11f9cc04-91eb-4a70-9ff0-5c6f24483cd3@linux.ibm.com>
Date: Tue, 25 Jun 2024 00:41:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Skip offline cores when enabling SMT on PowerPC
To: Thomas Gleixner <tglx@linutronix.de>
References: <20240612185046.1826891-1-nysal@linux.ibm.com>
 <875xudoz4d.fsf@mail.lhotse> <87ikxza01w.ffs@tglx>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <87ikxza01w.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5Wn1QeCSWkHb9lQ2k2z3gmkExtQTKTLo
X-Proofpoint-ORIG-GUID: fwa8IBLDVE_kaukpVhZqEagT37MAZ4-R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_15,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=800 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240150
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, "Nysal Jan K.A." <nysal@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/24/24 1:44 AM, Thomas Gleixner wrote:
> Michael!
> 
> On Thu, Jun 13 2024 at 21:34, Michael Ellerman wrote:
>> IIUIC the regression was in the ppc64_cpu userspace tool, which switched
>> to using the new kernel interface without taking into account the way it
>> behaves.
>>
>> Or are you saying the kernel behaviour changed on x86 after the powerpc
>> HOTPLUG_SMT was added?
> 
> No. The mechanism was always this way. Only offline nodes have been
> skipped. x86 never checked for the core being online.
> 
>> It's only x86 and powerpc right?
>>
>> Having different behaviour on the only two arches that support the
>> interface does not seem like a good result.
>>
>>> What is the expected behaviour on x86 when enabling SMT and certain cores
>>> are offline? 
>>
>> AFAIK no one really touches SMT on x86 other than to turn it off for
>> security reasons.
> 
> Right. So changing it not to online a thread when the full core is
> offline should not really break stuff.
> 
> OTH, the mechanism to figure that out on x86 is definitely different and
> more complicated than on power because the sibling threads are not
> having consecutive CPU numbers.

wouldn't topology_sibling_cpumask have this info? 
If the mask is empty does it mean the core is offline? 

> 
> So I'm not sure whether it's worth to make this consistent and I
> definitely can live with the proposed patches.
> 
> Thanks,
> 
>         tglx
