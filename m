Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 961093FDE9F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 17:26:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H07Fs2wxDz2yLJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 01:26:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YM83bdR7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YM83bdR7; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H07F35pNxz2xY1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 01:26:14 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181F36v7108365; Wed, 1 Sep 2021 11:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=o9gDLNcRFjSNsFzIPCKeyxaw9Ra4/1Hcw6ozwNSHkVo=;
 b=YM83bdR7jkhS2OhLgSu5xrtbvMtvyagp+ZfS89aru7FOJ30IlU4u87L4QDJHKT6npVWU
 0LW3ADqVcsKc/mB1uCYkVj7VwLMF7DnDz1mj2UBSRJxfuGmicygWmdtbXZ87KOYiXz2H
 DyKamxAswX6HGidoCmRpZFWRe3uRrpla+jXPSQMXmi+qOKTwvcXrwRegyT8FGS/3Fwqc
 XE2yHa8gg6Dhy6390x/mCgoF7S0lWde2I2+3FmMhFxpxJzBmnLeWY7bRrfteT7c0U9c/
 KTCvgg0K/ozlM9BhQ9Lu4I9b1r8ebx5F5K1AnS/SnhKkt6K+a/94Z6SZF/gw60k9Yt6/ pQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3atafabhp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 11:26:08 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 181FIfGA031727;
 Wed, 1 Sep 2021 15:26:06 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 3aqcse7g7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 15:26:06 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 181FQ5up43581950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Sep 2021 15:26:05 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E991311207D;
 Wed,  1 Sep 2021 15:26:04 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E149A112072;
 Wed,  1 Sep 2021 15:26:03 +0000 (GMT)
Received: from localhost (unknown [9.211.58.54])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed,  1 Sep 2021 15:26:03 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH kernel] KVM: PPC: Book3S HV: Make unique debugfs nodename
In-Reply-To: <87lf4gv0hf.fsf@linux.ibm.com>
References: <20210707041344.3803554-1-aik@ozlabs.ru>
 <be02290c-60a0-48af-0491-61e8a6d5b7b7@ozlabs.ru>
 <87pmubu306.fsf@linux.ibm.com>
 <a1be1913-f564-924b-1750-03efa859a0b1@ozlabs.ru>
 <2fe01488-5a9b-785e-7c05-1d527dead18d@ozlabs.ru>
 <87lf4gv0hf.fsf@linux.ibm.com>
Date: Wed, 01 Sep 2021 12:26:00 -0300
Message-ID: <87czpsuxkn.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CFkKSQvx1QVx1ajLDPnoLgxB4hboUs5Y
X-Proofpoint-GUID: CFkKSQvx1QVx1ajLDPnoLgxB4hboUs5Y
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_05:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=795 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010087
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fabiano Rosas <farosas@linux.ibm.com> writes:

> That is why I mentioned creating a hook similar to
> kvm_create_vcpu_debugfs in the common KVM code. kvm_create_vm_debugfs or
> something.

s/kvm/kvm_arch/

