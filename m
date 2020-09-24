Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4707927687C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 07:42:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxkT05yGlzDqcg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 15:42:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UYh/ZggZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxkRD4hq2zDqYL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 15:40:40 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08O5ZH57090571; Thu, 24 Sep 2020 01:40:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=nlwBonxtZMpoYHM+tvJvtjGsmQbgQe3Bxw1hbWpYQ3A=;
 b=UYh/ZggZIkcPg16BzSJVOQb2lS+DXHkYpg5w08s8W3IZgjpEV8iVFx5IigD1BIBen+99
 AxFdABzSe4gdjCOln/39qj9Jitb4a5w0WCeXdLmwL/qaBZ4cuGF2fhj87Av50PMoIkC0
 YxhNKqTzG8qQDVmHimxpoZ45Hlu7eMu1cPDAoVrrts9kz5H2KIXcOhh7ITFFtRvp46fq
 afQVm9v2G9PH2e3Ty9OZ3a77y4LvHVcZbEXMAd6mUzRwzOZAgdyEyWhnCU+Vt4KRoGe6
 fSIdjfUssMvKSO2PG0TPkkayIQ/X++9JGyK+trsm7MDwZA8862uZyc36xQC1IP1Rl7ru mw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33rj1m4gnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 01:40:33 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08O5T0xn023432;
 Thu, 24 Sep 2020 05:40:31 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 33p1f3t2y4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 05:40:31 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08O5eT3s23527726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 05:40:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 073A5AE045;
 Thu, 24 Sep 2020 05:40:29 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A42CAE051;
 Thu, 24 Sep 2020 05:40:28 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 24 Sep 2020 05:40:27 +0000 (GMT)
Date: Thu, 24 Sep 2020 11:10:27 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH] cpufreq: powernv: Fix frame-size-overflow in
 powernv_cpufreq_reboot_notifier
Message-ID: <20200924054027.GI12031@linux.vnet.ibm.com>
References: <20200922080254.41497-1-srikar@linux.vnet.ibm.com>
 <87wo0joqau.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87wo0joqau.fsf@dja-thinkpad.axtens.net>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-24_01:2020-09-24,
 2020-09-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=2 impostorscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240041
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Pratik Rajesh Sampat <psampat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Daniel Axtens <dja@axtens.net> [2020-09-24 12:35:05]:

> Hi Srikar,
> 
> 
> This looks a lot like commit d95fe371ecd2 ("cpufreq: powernv: Fix frame-size-overflow in powernv_cpufreq_work_fn").
> 

Yes, very very similar.

> As with that patch, I have checked for matching puts/gets and that all
> uses of '&' check out.
> 
> I tried to look at the snowpatch tests: they apparently reported a
> checkpatch warning but the file has since disappeared so I can't see
> what it was. Running checkpatch locally:
> 
> $ scripts/checkpatch.pl -g HEAD -strict
> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> #15: 
> make[3]: *** [./scripts/Makefile.build:316: drivers/cpufreq/powernv-cpufreq.o] Error 1
> 
> This is benign and you shouldn't wrap that line anyway.
> 
> On that basis:
> 
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> 

Thanks Daniel.

> Kind regards,
> Daniel
> 
-- 
Thanks and Regards
Srikar Dronamraju
