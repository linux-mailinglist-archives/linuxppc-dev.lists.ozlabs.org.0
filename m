Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F389151E34
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 17:21:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Bqgh6DzLzDqQK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 03:21:04 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BqdZ2pKfzDqP0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2020 03:19:14 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 014GBUUq070878; Tue, 4 Feb 2020 11:19:08 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xxm9e3xc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Feb 2020 11:19:08 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 014GJ7wb117859;
 Tue, 4 Feb 2020 11:19:07 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xxm9e3xax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Feb 2020 11:19:07 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 014GI0ml015994;
 Tue, 4 Feb 2020 16:19:05 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma05wdc.us.ibm.com with ESMTP id 2xw0y6tse9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Feb 2020 16:19:05 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 014GJ4aP13173466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Feb 2020 16:19:04 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA97828058;
 Tue,  4 Feb 2020 16:19:04 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF8E82805E;
 Tue,  4 Feb 2020 16:19:04 +0000 (GMT)
Received: from localhost (unknown [9.41.179.32])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 Feb 2020 16:19:04 +0000 (GMT)
Date: Tue, 4 Feb 2020 10:19:04 -0600
From: Scott Cheloha <cheloha@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/drmem: cache LMBs in xarray to accelerate lookup
Message-ID: <20200204161904.62gpevnygu2pzdnk@rascal.austin.ibm.com>
References: <20200128221113.17158-1-cheloha@linux.ibm.com>
 <87pnf3i188.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pnf3i188.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-04_05:2020-02-04,
 2020-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2002040108
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

I would like to try to "solve one problem at a time".

We can fix the linear search performance scaling problems without
removing the array of LMBs.  As I've shown in my diff, we can do it
with minimal change to the existing code.

If it turns out that the PAPR guarantees the ordering of the memory
DRCs then in a subsequent patch (series) we can replace the LMB array
(__drmem_info.lmbs) with an xarray indexed by DRC and use e.g.
xa_for_each() in the hotplug code.
