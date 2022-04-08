Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 252D24F9BF6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 19:46:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZm0D0JZKz3bfr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 03:46:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g+/T1CjV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=g+/T1CjV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZlzW08LZz2xfC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 03:46:14 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 238FWEh9011919; 
 Fri, 8 Apr 2022 17:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Av/17OEhTW/mxeJdUKXGmyoez4WeRhtABkz5mEBRB9I=;
 b=g+/T1CjV2hBIxvAp9D+7nKDwUP035zJlxYnXi/SUUGSmC/Av9agtjQ9irH6OzJoGpSI1
 tGg/23Bnc09Kjha7WdC+Fv5XH61bhuB4vCbRqmDbx8zaGlwsuAarm7o2UkACdVA+qLA4
 plfG6WZOb/arFPkSzj9jdS93dObJgNBS2wOqqFPPTVzHkxzyswstbQjeIgsUP1+lFSC6
 4kn/SAL9dy7uUdYmFmRSjEKL/tyXHpBSA7QB6Q7k5k8sQp1Z+Z33cV7YElYC3Bd3EZPq
 mG8aCZdr+OLFtnq04GEheFAvsOU7joS3Jaz1QsOLW7/c2F+fTVQmW//A6k1F3e0NFYkJ Sw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fa44x9xa9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 17:46:08 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 238HXHgO031215;
 Fri, 8 Apr 2022 17:46:06 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3f6drht2ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 17:46:06 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 238Hk4Ok38863138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Apr 2022 17:46:04 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AB104C046;
 Fri,  8 Apr 2022 17:46:04 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FE364C040;
 Fri,  8 Apr 2022 17:46:03 +0000 (GMT)
Received: from sig-9-65-90-167.ibm.com (unknown [9.65.90.167])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  8 Apr 2022 17:46:02 +0000 (GMT)
Message-ID: <c97b7032d777853c2f4b8d2e7f9fc7a522ff891c.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc: Mark arch_get_ima_policy() and
 is_ppc_trustedboot_enabled() as __init
From: Mimi Zohar <zohar@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 08 Apr 2022 13:46:01 -0400
In-Reply-To: <05e8ec5c0f471b17eeec417285a0691a61377d51.camel@linux.ibm.com>
References: <20220407141520.733735-1-mpe@ellerman.id.au>
 <ebfa96c9cdcd48b28c524af0fb4e10bcb5a7acb9.camel@linux.ibm.com>
 <05e8ec5c0f471b17eeec417285a0691a61377d51.camel@linux.ibm.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TdSGRFjJZDg9ktTpvzKYcuJFB3RNr2Au
X-Proofpoint-ORIG-GUID: TdSGRFjJZDg9ktTpvzKYcuJFB3RNr2Au
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_05,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=858
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204080089
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
Cc: nayna@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-04-08 at 13:31 -0400, Mimi Zohar wrote:
> On Fri, 2022-04-08 at 12:05 -0400, Mimi Zohar wrote:
> > On Fri, 2022-04-08 at 00:15 +1000, Michael Ellerman wrote:
> > > We can mark arch_get_ima_policy() as __init because it's only caller
> > > ima_init_arch_policy() is __init. We can then mark
> > > is_ppc_trustedboot_enabled() __init because its only caller is
> > > arch_get_ima_policy().
> > > 
> > > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > 
> > I assume you want to upstream this via power,
> > 
> >     Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> 
> Sorry, I just noticed that is_ppc_trustedboot_enabled() is also called
> by arch_ima_get_secureboot().

Never mind, arch_ima_get_secureboot() calls
is_ppc_secureboot_enabled(), not is_ppc_trustedboot_enabled().


