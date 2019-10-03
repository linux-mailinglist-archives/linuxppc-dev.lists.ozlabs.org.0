Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 440F2C9C4B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 12:32:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kTpG6KjfzDqZx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 20:32:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kTlq2gXWzDqY5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2019 20:29:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46kTlp4nGLz8syX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2019 20:29:58 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46kTlp4F2fz9sPJ; Thu,  3 Oct 2019 20:29:58 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=svaidy@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46kTlp05p2z9sP7
 for <linuxppc-dev@ozlabs.org>; Thu,  3 Oct 2019 20:29:57 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x93AQ0QH093931
 for <linuxppc-dev@ozlabs.org>; Thu, 3 Oct 2019 06:29:52 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vdbwe65ry-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 03 Oct 2019 06:29:51 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <svaidy@linux.ibm.com>;
 Thu, 3 Oct 2019 11:29:50 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 3 Oct 2019 11:29:46 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x93ATHPC39059840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Oct 2019 10:29:17 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFB414C044;
 Thu,  3 Oct 2019 10:29:45 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1E2E4C046;
 Thu,  3 Oct 2019 10:29:43 +0000 (GMT)
Received: from drishya.in.ibm.com (unknown [9.102.17.136])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  3 Oct 2019 10:29:43 +0000 (GMT)
Date: Thu, 3 Oct 2019 15:59:40 +0530
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <452718dfe591c4718498aab6b5c7b68a95cf6c5a.camel@ozlabs.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 19100310-0028-0000-0000-000003A59E10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100310-0029-0000-0000-00002467A4AA
Message-Id: <20191003102940.GC3181@drishya.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-03_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910030095
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

* Jeremy Kerr <jk@ozlabs.org> [2019-10-03 15:07:24]:

> Hi Vasant,
> 
> > > OK. How about we just don't do that?
> > 
> > Yes. Hostboot will fix that. It will make sure that HBRT is loaded
> > into regular memory.
> 
> Super.
> 
> > > It sounds like we're just trying to work around an invalid
> > > representation of the mappings.
> > 
> > Its not workaround. Its additional check.
> 
> The issue is that you've added a check for stuff that the kernel doesn't
> (and shouldn't) know about, and assumed that the kernel knows better
> than the device tree. It may be the correct thing to do in this case,
> but we can't guarantee that it's always correct.

Good point on the policy ownership.

> For example, what if there is a future HBRT range that is fine to go
> into NVRAM? With this change, that's not possible.

The current topic is who owns setting up the ATT bits for that piece
of memory.  It is the kernel today.  Kernel decides to set this up as
normal memory or I/O memory and sets the bits in page table entry.

> Or, what if there's a range of address-space that isn't backed by system
> RAM (say, some MMIO-mapped hardware) that we want to expose to a future
> HBRT implementation? This change will block that.
> 
> The kernel doesn't know what is and is not valid for a HBRT mapping, so
> it has no reason to override what's specified in the device tree. We've
> designed this so that the kernel provides the mechanism for mapping
> pages, and not the policy of which pages can be mapped.

The features altered are cache inhibit and guarding which affects
ability to fetch instructions.  If we allow HBRT to reside in an I/O
memory, the we need to tell kernel that it is ok to allow caching and
instruction execution in that region and accordingly change the ATT
bits.

This patch does not block a working function, but actually makes
debugging a failed case easier.  The failing scenario without this
check is such that HBRT cannot fetch from the region of memory and
loops in minor page faults doing nothing.  

As Vasant mentioned hostboot team will add code to relocate the HBRT
to the right place.  Addressing your concern, if we end up allowing
HBRT in non system-RAM area, we need to add some more flags in device
tree to instruct the driver to force change the page protection bits
as page_prot = pgprot_cached(page_prot); It does not make sense to
keep the region cache inhibited and just clear the Guard bit
(ATT=0b10 - non-idempotent I/O) so we should force to normal memory
ATT=0b00.

In summary, this check does not block any working function today.  We
fail to execute HBRT code after we successfully mmap() the memory
anyway.

When we need to move firmware components to other types of memory, we
should do a future patch to indicate in device tree that this is non
system-RAM and kernel should change PTE permissions and then setup the
mmap(). Or HBRT really has a use for NVRAM in which case we explicitly
need to indicate (via device-tree) the required attribute for this
mapping.

--Vaidy

