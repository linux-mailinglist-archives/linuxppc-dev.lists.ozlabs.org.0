Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B383B5F6060
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 07:03:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjfTN3CbNz3bhh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:03:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nFhTnaKC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nFhTnaKC;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjfSN2JTjz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 16:02:11 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2964uoug019777;
	Thu, 6 Oct 2022 05:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=hmF1efBRTSz9yusb8fKO5HTPl8ixZ3hIcreLSO6aynk=;
 b=nFhTnaKC/6XuO7LclHw0eqLo8lDZ2K9Kfx0502LSRAbD8LHtxEdJDx2n4fB/rtR8SQGL
 +egb+3BAbVs8SdefjYDEPNUqUeMbaO4qvUp/lJtrCcVxeknVzK6pOe5IyMjCN40KmPoq
 VopPyhx1Ns/ExZ7gH/shTfb0yWvLHCnR8tX2J8c2eOlUF4Wt2lmWdBLSSxU27uXifY+r
 jaO7gQynOCCTlJPF7Ns/6GYTNIJo06LaMcLLKKlZjc4VY0uVv/ri0oN7qwlPUzs/rg5b
 RrzufheB7xLyz+x+tyFEeYbfbq/EV7B1oTD5Nt4ccyirUg/K2VT2+5w54V+Y8Q9Ak+fi ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k1rem042v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 05:01:53 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2964xuqV029024;
	Thu, 6 Oct 2022 05:01:53 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k1rem041p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 05:01:53 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2964p2cV019836;
	Thu, 6 Oct 2022 05:01:51 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04fra.de.ibm.com with ESMTP id 3jxd68vqy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 05:01:50 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29651mYW42926442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Oct 2022 05:01:48 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E2A35204F;
	Thu,  6 Oct 2022 05:01:48 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1869052051;
	Thu,  6 Oct 2022 05:01:48 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 29E4860245;
	Thu,  6 Oct 2022 16:01:45 +1100 (AEDT)
Message-ID: <66a5bda20ffeb729bc862d2511f347a857cbe8b2.camel@linux.ibm.com>
Subject: Re: [PATCH v3 5/6] powerpc/64: Add support for out-of-line static
 calls
From: Benjamin Gray <bgray@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy
	 <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Thu, 06 Oct 2022 16:01:44 +1100
In-Reply-To: <878rltpyy1.fsf@mpe.ellerman.id.au>
References: <20221005053234.29312-1-bgray@linux.ibm.com>
	 <20221005053234.29312-6-bgray@linux.ibm.com>
	 <b76d122b-5487-b677-11e1-58e53a6b521f@csgroup.eu>
	 <878rltpyy1.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 33G3JGhauaeCxMFxMOfTLLpQJBi6cixw
X-Proofpoint-GUID: PY8Md9A53-fP9bHRqbiGEF3eq7Ax3VHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-05_05,2022-10-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210060030
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "ardb@kernel.org" <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-10-06 at 11:39 +1100, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > However, thinking out loudly, I'm wondering, could we make things
> > any=20
> > simpler when CONFIG_MODULES is not selected, or is that a too much=20
> > corner case on PPC64 ?
>=20
> I'd say it's mostly a corner case.
>=20
> Obviously no distros ship with modules disabled.=20
>=20
> AFAIK even the stripped down kernels we use in CPU bringup have
> modules
> enabled.
>=20
> So I think it's probably not worth worrying about, unless there's an
> obvious and fairly simple optimisation.
>=20
> cheers

Yeah, I think supporting this case would amount to a whole new
trampoline implementation. Something like the original RFC
implementation would be best here as there would only be one TOC to
worry about.

Instead, I expect this can all be optimised better once we can apply
patches to call-sites. If so, we can patch the call-site NOPs ourselves
without marking the trampoline as caller-saved TOC, which would remove
the suboptimal save-r2 trampolines. Then we could use separate local &
global entry points like the RFC. This would unify the kernel/module
trampolines again.

The benefit of this series is that it works with just what the ABI
offers, without extra kernel tools / linker magic. But I would
definitely revisit it once call-site patching is possible, especially
when working on inline static calls.
