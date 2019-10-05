Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBD3CC816
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Oct 2019 07:11:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46lZbM0hPkzDqf0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Oct 2019 15:11:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46lZXk2WKfzDqcw
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Oct 2019 15:09:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46lZXk0LmCz8t4D
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Oct 2019 15:09:10 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46lZXj74mhz9sPh; Sat,  5 Oct 2019 15:09:09 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=svaidy@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46lZXj1W9Gz9sPw
 for <linuxppc-dev@ozlabs.org>; Sat,  5 Oct 2019 15:09:08 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9552OV2077675
 for <linuxppc-dev@ozlabs.org>; Sat, 5 Oct 2019 01:09:05 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vehkrv5fk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sat, 05 Oct 2019 01:09:04 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <svaidy@linux.ibm.com>;
 Sat, 5 Oct 2019 06:09:02 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 5 Oct 2019 06:09:00 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x955900K49414222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 5 Oct 2019 05:09:00 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE052AE051;
 Sat,  5 Oct 2019 05:08:59 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40355AE057;
 Sat,  5 Oct 2019 05:08:57 +0000 (GMT)
Received: from drishya.in.ibm.com (unknown [9.85.87.251])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sat,  5 Oct 2019 05:08:57 +0000 (GMT)
Date: Sat, 5 Oct 2019 10:38:54 +0530
From: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
To: Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [PATCH] powerpc/powernv/prd: Validate whether address to be
 mapped is part of system RAM
References: <20191002074856.15014-1-hegdevasant@linux.vnet.ibm.com>
 <2bb75b409a1159d5524be2d661e548e32fed152e.camel@ozlabs.org>
 <0e8a4057-fbe7-9b1a-6613-ad500ebe8b67@linux.vnet.ibm.com>
 <049794f6a16f548bcb418d31fecf268cb4a335e5.camel@ozlabs.org>
 <9b9b529d-cad7-0ace-acf6-e07d0dea5670@linux.vnet.ibm.com>
 <452718dfe591c4718498aab6b5c7b68a95cf6c5a.camel@ozlabs.org>
 <20191003102940.GC3181@drishya.in.ibm.com>
 <0b130833-6521-17eb-c693-8de4b6ef4d95@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <0b130833-6521-17eb-c693-8de4b6ef4d95@ozlabs.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 19100505-0008-0000-0000-0000031E3343
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100505-0009-0000-0000-00004A3D4045
Message-Id: <20191005050854.GD3181@drishya.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-05_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910050045
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
Reply-To: svaidy@linux.ibm.com
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, linuxppc-dev@ozlabs.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Jeremy Kerr <jk@ozlabs.org> [2019-10-04 11:27:46]:

> Hi Vaidy,
> 
> > The current topic is who owns setting up the ATT bits for that piece
> > of memory.  It is the kernel today.  Kernel decides to set this up as
> > normal memory or I/O memory and sets the bits in page table entry.
> > 
> > > Or, what if there's a range of address-space that isn't backed by system
> > > RAM (say, some MMIO-mapped hardware) that we want to expose to a future
> > > HBRT implementation? This change will block that.
> > > 
> > > The kernel doesn't know what is and is not valid for a HBRT mapping, so
> > > it has no reason to override what's specified in the device tree. We've
> > > designed this so that the kernel provides the mechanism for mapping
> > > pages, and not the policy of which pages can be mapped.
> > 
> > The features altered are cache inhibit and guarding which affects
> > ability to fetch instructions.  If we allow HBRT to reside in an I/O
> > memory, the we need to tell kernel that it is ok to allow caching and
> > instruction execution in that region and accordingly change the ATT
> > bits.
> 
> But this isn't only about the HBRT range itself (ie., the memory containing
> the HBRT binary). Everything that HBRT needs to map will come through this
> path. We may not need to fetch instructions from those ranges.

Correct. Only HBRT code cannot be fetched, but data can be mapped and
used.  However cache inhibit mapping is unnecessary unless explicitly
requested by firmware.

> > This patch does not block a working function, but actually makes
> > debugging a failed case easier.  The failing scenario without this
> > check is such that HBRT cannot fetch from the region of memory and
> > loops in minor page faults doing nothing.
> 
> Yep, that's not great, but the alternative means applying this kernel
> policy, which we can't guarantee is correct.
> 
> That is, unless the page protection bits mean that this won't work anyway,
> but we can probably fix that without a kernel policy, by applying the
> appropriate pgprot_t, perhaps.

Currently if we allow the mapping, it won't work at all for code.  But
can work for data pages.  However cache inhibit mapping will cause
side effects apart from poor performance.  We should not do this
unless firmware has a reason to request for this.  We should pass
additional info from OPAL to driver to set/override permission.

> > As Vasant mentioned hostboot team will add code to relocate the HBRT
> > to the right place.  Addressing your concern, if we end up allowing
> > HBRT in non system-RAM area
> 
> Not just HBRT, but anything that HBRT maps too.

Correct.

> > we need to add some more flags in device
> > tree to instruct the driver to force change the page protection bits
> > as page_prot = pgprot_cached(page_prot);
> 
> Doesn't phys_mem_access_prot() handle that for us? Or do I have my
> _noncached/_cached logic inverted?

The kernel permission policy is implemented via phys_mem_access_prot().

pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
			      unsigned long size, pgprot_t vma_prot)
{
	if (ppc_md.phys_mem_access_prot)
		return ppc_md.phys_mem_access_prot(file, pfn, size, vma_prot);

	if (!page_is_ram(pfn))
		vma_prot = pgprot_noncached(vma_prot);

	return vma_prot;
}

The problem for firmware (HBRT) mapping is precisely this policy that
forces a different defaults pgprot_noncached() if the memory page is
not in system-RAM.

If !page_is_ram(pfn) check is how defaults will change.  This check is
what changes pgprot for us now for NVRAM.  We can override this
permission in opal-prd driver since we know the nature of the use
case. But I would expect OPAL to indicate that we should override and
then proceed to do it in the driver.

If we really architect a usage model where firmware uses NVRAM, then
it should be in its own namespace and not really pick just an address.
Also as per our opal-prd design, other than firmware memory, all
device access should come via host-kernel driver and not directly
mapped to application.

--Vaidy

