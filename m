Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC0D3DB2B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jul 2021 07:18:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbbKF2cMXz3cX5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jul 2021 15:18:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FvJ6R+IR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FvJ6R+IR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbbJk29XLz304V
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jul 2021 15:18:13 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16U54E77176731; Fri, 30 Jul 2021 01:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=mRMfJDSaBEiYJwtsisL7fiThg4iCN4T1/5czZbY5axI=;
 b=FvJ6R+IRNlN3XBd8mh75U1wb7IFYE94aLjH21FjdyTNc2ng/V+THg3+abnCVvcN0ULgE
 leJjIs0OvxXLCDSh5TV45Xq91IKkKOB8vxuq9fnWD2kfHhJvZVsIfPyXKzcK8Fyg5B/Q
 cmAv66+1vp64SHxEPjxshxAuVKxUAjA+NCTeaFKOjTI5RK51A4FKFO4g1y5fjsvkelJO
 PZorV9RcMMW+Ltxf9dnoNPqdpgQbpn7CAVGYvHM98EzO4weCS03sZSLj8uQkNJv8KLa9
 zQEeGWgzS9Vjlb68N9BUcAvJbKEZEYiBK6NdL6Gb078pYx8cXHX/Vl2vj4kKzY8e+9jU Ww== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a4abj12rj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 01:18:04 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16U5DNNP030427;
 Fri, 30 Jul 2021 05:18:02 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3a235kjg2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 05:18:02 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16U5I0pV32702790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Jul 2021 05:18:00 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37C3B11C05C;
 Fri, 30 Jul 2021 05:18:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 493CD11C052;
 Fri, 30 Jul 2021 05:17:58 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.3.232])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 30 Jul 2021 05:17:58 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [powerpc][next-20210727] Boot failure - kernel BUG at
 arch/powerpc/kernel/interrupt.c:98!
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20210729161335.GA22016@willie-the-truck>
Date: Fri, 30 Jul 2021 10:47:56 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <3123C52D-1345-43E1-905A-FF6754E4453C@linux.vnet.ibm.com>
References: <1905CD70-7656-42AE-99E2-A31FC3812EAC@linux.vnet.ibm.com>
 <YQGVZnMe9hFieF8D@Ryzen-9-3900X.localdomain>
 <20210729161335.GA22016@willie-the-truck>
To: Will Deacon <will@kernel.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DiaWfTeMzTsWBpfNTQmvb1ps_L8keHyd
X-Proofpoint-ORIG-GUID: DiaWfTeMzTsWBpfNTQmvb1ps_L8keHyd
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-30_03:2021-07-29,
 2021-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 clxscore=1015 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107300030
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
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Nathan Chancellor <nathan@kernel.org>,
 iommu@lists.linux-foundation.org, linux-next@vger.kernel.org,
 Claire Chang <tientzu@chromium.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 29-Jul-2021, at 9:43 PM, Will Deacon <will@kernel.org> wrote:
>=20
> On Wed, Jul 28, 2021 at 10:35:34AM -0700, Nathan Chancellor wrote:
>> On Wed, Jul 28, 2021 at 01:31:06PM +0530, Sachin Sant wrote:
>>> next-20210723 was good. The boot failure seems to have been =
introduced with next-20210726.
>>>=20
>>> I have attached the boot log.
>>=20
>> I noticed this with OpenSUSE's ppc64le config [1] and my bisect =
landed on
>> commit ad6c00283163 ("swiotlb: Free tbl memory in swiotlb_exit()"). =
That
>> series just keeps on giving...
>=20
> Yes, but look how handy our new print is!
>=20
> [    0.010799] software IO TLB: tearing down default memory pool
> [    0.010805] ------------[ cut here ]------------
> [    0.010808] kernel BUG at arch/powerpc/kernel/interrupt.c:98!
>=20
> Following Nick's suggestion, the diff below should help? I don't have =
a
> relevant box on which I can test it though.
>=20

Thanks for the fix. This fixes the reported problem for me.
Tested successfully on both PowerVM LPAR as well as bare metal =
environment.

Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

> Will
>=20
> --->8
>=20
> diff --git a/arch/powerpc/platforms/pseries/svm.c =
b/arch/powerpc/platforms/pseries/svm.c
> index 1d829e257996..87f001b4c4e4 100644
> --- a/arch/powerpc/platforms/pseries/svm.c
> +++ b/arch/powerpc/platforms/pseries/svm.c
> @@ -63,6 +63,9 @@ void __init svm_swiotlb_init(void)
>=20
> int set_memory_encrypted(unsigned long addr, int numpages)
> {
> +       if (!mem_encrypt_active())
> +               return 0;
> +
>        if (!PAGE_ALIGNED(addr))
>                return -EINVAL;
>=20
> @@ -73,6 +76,9 @@ int set_memory_encrypted(unsigned long addr, int =
numpages)
>=20
> int set_memory_decrypted(unsigned long addr, int numpages)
> {
> +       if (!mem_encrypt_active())
> +               return 0;
> +
>        if (!PAGE_ALIGNED(addr))
>                return -EINVAL;
>=20

