Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AF4264CEB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 20:30:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnS9Y4t1CzDqQ3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 04:30:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnS7X2nL4zDqLt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 04:28:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YOeIhX8p; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BnS7W5dMCz8tZc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 04:28:23 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BnS7W3s2wz9sTv; Fri, 11 Sep 2020 04:28:23 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YOeIhX8p; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BnS7V4JZgz9sT6;
 Fri, 11 Sep 2020 04:28:22 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08AI1hkE058774; Thu, 10 Sep 2020 14:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=pUHHpPpPvuprvafhzdfQXQjaHmFyOTOMIryJiXQhgVg=;
 b=YOeIhX8p1iNw8ONs6DKPMMHMrKybcGJWceoo7NxZ29ANlurZx0rMn+9iIM04XkhFS9gs
 MBPVTuAh4u1V/bJYqRz8hiO8xbn57PPKzWGOsRW6NOITt+KhHRvYRYZrU3gV65qoQ6sF
 E7GlmS8jMSr5yU82awxHB0SR7Sj6VYvz+yCBfrIPZtG8bDuCxLozM6TbFMeqoTDCYzOh
 EI7GZLMbBRXi/fOdHgSG08I2pjGVE7663kB5DfuCLhL5c36ev7l3yo7cmcbppcnNSZcU
 GoY4XsFx+c8ScH3Z2AayzZAXMwfLYgPKg8oUObCuIza8cwZrhhlWxVuxcMgRf4sBZ/dT /g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33fqts37vp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 14:28:20 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08AI1xC1060471;
 Thu, 10 Sep 2020 14:28:20 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33fqts37sy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 14:28:20 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08AIHmhO011278;
 Thu, 10 Sep 2020 18:28:14 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 33c2a9hqjj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 18:28:14 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08AIS7Yg21889368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Sep 2020 18:28:08 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CA8F6A04F;
 Thu, 10 Sep 2020 18:28:13 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F234B6A054;
 Thu, 10 Sep 2020 18:28:12 +0000 (GMT)
Received: from localhost (unknown [9.41.179.32])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 10 Sep 2020 18:28:12 +0000 (GMT)
Date: Thu, 10 Sep 2020 13:28:12 -0500
From: Scott Cheloha <cheloha@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.vnet.ibm.com>
Subject: Re: [PATCH v3] pseries/drmem: don't cache node id in drmem_lmb struct
Message-ID: <20200910182812.bsjjh4x45hwannor@rascal.austin.ibm.com>
References: <20200811015115.63677-1-cheloha@linux.ibm.com>
 <2704bebf-8c7b-7912-5e03-ddcc57acf8d1@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2704bebf-8c7b-7912-5e03-ddcc57acf8d1@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_05:2020-09-10,
 2020-09-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 phishscore=0 clxscore=1011 mlxlogscore=957 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009100162
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 linuxppc-dev@ozlabs.org, Michal Suchanek <msuchanek@suse.de>,
 Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 21, 2020 at 10:33:10AM +0200, Laurent Dufour wrote:
> Le 11/08/2020 à 03:51, Scott Cheloha a écrit :
> > 
> > [...]
> > 
> > @@ -631,7 +638,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
> >   static int dlpar_add_lmb(struct drmem_lmb *lmb)
> >   {
> >   	unsigned long block_sz;
> > -	int rc;
> > +	int nid, rc;
> > 
> >   	if (lmb->flags & DRCONF_MEM_ASSIGNED)
> >   		return -EINVAL;
> > @@ -642,11 +649,13 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
> >   		return rc;
> >   	}
> > 
> > -	lmb_set_nid(lmb);
> >   	block_sz = memory_block_size_bytes();
> > 
> > +	/* Find the node id for this address. */
> > +	nid = memory_add_physaddr_to_nid(lmb->base_addr);
> 
> I think we could be more efficient here.
> Here is the call stack behind memory_add_physaddr_to_nid():
> 
>   memory_add_physaddr_to_nid(lmb->base_addr)
>     hot_add_scn_to_nid()
>       if (of_find_node_by_path("/ibm,dynamic-reconfiguration-memory")) == true*
>       then
> 	  hot_add_drconf_scn_to_nid()
> 	    for_each_drmem_lmb() to find the LMB based on lmb->base_addr
> 	      of_drconf_to_nid_single(found LMB)
> 		use lmb->aa_index to get the nid.
> 
> * that test is necessarily true when called from dlpar_add_lmb()
> otherwise the call to update_lmb_associativity_index() would have
> failed earlier.
> 
> Basically, we have a LMB and we later walk all the LMBs to find that lmb
> again.  In the case of dlpar_add_lmb(), it would be more efficient to
> directly call of_drconf_to_nid_single(). That function is not exported
> from arch/powerpc/mm/numa.c but it may be good to export it through that
> patch.

I've posted a patch for this:

https://lore.kernel.org/linuxppc-dev/20200910175637.2865160-1-cheloha@linux.ibm.com/T/#u

The speedup is nice, especially for LMBs at the end of the array.
