Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A39AA157EA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 05:12:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yl5G1j9SzDqMk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 13:12:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=oracle.com
 (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=daniel.m.jordan@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.b="qPZyJEvF"; 
 dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yl3l5pbDzDqJW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 13:10:43 +1000 (AEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4738uBG073685;
 Tue, 7 May 2019 03:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=Sa+cOJtJx0K5ZUTspQzVWRaHsaM72rSdt2S6cah8KqE=;
 b=qPZyJEvFwNkpPyu498f2W9cJG3cwo3YzJHpJuUkM4qNXyo0XdOQ9+2nBbN/aGX6t9k1U
 wHeLMsyAc1cE1N+uTUZnW/Iyw54XcN6jiBEm0jAv/cQLsff/0gr7PXOraCv+40U7PJWD
 R/9Fkc7FCq8Z9qdqoT6DH83+M46p62s329nBRNiN69nX2PhdQ2dCEdLOHXuJEXE0hF3p
 GLmiF0TCkWeY+nB04qmMqqK6u9J8x9umk/1yUcK+AKwwac5NjQpKLneDVrp7r8yIEyQW
 1GH7C9dCib2+z68OBCyWe+2gDeM+qGNzSX60HntCF330GSmcl5vC0+RL01+Q5LaL4Rk4 Og== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2s94b0j77m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 May 2019 03:10:22 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x473A5lN185360;
 Tue, 7 May 2019 03:10:22 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2s94af7xxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 May 2019 03:10:22 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x473A6JU021461;
 Tue, 7 May 2019 03:10:07 GMT
Received: from ca-dmjordan1.us.oracle.com (/10.211.9.48)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 06 May 2019 20:10:06 -0700
Date: Mon, 6 May 2019 23:09:57 -0400
From: Daniel Jordan <daniel.m.jordan@oracle.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH] mm: add account_locked_vm utility function
Message-ID: <20190507030957.3qp7yflco6ckcj5q@ca-dmjordan1.us.oracle.com>
References: <20190503201629.20512-1-daniel.m.jordan@oracle.com>
 <20190503232818.GA5182@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503232818.GA5182@mellanox.com>
User-Agent: NeoMutt/20180323-268-5a959c
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9249
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905070018
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9249
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905070018
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
Cc: Mark Rutland <mark.rutland@arm.com>, Davidlohr Bueso <dave@stgolabs.net>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Alan Tull <atull@kernel.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 "linux-fpga@vger.kernel.org" <linux-fpga@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Alex Williamson <alex.williamson@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 Steve Sistare <steven.sistare@oracle.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Lameter <cl@linux.com>, Wu Hao <hao.wu@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 03, 2019 at 11:28:22PM +0000, Jason Gunthorpe wrote:
> On Fri, May 03, 2019 at 01:16:30PM -0700, Daniel Jordan wrote:
> > Andrew, this one patch replaces these six from [1]:
> > 
> >     mm-change-locked_vms-type-from-unsigned-long-to-atomic64_t.patch
> >     vfio-type1-drop-mmap_sem-now-that-locked_vm-is-atomic.patch
> >     vfio-spapr_tce-drop-mmap_sem-now-that-locked_vm-is-atomic.patch
> >     fpga-dlf-afu-drop-mmap_sem-now-that-locked_vm-is-atomic.patch
> >     kvm-book3s-drop-mmap_sem-now-that-locked_vm-is-atomic.patch
> >     powerpc-mmu-drop-mmap_sem-now-that-locked_vm-is-atomic.patch
> > 
> > That series converts locked_vm to an atomic, but on closer inspection causes at
> > least one accounting race in mremap, and fixing it just for this type
> > conversion came with too much ugly in the core mm to justify, especially when
> > the right long-term fix is making these drivers use pinned_vm instead.
> 
> Did we ever decide what to do here? Should all these drivers be
> switched to pinned_vm anyhow?

Well, there were the concerns about switching in [1].  Alex, is there an
example of an application or library that would break or be exploitable?  If
there were particular worries (qemu for vfio type1, for example), perhaps some
coordinated changes across the kernel and userspace would be possible,
especially given the amount of effort it's likely going to take to get the
locked_vm/pinned_vm accounting sorted out.

[1] https://lore.kernel.org/linux-mm/20190213130330.76ef1987@w520.home/
