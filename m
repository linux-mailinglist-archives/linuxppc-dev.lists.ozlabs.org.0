Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEB836D695
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 13:35:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVc4x3D5cz302c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 21:35:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EjRpuqMT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EjRpuqMT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVc4S03Cyz2xZW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 21:35:02 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SBXYC4091583; Wed, 28 Apr 2021 07:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : content-transfer-encoding : in-reply-to; s=pp1;
 bh=I55X0CdaUgMVHQCqOIgPqXXEVDROHQTqeezqdG5jalI=;
 b=EjRpuqMTqVoHDLjtCvGF8hidyVLq4lzRKX9rqMAoSfSv74Qpsn+dvwjFq7O2IKD4kY+/
 D+AhEoxhpBe9ve01c5ejArNyKbri0N1UACPQB7Riw2nRsPNYJjeI6UoFNgeDGSazl2Kg
 iXBviXZgCFj3zRJZic1FNnS6N+IlkJGS1EG7Hqk10ahWU4HrMCrOqCVbMtppYYkvXdVq
 Zvz0/WBvUz0OXF3qiHF1FdL8pHbFlbXSstG2wqM8s35c5ypInOvGu+d/WkL7lKNm4/oI
 ZVIBsmbH1Ms80oKhHKrYY6c96S5tGvICsme+Q2NawYu/VtcjTnWAZRvOuMl7gSD8W+7p 0w== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3876n1ggtc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 07:34:53 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13SBXBtD016703;
 Wed, 28 Apr 2021 11:34:52 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 384ay9ujun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 11:34:52 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13SBYpL927132196
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 11:34:52 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DEE436A047;
 Wed, 28 Apr 2021 11:34:51 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6717D6A057;
 Wed, 28 Apr 2021 11:34:51 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.102.0.233])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 28 Apr 2021 11:34:51 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 11D862E2E70; Wed, 28 Apr 2021 17:04:48 +0530 (IST)
Date: Wed, 28 Apr 2021 17:04:48 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH] cpuidle/pseries: Fixup CEDE0 latency only for POWER10
 onwards
Message-ID: <20210428113447.GA24644@in.ibm.com>
References: <1619104049-5118-1-git-send-email-ego@linux.vnet.ibm.com>
 <20210423073551.GZ6564@kitsune.suse.cz>
 <YILu6/GK+RwpskCc@drishya.in.ibm.com>
 <20210423174505.GE6564@kitsune.suse.cz>
 <YIMSCjTzcSwjQtRi@drishya.in.ibm.com>
 <20210423184216.GG6564@kitsune.suse.cz>
 <YIPKrIb+tY39taZv@drishya.in.ibm.com>
 <20210425110714.GH6564@kitsune.suse.cz>
 <20210428055848.GA6675@in.ibm.com>
 <20210428080326.GL6564@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210428080326.GL6564@kitsune.suse.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: X_gIJ3C2IQUDTPNjsxX-P-23rzK4OVFE
X-Proofpoint-ORIG-GUID: X_gIJ3C2IQUDTPNjsxX-P-23rzK4OVFE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_05:2021-04-27,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=780 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104280077
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
Reply-To: ego@linux.vnet.ibm.com
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>, linux-pm@vger.kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, joedecke@de.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michal,

On Wed, Apr 28, 2021 at 10:03:26AM +0200, Michal Suchánek wrote:

> > 
> That's a nice detailed explanation. Maybe you could summarize it in the
> commit message so that people looking at the patch in the future can
> tell where the value comes from.

Sure, I will do that and send a v2 with the updated commit message.


> 
> Thanks
> 
> Michal
