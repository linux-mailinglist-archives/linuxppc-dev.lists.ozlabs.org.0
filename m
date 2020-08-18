Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BD6247FE9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 09:51:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BW35H6qFKzDqRd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 17:51:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cNBG7oi+; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BW3366t34zDqGq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 17:49:37 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07I7WZql160485; Tue, 18 Aug 2020 03:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=87gJXPDfhi2rateCJHzi2rAoFQOxxft7r4R9eDeoiyo=;
 b=cNBG7oi+D9lOKanCx5Q8BHZNOqIqs5w3L0SBFhEKLxa0tlQpftXfa2UgS7hL4LvcVe2u
 PUlr27sSY4ktAnj1hvHevvFVbQ4QVKHYrw/x6P6RKJUaTSRklbYEOTgNU1h0w3O3QagH
 pMgDrdiX4uRfGyJJMhbSCxCLbK4amxp6jnDJHx0b5cYwnjTd7RtjVCOoLZDzPXPqCem0
 MGDtm1xUxOGJnyu6yHidw/haFJWC7l34lN1tgsKkFS6SnSaHsE/Ah0BH9ZAsmTzgxNKL
 cDszJ/y8lBQNkywVr+HV4dl32xy7pXdCeujeGb6DhHny9yFu46AVgg3KGnf90/OaD4JS aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3304nu0tp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Aug 2020 03:49:28 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07I7XRk6163508;
 Tue, 18 Aug 2020 03:49:28 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3304nu0tn5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Aug 2020 03:49:27 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07I7ijEt011058;
 Tue, 18 Aug 2020 07:49:26 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3304cc0c4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Aug 2020 07:49:25 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07I7nNcx12976508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Aug 2020 07:49:23 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A36E211C050;
 Tue, 18 Aug 2020 07:49:23 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0606B11C04C;
 Tue, 18 Aug 2020 07:49:21 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Aug 2020 07:49:20 +0000 (GMT)
Date: Tue, 18 Aug 2020 13:19:20 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v5 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200818074920.GA3698@linux.vnet.ibm.com>
References: <12945273-d788-710d-e8d7-974966529c7d@redhat.com>
 <20200701122110.GT2369@dhcp22.suse.cz>
 <20200703091001.GJ21462@kitsune.suse.cz>
 <20200703092414.GR18446@dhcp22.suse.cz>
 <20200703105944.GS18446@dhcp22.suse.cz>
 <20200703125823.GA26243@linux.vnet.ibm.com>
 <20200806213211.6a6a56037fe771836e5abbe9@linux-foundation.org>
 <20200812060101.GB10992@linux.vnet.ibm.com>
 <13a85e52-5caa-24a8-7169-3992b1ad262a@redhat.com>
 <20200818073712.GK28270@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200818073712.GK28270@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-18_04:2020-08-18,
 2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 phishscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008180051
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>, Andi Kleen <ak@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, Mel Gorman <mgorman@suse.de>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Such?nek <msuchanek@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michal Hocko <mhocko@suse.com> [2020-08-18 09:37:12]:

> On Tue 18-08-20 09:32:52, David Hildenbrand wrote:
> > On 12.08.20 08:01, Srikar Dronamraju wrote:
> > > Hi Andrew, Michal, David
> > > 
> > > * Andrew Morton <akpm@linux-foundation.org> [2020-08-06 21:32:11]:
> > > 
> > >> On Fri, 3 Jul 2020 18:28:23 +0530 Srikar Dronamraju <srikar@linux.vnet.ibm.com> wrote:
> > >>
> > >>>> The memory hotplug changes that somehow because you can hotremove numa
> > >>>> nodes and therefore make the nodemask sparse but that is not a common
> > >>>> case. I am not sure what would happen if a completely new node was added
> > >>>> and its corresponding node was already used by the renumbered one
> > >>>> though. It would likely conflate the two I am afraid. But I am not sure
> > >>>> this is really possible with x86 and a lack of a bug report would
> > >>>> suggest that nobody is doing that at least.
> > >>>>
> > >> So...  do we merge this patch or not?  Seems that the overall view is
> > >> "risky but nobody is likely to do anything better any time soon"?
> > > 
> > > Can we decide on this one way or the other?
> > 
> > Hmm, not sure who's the person to decide. I tend to prefer doing the
> > node renaming, handling this in ppc code;
> 
> Agreed. That would be a safer option.

Okay, will send arch specific v6 version.

> -- 
> Michal Hocko
> SUSE Labs

-- 
Thanks and Regards
Srikar Dronamraju
