Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A3E56A74A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 17:55:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lf1Fd0KRBz3cfj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 01:55:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h4aBVIbH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h4aBVIbH;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lf1DQ3MFjz3c68
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 01:53:57 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267Fk42M017782;
	Thu, 7 Jul 2022 15:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=HsXhzMbsl58YXp9Hf56vlQISL9eW3bx0Z7mQpkenJ4k=;
 b=h4aBVIbHi+MwSmpecgkYhXEdv84JnVXP1AYQ7PYOLFPb4txwY2+hvOAFOVx5/hOMVHO4
 T7heGyc1eol+B99s3CK1R+3XtJ/s4+veOREvkcfD3Z4qdgNpumA+FUVNYiBGjLZLaHRp
 SZGM7/2/yUvfTRwrnxkLSSXhv7v7Tw4MpDDo1UVoK9eIWi0WxVTOxYw1tTKvsbeokrsB
 PmZcTApgUbx3LmLnJwy/IT7xcf5K6Igv4r/SSmIWjtfR4mkFkydFZ82RLq+RyATzBBoB
 1w2fJgTi0YzHMXjJMbQ4p+J3wdfbJ21RXH2k4UkSDrmZ0TsZ/fyMD2tcShrr7hI5nZ8S iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h62dx85xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Jul 2022 15:53:51 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 267Fkwpm019523;
	Thu, 7 Jul 2022 15:53:50 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h62dx85x3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Jul 2022 15:53:50 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 267Fpnei020455;
	Thu, 7 Jul 2022 15:53:49 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma01dal.us.ibm.com with ESMTP id 3h4ud7qbkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Jul 2022 15:53:49 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 267Frmkn21430552
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Jul 2022 15:53:48 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 944C528060;
	Thu,  7 Jul 2022 15:53:48 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7197E2805C;
	Thu,  7 Jul 2022 15:53:48 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu,  7 Jul 2022 15:53:48 +0000 (GMT)
Date: Thu, 7 Jul 2022 10:53:48 -0500
From: Scott Cheloha <cheloha@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 3/4] powerpc/pseries: register pseries-wdt device with
 platform bus
Message-ID: <YscBjN2DCjTbq4Dk@rascal-austin-ibm-com>
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
 <20220602175353.68942-4-cheloha@linux.ibm.com>
 <874k0enied.fsf@linux.ibm.com>
 <87v8sq42ev.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8sq42ev.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aCPfHfI9MZtSeFsVTbj139i8gUPvG_vF
X-Proofpoint-ORIG-GUID: sTnJ6KQ8fKS9wsz78_SZ58hFqZEMMYJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_12,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207070061
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, wvoigt@us.ibm.com, linux-watchdog@vger.kernel.org, aik@ozlabs.ru, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 24, 2022 at 11:27:36PM +1000, Michael Ellerman wrote:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
> > Scott Cheloha <cheloha@linux.ibm.com> writes:
> >> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
> >> guest control of one or more virtual watchdog timers.
> ...
> >
> > Seems like we don't need pseries_wdt_pdev as it's unused elsewhere? But
> > that's quite minor.
> 
> It's minor but please drop it in the next version.

Dropped.
