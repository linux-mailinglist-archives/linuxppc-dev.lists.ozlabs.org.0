Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F30BC4C1137
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 12:25:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3YcK29P2z3bV1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 22:25:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mursHhk4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=borntraeger@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mursHhk4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3VjP3bD8z2xCp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 20:14:32 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21N8FvAb025084; 
 Wed, 23 Feb 2022 09:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=aoWMY7F1ZTQ4UTKwplNFjBsMTWANHUTvR1bVCpzVsUI=;
 b=mursHhk4xZyHsE6GQcTdtKwOXN2V9gRZa72dZ3bAIGNMwv+hvRtdWCQpfB77dHmqIukD
 sdc/55owIffX7154W5ppO55NdO1bqe1Cbf1JqYEi78Qlx23L+asnvQl6IjBeRG4yd8fd
 fX/f6OEbiUyj6id/AGxBUK88HhEp2dr83Ny6HHxOTZmggh9MDDydtTLerRRrvwbogE1K
 fiHGxQVRdT15Chd+ry1++2uRbIOoLL9ly/OFtfIlr0yTv4AzcUPOtX/naRxHURLVlq6E
 o9zHDF9+JnIH6rSa2v+nwcqBfRpVg2/teMtZdTtS5CmM14f7xK/KM9+yZU0MmM2e/QKF JA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3edh8xh0xt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 09:14:26 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21N90P2N017315;
 Wed, 23 Feb 2022 09:14:26 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3edh8xh0x9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 09:14:26 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21N9D2tw030210;
 Wed, 23 Feb 2022 09:14:24 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3ear6972es-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 09:14:24 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21N9EMn346662118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 09:14:22 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E452F52051;
 Wed, 23 Feb 2022 09:14:21 +0000 (GMT)
Received: from [9.171.70.253] (unknown [9.171.70.253])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 93EC652063;
 Wed, 23 Feb 2022 09:14:21 +0000 (GMT)
Message-ID: <6b123068-c982-1fcd-d09e-1a8f465147e3@linux.ibm.com>
Date: Wed, 23 Feb 2022 10:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 0/3] KVM: PPC: Book3S PR: Fixes for AIL and SCV
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
 linuxppc-dev@lists.ozlabs.org
References: <20220222064727.2314380-1-npiggin@gmail.com>
 <bf6cf0d0-31bd-5751-4fbe-8193dbd716a9@redhat.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <bf6cf0d0-31bd-5751-4fbe-8193dbd716a9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Nf98TFWB_TXWzDeHVAcKkVLDXEyKiLxh
X-Proofpoint-GUID: LK6Epq12RwGYz57TWhe0_fvTfla7u34-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-23_03,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 clxscore=1011 suspectscore=0 phishscore=0 mlxlogscore=991
 adultscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202230049
X-Mailman-Approved-At: Wed, 23 Feb 2022 22:23:29 +1100
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
Cc: kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Am 22.02.22 um 15:11 schrieb Paolo Bonzini:
> On 2/22/22 07:47, Nicholas Piggin wrote:
>> Patch 3 requires a KVM_CAP_PPC number allocated. QEMU maintainers are
>> happy with it (link in changelog) just waiting on KVM upstreaming. Do
>> you have objections to the series going to ppc/kvm tree first, or
>> another option is you could take patch 3 alone first (it's relatively
>> independent of the other 2) and ppc/kvm gets it from you?
> 
> Hi Nick,
> 
> I have pushed a topic branch kvm-cap-ppc-210 to kvm.git with just the definition and documentation of the capability.  ppc/kvm can apply your patch based on it (and drop the relevant parts of patch 3).  I'll send it to Linus this week.

We to have be careful with the 210 cap that was merged from the s390 tree.

