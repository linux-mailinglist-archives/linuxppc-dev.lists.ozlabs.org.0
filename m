Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B782A4CC6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 01:56:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46M99K4LMHzDqZm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 09:56:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alastair@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46M97B4htLzDqJl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 09:54:46 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x81Nre6p061111
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 1 Sep 2019 19:54:41 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2urqpp8c3r-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Sep 2019 19:54:41 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Mon, 2 Sep 2019 00:54:39 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Sep 2019 00:54:37 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x81Nsa1057671906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 1 Sep 2019 23:54:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F211A4053;
 Sun,  1 Sep 2019 23:54:36 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AC62A4040;
 Sun,  1 Sep 2019 23:54:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun,  1 Sep 2019 23:54:36 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 09648A01B8;
 Mon,  2 Sep 2019 09:54:34 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@kernel.org>
Date: Mon, 02 Sep 2019 09:54:34 +1000
In-Reply-To: <1f2d967a-57a1-d3a3-4eb7-306b43709fee@redhat.com>
References: <20190827052047.31547-1-alastair@au1.ibm.com>
 <20190827062844.GQ7538@dhcp22.suse.cz>
 <ea9e43fff6b6531af0620f9df62e015af66d4535.camel@au1.ibm.com>
 <1f2d967a-57a1-d3a3-4eb7-306b43709fee@redhat.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19090123-0020-0000-0000-000003667DFE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090123-0021-0000-0000-000021BBDF1D
Message-Id: <7e8e34ece6386bd3b0703f218a3b4688c83886d7.camel@au1.ibm.com>
Subject: RE: [PATCH] powerpc: Perform a bounds check in arch_add_memory
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-01_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909010274
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
Cc: linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-08-27 at 09:13 +0200, David Hildenbrand wrote:
> On 27.08.19 08:39, Alastair D'Silva wrote:
> > On Tue, 2019-08-27 at 08:28 +0200, Michal Hocko wrote:
> > > On Tue 27-08-19 15:20:46, Alastair D'Silva wrote:
> > > > From: Alastair D'Silva <alastair@d-silva.org>
> > > > 
> > > > It is possible for firmware to allocate memory ranges outside
> > > > the range of physical memory that we support
> > > > (MAX_PHYSMEM_BITS).
> > > 
> > > Doesn't that count as a FW bug? Do you have any evidence of that
> > > in
> > > the
> > > field? Just wondering...
> > > 
> > 
> > Not outside our lab, but OpenCAPI attached LPC memory is assigned
> > addresses based on the slot/NPU it is connected to. These addresses
> > prior to:
> > 4ffe713b7587 ("powerpc/mm: Increase the max addressable memory to
> > 2PB")
> > were inaccessible and resulted in bogus sections - see our
> > discussion
> > on 'mm: Trigger bug on if a section is not found in __section_nr'.
> > Doing this check here was your suggestion :)
> > 
> > It's entirely possible that a similar problem will occur in the
> > future,
> > and it's cheap to guard against, which is why I've added this.
> > 
> 
> If you keep it here, I guess this should be wrapped by a
> WARN_ON_ONCE().
> 
> If we move it to common code (e.g., __add_pages() or add_memory()),
> then
> probably not. I can see that s390x allows to configure
> MAX_PHYSMEM_BITS,
> so the check could actually make sense.
> 

I couldn't see a nice platform indepedent way to determine the
allowable address range, but if there is, then I'll move this to the
generic code instead.

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

