Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFDD25A4D9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 07:11:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhBqZ05qQzDqhn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 15:11:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hTM26GtG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhBnL1byBzDqhH
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 15:09:25 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0824Wped168250; Wed, 2 Sep 2020 01:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=M80a5MNJS6MfWM85VH6vxWgb32p+tGq36NLp0TBFHkM=;
 b=hTM26GtGRl+J9D2CVGE+nHOE2DWEEDGtjP+2yQfVYAThjZQUTXh2gLOqw9MovTvce5xB
 ZSxUmZr8PTBXlnvRtoRnoqT/LqD/ClVzcr6oAdO22vEDLJzPSk8GhaHFjPYFy6ms43PL
 gmLiByx/xduTAwNEnUYEse58yUlbilICsOpuDc3U+5JG0p50QFjKZpsD2NGsHc716D1e
 KlOYhtY2GKQrUZbgKhV8xVmpoyTc48Z658pDlEGVOYc5ISacoBu1Q55egNroE6u4UUHz
 dC+nhEdNDzstsIg0F09euLhdoLmJjvRrfW5b16aV2pDUB3QV30aGQY6lpsn1WdpIenvT yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33a1yr43f2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 01:09:18 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0824YCA6173644;
 Wed, 2 Sep 2020 01:09:17 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33a1yr43dy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 01:09:17 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08253d9H006707;
 Wed, 2 Sep 2020 05:09:15 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 337e9gva3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 05:09:15 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08259BCJ27787586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 05:09:11 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69042A405F;
 Wed,  2 Sep 2020 05:09:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE051A405B;
 Wed,  2 Sep 2020 05:09:07 +0000 (GMT)
Received: from [9.199.37.120] (unknown [9.199.37.120])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 05:09:07 +0000 (GMT)
Subject: Re: [PATCH 2/7] powerpc/watchpoint/kvm: Add infrastructure to support
 2nd DAWR
To: Paul Mackerras <paulus@ozlabs.org>
References: <20200723102058.312282-1-ravi.bangoria@linux.ibm.com>
 <20200723102058.312282-3-ravi.bangoria@linux.ibm.com>
 <20200902020124.GB272502@thinks.paulus.ozlabs.org>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <34fc0944-92af-cd59-f1e4-26f351f42e70@linux.ibm.com>
Date: Wed, 2 Sep 2020 10:39:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200902020124.GB272502@thinks.paulus.ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_02:2020-09-01,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=429
 lowpriorityscore=0 clxscore=1011 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009020042
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
Cc: christophe.leroy@c-s.fr, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 mikey@neuling.org, rogealve@br.ibm.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, kvm-ppc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, jniethe5@gmail.com, pedromfc@br.ibm.com,
 pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Paul,

On 9/2/20 7:31 AM, Paul Mackerras wrote:
> On Thu, Jul 23, 2020 at 03:50:53PM +0530, Ravi Bangoria wrote:
>> kvm code assumes single DAWR everywhere. Add code to support 2nd DAWR.
>> DAWR is a hypervisor resource and thus H_SET_MODE hcall is used to set/
>> unset it. Introduce new case H_SET_MODE_RESOURCE_SET_DAWR1 for 2nd DAWR.
> 
> Is this the same interface as will be defined in PAPR and available
> under PowerVM, or is it a new/different interface for KVM?

Yes, kvm hcall interface for 2nd DAWR is same as PowerVM, as defined in PAPR.

> 
>> Also, kvm will support 2nd DAWR only if CPU_FTR_DAWR1 is set.
> 
> In general QEMU wants to be able to control all aspects of the virtual
> machine presented to the guest, meaning that just because a host has a
> particular hardware capability does not mean we should automatically
> present that capability to the guest.
> 
> In this case, QEMU will want a way to control whether the guest sees
> the availability of the second DAWR/X registers or not, i.e. whether a
> H_SET_MODE to set DAWR[X]1 will succeed or fail.

Patch #3 adds new kvm capability KVM_CAP_PPC_DAWR1 that can be checked
by Qemu. Also, as suggested by David in Qemu patch[1], I'm planning to
add new machine capability in Qemu:

   -machine cap-dawr1=ON/OFF

cap-dawr1 will be default ON when PPC_FEATURE2_ARCH_3_10 is set and OFF
otherwise.

Is this correct approach?

[1]: https://lore.kernel.org/kvm/20200724045613.GA8983@umbus.fritz.box

Thanks,
Ravi
