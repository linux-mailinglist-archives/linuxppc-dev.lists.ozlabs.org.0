Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE6C1510D0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 21:15:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BJwR1khHzDqQR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 07:15:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BJtr39yVzDqJt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 07:13:56 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 013K7gdx070632; Mon, 3 Feb 2020 15:13:49 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xxfrv7hke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 15:13:49 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 013K7dO7070507;
 Mon, 3 Feb 2020 15:13:49 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xxfrv7hk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 15:13:48 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 013KArhM011612;
 Mon, 3 Feb 2020 20:13:48 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 2xw0y6rh2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 20:13:48 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 013KDkiT56099320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Feb 2020 20:13:47 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFBFE6E050;
 Mon,  3 Feb 2020 20:13:46 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0DA56E04C;
 Mon,  3 Feb 2020 20:13:46 +0000 (GMT)
Received: from localhost (unknown [9.41.179.32])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  3 Feb 2020 20:13:46 +0000 (GMT)
Date: Mon, 3 Feb 2020 14:13:46 -0600
From: Scott Cheloha <cheloha@linux.ibm.com>
To: "Fontenot, Nathan" <ndfont@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/drmem: cache LMBs in xarray to accelerate lookup
Message-ID: <20200203201346.deqkxwgfmkifeb5s@rascal.austin.ibm.com>
References: <20200128221113.17158-1-cheloha@linux.ibm.com>
 <87pnf3i188.fsf@linux.ibm.com>
 <20200129181013.lz6q5lpntnhwclqi@rascal.austin.ibm.com>
 <4dfb2f93-7af8-8c5f-854c-22afead18a8c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dfb2f93-7af8-8c5f-854c-22afead18a8c@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-03_06:2020-02-02,
 2020-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=1 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2002030144
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 30, 2020 at 10:09:32AM -0600, Fontenot, Nathan wrote:
> On 1/29/2020 12:10 PM, Scott Cheloha wrote:
> > On Tue, Jan 28, 2020 at 05:56:55PM -0600, Nathan Lynch wrote:
> >> Scott Cheloha <cheloha@linux.ibm.com> writes:
> >>> LMB lookup is currently an O(n) linear search.  This scales poorly when
> >>> there are many LMBs.
> >>>
> >>> If we cache each LMB by both its base address and its DRC index
> >>> in an xarray we can cut lookups to O(log n), greatly accelerating
> >>> drmem initialization and memory hotplug.
> >>>
> >>> This patch introduces two xarrays of of LMBs and fills them during
> >>> drmem initialization.  The patch also adds two interfaces for LMB
> >>> lookup.
> >>
> >> Good but can you replace the array of LMBs altogether
> >> (drmem_info->lmbs)? xarray allows iteration over the members if needed.
> > 
> > I don't think we can without potentially changing the current behavior.
> > 
> > The current behavior in dlpar_memory_{add,remove}_by_ic() is to advance
> > linearly through the array from the LMB with the matching DRC index.
> > 
> > Iteration through the xarray via xa_for_each_start() will return LMBs
> > indexed with monotonically increasing DRC indices.> 
> > Are they equivalent?  Or can we have an LMB with a smaller DRC index
> > appear at a greater offset in the array?
> > 
> > If the following condition is possible:
> > 
> > 	drmem_info->lmbs[i].drc_index > drmem_info->lmbs[j].drc_index
> > 
> > where i < j, then we have a possible behavior change because
> > xa_for_each_start() may not return a contiguous array slice.  It might
> > "leap backwards" in the array.  Or it might skip over a chunk of LMBs.
> > 
> 
> The LMB array should have each LMB in monotonically increasing DRC Index
> value. Note that this is set up based on the DT property but I don't recall
> ever seeing the DT specify LMBs out of order or not being contiguous.

Is that ordering guaranteed by the PAPR or some other spec or is that
just a convention?

Code like drmem_update_dt_v1() makes me very nervous:

static int drmem_update_dt_v1(struct device_node *memory,
                              struct property *prop)
{
        struct property *new_prop;
        struct of_drconf_cell_v1 *dr_cell;
        struct drmem_lmb *lmb;
        u32 *p;

        new_prop = clone_property(prop, prop->length);
        if (!new_prop)
                return -1;

        p = new_prop->value;
        *p++ = cpu_to_be32(drmem_info->n_lmbs);

        dr_cell = (struct of_drconf_cell_v1 *)p;

        for_each_drmem_lmb(lmb) {
                dr_cell->base_addr = cpu_to_be64(lmb->base_addr);
                dr_cell->drc_index = cpu_to_be32(lmb->drc_index);
                dr_cell->aa_index = cpu_to_be32(lmb->aa_index);
                dr_cell->flags = cpu_to_be32(drmem_lmb_flags(lmb));

                dr_cell++;
        }

        of_update_property(memory, new_prop);
        return 0;
}

If for whatever reason the firmware has a DRC that isn't monotonically
increasing and we update a firmware property at the wrong offset I have
no idea what would happen.

With the array we preserve the order.  Without it we might violate
some assumption the firmware has made.
