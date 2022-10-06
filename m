Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEAD5F603C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 06:40:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjdzh3NBVz3c3Z
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 15:40:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TBQDeJZk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TBQDeJZk;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjdyl50kPz2xy6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 15:39:59 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2963oCw7008186;
	Thu, 6 Oct 2022 04:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0ubnKyBE8rH99bBY1J5SsuYZ+heZWKi7JORTsuUlS1A=;
 b=TBQDeJZkqgBEhw/9laOY4jD1AGYP+n7wjNLyXYX49AOXVrZVL2syvx7HDqdMzTwAv4si
 HcGDFxKCWjMtIf1StxsmfSRiJWHYQPa17ICzHDBt/EZ3O1rb/gGkQxzOJEk7JKHCxA6n
 QH3/zy3f18jhWCXGfLSYXuX594gUoEl0pm7bbsj/K9SPApUt8xp9V7FkNVcX/gUk9V9k
 qU/H6qQl/GTgS508Zd/x9bBMHWTNZnnFB77JqZpTKI/2KGCI1y4hPEON5hbDJY/I8coR
 pwmAZOgpVCx3I8wHxtzf4SbYk3Honraa8NNxxxmRQXCSlhN1mWz1Og/dAc88fx2AGQY1 Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k1qf3h1x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 04:39:43 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2964LOYr030692;
	Thu, 6 Oct 2022 04:39:43 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k1qf3h1wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 04:39:43 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2964Zbmv006065;
	Thu, 6 Oct 2022 04:39:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma02fra.de.ibm.com with ESMTP id 3jxd68mrb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 04:39:41 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2964Z7v749742330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Oct 2022 04:35:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1496D5204F;
	Thu,  6 Oct 2022 04:39:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B1FFB5204E;
	Thu,  6 Oct 2022 04:39:38 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4CFFE6010A;
	Thu,  6 Oct 2022 15:39:30 +1100 (AEDT)
Message-ID: <000bd079a8605ae477f9fb78a4aa41bf04421ef8.camel@linux.ibm.com>
Subject: Re: [PATCH v3 2/6] powerpc/module: Handle caller-saved TOC in
 module linker
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Thu, 06 Oct 2022 15:39:30 +1100
In-Reply-To: <3e411080-5f68-1ec8-b2fd-bb508a81078a@csgroup.eu>
References: <20221005053234.29312-1-bgray@linux.ibm.com>
	 <20221005053234.29312-3-bgray@linux.ibm.com>
	 <3e411080-5f68-1ec8-b2fd-bb508a81078a@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Pf9cZjhSgNYFyyMeCCReQgm8ormdjC8l
X-Proofpoint-ORIG-GUID: ziWdUbyC60x1eytA_wDWS4QBn7bXpGyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-05_05,2022-10-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=892 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210060027
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

On Wed, 2022-10-05 at 19:18 +0000, Christophe Leroy wrote:
>=20
>=20
> Le 05/10/2022 =C3=A0 07:32, Benjamin Gray a =C3=A9crit=C2=A0:
> > The callee may set a field in st_other to 1 to indicate r2 should
> > be
> > treated as caller-saved. This means a trampoline must be used to
> > save
> > the current TOC before calling it and restore it afterwards, much
> > like
> > external calls.
>=20
> The 'callee', what is that here in that context ?
>=20
> Don't you mean the 'linker' instead ?

Callee in the sense of the function body, as opposed to the call-site
like the R_PPC64_REL24, etc., relocations are (which I was thinking of
as the caller). I can see how the comment needs more context though.
