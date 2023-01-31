Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 926D16838F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 22:59:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5zVg1mTWz3dvq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 08:59:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L1jOogCG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L1jOogCG;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5zTf6Mf4z307t
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 08:59:02 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30VKCwOB031020;
	Tue, 31 Jan 2023 21:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=JRg1dFZ0thEJbeftXj9OFKTQmDgvqg7ergO9OLWCYsg=;
 b=L1jOogCGqtV0pFCgdEdtX2z/GbegH8MQvc9j/YYzLHlmO9ydJQ+/Cv9kKzwCmrF/Bqjr
 xiJqoupDwDG0S85k+DKsGX1Lla+bLtJt0Rx34GBbw4pWagphPLbThnlXSPABI0OAKMh2
 2Eep82CO+AkLccGIx+EJL76z70ckqoN7Z68agDA9LDWpF3xjpjyTjnx8mSkQgmzb4OLW
 /I+78YJz249cS/1/hcOzBgLRyOU3KyXmeNaZCTB/yysMpEXvvsw1h9AX2pj0vTezpatT
 xyOo3/G1yexP8Mn3hAA8HAHXIed0ExDlZ3iLvtRsmqK+3m/OtM6cmQ0OVNv7NsBYztah /A== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nf5x6hh7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 21:58:53 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VDqhtn013277;
	Tue, 31 Jan 2023 21:58:50 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ncvtybysa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 21:58:50 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30VLwm5U38797632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Jan 2023 21:58:48 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 631292004B;
	Tue, 31 Jan 2023 21:58:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4EA020040;
	Tue, 31 Jan 2023 21:58:47 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 31 Jan 2023 21:58:47 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0CA9D60217;
	Wed,  1 Feb 2023 08:58:44 +1100 (AEDT)
Message-ID: <1271da6e844106255546eb909f215ef816ad5c97.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/tlb: Implement book3s/32/tlbflush.h
 local_flush_tlb_page_psize
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Wed, 01 Feb 2023 08:58:43 +1100
In-Reply-To: <2de01197-54b6-0e96-5615-3cd212cfec83@csgroup.eu>
References: <20230131025817.279417-1-bgray@linux.ibm.com>
	 <2de01197-54b6-0e96-5615-3cd212cfec83@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9c1TGN3YLkCJM96WIWiniXzRMq0Tp2Ao
X-Proofpoint-ORIG-GUID: 9c1TGN3YLkCJM96WIWiniXzRMq0Tp2Ao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301310186
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
Cc: kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2023-01-31 at 06:33 +0000, Christophe Leroy wrote:
> I still think it is not the correct fix. You are putting the problem=20
> under the carpet instead of fixing it. There are many other places
> where=20
> radix_enabled() or other mmu_has_feature() are used with the
> expectation=20
> that one leg will be eliminated at build time.

And none of them are actively causing build failures AFAIK. I agree
that there may be a pre-existing optimisation problem, but I'm not
trying to address it in this patch. I'm just trying to fix the build I
broke. As such I haven't opened an issue with Clang yet either.

> As written in previous thread, have you considered reworking=20
> mmu_has_feature() to move the CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG=20
> after the below block:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (MMU_FTRS_ALWAYS & fea=
ture)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return true;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!(MMU_FTRS_POSSIBLE &=
 feature))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return false;
>=20

Yes, I did. I also discussed with Michael Ellerman what he would
prefer, and he indicated he still would still like to just implement
the function.


> Looking into it in more details, I'm even more puzzled. As far as I
> can=20
> see, local_flush_tlb_page_psize() is used only at one place, that is=20
> function __do_patch_instruction_mm(). So if Clang fails to identify
> it=20
> as a dead leg, it is the full __do_patch_instruction_mm() which is
> kept=20
> for no reason.

Right, because that is the function that's guarded behind
radix_enabled().

> By the way, I also see that local_flush_tlb_page_psize() for
> book3s/64=20
> does just nothing at all for non Radix. Is that correct ?

That is how the other local page flushes are implemented. If there's
some undocumented exception here I'd be relying on review on the list
from people who have experience with details of how Hash mmu is handled
on this platform.
