Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4074E168813
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 21:06:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PMsn0HHPzDqkd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2020 07:06:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PMp752FvzDqlW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2020 07:03:11 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01LJq6M1023464; Fri, 21 Feb 2020 15:03:05 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y9tkdcrxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 15:03:05 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01LJqp4L024213;
 Fri, 21 Feb 2020 15:03:05 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y9tkdcrxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 15:03:05 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01LK146K024904;
 Fri, 21 Feb 2020 20:03:04 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 2y6897nekp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 20:03:04 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01LK33ha44499376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 20:03:03 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 022AB136053;
 Fri, 21 Feb 2020 20:03:03 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC4E7136051;
 Fri, 21 Feb 2020 20:03:02 +0000 (GMT)
Received: from localhost (unknown [9.41.179.160])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 Feb 2020 20:03:02 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Scott Cheloha <cheloha@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] pseries/hotplug-memory: leverage xarray API to
 simplify code
In-Reply-To: <20200221172901.1596249-3-cheloha@linux.ibm.com>
References: <20200128221113.17158-1-cheloha@linux.ibm.com>
 <20200221172901.1596249-3-cheloha@linux.ibm.com>
Date: Fri, 21 Feb 2020 14:03:02 -0600
Message-ID: <87pne7so7d.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-21_07:2020-02-21,
 2020-02-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=747 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002210151
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
Cc: Nathan Fontenont <ndfont@gmail.com>, Michal Hocko <mhocko@suse.com>,
 Michal Suchanek <msuchanek@suse.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Scott,

Scott Cheloha <cheloha@linux.ibm.com> writes:
> -#define for_each_drmem_lmb_in_range(lmb, start, end)		\
> -	for ((lmb) = (start); (lmb) <= (end); (lmb)++)
> -
> -#define for_each_drmem_lmb(lmb)					\
> -	for_each_drmem_lmb_in_range((lmb),			\
> -		&drmem_info->lmbs[0],				\
> -		&drmem_info->lmbs[drmem_info->n_lmbs - 1])

A couple things.

This will conflict with "powerpc/pseries: Avoid NULL pointer dereference
when drmem is unavailable" which is in linuxppc/next-test:
   
   https://patchwork.ozlabs.org/patch/1231904/

Regardless, I don't think trading the iterator macros for open-coded
loops improve the code:

> -	for_each_drmem_lmb(lmb) {
> +	for (i = 0; i < drmem_info->n_lmbs; i++) {
> +		lmb = &drmem_info->lmbs[i];

[...]

> +struct xarray;
> +extern struct xarray *drmem_lmb_xa;

drmem_lmb_xa should go in the drmem_info structure if you can't make it
static in drmem.c.

>  
>  /*
>   * The of_drconf_cell_v1 struct defines the layout of the LMB data
> @@ -71,23 +66,6 @@ static inline u32 drmem_lmb_size(void)
>  	return drmem_info->lmb_size;
>  }
>  
> -#define DRMEM_LMB_RESERVED	0x80000000
> -
> -static inline void drmem_mark_lmb_reserved(struct drmem_lmb *lmb)
p> -{
> -	lmb->flags |= DRMEM_LMB_RESERVED;
> -}
> -
> -static inline void drmem_remove_lmb_reservation(struct drmem_lmb *lmb)
> -{
> -	lmb->flags &= ~DRMEM_LMB_RESERVED;
> -}
> -
> -static inline bool drmem_lmb_reserved(struct drmem_lmb *lmb)
> -{
> -	return lmb->flags & DRMEM_LMB_RESERVED;
> -}

The flag management is logically separate from the iterator changes, so
splitting that out would ease review.

Looking further... yes, this needs to be a series of smaller changes
please.
