Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 715B1188951
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 16:41:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hcpm596XzDqhl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 02:41:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hbCm4zsSzDqhk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 01:29:40 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02HELopH031296
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 10:29:37 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yrue36hkx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 10:29:37 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Tue, 17 Mar 2020 14:29:34 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Mar 2020 14:29:30 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02HETTc463242282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 14:29:29 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 962E84C040;
 Tue, 17 Mar 2020 14:29:29 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66B3B4C046;
 Tue, 17 Mar 2020 14:29:27 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 17 Mar 2020 14:29:27 +0000 (GMT)
Date: Tue, 17 Mar 2020 19:59:26 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH 4/4] powerpc/numa: Set fallback nodes for offline nodes
References: <3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com>
 <20200317131753.4074-1-srikar@linux.vnet.ibm.com>
 <20200317131753.4074-5-srikar@linux.vnet.ibm.com>
 <20200317142232.GB26049@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200317142232.GB26049@in.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20031714-4275-0000-0000-000003ADD7BD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031714-4276-0000-0000-000038C300D9
Message-Id: <20200317142926.GA4879@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-17_05:2020-03-17,
 2020-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003170059
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Kirill Tkhai <ktkhai@virtuozzo.com>,
 Mel Gorman <mgorman@suse.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Bharata B Rao <bharata@linux.ibm.com> [2020-03-17 19:52:32]:

Thanks Bharata.

> This patchset can also fix a related problem that I reported earlier at
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-March/206076.html
> with an additional change, suggested by Srikar as shown below:
> 
> >  
> > -	for_each_online_node(node) {
> > +	for_each_node(node) {
> > +		/*
> > +		 * For all possible but not yet online nodes, ensure their
> > +		 * node_numa_mem is set correctly so that kmalloc_node works
> > +		 * for such nodes.
> > +		 */
> > +		if (!node_online(node)) {
> 
> Change the above line to like below:
> 
> +               if (!node_state(node, N_MEMORY)) {
> 

Just to clarify, this is needed if we don't have
http://lore.kernel.org/lkml/20200311110237.5731-1-srikar@linux.vnet.ibm.com/t/#u


-- 
Thanks and Regards
Srikar Dronamraju

