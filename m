Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A103B612F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 16:30:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD9514mmdz3bVK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 00:30:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RcChOn3g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=pc@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RcChOn3g; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD94T127Tz2yZL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 00:30:16 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SDp9KM081350; Mon, 28 Jun 2021 10:30:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=/9bVHpIfqRhpKRu1VhTnXeiUtEfF4HELBXcwaeuu4nk=;
 b=RcChOn3go4CKiVEzUeFdLopi6FpH1UfrLCbd02hCDNiC2Z2RWzp1U2qKPB3jZ19aFQFb
 WAtPcoXRpvR+QCZ4GtaPY+zLYJQsmj+B8hR9HGuF9AoGSNH3eteEkNFIGXS4RcSwPnbm
 Jp773pFA+XVZ9OWetynejHAD1M8gG3m/2NTb0L9Hgfa4GZxXp4jzZ4lFGfbg2E3fklx1
 cIWcFreHy3GjoZwBB4U8FNG4kwaJPI/ZAATyAhhwptogps2NgFFs14rArqXwmgPhkz28
 ZgtVwTRNAF0HTJrM4JlDk1I6EOF/lpfs3DDR6LDO9JryOop7xIKWMBxMgCfQ0DZMpcGu 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39ffnxh91w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 10:30:12 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15SDrWXY087102;
 Mon, 28 Jun 2021 10:30:12 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39ffnxh91f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 10:30:12 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15SEPLbH019822;
 Mon, 28 Jun 2021 14:30:11 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 39duvaabu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 14:30:11 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15SEUA1u7471802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Jun 2021 14:30:10 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 306A43479B;
 Mon, 28 Jun 2021 14:30:10 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 701A1347CB;
 Mon, 28 Jun 2021 14:30:09 +0000 (GMT)
Received: from li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com (unknown
 [9.80.210.16]) by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 28 Jun 2021 14:30:09 +0000 (GMT)
Date: Mon, 28 Jun 2021 09:30:07 -0500
From: "Paul A. Clarke" <pc@us.ibm.com>
To: kajoljain <kjain@linux.ibm.com>
Subject: Re: [PATCH] perf vendor events power10: Adds 24x7 nest metric events
 for power10 platform
Message-ID: <20210628143007.GD142768@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
References: <20210625115948.99579-1-kjain@linux.ibm.com>
 <20210625132151.GC142768@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
 <d2eaebb6-7cd6-d2e3-0bed-0c054e7d2207@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2eaebb6-7cd6-d2e3-0bed-0c054e7d2207@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G6jK1PqeVZer2vy4tZX5rn-DX5iBajN_
X-Proofpoint-ORIG-GUID: 0MV31-snMGnPUh3aTA2-x2ly5YDJmN--
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_05:2021-06-25,
 2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106280052
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
Cc: ravi.bangoria@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com, jolsa@redhat.com, linux-kernel@vger.kernel.org,
 acme@kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 28, 2021 at 11:58:54AM +0530, kajoljain wrote:
> 
> 
> On 6/25/21 6:51 PM, Paul A. Clarke wrote:
> > On Fri, Jun 25, 2021 at 05:29:48PM +0530, Kajol Jain wrote:
> >> Patch adds 24x7 nest metric events for POWER10.
> >>
> >> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> >> ---
> >>  .../arch/powerpc/power10/nest_metrics.json    | 491 ++++++++++++++++++
> >>  1 file changed, 491 insertions(+)
> >>  create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json
> >>
> >> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json b/tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json
> >> new file mode 100644
> >> index 000000000000..b79046cd8b09
> >> --- /dev/null
> >> +++ b/tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json
> >> @@ -0,0 +1,491 @@
> >> +[
> >> +    {
> >> +      "MetricName": "VEC_GROUP_PUMP_RETRY_RATIO_P01",
> >> +      "BriefDescription": "VEC_GROUP_PUMP_RETRY_RATIO_P01",
> > 
> > Is it possible to get better descriptions than just a restatement of the
> > name, or no description at all?
> > 
> > This comment obviously applies to almost all of the metrics herein.
> 
> Hi Paul,
>    Thanks for reviewing the patch. Sure I will remove description part for now.

My sentence didn't parse well, sorry...

What I really meant was more like "Is it possible to get better descriptions?
Having just a restatement of the name (or no description at all in some cases)
is not helpful."

So, can we provide better descriptions of the metrics?

PC
