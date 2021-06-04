Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC13639BE96
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 19:24:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxV4P5qpPz3btK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 03:24:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qfBpg1G7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qfBpg1G7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxV3v0RLQz2yyt
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 03:23:54 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 154HHchW167368; Fri, 4 Jun 2021 13:23:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=0cE+9vTdeOWpXMMdEs0QoHgCpaz4oeeltpWGj3pS9oY=;
 b=qfBpg1G7a9DUcp23TFT6i1Ykfvq9WGn+09E7sUaEsXm7z8tlQ2FR1fln58um5MRuJGOy
 T7FQKL9phYqN4+PE3REsCwPRLuH8PomBwjI1YpSRobYxtOJkb4hQSn1QCTm03VMHuvdB
 3E6jntIvSW0Zfg0jb6dHfBgm0dGR3DNI1YJsRsidFPrScXDVOuvtTilFnHuPwaXYIOlI
 5PYC90GkaiKd7INChfaSGpDoJ6uz8/NwIYRpT6FhDGMVTtuLuJuwVu1Kp5kLuAT+Z484
 KOOYPj3gbmfCTqc9KhEOZxf3cZ16UqKQng4y5chugtlD/mG7nCl35dkT0ixBLMiIHmGw gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38yrev83d0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 13:23:43 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 154HIIhc171798;
 Fri, 4 Jun 2021 13:23:43 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38yrev83ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 13:23:43 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 154HCoiG019774;
 Fri, 4 Jun 2021 17:23:42 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 38ud8ae672-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 17:23:41 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 154HNfQl24510920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Jun 2021 17:23:41 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02FCE112062;
 Fri,  4 Jun 2021 17:23:41 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63D71112066;
 Fri,  4 Jun 2021 17:23:39 +0000 (GMT)
Received: from sig-9-77-136-17.ibm.com (unknown [9.77.136.17])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  4 Jun 2021 17:23:39 +0000 (GMT)
Message-ID: <86b608e12f35d66a88e29e3bbc9e0cf37979bc36.camel@linux.ibm.com>
Subject: Re: [PATCH v4 16/16] crypto/nx: Add sysfs interface to export NX
 capabilities
From: Haren Myneni <haren@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Date: Fri, 04 Jun 2021 10:23:37 -0700
In-Reply-To: <87pmx1g83i.fsf@mpe.ellerman.id.au>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <35bca44c5a8af7bdffbe03b22fd82713bced8d0e.camel@linux.ibm.com>
 <1622696109.949hlg4tnq.astroid@bobo.none>
 <340144138c53ae83588edcf0b4a5ae1880a01cd0.camel@linux.ibm.com>
 <87pmx1g83i.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 731EFbOIJylECNK2ZMXq3ZvjcyYoqwyM
X-Proofpoint-ORIG-GUID: bhekDnZbdDsxljwOJrX1dxc1stOhQlNh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-04_11:2021-06-04,
 2021-06-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 impostorscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106040123
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

On Fri, 2021-06-04 at 21:52 +1000, Michael Ellerman wrote:
> Haren Myneni <haren@linux.ibm.com> writes:
> > On Thu, 2021-06-03 at 14:57 +1000, Nicholas Piggin wrote:
> > > Excerpts from Haren Myneni's message of May 21, 2021 7:42 pm:
> > > > Changes to export the following NXGZIP capabilities through
> > > > sysfs:
> > > > 
> > > > /sys/devices/vio/ibm,compression-v1/NxGzCaps:
> > > 
> > > Where's the horrible camel case name coming from? PowerVM?
> > 
> > Yes, pHyp provides the capabalities string.
> > 
> > Capability Description Descriptor Value Descriptor ascii Value
> > Overall NX Capabilities 0x4E78204361707320 “Nx Caps ”
> > NX GZIP Capabilities 0x4E78477A43617073 “NxGzCaps”
> 
> That doesn't mean we have to use that name in sysfs though. In fact
> we
> couldn't use the "Nx Caps " name, because it contains spaces.
> 
> And we don't have to squeeze our name into 8 bytes, so it can be less
> ugly.
> 
> Like "nx_gzip_capabilities"?

Thanks for your comments. 

'NX Caps " provides the all available features in the hypervisor (only
NX GZIP caps is supported right now) and we export information for the
specific feature via sysfs.

I will change it to "nx_gzip_caps" 

Thanks
Haren

> 
> cheers

