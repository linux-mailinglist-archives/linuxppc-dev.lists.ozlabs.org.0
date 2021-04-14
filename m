Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC7335EF86
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 10:31:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKwgK2K30z30Dr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 18:31:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J7fy7ey6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=112s=jl=linux.ibm.com=mahesh@ozlabs.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=J7fy7ey6; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKwfs4kXQz300c
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 18:31:17 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4FKwfp2C2lz9sVv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 18:31:14 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4FKwfp1mqsz9sWK; Wed, 14 Apr 2021 18:31:14 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=J7fy7ey6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4FKwfn6JTHz9sVv
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Apr 2021 18:31:12 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13E83n35126535; Wed, 14 Apr 2021 04:31:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=XicaQCV1lTLQPW9pc3pYN9vh57FTC3Ulm5lsPT9Z6CA=;
 b=J7fy7ey6UklT442UkPIbhxh7WOlgGvdWPqeFZL1Tw6xLktJ22n4odJggH6qz3PSS0I2a
 nMUC5WKhTdxsAdNeXB/SPjyk9Sz57aICm3oAqUMdNaKxo2XBAcejaqEOPGkzhqIbT+tP
 C2OlRrInYGtjyRX4SuWP7xoW+v+owgqOs9br18N+nlJYpDZ/usVuJOs6LquHvUlkKdoy
 F5d+DqFjPcUDe9565Ln8AraZxzKQ9/qqji3hSJk7rX24BUOug+7wzDKsQFW8Sf7FaJkZ
 b2cUx6B47iBVzbwrpiAgw7mx3JbPUA6u50pJ5IkcTaUeA/J2IqJ9vnff1beIkVeJeH0x MA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37w6wnb9ve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 04:31:10 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13E85285132307;
 Wed, 14 Apr 2021 04:31:09 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37w6wnb9tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 04:31:09 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13E8RoqH010396;
 Wed, 14 Apr 2021 08:31:07 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 37u3n8hp0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 08:31:07 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13E8V4wv36110774
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 08:31:05 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C586FA4062;
 Wed, 14 Apr 2021 08:31:04 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE03AA4066;
 Wed, 14 Apr 2021 08:31:03 +0000 (GMT)
Received: from in.ibm.com (unknown [9.102.28.171])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 14 Apr 2021 08:31:03 +0000 (GMT)
Date: Wed, 14 Apr 2021 14:01:00 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH v2] powerpc/eeh: Fix EEH handling for hugepages in
 ioremap space.
Message-ID: <20210414083100.mlrew6jktzb6axb2@in.ibm.com>
References: <161821396263.48361.2796709239866588652.stgit@jupiter>
 <CAOSf1CG3oYCnWx+gV3VgYzkQJTvVEeMGDyKjMAQRdH8w23C2QA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSf1CG3oYCnWx+gV3VgYzkQJTvVEeMGDyKjMAQRdH8w23C2QA@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uWVOVVsumirjj1mp-Y733GWGGvD2ZwER
X-Proofpoint-GUID: cWA28Gf6LU4ivTXDnRnCT9_a4-PNqyFj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_03:2021-04-14,
 2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140055
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
Reply-To: mahesh@linux.ibm.com
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>, stable <stable@vger.kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-04-13 10:53:39 Tue, Oliver O'Halloran wrote:
> On Mon, Apr 12, 2021 at 5:52 PM Mahesh Salgaonkar <mahesh@linux.ibm.com> wrote:
> >
> > During the EEH MMIO error checking, the current implementation fails to map
> > the (virtual) MMIO address back to the pci device on radix with hugepage
> > mappings for I/O. This results into failure to dispatch EEH event with no
> > recovery even when EEH capability has been enabled on the device.
> >
> > eeh_check_failure(token)                # token = virtual MMIO address
> >   addr = eeh_token_to_phys(token);
> >   edev = eeh_addr_cache_get_dev(addr);
> >   if (!edev)
> >         return 0;
> >   eeh_dev_check_failure(edev);  <= Dispatch the EEH event
> >
> > In case of hugepage mappings, eeh_token_to_phys() has a bug in virt -> phys
> > translation that results in wrong physical address, which is then passed to
> > eeh_addr_cache_get_dev() to match it against cached pci I/O address ranges
> > to get to a PCI device. Hence, it fails to find a match and the EEH event
> > never gets dispatched leaving the device in failed state.
> >
> > The commit 33439620680be ("powerpc/eeh: Handle hugepages in ioremap space")
> > introduced following logic to translate virt to phys for hugepage mappings:
> >
> > eeh_token_to_phys():
> > +       pa = pte_pfn(*ptep);
> > +
> > +       /* On radix we can do hugepage mappings for io, so handle that */
> > +       if (hugepage_shift) {
> > +               pa <<= hugepage_shift;                  <= This is wrong
> > +               pa |= token & ((1ul << hugepage_shift) - 1);
> > +       }
> 
> I think I vaguely remember thinking "is this right?" at the time.
> Apparently not!
> 
> Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
> 

Thanks for the review.

> 
> It would probably be a good idea to add a debugfs interface to help
> with testing the address translation. Maybe something like:
> 
> echo <mmio addr> > /sys/kernel/debug/powerpc/eeh_addr_check
> 
> Then in the kernel:
> 
> struct resource *r = lookup_resource(mmio_addr);
> void *virt = ioremap_resource(r);
> ret = eeh_check_failure(virt);
> iounmap(virt)
> 
> return ret;
> 
> A little tedious, but then you can write a selftest :)

Sure, will give a try.

Thanks,
-Mahesh.

-- 
Mahesh J Salgaonkar
