Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 051E86DEC38
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 09:05:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxDHr5ndBz3fB4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 17:05:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ip1K6sZ8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ip1K6sZ8;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxDGw5342z3cBL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 17:04:40 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33C6CJWh007292;
	Wed, 12 Apr 2023 07:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=pFDRnf/e5jrYtyjR0i51vsd1re2UoQ9VFsoHVZPbtGE=;
 b=ip1K6sZ8vy1nqLDA/labILxe47/iqupWzyC1ZRuBwaAzUaZ2EOW6xqPxeZyxVofWcxTY
 1JNQ6gWYfuM7iIYRi1526WUPLDPNVAByq/7p+TTccIG6Ykot4euvxYXiG1ypT76OlLA2
 uBDYD+cNIVfKoCl0W6tachcImi1FENTXu9BD2o96d88tJEAf8elgKvIhxsP96X5sLVIK
 GD7nSX4mTmnwoDzcZkNNpK4T/6oU/b8BCoYVRZulxwB9aIwM+F5z2tTmrgpuccSPh/Za
 T+XTD/bd/V0XhEyFNTv9KBM7lKHYK3FfFzhhHqfDGgRkcgCFNvo4hLe9zBs/Y3ctnS39 YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pwq5s1rmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Apr 2023 07:04:26 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33C6CO2m007540;
	Wed, 12 Apr 2023 07:04:26 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pwq5s1rkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Apr 2023 07:04:25 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33C0kmwq028714;
	Wed, 12 Apr 2023 07:04:23 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3pu0m22645-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Apr 2023 07:04:23 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33C74Lte21627146
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Apr 2023 07:04:21 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B30020043;
	Wed, 12 Apr 2023 07:04:21 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA52720040;
	Wed, 12 Apr 2023 07:04:16 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.27.7])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 12 Apr 2023 07:04:16 +0000 (GMT)
Date: Wed, 12 Apr 2023 12:34:13 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] KVM: PPC: BOOK3S: book3s_hv_nested.c: improve branch
 prediction for k.alloc
Message-ID: <ZDZX7cAa5uKwfJOd@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230407093147.3646597-1-kconsul@linux.vnet.ibm.com>
 <ZDAeuL2fz1aEW6rz@debian.me>
 <ZDA+WdiqB2931xHB@google.com>
 <ZDTpGsT15s0iOrTJ@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <873557j59d.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <873557j59d.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6xmvU3C8JGnuUY4UYr_09uIAod_5WUo5
X-Proofpoint-GUID: GzqPgmU-w-3tSGN9hHjUIbVT3VvuioaR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_02,2023-04-11_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120064
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Chao Peng <chao.p.peng@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2023-04-11 16:35:10, Michael Ellerman wrote:
> Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> > On 2023-04-07 09:01:29, Sean Christopherson wrote:
> >> On Fri, Apr 07, 2023, Bagas Sanjaya wrote:
> >> > On Fri, Apr 07, 2023 at 05:31:47AM -0400, Kautuk Consul wrote:
> >> > > I used the unlikely() macro on the return values of the k.alloc
> >> > > calls and found that it changes the code generation a bit.
> >> > > Optimize all return paths of k.alloc calls by improving
> >> > > branch prediction on return value of k.alloc.
> >> 
> >> Nit, this is improving code generation, not branch prediction.
> > Sorry my mistake.
> >> 
> >> > What about below?
> >> > 
> >> > "Improve branch prediction on kmalloc() and kzalloc() call by using
> >> > unlikely() macro to optimize their return paths."
> >> 
> >> Another nit, using unlikely() doesn't necessarily provide a measurable optimization.
> >> As above, it does often improve code generation for the happy path, but that doesn't
> >> always equate to improved performance, e.g. if the CPU can easily predict the branch
> >> and/or there is no impact on the cache footprint.
> 
> > I see. I will submit a v2 of the patch with a better and more accurate
> > description. Does anyone else have any comments before I do so ?
>  
> In general I think unlikely should be saved for cases where either the
> compiler is generating terrible code, or the likelyness of the condition
> might be surprising to a human reader.
> 
> eg. if you had some code that does a NULL check and it's *expected* that
> the value is NULL, then wrapping that check in likely() actually adds
> information for a human reader.
>     
> Also please don't use unlikely in init paths or other cold paths, it
> clutters the code (only slightly but a little) and that's not worth the
> possible tiny benefit for code that only runs once or infrequently.
> 
> I would expect the compilers to do the right thing in all
> these cases without the unlikely. But if you can demonstrate that they
> meaningfully improve the code generation with a before/after
> dissassembly then I'd be interested.
Just FYI, the last email by kautuk.consul.80@gmail.com was by me.
That last email contains a diff file attachment which compares 2 files:
before my changes and after my changes.
This diff file shows a lot of changes in code generation. Im assuming
all those changes are made by the compiler towards optimizing all return
paths to k.alloc calls.
Kindly review and comment.
> cheers
