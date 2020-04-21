Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B004F1B2E8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 19:47:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4969xp1F92zDqyx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 03:47:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4969ms29MXzDqyk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 03:39:41 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LHZLss147337
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 13:39:38 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gmuapwb1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 13:39:38 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ldufour@linux.ibm.com>;
 Tue, 21 Apr 2020 18:38:52 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 21 Apr 2020 18:38:48 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03LHdV8u2883916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Apr 2020 17:39:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCB05A405B;
 Tue, 21 Apr 2020 17:39:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EDCEA4054;
 Tue, 21 Apr 2020 17:39:31 +0000 (GMT)
Received: from pomme.local (unknown [9.145.149.94])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Apr 2020 17:39:31 +0000 (GMT)
Subject: Re: [PATCH] KVM: PPC: Book3S HV: read ibm,secure-memory nodes
To: "Oliver O'Halloran" <oohall@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20200416162715.45846-1-ldufour@linux.ibm.com>
 <87k129gdx8.fsf@mpe.ellerman.id.au>
 <CAOSf1CF2YEG1U_1XP_Vvk3Bn1RCiNa1DAKEbemWu00JimoPsUQ@mail.gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Date: Tue, 21 Apr 2020 19:39:31 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CF2YEG1U_1XP_Vvk3Bn1RCiNa1DAKEbemWu00JimoPsUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20042117-4275-0000-0000-000003C4150D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042117-4276-0000-0000-000038D99A6F
Message-Id: <db211c9c-3e6c-761c-8c9f-4110d3c0fcbe@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_07:2020-04-21,
 2020-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004210136
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 21/04/2020 à 15:43, Oliver O'Halloran a écrit :
> On Tue, Apr 21, 2020 at 11:37 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Hi Laurent,
>>
>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>> The newly introduced ibm,secure-memory nodes supersede the
>>> ibm,uv-firmware's property secure-memory-ranges.
>>
>> Is either documented in a device tree binding document anywhere?
>>
>> cheers
>>
>>> Firmware will no more expose the secure-memory-ranges property so first
>>> read the new one and if not found rollback to the older one.
> 
> There's some in Ryan's UV support series for skiboot:
> 
> https://patchwork.ozlabs.org/project/skiboot/patch/20200227204023.22125-2-grimm@linux.ibm.com/
> 
> ...which is also marked RFC. Cool.

Thanks Oliver for this pointer.

Yes this is an RFC but this documentation details the secure memory nodes 
created by skiboot and parsed by this patch.

Michael, is that enough for you?

Laurent.

