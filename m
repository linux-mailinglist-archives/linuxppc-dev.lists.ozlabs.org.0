Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4F65EB89F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 05:22:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc4gS6Z70z3c8T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 13:22:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FijiO9/g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FijiO9/g;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc4fn4rgmz3bgh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 13:21:53 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28R2EaqB026509;
	Tue, 27 Sep 2022 03:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=2DkS/ISIJfo6+qLScq1SUoRo3y+BkCKwP6H+ldHfcdA=;
 b=FijiO9/gc+To6mQ6UmFv+K7OJ8g7cDpHmwTPUPmVF/WKJ8y0oxRT3OKpuXQfa4IDN8s4
 v9vH+dALqlqzrNabHNv0LqXW+GZOE8vACAA2n0EeBug3ygJTJe0N2YDi5kM1gKLk17Zs
 RkQev97kpxIzphKUBEWFMOE9Hq8mxfSCPdaVymEMka1fBhmEC+kvVTNgUfPj52fcfGAl
 vbRCioy7H62Cjt3/Yp9qQyWfMCZVf+HtMKESlUy3FfeuoFZkxrWEctbX1JL+Fqf1W2/s
 EmljgG4RyLg3MQk2R+Lwd7NfepuyJm7jkKa8YyYFyNt6LxwCUH0gX3lJ1drJz501H90F +g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jur7hsbhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Sep 2022 03:21:42 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28R2vQLJ020447;
	Tue, 27 Sep 2022 03:21:41 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jur7hsbh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Sep 2022 03:21:41 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28R3LExS005421;
	Tue, 27 Sep 2022 03:21:39 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma02fra.de.ibm.com with ESMTP id 3jssh92d02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Sep 2022 03:21:39 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28R3LadC56689072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Sep 2022 03:21:37 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4611A4057;
	Tue, 27 Sep 2022 03:21:36 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DA82A4051;
	Tue, 27 Sep 2022 03:21:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 27 Sep 2022 03:21:36 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 51C336057E;
	Tue, 27 Sep 2022 13:21:35 +1000 (AEST)
Message-ID: <ecc0bf7f75607d5523165fb1105e7dc9065cfb37.camel@linux.ibm.com>
Subject: Re: [PATCH v2 5/6] powerpc/64: Add support for out-of-line static
 calls
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Tue, 27 Sep 2022 13:21:35 +1000
In-Reply-To: <869d9f29-f03f-539e-e961-da6f8309e1e3@csgroup.eu>
References: <20220926064316.765967-1-bgray@linux.ibm.com>
	 <20220926064316.765967-6-bgray@linux.ibm.com>
	 <869d9f29-f03f-539e-e961-da6f8309e1e3@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UYiXIudpP3Anhl3KRnqP98vtHCNtUnVb
X-Proofpoint-GUID: qJOgRZyXNi23mHJU8Dh3cKENUyylI-Bw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_11,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209270016
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-09-26 at 14:54 +0000, Christophe Leroy wrote:
> > diff --git a/arch/powerpc/kernel/static_call.c
> > b/arch/powerpc/kernel/static_call.c
> > index 863a7aa24650..ecbb74e1b4d3 100644
> > --- a/arch/powerpc/kernel/static_call.c
> > +++ b/arch/powerpc/kernel/static_call.c
> > @@ -4,30 +4,108 @@
> > =C2=A0=20
> > =C2=A0 #include <asm/code-patching.h>
> > =C2=A0=20
> > +static void* ppc_function_toc(u32 *func)
> > +{
> > +#ifdef CONFIG_PPC64_ELF_ABI_V2
>=20
> Can you use IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) instead ?

I tried when implementing it, but the `(u64) func` cast is an issue. I
could side step it and use `unsigned long` if that's preferable?
Otherwise I like being explicit about the size, it's a delicate
function.
