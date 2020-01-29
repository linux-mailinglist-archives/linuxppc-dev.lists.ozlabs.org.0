Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9822714D042
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 19:17:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487BY936lCzDqTF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 05:17:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487BNk4GJ4zDqSd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 05:10:24 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TI7T6x129481; Wed, 29 Jan 2020 13:10:17 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xtpmtaccq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2020 13:10:17 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00TI7k5O131193;
 Wed, 29 Jan 2020 13:10:16 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xtpmtacc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2020 13:10:16 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00TI53W7010000;
 Wed, 29 Jan 2020 18:10:15 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 2xrda741py-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2020 18:10:15 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00TIAEa456164636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2020 18:10:14 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D75DC605D;
 Wed, 29 Jan 2020 18:10:14 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7928DC6062;
 Wed, 29 Jan 2020 18:10:14 +0000 (GMT)
Received: from localhost (unknown [9.41.179.32])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jan 2020 18:10:14 +0000 (GMT)
Date: Wed, 29 Jan 2020 12:10:13 -0600
From: Scott Cheloha <cheloha@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/drmem: cache LMBs in xarray to accelerate lookup
Message-ID: <20200129181013.lz6q5lpntnhwclqi@rascal.austin.ibm.com>
References: <20200128221113.17158-1-cheloha@linux.ibm.com>
 <87pnf3i188.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pnf3i188.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_05:2020-01-28,
 2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=1 impostorscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001290146
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
Cc: Nathan Fontenont <ndfont@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 28, 2020 at 05:56:55PM -0600, Nathan Lynch wrote:
> Scott Cheloha <cheloha@linux.ibm.com> writes:
> > LMB lookup is currently an O(n) linear search.  This scales poorly when
> > there are many LMBs.
> >
> > If we cache each LMB by both its base address and its DRC index
> > in an xarray we can cut lookups to O(log n), greatly accelerating
> > drmem initialization and memory hotplug.
> >
> > This patch introduces two xarrays of of LMBs and fills them during
> > drmem initialization.  The patch also adds two interfaces for LMB
> > lookup.
> 
> Good but can you replace the array of LMBs altogether
> (drmem_info->lmbs)? xarray allows iteration over the members if needed.

I don't think we can without potentially changing the current behavior.

The current behavior in dlpar_memory_{add,remove}_by_ic() is to advance
linearly through the array from the LMB with the matching DRC index.

Iteration through the xarray via xa_for_each_start() will return LMBs
indexed with monotonically increasing DRC indices.

Are they equivalent?  Or can we have an LMB with a smaller DRC index
appear at a greater offset in the array?

If the following condition is possible:

	drmem_info->lmbs[i].drc_index > drmem_info->lmbs[j].drc_index

where i < j, then we have a possible behavior change because
xa_for_each_start() may not return a contiguous array slice.  It might
"leap backwards" in the array.  Or it might skip over a chunk of LMBs.
