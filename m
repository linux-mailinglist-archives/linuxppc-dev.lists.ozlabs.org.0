Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC30D2282EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 16:58:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB1tJ1gdSzDqTC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 00:58:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB1qc6g7KzDqKh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 00:55:40 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06LEfeZj106832; Tue, 21 Jul 2020 10:55:27 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vr13rx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 10:55:27 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06LEfkL7107709;
 Tue, 21 Jul 2020 10:55:27 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vr13rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 10:55:27 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06LEkCtx003867;
 Tue, 21 Jul 2020 14:55:26 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 32brq9ax36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 14:55:26 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06LEtNow26214852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 14:55:23 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3646C605D;
 Tue, 21 Jul 2020 14:55:24 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A6C9C6057;
 Tue, 21 Jul 2020 14:55:24 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.79.221.206])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jul 2020 14:55:24 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id BE5002E3C48; Tue, 21 Jul 2020 20:25:19 +0530 (IST)
Date: Tue, 21 Jul 2020 20:25:19 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 2/3] powerpc/powernv/idle: Rename
 pnv_first_spr_loss_level variable
Message-ID: <20200721145519.GA26845@in.ibm.com>
References: <20200717185306.60607-1-psampat@linux.ibm.com>
 <20200717185306.60607-3-psampat@linux.ibm.com>
 <1595202681.bt4670u7q7.astroid@bobo.none>
 <81dcf34e-870d-b3a1-7876-a6a2f0b37d1f@linux.ibm.com>
 <1595341835.8ad8mjl9hm.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595341835.8ad8mjl9hm.astroid@bobo.none>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_09:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007210106
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
Reply-To: ego@linux.vnet.ibm.com
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, pratik.r.sampat@gmail.com,
 linux-kernel@vger.kernel.org, Pratik Sampat <psampat@linux.ibm.com>,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Wed, Jul 22, 2020 at 12:37:41AM +1000, Nicholas Piggin wrote:
> Excerpts from Pratik Sampat's message of July 21, 2020 8:29 pm:
> > 
> > 
> > On 20/07/20 5:27 am, Nicholas Piggin wrote:
> >> Excerpts from Pratik Rajesh Sampat's message of July 18, 2020 4:53 am:
> >>> Replace the variable name from using "pnv_first_spr_loss_level" to
> >>> "pnv_first_fullstate_loss_level".
> >>>
> >>> As pnv_first_spr_loss_level is supposed to be the earliest state that
> >>> has OPAL_PM_LOSE_FULL_CONTEXT set, however as shallow states too loose
> >>> SPR values, render an incorrect terminology.
> >> It also doesn't lose "full" state at this loss level though. From the
> >> architecture it could be called "hv state loss level", but in POWER10
> >> even that is not strictly true.
> >>
> > Right. Just discovered that deep stop states won't loose full state
> > P10 onwards.
> > Would it better if we rename it as "pnv_all_spr_loss_state" instead
> > so that it stays generic enough while being semantically coherent?
> 
> It doesn't lose all SPRs. It does physically, but for Linux it appears 
> at least timebase SPRs are retained and that's mostly how it's 
> documented.
> 
> Maybe there's no really good name for it, but we do call it "deep" stop 
> in other places, you could call it deep_spr_loss maybe. I don't mind too 
> much though, whatever Gautham is happy with.

Nick's suggestion is fine by me. We can call it deep_spr_loss_state.

> 
> Thanks,
> Nick

--
Thanks and Regards
gautham.
