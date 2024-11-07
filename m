Return-Path: <linuxppc-dev+bounces-2985-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA019C0895
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 15:13:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkkZT5ZSKz3bm3;
	Fri,  8 Nov 2024 01:13:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730988817;
	cv=none; b=GcMkHRgOkecAFiXyQgokTVNbBjql0krKHwmwUEHOGlHfUpW5MlfNPYTNwMRM0eGioipI2JP2qRRPKU+bwqX3iqbEkGyOnw+PiL53am6AB1FmkjyNDlDphkuvexPfAWVD0CipAeqrwRCrE9o6urkyi4AI7JeFq/8G/Z1iHr6jHoWpgrDZpYNyPp8Ig2FnfMAgj62i4iqXQ4FTMqnbIM27DNqb37NY88KRce4td8y8XPR7sT4kA/0xxQzDFTN1qsENtLe64baklZdGBBlnQSzNmM1sN5WRTy1eMjSLgKGjAlA3cZzN7JnVu7kCh1+BDODe6f5oFEncNrq40onijBSJag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730988817; c=relaxed/relaxed;
	bh=AwU6f9g4/UeatPa2CtGBIPn3FGkR1+NhcMAHd7GfVmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EeCg6lbb/zg/Sjl3W2AmkE9OlNm5NigTO2j6edUvCPBzfioTi/xIeSknsO+rPkNp4V1kSJxITCvJO4ZQ2BCuAM3B+wPSns4I7IO51cTQhoTgF8N48uFG4SXIdevVu+1AfFSDHnC9HzeySoWVeijy/nbEy5vtDFSC5C10+ohOCyFSRw9M+lxdnFQHWkGXe9kBRNm0xkygFqWBWAxCvAnIkGVf/5oYyMxAiZj0puFm3UIthUFpyE8nFyx2YfdxUzZKRyTYQiyutrPr/SFyPuhTcCfO4uR3ohoLX/zXd6f3469mIbkddwjSBarH0DzNLJlCHImB13lWKmmYmNw+jvuTMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eCUIcqkO; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eCUIcqkO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkkZR19kHz3blH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 01:13:34 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7E9u3E031182;
	Thu, 7 Nov 2024 14:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=AwU6f9g4/UeatPa2CtGBIPn3FGkR1+
	NhcMAHd7GfVmw=; b=eCUIcqkOK7dYvjvVdiIjPHmAUA57a067NEYFAaGdemuBWI
	sk0IM22A6ACkaVbQEg3nbSdg782xm+Loa2JHh8aCG9SEy1m5wYJRZ+/P+JM3h2Yz
	90UqrcVfohmnpJs6RcyT4HYWcF9NJWyH/DouoAjHYU+aRm74vfpHItzvUtrk0GiD
	/i8nr9k0mhP1hNaiV00szCkrED1KPCRZs2QlApICiariuJJOnNRM8w9jxj5Wrk/m
	c1uHIuB0WZGgtNneB1O3YLbXL5sy2gyeUKaIiOHhNjblfvYssvPPzXXT5YfP+L5O
	yIeghTXtnNPhkemUXFJHLJlY/fs4zPAjzpCy/nqA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42rxmrr503-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 14:12:45 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A7ECjh8005385;
	Thu, 7 Nov 2024 14:12:45 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42rxmrr4yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 14:12:45 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7BbM5K031854;
	Thu, 7 Nov 2024 14:12:44 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42nydmrb9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 14:12:44 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A7ECgjk34079400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Nov 2024 14:12:42 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66BB120043;
	Thu,  7 Nov 2024 14:12:42 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 792EF20040;
	Thu,  7 Nov 2024 14:12:40 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.124.213.199])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  7 Nov 2024 14:12:40 +0000 (GMT)
Date: Thu, 7 Nov 2024 19:42:37 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
        maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch/powerpc/pseries: Fix KVM guest detection for
 disabling hardlockup detector
Message-ID: <2kkln3emctf7ewsh3eysujid2e7jel7yjtscfxmqeymeo5bjxf@7yzi5eye2n5j>
References: <20241105132734.499506-1-gautam@linux.ibm.com>
 <87ed3ncl8q.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ed3ncl8q.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k25Z8U5bE-r4wwIghCv9v7MsnU_Vs5Jf
X-Proofpoint-GUID: z54yCQYWmv27il52UZDaWwWxbk7EIW0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070110
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 07, 2024 at 10:54:29PM +1100, Michael Ellerman wrote:
> Gautam Menghani <gautam@linux.ibm.com> writes:
> > As per the kernel documentation[1], hardlockup detector should be
> > disabled in KVM guests as it may give false positives. On PPC, hardlockup
> > detector is broken inside KVM guests because disable_hardlockup_detector()
>  
> Isn't it the opposite? Inside KVM guests, the hardlockup detector should
> be *disabled*, but it's not it's *enabled*, due to this bug.
> 
> ie. it's not broken, it's working, but that's the bug.

Yes right, will change the description in v2.

> 
> > is marked as early_initcall and it uses is_kvm_guest(), which is
> > initialized by check_kvm_guest() later during boot as it is a
> > core_initcall. check_kvm_guest() is also called in pSeries_smp_probe(),
> > which is called before initcalls, but it is skipped if KVM guest does
> > not have doorbell support or if the guest is launched with SMT=1.
> 
> I'm wondering how no one has noticed. Most KVM guests have SMT=1.

Looking at the commit history, code around hardlockups and
pSeries_smp_probe() was changed around 2021/2022 timeframe, and I
believe KVM wasn't being actively tested at the time. 
Even I noticed this only after coming across the documentation that said
hardlockups should be disabled. So probably this feature decision isn't
widely known.

> 
> > Move the check_kvm_guest() call in pSeries_smp_probe() to the initial
> > part of function before doorbell/SMT checks so that "kvm_guest" static
> > key is initialized by the time disable_hardlockup_detector() runs.
> 
> check_kvm_guest() is safe to be called multiple times so
> disable_hardlockup_detector() should just call it before it calls
> is_kvm_guest(). That should avoid future breakage when the order of
> calls changes, or someone refactors pSeries_smp_probe().

Yeah I did that initially but in the worst case, that results in 3 calls
to check_kvm_guest() - the core_initcall, pseries_smp_probe() call and 
then disable_hardlockup_detector(). Will that be fine?

> 
> Can you identify the commit that broke this and include a Fixes: tag
> please.

Yes will do

Thanks,
Gautam

