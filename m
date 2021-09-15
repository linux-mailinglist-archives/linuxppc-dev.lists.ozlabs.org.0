Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BCA40C37E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 12:15:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8bgw6qL0z2yNC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 20:15:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YEfNJhsh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YEfNJhsh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8bgC3s7Wz2yHT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 20:14:46 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18F7Zmpq013104;
 Wed, 15 Sep 2021 06:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=1CvBoL4UO9UE0U96hNF1qNekvPhdGJ/IHUjTEpXG+YU=;
 b=YEfNJhshjitTdfVh2SQ9IRmxiLu+hBc9JZhhRgA/541skcknTB+qjhIvHnJq1g+oUk7w
 k7PfKp0uAMT0dIneL2+ilosryXmj6pnAAyNFz/tkMKN19IUh2L9PjsXWqGYl4dmTnF16
 XAh9c0gwMOZOcyw74by1riil5QeOlcjxUznr13KzbG9jVGC8dVjGXJTeCJwBT51p8dvA
 FcfuITA+g9E2ITDemtBJe/ilVrDofRF2F9hbPSzRBDAdHvN9Zlv4MSO+3Sof6LmgaH8e
 mkkTvPVQNPci5GKuCcTmziz9O/YybnVcdo2LND9ImzRCZHoXMMoScCP9boR+mo34CKEf tA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b3cjtb89d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 06:14:05 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18F9o6tF016868;
 Wed, 15 Sep 2021 06:14:04 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b3cjtb88r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 06:14:04 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18FA3PO2017375;
 Wed, 15 Sep 2021 10:14:02 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3b0kqjwnas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 10:14:02 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 18FA9Owo58065308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 10:09:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E3094C050;
 Wed, 15 Sep 2021 10:13:58 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 357904C046;
 Wed, 15 Sep 2021 10:13:57 +0000 (GMT)
Received: from sig-9-145-34-225.uk.ibm.com (unknown [9.145.34.225])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Sep 2021 10:13:57 +0000 (GMT)
Message-ID: <3cfa5c39151b415000b13f94edbd513940c272c4.camel@linux.ibm.com>
Subject: Re: [PATCH] pci: Rename pcibios_add_device to match
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>, Michal Simek <monstr@monstr.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Gerald
 Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian
 Borntraeger <borntraeger@de.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Date: Wed, 15 Sep 2021 12:13:56 +0200
In-Reply-To: <20210913152709.48013-1-oohall@gmail.com>
References: <20210913152709.48013-1-oohall@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qsgztY6656GojP5eot9j-my1z4nhin5e
X-Proofpoint-ORIG-GUID: tinSbreoYB0apZL0qAvJHteIZSAXyVt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 malwarescore=0 mlxscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150047
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
Cc: sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2021-09-14 at 01:27 +1000, Oliver O'Halloran wrote:
> The general convention for pcibios_* hooks is that they're named after
> the corresponding pci_* function they provide a hook for. The exception
> is pcibios_add_device() which provides a hook for pci_device_add(). This
> has been irritating me for years so rename it.
> 
> Also, remove the export of the microblaze version. The only caller
> must be compiled as a built-in so there's no reason for the export.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/microblaze/pci/pci-common.c           | 3 +--
>  arch/powerpc/kernel/pci-common.c           | 2 +-
>  arch/powerpc/platforms/powernv/pci-sriov.c | 2 +-
>  arch/s390/pci/pci.c                        | 2 +-
>  arch/sparc/kernel/pci.c                    | 2 +-
>  arch/x86/pci/common.c                      | 2 +-
>  drivers/pci/pci.c                          | 4 ++--
>  drivers/pci/probe.c                        | 4 ++--
>  include/linux/pci.h                        | 2 +-
>  9 files changed, 11 insertions(+), 12 deletions(-)
> 
> 
.. snip ..
> diff --git a/arch/s390/pci/pci.c b/arch/s390/pci/pci.c
> index e7e6788d75a8..ded3321b7208 100644
> --- a/arch/s390/pci/pci.c
> +++ b/arch/s390/pci/pci.c
> @@ -561,7 +561,7 @@ static void zpci_cleanup_bus_resources(struct zpci_dev *zdev)
>  	zdev->has_resources = 0;
>  }
>  
> -int pcibios_add_device(struct pci_dev *pdev)
> +int pcibios_device_add(struct pci_dev *pdev)
>  {
>  	struct zpci_dev *zdev = to_zpci(pdev);
>  	struct resource *res;
> 
.. snip ..
>


I agree with your assesment this is indeed confusing. Interestingly
pcibios_release_device() also doesn't follow the convention exactly as
it is called from pci_release_dev() but at least that isn't very
confusing.

So for the arch/s390/pci bit:

Acked-by: Niklas Schnelle <schnelle@linux.ibm.com>

