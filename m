Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE414C281F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 10:33:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K474q1Chhz3bPS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 20:33:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ahO062tP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=borntraeger@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ahO062tP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K47433rxmz30Mf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 20:32:51 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21O7wrx2006503; 
 Thu, 24 Feb 2022 09:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lEsBqB34OmT9ukB0edFrUutwsZXHJ7NmK0+L1fCvT8s=;
 b=ahO062tP7CR8SVX/dv2vtCYfiaCLHJMuqepuzp4mNMTglj4w7MbSnHwj/AoLhyLSlau9
 QPEZtqxfKP9u9nd/qzsjnfSeUZqzeZJeB9rhNuYfGVBxupYQ+aFxVNiO7/Gei7dJ2D19
 3ySAbxdNzvSkfdJPF18YVg81pVznDG/A7U5falme/C1BoXL/FdGZGnOg6sdJsKLBg1qM
 WkVf46nnJAz7aPpwx/OXm+OWjl0ELB/MNiqKZCqHBJ5M/Ae9w79IKL4JN4VG/zQHtqDj
 kaRCHMZYnxZHe4r2uEA3a+bwCxvMELC7GWwSq6m8/t2tcy30hAq7WDe1pOreTo0WLe7X Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edx1wtxf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 09:32:46 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21O9WkDB026665;
 Thu, 24 Feb 2022 09:32:46 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edx1wtxea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 09:32:46 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21O9Gmp3009190;
 Thu, 24 Feb 2022 09:32:43 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3ear69g5kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 09:32:43 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21O9WfUa30605784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 09:32:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7215C4C04A;
 Thu, 24 Feb 2022 09:32:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22DA14C050;
 Thu, 24 Feb 2022 09:32:41 +0000 (GMT)
Received: from [9.171.78.174] (unknown [9.171.78.174])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Feb 2022 09:32:41 +0000 (GMT)
Message-ID: <d2e9d19e-85fb-5e2a-1d76-946f3a47f205@linux.ibm.com>
Date: Thu, 24 Feb 2022 10:32:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 0/3] KVM: PPC: Book3S PR: Fixes for AIL and SCV
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220222064727.2314380-1-npiggin@gmail.com>
 <bf6cf0d0-31bd-5751-4fbe-8193dbd716a9@redhat.com>
 <6b123068-c982-1fcd-d09e-1a8f465147e3@linux.ibm.com>
 <1645616541.qspjukz7s5.astroid@bobo.none>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <1645616541.qspjukz7s5.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7h8oK57YXlm5Ju6Xibydpbast8T-XBR9
X-Proofpoint-GUID: Uf4Eza9SUraxl6DSyU6dG_fpfCnjgw-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-24_01,2022-02-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxlogscore=877
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240056
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



Am 23.02.22 um 12:47 schrieb Nicholas Piggin:
> Excerpts from Christian Borntraeger's message of February 23, 2022 7:14 pm:
>>
>>
>> Am 22.02.22 um 15:11 schrieb Paolo Bonzini:
>>> On 2/22/22 07:47, Nicholas Piggin wrote:
>>>> Patch 3 requires a KVM_CAP_PPC number allocated. QEMU maintainers are
>>>> happy with it (link in changelog) just waiting on KVM upstreaming. Do
>>>> you have objections to the series going to ppc/kvm tree first, or
>>>> another option is you could take patch 3 alone first (it's relatively
>>>> independent of the other 2) and ppc/kvm gets it from you?
>>>
>>> Hi Nick,
>>>
>>> I have pushed a topic branch kvm-cap-ppc-210 to kvm.git with just the definition and documentation of the capability.  ppc/kvm can apply your patch based on it (and drop the relevant parts of patch 3).  I'll send it to Linus this week.
>>
>> We to have be careful with the 210 cap that was merged from the s390 tree.
> 
> Ah thanks, I didn't notice it.
> 
> Using 211 is no problem for me, merge will have a conflict now though.
> We could avoid it by just sending my patch in a second batch instead of
> doing the topic branch this time (I still like the idea of a topic
> branch for caps for future).

Paolo,

the power people have not used your branch yet. So you could - as an alternative also
create an kvm-cap-ppc-211 branch for 5.17 and leave the s390 cap at 210. But it would
be good to do something now so that we have final numbers for the caps. Either create
a kvm-cap-ppc-211 branch, or merge the kvm-cap-ppc-210 branch into next and fixup the
s390 cap to become 211.
